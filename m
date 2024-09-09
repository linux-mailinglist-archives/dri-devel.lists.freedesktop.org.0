Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F4A971332
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C323F10E347;
	Mon,  9 Sep 2024 09:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="fSpub4LG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2043.outbound.protection.outlook.com [40.107.255.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E92810E341
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:19:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VK+Sypy38ttK0ZDJ6rNgFj10cJdcw+TKFH9Eeq2Ifotev3eqbpd0sZjrgZ5DlolQ7V8fLdMAelnhG0F3ND87a/QxUwOBIpORXns149VGPo2uaY5R6zgwDQ8r9V+4VDCx6IgCnBgA5y0eDI5T1yzLTY1XgYhmGYIVr36GSArlRHoaJAporaGwgIEX6/6ZNraJ0NxLCOfJOhdXMN5btKdoGPmt7KBvA4K2WBvwBzy4GWZVi607fKP5KHEFrchWzawtaQ2SUp5WHvcya957V3BwDf5DZh56q0gHEQOhim0A3BqSvBSLiJ4o2lKyAYJgZW9fkKbvcRVm9gDwcu+KxiO9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93hIlXR6rTCFIQW+5KF6L9/Zv17kVZyN1YP+CsH762Y=;
 b=IBJq46i+MDJIrHpwc8Xbk+MqNZThsVd6uFadfEfiiHTw2K32sdOA+fYu/VoSdxZWemRrsO78erN82WKy5+a8DmgYWigjKFWVolCQrb5psdqbEt1w1frldnAazxXvJ8AOXkzKas20yd9fxw0h7cVbEkc0IOKpbzW4nTLsxdzHTDBuLDJhIoCnBDh3gNYbkKO61/yU29gSskLWZdPLDtjSzsmMXACCT055jfQxXvr7EwuUJa4P9Fh4x0YtUNCYDUGQqUPcuLeDlN/4pdfL8q67Mr8wHIZrRizDebNcQse05ICLol9UibWsHpBYK2SxC90NmKWsTS4uV8hrrnBWLxDkOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93hIlXR6rTCFIQW+5KF6L9/Zv17kVZyN1YP+CsH762Y=;
 b=fSpub4LGlr02q2ajoJGRIOQOcZ4PN18Ph2nmDzUv8xbLsAUl09kjLmNUhcWUIFQykTiQQuU436Dj67t7UNXdfR2PcxtNCo8I59zgUgO8g3cHKKt+9z05OlVDIjSNXDd2Lmbf25Zk3ziLBOx6zIk9ErLXVkH78jULcMecoeNftyA9xeQCmLYMjjbaYSsbVKRo73wa9vY8cPhOK3H1JBVgesuNzIPHJhbfIyrUnF+9bOfxjaGIxL+xYoTM7bbN2AKE1xjYp6R0k/F8pKJUolHM5c2NT0fasamHdP1DkeYPLscoAQ8Nxu5LcqU9xlXIca9xKhRnLodEtHAV6sJdSX+CNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by JH0PR06MB7180.apcprd06.prod.outlook.com (2603:1096:990:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 09:19:08 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 09:19:08 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v6 1/7] udmabuf: pre-fault when first page fault
Date: Mon,  9 Sep 2024 17:18:39 +0800
Message-ID: <20240909091851.1165742-2-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240909091851.1165742-1-link@vivo.com>
References: <20240909091851.1165742-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|JH0PR06MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 547b8ed0-d8bd-4b8d-bcae-08dcd0b07595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xWtUO1kFD8OfMwP+Y4e4HIWKT6VjrQCt6X2gkAp69MaGV4pFiwwgGu1Sl85L?=
 =?us-ascii?Q?Vrew9+U8RqvWyKfC6Ho5BsUlX+D7fm6wB1z8rFkqpXXcthPaCoSIzlcwDsoV?=
 =?us-ascii?Q?JCv3kdbYIgntjKfxVu0L201WIBWw9B9j91A2YAOwrz8yEba+khp5UHKn4D0c?=
 =?us-ascii?Q?B/hFXTAOve9W8zO9cX3HvUZK3QHGOjHprKXO/7oGHpN8nOSPYCkdEFxNnOHC?=
 =?us-ascii?Q?1f6yr79KCWOGXlaYRNuQEDCUho8GOtzaL4pw2QLGpWoHj9PAVi+yhqNMi3if?=
 =?us-ascii?Q?kUpQLEAMFWhdD0cdel9g7+UMlb7nHyz44BEWdyg6GUnYZYP2H9MGMg+lIRT7?=
 =?us-ascii?Q?B16whC4KRVLbSdLRd9YjWnoatnXmfYmJVoJMVJwQw/x9KCaiMeOJWiaW2T13?=
 =?us-ascii?Q?1As9gt5i+wWCecOwOubb5SBwh5MtNY3oCBNf3WO/gqr+TDxcfs1dRXcjmeW/?=
 =?us-ascii?Q?8Q89AiElNUGtlop6uLXEhYCOJbA0BHm0lrD9tytGZXDpWoDzNB9JjpegNjap?=
 =?us-ascii?Q?loILv6mT5se4poTzxrwMDmL1a5e81mFTa/m46piYp/pJ9fBr6tVhcU8tMeFi?=
 =?us-ascii?Q?hpOZPewSIQ9UehvCWCo1DkRoeN3qGyuZ++J1S0LW4Cs3TB6a5KCZUgVMGdK2?=
 =?us-ascii?Q?L7qtiWqxr43/0tdlIq5Isyt4tJCh8dw4w80GOQkiaSIVZUwe8T17k44vkJan?=
 =?us-ascii?Q?qc2zL9Mlt5DJ1dYMv62YOY7AJXM+1AWQHHJXZxeA4r57O8zUPfYMZ2PupdNq?=
 =?us-ascii?Q?UDf+SOL8euJfzwD2XLupZRyNmcAPYfznRjtji0pT+LxbaWdJiIdF/LAdl1eQ?=
 =?us-ascii?Q?8YJIOA+ScGhb9kQfot/JrmrDK8Uuid8juubQuPHNu9C158HRtepYHc4Ya01v?=
 =?us-ascii?Q?zcKxvNoBCBqrIJ7XkRgO0LIKf52A0txtfAkiMAfONCzjbdQXwvrCD//wu0Sw?=
 =?us-ascii?Q?HXRU8SZbPv2ZMoaiGm1rZpzqGYuQfNMAxNljZXXdhg6dqV+A0ji6ZNRszRtl?=
 =?us-ascii?Q?flt8n+kPl3BEZrU1BwwdWyO7qvkfITjPVB6UbuW2raZ85rwFu/fl4KA91iBl?=
 =?us-ascii?Q?xixlteJGIviqCc+at2sGzXJ1HjYBnBwJ5FTMZicpXkiHboxo7AqHUfPOAhjD?=
 =?us-ascii?Q?neufTmdxMJWD1mKe5xlkSEr2EGsbccdBW99cpYAcaF0A7Kap45CAPR5ZNwDO?=
 =?us-ascii?Q?o1itay1CJSiyp3sc2sHgFY7qM22AcAeON1pDp4Xx1RDCV+10azMkOIeFbaZL?=
 =?us-ascii?Q?ZIwgyn4mGfpiKoYrDAOKVhutcJFk5q/6KB+jPxlTsZbuq/aur+I+XJpPGqLC?=
 =?us-ascii?Q?vRWMplRTNwEPn7IEcbEO5zaU11kCjrHJELPTEx7oE2RROawa01E5DoKb8zYG?=
 =?us-ascii?Q?O5D3OP4Fj4ym99gedWgHkoWIqjnvlBWtaNWBlxK1+QV9/t8xrw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fpI95VbIck56EVrOyABw7n5ijNyOBQ+aBg6AsRrb0hcQ3qQr73G4Biw5YHHn?=
 =?us-ascii?Q?RPtbhG/pNT/CPClHOz2kazusjVLFm1OLqWck8M4O/qSeRF+gHlAFWT7GRE5y?=
 =?us-ascii?Q?U3IrFovVl7YLFWZwjiwvKtCHtZjN79w0/6QiNAwNzt2tHfDWAhugntuoqhh1?=
 =?us-ascii?Q?fqaH0a9PvE00zzaMNyzcbia4G1JiAYq+tnTFU7Ll/9fxqxq++ENeP8gNZKZh?=
 =?us-ascii?Q?rcL00gESDRSoPwRFutuKICQEVcjWH85D0o4Pce5zCloLav7VcWj0v6eBVhOi?=
 =?us-ascii?Q?P1kfgOb4VfcGwxSNWVrD+t0UvDptNvkYVYBrYRfAJgXEY7LTRoNcv+KAr+i1?=
 =?us-ascii?Q?weLnvXyv3PLwiNXfJC2IVRF65loJlYD616NYhlBLO2DWgeyYItqlCPQTH5dr?=
 =?us-ascii?Q?hfyr8VcrHd5h5wH5VRpzvHI/pGbSQlCTjM8xrXe0Y/rDHXrLjVusyX1udswg?=
 =?us-ascii?Q?DbpfOhNWKzkIK1p2JoyqWVioxNLiB9mdnCLN4BjQYDeyBUOE5BWar0FvtXHI?=
 =?us-ascii?Q?Z3RUSgOs4ke+S/Rgps6zRe2OeNIsoe3hI5SUNRFh0xWzuHqlKXtgiwZQZo+Q?=
 =?us-ascii?Q?Rc6glqM6D+FjIbHu4oQtetaoC9wGfInhGS2vqustM07dgZj7JuJ8qaFCy8uK?=
 =?us-ascii?Q?Jv6E/LgyCbtDgVuwkhVlAQV+tUzOCb/kRLKAnRcrKVMed79dOE+k8B1Cb99f?=
 =?us-ascii?Q?u5yZVYaoAGcRF3VnzVsq119q6FwdR0KrHStUjZkvM9xrLEojLkbcmGQOtRbR?=
 =?us-ascii?Q?AVOjzE65cEANAQItwNCIPah/LUXt5Takqg6i8XJTsEeBRj/oBPWbxGRpQFo/?=
 =?us-ascii?Q?iR87mI4tkZVQX16Tl+3J2ljfYHhpxw6WRsZAJL66+spnA+OWxKHEShh+TTKN?=
 =?us-ascii?Q?9z4eYtFelT9BHaiwolGadPtPevAw3QFM/uSt0Qp6iTAZ8/l1XRGbDlGcYO3D?=
 =?us-ascii?Q?L0vpFNs64/nicNRQPBoIY3nF2bI0dnDd6p0Ay0VT2nRsVhNvGzwIcZjwW0YY?=
 =?us-ascii?Q?LE9l0l2mFB4Trs1cXvIu+xKuWiLcT/wZaIJSiSU9aXpsWKYPbpAwsjHvnuvF?=
 =?us-ascii?Q?lAYTsir2Sad7HEnu/zE4m3UMIBxLwbsVfW3aTK1EMb22jgRMNhI9n0abwE/C?=
 =?us-ascii?Q?axgaRiAF0G3VaVXgInt9kLMQg+sCCSNLe+0CNFvDHRQEB1vaDVgJrTZRZj/m?=
 =?us-ascii?Q?t4JPqWZSto76Gmq9ArpEzftIW4Lvqq2f+8fbesCTKiPRX50Gjr1+V5qTAVml?=
 =?us-ascii?Q?H+6vZDHsP6yVZsOuUgWwy7t2tqN8E35lRRCOeWPwTODgsaO2X0kiWKjW1roq?=
 =?us-ascii?Q?7iPjnzV7NvDbfvmz4JjsO2u0qwc5szfNamDrOeH5916iumW40Eq48q1+k+pQ?=
 =?us-ascii?Q?64WHQrlNXUmtpJdvUIk6jy/rrNWQ62dY982y5aesTW382YaijXpkxoMiD8LN?=
 =?us-ascii?Q?fDaZ5fbRMnZlMtlNyRG9C6/JGNyIWswr/QnjfRz6cdUa+jZ4ZwWE3VU+fcJa?=
 =?us-ascii?Q?D46agK6e3CfPHR6+o9d3QxKqSOktpyAjteVJOvAKZ5KCw8fcE6wybNyJqAeW?=
 =?us-ascii?Q?ikiA3XCqp4EGABBuQEvdOtJOR/gJ+WoDBQE5DHzS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547b8ed0-d8bd-4b8d-bcae-08dcd0b07595
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 09:19:08.6705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DwNIy56TfWgpzjZsGXBrx6oKRF2yIxXPX+heaJy2srxFJF0R7J/hYghXJ+g4OgdVCdpn87rCzbwCcpodibVqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7180
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

The current udmabuf mmap only fills the physical memory to the
corresponding virtual address when the user actually accesses the
virtual address.

However, the current udmabuf has already obtained and pinned the folio
upon completion of the creation.This means that the physical memory has
already been acquired, rather than being accessed dynamically.

As a result, the page fault has lost its purpose as a demanding
page. Due to the fact that page fault requires trapping into kernel mode
and filling in when accessing the corresponding virtual address in mmap,
when creating a large size udmabuf, this represents a considerable
overhead.

This patch fill the pfn into page table, and then pre-fault each pfn
into vma, when first access.

Notice, if anything wrong , we do not return an error during this
pre-fault step. However, an error will be returned if the failure occurs
when the addr is truly accessed

Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2ceff..2170d975cc76 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -43,7 +43,8 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct udmabuf *ubuf = vma->vm_private_data;
 	pgoff_t pgoff = vmf->pgoff;
-	unsigned long pfn;
+	unsigned long addr, pfn;
+	vm_fault_t ret;
 
 	if (pgoff >= ubuf->pagecount)
 		return VM_FAULT_SIGBUS;
@@ -51,7 +52,35 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 	pfn = folio_pfn(ubuf->folios[pgoff]);
 	pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
 
-	return vmf_insert_pfn(vma, vmf->address, pfn);
+	ret = vmf_insert_pfn(vma, vmf->address, pfn);
+	if (ret & VM_FAULT_ERROR)
+		return ret;
+
+	/* pre fault */
+	pgoff = vma->vm_pgoff;
+	addr = vma->vm_start;
+
+	for (; addr < vma->vm_end; pgoff++, addr += PAGE_SIZE) {
+		if (addr == vmf->address)
+			continue;
+
+		if (WARN_ON(pgoff >= ubuf->pagecount))
+			break;
+
+		pfn = folio_pfn(ubuf->folios[pgoff]);
+		pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
+
+		/**
+		 * If the below vmf_insert_pfn() fails, we do not return an
+		 * error here during this pre-fault step. However, an error
+		 * will be returned if the failure occurs when the addr is
+		 * truly accessed.
+		 */
+		if (vmf_insert_pfn(vma, addr, pfn) & VM_FAULT_ERROR)
+			break;
+	}
+
+	return ret;
 }
 
 static const struct vm_operations_struct udmabuf_vm_ops = {
-- 
2.45.2

