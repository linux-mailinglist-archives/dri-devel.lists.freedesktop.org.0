Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA6E7DDE3E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA7910E66F;
	Wed,  1 Nov 2023 09:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4871D10E00C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 09:18:36 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D826E7F8;
 Wed,  1 Nov 2023 10:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698830298;
 bh=gkIBd5+fMV46AC7d0uwLpkNL1fVDY+8sAYxHxQO4ANk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=o2mRwQzu+y+EV3qM9yFl6nfauKT2y7VcnTtn8wCh+NPKjDdmlxzVOFIouNOYvo3/Q
 wPTnw/uwXe0nrTTwCbKXII0J4TBcA02J7f2pW9Z09jJaPX+ss56DPnzQhBDbW8eNn5
 wazuHRifULXVGzoeuY+EkIOl8P8uAakZgHC8Rpec=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Nov 2023 11:17:38 +0200
Subject: [PATCH 01/10] drm/tidss: Use pm_runtime_resume_and_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231101-tidss-probe-v1-1-45149e0f9415@ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
In-Reply-To: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=gkIBd5+fMV46AC7d0uwLpkNL1fVDY+8sAYxHxQO4ANk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlQhflp0H+oMJh4AKSQ1Ir0s9axU9mj4Jd5D82W
 7KdfFko9HaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUIX5QAKCRD6PaqMvJYe
 9bCTD/9V0Lh/Xns/cGwDrdHS5OhAzc26iltUq4huG/4tVJYYv2XmPd6R+VH0Z8s9o1C7I3yiunU
 j9QZRslEBhzf/Tz/uFfzTjPyGxLOlMRxol0YP2oljPMFCX2O440hxKRddhpFRKCq9INj8gq2NFX
 8txW/8WLqURoHLOmv8CBL7ANxceY9iMp3ISW+UPBtXo8wlX0P8pircepSn9/dbhlmdL5os9IOPN
 4lhrv51b+9qGXKa1OWhI1izPJQthC370HFjrWghKPityx6WWX+iYhIHm9BAKdvK5JSVmoVLpDbe
 nNp+njQE+t64euRlO0153TDCoiiWcih/4AtUvbBV/PE937sMbqR9k7pxqIlZ9aLkd5XF18+v2we
 lMepM+F22FQVnK8Dzf6a5kNus7k90Nna0M+BIo3aol2IwPaBz1vIFJzYvtbmadUS7cMWhsOrzA1
 FgKqlxWiz8rnrPUZwBsYezqwkuuIIO5dFXkmMkLGLpxgoHDeKjcmxhztSdnYMqvzEWvVndOergC
 HptBTmZ9F8j4yTSZzGMiMB8TP9l1tzI0X7sGeByKSj4HAdZ06ZngsL4PjEw/bD8fDw1Or7oxYIH
 xMJ5S88qA4SSXUpP5vwhUgmSv+NERyMT/PMDmUodnZkbRNMuXyAnL2Wh9CCQAntk81Lihb5ihPp
 G5Tr9Nl2jbqdrSA==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync(), which
will handle error situations better. Also fix the return, as there
should be no reason for the current complex return.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 4d063eb9cd0b..f403db11b846 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -32,9 +32,9 @@ int tidss_runtime_get(struct tidss_device *tidss)
 
 	dev_dbg(tidss->dev, "%s\n", __func__);
 
-	r = pm_runtime_get_sync(tidss->dev);
+	r = pm_runtime_resume_and_get(tidss->dev);
 	WARN_ON(r < 0);
-	return r < 0 ? r : 0;
+	return r;
 }
 
 void tidss_runtime_put(struct tidss_device *tidss)

-- 
2.34.1

