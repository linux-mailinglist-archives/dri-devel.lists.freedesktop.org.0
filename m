Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52482619498
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 11:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D9910E738;
	Fri,  4 Nov 2022 10:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6342710E72E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667558293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M88yz4GfmbUNq4mWECugnsnJkV6z34uCwDqL3DFZ74U=;
 b=NSadry/5Xnc4ign0y3gVVb2HTrv/F/FD9j/CiHVuysim8WdGnCVFTxFC0Bkw1ns66oSUj7
 08sWJWTaOupAbFycxQlJc243ZWqRbEwDmeVqNo9OfWQfhk1ZoMGeQOUc+YdBrdx1lToLO9
 gld/0xqzrqjagqe/BADmAjYB0EHRGa0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-75-CTcR1_2sNgupTfBpbKt0yQ-1; Fri, 04 Nov 2022 06:38:10 -0400
X-MC-Unique: CTcR1_2sNgupTfBpbKt0yQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v23-20020a1cf717000000b003bff630f31aso1549735wmh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 03:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M88yz4GfmbUNq4mWECugnsnJkV6z34uCwDqL3DFZ74U=;
 b=BS8ZA01KPZMYRTaHpdGnMaLRXkkRh7Zd/NoESPQ3HLl8mNIfWAeId+ik+abFhZf1RT
 TNc2mdCiOOE1mEfhq1fKwlUJIH9RTY7zGRK4rvpNRGbySFnYTqejUBFQVpyiyBsvkhdi
 yeUfJirrwi7y4FjTpGWOzI+3ZvbU6X8uF3PnLZoKjPXcbfDhRbIgvqe+bi4m99rIKQli
 8HBevdHeSEWi4Vx4xr8Cw2hadiVo8ztcH3XrWUsZf4DtLHbmrAQ/iI8jNNH/f0VvpQLn
 iaDVGlLsl72Ogcm5vBEoXcRvHQ6sw2+dd7hzVvnwzoB57cY7o3com07GLE8Sr+e8TiUe
 HpOg==
X-Gm-Message-State: ACrzQf3/Glwp+gIp/BBz1wf8HCfdXuxncmsPZUvdijZDhj9DrCdsHPBF
 t5Jpw/TV4uteXFgg4y3TuGxsQybKTHHWw/7AJlWb47rZGBZIfvV0vIhaRaanLicEz4IM2m2DaB6
 jGvkuwEx8B8rXc/xkuaDYcHnHzV1R
X-Received: by 2002:adf:bc51:0:b0:236:8fa1:47ea with SMTP id
 a17-20020adfbc51000000b002368fa147eamr218079wrh.77.1667558289570; 
 Fri, 04 Nov 2022 03:38:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6s9MOXnwXonR8VOapq6d4n3ZU7IGA+EIjACuJbvHHOLIXD7EQUkeJV/V+5P7qnQBQKVLAVkQ==
X-Received: by 2002:adf:bc51:0:b0:236:8fa1:47ea with SMTP id
 a17-20020adfbc51000000b002368fa147eamr218064wrh.77.1667558289372; 
 Fri, 04 Nov 2022 03:38:09 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003b4cba4ef71sm2534442wms.41.2022.11.04.03.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 03:38:09 -0700 (PDT)
Message-ID: <1f5e6de4-3fe2-7933-f8c0-5f13564595cc@redhat.com>
Date: Fri, 4 Nov 2022 11:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 23/23] drm/fb-helper: Clarify use of last_close and
 output_poll_changed
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221103151446.2638-1-tzimmermann@suse.de>
 <20221103151446.2638-24-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221103151446.2638-24-tzimmermann@suse.de>
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, spice-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/3/22 16:14, Thomas Zimmermann wrote:
> Clarify documentation in the use of struct drm_driver.last_close and
> struct drm_mode_config_funcs.output_poll_changed. Those callbacks should
> not be said for fbdev implementations on top of struct drm_client_funcs.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

