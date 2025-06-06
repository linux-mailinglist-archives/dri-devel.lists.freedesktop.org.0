Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D0AD0380
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 15:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9136610EAB0;
	Fri,  6 Jun 2025 13:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g+XEJ6TL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E1010EAB0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 13:51:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F00AB45265;
 Fri,  6 Jun 2025 13:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54388C4CEEB;
 Fri,  6 Jun 2025 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749217888;
 bh=0EUhPJN/ej7dujrTSImae1IpfSVdM4lhwwyQXY3wRhg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g+XEJ6TLd24xwY1scPWFxLNqHDO/czrYDZlcD/8CYc3S9WM9XHopq2GBGKozTqSi3
 BvYlCkIOzj9oFBx3oJeeIwNWgzVfDKqVXtvNuOw/1KG9OAEZT2P11hu1XT4PYY1QoL
 B//JwS60GfeCS10GehaNbHz1j91AofdBlN3bBpNikWHXnZF/EyGkGq5YQcENRGjjkT
 Je1My1YqsKM6ma7T2DKgDNpXXE/rjusOydU7TF7aEvpPyh38wQKocG0LQeejaLtR7n
 qitO0+dbSzI+VHuE4sVXhWX4X9L0BlvGFKoRCJESripKQ1nhmUHr/y/3HqOKh+SiGg
 +QWNAOPwBa6SA==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/3] drm/bridge: add kunit tests for
 devm_drm_bridge_alloc()
Date: Fri,  6 Jun 2025 15:51:24 +0200
Message-ID: <174921788251.1623225.5807110434824414840.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606-drm-bridge-alloc-doc-test-v9-0-b5bf7b43ed92@bootlin.com>
References: <20250606-drm-bridge-alloc-doc-test-v9-0-b5bf7b43ed92@bootlin.com>
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

On Fri, 06 Jun 2025 10:41:18 +0200, Luca Ceresoli wrote:
> This small series adds a few kunit tests for the new DRM bridge allocation
> flow, based on the recently introduced devm_drm_bridge_alloc() [0].
> 
> It is part of the work towards removal of bridges from a still existing DRM
> pipeline without use-after-free.
> 
> The steps in the grand plan [1] are:
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
