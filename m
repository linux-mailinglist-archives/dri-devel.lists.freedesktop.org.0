Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CCB9E36AA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B612C10ECA6;
	Wed,  4 Dec 2024 09:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GNF4xzmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6355810EC9E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 09:31:42 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8C311D29;
 Wed,  4 Dec 2024 10:31:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733304673;
 bh=2kTYJooFMq+5La3iJTTLvA+HVNIvS8ojV7vTfwy1oII=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GNF4xzmL3MleQEFQGtbFiYw1E8RrIuwS3XhQ3Q9gzd1Y2lJS6CNJV2i5TeYutv8R1
 kch/wEjHrwmk/z0/+FXj/6QWOqvq6FoFjE3rv5zkXnxdUGCHp4uXYUdY+1Ipo/eY4m
 FsqJhx4S7ddmZ1Rg8vCnnRAAjLQzgQlecYZijKlY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:09 +0200
Subject: [PATCH 09/10] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-9-0bf2c5147db1@ideasonboard.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=766;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=2kTYJooFMq+5La3iJTTLvA+HVNIvS8ojV7vTfwy1oII=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFzs5fjsix/w/yAKDDiwajcNiOFWZyKW3aKm
 VY6shZfH3WJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcwAKCRD6PaqMvJYe
 9cKND/wMV/dSG+TgZCNtmwg4MqMJVd8JugsFWyt+4GwifiFA57W2Utez9VYn3Hf4CrQJ9RnMnL6
 IZzkMV48OZ4g2u7xYpQ7myK/fd2l9SMOc916mhweowFlsQMKaruqmYdU57Hm68e4fXSMYTcq8S9
 L8lo7MzYjNZ+sag+vN0gPC+7KJ1f7WYosn79zy6vRgixgJkrAsAqbDCg6kGABq832rcwy9jknSs
 xLTs8GHzn08WIIFkPlAR0XyBWL59qoq8lMrugpHPYZB4KZjCsgivOVfFWCZW+AVo1tDloLWvCjq
 tVhU9moaDnvF01XNjU0CIj3tVm6F57Olk0iQhWPzITqoxvLtfmiYK+SM7iS7KypIGpeJcCqjOhc
 M/iqtLdeenC4fEnVCQ8vo5e1SJA/X8HrA9g35iLT+tedpcG5nAW0ZiGC4eSCjuEkfWpfGcn9Dq+
 po2HPfU/eUx12RHQjc/5tmD0eNOApTnWzmnYLy9ErI3aym2aNupGuM7KAQzqc4J1MRUxvfSkM1g
 tMSyubS1BDzZHprfKzH6dmlm46u4KsEjnTZQ1mHvXrLZ67XlaTYYKlOHpQA16xQpCy1Ys/hgNxB
 tS3oydwDbYYuWgVwkKIXnusmHmblbozCa/r5AHLjC8iv0n7vRuxVWOe0rOGqIHRKKJE5eqwcQKq
 bEv3UWQM+MkCkQQ==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for X403 format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 44cfee6a0e32..622d1dfac42d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -319,6 +319,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_X403,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0

