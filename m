Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB5570E2DC
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6B810E440;
	Tue, 23 May 2023 17:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5815510E440
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1684863855; i=markus.elfring@web.de;
 bh=7d1ZHf1OTR0FUWvsWH8nz9gvTQZMaXN4+xkGz9tx3Zc=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=vZNcfhsicZ+SSZexfuYZTsKMga++w0EzveWxLURbnOkoPcYrzzptlNLbd1hJPzPrs
 WFvulXOuxB7/aX7nGINIHm3Iq4/xiXM8yhsh8XYhzwJONeQNk2ctEkBBCC4/y1g5x3
 C2jknyjB6tYPmoSddJ8CBABIuSLIWCXeX+cK4DDLt7Di2UPWQ+4ZQX8UFGmZQvZ2Zp
 OWgrGcO3ZTJiH5xdTtg93OemWxk0eXCGfatEcusp4q4rHf7i98p2TtiYSSGTSo7N5J
 D6EgE1Lfrtgrsl1+KcAU67f+iXhP6dWn8cTvc1RFYOrgbxI7HL7Vo/Ms3RHT2k29cQ
 K3GPlxh2iouuQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MJnrh-1phuha1zYX-00JvlZ; Tue, 23
 May 2023 19:44:15 +0200
Message-ID: <b924f0b9-c769-3f9d-6242-c478408663fd@web.de>
Date: Tue, 23 May 2023 19:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH 4/4] fbdev: imsttfb: Improve a size determination in
 imsttfb_probe()
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
X-Provags-ID: V03:K1:1FZrJ8q5Usts1dKqw0p2/up3PDfR6unfNFSwyswIoBUo91rS47t
 KofXFn8jFWLVAmK0yjE3C6kVMrNxMmMFaVv1p79F9tDrvIIOc3GzOIvMKvHX8sAMcdP4fXf
 l72hDlCeMbeQwME8HPYAEYzjjBWC84b4tqjPTulj0qVJMWiOvqKw6Rr0nLBqn5lVWg3R3m8
 Wz3bmqIwAqhgsgS3W9V/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vZrdde+8SPs=;EpAgtuyYllM+0Pt9GiQmYFXCmOv
 qF9a07CT9Tr/7PN0HB75GQTNSKM/vVFnjHKBJ71yIxjZfMc2sYgpg4QXQL7uvWYhuT6/0iY1+
 EZFBZVMTsOLQiWthRwtxvQ9Qg0NCNgnwBUyIfAqZL0VKRgKMsYVhHpq+afCKhSP0og3utGqoP
 5XfLOpfiAJtLVK5TCzaAcrEUd2IJPYuoqazXird4BvItpfhyDyrrwi6pM6oIy86aN9pFc4XH6
 muNSZWrFpwf04URPhLUSTkEDanxSdeVoxGLkc3u28cgHRogN7JLeglXpjUFhMtogTGJ66/60J
 URcH6pOijUMPU+Y5LtYcICjLfRhBbCOilFo4izqPini8jWXUnToKORnXMniycb2qfLrmuKxCJ
 l9iWcp/rSdUi0zGq9r/fhdiG5qzSelJe9KRM35zq2/SpJHe67nGsmqkeeSg66BRufb4qh5Pqh
 Y/d35lpyriJemowY4vxURajtSf2toNgT0yB5z2s6zMtXe9fcZ/90exWeWAEQ2gWrrz1kTSEHP
 m18e/+u6iiFSN4UpL5RyhMcj1CESGBlTGF0BhqWmJsFDifl/CvJr5JDsRHNdoNKGa3DQdVx7/
 KAXH3xTQhmtvXvR/PoL59l2ozqoRzyZcAEU5BZrTNpg3gr9NUyrC0daeYmANOxSWT5QjwvE+Q
 zYWEJHixBt0hgPt8RX/mphztrnoSFv564e4pL+HJ/UC6waSfltjb2AvhBD3IgAVSm6yMxqmTI
 5Sy6JYR1K6ToJ+vv6BCTws8qaOdKGhaJZv44pLrk+GBVwmB5kFA71o2z7bai9aB5JRE17d+ko
 lNHDuWUD3JOWetcyuyIlmkGgT6k1YLy0w2MwE7iGBKhbcaiBpspSzjf2VODDiTGX47/7VR7AI
 Hy/FMTfeSzUZWXxyCAbQ/5oBuqG/qd2nSSA8AbduK5qBdTxNrTJqRFePJuMupNQqcGlXZ9cdA
 f6FwgQ==
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
Date: Tue, 23 May 2023 18:50:53 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/video/fbdev/imsttfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index 90c72428e8d7..346e0166c711 100644
=2D-- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1491,7 +1491,7 @@ static int imsttfb_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
 	else if (IS_ENABLED(CONFIG_OF))
 		printk(KERN_ERR "imsttfb: no OF node for pci device\n");

-	info =3D framebuffer_alloc(sizeof(struct imstt_par), &pdev->dev);
+	info =3D framebuffer_alloc(sizeof(*par), &pdev->dev);
 	if (!info)
 		return -ENOMEM;

=2D-
2.40.1

