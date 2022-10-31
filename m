Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFEA6135C8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 13:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC4F10E1FC;
	Mon, 31 Oct 2022 12:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF75310E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667218756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=riNVOBu8e2pIZERXBmAvmwAOPdhd6MsYxn78jTBB4dE=;
 b=OBolPdy1AF2o/wp/D6pjRilLNmLCu644iVdp5xYog2AGWhwfTXstwshmx++UNF4iRTd/IR
 jS9w5k7O4w9vyLefikbi3kfZncrS0YuBJ6WI0VA/zfuZcxwuMYDzb81+LuY9T31pd3vlIg
 mCYLNeoX02c0cqrZteXZnpM1aBeklys=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-R9ajmmtNNzSq_v0v0Xq3gA-1; Mon, 31 Oct 2022 08:19:15 -0400
X-MC-Unique: R9ajmmtNNzSq_v0v0Xq3gA-1
Received: by mail-wm1-f72.google.com with SMTP id
 133-20020a1c028b000000b003cf6fce8005so386191wmc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 05:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=riNVOBu8e2pIZERXBmAvmwAOPdhd6MsYxn78jTBB4dE=;
 b=axwylGIsAlBVdersp0YadXlHU4EGfOjb1Qsig1sAovOmQH4a9FDsoeFiW9viULaDDE
 m9ee/svoUVYXVmsGSoAqL891OBKtyrp6afWw65asatkWwn/vV/ZPmaoGq+aHYML+i7JI
 z6F3WMhwdMARKeLFbineyKWual52pAhBlSnn29UZCNxKvv+lI1bBu07b8prv29zmRk6p
 pNsJiK1wXvHWbFXeIVtaUkM1NaWCTl+yA0YEANAq2GPaa9apLfvib9GiV9lYsDLPYORO
 +Ji3IdLNJyvgOgV8b0Ab7NPHcBDpbaXnEh3rfpyV3Sq91nTs/UM9punOAWHsOYXpEgFq
 LFJg==
X-Gm-Message-State: ACrzQf3FbhSVEaLm7YyWxAHtFK01YRBtsqTN2JT4TwItGLN2QkfMXk41
 cgYbjBa3Gg1Vfh64R9CID1fe883OUMxnoQKoW32S+xYhGvM21ABX36zvZ5mxUJjUiav2kz8lq/J
 DSbJJoWIuzRAqITaS5E3Uw/SN6Bn2
X-Received: by 2002:a1c:7405:0:b0:3cf:55ea:6520 with SMTP id
 p5-20020a1c7405000000b003cf55ea6520mr7948706wmc.46.1667218753684; 
 Mon, 31 Oct 2022 05:19:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4oPDcyHgSUP9i1GOihR+fx3MXqkZeIX2xB6yE7P9f9dsxB6V14E0IWVQPIhFCjpfp7XUuGLg==
X-Received: by 2002:a1c:7405:0:b0:3cf:55ea:6520 with SMTP id
 p5-20020a1c7405000000b003cf55ea6520mr7948695wmc.46.1667218753455; 
 Mon, 31 Oct 2022 05:19:13 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x11-20020adff0cb000000b0023660f6cecfsm7060089wro.80.2022.10.31.05.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:19:13 -0700 (PDT)
Message-ID: <01f85874-6beb-c325-8b94-7a7aeec30d5a@redhat.com>
Date: Mon, 31 Oct 2022 13:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 08/21] drm/rockchip: Don't set struct
 drm_driver.output_poll_changed
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-9-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-9-tzimmermann@suse.de>
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
> the fbdev console. But as rockchip uses generic fbdev emulation, the
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

