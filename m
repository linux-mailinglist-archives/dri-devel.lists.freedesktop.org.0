Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833DBC2045A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 14:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942E410E972;
	Thu, 30 Oct 2025 13:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="UnYjXgRA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9B10E972
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 13:39:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUqaWgHxwnHz9PTGNcNOeJpVxH3n1w2p6JQKOQYP3/HQA8pmF+jktHpP7tCLQATXzU7wT7tIYXZgAQZcA0Dqho2+hy226ocncj1Ba1kHMjrFQunFL3tXa4Wopbg7UjR1hNoBJlzaidXi9Vpo0z97f0VgZ9HNN/JAh+umQDsnUnHMr5KLGZj9hPsCIS/UjWFAyKoQBWEnEWBaRjrWmsPzT7Csrmcf7rKd7wvCvcDQtV/m9vpx/p/m7R+NjGHceOJsfgWaPo1CkJwkjmg8LEs9Oclz7C+is7vWSpMSxVdTuzhjpZ8RTUjFFY3OS7d2phF+S+6nJyvvuGQNeDHUAvg7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7I23mlbCEWa6JxjZEYBLPvkSaPBmEz9swJiLToIAUsg=;
 b=eFCSuHlkUkaDRrj8VZp0Iu8qMxrhZTp2lGrmbd1Jbpqluw6VqoIX2AY88T1nTfnWtmTcUBrn53znICpFqUVFN9xHJGPWRjCkTcf+OmXXGhnvNfHAQpMXtRJ+CDIWODp6b2sUlIRWbtWcTT6NZat82LplN95CnVuJdkwaMVXVDZJu3ichfIj17R5ASbMWsrZMvhh6wfuEuv2Y0sw1UV7IOeYAV0kmPv5NGig8lc2pbDapnPe4jKl+O0dSDOkw+l5+/d7FVCGGqPdOwqunrdI4Vkw0Xn6KIuweY8bV9YVSw0WST33Zk5l4toEJ3PzYktPUGwfdTX8SrhJw62DE7GRuLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7I23mlbCEWa6JxjZEYBLPvkSaPBmEz9swJiLToIAUsg=;
 b=UnYjXgRAnW+fDlzJ/Aq7VkFAS9/uN+9TGrsV0R3Qme6twWNbNdJkAE5swkWvRIwdaN9R8VYIV5nJG6t5xzxK8R9CJ81/XaKFwHJ+pkS1AP/7faTLXtWu6LhTxbrwhaDy2oP3uBtr4dmjPXWNepmVQaKiuAYYUUndX7LaTkBi+Ng=
Received: from PH0PR07CA0034.namprd07.prod.outlook.com (2603:10b6:510:e::9) by
 PH0PR10MB5846.namprd10.prod.outlook.com (2603:10b6:510:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 13:39:01 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::53) by PH0PR07CA0034.outlook.office365.com
 (2603:10b6:510:e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 13:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 13:39:00 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 08:38:56 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 08:38:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Oct 2025 08:38:56 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59UDcpcM2241222;
 Thu, 30 Oct 2025 08:38:52 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <mwalle@kernel.org>, <afd@ti.com>, <conor+dt@kernel.org>,
 <frank.binns@imgtec.com>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
 <matt.coster@imgtec.com>, <nm@ti.com>, <robh@kernel.org>, <rs@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <detheridge@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p: Fix memory ranges for GPU
Date: Thu, 30 Oct 2025 19:07:18 +0530
Message-ID: <176183141857.2766610.13135514120305603944.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250919193341.707660-2-rs@ti.com>
References: <20250919193341.707660-2-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|PH0PR10MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0506d0-2263-4da7-f37e-08de17b9af4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|7416014|36860700013|34020700016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEJYNDlrOVFCSVIvalNMbTIxN1R5NGtFbytXZTQ0TDloSVJlYUh1NVZlMWFZ?=
 =?utf-8?B?ZnlEUC8rSy96UmR1aTNYTHU3RnUzUjZqSXRzZnNxRGpBZjFiVDVSdWR6bm1D?=
 =?utf-8?B?N2UxTHhJc2s5Zm9LQmsrQkVTTW5uTHRyeXVtWFVZelpGMGlyK1JsWE1HU2Er?=
 =?utf-8?B?eGlja0hnRnhjaWFsb3ErR21neGp5ZmYyRjY2NnN0cHl1dDR3NmE3Z01EcWVu?=
 =?utf-8?B?WmZmaE5ldzVZWmEwVXZGUXFIMVBpeHcvMUpBMDJSMjVHaHRFcGtzL09LM1JJ?=
 =?utf-8?B?NDUwcm9janRvbTcyYVF5U1U1cHdkMk82OGJ6N0RNalBhZzNiTkJNZjhSNUJo?=
 =?utf-8?B?bXBGM3NZSHpCUmtqaTVaUHozTHFzNkpVem5aaldDRzVOYkJZcGswNUNrZkFa?=
 =?utf-8?B?SnZvVW1rTzE2bzc4dWFMQnZvdTMzS3dMVlFmVmpWaVFTY2tLaE9rTkxUdm1Q?=
 =?utf-8?B?a2dnbXRrZjYxWWl2eDNwdWdDT1FiSytCYy95WnpNcVpNMUxzTDVmYmFldEdv?=
 =?utf-8?B?dFltSnV3WW5QWURzY1hMeEtuMFlwb0tGTjl4TmdJM2R6Ym54bEdnNmJ4NDlq?=
 =?utf-8?B?RUpTWTlYVy9PYzVyMDY0V0Y1aCtpa2NQZ1JzUnJYVXA3akVvS21iT2hFeU16?=
 =?utf-8?B?bXVpVmYxT05GdWdEUnJQMzZWMXk5RHdnZkdEMXNBTU13R2tHc3Vob2VKc0JO?=
 =?utf-8?B?NW8vd2U0K0FJdDd6dWwya3BUS3JSWVhCWW5BMWw0NHFDUjJBY0xQdGZtaG5N?=
 =?utf-8?B?cFFrZVJ3QXFSM0lXN3RrcW5keXBsSlpnSXJ0ZWgzSWZzWkllYTcwWjlPVnUz?=
 =?utf-8?B?UTl3MHE0UGt4RGY4SFlNU2RSQm1HZENVdWs3ejdCK3NhQmJ6TFFoeEl3WGtC?=
 =?utf-8?B?Ry9kbk8wS2M0MGdCYTdtTkg5MHVjeGNNQzU1UXhsRDlvZ0c0c24xTzRHSmdz?=
 =?utf-8?B?U1k0Q1k0SUlzTWt6UDF6RVJIRmh0SSt6cnFMa1NQWFVReG1iR0J2M1M2dTdz?=
 =?utf-8?B?Nlo2dUE2dlBpZkljTGJBR2U3ZVVuRnZTYVhFS3JxSml4bERXakd3am5DT2VO?=
 =?utf-8?B?MGtIWDJPeUZvWUtpZUc3N1hYUjFDNjVrcm5RcDNsaHVBbFpJWmt0RFFFRUgz?=
 =?utf-8?B?UlJxb3BIenZ2ZlJqSzlxSmprRTRBcUxsYTRFTDhSdTdjK01hQytmWXQ1aGEz?=
 =?utf-8?B?UmVSWHk4YVpmV2V1MjRQOSs3QlNPWUdTeTZIekErSjZoNzdlQ2YvV0dnQ25G?=
 =?utf-8?B?aFh6VENuVGZ4MTlqQ3F3Rk1MNURCd2JiQUJvVUV2SGc4ZGdVcWh2U1phZzJr?=
 =?utf-8?B?eS9nQmVvTHRSRmsrazJDYjQ0VnVMa2NzeUgyblhBd21wWjZZaVE2bWN2SVdT?=
 =?utf-8?B?NEZPL0luT2picWZmYzB0eHV3YzQ4K0lVSldpTnhxMTZJb1RQTTYyTnVjaHdK?=
 =?utf-8?B?ckc5YzlxZWdyd1p2ZnRIK0VUNzlsSVYwYXJKaUpRRmN2NHRUOHkvRXFidEpO?=
 =?utf-8?B?dzZpdjhQZnZHVGFnUFJrUFpBZjdlZklhbVlCQkVkbWtkMmFCbmxVT3ZwZE4r?=
 =?utf-8?B?MEpJR1NDY2ljbkdGQWhWemNrOWc4ekJWaWdoam01ekxFTE5ZcXNndUNqNFFn?=
 =?utf-8?B?T3VVR1lEenhJTHpZQ082aC90eUNVNjZONGtFKy9jZ0pXUEMvUlNOMWRybytn?=
 =?utf-8?B?Wk1RNG1TWXZlekhFNE95NE9INHBEN0RPNGw0cUVKeTRIMlUzRmhIZEg5U3M4?=
 =?utf-8?B?cUhURXV1M2tIUlk5MkhQZnNLRmVSOUlnRDRkU2ZrUTlxVnNqTjJaRmFBL2V2?=
 =?utf-8?B?ZmQvTGdIWlVpbjhqQVBGczg3WmZZZnFmaEx1cVBDVE1xSE83Q0Z2dlZzaFlN?=
 =?utf-8?B?TmdOSFBiNmt1Y1pCSjVFT1NzVVZpdnkrT3lVWVN3YjhRQXpDd1lWMU45dmxH?=
 =?utf-8?B?S0RkVW53a3NLU2FkUTEyQVRPSnpCelhYcWpRR1RsWFJtakJueFNGTXFOQkNt?=
 =?utf-8?B?L01QL3BpbWQvTmljV094UjlRdk1ORE80U3cvOSszRElVZG1HWnRQNHRrSzZL?=
 =?utf-8?Q?fR0TLs?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(34020700016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 13:39:00.9753 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0506d0-2263-4da7-f37e-08de17b9af4a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5846
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

Hi rs@ti.com,

On Fri, 19 Sep 2025 14:33:42 -0500, rs@ti.com wrote:
> Update the memory region listed in the k3-am62p.dtsi for the BXS-4-64
> GPU to match the Main Memory Map described in the TRM [1].
> 
> [1] https://www.ti.com/lit/ug/spruj83b/spruj83b.pdf
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62p: Fix memory ranges for GPU
      commit: 76546090b1726118cd6fb3db7159fc2a3fdda8a0

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh

