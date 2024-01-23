Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75665838A7D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 10:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F9510E176;
	Tue, 23 Jan 2024 09:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6832B10E3DD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706002895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=35eaZ+bQCuaUh2R8a5as/8WnUsT5Dfn/DgmKgRWZ3do=;
 b=KIl6jGGqrRkoXUAl+6grrHDPqBG76QCO1/SUaaGovvbJ462Gvt/u7JzLzh1KxqVz+VfHF8
 h9wQ/RKTy75W9sB4+c1U4w2bMtpzxG2IKdbm4dnCpPtD10jRF0PWmHCtiCOETlPL83NamR
 ooMZJJlNk2X20d4bTwYJKBarqvd9mB8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-4PVUx_iNOLGxS13l5f5ohQ-1; Tue, 23 Jan 2024 04:41:33 -0500
X-MC-Unique: 4PVUx_iNOLGxS13l5f5ohQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e5317c7a5so31379175e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:41:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706002893; x=1706607693;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=35eaZ+bQCuaUh2R8a5as/8WnUsT5Dfn/DgmKgRWZ3do=;
 b=Hgc+ZqmDg/2IfpXtT84j/+nDXORPaTWz5NuQCkLdzXvk0hkSg2YOzNyIklxIkls1DS
 kPJLD7Fnxpl2m7dCVjHFFbadw1wLMsKAxz/qOlTaxd0TdYJYnx9UMKGXrch6V9RVltDO
 3w70zKhTmnVfcryTEyR27tJcrYQbELl8Pt5KsU6IRe2eqq7xYZrw3N1YrCJSOyvwVOcS
 dGi+VkXwogE1+CN2rHa3mrzPNHyhjWAErL8/p0//5yTz2Tix7O4Wd3rGBC/GTuyA18g7
 o6YkXzPH/oTqO7BF/DKizCsjmr4wqc12kcn4wI3hTkAYHL/iY8ANuouwOVua3ejAdpPU
 DaOA==
X-Gm-Message-State: AOJu0Yz+A6aenyUq3zSeSMoEGZJDwexvR7GOri1isKytN2N/duWHsiA7
 RsP879T5wjmQzqTSRX7R/JXclPiLXBm/eZYhGuuu6MVe8tuph7X48VXqrtQvPCS3Tdl8SGDGPcL
 ry8vXMHap0P4f6b1eYqA8qzoCUS6FrWX4kbyHLR41To6lxnV+HF/1ih/QAaIAZECh9A==
X-Received: by 2002:a05:600c:3111:b0:40e:ac8f:e6c with SMTP id
 g17-20020a05600c311100b0040eac8f0e6cmr379777wmo.30.1706002892495; 
 Tue, 23 Jan 2024 01:41:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfVEYP/7qYSzgFSZ+a3lMn2HVAeHn7EReyhochT1NTZwiRho8S1ukvToJTqTtAr4dbnVGcXQ==
X-Received: by 2002:a05:600c:3111:b0:40e:ac8f:e6c with SMTP id
 g17-20020a05600c311100b0040eac8f0e6cmr379760wmo.30.1706002892138; 
 Tue, 23 Jan 2024 01:41:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c4f9600b0040e53f24ceasm41722536wmq.16.2024.01.23.01.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 01:41:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Jani Nikula
 <jani.nikula@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
In-Reply-To: <3b0ab7e1-a28b-4dc6-a789-dccecaea7800@leemhuis.info>
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de> <87il3ko2fu.fsf@intel.com>
 <3b0ab7e1-a28b-4dc6-a789-dccecaea7800@leemhuis.info>
Date: Tue, 23 Jan 2024 10:41:31 +0100
Message-ID: <874jf4wfn8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jaak Ristioja <jaak@ristioja.ee>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> On 23.01.24 09:53, Jani Nikula wrote:
>> On Wed, 08 Nov 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:

[...]

>
>>> As you know, there's a platform device that represents the firmware 
>>> framebuffer. The firmware drivers, such as simpledrm, bind to it. In 
>>> i915 and the other native drivers we remove that platform device, so 
>>> that simpledrm does not run.
>> 
>> The problem is still not resolved. Another bug report at [1].
>> 
>> The commit message here points at 60aebc955949 ("drivers/firmware: Move
>> sysfb_init() from device_initcall to subsys_initcall_sync") as
>> regressing, and Jaak also bisected it (see Closes:).
>> 
>> I agree the patch here is just papering over the issue, but lacking a
>> proper fix, for months, a revert would be in order, no?
>>

Yes, I agree that this patch has to be reverted, since as you said the
issue has not been fixed and is causing regressions for multiple users.

>> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/10133
>
> Interesting.
>
> JFYI for those that don't follow this closely: Huacai Chen proposed a
> fix and asked a earlier reporter to test it, but afaics heard nothing back:
>
> https://lore.kernel.org/all/CAAhV-H5eXM7FNzuRCMthAziG_jg75XwQV3grpw=sdyJ-9GXgvA@mail.gmail.com/
>

It's not a fix but a debug patch for the patch author to get more info ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

