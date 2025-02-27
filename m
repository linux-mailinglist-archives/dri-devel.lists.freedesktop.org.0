Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B31A47B11
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 12:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7006F10EA8D;
	Thu, 27 Feb 2025 11:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Y+ylQJK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DAC10EA8D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:00:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43EB44429A;
 Thu, 27 Feb 2025 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740654006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRtGr3AFG7KYIerjmFHKE39XTlw5yCSP9o9cNC/e55o=;
 b=Y+ylQJK6jEUYgk4HhJZ+aDr4x08e3Nzao/YHmoxpwPs3Ut59XOsUE1JoF5A22Y49jrZ+wN
 qygMytWr2FoeYEEifwnMkIqKquvZLDyDIRbpxKFEQXTXafRgoc1dRXgTNIKPv6klFcYIL/
 tXxrA2FRBpbSXYJRspnNBrVP1BoR//ifTzBAuaS4vC5NII8LxPY0EkQuYdzBmZvLQFxG2+
 MY1WqwE9UDwRorQoMnckswzMFfeIQqIX4m2qgiGk4m6v8H2A8CntuBvgJFge5bsn+EyfmW
 RT4kz+DgEcsdRQYsX3kmjcF1yzanU/w0Y1afIH0JlMHMvKKBCxKHV6HTNQ7WnQ==
Date: Thu, 27 Feb 2025 12:00:04 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas
 Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 00/15] drm/bridge: Various quality of life improvements
Message-ID: <20250227120004.77814e09@bootlin.com>
In-Reply-To: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvu
 gesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com
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

Hi Maxime,

On Tue, 25 Feb 2025 17:43:48 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
> 
> Here's a series of changes after to the KMS helpers and bridge API
> following a bunch of reviews I did.
> 
> It's mostly centered across providing an easier time to deal with bridge
> states, and a somewhat consistent with the other entities API.
> 
> It's build tested only, with arm64 allmodconfig.
> 
> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

I Tried to test this series on my system but I've got a compilation issue.
     depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
     depmod: ERROR: Found 2 modules in dependency cycles!

CONFIG_DRM=m in my configuration.

Tested to move to CONFIG_DRM=y but in that case, I've got
     aarch64-buildroot-linux-gnu-ld: Unexpected GOT/PLT entries detected!
     aarch64-buildroot-linux-gnu-ld: Unexpected run-time procedure linkages detected!
     aarch64-buildroot-linux-gnu-ld: drivers/gpu/drm/drm_bridge.o: in function `drm_bridge_reset_crtc':
     drivers/gpu/drm/drm_bridge.c:1413: undefined reference to `drm_atomic_helper_reset_crtc'

Best regards,
Hervé
