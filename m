Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 613D62DF514
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D0989C68;
	Sun, 20 Dec 2020 11:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4798 seconds by postgrey-1.36 at gabe;
 Fri, 18 Dec 2020 15:56:14 UTC
Received: from 10.mo69.mail-out.ovh.net (10.mo69.mail-out.ovh.net
 [46.105.73.241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628076E171
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 15:56:14 +0000 (UTC)
Received: from player716.ha.ovh.net (unknown [10.108.54.59])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id AA205A4404
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 15:11:20 +0100 (CET)
Received: from armadeus.com (lfbn-str-1-215-46.w86-243.abo.wanadoo.fr
 [86.243.176.46])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id B281C194034C8;
 Fri, 18 Dec 2020 14:11:04 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001a6eef942-fcab-4ed3-a9e4-1f900c775826,
 F4E34FAEFBBC2F77A8F65A75F5C3271EDA163614)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 86.243.176.46
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm: mxsfb: add alpha plane support on i.MX6UL/i.MX6ULL
Date: Fri, 18 Dec 2020 15:10:34 +0100
Message-Id: <20201218141035.28038-2-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201218141035.28038-1-sebastien.szymanski@armadeus.com>
References: <20201218141035.28038-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13296877900587553861
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhephfefhfejjeffgfeiteejhfetvdeftdekudeltedvveelleeileffgedufeefvddvnecukfhppedtrddtrddtrddtpdekiedrvdegfedrudejiedrgeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGVMQ0RJRiBjb250cm9sbGVyIG9uIGkuTVg2VUwvaS5NWDZVTEwgc3VwcG9ydHMgdGhlIGFs
cGhhIHBsYW5lIHRvby4KRW5hYmxlIGl0IG9uIHRoZXNlIFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBT
w6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0t
LQpXaGlsZSB0ZXN0aW5nLCBJIGhhdmUgbm90aWNlZCB0aGF0IHRoZSBhbHBoYSBwbGFuZSB3b3Jr
cyBidXQKc29tZXRpbWVzIHRoZSBmcmFtZWJ1ZmZlciBpcyBzaGlmdHRlZCB0byB0aGUgcmlnaHQu
CkkgdGVzdGVkIHdpdGggdGhlIGZvbGxvd2luZyBtb2RldGVzdCBjb21tYW5kOgoKbW9kZXRlc3Qg
LU0gbXhzZmItZHJtIC1zIDM3QDM1OjgwMHg0ODAgLVAgMzNAMzU6ODAweDQ4MEBBUjI0IC1GIHNt
cHRlLHBsYWluCgogZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXhzZmIvbXhzZmJfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKaW5k
ZXggNmZhZjE3YjY0MDhkLi45NWMzNTMzM2MyZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9teHNmYi9teHNmYl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2
LmMKQEAgLTMwNiw2ICszMDYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kcml2ZXIgbXhz
ZmJfZHJpdmVyID0gewogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXhzZmJfZHRf
aWRzW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJmc2wsaW14MjMtbGNkaWYiLCAuZGF0YSA9ICZt
eHNmYl9kZXZkYXRhW01YU0ZCX1YzXSwgfSwKIAl7IC5jb21wYXRpYmxlID0gImZzbCxpbXgyOC1s
Y2RpZiIsIC5kYXRhID0gJm14c2ZiX2RldmRhdGFbTVhTRkJfVjRdLCB9LAorCXsgLmNvbXBhdGli
bGUgPSAiZnNsLGlteDZ1bC1sY2RpZiIsIC5kYXRhID0gJm14c2ZiX2RldmRhdGFbTVhTRkJfVjZd
LCB9LAogCXsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDZzeC1sY2RpZiIsIC5kYXRhID0gJm14c2Zi
X2RldmRhdGFbTVhTRkJfVjZdLCB9LAogCXsgLyogc2VudGluZWwgKi8gfQogfTsKLS0gCjIuMjYu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
