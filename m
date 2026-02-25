Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAKjJaX8nmm+YAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:44:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B561984F9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4282E10E8F0;
	Wed, 25 Feb 2026 13:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sUJ4DHTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010025.outbound.protection.outlook.com
 [40.93.198.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F2A10E8E8;
 Wed, 25 Feb 2026 13:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxH8CI1hiNOqoRKpbQfQS26ImpjFnYGKKIBzniGSZbw2OO6W2vpMsium5a9nFTkDG268oTSuM7M2Ww3dEdddAvk4Sw5pdmk2Ug0ae6Rs7MtAoUhrQEdJGLpVMU1K9Z7wYD9FOf+hRD/m0vE76AZZHCi5DePts+XEO4Y3iV9XpdX7KkeHmHPii1s5RAqAuC5YLCVxOpbSspgYnJyJ+fGmTTUvzZqObe3en0D3mFZJNP+O1FUw+ex/oiLNqPALr50ulypBguuNIixo1h3FgCQ/pu74CAMWwhx6g7gGYHTYsSI4ggs5vl5UYJxoVXtK2MHGQF4XSW7wQcJmCSU00AMWAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLs2cafLoTB4emoHAYE6jb6dqH4Sg669159GmpZI/rA=;
 b=M+hjaVJHts9lel61mxB4BuMITAu6e7rwb+QZiNHwmBcDxaI4k6X5xR3wf1IRWQUW7ZlW3xXvwHiAY7pgRZluGwHLdS4h5uRed3CTU/o1H/kdD2PewnNg1xxxpXkqXhPv2ICIgDjHK/1/73kZJP3uAMYSJ9rjr1404YGAvdngEBnlMggTV+MFqOgFHRs78n2O2cwg5FYjygYRBMvwC6CYSs47bkU9r5FyhYk4N8iHRU6YQEqWVsvgIVDbv6X4sqJrERhEIe7W99s1yP6WOkyJ8sHsdXfrA946ex/LHAXjOoP0XajQI2p4ezpS2SzIAaI8qEM9HFPEgLJM4Bsb15Kxkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLs2cafLoTB4emoHAYE6jb6dqH4Sg669159GmpZI/rA=;
 b=sUJ4DHTcQs5DR5ttQVlFU6iBK2a7FE5fhtT7sF2k8irRbULTk4FxVBblPLzk5KmH2beGptZcna7T5Ky2oR1iHNCY6YcDLtoyUl1YmDRD8l7zRHFLuMT+PmoVfsXpkuvKlPxLAN/2dA/5SeyAfmQ4JdZHUK4SLCa12EMPV8pJrdXgG/8zOmf5UalRQLzYHLxOnr7U3FRGzp0glnuJqCvdcPTHDBfd/IDPHn6DrVHueM+9EFImwZ+64AeR3riUi9Em0DeOYPL6N6GPuq7y99QjUjRHB8+2IklXLRwgCd/shNkSwD8iHQMTyPDyU3wV8Eb3tDaYagGzdYnqFuA10GRgDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 13:43:55 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 13:43:55 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 25 Feb 2026 22:41:49 +0900
Subject: [PATCH 2/4] gpu: nova-core: gsp: add sync and async command queue
 API to `Cmdq`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-cmdq-locking-v1-2-bbf6b4156706@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:1::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: 86116302-cd52-49bf-f586-08de7473eb96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: JoxplmucSjHGogflFVfAOBv/Fqx/LF+Wy2MQNapiy28mS9rRNpcaQ4NGN9Mrju1rzaWaRDjn1rg075SnGKqY9+yEAh9AMmXZRtnEqnt3XpYZABZnOUWaI/Ug/suCHPmGftbhEjAjfk6WKNCJ/3E0ybTvfXeIQ9+IM/Oa3Ybte6GkCpp76RGxFLhiCdQ8tMXEhwP0/z1p4se6q3fhaRtUpkQiJ4vOQc+L330JVbp8JMyg/SIRqYwP4DH/9F9xBhg7BFttBKlq6pCFerrI/Q9sVSZ/Rz28CJ4hDr+Ts7XROPsdzN56H9ESHSvUHZ/Ub6I9r0kceOGQ9vm/C1RhvBh3CTZom8eYSEZMsaIxUC8Jyna4mKiQyrP565LVe1Tit2MeHs/Matv0nr13DjTK8J8EZxVbbYTcpc/ZncvLnX4Q3uMkkcGhERX38RK55Yg1dz4GHRDfawE2c137B9yzLQPNt0adFly35ZRsyNW0YdtubCOudQh7gT1HoXLQZ1kEs09KREtBlz/fh0QGEOthJ9293ujXda9UyA+jLoCWOAS6YzWuPZ8VT1B3rXoXJVv3h9cH230vbLMN5FMCqoCxcFX1zfRQU/I/6nkq4QumnzpQEJNho5iUwSsuws/27nQiVfaqH42KexymuXUp0nE7s0CQJJVoR8gd7ccwHsr36zMQ63OxcR7KodeD6pNyPKlo6CkTkVovB8JUC4pLAQSRPrs6Mh2s44INYaPt4NF/OhYbVc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVR6T1Bta1BndHV5djM5dEFTY3Jlcm9MY1RxVFFYb2FyZ2VDU05xN01BN21N?=
 =?utf-8?B?YXdubXlQdGl3YlV6cHZ2YVZTMWVWT3RjNG8xZGVEbEFnTVJidEczWnpnZzA2?=
 =?utf-8?B?ejRrcHNiUU9uR21jaURnN2h6dEpHTnU2YWZDaEZxNVVrbE11ZnMzcFpocSt2?=
 =?utf-8?B?WjREYklNUDQ1OHpXWlFib1ZRYUxpYTZqQ2pFMjNtVkQyODVkWmpVbWlwenZX?=
 =?utf-8?B?M1ZtUm9DTkUzSDNZbnBxTzlnN3h5cUowcWwxRHMrTXlWaDR1QWcxQ2ZGdC9o?=
 =?utf-8?B?cUxRdmVLRzR3VlBiSWx0b2UvQ0c3QzYrYk5qYjBpN3RreWYwcFk5RzdjamFt?=
 =?utf-8?B?ckpTU3Ezak9kaitZMVNrNkx3T2VqaHBFLzdoZVBHbWJXQWN5NXNiZkowQ0hC?=
 =?utf-8?B?cXFSUUpVUnV5VllzYmNCMnhkc1BONGxOOTFQUzNqUisvVDF0SDJwaVBMcHls?=
 =?utf-8?B?RjErQWhUQjJUa2pGTXVjbE5sUjA2K3RhZm41R1p5Q00vdER6U2phZjZrL1ov?=
 =?utf-8?B?V1FMWFA0cExFZWxBTnQ3TzhnUFgzNzh3eklKa0E4M3ZsRmwzSGFSSW01YVZk?=
 =?utf-8?B?NkZkVjhXZWNuOWs5NktTSExOc1dpMVI2Z01TZkQ0MzcvbkQ1dFAzS3F6QlVX?=
 =?utf-8?B?NFJkdldKVkNXRXFCMzNqbGZOc0l4R2Znc05Vb1VJbVR3dGdlaER0QldsMU1y?=
 =?utf-8?B?UTN0SkovVHdjSFBCZW1Rcm85alpjeGpYVHZCVWxqQ3MrV1dhMVFiRDFtWUpB?=
 =?utf-8?B?dFhCZWNZRG5iQkx4SXF2b0JCSzJuV09LY1M0bE05RWkyOTZTVFJ5VUtEbGlq?=
 =?utf-8?B?QTB1NGhxa2YwdnQrSzlZN05OU3loT0xjUXdxQnRwcG8rL3dSMVhVTGdYbG0z?=
 =?utf-8?B?c3U3NFpheUFVS0V2VkFzY3o2VnhSekFaeHY1SkZPWVVQTkVFM0xyNGlBck1t?=
 =?utf-8?B?bHY3Z0lZTjltbUtxKzVJK0FkaHEzWkU4a2xnN3ZYWWNkNnlaQ3c1ZU4yQ29I?=
 =?utf-8?B?czRlSHBONXVIVTE3bXhON3BVREU2N2lDK3dqM203MFByUHk5dFh5VXFYRHZI?=
 =?utf-8?B?VUlCbzZPWXVXMzNSTFVUYnVTdDhWaTlJZVdqbmZ4a1VGWFFNaDlvUnVQWitP?=
 =?utf-8?B?VkRiZEY0MGhSUWZhaGs4Q0xZQlVkYVVpQ2FIRWI5ck53dlcxSEFKK1N6VVBH?=
 =?utf-8?B?V0pKV1dwZ01VbStGT1liOG03d2p0ZFkwcUFIVXkwMVZUUDQyQXAyRWdiVEgr?=
 =?utf-8?B?T2JZamxrQS9xd0hsR25nUDRUd0JSc21Ba0lVR2ZnZVRjUWNuOUhyUHF1VFlo?=
 =?utf-8?B?VUU3MVJVV1czWWFGY0hvbE01SkhBREQ0aGxKZk5ZVTF0U1JGVDJ3ZDc3bDdG?=
 =?utf-8?B?R1JyT01nY3B1bVFtR2dNRGdYOFZGclBoZS9ZaldadHhMUm0xTzRPZmVKSlhu?=
 =?utf-8?B?enlZTlVjUTlsMEN2QTQ5YndSYStnb3pXWlBJUUVQV0YzaHR0eDNIM0pGdzJ6?=
 =?utf-8?B?aTk2OFU3dkNzSzNPdmtURWxIWUVBMnhnWU5ialZxOEZwa1BHOXlYSTFwNEpq?=
 =?utf-8?B?TndZcU50T21YZjdEblZEek83d3RqOG82NE41YUc1L2k1MitVQVkvL1hvdzRO?=
 =?utf-8?B?RUJzVXVmY2RhNUIyQm8vZFBCb3V2TmV5OHY3SWk2SWlzQnNmZVlPTGlrcmtl?=
 =?utf-8?B?TEVjdXBMaHlCbFVyd0pVeFkvTHdOYyt1S3R5Qnh5NUtrSWhpTkVUN1hBOVFi?=
 =?utf-8?B?VzlPUFhoblQ0WmRIWWRPb2wxbC9RZGMxa2MwZHozMCtETVk1LzZvVUN6TGFL?=
 =?utf-8?B?L2NIQjdtSE1XWTdkU0NyaFJUTWM3RzkzczRIWkVpYi9NS2VIdWVicWFlbzVi?=
 =?utf-8?B?R0I1YVlNYS9SR1Ezd05kVzZ6bmw5S3BIMjE2bDhMVytKRHVxOS9lWXAwYTJH?=
 =?utf-8?B?TzlUWGVUbldseFlpMVpldFV1Q1Z1c2ZXOTljRWJsaFRTL0FqTUlLSFpyVXJj?=
 =?utf-8?B?SEFIWjdrTDZSdW4yeHZpaHBKck1JRjNHZHZNaWJXdE9KcXBHZHFuYzhHNHJS?=
 =?utf-8?B?MGQ0ZVl4eDFrOTBDM1Z2NlE4djhBam9ReHEyNkRMSGYrV3lSQzBvNjlUVmRZ?=
 =?utf-8?B?bFZCbW1ZMUVsT0tZQng0aXpoSGIxUUN2NUkzclFNWkMwVTcyTDhwcHM2ZTdL?=
 =?utf-8?B?VXByVEdObTVxNlIvWXJVWk9Xb1BJd1U3Q3pUSTNGWVRGdGM0YWUwVmNycEhs?=
 =?utf-8?B?cnhMb2tyditMM2RvU3I0WXN6OFp5ZkM5YXhoT2oraXdIZ3pPWXh3dkd1TzFo?=
 =?utf-8?B?SHEwMFdndEZqZGRCMmhmK3AxeldMT1pPbmJLbFoyWW5EQ1VPRTltWk9BbHhu?=
 =?utf-8?Q?U70hjtOpIdymkwIJmfZPrei2ooZC5NjXa8DrdovNLNcHI?=
X-MS-Exchange-AntiSpam-MessageData-1: i+cbOWnjqreB9Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86116302-cd52-49bf-f586-08de7473eb96
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:43:55.8101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBIaMg+O8HY2p65gIglSbveNgz6Vu2l05qgwjJpO01fl5eO0o7s98733lRVVXnTwNS7h5tYLZCelB4f6sZbBhg==
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
X-Rspamd-Queue-Id: 33B561984F9
X-Rspamd-Action: no action

Add sync and async command queue API and the type infrastructure to know
what reply is expected from each `CommandToGsp`.

Use a marker type `NoReply` which does not implement `MessageFromGsp` to
mark async commands which don't expect a response.

This prepares for adding locking to the queue.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs     |  5 ++--
 drivers/gpu/nova-core/gsp/cmdq.rs     | 54 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/commands.rs | 19 ++++++------
 3 files changed, 65 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index be427fe26a58..1cb21da855b9 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -160,8 +160,9 @@ pub(crate) fn boot(
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+            .send_async_command(bar, commands::SetSystemInfo::new(pdev))?;
+        self.cmdq
+            .send_async_command(bar, commands::SetRegistry::new())?;
 
         gsp_falcon.reset(bar)?;
         let libos_handle = self.libos.dma_handle();
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index cfae5b35adec..e1ca1bb9e07d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -48,6 +48,10 @@
     sbuffer::SBufferIter, //
 };
 
+/// Marker type representing the absence of a reply for a command. This does not implement
+/// `MessageFromGsp`.
+pub(crate) struct NoReply;
+
 /// Trait implemented by types representing a command to send to the GSP.
 ///
 /// The main purpose of this trait is to provide [`Cmdq::send_command`] with the information it
@@ -66,6 +70,9 @@ pub(crate) trait CommandToGsp {
     /// Type generated by [`CommandToGsp::init`], to be written into the command queue buffer.
     type Command: FromBytes + AsBytes;
 
+    /// Type of the reply expected from the GSP, or [`NoReply`] for async commands.
+    type Reply;
+
     /// Error type returned by [`CommandToGsp::init`].
     type InitError;
 
@@ -604,7 +611,7 @@ fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         Error: From<M::InitError>,
@@ -626,6 +633,51 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         Ok(())
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
+    pub(crate) fn send_sync_command<M>(&mut self, bar: &Bar0, command: M) -> Result<M::Reply>
+    where
+        M: CommandToGsp,
+        M::Reply: MessageFromGsp,
+        Error: From<M::InitError>,
+        Error: From<<M::Reply as MessageFromGsp>::InitError>,
+    {
+        self.send_command(bar, command)?;
+
+        loop {
+            match self.receive_msg::<M::Reply>(Delta::from_secs(10)) {
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
+    pub(crate) fn send_async_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp<Reply = NoReply>,
+        Error: From<M::InitError>,
+    {
+        self.send_command(bar, command)
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 1683ebb4c685..b42e32dcc55c 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -26,7 +26,8 @@
             command_size,
             Cmdq,
             CommandToGsp,
-            MessageFromGsp, //
+            MessageFromGsp,
+            NoReply, //
         },
         fw::{
             commands::*,
@@ -53,6 +54,7 @@ pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
 impl<'a> CommandToGsp for SetSystemInfo<'a> {
     const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
     type Command = GspSetSystemInfo;
+    type Reply = NoReply;
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -104,6 +106,7 @@ pub(crate) fn new() -> Self {
 impl CommandToGsp for SetRegistry {
     const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
     type Command = PackedRegistryTable;
+    type Reply = NoReply;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -183,6 +186,7 @@ pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq) -> Result {
 impl CommandToGsp for GetGspStaticInfo {
     const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
     type Command = GspStaticConfigInfo;
+    type Reply = GetGspStaticInfoReply;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -236,15 +240,7 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
 pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
-    cmdq.send_command(bar, GetGspStaticInfo)?;
-
-    loop {
-        match cmdq.receive_msg::<GetGspStaticInfoReply>(Delta::from_secs(5)) {
-            Ok(info) => return Ok(info),
-            Err(ERANGE) => continue,
-            Err(e) => return Err(e),
-        }
-    }
+    cmdq.send_sync_command(bar, GetGspStaticInfo)
 }
 
 /// The `ContinuationRecord` command.
@@ -262,6 +258,7 @@ pub(crate) fn new(data: &'a [u8]) -> Self {
 impl<'a> CommandToGsp for ContinuationRecord<'a> {
     const FUNCTION: MsgFunction = MsgFunction::ContinuationRecord;
     type Command = ();
+    type Reply = NoReply;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -354,6 +351,7 @@ pub(crate) enum SplitCommand<'a, C: CommandToGsp> {
 impl<'a, C: CommandToGsp> CommandToGsp for SplitCommand<'a, C> {
     const FUNCTION: MsgFunction = C::FUNCTION;
     type Command = C::Command;
+    type Reply = C::Reply;
     type InitError = C::InitError;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -410,6 +408,7 @@ fn new(len: usize) -> Result<Self> {
     impl CommandToGsp for TestPayload {
         const FUNCTION: MsgFunction = MsgFunction::Nop;
         type Command = ();
+        type Reply = NoReply;
         type InitError = Infallible;
 
         fn init(&self) -> impl Init<Self::Command, Self::InitError> {

-- 
2.53.0

