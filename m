Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD8hJcUyoGmLgAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9751A54E3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD3310E8F1;
	Thu, 26 Feb 2026 11:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Abf1EfLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010040.outbound.protection.outlook.com
 [52.101.193.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FD610E8FF;
 Thu, 26 Feb 2026 11:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxjazBS1kincg3wXhyU11T6ZI+5gISI4y6rHiWklTxa8Ewox/07UtnqRw9GYu/OYcNMi5AtLqPh71iyw+PwiCCqFw+4z2tbuJ9A4zQ7wmevM9g48IJ7zqoUWCIv30dPLStH+KRBHL2dIYV7iBQ0d7ZKf3mqWmZjKxQOr7rJMgDaKPRe4Iave30unzyhbGmby73jBtDytTURXzUgjHaPjQsjUur3j9a/HDnOpVdhW4/E1EH2XyfVmhrPjOoLJH64ZMbklJuBpEuKNXvL3Vk08Bl+tpdAJmX45HIFjNqgGMNHM98aEc+jr1510+K3yUY9KPkeUFv+1x4Nrcpl0d6j5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuzMRWR+jW/HgR/FN/Y1xTqf9vboNLEBI3fpc3rT3yU=;
 b=BlcnV6w4XT3Qny9OYgeB+suwNUuzdzkdEk+Z9V8VhX+o6mku0mgzQix9io3pSluKn56xNE/lgXJfBOk16cmS2UUDQWUnuVcc/9oIOAG8Kabzevm6yfh8WVpm62FdlXBwZI5Tw+l/nB5BK69fkPTn/1/doIvIvVBKrVOzqmZJIjP1fpktSj+9VCj0oOFWAVCemL5SwgETfJlDT0kiFXdqUKtILW+kwEyeRTzmtmj+PdjvKdzVgPr97sB485olLGQTQMwU57F+mHf7WKDLJEIn4xatjPxPhlaTgCyHJxfe7WjSvIEqJLwqH4NUA2V0Rkq8Xkh8tA7wft9Wk1BcdKdZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuzMRWR+jW/HgR/FN/Y1xTqf9vboNLEBI3fpc3rT3yU=;
 b=Abf1EfLFuMLyzHo5ZB5VFpn1pXLnnMxbUQ1xp+49CHyjAyAEZtyuvOsprfwV/AjdpRQI9RnCSR0Y4PVumpZo5jcHGoWEExI5mLEffr3yD5HyLmLMYvjMlnCERXye4NYMOOvHK8GudaT3ZmfhFaYt1/WorBP0FxOwK2z9X5WNFwnhrHBvp8gW6LTAUrWmQ58u0ofkYBrok8IAw7/H4/pdDhT3UkDq9uWOLqRybNTNkTiWTswVdh5eeGu1PkXGrZAVsKFSjKFiQfFqtPoW1UnJd9fMDz1b37zb43LORfmhiU+/a2O9gNZ2bcGPcGNlPem6cRj97G4xU82WTCCEMTINmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:47:04 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:47:04 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 20:45:38 +0900
Subject: [PATCH v3 6/9] gpu: nova-core: gsp: unconditionally call variable
 payload handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-continuation-v3-6-572ab9916766@nvidia.com>
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 178835b1-4584-4c1d-5a64-08de752cc317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: 8fpGv0mB2q2HtcWay+gq4SQkLzRmVrqn8WW+4CrnTiEL+SzUAfm0YP4caMj7K5pr3F8ygRtlxTWO9Ht2HJrC32LnfYizQDo6fxJpNOO3Wo5/ShwoUiudurQT9DuBg+gNFp75td+jsokL30Hu5B44u6XxS0JLW7BLPb2dHnqNOsqQiN7Smo39ey00dtSPTOI5I4PqGrL1+vM0K9PBngxrsQ5SuE2rdeQXVGSEhRKaj4qIwYoZbeMcVqdmciW8WBUObOTbxJyZA16HcvXPkekYSRP+5QDShUHCDRgOQZP0Fh46/53nN14m+GL+CjKmwBhLeEC2UD8QnBIGDREIOBQiJXaFR1rvJNGk0lUkPMfvSP6NyKppmrmXQBCoUTBICPWspTdvVW6IpxWgPSIQ1vHn1wNxAhI/LNePK5UEvnwMLLSb41PNRybOSomlB+eNNdD02OXd/KEATChdhi3d1GJ0kntR8wSNGopvuhE00supVQBwcn1xi8Sra5WyEWUqANq7vnkLVb8XdJ4quMy9HdfQt11bjNDuszWniSvWysTa77qZ/coghWG5Z+JfpRXzAoXh+47cVlFlKV8UdMFkg/3J/2/xLo6KLh715/i/Unst7LgCR9zS65Em/s/EBnbNISFG6qrhBNdYU34OXWrTNx4QiXYTHzdEC9AwjwmkAtFfS5vOR5oTk4riY4UkhG9zDatpjjm2S9wPROxcdzROf0ya8ydy2HuWCBrQElujKO4thcnU3At10CUGuymOIwR57itXnLBlHniFpMZUY9HX4bVfPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OCsyU25HbnFReFhSUjh4R2s3dzdzcWN2NkFwTC9qR2lERVg3dGxlR0h4UG5R?=
 =?utf-8?B?WGdocTVYRkZJekhpcjJqSUFqd21LeURyUDY3dVhVNGc4bERSVHdEc3QwZHhG?=
 =?utf-8?B?c3M2U0N1RFhoWDBZKzBSSW1LRHJOWkZlZ21qZHNWb2VWSjV1dDQ4eGZuYWds?=
 =?utf-8?B?djh2SDRMOEZYNFhNNkNBQyswdmZJYi95a2p5c3N0TzkvWUlwcm1GQkhFSzhB?=
 =?utf-8?B?RUZWZWV2bFpYVkJvYm5RUW1qV3J1K2pyWWpMN3BaWlFSQ2NvMGlUY01HZ1Ro?=
 =?utf-8?B?dnRVMDdDRlRFYlRNak40TVo5NnZuTURJOVNpNW9NcmlHNnNwQVlVV1dkbHV2?=
 =?utf-8?B?ZHdXbit1N2l1WkxPL29BamJKTHJZZzhKbXVwNzVJcmdwZkticFk4OWtHSWpD?=
 =?utf-8?B?V1Y0K3g3M0d0ZkJSZUdrQWpXODA5aWwrM0dvRWsyc01JbU5oVlB3NTVwTDcw?=
 =?utf-8?B?Vy91ajdOaFZlbDN4QWxXcU0xMy8rQzluMmxEUkdaMmN6aVpqT2FtOXg0UEdi?=
 =?utf-8?B?WXBlSHdzRVFWVGNoczJEQ0pIYVJlRkkrUVY3eUdid0szdXdrODJMSVRLYVNN?=
 =?utf-8?B?a1BzK2VBWTd3Y3BXME9ycFN0TEQwai9FeWM1Z1VmU0NSTmU3RVFsSlZuUlRh?=
 =?utf-8?B?NUVCRFkwbWhJem80d0JKc3V1d2l3S2k5MjczRkxhVzI2RHZ0UjdiNmxXQUpi?=
 =?utf-8?B?VlAwZmpBT2ZvUWVwUXJzcnFyV0VXMWoza2t6L2FON2U0MkE2bEJ3UUtNREJC?=
 =?utf-8?B?V1p6NFh0ZmtTZ20rVmNZanlKcjU0SmEwVFRseFkrOEFFcEk1Y3Awc1VhVVhL?=
 =?utf-8?B?QmpEdlNISnBTck5RdDYvM3dMSDRaR3Z5U1BuOFhsZW5EM2FaVHRCNXArYU1O?=
 =?utf-8?B?R0svMTdrVklOUTlQeGhtT21kdGxlWklhMUdIMkRHMkhqMjNwbjNBeml1MnBm?=
 =?utf-8?B?RDNKb2ZWR0UxbXMyeUt4K3NZYUVTN3JsWTNLa1B4K2VldUZEcUVDTm8xaHk5?=
 =?utf-8?B?eGhkL2hhQ2pGT2xQWU8vL3dGak55TmhENTgvL0VZQ2gvdWtUa0pTZ2VZUmJ2?=
 =?utf-8?B?UHkyUlJZdHhQQXhQdDl5RG51UmxDTHltWTcySHlYdWcxbUlRSHVwaE1VVmlt?=
 =?utf-8?B?cFBGNUVwSk9LNGF5bDdtVVFaNlJFMXR3NHZRTUE3WFpJaXFQSG56Z2Jzdnd6?=
 =?utf-8?B?WFpqL0lYSkJzNlhMZnZBSktWOHZ2dWNYNGVJdVZHZVdvaFhiWkRkMUsvYzZ2?=
 =?utf-8?B?T3hBclUySUpycHpCOWFRbnUrNHJldFJDSmI5MmdSazdrd0RHaGtZNTJmdVVY?=
 =?utf-8?B?a2pmM3pzSWVKeUxwc1N0dGdybllFREF6cUpibmwzc1dOS1c4QlNvaGNaUkJB?=
 =?utf-8?B?Nks2NnkvYU1PbG5yN1packlmczNLTzNxU1F2ZlVNcUpKd2xqWXpoeVpraEZ5?=
 =?utf-8?B?SGhEZzF3ZjJYemR5Tk10R3htY3REL0FldFNCS1hoQnIySHh1bjIzSDNlVXFW?=
 =?utf-8?B?eVdQQ0FCQzJZVWZZUEhBUVVaTlMzejJxQzFVZlRROUF0VFVqNUpVdGNHZVRN?=
 =?utf-8?B?c0xVbjQxVUdYb1Y1ZllIZENmR2J3ZlBWU1ltR3JkY1RGMERqY3RPTCtQS2Jm?=
 =?utf-8?B?V0V3dWNhMk5ETDNCdTkwUi9uSmxZZjhhcnZnS3h6b2t1ZmJ6dEZaY3FJSGNM?=
 =?utf-8?B?TlIxbVJGN3JmQkJGMEVFZlExZ1hIZThoQjBKc2VndlRFYVk0TnpXTzRkODQ4?=
 =?utf-8?B?dHBpa1g2YmVWa0hqVTNSTXU4WUtUNHBCNElLVjlCcFUvLzRETDZITzJaUFFt?=
 =?utf-8?B?d3ZkdkJhcEJpalZ0b3hFeXFqMXY4MmU3K005bWxHTlorRzhTRDB3VXFrWmRS?=
 =?utf-8?B?TVNselRPdDNLZ3oyeklUQ1c0V015Ymp5dXF6VktMSk9hTXhmNUNwYlRDM0tZ?=
 =?utf-8?B?Myt0TkVibGM5KzAzVU93YllxT0dKOWV1MktIUTlxaFRXMm1OWUdTcFhvQ1RG?=
 =?utf-8?B?ZFFCcHJrTWwybXBLT0c2Z0daTmdBSTEyTmlvelpoNzRLdHh1ZkZDRjE3UEJQ?=
 =?utf-8?B?a0JwejA5M21hZWwzWjF5djVhTGxjN1ozUzR3eVFHSHdDQUMxcWFPcmlneU90?=
 =?utf-8?B?eExhWGgzTTRkcE1LeWtEZGJBU0FmWmtLdllXMnFGbnE0ZzNmU2lXYnl3YXJn?=
 =?utf-8?B?dE1EaG1tcVhvSzBwNStVVmZnZUxzN3RxTmJTS0ZmNlVyNm16ZkZoYkxDSE9H?=
 =?utf-8?B?ZFpEVzdDWFVuQkMvSURPanMrQ0t6Z0djZ2RYVE8wUzBFbnpFdjk5NFVVRjdI?=
 =?utf-8?B?TUIxN294NWxyTXE0K2ZoYTNQOFA0SHVQRi9aTWk1RDJJNUFVZ1VCLzlCaVdS?=
 =?utf-8?Q?YcsdufYf5B8zWc0ycDypvuTjNc5/gVLsc5WhzN1JRxxjo?=
X-MS-Exchange-AntiSpam-MessageData-1: lqgJ9KHRhuHAfA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178835b1-4584-4c1d-5a64-08de752cc317
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:47:04.6556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oJZoGNaKynUD8NAtEw6bTIeRjoBvvJhuSXTQvneeMyCuUG1PSJS7IdC5VRP9mqDA5ms4WajBAyVjxVv74rmsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112
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
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 3B9751A54E3
X-Rspamd-Action: no action

Unconditionally call the variable length payload code, which is a no-op
if there is no such payload but could defensively catch some coding
errors by e.g. checking that the allocated size is completely filled.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3653212efa7a..9f74f0898d90 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -545,16 +545,14 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             command.init().__init(core::ptr::from_mut(cmd))?;
         }
 
-        // Fill the variable-length payload.
-        if command_size > size_of::<M::Command>() {
-            let mut sbuffer =
-                SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
-            command.init_variable_payload(&mut sbuffer)?;
+        // Fill the variable-length payload, which may be empty.
+        let mut sbuffer = SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
+        command.init_variable_payload(&mut sbuffer)?;
 
-            if !sbuffer.is_empty() {
-                return Err(EIO);
-            }
+        if !sbuffer.is_empty() {
+            return Err(EIO);
         }
+        drop(sbuffer);
 
         // Compute checksum now that the whole message is ready.
         dst.header

-- 
2.53.0

