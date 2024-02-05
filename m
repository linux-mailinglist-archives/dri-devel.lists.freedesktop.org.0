Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89F7849733
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 11:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5241810F46D;
	Mon,  5 Feb 2024 10:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="svc3ZXBj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5A310F46D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1707127262; x=1707732062; i=markus.elfring@web.de;
 bh=BP4cik0zUpqBQFebRvL7UNNHdC8t3H6I8IFcOmMDkhY=;
 h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
 b=svc3ZXBjNL90pRbqGudZ5sLzXrkZVAJdqdLBHVoanakv4xWbtWBVh1YgLxA9wwQg
 pNanxujD3FadEe3LD3TBlZ+L++t3miTPa6BPsicradl6DVL5rD5GyXS9lKcQi2+pw
 VqjU1cFKDTqRSZrJ98gvv1oH7P+Wi1fwehXitFxVI7sq5y5TSe4OTuS8YStHZPX7k
 BQiibfFJ8qlxe7dpyywgsFACf9suZzXTnUtlUWGbWs51hplEaU87EQ9fipjWLe1bU
 iBdwerYdz6DixiLjzGnanvWcgrdhx3Ruj8kmyTdpENaTlOb2qul6zzyXOEgJRdOFx
 V992XHYUL7qV+hB6EA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M3m5B-1rXkzt2Jmd-0010fC; Mon, 05
 Feb 2024 11:01:02 +0100
Message-ID: <c2e4aaa9-731f-4a33-890e-567c466a8885@web.de>
Date: Mon, 5 Feb 2024 11:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/tegra: dsi: Use devm_platform_get_and_ioremap_resource()
 in tegra_dsi_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l3QYLItjc1kOM4lo7et/2ok0Re/VhuUd9eWBSSYWeFHhcO8vu59
 zQKhAzcdcqnTWza4xbwztbf0ruOhhqIPbBk8Afas26E+jRmNIqrc1Xp3Vzqk0ZNftgRrYmO
 /AGZkneQ3k7rA/A8J6voFd38wfVaT+UV4R3Whis4b4lUueunTorgmnJ01RMwZAOh9eEsrI2
 QTwLNVCpVtLAxRxf8hhXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W8KQR2hEAzU=;E1Kg3ilBm7X/538T0AtTOeBfTKJ
 GVHgoCgABVGMtfnWDgXJZ0BPU93O9QxCrbl5+jWv5HcYcsT6pHHbr4+mu4HZ6EO6f3Y5TxjBs
 FKz3/mAslNMHthAADDTodH0KdZh16nNlhuJKju61hh33VTnH6KBtjXoh2AqcBbgW8Qvhd9HhG
 sozsLljBleUrJ5rVIakcFjhXxPOxgCUwGn+SK50uUVWPE6UzJ4FRbSV/aYJCh5MElC/0U/RZE
 S1TZVT6hNo0AnUone/SrA/k+3OHeABFpBDvgY8M/NlDT1zrOqTa62+8pSe02nMLi4hjq5O0N8
 8ID5PWcstHpHjW14N3HHyTzlf+4RmDeMfuzDBcIWtKUIKc1RzJXeah6t5siF/4DmRr+wXdxoi
 wozxGUtZ2WYlAypoQxaYGFM6Msl+IYBBXVPUmZ2STDqSntUMkj4ndf5SEECur6tfUrA89qpnt
 duaHh5FSieU96kgc5UwE5zi7DLfWu5X82L25ZK2pACnfGuHyiiYxO6vb8Rf3hnQusRcKLOZgR
 X85sEns/RkS/MtXgs6ph3H2P9MhIX0RaSzTMIjeG+QibqcYR8FXa9fh90nPpBMn2G2n2G0DBl
 WEeQbGmbWwRDQSapBaduCypNeILeW7SDYd4OM3P0X/z6m5OdOoBvjfqoNdaOK2UkcQI8fF/MF
 3ZoMqca2vO5gPFxgo48Q2bWcIMb++dMcElrYCmPZCyhinxrYPesZpi5+cwCbeMQd5FctSlHbg
 m55wStkfh7R4ehjz//4iS6eM3IbklS5h/LDcQHXnD5oOeO9e5g/m1pt/0hbxsfnBZGmYhGc1Y
 d1OyebEFaVUoyGX4Qezuu8MSpkeGQJXDT/aFn2uTLjJbQ=
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Feb 2024 10:51:36 +0100

A wrapper function is available since the commit 890cc39a879906b63912482df=
c41944579df2dc6
("drivers: provide devm_platform_get_and_ioremap_resource()").
Thus reuse existing functionality instead of keeping duplicate source code=
.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/tegra/dsi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index fbfe92a816d4..727c3a7d8d26 100644
=2D-- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1624,8 +1624,7 @@ static int tegra_dsi_probe(struct platform_device *p=
dev)
 		return err;
 	}

-	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->regs =3D devm_ioremap_resource(&pdev->dev, regs);
+	dsi->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
 	if (IS_ERR(dsi->regs))
 		return PTR_ERR(dsi->regs);

=2D-
2.43.0

