Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOR7DE6dp2naigAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:47:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83121FA002
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA5C10E938;
	Wed,  4 Mar 2026 02:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lG421SJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F168D10E0D3;
 Wed,  4 Mar 2026 02:47:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YaAK6giX7vljx+cdV1NQKlO8Gxo7E4BdXUdrIlmIbaoPA9psBEcu3fa16Os/JKsoDbGX02gMGmV890CD5Ow//Zoz50g4zw4df07zZ2OTBspni1bvg44L5iKeGRDtco1CskunMlpuYwGXDdLGLEYvDja4lGB9DJhudAq9g43aWt4HtllLOHzaMoOkP+7mMrnfe4RO6dSi7P6U4mMWESoAV+8EFn7/LP9j2Mui/KV6R1l74/K/y6unreC13G7WlekeYslN9tf4mdsHyu5qLiYMdPysOXRILoj0Ip/gtNksoJfxk5A8821SyeNSHn23rLdG3cEfMGXyauJyp7b5tmyPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YsX7BNVG7I+OuD+q3o1i/z8NSsXIkx0VW6naQl/t4E=;
 b=oKchPLwszZ/kfw2OFm1mcP9RFJyGtgSBh63KNczwFcAtJDuSynpbkc927l9wK13ocxhBDrxQltnmoS7nvmvW7DnmM+kQBUWvMclqP98D+dkWr4loPlkzBMMo6vk7jo7/1uUzAXkPTUHvVl5mY2kLml2fWMmhy7evRYVm4zbRwQk9AmFdthZQGBLjejI+s/lFlc7aeuPoMEgZEDSfWl7z9JCLnll+gyV4Vvn3AHwpbi+lXlbcyKdqsLSrsoOGEvutCOFCmy6zouHRRgh/0ajbAuKDVGoovCAjM1ZIh9aNg70BWS1WfKzHw9ty2IisVJnMXR0q5lhOA+bLLkKV1XgAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YsX7BNVG7I+OuD+q3o1i/z8NSsXIkx0VW6naQl/t4E=;
 b=lG421SJ5iKw2o7/0/q8fMpCrCSGAPYcl1QkBI9TVDgIhuB+pe1P1qT+62duV4n3EK18K4djDqlD/xYbKVG5XcohvmkQsrCCr5jzyl44ALWL0hRxnN/PXZ4F32mNv1IxvDRqw0X8p9YAWgvUo73MqWyvAVMIcRm0W1ywH1RvtJYQpMJveqUi0DY09+B8IaL2a4osOENcWrPVitiL+Y9h2ymSAfEsJLoHtl7y2xTFHhydyDiwY/YQEZCmtZHjOV2f7uzAysLOeNWb0sy0cXIPPK2kh0w9BYbDx6pb/fPf8HkfNP8Yf++5VJwNt+DEz2MXFbTDfTNYzJGyV0gwfQ90JZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Wed, 4 Mar
 2026 02:47:27 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 02:47:27 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 11:46:38 +0900
Subject: [PATCH v3 3/5] gpu: nova-core: gsp: add reply/no-reply info to
 `CommandToGsp`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0091.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a421c3c-142f-44b9-1156-08de79985dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: iOKnNKQ7gLO/MqWG5oOyTnS/OHXhc2hfbllIgLrOH2knemUYo2htGerZt5Tz4iN/EswbK4bCjYvVL1Bd/Uv+bMqF9LUqzah5+jWh9FyICwrIUs+Smk2Th+jJbSkOrM3nVSljcb8+ZX45j58k41JKeAXw7x5QkWeb9G0DaQZNbwL4zeCYUd1xWSo92NjfTaI2HzXVbVQyh+/Wal7CLX/UgCi6ujKxxW+H3HuLGXOJSanulr5vONYR9Eub0GckhrucM3506k3pj+cjAvBQJ8ZaRWrYDSMsCWcfgXAqZp7MuiVbHvxXsD3TMBKHJGve4KZEM4LzG25dtm1EegwE2pGyMMUoCFU//LXk0fv+RVhCoaX9qrTZ5j59sbCfq0aJ1dBUAfiMXKhvZAAvdZYumqp3YTUjJS5l4wbLPqcey5jaP2wYx7HB8AbS3O7vnwPiqCqzV5E1gaAj2x7XMOs8pQTMqZrxHBKP96PHGBd54fJYySOxlnlYutVCqmNrJguW8J6O7huDTa0ZSlioGALzJbLiO5wD37ufTOgVbK8GDW265ixyG7+CTyHq90a7d5gSYCYsINaCLD4rSO8zQI1cI0bi4FipRgl8URloesaAd4FJVBeZB6t92qDLf8lcA5v94h+iDuf/kyu2U/vSnxJ0A5k8Sb+kBYPVVlzDmA1YMKDe2dB5eajaWbKpsna4XNpPoWC7WXX8UHAkQlbrVR0NhNr+XvghHTKLlx+hDRAnHCKZ0o8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2VLaWRaYXBiVWQwSTlpcjM0QkczNkpoTlBSdkxCS0VmMFEwRHZCYjVkd3FB?=
 =?utf-8?B?c3dKQlJ4NEpMMC8zVTRtQjRONVFDa0xEN3Y3aklHWGVQOHlmWXBjQ1paSENN?=
 =?utf-8?B?TWUwdjdDN1ZTVzhyNzhIZW1RYnR0MmcrQjlLKzNlMjkxV3NXdE5mNE8zenRo?=
 =?utf-8?B?Rm9MWWs2Rm1LclQ2NFJIT2xzWmJhZUpMclA5a2JnYzk5QWJSeVE2MTJnY3Y4?=
 =?utf-8?B?Smp5V1hYSTh0T1FONFJWNkl1RVdia0xvVTJDaklMZ21YZlNFd1hlaVE5QitT?=
 =?utf-8?B?L1hCbXRITEgrRVJFVUlEaXdKSGxPM2JGK056TThSc0ozYUY4TllCOFZpY2dC?=
 =?utf-8?B?M0xncXJFbVhsR29pTHFLNmZlOHFrYXFlbFNoUGt0dTB3ajNOdElFVzR3Yis2?=
 =?utf-8?B?S0VMc3NoQTFQazZRRnUwMWEwY2FWZytZbUpTdVJxNmNFUkFua3lVL0JpSUVt?=
 =?utf-8?B?SEp0RTZvRWxUaTlzZkZTV3JreE96ZlY2UGZzN3c4KzFzSmJ1cm8wMllmdHR4?=
 =?utf-8?B?UCt2ZUoyMitGMyt5YzNQTm1mTWgrUGxseGZYblBHaXZpWlZIR29nd1RwLzRU?=
 =?utf-8?B?NXlobmxnMlFQempSODVJSGxoU0dlV0w3c0krZ3oyTWg0S2dDU1FJSzBieEJh?=
 =?utf-8?B?WU5vT0lqbGphUVlOdStGTy9Ba21VS3d5TnIveWR4aHlGaU5NSFVoRU51RlVO?=
 =?utf-8?B?NWxVRTlmU1lYTXVvdm90SzF6bGIyKzQvckgyb2cyVWJPY0NQdG5OcmpJK0pK?=
 =?utf-8?B?c2dxcVpXbng2ejVnQWdTd29jQjBiUWxUQ0duTDlXL0pUOGV5RjBGMnVPY1VI?=
 =?utf-8?B?NW5Tb1hwcVhOb1FBWlRYZWMxY3VSejIzU3Jac2Q1dnRCSElCd3BrdWVVdnBz?=
 =?utf-8?B?M3ZDVVkwc0dYQlJQckF5OVlFMnR5aUd3TGhjVUJyWnFqMjNZVEtaa2orQkdR?=
 =?utf-8?B?OTd5NHdJak1XRU82OXFJM0JDa0dVeEFVVDR4UDFDYXRzc1kvTTJ2ZXUrb1Ex?=
 =?utf-8?B?akd6b0RjeEpmUVd4aU5MQVJOMUYxb0VZZVhaRzhKQUI3Y0dNMk5KS3pEL0V4?=
 =?utf-8?B?N2tRTTZ5ZXJ2TXcxamI1cVlpL0V2RXpQMnZ0RXFjRnNqZkxYZTJlU1lSWGpu?=
 =?utf-8?B?dG5KRFpYLzhIK0tqczJEbnBhUkNpbDVTejZLaVI3WEJZWThRVTBhdEVVRjhQ?=
 =?utf-8?B?bTlzSm9IVTFJdm5tNWpvMis1QlRTVlRPbTArSkp3cmVXS0xWMDlCdTNQNXNa?=
 =?utf-8?B?ZmtUYWtZS1lTSm05UCtnMEh0cysrY05SMXdvY3F5c2tHMm4weHJyTGgvWFNt?=
 =?utf-8?B?TDdIa2JaeHNRMHBoSURTcTRKdUgzcUoxOU1GOTZOR2wyanNYTUN1YUt0U1pj?=
 =?utf-8?B?Zis2T0ExNHg3UHEveSt6WEl1V29aaEpLVkxZZkd4QzVtUDBqVG5RN3VPZEFZ?=
 =?utf-8?B?SVc2Mnp6dXRBWkpQOWJTM1lrQThkd1pOcG53ZnZxd1M2MDg4d0xYNERpS1ha?=
 =?utf-8?B?b0xMOGJDcWhsV1ZnVzZxRnRrZFBlNDIycWY0V0lnZkNrZlo5WDl2VmtqbU11?=
 =?utf-8?B?Z0hLdExubU1SdzlaeEhLVVY1T2ovVjRweVc0V2Y1bzYvR0E3bmwySjVJSEUz?=
 =?utf-8?B?UlA1aXhpV1JHckJockZOdGUyNUU3Q28yc21OK3ErN2N0VXNWb0NrY2k2WERo?=
 =?utf-8?B?SUJ1cWpJQUNtekd0b1ZCWXNMeFAxNGJZRklvb2ZvRWxhei81bzROQkhiT0JZ?=
 =?utf-8?B?N0VzSlo0WmZrd1JlMW56NjFWY1B0UTd4eHlLRkdnQTRvaThlZFU0TUllSjg3?=
 =?utf-8?B?RnVmUWpKNTN4TWJkRVBRYTdpRWptOGtVWUhpd1NCMUJWMUVMbTZtaGpxb3pr?=
 =?utf-8?B?QmZJbzRGMWYvOHV6Mno4NjB5bE5KSHZkK3BnYXh4Q3djbDFndlAzRFV2U0Yz?=
 =?utf-8?B?anJaVm1CY1RObVpKRC80ekZtL1FMZ1h5cGVaWGJEelZIZ1NaaHJIcDBOanFR?=
 =?utf-8?B?OERxM1dLcmNHb3pDcDk5dmF2Y0U0Q2pndVcwc1IrZ2Y3YWVzcFY4VEhhdWxT?=
 =?utf-8?B?YTlIMFdZTGl2dVp6NGg0RXFSb0lkZFhEdWo4alhnWHRwTldTT2RSb2RWNW9G?=
 =?utf-8?B?ZWQ2YmlDdGtSaXZCeVN3YStoc3M0angzNHBJQVQzcGJmaXlNemloNEswUmEr?=
 =?utf-8?B?djUyMGhjVlNycHpFTnZHVEQwYmxGNldHSW5saEVEc2ZOL3JEbmNOTUhINmtw?=
 =?utf-8?B?dmdyUWZpSUN1LzJHdkJETmIxa0FQQlQ2WnI0cXk5ZjFrRDBpSmRSUFpLRW04?=
 =?utf-8?B?d1NabytCREhpRFVEaEhLYUhJaWdFS0xyeFFQUnd5d3ZWWnljVlNVT0xydE4z?=
 =?utf-8?Q?PTaEdkp4mCMUSAngO929zs2pELRc5j1s3iu8Z/49PFGr/?=
X-MS-Exchange-AntiSpam-MessageData-1: S7HcDVItDVnFew==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a421c3c-142f-44b9-1156-08de79985dfd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:47:25.3215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unG7OnkMtrvIjMNsnOQ8f2PjpMaimYu1V3ZEZAlbyuv8abOqEKFWX+dYO6r5KL0CjJpNDX0rGeZlDiCdU7ZRqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
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
X-Rspamd-Queue-Id: D83121FA002
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
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Action: no action

Add type infrastructure to know what reply is expected from each
`CommandToGsp`. Uses a marker type `NoReply` which does not implement
`MessageFromGsp` to mark commands which don't expect a response.

Update `send_command` to wait for a reply and add `send_command_no_wait`
which sends a command that has no reply, without blocking.

This prepares for adding locking to the queue.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs              |  5 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs              | 55 +++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/cmdq/continuation.rs |  5 ++-
 drivers/gpu/nova-core/gsp/commands.rs          | 16 +++-----
 4 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c56029f444cb..991eb5957e3d 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -160,8 +160,9 @@ pub(crate) fn boot(
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev))?;
+        self.cmdq
+            .send_command_no_wait(bar, commands::SetRegistry::new())?;
 
         gsp_falcon.reset(bar)?;
         let libos_handle = self.libos.dma_handle();
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 0192c85ddd75..7750f5792b21 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -51,6 +51,10 @@
     sbuffer::SBufferIter, //
 };
 
+/// Marker type representing the absence of a reply for a command. This does not implement
+/// `MessageFromGsp`.
+pub(crate) struct NoReply;
+
 /// Trait implemented by types representing a command to send to the GSP.
 ///
 /// The main purpose of this trait is to provide [`Cmdq::send_command`] with the information it
@@ -69,6 +73,10 @@ pub(crate) trait CommandToGsp {
     /// Type generated by [`CommandToGsp::init`], to be written into the command queue buffer.
     type Command: FromBytes + AsBytes;
 
+    /// Type of the reply expected from the GSP, or [`NoReply`] for commands that don't
+    /// have a reply.
+    type Reply;
+
     /// Error type returned by [`CommandToGsp::init`].
     type InitError;
 
@@ -610,7 +618,7 @@ fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_command_internal<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         Error: From<M::InitError>,
@@ -630,6 +638,51 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         }
     }
 
+    /// Sends `command` to the GSP and waits for the reply.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
+    ///   not received within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command and reply initializers are propagated as-is.
+    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result<M::Reply>
+    where
+        M: CommandToGsp,
+        M::Reply: MessageFromGsp,
+        Error: From<M::InitError>,
+        Error: From<<M::Reply as MessageFromGsp>::InitError>,
+    {
+        self.send_command_internal(bar, command)?;
+
+        loop {
+            match self.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
+                Ok(reply) => break Ok(reply),
+                Err(ERANGE) => continue,
+                Err(e) => break Err(e),
+            }
+        }
+    }
+
+    /// Sends `command` to the GSP without waiting for a reply.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializers are propagated as-is.
+    pub(crate) fn send_command_no_wait<M>(&mut self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp<Reply = NoReply>,
+        Error: From<M::InitError>,
+    {
+        self.send_command_internal(bar, command)
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
index 637942917237..8a6bb8fa7e60 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
@@ -6,7 +6,7 @@
 
 use kernel::prelude::*;
 
-use super::CommandToGsp;
+use super::{CommandToGsp, NoReply};
 
 use crate::{
     gsp::fw::{
@@ -63,6 +63,7 @@ fn new(data: &'a [u8]) -> Self {
 impl<'a> CommandToGsp for ContinuationRecord<'a> {
     const FUNCTION: MsgFunction = MsgFunction::ContinuationRecord;
     type Command = ();
+    type Reply = NoReply;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -144,6 +145,7 @@ fn new(command: C, payload: KVVec<u8>) -> Self {
 impl<C: CommandToGsp> CommandToGsp for SplitCommand<C> {
     const FUNCTION: MsgFunction = C::FUNCTION;
     type Command = C::Command;
+    type Reply = C::Reply;
     type InitError = C::InitError;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -206,6 +208,7 @@ fn new(len: usize) -> Result<Self> {
     impl CommandToGsp for TestPayload {
         const FUNCTION: MsgFunction = MsgFunction::Nop;
         type Command = TestHeader;
+        type Reply = NoReply;
         type InitError = Infallible;
 
         fn init(&self) -> impl Init<Self::Command, Self::InitError> {
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 88df117ba575..77054c92fcc2 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -23,7 +23,8 @@
         cmdq::{
             Cmdq,
             CommandToGsp,
-            MessageFromGsp, //
+            MessageFromGsp,
+            NoReply, //
         },
         fw::{
             commands::*,
@@ -48,6 +49,7 @@ pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
 impl<'a> CommandToGsp for SetSystemInfo<'a> {
     const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
     type Command = GspSetSystemInfo;
+    type Reply = NoReply;
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -99,6 +101,7 @@ pub(crate) fn new() -> Self {
 impl CommandToGsp for SetRegistry {
     const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
     type Command = PackedRegistryTable;
+    type Reply = NoReply;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -178,6 +181,7 @@ pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq) -> Result {
 impl CommandToGsp for GetGspStaticInfo {
     const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
     type Command = GspStaticConfigInfo;
+    type Reply = GetGspStaticInfoReply;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -231,13 +235,5 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
 pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
-    cmdq.send_command(bar, GetGspStaticInfo)?;
-
-    loop {
-        match cmdq.receive_msg::<GetGspStaticInfoReply>(Cmdq::RECEIVE_TIMEOUT) {
-            Ok(info) => return Ok(info),
-            Err(ERANGE) => continue,
-            Err(e) => return Err(e),
-        }
-    }
+    cmdq.send_command(bar, GetGspStaticInfo)
 }

-- 
2.53.0

