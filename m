Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJc9HnhHpGk8cQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87591D01B3
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C95610E2DA;
	Sun,  1 Mar 2026 14:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="o8qEyAGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011033.outbound.protection.outlook.com
 [40.93.194.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4456B10E3FD;
 Sun,  1 Mar 2026 14:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtYPGMu81zPsbuOOJlTIHVpmJMJs3j7nxUHCg+930/hYnsblbHS4RhQS3WH+vZ0MBWZEZtdpcHt0NqTy73trJGSmwMwU8HXinz2qaEQF8X521/FEeRDIg/CfnM/Spkv0asGqfWeT2+YWuch0kPW6EA6nUSJXjgfMx5s5VirNgg+F9hlEWXNS1DViFPvaQdrKmYM6FX8c7GS/vEeYukJhftmfyJI67r/aVLxtPwjgvJ+kbUyY1dxQCSmbF2abANMPTQ7z4Nf6sRI6IqsMqiq5K2jof68lC+wYHAX+7rAahxZ0KGYhmiBfjDT2fjwoFVWfQH6rrXXtNJ/ivzZQcV4HXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufSCBLZzhblP/LdxNde2CiCuCOyQCivSM6IIZX0xJBg=;
 b=YMyTusu0uqSsFvdrroV7ysAhZBdJweIohxzQ1S++Vpu88BUbB+on2ebOUBNsG1KtD+FfhjsBkiSwqkh9uDl1EzYBLTCsBOFrveIGKplyZmoUN2lafR+MuhR0ISEE4ay4kM0TU+7m8H5EKw2DrL0oziwqd7AnPINgqWjKHEVP1cGjDj9F+kRQQ23VQ6/kQANByrhxctB4uHFaDPwmPB3TXJKD5kWSRIENleel46f4ImvGMSWGgjNIuUUqgUit+6dgcJDalRGgfZhG1DT4MJj99CeZ2xo8Qz3DNeZt0RetPjKXpY3/QMoOVm3k3m+KUYf3xCk3+I9Hiy8GTma2n3afnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufSCBLZzhblP/LdxNde2CiCuCOyQCivSM6IIZX0xJBg=;
 b=o8qEyAGkAjLJUJBVcuXJNJ7kxrbNSxsUiAGJ9GODZcMLYB/ezlYhb/Vn+/qlTw5L21+sCum7wZ7H8FA4ihAGww5b3qkTLK6gFMeGhqR10awiudoFG0HyylXwu2vh90Koj3AplUk1vFQ+CPJY7rpOACfv8OKtsz9MNomMpkz+uYZetTv2TM1c2Au+X44adFjptbjXPgYEADjqt+GRT9hh14RgR5TeDdH+nqKyd3Yfzl8OpdlBL0FJQaG/Fz5NpgO1KW7G1r+dOcA2xsiUYZYwzNWL8dXnQz2aPxr3mKqxcRu1EafkGTif/V1J/9ls09DzVQu1hqE7TtoNuZoUSrk1ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 14:04:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 14:04:33 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Mar 2026 23:03:52 +0900
Subject: [PATCH v10 09/10] gpu: nova-core: make Chipset::arch() const
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-turing_prep-v10-9-dde5ee437c60@nvidia.com>
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe52652-ea5c-488d-fc47-08de779b76c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: 36m9TImnpwYjXVWTISRE/Usaticd6TqyOKzPK8yhjOQCbDIEzhYvzVvyCl7LdW6rx+MJjmO/Q4O/u/whGzlDD35uDwQrtaZnTTVyvZjA6UcQ4qepZPVTyJY6pbUXSzujtRH7hJZFvAtAJyqIYRxGPK7ocCOx5TseT6QCKm0QRuInej0y/r4QkKx7kiYRDSCXDRnGICWO/hEEQu+sekulMu1ge6gQAEXD6aNq7DTCx4CzdWtnI5jhEFgD/f4a6NdehjVS6WyCBtfC6DR1V9jtJ/k848KuReCL1Mfw1jZWZyl4oP83gOXRoZbaKOocGYqS8M8fjkkczlaiZPJS43IN8I+NMEThPYmCOg/x4YOqLvqaEvl4c4vTPc0N6NQKvRM+jYm6gX1ZMx07WY6/NY0cGMTLilarvnPzJ7Q6nrfRnOTKrCrb1tYLEPm5eEt9srZDdoFx1VWbyBIhoqoaTj9MQ5E+oDPdSjefwFrfQmemIxO5Yq1xHV+pESe+Lx7TGUySzDEhEfu5ZSn/L5tb5P527tzFENyk99uT83jrQgkxYzQTC+wdosqyWasE0paw4a1BE7WRlWao+kfDET1WvlMHTHpltk7V+IwriACOcU7aQf4Rlx2GLSsxg9TpAispEviQ264jBZAqO/mUml7IjuwSgWm9XERWB847rnFxXUI9kkUgkxkK64QO79xvAkyQ5Dv+2MT/7ZA6NjtVktm82tbIyBwVhOm1EchKGUVYDc5RcLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTFJWk5mMHlTRWdzWVAvSjcwWDZuRVluWUdJWDVQdWVHc3YyK28xd3J1dXpi?=
 =?utf-8?B?UVp6akttd0FoekNLVHJOcGVuTXkra2lXa3hNMWFob3BUYmdVVVFFeUVMN2xO?=
 =?utf-8?B?WTA5MkJvcVlLY2dVVDZYR21HNHFPRElpTGZPbG8wUzdQTkh1bUtmTmVURHpk?=
 =?utf-8?B?aFNTUGh4MjBOWUw2SlBTb1gzVUd6RXVKZTBlTHkrV1QvL1cxZFpuTEx3VGtz?=
 =?utf-8?B?ZHpreDVtd3VkWEd4QjdhQ1EzbXl2ZlZtaGpXNEs0TkwvMnB1bmtjYmtIRTlR?=
 =?utf-8?B?NTc1YVp0OVcvOXVTYnluejN1NTg4bTkyZEhFRDNBUkozbjdBS2tMK0VpNkw4?=
 =?utf-8?B?N2xNSUlJY1NxMmo3VllLNnRHQVZ3VnhaaVY1aDRHOWhsVDJ1Ty9kRXh0Z1Z6?=
 =?utf-8?B?cmkrS21RUUQ5WTdLOEJ2czB0akV3NkJkcWpORE9SWVdDS1VOQVF0U0VyWEVL?=
 =?utf-8?B?YUNZckxaZVJrT0FZK2dHcW5QZ3ZJaE96UVNIWmtMVWlLOSszdW9SYnFvWFZQ?=
 =?utf-8?B?ajJ4UUxPRmFYVVFaWXhPamFYMG5MMlBHTVFuVFFBYWVnMndobHo0SDcwUWlP?=
 =?utf-8?B?Q0RKaTg3UkNjS0E3WU81SHc2bFFidDgrb3hlNmVnQXZuMGFud3Jlby8ybUY0?=
 =?utf-8?B?VHkzb29neVZxVUp4MzRybm1BcE9XOUd3N0k4eDduK3NwSTRwVXhPZkYxS0g2?=
 =?utf-8?B?WWtYOWVUMVA1QXp2UThvdjQyUk84ZmlySXFQTHZlVGlwMHF5aTJCMFI0UXBX?=
 =?utf-8?B?eWQxYXNrZm1LbzRkOUZiaDVxL2VDaDRqYS9ZVFM4YUFJYzF6N2k1U0FtdkNs?=
 =?utf-8?B?M3FaZms4cWpnZ29ibkthTlZrS0JFUlVOSUVyU2RrRU1HVDRVbDQzOGxEbnU0?=
 =?utf-8?B?djZVZWYrc3hQOG1mSFQvNHphN0VLRHdvVzhWdWdYUWZPU2NFczd4UzdOd3dW?=
 =?utf-8?B?Q2F2Z1J6N3gwbThEc2tIa00vNTczMWFzTERDUnJSTkJTQ1ZLYnVLdjRwLzBt?=
 =?utf-8?B?a08vMWR3ZmZibjJnQjZWaklOZ2dpa1AvNTFtTDVqS1NEbXlpOThVZ09GaW1P?=
 =?utf-8?B?bkJSUDlCM29jUnZkOVJucXV6RmJqQXRBbEp5UlE0R2FZM1lwN1hJUDcvMENL?=
 =?utf-8?B?diszc0hqbDEwL3NzRFkxQ2FhMTY0SGZiZmdmbzBjdHhMY1kzUmFIMnBGU2Z0?=
 =?utf-8?B?RUFpWjFmT1MvN0I1ZEN3Z2NSYnJJZjJlN1NUR1FFVG9Lb3BFSk1rZGJYUlRj?=
 =?utf-8?B?Qko0enV1SWVuNjV4RjRoRk1rQzRvSklmMGxDNFEzSVNuOUhiSFlKanVjMHBW?=
 =?utf-8?B?LzZKNkN1cjJwanVOZFVoOGVhLzdWYW0wQ2RJRGVGaVFDaTNvYmR0dm94c0pJ?=
 =?utf-8?B?N2ZGd0d6Ly85emdhaVZUWHdRdFB6b2tQQ0xsc3piT0FzYWljdFFPOHNuUXk2?=
 =?utf-8?B?dDRwVStwOHowR3ZLUU9BbkVPeGt3S0tPWnZ3a00rWlErQXVWc0t0YnBUaUww?=
 =?utf-8?B?bmpWMkYwNnl1UHlaSkJVVmpNYjV5am44bnNwZjBzVWlpNXhCak1FeHplZUph?=
 =?utf-8?B?d0lhZXZFZ1N2cm1lcDdmY1ZXMDVlcEsxK0dSRVFjenZycU85MDZHNXo4RXYy?=
 =?utf-8?B?bWc3RmpDcWd1dThYTDhwSGVreXpzZjZ4RGdpVXhPZHEzY0UwVmdaM3dzOUQy?=
 =?utf-8?B?bjZzTzVtaGhUTkxsSlpLcTFWcU1veVJHdUxBSjFnYXFZZWdMbUFPYXBsNTdw?=
 =?utf-8?B?VzBESDFJck0rZ1pqaDJxSWxHWDBpZlZjeEpsQUdnRmZXdndSMXdBM25ORUtB?=
 =?utf-8?B?bWFpYlFlUFR1NkR2S21XWkRqWnpTNzltazFmQ0MxZTV6djJYN1BtTHlGQTM4?=
 =?utf-8?B?blVWR1VmOUNVQXlURkhoc0FleW5XUXlxK0FuQ2xpVGgxZmFWZHlsTHlJV05E?=
 =?utf-8?B?dDIwRzdXR203cXlnSXN2RXZyM0FKYUhFQk9vdkxMT2tqczNCWkpDdFQ5UDdr?=
 =?utf-8?B?SkgwMHRuZmtXTkkrL0k4WUZhRExiNnoxWS8vbzRIczJNZUxEM0Q1RUxVTFdB?=
 =?utf-8?B?QlVwNytRWHd4aFJmVDN2bWVkRFVKRlpVMmpwQXNHdmcxbmpodTY5ZWUrNSth?=
 =?utf-8?B?Q0NrcjEwcy9oa1o0RTU0RmR4MjRKcG00KytwUGIrMXgwZ0gyZlBpM0h2T29O?=
 =?utf-8?B?ZnljYjRXUWl5VzRDYUJYeXNRbkk1N3g3WVVwR1ZGQWUyRWtVa2NFRnRSQ2FS?=
 =?utf-8?B?RVhyMXJpWXcwTUhSWlhDOGFwY0tDeW9MVVlKUUdEcyswQ3FPaXp2QnNuZnkr?=
 =?utf-8?B?bW9wWGV0ZW14aEx1ZHNQSVB6eXhOSDVTWE8vcGhBQ1dRODBjdWMyQkxiejBk?=
 =?utf-8?Q?8+ppiTNfz06KCQPys14w7GR2wsRb2BGwzS6K+9fsQfV1m?=
X-MS-Exchange-AntiSpam-MessageData-1: xL81/dhz0SmNjg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe52652-ea5c-488d-fc47-08de779b76c0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 14:04:33.0354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoI/DhNs9y/bmhpbNVVqSB/d9sqMNbzz7s6co5121g3s/zw8il0O3fxgRjk+9G9BXxvFKbPI38XNzS0edrBiVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: E87591D01B3
X-Rspamd-Action: no action

We will use this method from const context.

Also take `self` by value since it is the size of a primitive type and
implements `Copy`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 60c85fffaeaf..c14d411c6759 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -92,7 +92,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
 });
 
 impl Chipset {
-    pub(crate) fn arch(&self) -> Architecture {
+    pub(crate) const fn arch(self) -> Architecture {
         match self {
             Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
                 Architecture::Turing

-- 
2.53.0

