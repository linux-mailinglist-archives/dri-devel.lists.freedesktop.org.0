Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB707912C9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3430810E2D8;
	Mon,  4 Sep 2023 07:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1336 seconds by postgrey-1.36 at gabe;
 Mon, 04 Sep 2023 07:58:33 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055F410E2D8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:58:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 12BE5B80DBC;
 Mon,  4 Sep 2023 07:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303E8C433C8;
 Mon,  4 Sep 2023 07:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693814309;
 bh=pKUbMJ7O8Os+Ar2FZmAgeHqSU7CTw0TYRCnkJDIg7I0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=LDjgR2toWSyxM6eaNf5MclGQkx8j8Rs9pbSyMxrEwR3b7inYlQ1n2Gzk5SRTcP1/4
 LjJiylmv2BkNCopbGUdOtGxoLEN4vrn9lqUKG9V0taLDeu3PqxiDdWu8nyFZ1Y7kqv
 /iAt1WXEzE7UMIKIx8gaI91nDPNgUln6bX79+pmOgaOyDYjSRRyoaJj5wu4CAlJRaC
 esUVjTO5ScwUV2thH+4kor1+Br+0yl4w0tczWPI/YBxVxc0zTQfka7Ote4t0asnQGm
 1PT9bT54FwQeUHtbuVe3D+4h7pelxn2r2/TfunUWt+zGq4Ix1UD7O8KKZQWtj+d+xc
 MeKI0z7FqL8eg==
Message-ID: <37ab52defccfc95d726451853227bd91.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:58:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 2/6] drm: Call drm_atomic_helper_shutdown() at
 shutdown time for misc drivers
In-Reply-To: <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
References: <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
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
Cc: alexandre.belloni@bootlin.com, xinliang.liu@linaro.org,
 tomi.valkeinen@ideasonboard.com, liviu.dudau@arm.com,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, wens@csie.org, jstultz@google.com,
 kraxel@redhat.com, sumit.semwal@linaro.org, yongqin.liu@linaro.org,
 samuel@sholland.org, sam@ravnborg.org, javierm@redhat.com,
 jernej.skrabec@gmail.com, drawat.floss@gmail.com,
 kong.kongxinwei@hisilicon.com, alain.volmat@foss.st.com,
 linux-sunxi@lists.linux.dev, suijingfeng@loongson.cn, tzimmermann@suse.de,
 alison.wang@nxp.com, Maxime
 Ripard <mripard@kernel.org>, airlied@redhat.com,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 paul.kocialkowski@bootlin.com, spice-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, tiantao6@hisilicon.com,
 claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:39:53 -0700, Douglas Anderson wrote:
> Based on grepping through the source code these drivers appear to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
