Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F23337E646F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3B310E1C7;
	Thu,  9 Nov 2023 07:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8006310E1C7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:38:45 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE89AAF2;
 Thu,  9 Nov 2023 08:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699515501;
 bh=4QrpN0remY7a+J6VizLfc7b4s63ZI1p2RwGVH+9cdlM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=j6xyRaDMQbKBte9nBDiQPWjV74ioRWP+2nYnkXnh0FyrLDk6z5Dwt1H8FkwhS5UDh
 4vuENT8g05YNbMb+USR045s6/6vr/A9NVr7u6+tGweleGYMqw/NIQvilVmITgslWmb
 ALH+6g51eyeS0rhTxZhLU3yJiqM4FWRH8abF+GKo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Nov 2023 09:37:54 +0200
Subject: [PATCH v2 01/11] drm/tidss: Use pm_runtime_resume_and_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-tidss-probe-v2-1-ac91b5ea35c0@ideasonboard.com>
References: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
In-Reply-To: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=4QrpN0remY7a+J6VizLfc7b4s63ZI1p2RwGVH+9cdlM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlTIx9R3Be7juvu3cbDA4igiN84v7BvPT0aVvXJ
 zJeuTmjDzGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUyMfQAKCRD6PaqMvJYe
 9SCJEACbeJnBxXR6wHkmfYPIYYjCWXulM6Bgr1xIQQcuZqr9vzIk86dR6KFM0z7rReRsDtdluOz
 EXtzLew+5jM9R9JvwI5DU/uZrmseigA4DZRkIFQolWs5mJGVFdgCIO/ImVhw6yIBl3DhirYxuXr
 mG+oCx2v/frd5X9ImjvfVZ+M8thl+7Lti5rePnMIDtGue4nx2Lc/LqA3FxsKLxQOTznbtVFMYSJ
 OmZofiG2kBjrJ3Inniym+UZryapoVvOr8OSuU6ZIvX2oJMQV32Sk34jQIQ6ULPj86rgUKJKaCZ+
 UAxE/j8h9Izf0RkHsLFJlF4wGzWLHicWgySc1YVSnZPvPAPfuZASgWuNmcWlNxIdNxf7AXlaMUy
 mCvA9qbYtRwyES8B8cQ6PNnzmcKkGM2ppr6pzSmkVJIgQCxbSrMXpk8fD+RTDjAYXqAevuII7MC
 /x46ucTVzxQwf5e/nrHgX88hrcROe0aC0gor33ZSTOrScGdC9KJSDV4M9ebhpgYDtyX/gmJO9Ud
 pHXlftVl8yspfdjbn8oUTUYkSXsGZIRTCWROHD77upuxNoAgdfskSQWxQi8FsHgiGTaT4utINXa
 1iVTusW5wGQkLyikemMAO9/TQaF9yjasglOh71knN/vRpOggltHZ9KAVp5cKLtArlINTZSzucHC
 Cks8sZJRK+20Pgw==
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
 Francesco Dolcini <francesco@dolcini.it>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync(), which
will handle error situations better. Also fix the return, as there
should be no reason for the current complex return.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

