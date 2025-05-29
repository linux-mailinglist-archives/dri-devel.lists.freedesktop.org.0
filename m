Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D8FAC8017
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 17:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76F810E748;
	Thu, 29 May 2025 15:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O+9N8cB+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0E710E748;
 Thu, 29 May 2025 15:21:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 39E8A629D6;
 Thu, 29 May 2025 15:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F284C4CEE7;
 Thu, 29 May 2025 15:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748532079;
 bh=RlWXgxm38Aq29CBqdh8MUpS/8kHUwdh5uqxg8ACpYpI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=O+9N8cB+GwpoqfvPiHGKa90TiTPoMCVbpSLT7KFPtXKlgIPg1rVh03lTjuc4+BYkA
 TJqwQpmW0uqKhP/YAIKlWWzF4hWKgyh+9ylWdxxxDqTOuD71peN42inzqIky70vYeD
 MC4BVmbOu1oNLAM7NdiOTrXIYIkAEum7DW2i7STNHFidxVwfm6mAuDf/Dr1p3PEDHi
 sKpiX6qE3HHbm5VnTUAJ8eS36vV0WL2/+G7JenWbacVRPhSINCLSG5x9EP+EaLbctI
 WKs6zL9DzIr6L7d9+G/4gMN+wB2kf7yWNP2pg9qHIkfUeKZ4dgxp4l3fjz3NfSkw5M
 JmGCcPIaCLEUw==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 29 May 2025 11:20:39 -0400
Subject: [PATCH v12 03/10] ref_tracker: add a top level debugfs directory
 for ref_tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-reftrack-dbgfs-v12-3-11b93c0c0b6e@kernel.org>
References: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
In-Reply-To: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1030; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=RlWXgxm38Aq29CBqdh8MUpS/8kHUwdh5uqxg8ACpYpI=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoOHtl1UPDVJTvPvJNRc98rtdX0aJUeTHv9FEu0
 Ma0CvYIM+mJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDh7ZQAKCRAADmhBGVaC
 FSU5EACD3kw01IXG9X38wceHpPcVWw0grbOSu3GeJo+/T0YgHoFNyUvQ8qpkeNzxzlLgL3oLG0e
 Jhr+xQXngdKI1kdPGHFIzkTyfv8YMRivcMddsIaq6atTsonLPH1Bv95G8RMC8JJOElxyX2wAcND
 n2gb/0ooYNI1NuAh2XRw68KsvcF5J2Fv4yJkqoy+c1iemfDLf/C3oyl8WxuFmKzXkwRTGs7xW9P
 NYpOvf4DGWjj0J5iewO0fH75PD0QQeAhqQAnXLJkrakNhFvU/aWGng7tgNJCbGX7glsygZ7wUBg
 nXhexqtdpL6p3Rpy9nadviXOX+Y7pjW59Ys+DkS2iawi02V/Xf3iYXRfyPdCQjBRBS9zdw/Fk/p
 qp89wtBNIAdAuvbNgqsG1bHJXkpUDE15eTp1lWJO3/2WVw5SCLAJYrLjw5vUnTI67hgDCN1e1kE
 ds3oM0+9K1PaftZRS9IfnfraUWpfYJTB1kxVsUTZW69w/kMvhVw+GoPtx56esDrly/gx9Ia+xQJ
 6llOxwBhAnWnhrkmTyyM8FZMI7K8qU7L+m9z3EyrE6m3iHMTU5bUK8kORA81439KrQaUepzBM60
 wieDuaGS+fYwgfnn3NGD0gvxANZAr0KDm2+ggdFI/TjRrGBOqFEhOG3yLVnNo/Wzb9TxGeSXyx+
 MkZQKh8/mr3MasQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
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

Add a new "ref_tracker" directory in debugfs. Each individual refcount
tracker can register files under there to display info about
currently-held references.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 lib/ref_tracker.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index de71439e12a3bab6456910986fa611dfbdd97980..d374e5273e1497cac0d70c02c282baa2c3ab63fe 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -273,3 +273,16 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ref_tracker_free);
+
+#ifdef CONFIG_DEBUG_FS
+#include <linux/debugfs.h>
+
+static struct dentry *ref_tracker_debug_dir = (struct dentry *)-ENOENT;
+
+static int __init ref_tracker_debugfs_init(void)
+{
+	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
+	return 0;
+}
+late_initcall(ref_tracker_debugfs_init);
+#endif /* CONFIG_DEBUG_FS */

-- 
2.49.0

