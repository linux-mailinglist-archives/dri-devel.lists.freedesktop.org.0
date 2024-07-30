Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1479F941328
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 15:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB9A10E278;
	Tue, 30 Jul 2024 13:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DKkNToPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E561310E278
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 13:32:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1BC3061EFB;
 Tue, 30 Jul 2024 13:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F77C4AF0A;
 Tue, 30 Jul 2024 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722346350;
 bh=Ww/3YfXLpMTtcse++NJb5y4ZU/aN97sPUvyeSo23DdI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=DKkNToPSLS8T7sk+M5aux4vSCiJUoWztVWWYIqp+bn2ZSH/grzDx9NoII3CBNmiPd
 gkG2/N0kGhTZBnrTKmECYFTu2VE4hgFB/njzoBXrMcFA6HM3zqTALjphMSd+1fnNPF
 o7MjFhJSf9EiXy9e9RN9TuhHm2aWw8BbScyDsBTZhG04tlgL3vf34kE0cuaq2kYdqz
 zcVsVEg1vdJ/pKlr7KKD4IaIbEmXEfLGT8kMMHPV12bynt3HCrcyaYg48fWgrkjjg5
 g+9UEuYesyoBplAznq+bhkoORpx26BiZcwTYanfY6Lwa5o0E9QSp8NdY3MV9KrD2vA
 ynz8GyBkqogcQ==
Message-ID: <218e3904b3f78d72cdbb7c9bf17db4ac@kernel.org>
Date: Tue, 30 Jul 2024 13:32:28 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Stefan Wahren" <wahrenst@gmx.net>
Subject: Re: [PATCH V2 08/16] drm/vc4: hdmi: add PM suspend/resume support
In-Reply-To: <20240728114200.75559-9-wahrenst@gmx.net>
References: <20240728114200.75559-9-wahrenst@gmx.net>
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, "Artur
 Petrosyan" <Arthur.Petrosyan@synopsys.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, "Jiri Slaby" <jirislaby@kernel.org>, "Lukas
 Wunner" <lukas@wunner.de>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Minas
 Harutyunyan" <hminas@synopsys.com>, "Peter Robinson" <pbrobinson@gmail.com>,
 "Ray
 Jui" <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Ulf Hansson" <ulf.hansson@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Jul 2024 13:41:52 +0200, Stefan Wahren wrote:
> Add suspend/resume support for the VC4 HDMI component in order
> to handle suspend to idle properly. Since the HDMI power domain
> is powered down during suspend, this makes connector status polling
> pointless.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
