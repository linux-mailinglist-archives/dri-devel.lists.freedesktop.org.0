Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44236B336ED
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B52D10E348;
	Mon, 25 Aug 2025 06:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=achill.org header.i=@achill.org header.b="b9LbBD0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 517 seconds by postgrey-1.36 at gabe;
 Mon, 25 Aug 2025 01:18:19 UTC
Received: from mailout02.platinum-mail.de (mx02.platinum-mail.de
 [89.58.18.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81B710E22B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 01:18:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mailout02.platinum-mail.de (Mail Service) with ESMTPS id A85249A2851
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 01:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=achill.org; s=mail; c=relaxed/simple;
 t=1756084179; h=date:message-id:subject:from:to;
 bh=Rh4dkKQC119Akv41mQ4vorQSwJE1Xtdn9NDHvo5rGBo=;
 b=b9LbBD0gtwCWpIl9a4xqUddAEwBbdZ3ZU1IB45RzpC8xoOrDLpFM/OB0MTHchB/4wbCYS5FpwdK
 8dmMP18/Co7iDnePg520h+rUzAOI0V/baCJugx4ZRSMQl/iR99/lLdcaJcTDj7MNyUsOG2aoiXwu/
 8Q58xdEmOslNIJusigAbs+WS867w7g966l5oOt922GYHh5CK0g8/l/Zb2NVVZVc2Zxh40/D+Gc14/
 AyXxLtl+zkBrQxDlkUjjBvsozH4VJE9YE74OppzlCBvMZ4puGSMAEefVuGJhLktwLlr/G5+ibuRMN
 /ncWZUMDGISv6qV7mPqzjO2nFLsIr6W8CWvg==
From: Achill Gilgenast <achill@achill.org>
To: Matt Atwood <matthew.s.atwood@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Achill Gilgenast <achill@achill.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/xe: add missing include <libgen.h>
Date: Mon, 25 Aug 2025 03:09:09 +0200
Message-ID: <20250825010914.99742-1-achill@achill.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8
X-Mailman-Approved-At: Mon, 25 Aug 2025 06:55:43 +0000
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

basename() got implicitly included on glibc but not on other libc's like
musl libc and therefore fails to build:

/home/achill/git/user-aports/experimental/linux-mainline/src/linux-6.17-rc3=
/drivers/gpu/drm/xe/xe_gen_wa_oob.c: In function 'fn_to_prefix':
/home/achill/git/user-aports/experimental/linux-mainline/src/linux-6.17-rc3=
/drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:14: error: implicit declaration of =
function 'basename'; did you mean 'rename'? [-Wimplicit-function-declaratio=
n]
  130 |         fn =3D basename(fn);
      |              ^~~~~~~~
      |              rename
/home/achill/git/user-aports/experimental/linux-mainline/src/linux-6.17-rc3=
/drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:12: error: assignment to 'const cha=
r *' from 'int' makes pointer from integer without a cast [-Wint-conversion=
]
  130 |         fn =3D basename(fn);
      |            ^

Fixes: b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
Signed-off-by: Achill Gilgenast <achill@achill.org>
---
 drivers/gpu/drm/xe/xe_gen_wa_oob.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen=
_wa_oob.c
index 6581cb0f0e59..74af4b9fde65 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -6,6 +6,7 @@
 #define _GNU_SOURCE
 #include <ctype.h>
 #include <errno.h>
+#include <libgen.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
--=20
2.51.0
