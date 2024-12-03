Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384169E2B1E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 19:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221C210EB16;
	Tue,  3 Dec 2024 18:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="NFZj3W56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A62810E478
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:49:20 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20241203134204euoutp02ee77f919f06b1795d9faa6fc3bdc12d6~NroaWVihb3046930469euoutp02i
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:42:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20241203134204euoutp02ee77f919f06b1795d9faa6fc3bdc12d6~NroaWVihb3046930469euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1733233324;
 bh=DgeFHCAIbeFBF+0nDHhjAGX/VqaqfX2KAeQLuxONDpc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NFZj3W56ljtXnHvc1tmGFjM5qZGLUbULsATE25DYlUfR8PmHWh5XBugSUbSkHTo08
 Cmf06iPw+f5tBMp8R1PeseCefC0rYvp5MdArlhxQPmoouTsihyq1f11dOpljrg4D2Y
 ooHh0yjmlH2gKI0u/kHlojVBFmUXvseZ7zkUV/Go=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20241203134203eucas1p1bdae5662b85b434acdc7f54e36d382ed~NroZpJgjr2516025160eucas1p1G;
 Tue,  3 Dec 2024 13:42:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 5C.8F.20409.BAA0F476; Tue,  3
 Dec 2024 13:42:03 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241203134203eucas1p11a2e36f777af362a333d8865bcb5d34e~NroZNpAIw1266212662eucas1p1-;
 Tue,  3 Dec 2024 13:42:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241203134203eusmtrp1e72591d8410ed2d962a249230bcc7207~NroZG6yke0887308873eusmtrp1c;
 Tue,  3 Dec 2024 13:42:03 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-9b-674f0aab1bb6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2A.D8.19920.BAA0F476; Tue,  3
 Dec 2024 13:42:03 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241203134201eusmtip29d9c18c2428730d69c4023606adce934~NroXzhmyc3133331333eusmtip2j;
 Tue,  3 Dec 2024 13:42:01 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
 <m.wilczynski@samsung.com>
Subject: [RFC PATCH v1 11/14] drm/imagination: Enable PowerVR driver for RISC-V
Date: Tue,  3 Dec 2024 14:41:34 +0100
Message-Id: <20241203134137.2114847-12-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203134137.2114847-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1CTdRzH+T7Ps+d5WDd6GHj7ShAnBld2oiJn38vqMLWezlDpnzrO0p08
 zQkM3ByZesmvFtAoSBg5SBYh0BBJxhYsafLjmLBcCIUQ8qOLMGS5kB9XGayNB8v/Xp/35/25
 9+dz96FxcRMZQssVxzmlQpoSQQoJS/dfzo31wn2yzSOeLejazSoMme/rKXSxzYmhyi6nAI31
 N2PohwU3iS792keh39qyCDRY9xmFcrobSTStHyPRrHZMgAasFSSaK+wCyDKXS6KGrlEKNS5U
 YujzWTOBqlusAGnyawToRu9uND2gxZFG/yjyXGmh0PLgZQKV37VRqNlVLED2htdRrq2EiAtj
 3UPvU6xreppgO/PmKbZt0UCwrfpRitW2fgfYJmM+yd4avEKy53sS2PEP7Rhrqj7D5jZ0Y6z7
 2x9J9qNmI2D7c25SrMlxan9govC5JC5FnsEpN71wSHjkqvUelm6lTxRPLuGZ4AOqAPjTkImF
 dcvZRAEQ0mKmDkBdUSHOF/MAns01UHwxB2Bn+ceCByPnvyheGRcztQC6NQd4kwvA5XOTuK9B
 MjFworZS4GsEMzM4HFoYJn0FztwG0DJZQfpcQUwCvDw8ssIEEwk7bk9iPhYxcdCu7cH5uHBo
 a7++wv5efaa0QMB7AmHPuUnCx7jXk2MuX1kcMheEcNzgWD1vF+ztM5M8B8E79uZVPRQ6zmoJ
 ntPghPneathp2Kq1r/J2eMv5t3eW9gY8BRutm3h5B9S7C4BPhkwAHPo9kF8hAH5iKcN5WQTz
 NGLeHQVLtYX/hTrrLBjPLPz0n2ZBEVinf+gY/UPH6P/PNQDcCCScWpUq41QxCu6daJU0VaVW
 yKIPp6U2Ae9bO5bt8y2g9s5sdAfAaNABII1HBItqG/fIxKIk6bsnOWXaQaU6hVN1gMdoIkIi
 ikwK58SMTHqcS+a4dE75oIvR/iGZmJG2LZX5HTrhr5dkySq+OXbdefirhJKBN2p//j7b9efb
 r2hNnr2nD7gvnJHJbBtmrnnCl7IPtiX2HS08elenzlfv7fd7fsfwRnHMnl07e967KlkXHxW7
 pqqkKObl9mMvRT2TNE7ndAuqwiuSnqZCkk1bDV3y7DJDKPt1EMqzBYneWhtbSf4yrj+5dluv
 Kb3CdEk+l7Ho2bzwmm27rTPOocmc+oN50xmj/inglCv0xkh7SbDzCWWI9n70kwo59+z6pou7
 q2YXE4X1fVNme2LNqyOG+v2YLnGNLsS1/hHdzjbP1qnq+NLSdvOX8ROPJ0vqB4vDIo01WRlh
 Uy+SgdtGPfv8UG8EoToi3bIBV6qk/wJ0jQjbRQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xe7qrufzTDRqb+S1OXF/EZLH19yx2
 izV7zzFZzD9yjtXi3qUtTBZXvr5ns1j39AK7xYu9jSwW11bMZbdoPraezeLlrHtsFh977rFa
 XN41h83ic+8RRottn1vYLNYeuctusf7rfCaLhR+3slgs2bGL0aKtcxmrxcVTrhYvL/cwW7TN
 4rf4v2cHu8W/axtZLGa/289useXNRFaL42vDLVr2T2FxkPV4f6OV3ePNy5csHoc7vrB77P22
 gMVj56y77B49O88wemxa1cnmcefaHjaPeScDPe53H2fy2Lyk3qNl7TEmj/f7rrJ59G1Zxehx
 qfk6u8fm09UBglF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZll
 qUX6dgl6GQd2fWIq2MVRMfHJX+YGxnb2LkZODgkBE4l5iycC2VwcQgJLGSUa5pyHSshIXOt+
 yQJhC0v8udbFBlH0ilGi4/FhNpAEm4CRxIPl81lBEiICnSwSbzevZQRxmAXeMkpcn7kRrF1Y
 wF9i6sEnYGNZBFQlDj1/wgRi8wo4SBzvOckMsUJeYv/Bs2A2J1D89dQuVhBbSMBeYsffw6wQ
 9YISJ2c+AZvJDFTfvHU28wRGgVlIUrOQpBYwMq1iFEktLc5Nzy021CtOzC0uzUvXS87P3cQI
 TCzbjv3cvINx3quPeocYmTgYDzFKcDArifAuX++dLsSbklhZlVqUH19UmpNafIjRFOjuicxS
 osn5wNSWVxJvaGZgamhiZmlgamlmrCTO63b5fJqQQHpiSWp2ampBahFMHxMHp1QDkx57bcDm
 FYkFPZfbZ9zfwdyUfplbcX/XoY0+Ts/nx1dZNe/xWJJw4lhzkgD/VDlZpiVrNtQujmG3iVLZ
 ++fr5NnfN1wQtDCSt+O+myuW87oxwt571/eFYf5XL3DKVOv5mh6b0KYpNlfFkkNEJnBfpALX
 jMNSia8zzG+ERizmiJmm9b437MWvJd6vd7ltZC1ROvHl6/t/07kFraJ26+ZfkUhheuFZ7HY7
 tTfjt/7vs8vcnrxuXd9j8MFxl4Jz/fTr4tPYPEy6jluL3XttMjN705ZP8x6+i9Ba6Sxfl9u2
 97yYEteqRW98cm4vr/11Je1D6tGoQKtv77lXXfav+bU+bpn5tHlOX6YdKzp79DfbXyWW4oxE
 Qy3mouJEAFZ2wvS1AwAA
X-CMS-MailID: 20241203134203eucas1p11a2e36f777af362a333d8865bcb5d34e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241203134203eucas1p11a2e36f777af362a333d8865bcb5d34e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241203134203eucas1p11a2e36f777af362a333d8865bcb5d34e
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134203eucas1p11a2e36f777af362a333d8865bcb5d34e@eucas1p1.samsung.com>
X-Mailman-Approved-At: Tue, 03 Dec 2024 18:40:35 +0000
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

Several RISC-V boards feature Imagination GPUs that are compatible with
the PowerVR driver. An example is the IMG BXM-4-64 GPU on the Lichee Pi
4A board. This commit adjusts the driver's Kconfig dependencies to allow
the PowerVR driver to be compiled on the RISC-V architecture.

By enabling compilation on RISC-V, we expand support for these GPUs,
providing graphics acceleration capabilities and enhancing hardware
compatibility on RISC-V platforms.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 3bfa2ac212dc..5f218896114c 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -3,7 +3,7 @@
 
 config DRM_POWERVR
 	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
-	depends on ARM64
+	depends on (ARM64 || RISCV)
 	depends on DRM
 	depends on PM
 	select DRM_EXEC
-- 
2.34.1

