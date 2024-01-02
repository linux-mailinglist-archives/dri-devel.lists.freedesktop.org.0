Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFAB821B83
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 13:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7403110E0F4;
	Tue,  2 Jan 2024 12:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2577C10E0F4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 12:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704197806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DPlLEBXfhLSd7sMzVTM760zSh1zEAP22oRkr84xyyqI=;
 b=egO2BHCzLleQqzi2daINipzzu07TtFMdSVBTjKcKpAF909/GlphHT7XnZTcL5B98zCI05C
 sQqy1aEkBOlitVrW92X5gqidLBJQfqqx0ic8pYBBWoiwRmCh+8yp59s+cQg7GvouahJ5rY
 A6fsLMfOHtelafDX5ha3a0se54sE1G4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472--SpSublMM_CtpECCiqCfzA-1; Tue, 02 Jan 2024 07:16:44 -0500
X-MC-Unique: -SpSublMM_CtpECCiqCfzA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40d88fd71f9so11741585e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jan 2024 04:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704197803; x=1704802603;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DPlLEBXfhLSd7sMzVTM760zSh1zEAP22oRkr84xyyqI=;
 b=sE12jCnH1X/l3cPGIH+WgIDP+EYd2pncNPwM9bbV/rwlouCmX3dytxkn+7wzJMWeEL
 TSXIBBG0kZL12eUMqtlIXm+DRG7YdkiCuhF0TVchBz5bUEoBCbCktTG4XjLRWjUIV9Di
 hUaSxa/eGZTr22ekHcRZeWFtuP6frExBQtFMGeCNBzvE5T1KBgqqWLIZzOhI6N/HBv7x
 3kn2pjHGD6+WujHN53/dgpK0WIurCgv4xxCu7okpMlOCnrseQ8DHI0RML2Fc5tsM5Kif
 81yyM0c/a/qdpdc9t5TlVJn4xsjp/mRNlb0w4RSPPMLMQ5ZwCw5vHJuVJeCKGHIlpYi8
 79mg==
X-Gm-Message-State: AOJu0Yw3+kjSzTOLEI3wR3zX4H2IU4VDDXISlpTl77/EfD6t/7fZcxoG
 gjt3PNfczwQs4WcueppZduqZy7edmQwxaHsXcK+UO8Kay8ADdG/3EYQ5aHqSvag+npJ6HfgCU9h
 2e2yRi7IfIRgfss1ZA02zX7MW1egW788W06xY
X-Received: by 2002:a05:600c:c0b:b0:40d:8cd1:736a with SMTP id
 fm11-20020a05600c0c0b00b0040d8cd1736amr380544wmb.50.1704197803249; 
 Tue, 02 Jan 2024 04:16:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGU2XMn1J/fN1Ic3hG9b7blPM6E9SLaxWfy6C+aTMS068vBjt/ls9arEBPcmBeFFxfKG97ZJA==
X-Received: by 2002:a05:600c:c0b:b0:40d:8cd1:736a with SMTP id
 fm11-20020a05600c0c0b00b0040d8cd1736amr380535wmb.50.1704197802896; 
 Tue, 02 Jan 2024 04:16:42 -0800 (PST)
Received: from localhost (red-hat-inc.vlan560.asr1.mad1.gblx.net.
 [159.63.51.90]) by smtp.gmail.com with ESMTPSA id
 fa8-20020a05600c518800b0040d87c5dfe1sm8469244wmb.8.2024.01.02.04.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 04:16:42 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: Move drm_set_preferred_mode() helper from drm_edid
 to drm_modes
In-Reply-To: <87y1d80x3l.fsf@intel.com>
References: <20240102111921.3057255-1-javierm@redhat.com>
 <87y1d80x3l.fsf@intel.com>
Date: Tue, 02 Jan 2024 13:16:42 +0100
Message-ID: <87o7e43p79.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jani Nikula <jani.nikula@linux.intel.com> writes:

Hello Jani,

> On Tue, 02 Jan 2024, Javier Martinez Canillas <javierm@redhat.com> wrote:
>> The helper is generic and doesn't use the opaque EDID type struct drm_edid
>> and is also used by drivers that only support non-probeable displays, such
>> as fixed panels.
>>
>> These drivers add a list of modes using drm_mode_probed_add() and then set
>> a preferred mode using the drm_set_preferred_mode() helper.
>>
>> It seems more logical to have the helper definition in drm_modes.o instead
>> of drm_edid.o, since the former contains modes helper while the latter has
>> helpers to manage the EDID information.
>>
>> Since both drm_edid.o and drm_modes.o object files are built-in the drm.o
>> object, there are no functional changes. But besides being a more logical
>> place for this helper, it could also allow to eventually make drm_edid.o
>> optional and not included in drm.o if only fixed panels must be supported
>> in a given system.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>  drivers/gpu/drm/drm_edid.c  | 23 +----------------------
>>  drivers/gpu/drm/drm_modes.c | 22 ++++++++++++++++++++++
>>  include/drm/drm_edid.h      |  2 --
>>  include/drm/drm_modes.h     |  2 ++
>>  4 files changed, 25 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index cb4031d5dcbb..48dd2a0a0395 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -43,6 +43,7 @@
>>  #include <drm/drm_edid.h>
>>  #include <drm/drm_eld.h>
>>  #include <drm/drm_encoder.h>
>> +#include <drm/drm_modes.h>
>
> Unnecessary.
>

Indeed. I could swear that saw drm_set_preferred_mode() being called
somewhere in drm_edid.c but looking again I see that's not the case.

> Other than that,
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>

Thanks. I'll post a v2 that drops the unnecessary header include.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

