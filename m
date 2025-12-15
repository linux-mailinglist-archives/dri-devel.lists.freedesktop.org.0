Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20428CBF0DE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 17:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEBD10E49E;
	Mon, 15 Dec 2025 16:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch
 [185.125.25.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D60B10E49E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 16:55:09 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6b])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dVQgP6vGkz7BQ;
 Mon, 15 Dec 2025 17:36:33 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4dVQgM0sMnzD5S; Mon, 15 Dec 2025 17:36:31 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/2] accel/rocket: fix unwinding in error paths of two
 functions
Date: Mon, 15 Dec 2025 17:36:13 +0100
Message-Id: <20251215-rocket-error-path-v1-0-eec3bf29dc3b@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBtI0/6uEi3EphqCjFEiiO6et
 PwW7z0QSZgiDMUDQhdHDkeGKgvwmztWQp6zQVfaKq00SvA7JSSRIHi6tOHSt53xpnG2qiF3p9D
 C9/8cp/f9ABGdXABjAAAA
X-Change-ID: 20251212-rocket-error-path-f9784c46a503
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
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

As reported[1], in the current state of master (that is, *without*
that[2] patch, yet unmerged), it is possible to trigger
Oops/out-of-bounds errors/unbalanced runtime PM by simply compiling
DRM_ACCEL_ROCKET built-in (=y) instead of as a module (=m).

This fixes points 1 and 2 reported here[1] by fixing the unwinding in
two functions to properly undo everything done in the same function
prior to the error.

Note that this doesn't mean the Rocket device is usable if one core is
missing. In fact, it seems it doesn't as I'm hit with many
rocket fdac0000.npu: NPU job timed out
followed by one
rocket fdad0000.npu: NPU job timed out
(and that, five times) whenever core0 (fdab0000.npu) fails to probe and
I'm running the example from
https://docs.mesa3d.org/teflon.html#do-some-inference-with-mobilenetv1
so something else probably needs some additional love.

[1] https://lore.kernel.org/linux-rockchip/0b20d760-ad4f-41c0-b733-39db10d6cc41@cherry.de/
[2] https://lore.kernel.org/linux-rockchip/20251205064739.20270-1-rmxpzlb@gmail.com/

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      accel/rocket: fix unwinding in error path in rocket_core_init
      accel/rocket: fix unwinding in error path in rocket_probe

 drivers/accel/rocket/rocket_core.c |  7 +++++--
 drivers/accel/rocket/rocket_drv.c  | 15 ++++++++++++++-
 2 files changed, 19 insertions(+), 3 deletions(-)
---
base-commit: a619746d25c8adafe294777cc98c47a09759b3ed
change-id: 20251212-rocket-error-path-f9784c46a503

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

