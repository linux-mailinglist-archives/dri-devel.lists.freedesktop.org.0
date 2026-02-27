Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA8dGkqPoWlMuQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:34:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E051B724B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3F310EB61;
	Fri, 27 Feb 2026 12:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QOWqds3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012013.outbound.protection.outlook.com
 [40.107.200.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123D410EB27;
 Fri, 27 Feb 2026 12:34:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aG+oZ4Ojlar8/UvUwrIJdQTHLItbS+1vs0OdBw9md+PLa4sE0CIpg3C0Es3iT7RJtUcyUqB0Vryr38Q4JazZoM/sr1QdbyN3PFARIYJiVJyWWCOxX2zNbhHdHIiggZ3i55Jwy2Q/dItkSGVTQkysozknMM2B9mIOKKCuqTzar2JKe0gmJzImkpmo9I1Yx3WtJGhI+DT2hqA2brU1lwr/ybB742BUDHf2GJu5iRDv5L1IeaO9M5jAUriFCaeAovtkNSD54cYOv//8K2ZiaPDCdBfMtDU/tdiM12+IycIt9kjT+ROrTCcPFAAnmqfI/eTXqkWUzxeU0n8TooSgJJx0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUgOf8gqaS9MBp+1f3yf85jucr5csgO7u62YmDFwvxk=;
 b=T58apS0dZ5YEjlmv5AiEe4MfgxoL81NVC2pMThQwO7LIHT9174/hUlaZREWsPTcw0Zt/7vS1F8Xv7M7L08NnZdn1DZA+UxlYzbMRcWkPPAlwGgOKxCmytTwuiXTEo71Xc5l8DaGxE06zai91BP2WULuWzfa7vY6ltxIBLJUkCFloYZkKt6exbHF0HYX1uTnwQSplfaImULtGExJ46K7TmnqkpJTn+csg0PxdZq9sBxgSFRJOtVhOHtxEF1gDMm4UKBONF/HKJo382VXooATKWCWepsFlBHjZP5RMtdh5qMGWG22q5TqnCeUe1AiYRmT98FJk4xbIUkoAxTPTjznzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUgOf8gqaS9MBp+1f3yf85jucr5csgO7u62YmDFwvxk=;
 b=QOWqds3KCcT3FRPDfYnQAZ4U71pYqkneLI8kXtfjBBRTrmJYh50bcnbTuqneey7nJntyOaYS0xQb4IymF4zaKnaWChpn3jadZPCkCFZnX5dkFi/Db2WnhyH00xvOsV9YSMrwnzwqAELoraqW2MoVMM7thReu5uyyM3tzTODXTkQKyrOD+kgcGoxfLoRmneyW+CsAnpZXNGuC558DL/rY8tc3uhIUe1m4SN9eQyhxRiKsmMN9bAY5K/i7c30IcEi95y+elWkQccP0V4ADjgapslWeyN6YBmNIDGpjSC60R/wLZFcouVxT6v8W6wuOC+k+dr50cU5khrCrzilffuZn3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:33:18 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 12:33:18 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 27 Feb 2026 21:32:14 +0900
Subject: [PATCH 9/9] gpu: nova-core: gsp: add CeGetFaultMethodBufferSize RM
 control command
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-rmcontrol-v1-9-86648e4869f9@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
In-Reply-To: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: BY3PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:217::31) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d15318c-400d-4361-d45d-08de75fc62d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 6upAkhLLljRrRImE8N8YZxcpVESJYuUZdPyzo5pGDdoLfOwpOOxagH8OUjiykPYxTeFgaJtetLZi83DRRqLE4ykrTF4Nxs6LCJxcbp0OSgvRTTrznjLur2OoO4iNOSo5fuvOOaMGrow8E6u9Uf89TEPKdivBFpHXT582P9EIYyOcOa6wSRA+7oyYhZL4XOh8DIjR1aC3SinLl+7WVPBy9d3MPsyWTIEnHe2r5lUQbJXj2HTa3u/ZEKLd9oD/OzJ+KQC6jvIk5kzL8DmA5PMzcsGcz7DGekmE+d+BPtSxS0Y3mImvvxxGfH5sAFiDXaw3ih7f9ZSjlqwcDolZ+pM4zfv0pzvQ1NqqOvGG1Khjo8rExzcraFTgk7MXzuLzBQoL+P+qGqIh0J5z2IvBNt1NT8j/nfRPkHJGNNtkF41yPfBxmvDqGCx1bgThofrxZQeYV6KS9XRmNbprY0y8zt4yPKNIu1b3+NNExlYlAG1nB5sM8Eiab9NWr/nTsj/xC/lu2aYXG4QaklEJOYwM5o2Gkjtetx2K6klkavk669L94r8KLs/fV/l14J7JYdMS8S9NTpyaJI9y9Wru2UV8UtW11eTunC7+mzeObr/8A8RMV6cLJ8Qdf+s8MZsTzQ1FNTxYfyNe9ODQDKiWVLuGhOvcLhioWhDQp9wqFuKzULZjLJk94ye06Zx24RXKmWOqOj8mKEFFH4VoM6OMcCw2z8AGVJlEqy7bZa6yz2KPKkCQSaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXFrcXJ6OE81a2JGcEVCYXB5Tk1saTVXdVZTaGYzbXFCeGt6akhkWnZRdDFi?=
 =?utf-8?B?M3paYVZnZ0FjcTdrNGE0SXV6QkVqT0NjVmxHKzFka21lNHpBU296eVQ2T0JU?=
 =?utf-8?B?bTg4d25TNVZwYmIwOEpGQktoTVp5WjZjTFV2OGc3MktIK3VXb3J1WlUzYTVV?=
 =?utf-8?B?VldhR3hXckFRZlRiQTVYaXZnSGtyemdNSkNPYitZVFV1dEJLVkZUU1FRZkhy?=
 =?utf-8?B?SHRBV1poaHBOYW5JcTJ6VTRpQWt1YnN5VVFGNExaM0hjcnBwSktteXhFT3pa?=
 =?utf-8?B?NGI3RXdZQUhqeGd3Y3JSRzhjTisrSFAxNGVUTzFHc3J4RndJZjFTUEpTYU1u?=
 =?utf-8?B?bWEvcE1XcWtONDlVcjRmazZTVXRkcktuOWl1bWR3eFVXRnJaVXBHcU8vb202?=
 =?utf-8?B?TFE5RlFtWm1JL0VEaXBOSktERWJEY2lyVlNhMm55d1lmSHdaUDJocjByMjhU?=
 =?utf-8?B?MGJ2RG5nUVQ2SUJpVDdoQ25JR2ZGbnY0aDNTeHBMV0lZSG5oa1FVMUM5cWhh?=
 =?utf-8?B?b1h6QjBKeDliTmRsUVZTdXlqRllqeDJrYXdURXYvNDBUd0xCajExcGlNWnUr?=
 =?utf-8?B?anEwVWNrRU15cTc4MWVYZlJTNTBmYk92Wm0ydzF6N2ZsakxDMU5OZmtwbGZM?=
 =?utf-8?B?WmdLRUkvem9rN0J5MC9QWHQ5elZBUDV1OXJnYnNWclgrSXdzT3Z0RTZtclZX?=
 =?utf-8?B?SDBITEhJcXRYYkJ0Z0Vtc1VkbnVzeHh4em4yUlAxL0hWekR4elgxbkFlbHdq?=
 =?utf-8?B?YzFINFZKOHllWXh4VmJoa0k4S0IrcVBZcG1hb1p5RkJlb0U3TE5SQlROWnJy?=
 =?utf-8?B?Q0I1QjR0elNxYTEzVy9LdjVvMVBrQm1pVERWRHlEMktUdEJvckRlYjBkQWht?=
 =?utf-8?B?RTY3WU1sb0JMOU1YVWxkWDlXcWNONzA3U3dxcm16bmtxb091aFo4TzROSitn?=
 =?utf-8?B?MzY0dE11VlRuZ0RHSE9XdkU1b1BmdFE4K2lwVEdwbjJxQmhvWkpUajhISjBl?=
 =?utf-8?B?UDhEV3pZaHZIZ0dGaHZ1S2R5UkRMTWlPaVp5SFlvbGxER2lxeUtBVVZwKzNT?=
 =?utf-8?B?cmFkRXJodTdSWEQ4NjlSS1F5VktvcFZjNHdJdExRU2lydUtwV3pid0hQeGVW?=
 =?utf-8?B?VzA1ZDhRWnNPYVAwVmdsK1AzWTgzTkhrVXEvbmw5NmU5MmJJZjFjSXdlaVhk?=
 =?utf-8?B?ZW91cm56WHN3MmdRYUJMQy9pOXhzSDRrNmlFSXY3WGJsWEdyS0g2YmdaZlJr?=
 =?utf-8?B?R0lmSS9JeDE5SXNPNUZPTmQrYjVoWWV4NXFueExuZTFZVmRhTDB2N3FlcTl5?=
 =?utf-8?B?eFByRkZCVGVDc2lPVURheDFwSCtmVUcwUGpGVXdnN2tHSU1yN3RuU25leGF2?=
 =?utf-8?B?K3llcCtKdlI1ZFI2L1oyY2V5bHVYRVpQZ0hveGZFTDZVRnhobENzaC94bDFv?=
 =?utf-8?B?V0pLcXRvSWFTaUpNWlEvRHUyOEFMQVBaSUlsWHYzS01LU0h3bGpRT0VtY2tB?=
 =?utf-8?B?SnBnTWllM0t6OTRQaU1RL3NqNlRZZjZaa0E2Y3VkVGQyUDhYWjYzR1pMd29o?=
 =?utf-8?B?aUg1L3pXRHkwRDQvS2R4cjlzY0ppMjAxYlRwdTd3Yzh6R3h6UVhycVdYYUV1?=
 =?utf-8?B?Rk43TnFVV0FaNVZuZThEbThZOGo1dERSa2diVzJBZVVud0hwRTNkYSt0NDE2?=
 =?utf-8?B?YmNJMERSTFhzLzk0ZTB3SG9qbURYdTFYaW1tM01oZ1o2Vmx4QmsySHozaWxL?=
 =?utf-8?B?Uit5alA4dTZyQ0JjNmZKd2FMY3hFamFLb2UzUXM1MHBqKy8xSkFvR29LR2Ru?=
 =?utf-8?B?blpHSVRJN045OGh1cjJuQlZYaTB5Tlo3ejN5WHVCT3JGWSt1c05QcDNmYUYy?=
 =?utf-8?B?TyszS040VFR6aDk4MUhod2dFU0U2NU5rbzY2RWxHMGIvYUc5MndQUW0reERs?=
 =?utf-8?B?S2VBcFUvMzRGdTY1Ykc4aFNhZXhQdW5ZbmZta2EzVW9ZMVZQZ2Y5WnBMRVNj?=
 =?utf-8?B?dkk2ZVQ0RHhlM1dtOUhRbERMWEhoOG5nOHVmN0lMSW9MbEtUalltdCtPR3dE?=
 =?utf-8?B?N1Fwdlk5QzBQdlc3TlpRajdYZUY1aEUrL054ekVhUC8reCtQUnV3a2NaYjRr?=
 =?utf-8?B?ZTIxVDI0akZGT0pEYXc5ZTR5Rk54L1FERFFxQjNNMU9jVnA1b2Y3QTdQWkJj?=
 =?utf-8?B?T2NFelphRGlIa2lvOUc0RGYzRTZ4TXp6eWNVNE56TFMxeDdGMWszZXpJNjZs?=
 =?utf-8?B?UTFSUm45OGpNczV2L2RUNG9wSmx1OFRCVkZtbkNYOWl3ZWxDRml1VE5BcTUw?=
 =?utf-8?B?d2R1bElaQlVPWSs2YU1oNlFvQW9JYm9jSkgwbW1mK3RSUTJiQ0lkVk52Lzd3?=
 =?utf-8?Q?tlcRMVKUwte+dAVLKm5j/uOqav5c7MW6Cg0UwqXo25tmz?=
X-MS-Exchange-AntiSpam-MessageData-1: g/cnz0PU+fqckw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d15318c-400d-4361-d45d-08de75fc62d5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:33:18.4539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69j3aka092kLfzw1fee1SyZ89vduaCYgXGB7JWHzNYhGkKk0uxiXtdexHklA3vasgF4hTEteJ/rtAvVqnF03kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 19E051B724B
X-Rspamd-Action: no action

Add `CeGetFaultMethodBufferSizeParams` which wraps the bindings.

Add `get_ce_fault_method_buffer_size` which sends the RM control RPC
and returns the buffer size. This is needed for channel allocation.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/rm.rs       | 17 +++++++++++++++
 drivers/gpu/nova-core/gsp/rm/commands.rs | 36 +++++++++++++++++++++++++++++---
 2 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/rm.rs b/drivers/gpu/nova-core/gsp/fw/rm.rs
index 8bb7b11736b9..9f1e3546d39d 100644
--- a/drivers/gpu/nova-core/gsp/fw/rm.rs
+++ b/drivers/gpu/nova-core/gsp/fw/rm.rs
@@ -80,3 +80,20 @@ unsafe impl FromBytes for GspRmControl {}
 
 // SAFETY: This struct contains no padding.
 unsafe impl AsBytes for GspRmControl {}
+
+/// Wrapper for [`bindings::NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS`].
+#[derive(Zeroable)]
+#[repr(transparent)]
+pub(crate) struct CeGetFaultMethodBufferSizeParams(
+    bindings::NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS,
+);
+
+impl CeGetFaultMethodBufferSizeParams {
+    /// Returns the CE fault method buffer size in bytes.
+    pub(crate) fn size(&self) -> u32 {
+        self.0.size
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for CeGetFaultMethodBufferSizeParams {}
diff --git a/drivers/gpu/nova-core/gsp/rm/commands.rs b/drivers/gpu/nova-core/gsp/rm/commands.rs
index 16bcf88644db..1d045e6f1afb 100644
--- a/drivers/gpu/nova-core/gsp/rm/commands.rs
+++ b/drivers/gpu/nova-core/gsp/rm/commands.rs
@@ -2,10 +2,14 @@
 
 use core::{
     array,
-    convert::Infallible, //
+    convert::Infallible,
+    mem::size_of, //
 };
 
-use kernel::prelude::*;
+use kernel::{
+    prelude::*,
+    transmute::FromBytes, //
+};
 
 use crate::{
     driver::Bar0,
@@ -94,7 +98,6 @@ fn read(
 }
 
 /// Sends an RM control command, checks the reply status, and returns the raw parameter bytes.
-#[expect(dead_code)]
 fn send_rm_control(
     cmdq: &Cmdq,
     bar: &Bar0,
@@ -109,3 +112,30 @@ fn send_rm_control(
 
     Ok(reply.params)
 }
+
+/// Sends the `CeGetFaultMethodBufferSize` RM control command and waits for its reply.
+///
+/// Returns the CE fault method buffer size in bytes.
+#[expect(dead_code)]
+pub(crate) fn get_ce_fault_method_buffer_size(
+    cmdq: &Cmdq,
+    bar: &Bar0,
+    h_client: u32,
+    h_subdevice: u32,
+) -> Result<u32> {
+    // Stack-allocate the request; CeGetFaultMethodBufferSizeParams is small (4 bytes).
+    let req = [0u8; size_of::<CeGetFaultMethodBufferSizeParams>()];
+
+    let reply = send_rm_control(
+        cmdq,
+        bar,
+        h_client,
+        h_subdevice,
+        RmControlMsgFunction::CeGetFaultMethodBufferSize,
+        &req,
+    )?;
+
+    let params = CeGetFaultMethodBufferSizeParams::from_bytes(&reply).ok_or(EINVAL)?;
+
+    Ok(params.size())
+}

-- 
2.53.0

