Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226899A08B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 11:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3C010EA9E;
	Fri, 11 Oct 2024 09:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A6wc6itB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A271B10EA9E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 09:57:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BAF775C031B;
 Fri, 11 Oct 2024 09:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEEA2C4CECC;
 Fri, 11 Oct 2024 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728640651;
 bh=2gk6wi1k4yh4eT4f1QLyt5TAGrsRtDo5kjnzPVa+0i4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=A6wc6itBAOVHQ9eF/x8rnO99ux7oFb/Y4u4+GyMoH11r/HEnSR7YWT6ktOh1TlAyh
 c3Aw9leZhsTPfMYqggqoDzxAQvXkPwQE9tyfaPz1bgbdQC37uoej7U1vmQbrWaDtUC
 BOo14oZZ5/1XSrqbR4jEBC/CabDXay9B5/j4Mj4BgPxErjYPMNAo7Rz+CRMv1f0w8r
 8qs5cYPAtlurYUjzO9gv+1n4AaIcAexjsHtYwRlWytP0Pas6jOjVbOFge4YKelANvg
 +VItf0w5Oqk4dqfG3NiEfS0ulkj3XLUpfhUQ1gyQkhopzKnqKbaMF/nlzq5vWyO+9f
 rZLZygIBfnj1Q==
From: Simon Horman <horms@kernel.org>
Date: Fri, 11 Oct 2024 10:57:12 +0100
Subject: [PATCH net-next 3/3] accel/qaic: Pass string literal as format
 argument of alloc_workqueue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-string-thing-v1-3-acc506568033@kernel.org>
References: <20241011-string-thing-v1-0-acc506568033@kernel.org>
In-Reply-To: <20241011-string-thing-v1-0-acc506568033@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>, 
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, llvm@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.0
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

Recently I noticed that both gcc-14 and clang-18 report that passing
a non-string literal as the format argument of alloc_workqueue()
is potentially insecure.

E.g. clang-18 says:

.../qaic_drv.c:61:23: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
   61 |         wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
      |                              ^~~
.../qaic_drv.c:61:23: note: treat the string as an argument to avoid this
   61 |         wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
      |                              ^
      |                              "%s",

It is always the case where the contents of fmt is safe to pass as the
format argument. That is, in my understanding, it never contains any
format escape sequences.

But, it seems better to be safe than sorry. And, as a bonus, compiler
output becomes less verbose by addressing this issue as suggested by
clang-18.

Also, change the name of the parameter of qaicm_wq_init from
fmt to name to better reflect it's purpose.

Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/accel/qaic/qaic_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index bf10156c334e..30e6bf7897bd 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -53,12 +53,12 @@ static void qaicm_wq_release(struct drm_device *dev, void *res)
 	destroy_workqueue(wq);
 }
 
-static struct workqueue_struct *qaicm_wq_init(struct drm_device *dev, const char *fmt)
+static struct workqueue_struct *qaicm_wq_init(struct drm_device *dev, const char *name)
 {
 	struct workqueue_struct *wq;
 	int ret;
 
-	wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
+	wq = alloc_workqueue("%s", WQ_UNBOUND, 0, name);
 	if (!wq)
 		return ERR_PTR(-ENOMEM);
 	ret = drmm_add_action_or_reset(dev, qaicm_wq_release, wq);

-- 
2.45.2

