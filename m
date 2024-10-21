Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976539A6BA4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 16:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1414B10E529;
	Mon, 21 Oct 2024 14:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XBikVcUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B9610E524
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:08:19 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A5AC18B9;
 Mon, 21 Oct 2024 16:06:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1729519592;
 bh=1q9cAD7VxRnLeVa0WQH1ibBnEmicIHZOce8e+2t9JMA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=XBikVcUvALTtM6eoMckNqaCTTcFD7snAw0RbAWIX797OJ4rHtYCUJ2xCmKRAQje9u
 juKiQpG6fFleh4lgl4CH7er0JDBRcdnTxF+1kjoqMFIPKva52n0V0dTwXSMmh6YNAQ
 xifn0vI50z67VV2kos32QQdUzK2fbF6a3CiapJZ4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 21 Oct 2024 17:07:47 +0300
Subject: [PATCH 3/7] drm/tidss: Remove extra K2G check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-tidss-irq-fix-v1-3-82ddaec94e4a@ideasonboard.com>
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
In-Reply-To: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
To: Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Cormier <jcormier@criticallink.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=1q9cAD7VxRnLeVa0WQH1ibBnEmicIHZOce8e+2t9JMA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnFmBNB8YAVBBsW9C7Qu3rJKCDj7kd7zVLgXUGj
 o7J2z31cFqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZxZgTQAKCRD6PaqMvJYe
 9eouD/0UpgWjIbRmVs4qd9KM4zU+ULBEJ1Zah+myAQaDWAqNB2FCrKjqbXfkP3rkqskfXXpfCwv
 tM81LZ3PQ8fn3XTuiMNnS49iBJt3qL6DZ5vkXNZ2Jfpmz69R6n+fTptq4Bkz8F7vE2KAojRKWMb
 bsCmlqm0hqzkNXw2RPT9NZyqvhLMT0fgwIuig5aEuTxBpgvIp0/St9CpH7SNXOXNM9XKL6uGlDQ
 tmLUsagaO9mVI/7O2ojjLqRGM4s9QpgovpJRqzKO0pjklJJDB71gz7BzpTTE3l8yGkwATR6JF7D
 TE5EFazPcrq3qsJx+5ldHeRf6Ud7jY2PE4isme00GhRMkvCRCicYbn9rY8L8Bad60+cfViSfLSc
 4EkMNeH1tIVO3APaxSw+7l1TEmCwxYZPSFnyCK3Vly6VvbW7o3SZPBSnlbGsDLFkA+MeUj3bsZR
 SFlFCv6O4DpkVEvIBU5bsGvEsvO9ciNUF8xHs3rpPsLOAlUi0dpax3QSwtfscagfF0i+nHm4FmP
 HA4TdCUKVHk5WKDj31cj+t57JZiRV44vNctuVRXNsOKTHu1CO/RBPlqMUXM2beX2kfibQzimU3p
 BbQKmCM/+iK+uZh886gjm6kcaItvjvyVyLnXtPlo7gBs0B1OA/tODR//CLg0b0LHGcihJ1JLZgQ
 CbC1728dvCllzNA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

We check if the platform is K2G in dispc_k3_clear_irqstatus(), and
return early if so. This cannot happen, as the _k3_ functions are never
called on K2G in the first place. So remove the check.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index f81111067578..99a1138f3e69 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -789,8 +789,6 @@ void dispc_k3_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t clearmask)
 		if (clearmask & DSS_IRQ_PLANE_MASK(i))
 			dispc_k3_vid_write_irqstatus(dispc, i, clearmask);
 	}
-	if (dispc->feat->subrev == DISPC_K2G)
-		return;
 
 	/* always clear the top level irqstatus */
 	dispc_write(dispc, DISPC_IRQSTATUS, dispc_read(dispc, DISPC_IRQSTATUS));

-- 
2.43.0

