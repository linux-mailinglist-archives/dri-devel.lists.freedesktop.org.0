Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D08929A845
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BB36EB4E;
	Tue, 27 Oct 2020 09:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96246EB4D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:51:42 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de
 [95.90.213.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E51882466D;
 Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603792302;
 bh=2vGt09zv9T52aqBWuiYyElX+A1oCUvIR/X33luu4RwQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qd1Qbhi9SNYhd3MS6c2zdUNw6SCJi0pqLtuydjzJMEnhZ4RfuPbiFN8cjGVv/RgSG
 IHFGzPNsZ1tYGQnQQx6ZbllYKaPokR2hBOigFXgYJAE75TrGWAZxnt43kfNtu8MqDP
 cU2MmYr8rNREngpZ2J74l5k62yiygujH2Fm5HhXU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kXLdj-003FFc-Rl; Tue, 27 Oct 2020 10:51:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 26/32] gpu: docs: amdgpu.rst: get rid of wrong kernel-doc
 markups
Date: Tue, 27 Oct 2020 10:51:30 +0100
Message-Id: <bd070923591ae54f9587e7407b6291ac116952b2.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As reported by kernel-doc:
    ./drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1: warning: no structured comments found
    ./drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1: warning: no structured comments found

Those files only contain

	/**
	 * DOC:
	 */

markups, but they're included twice there: one to parse
such markup, and another one to parse internal functions.

In the case of amdgpu_xgmi.c, as it has just one such
markup, we can simply include the file once, and let it
parse the entire file without passing arguments to kernel-doc.

This should place everything altogether.

For amdgpu_ras.c, however, we need to remove the kernel-doc
with just internal. This should be re-introduced if this
file ever gets new non-DOC markups.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/gpu/amdgpu.rst | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst
index 1f9ea8221f80..2062a6023678 100644
--- a/Documentation/gpu/amdgpu.rst
+++ b/Documentation/gpu/amdgpu.rst
@@ -83,10 +83,6 @@ AMDGPU XGMI Support
 ===================
 
 .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
-   :doc: AMDGPU XGMI Support
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
-   :internal:
 
 AMDGPU RAS Support
 ==================
@@ -124,9 +120,6 @@ RAS VRAM Bad Pages sysfs Interface
 .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
    :doc: AMDGPU RAS sysfs gpu_vram_bad_pages Interface
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
-   :internal:
-
 Sample Code
 -----------
 Sample code for testing error injection can be found here:
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
