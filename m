Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 813B66135A2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 13:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5780610E1E4;
	Mon, 31 Oct 2022 12:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF88310E1E4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667218632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z23uByta1RO7RusYzzGag4IvKSimSY8jEax7dgozF+A=;
 b=h2tegKMiWIGtbIk1/P01ccdMrYTydj+qUma62OUP27owChMflrAYUaX0UCIMtyAGOulfVl
 MbG9Bqha3GFz3BhqgEIiDvfqNNFUB99VrPNnql90ki0vhdjYxOQw015F+jEPQkb695ipFk
 cKkWIllZzxiR654pwom76ElSOogoI+U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-eVFK3YPMNaaWlRJsesNghg-1; Mon, 31 Oct 2022 08:17:10 -0400
X-MC-Unique: eVFK3YPMNaaWlRJsesNghg-1
Received: by mail-wr1-f71.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso3004965wrb.18
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 05:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z23uByta1RO7RusYzzGag4IvKSimSY8jEax7dgozF+A=;
 b=DfvK6awAeqlxjN19v2THfX2OFIgxLVbQ5g2I8nOy/tayBPVMhVW0FRF1OibZd6HJRO
 1LZrtsC30PZfw6dm8Z1vaC2nUWdvfwEBrCQYwQRLa9F2t2CaxIu1ZEl/DvjnUa6/YO9j
 TSwsI1TRTQsq2vhIq0d8xEi0XA4peTEmkmCQPaYqoQ9QJYDukNfVFT+x/IioU/Geufhb
 dyY6KILioWRRcEZkRNedfmr/GqXSX/cgBJI8nArs4ohiYTzywLDmcIeRMEMsnbYlvmKj
 AkWexb0bhyP5veA9vCKxwRAdFdORJY0jS+wIoZjTMUjF0j+hlw7jqPiqeHIhjVcrevMP
 G/cQ==
X-Gm-Message-State: ACrzQf2qU1/77Z70hIKgge8iXngSdMRpAbbMqM0zZLmPbRidygCi9pIP
 3fAPkP81qTSKuM5jvcc/W/SymLvJ8YJAXEAg7vBjPFcFY2n6TOry7/bjQ34OJsIf62kxhaqkjDH
 JeiEJN4m9SHuX3iNHtx4Kofz88AXw
X-Received: by 2002:a5d:6da2:0:b0:236:7916:a9b2 with SMTP id
 u2-20020a5d6da2000000b002367916a9b2mr7921500wrs.393.1667218629375; 
 Mon, 31 Oct 2022 05:17:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM67BGVEVFx5kckaS0oDiow+E3wYJXdivRHIvOOROl9hHnAsaKyVcMk8ZYE1a2HK4LSTJkXvEg==
X-Received: by 2002:a5d:6da2:0:b0:236:7916:a9b2 with SMTP id
 u2-20020a5d6da2000000b002367916a9b2mr7921473wrs.393.1667218629159; 
 Mon, 31 Oct 2022 05:17:09 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 cc6-20020a5d5c06000000b002364835caacsm7133274wrb.112.2022.10.31.05.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:17:08 -0700 (PDT)
Message-ID: <efe0c7bd-0b14-b829-cc41-fda316952a51@redhat.com>
Date: Mon, 31 Oct 2022 13:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 06/21] drm/ingenic: Don't set struct
 drm_driver.output_poll_changed
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-7-tzimmermann@suse.de>
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
> the fbdev console. But as ingenic uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian, Sergey)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

