Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590447E039F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 14:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6CD10E9D3;
	Fri,  3 Nov 2023 13:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D813E10E9E1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 13:14:24 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 812957E1;
 Fri,  3 Nov 2023 14:14:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699017245;
 bh=xvh2d5U42urNPpTVLrPHqnnQohefIEzDhgWLBqn84R4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=md8XVaGNJcNAoIJSUkmjHsee+W5rT7WUnAu/frOfntimOdTILaaPQJLnrC+s4+1iX
 kQYyAboeJy5Wk4wiUd5nl7G237ntAiVNmn1XLgZSon5GZBUrwsFua+x1UJ4ky6e4n+
 Jx9bS6+pHMqQg6R/Ped6LrG30BGpEZQKaX4RB0ys=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 03 Nov 2023 15:14:03 +0200
Subject: [PATCH v2 1/4] drm/drm_file: fix use of uninitialized variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231103-uninit-fixes-v2-1-c22b2444f5f5@ideasonboard.com>
References: <20231103-uninit-fixes-v2-0-c22b2444f5f5@ideasonboard.com>
In-Reply-To: <20231103-uninit-fixes-v2-0-c22b2444f5f5@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Parshuram Thombare <pthombar@cadence.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=xvh2d5U42urNPpTVLrPHqnnQohefIEzDhgWLBqn84R4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlRPIrnmZo1zjRKv5d2MoQWEqetAoew50nTwIqf
 4dYQyqbaIqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUTyKwAKCRD6PaqMvJYe
 9deJEACAmhSvKQOpGftUEQRGJaU5QM4IipaLrzmOLtkoZklkMeFjdjFJL7fbrnKSeoOJkQL7kBA
 H3Y5ejdcQmxVlVhQ/DGg9LVBCDf+9mFIeX6WhItd6mUD7fCiqj0hjlRl8uiYxjEqLiz/mVwJW5e
 tBmZr0EMycBkMWL2Iczj4c2HVgyUEb3qo48WgOMOWy6w5+Ko0JLgOCo7SZieFzIJ3mtc4uGGCNK
 ouKC0bUqInXKHzq1PJWOGQ6TZ84OUO4oLXTwoMzE5LBtTNifsly1AI8ozSKeFEz1tVB+X/AiG7V
 7UZ0Oz4hWPreJolS6miy96S+sJMuVtsHCb5tr5fieU1aHbnkZ56JK90nHoAbZ0d1N6Blvc3CsQE
 DmCW13ptjh868qfqsDoC8F2KQDPH7RqRTV7nLJD4lDmirRs2B0TTC3zd35sbs3ucsumS2Oavxr6
 FDogtoqiLKYDgLsvk7ARbrpk+krN7N+hTKCnktHyWGQS90I9R+nvCZh+pj4S71aXc2+jWQiU3QH
 PHvdQcf8km2KSi9YPz2qtjFfHdMtCZe1Wb5TmESVPxBTg8BDIwKD+CXkNNZeOwILtQWI64I507H
 Eb6d3WQz11814zPUipjoO6D2vuyAuWb66JROZGUHO3gTm8ZmukiZBYrd8Ztfcqjh60CqjM98BcW
 0oogiXp2RxzZEpw==
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports:

drivers/gpu/drm/drm_file.c:967 drm_show_memory_stats() error: uninitialized symbol 'supported_status'.

'supported_status' is only set in one code path. I'm not familiar with
the code to say if that path will always be ran in real life, but
whether that is the case or not, I think it is good to initialize
'supported_status' to 0 to silence the warning (and possibly fix a bug).

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 446458aca8e9..54a7103c1c0f 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -958,7 +958,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 {
 	struct drm_gem_object *obj;
 	struct drm_memory_stats status = {};
-	enum drm_gem_object_status supported_status;
+	enum drm_gem_object_status supported_status = 0;
 	int id;
 
 	spin_lock(&file->table_lock);

-- 
2.34.1

