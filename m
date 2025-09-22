Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EBFB90128
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 12:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545BE10E193;
	Mon, 22 Sep 2025 10:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QzJRNj54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA00210E192
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:36:37 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b5241e51764so3312806a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758537397; x=1759142197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+9n632otRhZijt2C+vVcISfhaawIfWAEGIOaCRnvcg=;
 b=QzJRNj548EvH7W7RrzMNFi9abAo79HmTfeixQOswE3tAY7oSXQYOoCnrLVfgoVNRYo
 9jWrO+klyY2kKUa3IpOmLoRWc9R85zktUv1F8r4+tXbMWZ4zMttmcAWFpUOfjyl+CplC
 gWCcGEcFZkRA/hmQHoEB2jy9AxubWethvM21sATHLpHe+PJ6ebgMcu2xaAC4VFGUdHoY
 bltemj4oyhcUQYmbPKIkef5qorHSF1W2e9dTWjuYKGjoRIdPBS2+VtqNUYkdr5KyMRAq
 EEmG1KVElLdImogqDqgpSwthoI3EIBR+17cXXBZE2CDKNrAxO3d2zbrXsqjE6p6URy8L
 U2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758537397; x=1759142197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+9n632otRhZijt2C+vVcISfhaawIfWAEGIOaCRnvcg=;
 b=lI3nku9yXWXaHXASE7OOXCDBQI8WqCoHOoGZOgqQ0ZOikQtQMNm8+SrVBmwGntxFEM
 VECLc29VRBXxKuvo+5Nf/smfdlEF7DkV5pzeDH7jBsCbCbDCsV/CXr0SLdvPNdu9Tbmn
 Uyyf4c/LT0rk8iZ9s4HRu8rZJRhiCuDNqCCwd47eSO/mtvrUFzPflKgm9R4K125HdBit
 j5uS8fLwJuyUT7NNBi9ugT2h1CNuIqNplDkbcoYiQfX/IkiXXfXad695o2EHOREnXGHI
 cll5guzJF10ZxbGHZlO+TIfWS/1+2zLX9+uNV57cG65nNlddH7EBhVOy1ao6XPh/b6nh
 kD3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf1VbBK/yZ4NwdCF19XFjFkPKPVVKlv7fZOA17+dGyEQtD/cNsli/19RMTMWsvNIh58nNqECoVfvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0NcIagewD78w19rdEMGUuc1d4fMmJvlwrc+gcSvGhAu90Y62l
 eVfsAmfkKU9ma1y/DiT8mNOwQS6x2eqECWyoxGMbj9Uv2wt9/eyUkP6N
X-Gm-Gg: ASbGnctgRSC00wX1tMxpW7Hq49uJKU+5YD4QQtYv8jqDyQrdYKCwFNce9Jzud1/mYm6
 X3s2w5VXfhDiyus3FpUkwVQjiW7QH8ImljNkkpz0buOEMqu1/oauovYxGc/cYIemZ08QD0Z6Lrp
 obxthTHTwmDtRBDYFhP6a0plVS2cxdyVQbczEJyXdE2en8WegNkyWbbUBneMgTj5LPikZqjYXuC
 Nijqrk2yWQFh5GKSlAtXn+1s3FQEtN+BX9SgkdZmiMezgT/7lT78FHvYJEj2Ux2po22hmAMu+CA
 ZotO1BI5GjlhsDKPP9jpWqB991yJBqsjxLAAzhEJhkri+wosGhiod3+j4Eup46eOnMHTpQSXKsx
 jLwsq5hWy84V+fby3e4TMEQ==
X-Google-Smtp-Source: AGHT+IG7ZxvvTr2SI8V/6MXjM0DofGqWRIdjLfLiO24Xsu1dt/6bTU0M6VuI2CCXGER50ApZGb8/7w==
X-Received: by 2002:a17:903:3846:b0:24c:82ad:a4ef with SMTP id
 d9443c01a7336-269ba511744mr183795435ad.32.1758537397151; 
 Mon, 22 Sep 2025 03:36:37 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269800541adsm129353965ad.4.2025.09.22.03.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:36:36 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id B5F5741A2EDF; Mon, 22 Sep 2025 17:36:34 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Bernie Thompson <bernie@plugable.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 3/3] Documentation: fb: Split toctree
Date: Mon, 22 Sep 2025 17:36:16 +0700
Message-ID: <20250922103615.42925-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922103615.42925-2-bagasdotme@gmail.com>
References: <20250922103615.42925-2-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885; i=bagasdotme@gmail.com;
 h=from:subject; bh=0YwIDNcM8Gu6DduxYzaPysxCd6Y3vQAF9cqA61KQ8WU=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkX1QIVnK5u3dp4tidRuGuf881Jk7v7zsfWPt73O/Ri9
 apqG541HaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZjIhGeMDI8SoxyYZS6dTnK7
 etq6N3aKr5lKZ/RF5kOyy5Y+F496ac/w372CuVbCyfvaFfFrDydEXvnpY/faY8al8qv7FeKi+oO
 esgEA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Framebuffer docs toctree consists of driver-independent docs
(e.g. API docs) and driver-specific docs. The latter has much
more entries.

Group the docs into separate toctrees.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/fb/index.rst | 80 +++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/Documentation/fb/index.rst b/Documentation/fb/index.rst
index 33e3c49f885695..e2f7488b6e2e42 100644
--- a/Documentation/fb/index.rst
+++ b/Documentation/fb/index.rst
@@ -4,42 +4,52 @@
 Frame Buffer
 ============
 
-.. toctree::
-    :maxdepth: 1
+General information
+===================
 
-    api
-    arkfb
-    aty128fb
-    cirrusfb
-    cmap_xfbdev
-    deferred_io
-    efifb
-    ep93xx-fb
-    fbcon
-    framebuffer
-    gxfb
-    intel810
-    internals
-    lxfb
-    matroxfb
-    metronomefb
-    modedb
-    pvr2fb
-    pxafb
-    s3fb
-    sa1100fb
-    sh7760fb
-    sisfb
-    sm501
-    sm712fb
-    sstfb
-    tgafb
-    tridentfb
-    udlfb
-    uvesafb
-    vesafb
-    viafb
-    vt8623fb
+.. toctree::
+   :maxdepth: 1
+
+   api
+   cmap_xfbdev
+   deferred_io
+   fbcon
+   framebuffer
+   internals
+   modedb
+
+Driver documentation
+====================
+
+.. toctree::
+   :maxdepth: 1
+
+   arkfb
+   aty128fb
+   cirrusfb
+   efifb
+   ep93xx-fb
+   gxfb
+   intel810
+   lxfb
+   matroxfb
+   metronomefb
+   pvr2fb
+   pxafb
+   s3fb
+   sa1100fb
+   sh7760fb
+   sisfb
+   sm501
+   sm712fb
+   sstfb
+   tgafb
+   tridentfb
+   udlfb
+   uvesafb
+   vesafb
+   viafb
+   vt8623fb
 
 .. only::  subproject and html
 
-- 
An old man doll... just what I always wanted! - Clara

