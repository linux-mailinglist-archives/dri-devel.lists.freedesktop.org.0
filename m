Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43DE79F582
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 01:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40C910E08A;
	Wed, 13 Sep 2023 23:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDB110E08A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 23:30:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4850961BA7;
 Wed, 13 Sep 2023 23:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCB7C433C8;
 Wed, 13 Sep 2023 23:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694647840;
 bh=tup+LBZbXxFTbfC3DcOI+jhqHile7U8Wyx9Eh+f7OXw=;
 h=From:Date:Subject:To:Cc:From;
 b=TnFvBYFM2LasEmUnQQ1ikWeuUqH2r//pz3V1oxnfxwBkDnSWs3dtYS2gWiHVQk06e
 Kijqxn2K4fdqzCOyMiRfy177zBHItLd3WHaz9IXK1cVrA/gQ3+bOzVlUmj1AIn1t4/
 UUfRUtBa1/lHtzIEOCOVYo8TCalf+sO2DJxkcJS4+bJ4EI4pfuAIuUJ5q1Gjoyve29
 mu3+pb2kG900rypFDXGzmoKSS451SiQ767nFg7w7lf21VZP+0rPZlmqGL9RcaIfS+V
 VS73Ip4Z67p7hcu+7Jv4KpT2XAfChe1NDcAcvVGssFKBIDwr0eIjx9gU8/Uc9Tj/rF
 A8fsgvyjEMRCA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 13 Sep 2023 16:30:24 -0700
Subject: [PATCH] drm/debugfs: Fix drm_debugfs_remove_files() stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230913-fix-drm_debugfs_remove_files-stub-v1-1-6b952ac559f3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAA9GAmUC/x2NzQqDMBAGX0X23AUTxf68SimhMV/sQtWyW6Ugv
 ruhxznMzEYGFRjdqo0Uq5jMUwF3qqh/PacBLKkw+do39dU1nOXHSceQEJchW1CM84qQ5Q1j+y6
 RY7p0rfPn3nWeSuejKNL/cX/s+wFpwjRDcwAAAA==
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757; i=nathan@kernel.org;
 h=from:subject:message-id; bh=tup+LBZbXxFTbfC3DcOI+jhqHile7U8Wyx9Eh+f7OXw=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDKlMbgqHBe/t7b69c9m9qX/eTlnxf9Ka6zscry2L4ih13
 ZqSPmHSio5SFgYxDgZZMUWW6seqxw0N55xlvHFqEswcViaQIQxcnAIwkfzNjAy7Hz3fZnrvyg7L
 +Z299/XXH5+2ZcvesC0HPdV+rnwhuHXtWUaGhjSD7I1VmiEKJlslNC9GM73hYJfv5H+4NthoT1H
 7hqnMAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, andi.shyti@linux.intel.com, patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When building without CONFIG_DEBUG_FS:

  drivers/gpu/drm/tegra/dc.c:1757:59: error: too many arguments to function call, expected 3, have 4
   1757 |         drm_debugfs_remove_files(dc->debugfs_files, count, root, minor);
        |         ~~~~~~~~~~~~~~~~~~~~~~~~                                 ^~~~~
  include/drm/drm_debugfs.h:162:19: note: 'drm_debugfs_remove_files' declared here
    162 | static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
        |                   ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    163 |                                            int count, struct drm_minor *minor)
        |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

Update the stub to include the root parameter.

Fixes: 8e455145d8f1 ("drm/debugfs: rework drm_debugfs_create_files implementation v2")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 include/drm/drm_debugfs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 7213ce15e4ff..3bba169f9bae 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -160,7 +160,8 @@ static inline void drm_debugfs_create_files(const struct drm_info_list *files,
 {}
 
 static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
-					   int count, struct drm_minor *minor)
+					   int count, struct dentry *root,
+					   struct drm_minor *minor)
 {
 	return 0;
 }

---
base-commit: fc71f615fd08a530d24c7af0a1efa72ec6ea8e34
change-id: 20230913-fix-drm_debugfs_remove_files-stub-bd864127c162

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

