Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLXKAa78nmm+YAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:44:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24DD198518
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D437710E8FE;
	Wed, 25 Feb 2026 13:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uCgEx+wF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010017.outbound.protection.outlook.com
 [40.93.198.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A2910E8E7;
 Wed, 25 Feb 2026 13:44:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RN7QgWSsoxR3bNS1B9cw50gYLyDAVEK+vS4APWgzjvv5Qz+0X8TXn9xyqkgSFSYeD5PWnP0zGPdsEfxYFwt9gmT4WWlVcnbs3g90bAckpWNe883SUBElKLrmH8nbTOzwuNIYplxtjEy9WgAj4wCg7JtaAmHZLHkBBKKPn64HYfncw09dO/EUfOIa/kkX2PxfuW6WkVdPiI1gZv7sx6pN5HlL7TgAkRf3A5r5RPYhx5X8bYzINkfJl2ETQ7EFhLL5knVpmNofh4TIng2y4pBnIdJOhnXENJF7L1GJML43lLFEj0Sc47wURAFafY4e/5Zpdf/XH32xewFDOnZlHu4EMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7861W4/oTqYbUnw0uSAoE2LmjwwfQADAyHQCI8LxPM=;
 b=Q+4FG6skohVqJOsXUZ81qVMGXBHKFC4VsMXPTs7kk2QKfUjAtjziPgq/9zQL8ziKcMG6YXzlrqC9xGyRuiRhalJRUjRMtAHHrMrcwQJyrbiRdOD8WNCEgVkLJoKuWDc8Y1O0Vmj0g/Aj5UFO3Ea8Yys4ZQA6RzgZ+cRWHcoGGCchHkade9MAeTC2ZBrKVx21/XbxewIWCMAkoXDZ06DpcAxYyzdQYmYcORkOb8WxLWE4iLRSoJum/d7U4wu7mYu4mjA6c/Obw5zTQ/fVtVG3P0ItqqDU49fj1PBCqmN0cjbg/WGxyFxdlQTWx9CcH4PN9/sC1TdzU4df5Va+XrtwHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7861W4/oTqYbUnw0uSAoE2LmjwwfQADAyHQCI8LxPM=;
 b=uCgEx+wFzSWU+m9QtmOP9QJnDySH/1a5y2AUCzUoRnygqkMH5+nzownyEI4XetrKavBoCIeiGQIX2lPpAMJ8As+SDkx2TRFgeVQcQ0TIwuSdUkGrqA2NVTK1I0zueW6uRPPRHugGrEatnEmi6E9ba3zTGcPj+kYBwm5BSVkiP0mWrDPUl4ERtKq7A0PIow0W/Lt89oCoZGEhFVwW6SBdbhZBuRKHo+W0+VJemEnNSug/YoaWM80UtECXoIcbwUx4GKSmSDjeMLlSUAZJ8p5kZErJUdtWfGTZwY2+zvhy+LxDxUCfQEiB1Ls29ddIkvv5QqRLKCcU8vbMmywdA3+8WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 13:44:04 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 13:44:03 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 25 Feb 2026 22:41:51 +0900
Subject: [PATCH 4/4] gpu: nova-core: gsp: add mutex locking to Cmdq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-cmdq-locking-v1-4-bbf6b4156706@nvidia.com>
References: <20260225-cmdq-locking-v1-0-bbf6b4156706@nvidia.com>
In-Reply-To: <20260225-cmdq-locking-v1-0-bbf6b4156706@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0157.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: d5366c8e-8567-41bd-7692-08de7473f078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: UrplHgYriks7cCQNStLqZZ6sJdqgZ3ybg6HTjopOw6z4H+zIRHzF6Yn1EpzX3lG3fKSgs85vzqGziTYSXL/DJgi9+eRqxYX+14JzqK09O7Qhjwl2eGcTgePZ3uV946U8hImsMNfWXyluoZUw1q0cycabwmsEtKyENbR4jt3XHQkALWgAUMnW+uSm4BFbFbgP5148JvxyZ9wKvXDLRv1YZCzErUSS2K8TE02/pwDI8dYV5nBtfMx+CXlecqjU9+TSwepBuC5XUdUUONns70ThiVvZ3S4j+JcPCePPRor/sA+/CKzUW3H2eov+mJy/NjH9ShvN7sO6W154oTGXb9L2/Qn94pw6M+ZCZ+FnkErS4W4JSZag5LDlo9HWm9bNQi2FoUdpLLAwjzO8gJ5kydSYOLl6+noYNqzvDVXEkaP4DfqyBxViFdRfnfw5ihcnQyx0Irp+Q5W7c76v6TY4G70Aq/MwCPUWiro05UhruhDUPWisw9pTrOjLh1BSIjaYDlz06ALWK4e55Jjqc3xRNgbgs01tHRE8WhrV+hC92eKXRzPfVRxc+/Vx5IpXTeV96hP4nqwOFHP36GTU5hsIRd5RnN3olqnhUrIAyaMUSC4WEx4xZ8G6ooWK6gmGzFDGzEu1CNnjy7RQ/xTediLxWZ+vofYgJEj2RAWkUSQ85dBuH92My1Y616ONnTKyOVKKj8wmzIdk1xcL12CSbqK6kl6y+4Xg7q7pO9zRMd/AEfJSq/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTg1Rmo0WGNQRTNSamlvdnhXMzMvb3pQRGVtTDNrTXpVWFdnK1paNGltSVJa?=
 =?utf-8?B?cEE1TmtBQkFvMWpNRlJzWUtzY05UYUg1R1cyaUhwRWZXYkorUmRSTXI1c2pR?=
 =?utf-8?B?WW5XYXE0TjgrUVdxaVlmcjI1TFNXc2hOTmZIOUR6R25tMFU2SENWMENORWlr?=
 =?utf-8?B?ZEg3MFB1RERobGo4aG42QlZKMG56c1prM25kRXhZTEJ5MC9iWjRpOUtrTG5u?=
 =?utf-8?B?clF1NE9DNm1CSmhlYjdOTmJ5UENMdE8ycXBGdy9FWjJ4S0c4dzhZYXRvN2lS?=
 =?utf-8?B?T3JDS25keHYvamcvOHhvZW92T3pDQVVkV0RuZHVWeUxrc0xIQmhhWCtFanJ5?=
 =?utf-8?B?NTRTSEdQYjZVeENHbXNFSHhuR2ZWc2pYQ0RjeTV1Q0FoTTdqMmgrRUZKb1VK?=
 =?utf-8?B?QStEOU1DNW1hNzdRc3NnUUNhQWdMSWl5VFdXbjBJQTJQS0tVL1ZJKzJUR3VQ?=
 =?utf-8?B?WS9zdHVERlFMUEdleG0xYnJJb3JrY3l4RmxYWk9tZ1Zsd0p0aWFvSnYvVUhD?=
 =?utf-8?B?YTQvaGlPVGp5WU15MEhmV0lVRllVRXY0QmVlVlpzUnVucUlmUGxuVDVtU1hQ?=
 =?utf-8?B?S0QrbG51ajJaRUlBa2NNL3J6ZU1uUmtkMHIyMWtFVlNKWlhhdUNjcXZOMjBK?=
 =?utf-8?B?UkRsSUFQWHBrdmNzV0F3WWgyTkd6OGp6TTVnc2NLS3h1L0M3b2lqSXpxbm1w?=
 =?utf-8?B?ZEluYlJYdnhMQi94ME1OVHVMOXg3Tkh4azFXektGZ2w0NVNNcDgxWjRnV1RI?=
 =?utf-8?B?dUMyRXZHOER4WEhHd25oTGpNeTVEejIzSUc5cmdaTXZqUjliQitnUGpGV3Q3?=
 =?utf-8?B?enV4V0l0MWQzcGF2ZVB0THhkZTZuMmcxMDlxL1QrY2thR3YzZGNhRWhOU3VD?=
 =?utf-8?B?ZFdnRGlCMzhFNWJFOTFCMlFQNElnM2w0Y2dNYndQZmxndEdvTVRHbGJWNVBt?=
 =?utf-8?B?Ylh1SUkzQ2VBQ1lVQVkyUEZncWxoN2ZHUU0rQ1dpWFgxUTJmaHZ1SDZlSy9W?=
 =?utf-8?B?UjlxZmg2clpwTlZEM25mcUQ5MUxxYkhHcWJTU0RESVRlMWRqbGNkcURJb01l?=
 =?utf-8?B?SEJRSmExazFUZzByV2xGcnJWSTU3anpuenZBTjFrTy9DSStSbDZkVVJqOC9N?=
 =?utf-8?B?ODE2TDh5VVF2SUtYQUpzY0RiODRtdDVmNGVDTkpWdlRkSUhPWW1vYTBGMjN1?=
 =?utf-8?B?bCtTSGJxeDluWlNhb0g3RXdrRzh2cnFadS9vSVpLUStlRENwMjZGMk9Ec0My?=
 =?utf-8?B?ZElFMk8wSWVSRzB4cEtqQWUxMDNJWGZYUWlUVHF1cEJWUURETGVobmZXS3dO?=
 =?utf-8?B?aThkQVF4V01mUjRzbHFINFFJMWJjY2RreENCN2Z4bm16WmZGc1RFclR3UzRu?=
 =?utf-8?B?TDJCanhMdUNpdy8xa1gwbCtpNFdkUmw3WUJiWE0xVFJIRXZFOURZSEREQjNn?=
 =?utf-8?B?djkrd3JuQ0dVMkFRck0wODJETWR5bXUxRWhmSGJSL1NTL3VYTFcvRnNrZm1Y?=
 =?utf-8?B?eUdCUGRDb3FpVWptb1JxcGx0ZXpWTXBianVaMU9YZE1GVE9md0VLNkVuWEhs?=
 =?utf-8?B?THJyWWNESlJheTZsWi8zM0dGd3J0eXhmTmpma1FiQUtnNUxZS3psandYVkxZ?=
 =?utf-8?B?ZUtrWEd2SVBxNFNkSWg3QTg0WWFRb3kxMk1XVWFXYXJIaHk2WE15TXlXdzBB?=
 =?utf-8?B?VEliYzhvak53cUZES1lLU09IdjlZSHNqWC9lbytVQjRNTVlIMnROK2Q4Mzkx?=
 =?utf-8?B?L0FrS2hOZGg4SEp1cEl6aHJubTJkdnJaei82NXFVNHFhMW93am53VVBKSDNJ?=
 =?utf-8?B?ZE54QVBVeGNwamJybTB0U2srcHBEZXdBcEpmRXIybi9scnpCc2w3dW5Xd3E5?=
 =?utf-8?B?cHVWTnRGRG5tRXh0UTd2a0hteHJlSGtzRHJpSWtOTDBKcjlYRGw1bDU5MGVr?=
 =?utf-8?B?eFZWaURMT2s0TmpnZ0ZnQkEwNmsrOElOdXBNOXpNTTN3dWd5aXhlMVBRalFv?=
 =?utf-8?B?eHdBSU05U3VXK1JGYjZEOFJKTE5IWG1lQkFJM0hYMFFIREZlMW5taENNcUtB?=
 =?utf-8?B?WkNTMmZsZnZWS1FDVGtlOUl3ak5vbzV4OTJKOXQ5c0dKVzBybm5OVkhDai9y?=
 =?utf-8?B?TXZMcEtiR2h1SUF6dFZuNHlBZi9abHNOcHROelZOeTFYZzZLWEQxazhZZjRV?=
 =?utf-8?B?R2ZWZkRncTFxenB2L3pQbi9LVDFsMlVZN3B1ZlFNSkQyeUE5YkQrQWxDemxi?=
 =?utf-8?B?eGp6T1UyUmRuaFYzM1Y2TmJ5TkRkY1FiZndMZmJyaDNhS3ZjZlNhYTZ4amI0?=
 =?utf-8?B?aEMyc25nT3BxdEJSYVg2Nm50MzB1aWV1Q1pRNGROeDdHODI1djdIMmplbnlo?=
 =?utf-8?Q?vrsWanMXPkXrmtf7bWc+SWx7shXJKXmtjXyqRCXCTxjBb?=
X-MS-Exchange-AntiSpam-MessageData-1: 4rz+0ou3HjsEgQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5366c8e-8567-41bd-7692-08de7473f078
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:44:03.9096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PicIMznWTgkvWBag1THo/J4ULY3RfohLOeBDkDeiA28TmYbKNagy3H2n34DctcbZOtNqTKW3hWSJ1UbHIlAh6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679
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
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: A24DD198518
X-Rspamd-Action: no action

Wrap `Cmdq`'s mutable state in a new struct `CmdqInner` and wrap that in
a Mutex. This lets `Cmdq` methods take &self instead of &mut self, which
lets required commands be sent e.g. while unloading the driver.

The mutex is held over both send and receive in `send_sync_command` to
make sure that it doesn't get the reply of some other command that could
have been sent just beforehand.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs      |   8 +-
 drivers/gpu/nova-core/gsp/cmdq.rs      | 260 ++++++++++++++++++---------------
 drivers/gpu/nova-core/gsp/commands.rs  |   4 +-
 drivers/gpu/nova-core/gsp/sequencer.rs |   2 +-
 4 files changed, 152 insertions(+), 122 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 1cb21da855b9..cb583f57666a 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -128,7 +128,7 @@ fn run_fwsec_frts(
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
     pub(crate) fn boot(
-        mut self: Pin<&mut Self>,
+        self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -232,13 +232,13 @@ pub(crate) fn boot(
             dev: pdev.as_ref().into(),
             bar,
         };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        GspSequencer::run(&self.cmdq, seq_params)?;
 
         // Wait until GSP is fully initialized.
-        commands::wait_gsp_init_done(&mut self.cmdq)?;
+        commands::wait_gsp_init_done(&self.cmdq)?;
 
         // Obtain and display basic GPU information.
-        let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
+        let info = commands::get_gsp_info(&self.cmdq, bar)?;
         match info.gpu_name() {
             Ok(name) => dev_info!(pdev.as_ref(), "GPU name: {}\n", name),
             Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 44c3e960c965..faf1e9d5072b 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -16,8 +16,12 @@
     },
     dma_write,
     io::poll::read_poll_timeout,
+    new_mutex,
     prelude::*,
-    sync::aref::ARef,
+    sync::{
+        aref::ARef,
+        Mutex, //
+    },
     time::Delta,
     transmute::{
         AsBytes,
@@ -54,8 +58,8 @@
 
 /// Trait implemented by types representing a command to send to the GSP.
 ///
-/// The main purpose of this trait is to provide [`Cmdq::send_command`] with the information it
-/// needs to send a given command.
+/// The main purpose of this trait is to provide [`Cmdq`] with the information it needs to send
+/// a given command.
 ///
 /// [`CommandToGsp::init`] in particular is responsible for initializing the command directly
 /// into the space reserved for it in the command queue buffer.
@@ -470,66 +474,15 @@ pub(crate) fn command_size<M>(command: &M) -> usize
     size_of::<M::Command>() + command.variable_payload_len()
 }
 
-/// GSP command queue.
-///
-/// Provides the ability to send commands and receive messages from the GSP using a shared memory
-/// area.
-#[pin_data]
-pub(crate) struct Cmdq {
-    /// Device this command queue belongs to.
-    dev: ARef<device::Device>,
+/// Inner mutex protected state of [`Cmdq`].
+struct CmdqInner {
     /// Current command sequence number.
     seq: u32,
     /// Memory area shared with the GSP for communicating commands and messages.
     gsp_mem: DmaGspMem,
 }
 
-impl Cmdq {
-    /// Offset of the data after the PTEs.
-    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
-
-    /// Offset of command queue ring buffer.
-    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
-        + core::mem::offset_of!(Msgq, msgq)
-        - Self::POST_PTE_OFFSET;
-
-    /// Offset of message queue ring buffer.
-    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
-        + core::mem::offset_of!(Msgq, msgq)
-        - Self::POST_PTE_OFFSET;
-
-    /// Number of page table entries for the GSP shared region.
-    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
-
-    /// Creates a new command queue for `dev`.
-    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
-        try_pin_init!(Self {
-            gsp_mem: DmaGspMem::new(dev)?,
-            dev: dev.into(),
-            seq: 0,
-        })
-    }
-
-    /// Computes the checksum for the message pointed to by `it`.
-    ///
-    /// A message is made of several parts, so `it` is an iterator over byte slices representing
-    /// these parts.
-    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
-        let sum64 = it
-            .enumerate()
-            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
-            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
-
-        ((sum64 >> 32) as u32) ^ (sum64 as u32)
-    }
-
-    /// Notifies the GSP that we have updated the command queue pointers.
-    fn notify_gsp(bar: &Bar0) {
-        regs::NV_PGSP_QUEUE_HEAD::default()
-            .set_address(0)
-            .write(bar);
-    }
-
+impl CmdqInner {
     /// Sends `command` to the GSP, without splitting it.
     ///
     /// # Errors
@@ -540,7 +493,7 @@ fn notify_gsp(bar: &Bar0) {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_single_command<M>(&mut self, dev: &device::Device, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
@@ -583,7 +536,7 @@ fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             ])));
 
         dev_dbg!(
-            &self.dev,
+            dev,
             "GSP RPC: send: seq# {}, function={}, length=0x{:x}\n",
             self.seq,
             M::FUNCTION,
@@ -610,73 +563,27 @@ fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_command<M>(&mut self, dev: &device::Device, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         Error: From<M::InitError>,
     {
         let mut state = SplitState::new(&command)?;
-
-        self.send_single_command(bar, state.command(command))?;
+        self.send_single_command(dev, bar, state.command(command))?;
 
         while let Some(continuation) = state.next_continuation_record() {
             dev_dbg!(
-                &self.dev,
+                dev,
                 "GSP RPC: send continuation: size=0x{:x}\n",
                 command_size(&continuation),
             );
             // Turbofish needed because the compiler cannot infer M here.
-            self.send_single_command::<ContinuationRecord<'_>>(bar, continuation)?;
+            self.send_single_command::<ContinuationRecord<'_>>(dev, bar, continuation)?;
         }
 
         Ok(())
     }
 
-    /// Sends `command` to the GSP and waits for the reply.
-    ///
-    /// # Errors
-    ///
-    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
-    ///   not received within the timeout.
-    /// - `EIO` if the variable payload requested by the command has not been entirely
-    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
-    ///
-    /// Error codes returned by the command and reply initializers are propagated as-is.
-    pub(crate) fn send_sync_command<M>(&mut self, bar: &Bar0, command: M) -> Result<M::Reply>
-    where
-        M: CommandToGsp,
-        M::Reply: MessageFromGsp,
-        Error: From<M::InitError>,
-        Error: From<<M::Reply as MessageFromGsp>::InitError>,
-    {
-        self.send_command(bar, command)?;
-
-        loop {
-            match self.receive_msg::<M::Reply>(Delta::from_secs(10)) {
-                Ok(reply) => break Ok(reply),
-                Err(ERANGE) => continue,
-                Err(e) => break Err(e),
-            }
-        }
-    }
-
-    /// Sends `command` to the GSP without waiting for a reply.
-    ///
-    /// # Errors
-    ///
-    /// - `ETIMEDOUT` if space does not become available within the timeout.
-    /// - `EIO` if the variable payload requested by the command has not been entirely
-    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
-    ///
-    /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_async_command<M>(&mut self, bar: &Bar0, command: M) -> Result
-    where
-        M: CommandToGsp<Reply = NoReply>,
-        Error: From<M::InitError>,
-    {
-        self.send_command(bar, command)
-    }
-
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
@@ -695,7 +602,7 @@ pub(crate) fn send_async_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     ///   message queue.
     ///
     /// Error codes returned by the message constructor are propagated as-is.
-    fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
+    fn wait_for_msg(&self, dev: &device::Device, timeout: Delta) -> Result<GspMessage<'_>> {
         // Wait for a message to arrive from the GSP.
         let (slice_1, slice_2) = read_poll_timeout(
             || Ok(self.gsp_mem.driver_read_area()),
@@ -712,7 +619,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         let (header, slice_1) = GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?;
 
         dev_dbg!(
-            self.dev,
+            dev,
             "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}\n",
             header.sequence(),
             header.function(),
@@ -747,7 +654,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         ])) != 0
         {
             dev_err!(
-                self.dev,
+                dev,
                 "GSP RPC: receive: Call {} - bad checksum\n",
                 header.sequence()
             );
@@ -776,12 +683,12 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `ERANGE` if the message had a recognized but non-matching function code.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
-    pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
+    fn receive_msg<M: MessageFromGsp>(&mut self, dev: &device::Device, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        let message = self.wait_for_msg(timeout)?;
+        let message = self.wait_for_msg(dev, timeout)?;
         let function = message.header.function().map_err(|_| EINVAL)?;
 
         // Extract the message. Store the result as we want to advance the read pointer even in
@@ -802,9 +709,132 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resul
 
         result
     }
+}
+
+/// GSP command queue.
+///
+/// Provides the ability to send commands and receive messages from the GSP using a shared memory
+/// area.
+#[pin_data]
+pub(crate) struct Cmdq {
+    /// Device this command queue belongs to.
+    dev: ARef<device::Device>,
+    /// Inner mutex-protected state.
+    #[pin]
+    inner: Mutex<CmdqInner>,
+}
+
+impl Cmdq {
+    /// Offset of the data after the PTEs.
+    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
+
+    /// Offset of command queue ring buffer.
+    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Offset of message queue ring buffer.
+    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Number of page table entries for the GSP shared region.
+    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+
+    /// Creates a new command queue for `dev`.
+    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
+        try_pin_init!(Self {
+            inner <- new_mutex!(CmdqInner {
+                gsp_mem: DmaGspMem::new(dev)?,
+                seq: 0,
+                }),
+            dev: dev.into(),
+        })
+    }
+
+    /// Computes the checksum for the message pointed to by `it`.
+    ///
+    /// A message is made of several parts, so `it` is an iterator over byte slices representing
+    /// these parts.
+    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
+        let sum64 = it
+            .enumerate()
+            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
+            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
+
+        ((sum64 >> 32) as u32) ^ (sum64 as u32)
+    }
+
+    /// Notifies the GSP that we have updated the command queue pointers.
+    fn notify_gsp(bar: &Bar0) {
+        regs::NV_PGSP_QUEUE_HEAD::default()
+            .set_address(0)
+            .write(bar);
+    }
+
+    /// Sends `command` to the GSP and waits for the reply.
+    ///
+    /// The mutex is held for the entire send+receive cycle to ensure that no other command can
+    /// be interleaved. Messages with non-matching function codes are silently consumed until the
+    /// expected reply arrives.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
+    ///   not received within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command and reply initializers are propagated as-is.
+    pub(crate) fn send_sync_command<M>(&self, bar: &Bar0, command: M) -> Result<M::Reply>
+    where
+        M: CommandToGsp,
+        M::Reply: MessageFromGsp,
+        Error: From<M::InitError>,
+        Error: From<<M::Reply as MessageFromGsp>::InitError>,
+    {
+        let mut inner = self.inner.lock();
+        inner.send_command(&self.dev, bar, command)?;
+
+        loop {
+            match inner.receive_msg::<M::Reply>(&self.dev, Delta::from_secs(10)) {
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
+    pub(crate) fn send_async_command<M>(&self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp<Reply = NoReply>,
+        Error: From<M::InitError>,
+    {
+        self.inner.lock().send_command(&self.dev, bar, command)
+    }
+
+    /// Receive a message from the GSP.
+    ///
+    /// See [`CmdqInner::receive_msg`] for details.
+    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
+    where
+        // This allows all error types, including `Infallible`, to be used for `M::InitError`.
+        Error: From<M::InitError>,
+    {
+        self.inner.lock().receive_msg(&self.dev, timeout)
+    }
 
     /// Returns the DMA handle of the command queue's shared memory region.
     pub(crate) fn dma_handle(&self) -> DmaAddress {
-        self.gsp_mem.0.dma_handle()
+        self.inner.lock().gsp_mem.0.dma_handle()
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index b42e32dcc55c..7ceff2e6bd63 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -170,7 +170,7 @@ fn read(
 }
 
 /// Waits for GSP initialization to complete.
-pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq) -> Result {
+pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq) -> Result {
     loop {
         match cmdq.receive_msg::<GspInitDone>(Delta::from_secs(10)) {
             Ok(_) => break Ok(()),
@@ -239,7 +239,7 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 }
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
-pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
+pub(crate) fn get_gsp_info(cmdq: &Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
     cmdq.send_sync_command(bar, GetGspStaticInfo)
 }
 
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 2fa2a0792cec..bc94b8567c6a 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -366,7 +366,7 @@ pub(crate) struct GspSequencerParams<'a> {
 }
 
 impl<'a> GspSequencer<'a> {
-    pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
+    pub(crate) fn run(cmdq: &Cmdq, params: GspSequencerParams<'a>) -> Result {
         let seq_info = loop {
             match cmdq.receive_msg::<GspSequence>(Delta::from_secs(10)) {
                 Ok(seq_info) => break seq_info,

-- 
2.53.0

