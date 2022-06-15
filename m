Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3445154CD89
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 17:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D31F8934B;
	Wed, 15 Jun 2022 15:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DAC112579
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 15:53:31 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gl15so24121050ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D5ShLIbJdbDjGlxDv7D9TUkds40P1/JB5xsD295mwPM=;
 b=ciqSZu6WTLDGRSjO54NxzovGpYsYhGGsOZARVTMj+y8DfMifPnFGkOH5KV7BbJhb5k
 8S640o47KmDM86S99aJ3cBi06365fmZ9hpTCErSvRw1adrK4oe/CZ+xYxayYFKNtdlKR
 dFtFRl6r9lxLLVnSVLYLcK6ObsYHx8f5RutGYsz3yibJprsZ6aUz04aJK4zk1wTT1TEm
 94O43RAdX62nAx4IKH6DCUAbUlQZub+z2wGDEz3B8q8hMf+7HTuIw6NOz/lAvaJLYJtC
 Uz6CfSMbi2lAv5EIA0u9QhuFkAze8QTPtBPM4acfgDLEt6vQw7ON+Z/p5nZ+195qpyoU
 Cewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D5ShLIbJdbDjGlxDv7D9TUkds40P1/JB5xsD295mwPM=;
 b=b3Uq4sdx2+RQRDCXLu27xuSXnM8aPrtio8GPoa1mZgkk4qsW+UsldJl9EcCHud6Gjo
 DD3pcKt7Spdkj2nupIsN3A3arvn/OkbOx+Ux2Tls41U0DaTjFnneBuTGoSzPUHnXtXns
 BV7Pwsf9qUIIcdc++4S3+wMToiwgyQ0Dvwk+yLiwckheqhAJp/spntJngfgu73se8EfP
 mKmdtiG+5zoCRTuNupNBtZPMZXCmfIeA2AKQO8SxG0zCEWYg2ZuHQOuJergacI973AgL
 SycusU8RRabKKUwYEV4YoSV6Nu0FpiMGGjSfxjPcqd3vr9tjosvC5GIfA2VwpuNEI6dB
 wzPg==
X-Gm-Message-State: AJIora/E8WTs0kqc9NbIdLNKAmyv1mZEbGeQEaCYVje5wiouv70ti+Ri
 g+aGlDdcUeaKxqMggxlPmck=
X-Google-Smtp-Source: AGRyM1sVtnrDE7GtZbaoUeUmFFWPnp7cBVKqt8WzfkzPflwAbHdYxsZncOddT9V93wqNSiltwTbHlQ==
X-Received: by 2002:a17:906:519b:b0:711:fb34:16f4 with SMTP id
 y27-20020a170906519b00b00711fb3416f4mr431124ejk.275.1655308410430; 
 Wed, 15 Jun 2022 08:53:30 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 v14-20020aa7d9ce000000b0042bc97322desm9548790eds.43.2022.06.15.08.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 08:53:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] drm/sun4i: Fix crash during suspend after component bind
 failure
Date: Wed, 15 Jun 2022 17:53:28 +0200
Message-ID: <3671441.kQq0lBPeGt@kista>
In-Reply-To: <20220615054254.16352-1-samuel@sholland.org>
References: <20220615054254.16352-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Ondrej Jirman <megous@megous.com>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne sreda, 15. junij 2022 ob 07:42:53 CEST je Samuel Holland napisal(a):
> If the component driver fails to bind, or is unbound, the driver data
> for the top-level platform device points to a freed drm_device. If the
> system is then suspended, the driver passes this dangling pointer to
> drm_mode_config_helper_suspend(), which crashes.
> 
> Fix this by only setting the driver data while the platform driver holds
> a reference to the drm_device.
> 
> Fixes: 624b4b48d9d8 ("drm: sun4i: Add support for suspending the display 
driver")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


