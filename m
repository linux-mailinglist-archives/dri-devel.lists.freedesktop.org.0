Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G+YN6n8nmm+YAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:44:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A2198508
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF36A10E8F5;
	Wed, 25 Feb 2026 13:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XXU4SZVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383BF10E8EF;
 Wed, 25 Feb 2026 13:44:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1UieSgDLpGK08RX9uFVd3RDo7YAJ1v+j1bpOYCFG7BIenfD7hGgGizWQYXRwaZNX4Gg+vkcchlpRF6yq6Y++WKluQBLxVVF1pogEAoYmpaeDUlJPye8xW3I7npCyIUuhrzveu7LcV1Y/Aoz0xD1oixxC2qkUHqu73TkKmAH1Oy2+L3cI8CjkZkvpBMoXvpBLuhPAHOZVFHmSHZkR0sqabn3xC4JTcvMAG+ncWeS65q114eTwUAclAJjzN3L7PyYrqmhV6a/1zG7/UMAsOv1OfuprJIFcTsI7RmWjUDf/3SvQ662BzF7dkXBRDMuSsA4rpxkpeNc3xvki0IQ99Chwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyOoCY6pQvHIcgeQI1nGZ2ppXFcClJkbYkRBd/nLGk4=;
 b=lEd05dM/FMRD3YEYEmgsnzPkIjyl+DYSy8uSbZktLyucMUYpWC0R69J8Js6ml5X5WrFOJQcXVQ5QdzXFsBLUH6Kb1vDUYbIblntw+27iU3sFntjiw5C9jX0qEJ2oYPIO4hmPedphyQj8PLYwZfcM91Zj8e5CPKhew+plBM6LUb8ipbj9LtOQxr0i24IMe+gxVW/o/6FMKBye2mGi3VAMRsK7sznMeYKqlFnu235iffR6sNB483PHgTMvgW4VrTtPc551TkNAZq5GXasrjJYvukkUEsaf8yMHj7NVQ+V2C5ZIys5tPB8717lVZDzy7N8T/Ys9izWhWNYpbzvhoLp1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyOoCY6pQvHIcgeQI1nGZ2ppXFcClJkbYkRBd/nLGk4=;
 b=XXU4SZVG8KIsh82QSInzeoHBBuyhuLD3POVpEIL/H8s9uq9DyLFJnB2Zam6Qmjh+ESM7EAiRZLJAHU6shFA3R7BIgkIh23fiutvcrEDxVnidXwC9/b5HUcIg8Xcw8Od/KxLKqfELvjMWBIFZEufE5MN8wT5IgxigIAaTpjY3F1k8Fvemg/jakPxfSsJiBtKsROkMK3qcLj9aavVRS+i2hJlX+blVyzJHB6G8bWqDCRUzx/jE4ygXruD2d96zdWs/QpDp0mQEZgBf0Dr2xSdUdxax2Dk2GfW6oLQdLhoF48mBqZGY6lp4J9AC0a9tVVNYJ6Nuq2iO65CmsI4gMw1adA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 13:44:00 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 13:43:59 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 25 Feb 2026 22:41:50 +0900
Subject: [PATCH 3/4] gpu: nova-core: gsp: make `Cmdq` a pinned type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-cmdq-locking-v1-3-bbf6b4156706@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0158.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::9) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: c84fb0e7-74cc-4713-1fb7-08de7473ee02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: s4J0yuLlL4dSyvITSeIIMXd0KpPAZgy7COvJxzNlALs0nyuPGdBjaJsbjX/FOu+VsmCzZlpsvqHh61BiGkG9ANh0en5+J6lTO5JH6jCNHiuvEJ0/Kvsk/VVv0fzlZFy3M+LJE7lPwJtOs5uSMbIL0rJiuB/roP46Die3Gekzl7IT3sn43/B4w6YCZ0lln8JVHCB0JizabX4tZ44p0zQyPrmCXS/YfUTMv0KHT4035eIx/buCa0xM99ZYo84NhfvgrAKro0mPyZ+RYiEbAARNbUsr2SAD7TUb/lCHBn71B0+1GCaodaSN7ShjZ30ZPsosgCkUYENGCjKEu0LLNfseznztHw9AbFawaiqiGKQufOGgifvoCa2zaElRht8ltlf6MPAHJwhLeAKFYy7//MXouOKYw+fLLZCccM9+YSJD53SWglxN1/IWywkgO5xSNV8CDIm6IAwYMYb7396vRmNjKIfbgbv1ksheNyCQN2M+Gua8pLjto39iwyAKvuThwNzDNCyHoXjGV/WWG+C5kQ2oiGoYcn7+b/2cqzmzaDNfAS3FW8nyJQxYi9NuMlwv77pq7LSXb+aIctimWmlYC1WQVvxHFOosQ7rY9Hnj5phDDL7raU29HZdPrnbn9VLWUcs7QnD1OQG/ep6vhCESaaciGqWi5x3YCGl4RJFkBo9SH4w+uRsEEFU5+KJqw1nqiD7teWocvGqlvstJR86WllRQK86vQ5F9A7LyOtzs8CqpOsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1cvc2VEbTU3RjJScWNrMUtyU2xCRkdPaDR3NDUvbXdnR2NjMDdlNFJ4VlBH?=
 =?utf-8?B?RVlxVGFTTysyMnpTdFZ1Wk91Z1A4TkgzQjQyMkJ0d1NJMFEwUEFmbGRFVlF1?=
 =?utf-8?B?ekdoUEVleThyMFBPZldYTSsyZUFqMlRZZ1NpekFYclZLTFZiSSsxdzYwT1dR?=
 =?utf-8?B?ZWFGbU5CanN2cnVVUW10WmhsRWxWT1VhQTNINVVpMmJoV0xKVlBqN2xiMEhU?=
 =?utf-8?B?MnVWVVBSU3pFd3VWQ0hoZ1VSSW1uMjB6N3h6U3ZKNzJWd2lwN0FvaVhldWFO?=
 =?utf-8?B?Y3llOU05WnZhb1BBRTRkb1BVMFpObUtPUlltcU9IUGFYZDMxeWtBN0Y1ZVZP?=
 =?utf-8?B?cVV6aDlTSHdQUS9lK01ZUHNPbURCSGJoL0l1NHY0N3Q2d0VKQkNtQm44Q25L?=
 =?utf-8?B?MzUvUWM3L1ArcWdBSTZoK2FGbXF3ZjhGMjBqYzRRZFdSVFZGd3RrNWY4STdY?=
 =?utf-8?B?U3ZKQk5TZWtQYmxKdVhDcXlFZksrcGE5RXoxQ3FiUGpqRVBQNGEzZWZJSFY1?=
 =?utf-8?B?UjU3VUlJc1NyKzdtVHFJYlFRWGdsWjc0bWNNVyt0N29FSkdZOTlOQU5pTGJW?=
 =?utf-8?B?KzB3QmJ5Q29aaTV3d1BmWksxU1A3VDZKVWJvYmJVTEhJY3BWbGRnU0J0Zzlq?=
 =?utf-8?B?dWtta200SHlqQm8yL0REWEdtZStnTHNBMGFNRkZTd1dZK2V3UGVXVXNGYWx3?=
 =?utf-8?B?ZGVHa0pvNWxEdEUrczM2WThDTXBLRk1DdEZDbjRobWlQMGNmNmwyQnM2TUdu?=
 =?utf-8?B?SFhCeFJFZGVwY24zRjkwQzcyc3gwSFlCdXU1T2tmS0lVcDE2R0lkRmNkS0kz?=
 =?utf-8?B?MWV2TWMzbGtrQWtaNEYySzlGZkJHUE44bTNNU0wyUFV3aTRzNkV4UFYxNlJE?=
 =?utf-8?B?RUxVNldQSEJnQStkUGFZQytWVVE1NkVWMU0zN0lrRCswcU1kYU9DR2IxRFVl?=
 =?utf-8?B?M05aU05lSEZ5SU5GMkZXVTU1WTdnTVVUVThDY1I0VnMvWVVFMllKaTE1bnpG?=
 =?utf-8?B?VmI0bHlHc2NoVERDWlBKckdnOXBFOWladEVRRlVxYk00R2ZYMUloRUJnclY0?=
 =?utf-8?B?YlhnSm1NcGJVNzJtb21xM1pGTlNWbkNZRVZSeTVkZ1BmbFpvTWpnMlFzNUhO?=
 =?utf-8?B?MXhoTzFGdmppVVNLSy9aTlFWV2lXNTF4YWx5ZlN2NDhMV2grellTb0lVaFpu?=
 =?utf-8?B?cjNnYktwMko2OENjSDM2blc2VXhlMjRYY0ZOWFU2UFNtdmtYeEQ1WTJibE1y?=
 =?utf-8?B?ZXFtU1dTS1JOZFYrQ1hYQlNSU1lRYmlGY0N6THUrVU00d3dMNDBjZXVEMWt6?=
 =?utf-8?B?WnBZTDNVRlVNbEI0YmNwSWtWVnYrQ1l4aUVnR2JnbmxhMStkcWxyRks1RTZ0?=
 =?utf-8?B?MUhPVUJDQ3Y1Yml5WDdvMDVmczNTVVZYWXU4WEtMc0Y0VUZ4QXNkc2hQOVBI?=
 =?utf-8?B?ZE9vWXVrWC9HSUNzL2xJS0daRVJtMVlDRzJZWUZXeCtUZkRETEZtd2lGUnlD?=
 =?utf-8?B?NG1wblZHdGFwaDMrUjhhNHhYeDdwdUZQUlp1Z29IWXRhL2JXVXl5eStRQkor?=
 =?utf-8?B?U1RJTzNuRXJ4U1pMY2dxUjBZMTlZdGEvVlh0Tk1tMStGRmoxN0xSaEhZL004?=
 =?utf-8?B?YVhxSjZES0FhUTE3UXFwb1E1eEl5T210RGZMZE0yeHBYNzJjUVlFdlRiMEpv?=
 =?utf-8?B?aWJwVXlBcllHQlhaeHgyZ1cyb1gyM204Slg3RTN6VnhBWnlvT0RaQUxUOU9p?=
 =?utf-8?B?ZmRiU0dsVGtKSU9GbVpVcVRsclFRZlFCa3lYUXlocWdBc29oak5HUWp2MDY2?=
 =?utf-8?B?TVJySStEZSt3T010TmVyQTU4Vmx6SDdpL1RiUnNXWUVzK1BzWERVS0pYV1Rq?=
 =?utf-8?B?c2hpcHdZaGhaS2x0MG1pS3JvVGRGZDZWaU1qUHpZVnF6MlFMdGlRQjVlcUdB?=
 =?utf-8?B?YzRRWDlnTFBveE95YytsdyswaXczcFBudEdpckhLQ2wwV29Kd09mZERCWVJC?=
 =?utf-8?B?ajRwV0J4ODhtVXVkS3p2aVBrZW54di9rYno2dVp6MU1VTWhGeVlRelA2U08y?=
 =?utf-8?B?dksySGhiczJNbmtUY09wNzBoQmJKTU9ZVVhJUjI1RXFRWFlMNlM3eU1KcHNi?=
 =?utf-8?B?NGNQRVVjaGwrYjRFclVmNEpsQkZ2NkpkNUt3K1A0dS9yMTZ0bnpnUk5WTndI?=
 =?utf-8?B?WmJpVkF1RHJBbEdWVnNtM3hiZHM0OEQyQzFxOTFmVlRnUVpOWXdZUXZQYWhl?=
 =?utf-8?B?UnZjUHhrQ0RIVDhTZlJNaU1FVC9vVHo0Y3RZa2QyVjdKL3lWRU1ZNDJmTkl4?=
 =?utf-8?B?TVdVK3dVQVlUVVRraGYxNy9HQXZqVGFZZldvL1ZSMXY3eWk1ZWZFS2ZsaHIr?=
 =?utf-8?Q?Bbx8Tk4q0ckX2yfzuva0FZIYmdR7caa4YHPutveZycHGe?=
X-MS-Exchange-AntiSpam-MessageData-1: uaPs2kXU7dDgBw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84fb0e7-74cc-4713-1fb7-08de7473ee02
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:43:59.9458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwLFNIeRLNNVNzBzkD1Bkcp/y4Zk+rtTvQStStbErwiG9dUKq6xvuu8zu1JrQIqD1XHOqkB/2NrpM78HtdZ3jg==
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
X-Rspamd-Queue-Id: 838A2198508
X-Rspamd-Action: no action

Make `Cmdq` a pinned type. This is needed to use Mutex, which is needed
to add locking to `Cmdq`.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs      | 5 +++--
 drivers/gpu/nova-core/gsp/cmdq.rs | 9 ++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 174feaca0a6b..a6f3918c20b1 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -112,6 +112,7 @@ pub(crate) struct Gsp {
     /// RM log buffer.
     logrm: LogBuffer,
     /// Command queue.
+    #[pin]
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
     rmargs: CoherentAllocation<GspArgumentsPadded>,
@@ -132,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                 loginit: LogBuffer::new(dev)?,
                 logintr: LogBuffer::new(dev)?,
                 logrm: LogBuffer::new(dev)?,
-                cmdq: Cmdq::new(dev)?,
+                cmdq <- Cmdq::new(dev),
                 rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc_coherent(
                     dev,
                     1,
@@ -149,7 +150,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
                     )?;
                     dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
+                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(&cmdq))?;
                     dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
                 },
             }))
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index e1ca1bb9e07d..44c3e960c965 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -474,6 +474,7 @@ pub(crate) fn command_size<M>(command: &M) -> usize
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
 /// area.
+#[pin_data]
 pub(crate) struct Cmdq {
     /// Device this command queue belongs to.
     dev: ARef<device::Device>,
@@ -501,13 +502,11 @@ impl Cmdq {
     pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
 
     /// Creates a new command queue for `dev`.
-    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
-        let gsp_mem = DmaGspMem::new(dev)?;
-
-        Ok(Cmdq {
+    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
+        try_pin_init!(Self {
+            gsp_mem: DmaGspMem::new(dev)?,
             dev: dev.into(),
             seq: 0,
-            gsp_mem,
         })
     }
 

-- 
2.53.0

