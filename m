Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCCF28ED68
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 09:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFDF6EC1E;
	Thu, 15 Oct 2020 07:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5647E6EA21
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 07:54:39 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y1so1336155plp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sslab.ics.keio.ac.jp; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=rKoJ8K1HmS89dQcSd+qek5XQD2mS7GsLcQDZpZn8svY=;
 b=U4iUTIxdQbehyuFrFc7WiEJXMgU4qgwSykRROhgkVSQ8nJXnnVIu+nERBK+TpjLiRD
 FMwQW+FwFT1JcwaQtl+Fz/QaBvp8jmMtZ7ylnHbyLTEKHTc9wtkbU3mga6WkYmW8/fYf
 hhu4vjpu74tK6F54iGiQ/E39YCMjKuZhHV1IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rKoJ8K1HmS89dQcSd+qek5XQD2mS7GsLcQDZpZn8svY=;
 b=Cd6pVr737Mg3yxketbtJL4N1ot7SH10ILNlLmmSdmFEi35EpX/gpJLjDO02LpjUPx4
 fdKGHT1QywZnT1W5vDRTyALD2aBbT9H5D7gFVw2SLj/GlZOGqntazejfhmYt2pQ8N8R6
 zkYValbqVFQBzzTyVoH+iYE5ctOd9LUx+fbj3mWC4VIGMDwR8HhpqTPuUJQBTZQBUuqL
 qjeUWQyL7z9TsAyYJF19Ni9k1L0qiAsSPDhIQNicNmPlyzJMnMTWZk8qnr9LfiXcT8h1
 JPVfxo/XxyiSbTrgEBTxAbxkY5zn1l1tCs/PaohSXVt35JDvdPYJvdP6rAFEWniszaKM
 fJbQ==
X-Gm-Message-State: AOAM530blGJPVlJ94/vC+SLdLqeR4lb2Ixl4edAudXZZimlQoH/mVl8U
 6aV81tP7GzHSSCB0A07BEc5DoA==
X-Google-Smtp-Source: ABdhPJyUdVLPpvUpy5QQeSSCwMu0ll7oxBPg1VX62WnU03remZdsdlG7MQNxMpks3DmPoBF6p+L4aw==
X-Received: by 2002:a17:902:ee83:b029:d4:bdd6:cabe with SMTP id
 a3-20020a170902ee83b02900d4bdd6cabemr3465976pld.68.1602662078593; 
 Wed, 14 Oct 2020 00:54:38 -0700 (PDT)
Received: from brooklyn.i.sslab.ics.keio.ac.jp (sslab-relay.ics.keio.ac.jp.
 [131.113.126.173])
 by smtp.googlemail.com with ESMTPSA id x1sm2007824pjj.25.2020.10.14.00.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 00:54:37 -0700 (PDT)
From: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
To: 
Subject: [PATCH RFC] drm/nouveau: fix memory leak in nvkm_iccsense_oneinit
Date: Wed, 14 Oct 2020 07:54:16 +0000
Message-Id: <20201014075419.19974-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:08:24 +0000
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
Cc: takafumi@sslab.ics.keio.ac.jp, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 keitasuzuki.park@sslab.ics.keio.ac.jp
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct pw_rail_t is allocated as an array in function nvios_iccsense_parse,
and stored to a struct member of local variable. However, the array is not
freed when the local variable becomes invalid, and the reference is not
passed on, leading to a memory leak.

Fix this by freeing struct pw_rail_t when exiting nvkm_iccsense_oneinit.

Signed-off-by: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index fecfa6afcf54..8ba8d8e3f52a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -280,8 +280,10 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			}
 
 			rail = kmalloc(sizeof(*rail), GFP_KERNEL);
-			if (!rail)
+			if (!rail) {
+				kfree(stbl.rail);
 				return -ENOMEM;
+			}
 
 			rail->read = read;
 			rail->sensor = sensor;
@@ -291,6 +293,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			list_add_tail(&rail->head, &iccsense->rails);
 		}
 	}
+	kfree(stbl.rail);
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
