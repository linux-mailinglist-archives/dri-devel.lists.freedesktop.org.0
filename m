Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155C7E6476
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E236A10E1C6;
	Thu,  9 Nov 2023 07:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617D510E1CA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:38:47 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73C6817E1;
 Thu,  9 Nov 2023 08:38:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699515504;
 bh=1GEKCab8OHb1x6cabABKC9MQy0dJhOUkvWfwR9SFuWU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lx6pfWLVWCmmHaDeuOyAaaC57VoXbIEoLYr8BDw0U3KVHnD1/6LHIjN3OmgxMMDSC
 y8iBt0vYIfWg4drQZrTcC3RWuVpOtBqbktQzQn4jsd6KIdv7OfNVRXwdqCJdvJwgCC
 6ZE7wRaJ2kbVaQos1sdat+2e81zFgtOS0JcgF+RY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Nov 2023 09:37:57 +0200
Subject: [PATCH v2 04/11] drm/tidss: Move reset to the end of dispc_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-tidss-probe-v2-4-ac91b5ea35c0@ideasonboard.com>
References: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
In-Reply-To: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=1GEKCab8OHb1x6cabABKC9MQy0dJhOUkvWfwR9SFuWU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlTIx+bzzkLDQBAuaUOAtJiZaksLTxdF5B9rdMq
 LxobCQK80CJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUyMfgAKCRD6PaqMvJYe
 9Rc8EACWQUnArZGNglO1/TEwH5VQgmaOPDpDdNQFrSWbEXfHEH5Mhxdb/yzQJAryQqHswgWONS8
 zv/voBbUvNC+gHdYUL8s2VywJMRhGhpkrcraLdTCuXb/Y1Zq3W3uAH5rRvUT3JR7tNqkTXbcLVq
 aYLwe/Vt2ADLLrAqRjOPlh8gx1zQdobVUTpJaRVOG0b5+gjSpbaPlyJYmK5uhigtRkHzRGpC8e1
 3nAnCQV8nK0EHAWEIpe+k1MKvSiqPR2vayBxmgmZzodzdjX/QQ5VdjEA13dOflDg7+RS13TDGbG
 F0Cm0oEZtmZotu7pZvDPPFml7byp3c1jMaEBYMoxTS4IVSPnf9GyhC1vwxM2yKymnKJ4qLuJZvv
 k7oKCpe/vDSUnEfPzcet1AYNoqBgHQccBJtkKpIN3BErRBnlZKECPH5HL8Wac2ccYxjnObxupe0
 1+/yYW5coIxn0sctpwoAX0PcX20xxo32ctL0CSB51sIhfmT7S6d4bzRNFE+b41pUnTA6n+Cih41
 CVJEULzPTsVu5NdAdyA+9prHk7TrCK2Sg2ZwlsvO4qnH2doDpe5yYCZXIUxgwfU9HY5ZMRnoDOe
 Mi206BOCbn0vLkHOm1cRtOUlCYkmqtyihGi756/uR1CKq80fzIFYjNiPaiLYseHyu00ThJaOfFK
 0Op0KFDTJ2N6p6A==
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

We do a DSS reset in the middle of the dispc_init(). While that happens
to work now, we should really make sure that e..g the fclk, which is
acquired only later in the function, is enabled when doing a reset. This
will be handled in a later patch, but for now, let's move the
dispc_softreset() call to the end of dispc_init(), which is a sensible
place for it anyway.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index ad7999434299..deb665d0ede8 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2777,10 +2777,6 @@ int dispc_init(struct tidss_device *tidss)
 			return r;
 	}
 
-	/* K2G display controller does not support soft reset */
-	if (feat->subrev != DISPC_K2G)
-		dispc_softreset(dispc);
-
 	for (i = 0; i < dispc->feat->num_vps; i++) {
 		u32 gamma_size = dispc->feat->vp_feat.color.gamma_size;
 		u32 *gamma_table;
@@ -2829,6 +2825,10 @@ int dispc_init(struct tidss_device *tidss)
 	of_property_read_u32(dispc->dev->of_node, "max-memory-bandwidth",
 			     &dispc->memory_bandwidth_limit);
 
+	/* K2G display controller does not support soft reset */
+	if (feat->subrev != DISPC_K2G)
+		dispc_softreset(dispc);
+
 	tidss->dispc = dispc;
 
 	return 0;

-- 
2.34.1

