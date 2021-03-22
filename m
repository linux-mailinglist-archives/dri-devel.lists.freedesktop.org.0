Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61750344A4E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DFF6E505;
	Mon, 22 Mar 2021 16:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA246E505;
 Mon, 22 Mar 2021 16:05:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72908619A9;
 Mon, 22 Mar 2021 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429118;
 bh=EPe3bIidXGt1QSXUt8K/T9qB09rG8+BNJJvNG8YjWag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=odvbczUMlcMOL6OYbdCtO6qt6RZm272nfTphlFLY6klU5CkTn017tx34pnASZGNCF
 IpTcV7nYkdiHmdTO4YSIbtaihkUG1yjP/yyOdl4AEWNcNqBp3RlBD18ZnYm597BmUn
 wbL0s1j6ZDhyXNOvtPSEo+IomEmxiiG2PhvFgAApDhn6IwYxk6QphMYP+c26QRueLZ
 RufWjyGVlIhAtQ1wf9LhLwHYQjNNIjPOnznUa3dYOSsg79XhSsMNd+utp3nEch/2kA
 G7BxSH7No+IViGt23UWj5mYSj83XwgoEag8qXDcmE/UvDP4IP5Eh1a52oCa4LWy515
 1pAfWyFQAG1Kg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH 09/11] scsi: lpfc: fix gcc -Wstringop-overread warning
Date: Mon, 22 Mar 2021 17:02:47 +0100
Message-Id: <20210322160253.4032422-10-arnd@kernel.org>
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
Cc: Anders Larsen <al@alarsen.net>, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>, linux-scsi@vger.kernel.org, x86@kernel.org,
 tboot-devel@lists.sourceforge.net, Kalle Valo <kvalo@codeaurora.org>,
 ath11k@lists.infradead.org, Ye Bin <yebin10@huawei.com>,
 Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, Ning Sun <ning.sun@intel.com>,
 Hannes Reinecke <hare@suse.de>, Colin Ian King <colin.king@canonical.com>,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-security-module@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

gcc-11 warns about an strnlen with a length larger than the size of the
passed buffer:

drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_nvme_info_show':
drivers/scsi/lpfc/lpfc_attr.c:518:25: error: 'strnlen' specified bound 4095 exceeds source size 24 [-Werror=stringop-overread]
  518 |                         strnlen(LPFC_NVME_INFO_MORE_STR, PAGE_SIZE - 1)
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this case, the code is entirely valid, as the string is properly
terminated, and the size argument is only there out of extra caution
in case it exceeds a page.

This cannot really happen here, so just simplify it to a sizeof().

Fixes: afff0d2321ea ("scsi: lpfc: Add Buffer overflow check, when nvme_info larger than PAGE_SIZE")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/scsi/lpfc/lpfc_attr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
index bdd9a29f4201..f6d886f9dfb3 100644
--- a/drivers/scsi/lpfc/lpfc_attr.c
+++ b/drivers/scsi/lpfc/lpfc_attr.c
@@ -512,11 +512,9 @@ lpfc_nvme_info_show(struct device *dev, struct device_attribute *attr,
 				"6314 Catching potential buffer "
 				"overflow > PAGE_SIZE = %lu bytes\n",
 				PAGE_SIZE);
-		strlcpy(buf + PAGE_SIZE - 1 -
-			strnlen(LPFC_NVME_INFO_MORE_STR, PAGE_SIZE - 1),
+		strlcpy(buf + PAGE_SIZE - 1 - sizeof(LPFC_NVME_INFO_MORE_STR),
 			LPFC_NVME_INFO_MORE_STR,
-			strnlen(LPFC_NVME_INFO_MORE_STR, PAGE_SIZE - 1)
-			+ 1);
+			sizeof(LPFC_NVME_INFO_MORE_STR) + 1);
 	}
 
 	return len;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
