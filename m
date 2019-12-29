Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CA212D790
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB346E1EE;
	Tue, 31 Dec 2019 09:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC34289AEB
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 16:28:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y4so16873241ljj.9
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 08:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=obMh8XTaHYb/hrwA03bev5cmgIzHacNi7+oYmLrptLw=;
 b=Pm/R6mA0jYabAm6zVxMJIumdUmGH3EQ2cKoUF+Vd2dBswWtQP5bPl1Dm/puplwwbKh
 GEzGix3Z8uQnJdN4ru6pdafLRRrJ6cQ0NQnle23pXKAPmMznIzBYb+STJ5GcNApvJ+5n
 gEgmy8rgYiFeNJRra7bYbDP8A5qflq9AGp61r3vV911nqvzjhr0Crx/SKVBNpKbXROyU
 g32X0PIZeoma0NwQ7puSO/iMqQCRqRhE0fcoO1FFBAskyIJfIhEm2d2oLDxn/17wh7ii
 tfgvNcauleCqWi6weDLypTiO9TcL2a6bVHYGClq5ssHNMWgh+E34pXMTXJcaGk8ewBlQ
 qk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=obMh8XTaHYb/hrwA03bev5cmgIzHacNi7+oYmLrptLw=;
 b=qd5rrrP46Zay7z/8sUf4J2DvbYS5J3ql8LQagtc+n+SaX6uLu9MpBL7JVGxf56qRcz
 JcWKng810FXr79yUlrYOhIdlqXgHLSkiDK5PycQO3qt03JAsdLxGCrMR/hG6RsUnZXnl
 lKagbYNG4Jyf2uzf7d8wyCYJNQDOuu/0B5OSNxu9LfIZ2WmegjGxY4OuPma0KRa7haRO
 WC66xsE7LhbsGlP+R3klDb0ksn7IDEr+v2Bgf4IsLxb05v4jvj0lSkTBSosuJYnn5Ek8
 MZIjuZgFdJhfXBNWC55J8Uv8sp3hCGzE1ZMDWHWDcxxl3y8w6i7nMaJfQCBA2bmwIfvl
 /qwg==
X-Gm-Message-State: APjAAAVrhEDQx3rMHk0wcqaqPVyEpN6qLGpAPKqZP/CgmyepNEDPEam3
 py6rTwbmYdqTUoOD9O3u6L4FP+518h8=
X-Google-Smtp-Source: APXvYqyk/Z+wI5g5MjHiImymXWVQkPbDZjOPP2utmy1NOg+UkAkIEmkBDnQDeNrAMncBwarAH7oF3Q==
X-Received: by 2002:a2e:9999:: with SMTP id w25mr25471407lji.142.1577636921176; 
 Sun, 29 Dec 2019 08:28:41 -0800 (PST)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
 by smtp.gmail.com with ESMTPSA id u13sm17284858lfq.19.2019.12.29.08.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 08:28:40 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@siol.net
Subject: [PATCH v2 4/4] drm/sun4i: Update mixer's internal registers after
 initialization
Date: Sun, 29 Dec 2019 18:28:28 +0200
Message-Id: <20191229162828.3326-4-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229162828.3326-1-roman.stratiienko@globallogic.com>
References: <20191229162828.3326-1-roman.stratiienko@globallogic.com>
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

At system start blink of u-boot ghost framebuffer can be observed.
Fix it.

Fixes: 9d75b8c0b999 ("drm/sun4i: add support for Allwinner DE2 mixers")
Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
v2:
- Picked 'Reviewed-by' line
- Added 'Fixes' line
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 5d90a95ff855..86711d8a9c84 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -576,6 +576,9 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
 
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_DBUFF,
+		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
+
 	return 0;
 
 err_disable_bus_clk:
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
