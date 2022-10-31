Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B167B613599
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 13:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE2510E1D4;
	Mon, 31 Oct 2022 12:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECC310E1DC
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 12:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667218577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlC4H0gmckJZ8E/tDGtmzwjQN3hfnWY+OkvhUHpUiTc=;
 b=SzxIp3KH1MJqCBUG1OdZLDtnmNr9ze9qCNca0D8W7lQRRd7ZxIpp/bc+uAAaPM2RO0+6dP
 gKIwcXSPzSp6YmttVdvmmB32i8J1A4MuFA+0Vaz6QSGVxi4OOhikTdPAddVDg4EK0Msryg
 sHj/vUsp15Qd6j9vD3TLgzuO/uTAz80=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-qaKSta7nPUaxNNe5ih_Cug-1; Mon, 31 Oct 2022 08:16:16 -0400
X-MC-Unique: qaKSta7nPUaxNNe5ih_Cug-1
Received: by mail-wr1-f70.google.com with SMTP id
 i14-20020adfa50e000000b0023652707418so3004882wrb.20
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 05:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WlC4H0gmckJZ8E/tDGtmzwjQN3hfnWY+OkvhUHpUiTc=;
 b=aAmTq7m8byJcoKmOO8Zi4+cMkhlBCZcbBeFSeXoSnfHqrpUp5IlUToLarmiYRmZaa8
 Whw0IqxaWtG6WhwSKhY59F0RzZexzLtb3VOxOnOZGWubB0ZVk5s45XEHLSo155CVli9M
 CT42daN4eVzErPnr2YtLaQqTGBhj+J3NVPbmKWknYF9GoXNW3DzQYPJxzRltXo5MbPU/
 6++QWOwbR+XBeHsxJ7DqWROFFt/sJEZkYe52Jgwtuioo8vSWy/uqkMbv+e0L0HQTJCyW
 xTrlPnjB4oftUyFDRuU6VmXM5XYARDwCA0u+qpdUVbpQAKJXssBnyLpiqipuutZwEEII
 OaKw==
X-Gm-Message-State: ACrzQf3AZ4L4z3bMtKfPc7YgjXf8ylszeua6Kg92JZB6iOX8SdRNpSHX
 oKvOjeNFBhPPsSxHNjmQ1zchIiuOxTFPkVWtAEzo+QHwnz0W0PsS+Bg+jt/p/eqHg8fwSQq3qn+
 grXcVh92frwDUfORoQEzTHVPrP6On
X-Received: by 2002:a05:600c:1c0d:b0:3cf:5fd2:1fd1 with SMTP id
 j13-20020a05600c1c0d00b003cf5fd21fd1mr10268858wms.8.1667218575350; 
 Mon, 31 Oct 2022 05:16:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vtgF5OcVzyyhJbAVQv0UtjhNq0IgAK2jPkGsnoYeZKQ/ZE7IsMKsB/emo+io4u+dLlmSgSQ==
X-Received: by 2002:a05:600c:1c0d:b0:3cf:5fd2:1fd1 with SMTP id
 j13-20020a05600c1c0d00b003cf5fd21fd1mr10268814wms.8.1667218575124; 
 Mon, 31 Oct 2022 05:16:15 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d2-20020a05600c34c200b003b3365b38f9sm7118010wmq.10.2022.10.31.05.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:16:14 -0700 (PDT)
Message-ID: <8423bcd3-84f6-b6c9-914a-c70166e20482@redhat.com>
Date: Mon, 31 Oct 2022 13:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 05/21] drm/imx/dcss: Don't set struct
 drm_driver.output_poll_changed
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-6-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as DCSS uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

