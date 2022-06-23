Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6BB5574A0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 09:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1FB11A0A8;
	Thu, 23 Jun 2022 07:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6096811A0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655971044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvZy/50T4UgEKe2nIlW9cYFKkogyYzn4qAw+8C8pOWI=;
 b=B48aPPrNNTIT/XNBSXsOdbCLt4vJZcDpD7tKXzRn/28CPtJwk27kM5NEkueI2QQIj4eKlp
 s+HAbOtPRpBFxxR1+qXXyJgwBzwyJxF85oaZ2DRrMPxpm/m/MPDjy+ghFL4UONJQiahMT8
 AZdxRP8j/6piXbd18v8RRDO3cnaM7tg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-p38Z-liEMFyYrPWwskOV6Q-1; Thu, 23 Jun 2022 03:57:22 -0400
X-MC-Unique: p38Z-liEMFyYrPWwskOV6Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so6620378wmr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 00:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dvZy/50T4UgEKe2nIlW9cYFKkogyYzn4qAw+8C8pOWI=;
 b=3hTz8vMoQQsWWiGaR4N2Tk9uEo2AVc7QVPah5r2fGQvl9DEPWHfJpzVOiYTLC8hN+o
 K3txek2ut8WWuJtcswLGD+CwbMxR2+x6abdDd0wSyIjkUs7vdOMQdOkkLLVQnhVQUTOJ
 LsuGh6U1PMcfQZGTI4lJLlcZOB82Xni8R7gaTaizcWgSFxrKbWTDg94FonO4Rx3bXDPA
 OvILuRTjTApZObS3wXEZqppNn2NpUej1XWSabQ/BstlqdjyGcrK2H5JeLvmz2Jn/tZSp
 ACv33oSw0vdK+Mr6rf0TBeWNMgYS/RLMhvG9l8ayv4j7jZSoh4OcqgCSa5LUsimI9czE
 Gm2A==
X-Gm-Message-State: AJIora/iO6t8Mjhim7D3va84IBD71DPjIdKhPPi1N/LBWve4G0UJ0Z2X
 MpggZ1lOmNf1NzxH3hcx7ptpDAXJZzpFy5b5YMG1N/cXgaEq2VRIWzeCbSl3381H6316XwrUGOM
 vOJR0fjw6g8YNR4kSRCCtN+IiAP0e
X-Received: by 2002:adf:d1c6:0:b0:218:4fc3:a805 with SMTP id
 b6-20020adfd1c6000000b002184fc3a805mr6717240wrd.228.1655971041108; 
 Thu, 23 Jun 2022 00:57:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v2M7uaEAm4QL8OrSDKAtIrbQ51v3N9GqBcLPy6U4Up2VsFsxxXrxwWzU0EAxlTLgLRx/Anuw==
X-Received: by 2002:adf:d1c6:0:b0:218:4fc3:a805 with SMTP id
 b6-20020adfd1c6000000b002184fc3a805mr6717223wrd.228.1655971040875; 
 Thu, 23 Jun 2022 00:57:20 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n40-20020a05600c3ba800b0039c7c4a542csm2309254wms.47.2022.06.23.00.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 00:57:20 -0700 (PDT)
Message-ID: <12f3bfc9-e7eb-0570-adfd-0ad0e39df91d@redhat.com>
Date: Thu, 23 Jun 2022 09:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/fb-helper: Fix out-of-bounds access
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220621104617.8817-1-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220621104617.8817-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Nuno_Gon=c3=a7alves?= <nunojpg@gmail.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 6/21/22 12:46, Thomas Zimmermann wrote:
> Clip memory range to screen-buffer size to avoid out-of-bounds access
> in fbdev deferred I/O's damage handling.
> 
> Fbdev's deferred I/O can only track pages. From the range of pages, the
> damage handler computes the clipping rectangle for the display update.
> If the fbdev screen buffer ends near the beginning of a page, that page
> could contain more scanlines. The damage handler would then track these
> non-existing scanlines as dirty and provoke an out-of-bounds access
> during the screen update. Hence, clip the maximum memory range to the
> size of the screen buffer.
> 
> While at it, rename the variables min/max to min_off/max_off in
> drm_fb_helper_deferred_io(). This avoids confusion with the macros of
> the same name.
> 
> Reported-by: Nuno Gonçalves <nunojpg@gmail.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Nuno Gonçalves <nunojpg@gmail.com>
> Fixes: 67b723f5b742 ("drm/fb-helper: Calculate damaged area in separate helper")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: <stable@vger.kernel.org> # v5.18+
> ---

This makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

