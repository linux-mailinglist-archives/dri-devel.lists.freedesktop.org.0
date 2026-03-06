Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id S89ELRiErWlX3wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AA82308ED
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE6A10E16D;
	Sun,  8 Mar 2026 14:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kFMdWTXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739A010E32E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 21:56:53 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b942a41c5fcso145464066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 13:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772834212; x=1773439012; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=35KQxB0Jsk2c/EVSHuq57nHn/4x2hHiu2AGGQP2gI/U=;
 b=kFMdWTXXLw+YmSKpHDBiVZaLWjNEl6b/dxHyZhom0krbCUJxitYtbCsXxsTWExJhqG
 BrJRl+n09AS9utfqh8HBu4wFvgCPTrUsMzss3YSd+Rf14H4tXk+QSbw+dOfiBUaQR/Zu
 w1MI1fmKisrdiZ2b2P5E7Is5qhOE10WUktC7ZCRoD4//HPOpehrodem2z9hjE+RtrbGp
 8TiQlXMW0CQGwnbLYkRkmfSsTlCDp8JbSadMQ9lEF4gCiIyQbwxEOU/Pt9CdfmkfI+je
 9DAOziy592s3wMmbd3nY0dMOuq1e+xa8uWd3nJtfwhc9/mE6Yc9nRWAM0wpsIiZ4/dQj
 Fx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772834212; x=1773439012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=35KQxB0Jsk2c/EVSHuq57nHn/4x2hHiu2AGGQP2gI/U=;
 b=b0HrH5QMfgzIh69yRaC6N6hakXPbxK3ICZkI5eDzdAYzQ5bWUM/CG4iVPmOivrhnt5
 gFwyI2Zc4qAsNadnaWmOm4heL/HQxI5EZk0JcRp5BDPnLUnZnO43zs/bpC5HL98cI+Dg
 zFYRSN3U9IASIQaCAya1qvi/ICjh5IZXaLeOT+me0ptHdnTRydRA6MjM81gCRdDPWO8K
 cvX71qrqElXZNCQVzbHn8okFyeqEsjzASXydIOuugyZtp8KV2YokKlW0PlfQz9cFF2Z5
 hvmPGsQMt5mniaJzbPBAFKY53/AOYjWXSaO4HD1itFvooR3YGQB/8FdBqmQVnz8cwkjE
 YXCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA8Cn1kvEytazpP2SGm9dSO08LaorfDwcP400F4B4XZfBdweIiI4oIn2iPX0RyqLKv/ok+EdgU72k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5g7m0Mb4iUNidW3ZB6IgYAH5nDLy59pt132069ccW/lSXC+7j
 5AhQTYvEcrxfm5CGQDNsdUdUD5k7eptJ3anqEPoSSZ4bGerxDDwUlO66
X-Gm-Gg: ATEYQzw3X0+LEyNRHBhQeW5mxNE28kFc/tiddACJbUSrL/AUeqESnCFEstU039zSlRl
 /UMw5L3+1g9Tay4FCy6DPu81AAW7sjLhJZ3FFQcek0FTCreHaKbcTDdIWLbpf797zPAGLiIb9/5
 fAmtbAp4ajBHTax6WhiOvljsOtw088oMOdCtnpqDYN234mpf+QOILLcTx5W8CZs9SnyCH85Y1S6
 Ygdp1xjIDCFUJGEgF4vjUsMldV6LN000v/WFaBkJ/uxQEDLkVV/6Rnrj8m31AMe/fLGesTcsgOK
 tLV7Cf3TgyHyoWz52t8STS75bfDhKS/nPeRpdzMjQpYE1fTyVTUSIWF2iuYvvSOGfU7R2m+USZB
 S05zWjpZxw5f2eqCyVIuqMacGFr6suNYZlwW3K/5fO783SF6ncfkGCDJIZ7WSQRnf4kXtarOIIQ
 aAxKzpIWd7xCKKhpo890XcBiERnNUNDxklhMyR8Zb3uoWj4yL/oCewYqRu1JmvVkcAA2Mu+Gc/x
 fYRET9RayxhX5gbiRuW5cSrDMsyrId/9kyFyqHc8M18byU=
X-Received: by 2002:a17:907:8dc3:b0:b87:1741:a484 with SMTP id
 a640c23a62f3a-b942e0f391bmr211004766b.43.1772834211770; 
 Fri, 06 Mar 2026 13:56:51 -0800 (PST)
Received: from localhost.localdomain (84-24-131-219.cable.dynamic.v4.ziggo.nl.
 [84.24.131.219]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-661a4fd5ebfsm776416a12.16.2026.03.06.13.56.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 06 Mar 2026 13:56:50 -0800 (PST)
From: Mikael Rothig <mrrothig@gmail.com>
To: corbet@lwn.net
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mikael Rothig <mrrothig@gmail.com>
Subject: [PATCH] docs/gpu: fix spelling mistakes in todo.rst
Date: Fri,  6 Mar 2026 22:56:05 +0100
Message-ID: <20260306215647.67980-1-mrrothig@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 40AA82308ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.29 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[40];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mrrothig@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mrrothig@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mrrothig@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Fix three spelling mistakes in todo.rst:
- 'varios' -> 'various'
- 'implementions' -> 'implementations'
- 'complection' -> 'completion'

Signed-off-by: Mikael Rothig <mrrothig@gmail.com>
---
v3: Added CC for DRM maintainers and patch description
v2: Squashed 3 patches into one as requested
---
 Documentation/gpu/todo.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 520da44a04a6..686a94bead07 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -269,7 +269,7 @@ Various hold-ups:
   valid formats for atomic drivers.
 
 - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
-  version of the varios drm_gem_fb_create functions. Maybe called
+  version of the various drm_gem_fb_create functions. Maybe called
   drm_gem_fb_create/_with_dirty/_with_funcs as needed.
 
 Contact: Simona Vetter
@@ -294,7 +294,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -882,7 +882,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.49.0

