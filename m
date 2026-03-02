Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMr5JNt3pWkNBgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:43:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048361D7B85
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D779810E499;
	Mon,  2 Mar 2026 11:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hLDNYdPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010035.outbound.protection.outlook.com [52.101.46.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1135C10E499;
 Mon,  2 Mar 2026 11:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ta8xZDhRz3GXxqfcR/04bMIh2om/gxY2jxnOaJVr67Do6DSGrHBrGi4/+TaAM3MMT1F9gOtd6LXP60PM71IaKvGEb7YiKdC1XxfZzHkblvX8VerA0rUS8HXnfCR8Oca5IrONTd4DSKyW74Odd5lmIRkMxnFAlZND5kmo0mtcJxQTXeZtSwz7UgMUoI8eflK++0iKFvzDBfDJc0D4XMMQLs45TvhkgyfzkhNY7+J8h6M8N4n3x1khI+GzB/l3NT04+U7ZaRwzxaQb9HT2L/e93FgmPILRq2SHZAKp76ubDoJTresoJWKOKTjhCvowqC62Q1SrtW1XtYBYlp86sfcEjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHyYwFhSGalfP502Ba8nE94zzxFZO1J8n1P1B4869tc=;
 b=yOYwrY6j9XMjGjHZSo96ug5yOAlzOUEiWCbDSxpeEqIGIKRjIVmLfAlCKK4+5c63IlY5dehIytbtzz/I7tbXCCqSom8JNiYIytc+92UVInU/Q7oo6ZbLmVd8PrVTlkVx1BjzCOYzFVmqB/PRMNc8hJanWrc0lXJQjxoZuyl9zWKNtLy8EcV/h0owOcTiU6h1/xlfoVSZxG72H7PwI+oqse5mZQ5ZEY+wmyLJ2202yVQoQex902MRsj/+SHt4d84e/EXXdTl3NFhxQRj4NWhRsBqwAuSj8PygRTrAFUsVGpvUUegzUWVUJeCiHyr7LCV0UU2DB8Y9SQbd7wjEfQ2AKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHyYwFhSGalfP502Ba8nE94zzxFZO1J8n1P1B4869tc=;
 b=hLDNYdPmwKd+v2VVIta3YIMXL3gaYr8IM+kgV9WHfv6/N9xwObme2P/0wXHd80oIigJHrEtrUTHpQSV+/+ot8n/dApesX9pFhWqnbITBJAo2nlc/OHBiCI2N5Z5PL6A0An5cquV5/h5fbAMTaU2+VJf3lblybr4iP2gJXwZklG4cZb6E8SK4OY6D+Eumki/jjQYBEU9fSRbnOuWlblNaRgPbzVb4yJ7C83+U4d6D3i8yG/Dimgw61DExF3N1EVVua5ETBappIyZEwOGW2z1LqR+Dn5o5p4aDArhbrp7Tt/IXBPdRLYAtU7xEXNy+83sP63J1iR0Kf1sMC+y2BHGmAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 11:43:11 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 11:43:11 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 02 Mar 2026 20:42:31 +0900
Subject: [PATCH v4 7/9] gpu: nova-core: gsp: add command_size helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-cmdq-continuation-v4-7-c011f15aad58@nvidia.com>
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
In-Reply-To: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: d95c75d0-0ad5-4b5c-1e6e-08de7850e194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: 3uufTHK+zkDxsAuLLw/4kNG2gTxGWeq9lmrNUt2YK+nRG2pgD1yd3yxY+VDaiu8lt2pEuTqo2GsO5/BSzYVYVnFCfTnql1PTzNwOU1aSsFG1mF37wfN+GqvDqa2GHV42nbivhgE+CxGvzwFM9+VaL+0M3OXGwYpsPZqEcZa71dqYM/GKGEE3xUN5QbP1wT0opJunSmBw35SrsuIf0qfCb6QjwxE4J3eMYyCuuLdddlf/pUJxpNXu7mYVxTQZPDJbBl52FBjoND0UIOqPsQ2/UyiAXGrrpK170u19xMR7ACBzqVQRYsXHYkXjZ0toALEKdPsvKrfeSrWJS1St/Ux2T2ihJnT4SC0WsjoGgu64rc2odxbCg9UIGfWQKAUDRlMsBScvrXK0+6lXDAVw09MdJrm4PlPPZ6XaL1gFir3QyjXuZVGFKzsPWCOzyz83t90PQPYgMJiYva92kpUn8TSCY3GNFhkZIPwdWTySg23LGf6pYQKxGyIJHYjTePwhCNVCaQyvlRNoTurqLd/aEThD+FMbeYHBYZyJ6isn37bTN8o2LHG0oIPQQ7Hkn1pv+d9RoQoG269x89FWtcZKFpp1rRp54CAKbnfoAcbob7ZwToD3wAyqJoxYPTCOjCiih8Il290J2PfcUd49jq5IbWNmBEV9dbTRVNVktZPzSfZfg1Fy5bpY8AGGGRLIiQho0yOlgQyaLy/he+bsY4N7IJXb0B+Bl4m3NS56BdXjDx6AG2GFSQwcXij1KfJnwOHU51yt4LCfF4y9HXGFc2c3MLPRag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW9VbDhXcmdVOE9vUnZvUXI2cllpVUxvN1J6WWJzd0FVWGlnSFhNUzd2MHUw?=
 =?utf-8?B?aWt0MytmMytMNHh2MTcyd0UyUXZxT09DRUE5bUtrS2tXWHVXK1dUMW9pUHdG?=
 =?utf-8?B?OUxFcWtxYlRNU3VLQTF1VTI1ZW03d1N6bk1Jd3JkQTh6NkJqS0tGRmNtL2JT?=
 =?utf-8?B?YWlnU1NKRS9wYUNSU0EzUjFBaEE1QlhuRkd2TmhaNG9DK0dyYmFmb20xUmk2?=
 =?utf-8?B?TVV2dHBkcXBqSnV3Z2RsUXZXZXRTVy9UQ2hZb0ZCK050bFVpbUZhdjVScUFG?=
 =?utf-8?B?NUcvckFBK0NMZXZEN0RPbTl0TDRVZ1lhQksrWHZXb1Nua2dCQThtOHJrT2Z6?=
 =?utf-8?B?b0tuRnZWditCQW91NWoyK1lNWVEwV3Rwc2tTVmtNUW5tUkhBLzI2QWpJcFFN?=
 =?utf-8?B?bkQ0MUl4Wk9Kcy9na3p6eXY1SlVOVjVyZDAzMFdWa0F5MFRPclU3WCtyRU5X?=
 =?utf-8?B?cGRITk93MzNhRDU4cFBmd1VPSmNZd0tWNytzandWWldVbkNacnJrL3hJNXp0?=
 =?utf-8?B?K3RFcngxRW5pbUxvNU9kbnFyTnhhNUI4T1J1bXlXbVFkVGpzUDR5NGZYQWxq?=
 =?utf-8?B?NjlOdzdBS1lxYkpTS3lXU2RqU1RhZUNjQ0ljTXljY0hSRWRXOWVEYlgzbHlu?=
 =?utf-8?B?eHlMTHBlWkhYNEVOcDdEeWdKUTlFUm91K3pIQmpGdEtpVXVmVWpKMHlPSVZ0?=
 =?utf-8?B?MUI0b2FOR2IwUkRSMGJJK1dubXg1SUx5YWRIV04yZWhOdnNpVGtyYTJGdjNB?=
 =?utf-8?B?aGN1d3RSb3hjcDZCNVoyenYwQnUvcVdsdmZsMGQyNk9wcjlJb1NMNitTVU1x?=
 =?utf-8?B?RVdueUkrdUEyZ0tIcCsreW5GVGlHTno0MmxSemQwWU5NSVEzL3ZmUVprZ0lW?=
 =?utf-8?B?MnY0QTJzc0tUTGR4WjhaZ25yT3czdkJZQ2xDQXU0YmltWDJXdFdoZVY0dWZT?=
 =?utf-8?B?RGg4d2F4TjJWcU1GOVkzOGxUa1FLclk5SDhQamthMTBoanNRK2hMbVhadkVP?=
 =?utf-8?B?N3pUcDhOSS9ibzVWekJWZDRuN3FJTkZKZzZIYk8vRE5WN1J4bWRKdDZITFhN?=
 =?utf-8?B?ZytkczdlZkpzdHhMYmpBOWQ2M01IRnM5WTMwQ1p4TkV4T2tkNFRzcGFROUd6?=
 =?utf-8?B?SzJseHdTWElPcjkwVnVRVU1KTDdLMnpSU1JiNm1XeUVuWmgwbnNGd2hQeTNT?=
 =?utf-8?B?Ukx6WE5DaUYzTDZPbW8wbHZjY0FNRCsweS84RlhHTEJjZzFiaTJ2eWZDQTZR?=
 =?utf-8?B?REd0dTh5UXh6Zy9hVWlRUGFTM1Z5OS83cnI5K0RMT21rTzJtUjVwbzFMZUJE?=
 =?utf-8?B?R0ZTVTE2U2lVSlU3QW9RSGphV0o3Ym5BMlp4TnpGWUE4V29xc0QzeHZXb2RD?=
 =?utf-8?B?d1pYR245UDBFcGttdDNIVUkxYUFWcWdyUnptVk5PODFHWE1BQnFJQ3VIdWhR?=
 =?utf-8?B?UlJmbE9PVEJUbHBNUytYQnFsRkVFYlRiS3RScUxqYzJ0ZWVCeXEwdTMzWnlO?=
 =?utf-8?B?MXNEUDgyeFJ0WGw1aHZLM3ZrSG1tNGJjLy9NaHJubmw3UFg5R2xuY1pZQzVm?=
 =?utf-8?B?ckplbTFKRHM1Nk9lZGNaeUdGQWFOSTNXWkJSbVE2RDh2RHZHWVh6Wjk0SlJ6?=
 =?utf-8?B?Tkp1ZVUvSXJwOW1mV3hrNTVIZzRYMU9rL0tIKzFBNGo5NFdQb1dzQnUvY3VD?=
 =?utf-8?B?SHhvdGowcVMxYytnZ0xiNkd1NlVnTkpqNCs0VmlRTGlWZStoZVkyZHdGQW1k?=
 =?utf-8?B?VjNRTjljOERSamxQcWE2NUk2dEVVUmZzNFpVQkdycDErQnJQR3pvcnc0U3dW?=
 =?utf-8?B?V0R0eVBaSzhzVzVNdnAvUC9tM3JTSWk4K0V0UjdyeWtTRjZ2cnlKZnZlVEZB?=
 =?utf-8?B?aXdOOFFiekJiQ2dmdmRKZlpUZlBITlBwTXVJeWthd1lGcklzUEd3eTlWeTNr?=
 =?utf-8?B?WjFZbWNZUnFOYWNrWE9OVFNibVI0M1loWmNkZVh6L3JyekRaazRqR2xEaE9t?=
 =?utf-8?B?YXcrbEdFSHZXRlpZQUpySUlsVys4ZGFwdVcwMGVweUE5ZEhOc1pQTEpSNXVQ?=
 =?utf-8?B?SVg4TE04anpTWkxwMXViOElNdVJYS1RLUTh4cW1jUEFHQVZNbWhvbDhRSG9Q?=
 =?utf-8?B?c0hONjEweTVxTHVkNmhreENHS3VRMUJTQjdieUpMMUVQbzJuUFJTWXVmcVdq?=
 =?utf-8?B?amdxS3hGZXJQMWVEQ3RBZSsrSlU1TngzNGZQekdZZnZoRjhvUS95TVlIMFBM?=
 =?utf-8?B?QnptWk5VODdMc0pmeDFKaExqSy9TaHNmMExpTVU4T1p5QmFxeVB6WDZJVUVF?=
 =?utf-8?B?QUZqdk1Qd2p6ZEFMR0Y0SmFRRDVOaEttTzBHYm9SdXlpdDRwN1gzVFJ2aUNx?=
 =?utf-8?Q?O8h1mf7ONGF1sPdcl2KbliyUcIMYoPsh12WMQAl5RPM8k?=
X-MS-Exchange-AntiSpam-MessageData-1: 4rwaOzvDblWwTg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95c75d0-0ad5-4b5c-1e6e-08de7850e194
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:43:11.1470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjB4BJbGtQhX3NVpSaK+9BlfpjXn0Pqyh1aq/Rs82ibHHrvzNdz3JJXEqBWbOSUBE4faxSPtb1Ulqnbb88AZQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
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
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 048361D7B85
X-Rspamd-Action: no action

Add a helper function which computes the size of a command.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 9f74f0898d90..4a663a5b3437 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -450,6 +450,15 @@ struct GspMessage<'a> {
     contents: (&'a [u8], &'a [u8]),
 }
 
+/// Computes the total size of the command (including its variable-length payload) without the
+/// [`GspMsgElement`] header.
+fn command_size<M>(command: &M) -> usize
+where
+    M: CommandToGsp,
+{
+    size_of::<M::Command>() + command.variable_payload_len()
+}
+
 /// GSP command queue.
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
@@ -526,7 +535,7 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        let command_size = size_of::<M::Command>() + command.variable_payload_len();
+        let command_size = command_size(&command);
         let dst = self
             .gsp_mem
             .allocate_command(command_size, Delta::from_secs(1))?;

-- 
2.53.0

