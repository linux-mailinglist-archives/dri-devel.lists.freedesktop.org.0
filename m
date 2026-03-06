Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC7eL8JdqmkhQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7020221B8D6
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AAD10E380;
	Fri,  6 Mar 2026 04:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jRVGV62Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61FA10E365;
 Fri,  6 Mar 2026 04:53:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sif/h+dIWC45i2bqEa0XHu2s56+IMlStfXGgEETV73SsJlM5N/k3CpPe7hrSdzNiN54SZJt2zXqq3T2opvrXN2wsWONzyvdNTdlWVc7qDlYXSCHAqVVbr5dN/UIc05IxkXCsFDp35Qz7m6KmsZdzy2cEmr5ylUHz7ulwj8Ou5H5QOe496yBmg1AZ08zk0GCv5LLBMADhoerQl+UTFwiINXahlYxfAy/fzYKtsLrBwK9+Y/NRUKUXz+zlLNgAUjFPtS7Dn2OIAn2K9wZ9O3/UkBld9o75JvqG3MPk5WKwwa2awCSKtOxPSiQDdd1ZSeJd6BrqjxDRnVSpDhm3RVV0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+UmXhahXe+4L1gUxhExlEbqWMc6dC/3NxXDLSiAhx8=;
 b=T1JPk0crNGs8pbqJFL3SG9bz4urCMfT22jtzl+murz61DDw5S4SZpAdxvixt4Rg19xmsTZkRkHyWD5F8+mCkOWedVDYnPs5zEHHIjP4AzaRJaT5TKRg5yoSY8IKtcZpVqziC2gvBeQa6eoLxNwUgeF18V9EilqQmsOBDNLhK6/lGX9tQF9MpkJr0FW/DNc9xgu7MiDC6e8nYOMbjgaHzpwx0PnXzuyjjY/F1F9+HTkexDo3ziP6ZSX943baw9M9V5c82RPNGXzlPJUPtxH4dBZA4F/VZPr8UcqsipKX9uDNTdtOkvRAzUKkk1dUb5NLUgiYhn8ldLSXfrjsa3iFklg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+UmXhahXe+4L1gUxhExlEbqWMc6dC/3NxXDLSiAhx8=;
 b=jRVGV62Yw2HUzvCptEjcxboZcLmK682tpo53wQHkAEgXIvNnw0VQHQyYn+3OZ9bjhJM/ku0cskXDOqey6GVkPCm700gIYf5KlB/sC5FtArsbJqFRgFRI89HuohHz/hG11Tpc075jI1/gBc+W+ki1s57MsCqOjP9+eUculvBsHki1Uz0GkZkEHm2xX5259ZTU3yAu5e8UuSdlTC1nbD+ac4aAGI34Udq6+VmoMgE+KI+x8ETGDSoWLe5obfN3q4voLmjQprEhL8aL63gO2FX55gEQAF4VyxjfS0tB/A+4t+EPgiEqRffK3GOROTiygojj2uu1HGwwPybr1xGI38k/+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 04:53:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:53:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:44 +0900
Subject: [PATCH v11 07/12] gpu: nova-core: falcon: remove unwarranted
 safety check in dma_load
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-7-8f0042c5d026@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::16) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: ff827ec4-861c-495f-71f3-08de7b3c468b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: oh7d3bX0pLXNTHGNXtx7N1sH84dL543IPtozqxKxkAxvQGcqqYHRjsjd9pSyPvi9QeDobKPaX1DeDJGfR9W+U5nolNDEga44SuoZdZydJsJjc8LpOZKDwlrH6yuABIwI/0JJOMJietWt7UVXLWoEdIov5YkMrkQqMQv3uVrViV5kX0Ex2i0FNpKAgjQgXKVJ+MeFG+kEh7UBYI6JrDb2n7zAEK5jRe/BlEx9zcXx9UFFMWc1jsCDxvH2tPBpEfNElMnEevsMHTeQYTDgNIgLjqzM2679eYM8jwUPNwQspqrIrxOHyV4seEdPMOzvkUa03a7/nuCyq4rTu9je6WdGvD40lgjd1ILPXy+dl/7ImIWtxTiCxSs91Lq1r1CHpcD9CZNSlAYJTQ6fnOth/3Zo212YmZtc0pFdFDeAv7rH3hzpfynBRKEGr79Rg+2q4iLRLXvROsySMTdTr0KIg5ev73zSGkm0CYbpCI0n4T8BMg0OowkmAXGoE5lFDaQ0NOFkZmactB1Lsq535LAopeO1xa6XPrBUgqEZbtCgvOPP3/gSWXAXTS8yilQ1upRKYWHEqnkSZ6rFSH9T74niNP0BzIgj7/hPXmNpE6DNRu3EGQRKEltswxH4AJ1dmNmhtDOhhkGuzCWz6Byn3KZAsF6Yq6K20T/KkxshVRxSp4uMlmx3Ag/+LWvycutCX0p99KM5GXqDRiFMhdl2O8DqqsCPXLO80B2SvHZK8wsf36T+/GI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTZPakNGSmpvVXpmbFI5ZzFkV1M1NHE0dHhZL25nNnNtVEpjUzRTTlZSN1E4?=
 =?utf-8?B?OGY0K0x3bU5aQjF5SzJqY3hTNHZzUHdPLzhoejJtYisyMGxjZGVlWHVuTFVV?=
 =?utf-8?B?MGM4dVNMc0dUczNJQXF3Y0pkNU9QTVBxQStGWmV6d3pQZzdRRGRkMzBBYkR5?=
 =?utf-8?B?WUJyZGhaYzBPVm9OckpuQzNrZHA3dkR2SG9hR1d4c1gwQnFrY292c3ZXUXZV?=
 =?utf-8?B?SkhEVmcxcmFDU0s4MHZJNjlQU0tLdkVGaFBRWURIMlA3Z1NLdGVEVmF5VDBG?=
 =?utf-8?B?bUFsYUJtMmJ1Zk5uMVJOUFE5V2hWSStoL3ZpTGw5SG9JbEFndkFlb3FnSXZC?=
 =?utf-8?B?SmVhTzZGejV5MUNGaWxXd01XNXFrTVBZeVplRmg3RXRhQXV3eit1OWJUTnBz?=
 =?utf-8?B?eTRjcmI0NzFGQTVCUzhwTmZLTE91ZkhWa1Z2RUFRQWhaLzF4N0tleHF4dGtu?=
 =?utf-8?B?K1FwYi8yVmNuNThybEx2T003cnRvU0RDa3grS29sSEh3K09jbjJTMm9lQ25Q?=
 =?utf-8?B?S2tOWmtaRFczQjVzUlRwU01uMFVwUE1Sc0ppZUsydFd4L1M1VEFJY3JxdDAv?=
 =?utf-8?B?ejIxcW5MOWtkc3MvSkl4SFlHcnJXdFoybWNCelVwMmZQYStxZnNKVUJPNVc3?=
 =?utf-8?B?UXR5ZFJhNTI2NXlWUnBlMVZtQ2p1aEVtYldCZURPV2dSSzljN0FoU09FTzlN?=
 =?utf-8?B?Qm9ZcXZEcXY3OXpDTWE4MkpVVWxvT2YrQ0ZnT3ptZ2xXaE1nMU00WVQvSjU5?=
 =?utf-8?B?R2NGZC85bERDVUYyeFY0Qy9QRkQ4c0N2N1l3ZWxkY05mQ3p1Ynp4TjVmbzND?=
 =?utf-8?B?ZU81MVpSZUdiWFZKbHlqRVVMV1ZRQjZybS9lUXNwTnkwemF0Y0lJZGdQRW9i?=
 =?utf-8?B?YW13WkRpTEIvN3FOb01iTlZESlgyWEZ0aFc5cXpKVUxzSWVLSWlMU3FDemEw?=
 =?utf-8?B?bDdkSVg3K0RKMm5WSjBuVTY2eVRzOE03K25HemRhY29mZFFyRmd5UjJaNUR1?=
 =?utf-8?B?bk53dlplOHhKTXJQKzBWaVl4OEZKaGNldk04aUFaZWNNSUZObGFnS21qenFn?=
 =?utf-8?B?NStvMzcwNCtnMjROU2cyaTJJZ2lqVjlWZE5xeUMrL1h2dlV1ZnA0bFBOSWph?=
 =?utf-8?B?RGpLV3RPUXRRUXV0QUV5NTR3TkU5eG5kdzY1bi9vRG11d0RYU2tBa0pYT3NH?=
 =?utf-8?B?SU9hSW4xR2wrS1BQcThjc3lZVjhNM1oxWHpWZFpMaUpJNy9DRnlkb0gwZGMx?=
 =?utf-8?B?SElsTEdIVzJhL0xnZjlOa0l0aVBEd3A5elZwRTFyWTlDZWY2N0tSRkFKVGc5?=
 =?utf-8?B?dEFkZHVDSjJySUdxTFpQdkk2Tmg2V0dsSWJtREJuUmtpMlhIeVRmOUlVOG5k?=
 =?utf-8?B?b0hSazROc0VjUnZxNVFrQ0UzNWY4Z0RsSEUwT082QWRsWDlUakRaaW50V00z?=
 =?utf-8?B?OUcwSjgyTFdIMGRoSm5iOGYrNWZXQWRiWlBSRzBLMXd6Q0g0TWQwWGVOTWNN?=
 =?utf-8?B?UHNHZFVWM0U1VWRoYnJMV3BJQ0pUYjZoTWg0WVNkSER6Zk9KeUFXNWRzQjFK?=
 =?utf-8?B?NlBZNElwSE96Qi9IQ2s4cndPSXJJQXp3S3czZDhBdWUxNUwvR0o3emlhTGQy?=
 =?utf-8?B?SnFtVnQ1K1dlR09scXg0NTRLbTNpWWJ4U3NTck9TdEhPc3pJZ01Ka2IwUGhY?=
 =?utf-8?B?TGRiMWJJNXhINEVEd2pEd3BRRXhpbUpMamdFeDE1MjhTMEovWWROc0FIbTJj?=
 =?utf-8?B?V0h3TXp6VVFDWE11K3g0YUFlY2hXNUNqOUlZM2Y2em1BR3dIcEdXUWgwVzZD?=
 =?utf-8?B?ZGNvUFRCNGhqaUhCRU9aRUFQNHhIaXFpMzM2ZWY0ZE8rVCtBV0RFbVIwUG9p?=
 =?utf-8?B?V05keGpIVXVHN1h1b0xDYXhyWTRKbk5CUjlOaWZ4S1lybi80TExsMTRVUjFY?=
 =?utf-8?B?SWhiRDdNeXAxQzhDYjJVRXNsbFNxU2lPc3RiUzVsT0VRL29vTHdUUjJCNE4z?=
 =?utf-8?B?ME90T2tISitqUWpGb3AwUU9tUUVkMythSElhWUF2ZTNLejFwNGo3eTVEcFFi?=
 =?utf-8?B?cGdBR0tyaHFJa2ZEd0ExZHdLblN1NjVrR1RYa3hYdCtvNEV6MGltb0ZhUjZB?=
 =?utf-8?B?cXRYN0R3UFJZelRlbXBETEIxbzRXTjhTUkNsV3JlV2NoOWZZYm5BemdIanRh?=
 =?utf-8?B?SWRXR1FxZVhPTnJOVUZNMXBPZmJMaGNHME1sUEZxUVhoVXpUUmI1Qzh4a1dI?=
 =?utf-8?B?WUUxeTQ3NjBMZ0NiWXVoRWRMa2xRZVRnMmZ4NGV6N0phM2RINDAzNDUxZllN?=
 =?utf-8?B?ajJiQlh0V1JaTTBlMldDK2ZkUnBoN2FEMzcwVXo1UEQxNDFlanZ2TWZUTHZG?=
 =?utf-8?Q?VxCqIqOd6TxPE6CuIrVKY6cYzuN6jT601KsnQ1RalLaHc?=
X-MS-Exchange-AntiSpam-MessageData-1: zCXKUIXG7DIXtQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff827ec4-861c-495f-71f3-08de7b3c468b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:53:14.7948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aSEuZvydE7kAY3aKknJREXq0hSTGuUAQJm5X44D6cySNnkbyJH92E2Rr76WMqIH9eXlKsQ7iTJdwGHjs2f5ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
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
X-Rspamd-Queue-Id: 7020221B8D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

This safety check was an assumption based on the firmwares we work with
- it is not based on an actual hardware limitation. Thus, remove it.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 2168ef2c5148..7097a206ec3c 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -740,13 +740,6 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         bar: &Bar0,
         fw: &F,
     ) -> Result {
-        // The Non-Secure section only exists on firmware used by Turing and GA100, and
-        // those platforms do not use DMA.
-        if fw.imem_ns_load_params().is_some() {
-            debug_assert!(false);
-            return Err(EINVAL);
-        }
-
         // Create DMA object with firmware content as the source of the DMA engine.
         let dma_obj = DmaObject::from_data(dev, fw.as_slice())?;
 

-- 
2.53.0

