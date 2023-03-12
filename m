Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937256B66FB
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 14:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D3C10E129;
	Sun, 12 Mar 2023 13:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 66227 seconds by postgrey-1.36 at gabe;
 Sun, 12 Mar 2023 13:51:30 UTC
Received: from smtp50.i.mail.ru (smtp50.i.mail.ru [95.163.41.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E1D10E129;
 Sun, 12 Mar 2023 13:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=9e2qemlQ+qu6TtpeSILCd8YXgDshgLNwa7t+UxrGEOg=; 
 t=1678629090;x=1678719090; 
 b=hGpJQzbEqCqCVXZUQZbMIyD28sdtfyQsA675Iq+HtmwRXsuTNnKgdDCyO0030WRRcRmgy6KhMK7A7hWEt7hyIt+K5kenzB2RE8R/IOl7f0d/3MK1opE/cfYlRE7Orqeb65wIpcMlkaLOuLOw0eoP9roftTgZQMAdOiH2Qj8xW4lOqXNdrQSDFYgAib7NAp1whzrohwE6p5M4wQxTwy6m1u9xT8wpnH5c29QrObFPJhfgB/eFYwRoFKqTx1RKadHayjKrVa39UFTOza6L+Zmh0WhhMsxFePG73UT9TMr1h1mWzovbD8F2ajz1ebUPncUibpccj9P3zoDO/y0a14YTNw==;
Received: by smtp50.i.mail.ru with esmtpa (envelope-from <listdansp@mail.ru>)
 id 1pbM6h-00C5Oi-7t; Sun, 12 Mar 2023 16:51:27 +0300
From: Danila Chernetsov <listdansp@mail.ru>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v5.10 1/1] drm/amdgpu: add error handling for
 drm_fb_helper_initial_config
Date: Sun, 12 Mar 2023 13:50:53 +0000
Message-Id: <20230312135053.7218-1-listdansp@mail.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp50.i.mail.ru; auth=pass smtp.auth=listdansp@mail.ru
 smtp.mailfrom=listdansp@mail.ru
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9BCEC41593EBD8357D61703A5C7370B1E319F7344C6651618182A05F5380850404101E7A95639D66F46B724D4AD22814152705C147E0509B9A98EC30680F39800
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE710FC7AC39A8009ECEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637525B22DCF689D4638638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A8B962F2C513871FF9C52E85DFF075466F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7F588D4452561E4D79FA2833FD35BB23D9E625A9149C048EE0AC5B80A05675ACDF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006379BABF3D50D9A3D87389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637A9329C8D8D988D4ED81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE72AA49236079A88D2EC76A7562686271ED91E3A1F190DE8FD2E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3443DF20DE7AF59D235872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5C7C8BD3663FA951A02515BEC82C141FC4BF0A345B7E33DD84EAF44D9B582CE87C8A4C02DF684249CC203C45FEA855C8F
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34EB7BD66E9101C1008FCF4C881EC454412423020562D60783A1B62AE67F12488AE155D5A1E56565E71D7E09C32AA3244C38C2F3B520FDC88ABB7C7E14A63851DABBA718C7E6A9E04227AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojN3wBDQf4j7MC6g2skIIJpw==
X-Mailru-Sender: 4CE1109FD677D2770147F6A9E21DCA7B011BF7C6691D941B53F16FEE055C45F2C79AF7ED9535CCE97E3C9C7AF06D9E7B78274A4A9E9E44FD3C3897ABF9FF211DE8284E426C7B2D9A5FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
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
Cc: lvc-project@linuxtesting.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danila Chernetsov <listdansp@mail.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The type of return value of drm_fb_helper_initial_config is int, 
which may return wrong result, so we add error handling for it 
to reclaim memory resource, and return when an error occurs.          

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d38ceaf99ed0 (drm/amdgpu: add core driver (v4))
Signed-off-by: Danila Chernetsov <listdansp@mail.ru>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 43f29ee0e3b0..e445a2c9f569 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -348,8 +348,17 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
 	if (!amdgpu_device_has_dc_support(adev))
 		drm_helper_disable_unused_functions(adev_to_drm(adev));
 
-	drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel);
-	return 0;
+	ret = drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel);
+	if (ret)
+		goto fini;
+
+	return 0;
+
+fini:
+	drm_fb_helper_fini(&rfbdev->helper);
+
+	kfree(rfbdev);
+	return ret;
 }
 
 void amdgpu_fbdev_fini(struct amdgpu_device *adev)
-- 
2.25.1

