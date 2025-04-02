Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A189FA789E6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 10:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2094910E6E3;
	Wed,  2 Apr 2025 08:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cMwynApd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830B110E6E3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 08:31:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ECB0461145;
 Wed,  2 Apr 2025 08:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFB1C4CEDD;
 Wed,  2 Apr 2025 08:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743582671;
 bh=WtN1ePb3sX9SLuUOAsD8pQQuJnpHBzCx07/dog7oMHk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cMwynApdsxEVN+idw76YwLCcrJZtIl2Q40qRdGeVkK8TlnxEqcGX6MkA2tdxZw2/c
 ULzVHUihH3PAehBiCwojrPYmfqmMVz8YoJFy6DVFFjhP08+e89Wtb1rkhIbCcfU6H0
 5is/lizNUc/BmbBcLm3AHadp6Lqd/imRoqIVYPqsFdK4ZUYVF0bOOvZ/lDCOC1w/pU
 b6I7LOVoNV0CLNpMwcdP0whTAx6PIce0JS6LQYtQLNjjcunbuSrMx5c9AO8a7CpQrz
 hOE6pLvQ6k/OsiA6eJHDGyhR7COuuKZ06kEDyGSOaikqnIJvE+F19uHfAo3keJYIYp
 x78/ijVCCDrRA==
Date: Wed, 2 Apr 2025 10:31:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/st7571-i2c: add support for Sitronix ST7571 LCD
 controller
Message-ID: <20250402-artichoke-turkey-of-aurora-ad12cf@krzk-bin>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
 <20250402-st7571-v1-2-351d6b9eeb4a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402-st7571-v1-2-351d6b9eeb4a@gmail.com>
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

On Wed, Apr 02, 2025 at 08:12:11AM +0200, Marcus Folkesson wrote:
> +
> +static void st7571_reset(struct st7571_device *st7571)
> +{
> +	gpiod_set_value_cansleep(st7571->reset, 0);
> +	mdelay(20);
> +	gpiod_set_value_cansleep(st7571->reset, 1);

huh? Why do you keep reset ACTIVE after performing reset? This makes no
sense, unless you just put wrong flags into your DTS. Your binding
already suggest that - you claim this is N signal, but use high flag.

> +}
> +
> +static int st7571_initialize(struct st7571_device *st7571)
> +{
> +	/*
> +	 * Most of the initialization sequence is taken directly from the
> +	 * referential initial code in the ST7571 datasheet.

Best regards,
Krzysztof

