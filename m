Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8973ACAA32
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 09:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3511610E1AD;
	Mon,  2 Jun 2025 07:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rXRnYBa5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2330310E1AD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 07:56:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 31CB55C5A56;
 Mon,  2 Jun 2025 07:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A6CC4CEEB;
 Mon,  2 Jun 2025 07:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748850980;
 bh=G8vHJ1oOdy/gXfGEd+HQJJV4bCKcrAcoq3qPx+pvPHs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rXRnYBa5uTwqNg7HrQlBM9RVB+9sd72Lt7mMcN9ryVd+B0s2Q0ReGp4yR93VLwz9i
 0I9t1xDRdYG9fI6afAYVTQNFIAz6ZUrSnlPUO+ZnrAzTItf9WffI8HDlZcecfdxQA7
 ceRYtPBBm+dQpbK2f2ZzbMWQRg/VxcX75yIX4NcqDmaH7Cs8wnPOi2fH5G6P0JxugE
 MOXjngNwVOCO/NnkkyCgwM0lC+DujVdtbR8lgBAFaXFVqb6EXN4xlr//5ilBslQfEZ
 Sz8a/xPL/LZMw90LqfzMrMX2bXG0n/6FpqgZ7BK3pdL3cw4Di8LfafSkuXQypONmSK
 W9WFWkfaFwpjQ==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Robert Chiras <robert.chiras@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>,
 Artur Weber <aweber.kernel@gmail.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v2 00/46] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part3
Date: Mon,  2 Jun 2025 09:56:15 +0200
Message-ID: <174885096739.421739.9939855699808449174.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 29 May 2025 21:46:02 -0500, Anusha Srivatsa wrote:
> Final set of drivers to use the new API - devm_drm_panel_alloc().
> There are a lot of occurences of the panel allocation across the
> subsystem. Much thanks to Maxime for the semanic patch which actually
> gives a list of panels allocated unsafely.
> 
> virtual report
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
