Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABF6944997
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A97B10E8FE;
	Thu,  1 Aug 2024 10:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="mwH4q6bb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2043.outbound.protection.outlook.com [40.107.255.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D200110E8F6
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:45:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyN1t2jbQ6VFB0sEYryH8lYXxHQQXI4lCy4cyzAGfFIgSZ9L36Qb5OvUtgAFqD1oBHdfQPxX6hSVNzUhHY0uBehcjR4bdqAExhJE8DMA69qRlkrPlpJGzDsoFKxHJyWFRK0QuBAnjPspUb4znyOT9t9YB9DsJdRqjLYAMZo+7aA0yV79zZlliNwLGr8r78d5sfc1CVoBuuj8tBhG5f6ReoTlGjw4vPsc3I2BOWhDL6WAsi6QNqnUqH+OYN6KOWj+Dn/ioFVzApXYJRNhFCsYEV9MZbx+/8K7+/SOj3PADzTlzjEkeHOUCrrxilAMZ4ZU4OaxEZb2N6VAY4lgy8ApFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF9wuMpHxu42jpsq2wh5cH97MY+xQEZ45ORDKVAmJkg=;
 b=NxxlGkDlWMhh+6xbd7XYvfF8zYLrkbLkFsiTpxYoonAP6AFyKWvDeVQftY9eRjGnDXIEoWkO40OYNN+/k6QYwVSe7mDGa3o+90mTYmVFqDE0gTilkyc+ZB17/htpN+pA3MilXrDvmFEVcYy6cSgImRhbE5DGHKZR6G6TpH7cpHo96RrxFwmK6qXwNinRSH1ozsel/+xSVDBM+vPR8Joz6zA9fsATCCMil1HMZfKlpXqWAMdIked/6jvg0+D0Q7J3bU4UXhiwU5xT3ioq65OGbdt9r77McxRU8EpwdYGbDwAr9TdWx1Fi56iN0pdPGdwFXd26oLuDiMgbtfBfOL/d1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF9wuMpHxu42jpsq2wh5cH97MY+xQEZ45ORDKVAmJkg=;
 b=mwH4q6bbwS/1ZCTtj2z4euo4HZgEob68P9FoJP4Q8rSt3uHFWtEl7YxoXIzbXLztCkyni6tVV3V3/Ou3DH3k/g3DE39Wx+MJ4axRjA2QveLXByW9WtYryeXanfvCa+RLQWiOG0ZzuQ3OUz5BkPZxan0SAhXr5nif3/Kir6NqYBaqWlYnr0E3j/fUgry9AisZ27g5tOfGGpbYQc6yrZDlykXlRL8GZPFgprPN9IhgfahohgvAQHFqziHvBkaePD88Eo+nyEmRi8OHXmNyy2KudgF9bpWfQ5DJvaeI9l3l6NW51l4Zmdp1Draszfkhfa0aY3qXAIfp0YVAMuHWu0PwlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB6304.apcprd06.prod.outlook.com (2603:1096:101:10d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 10:45:23 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 10:45:23 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH 0/5] udmbuf bug fix and some improvements
Date: Thu,  1 Aug 2024 18:45:04 +0800
Message-ID: <20240801104512.4056860-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0209.apcprd06.prod.outlook.com
 (2603:1096:4:68::17) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEZPR06MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: 66280d8d-756b-46c2-a4f6-08dcb2170b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hkY42Tx2NFZ3BTzFiWp+nwvGcMQVixvTrxiUVj3biUNKRyrL4Y9n5rcf+Hps?=
 =?us-ascii?Q?3DkttvbbuDiP0CjIr45fyERpaZJVQE3cgZcZSYXw+LCgTguF6H/JEW/OAvaf?=
 =?us-ascii?Q?avorUrkiOH9qkb2j9DQnQbOoE3uMBnCXCPWrxvHIUDau/Bu/4SvUZdhTD4Zi?=
 =?us-ascii?Q?BRhQZcvSgNAU90zXYzO3O9aomkx9b5LQlQ+DXP9FEJ4BDsH9GNMXjBTnTYJi?=
 =?us-ascii?Q?UdyCaqqoWnDXeQFtjHNBv63PBvMT3p/AoZfNeQZ/yR1q49TztV+n8eHtgnQd?=
 =?us-ascii?Q?ikhDBVwqpy6B1FC1Sr+GvmsAvowsG2/u3fLkix79JXQ6isogrYNV2FbTEV77?=
 =?us-ascii?Q?Xvpze30OPAZi4stnE7lub2SFN28nQFa2O0PIYIxSnWRx9TaD0eheRX+E9v2r?=
 =?us-ascii?Q?iYDs4eVjfR2/Vp/D/pU27u0N9WJtqN2dqq8TzmB7FSSidZfpV7rvMBGPImLA?=
 =?us-ascii?Q?MlgzjwUKKRaS0oJWCamEr62ES6pRWYEo/Wcmg0RhyE3jtXI5chV5MJaJIoQW?=
 =?us-ascii?Q?hOj+LLagEUxcdJfm0BXo090jmzfNc6iLD6P5ZUBrN1noSZBC8Uisv5DFQ94M?=
 =?us-ascii?Q?xZeTRkLvfQgX476iMaPXsyWfndV3tMCu7mhMoXZLfHqKTAfxCS6u9FNlJ2E1?=
 =?us-ascii?Q?bL5rOR/2y9Nl55PjtWMKxdSuy8tNHaoJADno9xDRVZZHsKE307ekBq3jr3l6?=
 =?us-ascii?Q?L9gmgV7aeRpQ5IYrWoRbupXeBQWE+rIaqFWI3HKKP2ib/v35G7WZUsVzpDny?=
 =?us-ascii?Q?FcBfK4WoQKY+c6v1mqSBWqMh3EHrSLaTFrzK1SPHAqhhqchiyAg5+C2dQ8x+?=
 =?us-ascii?Q?VzcTCwMMY4SQUkMDHGDnm4TTTkTJq+JSKKvy9Cu/dKWClexuMCHBEdIrFU+L?=
 =?us-ascii?Q?XvVK/zhvomd/AF3/voV6YSl6zciaSVVm15mFrjm9hafLR5ge2pF41QiEm0Tv?=
 =?us-ascii?Q?mdo6iQyH3V8Kzw1cMcHM01tr9XBYBpOKMHIChqLB8ENX97480WTPj3nwsYdB?=
 =?us-ascii?Q?GxQl53M5wDTR8Jn0D8qoaS+DiJMjpjHqeaC6Ks3BZY9O/sV1JQC11nfgeP/i?=
 =?us-ascii?Q?cTzZdVIuAK9ivkFpoUXx89YRbKEXoxAIGD3kwvTlkFkEuv3q4vjyKuCV7u2C?=
 =?us-ascii?Q?u/d7YFX3rfbns2Z5wxLB82hwMvpUB/SMCAR2SS9oFsjp2HHIXqMQHXDWa/7u?=
 =?us-ascii?Q?O5WG9E4O9dGH3xQ9G8/FcEPQuYujjhrRtfxlY/jgYTE8HU3uao13GwYDpaGL?=
 =?us-ascii?Q?xXvV4imYnlZo0dn7reQUo92Hfb0BnFSQembNEcKd73KHJ7OmOlUz3FsOmZB5?=
 =?us-ascii?Q?96yANlPE2BZDlSuQLyPqKOI1Ce/Fw4Ku1TL8W3fcIMKb7Y3JgRozUROX263c?=
 =?us-ascii?Q?ZADvZX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1pxwwKnHsTHGXEXm7VgXsgm3CdNtG4XdhkmCIqK7rtg6Gch0W0p+iWDhPIm2?=
 =?us-ascii?Q?sWs3f9K3ztBtVhuWS8uqY/KoqDKubDMelbqpB2Nc3ILHsrKITyBzOpDa2Lph?=
 =?us-ascii?Q?5Jh1xoFOMTJ4XAlJl6Ss2wdFHwCItt6psKyo7zaufs7QpNi8UPO2CPQWEq59?=
 =?us-ascii?Q?opex6f5dVLTQY3YXzW2k3c9K/zvEhj7wPHwUTGdC5ZalYRmDajcuuJv4zZx8?=
 =?us-ascii?Q?+lyGouFnIIh+buKEO2HmawsMxo7h0aMN/Tgt4K3ARu8JwA5u9FI2jVG6b9tE?=
 =?us-ascii?Q?R3Wg779oPUlQwx2jPnV0d96nu1VFhbRsqLDxm5YpIp/9lsGYx/Kq465ZviJL?=
 =?us-ascii?Q?qjpjE6MLy03gRxZ6ndPD/DvtX5eD31zwCkz9ujKcLBjVd7cojDFlSsie/OYQ?=
 =?us-ascii?Q?oBz222kAPf3TlWoLqTCDN91iW0bwL1qWwAJ+VnB6HRAdNiqROOL84S41nBBn?=
 =?us-ascii?Q?wiRjrQ1hZgukzlFNWykRnAddwDSWOD2dIAnnr3TzWZa1FfZa77J3LzrtBzad?=
 =?us-ascii?Q?h5eveycSG1JgMoCwBArT8cOz82HljkE4jY4pzO8KXYOHEGlrgyF6Ltl2yLdQ?=
 =?us-ascii?Q?OyW9dxGVweuy2yAGC4mMZze4oZlznoe5/XTX3QL6Fa6tTtVvH+1VnlqLaj1B?=
 =?us-ascii?Q?U4LNwoBZSIpBQJ+eAPpnOddKnYszJa/7hAMejaFA4yVQx0EiSuiVdfY7j+1X?=
 =?us-ascii?Q?OgvDlfVWcRvaU39R6/u2UWMrLVXXCL0eF8sYtGer1yrxhEHlTAwwFrsOwbXo?=
 =?us-ascii?Q?TbLSwx+OVvoqWPRU012ZHrPx2Bi/znDmPSe/KYyu3Pqy994w4WD/ickJRlzE?=
 =?us-ascii?Q?MxYrgnR6M48EOt2jvFdkf83uGpWaJ0Xp3MG85dbpvxMt//muE228IrvDG2d/?=
 =?us-ascii?Q?V22H21qvyvpXpvOovsMzz7Mfn+qZth1LQ7+2gdnx7vD0AWIXIBDYWFPuswoe?=
 =?us-ascii?Q?LIJb4RGLl/v5Vnkco7W9GJNXpkFMAfUN6Xv13KTC04tzTyqEJ8qWiELw1miE?=
 =?us-ascii?Q?kJ+gpVt5zt2i/TFH77c5K70/iwa3mFsv0Odx13OJws2vt/RTfxryRpOk/jv9?=
 =?us-ascii?Q?E+Bnz4K9r8OPOH5eJhYqCFxsjwpTiiTql//xEgPA6YdGExR03d5GzuC8f6rH?=
 =?us-ascii?Q?NkdtAMldnKST89D6F3HGVKnlI6lUaaE/ak5nxKuNeARfqSFLArJ515b5E9No?=
 =?us-ascii?Q?RPvbUscRMDVHOtTSgYZBmzRGGglzlij+ifjATFfaEm+jH/J4TQXWfLFUS845?=
 =?us-ascii?Q?mJZiqf+TTmSxh/SXD9cff2sS/jwsVsMqXgA6xpVpStn36+2RSoSjgHJfrvea?=
 =?us-ascii?Q?0/qY1SCRAoxLW0R1kF34rk7gJUqokAS2hT9O2NZlsrlHvuvaNnLZiibtL94h?=
 =?us-ascii?Q?g5SoDFWMpIHOEWAi9PNs3TpXzG2IeRAWTYAHIztY820BN897H4Ud//J3augO?=
 =?us-ascii?Q?PDQDool9oZUIYnyAOBH3DvfH0KqBzT8d/lIutUb0pGgGoT69oLG8DCe31VaM?=
 =?us-ascii?Q?xLTPpyzljLMqtAtLdaH7c4WKDcY9u6LgIbxPP+Aj+crYGIfcnaY3EiXSSswW?=
 =?us-ascii?Q?IW1Gs+LrhJk4LRcJIc9QhzNHvY6KUxFrD5RTWC4s?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66280d8d-756b-46c2-a4f6-08dcb2170b9e
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:45:23.0451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAkXnv5iGho3rRdkRxbwNQ2DPnJT/sSjwaG1CbIhNKlHvzkoUBM+g9OEkjn+cwJtlzSmSxIuR9HEZNVpz80Ztw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6304
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

This patchset attempts to fix some errors in udmabuf and remove the
upin_list structure.

Some of this fix just gather the patches which I upload before.

Patch1
===
Try to remove page fault mmap and direct map it.
Due to current udmabuf has already obtained and pinned the folio
upon completion of the creation.This means that the physical memory has
already been acquired, rather than being accessed dynamically. The
current page fault method only saves some page table memory.

As a result, the page fault mechanism has lost its purpose as a demanding
page. Due to the fact that page fault requires trapping into kernel mode
and filling in when accessing the corresponding virtual address in mmap,
this means that user mode access to virtual addresses needs to trap into
kernel mode.

Therefore, when creating a large size udmabuf, this represents a
considerable overhead.

Therefore, the current patch removes the page fault method of mmap and
instead fills it directly when mmap is triggered.

This is achieved by using the scatter-gather table to establish a
linear relationship for the page. Calling remap_pfn_range does not cause
the previously set VMA flags to become invalid.

Patch2
===
This is the same to patch:
https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
I just gather it to this patchset.

Patch3
===
The current implementation of udmabuf's vmap has issues.

It does not correctly set each page of the folio to the page structure,
so that when vmap is called, all pages are the head page of the folio.

This implementation is not the same as this patch:
https://lore.kernel.org/all/20240731090233.1343559-1-link@vivo.com/

This reuse sgt table to map all page into vmalloc area.

Patch4
===
Wrap the repeated calls to get_sg_table, add a helper function to do it.
Set to udmabuf->sg use cmpxchg, It should be able to prevent concurrent
access situations. (I see mmap do not use lock)

Patch5
===
Attempt to remove unpin_list and other related data structures.

In order to adapt to Folio, we established the unpin_list data structure
to unpin all folios and maintain the page mapping relationship.

However, this data structure requires 24 bytes for each page and has low
traversal performance for the list. And maintaining the offset structure
also consumes a portion of memory.

This patch attempts to remove these data structures and modify the
semantics of some existing data structures.

udmabuf:
  folios -> folios array, which only contain's the folio, org contains
duplicate.
  add item_offset -> base on create item count, record it's start offset
in every memfd.
  add item_size -> base on create item count, record it's size in every
memfd.
  add nr_folios -> folios array number

So, when building the sg table, it is necessary to iterate in this way:
  if size cross item->size, take care of it's start offset in folio.
  if got folio, set each page into sgl until reach into folio size.

This patch also remove single folios' create on each create item, use it
be the ubuf->folios arrays' pointer, slide to fill the corresponding
folio under the item into the array.

After the modification, the various data structures in udmabuf have the
following corresponding relationships:
  pagecount * PAGESIZE = sum(folios_size(folios[i])) i=0->nr_folios
  pagecount * PAGESIZE = sum(item_size[i]) i=0, item_count (do not
record)
  item_offset use to record each memfd offset if exist, else 0.

Huan Yang (5):
  udmabuf: cancel mmap page fault, direct map it
  udmabuf: change folios array from kmalloc to kvmalloc
  udmabuf: fix vmap_udmabuf error page set
  udmabuf: add get_sg_table helper function
  udmabuf: remove folio pin list

 drivers/dma-buf/udmabuf.c | 270 +++++++++++++++++++++-----------------
 1 file changed, 148 insertions(+), 122 deletions(-)


base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
-- 
2.45.2

