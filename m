Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452F876FED3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF58A10E6D5;
	Fri,  4 Aug 2023 10:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101BB10E6C9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:48:30 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34D182E4;
 Fri,  4 Aug 2023 12:47:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691146044;
 bh=NyaBzWSTtq2qSJj6mTZ7oYg0vWlG6MVQyE0tsCk6WrM=;
 h=From:Subject:Date:To:Cc:From;
 b=QdG2zpKxN4o6vioaOLpLpgJ6vGe/csQC3NnqhNiZlv3ZOI0yvFiEnF7q1ioNAx0Ax
 GskneNYh2dn/qeol2FbHTvM8oviEa9kJLta0tyj59A4Y7hFkedaD9CnaWGR9RW2i8B
 x1C4Y+Q90edxdMT89HQpRbtQDet3Gxlcf6gkCPZw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/4] drm/bridge: lt8912b: Init & remove related fixes
Date: Fri, 04 Aug 2023 13:48:09 +0300
Message-Id: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGnXzGQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCwMT3ZwSC0tDoyRdy+SkJHNLA0MLM2MjJaDqgqLUtMwKsEnRsbW1ANA
 6CwZZAAAA
To: Adrien Grassein <adrien.grassein@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=676;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=NyaBzWSTtq2qSJj6mTZ7oYg0vWlG6MVQyE0tsCk6WrM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNd5dFA68l08OCZc/LASCE1Lf8FuiAA956OOE
 uwIB043CyWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzXeQAKCRD6PaqMvJYe
 9fNgD/9o5Pcr0M/Xnuy6Xl3chYqVFkorlZOV9HoIykYfMWDJMBQ+PdBljrATvkERTif0O4j72ut
 LS5ztW7/Rlidd5b+W5WcMe65LwLobadi0aGx9/o2ydP00bhQHHo0Vqr+46iRnYNQe/IoqnrpXUJ
 EYYVk9tQY8H0vj3nObHe33dANj1+OfINnYMw+9cnA3VaXfYc0WKtzJmFUC7R4IBjcgyJ4riifp+
 6CC1Uml9TfVe5qLFKDcRdrB9VEosS/WI4PRq7sXXhTJ4+d0NEe9Ld9UarU9/Yof4MzChdeFgkh5
 P/2Wa0hfvlILthdZ5rCW+/U8NNCsGVYoWc+iQ5g9P9Hie2lVRk2sjt/OpdwwV3FpWEUotb4GdVY
 Im9xZP4Q2lN3HhLXmwJ1WwNzY/8VxY4UImoFyJNxkCOnn0s9Vhi8YdXOeT/kOCC0gZlBdVBIUg4
 TP9KmCLvxYeX/nJT2kosp3EPyMaSKZshM8ZrguCfb/Gi/8aBoO+/5OCKyq8iPnDGjnzm/50vNi8
 Yp9uTzqdG3sy3zEjc6KsryDVr09zBlhli9h3S0W5ZujvkClUFGpSLt4PF2RPjzpCZK5QE0H8Vh3
 uTPXp7ogasxXJtXS6I1se6FiqB9ZpLyaghP3dnT8yusL+IJHWwFvujIAr2zshv1tRzpmiN4eRtn
 +x7WCVVUAvG+4Tg==
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix various issues in lt8912b driver.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (4):
      drm/bridge: lt8912b: Fix bridge_detach
      drm/bridge: lt8912b: Fix crash on bridge detach
      drm/bridge: lt8912b: Manually disable HPD only if it was enabled
      drm/bridge: lt8912b: Add missing drm_bridge_attach call

 drivers/gpu/drm/bridge/lontium-lt8912b.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)
---
base-commit: b0e9267d4ccce9be9217337f4bc364ca24cf7f73
change-id: 20230804-lt8912b-9cbb79018632

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

