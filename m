Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595EA67AEE9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 10:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A727310E762;
	Wed, 25 Jan 2023 09:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135D710E762
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674640468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TouYpeVIY3sVaURhe3OBQ2as0Nh1mIpj/44gYLj7/xc=;
 b=drh/E+7mDMGR49LUHRQH72giJXmyEJfT7HphMML1jyITbr0g5bocRge7O7EIjQxf8i/g+k
 ZbRoyA/AP6Ol9OrA9a7Pb5eUodiS44NHOrIquEVZYHcBzlQ/oF7fVU0ylfW/sfd0W8IqOU
 AwwSFVp6sDMTIW0zdUmOYtxP2Ed/0G8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-201-bezSpQK_NDacrpoZPYOzYg-1; Wed, 25 Jan 2023 04:54:26 -0500
X-MC-Unique: bezSpQK_NDacrpoZPYOzYg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so833509wmq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 01:54:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TouYpeVIY3sVaURhe3OBQ2as0Nh1mIpj/44gYLj7/xc=;
 b=GN+J9KVD7JmeT2XvR7vi627rT/WFZbDqn/aMSQ4Tqe0m9EoBJS/pw3oa2FwROSV6Eh
 9I0v+xApQRAYlAoBGO1HQ1k7LOcrliSoTDkI9Yg1pSOyTLL46yc7T2+W0TtQhLE3G/dM
 hDLnUlzffZGM3/Qm8PsemP20mLMD7gdsNG9wevC3eRQFfp7tyLmZU8+QlrFaVlaAxFFU
 +7RxWQbWGLnfA2zCglyI+dJPWjI0/bg0KnYbSKRUdOmhkBbxaLTeaK+zPHWJF6IZxScL
 FHSEPUw6OD2ZFakj0HuShnGjkX56L8GKPfuzQk4GX9qzj2qEjAJRPhlY+EmPYxO1e8wH
 xO5Q==
X-Gm-Message-State: AFqh2kqnQPhhaia8bRcyfT8/piL3U5/QV2hVvs6H0l88s7QILM/rtQWP
 a4XyKoWyWMXOzeIHGrks/s9EV37YPpA3Oqcuv07lHAIz36J9ZzjpWeWcKgDfyvhspAFrKnVMFzP
 4/jP7BDdG9NBz3vJBvYB11gI/wDJ8
X-Received: by 2002:a5d:6944:0:b0:2bf:960b:7282 with SMTP id
 r4-20020a5d6944000000b002bf960b7282mr15280440wrw.44.1674640465869; 
 Wed, 25 Jan 2023 01:54:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs0qhPZq4DvvRBWKlYakMR9y6Uj+/MSQrsj/7lcQHcP5rYP7V12fMSxLIHPoxhHoCWiXuL3sg==
X-Received: by 2002:a5d:6944:0:b0:2bf:960b:7282 with SMTP id
 r4-20020a5d6944000000b002bf960b7282mr15280426wrw.44.1674640465680; 
 Wed, 25 Jan 2023 01:54:25 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t9-20020adff049000000b002bddaea7a0bsm3982230wro.57.2023.01.25.01.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:54:24 -0800 (PST)
Message-ID: <f1441822-c85d-4a2e-7e0c-98c3a6de31ac@redhat.com>
Date: Wed, 25 Jan 2023 10:54:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 10/10] drm/fbdev-generic: Rename struct fb_info 'fbi'
 to 'info'
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-11-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-11-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/23 14:40, Thomas Zimmermann wrote:
> The generic fbdev emulation names variables of type struct fb_info
> both 'fbi' and 'info'. The latter seems to be more common in fbdev
> code, so name fbi accordingly.
> 
> Also replace the duplicate variable in drm_fbdev_fb_destroy().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

