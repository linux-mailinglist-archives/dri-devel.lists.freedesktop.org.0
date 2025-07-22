Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21331B0E6CC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 00:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199FB10E73E;
	Tue, 22 Jul 2025 22:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vym2qzur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C9210E73D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 22:59:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C1375C68BA;
 Tue, 22 Jul 2025 22:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35DEC4CEEB;
 Tue, 22 Jul 2025 22:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753225159;
 bh=MfICkfXMWCF9NlybbsMcp/Dwcx+IdC0bFbu+PNYcl/o=;
 h=From:Subject:Date:To:Cc:From;
 b=Vym2qzurrN+nyVhZaDuWfyNWYBe30J4TiLDbfkuX5fR3cbVo3ZIXDW0XJT0k3DIgW
 AOpo4p+Id4Ie4GX2+1pdVJ7PuuA5gCBZN8OjUPlmbtInuB3edX+q9C2WBLi+0QuiG9
 dOWp6ILP/1d79lYMPWsHkR7FRqf82twodpyA2of/6ovfrwmSYvglyHaysMLL+EFn0y
 wUM52EMoAiGE03WcN7IlD0+sMj3Ug4eaVyCJ2VNm5ZCjrs8dnbvXhuT7Tz23xUujjp
 9XIXuhk43zGRhRmXTo6K2GxXe7u6ZI9WvJIXFQWqh3g2lrKBbx2cwg4f4Z1IsACPAM
 ouBSglhe0jerg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH RFC 0/2] accel: Add Arm Ethos-U NPU
Date: Tue, 22 Jul 2025 17:58:55 -0500
Message-Id: <20250722-ethos-v1-0-cc1c5a0cbbfb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK8XgGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0NT3dSSjPxiXeO0lBRjy9Q0szRDSyWg2oKi1LTMCrA50UpBbs5KsbW
 1APW9Sm5cAAAA
X-Change-ID: 20250715-ethos-3fdd39ef6f19
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.15-dev
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

The Arm Ethos-U65/85 NPUs are designed for edge AI inference 
applications[0].

The driver works with Mesa Teflon. WIP support is available here[1]. The 
UAPI should also be compatible with the downstream driver stack[2] and 
Vela compiler though that has not been implemented.

Testing so far has been on i.MX93 boards with Ethos-U65. Support for U85 
is still todo. Only minor changes on driver side will be needed for U85 
support.

A git tree is here[3].

Rob

[0] https://www.arm.com/products/silicon-ip-cpu?families=ethos%20npus
[1] https://gitlab.freedesktop.org/tomeu/mesa.git ethos
[2] https://gitlab.arm.com/artificial-intelligence/ethos-u/
[3] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (2):
      dt-bindings: npu: Add Arm Ethos-U65/U85
      accel: Add Arm Ethos-U NPU driver

 .../devicetree/bindings/npu/arm,ethos.yaml         |  79 +++
 MAINTAINERS                                        |   9 +
 drivers/accel/Kconfig                              |   1 +
 drivers/accel/Makefile                             |   1 +
 drivers/accel/ethos/Kconfig                        |  10 +
 drivers/accel/ethos/Makefile                       |   4 +
 drivers/accel/ethos/ethos_device.h                 | 186 ++++++
 drivers/accel/ethos/ethos_drv.c                    | 412 ++++++++++++
 drivers/accel/ethos/ethos_drv.h                    |  15 +
 drivers/accel/ethos/ethos_gem.c                    | 707 +++++++++++++++++++++
 drivers/accel/ethos/ethos_gem.h                    |  46 ++
 drivers/accel/ethos/ethos_job.c                    | 527 +++++++++++++++
 drivers/accel/ethos/ethos_job.h                    |  41 ++
 include/uapi/drm/ethos_accel.h                     | 262 ++++++++
 14 files changed, 2300 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250715-ethos-3fdd39ef6f19

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

