Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705EE940863
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 08:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1704188CBF;
	Tue, 30 Jul 2024 06:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D2gzYx6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8026B88CBF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 06:31:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E02C161D4D;
 Tue, 30 Jul 2024 06:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FB7C32782;
 Tue, 30 Jul 2024 06:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722321060;
 bh=113zHcxOpsbcwW11a7aMT7BENgNTSv1ngvCERVMP0f8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=D2gzYx6r0P05HsmdpYls3H21fhknAGjIqhHcv06vvRN3LHZT/jZgS/E2dxjcBRE3j
 gu1CK+c8wLLxC+g71k0vt5byDFs49n2+2eV6zlXoNMd9+bzeVmSdjFPV87oNJFlQQ1
 nVpZYlmHZoxoS9aaMQu8KU7BMPm2lTlOwse71KTO5rqolHCFrE0/SyMMg1cpf6G5RZ
 PnMWPcBdZD3AJuEr1UvTT8Lx9nSjekrTnI/9TKyWIMqvrK5YCuNLifqZYvLGGIfQxA
 qRedOyhRbBOSqdEODBBRdYnNAe0XBuQBp2N8tCBJ4uvZE8P3nck4XUmf2lZd0d7q6Y
 wlG/GTJwF52/w==
Message-ID: <91f9c77f71fb1bce513a02d5e2800f04@kernel.org>
Date: Tue, 30 Jul 2024 06:30:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Stefan Wahren" <wahrenst@gmx.net>
Subject: Re: [PATCH V2 07/16] drm/vc4: Get the rid of DRM_ERROR()
In-Reply-To: <20240728114200.75559-8-wahrenst@gmx.net>
References: <20240728114200.75559-8-wahrenst@gmx.net>
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

On Sun, 28 Jul 2024 13:41:51 +0200, Stefan Wahren wrote:
> DRM_ERROR() has been deprecated in favor of pr_err(). However, we
> should prefer to use drm_err() whenever possible so we get device-
> specific output with the error message. In error case of kcalloc,
> we can simply drop DRM_ERROR(), because kcalloc already logs errors.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
