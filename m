Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0088667F7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA6510E5C9;
	Mon, 26 Feb 2024 02:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IVPblz7s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3437310E5C8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:11:55 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d2305589a2so38178581fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708913513; x=1709518313; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DInfZIP9I1ToMjy6QIMQmrdiM05SlZIZasIV0p58wH0=;
 b=IVPblz7syUtmb2TMO3xDCIGzbD/UEqvrgyUKCboCcgZvshFOdKjGrtQ1n40NvxcwMw
 JC7u/0+3D7RDtWWABfE9zED0YUlQJWOAnQQQ2wx1SwjfDxzlBA5z4/T1oIQ5KZlvVvjx
 14SLFurDGhbG+8mLVw2h09N+mSKVOwcp+l2bvvQ0W6xdzpm8bkZ89dLoWglIhTD9gULY
 r/pttVAa9JZ+Rkvxd9+LpCsRDBuPiltO3zzeKyjUQI4luLoWE6QOP7Egx0DSj+tQ9pbj
 AJUnZ4NrdAPMHojo1o8ehD24kL43JiHyLx7a7IcqM/B54MoWSZaXzO5ylV4FDCcAsFRr
 6A0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708913513; x=1709518313;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DInfZIP9I1ToMjy6QIMQmrdiM05SlZIZasIV0p58wH0=;
 b=wGi+hRH3LMw1BsFpIO8N5ElxoELEx6DqFri70VatNyg0FifQZHj9Mu4bX8OSLu5Cq5
 gqObVo90ovmNVrxNmA6vloSn4NczegezZ5ZqpDtRUjildR/sDSub2P4AiOznKIRJf6GL
 oQKVVCoFcYTa32ae+nESRHW+BjCG4K0kJk3cy6UqyfuIJbxCc7AYu93oKRn5b+aZHdIJ
 aLxAB98pRVVz18otjAUBxGyFP/fPeqrI4BOg6xXXjIzhCQ8B4WTbrL7d9kY5jRuAGWYu
 DRI1rJpdC62BzTGXZKyVBrCrsPSuBK0gR0bkcCtSBTSfPfT2wNaO6mx9MHER0kNPNB5H
 FIfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUynAU8fm0QUzDGiR/icuYRs1lhF6DbevtfoNkJwG3Lta/SSt9V2r1+qVt5DkhaW4UitbH71Oit1iN6NLozA2c0ZclygiqZ9xTOo6yOfoJI
X-Gm-Message-State: AOJu0YyfBskVzpJQF70sSBK/VgPVocNYaDBRPc5Xj0i+QsXLIUXJUZLG
 voaX8ZLVdbW3ujjC6Z8aumh1IF02PNCZPJAcv7O5MevGQTjqFSazdKMsQqBkfWE=
X-Google-Smtp-Source: AGHT+IEsfNbOrP44KDDGxwL/hgrVqGvBXQF0ZYQSbz6uTs5jVn/0LbCuK7j7WwzmRVnzzO8figbbAA==
X-Received: by 2002:ac2:4909:0:b0:512:ce6b:5da8 with SMTP id
 n9-20020ac24909000000b00512ce6b5da8mr3047612lfi.42.1708913512664; 
 Sun, 25 Feb 2024 18:11:52 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:11:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:42 +0200
Subject: [PATCH RFC 06/12] drm/msm/headergen: import source files from
 freedreno/envytools
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-fd-xml-shipped-v1-6-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=101543;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=R8Eu2C2HKcbBxGe030EMfAa2TjgAaZXTHmvA2NVBU0s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/Nh6QI8LwfdYwtXvm6KGptusMiSz3YYXq0YO
 QS+0m8Q/dWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYQAKCRCLPIo+Aiko
 1QVSCACjgLPvWAgE516up3SWst51GlhsXg9KIYXMZifZ/wdPOvVrw4SOAPIdzvF0I08veLd2KC/
 xTSj41wSEHoG0hOKSmdVpwuByfAajUrHQ4Rxi2i8AXlDjTEsdjBqzkNJftgN5DySqpO3+P65smy
 4rYQ+Ukhx6RifNnuVp+PD0ShH5jqBgw2TmK+IN3KcOQo1T35nwd6yCGEz/NfSqTFoF2v8tS/+RZ
 +KN6hulN+/AQGGGqdo1SpF96N68FJH4dsED//uEX7KVa4JUMSKeiytiXyN4Q2DF5cYzKbEHlQye
 70aoRW2jzVVdJOkz6ZG27+s6ngrac+6LNaGdCk3yAtJ8StyB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Import headergen2 sources at the commit d88cafa3ac3e ("freedreno/decode:
try harder to not crash in disasm") from
https://gitlab.freedesktop.org/freedreno/envytools. This tool has been
used to generate drm/msm header files from the corresponding XML files.
This required committing changes to the Mesa3D project, then manually
generating and synchronizing resulting files. Instead import the hg2
tool to be later included into the build process.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/headergen2/aprintf.c      |   38 +
 drivers/gpu/drm/msm/headergen2/colors.c       |   61 ++
 drivers/gpu/drm/msm/headergen2/colors.h       |   49 +
 drivers/gpu/drm/msm/headergen2/headergen2.c   |  502 +++++++++
 drivers/gpu/drm/msm/headergen2/path.c         |   64 ++
 drivers/gpu/drm/msm/headergen2/rnn.c          | 1360 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/headergen2/rnn.h          |  243 +++++
 drivers/gpu/drm/msm/headergen2/rnndec.c       |  550 ++++++++++
 drivers/gpu/drm/msm/headergen2/rnndec.h       |   59 ++
 drivers/gpu/drm/msm/headergen2/util.h         |  115 +++
 drivers/gpu/drm/msm/headergen2/util/u_debug.h |   12 +
 11 files changed, 3053 insertions(+)

diff --git a/drivers/gpu/drm/msm/headergen2/aprintf.c b/drivers/gpu/drm/msm/headergen2/aprintf.c
new file mode 100644
index 000000000000..b3d924f59413
--- /dev/null
+++ b/drivers/gpu/drm/msm/headergen2/aprintf.c
@@ -0,0 +1,38 @@
+/*
+ * Copyright (C) 2009-2011 Marcin Kościelnicki <koriakin@0x04.net>
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "util.h"
+#include <stdarg.h>
+
+char *aprintf(const char *format, ...) {
+	va_list va;
+	va_start(va, format);
+	size_t sz = vsnprintf(0, 0, format, va);
+	va_end(va);
+	char *res = malloc(sz + 1);
+	va_start(va, format);
+	vsnprintf(res, sz + 1, format, va);
+	va_end(va);
+	return res;
+}
diff --git a/drivers/gpu/drm/msm/headergen2/colors.c b/drivers/gpu/drm/msm/headergen2/colors.c
new file mode 100644
index 000000000000..192c57dd18bb
--- /dev/null
+++ b/drivers/gpu/drm/msm/headergen2/colors.c
@@ -0,0 +1,61 @@
+/*
+ * Copyright (C) 2012 Marcin Kościelnicki <koriakin@0x04.net>
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "colors.h"
+
+const struct envy_colors envy_null_colors = {
+	.reset	= "",
+	.iname	= "",
+	.rname	= "",
+	.mod	= "",
+	.sym	= "",
+	.reg	= "",
+	.regsp	= "",
+	.num	= "",
+	.mem	= "",
+	.btarg	= "",
+	.ctarg	= "",
+	.bctarg	= "",
+	.eval	= "",
+	.comm	= "",
+	.err	= "",
+};
+
+const struct envy_colors envy_def_colors = {
+	.reset	= "\x1b[0m",
+	.iname	= "\x1b[0;32m",
+	.rname	= "\x1b[0;32m",
+	.mod	= "\x1b[0;36m",
+	.sym	= "\x1b[0;36m",
+	.reg	= "\x1b[0;31m",
+	.regsp	= "\x1b[0;35m",
+	.num	= "\x1b[0;33m",
+	.mem	= "\x1b[0;35m",
+	.btarg	= "\x1b[0;35m",
+	.ctarg	= "\x1b[0;1;37m",
+	.bctarg	= "\x1b[0;1;35m",
+	.eval	= "\x1b[0;35m",
+	.comm	= "\x1b[0;34m",
+	.err	= "\x1b[0;1;31m",
+};
diff --git a/drivers/gpu/drm/msm/headergen2/colors.h b/drivers/gpu/drm/msm/headergen2/colors.h
new file mode 100644
index 000000000000..67d929d5fadc
--- /dev/null
+++ b/drivers/gpu/drm/msm/headergen2/colors.h
@@ -0,0 +1,49 @@
+/*
+ * Copyright (C) 2012 Marcin Kościelnicki <koriakin@0x04.net>
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef COLORS_H
+#define COLORS_H
+
+struct envy_colors {
+	const char *reset;
+	const char *iname;	/* instruction name */
+	const char *rname;	/* register or bitfield name */
+	const char *mod;	/* instruction modifier */
+	const char *sym;	/* auxiliary char like { , + */
+	const char *reg;	/* ISA register */
+	const char *regsp;	/* special ISA register */
+	const char *num;	/* immediate number */
+	const char *mem;	/* memory reference */
+	const char *btarg;	/* branch target */
+	const char *ctarg;	/* call target */
+	const char *bctarg;	/* branch and call target */
+	const char *eval;	/* enum value */
+	const char *comm;	/* comment */
+	const char *err;	/* error */
+};
+
+extern const struct envy_colors envy_null_colors;
+extern const struct envy_colors envy_def_colors;
+
+#endif
diff --git a/drivers/gpu/drm/msm/headergen2/headergen2.c b/drivers/gpu/drm/msm/headergen2/headergen2.c
new file mode 100644
index 000000000000..d5a3eb7562ee
--- /dev/null
+++ b/drivers/gpu/drm/msm/headergen2/headergen2.c
@@ -0,0 +1,502 @@
+/*
+ * Copyright (C) 2013 Rob Clark <robdclark@gmail.com>
+ * Copyright (C) 2010-2011 Marcin Kościelnicki <koriakin@0x04.net>
+ * Copyright (C) 2010 Luca Barbieri <luca@luca-barbieri.com>
+ * Copyright (C) 2010 Marcin Slusarz <marcin.slusarz@gmail.com>
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/* modified version of headergen which uses enums and inline fxns for
+ * type safety.. based on original headergen
+ */
+
+#include "rnn.h"
+#include "util.h"
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <inttypes.h>
+#include <time.h>
+#include <ctype.h>
+#include <unistd.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/wait.h>
+#include <assert.h>
+
+struct rnndelem **elems = NULL;
+int elemsnum = 0;
+int elemsmax = 0;
+
+char **offsetfns = NULL;
+int offsetfnsnum = 0;
+int offsetfnsmax = 0;
+
+int startcol = 64;
+
+struct fout {
+	char *name;
+	FILE *file;
+	char *guard;
+};
+
+struct fout *fouts = 0;
+int foutsnum = 0;
+int foutsmax = 0;
+
+static bool no_asserts = false;
+
+static void seekcol (FILE *f, int src, int dst) {
+	if (dst <= src)
+		fprintf (f, "\t");
+	else {
+		int n = dst/8 - src/8;
+		if (n) {
+			while (n--)
+				fprintf (f, "\t");
+			n = dst&7;
+		} else
+			n = dst-src;
+		while (n--)
+			fprintf (f, " ");
+	}
+}
+
+static FILE *findfout (char *file) {
+	int i;
+	for (i = 0; i < foutsnum; i++)
+		if (!strcmp(fouts[i].name, file))
+			break;
+	if (i == foutsnum) {
+		fprintf (stderr, "AIII, didn't open file %s.\n", file);
+		exit(1);
+	}
+	return fouts[i].file;
+}
+
+static void printdef (char *name, char *suf, int type, uint64_t val, char *file) {
+	FILE *dst = findfout(file);
+	int len;
+	if (suf)
+		fprintf (dst, "#define %s__%s%n", name, suf, &len);
+	else
+		fprintf (dst, "#define %s%n", name, &len);
+	if (type == 0 && val > 0xffffffffull)
+		seekcol (dst, len, startcol-8);
+	else
+		seekcol (dst, len, startcol);
+	switch (type) {
+		case 0:
+			if (val > 0xffffffffull)
+				fprintf (dst, "0x%016"PRIx64"ULL\n", val);
+			else
+				fprintf (dst, "0x%08"PRIx64"\n", val);
+			break;
+		case 1:
+			fprintf (dst, "%"PRIu64"\n", val);
+			break;
+	}
+}
+
+static void printvalue (struct rnnvalue *val, int shift) {
+	if (val->varinfo.dead)
+		return;
+	if (val->valvalid)
+		printdef (val->fullname, 0, 0, val->value << shift, val->file);
+}
+
+static void printbitfield (struct rnnbitfield *bf, int shift);
+
+static void printtypeinfo (struct rnntypeinfo *ti, struct rnnbitfield *bf,
+		char *prefix, char *file) {
+	FILE *dst = findfout(file);
+	enum rnnttype intype = ti->type;
+	char *typename = NULL;
+	uint32_t mask = typeinfo_mask(ti);
+	uint32_t width = 1 + ti->high - ti->low;
+
+	/* for fixed point, input type (arg to fxn) is float: */
+	if ((ti->type == RNN_TTYPE_FIXED) || (ti->type == RNN_TTYPE_UFIXED))
+		intype = RNN_TTYPE_FLOAT;
+
+	/* for toplevel register (ie. not bitfield), only generate accessor
+	 * fxn for special cases (float, shr, min/max, etc):
+	 */
+	if (bf || ti->shr || ti->minvalid || ti->maxvalid || ti->alignvalid ||
+			ti->radixvalid || (intype == RNN_TTYPE_FLOAT)) {
+		switch (intype) {
+		case RNN_TTYPE_HEX:
+		case RNN_TTYPE_UINT:
+		case RNN_TTYPE_A3XX_REGID:
+			typename = "uint32_t";
+			break;
+		case RNN_TTYPE_INT:
+			typename = "int32_t";
+			break;
+		case RNN_TTYPE_FLOAT:
+			typename = "float";
+			break;
+		case RNN_TTYPE_ENUM:
+			asprintf(&typename, "enum %s", ti->name);
+			break;
+		default:
+			break;
+		}
+	}
+
+	/* for boolean, just generate a #define flag.. rather than inline fxn */
+	if (bf && (intype == RNN_TTYPE_BOOLEAN)) {
+		printdef(bf->fullname, 0, 0, mask, file);
+		return;
+	}
+
+	if (typename) {
+		printdef(prefix, "MASK", 0, mask, file);
+		printdef(prefix, "SHIFT", 1, ti->low, file);
+
+		fprintf(dst, "static inline uint32_t %s(%s val)\n", prefix, typename);
+		fprintf(dst, "{\n");
+
+		if ((ti->minvalid || ti->maxvalid || ti->alignvalid) && !no_asserts) {
+			fprintf(dst, "\tassert(1");
+			if (ti->minvalid)
+				fprintf(dst, " && (val >= %"PRIu64")", ti->min);
+			if (ti->maxvalid)
+				fprintf(dst, " && (val <= %"PRIu64")", ti->max);
+			if (ti->alignvalid)
+				fprintf(dst, " && !(val %% %"PRIu64")", ti->align);
+			fprintf(dst, ");\n");
+		}
+
+		if (ti->shr && !no_asserts) {
+			fprintf(dst, "\tassert(!(val & 0x%x));\n", (1 << ti->shr) - 1);
+		}
+
+		fprintf(dst, "\treturn ((");
+
+		if (ti->type == RNN_TTYPE_FIXED) {
+			fprintf(dst, "((int32_t)(val * %d.0))", (1 << ti->radix));
+		} else if (ti->type == RNN_TTYPE_UFIXED) {
+			fprintf(dst, "((uint32_t)(val * %d.0))", (1 << ti->radix));
+		} else if (ti->type == RNN_TTYPE_FLOAT) {
+			if (width == 32)
+				fprintf(dst, "fui(val)");
+			else if (width == 16)
+				fprintf(dst, "util_float_to_half(val)");
+			else
+				assert(!"invalid float size");
+		} else {
+			fprintf(dst, "val");
+		}
+
+		if (ti->shr)
+			fprintf(dst, " >> %d", ti->shr);
+
+		fprintf(dst, ") << %s__SHIFT) & %s__MASK;\n", prefix, prefix);
+		fprintf(dst, "}\n");
+
+		if (intype == RNN_TTYPE_ENUM)
+			free(typename);
+	}
+
+	int i;
+	for (i = 0; i < ti->valsnum; i++)
+		printvalue(ti->vals[i], ti->low);
+	for (i = 0; i < ti->bitfieldsnum; i++)
+		printbitfield(ti->bitfields[i], ti->low);
+}
+
+static void printbitfield (struct rnnbitfield *bf, int shift) {
+	if (bf->varinfo.dead)
+		return;
+	printtypeinfo (&bf->typeinfo, bf, bf->fullname, bf->file);
+}
+
+static void printdelem (struct rnndelem *elem, uint64_t offset) {
+	int use_offset_fxn;
+	char *offsetfn = NULL;
+
+	if (elem->varinfo.dead)
+		return;
+
+	use_offset_fxn = elem->offsets || elem->doffset || elem->doffsets;
+	assert((!!elem->offsets + !!elem->doffset + !!elem->doffsets) <= 1);
+
+	if (use_offset_fxn)
+		asprintf(&offsetfn, "__offset_%s", elem->name);
+
+	if (elem->length != 1) {
+		ADDARRAY(elems, elem);
+		ADDARRAY(offsetfns, offsetfn);
+	}
+
+	if (elem->name) {
+		char *regname;
+		asprintf(&regname, "REG_%s", elem->fullname);
+		if (elemsnum) {
+			int len;
+			FILE *dst = findfout(elem->file);
+			int i;
+
+			if (use_offset_fxn) {
+				fprintf(dst, "static inline uint32_t %s(", offsetfn);
+				if (elem->index)
+					fprintf(dst, "enum %s", elem->index->name);
+				else
+					fprintf(dst, "uint32_t");
+				fprintf(dst, " idx)\n");
+				fprintf(dst, "{\n");
+				if (elem->doffset) {
+					fprintf(dst, "\treturn (%s) + (%#" PRIx64 "*idx);\n", elem->doffset, elem->stride);
+				} else {
+					int valuesnum = elem->doffsets ? elem->doffsetsnum : elem->offsetsnum;
+
+					fprintf(dst, "\tswitch (idx) {\n");
+					for (i = 0; i < valuesnum; i++) {
+						struct rnnvalue *val = NULL;
+						fprintf(dst, "\t\tcase ");
+						if (elem->index) {
+							int j;
+							for (j = 0; j < elem->index->valsnum; j++) {
+								if (elem->index->vals[j]->value == i) {
+									val = elem->index->vals[j];
+									break;
+								}
+							}
+						}
+						if (val) {
+							fprintf(dst, "%s", val->name);
+						} else {
+							fprintf(dst, "%d", i);
+						}
+						if (elem->offsets) {
+							fprintf(dst, ": return 0x%08"PRIx64";\n", elem->offsets[i]);
+						} else {
+							fprintf(dst, ": return (%s);\n", elem->doffsets[i]);
+						}
+					}
+					fprintf(dst, "\t\tdefault: return INVALID_IDX(idx);\n");
+					fprintf(dst, "\t}\n");
+				}
+				fprintf(dst, "}\n");
+			}
+			fprintf (dst, "static inline uint32_t %s(", regname);
+			for (i = 0; i < elemsnum; i++) {
+				if (i)
+					fprintf(dst, ", ");
+				if (elems[i]->index)
+					fprintf(dst, "enum %s ", elems[i]->index->name);
+				else
+					fprintf(dst, "uint32_t ");
+				fprintf (dst, "i%d%n", i, &len);
+			}
+			fprintf (dst, ") { return ");
+			fprintf (dst, "0x%08"PRIx64"", offset + elem->offset);
+			for (i = 0; i < elemsnum; i++) {
+				if (offsetfns[i])
+					fprintf(dst, " + %s(i%d)", offsetfns[i], i);
+				else
+					fprintf (dst, " + %#" PRIx64 "*i%d", elems[i]->stride, i);
+			}
+			fprintf (dst, "; }\n");
+		} else
+			printdef (regname, 0, 0, offset + elem->offset, elem->file);
+
+		free(regname);
+/*
+		if (elem->stride)
+			printdef (elem->fullname, "ESIZE", 0, elem->stride, elem->file);
+		if (elem->length != 1)
+			printdef (elem->fullname, "LEN", 0, elem->length, elem->file);
+*/
+		printtypeinfo (&elem->typeinfo, NULL, elem->fullname, elem->file);
+	}
+	fprintf (findfout(elem->file), "\n");
+	int j;
+	for (j = 0; j < elem->subelemsnum; j++) {
+		printdelem(elem->subelems[j], offset + elem->offset);
+	}
+	if (elem->length != 1) {
+		elemsnum--;
+		offsetfnsnum--;
+	}
+	free(offsetfn);
+}
+
+static void print_file_info_(FILE *dst, struct stat* sb, struct tm* tm)
+{
+	char timestr[64];
+	strftime(timestr, sizeof(timestr), "%Y-%m-%d %H:%M:%S", tm);
+	fprintf(dst, "(%7Lu bytes, from %s)\n", (unsigned long long)sb->st_size, timestr);
+}
+
+static void print_file_info(FILE *dst, const char* file)
+{
+	struct stat sb;
+	struct tm tm;
+	stat(file, &sb);
+	gmtime_r(&sb.st_mtime, &tm);
+	print_file_info_(dst, &sb, &tm);
+}
+
+static void printhead(struct fout f, struct rnndb *db) {
+	int i, j;
+	struct stat sb;
+	struct tm tm;
+	stat(f.name, &sb);
+	gmtime_r(&sb.st_mtime, &tm);
+	fprintf (f.file, "#ifndef %s\n", f.guard);
+	fprintf (f.file, "#define %s\n", f.guard);
+	fprintf (f.file, "\n");
+	fprintf(f.file,
+		"/* Autogenerated file, DO NOT EDIT manually!\n"
+		"\n"
+		"This file was generated by the rules-ng-ng headergen tool in this git repository:\n"
+		"http://github.com/freedreno/envytools/\n"
+		"git clone https://github.com/freedreno/envytools.git\n"
+		"\n"
+		"The rules-ng-ng source files this header was generated from are:\n");
+	unsigned maxlen = 0;
+	for(i = 0; i < db->filesnum; ++i) {
+		unsigned len = strlen(db->files[i]);
+		if(len > maxlen)
+			maxlen = len;
+	}
+	for(i = 0; i < db->filesnum; ++i) {
+		unsigned len = strlen(db->files[i]);
+		fprintf(f.file, "- %s%*s ", db->files[i], maxlen - len, "");
+		print_file_info(f.file, db->files[i]);
+	}
+	fprintf(f.file,
+		"\n"
+		"Copyright (C) ");
+	if(db->copyright.firstyear && db->copyright.firstyear < (1900 + tm.tm_year))
+		fprintf(f.file, "%u-", db->copyright.firstyear);
+	fprintf(f.file, "%u", 1900 + tm.tm_year);
+	if(db->copyright.authorsnum) {
+		fprintf(f.file, " by the following authors:");
+		for(i = 0; i < db->copyright.authorsnum; ++i) {
+			fprintf(f.file, "\n- ");
+			if(db->copyright.authors[i]->name)
+				fprintf(f.file, "%s", db->copyright.authors[i]->name);
+			if(db->copyright.authors[i]->email)
+				fprintf(f.file, " <%s>", db->copyright.authors[i]->email);
+			if(db->copyright.authors[i]->nicknamesnum) {
+				for(j = 0; j < db->copyright.authors[i]->nicknamesnum; ++j) {
+					fprintf(f.file, "%s%s", (j ? ", " : " ("), db->copyright.authors[i]->nicknames[j]);
+				}
+				fprintf(f.file, ")");
+			}
+		}
+	}
+	fprintf(f.file, "\n");
+	if(db->copyright.license)
+		fprintf(f.file, "\n%s\n", db->copyright.license);
+	fprintf(f.file, "*/\n\n\n");
+}
+
+int main(int argc, char **argv) {
+	char *file;
+	struct rnndb *db;
+	int i, j;
+
+	if (argc < 2) {
+		fprintf(stderr, "Usage:\n\theadergen database-file\n");
+		exit(1);
+	}
+
+	if ((argc >= 3) && !strcmp(argv[1], "--no-asserts")) {
+		no_asserts = true;
+		file = argv[2];
+	} else {
+		file = argv[1];
+	}
+
+	rnn_init();
+	db = rnn_newdb();
+	rnn_parsefile (db, file);
+	rnn_prepdb (db);
+	for(i = 0; i < db->filesnum; ++i) {
+		char *dstname = malloc(strlen(db->files[i]) + 3);
+		char *pretty;
+		strcpy(dstname, db->files[i]);
+		strcat(dstname, ".h");
+		struct fout f = { db->files[i], fopen(dstname, "w") };
+		if (!f.file) {
+			perror(dstname);
+			exit(1);
+		}
+		free(dstname);
+		pretty = strrchr(f.name, '/');
+		if (pretty)
+			pretty += 1;
+		else
+			pretty = f.name;
+		f.guard = strdup(pretty);
+		for (j = 0; j < strlen(f.guard); j++)
+			if (isalnum(f.guard[j]))
+				f.guard[j] = toupper(f.guard[j]);
+			else
+				f.guard[j] = '_';
+		ADDARRAY(fouts, f);
+		printhead(f, db);
+	}
+
+	for (i = 0; i < db->enumsnum; i++) {
+		FILE *dst = NULL;
+		int j;
+		for (j = 0; j < db->enums[i]->valsnum; j++) {
+			if (!dst) {
+				dst = findfout(db->enums[i]->vals[j]->file);
+				fprintf(dst, "enum %s {\n", db->enums[i]->name);
+			}
+			if (0xffff0000 & db->enums[i]->vals[j]->value)
+				fprintf(dst, "\t%s = 0x%08"PRIx64",\n", db->enums[i]->vals[j]->name,
+						db->enums[i]->vals[j]->value);
+			else
+				fprintf(dst, "\t%s = %"PRIu64",\n", db->enums[i]->vals[j]->name,
+						db->enums[i]->vals[j]->value);
+		}
+		if (dst) {
+			fprintf(dst, "};\n\n");
+		}
+	}
+	for (i = 0; i < db->bitsetsnum; i++) {
+		if (db->bitsets[i]->isinline)
+			continue;
+		int j;
+		for (j = 0; j < db->bitsets[i]->bitfieldsnum; j++)
+			printbitfield (db->bitsets[i]->bitfields[j], 0);
+	}
+	for (i = 0; i < db->domainsnum; i++) {
+		if (db->domains[i]->size)
+			printdef (db->domains[i]->fullname, "SIZE", 0, db->domains[i]->size, db->domains[i]->file);
+		int j;
+		for (j = 0; j < db->domains[i]->subelemsnum; j++) {
+			printdelem(db->domains[i]->subelems[j], 0);
+		}
+	}
+	for(i = 0; i < foutsnum; ++i) {
+		fprintf (fouts[i].file, "\n#endif /* %s */\n", fouts[i].guard);
+	}
+	return db->estatus;
+}
diff --git a/drivers/gpu/drm/msm/headergen2/path.c b/drivers/gpu/drm/msm/headergen2/path.c
new file mode 100644
index 000000000000..f8ef885d891d
--- /dev/null
+++ b/drivers/gpu/drm/msm/headergen2/path.c
@@ -0,0 +1,64 @@
+/*
+ * Copyright (C) 2011 Marcin Kościelnicki <koriakin@0x04.net>
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "util.h"
+#include <string.h>
+
+FILE *find_in_path(const char *name, const char *path, char **pfullname) {
+	if (!path)
+		return 0;
+	while (path) {
+		const char *npath = strchr(path, ':');
+		size_t plen;
+		if (npath) {
+			plen = npath - path;
+			npath++;
+		} else {
+			plen = strlen(path);
+		}
+		if (plen) {
+			/* also look for .gz compressed xml: */
+			const char *exts[] = { "", ".gz" };
+			for (int i = 0; i < ARRAY_SIZE(exts); i++) {
+				char *fullname;
+
+				int ret = asprintf(&fullname, "%.*s/%s%s", (int)plen, path, name, exts[i]);
+				if (ret < 0)
+					return NULL;
+
+				FILE *file = fopen(fullname, "r");
+				if (file) {
+					if (pfullname)
+						*pfullname = fullname;
+					else
+						free(fullname);
+					return file;
+				}
+				free(fullname);
+			}
+		}
+		path = npath;
+	}
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/headergen2/rnn.c b/drivers/gpu/drm/msm/headergen2/rnn.c
new file mode 100644
index 000000000000..d82d2a561b02
--- /dev/null
+++ b/drivers/gpu/drm/msm/headergen2/rnn.c
@@ -0,0 +1,1360 @@
+/*
+ * Copyright (C) 2010-2011 Marcin Kościelnicki <koriakin@0x04.net>
+ * Copyright (C) 2010 Luca Barbieri <luca@luca-barbieri.com>
+ * Copyright (C) 2010 Francisco Jerez <currojerez@riseup.net>
+ * Copyright (C) 2010 Martin Peres <martin.peres@ensi-bourges.fr>
+ * Copyright (C) 2010 Marcin Slusarz <marcin.slusarz@gmail.com>
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/* workaround libxml2 silliness: */
+#pragma GCC diagnostic ignored "-Wpointer-sign"
+
+#include <libxml/xmlversion.h>
+#include <libxml/parser.h>
+#include <libxml/xpath.h>
+#include <libxml/xmlreader.h>
+#include <stdint.h>
+#include <string.h>
+#include <limits.h>
+#include <ctype.h>
+#include <stdio.h>
+#include "rnn.h"
+#include "util.h"
+
+#include "util/u_debug.h"
+
+static char *catstr (char *a, char *b) {
+	if (!a)
+		return b;
+	return aprintf("%s_%s", a, b);
+}
+
+static int strdiff (const char *a, const char *b) {
+	if (!a && !b)
+		return 0;
+	if (!a || !b)
+		return 1;
+	return strcmp (a, b);
+}
+
+static void rnn_err(struct rnndb *db, const char *format, ...) _util_printf_format(2, 3);
+
+static void rnn_err(struct rnndb *db, const char *format, ...)
+{
+	va_list ap;
+	va_start(ap, format);
+	vfprintf(stderr, format, ap);
+	va_end(ap);
+	db->estatus = 1;
+}
+
+void rnn_init(void) {
+	LIBXML_TEST_VERSION
+	xmlInitParser();
+}
+
+struct rnndb *rnn_newdb(void) {
+	struct rnndb *db = calloc(sizeof *db, 1);
+	return db;
+}
+
+static char *getcontent (xmlNode *attr) {
+	xmlNode *chain = attr->children;
+	size_t size = 0;
+	char *content, *p;
+	while (chain) {
+		if (chain->type == XML_TEXT_NODE)
+			size += strlen(chain->content);
+		chain = chain->next;
+	}
+	p = content = malloc(size + 1);
+	chain = attr->children;
+	while (chain) {
+		if (chain->type == XML_TEXT_NODE) {
+			char* sp = chain->content;
+			if(p == content) {
+				while(isspace(*sp))
+					++sp;
+			}
+			size_t len = strlen(sp);
+			memcpy(p, sp, len);
+			p += len;
+		}
+		chain = chain->next;
+	}
+	while(p != content && isspace(p[-1]))
+		--p;
+	*p = 0;
+	return content;
+}
+
+static char *getattrib (struct rnndb *db, char *file, int line, xmlAttr *attr) {
+	xmlNode *chain = attr->children;
+	while (chain) {
+		if (chain->type != XML_TEXT_NODE) {
+			rnn_err(db, "%s:%d: unknown attribute child \"%s\" in attribute \"%s\"\n", file, line, chain->name, attr->name);
+		} else {
+			return chain->content;
+		}
+		chain = chain->next;
+	}
+	return "";
+}
+
+static int getboolattrib (struct rnndb *db, char *file, int line, xmlAttr *attr) {
+	char *c = getattrib(db, file, line, attr);
+	if (!strcmp(c, "yes") || !strcmp(c, "1") || !strcmp(c, "true"))
+		return 1;
+	if (!strcmp(c, "no") || !strcmp(c, "0") || !strcmp(c, "false"))
+		return 0;
+	rnn_err(db, "%s:%d: invalid boolean value \"%s\" in attribute \"%s\"\n", file, line, c, attr->name);
+	return 0;
+}
+
+static uint64_t getnum(struct rnndb *db, char *file, int line, xmlAttr *attr, char *c)
+{
+	char *cc;
+	uint64_t res;
+	if (strchr(c, 'x') || strchr(c, 'X'))
+		res = strtoull(c, &cc, 16);
+	else
+		res = strtoull(c, &cc, 10);
+	if (*cc)  {
+		rnn_err(db, "%s:%d: invalid numeric value \"%s\" in attribute \"%s\"\n", file, line, c, attr->name);
+	}
+	return res;
+}
+
+static uint64_t getnumattrib (struct rnndb *db, char *file, int line, xmlAttr *attr) {
+	char *c = getattrib(db, file, line, attr);
+	return getnum(db, file, line, attr, c);
+}
+
+static int trytop (struct rnndb *db, char *file, xmlNode *node);
+
+static int trydoc (struct rnndb *db, char *file, xmlNode *node) {
+	if (!strcmp(node->name, "brief")) {
+		return 1;
+	} else if (!strcmp(node->name, "doc")) {
+		return 1;
+	}
+	return 0;
+}
+
+static struct rnnvalue *parsevalue(struct rnndb *db, char *file, xmlNode *node);
+static struct rnnbitfield *parsebitfield(struct rnndb *db, char *file, xmlNode *node);
+
+static int trytypetag (struct rnndb *db, char *file, xmlNode *node, struct rnntypeinfo *ti) {
+	if (!strcmp(node->name, "value")) {
+		struct rnnvalue *val = parsevalue(db, file, node);
+		if (val)
+			ADDARRAY(ti->vals, val);
+		return 1;
+	} else if (!strcmp(node->name, "bitfield")) {
+		struct rnnbitfield *bf = parsebitfield(db, file, node);
+		if (bf)
+			ADDARRAY(ti->bitfields, bf);
+		return 1;
+	}
+	return 0;
+}
+static int trytypeattr (struct rnndb *db, char *file, xmlNode *node, xmlAttr *attr, struct rnntypeinfo *ti) {
+	if (!strcmp(attr->name, "shr")) {
+		ti->shr = getnumattrib(db, file, node->line, attr);
+		return 1;
+	} else if (!strcmp(attr->name, "min")) {
+		ti->min = getnumattrib(db, file, node->line, attr);
+		ti->minvalid = 1;
+		return 1;
+	} else if (!strcmp(attr->name, "max")) {
+		ti->max = getnumattrib(db, file, node->line, attr);
+		ti->maxvalid = 1;
+		return 1;
+	} else if (!strcmp(attr->name, "align")) {
+		ti->align = getnumattrib(db, file, node->line, attr);
+		ti->alignvalid = 1;
+		return 1;
+	} else if (!strcmp(attr->name, "type")) {
+		ti->name = strdup(getattrib(db, file, node->line, attr));;
+		return 1;
+	} else if (!strcmp(attr->name, "radix")) {
+		ti->radix = getnumattrib(db, file, node->line, attr);
+		ti->radixvalid = 1;
+		return 1;
+	} else if (!strcmp(attr->name, "pos")) {
+		ti->high = ti->low = getnumattrib(db, file, node->line, attr);
+		return 1;
+	} else if (!strcmp(attr->name, "low")) {
+		ti->low = getnumattrib(db, file, node->line, attr);
+		return 1;
+	} else if (!strcmp(attr->name, "high")) {
+		ti->high = getnumattrib(db, file, node->line, attr);
+		return 1;
+	} else if (!strcmp(attr->name, "addvariant")) {
+		ti->addvariant = getboolattrib(db, file, node->line, attr);
+		return 1;
+	}
+	return 0;
+}
+
+static struct rnnvalue *parsevalue(struct rnndb *db, char *file, xmlNode *node) {
+	struct rnnvalue *val = calloc(sizeof *val, 1);
+	val->file = file;
+	xmlAttr *attr = node->properties;
+	while (attr) {
+		if (!strcmp(attr->name, "name")) {
+			val->name = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "value")) {
+			val->value = getnumattrib(db, file, node->line, attr);
+			val->valvalid = 1;
+		} else if (!strcmp(attr->name, "varset")) {
+			val->varinfo.varsetstr = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "variants")) {
+			val->varinfo.variantsstr = strdup(getattrib(db, file, node->line, attr));
+		} else {
+			rnn_err(db, "%s:%d: wrong attribute \"%s\" for value\n", file, node->line, attr->name);
+		}
+		attr = attr->next;
+	}
+	xmlNode *chain = node->children;
+	while (chain) {
+		if (chain->type != XML_ELEMENT_NODE) {
+		} else if (!trytop(db, file, chain) && !trydoc(db, file, chain)) {
+			rnn_err(db, "%s:%d: wrong tag in %s: <%s>\n", file, chain->line, node->name, chain->name);
+		}
+		chain = chain->next;
+	}
+	if (!val->name) {
+		rnn_err(db, "%s:%d: nameless value\n", file, node->line);
+		return 0;
+	} else {
+		return val;
+	}
+}
+
+static void parsespectype(struct rnndb *db, char *file, xmlNode *node) {
+	struct rnnspectype *res = calloc (sizeof *res, 1);
+	res->file = file;
+	xmlAttr *attr = node->properties;
+	int i;
+	while (attr) {
+		if (!strcmp(attr->name, "name")) {
+			res->name = strdup(getattrib(db, file, node->line, attr));
+		} else if (!trytypeattr(db, file, node, attr, &res->typeinfo)) {
+			rnn_err(db, "%s:%d: wrong attribute \"%s\" for spectype\n", file, node->line, attr->name);
+		}
+		attr = attr->next;
+	}
+	if (!res->name) {
+		rnn_err(db, "%s:%d: nameless spectype\n", file, node->line);
+		return;
+	}
+	for (i = 0; i < db->spectypesnum; i++)
+		if (!strcmp(db->spectypes[i]->name, res->name)) {
+			rnn_err(db, "%s:%d: duplicated spectype name %s\n", file, node->line, res->name);
+			return;
+		}
+	ADDARRAY(db->spectypes, res);
+	xmlNode *chain = node->children;
+	while (chain) {
+		if (chain->type != XML_ELEMENT_NODE) {
+		} else if (!trytypetag(db, file, chain, &res->typeinfo) && !trytop(db, file, chain) && !trydoc(db, file, chain)) {
+			rnn_err(db, "%s:%d: wrong tag in spectype: <%s>\n", file, chain->line, chain->name);
+		}
+		chain = chain->next;
+	}
+}
+
+static void parseenum(struct rnndb *db, char *file, xmlNode *node) {
+	xmlAttr *attr = node->properties;
+	char *name = 0;
+	int isinline = 0;
+	int bare = 0;
+	char *prefixstr = 0;
+	char *varsetstr = 0;
+	char *variantsstr = 0;
+	int i;
+	while (attr) {
+		if (!strcmp(attr->name, "name")) {
+			name = getattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "bare")) {
+			bare = getboolattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "inline")) {
+			isinline = getboolattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "prefix")) {
+			prefixstr = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "varset")) {
+			varsetstr = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "variants")) {
+			variantsstr = strdup(getattrib(db, file, node->line, attr));
+		} else {
+			rnn_err(db, "%s:%d: wrong attribute \"%s\" for enum\n", file, node->line, attr->name);
+		}
+		attr = attr->next;
+	}
+	if (!name) {
+		rnn_err(db, "%s:%d: nameless enum\n", file, node->line);
+		return;
+	}
+	struct rnnenum *cur = 0;
+	for (i = 0; i < db->enumsnum; i++)
+		if (!strcmp(db->enums[i]->name, name)) {
+			cur = db->enums[i];
+			break;
+		}
+	if (cur) {
+		if (strdiff(cur->varinfo.prefixstr, prefixstr) ||
+				strdiff(cur->varinfo.varsetstr, varsetstr) ||
+				strdiff(cur->varinfo.variantsstr, variantsstr) ||
+				cur->isinline != isinline || cur->bare != bare) {
+			rnn_err(db, "%s:%d: merge fail for enum %s\n", file, node->line, node->name);
+		}
+	} else {
+		cur = calloc(sizeof *cur, 1);
+		cur->name = strdup(name);
+		cur->isinline = isinline;
+		cur->bare = bare;
+		cur->varinfo.prefixstr = prefixstr;
+		cur->varinfo.varsetstr = varsetstr;
+		cur->varinfo.variantsstr = variantsstr;
+		cur->file = file;
+		ADDARRAY(db->enums, cur);
+	}
+	xmlNode *chain = node->children;
+	while (chain) {
+		if (chain->type != XML_ELEMENT_NODE) {
+		} else if (!strcmp(chain->name, "value")) {
+			struct rnnvalue *val = parsevalue(db, file, chain);
+			if (val)
+				ADDARRAY(cur->vals, val);
+		} else if (!trytop(db, file, chain) && !trydoc(db, file, chain)) {
+			rnn_err(db, "%s:%d: wrong tag in enum: <%s>\n", file, chain->line, chain->name);
+		}
+		chain = chain->next;
+	}
+}
+
+static struct rnnbitfield *parsebitfield(struct rnndb *db, char *file, xmlNode *node) {
+	struct rnnbitfield *bf = calloc(sizeof *bf, 1);
+	bf->file = file;
+	xmlAttr *attr = node->properties;
+	bf->typeinfo.low = bf->typeinfo.high = -1;
+	while (attr) {
+		if (!strcmp(attr->name, "name")) {
+			bf->name = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "varset")) {
+			bf->varinfo.varsetstr = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "variants")) {
+			bf->varinfo.variantsstr = strdup(getattrib(db, file, node->line, attr));
+		} else if (!trytypeattr(db, file, node, attr, &bf->typeinfo)) {
+			rnn_err(db, "%s:%d: wrong attribute \"%s\" for bitfield\n", file, node->line, attr->name);
+		}
+		attr = attr->next;
+	}
+	xmlNode *chain = node->children;
+	while (chain) {
+		if (chain->type != XML_ELEMENT_NODE) {
+		} else if (!trytypetag(db, file, chain, &bf->typeinfo) && !trytop(db, file, chain) && !trydoc(db, file, chain)) {
+			rnn_err(db, "%s:%d: wrong tag in %s: <%s>\n", file, chain->line, node->name, chain->name);
+		}
+		chain = chain->next;
+	}
+	if (!bf->name) {
+		rnn_err(db, "%s:%d: nameless bitfield\n", file, node->line);
+		return 0;
+	} else if (bf->typeinfo.low < 0|| bf->typeinfo.high < 0 || bf->typeinfo.high < bf->typeinfo.low) {
+		rnn_err(db, "%s:%d: bitfield has wrong placement\n", file, node->line);
+		return 0;
+	} else {
+		return bf;
+	}
+}
+
+static void parsebitset(struct rnndb *db, char *file, xmlNode *node) {
+	xmlAttr *attr = node->properties;
+	char *name = 0;
+	int isinline = 0;
+	int bare = 0;
+	char *prefixstr = 0;
+	char *varsetstr = 0;
+	char *variantsstr = 0;
+	int i;
+	while (attr) {
+		if (!strcmp(attr->name, "name")) {
+			name = getattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "bare")) {
+			bare = getboolattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "inline")) {
+			isinline = getboolattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "prefix")) {
+			prefixstr = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "varset")) {
+			varsetstr = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "variants")) {
+			variantsstr = strdup(getattrib(db, file, node->line, attr));
+		} else {
+			rnn_err(db, "%s:%d: wrong attribute \"%s\" for bitset\n", file, node->line, attr->name);
+		}
+		attr = attr->next;
+	}
+	if (!name) {
+		rnn_err(db, "%s:%d: nameless bitset\n", file, node->line);
+		return;
+	}
+	struct rnnbitset *cur = 0;
+	for (i = 0; i < db->bitsetsnum; i++)
+		if (!strcmp(db->bitsets[i]->name, name)) {
+			cur = db->bitsets[i];
+			break;
+		}
+	if (cur) {
+		if (strdiff(cur->varinfo.prefixstr, prefixstr) ||
+				strdiff(cur->varinfo.varsetstr, varsetstr) ||
+				strdiff(cur->varinfo.variantsstr, variantsstr) ||
+				cur->isinline != isinline || cur->bare != bare) {
+			rnn_err(db, "%s:%d: merge fail for bitset %s\n", file, node->line, node->name);
+		}
+	} else {
+		cur = calloc(sizeof *cur, 1);
+		cur->name = strdup(name);
+		cur->isinline = isinline;
+		cur->bare = bare;
+		cur->varinfo.prefixstr = prefixstr;
+		cur->varinfo.varsetstr = varsetstr;
+		cur->varinfo.variantsstr = variantsstr;
+		cur->file = file;
+		ADDARRAY(db->bitsets, cur);
+	}
+	xmlNode *chain = node->children;
+	while (chain) {
+		if (chain->type != XML_ELEMENT_NODE) {
+		} else if (!strcmp(chain->name, "bitfield")) {
+			struct rnnbitfield *bf = parsebitfield(db, file, chain);
+			if (bf)
+				ADDARRAY(cur->bitfields, bf);
+		} else if (!trytop(db, file, chain) && !trydoc(db, file, chain)) {
+			rnn_err(db, "%s:%d: wrong tag in bitset: <%s>\n", file, chain->line, chain->name);
+		}
+		chain = chain->next;
+	}
+}
+
+static struct rnndelem *trydelem(struct rnndb *db, char *file, xmlNode *node) {
+	if (!strcmp(node->name, "use-group")) {
+		struct rnndelem *res = calloc(sizeof *res, 1);
+		res->file = file;
+		res->type = RNN_ETYPE_USE_GROUP;
+		xmlAttr *attr = node->properties;
+		while (attr) {
+			if (!strcmp(attr->name, "ref")) {
+				res->name = strdup(getattrib(db, file, node->line, attr));
+			} else {
+				rnn_err(db, "%s:%d: wrong attribute \"%s\" for %s\n", file, node->line, attr->name, node->name);
+			}
+			attr = attr->next;
+		}
+		if (!res->name) {
+			rnn_err(db, "%s:%d: nameless use-group\n", file, node->line);
+			return 0;
+		}
+		return res;
+	} else if (!strcmp(node->name, "stripe") || !strcmp(node->name, "array")) {
+		struct rnndelem *res = calloc(sizeof *res, 1);
+		if (!strcmp(node->name, "array"))
+			res->name = "";
+		res->type = (strcmp(node->name, "stripe")?RNN_ETYPE_ARRAY:RNN_ETYPE_STRIPE);
+		res->length = 1;
+		res->file = file;
+		xmlAttr *attr = node->properties;
+		while (attr) {
+			if (!strcmp(attr->name, "name")) {
+				res->name = strdup(getattrib(db, file, node->line, attr));
+			} else if (!strcmp(attr->name, "offset")) {
+				res->offset = getnumattrib(db, file, node->line, attr);
+			} else if (!strcmp(attr->name, "offsets")) {
+				char *str = strdup(getattrib(db, file, node->line, attr));
+				char *tok, *save, *tmp = str;
+				while ((tok = strtok_r(str, ",", &save))) {
+					uint64_t offset = getnum(db, file, node->line, attr, tok);
+					ADDARRAY(res->offsets, offset);
+					str = NULL;
+				}
+				if (str)
+					fprintf(stderr, "%s:%d: invalid offsets: %s\n", file, node->line, str);
+				free(tmp);
+			} else if (!strcmp(attr->name, "doffset")) {
+				/* dynamic runtime determined offset: */
+				res->doffset = strdup(getattrib(db, file, node->line, attr));
+			} else if (!strcmp(attr->name, "doffsets")) {
+				/* dynamic runtime determined offsets: */
+				char *str = strdup(getattrib(db, file, node->line, attr));
+				char *tok, *save, *tmp = str;
+				while ((tok = strtok_r(str, ",", &save))) {
+					char *doffset = strdup(tok);
+					ADDARRAY(res->doffsets, doffset);
+					str = NULL;
+				}
+				if (str)
+					fprintf(stderr, "%s:%d: invalid offsets: %s\n", file, node->line, str);
+				free(tmp);
+			} else if (!strcmp(attr->name, "length")) {
+				res->length = getnumattrib(db, file, node->line, attr);
+			} else if (!strcmp(attr->name, "stride")) {
+				res->stride = getnumattrib(db, file, node->line, attr);
+			} else if (!strcmp(attr->name, "prefix")) {
+				res->varinfo.prefixstr = strdup(getattrib(db, file, node->line, attr));
+			} else if (!strcmp(attr->name, "varset")) {
+				res->varinfo.varsetstr = strdup(getattrib(db, file, node->line, attr));
+			} else if (!strcmp(attr->name, "variants")) {
+				res->varinfo.variantsstr = strdup(getattrib(db, file, node->line, attr));
+			} else if (!strcmp(attr->name, "index")) {
+				const char *enumname = getattrib(db, file, node->line, attr);
+				res->index = rnn_findenum(db, enumname);
+				if (!res->index) {
+					rnn_err(db, "%s:%d: invalid enum name \"%s\"\n", file, node->line, enumname);
+				}
+			} else {
+				rnn_err(db, "%s:%d: wrong attribute \"%s\" for %s\n", file, node->line, attr->name, node->name);
+			}
+			attr = attr->next;
+		}
+		xmlNode *chain = node->children;
+		while (chain) {
+			struct rnndelem *delem;
+			if (chain->type != XML_ELEMENT_NODE) {
+			} else if ((delem = trydelem(db, file, chain))) {
+				ADDARRAY(res->subelems, delem);
+			} else if (!trytop(db, file, chain) && !trydoc(db, file, chain)) {
+				rnn_err(db, "%s:%d: wrong tag in %s: <%s>\n", file, chain->line, node->name, chain->name);
+			}
+			chain = chain->next;
+		}
+
+		/* Sanity checking */
+		if (res->type == RNN_ETYPE_ARRAY && res->stride == 0) {
+			fprintf(stderr, "%s: Array %s's stride is undefined. Aborting.\n", file, res->name);
+			exit(-1);
+		}
+		return res;
+
+	}
+	int width;
+	if (!strcmp(node->name, "reg8"))
+		width = 8;
+	else if (!strcmp(node->name, "reg16"))
+		width = 16;
+	else if (!strcmp(node->name, "reg32"))
+		width = 32;
+	else if (!strcmp(node->name, "reg64"))
+		width = 64;
+	else
+		return 0;
+	struct rnndelem *res = calloc(sizeof *res, 1);
+	res->file = file;
+	res->type = RNN_ETYPE_REG;
+	res->width = width;
+	res->length = 1;
+	res->access = RNN_ACCESS_RW;
+	xmlAttr *attr = node->properties;
+	res->typeinfo.low = 0;
+	res->typeinfo.high = width - 1;
+	while (attr) {
+		if (!strcmp(attr->name, "name")) {
+			res->name = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "offset")) {
+			res->offset = getnumattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "length")) {
+			res->length = getnumattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "stride")) {
+			res->stride = getnumattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "varset")) {
+			res->varinfo.varsetstr = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "variants")) {
+			res->varinfo.variantsstr = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "access")) {
+			char *str = getattrib(db, file, node->line, attr);
+			if (!strcmp(str, "r"))
+				res->access = RNN_ACCESS_R;
+			else if (!strcmp(str, "w"))
+				res->access = RNN_ACCESS_W;
+			else if (!strcmp(str, "rw"))
+				res->access = RNN_ACCESS_RW;
+			else
+				fprintf (stderr, "%s:%d: wrong access type \"%s\" for register\n", file, node->line, str);
+		} else if (!trytypeattr(db, file, node, attr, &res->typeinfo)) {
+			rnn_err(db, "%s:%d: wrong attribute \"%s\" for register\n", file, node->line, attr->name);
+		}
+		attr = attr->next;
+	}
+	xmlNode *chain = node->children;
+	while (chain) {
+		if (chain->type != XML_ELEMENT_NODE) {
+		} else if (!trytypetag(db, file, chain, &res->typeinfo) && !trytop(db, file, chain) && !trydoc(db, file, chain)) {
+			rnn_err(db, "%s:%d: wrong tag in %s: <%s>\n", file, chain->line, node->name, chain->name);
+		}
+		chain = chain->next;
+	}
+	if (!res->name) {
+		rnn_err(db, "%s:%d: nameless register\n", file, node->line);
+		return 0;
+	} else {
+	}
+	return res;
+}
+
+static void parsegroup(struct rnndb *db, char *file, xmlNode *node) {
+	xmlAttr *attr = node->properties;
+	char *name = 0;
+	int i;
+	while (attr) {
+		if (!strcmp(attr->name, "name")) {
+			name = getattrib(db, file, node->line, attr);
+		} else {
+			rnn_err(db, "%s:%d: wrong attribute \"%s\" for group\n", file, node->line, attr->name);
+		}
+		attr = attr->next;
+	}
+	if (!name) {
+		rnn_err(db, "%s:%d: nameless group\n", file, node->line);
+		return;
+	}
+	struct rnngroup *cur = 0;
+	for (i = 0; i < db->groupsnum; i++)
+		if (!strcmp(db->groups[i]->name, name)) {
+			cur = db->groups[i];
+			break;
+		}
+	if (!cur) {
+		cur = calloc(sizeof *cur, 1);
+		cur->name = strdup(name);
+		ADDARRAY(db->groups, cur);
+	}
+	xmlNode *chain = node->children;
+	while (chain) {
+		struct rnndelem *delem;
+		if (chain->type != XML_ELEMENT_NODE) {
+		} else if ((delem = trydelem(db, file, chain))) {
+			ADDARRAY(cur->subelems, delem);
+		} else if (!trytop(db, file, chain) && !trydoc(db, file, chain)) {
+			rnn_err(db, "%s:%d: wrong tag in group: <%s>\n", file, chain->line, chain->name);
+		}
+		chain = chain->next;
+	}
+}
+
+static void parsedomain(struct rnndb *db, char *file, xmlNode *node) {
+	xmlAttr *attr = node->properties;
+	char *name = 0;
+	uint64_t size = 0; int width = 8;
+	int bare = 0;
+	char *prefixstr = 0;
+	char *varsetstr = 0;
+	char *variantsstr = 0;
+	int i;
+	while (attr) {
+		if (!strcmp(attr->name, "name")) {
+			name = getattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "bare")) {
+			bare = getboolattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "size")) {
+			size = getnumattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "width")) {
+			width = getnumattrib(db, file, node->line, attr);
+		} else if (!strcmp(attr->name, "prefix")) {
+			prefixstr = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "varset")) {
+			varsetstr = strdup(getattrib(db, file, node->line, attr));
+		} else if (!strcmp(attr->name, "variants")) {
+			variantsstr = strdup(getattrib(db, file, node->line, attr));
+		} else {
+			rnn_err(db, "%s:%d: wrong attribute \"%s\" for domain\n", file, node->line, attr->name);
+		}
+		attr = attr->next;
+	}
+	if (!name) {
+		rnn_err(db, "%s:%d: nameless domain\n", file, node->line);
+		return;
+	}
+	struct rnndomain *cur = 0;
+	for (i = 0; i < db->domainsnum; i++)
+		if (!strcmp(db->domains[i]->name, name)) {
+			cur = db->domains[i];
+			break;
+		}
+	if (cur) {
+		if (strdiff(cur->varinfo.prefixstr, prefixstr) ||
+				strdiff(cur->varinfo.varsetstr, varsetstr) ||
+				strdiff(cur->varinfo.variantsstr, variantsstr) ||
+				cur->width != width ||
+				cur->bare != bare ||
+				(size && cur->size && size != cur->size)) {
+			rnn_err(db, "%s:%d: merge fail for domain %s\n", file, node->line, node->name);
+		} else {
+			if (size)
+				cur->size = size;
+		}
+	} else {
+		cur = calloc(sizeof *cur, 1);
+		cur->name = strdup(name);
+		cur->bare = bare;
+		cur->width = width;
+		cur->size = size;
+		cur->varinfo.prefixstr = prefixstr;
+		cur->varinfo.varsetstr = varsetstr;
+		cur->varinfo.variantsstr = variantsstr;
+		cur->file = file;
+		ADDARRAY(db->domains, cur);
+	}
+	xmlNode *chain = node->children;
+	while (chain) {
+		struct rnndelem *delem;
+		if (chain->type != XML_ELEMENT_NODE) {
+		} else if ((delem = trydelem(db, file, chain))) {
+			ADDARRAY(cur->subelems, delem);
+		} else if (!trytop(db, file, chain) && !trydoc(db, file, chain)) {
+			rnn_err(db, "%s:%d: wrong tag in domain: <%s>\n", file, chain->line, chain->name);
+		}
+		chain = chain->next;
+	}
+}
+
+static void parsecopyright(struct rnndb *db, char *file, xmlNode *node) {
+	struct rnncopyright* copyright = &db->copyright;
+	xmlAttr *attr = node->properties;
+	while (attr) {
+		if (!strcmp(attr->name, "year")) {
+			unsigned firstyear = getnumattrib(db, file, node->line, attr);
+			if(!copyright->firstyear || firstyear < copyright->firstyear)
+				copyright->firstyear = firstyear;
+		} else {
+			rnn_err(db, "%s:%d: wrong attribute \"%s\" for copyright\n", file, node->line, attr->name);
+		}
+		attr = attr->next;
+	}
+	xmlNode *chain = node->children;
+	while (chain) {
+		if (chain->type != XML_ELEMENT_NODE) {
+		} else if (!strcmp(chain->name, "license"))
+			if(copyright->license) {
+				if(strcmp(copyright->license, node->content)) {
+					fprintf(stderr, "fatal error: multiple different licenses specified!\n");
+					abort(); /* TODO: do something better here, but headergen, xml2html, etc. should not produce anything in this case */
+				}
+			} else
+				copyright->license = getcontent(chain);
+		else if (!strcmp(chain->name, "author")) {
+			struct rnnauthor* author = calloc(sizeof *author, 1);
+			xmlAttr* authorattr = chain->properties;
+			xmlNode *authorchild = chain->children;
+			author->contributions = getcontent(chain);
+			while (authorattr) {
+				if (!strcmp(authorattr->name, "name"))
+					author->name = strdup(getattrib(db, file, chain->line, authorattr));
+				else if (!strcmp(authorattr->name, "email"))
+					author->email = strdup(getattrib(db, file, chain->line, authorattr));
+				else {
+					rnn_err(db, "%s:%d: wrong attribute \"%s\" for author\n", file, chain->line, authorattr->name);
+				}
+				authorattr = authorattr->next;
+			}
+			while(authorchild)  {
+				if (authorchild->type != XML_ELEMENT_NODE) {
+				} else if (!strcmp(authorchild->name, "nick")) {
+					xmlAttr* nickattr = authorchild->properties;
+					char* nickname = 0;
+					while(nickattr) {
+						if (!strcmp(nickattr->name, "name"))
+							nickname = strdup(getattrib(db, file, authorchild->line, nickattr));
+						else {
+							rnn_err(db, "%s:%d: wrong attribute \"%s\" for nick\n", file, authorchild->line, nickattr->name);
+						}
+						nickattr = nickattr->next;
+					}
+					if(!nickname) {
+						rnn_err(db, "%s:%d: missing \"name\" attribute for nick\n", file, authorchild->line);
+					} else
+						ADDARRAY(author->nicknames, nickname);
+				} else {
+					rnn_err(db, "%s:%d: wrong tag in author: <%s>\n", file, authorchild->line, authorchild->name);
+				}
+				authorchild = authorchild->next;
+			}
+			ADDARRAY(copyright->authors, author);
+		} else {
+			rnn_err(db, "%s:%d: wrong tag in copyright: <%s>\n", file, chain->line, chain->name);
+		}
+		chain = chain->next;
+	}
+}
+
+static int trytop (struct rnndb *db, char *file, xmlNode *node) {
+	if (!strcmp(node->name, "enum")) {
+		parseenum(db, file, node);
+		return 1;
+	} else if (!strcmp(node->name, "bitset")) {
+		parsebitset(db, file, node);
+		return 1;
+	} else if (!strcmp(node->name, "group")) {
+		parsegroup(db, file, node);
+		return 1;
+	} else if (!strcmp(node->name, "domain")) {
+		parsedomain(db, file, node);
+		return 1;
+	} else if (!strcmp(node->name, "spectype")) {
+		parsespectype(db, file, node);
+		return 1;
+	} else if (!strcmp(node->name, "import")) {
+		xmlAttr *attr = node->properties;
+		char *subfile = 0;
+		while (attr) {
+			if (!strcmp(attr->name, "file")) {
+				subfile = getattrib(db, file, node->line, attr);
+			} else {
+				rnn_err(db, "%s:%d: wrong attribute \"%s\" for import\n", file, node->line, attr->name);
+			}
+			attr = attr->next;
+		}
+		if (!subfile) {
+			rnn_err(db, "%s:%d: missing \"file\" attribute for import\n", file, node->line);
+		} else {
+			rnn_parsefile(db, subfile);
+		}
+		return 1;
+	} else if (!strcmp(node->name, "copyright")) {
+		parsecopyright(db, file, node);
+		return 1;
+	}
+	return 0;
+}
+
+static char * find_file(const char *file_orig)
+{
+	const char *rnn_path = getenv("RNN_PATH");
+	char *fname;
+
+	if (!rnn_path)
+		rnn_path = RNN_DEF_PATH;
+
+	FILE *file = find_in_path(file_orig, rnn_path, &fname);
+	if (!file) {
+		fprintf (stderr, "%s: couldn't find database file. Please set the env var RNN_PATH.\n", file_orig);
+		return NULL;
+	}
+	fclose(file);
+
+	return fname;
+}
+
+static int validate_doc(struct rnndb *db, xmlDocPtr doc, xmlNodePtr database)
+{
+	/* find the schemaLocation property: */
+	xmlAttrPtr attr = database->properties;
+	const char *schema_name = NULL;
+	char *schema_path;
+
+	while (attr) {
+		if (!strcmp(attr->name, "schemaLocation")) {
+			xmlNodePtr data = attr->children;
+			schema_name = data->content;
+			/* we expect this to look like <namespace url> schema.xsd.. I think
+			 * technically it is supposed to be just a URL, but that doesn't
+			 * quite match up to what we do.. Just skip over everything up to
+			 * and including the first whitespace character:
+			 */
+			while (schema_name && (schema_name[0] != ' '))
+				schema_name++;
+			schema_name++;
+			break;
+		}
+	}
+
+	if (!schema_name) {
+		rnn_err(db, "could not find schema.  Missing schemaLocation?");
+		return 0;
+	}
+
+	schema_path = find_file(schema_name);
+	if (!schema_path) {
+		rnn_err(db, "%s: couldn't find database file. Please set the env var RNN_PATH.\n", schema_name);
+		return 0;
+	}
+
+	xmlSchemaParserCtxtPtr parser = xmlSchemaNewParserCtxt(schema_path);
+	xmlSchemaPtr schema = xmlSchemaParse(parser);
+	xmlSchemaValidCtxtPtr validCtxt = xmlSchemaNewValidCtxt(schema);
+	int ret = xmlSchemaValidateDoc(validCtxt, doc);
+
+	xmlSchemaFreeValidCtxt(validCtxt);
+	xmlSchemaFree(schema);
+	xmlSchemaFreeParserCtxt(parser);
+
+	free(schema_path);
+
+	return ret;
+}
+
+void rnn_parsefile (struct rnndb *db, char *file_orig) {
+	int i;
+	char *fname;
+
+	fname = find_file(file_orig);
+	if (!fname) {
+		db->estatus = 1;
+		return;
+	}
+
+	for (i = 0; i < db->filesnum; i++)
+		if (!strcmp(db->files[i], fname))
+			return;
+		
+	ADDARRAY(db->files, fname);
+	xmlDocPtr doc = xmlParseFile(fname);
+	if (!doc) {
+		rnn_err(db, "%s: couldn't open database file. Please set the env var RNN_PATH.\n", fname);
+		return;
+	}
+	xmlNode *root = doc->children;
+	while (root) {
+		if (root->type != XML_ELEMENT_NODE) {
+		} else if (strcmp(root->name, "database")) {
+			rnn_err(db, "%s:%d: wrong top-level tag <%s>\n", fname, root->line, root->name);
+		} else {
+			xmlNode *chain = root->children;
+			if (validate_doc(db, doc, root)) {
+				rnn_err(db, "%s: database file has errors\n", fname);
+				return;
+			}
+			while (chain) {
+				if (chain->type != XML_ELEMENT_NODE) {
+				} else if (!trytop(db, fname, chain) && !trydoc(db, fname, chain)) {
+					rnn_err(db, "%s:%d: wrong tag in database: <%s>\n", fname, chain->line, chain->name);
+				}
+				chain = chain->next;
+			}
+		}
+		root = root->next;
+	}
+	xmlFreeDoc(doc);
+}
+
+static struct rnnvalue *copyvalue (struct rnnvalue *val, char *file) {
+	struct rnnvalue *res = calloc (sizeof *res, 1);
+	res->name = val->name;
+	res->valvalid = val->valvalid;
+	res->value = val->value;
+	res->varinfo = val->varinfo;
+	res->file = file;
+	return res;
+}
+
+static struct rnnbitfield *copybitfield (struct rnnbitfield *bf, char *file);
+
+
+static void copytypeinfo (struct rnntypeinfo *dst, struct rnntypeinfo *src, char *file) {
+	int i;
+	dst->name = src->name;
+	dst->shr = src->shr;
+	dst->low = src->low;
+	dst->high = src->high;
+	dst->min = src->min;
+	dst->max = src->max;
+	dst->align = src->align;
+	dst->addvariant = src->addvariant;
+	for (i = 0; i < src->valsnum; i++)
+		ADDARRAY(dst->vals, copyvalue(src->vals[i], file));
+	for (i = 0; i < src->bitfieldsnum; i++)
+		ADDARRAY(dst->bitfields, copybitfield(src->bitfields[i], file));
+}
+
+static struct rnnbitfield *copybitfield (struct rnnbitfield *bf, char *file) {
+	struct rnnbitfield *res = calloc (sizeof *res, 1);
+	res->name = bf->name;
+	res->varinfo = bf->varinfo;
+	res->file = file;
+	copytypeinfo(&res->typeinfo, &bf->typeinfo, file);
+	return res;
+}
+
+static struct rnndelem *copydelem (struct rnndelem *elem, char *file) {
+	struct rnndelem *res = calloc (sizeof *res, 1);
+	res->type = elem->type;
+	res->name = elem->name;
+	res->width = elem->width;
+	res->access = elem->access;
+	res->offset = elem->offset;
+	res->length = elem->length;
+	res->stride = elem->stride;
+	res->varinfo = elem->varinfo;
+	res->file = file;
+	copytypeinfo(&res->typeinfo, &elem->typeinfo, file);
+	int i;
+	for (i = 0; i < elem->subelemsnum; i++)
+		ADDARRAY(res->subelems, copydelem(elem->subelems[i], file));
+	for (i = 0; i < elem->offsetsnum; i++)
+		ADDARRAY(res->offsets, elem->offsets[i]);
+	return res;
+}
+
+static struct rnnvarset *copyvarset (struct rnnvarset *varset) {
+	struct rnnvarset *res = calloc(sizeof *res, 1);
+	res->venum = varset->venum;
+	res->variants = calloc(sizeof *res->variants, res->venum->valsnum);
+	int i;
+	for (i = 0; i < res->venum->valsnum; i++)
+		res->variants[i] = varset->variants[i];
+	return res;
+}
+
+static void prepenum(struct rnndb *db, struct rnnenum *en);
+
+static int findvidx (struct rnndb *db, struct rnnenum *en, char *name) {
+	int i;
+	for (i = 0; i < en->valsnum; i++)
+		if (!strcmp(en->vals[i]->name, name))
+			return i;
+	rnn_err(db, "Cannot find variant %s in enum %s!\n", name, en->name);
+	return -1;
+}
+
+static void prepvarinfo (struct rnndb *db, char *what, struct rnnvarinfo *vi, struct rnnvarinfo *parent) {
+	if (parent)
+		vi->prefenum = parent->prefenum;
+	if (vi->prefixstr) {
+		if (!strcmp(vi->prefixstr, "none"))
+			vi->prefenum = 0;
+		else
+			vi->prefenum = rnn_findenum(db, vi->prefixstr); // XXX
+	}
+	int i;
+	if (parent)
+		for (i = 0; i < parent->varsetsnum; i++)
+			ADDARRAY(vi->varsets, copyvarset(parent->varsets[i]));
+	struct rnnenum *varset = vi->prefenum;
+	if (!varset && !vi->varsetstr && parent)
+		vi->varsetstr = parent->varsetstr;
+	if (vi->varsetstr)
+		varset = rnn_findenum(db, vi->varsetstr);
+	if (vi->variantsstr) {
+		char *vars = vi->variantsstr;
+		if (!varset) {
+			rnn_err(db, "%s: tried to use variants without active varset!\n", what);
+			return;
+		}
+		struct rnnvarset *vs = 0;
+		int nvars = varset->valsnum;
+		for (i = 0; i < vi->varsetsnum; i++)
+			if (vi->varsets[i]->venum == varset) {
+				vs = vi->varsets[i];
+				break;
+			}
+		if (!vs) {
+			vs = calloc (sizeof *vs, 1);
+			vs->venum = varset;
+			vs->variants = calloc(sizeof *vs->variants, nvars);
+			for (i = 0; i < nvars; i++)
+				vs->variants[i] = 1;
+			ADDARRAY(vi->varsets, vs);
+		}
+		while (1) {
+			while (*vars == ' ') vars++;
+			if (*vars == 0)
+				break;
+			char *split = vars;
+			while (*split != ':' && *split != '-' && *split != ' '  && *split != 0)
+				split++;
+			char *first = 0;
+			if (split != vars)
+				first = strndup(vars, split-vars);
+			if (*split == ' ' || *split == 0) {
+				int idx = findvidx(db, varset, first);
+				if (idx != -1)
+					vs->variants[idx] |= 2;
+				vars = split;
+			} else {
+				char *end = split+1;
+				while (*end != ' '  && *end != 0)
+					end++;
+				char *second = 0;
+				if (end != split+1)
+					second = strndup(split+1, end-split-1);
+				int idx1 = 0;
+				if (first)
+					idx1 = findvidx(db, varset, first);
+				int idx2 = nvars;
+				if (second) {
+					idx2 = findvidx(db, varset, second);
+					if (*split == '-')
+						idx2++;
+				}
+				if (idx1 != -1 && idx2 != -1)
+					for (i = idx1; i < idx2; i++)
+						vs->variants[i] |= 2;
+				vars = end;
+				free(second);
+			}
+			free(first);
+		}
+		vi->dead = 1;
+		for (i = 0; i < nvars; i++) {
+			vs->variants[i] = (vs->variants[i] == 3);
+			if (vs->variants[i])
+				vi->dead = 0;
+		}
+	}
+	if (vi->dead)
+		return;
+	if (vi->prefenum) {
+		struct rnnvarset *vs = 0;
+		for (i = 0; i < vi->varsetsnum; i++)
+			if (vi->varsets[i]->venum == vi->prefenum) {
+				vs = vi->varsets[i];
+				break;
+			}
+		if (vs) {
+			for (i = 0; i < vi->prefenum->valsnum; i++)
+				if (vs->variants[i]) {
+					vi->prefix = vi->prefenum->vals[i]->name;
+					return;
+				}
+		} else {
+			vi->prefix = vi->prefenum->vals[0]->name;
+		}
+	}
+}
+
+static void prepvalue(struct rnndb *db, struct rnnvalue *val, char *prefix, struct rnnvarinfo *parvi) {
+	val->fullname = catstr(prefix, val->name);
+	prepvarinfo (db, val->fullname, &val->varinfo, parvi);
+	if (val->varinfo.dead)
+		return;
+	if (val->varinfo.prefix)
+		val->fullname = catstr(val->varinfo.prefix, val->fullname);
+}
+
+static void prepbitfield(struct rnndb *db, struct rnnbitfield *bf, char *prefix, struct rnnvarinfo *parvi);
+
+static void preptypeinfo(struct rnndb *db, struct rnntypeinfo *ti, char *prefix, struct rnnvarinfo *vi, char *file) {
+	int i;
+	if (ti->name) {
+		struct rnnenum *en = rnn_findenum (db, ti->name);
+		struct rnnbitset *bs = rnn_findbitset (db, ti->name);
+		struct rnnspectype *st = rnn_findspectype (db, ti->name);
+		if (en) {
+			if (en->isinline) {
+				ti->type = RNN_TTYPE_INLINE_ENUM;
+				int j;
+				for (j = 0; j < en->valsnum; j++)
+					ADDARRAY(ti->vals, copyvalue(en->vals[j], file));
+			} else {
+				ti->type = RNN_TTYPE_ENUM;
+				ti->eenum = en;
+			}
+		} else if (bs) {
+			if (bs->isinline) {
+				ti->type = RNN_TTYPE_INLINE_BITSET;
+				int j;
+				for (j = 0; j < bs->bitfieldsnum; j++)
+					ADDARRAY(ti->bitfields, copybitfield(bs->bitfields[j], file));
+			} else {
+				ti->type = RNN_TTYPE_BITSET;
+				ti->ebitset = bs;
+			}
+		} else if (st) {
+			ti->type = RNN_TTYPE_SPECTYPE;
+			ti->spectype = st;
+		} else if (!strcmp(ti->name, "hex")) {
+			ti->type = RNN_TTYPE_HEX;
+		} else if (!strcmp(ti->name, "float")) {
+			ti->type = RNN_TTYPE_FLOAT;
+		} else if (!strcmp(ti->name, "uint")) {
+			ti->type = RNN_TTYPE_UINT;
+		} else if (!strcmp(ti->name, "int")) {
+			ti->type = RNN_TTYPE_INT;
+		} else if (!strcmp(ti->name, "boolean")) {
+			ti->type = RNN_TTYPE_BOOLEAN;
+		} else if (!strcmp(ti->name, "bitfield")) {
+			ti->type = RNN_TTYPE_INLINE_BITSET;
+		} else if (!strcmp(ti->name, "enum")) {
+			ti->type = RNN_TTYPE_INLINE_ENUM;
+		} else if (!strcmp(ti->name, "fixed")) {
+			ti->type = RNN_TTYPE_FIXED;
+		} else if (!strcmp(ti->name, "ufixed")) {
+			ti->type = RNN_TTYPE_UFIXED;
+		} else if (!strcmp(ti->name, "a3xx_regid")) {
+			ti->type = RNN_TTYPE_A3XX_REGID;
+		} else if (!strcmp(ti->name, "waddress") || !strcmp(ti->name, "address")) {
+			ti->type = RNN_TTYPE_HEX;
+		} else {
+			ti->type = RNN_TTYPE_HEX;
+			rnn_err(db, "%s: unknown type %s\n", prefix, ti->name);
+		}
+	} else if (ti->bitfieldsnum) {
+		ti->name = "bitfield";
+		ti->type = RNN_TTYPE_INLINE_BITSET;
+	} else if (ti->valsnum) {
+		ti->name = "enum";
+		ti->type = RNN_TTYPE_INLINE_ENUM;
+	} else if (ti->low == 0 && ti->high == 0) {
+		ti->name = "boolean";
+		ti->type = RNN_TTYPE_BOOLEAN;
+	} else {
+		ti->name = "hex";
+		ti->type = RNN_TTYPE_HEX;
+	}
+	if (ti->addvariant && ti->type != RNN_TTYPE_ENUM) {
+		rnn_err(db, "%s: addvariant specified on non-enum type %s\n", prefix, ti->name);
+	}
+	for (i = 0; i < ti->bitfieldsnum; i++)
+		prepbitfield(db,  ti->bitfields[i], prefix, vi);
+	for (i = 0; i < ti->valsnum; i++)
+		prepvalue(db, ti->vals[i], prefix, vi);
+}
+
+static void prepbitfield(struct rnndb *db, struct rnnbitfield *bf, char *prefix, struct rnnvarinfo *parvi) {
+	bf->fullname = catstr(prefix, bf->name);
+	prepvarinfo (db, bf->fullname, &bf->varinfo, parvi);
+	if (bf->varinfo.dead)
+		return;
+	preptypeinfo(db, &bf->typeinfo, bf->fullname, &bf->varinfo, bf->file);
+	if (bf->varinfo.prefix)
+		bf->fullname = catstr(bf->varinfo.prefix, bf->fullname);
+}
+
+static void prepdelem(struct rnndb *db, struct rnndelem *elem, char *prefix, struct rnnvarinfo *parvi, int width) {
+	if (elem->type == RNN_ETYPE_USE_GROUP) {
+		int i;
+		struct rnngroup *gr = 0;
+		for (i = 0; i < db->groupsnum; i++)
+			if (!strcmp(db->groups[i]->name, elem->name)) {
+				gr = db->groups[i];
+				break;
+			}
+		if (gr) {
+			for (i = 0; i < gr->subelemsnum; i++)
+				ADDARRAY(elem->subelems, copydelem(gr->subelems[i], elem->file));
+		} else {
+			rnn_err(db, "group %s not found!\n", elem->name);
+		}
+		elem->type = RNN_ETYPE_STRIPE;
+		elem->length = 1;
+		elem->name = 0;
+	}
+	if (elem->name)
+		elem->fullname = catstr(prefix, elem->name);
+	prepvarinfo (db, elem->fullname?elem->fullname:prefix, &elem->varinfo, parvi);
+	if (elem->varinfo.dead)
+		return;
+	if (elem->length != 1 && !elem->stride) {
+		if (elem->type != RNN_ETYPE_REG) {
+			rnn_err(db, "%s has non-1 length, but no stride!\n", elem->fullname);
+		} else {
+			elem->stride = elem->width/width;
+		}
+	}
+	preptypeinfo(db, &elem->typeinfo, elem->name?elem->fullname:prefix, &elem->varinfo, elem->file);
+
+	int i;
+	for (i = 0; i < elem->subelemsnum; i++)
+		prepdelem(db,  elem->subelems[i], elem->name?elem->fullname:prefix, &elem->varinfo, width);
+	if (elem->varinfo.prefix && elem->name)
+		elem->fullname = catstr(elem->varinfo.prefix, elem->fullname);
+}
+
+static void prepdomain(struct rnndb *db, struct rnndomain *dom) {
+	prepvarinfo (db, dom->name, &dom->varinfo, 0);
+	int i;
+	for (i = 0; i < dom->subelemsnum; i++)
+		prepdelem(db, dom->subelems[i], dom->bare?0:dom->name, &dom->varinfo, dom->width);
+	dom->fullname = catstr(dom->varinfo.prefix, dom->name);
+}
+
+static void prepenum(struct rnndb *db, struct rnnenum *en) {
+	if (en->prepared)
+		return;
+	prepvarinfo (db, en->name, &en->varinfo, 0);
+	int i;
+	if (en->isinline)
+		return;
+	for (i = 0; i < en->valsnum; i++)
+		prepvalue(db, en->vals[i], en->bare?0:en->name, &en->varinfo);
+	en->fullname = catstr(en->varinfo.prefix, en->name);
+	en->prepared = 1;
+}
+
+static void prepbitset(struct rnndb *db, struct rnnbitset *bs) {
+	prepvarinfo (db, bs->name, &bs->varinfo, 0);
+	int i;
+	if (bs->isinline)
+		return;
+	for (i = 0; i < bs->bitfieldsnum; i++)
+		prepbitfield(db, bs->bitfields[i], bs->bare?0:bs->name, &bs->varinfo);
+	bs->fullname = catstr(bs->varinfo.prefix, bs->name);
+}
+
+static void prepspectype(struct rnndb *db, struct rnnspectype *st) {
+	preptypeinfo(db, &st->typeinfo, st->name, 0, st->file); // XXX doesn't exactly make sense...
+}
+
+void rnn_prepdb (struct rnndb *db) {
+	int i;
+	for (i = 0; i < db->enumsnum; i++)
+		prepenum(db, db->enums[i]);
+	for (i = 0; i < db->bitsetsnum; i++)
+		prepbitset(db, db->bitsets[i]);
+	for (i = 0; i < db->domainsnum; i++)
+		prepdomain(db, db->domains[i]);
+	for (i = 0; i < db->spectypesnum; i++)
+		prepspectype(db, db->spectypes[i]);
+}
+
+struct rnnenum *rnn_findenum (struct rnndb *db, const char *name) {
+	int i;
+	for (i = 0; i < db->enumsnum; i++)
+		if (!strcmp(db->enums[i]->name, name))
+			return db->enums[i];
+	return 0;
+}
+
+struct rnnbitset *rnn_findbitset (struct rnndb *db, const char *name) {
+	int i;
+	for (i = 0; i < db->bitsetsnum; i++)
+		if (!strcmp(db->bitsets[i]->name, name))
+			return db->bitsets[i];
+	return 0;
+}
+
+struct rnndomain *rnn_finddomain (struct rnndb *db, const char *name) {
+	int i;
+	for (i = 0; i < db->domainsnum; i++)
+		if (!strcmp(db->domains[i]->name, name))
+			return db->domains[i];
+	return 0;
+}
+
+struct rnnspectype *rnn_findspectype (struct rnndb *db, const char *name) {
+	int i;
+	for (i = 0; i < db->spectypesnum; i++)
+		if (!strcmp(db->spectypes[i]->name, name))
+			return db->spectypes[i];
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/headergen2/rnn.h b/drivers/gpu/drm/msm/headergen2/rnn.h
new file mode 100644
index 000000000000..f90af090eb4d
--- /dev/null
+++ b/drivers/gpu/drm/msm/headergen2/rnn.h
@@ -0,0 +1,243 @@
+/*
+ * Copyright (C) 2010 Marcin Kościelnicki <koriakin@0x04.net>
+ * Copyright (C) 2010 Luca Barbieri <luca@luca-barbieri.com>
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef RNN_H
+#define RNN_H
+
+#include <stdint.h>
+#include <stdlib.h>
+
+struct rnnauthor {
+	char* name;
+	char* email;
+	char* contributions;
+	char* license;
+	char** nicknames;
+	int nicknamesnum;
+	int nicknamesmax;
+};
+
+struct rnncopyright {
+	unsigned firstyear;
+	char* license;
+	struct rnnauthor **authors;
+	int authorsnum;
+	int authorsmax;
+};
+
+struct rnndb {
+	struct rnncopyright copyright;
+	struct rnnenum **enums;
+	int enumsnum;
+	int enumsmax;
+	struct rnnbitset **bitsets;
+	int bitsetsnum;
+	int bitsetsmax;
+	struct rnndomain **domains;
+	int domainsnum;
+	int domainsmax;
+	struct rnngroup **groups;
+	int groupsnum;
+	int groupsmax;
+	struct rnnspectype **spectypes;
+	int spectypesnum;
+	int spectypesmax;
+	char **files;
+	int filesnum;
+	int filesmax;
+	int estatus;
+};
+
+struct rnnvarset {
+	struct rnnenum *venum;
+	int *variants;
+};
+
+struct rnnvarinfo {
+	char *prefixstr;
+	char *varsetstr;
+	char *variantsstr;
+	int dead;
+	struct rnnenum *prefenum;
+	char *prefix;
+	struct rnnvarset **varsets;
+	int varsetsnum;
+	int varsetsmax;
+};
+
+struct rnnenum {
+	char *name;
+	int bare;
+	int isinline;
+	struct rnnvarinfo varinfo;
+	struct rnnvalue **vals;
+	int valsnum;
+	int valsmax;
+	char *fullname;
+	int prepared;
+	char *file;
+};
+
+struct rnnvalue {
+	char *name;
+	int valvalid;
+	uint64_t value;
+	struct rnnvarinfo varinfo;
+	char *fullname;
+	char *file;
+};
+
+struct rnntypeinfo {
+	char *name;
+	enum rnnttype {
+		RNN_TTYPE_INVALID,
+		RNN_TTYPE_INLINE_ENUM,
+		RNN_TTYPE_INLINE_BITSET,
+		RNN_TTYPE_ENUM,
+		RNN_TTYPE_BITSET,
+		RNN_TTYPE_SPECTYPE,
+		RNN_TTYPE_HEX,
+		RNN_TTYPE_INT,
+		RNN_TTYPE_UINT,
+		RNN_TTYPE_FLOAT,
+		RNN_TTYPE_BOOLEAN,
+		RNN_TTYPE_FIXED,
+		RNN_TTYPE_UFIXED,
+		RNN_TTYPE_A3XX_REGID,
+	} type;
+	struct rnnenum *eenum;
+	struct rnnbitset *ebitset;
+	struct rnnspectype *spectype;
+	struct rnnbitfield **bitfields;
+	int bitfieldsnum;
+	int bitfieldsmax;
+	struct rnnvalue **vals;
+	int valsnum;
+	int valsmax;
+	int shr, low, high;
+	uint64_t min, max, align, radix;
+	int addvariant;
+	int minvalid, maxvalid, alignvalid, radixvalid;
+};
+
+static inline uint64_t typeinfo_mask(struct rnntypeinfo *ti)
+{
+	if (ti->high == 63)
+		return -(1ULL << ti->low);
+	else
+		return (1ULL << (ti->high + 1)) - (1ULL << ti->low);
+}
+
+struct rnnbitset {
+	char *name;
+	int bare;
+	int isinline;
+	struct rnnvarinfo varinfo;
+	struct rnnbitfield **bitfields;
+	int bitfieldsnum;
+	int bitfieldsmax;
+	char *fullname;
+	char *file;
+};
+
+struct rnnbitfield {
+	char *name;
+	struct rnnvarinfo varinfo;
+	struct rnntypeinfo typeinfo;
+	char *fullname;
+	char *file;
+};
+
+struct rnndomain {
+	char *name;
+	int bare;
+	int width;
+	uint64_t size;
+	int sizevalid;
+	struct rnnvarinfo varinfo;
+	struct rnndelem **subelems;
+	int subelemsnum;
+	int subelemsmax;
+	char *fullname;
+	char *file;
+};
+
+struct rnngroup {
+	char *name;
+	struct rnndelem **subelems;
+	int subelemsnum;
+	int subelemsmax;
+};
+
+struct rnndelem {
+	enum rnnetype {
+		RNN_ETYPE_REG,
+		RNN_ETYPE_ARRAY,
+		RNN_ETYPE_STRIPE,
+		RNN_ETYPE_USE_GROUP,
+	} type;
+	char *name;
+	int width;
+	enum rnnaccess {
+		RNN_ACCESS_R,
+		RNN_ACCESS_W,
+		RNN_ACCESS_RW,
+	} access;
+	uint64_t offset;
+	uint64_t *offsets;       /* for "array" with irregular offsets */
+	int offsetsnum;
+	int offsetsmax;
+	char *doffset;
+	char **doffsets;
+	int doffsetsnum;
+	int doffsetsmax;
+	uint64_t length;
+	uint64_t stride;
+	struct rnndelem **subelems;
+	int subelemsnum;
+	int subelemsmax;
+	struct rnnvarinfo varinfo;
+	struct rnntypeinfo typeinfo;
+	struct rnnenum *index;   /* for arrays, for symbolic idx values */
+	char *fullname;
+	char *file;
+};
+
+struct rnnspectype {
+	char *name;
+	struct rnntypeinfo typeinfo;
+	char *file;
+};
+
+void rnn_init(void);
+struct rnndb *rnn_newdb(void);
+void rnn_parsefile (struct rnndb *db, char *file);
+void rnn_prepdb (struct rnndb *db);
+struct rnnenum *rnn_findenum (struct rnndb *db, const char *name);
+struct rnnbitset *rnn_findbitset (struct rnndb *db, const char *name);
+struct rnndomain *rnn_finddomain (struct rnndb *db, const char *name);
+struct rnnspectype *rnn_findspectype (struct rnndb *db, const char *name);
+
+#endif
diff --git a/drivers/gpu/drm/msm/headergen2/rnndec.c b/drivers/gpu/drm/msm/headergen2/rnndec.c
new file mode 100644
index 000000000000..553c422d0545
--- /dev/null
+++ b/drivers/gpu/drm/msm/headergen2/rnndec.c
@@ -0,0 +1,550 @@
+/*
+ * Copyright (C) 2010-2011 Marcin Kościelnicki <koriakin@0x04.net>
+ * Copyright (C) 2010 Francisco Jerez <currojerez@riseup.net>
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "rnndec.h"
+#include <assert.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <inttypes.h>
+#include "util.h"
+
+struct rnndeccontext *rnndec_newcontext(struct rnndb *db) {
+	struct rnndeccontext *res = calloc (sizeof *res, 1);
+	res->db = db;
+	res->colors = &envy_null_colors;
+	return res;
+}
+
+int rnndec_varadd(struct rnndeccontext *ctx, char *varset, const char *variant) {
+	struct rnnenum *en = rnn_findenum(ctx->db, varset);
+	if (!en) {
+		fprintf (stderr, "Enum %s doesn't exist in database!\n", varset);
+		return 0;
+	}
+	int i, j;
+	for (i = 0; i < en->valsnum; i++)
+		if (!strcasecmp(en->vals[i]->name, variant)) {
+			struct rnndecvariant *ci = calloc (sizeof *ci, 1);
+			ci->en = en;
+			ci->variant = i;
+			ADDARRAY(ctx->vars, ci);
+			return 1;
+		}
+
+	if (i == en->valsnum) {
+		fprintf (stderr, "Variant %s doesn't exist in enum %s!\n", variant, varset);
+		return 0;
+	}
+
+	for (j = 0; j < ctx->varsnum; j++) {
+		if (ctx->vars[j]->en == en) {
+			ctx->vars[j]->variant = i;
+			break;
+		}
+	}
+
+	if (i == ctx->varsnum) {
+		struct rnndecvariant *ci = calloc (sizeof *ci, 1);
+		ci->en = en;
+		ci->variant = i;
+		ADDARRAY(ctx->vars, ci);
+	}
+
+	return 1;
+}
+
+int rnndec_varmatch(struct rnndeccontext *ctx, struct rnnvarinfo *vi) {
+	if (vi->dead)
+		return 0;
+	int i;
+	for (i = 0; i < vi->varsetsnum; i++) {
+		int j;
+		for (j = 0; j < ctx->varsnum; j++)
+			if (vi->varsets[i]->venum == ctx->vars[j]->en)
+				break;
+		if (j == ctx->varsnum) {
+			fprintf (stderr, "I don't know which %s variant to use!\n", vi->varsets[i]->venum->name);
+		} else {
+			if (!vi->varsets[i]->variants[ctx->vars[j]->variant])
+				return 0;
+		}
+	}
+	return 1;
+}
+
+/* see https://en.wikipedia.org/wiki/Half-precision_floating-point_format */
+static uint32_t float16i(uint16_t val)
+{
+	uint32_t sign = ((uint32_t)(val & 0x8000)) << 16;
+	uint32_t frac = val & 0x3ff;
+	int32_t  expn = (val >> 10) & 0x1f;
+
+	if (expn == 0) {
+		if (frac) {
+			/* denormalized number: */
+			int shift = __builtin_clz(frac) - 21;
+			frac <<= shift;
+			expn = -shift;
+		} else {
+			/* +/- zero: */
+			return sign;
+		}
+	} else if (expn == 0x1f) {
+		/* Inf/NaN: */
+		return sign | 0x7f800000 | (frac << 13);
+	}
+
+	return sign | ((expn + 127 - 15) << 23) | (frac << 13);
+}
+static float float16(uint16_t val)
+{
+	union { uint32_t i; float f; } u;
+	u.i = float16i(val);
+	return u.f;
+}
+
+static const char *rnndec_decode_enum_val(struct rnndeccontext *ctx,
+		struct rnnvalue **vals, int valsnum, uint64_t value)
+{
+	int i;
+	for (i = 0; i < valsnum; i++)
+		if (rnndec_varmatch(ctx, &vals[i]->varinfo) &&
+				vals[i]->valvalid && vals[i]->value == value)
+			return vals[i]->name;
+	return NULL;
+}
+
+const char *rnndec_decode_enum(struct rnndeccontext *ctx, const char *enumname, uint64_t enumval)
+{
+	struct rnnenum *en = rnn_findenum (ctx->db, enumname);
+	if (en) {
+		return rnndec_decode_enum_val(ctx, en->vals, en->valsnum, enumval);
+	}
+	return NULL;
+}
+
+/* The name UNK%u is used as a placeholder for bitfields that exist but
+ * have an unknown function.
+ */
+static int is_unknown(const char *name)
+{
+	unsigned u;
+	return sscanf(name, "UNK%u", &u) == 1;
+}
+
+char *rnndec_decodeval(struct rnndeccontext *ctx, struct rnntypeinfo *ti, uint64_t value) {
+	int width = ti->high - ti->low + 1;
+	char *res = 0;
+	int i;
+	struct rnnvalue **vals;
+	int valsnum;
+	struct rnnbitfield **bitfields;
+	int bitfieldsnum;
+	char *tmp;
+	const char *ctmp;
+	uint64_t mask, value_orig;
+	if (!ti)
+		goto failhex;
+	value_orig = value;
+	value = (value & typeinfo_mask(ti)) >> ti->low;
+	value <<= ti->shr;
+
+	switch (ti->type) {
+		case RNN_TTYPE_ENUM:
+			vals = ti->eenum->vals;
+			valsnum = ti->eenum->valsnum;
+			goto doenum;
+		case RNN_TTYPE_INLINE_ENUM:
+			vals = ti->vals;
+			valsnum = ti->valsnum;
+			goto doenum;
+		doenum:
+			ctmp = rnndec_decode_enum_val(ctx, vals, valsnum, value);
+			if (ctmp) {
+				asprintf (&res, "%s%s%s", ctx->colors->eval, ctmp, ctx->colors->reset);
+				if (ti->addvariant) {
+					rnndec_varadd(ctx, ti->eenum->name, ctmp);
+				}
+				break;
+			}
+			goto failhex;
+		case RNN_TTYPE_BITSET:
+			bitfields = ti->ebitset->bitfields;
+			bitfieldsnum = ti->ebitset->bitfieldsnum;
+			goto dobitset;
+		case RNN_TTYPE_INLINE_BITSET:
+			bitfields = ti->bitfields;
+			bitfieldsnum = ti->bitfieldsnum;
+			goto dobitset;
+		dobitset:
+			mask = 0;
+			for (i = 0; i < bitfieldsnum; i++) {
+				if (!rnndec_varmatch(ctx, &bitfields[i]->varinfo))
+					continue;
+				uint64_t type_mask = typeinfo_mask(&bitfields[i]->typeinfo);
+				if (((value & type_mask) == 0) && is_unknown(bitfields[i]->name))
+					continue;
+				mask |= type_mask;
+				if (bitfields[i]->typeinfo.type == RNN_TTYPE_BOOLEAN) {
+					const char *color = is_unknown(bitfields[i]->name) ?
+							ctx->colors->err : ctx->colors->mod;
+					if (value & type_mask) {
+						if (!res)
+							asprintf (&res, "%s%s%s", color, bitfields[i]->name, ctx->colors->reset);
+						else {
+							asprintf (&tmp, "%s | %s%s%s", res, color, bitfields[i]->name, ctx->colors->reset);
+							free(res);
+							res = tmp;
+						}
+					}
+					continue;
+				}
+				char *subval;
+				if (is_unknown(bitfields[i]->name) && (bitfields[i]->typeinfo.type != RNN_TTYPE_A3XX_REGID)) {
+					uint64_t field_val = value & type_mask;
+					field_val = (field_val & typeinfo_mask(&bitfields[i]->typeinfo)) >> bitfields[i]->typeinfo.low;
+					field_val <<= bitfields[i]->typeinfo.shr;
+					asprintf (&subval, "%s%#"PRIx64"%s", ctx->colors->err, field_val, ctx->colors->reset);
+				} else {
+					subval = rnndec_decodeval(ctx, &bitfields[i]->typeinfo, value & type_mask);
+				}
+				if (!res)
+					asprintf (&res, "%s%s%s = %s", ctx->colors->rname, bitfields[i]->name, ctx->colors->reset, subval);
+				else {
+					asprintf (&tmp, "%s | %s%s%s = %s", res, ctx->colors->rname, bitfields[i]->name, ctx->colors->reset, subval);
+					free(res);
+					res = tmp;
+				}
+				free(subval);
+			}
+			if (value & ~mask) {
+				if (!res)
+					asprintf (&res, "%s%#"PRIx64"%s", ctx->colors->err, value & ~mask, ctx->colors->reset);
+				else {
+					asprintf (&tmp, "%s | %s%#"PRIx64"%s", res, ctx->colors->err, value & ~mask, ctx->colors->reset);
+					free(res);
+					res = tmp;
+				}
+			}
+			if (!res)
+				asprintf (&res, "%s0%s", ctx->colors->num, ctx->colors->reset);
+			asprintf (&tmp, "{ %s }", res);
+			free(res);
+			return tmp;
+		case RNN_TTYPE_SPECTYPE:
+			return rnndec_decodeval(ctx, &ti->spectype->typeinfo, value);
+		case RNN_TTYPE_HEX:
+			asprintf (&res, "%s%#"PRIx64"%s", ctx->colors->num, value, ctx->colors->reset);
+			break;
+		case RNN_TTYPE_FIXED:
+			if (value & UINT64_C(1) << (width-1)) {
+				asprintf (&res, "%s-%lf%s", ctx->colors->num,
+						((double)((UINT64_C(1) << width) - value)) / ((double)(1 << ti->radix)),
+						ctx->colors->reset);
+				break;
+			}
+			/* fallthrough */
+		case RNN_TTYPE_UFIXED:
+			asprintf (&res, "%s%lf%s", ctx->colors->num,
+					((double)value) / ((double)(1LL << ti->radix)),
+					ctx->colors->reset);
+			break;
+		case RNN_TTYPE_A3XX_REGID:
+			asprintf (&res, "%sr%"PRIu64".%c%s", ctx->colors->num, (value >> 2), "xyzw"[value & 0x3], ctx->colors->reset);
+			break;
+		case RNN_TTYPE_UINT:
+			asprintf (&res, "%s%"PRIu64"%s", ctx->colors->num, value, ctx->colors->reset);
+			break;
+		case RNN_TTYPE_INT:
+			if (value & UINT64_C(1) << (width-1))
+				asprintf (&res, "%s-%"PRIi64"%s", ctx->colors->num, (UINT64_C(1) << width) - value, ctx->colors->reset);
+			else
+				asprintf (&res, "%s%"PRIi64"%s", ctx->colors->num, value, ctx->colors->reset);
+			break;
+		case RNN_TTYPE_BOOLEAN:
+			if (value == 0) {
+				asprintf (&res, "%sFALSE%s", ctx->colors->eval, ctx->colors->reset);
+			} else if (value == 1) {
+				asprintf (&res, "%sTRUE%s", ctx->colors->eval, ctx->colors->reset);
+			}
+			break;
+		case RNN_TTYPE_FLOAT: {
+			union { uint64_t i; float f; double d; } val;
+			val.i = value;
+			if (width == 64)
+				asprintf(&res, "%s%f%s", ctx->colors->num,
+					val.d, ctx->colors->reset);
+			else if (width == 32)
+				asprintf(&res, "%s%f%s", ctx->colors->num,
+					val.f, ctx->colors->reset);
+			else if (width == 16)
+				asprintf(&res, "%s%f%s", ctx->colors->num,
+					float16(value), ctx->colors->reset);
+			else
+				goto failhex;
+
+			break;
+		}
+		failhex:
+		default:
+			asprintf (&res, "%s%#"PRIx64"%s", ctx->colors->num, value, ctx->colors->reset);
+			break;
+	}
+	if (value_orig & ~typeinfo_mask(ti)) {
+		asprintf (&tmp, "%s | %s%#"PRIx64"%s", res, ctx->colors->err, value_orig & ~typeinfo_mask(ti), ctx->colors->reset);
+		free(res);
+		res = tmp;
+	}
+	return res;
+}
+
+static char *appendidx (struct rnndeccontext *ctx, char *name, uint64_t idx, struct rnnenum *index) {
+	char *res;
+	const char *index_name = NULL;
+
+	if (index)
+		index_name = rnndec_decode_enum_val(ctx, index->vals, index->valsnum, idx);
+
+	if (index_name)
+		asprintf (&res, "%s[%s%s%s]", name, ctx->colors->eval, index_name, ctx->colors->reset);
+	else
+		asprintf (&res, "%s[%s%#"PRIx64"%s]", name, ctx->colors->num, idx, ctx->colors->reset);
+
+	free (name);
+	return res;
+}
+
+/* This could probably be made to work for stripes too.. */
+static int get_array_idx_offset(struct rnndelem *elem, uint64_t addr, uint64_t *idx, uint64_t *offset)
+{
+	if (elem->offsets) {
+		int i;
+		for (i = 0; i < elem->offsetsnum; i++) {
+			uint64_t o = elem->offsets[i];
+			if ((o <= addr) && (addr < (o + elem->stride))) {
+				*idx = i;
+				*offset = addr - o;
+				return 0;
+			}
+		}
+		return -1;
+	} else {
+		if (addr < elem->offset)
+			return -1;
+
+		*idx = (addr - elem->offset) / elem->stride;
+		*offset = (addr - elem->offset) % elem->stride;
+
+		if (elem->length && (*idx >= elem->length))
+			return -1;
+
+		return 0;
+	}
+}
+
+static struct rnndecaddrinfo *trymatch (struct rnndeccontext *ctx, struct rnndelem **elems, int elemsnum, uint64_t addr, int write, int dwidth, uint64_t *indices, int indicesnum) {
+	struct rnndecaddrinfo *res;
+	int i, j;
+	for (i = 0; i < elemsnum; i++) {
+		if (!rnndec_varmatch(ctx, &elems[i]->varinfo))
+			continue;
+		uint64_t offset, idx;
+		char *tmp, *name;
+		switch (elems[i]->type) {
+			case RNN_ETYPE_REG:
+				if (addr < elems[i]->offset)
+					break;
+				if (elems[i]->stride) {
+					idx = (addr-elems[i]->offset)/elems[i]->stride;
+					offset = (addr-elems[i]->offset)%elems[i]->stride;
+				} else {
+					idx = 0;
+					offset = addr-elems[i]->offset;
+				}
+				if (offset >= elems[i]->width/dwidth)
+					break;
+				if (elems[i]->length && idx >= elems[i]->length)
+					break;
+				res = calloc (sizeof *res, 1);
+				res->typeinfo = &elems[i]->typeinfo;
+				res->width = elems[i]->width;
+				asprintf (&res->name, "%s%s%s", ctx->colors->rname, elems[i]->name, ctx->colors->reset);
+				for (j = 0; j < indicesnum; j++)
+					res->name = appendidx(ctx, res->name, indices[j], NULL);
+				if (elems[i]->length != 1)
+					res->name = appendidx(ctx, res->name, idx, elems[i]->index);
+				if (offset) {
+					asprintf (&tmp, "%s+%s%#"PRIx64"%s", res->name, ctx->colors->err, offset, ctx->colors->reset);
+					free(res->name);
+					res->name = tmp;
+				}
+				return res;
+			case RNN_ETYPE_STRIPE:
+				for (idx = 0; idx < elems[i]->length || !elems[i]->length; idx++) {
+					if (addr < elems[i]->offset + elems[i]->stride * idx)
+						break;
+					offset = addr - (elems[i]->offset + elems[i]->stride * idx);
+					int extraidx = (elems[i]->length != 1);
+					int nindnum = (elems[i]->name ? 0 : indicesnum + extraidx);
+					uint64_t nind[nindnum];
+					if (!elems[i]->name) {
+						for (j = 0; j < indicesnum; j++)
+							nind[j] = indices[j];
+						if (extraidx)
+							nind[indicesnum] = idx;
+					}
+					res = trymatch (ctx, elems[i]->subelems, elems[i]->subelemsnum, offset, write, dwidth, nind, nindnum);
+					if (!res)
+						continue;
+					if (!elems[i]->name)
+						return res;
+					asprintf (&name, "%s%s%s", ctx->colors->rname, elems[i]->name, ctx->colors->reset);
+					for (j = 0; j < indicesnum; j++)
+						name = appendidx(ctx, name, indices[j], NULL);
+					if (elems[i]->length != 1)
+						name = appendidx(ctx, name, idx, elems[i]->index);
+					asprintf (&tmp, "%s.%s", name, res->name);
+					free(name);
+					free(res->name);
+					res->name = tmp;
+					return res;
+				}
+				break;
+			case RNN_ETYPE_ARRAY:
+				if (get_array_idx_offset(elems[i], addr, &idx, &offset))
+					break;
+				asprintf (&name, "%s%s%s", ctx->colors->rname, elems[i]->name, ctx->colors->reset);
+				for (j = 0; j < indicesnum; j++)
+					name = appendidx(ctx, name, indices[j], NULL);
+				if (elems[i]->length != 1)
+					name = appendidx(ctx, name, idx, elems[i]->index);
+				if ((res = trymatch (ctx, elems[i]->subelems, elems[i]->subelemsnum, offset, write, dwidth, 0, 0))) {
+					asprintf (&tmp, "%s.%s", name, res->name);
+					free(name);
+					free(res->name);
+					res->name = tmp;
+					return res;
+				}
+				res = calloc (sizeof *res, 1);
+				asprintf (&tmp, "%s+%s%#"PRIx64"%s", name, ctx->colors->err, offset, ctx->colors->reset);
+				free(name);
+				res->name = tmp;
+				return res;
+			default:
+				break;
+		}
+	}
+	return 0;
+}
+
+int rnndec_checkaddr(struct rnndeccontext *ctx, struct rnndomain *domain, uint64_t addr, int write) {
+	struct rnndecaddrinfo *res = trymatch(ctx, domain->subelems, domain->subelemsnum, addr, write, domain->width, 0, 0);
+	if (res) {
+		free(res->name);
+		free(res);
+	}
+	return res != NULL;
+}
+
+struct rnndecaddrinfo *rnndec_decodeaddr(struct rnndeccontext *ctx, struct rnndomain *domain, uint64_t addr, int write) {
+	struct rnndecaddrinfo *res = trymatch(ctx, domain->subelems, domain->subelemsnum, addr, write, domain->width, 0, 0);
+	if (res)
+		return res;
+	res = calloc (sizeof *res, 1);
+	asprintf (&res->name, "%s%#"PRIx64"%s", ctx->colors->err, addr, ctx->colors->reset);
+	return res;
+}
+
+static unsigned tryreg(struct rnndeccontext *ctx, struct rnndelem **elems, int elemsnum,
+		int dwidth, const char *name, uint64_t *offset)
+{
+	int i;
+	unsigned ret;
+	const char *suffix = strchr(name, '[');
+	unsigned n = suffix ? (suffix - name) : strlen(name);
+	const char *dotsuffix = strchr(name, '.');
+	unsigned dotn = dotsuffix ? (dotsuffix - name) : strlen(name);
+
+	const char *child = NULL;
+	unsigned idx = 0;
+
+	if (suffix) {
+		const char *tmp = strchr(suffix, ']');
+		idx = strtol(suffix+1, NULL, 0);
+		child = tmp+2;
+	}
+
+	for (i = 0; i < elemsnum; i++) {
+		struct rnndelem *elem = elems[i];
+		if (!rnndec_varmatch(ctx, &elem->varinfo))
+			continue;
+		int match = elem->name && (strlen(elem->name) == n) && !strncmp(elem->name, name, n);
+		switch (elem->type) {
+			case RNN_ETYPE_REG:
+				if (match) {
+					assert(!suffix);
+					*offset = elem->offset;
+					return 1;
+				}
+				break;
+			case RNN_ETYPE_STRIPE:
+				if (elem->name) {
+					if (!dotsuffix)
+						break;
+					if (strlen(elem->name) != dotn || strncmp(elem->name, name, dotn))
+						break;
+				}
+				ret = tryreg(ctx, elem->subelems, elem->subelemsnum, dwidth,
+					elem->name ? dotsuffix : name, offset);
+				if (ret)
+					return 1;
+				break;
+			case RNN_ETYPE_ARRAY:
+				if (match) {
+					assert(suffix);
+					ret = tryreg(ctx, elem->subelems, elem->subelemsnum, dwidth, child, offset);
+					if (ret) {
+						*offset += elem->offset + (idx * elem->stride);
+						return 1;
+					}
+				}
+				break;
+			default:
+				break;
+		}
+	}
+	return 0;
+}
+
+uint64_t rnndec_decodereg(struct rnndeccontext *ctx, struct rnndomain *domain, const char *name)
+{
+	uint64_t offset;
+	if (tryreg(ctx, domain->subelems, domain->subelemsnum, domain->width, name, &offset)) {
+		return offset;
+	} else {
+		return 0;
+	}
+}
diff --git a/drivers/gpu/drm/msm/headergen2/rnndec.h b/drivers/gpu/drm/msm/headergen2/rnndec.h
new file mode 100644
index 000000000000..6e90eb9e97df
--- /dev/null
+++ b/drivers/gpu/drm/msm/headergen2/rnndec.h
@@ -0,0 +1,59 @@
+/*
+ * Copyright (C) 2010 Marcin Kościelnicki <koriakin@0x04.net>
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef RNNDEC_H
+#define RNNDEC_H
+
+#include "rnn.h"
+#include "colors.h"
+
+struct rnndecvariant {
+	struct rnnenum *en;
+	int variant;
+};
+
+struct rnndeccontext {
+	struct rnndb *db;
+	struct rnndecvariant **vars;
+	int varsnum;
+	int varsmax;
+	const struct envy_colors *colors;
+};
+
+struct rnndecaddrinfo {
+	struct rnntypeinfo *typeinfo;
+	int width;
+	char *name;
+};
+
+struct rnndeccontext *rnndec_newcontext(struct rnndb *db);
+int rnndec_varadd(struct rnndeccontext *ctx, char *varset, const char *variant);
+int rnndec_varmatch(struct rnndeccontext *ctx, struct rnnvarinfo *vi);
+const char *rnndec_decode_enum(struct rnndeccontext *ctx, const char *enumname, uint64_t enumval);
+char *rnndec_decodeval(struct rnndeccontext *ctx, struct rnntypeinfo *ti, uint64_t value);
+int rnndec_checkaddr(struct rnndeccontext *ctx, struct rnndomain *domain, uint64_t addr, int write);
+struct rnndecaddrinfo *rnndec_decodeaddr(struct rnndeccontext *ctx, struct rnndomain *domain, uint64_t addr, int write);
+uint64_t rnndec_decodereg(struct rnndeccontext *ctx, struct rnndomain *domain, const char *name);
+
+#endif
diff --git a/drivers/gpu/drm/msm/headergen2/util.h b/drivers/gpu/drm/msm/headergen2/util.h
new file mode 100644
index 000000000000..98a32a34d076
--- /dev/null
+++ b/drivers/gpu/drm/msm/headergen2/util.h
@@ -0,0 +1,115 @@
+/*
+ * Copyright (C) 2010-2011 Marcin Kościelnicki <koriakin@0x04.net>
+ * Copyright (C) 2010 Francisco Jerez <currojerez@riseup.net>
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef UTIL_H
+#define UTIL_H
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <inttypes.h>
+
+#define ADDARRAY(a, e) \
+	do { \
+	if ((a ## num) >= (a ## max)) { \
+		if (!(a ## max)) \
+			(a ## max) = 16; \
+		else \
+			(a ## max) *= 2; \
+		(a) = realloc((a), (a ## max)*sizeof(*(a))); \
+	} \
+	(a)[(a ## num)++] = (e); \
+	} while(0)
+
+#define FINDARRAY(a, tmp, pred)				\
+	({							\
+		int __i;					\
+								\
+		for (__i = 0; __i < (a ## num); __i++) {	\
+			tmp = (a)[__i];				\
+			if (pred)				\
+				break;				\
+		}						\
+								\
+		tmp = ((pred) ? tmp : NULL);			\
+	})
+
+/* ceil(log2(x)) */
+static inline int clog2(uint64_t x) {
+	if (!x)
+		return x;
+	int r = 0;
+	while (x - 1 > (1ull << r) - 1)
+		r++;
+	return r;
+}
+
+#define ARRAY_SIZE(a) (sizeof (a) / sizeof *(a))
+
+#define min(a,b)				\
+	({					\
+		typeof (a) _a = (a);		\
+		typeof (b) _b = (b);		\
+		_a < _b ? _a : _b;		\
+	})
+
+#define max(a,b)				\
+	({					\
+		typeof (a) _a = (a);		\
+		typeof (b) _b = (b);		\
+		_a > _b ? _a : _b;		\
+	})
+
+#define CEILDIV(a, b) (((a) + (b) - 1)/(b))
+
+#define extr(a, b, c) ((uint64_t)(a) << (64 - (b) - (c)) >> (64 - (c)))
+#define extrs(a, b, c) ((int64_t)(a) << (64 - (b) - (c)) >> (64 - (c))) 
+#define sext(a, b) extrs(a, 0, b+1)
+#define bflmask(a) ((2ull << ((a)-1)) - 1)
+#define insrt(a, b, c, d) ((a) = ((a) & ~(bflmask(c) << (b))) | ((d) & bflmask(c)) << (b))
+
+struct envy_loc {
+	int lstart;
+	int cstart;
+	int lend;
+	int cend;
+	const char *file;
+};
+
+#define LOC_FORMAT(loc, str) "%s:%d.%d-%d.%d: " str, (loc).file, (loc).lstart, (loc).cstart, (loc).lend, (loc).cend
+
+uint32_t elf_hash(const char *str);
+
+FILE *find_in_path(const char *name, const char *path, char **pfullname);
+
+struct astr {
+	char *str;
+	size_t len;
+};
+
+void print_escaped_astr(FILE *out, struct astr *astr);
+
+char *aprintf(const char *format, ...);
+
+#endif
diff --git a/drivers/gpu/drm/msm/headergen2/util/u_debug.h b/drivers/gpu/drm/msm/headergen2/util/u_debug.h
new file mode 100644
index 000000000000..7faeece699d9
--- /dev/null
+++ b/drivers/gpu/drm/msm/headergen2/util/u_debug.h
@@ -0,0 +1,12 @@
+/* stub for compiling srcs syncd from mesa */
+
+#ifndef U_DEBUG_H_
+#define U_DEBUG_H_
+
+#if defined(__GNUC__)
+#define _util_printf_format(fmt, list) __attribute__ ((format (printf, fmt, list)))
+#else
+#define _util_printf_format(fmt, list)
+#endif
+
+#endif /* U_DEBUG_H_ */

-- 
2.39.2

