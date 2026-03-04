Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EcfF0uOp2nliAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EE01F99DC
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06A710E933;
	Wed,  4 Mar 2026 01:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ccI4B8HW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011039.outbound.protection.outlook.com [52.101.52.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE5E10E934;
 Wed,  4 Mar 2026 01:43:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+Ayn5m/qey31zjpAwvsmfe0lbEeq6TmC4BCxerGmsr91Y9oNG/Tw4WnKPCCBkc3p9NsP5QmkL0AUPB3313y7eznAe8HDLbSRK8ou7eAqVaeFwSIMQYVeBqnyENsn65u1aQqWzDGLmPI5pHkEWfY6beYyTph2RVyzCJb4nC8IVMrnRvOcqatZxcVPMnzew8NO1Om15rnFGrKltHrLf3QLwtE+qttpH18R7WZ+A/PTq7M+cr0fippzJpldl2zGHfdWYH4E8yYTY10GDL6XeB/mmhfMOfw9r3OZ7DvkySIZUsYEYSIcqzkZr7DH+xjuRbmAQ3KpjJllKXkOSvSw/cceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpnnY12rucIGBov7gnvRK5EMzb4PSpK2bAew2mp0k0c=;
 b=gUDAK/5E9QpMHDlUdMjr+LsiM/1hmJQSpZxcIZKzZ+Ukm6xrcOT9Nm120kjbSjKrec4rosLYHmIc9rOFskmxsq88oFxzy/d8AofV8YezmnsnAkJWUn6+MobGvPRWSvRNdZQPBrop4GjS9NggVXODv2fC8fp2YZPKcJWxEvb8GrYCnNHlqhzL+s2/+sgJzCh7CpbsXPFKayGuv/Wft25aiFH1FkhKW98muZHpXnoMQMFgLOQ6M//GXtdd/D0MG2tFII+i8Z7SBtbWzwj5jX1uzEf7gVsCdE7DVZKwx83FEnc9D1urPicKJqeY9SmE8IY3bEmB0Acuac0RtdkDCZLBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpnnY12rucIGBov7gnvRK5EMzb4PSpK2bAew2mp0k0c=;
 b=ccI4B8HWvYVreCKF4HzUtUXvNovXE2xknW7ZYdzq1cKfRadLYrt8+On2iXwwuDvezWB7CVom3K4m85n16sSt1mYl/wyIE+kVQFChNgTjm0Vfx4g9oX8nSF6xd/Ze1qV+i8TCTF2spnqYROi4HX0F6DRofwlsNpp9qYSbNCX8pEazIuW82ete+QbyrVF6AJmOIaCvyEfo3HGTDO2k8ai917e0zd2gQFmZsk/FlCe2/cSju+R03+o+dlM3i5cg3w08flwCBx1BUAzwu8497gdZOlhdRx0n7x6TQccEpGUmdcD8DNKuxo5FUcG8SD6bL67p2jyKmnnhXvfrsKrCuEF6Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 01:43:32 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:43:32 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 10:42:23 +0900
Subject: [PATCH v5 7/9] gpu: nova-core: gsp: add `size_in_bytes` helper to
 `CommandToGsp`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-continuation-v5-7-3f19d759ed93@nvidia.com>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
In-Reply-To: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
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
X-ClientProxiedBy: DM6PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:5:334::32) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 2640d675-33de-41cd-a652-08de798f719d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: 8eHGPBXORQ0iwusOC2r5/xX0RPNt1FjGFh/ord2bzPn83I5NtARd9y6pHKdwwgo2bwSsVGlwTdnjS8fnKf3B3oe0qE0oUo05fMc8nWZXCOAYs+CAwzpeijfDQKwbybql9+gdVPYJOCTuXg4mmbr16JuoQz6RnFZEB0qJXsWKv815ddv6wyZRorwt6JfZXEnGJK28afSX5XzG7swg71oYRc0L7vlo3h33eLwB7bqkOIf++RCFVNorvebX1yESCOVmEG17V+SVqL5JlOMLCocjm32YgX92KYdcFUqXZAkXfLecSVM4iAU9NmeoXyMsayp7FDUk1hFCAAYxzHWhqfY8A0ilP8RKFeErTGyTKU0DYCVx6dsibr1y+OUXlVNIFRNRQfMA3ba4HE7p7TKOU8ghrFAoApyHkEgAjnOXUYeGFFXGqQaEIYFo54hkbpqoaHjRI0zcQwhxpWriqE606/n3O3ELQi8DGb9kkfflEqR/23R8Bov2OV2eGoUyio2jQhU3wRkUYQLUTlnW8xKs1R7RGoBqvh1qrNB+pdyMZGLqskGZqe21pMuanOg4oOTVPIYz7sWNygWiT7MZyu88TYYIlXFXszMIEzbAwfEHHs8tK3R+nqZ7XBI0YIe+x+FmeU54H96za2Buj6VTtjvQhO9hkQJxbDOf74f9Au+JNkFc9OKEA1a7dUc6Kl9IYEAr2nAE3MZfnWjzcS5J7Bd90aXwEmeq7lU8vevVwOYVPFG3cez2G3oQ389H+i1Ij1qlHt/HGmHeoiDY8rbKwWmVjMyR4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUluOVlJK2xCeVNaVHdhbG5RV0YzNG4rMXUrdHpBUit4aXBrRm5yMmlqZnFw?=
 =?utf-8?B?ODJJVkV1dDBsOTVIajRqOG5XYVFLUkFuQy9rTUhvWmRPb3lRck1aNFBPckxI?=
 =?utf-8?B?RStMZWhJQllwL0N3ajRiZVRUTUxJZE5ZT1NEckkrWTZQL29IdHpab2RaUXl2?=
 =?utf-8?B?WE9OZXNCMklhNG5PTUtZU01lRDZLbnozdVJoVk5kZEJKODVDU3g3U0hNTWNp?=
 =?utf-8?B?Y0xxS2xxbnZNS0hUa29kUW9CRjZnZEFERks3VmdKYUswNVM4K3dIemVOeFdL?=
 =?utf-8?B?aGtGZ2o5M3pVeFl3VHplUnZTVDRKd01xWUZlbzhJMU0zUDRZZ1BjWm01dVJC?=
 =?utf-8?B?VUZGWmY4SExjVlJ6akpreElUOTFTSWlBRHZrMlVtTEhERzJ2Z3BLcWdIOGhQ?=
 =?utf-8?B?eVBIQWU4WDVJWks1NHI2Z2tYL0I0REdiVU1raHZOY0FnNk1WbWJzajlvWUFn?=
 =?utf-8?B?UDNsRTIzb3NpVUpFTUpjbFNKc0MvWmxmQStza3BrQXBUZ0E5Y3RJa0dURTdI?=
 =?utf-8?B?NkZnVnBFa3RYZjdXbDBtY29GbE9EY21KR0NVR1N6Tks5YUFHc3RkUGlCTXVl?=
 =?utf-8?B?K3c1cVlkMWIxelVKSjVvWGZOL2V0S2IxQXdNWld2NEJiQzk2VGZSWGlKcTJU?=
 =?utf-8?B?SFpCdy9sSjF5M1NrV0JNWkg0ekxqTlNrcHdtZlp5MlJzTmpzV1VtWnJGRnZn?=
 =?utf-8?B?b3NsaHpncHB0TWhTNUlWR3RBSHJVQjdYcUp4b1NseVE2cG9GemhoQ0ttcWZw?=
 =?utf-8?B?cUpmc1NTcHFDbVpRRlJyZ0pDTVF4dGpMdVZDeUF1NTRuY1l1L21EeDNxQ2U3?=
 =?utf-8?B?MC9LRUhGZHJxcjJnR3Z2dGsxOTZMbzhWcXhBRmJtSjdmOGY2MGxxNWdKWGVx?=
 =?utf-8?B?K1lwS2xHb2wwd1ZZTnJXcmxNbUZTSkpMai9OSjhvRW5SYm9HY1YvK3NwYTZn?=
 =?utf-8?B?cEREajI1UFZNNVlmV0NUY09yZzNGZHRtVk5MZWNNc0hNY1cwdzQ5Y2l1MGN4?=
 =?utf-8?B?QUlxeEcxaXRqMzZtd3Y3bHlUa3E4WXhkUS8weW1MSjZsSjdGNDJkTUU5M2pD?=
 =?utf-8?B?Vy80OFFqWVpiYnB0eGxhUzNKNm5mS1VhYS9NMXJYeit4OWZkWkpaVE05aWsy?=
 =?utf-8?B?NGdGcTBTT29ET3Ard0d4bWwreWJ4aEZCRWo5bXVMdURhaVhJZzduMUJ2MlZL?=
 =?utf-8?B?YUllbllmSEI1dVBSeHpuMXRqbnRkVTRnOHZkdHVieDFtWUpIaDNNUzRTMWxk?=
 =?utf-8?B?R1lkdmNpRjhiN0dUOFZuOXlyUVZSeE9zTEp0SXRuekl6NmV6Rmx2MnMveTlG?=
 =?utf-8?B?MHhvQjV0ZlVjQ1BhV3VWRE9INng5OVhRSnZ4RDBrb1B2dW0xb2J0RkJLR3JY?=
 =?utf-8?B?WmZ4YmhsWnU3RTkrTndnRVZsVGlXKzlnbmI2a0tDZVlpUnJvUkEzdTVobEZO?=
 =?utf-8?B?NkxSc3dZQ1Mxbjh4SE4xL0pLVEFFNlgzeElQY1lWOUxaa1p5aHVkL3ljYnh4?=
 =?utf-8?B?Y2NMcXJyck9UQTRoV01oLzVGVWJpcE9HN0xMYWVqYzZOYWR0dm8yaEYwdUxt?=
 =?utf-8?B?SzlCb1psT2FFdVdTVGRKQTBmeUUzQ3hmbjdPQTQrdCtFSDk0dy9lOVBNTDNm?=
 =?utf-8?B?SHdQZXhGQXRYS1RPN2czdTQ3MXk4ZkV3Y085Q3JDaUh5ZkVVbm9xMlp1MjBV?=
 =?utf-8?B?SjNUWXZ5T1k2SDZNSWdqTW5zOHdrdUF2QUI0WFV0cEozVmJvYllOdVBPVmZk?=
 =?utf-8?B?Q20ySUx4MDZxMWtXbWk4TG12cTN3eWtZQWp4bjcwSmFwYWhCekJFTHdITTBv?=
 =?utf-8?B?NnhPNHlrcjdXY1ZYWk14aC9aL2RjQUQ2V2ZCSlpnb1BMY0JMQnpkTWdiNE9O?=
 =?utf-8?B?VW5sWXRlSkRWa1pscFVBVEtHbjZheHlYUTNnS3piSHMxaCtLNTRNbkU3MUhE?=
 =?utf-8?B?MTljQjJEeDlpdDF1dFk3TUNaT1FMN3Y2eDBsWE9wS3prOGduTzU1a1lOR3p2?=
 =?utf-8?B?Y1hHc1U2M2psT29CRkYyczl6bGFPRjQranlrdWwzS0JxSkdWOGhUTHlkNEw4?=
 =?utf-8?B?ZnVjM0ViL2JYVUVOZ1dobHc2UzJxaittYlpPdDdGL2FkMjR0dkw1b3U2Q0k3?=
 =?utf-8?B?MzcrZSsvbjJuMmhWTHhtWkEzMEhpai85QStrZFZkK2EweHpoRnV4cTlENG1L?=
 =?utf-8?B?aGdCSVhWWUFBV0tOakF5NEYrOUVGaFovdGh5ZUZ0cWl5THI2Q3g5Um0vTkRh?=
 =?utf-8?B?MncrekVwNEZlKy8yMEFMbXNXUzRaenRSSHdyNGVwcjJrc09odmQrbzZaOWtw?=
 =?utf-8?B?WnZKQUdmc1dpU2l3SmZYd05yVllZWjQ1RzFaODhjb2VYb1IzOWRtTkZ5U3RC?=
 =?utf-8?Q?UG5MQ7jWmN1uids5W1Iipyb4/J4GPPsbPcTPn6JKT19jm?=
X-MS-Exchange-AntiSpam-MessageData-1: u2ZTLjvKsSqxbw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2640d675-33de-41cd-a652-08de798f719d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:43:32.7737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6kecM++4GtJLf8lceI1kvz5jjcNVKGEuUwe6ZfTWanNY/M5lr9WAmPvsnACrW0MnnYjMYlfGuaOMEfCrmwJUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6545
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
X-Rspamd-Queue-Id: C9EE01F99DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Action: no action

Add a default method to `CommandToGsp` which computes the size of a
command.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 48cf28b41f39..3424be4e15f8 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -94,6 +94,12 @@ fn init_variable_payload(
     ) -> Result {
         Ok(())
     }
+
+    /// Total size of the command (including its variable-length payload) without the
+    /// [`GspMsgElement`] header.
+    fn size_in_bytes(&self) -> usize {
+        size_of::<Self::Command>() + self.variable_payload_len()
+    }
 }
 
 /// Trait representing messages received from the GSP.
@@ -529,10 +535,10 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        let command_size = size_of::<M::Command>() + command.variable_payload_len();
+        let size_in_bytes = command.size_in_bytes();
         let dst = self
             .gsp_mem
-            .allocate_command(command_size, Self::ALLOCATE_TIMEOUT)?;
+            .allocate_command(size_in_bytes, Self::ALLOCATE_TIMEOUT)?;
 
         // Extract area for the command itself. The GSP message header and the command header
         // together are guaranteed to fit entirely into a single page, so it's ok to only look
@@ -540,7 +546,7 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
         // Fill the header and command in-place.
-        let msg_element = GspMsgElement::init(self.seq, command_size, M::FUNCTION);
+        let msg_element = GspMsgElement::init(self.seq, size_in_bytes, M::FUNCTION);
         // SAFETY: `msg_header` and `cmd` are valid references, and not touched if the initializer
         // fails.
         unsafe {

-- 
2.53.0

