Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCEE97B6E2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 04:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B20A10E514;
	Wed, 18 Sep 2024 02:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="JKydu68v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2066.outbound.protection.outlook.com [40.107.117.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AECE10E514
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 02:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYRbzls+yOOUG2ViIrZUg70ZUE9GFfueluHI9uwmh2V66NqmOuwk62Q3vR7PuHylAjtaBRHD2kW2W4byEVQWoJitiwqskQQTXheNd87SanyN6cQurZE4XAmUFXOBFw5l+fu6G1yJ0yhp2fuHRXX8B4fIyMS/40RE0uTF94rqkKnUcLbp+ZqFOzYG7csZayE8+fdiZsjqMrLBArAkEYi9vRgPVeKL+c2Xbrjiay4jHyDJIK4bLI/ELmckMr4u94OSTQKKbFGaDXc8nj7VSRtKNvOFZC0EBdDdFFZEH1IS0L7vXvMtjuqxFLEE/NPDKNxzkWA9zsz3zWnMp4t+oYcs5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93hIlXR6rTCFIQW+5KF6L9/Zv17kVZyN1YP+CsH762Y=;
 b=UQ8e0wYHxucCIsMRm9Goa9hgeMB+ZQXpe1q+cyK+35n8EeI+S5RTsELtbS4ELtF1SYkY7hTsMzvDSCUaDFqfUAYoOTvY06iI73H409L1w9ZXjQCaHeyRIHbfiFQ/+YAah0Em0IQVfGGMzc/Pv559xdl/rZvBR8c5agtaL40QeNcyDE2JhfJvMtm0vSlvkFGH5wnNoGLZ/8WLzebsZrHHydKg2Z0FwpeIqZRfWMUVXO8HbSIKHjFowi4+7aGIcyal0VzpY65zW4zUdX4zrTR2WV8t0t0+gtwP0kmnNjv0xipuGUq4YskRp5uu3cjq+F7fX189e0gwRo8RJeZRhhddoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93hIlXR6rTCFIQW+5KF6L9/Zv17kVZyN1YP+CsH762Y=;
 b=JKydu68vwRA+Mkz93I3+LG17SlBUWoi690Pl+qTcqhqGwGZU9s9gT1yTYbrjDXzhFnjbEIFNAFBw0EYJh1y6q/9bo18RvsAVa+amofK8ztoe3c2qimiBrHJAVoWIzdLeYmfgodHr3tKCpFINaukff/Qjcvixu80JP6tIk5pC85U9j9gMb4wUuWTyW5nPRLuQ8p7mlSXpwDh9Ba7T9IRsoIJ4d0OR1YKU0MxTLsUXFDTpghTCmwikre1TUCNg47Ou+Q1v1P8WFAeGHG4IcBVKC0OpYJmU6SCeCVuk3C8fnPgo3kH79uKeu6FTvwAkwKKpLteQiSFbNVMfNSK+N9e20g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com (2603:1096:101:bc::11)
 by KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 02:52:53 +0000
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852]) by SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 02:52:52 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v7 1/7] udmabuf: pre-fault when first page fault
Date: Wed, 18 Sep 2024 10:52:24 +0800
Message-ID: <20240918025238.2957823-2-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240918025238.2957823-1-link@vivo.com>
References: <20240918025238.2957823-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To SEYPR06MB5672.apcprd06.prod.outlook.com
 (2603:1096:101:bc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB5672:EE_|KL1PR06MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbf6e02-177c-406a-0513-08dcd78cfd44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pq8E/VnWpdN/DcD+4hGexP2XoLgjF6CWYYWxe2LSWAkLvzLydxl53zlBW+Kb?=
 =?us-ascii?Q?xQBV8BybCCfE2ctSs/58kg+zQgH5vPeTyc41dW0X29YCRNi7dst0Bi08rDsc?=
 =?us-ascii?Q?Jom1xwDLJEzQiko3N5hD3cGRr1d8asumPwBQFEQz8oiTxk7gwD0sh7EqM5p4?=
 =?us-ascii?Q?DfOo3YT4Wuje5YOaPu7P+ycD+lFrnRPJU7uPDvzb44ho2oWntPczSTZIX3n8?=
 =?us-ascii?Q?RsFeKV6XTwHbrBrWHEYLFmU3WG5Sd/dX2bJ7SQX+DyZEdEdaGy2wu2P73tbz?=
 =?us-ascii?Q?oNYFERFo/svFyNGsdS0lvoq2sKZkRUe5Hp4NKORmk00okrD5Pbly2Eeif+t2?=
 =?us-ascii?Q?qtjdUg/OLyHb+Yw59whh9biMQP1Er1oO9sdzMSwHcFH/q7nJOcJgO341f62c?=
 =?us-ascii?Q?yqNl7vZ6A6rHo1WwlB2FBptQv19ucsv9ZBWKPglDozAXpPRr5rObOf0XQbOB?=
 =?us-ascii?Q?l0MUAHa18ZSPUg+jXAMVEOBEIYbqlk78TNrLjUfNY/2+Y1xPRcjjR5rw3Fmf?=
 =?us-ascii?Q?60OqwoZdFmCi/9a7Em9HjdJO31senDxPV55HRc4cpdM02K0rdVraV7lRkwKi?=
 =?us-ascii?Q?ddnWNhkzmPoTTOgyuT3Q/SfsTs0ImgoCRbxQkFDJ2BadWLBswUOH/7hvS2MV?=
 =?us-ascii?Q?QA+q6WQDcV2LBpxvLucxlRs3ZdTAwQFEoubirRItBuAcojQ8aRUdl36/ju0G?=
 =?us-ascii?Q?nta1JwqbvnAI2FU/oyPnRzpb0F5shVRg4it7QP1GAlBlazskodmngW+c/MdM?=
 =?us-ascii?Q?fHvNgU1AQqFCLEQltxxHA2fCCpA+Ttph5eGwxB7WYwrSCMg97+uw2wsgPCtt?=
 =?us-ascii?Q?QHdbi2R3LFBT63hTiEfvLrd+ZIPJMXjak3pmBSBrrOD8sHFA3q0HAkwc12Qq?=
 =?us-ascii?Q?0HZPYLelWjlbfinoNONj/uBh534wznJv7lDSHR3LKiuah1yhC/ICwYnczm5H?=
 =?us-ascii?Q?A4EeTnQt/buIDETQfqMyHyXKcGs9uwa9d6sVYj/Y2h3wamFdrQdY3FnlQ/Jo?=
 =?us-ascii?Q?kdmzfGz8Rq9ETtfD9nKCktlpkJlHBgyb5xKencGNcVa3E2WqdP+KSF9RE2RV?=
 =?us-ascii?Q?kgHYRfBirjzroH45gnf6esKRnu55e/WEjJDvs8+tyZvkhcgnNeEWqOjVl5lQ?=
 =?us-ascii?Q?URuC1fGDLGdSuEJjfjM1rnUveSGFgr8nKDuw6/TnzL9NjCiTmShB3rVfXwK+?=
 =?us-ascii?Q?kSqaHvgxbuicl2DcUzA2YZVDhs3zQ3twd9H0boiFLuCbZAX+1E96o+CfftVR?=
 =?us-ascii?Q?/kr4QXCwd9zpzpxTplQJhy5ahXHFumTc6vTJEgAPSvlOhN1+0MvjoSl8mfO8?=
 =?us-ascii?Q?kPem4cGK7u/D8ESA1Ub+rMLIbCHGWZ/BFYMKBb7zeUW0rFJGnrzESqmsp37U?=
 =?us-ascii?Q?qkRbsGJGeUQM/u2omJgYFdTP8BQZWPnx1Hb67JSKN0MAojQjrEpRj8x7NL+h?=
 =?us-ascii?Q?0NmrW4mg84U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB5672.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XmldueXiy6GACmwEMo2M/9KHeHrVzMA+6ngOxi3BazRGuLtOGLjlkUKwlQr/?=
 =?us-ascii?Q?ItXhyrwWtIkWhEnSi7nsgihct9MaUTTinhN6I2MXKz+JvaMoNdorQQU2obMT?=
 =?us-ascii?Q?iqaFeQp/taT+tGwMOe0sXAC22gjsNg8eutgs+l9vPMHHTx2ur7/OrqlBw763?=
 =?us-ascii?Q?oyMfqRwGNiym/3lfGzuW7q60VbiWgU/aJbJgKbHDJt74ycVVjGq+rGUxrGXT?=
 =?us-ascii?Q?Og7b0ZsiENCbIBTV2rPU2DlcPbOntIJ0FKlqR6KuzhIBQ+6GTkB6muo8Uv4h?=
 =?us-ascii?Q?04Xi0oBSXVXXOkJpzOlj6daLdAtRht7zSgKElvs46kblGq4fmI5fY0t8nQzi?=
 =?us-ascii?Q?OiQttxZM/NFE++QSY/lOoqFNTNjcUlqR6a/KzjL8eYe8Ypq2U5s3Cm6LyJew?=
 =?us-ascii?Q?Ea9fJJKbdMEvaJNF/uYhQjm91/F/qFdxbhu65Ui/0AUsCoDF46UqaSz7tRWS?=
 =?us-ascii?Q?7rHaDxnHcrQFB+1PmDT2gznJ+s08EbJBKaC4M5hutVFZNIHkqLTjYwC1xsCB?=
 =?us-ascii?Q?jwAVCPYLGH22J5GvygH5ZNU5LAmwI4G4KP9UatGzHBYtV/SPoOUFEFsh7LXU?=
 =?us-ascii?Q?OlKR8tzLIS660e+wedPW7nsijnRWErT7o6eCGG8iV6OoAs6SxFT1tgT5ipTG?=
 =?us-ascii?Q?taMFIQXfMGLkC/4o9gQxCxMVnhTCcKfsUTjKIpslpsFIdJVDh1n+19G0bIMn?=
 =?us-ascii?Q?NMaYmoz7LkXe5Y5X4DZqS5LJrAca1N3rlbDifpJ/5HjJQIQpAZah3TyrC8Bi?=
 =?us-ascii?Q?RsOUwCOBDalUQLuEqC0UnLoUdUMDhoTwIWAzyvD6AoOAMdnk2W2Gmd5zOdW0?=
 =?us-ascii?Q?Z3cuvVsJLNw7p4eEpMOg3tb6x/1F+iECjxzS9xdzWY4qjGk21RfA8rJ++A3d?=
 =?us-ascii?Q?aUFU/Irt9x0qqotYyJRATEM7VFD9QDB7LGTNzAlLdlaXCzRAgP3PVR90+ZKi?=
 =?us-ascii?Q?2NkA4UzbrYuqI+LNU1dEmXksOxyDdoVnOufkWH7ab4PQK3xqwECI/JDCvQ8F?=
 =?us-ascii?Q?q5NzmwVVmEWEdf04miwWxALpqsnojpNErfNv0r+Tpt2tXUXFUTRrykuJj9K/?=
 =?us-ascii?Q?84Ev1FfF6ljm0LF2zPsHJtBM/w86MdTgbNchcni9vIUdeEjPADGKdPRYjtME?=
 =?us-ascii?Q?LmWzgmyQHeM3O+Z7hSsoHsnuPNTRvCezT4wsH11cv0vkbBtnCgayfkMz/way?=
 =?us-ascii?Q?AKLeidyqUspEfzRAJfzc40BK9Nzw+zI9dw7A4+Zsn+uf7uIOXjH4M9G4ULwc?=
 =?us-ascii?Q?3xRf5BVQ2xUa4cOXf3xl+8JUSuMNJGUQgXmDgPaVFROuWAjFIEOVmo4BxTgw?=
 =?us-ascii?Q?tldbQuVWkSBWwEwB1/xWVyDkmpNY7QJAedJrwQ2CboZNkbxefXXf0bHfZG6U?=
 =?us-ascii?Q?JUa/NK8WKkxotX4hwuMY+2laejbJ3YVuyzXYOKJoocfzmBDOUxyXidHkEezq?=
 =?us-ascii?Q?uTByzwGmfQH3O8vDtadXAvNB79O639Pc9opMQxirioylxV7/f8mYDJIh5Rl1?=
 =?us-ascii?Q?tzImDtyD93GOratT0FqmN/TDVkys+eRn+9zYkLYtol7qzV408m8Ox7rO6NJo?=
 =?us-ascii?Q?jsnP64lgfCOuNEFowAUijGVi8enmJXJxkJOHCdEv?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbf6e02-177c-406a-0513-08dcd78cfd44
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5672.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 02:52:52.8498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2We4XLip6P05NPhjUcmG4NMgv4O6v4NWDKqVIbkt1wosygGCwIEm9ylhJwOxAE/w3jJVhtnq1HfZMQ+gLSc8Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6236
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

