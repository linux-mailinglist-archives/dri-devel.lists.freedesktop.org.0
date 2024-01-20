Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1CC835558
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 11:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C8810E1FC;
	Sun, 21 Jan 2024 10:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E63A10E2C1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
 s=s31663417; t=1705763439; x=1706368239; i=erick.archer@gmx.com;
 bh=+uHVK/g0PLW+WPegroJn+bUpobfrkjR1dw/0UibCi00=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=eOC1AoXndex6m0cp89Vg1Nqsnd3hOIYkqwOZw6RuzS49UVQ7Ej+6r/tn86FQgspI
 wnf+XiZXdniwtC4WO8rBIM1orvKCOOVT2O/Yb7AgU3jA3stQmqiR6YagL2iZ6Y5zW
 wm8+0FOXFWARezAcvH81VapSHvuqU4NuxazyIA036NY7+3vPc7j/ZmkcjFQDu750/
 o313gI8UR22E8iqDIxWAMPQiAYFcbHKu64Tg7pfvNzGQ6UgRpvWaNliDsyoY09OFM
 crOJrd/myZcfpy8fm4R53oV4xDfJvNArRoCUwheRcr2dF+TgrCTvU2UYXSEy4ng+U
 CiNLfxsY0Hg3qXu0Dw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([79.157.194.183]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MbRfl-1qpPOg202T-00bqSF; Sat, 20 Jan 2024 16:10:39 +0100
From: Erick Archer <erick.archer@gmx.com>
To: Oded Gabbay <ogabbay@kernel.org>, Marco Pagani <marpagan@redhat.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH] accel/habanalabs: use kcalloc() instead of kzalloc()
Date: Sat, 20 Jan 2024 16:10:28 +0100
Message-Id: <20240120151028.11092-1-erick.archer@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LTMJoGso7WL0bY6lGh/U0pZex8Eyp3xSFlhDAImF5EnyynE3/Sf
 YoELrMft1Tj+WIC7i+n1sKFFACYDWfx4jxqdYkxKAprcoJsmJut0q6vKhYtefzcHURAS1/I
 d1K9Z7bqkmVG0IEWI9hD5YhSgqXQgS+vPJ/FiVudDj6+TDfazkBUOwOf5pYjz5487TX5aei
 uFD87FttWgS1Uj0LcAxUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5162j+Gh7BE=;7MwV3GYQV4AF6w3g4fXl1qNIOgg
 klgJqKVusUiEanMLlbfQQShbn+gCqtIMdoGadz9LUHz//eQ01P4ou0oyfmWm2RIZx9xo+qdf6
 iFk/BhVZeQT9zKKd8ZAZT3KGWMfzjKILLLHKgdkzAQ8oPBiyrcJDTDpsnDB1NUkdbdSYRdX9S
 3q/8h1bjjXJAV4lql9Jl6Jk1zN93f3htBaRN6g4c5oe+7yJItNwvBVH9esgsjBA0xiYRfJWm+
 Okpb7vOSMl45/y+aMUc2kwr4S6dzX/a9H32AOU9oCnTtQI7WGHD6Av5wblmbF2VbxP4oRp/S8
 ZBS4T+zjks4InudF+AYjNE9Wt9O/Clxx4Hrd8cRLD+kQUCFq9w/pdI96RXRXZQByXliTNMs3I
 F2W4S8U2XDHn1od38zaVukTNjQ6G4QCgblXwi8P3311yK2YpYGXSRmF9TLz9bZDJ8hA92g/ZP
 RNNqDrTUUskXd9BE7m2Hx30l5ums7U4KjdEdx/VRnOQIHbQQFwYOC38qkZDAf/r7KE6QnfTJu
 jjTu0McZpz/za1RZdft/RamG7bU19QbEPIrJ1G4dMTxKyKf99UkpTF/THgv3gEtAv4H9O7snD
 SMiWLFik9l+ZLKDaWX0+eETjdtQvw7ILPcdk2pX9tjSYjPNBkj1KA3a/lN6nZmv+ctYSs8twR
 Fcl81hnurU4HFXsn/XWOve8qDyP2EvKmPBtzc6q/U/Q0XVg2xTHcYOe+3QQIXlyI3JTQ9xNUd
 n8NXfk7PiDP/GD82ZRhKwbgNdMOS6c5iQxYRWG+gMMBgEfQ41MId8RSnuE/6CxknDie41iRFj
 /WAPhit2ZwOLneFP1+nQOsKY/WbgYIsza1pAshlDCSlqvZ2GDDO7o7CQhT75dmd+k1mNm0FY2
 eaPTOaRN9VMJgUey/xfRaG7YvWYCsXDBA9UKgaQWy3AqHSk2Z9S2Yet4D4ZeKk0mvbytJnXNj
 GE/K9IaYaFIXj1mhDc+GCMeLzHE=
X-Mailman-Approved-At: Sun, 21 Jan 2024 10:54:13 +0000
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
Cc: Erick Archer <erick.archer@gmx.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As noted in the "Deprecated Interfaces, Language Features, Attributes,
and Conventions" documentation [1], size calculations (especially
multiplication) should not be performed in memory allocator (or similar)
function arguments due to the risk of them overflowing. This could lead
to values wrapping around and a smaller allocation being made than the
caller was expecting. Using those allocations could lead to linear
overflows of heap memory and other misbehaviors.

So, use the purpose specific kcalloc() function instead of the argument
size * count in the kzalloc() function.

Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-co=
ded-arithmetic-in-allocator-arguments [1]
Link: https://github.com/KSPP/linux/issues/162

Signed-off-by: Erick Archer <erick.archer@gmx.com>
=2D--
 drivers/accel/habanalabs/common/mmu/mmu_v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/mmu/mmu_v1.c b/drivers/accel/=
habanalabs/common/mmu/mmu_v1.c
index d925dc4dd097..e3d42cfead27 100644
=2D-- a/drivers/accel/habanalabs/common/mmu/mmu_v1.c
+++ b/drivers/accel/habanalabs/common/mmu/mmu_v1.c
@@ -232,7 +232,7 @@ static int dram_default_mapping_init(struct hl_ctx *ct=
x)
 	/* add hop1 and hop2 */
 	total_hops =3D num_of_hop3 + 2;

-	ctx->dram_default_hops =3D kzalloc(HL_PTE_SIZE * total_hops,  GFP_KERNEL=
);
+	ctx->dram_default_hops =3D kcalloc(total_hops, HL_PTE_SIZE,  GFP_KERNEL)=
;
 	if (!ctx->dram_default_hops)
 		return -ENOMEM;

=2D-
2.25.1

