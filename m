Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98436577EEA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 11:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75862A9C5D;
	Mon, 18 Jul 2022 09:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B96A970B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658137605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cM8XwRgx+iAbc6210GaFSA8G1r4xLL1dr6lUbJjEleI=;
 b=IeQ8OjbjwUht0Dkutjy5AP4bhWmruaP6l60SaYytqT7kIVtOaK4VWR5JXjugPRbgt9Vvy6
 OWmE3E+TlrEb1RqQ1yGhoQBXFZQCFekqVjkSqTOUwNpo1oK+vYod6vgn8/cZZSg4EN0NE2
 NMnKewGOQZWIshsknMfVPjE9p5/sa7o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-iGd5KyX4NzqMs7Cg4042_g-1; Mon, 18 Jul 2022 05:46:44 -0400
X-MC-Unique: iGd5KyX4NzqMs7Cg4042_g-1
Received: by mail-wm1-f71.google.com with SMTP id
 r10-20020a05600c284a00b003a2ff6c9d6aso7261607wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 02:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cM8XwRgx+iAbc6210GaFSA8G1r4xLL1dr6lUbJjEleI=;
 b=jvUJd5UxeZNl6KUWzU0n4Cr7T/TDz6Ue43yTVMH+olcsGw6YslEY+QAL5byZCIny26
 gLK2ltI5EKtVlsSyFBnbWxODAwEvsFZr1F8861R9dWenxFDDfRCZZnWzTCFfL6R9wDyy
 rlvwI4pfTkCSUNEwBvgplO4L2t8Cyqr6/PvP9OmAeY5+bxY3OL1VgGQjFF2KOnWEc+TV
 7nADelxVeYw8ahTq2P0mpkBOXO/hdvUBHF8xgme4NdYysdQkGjnY0d6pRfKUfeWReKrI
 tYtGbk1wfSLkERqadsAIgrWoNiGOk80bW2aciKpso7jYGHHio8X8kdhcgy4BIVWMzFkv
 htmQ==
X-Gm-Message-State: AJIora/fd7A/C52VrwKntX/GQHaQ5IjgPRVEaJ0JPn5Qmrlb/vkFCUaV
 6OvsC4OKhgmwsJVAauorAfHoqyNDShDHminKRUsddcbRvy1ITN12LzLpFOWVLvWL+9bbaTklZnz
 MPKo+ydcs2ASc+Grt3Ls108gS4XBW
X-Received: by 2002:a5d:498d:0:b0:21d:97d5:fdf1 with SMTP id
 r13-20020a5d498d000000b0021d97d5fdf1mr22450579wrq.530.1658137602637; 
 Mon, 18 Jul 2022 02:46:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sig3yCU/gaCL4wqcm19SJ5v/I0lqA6ehrJ/pE7+owdqYuNCQyody4/OO7ZUmk0edae1dDEnA==
X-Received: by 2002:a5d:498d:0:b0:21d:97d5:fdf1 with SMTP id
 r13-20020a5d498d000000b0021d97d5fdf1mr22450569wrq.530.1658137602431; 
 Mon, 18 Jul 2022 02:46:42 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u6-20020adfdd46000000b0021e2952c00dsm137004wrm.39.2022.07.18.02.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 02:46:41 -0700 (PDT)
Message-ID: <88df6527-7ff0-c69a-69ca-dbd1e4322bea@redhat.com>
Date: Mon, 18 Jul 2022 11:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 7/18/22 08:56, Thomas Zimmermann wrote:
> Hi
> 
> Am 16.07.22 um 20:17 schrieb Sam Ravnborg:
>> While discussing the way forward for the via driver
>> Javier came up with the proposal to move all DRI1 drivers
>> to their own folder.
>>
>> The idea is to move the old DRI1 drivers so one do not
>> accidentally consider them modern drivers.
>>
>> This set of patches implements this idea.
>>
>> To prepare the move, DRIVER_LEGACY and CONFIG_DRM_LEGACY
>> are both renamed to *_DRI1. This makes it more obvious
>> that we are dealing with DRI1 drivers, as we have
>> a lot of other legacy support.
>>
>> The drivers continue to have their own sub-directory
>> so the driver files are not mixed with the core files
>> which are copied in the last commit.
>>
>> The DRI1 specific part of drm/Kconfig is likewise pulled
>> out and located in the dri1/ folder.
>>
>> Feedback welcome!
> 
> To be honest, I still don't like this rename. Especially in the case of 
> via, which has a KMS driver coming up. It will now have an include 
> statement that crosses several levels in the directory hierarchy. And

That could be avoided by moving drivers/gpu/drm/via/via_3d_reg.h and other
header files to include/drm/via_3d_reg.h for example. Other drivers (i.e:
i915) do the same for headers that are shared across different subsystems.
 
> what about the other DRI1 drivers? If we ever get KMS drivers for those, 
> do we want to move some header files back into their original locations?

I believe for these we could also move them to include/drm/ if needed.
 
> Patches 1 and 2 look reasonable to me. The other driver patches have 
> basically zero upside IMHO.
>

I disagree with the zero upside. It may be that the trade offs are not
worth it but there are upsides of having all DRI1 drivers and core DRI1
bits in the same place. It makes grep-ing and reading files easier if
one doesn't care about legacy DRI1 drivers.

Also, it would ease the removal of this if we ever get rid of them.
 
> In the case of moving the core files into dri1/, the resulting Makefile 
> rule looks really ugly. I'd suggest to move all code into a separate 

Maybe this could be sorted by splitting the DRI1 core bits in a separate
drm_dri1.ko module?

> file drm_dri1.c and be done with it.  For something more elaborate, 
> there could by drm_dri1.c and drm_dri1_helper.c, where the latter 
> contains all DRI1 code that is only used by the drivers.
>

That would be an improvement but IMO moving them into a different dir
as Sam did would be preferable. What would be the upside of having it
in drivers/gpu/drm instead? Just to avoid the Makefile rule to have a
dri1/ prefix in the included object files ?

Regardless of this discussion, I think that at the very least we should
rename the Kconfig symbols to CONFIG_DRM_DRI1_* even if DRI1 drivers are
kept in drivers/gpu/drm/ instead of moved to a drivers/gpu/drm/dri1/ dir.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

