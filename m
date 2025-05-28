Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614DEAC6BC9
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D7D10E654;
	Wed, 28 May 2025 14:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YemqRJbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640E810E643;
 Wed, 28 May 2025 14:34:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CDBD9629E2;
 Wed, 28 May 2025 14:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CA4C4CEF6;
 Wed, 28 May 2025 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748442894;
 bh=LxLVRB8GvDbWgwRUBMxy60vYqqNKxSuBn+6jZzlFCL8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YemqRJbLG4RaBxL/301sTdPNenZhSt2Mog5tm1ymhn1tTsbRq7gjonaBcQQszsVsT
 tTYFCKzifPMCZ8KXfhvxx9DK0N8DdBlx55Ta+lt6REedUjVpAGLhrXiDfNI6RupUTZ
 3wJ5zeI2B0hkLWijamgn2wlrirEYCIUE5lR8/1C3dNMhzBqVKOGeajiVyBCheVH4ZW
 UE/LT2SeB1+oK/NP2WjiI0P7QMW+43Rj+8sNaztmmRWLxjwsJUxeZpUx8YtgySP3Ml
 kvo8pDSuYm4pOv15JAIJRLbWMVEYMSSKjZhG7g0rUZ6TOfQuJpr5TFLkJaGHxgC1QN
 K4JODSwTiI8bQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 28 May 2025 10:34:35 -0400
Subject: [PATCH v11 03/10] ref_tracker: add a top level debugfs directory
 for ref_tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-reftrack-dbgfs-v11-3-94ae0b165841@kernel.org>
References: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
In-Reply-To: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=LxLVRB8GvDbWgwRUBMxy60vYqqNKxSuBn+6jZzlFCL8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNx8EIvxwwvu2Rez69XJFIEm8ehsmoMNYZvgu+
 go5k0V3q4yJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDcfBAAKCRAADmhBGVaC
 FaO+EADEIFnvTcw6Nwx3C27bRQvHJHCMfcvXKPs5gkHanmnl7cFOF7k/qJJuuY+z2gKwAtMadU2
 S4zlTlXXF7kwaphIWiJIPc6R8oeCjisEOd4/ge1e2j38lmPdBPcxggMXuIhQkO7nDG7tF9ZW/F2
 KRPZk4a5jrcUYYErdmn0YXeuoPCrw+1Uf6LMjtI/VeUIQx/eQAurDBLDdM+9ClNHtoLKsz/M3gK
 b1t8RtoyUyCqlkOMl8/rHLlcGvwKh8iN8BsJlYztPGBEe4kml4vcPczfWtWXP4x9IQ0mGKLpQh+
 E6WFCmgIyEzyk3TWxvL5coz6cDPRT3+Ap91KGDGlsPR4KrOAJlCEvxsbFUZvlJgZt2L3uUcZC6J
 SV0qXv07AiDo8vbBj4S94UjMGhsLo3xjbMxZANpyzAhPAEnHn5PlibrpdwkJ1cNfcSI0FeZrrCy
 raxU3SfLdUUDZv3GRx+epyQGKTLvzkIMP7RpOwbxg4xHR9U3X7R2K+QaPvvYvuu0ZbobfNLxvYi
 yCZ76fIojCtdL9CPftqGZfbzepFV+vskaaCelS4YahquYOhbhGdB2RWHko7hVlAtzcm4xMrUOkd
 IUmY4ea80AUChnPpl4slnHrSxBth+vqcuFHNbWzKW1Kip/i1aJD9aMrzVSt+zziA5KelceJSzD9
 qZCW6MtA4UVYq1w==
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
 lib/ref_tracker.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index de71439e12a3bab6456910986fa611dfbdd97980..34ac37db209077d6771d5f4367e53d19ba3169c6 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -273,3 +273,19 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
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
+	if (IS_ERR(ref_tracker_debug_dir))
+		pr_warn("ref_tracker: unable to create debugfs ref_tracker directory: %pe\n",
+			ref_tracker_debug_dir);
+	return 0;
+}
+late_initcall(ref_tracker_debugfs_init);
+#endif /* CONFIG_DEBUG_FS */

-- 
2.49.0

