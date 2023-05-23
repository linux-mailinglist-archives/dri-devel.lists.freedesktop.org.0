Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0792670E2D6
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DC710E106;
	Tue, 23 May 2023 17:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3779710E106
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1684863617; i=markus.elfring@web.de;
 bh=dZAZTWocFmwMeI41tgq/9qsNmxwFlyNoBkJGWPDlc2o=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=TKbqjsJmtPL45O1znHWMPToDR9bFUNTuQ1s2jsH61QLvye+vZgklvo5BvFp3pDddX
 paugPZdaO0U1i6F8MHtlRyecNYCKHIYfktwHj5a6+yGnU1bQBKRSKxpdaJNTc2BCBN
 yv6jz4WpqYakQJRm/VUIjH7Tfp16+/qNbcO1OtfV82jZZ08CXm5uPFYdinYIAzGegN
 ipPGRUvxJuNnVQdV28rPRMLA+9BmYMR7xJCAQ26WyCoQfTBcw9vmuZhWptMroO/Wmo
 pfw2Fye41Wp9nBCrRVAC6OAkeMgLtux28OobwOEywkdWJGLK80EwzfrIfnpNZJ0o1s
 pwtsbGLti5TPA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3m9H-1q2L4c0WV1-000rbV; Tue, 23
 May 2023 19:40:17 +0200
Message-ID: <e98a620b-7b3b-0d5c-3bc8-4cbbda1dd057@web.de>
Date: Tue, 23 May 2023 19:40:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH 2/4] fbdev: imsttfb: Fix exception handling in imsttfb_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
 <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
In-Reply-To: <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QEbEaGKrHnj4+xdRAtEbFhnE4hMSAqjN7cMcZwRbJ8dJbVU/4d4
 ByOLqxblchi7JQSn8cPTXzH1zV8mA1mHfFoABa2g4g0eLCs2CLSreMzfCw7vZkt6F5EFgnd
 V+X0cTAjciIjUK47hK5j1bGelm2QKEWqdzdu7ORuj8D7WqFl1YnDpqkYwEAyy3e8m09hyse
 qpU60cSjf3UyOFC/pZfCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZNlXuM4RdCo=;W5fkWHl/pqYc20ijGSe8Hf1TdNL
 tB9uZ85T5H28Hm/ceg0bsGRqO83ivcj4UULZUZxIN6X6VbiTLCnYrlNig0CqIRKFjqhAE6qo/
 Wx7JUlGABKw0CWIfHKisjWwwaGO/bVBuuJWL/ojKnrHdTqTL3zeivSziYeJKs2YppjqdLSbT2
 v1cGTSIBIO034RbsrQEzMu37d+Bh/BPpac+zRUdVH6uLNottNBvMLwBRBthpEVJGTlYbaTL4/
 wCGbiSw+Jm//J3N+wSJD+crp9kmgzeF5EHZ548/woy7w3/uD+TsSGOd9m1OMt9wHaHW4BNClj
 Z2vG5GM/trXPEOsiJmOY2bR9bVKCo0Vf5uzjaqE/BGnlyYBjb2tMa8ylcJG5mLfN4f7eX39t9
 5oqOcZTezhuNdaIMdwiMzRwqCbnw971PjDUMdyUTKSjKfj8bzBUUO02vmmWHEkcV05afvYfmh
 hl7+YX8PSxD+oAqCyjDqpPUqFS9444/hpqANO+B/bAfFbDZeCQLxZXFJHhIifniHgKpC3aAWJ
 4MjLfQPdAY+xzwGhl0IYx+G8YkzEAYvSQBRd2ajBFT18a4jGjNvFgFGSlX/YBT8ssfPMvhk3g
 ZtCUpVzQObmagl38+4dn664MGl8f2LUr7kS6k6u9bfYvvK1ad8n4it2d+D8tMJzSX2uTp50g8
 v3s4b/wvNmK7KLXncufqAEc8Jh4HFAeZsrMOa5PfdklabzFEGNJS9aqokWQtHYUycHrzxyKZV
 hasFFneuaGn+/h537NX2eZXOF6nUWrF/iIRup9GawY8zpDz7GTxOQbhEPPBQNoMO+Wn2F7DyC
 RWx3VrBBLF9Qs7nvgOQFnWTePXvzMi9efKpdhW+cV7uf9NXbJmgr+h0VYZJoaSsMiywTy8mpu
 WtqpT1gqtYkgCIgunVxzsuGmCRvmijPs5xT19AqWK7PVPtO3ycO2EaUXR4FgqAfoUFZuyT1GB
 o1QPSw==
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
Cc: 1395428693sheep@gmail.com, hackerzheng666@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr, alex000young@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2023 15:40:43 +0200

The exception handling was incomplete.

The label =E2=80=9Cerror=E2=80=9D was used to jump to another pointer chec=
k despite of
the detail in the implementation of the function =E2=80=9Cimsttfb_probe=E2=
=80=9D
that it was determined already that the corresponding variable
contained a null pointer.

* Thus use more appropriate labels instead.

* Delete two redundant checks.


Reported-by: "Michal Koutn=C3=BD" <mkoutny@suse.com>
Link: https://lore.kernel.org/dri-devel/34gbv2k3lc5dl4nbivslizfuor6qc34j63=
idiiuc35qkk3iohs@7bshmqu2ue7a/
Fixes: c75f5a550610 ("fbdev: imsttfb: Fix use after free bug in imsttfb_pr=
obe")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/video/fbdev/imsttfb.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index d3532def4707..6490f544f8eb 100644
=2D-- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1503,8 +1503,8 @@ static int imsttfb_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)

 	if (!request_mem_region(addr, size, "imsttfb")) {
 		printk(KERN_ERR "imsttfb: Can't reserve memory region\n");
-		framebuffer_release(info);
-		return -ENODEV;
+		ret =3D -ENODEV;
+		goto release_framebuffer;
 	}

 	switch (pdev->device) {
@@ -1521,34 +1521,42 @@ static int imsttfb_probe(struct pci_dev *pdev, con=
st struct pci_device_id *ent)
 			printk(KERN_INFO "imsttfb: Device 0x%x unknown, "
 					 "contact maintainer.\n", pdev->device);
 			ret =3D -ENODEV;
-			goto error;
+			goto release_region;
 	}

 	info->fix.smem_start =3D addr;
 	info->screen_base =3D (__u8 *)ioremap(addr, par->ramdac =3D=3D IBM ?
 					    0x400000 : 0x800000);
 	if (!info->screen_base)
-		goto error;
+		goto release_region;
+
 	info->fix.mmio_start =3D addr + 0x800000;
 	par->dc_regs =3D ioremap(addr + 0x800000, 0x1000);
 	if (!par->dc_regs)
-		goto error;
+		goto unmap_io_screen_base;
+
 	par->cmap_regs_phys =3D addr + 0x840000;
 	par->cmap_regs =3D (__u8 *)ioremap(addr + 0x840000, 0x1000);
 	if (!par->cmap_regs)
-		goto error;
+		goto unmap_io_dc_regs;
+
 	info->pseudo_palette =3D par->palette;
 	ret =3D init_imstt(info);
-	if (!ret)
-		pci_set_drvdata(pdev, info);
+	if (ret)
+		goto unmap_io_cmap_regs;
+
+	pci_set_drvdata(pdev, info);
 	return ret;

-error:
-	if (par->dc_regs)
-		iounmap(par->dc_regs);
-	if (info->screen_base)
-		iounmap(info->screen_base);
+unmap_io_cmap_regs:
+	iounmap(par->cmap_regs);
+unmap_io_dc_regs:
+	iounmap(par->dc_regs);
+unmap_io_screen_base:
+	iounmap(info->screen_base);
+release_region:
 	release_mem_region(addr, size);
+release_framebuffer:
 	framebuffer_release(info);
 	return ret;
 }
=2D-
2.40.1

