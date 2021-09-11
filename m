Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81C5407615
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 12:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5156E99F;
	Sat, 11 Sep 2021 10:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 318 seconds by postgrey-1.36 at gabe;
 Sat, 11 Sep 2021 10:34:08 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574A86E99F
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Sep 2021 10:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631356446;
 bh=kW2/XFCgLeQJ8pAdiZHbaLLR//IPNQFMApFkxDIZUaU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=SMfszyS7fpQAl8EViFkiAHV2P3+RZts8TsGxMNiltBl1Ors63kPh2wJ72UQvfZhoj
 b6/GQ9rKTi/b06SHwwByKidP0G33cF1TZcFxmTMP92PXcNPMgTJlNXwhXD1Xf2v3rq
 Pr+5owY5U2K5dZzj5vzvzCKPdEVI2bqR9lNbEWMA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1M1Hdq-1mNMcU11P0-002rAx; Sat, 11 Sep 2021 12:28:40 +0200
From: Len Baker <len.baker@gmx.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>
Cc: Len Baker <len.baker@gmx.com>, Colin Ian King <colin.king@canonical.com>,
 linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] net: mana: Prefer struct_size over open coded arithmetic
Date: Sat, 11 Sep 2021 12:28:18 +0200
Message-Id: <20210911102818.3804-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dfVEWPwUfXk7WIDTAbTGVLjgPLhUDRc24p6xewK3GBqzbU6DrcU
 ykjnc9cNedQlmlg2HsTJDh+pa11ahYb6Y+2sPn51SUs8CNYG+ggGvmOsFmGmQQ77r9/a55S
 635XjyqZv/kz30sj90ZoUxbIdPhLVdwaip4p8XoRizgjtM4u7JfPsXt8t4JOwK4SDCTUtrm
 5Pzh+wyuAZy8g7EzyPK9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:arqUsRxHs9g=:2+DWnwfOpuJVzk5UIg7elK
 mwIAXKhHRa3XipIVYCykZc0lo7+v+ELhwOP7LfDheWrotJTI9ABLTURqgKAGwe555stYiRynA
 vkOYshcEwe6W5BAA1xxNoCnHGwlP+k4ECJ9Q6qAlByY97W0NnzZfj3skrPrzaQu1At4cHoqXS
 ypN9q/KxtXgbnQGMyD3v82183TDH2kzNVn41IItcjDjowX7ljVbskYM9aP0XJoBJ4GA2y/1M6
 +lEQX1/FMCHtL6WN31OfAlXA9i8OVaAJfxrhG9xIs7A1a1mBkmAuDvX2x5YIuBdC/NIjkZslA
 xkJawNI2qM05rUpYtOt03L/Tq2TWDRKEp9znc+yjEvXTSX/V/Q0J9aAHaLr7ijZOMYw+YVuk5
 wf43C7d1wyhG1PsK5QyWDn4QWhCYWkMOQiCK4V2G1yZ4W0zAtn3rXjw7AT0FgxJ4FoXTHq81U
 xywLD74BoyPkMSd4u0YMj0+ta5KbHILHxwz1dzfhpnP+70d5M/6/mx8FtnQyGKFHuOCAd6l6n
 R+uuTt+mgbOe60CnJ97z0dvuNkq98Vwk+w9Sp1oLVykW6L7XUrX1ZH5ccnJudAWnW3aTL24pr
 5X2osVQMjKdiOkUG4EfXuRL5Tdc/v9AfgKtSgyx+XH09mMIjL6kumBlePoPCLusaShxzvYtfB
 /znhQ5FxPVs96NDij0OWD6ILj3Qs7NRhygwBueSb445EJrPqVTN+acR/vok4AgTjVas1ZHKkh
 TzUvef1hsZrr+UpDwsEWdX4pOtYQNklAmW/9k16YRo5l6ZXqN/5VdeYh336hBn6RWGPyGfiHW
 BjTVN1iH6AzT7GZYv4A/xp9M6Up96BcLJHENp/0HqOsjfXSqmH+dbXKYKdCod18be8FTP8NVz
 nke5yUISIee/TtArDowIQ6WLKm6RC18mk3vX8EDUZHwG9W0BmhX+FI2/nciB8r4lpCOmkkDOE
 QJNDwmAQ72qA3jL0+itOziJQtkr7puC+/G/4b9vKRBTTu2VSeYLuTB+EvJmb0yl11dT143isV
 Ny0OQO4Jlvpp+JAEfLiKDhl31F1y06SAjOyhxV4N8+b+RrdZKuarxIODFVpPsvxCPIX/1Kvwm
 aDw4LQQhbcqiwA=
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

As noted in the "Deprecated Interfaces, Language Features, Attributes,
and Conventions" documentation [1], size calculations (especially
multiplication) should not be performed in memory allocator (or similar)
function arguments due to the risk of them overflowing. This could lead
to values wrapping around and a smaller allocation being made than the
caller was expecting. Using those allocations could lead to linear
overflows of heap memory and other misbehaviors.

So, use the struct_size() helper to do the arithmetic instead of the
argument "size + count * size" in the kzalloc() function.

[1] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#open-cod=
ed-arithmetic-in-allocator-arguments

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/net/ethernet/microsoft/mana/hw_channel.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microsoft/mana/hw_channel.c b/drivers/ne=
t/ethernet/microsoft/mana/hw_channel.c
index 1a923fd99990..0efdc6c3c32a 100644
=2D-- a/drivers/net/ethernet/microsoft/mana/hw_channel.c
+++ b/drivers/net/ethernet/microsoft/mana/hw_channel.c
@@ -398,9 +398,7 @@ static int mana_hwc_alloc_dma_buf(struct hw_channel_co=
ntext *hwc, u16 q_depth,
 	int err;
 	u16 i;

-	dma_buf =3D kzalloc(sizeof(*dma_buf) +
-			  q_depth * sizeof(struct hwc_work_request),
-			  GFP_KERNEL);
+	dma_buf =3D kzalloc(struct_size(dma_buf, reqs, q_depth), GFP_KERNEL);
 	if (!dma_buf)
 		return -ENOMEM;

=2D-
2.25.1

