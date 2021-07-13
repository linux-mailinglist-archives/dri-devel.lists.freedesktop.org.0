Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 974763C71D0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 16:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFB2895E1;
	Tue, 13 Jul 2021 14:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616248996E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 14:05:25 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id he13so41647546ejc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=XnJI6qXOw6HsabQFNSqtivtJDCKOD2fPbI9xhSpPX+g=;
 b=H6h7/rvaV6hTrQ+ZDaJd4fsM8GWCyrjOeUONSUYBl8ICPUJmsqsFhIHcRTDSycZxd6
 6xHrnZQAMWfMZ5zg0rd6GgAUSrW1qwWkULN4dqPh3VmbZxZP/OR+E8JEv1oe10uvJOJv
 caE9Lecyf8lvnyakapQYffih19U427ROUz5EgjO8m7mxtCbv83PXZPngCN0ZTCp25Sco
 OwHhWXyRcBMV+VKEqpVb4F4IaSCSO8dQKGw45pbvYfbMrQrzU9zjr1CXsRetHto3mneR
 Mc7m6fqc9TGeOfFK/5l6XVqXTl3OoH1gftZdZmVNfy/cdIiGIpx1+Zj3IuRnsuamPqhU
 n1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=XnJI6qXOw6HsabQFNSqtivtJDCKOD2fPbI9xhSpPX+g=;
 b=A41nXgWO0dcdvjbJwpaxT4vhdcfu1nSNqPVYz+pb9qBuPh1F0atd+KkeOYye73mf60
 VzZmUXHJAKNtQPiMw43Fq9ky/0Zpu3ZVKHP9ewLJf0e/IgrBaWYYByT8VMDDUtG2flIG
 lQdJ6HAUEs+wx5cXsDkcePQfrDcGFsQg0UJvSc1HwNqazZD3kcloIkUkpHOEM51dUvJY
 zDZmG+X2fbDE+mTSwQnBP/jb55QF16QgxH/cgHYIpVvfTtgpdJ5LTCLHCIIX5y8dQgQE
 0c3MMwxlumZtwQanRzJBjdYGbwP9QFVq5qqSp1LauVdr5poiFyd8cPRVlys97leWJuBk
 K6Tg==
X-Gm-Message-State: AOAM533SZFTeHPB09cCo7ToeapNawuySaoCsb2C2HKYuZ/vWaMuTkqmN
 cZTV09TCpKFnD9s8ImveMgrVxirfj/pVuA==
X-Google-Smtp-Source: ABdhPJwrN7Uce6XZnD8SlIaRWhSyTHA/CD+x4umpJkAzbx3TT4cd6AiXIMtXKWWFzsKER+YalNa9Lg==
X-Received: by 2002:a17:906:4fce:: with SMTP id
 i14mr5964587ejw.231.1626185124024; 
 Tue, 13 Jul 2021 07:05:24 -0700 (PDT)
Received: from pc ([196.235.212.194])
 by smtp.gmail.com with ESMTPSA id co21sm9866084edb.24.2021.07.13.07.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 07:05:23 -0700 (PDT)
Date: Tue, 13 Jul 2021 15:05:21 +0100
From: Salah Triki <salah.triki@gmail.com>
To: p.zabel@pengutronix.de, festevam@gmail.com, alexdeucher@gmail.com
Subject: [PATCH v2] gpu: ipu-v3: use swap()
Message-ID: <20210713140521.GA1873885@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use swap() instead of implementing it since it makes code cleaner.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---

Changes since v1:
	- Remove the declaration of tmp
	- Fix typo in the description

 drivers/gpu/ipu-v3/ipu-image-convert.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index aa1d4b6d278f..af1612044eef 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -990,7 +990,7 @@ static int calc_tile_offsets_planar(struct ipu_image_convert_ctx *ctx,
 	const struct ipu_image_pixfmt *fmt = image->fmt;
 	unsigned int row, col, tile = 0;
 	u32 H, top, y_stride, uv_stride;
-	u32 uv_row_off, uv_col_off, uv_off, u_off, v_off, tmp;
+	u32 uv_row_off, uv_col_off, uv_off, u_off, v_off;
 	u32 y_row_off, y_col_off, y_off;
 	u32 y_size, uv_size;
 
@@ -1021,11 +1021,8 @@ static int calc_tile_offsets_planar(struct ipu_image_convert_ctx *ctx,
 
 			u_off = y_size - y_off + uv_off;
 			v_off = (fmt->uv_packed) ? 0 : u_off + uv_size;
-			if (fmt->uv_swapped) {
-				tmp = u_off;
-				u_off = v_off;
-				v_off = tmp;
-			}
+			if (fmt->uv_swapped)
+				swap(u_off, v_off);
 
 			image->tile[tile].offset = y_off;
 			image->tile[tile].u_off = u_off;
-- 
2.25.1

