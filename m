Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B118CA99BB3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 00:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D738F10E3B7;
	Wed, 23 Apr 2025 22:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SZI62RTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5094B10E1C1;
 Wed, 23 Apr 2025 22:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRE2q4ahs1xEka6wODaZbmNglYUFhlwkVpW7ESHKOwQmd+oJpf3cxDDVW9m6k/UlvDJ3SfK3z9enBypRL9YEoI1xb6x+TSyb5TrrJ2r3tEPmR+jL3/L425pJIN4klrw0568IgTa4sE1aErJneS80fN3Hnup8JDJ8n5CZnhoRG+6orOsmgZ3zrCS5YKZzvz5HMz9D5btR8+hXZNDr45oADCTrJhdC4ujHWf+udkDYqstoBNKcgYMU45/1Pnjwj4Ls9FYqQmrO/zlCndK3/KgRxieQBzUe5tiiogGudI8KIAscxGGTrvcqSWHEXGppWI1FXTnZjOBlX0mONAkGHmRlyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vRMa8P5r9/YbZULTbjcZMH1z3+2BtPXRcnApYvD/LM=;
 b=qKsZSbQBimC4h4u/sw7VN5K+EP5ezdgjvftyKJNoCi/4wBi0S7eYlrXUGMTp8Epq+CBLp1rtHCSyXV49xDwRFQ0ID1eo8e/nx627ppM9jmD3V2wgXJBGKDebXu4v+aqsCnSU4ei3IPndTB60lMat7LkUbohCWzdPpxmssBovGrzSnZf6KCs0Y4l+3at9zz9I/BtT+d0FBNNCvf2xYsVWe6GWeGOn1ItMSosMqYe2xe2LqXPEKPZx/cDg0RYlDrKZ0LOcSOkEbJwsifu4aNhaw5HBXS0qtcmyabxYbIipInOjvipD+1kRlKo3VTrD34AZ5l9G4x5EbxZsLZ1rRtkI9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vRMa8P5r9/YbZULTbjcZMH1z3+2BtPXRcnApYvD/LM=;
 b=SZI62RTG49xP3yMVSNFGGAs9JiJuTdOJTcl1ITlxurwWUiGUwp3V5CbePKUlEIyVGP/UAb4T6j+xM2vNtrRXisSI2FgzjQyVHxqfPUmuN308e0lf4+lkCLCRcZhkmZhCBNOuIOdjaKKXT9mYla1XRRnwETDPr+BAKaYodp41YUFpJookCbaEnbGnAogKeYThBXm/hGLEiQKBZyWplmx9N3R2wLDrwVGjCNHcMWQ41I9Yg8HRyGLAjuqBOWawTou4DH8Su56bIgaeqJR51fpQwPJSxvm3MPUoxeh/T0qHZL+O4xUYULD4TVLKmKYWklbjnmRpVQMGkRFee14AV/Alsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 22:54:21 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 22:54:21 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH 2/6] nova-core: doc: Clarify sysmembar operations
Date: Wed, 23 Apr 2025 18:53:58 -0400
Message-ID: <20250423225405.139613-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423225405.139613-1-joelagnelf@nvidia.com>
References: <20250423225405.139613-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0321.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b298af1-ca03-4855-35dc-08dd82b9c944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NS8O2lPp3YWrvgDFrNutN2EIM12hY1tdxk7HndTZqFvumptcQpIl4OODNH2N?=
 =?us-ascii?Q?2tmZWdkwLdo9P1d3RHdvsqoGzwuYHZgainvV4dC33Zpu0V1JYGhrw2/hUPy4?=
 =?us-ascii?Q?yIpZVlxBFHN9ix7lJdfzh+XZyvM0AlCx1EUFispka+vhyHNB6RiaXEApvIDn?=
 =?us-ascii?Q?PRQscfPx8ODEYahbjUSA/964pFWsfFGhLiUXYdLFzDEbnN5dVbDzc5Agi1eh?=
 =?us-ascii?Q?MHrEXn+6pD8qNP+Yx2hQvMq2Tt9ua47K6ymFM2XDpUsk0Sh+bkVJlnXcqkXG?=
 =?us-ascii?Q?F0pgBeazY9xUX0O6uPc/N2PhU8SW9tQ5kVwisDWoOzKU4tJmFkv8OJPBcO9D?=
 =?us-ascii?Q?m8WBavBskd78VNp69PY9swlRlgjlYx/ZwFbEQ60ENhfqMdhhJ3IrI3fr8z8T?=
 =?us-ascii?Q?7IszatHkNHRGuhu+T1NsxT23fOPsQnpuAcDMRSS8eN6nyLQ838uGbr0V/ToH?=
 =?us-ascii?Q?03sP2w+POBMryxMQCLkX5L+HHCdpqHhF0qRKsJLgZL1IlDi/Y6AEnwyNGQbZ?=
 =?us-ascii?Q?9et4/CBREB3slu02r2C3evat1tT8AZKGyzu3jQAJYBF1Ua8Fr47nmqCyF5qK?=
 =?us-ascii?Q?FZFnTG/Oc/2bvPsYXyxgj4KZ99kJkCl0cgGw/tnuCIw3qjeYT/1rrNquo28O?=
 =?us-ascii?Q?Rp8sfvBeZdXKAiR3n/KaRSpriNsX8G5jNN+V60CPZr+vPbwk4bHuWJ7hT0q2?=
 =?us-ascii?Q?RJtKEdarmG9w9AfqNnoo1kxhAsrcgwmJf9L1CQG+xWmDchBuzavz+fp7OTvL?=
 =?us-ascii?Q?6iBHB/H+HkaKL+JXzb424vrL74m93WAlbqzCtZXuOzG+JkUSg3w2oiw/SdpC?=
 =?us-ascii?Q?XKKEFH5FQGzRWeCaDi5B8rkWpalIHlXfq/kncSZu5ASfn8BoJXRURvQncF1L?=
 =?us-ascii?Q?p3BJuHBb15WSetoCP8pqS6DuKvkjPsEKnou4HaCk9/5XGcv1cW4HSDUkznPX?=
 =?us-ascii?Q?7le6tddpNenY+gh4+uRCGjAtMuCpheTcGcwxYd6Khy8azw21Zw3QeOpeuUqb?=
 =?us-ascii?Q?0l7h0FMz2EB+yzaTgH6J8Ml3B8byiQcF1/UF2ldJyXhp7fXWHIutL3Cw4cWd?=
 =?us-ascii?Q?1kcB3prOPDloE+0NnUNZuYRFL3HQPywl3v65PIFCuHcAcHmnL5xs4S9FYX0v?=
 =?us-ascii?Q?75BRjWfIljANv/8GedIJL+dYGqA6AtPRpTKHJE2TXJhVM80OlaDfCZIVrWqR?=
 =?us-ascii?Q?OgPYqO420g/FR+gSFhpY+7rMFhMSFr6IQeJ3Hs9SMVQHwEfvo2IASmXSowds?=
 =?us-ascii?Q?O+AhB7Dt4HBKEs/PXeju+2V0nFUgnR9GyIORhTX3cd9yD0jeT2DeVV6l3/Q2?=
 =?us-ascii?Q?TWZhszHFFVkDgXuLeMlp9zbxYyQ9C2sNq36QCd1nDqyJZCaACjIHsXpJB98t?=
 =?us-ascii?Q?SLsm0XdSmZ2R1+9UrB7V6/YyZD9X016P2AgoQN3vdsbX6SgGug=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tBSdDQQibyEiAbArCQZ6kWOiLJSrYedIDdbv+W3ftSkSPTUFyJ+qe50c7F4e?=
 =?us-ascii?Q?OF8oLBFIC/IyZmy4heX6rOgSK+lrhvZWifR6Etr9z/7iScQGN3Psry+qVuAU?=
 =?us-ascii?Q?oL9Usqlg3zBoVvqUsHux/9Wt9wjxuTOkmJQNgJNHTjxm/oeC2L4ZD4nZeW2z?=
 =?us-ascii?Q?CzeUl1f8PIym4jENdXYx7FwQW6geEW6MhjrHlrYket+Tvp0jW3Vj3ZCVTu8v?=
 =?us-ascii?Q?gSWiN5zi8RHZQTKx779SE8RSvNIuSFYooTbhePurVh9lPMrvCmoiyytUJxWI?=
 =?us-ascii?Q?1HUDKdHnfTmK/uSLQv7TD8r5eGQ0znlvQDmcIp4yoBcKg7kk65KypzNBZ4H8?=
 =?us-ascii?Q?M/gjZMIPQuYjZbr0nbkXbzJXBe3kIEx9uSfOrIAc/MZeg614vhRcgDNvvwSi?=
 =?us-ascii?Q?sbr14ZSSwSprhJWSQfFB+0HQOGedfuqtySxYCV2BbymfGuRx1BJQj5cN+Vnv?=
 =?us-ascii?Q?wetocXFwXPs+T6Va6sPQgqRhEIyGNnCKStmYgTewmCcdUuFe5klFLqPNvMkf?=
 =?us-ascii?Q?J/o09DMdBXG37HLHHV/ta8iz4hBYrHMH3gzMMG0vYD7dzxXIhvYfjY5Mr9O8?=
 =?us-ascii?Q?TwkgNgZErWof8c50dwL0Gdh5Pfnus8WuscwSH+P0SsbLKKJq62+B0ak+eEXN?=
 =?us-ascii?Q?nx3wNxRWhPz/gFm+99CxsLjgB9EvRWU+geLkj0NhThKK2C3EkwMez0WIuJCC?=
 =?us-ascii?Q?rywLFdbGSDBnsQr9UGPO6Ply/xTPT8TJXtazJLqY8vw3StGG8NL2h/zvyfAH?=
 =?us-ascii?Q?H8aG3/0O/VfjFCeg9RQC5JzzDWCEclw+uqM+0/3DVZ8g8JteHBanTD5bj4lj?=
 =?us-ascii?Q?6t9k7Bg2jPadgM04/VIGv/H7HfjM+Av+vpSx4PX+Qa3lliz9NcvXHu7ooSNG?=
 =?us-ascii?Q?z5bbt9UD/1G1gEWKsFMTG/5ob+zdMSQdoA/0DM3RhlZO65/pXQGVK7cUZZlf?=
 =?us-ascii?Q?uGCqmXmc2QXU+TS5K1SWc/AgAfjJBUeVMGecfoCQOZKxjkDcoelwez5d+RZb?=
 =?us-ascii?Q?44Ye87E02J8me6xj5nj39v9C7tT1jXUyZRJak687PFzClcjafqNp8DHwfMPA?=
 =?us-ascii?Q?PoGZEyncWXnC+t5eKHIEQy12gr20betB3H4e+YVGzOJRH/Ge8x+Ro4SWJmEo?=
 =?us-ascii?Q?7+7U3elqFpi/1nSnyxv474g1BJDuHC2olM2Naz8zV2b/G0zrW3QfS+OtoJoY?=
 =?us-ascii?Q?fAkCTxqxKiW5JR03fbPtPID+HHXdOqtH0roLNhOZSxVTN2rDLWaVJK18DWu2?=
 =?us-ascii?Q?5FowfMLzjti7xQa+FQgrDzkWtWMAjliUJdxW9mxxIaXooHcnJwuxMVl/nsDI?=
 =?us-ascii?Q?N+yCJIY+Emaox2Ov7j4rmRZlS/qbg5Y2RaWNNg+LARn+4umpJEaIqzYZCpJH?=
 =?us-ascii?Q?FAqi+36gzJYNqDLrqS/cd53R4+VhFkCoZ8zN1DbjSOmtLH+0zoVg/0b0IeXv?=
 =?us-ascii?Q?1PXpsANss10lLwL21bd6c209skPEIhFn2f3rZKZGDAnIqjraYQX6sgKiOpaE?=
 =?us-ascii?Q?ow0x9WEnfk6Bv0mAlzW5hLNWgcZyFjJsReygFfl/n9vFFhvDZ4neTyOBe+9k?=
 =?us-ascii?Q?GX1jqW74+W6jVavaTez+3bkCYvpljS7woQGDToOv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b298af1-ca03-4855-35dc-08dd82b9c944
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 22:54:21.5638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FP6RdHq/RK14KQzJWD6hLv/LeEv24YC2a7s1uNYYhSNE5/TOpZeVbL0og++xJ2fVqifiRZvyjD2K3YHsGtOgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340
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

sysmembar is a critical operation that the GSP falcon needs to perform
in the reset sequence. Add some code comments to clarify.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 11 ++++++++++-
 drivers/gpu/nova-core/regs.rs |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 4d03a0b11b64..61031bccb7d3 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -158,6 +158,9 @@ pub(crate) struct Gpu {
     /// MMIO mapping of PCI BAR 0
     bar: Devres<Bar0>,
     fw: Firmware,
+    /// A system memory page for sysmembar (A GPU-initiated hardware memory-barrier
+    /// operation that flushes all pending GPU-side memory writes that were done
+    /// through PCIE, to system memory).
     sysmem_flush: DmaObject,
     timer: Timer,
     bios: Vbios,
@@ -204,7 +207,13 @@ pub(crate) fn new(
         devinit::wait_gfw_boot_completion(&bar)
             .inspect_err(|_| pr_err!("GFW boot did not complete"))?;
 
-        // System memory page required for sysmembar to properly flush into system memory.
+        // System memory page required for sysmembar which is a GPU-initiated hardware
+        // memory-barrier operation that flushes all pending GPU-side memory writes that
+        // were done through PCIE, to system memory. It is required for Falcon to be reset
+        // as the reset operation involves a reset handshake. When the falcon acks the
+        // reset, it writes its acknowledgement into system memory, but for this write to
+        // be visible to the host, the falcon needs to do sysmembar to flush
+        // its writes and prevent the driver from timing out.
         let sysmem_flush = {
             let page = DmaObject::new(
                 pdev.as_ref(),
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index f4a6a382e83f..22906ab1a43a 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -37,6 +37,8 @@
 
 /* PFB */
 
+/// These two registers together hold the physical system memory address
+/// that is used by the GPU for perform sysmembar operation (see gpu.rs).
 register!(PfbNisoFlushSysmemAddr@0x00100c10;
     31:0    adr_39_08 => as u32
 );
-- 
2.43.0

