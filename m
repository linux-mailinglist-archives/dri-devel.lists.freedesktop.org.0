Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOTOOKtdqmkVQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:52:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCE121B872
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6339510E327;
	Fri,  6 Mar 2026 04:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="p/7+p5F5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011062.outbound.protection.outlook.com [52.101.62.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CE610E35C;
 Fri,  6 Mar 2026 04:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oD216Ksi/ydSRQJx9qA2rQbIi3BHRtB+ZnriCOeY5Gh2KkxSkJ8kOGXey/87sf+muWkbmXiHMOq69c0OM7FfwQasIwnygLyTCFmNfzwkM3IzYd6crj2KPIaIMYT8ptDmG0oR1elz5Z9tnB8JvbsdN2tZCrmr+2Saej08PdarUIBqEE6zI2mVoJPvCp81dQBchp1HEDK6pDp05vwidY2kHdoesNKeo8yMNY9pDR5wgDeF4LvyLsSQMJxC7bHzgnBLW9iR5bHAhs7/4EB7GKbs70/hSmQRyCZD8HxescXHoJxi8UYWoV3HMCq51UjOQ6mttUklOtjp22wELggxiQdcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7ZijNeUA9rdJ3I+ssKYz0LZTpWul8dTCbTRDhqSIMI=;
 b=kFn5wJV8wtryvQzb0DINBSzTVv7/yinZyWsXbIb3ucbOYMygI7tVJvUtHnTlTQbb6Axc753AKfZ/kDxE3rt6j8G4yKgw1B1lPFrtKVLffTw073IZ8bb0hiUFtyFqEh5QXQ7yZX/wrttE3om6lsXSPQrlcopezBoJsUiGHDLP7OfsLKUBtDykIyliHUb4rMRawkAXwDYeWFedCX297utU219U0xrBZ9eNdysL6a5qbAx95JX9jVrPDF7AYoYKtG2w/zFv7bo7HfAtvX9cTb3d18q3LCgpm4lzBJxtPEytBj7cccblV+YHSBBSuCWyXdGwk70PlO8q604i1AQ8MvHI0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7ZijNeUA9rdJ3I+ssKYz0LZTpWul8dTCbTRDhqSIMI=;
 b=p/7+p5F5/ftwS+exzLRixxm/78bnKAMiThpDIbzpg0KF4RFg8UeBnKHCYNXnNCyTW3AD883nwnb+7gDSz7L8NgBiWpmO2NFU64C42QSsz5W8HvtlfpurYXTlHZYEPF6CcsW5uGTApPu6aczyYI2CHxamkY93O4WhC4fbh71rtUnd8yl1GAlgW/jsISTM+xadX5OrJ6mHMswPwz8AU9G3sD2x3wJqfqnVmiwqg33e34V1N36T3T2ay6NgduzIQ8falTqIOZ/iPFhVT1NDFDuQCvnB52yaEA/80148YdMxbIOZkciaWUf3p/50z3zeM/fSSXZgTlv8mtIaEtpwHCVd4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 04:52:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:52:50 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:38 +0900
Subject: [PATCH v11 01/12] gpu: nova-core: create falcon firmware DMA
 objects lazily
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-1-8f0042c5d026@nvidia.com>
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
X-ClientProxiedBy: TYWP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::17) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 874de52f-31c3-48e7-2daa-08de7b3c37b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: oy7z2vwMpLcYZj3vl+xjtgvtxtH6btARoI+8lRQwzLdsf6LaXucknTKwDgT5TgiaLHDqByW6Jh+dDAvq4kXIa5aD+17mc1qJXGQDOB66kamBNQ+42dEem8xtGb178mDrQ7u2/WDhSLSid+NxEUZIH5Hst1B459hDXm1lq8PXa/45gk15Xqmp/1qMiyYZW/tYSHXKQ2GqCVQJrB9rjTYdk+i4r4Z8fx4zShauajoz3pBmqC0sZVR/ojdaSNHgr4oqRtjf3to6pN0a+NjbnuW4Fc6nCX2qJOGBGLbw89KlT4si9YuN2fz0lqqGb9uiW5RRhGSIhOQY6TEo4CC1jXLvoJ48z7SY8X/CO/mEwficGANfcs0U+QqBnLKM4VR8uoE58HDCCu0IvuPghslVUWuzMF0eQ6dFTK5dBp3lJQAQpZDpPt4NdzLrObKfEEjVQhURuWFJPpbhFxptUY9UtHefFf3dkAm/DRQFmat5SVQS32/J1V0As682U+nTDXF8Lr6G5ceUdIi8eQaK5RwhrOeeRu4s+fjxwk3XHz2Yey3qV5to2px3PLfsckuAdwTuWQNBV7vDJfqp3KLO99h/84xsWdpp8bAVxO9xW4sYyf8X1WYUjj2Uas6uQH+HC4vBj4mFJQKXMCoOgM5k91UI2+VbbfP4UeBp37I7dBtBiB2yh+GRkC7qQx7+Oca/8vGbkaqLdX7BB0MQ3WKDccaLysbZRu7xcm+QtOiwFJNbyzuXRVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGJuQ1RpUjBlQ3ByTVc1MTRNT3dDQmZINnJnMnRoQkJmTTcrWXBmWWFYdFhm?=
 =?utf-8?B?RXUwcGZjSmNrQnhlSGxKMGFmdGFGZllDcUI2K0EzU2hjcTFJTVZQZ3FzaDFa?=
 =?utf-8?B?N2xKcEhST0xZRGNhZ1RQSDF4OUNOQm00SlBha1cwYlFYNzVHelBNb3pYMHdQ?=
 =?utf-8?B?a09YUXp0WVJtZmI5Yk9UQmRQWjVmWUJUY1grb2htOWpiWnFIK1F4cDdCRE9a?=
 =?utf-8?B?VTB2RTgxK0x1NkNCV3k4NWJiUisvT2VSTVJYQjJtWVFwVVR5V0VRbm5JeHZj?=
 =?utf-8?B?dDYvUUZvZVlSNXlncFc2ck1JZExUWjBUK3U1UmFQZW5TU2tPVVE3bGJYRzh5?=
 =?utf-8?B?b3FlZnQ0cjZTNGtsNUVBUndsK25nR0FyYnFLS1JJaDFad3VVOHd4dHhjRXlK?=
 =?utf-8?B?cFZuZTgrZHFaTDlDR3ppazVuYnk3QlJCTzBPY05ONmVJRDhRK0pKdzhEeWdr?=
 =?utf-8?B?bWt3Q21rMnA3TTJtQ3BuUlR1eTc0dHNvUlFtbGtDZFFNTkdtYzU4WjNMOHVr?=
 =?utf-8?B?UGVpZld0aTBLWlZRd2tldHdUL0VQd3BCYUFGaU5UMFpoNHRUdGlrc0pRM09W?=
 =?utf-8?B?bHVVekthQ0xWMGJNcE5HUkFRdHkvZ2VzdGhGclI2MEdTMmdLeFhrQ0NoTGMv?=
 =?utf-8?B?ZGNBRHA1SFRteUxYMktVcEJFWDdMejN1Y1R1aTh0TnlDVlhRZzJ6V2wzR0dG?=
 =?utf-8?B?UUd0ZVVmMjgySG9iRnFDRjBoR3B5cW1OZisvKy9CYmx1ZGpoYW9LQ0ZHY0N2?=
 =?utf-8?B?NTZ6NEozNFV0bjBhSHkzZFlDcCswc2VINUVaNElFbzhWejRpQVVveUZFeU5E?=
 =?utf-8?B?dGdGdnNvek5hZEZ0MitiTlFrVm82c3RPN2VyYUIxQmY1Z0pnY2hNT0VYTUJC?=
 =?utf-8?B?N2JFV1BwYU81VmJGNFRYMG1Ic3pKRVQvOW54MEN3QzZOc0lFM3JxTHI3RmVB?=
 =?utf-8?B?UXJWVTJxWUkzWG9YOHNGeWZwL3JNRlBvcUpmWk9OaUZ4anJhdWd0MWhvb2VD?=
 =?utf-8?B?T3ZSdUpiVzkxV3ZhQ2lZd2poQ1NDb3FtUFlocnpSVjF1M0Rjd1B3dzR2emZE?=
 =?utf-8?B?ekg3RE1qQ0toQ2pRdzM1dVZFb3E5WUh2UmZsbHhyMzhqU3phWEx1QjVKRjBy?=
 =?utf-8?B?VkRyN2dCQkg2SDJlWVp2U3pjc21uNjJ4NDFNZTVVb2ZLNWovRU1mMU9NMnNH?=
 =?utf-8?B?QTVuYmF5SlBneC9qWjZsVkl2YzhNUnZhdHNqSy9SOU9mbkE1S3BGeThVMUdP?=
 =?utf-8?B?K1FHSjZ2N28rKys2TEJrekdkSEQ5Y2dmYkxjSVlUL2Z0bERMZkVWbHNSQ0No?=
 =?utf-8?B?MWlZaExLeCtxQlpLaFFYRWlpNkhKRkpBazBaNnRFZWF5WFlkS1k0L0JlVlJq?=
 =?utf-8?B?eXlobGhUd2NRd3V4ekNpNndyS2VnMkErbGNLMkJMWGNHOXdUUUpaUUdaMkFT?=
 =?utf-8?B?YkExSGpsMC80Zzd5KzllMnJYNmQwbUc3ZDREOVdiNVZlT1BRMGp6cXIvWVZ5?=
 =?utf-8?B?UVlDZHdHZEtVaDZQRVZXbmlLVGNXSGErWVA0QWtsTUJQSmJvVmhRQTE0RThv?=
 =?utf-8?B?V1RvSGFxR3hPMmtQVEhaaW5LSElLWmhhN0kwTHdBRHQzSGF2dmdpRVNibm52?=
 =?utf-8?B?b2tpelpCN3lxTnBjQ0N2TFBxT3ZCbGp2MUxoQ2xkYnBwN3RrSk96U0pZeE9X?=
 =?utf-8?B?c290ZVZNS01hNWVHUkRkZjhWVFo3SVdhZWFzSXgzTnV4aWtHTXJsKzlFQ21J?=
 =?utf-8?B?cWEvVjZiSHUwdDkrbi9yU0prSmNFV0RiaCt1VTE4TW53SS80MDByUFIrMVFT?=
 =?utf-8?B?UXNkVzlJcFB6Vm0yM3c5ZDdRYjE2UEhnZkRmRlZDRnpNVE52Y1hGUHJTdS9D?=
 =?utf-8?B?NHlZb0JoNzFzNVhXVjRRWHhncnlNblVhWVUzc1hjTktRcU10Y1FqRkNFczN1?=
 =?utf-8?B?azh4UENtMmh1TmtBcmxXd21RZ1VKY1YxdzEyWGp5OEVpdzRwSldRUHA0OGJM?=
 =?utf-8?B?bSt2NjRpNU5EUXhMbGhJay9pazdXSXl3dlFpUHQ3ZUthV1ZROTRHbm9ObnI2?=
 =?utf-8?B?NElBU0k1Qkxjclg1eGtYaEVOelZnZzJ2bnoram1DaEZ3SlN3RkQrdW5GSFlT?=
 =?utf-8?B?RTVzZm5COHcxc0FXUmVuVXRoemJYczFHUWZuWFBINGZJV1N1WktkZEtvRTlu?=
 =?utf-8?B?N2hBWTRGYmFXb2xPcnVSNytuVTU1L0lQR3JqOTlEZXloL1dIdWRob2NONXl5?=
 =?utf-8?B?VWRDNXNyVE9XcHA5Tlk5d3lPNk5ZQXd5N2t2WUJ0ejAvL3NKdmJLM0NXWjh1?=
 =?utf-8?B?ZG9JNWZ2WGZVZWxlVlcxb0RZRnVlZXBvVGtDajdXc3oraDQrVEhmcWJ6NXJR?=
 =?utf-8?Q?H1ZplQhTFmpcdaclri7tOs2zZATWNA4WxZoBPKmjweXmS?=
X-MS-Exchange-AntiSpam-MessageData-1: /9bB8rFFm+1j4w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874de52f-31c3-48e7-2daa-08de7b3c37b3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:52:50.3924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCqnm/BuP24RppS5/oU5pSM8h/K/iAuf/21rIJw7dZB76tu64N/i4WyitpR51is/Ua/peI2Rr4vhxyEcdvMv6Q==
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
X-Rspamd-Queue-Id: 5DCE121B872
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

When DMA was the only loading option for falcon firmwares, we decided to
store them in DMA objects as soon as they were loaded from disk and
patch them in-place to avoid having to do an extra copy.

This decision complicates the PIO loading patch considerably, and
actually does not even stand on its own when put into perspective with
the fact that it requires 8 unsafe statements in the code that wouldn't
exist if we stored the firmware into a `KVVec` and copied it into a DMA
object at the last minute.

The cost of the copy is, as can be expected, imperceptible at runtime.
Thus, switch to a lazy DMA object creation model and simplify our code
a bit. This will also have the nice side-effect of being more fit for
PIO loading.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          |  57 +++++++++++------
 drivers/gpu/nova-core/firmware.rs        |  38 ++++++------
 drivers/gpu/nova-core/firmware/booter.rs |  33 +++++-----
 drivers/gpu/nova-core/firmware/fwsec.rs  | 103 +++++++++++--------------------
 drivers/gpu/nova-core/gsp/boot.rs        |   2 +-
 5 files changed, 106 insertions(+), 127 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37bfee1d0949..8d444cf9d55c 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -2,12 +2,13 @@
 
 //! Falcon microprocessor base support
 
-use core::ops::Deref;
-
 use hal::FalconHal;
 
 use kernel::{
-    device,
+    device::{
+        self,
+        Device, //
+    },
     dma::{
         DmaAddress,
         DmaMask, //
@@ -15,9 +16,7 @@
     io::poll::read_poll_timeout,
     prelude::*,
     sync::aref::ARef,
-    time::{
-        Delta, //
-    },
+    time::Delta,
 };
 
 use crate::{
@@ -351,6 +350,9 @@ pub(crate) struct FalconBromParams {
 
 /// Trait for providing load parameters of falcon firmwares.
 pub(crate) trait FalconLoadParams {
+    /// Returns the firmware data as a slice of bytes.
+    fn as_slice(&self) -> &[u8];
+
     /// Returns the load parameters for Secure `IMEM`.
     fn imem_sec_load_params(&self) -> FalconLoadTarget;
 
@@ -370,9 +372,8 @@ pub(crate) trait FalconLoadParams {
 
 /// Trait for a falcon firmware.
 ///
-/// A falcon firmware can be loaded on a given engine, and is presented in the form of a DMA
-/// object.
-pub(crate) trait FalconFirmware: FalconLoadParams + Deref<Target = DmaObject> {
+/// A falcon firmware can be loaded on a given engine.
+pub(crate) trait FalconFirmware: FalconLoadParams {
     /// Engine on which this firmware is to be loaded.
     type Target: FalconEngine;
 }
@@ -415,10 +416,10 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
     /// `target_mem`.
     ///
     /// `sec` is set if the loaded firmware is expected to run in secure mode.
-    fn dma_wr<F: FalconFirmware<Target = E>>(
+    fn dma_wr(
         &self,
         bar: &Bar0,
-        fw: &F,
+        dma_obj: &DmaObject,
         target_mem: FalconMem,
         load_offsets: FalconLoadTarget,
     ) -> Result {
@@ -430,11 +431,11 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
             FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
-                (load_offsets.src_start, fw.dma_handle())
+                (load_offsets.src_start, dma_obj.dma_handle())
             }
             FalconMem::Dmem => (
                 0,
-                fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
+                dma_obj.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
             ),
         };
         if dma_start % DmaAddress::from(DMA_LEN) > 0 {
@@ -466,7 +467,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
                 dev_err!(self.dev, "DMA transfer length overflow\n");
                 return Err(EOVERFLOW);
             }
-            Some(upper_bound) if usize::from_safe_cast(upper_bound) > fw.size() => {
+            Some(upper_bound) if usize::from_safe_cast(upper_bound) > dma_obj.size() => {
                 dev_err!(self.dev, "DMA transfer goes beyond range of DMA object\n");
                 return Err(EINVAL);
             }
@@ -515,7 +516,12 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
     }
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
-    fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+    fn dma_load<F: FalconFirmware<Target = E>>(
+        &self,
+        dev: &Device<device::Bound>,
+        bar: &Bar0,
+        fw: &F,
+    ) -> Result {
         // The Non-Secure section only exists on firmware used by Turing and GA100, and
         // those platforms do not use DMA.
         if fw.imem_ns_load_params().is_some() {
@@ -523,14 +529,22 @@ fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result
             return Err(EINVAL);
         }
 
+        // Create DMA object with firmware content as the source of the DMA engine.
+        let dma_obj = DmaObject::from_data(dev, fw.as_slice())?;
+
         self.dma_reset(bar);
         regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
-        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params())?;
+        self.dma_wr(
+            bar,
+            &dma_obj,
+            FalconMem::ImemSecure,
+            fw.imem_sec_load_params(),
+        )?;
+        self.dma_wr(bar, &dma_obj, FalconMem::Dmem, fw.dmem_load_params())?;
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
 
@@ -641,9 +655,14 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
     }
 
     // Load a firmware image into Falcon memory
-    pub(crate) fn load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+    pub(crate) fn load<F: FalconFirmware<Target = E>>(
+        &self,
+        dev: &Device<device::Bound>,
+        bar: &Bar0,
+        fw: &F,
+    ) -> Result {
         match self.hal.load_method() {
-            LoadMethod::Dma => self.dma_load(bar, fw),
+            LoadMethod::Dma => self.dma_load(dev, bar, fw),
             LoadMethod::Pio => Err(ENOTSUPP),
         }
     }
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 815e8000bf81..09b12ad546c2 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -15,7 +15,6 @@
 };
 
 use crate::{
-    dma::DmaObject,
     falcon::{
         FalconFirmware,
         FalconLoadTarget, //
@@ -292,7 +291,7 @@ impl SignedState for Unsigned {}
 struct Signed;
 impl SignedState for Signed {}
 
-/// A [`DmaObject`] containing a specific microcode ready to be loaded into a falcon.
+/// Microcode to be loaded into a specific falcon.
 ///
 /// This is module-local and meant for sub-modules to use internally.
 ///
@@ -300,34 +299,33 @@ impl SignedState for Signed {}
 /// before it can be loaded (with an exception for development hardware). The
 /// [`Self::patch_signature`] and [`Self::no_patch_signature`] methods are used to transition the
 /// firmware to its [`Signed`] state.
-struct FirmwareDmaObject<F: FalconFirmware, S: SignedState>(DmaObject, PhantomData<(F, S)>);
+struct FirmwareObject<F: FalconFirmware, S: SignedState>(KVVec<u8>, PhantomData<(F, S)>);
 
 /// Trait for signatures to be patched directly into a given firmware.
 ///
 /// This is module-local and meant for sub-modules to use internally.
 trait FirmwareSignature<F: FalconFirmware>: AsRef<[u8]> {}
 
-impl<F: FalconFirmware> FirmwareDmaObject<F, Unsigned> {
-    /// Patches the firmware at offset `sig_base_img` with `signature`.
+impl<F: FalconFirmware> FirmwareObject<F, Unsigned> {
+    /// Patches the firmware at offset `signature_start` with `signature`.
     fn patch_signature<S: FirmwareSignature<F>>(
         mut self,
         signature: &S,
-        sig_base_img: usize,
-    ) -> Result<FirmwareDmaObject<F, Signed>> {
+        signature_start: usize,
+    ) -> Result<FirmwareObject<F, Signed>> {
         let signature_bytes = signature.as_ref();
-        if sig_base_img + signature_bytes.len() > self.0.size() {
-            return Err(EINVAL);
-        }
+        let signature_end = signature_start
+            .checked_add(signature_bytes.len())
+            .ok_or(EOVERFLOW)?;
+        let dst = self
+            .0
+            .get_mut(signature_start..signature_end)
+            .ok_or(EINVAL)?;
 
-        // SAFETY: We are the only user of this object, so there cannot be any race.
-        let dst = unsafe { self.0.start_ptr_mut().add(sig_base_img) };
+        // PANIC: `dst` and `signature_bytes` have the same length.
+        dst.copy_from_slice(signature_bytes);
 
-        // SAFETY: `signature` and `dst` are valid, properly aligned, and do not overlap.
-        unsafe {
-            core::ptr::copy_nonoverlapping(signature_bytes.as_ptr(), dst, signature_bytes.len())
-        };
-
-        Ok(FirmwareDmaObject(self.0, PhantomData))
+        Ok(FirmwareObject(self.0, PhantomData))
     }
 
     /// Mark the firmware as signed without patching it.
@@ -335,8 +333,8 @@ fn patch_signature<S: FirmwareSignature<F>>(
     /// This method is used to explicitly confirm that we do not need to sign the firmware, while
     /// allowing us to continue as if it was. This is typically only needed for development
     /// hardware.
-    fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
-        FirmwareDmaObject(self.0, PhantomData)
+    fn no_patch_signature(self) -> FirmwareObject<F, Signed> {
+        FirmwareObject(self.0, PhantomData)
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index ab374026b1f4..2b7166eaf283 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -4,10 +4,7 @@
 //! running on [`Sec2`], that is used on Turing/Ampere to load the GSP firmware into the GSP falcon
 //! (and optionally unload it through a separate firmware image).
 
-use core::{
-    marker::PhantomData,
-    ops::Deref, //
-};
+use core::marker::PhantomData;
 
 use kernel::{
     device,
@@ -16,7 +13,6 @@
 };
 
 use crate::{
-    dma::DmaObject,
     driver::Bar0,
     falcon::{
         sec2::Sec2,
@@ -28,7 +24,7 @@
     },
     firmware::{
         BinFirmware,
-        FirmwareDmaObject,
+        FirmwareObject,
         FirmwareSignature,
         Signed,
         Unsigned, //
@@ -269,12 +265,15 @@ pub(crate) struct BooterFirmware {
     // BROM falcon parameters.
     brom_params: FalconBromParams,
     // Device-mapped firmware image.
-    ucode: FirmwareDmaObject<Self, Signed>,
+    ucode: FirmwareObject<Self, Signed>,
 }
 
-impl FirmwareDmaObject<BooterFirmware, Unsigned> {
-    fn new_booter(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
-        DmaObject::from_data(dev, data).map(|ucode| Self(ucode, PhantomData))
+impl FirmwareObject<BooterFirmware, Unsigned> {
+    fn new_booter(data: &[u8]) -> Result<Self> {
+        let mut ucode = KVVec::new();
+        ucode.extend_from_slice(data, GFP_KERNEL)?;
+
+        Ok(Self(ucode, PhantomData))
     }
 }
 
@@ -328,7 +327,7 @@ pub(crate) fn new(
         let ucode = bin_fw
             .data()
             .ok_or(EINVAL)
-            .and_then(|data| FirmwareDmaObject::<Self, _>::new_booter(dev, data))?;
+            .and_then(FirmwareObject::<Self, _>::new_booter)?;
 
         let ucode_signed = {
             let mut signatures = hs_fw.signatures_iter()?.peekable();
@@ -400,6 +399,10 @@ pub(crate) fn new(
 }
 
 impl FalconLoadParams for BooterFirmware {
+    fn as_slice(&self) -> &[u8] {
+        self.ucode.0.as_slice()
+    }
+
     fn imem_sec_load_params(&self) -> FalconLoadTarget {
         self.imem_sec_load_target.clone()
     }
@@ -425,14 +428,6 @@ fn boot_addr(&self) -> u32 {
     }
 }
 
-impl Deref for BooterFirmware {
-    type Target = DmaObject;
-
-    fn deref(&self) -> &Self::Target {
-        &self.ucode.0
-    }
-}
-
 impl FalconFirmware for BooterFirmware {
     type Target = Sec2;
 }
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index df3d8de14ca1..7fff3acdaa73 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -10,10 +10,7 @@
 //! - The command to be run, as this firmware can perform several tasks ;
 //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
 
-use core::{
-    marker::PhantomData,
-    ops::Deref, //
-};
+use core::marker::PhantomData;
 
 use kernel::{
     device::{
@@ -28,7 +25,6 @@
 };
 
 use crate::{
-    dma::DmaObject,
     driver::Bar0,
     falcon::{
         gsp::Gsp,
@@ -40,7 +36,7 @@
     },
     firmware::{
         FalconUCodeDesc,
-        FirmwareDmaObject,
+        FirmwareObject,
         FirmwareSignature,
         Signed,
         Unsigned, //
@@ -174,52 +170,21 @@ fn as_ref(&self) -> &[u8] {
 
 impl FirmwareSignature<FwsecFirmware> for Bcrt30Rsa3kSignature {}
 
-/// Reinterpret the area starting from `offset` in `fw` as an instance of `T` (which must implement
-/// [`FromBytes`]) and return a reference to it.
-///
-/// # Safety
-///
-/// * Callers must ensure that the device does not read/write to/from memory while the returned
-///   reference is live.
-/// * Callers must ensure that this call does not race with a write to the same region while
-///   the returned reference is live.
-unsafe fn transmute<T: Sized + FromBytes>(fw: &DmaObject, offset: usize) -> Result<&T> {
-    // SAFETY: The safety requirements of the function guarantee the device won't read
-    // or write to memory while the reference is alive and that this call won't race
-    // with writes to the same memory region.
-    T::from_bytes(unsafe { fw.as_slice(offset, size_of::<T>())? }).ok_or(EINVAL)
-}
-
-/// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
-/// implement [`FromBytes`]) and return a reference to it.
-///
-/// # Safety
-///
-/// * Callers must ensure that the device does not read/write to/from memory while the returned
-///   slice is live.
-/// * Callers must ensure that this call does not race with a read or write to the same region
-///   while the returned slice is live.
-unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
-    fw: &mut DmaObject,
-    offset: usize,
-) -> Result<&mut T> {
-    // SAFETY: The safety requirements of the function guarantee the device won't read
-    // or write to memory while the reference is alive and that this call won't race
-    // with writes or reads to the same memory region.
-    T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
-}
-
 /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
 ///
 /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
 pub(crate) struct FwsecFirmware {
     /// Descriptor of the firmware.
     desc: FalconUCodeDesc,
-    /// GPU-accessible DMA object containing the firmware.
-    ucode: FirmwareDmaObject<Self, Signed>,
+    /// Object containing the firmware binary.
+    ucode: FirmwareObject<Self, Signed>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
+    fn as_slice(&self) -> &[u8] {
+        self.ucode.0.as_slice()
+    }
+
     fn imem_sec_load_params(&self) -> FalconLoadTarget {
         self.desc.imem_sec_load_params()
     }
@@ -245,23 +210,15 @@ fn boot_addr(&self) -> u32 {
     }
 }
 
-impl Deref for FwsecFirmware {
-    type Target = DmaObject;
-
-    fn deref(&self) -> &Self::Target {
-        &self.ucode.0
-    }
-}
-
 impl FalconFirmware for FwsecFirmware {
     type Target = Gsp;
 }
 
-impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
-    fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
+impl FirmwareObject<FwsecFirmware, Unsigned> {
+    fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
         let desc = bios.fwsec_image().header()?;
-        let ucode = bios.fwsec_image().ucode(&desc)?;
-        let mut dma_object = DmaObject::from_data(dev, ucode)?;
+        let mut ucode = KVVec::new();
+        ucode.extend_from_slice(bios.fwsec_image().ucode(&desc)?, GFP_KERNEL)?;
 
         let hdr_offset = desc
             .imem_load_size()
@@ -269,8 +226,11 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             .map(usize::from_safe_cast)
             .ok_or(EINVAL)?;
 
-        // SAFETY: we have exclusive access to `dma_object`.
-        let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
+        let hdr = ucode
+            .get(hdr_offset..)
+            .and_then(FalconAppifHdrV1::from_bytes_prefix)
+            .ok_or(EINVAL)?
+            .0;
 
         if hdr.version != 1 {
             return Err(EINVAL);
@@ -284,8 +244,11 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
                 .and_then(|o| o.checked_add(i.checked_mul(usize::from(hdr.entry_size))?))
                 .ok_or(EINVAL)?;
 
-            // SAFETY: we have exclusive access to `dma_object`.
-            let app: &FalconAppifV1 = unsafe { transmute(&dma_object, entry_offset) }?;
+            let app = ucode
+                .get(entry_offset..)
+                .and_then(FalconAppifV1::from_bytes_prefix)
+                .ok_or(EINVAL)?
+                .0;
 
             if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
                 continue;
@@ -298,9 +261,11 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
                 .map(usize::from_safe_cast)
                 .ok_or(EINVAL)?;
 
-            let dmem_mapper: &mut FalconAppifDmemmapperV3 =
-                // SAFETY: we have exclusive access to `dma_object`.
-                unsafe { transmute_mut(&mut dma_object, dmem_mapper_offset) }?;
+            let dmem_mapper = ucode
+                .get_mut(dmem_mapper_offset..)
+                .and_then(FalconAppifDmemmapperV3::from_bytes_mut_prefix)
+                .ok_or(EINVAL)?
+                .0;
 
             dmem_mapper.init_cmd = match cmd {
                 FwsecCommand::Frts { .. } => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS,
@@ -314,9 +279,11 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
                 .map(usize::from_safe_cast)
                 .ok_or(EINVAL)?;
 
-            let frts_cmd: &mut FrtsCmd =
-                // SAFETY: we have exclusive access to `dma_object`.
-                unsafe { transmute_mut(&mut dma_object, frts_cmd_offset) }?;
+            let frts_cmd = ucode
+                .get_mut(frts_cmd_offset..)
+                .and_then(FrtsCmd::from_bytes_mut_prefix)
+                .ok_or(EINVAL)?
+                .0;
 
             frts_cmd.read_vbios = ReadVbios {
                 ver: 1,
@@ -340,7 +307,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             }
 
             // Return early as we found and patched the DMEMMAPPER region.
-            return Ok(Self(dma_object, PhantomData));
+            return Ok(Self(ucode, PhantomData));
         }
 
         Err(ENOTSUPP)
@@ -357,7 +324,7 @@ pub(crate) fn new(
         bios: &Vbios,
         cmd: FwsecCommand,
     ) -> Result<Self> {
-        let ucode_dma = FirmwareDmaObject::<Self, _>::new_fwsec(dev, bios, cmd)?;
+        let ucode_dma = FirmwareObject::<Self, _>::new_fwsec(bios, cmd)?;
 
         // Patch signature if needed.
         let desc = bios.fwsec_image().header()?;
@@ -429,7 +396,7 @@ pub(crate) fn run(
             .reset(bar)
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
         falcon
-            .load(bar, self)
+            .load(dev, bar, self)
             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
         let (mbox0, _) = falcon
             .boot(bar, Some(0), None)
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c56029f444cb..78957ed8814f 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -178,7 +178,7 @@ pub(crate) fn boot(
         );
 
         sec2_falcon.reset(bar)?;
-        sec2_falcon.load(bar, &booter_loader)?;
+        sec2_falcon.load(dev, bar, &booter_loader)?;
         let wpr_handle = wpr_meta.dma_handle();
         let (mbox0, mbox1) = sec2_falcon.boot(
             bar,

-- 
2.53.0

