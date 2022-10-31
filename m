Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C38613647
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 13:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF42010E264;
	Mon, 31 Oct 2022 12:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13D410E252
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667219211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/x9mAjb8LNYXXK+HVNHKFir+j3ZwIeSko/dKjp9YLmY=;
 b=AkQsTEKR1y9Fem7oTJ0E3dmo3tSyUuX34g7YcIEBfU/OXBSKRL/QiVX4biNYbj4VOFhn4W
 OCYtrt/Yx9m3DzmtnpA8LOacAJbORJ9GshIUa4dxrFXoxCS8kBtwGlqp6K0QEQc7VI3zeI
 6gqkmpi5G0SI5+1pENUOav6Ir2O/Na4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-rsXRclBSPrGLzkcSpAtUKg-1; Mon, 31 Oct 2022 08:26:50 -0400
X-MC-Unique: rsXRclBSPrGLzkcSpAtUKg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h8-20020a1c2108000000b003cf550bfc8dso6038246wmh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 05:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/x9mAjb8LNYXXK+HVNHKFir+j3ZwIeSko/dKjp9YLmY=;
 b=iyE4SiAx0tRWlnaLbXIk4IAs0Y/91ViWCvou+o83UK0aazsoj/YrcJcWCNbrIkrBeB
 M9LHQEb0H8eYbjO04Gw57eKxmyUJnZeZV67HxO8WZXdU9zNUR/LGFoGLfMWs/XboiO0C
 KbB//6KmvQXVkwrleIVZjli2XRm9RaCTU4ZZEPpVVEl/vZe4KCyB7cIEvvcx+YowiEcC
 Iq0JoKtslzYkbpROiiQgs7iRQ4/HwgLcVaSVGoxWBgPiMQQgNQ04uBplexog0CiWDkC7
 nwJcgJOPelYRojyAH+w6UT7/UOV32+qau56c+Rg6XpItAn7OzOIiFt54WfZqESAWfVpG
 kE/Q==
X-Gm-Message-State: ACrzQf31Gd3bTahkdzWhmvAequSfM1Z3HVOOMZv1vqHydl/QeWExVLED
 lrFfZegP13VaRUmep7gWaY4VQIYtl0E4yhhEmHdJY5JWJHOaABoGQsQZ+z0tlEw6N99QJ6k2fds
 Vfwyqo0pLJLRgJkCxrL7n8OTIGUUG
X-Received: by 2002:a05:600c:4f10:b0:3c6:dcc6:51d7 with SMTP id
 l16-20020a05600c4f1000b003c6dcc651d7mr7887432wmq.91.1667219208980; 
 Mon, 31 Oct 2022 05:26:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4eCY6FaPESRi0FBsuwSJAU0ypknopcItEy1BimghpIISJ8Db9xrgTY3spCPjOXKZ6zCgaGzA==
X-Received: by 2002:a05:600c:4f10:b0:3c6:dcc6:51d7 with SMTP id
 l16-20020a05600c4f1000b003c6dcc651d7mr7887399wmq.91.1667219208796; 
 Mon, 31 Oct 2022 05:26:48 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q1-20020a1ce901000000b003b476cabf1csm4889352wmc.26.2022.10.31.05.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:26:48 -0700 (PDT)
Message-ID: <0d2250e4-dc26-2fc9-e429-0d43ef280e5b@redhat.com>
Date: Mon, 31 Oct 2022 13:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 13/21] drm/fb-helper: Rename drm_fb_helper_alloc_fbi()
 to use _info postfix
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-14-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-14-tzimmermann@suse.de>
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
> Rename drm_fb_helper_alloc_fbi() to drm_fb_helper_alloc_info() as
> part of unifying the naming within fbdev helpers. Adapt drivers. No
> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

