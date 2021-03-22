Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B0D344A43
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683876E4AA;
	Mon, 22 Mar 2021 16:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B686E4AA;
 Mon, 22 Mar 2021 16:04:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60C55619A7;
 Mon, 22 Mar 2021 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429056;
 bh=n4YjjyF/BQX1oLI53brWrn/ZFErJefAlbdz/B6a/LhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PJL0qpPDqSs2z7UPLYK5QVJo9sc76O7NWlWo5JPHSsPqGyDVDF4pF7hWXIkB1JA75
 QpQt35+7BgO8L8Mn3URqgy3oEgZ8mXFVdUTizaV6t4aX9h9ExQGoEX/rwcyz2jamB2
 scTuPUkDJISJZufdWGtFTIeZztxCxD3lXQOLujQyrS4sySOSS+Y/vZY+qg8LWnqJQL
 I/Aimz84KOYue+E+Dz/GzEJ2kjYrLgh/PeozYrKn1GELVG7ePD4iEbNB0WU3el9Rvz
 crDXO284w80Ehtcr/BjQheDrwVIVIOc3LE73CNZdbBcsVLFqijc8sIiXIjFKbmSQwm
 LtmW3NkvnLTfA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 04/11] ath11: Wstringop-overread warning
Date: Mon, 22 Mar 2021 17:02:42 +0100
Message-Id: <20210322160253.4032422-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>,
 Carl Huang <cjhuang@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Johannes Berg <johannes.berg@intel.com>, linux-scsi@vger.kernel.org,
 x86@kernel.org, Aloka Dixit <alokad@codeaurora.org>,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 ath11k@lists.infradead.org, Serge Hallyn <serge@hallyn.com>,
 Arnd Bergmann <arnd@arndb.de>, Ritesh Singh <ritesi@codeaurora.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Rajkumar Manoharan <rmanohar@codeaurora.org>,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-security-module@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Simon Kelley <simon@thekelleys.org.uk>,
 intel-gfx@lists.freedesktop.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

gcc-11 with the kernel address sanitizer prints a warning for this
driver:

In function 'ath11k_peer_assoc_h_vht',
    inlined from 'ath11k_peer_assoc_prepare' at drivers/net/wireless/ath/ath11k/mac.c:1632:2:
drivers/net/wireless/ath/ath11k/mac.c:1164:13: error: 'ath11k_peer_assoc_h_vht_masked' reading 16 bytes from a region of size 4 [-Werror=stringop-overread]
 1164 |         if (ath11k_peer_assoc_h_vht_masked(vht_mcs_mask))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:1164:13: note: referencing argument 1 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:969:1: note: in a call to function 'ath11k_peer_assoc_h_vht_masked'
  969 | ath11k_peer_assoc_h_vht_masked(const u16 vht_mcs_mask[NL80211_VHT_NSS_MAX])
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

According to analysis from gcc developers, this is a glitch in the
way gcc tracks the size of struct members. This should really get
fixed in gcc, but it's also easy to work around this instance
by changing the function prototype to no include the length of
the array.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99673
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b391169576e2..5cb7ed53f3c4 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -966,7 +966,7 @@ ath11k_peer_assoc_h_ht_masked(const u8 ht_mcs_mask[IEEE80211_HT_MCS_MASK_LEN])
 }
 
 static bool
-ath11k_peer_assoc_h_vht_masked(const u16 vht_mcs_mask[NL80211_VHT_NSS_MAX])
+ath11k_peer_assoc_h_vht_masked(const u16 vht_mcs_mask[])
 {
 	int nss;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
