Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PfrI8s4jGlZjgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E521220C5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE5910E224;
	Wed, 11 Feb 2026 08:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AO1Us83W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03C810E5E6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 18:09:35 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso1017785e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770746974; x=1771351774;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=OBc8TO43XyTU7wmRneZXW7N97Ft8rzp0b55awq4cob4=;
 b=AO1Us83WnDISvXgjVhgksH3rJRP9SqbmXisjQly9Atp477FWrWpwrFgSRFSViUufjJ
 Eb2XPanibWO+TABiI8nEsYmiQZixw23zram9fPssxeGax+sME0YvtCiLGrSFqIFsQ4YO
 mr+OsPtH0RctAvdsHE6GNPzKdRK9RJLyEfrD+ggcYtEwZAUC5ETHQwQ3En3Z+kA3KW1Z
 5UjcHPncawcCf8ntdgxHQO+XQfVAJape/t6C0GwYE0WLXlZfYuFUkZCQcbdh6dVWHXlP
 R7NaLF1rLcrkmML+ENHs40bXyVM08zdjcgY7OUmlVhfzd+hyWq2LwkqyDxhjzWd5pumT
 FN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770746974; x=1771351774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OBc8TO43XyTU7wmRneZXW7N97Ft8rzp0b55awq4cob4=;
 b=Kjm2pbMz4Rwyr7jbky0ozROWz7AHtVguTSLD/s5GUIWJysAVM8RSt/ahkRvbCPqebQ
 41REGmf3fgl4tcoOkGlJVDILY6xxuVPiuCItwSx/3aMzFybND5IVC0y/RdDwVaOLi0pG
 nz2o8GgAPQ4WPyIiXVVxBEizXQ1u97/5iaZ5dki6YUZxdla4zS6+EG2e7/oq4iE1W5R3
 klVjQk4Uj91bVkfe8S9YEamRrS2vCe+p+BcOXGvbXgP9R+qyfEMhvMcQd0lPYM1qccbN
 hdRlyiwXYn7sJjP8dYmyYz9YUWZ+RQk9ya/a0xe3QJop4rcoDouER8z52FszD2euozYm
 74RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT8xI7M6itWLFkjFsqqHeUzZPxrcoVO1/LIcaednQPmqONfG1xZ+d7Hurvpoi10E5gRNYyJLr7BwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywhg0Y9UbhQcqgwrYllhcIFdkUqznEUMGiuIRbOGEZKZVMbuWkl
 X+okvOKZCQnCmvXcnybG1KM52A/cJlqLmei1Te7THJPbHHjiy8hELNzN5QpbIxH69Lg=
X-Gm-Gg: AZuq6aKKbYTVKE2Xp9YSA9RHg0OUHIFmzbV/RQVWZ8o+hyVIT/3tLpywuoJGxU+LeCd
 CTrNX3Y+rpw7g9bXA4JPqMr0SqeH4tXHfEmW5y3LDfK+YazFH8TSDuy48ZBofjDrV4qLXtxAMOq
 3eJNoOcxbHxi+bztsIzo+LmrK2IkSFXPUeSpq32MnFAB/r1D1/8wSYE7KzEC1z6Osp9Fz0ynFWj
 uF35mYRbUp8g8alFX55aZ1V0UpCSuruUua2S3R5yrTfTahDq9Sj18YLTdMowSGVQmYDuS7FVqtJ
 VtG3rg/RGAl6/iVHfYvSL5VNb2CTJhFvb7nVw965af+BMO2+pWQSUS67dabMtYJPKI2DH7LAqGZ
 S1YqTGxNeWzWZKXJDAVVz9yP4KicR2YkSpTI+Bo/bP0owyYdOzQNUbJBi9Ef9+2ouOw==
X-Received: by 2002:a05:600c:46cf:b0:483:4b37:8620 with SMTP id
 5b1f17b1804b1-48350530e24mr45832385e9.10.1770746974027; 
 Tue, 10 Feb 2026 10:09:34 -0800 (PST)
Received: from localhost ([151.57.64.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5e1a8esm68667295e9.5.2026.02.10.10.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 10:09:33 -0800 (PST)
From: Francesco Lavra <flavra@baylibre.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/solomon: Fix page start when updating rectangle in page
 addressing mode
Date: Tue, 10 Feb 2026 19:09:32 +0100
Message-Id: <20260210180932.736502-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209; i=flavra@baylibre.com;
 h=from:subject; bh=SsjbQz0p4M9VAImDhBwIhoE4gChqvQzLxFqedmgaZF0=;
 b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpi3P1b571zhMCpceu53YyYhnBPEvsHmM08wyAT
 pU3gFmUTamJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCaYtz9QAKCRDt8TtzzpQ2
 X+uVC/4tMYK6G3yEcCk0DLVNBn1VxJ1XHZ7w5zNiUOIvULWigS5I6Yb/c8CGfUyV92Ea/beAELB
 c+CjiC0fjWwBAKtWNIfxyBxGuno2mii4+r5foGvLff3Fmy+Qd0PaCUCtz9SwDPoD9JfO2+kaQwq
 Bc/Xv7a4+BrIAJPGwO6U/2ctr9hqb9jaTOOAPfBdBzEY7WMW2RjiqZwzwxgQ5Tbr3KSxfl6C1JD
 OvrNLzRRbJRlr2Yap+FKpRMzdlZh5dVVwLSsmDsVEgiRPhzVLjr6Yo1AVJ00c9h+Cz3+leaOY3y
 qHWJjgAPHY7xTZDE9Q+K/C7hEOd/yLy3x/imMyJrw+Xz8CsuOYH5m/LrPAzVz2MXxu5OYC3z8ea
 5zl+OILfydzf2uP7gpWzroCNLBLfhfBi07dnaOJxNFOAeUE8fZX+yTOlakMbmRi85D/RM+50OIu
 wELJwYs8HazsDmsPzB5m1NMQH+TNpf78/ZyzzvBLOKFTI4DodkreURr+7dKtEdKWcEbG4=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp;
 fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Feb 2026 08:07:28 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:javierm@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:wens@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[flavra@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[flavra@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: E6E521220C5
X-Rspamd-Action: no action

In page addressing mode, the pixel values of a dirty rectangle must be sent
to the display controller one page at a time. The range of pages
corresponding to a given rectangle is being incorrectly calculated as if
the Y value of the top left coordinate of the rectangle was 0. This can
result in rectangle updates being displayed on wrong parts of the screen.

Fix the above issue by consolidating the start page calculation in a single
place at the beginning of the update_rect function, and using the
calculated value for all addressing modes.

Fixes: b0daaa5cfaa5 ("drm/ssd130x: Support page addressing mode")
Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 96cf39320137..33ceed86ed36 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -737,6 +737,7 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 	unsigned int height = drm_rect_height(rect);
 	unsigned int line_length = DIV_ROUND_UP(width, 8);
 	unsigned int page_height = SSD130X_PAGE_HEIGHT;
+	u8 page_start = ssd130x->page_offset + y / page_height;
 	unsigned int pages = DIV_ROUND_UP(height, page_height);
 	struct drm_device *drm = &ssd130x->drm;
 	u32 array_idx = 0;
@@ -774,14 +775,11 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 	 */
 
 	if (!ssd130x->page_address_mode) {
-		u8 page_start;
-
 		/* Set address range for horizontal addressing mode */
 		ret = ssd130x_set_col_range(ssd130x, ssd130x->col_offset + x, width);
 		if (ret < 0)
 			return ret;
 
-		page_start = ssd130x->page_offset + y / page_height;
 		ret = ssd130x_set_page_range(ssd130x, page_start, pages);
 		if (ret < 0)
 			return ret;
@@ -813,7 +811,7 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 		 */
 		if (ssd130x->page_address_mode) {
 			ret = ssd130x_set_page_pos(ssd130x,
-						   ssd130x->page_offset + i,
+						   page_start + i,
 						   ssd130x->col_offset + x);
 			if (ret < 0)
 				return ret;
-- 
2.39.5

