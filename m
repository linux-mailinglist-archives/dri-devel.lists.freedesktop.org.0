Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2114941326
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 15:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250C610E10D;
	Tue, 30 Jul 2024 13:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tfZhJT6D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0844D10E10D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 13:32:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6058ACE1043;
 Tue, 30 Jul 2024 13:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E01C32782;
 Tue, 30 Jul 2024 13:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722346336;
 bh=/SYPq5kzaJCWlXFJH/J2536byhSWwshx5r1swTz714g=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=tfZhJT6D/wUZ0ckLDQgQWKQkkP7BhnjJqAlRf4eGkUi+geNzdkfMyFOs/4d/hJXNY
 ORwgcKkMvCW3HDV1Av0afni2CHFZFM6gUySKQJBzP9BB6+wHTDzBihy08+LEvz8hRk
 AojUASUHCPbx9PH0q1lu4xUVjhSchsjLFd6bsp4Ip+jMwxGkUa0Ja5Bq0e+AWjsU/r
 75z4hOaHj0Ss38RHwsRPbYHQIW5So0LuKDWUkDq0bhcRo5aLmaCyG+KZVY1iTe0VxE
 gIkrj3BNHae4nUkP5gEN9ilVGMFESRZDsZXOLEYhc7l4EYtoC/QMyFnRlkeLiVp+Ai
 HukSuAMey4nEw==
Message-ID: <0dd8ca7c0c0800b21120bbf3cf177d1e@kernel.org>
Date: Tue, 30 Jul 2024 13:32:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Stefan Wahren" <wahrenst@gmx.net>
Subject: Re: [PATCH V2 06/16] drm/vc4: hdmi: Handle error case of
 pm_runtime_resume_and_get
In-Reply-To: <20240728114200.75559-7-wahrenst@gmx.net>
References: <20240728114200.75559-7-wahrenst@gmx.net>
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

On Sun, 28 Jul 2024 13:41:50 +0200, Stefan Wahren wrote:
> The commit 0f5251339eda ("drm/vc4: hdmi: Make sure the controller is
> powered in detect") introduced the necessary power management handling
> to avoid register access while controller is powered down.
> Unfortunately it just print a warning if pm_runtime_resume_and_get()
> fails and proceed anyway.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
