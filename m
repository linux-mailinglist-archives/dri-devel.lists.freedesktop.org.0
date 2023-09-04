Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2646791D8A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 21:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9488110E179;
	Mon,  4 Sep 2023 19:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr
 [80.12.242.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7EF10E3DD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 19:18:42 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id dF5pqisSfrpphdF5qqmw28; Mon, 04 Sep 2023 21:18:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1693855120;
 bh=IJ6e+7Zx4V39vofq+85y5jlLYHgKa63pDRxIQQkBNeo=;
 h=From:To:Cc:Subject:Date;
 b=stflw7wrngPm23k1j/k3IOrf8dC+0fTLtV3ZRPCb6gYi7+b6tsAqanlXa2oBI8D5o
 3vPfKvWPNFl39fEdz1kGs+Yo+gdePwLBH5KGlY07d9rnkYEib7+TYap7+0o8bUi0H1
 qh0AdSjs5+Ylrl4GcvV5d0qmMfTWcezVwQk3u3XYpzxkNlUW4HErscX29tjMgOBxuz
 xOasZJpVeRrDIhkbtwRv+SUIagIJKtea6lobGm9Z+B464GNdWWHL8gFkBkY95q+bG/
 QJYniGX457kSH7/VZynexZLs3dhPX/ojuUM5Ws8eUxgsaaeqDKYZvoB7yCsCsKC5Z4
 OPmT2doe+12fA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 04 Sep 2023 21:18:40 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Oded Gabbay <ogabbay@kernel.org>, Dani Liberman <dliberman@habana.ai>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: [PATCH] accel/habanalabs/gaudi2: Fix incorrect string length
 computation in gaudi2_psoc_razwi_get_engines()
Date: Mon,  4 Sep 2023 21:18:36 +0200
Message-Id: <d38582083ece76155dabdfd9a29d5a9dd0d6bce7.1693855091.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

snprintf() returns the "number of characters which *would* be generated for
the given input", not the size *really* generated.

In order to avoid too large values for 'str_size' (and potential negative
values for "PSOC_RAZWI_ENG_STR_SIZE - str_size") use scnprintf()
instead of snprintf().

Fixes: c0e6df916050 ("accel/habanalabs: fix address decode RAZWI handling")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index d94acec63d95..9617c062b7ca 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8277,11 +8277,11 @@ static int gaudi2_psoc_razwi_get_engines(struct gaudi2_razwi_info *razwi_info, u
 		eng_id[num_of_eng] = razwi_info[i].eng_id;
 		base[num_of_eng] = razwi_info[i].rtr_ctrl;
 		if (!num_of_eng)
-			str_size += snprintf(eng_name + str_size,
+			str_size += scnprintf(eng_name + str_size,
 						PSOC_RAZWI_ENG_STR_SIZE - str_size, "%s",
 						razwi_info[i].eng_name);
 		else
-			str_size += snprintf(eng_name + str_size,
+			str_size += scnprintf(eng_name + str_size,
 						PSOC_RAZWI_ENG_STR_SIZE - str_size, " or %s",
 						razwi_info[i].eng_name);
 		num_of_eng++;
-- 
2.34.1

