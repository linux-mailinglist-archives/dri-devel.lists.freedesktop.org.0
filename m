Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFygLLuAqmkMSwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:22:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ED321C5F7
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA3110E38C;
	Fri,  6 Mar 2026 07:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mzy1td3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010023.outbound.protection.outlook.com
 [52.101.193.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A9E10E390;
 Fri,  6 Mar 2026 07:22:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNLs6gPGSjabq8jETnRCeqLdtFO7z+buO/v/ox1af4wD75H2AlMLvNaZq5Nk7VuqRQT1nYKb5IN22jemW806gmMejC6i/TXGzkRBK8YkMPLCtwHVgZPl71fDFXWSlexVQ7QZBxBLKfPc5Z7bFXNGN8qEOlZBRdxeq0V4mkdng+eLxzBoRQbaz7hKWHPVfattRRSqbED5iifnth2pAg9uFDL+1YtAu/lC8IsCiFv+jsPXD23ePGmPOofwdHTsihF5gFiyP8rl2OpFsK+CkF9Z+OGufH953GiH+gkDElXMdQtM8cIsgcnt6z7MCwQvAIUPq2ZIP6El0pjQ2NY6JamVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VcqYqch5y1E7gwqPzm8XJnkZWMBjcUgsIhQDBnQ8nw=;
 b=TkvrBOK2M3919EldXzfi2m0zVC884FF8znqw+++LYHKFa8QhwSx+HdzzhyiJOvk+RDIebpluvLQ8MDTfllG5cDoIy+ytCFWWhFAf3D3Wk/cBnyZm5gJGEKJnvWADp3r2UNdklmhgmhEc9FazrGYvu6MlM3W85ghGRY8E+WGslH4I7+c5zcwFXljaJ2rNmgju8BC/P0rREr0tE9Jn+9vCLzwyoDOfUeRdrTqQPer6FYjnfP9c+GnT+nRNEX1ljJT7cgFFbBoNz9nm/zVLN7yFFkCcRoAOElKkhJYKCIfXjeecsxWHiIhfZfdx/yItVdsYTedXr72OblgpJthKdBq3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VcqYqch5y1E7gwqPzm8XJnkZWMBjcUgsIhQDBnQ8nw=;
 b=Mzy1td3lS1t23DF/f5nfl4fAbc5IkA2JbI6ZU8DRUHYptY8fvZ/Lw6eF8Zvm34VjoTbaDaQoTcPeBr+CRV3XZXhWG7ZFxznXznM2hDE0+IRmftCEAlPAT6tC+MBHSJcdo3qVpkZ7RHfGlRZx9TrABA3+yS2pBrLZ01Yg8uF7BOUJKJku02jvtacENaQx6oFC7c7yjn5GjbUzenk/A9HKU/5fhq5dfjd3uUpCavK7RNWSTQ6I/KeBq8hO7n6rbrYU3yDbYezp4bmbZsKlecXYHsvHvHXxIPkmQwMGyrZ50+SG+3gEv/EJ592MVL7gtZXc5Y6PaoMNn0ZCWpnijznP/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 07:22:27 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 07:22:27 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 06 Mar 2026 16:22:02 +0900
Subject: [PATCH v6 5/9] gpu: nova-core: gsp: clarify invariant on command queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-cmdq-continuation-v6-5-cc7b629200ee@nvidia.com>
References: <20260306-cmdq-continuation-v6-0-cc7b629200ee@nvidia.com>
In-Reply-To: <20260306-cmdq-continuation-v6-0-cc7b629200ee@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 472b8a8e-25a2-4027-2fce-08de7b511ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: YdW5oz5NiIElm13cnV501w3uuretH07rLHQoQ3seTpB4du2WI+BvEvEZhcdRvKDDnM6lt425j7go0r+w92ow5y9/0QQDI5YdDWexznbo86DdZk6kqKeHapoYaLZG5tPbpBdCxUqhHqZdyfSq3Vbcb0L2Z2LkeQSIRgGXIjUwl7TFQvHAjSL8u4bgVPUVSttwUNgqhJUiG8Rzx2pj9xQOa6JbGj1N4IqTtMRe0YBrbC9jMJChqdn7AEKkMXtcNRF3C+Vgse5mVrjcq7P4lJwqb/U5p0rh9VLZ9lijK4+l2Ak5EThl/mCicaIzqr45QFV+e03JPUe0l7IKGqPpTEAY/KJGX07wReHwnH7xjNJK7SxqeQmWA+I33kI1e2nK6xtBzDM2H1fw8yjMWsRC7SXow9PwNd3jFJqZMDo8pjWRYlx82SxTn34THJlnm8QVIgyRP2LkUeNm2tOBWpMcmbfmpdnEXusLPbxZ4yAaUxaiP5G1U25WrGxdy+NT6dzP/PBaI5V4qGBReYdipW6/8kUfiACN01eas2Q8t6FXU3+NO9uFJGqPqfYJZ/YYK4omZTwy1nXyVQO79Ii7pfQhmezlOX99LCIR6rOVX3EuNBcpKiCWABAOJXInOotPaVspPl/v7WviR8Pbc2LMiVJveiVX7dYxpfDvAwmB7j0OmLeKOFyFPzre+3xesn8mAqBbLL6q0DO88c+hvuWM1su8IxDH07pcNPwPCwLOzNyH0RUfcAdK4HDqnUgqMyIrdV/5XYD/9uGSjjCscALPBNcbiH69yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amtORUV5Zk9XVmdsNFZQRTQ5SHlVUi9mSGZaalBTakdXVCtSU2NPMWZwbG1X?=
 =?utf-8?B?ampqeE11MjVyQllVMHRHVUc2N0FSK3ZyS2diVThldk9Gb0d3dzN3SytzaDdT?=
 =?utf-8?B?Y2VNcWRkZCtOS0NrcTFTL0VRelJ0L0I1c25WTEtnd0FyMGFodkltL3FqVURK?=
 =?utf-8?B?N0t1dWpJOUgwSzRGREg2bzN1d1FMREZ4RGc3T1ZLZlRxV2F3SVp5bXd4ZXlU?=
 =?utf-8?B?VVFJNmtFalJoU294Q1FPYnJnSFllUTVQYnNESkE1cDFNYWtDTlZIYnVPTkVI?=
 =?utf-8?B?MGlmZHRFY2dJWUR2NkNsaXBTNkdSYklMNlRNbndJTzhKM0pZUTk5WHo3TGFl?=
 =?utf-8?B?OFVHbFArYVV3Rk5ZTllJSzFsS2M5YktsT2dmYzh3MjJlRXIzRzNRS3JjM0du?=
 =?utf-8?B?M2JZdk5QVjZ1M2Rnbm4wTlhoVHRhUlgxaitlMWJ2ekwwUE1JWW9yamxwamI3?=
 =?utf-8?B?MHVtbWZzenNWSDdZUjZSc3lzUkpZbnNDUlVuWnZVWldWaEpiNTg1Mnh4MzRJ?=
 =?utf-8?B?Tlk5aC9GYVpmVlR3WWoyU2dVaW04WXljOXkvakJsMVByZmRCbGR0L29neGJr?=
 =?utf-8?B?Y2k2T0E4aG9vQmV1c2RweGczdkVvYTgxUm8zWEp6bjQwUWFMTTlkWkI2dkhU?=
 =?utf-8?B?TG1Ld2FUcUdNTXlwd1M1WDlveHhSa0ZlZVY2bllhME5UUFJXRlhxd1U3Q3Vt?=
 =?utf-8?B?dFUzeHJwKzgwUHJHd0dpWVE2clVpa2JBbW12RWUwMjJ6dDNDbFVhZ1RtL3FO?=
 =?utf-8?B?SGx6TTZlUE1xeFpCc1VUbnFIcVFaS2VUVDFVZmdlZkMwcGRzMGhNQksxcHE3?=
 =?utf-8?B?dGtpczNWdkszL0p6Mzc5ZDlrYzlxaHFpWndaOU5NNTV2UlppZkpWL1ZQVFk1?=
 =?utf-8?B?WmczUVo0aWtoTDNKTytRTGRBUEZpbUNoUEpCdHA0dW0zelZvN3MxdEpWTUFY?=
 =?utf-8?B?RW5hTy9nbjNJM01qUVdNMmRGUzEyRzN2SEIvSjFEcTdLSFlyOWk0WmNNRXBu?=
 =?utf-8?B?end5Nzhvck9hWjN4d1lWOFY3ekhWNFNucWtJY2RUSVVYalhRNlV2aFp5blho?=
 =?utf-8?B?dElYM1g0YVFsSklLV0pKcll2WUJuWUtSZzhTcno0S2JpRE5ReXR4THQzR2pH?=
 =?utf-8?B?NDJ0ZHJiNWsxM2NpMVpvZ1ltSjh6WXVXeHF0RE9ibnJWSU95bjRhWHExVEla?=
 =?utf-8?B?QmNIdVFZZ3crcU41OXA5TWFUdFJrNEduSkRSR0NEZGhIRlpOSnBvY0JnRU1q?=
 =?utf-8?B?QlVwWkhKS3o5S2ZVeW41NmhIWXJiV29xeTgrN2NjM3pteWtHS0NkWnBhU0lZ?=
 =?utf-8?B?Um00SzFpbmt1amsyanZqeGVTSzV4ZG05ZzRpTjJ4SG05UWUvSU5mRENVWVJ5?=
 =?utf-8?B?bk11UEtleTNQdEEvUlQrNHUxdWI2RkYvTzlhaENzT1lkMUtZQXZjRXArc2dO?=
 =?utf-8?B?QlhKVWVUZDFqVlp1VFhodGFQOUdGTDBQZ1c2bDV2bFdzSFdOS200NlkxbUFL?=
 =?utf-8?B?MHI1bE9KS3JIVjVNWGlYRlBlUXpIR1Q4enorZGhtSzFGK01vVkUvSGFacUw3?=
 =?utf-8?B?MU1ZRzZQbDBlMWw2WkZBc3lzUUxGM1dSVGhvbWhBR2FJbWRqeG5VWGlrZlNl?=
 =?utf-8?B?M2xKaC84ZDVzTFpHdFJoNHpjUWZBY3RDMGdRUjJGUDBoM3BxZnI2TmFpUk9w?=
 =?utf-8?B?UllYTktvM3pIMTNydFJMRzNVUDJKZHZoSnFGWmpLbEZ5NVdQNHpaNlJDeFJB?=
 =?utf-8?B?djdBSXZISDZvMjRHWHQ3V2gzQldNRzgzM0VGMS9yV1FDQ3ljMGxLbGJncXR1?=
 =?utf-8?B?MytZNkZzVGozMUN2aDdaNWhQeDVSTGRVajIxL2xJTXJyVDM3QkhVNmRFTEtu?=
 =?utf-8?B?UHV2Qyt4Ry8vaEc1a3cwYmRrUkZPWXgyakREZG52TnlDYXFWMVZrVUgwZm1q?=
 =?utf-8?B?L3pCODQwTlNrbm9GK1NSaWVWZlZHVm1rZWJWdUZ3bjRtQysyR1B2eWRxSmVP?=
 =?utf-8?B?d0hCVlpXZlNZejV3cTRGNGpjS21BZk9WQ3hYRFAwL3R4Qi9RdWUvRGlobEtN?=
 =?utf-8?B?Sm5XcW1vRWdzL1VsL0pnekx4Y2E2NkZFQ29zK2R4T2FYZFM1K2VaUCtDbWZM?=
 =?utf-8?B?MGI2VERxTnIxaWxRZDFkaElOWW13K0dtZHorckdPS0VVamJ3dFI0eWlPbUtG?=
 =?utf-8?B?UEQ0RFNLazVackhKYVp1RzZ4WjByQzJXby94TVRrdVIyYk92WjZFNi82QjJi?=
 =?utf-8?B?VzJZU3h6RzFZNmhjWXNLNGZSbWlZekpKZmZvY09XdWNNL3MwWXZnUFFLSTFQ?=
 =?utf-8?B?a1BpQVJtUU1mUWNNQ1NNOEpZSnppdEtaTlZhSG1ZaFNmUlFFMytaK1BvYnp6?=
 =?utf-8?Q?34rm4kPhNKQv2KMuAoGqO6UTKd7PPRYFzR0fP1CPo3cfJ?=
X-MS-Exchange-AntiSpam-MessageData-1: sa41tqpdzQaLAA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 472b8a8e-25a2-4027-2fce-08de7b511ea1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:22:27.0523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOuUOg7r4SDEs/xiB0DRZNYDZ8d7k/vgzF5ScZNrPmJekLYCRqiUtqhQydzBsxa/m5c6vzDCRsZtjZPcHhZjVA==
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
X-Rspamd-Queue-Id: 32ED321C5F7
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
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

Clarify why using only the first returned slice from allocate_command
for the message headers is okay.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 8b970523d789..806b1e02715e 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -534,7 +534,9 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             .gsp_mem
             .allocate_command(command_size, Self::ALLOCATE_TIMEOUT)?;
 
-        // Extract area for the command itself.
+        // Extract area for the command itself. The GSP message header and the command header
+        // together are guaranteed to fit entirely into a single page, so it's ok to only look
+        // at `dst.contents.0` here.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
         // Fill the header and command in-place.

-- 
2.53.0

