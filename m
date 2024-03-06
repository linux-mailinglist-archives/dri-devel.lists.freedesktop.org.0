Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1102287410C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BF7113507;
	Wed,  6 Mar 2024 20:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="sxaH4jB+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2715113502
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:04:02 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Tqk0K6DYWz9wLd;
 Wed,  6 Mar 2024 20:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709755442; bh=yXbuN+CoZuGbUAgSQaHGYWiyhuige5NUNnLWq/soBQM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sxaH4jB+I12ibLBpFeegaJT5HHbr9J8j1ezVHJuBPLXC0BVfhqvbjVfBxb7b+6JCI
 RF+vx+UTTLk3b4s5BI5Cgwr8C4mYoO4uDa7hqYuCbn5M1k0l3wstsYoi8P4YgWHp8U
 nRXk71dhMWSTZSUIgsT3Kya+Z+5R8JgDdDarHqyQ=
X-Riseup-User-ID: 8880DFCE1D029D93798CB6476356726EB753FBDD344B564393D9FDDA451E06DC
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Tqk0D2vmCzFvsZ;
 Wed,  6 Mar 2024 20:03:56 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Wed, 06 Mar 2024 17:03:13 -0300
Subject: [PATCH 6/7] drm/vkms: Change the gray RGB representation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-louis-vkms-conv-v1-6-5bfe7d129fdd@riseup.net>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
In-Reply-To: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com
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

Using the drm_fixed calls, this needs to be changed. Which in fact is
more correct, colour.YCbCr_to_RGB() gives 0x8080 for same the yuv
parameters.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
index 66cdd83c3d25..49125cf76eb5 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
@@ -48,7 +48,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 		.n_colors = 6,
 		.colors = {
 			{"white", {0xff, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
-			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
+			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8080, 0x8080, 0x8080}},
 			{"black", {0x00, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
 			{"red",   {0x4c, 0x55, 0xff}, {0xffff, 0xffff, 0x0000, 0x0000}},
 			{"green", {0x96, 0x2c, 0x15}, {0xffff, 0x0000, 0xffff, 0x0000}},
@@ -71,7 +71,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 		.n_colors = 6,
 		.colors = {
 			{"white", {0xeb, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
-			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
+			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8080, 0x8080, 0x8080}},
 			{"black", {0x10, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
 			{"red",   {0x51, 0x5a, 0xf0}, {0xffff, 0xffff, 0x0000, 0x0000}},
 			{"green", {0x91, 0x36, 0x22}, {0xffff, 0x0000, 0xffff, 0x0000}},
@@ -94,7 +94,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 		.n_colors = 4,
 		.colors = {
 			{"white", {0xff, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
-			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
+			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8080, 0x8080, 0x8080}},
 			{"black", {0x00, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
 			{"red",   {0x36, 0x63, 0xff}, {0xffff, 0xffff, 0x0000, 0x0000}},
 			{"green", {0xb6, 0x1e, 0x0c}, {0xffff, 0x0000, 0xffff, 0x0000}},
@@ -117,7 +117,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 		.n_colors = 4,
 		.colors = {
 			{"white", {0xeb, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
-			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
+			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8080, 0x8080, 0x8080}},
 			{"black", {0x10, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
 			{"red",   {0x3f, 0x66, 0xf0}, {0xffff, 0xffff, 0x0000, 0x0000}},
 			{"green", {0xad, 0x2a, 0x1a}, {0xffff, 0x0000, 0xffff, 0x0000}},
@@ -140,7 +140,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 		.n_colors = 4,
 		.colors = {
 			{"white", {0xff, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
-			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
+			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8080, 0x8080, 0x8080}},
 			{"black", {0x00, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
 			{"red",   {0x43, 0x5c, 0xff}, {0xffff, 0xffff, 0x0000, 0x0000}},
 			{"green", {0xad, 0x24, 0x0b}, {0xffff, 0x0000, 0xffff, 0x0000}},
@@ -163,7 +163,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 		.n_colors = 4,
 		.colors = {
 			{"white", {0xeb, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
-			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
+			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8080, 0x8080, 0x8080}},
 			{"black", {0x10, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
 			{"red",   {0x4a, 0x61, 0xf0}, {0xffff, 0xffff, 0x0000, 0x0000}},
 			{"green", {0xa4, 0x2f, 0x19}, {0xffff, 0x0000, 0xffff, 0x0000}},

-- 
2.43.0

