Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KqOCqL8nmm+YAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:44:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51971984EA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD9C10E8E6;
	Wed, 25 Feb 2026 13:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VmYPI8dJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013015.outbound.protection.outlook.com
 [40.93.196.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BA710E8D4;
 Wed, 25 Feb 2026 13:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbSBP3W852EG/v4kCpbWvdp82JvHwQn8WRDbKcv/PyWRH7EEMlcAa0dvGxbThoRgWkCmN8nHypGfomuGFzCdXv66VHIDVZjqvdFgGHtNxDpXaanEd/F3FuZ9SINqrfJ2QWB3Vo5vy8Zb3dHMZXPho/SLIOoX4ajPCHOhyvw8KG4hgnJrmPZLBKARs+RpxEkzlnLNjYhZHWG3UPwvXTVk4mv92XXkX0H+ZU7Y5R6LG5aHRDE1crPUZrs60wNtizJXKU8rYpy2wn3ds2zG/c+RBUtFTqmWdJXZkSVF4pJSqxy1q++voy7aYxM/eQ37mk8Gpg7kHMibEIViN2CLXVfMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4RMTh2npgSwSFKt722uNsoeEHMhYnCWEJT0GxdcrEA=;
 b=AUTpB73cA40kBVYlwY823qpvMrfgxTz9WvPxBLIRf0ZsX9gjcgrRZpkJkoNmCTnP42RAevL926fUtkt92bOgTmLunEH6tvTW5Ix8SJfT9DZc1KablroDsoNnFGyb563qD0phhKCXe/chUMiR+1TwyqtMMyU6pp/1r3i9CJOw+FD+QrfDdnUD5qEHjnn/k3Lrj/iopRYjpnslRXBnyUq9+BjdD7lPml4sp1NA/qASCW8qHaE2rwbKUoPuGEMp0UQz0DwPTp2ydkxxCMzVSrsR3Knd54Sk5Ts0EWY1iO2QHekNC9EwIxVG7bxsjzdwLt0+75zwFdzYzOwJdEGbNLDlFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4RMTh2npgSwSFKt722uNsoeEHMhYnCWEJT0GxdcrEA=;
 b=VmYPI8dJcmPKmVDo/oRHxzkKn2wwRrZn7z+2a5JHOzoRdPpKQ3r7RurMJUfQNWcUhxz8V58qa9ClrsmKKMhoWxa5MZZmGZdXrGw0QBY375+FBxKnUUIPCSDuWNfejEW0KKFPLAEUi7+XQGZ+0K9vkr9K8hCErXALslDZe+OsuQQOyAiddQTQv0TLP0vEw6ktKWJpESTs6q3mX4EKMstkC2gM22bIisQJR4UcI8ltEV6PjQQEj14tc5SiLmd3iAYUYDRbHn2BLyNTS2mCWqwDzrFa2AbyR6UjVo2GWTw2iMkPXuIjipxpI5jvsT3WkXNg/r/ngLG8wlyD1e3flcFoyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 13:43:52 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 13:43:52 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 25 Feb 2026 22:41:48 +0900
Subject: [PATCH 1/4] gpu: nova-core: gsp: fix stale doc comments on command
 queue methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-cmdq-locking-v1-1-bbf6b4156706@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd9a8d8-66da-4152-986e-08de7473e98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: SJfyT6CX9Wr/DW6g7i5sKrv8HVIvkaVLeqbXAUOJCZZl8M6LEKeI7RPZ1gZH2JictHtaXgVI6lNTdWK33TV/8vsW2wjkPO7jnzupkPifZmyKsCiC3LzsNBG5KnwWF/lNvD2EqdJwlUgOU53bk6ZHzN8wNmbN28i+bzMCCgkFe3R8WUrOTUG4RQ6lUrbejQR+IO55dtffcpCLiNlfu1YlQDOHNNadCrGUgg8Dw23W0DtQs+tkwzpWpIboPHB5k9tOj82t6VXuVDbN8Dnlh78uf9RfefHBPDRmGZEGZygcvWuDGPPPXWUVH4a7VEfo31MmAj8gQKO2IIeIZMY8KXIQMTdbpWG9/4GtvkMqumLeZaE7K5I05/mh6pdK9HfTi4xbXOfvANdkIY50MDFnucR3i/FWpMZgb93nS6tlax6VvnotP6EPpPgOqQ7cUfsBJhAIOqhsDQs+nf0k7tnY+g3jRuoJpbNcXUbMRQ8yUfv5WPJ4DsYVrgwLXYYsYbgLOpwQLs9tsE7TYGa4WMkkstBa20XfYGqcd6YE4U/mq/Bfz8VlT1Tkkdz+CxlXPbsxqfHPmYaKrcf7ukEu3nmz6AVXxN0H5knum6wPm32buhz0eEMjlGLACLoywxuEWtE8hEh7Cilg0E2EUsLeEom730I0MllAXzpNjVNHXiVHDWiFtP8TiSZ1AlaQbS8XYbYfDOzmCA29NupLwrsEFjPqKjDy+ukwKLRVi9RdRA0Kmt0Suss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZytCbzA4MDJ3Qkxjczd4bTFuTFg2NGE4MlZHZnNJb29malRSc0pEaXVkdU94?=
 =?utf-8?B?RUM4b3NBTnA0eXJ4YmdpZEtJZzhUQW1VNDFBNlJONnljZnRhbTREUkJZSHpv?=
 =?utf-8?B?eWQ3YSttcStnYkwxRGlDanlib0RvYWNSQmlSVTl3cVBuYjNoZlJrckRtcHNt?=
 =?utf-8?B?bGZjZ1h3cWZ6cVVxZlJseWRmb1ZMM3FDSzRMNXNYWmN6Z05BTTN3MWc5Wllk?=
 =?utf-8?B?TGFmeWpsMXVUb0xkWm9oVzFGalM0Y3pjc2JYbmRmRVpxMDRBN1E0TEV2TDdn?=
 =?utf-8?B?TjNXM3Z5Y1krbkRLZ3ExWTc4SkhVdGdvL0hNbWt1YnBpWlZoS0RGZzZLbzlM?=
 =?utf-8?B?S3pGMjFaZmVwaTVweE1YQ0xEYWRLWDVmd0hxRE0yc1l3aGRtYS9PejMzaDZv?=
 =?utf-8?B?T1lYUGFuUEMrUHFoSE05NVZ1YmdpWERBamZ3Y3dxVkNRS0MvUkNndmxIREtq?=
 =?utf-8?B?TnFFSFp2aXU3Z0tNZTJFN1Z3ZDFFTktKNVA3TllRWForUlZiMHcrUXNFQWR1?=
 =?utf-8?B?UFZVbXhVeGx0M1NDbGoyQktYYk1WNFNMSUhsSitTK0dvZmwrWDJ6NEY5WjhS?=
 =?utf-8?B?NEU0WDNPUnNLc1A0Wlk2ZlprclJrLzl2Zm5waFg0NDFBVkZqMDZ2cUZNSW83?=
 =?utf-8?B?aUthVHUrWUNkWkhibHpBZUZzVDN2aWxwTm1xU2FuTzBWOS9PNFJ2UTRMNU04?=
 =?utf-8?B?bG5Mek5tM1RqYXV3SDJ0d2diMnQ1YnZBaXpleVd3UXFaZ3MwZTJldXMzbnRl?=
 =?utf-8?B?bFFTQTFwR25lb1FmY2pUZ3dET1l6MkFWbUMzTm42VGU5L3RQeFA3cUhIaFBa?=
 =?utf-8?B?c0VlT0Q5eG5MaFNFZS9Fb2JLczNscGRVdDZjZDVVYjFqZ3g5Q21PS0dXTmQ5?=
 =?utf-8?B?NmlVektBVmRxMjkzUEp2T3NSZWliVitPUmhUWDdnenBVMi9nRUN4WlgyOXho?=
 =?utf-8?B?b3dmeXljUXRwSWYzKzl3bEUrNk8yNk9PSGUydU5rbmY3dmF6dWMvdFV5cHNt?=
 =?utf-8?B?VkFpTXVaVk9GRm1rQTBzUzVSUHNrNXAwZERPRTJRZGJ0NkJMZHNJdXpNN1Rv?=
 =?utf-8?B?QmxmUXZndVNTMGpMTEZaN0tBMWxRajdzZ256VTUzR1R1NnNnK2hLVjJULzJv?=
 =?utf-8?B?TDlnYmlDa1k3cktYMitPQ20vU3R3K0R4Q1E4bVFqZmRTRGtjTnpUZ1JjS2VV?=
 =?utf-8?B?SW1aVlhaaWhpSXp6aG1ySFlmZlBKZmlqWmJPME1Gb3N5OUxYZ2VaeEJDZ1h5?=
 =?utf-8?B?U2Y3WEx1TlJkUnpGQ0ZTMDBseWRrbFIvQVJ4ZTdMaU14NDJrcXFrbGd0MXRF?=
 =?utf-8?B?d2pBeDNlRXVMMG9lTnEvbDBMc1UrS2wvY0NIeUxGWG1mMHVsZHc2STlUUVc0?=
 =?utf-8?B?WnFoaDAzUW5WcDZ2ME9rWURMcTViay9pSnNGWWNqYWtDQUFWSTFkNnp6UDlW?=
 =?utf-8?B?UTRndHFYbEluakVqcDhSYnpSb2tBa2U5bXd0TGFrcmlXbVZjeXpQeXFPYzhK?=
 =?utf-8?B?NUpDcitVbjdnTzhKTzlPTXNWOTNuY1lVM3lTZThzbktsWjJFL01xdEtOQUdW?=
 =?utf-8?B?akk5S1FBd2VSZWZJN29SR1RpVlk4ald0QUdFZzFBZ1JLcnl6MkhmdW00OWQ1?=
 =?utf-8?B?eGVmT1FvLzJKS05WU3lTRDRVSkNUVjI0OUpGR1BZU29NMkR4MFJzUzJZdVZW?=
 =?utf-8?B?SkY4RyttNE9MamdVanE0Ylc0K0lFMlYwUDErTUlpYU9FSGpyNzJoaWl1Tk1x?=
 =?utf-8?B?R1NXd3hiVTZVaVJQL0xGS2VJbEJYN3hwYkJYN242TUFzVkozd1dPQnlKZjJh?=
 =?utf-8?B?NE0vS0V3Rnc3NFFmQlo3SGhLai9pcENDendNZHlsM1VKTVl2bU81bW1UZElP?=
 =?utf-8?B?N0s5Slh6SjVNUXBLUDZjRy8wRTlnVUtQY09BQTR3TFd4RzBpTGxiTnZiMVFa?=
 =?utf-8?B?SU84aWxoSTRjS3RLcDliVnF1dk9Qb29obE84Si95SlI5eXowUGVhWmxnV2pq?=
 =?utf-8?B?NmR5eFppbXRpczdQanVoeStMU1FtUVVldHRxamVubXkwTlVUR0RxSlBiWDJs?=
 =?utf-8?B?dnNDa0RPZ29oUVd1OW9RalIvQk5WWGIzbEdrQUtudnp0MEFGSUJERitUdThP?=
 =?utf-8?B?VUlsYlVFeGdkbUVrN0pTbURIb1Yyd1A5WFJNeUNhVnczZDhFVGF2RFBlbURY?=
 =?utf-8?B?Vm9NTzlEbzFCSXhEeVJHdGpVVVZJaDgzVi83TlFmVnNOeEJUcVdBSHFhbDZ5?=
 =?utf-8?B?QS9tMWxxL0srSUFUb0NIOGVabkdROHRFdmZUTzl5TDFwM1dGaGtQWERCM05l?=
 =?utf-8?B?TitSL2E0UDg4VmVDeVVRQVkwNVYrQzk4NDRVcDhIL2F2QzRBcHg3eEJXMHhO?=
 =?utf-8?Q?zBl3TcQP6ymiiKg83qexh74beloYYxHbcvwv5gRjwV1NI?=
X-MS-Exchange-AntiSpam-MessageData-1: SzQe2hGrksoQYA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd9a8d8-66da-4152-986e-08de7473e98d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:43:52.2585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijsn5RfNsBTxopCkMLCfhVDkp/tFxZu78iSNPg1hPQ1SLJOQQbu+RacgwM9n92r3TYgwbu/ONPgBh8RjH3p+IQ==
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
X-Rspamd-Queue-Id: C51971984EA
X-Rspamd-Action: no action

Fix some inaccuracies / old doc comments.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 436d1ff20705..cfae5b35adec 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -528,6 +528,7 @@ fn notify_gsp(bar: &Bar0) {
     ///
     /// # Errors
     ///
+    /// - `EMSGSIZE` if the command exceeds the maximum queue element size.
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
@@ -710,22 +711,20 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
     /// Receive a message from the GSP.
     ///
-    /// `init` is a closure tasked with processing the message. It receives a reference to the
-    /// message in the message queue, and a [`SBufferIter`] pointing to its variable-length
-    /// payload, if any.
+    /// The expected message type is specified using the `M` generic parameter. If the pending
+    /// message has a different function code, `ERANGE` is returned and the message is consumed.
     ///
-    /// The expected message is specified using the `M` generic parameter. If the pending message
-    /// is different, `EAGAIN` is returned and the unexpected message is dropped.
-    ///
-    /// This design is by no means final, but it is simple and will let us go through GSP
-    /// initialization.
+    /// The read pointer is always advanced past the message, regardless of whether it matched.
     ///
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
     ///   message queue.
-    /// - `EINVAL` if the function of the message was unrecognized.
+    /// - `EINVAL` if the function code of the message was not recognized.
+    /// - `ERANGE` if the message had a recognized but non-matching function code.
+    ///
+    /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.

-- 
2.53.0

