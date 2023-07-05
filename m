Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDE1747FD6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 10:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A567110E170;
	Wed,  5 Jul 2023 08:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD08310E170
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 08:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688546320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ev84vUzUh8ZH6f1TjRoMQmaeXWVKy1q8JlkhwPTuuw=;
 b=NInI7wmArFfwz87J3jkBORU7zDDuX+zaTZc3t3XJmWXWxQ/97C/vyuGBnqk1uO+E+Rmv0e
 ggHQbFbROfPYF9glGeYSe+9xhtBLiESHhwJySYIOO3v6pB+u3UgpVUIf68a5sebnbANYW9
 /u8NJqo33WUdbDZo6Acz8OT6V/7FmkI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-XyFJ7CxsO6Wg_f40Q5Iw5g-1; Wed, 05 Jul 2023 04:38:38 -0400
X-MC-Unique: XyFJ7CxsO6Wg_f40Q5Iw5g-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fbb3c5afdbso3006242e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 01:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688546317; x=1691138317;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ev84vUzUh8ZH6f1TjRoMQmaeXWVKy1q8JlkhwPTuuw=;
 b=Z9a2iZ1XEEix5Tdk6SOplEZkN/7VVy6vR8vXr+52tMNmdaD+okaW7+M2J7L3J11SSr
 9HTiiglMj+CaIcA+SRnqAPvscxW84HSt3L4EQWfeHZb9gMyI1sNgF/ukFwJuwV5CgFDx
 nOaH7tWDEqQwMqNveMB1JyyNdWijZLrzJXAdxP34xyEDqvx6l6QfWkcf/+go60aXmi6/
 CEYwDARRytIP7KZG2wDG/FkSscnoN9NRZa3AKA7rd2OQWYsFLvy86jH5FwfEfD/CV+i1
 aH6FtMYuRJH4bfKCx44yhDCLAsPRk1Ro9tJeSJHiM0gIO65Cg7afTF4YGpkllmzSZPoX
 eu2A==
X-Gm-Message-State: ABy/qLapG4KHdeaGGltxseQh73st7/tHhBNWiYh03A2TLNxTR/KaO7bU
 7RMPLsKebREJadHdZz1oDP9AxsZF6La+GrWrurCurYaGMyB6UK8kre8PcJxinRG0Xu7F18GykjD
 +Ac4HH0QTSDegovamjqh+QMwPdcz5R5JDPa4IeIY=
X-Received: by 2002:a05:6512:2211:b0:4fb:8948:2b2b with SMTP id
 h17-20020a056512221100b004fb89482b2bmr14099218lfu.48.1688546317009; 
 Wed, 05 Jul 2023 01:38:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHw/8+9xxPRw7DNATPC6lakSSCvVuMDKfqLB9aRt/ZUrBO5oK9Z8Als1e5OzgdL2qBEpY21lQ==
X-Received: by 2002:a05:6512:2211:b0:4fb:8948:2b2b with SMTP id
 h17-20020a056512221100b004fb89482b2bmr14099194lfu.48.1688546316638; 
 Wed, 05 Jul 2023 01:38:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m3-20020a056000180300b003141e9e2f81sm14564718wrh.4.2023.07.05.01.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 01:38:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 05/10] drm/exynos: Use fbdev DMA helpers
In-Reply-To: <20230704160133.20261-6-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-6-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 10:38:35 +0200
Message-ID: <87ttuirbw4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use fbdev's DMA helpers for fbdev emulation. They drivers previously

s/They/The

> used the I/O-memory helpers, while allocating DMA-able system memory.
> This could (in theory) result in bus errors from accessing the memory
> range.
>
> This bug has been present since the exynos driver was first added.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 1c248b7d2960 ("DRM: add DRM Driver for Samsung SoC EXYNOS4210.")

Wonder the value of this "Fixes:" tag since this patch depends on the DMA
helpers introduced in 1/10?  I would just drop it, since it might confuse
the different kernel stable scripts that attempt to backport by looking at
this tag.

As you said, it has been present from the beginning of this driver.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

