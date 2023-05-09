Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE586FBE94
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 07:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2063810E32A;
	Tue,  9 May 2023 05:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFE210E0AD;
 Tue,  9 May 2023 05:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683609291; x=1715145291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aqWLD7A36wWQjmacfjH5FzsuDyhA+wqIDedurUB7PSc=;
 b=OPzs9EXpSY6s5qxWhIRxsVc2iITEQzpxDimqlXdVG5tbDeBRh7ltlRVl
 Y8iquyLbuGf4iAxktFupdFR+J9fBF+auM4hW5gh3pGnVe/7J3TnCB7PAN
 SHEqFxo+fJ8SGHiku/UkYqaBdoZRdRzK5SWqPQC6oN8SlTgimtoQM4SKe
 fzV4pJ1u9v/KhkaOZ+WYWkyCyKCnD+lGIFGaA79eDLgGDKyPxxldJGIpK
 mDjaN0nEOoeDhJZaXxEcMyRes/7TGqkeB0k3x+IrtW+oR1dOCXXZ30R1c
 +pNzC31WPXbMs6xhDKQJ4glzpY43cvGZcsyE3+3Eg33hlz4jKuykTyYJx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="339037129"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="339037129"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="873033251"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="873033251"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:14:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amd: Remove wrapper macros over get_u{32,16,8}
Date: Mon,  8 May 2023 22:14:01 -0700
Message-Id: <20230509051403.2748545-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509051403.2748545-1-lucas.demarchi@intel.com>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both amdgpu and radeon use some wrapper macros over get_u{32,16,8}()
functions which end up adding an implicit argument. Instead of using
the macros, just call the functions directly without hiding the context
that is being passed. This will allow the macros to be used in a more
global context like ULL() and UL() currently are.

Callers are automatically converted with the following coccinelle
script:

	$ cat utype.cocci
	virtual patch

	@@
	expression e;
	@@
	(
	- U32(e)
	+ get_u32(ctx->ctx->bios, e)
	|
	- U16(e)
	+ get_u16(ctx->ctx->bios, e)
	|
	- U8(e)
	+ get_u8(ctx->ctx->bios, e)
	|
	- CU32(e)
	+ get_u32(ctx->bios, e)
	|
	- CU16(e)
	+ get_u16(ctx->bios, e)
	|
	- CU8(e)
	+ get_u8(ctx->bios, e)
	)

	$ coccicheck SPFLAGS=--in-place MODE=patch \
		COCCI=utype.cocci \
		M=./drivers/gpu/drm/

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c       | 212 ++++++++++++------------
 drivers/gpu/drm/amd/include/atom-bits.h |   9 +-
 drivers/gpu/drm/radeon/atom-bits.h      |   9 +-
 drivers/gpu/drm/radeon/atom.c           | 209 +++++++++++------------
 4 files changed, 219 insertions(+), 220 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index 1c5d9388ad0b..eea49bfb403f 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -112,62 +112,62 @@ static uint32_t atom_iio_execute(struct atom_context *ctx, int base,
 	uint32_t temp = 0xCDCDCDCD;
 
 	while (1)
-		switch (CU8(base)) {
+		switch (get_u8(ctx->bios, base)) {
 		case ATOM_IIO_NOP:
 			base++;
 			break;
 		case ATOM_IIO_READ:
-			temp = ctx->card->reg_read(ctx->card, CU16(base + 1));
+			temp = ctx->card->reg_read(ctx->card,
+						   get_u16(ctx->bios, base + 1));
 			base += 3;
 			break;
 		case ATOM_IIO_WRITE:
-			ctx->card->reg_write(ctx->card, CU16(base + 1), temp);
+			ctx->card->reg_write(ctx->card,
+				             get_u16(ctx->bios, base + 1),
+				             temp);
 			base += 3;
 			break;
 		case ATOM_IIO_CLEAR:
 			temp &=
-			    ~((0xFFFFFFFF >> (32 - CU8(base + 1))) <<
-			      CU8(base + 2));
+			    ~((0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1))) <<
+			      get_u8(ctx->bios, base + 2));
 			base += 3;
 			break;
 		case ATOM_IIO_SET:
 			temp |=
-			    (0xFFFFFFFF >> (32 - CU8(base + 1))) << CU8(base +
-									2);
+			    (0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1))) << get_u8(ctx->bios,
+										         base + 2);
 			base += 3;
 			break;
 		case ATOM_IIO_MOVE_INDEX:
 			temp &=
-			    ~((0xFFFFFFFF >> (32 - CU8(base + 1))) <<
-			      CU8(base + 3));
+			    ~((0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1))) <<
+			      get_u8(ctx->bios, base + 3));
 			temp |=
-			    ((index >> CU8(base + 2)) &
-			     (0xFFFFFFFF >> (32 - CU8(base + 1)))) << CU8(base +
-									  3);
+			    ((index >> get_u8(ctx->bios, base + 2)) &
+			     (0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1)))) << get_u8(ctx->bios,
+										           base + 3);
 			base += 4;
 			break;
 		case ATOM_IIO_MOVE_DATA:
 			temp &=
-			    ~((0xFFFFFFFF >> (32 - CU8(base + 1))) <<
-			      CU8(base + 3));
+			    ~((0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1))) <<
+			      get_u8(ctx->bios, base + 3));
 			temp |=
-			    ((data >> CU8(base + 2)) &
-			     (0xFFFFFFFF >> (32 - CU8(base + 1)))) << CU8(base +
-									  3);
+			    ((data >> get_u8(ctx->bios, base + 2)) &
+			     (0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1)))) << get_u8(ctx->bios,
+										           base + 3);
 			base += 4;
 			break;
 		case ATOM_IIO_MOVE_ATTR:
 			temp &=
-			    ~((0xFFFFFFFF >> (32 - CU8(base + 1))) <<
-			      CU8(base + 3));
+			    ~((0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1))) <<
+			      get_u8(ctx->bios, base + 3));
 			temp |=
 			    ((ctx->
-			      io_attr >> CU8(base + 2)) & (0xFFFFFFFF >> (32 -
-									  CU8
-									  (base
-									   +
-									   1))))
-			    << CU8(base + 3);
+			      io_attr >> get_u8(ctx->bios, base + 2)) & (0xFFFFFFFF >> (32 -
+										        get_u8(ctx->bios, base + 1))))
+			    << get_u8(ctx->bios, base + 3);
 			base += 4;
 			break;
 		case ATOM_IIO_END:
@@ -187,7 +187,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 	align = (attr >> 3) & 7;
 	switch (arg) {
 	case ATOM_ARG_REG:
-		idx = U16(*ptr);
+		idx = get_u16(ctx->ctx->bios, *ptr);
 		(*ptr) += 2;
 		if (print)
 			DEBUG("REG[0x%04X]", idx);
@@ -219,7 +219,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 		}
 		break;
 	case ATOM_ARG_PS:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		/* get_unaligned_le32 avoids unaligned accesses from atombios
 		 * tables, noticed on a DEC Alpha. */
@@ -228,7 +228,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 			DEBUG("PS[0x%02X,0x%04X]", idx, val);
 		break;
 	case ATOM_ARG_WS:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		if (print)
 			DEBUG("WS[0x%02X]", idx);
@@ -265,7 +265,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 		}
 		break;
 	case ATOM_ARG_ID:
-		idx = U16(*ptr);
+		idx = get_u16(ctx->ctx->bios, *ptr);
 		(*ptr) += 2;
 		if (print) {
 			if (gctx->data_block)
@@ -273,10 +273,10 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 			else
 				DEBUG("ID[0x%04X]", idx);
 		}
-		val = U32(idx + gctx->data_block);
+		val = get_u32(ctx->ctx->bios, idx + gctx->data_block);
 		break;
 	case ATOM_ARG_FB:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		if ((gctx->fb_base + (idx * 4)) > gctx->scratch_size_bytes) {
 			DRM_ERROR("ATOM: fb read beyond scratch region: %d vs. %d\n",
@@ -290,7 +290,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 	case ATOM_ARG_IMM:
 		switch (align) {
 		case ATOM_SRC_DWORD:
-			val = U32(*ptr);
+			val = get_u32(ctx->ctx->bios, *ptr);
 			(*ptr) += 4;
 			if (print)
 				DEBUG("IMM 0x%08X\n", val);
@@ -298,7 +298,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 		case ATOM_SRC_WORD0:
 		case ATOM_SRC_WORD8:
 		case ATOM_SRC_WORD16:
-			val = U16(*ptr);
+			val = get_u16(ctx->ctx->bios, *ptr);
 			(*ptr) += 2;
 			if (print)
 				DEBUG("IMM 0x%04X\n", val);
@@ -307,7 +307,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 		case ATOM_SRC_BYTE8:
 		case ATOM_SRC_BYTE16:
 		case ATOM_SRC_BYTE24:
-			val = U8(*ptr);
+			val = get_u8(ctx->ctx->bios, *ptr);
 			(*ptr)++;
 			if (print)
 				DEBUG("IMM 0x%02X\n", val);
@@ -315,14 +315,14 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 		}
 		return 0;
 	case ATOM_ARG_PLL:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		if (print)
 			DEBUG("PLL[0x%02X]", idx);
 		val = gctx->card->pll_read(gctx->card, idx);
 		break;
 	case ATOM_ARG_MC:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		if (print)
 			DEBUG("MC[0x%02X]", idx);
@@ -410,20 +410,20 @@ static uint32_t atom_get_src_direct(atom_exec_context *ctx, uint8_t align, int *
 
 	switch (align) {
 	case ATOM_SRC_DWORD:
-		val = U32(*ptr);
+		val = get_u32(ctx->ctx->bios, *ptr);
 		(*ptr) += 4;
 		break;
 	case ATOM_SRC_WORD0:
 	case ATOM_SRC_WORD8:
 	case ATOM_SRC_WORD16:
-		val = U16(*ptr);
+		val = get_u16(ctx->ctx->bios, *ptr);
 		(*ptr) += 2;
 		break;
 	case ATOM_SRC_BYTE0:
 	case ATOM_SRC_BYTE8:
 	case ATOM_SRC_BYTE16:
 	case ATOM_SRC_BYTE24:
-		val = U8(*ptr);
+		val = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		break;
 	}
@@ -460,7 +460,7 @@ static void atom_put_dst(atom_exec_context *ctx, int arg, uint8_t attr,
 	val |= saved;
 	switch (arg) {
 	case ATOM_ARG_REG:
-		idx = U16(*ptr);
+		idx = get_u16(ctx->ctx->bios, *ptr);
 		(*ptr) += 2;
 		DEBUG("REG[0x%04X]", idx);
 		idx += gctx->reg_block;
@@ -493,13 +493,13 @@ static void atom_put_dst(atom_exec_context *ctx, int arg, uint8_t attr,
 		}
 		break;
 	case ATOM_ARG_PS:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		DEBUG("PS[0x%02X]", idx);
 		ctx->ps[idx] = cpu_to_le32(val);
 		break;
 	case ATOM_ARG_WS:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		DEBUG("WS[0x%02X]", idx);
 		switch (idx) {
@@ -532,7 +532,7 @@ static void atom_put_dst(atom_exec_context *ctx, int arg, uint8_t attr,
 		}
 		break;
 	case ATOM_ARG_FB:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		if ((gctx->fb_base + (idx * 4)) > gctx->scratch_size_bytes) {
 			DRM_ERROR("ATOM: fb write beyond scratch region: %d vs. %d\n",
@@ -542,13 +542,13 @@ static void atom_put_dst(atom_exec_context *ctx, int arg, uint8_t attr,
 		DEBUG("FB[0x%02X]", idx);
 		break;
 	case ATOM_ARG_PLL:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		DEBUG("PLL[0x%02X]", idx);
 		gctx->card->pll_write(gctx->card, idx, val);
 		break;
 	case ATOM_ARG_MC:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		DEBUG("MC[0x%02X]", idx);
 		gctx->card->mc_write(gctx->card, idx, val);
@@ -584,7 +584,7 @@ static void atom_put_dst(atom_exec_context *ctx, int arg, uint8_t attr,
 
 static void atom_op_add(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src, saved;
 	int dptr = *ptr;
 	SDEBUG("   dst: ");
@@ -598,7 +598,7 @@ static void atom_op_add(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_and(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src, saved;
 	int dptr = *ptr;
 	SDEBUG("   dst: ");
@@ -617,14 +617,14 @@ static void atom_op_beep(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_calltable(atom_exec_context *ctx, int *ptr, int arg)
 {
-	int idx = U8((*ptr)++);
+	int idx = get_u8(ctx->ctx->bios, (*ptr)++);
 	int r = 0;
 
 	if (idx < ATOM_TABLE_NAMES_CNT)
 		SDEBUG("   table: %d (%s)\n", idx, atom_table_names[idx]);
 	else
 		SDEBUG("   table: %d\n", idx);
-	if (U16(ctx->ctx->cmd_table + 4 + 2 * idx))
+	if (get_u16(ctx->ctx->bios, ctx->ctx->cmd_table + 4 + 2 * idx))
 		r = amdgpu_atom_execute_table_locked(ctx->ctx, idx, ctx->ps + ctx->ps_shift);
 	if (r) {
 		ctx->abort = true;
@@ -633,7 +633,7 @@ static void atom_op_calltable(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_clear(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t saved;
 	int dptr = *ptr;
 	attr &= 0x38;
@@ -645,7 +645,7 @@ static void atom_op_clear(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_compare(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src;
 	SDEBUG("   src1: ");
 	dst = atom_get_dst(ctx, arg, attr, ptr, NULL, 1);
@@ -659,7 +659,7 @@ static void atom_op_compare(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_delay(atom_exec_context *ctx, int *ptr, int arg)
 {
-	unsigned count = U8((*ptr)++);
+	unsigned count = get_u8(ctx->ctx->bios, (*ptr)++);
 	SDEBUG("   count: %d\n", count);
 	if (arg == ATOM_UNIT_MICROSEC)
 		udelay(count);
@@ -671,7 +671,7 @@ static void atom_op_delay(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_div(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src;
 	SDEBUG("   src1: ");
 	dst = atom_get_dst(ctx, arg, attr, ptr, NULL, 1);
@@ -689,7 +689,7 @@ static void atom_op_div(atom_exec_context *ctx, int *ptr, int arg)
 static void atom_op_div32(atom_exec_context *ctx, int *ptr, int arg)
 {
 	uint64_t val64;
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src;
 	SDEBUG("   src1: ");
 	dst = atom_get_dst(ctx, arg, attr, ptr, NULL, 1);
@@ -714,7 +714,7 @@ static void atom_op_eot(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_jump(atom_exec_context *ctx, int *ptr, int arg)
 {
-	int execute = 0, target = U16(*ptr);
+	int execute = 0, target = get_u16(ctx->ctx->bios, *ptr);
 	unsigned long cjiffies;
 
 	(*ptr) += 2;
@@ -768,7 +768,7 @@ static void atom_op_jump(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_mask(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, mask, src, saved;
 	int dptr = *ptr;
 	SDEBUG("   dst: ");
@@ -785,7 +785,7 @@ static void atom_op_mask(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_move(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t src, saved;
 	int dptr = *ptr;
 	if (((attr >> 3) & 7) != ATOM_SRC_DWORD)
@@ -802,7 +802,7 @@ static void atom_op_move(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_mul(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src;
 	SDEBUG("   src1: ");
 	dst = atom_get_dst(ctx, arg, attr, ptr, NULL, 1);
@@ -814,7 +814,7 @@ static void atom_op_mul(atom_exec_context *ctx, int *ptr, int arg)
 static void atom_op_mul32(atom_exec_context *ctx, int *ptr, int arg)
 {
 	uint64_t val64;
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src;
 	SDEBUG("   src1: ");
 	dst = atom_get_dst(ctx, arg, attr, ptr, NULL, 1);
@@ -832,7 +832,7 @@ static void atom_op_nop(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_or(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src, saved;
 	int dptr = *ptr;
 	SDEBUG("   dst: ");
@@ -846,7 +846,7 @@ static void atom_op_or(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_postcard(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t val = U8((*ptr)++);
+	uint8_t val = get_u8(ctx->ctx->bios, (*ptr)++);
 	SDEBUG("POST card output: 0x%02X\n", val);
 }
 
@@ -867,7 +867,7 @@ static void atom_op_savereg(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_setdatablock(atom_exec_context *ctx, int *ptr, int arg)
 {
-	int idx = U8(*ptr);
+	int idx = get_u8(ctx->ctx->bios, *ptr);
 	(*ptr)++;
 	SDEBUG("   block: %d\n", idx);
 	if (!idx)
@@ -875,13 +875,14 @@ static void atom_op_setdatablock(atom_exec_context *ctx, int *ptr, int arg)
 	else if (idx == 255)
 		ctx->ctx->data_block = ctx->start;
 	else
-		ctx->ctx->data_block = U16(ctx->ctx->data_table + 4 + 2 * idx);
+		ctx->ctx->data_block = get_u16(ctx->ctx->bios,
+					       ctx->ctx->data_table + 4 + 2 * idx);
 	SDEBUG("   base: 0x%04X\n", ctx->ctx->data_block);
 }
 
 static void atom_op_setfbbase(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	SDEBUG("   fb_base: ");
 	ctx->ctx->fb_base = atom_get_src(ctx, attr, ptr);
 }
@@ -891,7 +892,7 @@ static void atom_op_setport(atom_exec_context *ctx, int *ptr, int arg)
 	int port;
 	switch (arg) {
 	case ATOM_PORT_ATI:
-		port = U16(*ptr);
+		port = get_u16(ctx->ctx->bios, *ptr);
 		if (port < ATOM_IO_NAMES_CNT)
 			SDEBUG("   port: %d (%s)\n", port, atom_io_names[port]);
 		else
@@ -915,14 +916,14 @@ static void atom_op_setport(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_setregblock(atom_exec_context *ctx, int *ptr, int arg)
 {
-	ctx->ctx->reg_block = U16(*ptr);
+	ctx->ctx->reg_block = get_u16(ctx->ctx->bios, *ptr);
 	(*ptr) += 2;
 	SDEBUG("   base: 0x%04X\n", ctx->ctx->reg_block);
 }
 
 static void atom_op_shift_left(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++), shift;
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++), shift;
 	uint32_t saved, dst;
 	int dptr = *ptr;
 	attr &= 0x38;
@@ -938,7 +939,7 @@ static void atom_op_shift_left(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_shift_right(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++), shift;
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++), shift;
 	uint32_t saved, dst;
 	int dptr = *ptr;
 	attr &= 0x38;
@@ -954,7 +955,7 @@ static void atom_op_shift_right(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_shl(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++), shift;
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++), shift;
 	uint32_t saved, dst;
 	int dptr = *ptr;
 	uint32_t dst_align = atom_dst_to_src[(attr >> 3) & 7][(attr >> 6) & 3];
@@ -973,7 +974,7 @@ static void atom_op_shl(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_shr(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++), shift;
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++), shift;
 	uint32_t saved, dst;
 	int dptr = *ptr;
 	uint32_t dst_align = atom_dst_to_src[(attr >> 3) & 7][(attr >> 6) & 3];
@@ -992,7 +993,7 @@ static void atom_op_shr(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_sub(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src, saved;
 	int dptr = *ptr;
 	SDEBUG("   dst: ");
@@ -1006,18 +1007,18 @@ static void atom_op_sub(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_switch(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t src, val, target;
 	SDEBUG("   switch: ");
 	src = atom_get_src(ctx, attr, ptr);
-	while (U16(*ptr) != ATOM_CASE_END)
-		if (U8(*ptr) == ATOM_CASE_MAGIC) {
+	while (get_u16(ctx->ctx->bios, *ptr) != ATOM_CASE_END)
+		if (get_u8(ctx->ctx->bios, *ptr) == ATOM_CASE_MAGIC) {
 			(*ptr)++;
 			SDEBUG("   case: ");
 			val =
 			    atom_get_src(ctx, (attr & 0x38) | ATOM_ARG_IMM,
 					 ptr);
-			target = U16(*ptr);
+			target = get_u16(ctx->ctx->bios, *ptr);
 			if (val == src) {
 				SDEBUG("   target: %04X\n", target);
 				*ptr = ctx->start + target;
@@ -1033,7 +1034,7 @@ static void atom_op_switch(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_test(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src;
 	SDEBUG("   src1: ");
 	dst = atom_get_dst(ctx, arg, attr, ptr, NULL, 1);
@@ -1045,7 +1046,7 @@ static void atom_op_test(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_xor(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src, saved;
 	int dptr = *ptr;
 	SDEBUG("   dst: ");
@@ -1059,13 +1060,13 @@ static void atom_op_xor(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_debug(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t val = U8((*ptr)++);
+	uint8_t val = get_u8(ctx->ctx->bios, (*ptr)++);
 	SDEBUG("DEBUG output: 0x%02X\n", val);
 }
 
 static void atom_op_processds(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint16_t val = U16(*ptr);
+	uint16_t val = get_u16(ctx->ctx->bios, *ptr);
 	(*ptr) += val + 2;
 	SDEBUG("PROCESSDS output: 0x%02X\n", val);
 }
@@ -1206,7 +1207,7 @@ static struct {
 
 static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index, uint32_t *params)
 {
-	int base = CU16(ctx->cmd_table + 4 + 2 * index);
+	int base = get_u16(ctx->bios, ctx->cmd_table + 4 + 2 * index);
 	int len, ws, ps, ptr;
 	unsigned char op;
 	atom_exec_context ectx;
@@ -1215,9 +1216,9 @@ static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index,
 	if (!base)
 		return -EINVAL;
 
-	len = CU16(base + ATOM_CT_SIZE_PTR);
-	ws = CU8(base + ATOM_CT_WS_PTR);
-	ps = CU8(base + ATOM_CT_PS_PTR) & ATOM_CT_PS_MASK;
+	len = get_u16(ctx->bios, base + ATOM_CT_SIZE_PTR);
+	ws = get_u8(ctx->bios, base + ATOM_CT_WS_PTR);
+	ps = get_u8(ctx->bios, base + ATOM_CT_PS_PTR) & ATOM_CT_PS_MASK;
 	ptr = base + ATOM_CT_CODE_PTR;
 
 	SDEBUG(">> execute %04X (len %d, WS %d, PS %d)\n", base, len, ws, ps);
@@ -1235,7 +1236,7 @@ static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index,
 
 	debug_depth++;
 	while (1) {
-		op = CU8(ptr++);
+		op = get_u8(ctx->bios, ptr++);
 		if (op < ATOM_OP_NAMES_CNT)
 			SDEBUG("%s @ 0x%04X\n", atom_op_names[op], ptr - 1);
 		else
@@ -1293,11 +1294,11 @@ static void atom_index_iio(struct atom_context *ctx, int base)
 	ctx->iio = kzalloc(2 * 256, GFP_KERNEL);
 	if (!ctx->iio)
 		return;
-	while (CU8(base) == ATOM_IIO_START) {
-		ctx->iio[CU8(base + 1)] = base + 2;
+	while (get_u8(ctx->bios, base) == ATOM_IIO_START) {
+		ctx->iio[get_u8(ctx->bios, base + 1)] = base + 2;
 		base += 2;
-		while (CU8(base) != ATOM_IIO_END)
-			base += atom_iio_len[CU8(base)];
+		while (get_u8(ctx->bios, base) != ATOM_IIO_END)
+			base += atom_iio_len[get_u8(ctx->bios, base)];
 		base += 3;
 	}
 }
@@ -1472,7 +1473,7 @@ struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bios)
 	ctx->card = card;
 	ctx->bios = bios;
 
-	if (CU16(0) != ATOM_BIOS_MAGIC) {
+	if (get_u16(ctx->bios, 0) != ATOM_BIOS_MAGIC) {
 		pr_info("Invalid BIOS magic\n");
 		kfree(ctx);
 		return NULL;
@@ -1485,7 +1486,7 @@ struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bios)
 		return NULL;
 	}
 
-	base = CU16(ATOM_ROM_TABLE_PTR);
+	base = get_u16(ctx->bios, ATOM_ROM_TABLE_PTR);
 	if (strncmp
 	    (CSTR(base + ATOM_ROM_MAGIC_PTR), ATOM_ROM_MAGIC,
 	     strlen(ATOM_ROM_MAGIC))) {
@@ -1494,15 +1495,16 @@ struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bios)
 		return NULL;
 	}
 
-	ctx->cmd_table = CU16(base + ATOM_ROM_CMD_PTR);
-	ctx->data_table = CU16(base + ATOM_ROM_DATA_PTR);
-	atom_index_iio(ctx, CU16(ctx->data_table + ATOM_DATA_IIO_PTR) + 4);
+	ctx->cmd_table = get_u16(ctx->bios, base + ATOM_ROM_CMD_PTR);
+	ctx->data_table = get_u16(ctx->bios, base + ATOM_ROM_DATA_PTR);
+	atom_index_iio(ctx,
+		       get_u16(ctx->bios, ctx->data_table + ATOM_DATA_IIO_PTR) + 4);
 	if (!ctx->iio) {
 		amdgpu_atom_destroy(ctx);
 		return NULL;
 	}
 
-	idx = CU16(ATOM_ROM_PART_NUMBER_PTR);
+	idx = get_u16(ctx->bios, ATOM_ROM_PART_NUMBER_PTR);
 	if (idx == 0)
 		idx = 0x80;
 
@@ -1533,18 +1535,18 @@ struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bios)
 
 int amdgpu_atom_asic_init(struct atom_context *ctx)
 {
-	int hwi = CU16(ctx->data_table + ATOM_DATA_FWI_PTR);
+	int hwi = get_u16(ctx->bios, ctx->data_table + ATOM_DATA_FWI_PTR);
 	uint32_t ps[16];
 	int ret;
 
 	memset(ps, 0, 64);
 
-	ps[0] = cpu_to_le32(CU32(hwi + ATOM_FWI_DEFSCLK_PTR));
-	ps[1] = cpu_to_le32(CU32(hwi + ATOM_FWI_DEFMCLK_PTR));
+	ps[0] = cpu_to_le32(get_u32(ctx->bios, hwi + ATOM_FWI_DEFSCLK_PTR));
+	ps[1] = cpu_to_le32(get_u32(ctx->bios, hwi + ATOM_FWI_DEFMCLK_PTR));
 	if (!ps[0] || !ps[1])
 		return 1;
 
-	if (!CU16(ctx->cmd_table + 4 + 2 * ATOM_CMD_INIT))
+	if (!get_u16(ctx->bios, ctx->cmd_table + 4 + 2 * ATOM_CMD_INIT))
 		return 1;
 	ret = amdgpu_atom_execute_table(ctx, ATOM_CMD_INIT, ps);
 	if (ret)
@@ -1566,18 +1568,18 @@ bool amdgpu_atom_parse_data_header(struct atom_context *ctx, int index,
 			    uint16_t *data_start)
 {
 	int offset = index * 2 + 4;
-	int idx = CU16(ctx->data_table + offset);
+	int idx = get_u16(ctx->bios, ctx->data_table + offset);
 	u16 *mdt = (u16 *)(ctx->bios + ctx->data_table + 4);
 
 	if (!mdt[index])
 		return false;
 
 	if (size)
-		*size = CU16(idx);
+		*size = get_u16(ctx->bios, idx);
 	if (frev)
-		*frev = CU8(idx + 2);
+		*frev = get_u8(ctx->bios, idx + 2);
 	if (crev)
-		*crev = CU8(idx + 3);
+		*crev = get_u8(ctx->bios, idx + 3);
 	*data_start = idx;
 	return true;
 }
@@ -1586,16 +1588,16 @@ bool amdgpu_atom_parse_cmd_header(struct atom_context *ctx, int index, uint8_t *
 			   uint8_t *crev)
 {
 	int offset = index * 2 + 4;
-	int idx = CU16(ctx->cmd_table + offset);
+	int idx = get_u16(ctx->bios, ctx->cmd_table + offset);
 	u16 *mct = (u16 *)(ctx->bios + ctx->cmd_table + 4);
 
 	if (!mct[index])
 		return false;
 
 	if (frev)
-		*frev = CU8(idx + 2);
+		*frev = get_u8(ctx->bios, idx + 2);
 	if (crev)
-		*crev = CU8(idx + 3);
+		*crev = get_u8(ctx->bios, idx + 3);
 	return true;
 }
 
diff --git a/drivers/gpu/drm/amd/include/atom-bits.h b/drivers/gpu/drm/amd/include/atom-bits.h
index e8fae5c77514..28c196a91221 100644
--- a/drivers/gpu/drm/amd/include/atom-bits.h
+++ b/drivers/gpu/drm/amd/include/atom-bits.h
@@ -29,20 +29,17 @@ static inline uint8_t get_u8(void *bios, int ptr)
 {
     return ((unsigned char *)bios)[ptr];
 }
-#define U8(ptr) get_u8(ctx->ctx->bios, (ptr))
-#define CU8(ptr) get_u8(ctx->bios, (ptr))
+
 static inline uint16_t get_u16(void *bios, int ptr)
 {
     return get_u8(bios ,ptr)|(((uint16_t)get_u8(bios, ptr+1))<<8);
 }
-#define U16(ptr) get_u16(ctx->ctx->bios, (ptr))
-#define CU16(ptr) get_u16(ctx->bios, (ptr))
+
 static inline uint32_t get_u32(void *bios, int ptr)
 {
     return get_u16(bios, ptr)|(((uint32_t)get_u16(bios, ptr+2))<<16);
 }
-#define U32(ptr) get_u32(ctx->ctx->bios, (ptr))
-#define CU32(ptr) get_u32(ctx->bios, (ptr))
+
 #define CSTR(ptr) (((char *)(ctx->bios))+(ptr))
 
 #endif
diff --git a/drivers/gpu/drm/radeon/atom-bits.h b/drivers/gpu/drm/radeon/atom-bits.h
index e8fae5c77514..28c196a91221 100644
--- a/drivers/gpu/drm/radeon/atom-bits.h
+++ b/drivers/gpu/drm/radeon/atom-bits.h
@@ -29,20 +29,17 @@ static inline uint8_t get_u8(void *bios, int ptr)
 {
     return ((unsigned char *)bios)[ptr];
 }
-#define U8(ptr) get_u8(ctx->ctx->bios, (ptr))
-#define CU8(ptr) get_u8(ctx->bios, (ptr))
+
 static inline uint16_t get_u16(void *bios, int ptr)
 {
     return get_u8(bios ,ptr)|(((uint16_t)get_u8(bios, ptr+1))<<8);
 }
-#define U16(ptr) get_u16(ctx->ctx->bios, (ptr))
-#define CU16(ptr) get_u16(ctx->bios, (ptr))
+
 static inline uint32_t get_u32(void *bios, int ptr)
 {
     return get_u16(bios, ptr)|(((uint32_t)get_u16(bios, ptr+2))<<16);
 }
-#define U32(ptr) get_u32(ctx->ctx->bios, (ptr))
-#define CU32(ptr) get_u32(ctx->bios, (ptr))
+
 #define CSTR(ptr) (((char *)(ctx->bios))+(ptr))
 
 #endif
diff --git a/drivers/gpu/drm/radeon/atom.c b/drivers/gpu/drm/radeon/atom.c
index c1bbfbe28bda..1c54d52c4cb0 100644
--- a/drivers/gpu/drm/radeon/atom.c
+++ b/drivers/gpu/drm/radeon/atom.c
@@ -112,64 +112,65 @@ static uint32_t atom_iio_execute(struct atom_context *ctx, int base,
 	uint32_t temp = 0xCDCDCDCD;
 
 	while (1)
-		switch (CU8(base)) {
+		switch (get_u8(ctx->bios, base)) {
 		case ATOM_IIO_NOP:
 			base++;
 			break;
 		case ATOM_IIO_READ:
-			temp = ctx->card->ioreg_read(ctx->card, CU16(base + 1));
+			temp = ctx->card->ioreg_read(ctx->card,
+						     get_u16(ctx->bios, base + 1));
 			base += 3;
 			break;
 		case ATOM_IIO_WRITE:
 			if (rdev->family == CHIP_RV515)
-				(void)ctx->card->ioreg_read(ctx->card, CU16(base + 1));
-			ctx->card->ioreg_write(ctx->card, CU16(base + 1), temp);
+				(void)ctx->card->ioreg_read(ctx->card,
+						            get_u16(ctx->bios, base + 1));
+			ctx->card->ioreg_write(ctx->card,
+				               get_u16(ctx->bios, base + 1),
+				               temp);
 			base += 3;
 			break;
 		case ATOM_IIO_CLEAR:
 			temp &=
-			    ~((0xFFFFFFFF >> (32 - CU8(base + 1))) <<
-			      CU8(base + 2));
+			    ~((0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1))) <<
+			      get_u8(ctx->bios, base + 2));
 			base += 3;
 			break;
 		case ATOM_IIO_SET:
 			temp |=
-			    (0xFFFFFFFF >> (32 - CU8(base + 1))) << CU8(base +
-									2);
+			    (0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1))) << get_u8(ctx->bios,
+										         base + 2);
 			base += 3;
 			break;
 		case ATOM_IIO_MOVE_INDEX:
 			temp &=
-			    ~((0xFFFFFFFF >> (32 - CU8(base + 1))) <<
-			      CU8(base + 3));
+			    ~((0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1))) <<
+			      get_u8(ctx->bios, base + 3));
 			temp |=
-			    ((index >> CU8(base + 2)) &
-			     (0xFFFFFFFF >> (32 - CU8(base + 1)))) << CU8(base +
-									  3);
+			    ((index >> get_u8(ctx->bios, base + 2)) &
+			     (0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1)))) << get_u8(ctx->bios,
+										           base + 3);
 			base += 4;
 			break;
 		case ATOM_IIO_MOVE_DATA:
 			temp &=
-			    ~((0xFFFFFFFF >> (32 - CU8(base + 1))) <<
-			      CU8(base + 3));
+			    ~((0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1))) <<
+			      get_u8(ctx->bios, base + 3));
 			temp |=
-			    ((data >> CU8(base + 2)) &
-			     (0xFFFFFFFF >> (32 - CU8(base + 1)))) << CU8(base +
-									  3);
+			    ((data >> get_u8(ctx->bios, base + 2)) &
+			     (0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1)))) << get_u8(ctx->bios,
+										           base + 3);
 			base += 4;
 			break;
 		case ATOM_IIO_MOVE_ATTR:
 			temp &=
-			    ~((0xFFFFFFFF >> (32 - CU8(base + 1))) <<
-			      CU8(base + 3));
+			    ~((0xFFFFFFFF >> (32 - get_u8(ctx->bios, base + 1))) <<
+			      get_u8(ctx->bios, base + 3));
 			temp |=
 			    ((ctx->
-			      io_attr >> CU8(base + 2)) & (0xFFFFFFFF >> (32 -
-									  CU8
-									  (base
-									   +
-									   1))))
-			    << CU8(base + 3);
+			      io_attr >> get_u8(ctx->bios, base + 2)) & (0xFFFFFFFF >> (32 -
+										        get_u8(ctx->bios, base + 1))))
+			    << get_u8(ctx->bios, base + 3);
 			base += 4;
 			break;
 		case ATOM_IIO_END:
@@ -189,7 +190,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 	align = (attr >> 3) & 7;
 	switch (arg) {
 	case ATOM_ARG_REG:
-		idx = U16(*ptr);
+		idx = get_u16(ctx->ctx->bios, *ptr);
 		(*ptr) += 2;
 		if (print)
 			DEBUG("REG[0x%04X]", idx);
@@ -221,7 +222,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 		}
 		break;
 	case ATOM_ARG_PS:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		/* get_unaligned_le32 avoids unaligned accesses from atombios
 		 * tables, noticed on a DEC Alpha. */
@@ -230,7 +231,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 			DEBUG("PS[0x%02X,0x%04X]", idx, val);
 		break;
 	case ATOM_ARG_WS:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		if (print)
 			DEBUG("WS[0x%02X]", idx);
@@ -267,7 +268,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 		}
 		break;
 	case ATOM_ARG_ID:
-		idx = U16(*ptr);
+		idx = get_u16(ctx->ctx->bios, *ptr);
 		(*ptr) += 2;
 		if (print) {
 			if (gctx->data_block)
@@ -275,10 +276,10 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 			else
 				DEBUG("ID[0x%04X]", idx);
 		}
-		val = U32(idx + gctx->data_block);
+		val = get_u32(ctx->ctx->bios, idx + gctx->data_block);
 		break;
 	case ATOM_ARG_FB:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		if ((gctx->fb_base + (idx * 4)) > gctx->scratch_size_bytes) {
 			DRM_ERROR("ATOM: fb read beyond scratch region: %d vs. %d\n",
@@ -292,7 +293,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 	case ATOM_ARG_IMM:
 		switch (align) {
 		case ATOM_SRC_DWORD:
-			val = U32(*ptr);
+			val = get_u32(ctx->ctx->bios, *ptr);
 			(*ptr) += 4;
 			if (print)
 				DEBUG("IMM 0x%08X\n", val);
@@ -300,7 +301,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 		case ATOM_SRC_WORD0:
 		case ATOM_SRC_WORD8:
 		case ATOM_SRC_WORD16:
-			val = U16(*ptr);
+			val = get_u16(ctx->ctx->bios, *ptr);
 			(*ptr) += 2;
 			if (print)
 				DEBUG("IMM 0x%04X\n", val);
@@ -309,7 +310,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 		case ATOM_SRC_BYTE8:
 		case ATOM_SRC_BYTE16:
 		case ATOM_SRC_BYTE24:
-			val = U8(*ptr);
+			val = get_u8(ctx->ctx->bios, *ptr);
 			(*ptr)++;
 			if (print)
 				DEBUG("IMM 0x%02X\n", val);
@@ -317,14 +318,14 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 		}
 		return 0;
 	case ATOM_ARG_PLL:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		if (print)
 			DEBUG("PLL[0x%02X]", idx);
 		val = gctx->card->pll_read(gctx->card, idx);
 		break;
 	case ATOM_ARG_MC:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		if (print)
 			DEBUG("MC[0x%02X]", idx);
@@ -412,20 +413,20 @@ static uint32_t atom_get_src_direct(atom_exec_context *ctx, uint8_t align, int *
 
 	switch (align) {
 	case ATOM_SRC_DWORD:
-		val = U32(*ptr);
+		val = get_u32(ctx->ctx->bios, *ptr);
 		(*ptr) += 4;
 		break;
 	case ATOM_SRC_WORD0:
 	case ATOM_SRC_WORD8:
 	case ATOM_SRC_WORD16:
-		val = U16(*ptr);
+		val = get_u16(ctx->ctx->bios, *ptr);
 		(*ptr) += 2;
 		break;
 	case ATOM_SRC_BYTE0:
 	case ATOM_SRC_BYTE8:
 	case ATOM_SRC_BYTE16:
 	case ATOM_SRC_BYTE24:
-		val = U8(*ptr);
+		val = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		break;
 	}
@@ -462,7 +463,7 @@ static void atom_put_dst(atom_exec_context *ctx, int arg, uint8_t attr,
 	val |= saved;
 	switch (arg) {
 	case ATOM_ARG_REG:
-		idx = U16(*ptr);
+		idx = get_u16(ctx->ctx->bios, *ptr);
 		(*ptr) += 2;
 		DEBUG("REG[0x%04X]", idx);
 		idx += gctx->reg_block;
@@ -495,13 +496,13 @@ static void atom_put_dst(atom_exec_context *ctx, int arg, uint8_t attr,
 		}
 		break;
 	case ATOM_ARG_PS:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		DEBUG("PS[0x%02X]", idx);
 		ctx->ps[idx] = cpu_to_le32(val);
 		break;
 	case ATOM_ARG_WS:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		DEBUG("WS[0x%02X]", idx);
 		switch (idx) {
@@ -534,7 +535,7 @@ static void atom_put_dst(atom_exec_context *ctx, int arg, uint8_t attr,
 		}
 		break;
 	case ATOM_ARG_FB:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		if ((gctx->fb_base + (idx * 4)) > gctx->scratch_size_bytes) {
 			DRM_ERROR("ATOM: fb write beyond scratch region: %d vs. %d\n",
@@ -544,13 +545,13 @@ static void atom_put_dst(atom_exec_context *ctx, int arg, uint8_t attr,
 		DEBUG("FB[0x%02X]", idx);
 		break;
 	case ATOM_ARG_PLL:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		DEBUG("PLL[0x%02X]", idx);
 		gctx->card->pll_write(gctx->card, idx, val);
 		break;
 	case ATOM_ARG_MC:
-		idx = U8(*ptr);
+		idx = get_u8(ctx->ctx->bios, *ptr);
 		(*ptr)++;
 		DEBUG("MC[0x%02X]", idx);
 		gctx->card->mc_write(gctx->card, idx, val);
@@ -586,7 +587,7 @@ static void atom_put_dst(atom_exec_context *ctx, int arg, uint8_t attr,
 
 static void atom_op_add(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src, saved;
 	int dptr = *ptr;
 	SDEBUG("   dst: ");
@@ -600,7 +601,7 @@ static void atom_op_add(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_and(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src, saved;
 	int dptr = *ptr;
 	SDEBUG("   dst: ");
@@ -619,14 +620,14 @@ static void atom_op_beep(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_calltable(atom_exec_context *ctx, int *ptr, int arg)
 {
-	int idx = U8((*ptr)++);
+	int idx = get_u8(ctx->ctx->bios, (*ptr)++);
 	int r = 0;
 
 	if (idx < ATOM_TABLE_NAMES_CNT)
 		SDEBUG("   table: %d (%s)\n", idx, atom_table_names[idx]);
 	else
 		SDEBUG("   table: %d\n", idx);
-	if (U16(ctx->ctx->cmd_table + 4 + 2 * idx))
+	if (get_u16(ctx->ctx->bios, ctx->ctx->cmd_table + 4 + 2 * idx))
 		r = atom_execute_table_locked(ctx->ctx, idx, ctx->ps + ctx->ps_shift);
 	if (r) {
 		ctx->abort = true;
@@ -635,7 +636,7 @@ static void atom_op_calltable(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_clear(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t saved;
 	int dptr = *ptr;
 	attr &= 0x38;
@@ -647,7 +648,7 @@ static void atom_op_clear(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_compare(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src;
 	SDEBUG("   src1: ");
 	dst = atom_get_dst(ctx, arg, attr, ptr, NULL, 1);
@@ -661,7 +662,7 @@ static void atom_op_compare(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_delay(atom_exec_context *ctx, int *ptr, int arg)
 {
-	unsigned count = U8((*ptr)++);
+	unsigned count = get_u8(ctx->ctx->bios, (*ptr)++);
 	SDEBUG("   count: %d\n", count);
 	if (arg == ATOM_UNIT_MICROSEC)
 		udelay(count);
@@ -673,7 +674,7 @@ static void atom_op_delay(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_div(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src;
 	SDEBUG("   src1: ");
 	dst = atom_get_dst(ctx, arg, attr, ptr, NULL, 1);
@@ -695,7 +696,7 @@ static void atom_op_eot(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_jump(atom_exec_context *ctx, int *ptr, int arg)
 {
-	int execute = 0, target = U16(*ptr);
+	int execute = 0, target = get_u16(ctx->ctx->bios, *ptr);
 	unsigned long cjiffies;
 
 	(*ptr) += 2;
@@ -748,7 +749,7 @@ static void atom_op_jump(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_mask(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, mask, src, saved;
 	int dptr = *ptr;
 	SDEBUG("   dst: ");
@@ -765,7 +766,7 @@ static void atom_op_mask(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_move(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t src, saved;
 	int dptr = *ptr;
 	if (((attr >> 3) & 7) != ATOM_SRC_DWORD)
@@ -782,7 +783,7 @@ static void atom_op_move(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_mul(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src;
 	SDEBUG("   src1: ");
 	dst = atom_get_dst(ctx, arg, attr, ptr, NULL, 1);
@@ -798,7 +799,7 @@ static void atom_op_nop(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_or(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src, saved;
 	int dptr = *ptr;
 	SDEBUG("   dst: ");
@@ -812,7 +813,7 @@ static void atom_op_or(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_postcard(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t val = U8((*ptr)++);
+	uint8_t val = get_u8(ctx->ctx->bios, (*ptr)++);
 	SDEBUG("POST card output: 0x%02X\n", val);
 }
 
@@ -833,7 +834,7 @@ static void atom_op_savereg(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_setdatablock(atom_exec_context *ctx, int *ptr, int arg)
 {
-	int idx = U8(*ptr);
+	int idx = get_u8(ctx->ctx->bios, *ptr);
 	(*ptr)++;
 	SDEBUG("   block: %d\n", idx);
 	if (!idx)
@@ -841,13 +842,14 @@ static void atom_op_setdatablock(atom_exec_context *ctx, int *ptr, int arg)
 	else if (idx == 255)
 		ctx->ctx->data_block = ctx->start;
 	else
-		ctx->ctx->data_block = U16(ctx->ctx->data_table + 4 + 2 * idx);
+		ctx->ctx->data_block = get_u16(ctx->ctx->bios,
+					       ctx->ctx->data_table + 4 + 2 * idx);
 	SDEBUG("   base: 0x%04X\n", ctx->ctx->data_block);
 }
 
 static void atom_op_setfbbase(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	SDEBUG("   fb_base: ");
 	ctx->ctx->fb_base = atom_get_src(ctx, attr, ptr);
 }
@@ -857,7 +859,7 @@ static void atom_op_setport(atom_exec_context *ctx, int *ptr, int arg)
 	int port;
 	switch (arg) {
 	case ATOM_PORT_ATI:
-		port = U16(*ptr);
+		port = get_u16(ctx->ctx->bios, *ptr);
 		if (port < ATOM_IO_NAMES_CNT)
 			SDEBUG("   port: %d (%s)\n", port, atom_io_names[port]);
 		else
@@ -881,14 +883,14 @@ static void atom_op_setport(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_setregblock(atom_exec_context *ctx, int *ptr, int arg)
 {
-	ctx->ctx->reg_block = U16(*ptr);
+	ctx->ctx->reg_block = get_u16(ctx->ctx->bios, *ptr);
 	(*ptr) += 2;
 	SDEBUG("   base: 0x%04X\n", ctx->ctx->reg_block);
 }
 
 static void atom_op_shift_left(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++), shift;
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++), shift;
 	uint32_t saved, dst;
 	int dptr = *ptr;
 	attr &= 0x38;
@@ -904,7 +906,7 @@ static void atom_op_shift_left(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_shift_right(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++), shift;
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++), shift;
 	uint32_t saved, dst;
 	int dptr = *ptr;
 	attr &= 0x38;
@@ -920,7 +922,7 @@ static void atom_op_shift_right(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_shl(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++), shift;
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++), shift;
 	uint32_t saved, dst;
 	int dptr = *ptr;
 	uint32_t dst_align = atom_dst_to_src[(attr >> 3) & 7][(attr >> 6) & 3];
@@ -939,7 +941,7 @@ static void atom_op_shl(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_shr(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++), shift;
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++), shift;
 	uint32_t saved, dst;
 	int dptr = *ptr;
 	uint32_t dst_align = atom_dst_to_src[(attr >> 3) & 7][(attr >> 6) & 3];
@@ -958,7 +960,7 @@ static void atom_op_shr(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_sub(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src, saved;
 	int dptr = *ptr;
 	SDEBUG("   dst: ");
@@ -972,18 +974,18 @@ static void atom_op_sub(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_switch(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t src, val, target;
 	SDEBUG("   switch: ");
 	src = atom_get_src(ctx, attr, ptr);
-	while (U16(*ptr) != ATOM_CASE_END)
-		if (U8(*ptr) == ATOM_CASE_MAGIC) {
+	while (get_u16(ctx->ctx->bios, *ptr) != ATOM_CASE_END)
+		if (get_u8(ctx->ctx->bios, *ptr) == ATOM_CASE_MAGIC) {
 			(*ptr)++;
 			SDEBUG("   case: ");
 			val =
 			    atom_get_src(ctx, (attr & 0x38) | ATOM_ARG_IMM,
 					 ptr);
-			target = U16(*ptr);
+			target = get_u16(ctx->ctx->bios, *ptr);
 			if (val == src) {
 				SDEBUG("   target: %04X\n", target);
 				*ptr = ctx->start + target;
@@ -999,7 +1001,7 @@ static void atom_op_switch(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_test(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src;
 	SDEBUG("   src1: ");
 	dst = atom_get_dst(ctx, arg, attr, ptr, NULL, 1);
@@ -1011,7 +1013,7 @@ static void atom_op_test(atom_exec_context *ctx, int *ptr, int arg)
 
 static void atom_op_xor(atom_exec_context *ctx, int *ptr, int arg)
 {
-	uint8_t attr = U8((*ptr)++);
+	uint8_t attr = get_u8(ctx->ctx->bios, (*ptr)++);
 	uint32_t dst, src, saved;
 	int dptr = *ptr;
 	SDEBUG("   dst: ");
@@ -1158,7 +1160,7 @@ atom_op_debug, 0},};
 
 static int atom_execute_table_locked(struct atom_context *ctx, int index, uint32_t * params)
 {
-	int base = CU16(ctx->cmd_table + 4 + 2 * index);
+	int base = get_u16(ctx->bios, ctx->cmd_table + 4 + 2 * index);
 	int len, ws, ps, ptr;
 	unsigned char op;
 	atom_exec_context ectx;
@@ -1167,9 +1169,9 @@ static int atom_execute_table_locked(struct atom_context *ctx, int index, uint32
 	if (!base)
 		return -EINVAL;
 
-	len = CU16(base + ATOM_CT_SIZE_PTR);
-	ws = CU8(base + ATOM_CT_WS_PTR);
-	ps = CU8(base + ATOM_CT_PS_PTR) & ATOM_CT_PS_MASK;
+	len = get_u16(ctx->bios, base + ATOM_CT_SIZE_PTR);
+	ws = get_u8(ctx->bios, base + ATOM_CT_WS_PTR);
+	ps = get_u8(ctx->bios, base + ATOM_CT_PS_PTR) & ATOM_CT_PS_MASK;
 	ptr = base + ATOM_CT_CODE_PTR;
 
 	SDEBUG(">> execute %04X (len %d, WS %d, PS %d)\n", base, len, ws, ps);
@@ -1187,7 +1189,7 @@ static int atom_execute_table_locked(struct atom_context *ctx, int index, uint32
 
 	debug_depth++;
 	while (1) {
-		op = CU8(ptr++);
+		op = get_u8(ctx->bios, ptr++);
 		if (op < ATOM_OP_NAMES_CNT)
 			SDEBUG("%s @ 0x%04X\n", atom_op_names[op], ptr - 1);
 		else
@@ -1253,11 +1255,11 @@ static void atom_index_iio(struct atom_context *ctx, int base)
 	ctx->iio = kzalloc(2 * 256, GFP_KERNEL);
 	if (!ctx->iio)
 		return;
-	while (CU8(base) == ATOM_IIO_START) {
-		ctx->iio[CU8(base + 1)] = base + 2;
+	while (get_u8(ctx->bios, base) == ATOM_IIO_START) {
+		ctx->iio[get_u8(ctx->bios, base + 1)] = base + 2;
 		base += 2;
-		while (CU8(base) != ATOM_IIO_END)
-			base += atom_iio_len[CU8(base)];
+		while (get_u8(ctx->bios, base) != ATOM_IIO_END)
+			base += atom_iio_len[get_u8(ctx->bios, base)];
 		base += 3;
 	}
 }
@@ -1277,7 +1279,7 @@ struct atom_context *atom_parse(struct card_info *card, void *bios)
 	ctx->card = card;
 	ctx->bios = bios;
 
-	if (CU16(0) != ATOM_BIOS_MAGIC) {
+	if (get_u16(ctx->bios, 0) != ATOM_BIOS_MAGIC) {
 		pr_info("Invalid BIOS magic\n");
 		kfree(ctx);
 		return NULL;
@@ -1290,7 +1292,7 @@ struct atom_context *atom_parse(struct card_info *card, void *bios)
 		return NULL;
 	}
 
-	base = CU16(ATOM_ROM_TABLE_PTR);
+	base = get_u16(ctx->bios, ATOM_ROM_TABLE_PTR);
 	if (strncmp
 	    (CSTR(base + ATOM_ROM_MAGIC_PTR), ATOM_ROM_MAGIC,
 	     strlen(ATOM_ROM_MAGIC))) {
@@ -1299,15 +1301,16 @@ struct atom_context *atom_parse(struct card_info *card, void *bios)
 		return NULL;
 	}
 
-	ctx->cmd_table = CU16(base + ATOM_ROM_CMD_PTR);
-	ctx->data_table = CU16(base + ATOM_ROM_DATA_PTR);
-	atom_index_iio(ctx, CU16(ctx->data_table + ATOM_DATA_IIO_PTR) + 4);
+	ctx->cmd_table = get_u16(ctx->bios, base + ATOM_ROM_CMD_PTR);
+	ctx->data_table = get_u16(ctx->bios, base + ATOM_ROM_DATA_PTR);
+	atom_index_iio(ctx,
+		       get_u16(ctx->bios, ctx->data_table + ATOM_DATA_IIO_PTR) + 4);
 	if (!ctx->iio) {
 		atom_destroy(ctx);
 		return NULL;
 	}
 
-	str = CSTR(CU16(base + ATOM_ROM_MSG_PTR));
+	str = CSTR(get_u16(ctx->bios, base + ATOM_ROM_MSG_PTR));
 	while (*str && ((*str == '\n') || (*str == '\r')))
 		str++;
 	/* name string isn't always 0 terminated */
@@ -1326,18 +1329,18 @@ struct atom_context *atom_parse(struct card_info *card, void *bios)
 int atom_asic_init(struct atom_context *ctx)
 {
 	struct radeon_device *rdev = ctx->card->dev->dev_private;
-	int hwi = CU16(ctx->data_table + ATOM_DATA_FWI_PTR);
+	int hwi = get_u16(ctx->bios, ctx->data_table + ATOM_DATA_FWI_PTR);
 	uint32_t ps[16];
 	int ret;
 
 	memset(ps, 0, 64);
 
-	ps[0] = cpu_to_le32(CU32(hwi + ATOM_FWI_DEFSCLK_PTR));
-	ps[1] = cpu_to_le32(CU32(hwi + ATOM_FWI_DEFMCLK_PTR));
+	ps[0] = cpu_to_le32(get_u32(ctx->bios, hwi + ATOM_FWI_DEFSCLK_PTR));
+	ps[1] = cpu_to_le32(get_u32(ctx->bios, hwi + ATOM_FWI_DEFMCLK_PTR));
 	if (!ps[0] || !ps[1])
 		return 1;
 
-	if (!CU16(ctx->cmd_table + 4 + 2 * ATOM_CMD_INIT))
+	if (!get_u16(ctx->bios, ctx->cmd_table + 4 + 2 * ATOM_CMD_INIT))
 		return 1;
 	ret = atom_execute_table(ctx, ATOM_CMD_INIT, ps);
 	if (ret)
@@ -1346,7 +1349,7 @@ int atom_asic_init(struct atom_context *ctx)
 	memset(ps, 0, 64);
 
 	if (rdev->family < CHIP_R600) {
-		if (CU16(ctx->cmd_table + 4 + 2 * ATOM_CMD_SPDFANCNTL))
+		if (get_u16(ctx->bios, ctx->cmd_table + 4 + 2 * ATOM_CMD_SPDFANCNTL))
 			atom_execute_table(ctx, ATOM_CMD_SPDFANCNTL, ps);
 	}
 	return ret;
@@ -1363,18 +1366,18 @@ bool atom_parse_data_header(struct atom_context *ctx, int index,
 			    uint16_t * data_start)
 {
 	int offset = index * 2 + 4;
-	int idx = CU16(ctx->data_table + offset);
+	int idx = get_u16(ctx->bios, ctx->data_table + offset);
 	u16 *mdt = (u16 *)(ctx->bios + ctx->data_table + 4);
 
 	if (!mdt[index])
 		return false;
 
 	if (size)
-		*size = CU16(idx);
+		*size = get_u16(ctx->bios, idx);
 	if (frev)
-		*frev = CU8(idx + 2);
+		*frev = get_u8(ctx->bios, idx + 2);
 	if (crev)
-		*crev = CU8(idx + 3);
+		*crev = get_u8(ctx->bios, idx + 3);
 	*data_start = idx;
 	return true;
 }
@@ -1383,16 +1386,16 @@ bool atom_parse_cmd_header(struct atom_context *ctx, int index, uint8_t * frev,
 			   uint8_t * crev)
 {
 	int offset = index * 2 + 4;
-	int idx = CU16(ctx->cmd_table + offset);
+	int idx = get_u16(ctx->bios, ctx->cmd_table + offset);
 	u16 *mct = (u16 *)(ctx->bios + ctx->cmd_table + 4);
 
 	if (!mct[index])
 		return false;
 
 	if (frev)
-		*frev = CU8(idx + 2);
+		*frev = get_u8(ctx->bios, idx + 2);
 	if (crev)
-		*crev = CU8(idx + 3);
+		*crev = get_u8(ctx->bios, idx + 3);
 	return true;
 }
 
-- 
2.40.1

