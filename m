Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1703E3795
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 01:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61E489CD5;
	Sat,  7 Aug 2021 23:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6067B89CD5;
 Sat,  7 Aug 2021 23:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=mi1wUIUriQLxRPB3k06DSpLuLSdOL9Du9D9ZElPFQIk=; b=xm3MRgt2UfWjsugdvTPkxsCOe3
 Y8OlIL7DBy83Wjcq+K6+xRZ3gmZ8mwf35XAOYCtmGcnRpOgxGRaD4bfGMVkUzlNv4ug7xjWAWVDef
 I785yp9IhyC0Uar+c2lyBBtMKPSqWzp8MmL4NGFqpAy3G7hawnGJwqqoLzdObCs3Fw8hl2l1ZqKtl
 xBjd9a/rz0thnZG0gfrjOiigkf6iUr+dZxTeNtRZQ16nLVWN+R/xpka8wP1eu+kPws+26wLdMDpPB
 sMP8en3KvtXIHSkLLaasPD+q5a5G50WgofjxTWXkF0Fut4A//ApCHdYFriXX57h5ojJo0CAqiPebD
 svejTQ9Q==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCVtr-00FJdd-3N; Sat, 07 Aug 2021 23:38:43 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix kernel-doc warnings on non-kernel-doc comments
Date: Sat,  7 Aug 2021 16:38:42 -0700
Message-Id: <20210807233842.13545-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Don't use "begin kernel-doc notation" (/**) for comments that are
not kernel-doc. This eliminates warnings reported by the 0day bot.

drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:89: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This shader is used to clear VGPRS and LDS, and also write the input
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:209: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * The below shaders are used to clear SGPRS, and also write the input
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:301: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This shader is used to clear the uninitiated sgprs after the above

Fixes: 0e0036c7d13b ("drm/amdgpu: fix no full coverage issue for gprs initialization")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Dennis Li <Dennis.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20210806.orig/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
+++ linux-next-20210806/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
@@ -85,7 +85,7 @@ static const struct soc15_reg_golden gol
 	SOC15_REG_GOLDEN_VALUE(GC, 0, regTCI_CNTL_3, 0xff, 0x20),
 };
 
-/**
+/*
  * This shader is used to clear VGPRS and LDS, and also write the input
  * pattern into the write back buffer, which will be used by driver to
  * check whether all SIMDs have been covered.
@@ -206,7 +206,7 @@ const struct soc15_reg_entry vgpr_init_r
 	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE7), 0xffffffff },
 };
 
-/**
+/*
  * The below shaders are used to clear SGPRS, and also write the input
  * pattern into the write back buffer. The first two dispatch should be
  * scheduled simultaneously which make sure that all SGPRS could be
@@ -302,7 +302,7 @@ const struct soc15_reg_entry sgpr96_init
 	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE7), 0xffffffff },
 };
 
-/**
+/*
  * This shader is used to clear the uninitiated sgprs after the above
  * two dispatches, because of hardware feature, dispath 0 couldn't clear
  * top hole sgprs. Therefore need 4 waves per SIMD to cover these sgprs
