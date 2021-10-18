Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09BF431F8E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 16:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F9C6E087;
	Mon, 18 Oct 2021 14:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651586E087
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 14:28:55 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t2so41849247wrb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 07:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lIVpyuu3eqZnfVh+BWlIEt1O3BS03uxO8GKG4EQyBdY=;
 b=gH/1sgob/dAMXDnK1Zij+GCFUd7n9iU8KyIM0JWJOd9CN13vDFG9eQWDrkNMfK3uee
 aA2hbaiFfVm3iyuF3xUh9Wq/RbP9LJb6zb+qACAsNEa3JW/b5VYklxKXGGMVZiMbjhDd
 lNmoC9znCiWNaDokDrt2ZQUmSU00CENQqlrAYHXiGGpIDZw60grXFUL+ZU8XGXZ7jIj7
 SMMXcz6RZTdp6vEy7vHj/8IfDVggwPNisSYbJD4lspL5uMTQxTtzWD8ZOZ8JE1WzmVIY
 zaX+/DMnL1hV7cEKr6LfeM1e3EylhE/Y19tu8oMkSnODkXTevV1vxwoP6qAUZdjvSOSa
 gG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lIVpyuu3eqZnfVh+BWlIEt1O3BS03uxO8GKG4EQyBdY=;
 b=bkkmBdNKPJIw4LiWaFJklyx90D1+giqXMdcW9kwd+9EZ+B3U/g3zn9yJXwluPmMxKc
 oRrhkRf1Lj7l0ETPsKgm8BnUaxo5P6TaLsYqgOw2TNkbH0mnDeeSfs9SCshZ96KT//6z
 aJ8/jlBK1QnTPZ/ipZZk4zUGdcb2g/5kjLw/1KXT1lg1MPIePmf5xSc9g8G42iEz6k7v
 SOzdtamsqBN0CqWCPkxv/ntb0da9Z9qQCGf0zrQaVfWPyLOcldmKYyzEqd7yFc8LhwnN
 bg3pgfd+59rCyRYLQGqMlc69dytXrSCRlRtvEp+24pp5GOUfbY79ya9vlQ7UnjEc0LbS
 PHpg==
X-Gm-Message-State: AOAM530cWYsvif70wWaNyEtT//TsBL10CsfONvv8E5FnGEM0C/OIfYYm
 8ibO67h2yhs620579amrRobQwg==
X-Google-Smtp-Source: ABdhPJxGGGec7//1d18gIejeXLzf9z9AnspSnl4+KhhmZtXw6ffAjmmPO4j6D829yKFJcMoWll2JxQ==
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr36506967wri.127.1634567333786; 
 Mon, 18 Oct 2021 07:28:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
 by smtp.gmail.com with ESMTPSA id b3sm12908495wrp.52.2021.10.18.07.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 07:28:53 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v6 8/9] drm/omap: add plane_atomic_print_state support
Date: Mon, 18 Oct 2021 16:28:41 +0200
Message-Id: <20211018142842.2511200-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018142842.2511200-1-narmstrong@baylibre.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=narmstrong@baylibre.com;
 h=from:subject; bh=WJUnfDMOqyIY/JyZJij5vnFH7gBqBRnpbS9bv6xbZYw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhbYSGNhJeWiEgCa74ngEwWcJR2N3i4688rynOukR8
 uHZQBLWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYW2EhgAKCRB33NvayMhJ0bFAEA
 CZPKHg2+39aPe3f5tZvn5JlQz4R0qTMoABfNZbVbQfeOVaG4gzYlXccrk592IxEZ0xovQT5MySrA0C
 96Ncrj3I11amYmcLbSHtW+9jI5IoHTMvO/2BXFqC/HeQdJZMfb+D7Rmuw9+EAMGyjA5SKTLA2pvjdV
 yEzWHdIh3X10E0Pi1MtFk2qRAbTwMfEO0Nb2RJdPdrfenTb8Tx1K4dmE7cFVhzDVXdJs9UxeZViNN9
 oq0H2wxSBkqnB5yZEeOXuNW/8zv3QyEufxUitip0H6jTgUQm7pAYQ0UOSarrnW7OLtQbYYwzDuSHd7
 +hXrPld4d7pujE+zAhZan4YmyvQFJxF18xOqnh6LANTsvgriz4mCFrv2ylN/v+RDONOkSFe2Z2tMnh
 rlDGaFUnkiULCtObooXMZk0s2odxgPFLEPX0QIZc354DTERybRWGQKfLB6Ft0FFbBc8DN9UXyLGyqz
 fK5pWZiCiw7MKLJ9LkFATzR285rBnv419Z7ZA6L8XPrNdbmEcJJ5ZWAsrzkR3BRjkdR5oDpl7aqTnO
 ajKHJcvA4Gyz+Mt5LOTCOGe0wFDMQMOIzFAe2/JTF0CPOzIZRgtRUOhNFvhaGfY3lh3M7EMooJDY06
 Oer5vjgRzt/R1IHLToLhMXFFi+TltDRYqYPWRZixUxR1TmGwrF7lnvoNrEPg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
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

From: Benoit Parrot <bparrot@ti.com>

Now that we added specific item to our subclassed drm_plane_state
we can add omap_plane_atomic_print_state() helper to dump out our own
driver specific plane state.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index ce5ed45401fb..5001c8354e4f 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -348,6 +348,21 @@ omap_plane_atomic_duplicate_state(struct drm_plane *plane)
 	return &state->base;
 }
 
+static void omap_plane_atomic_print_state(struct drm_printer *p,
+					  const struct drm_plane_state *state)
+{
+	struct omap_plane_state *omap_state = to_omap_plane_state(state);
+
+	drm_printf(p, "\toverlay=%s\n", omap_state->overlay ?
+					omap_state->overlay->name : "(null)");
+	if (omap_state->overlay) {
+		drm_printf(p, "\t\tidx=%d\n", omap_state->overlay->idx);
+		drm_printf(p, "\t\toverlay_id=%d\n",
+			   omap_state->overlay->id);
+		drm_printf(p, "\t\tcaps=0x%x\n", omap_state->overlay->caps);
+	}
+}
+
 static int omap_plane_atomic_set_property(struct drm_plane *plane,
 					  struct drm_plane_state *state,
 					  struct drm_property *property,
@@ -387,6 +402,7 @@ static const struct drm_plane_funcs omap_plane_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.atomic_set_property = omap_plane_atomic_set_property,
 	.atomic_get_property = omap_plane_atomic_get_property,
+	.atomic_print_state = omap_plane_atomic_print_state,
 };
 
 static bool omap_plane_supports_yuv(struct drm_plane *plane)
-- 
2.25.1

