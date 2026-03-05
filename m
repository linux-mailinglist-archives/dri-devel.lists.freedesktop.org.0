Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBz/DrgyqWnM2wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 08:37:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0DB20CC53
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 08:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2A110EB25;
	Thu,  5 Mar 2026 07:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l+FoI+gf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013020.outbound.protection.outlook.com
 [40.107.201.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E82810EB25;
 Thu,  5 Mar 2026 07:37:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dwdw2LhKZtESshb2E8ZUXP/S9z82y1VmLQjRMq9wq1Ydj8J2T50pOig5kJfzuEcvhXqfbMaIU+DkSoc/Ygptm4RKnKtVWRhbqowLtfXh754m3GU2qOeKS0crTt2H6hQYms9gNZVrv0KpVbncO7qWZVmo8mEUObmlVja0DwOSW+5FV+27bh9s+gHG0MvhyaDZhp5f77BO0JrywAmuVnu6csv1ZOXzxrP8C8hYv84L8Qph3vwuZFxv2ClsNWCSP7fuKdqUYG4viTR3doPAn6jNk4O3Hjyybda8ww/HozccULeWK/N4pBs/5deJKIc07h14ADYeepxZfUQaIG/hDxBwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQPQkKPKZnHfpUOk7XBV8zbPBQFwjhsUVVF+oMvY54s=;
 b=WQzL+fWRJLT2U/RAmUon7Ye+COM1cbN23xkfXj2VbKsMIM40H3/K3pR32qKkRFHoarOE+IWt3dvon4iU6+TziWpvuAQ5WYjyq+CYGnXuQHyjqcDbmKLMN4wmEaXZZmfb9flqwB7C6l5lh89VOKluxsPUGOx8KgGI7wMiZL2nd+YPpXXY2eyNpaXWLzlSdNeaXLix0ohXqNUsW1ZXgDqBhvsG8MXu3Yrc2l/+Mz2SzLupy3khLOtUis1T6PIIIMJfeIfkrmMSTws6Q8NddWpIVwcVZflabxSkeEY3m+ErF/dF05mg+jhycetqjoiDVZiFh2XS/FnJkYZUJyPAjWTL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQPQkKPKZnHfpUOk7XBV8zbPBQFwjhsUVVF+oMvY54s=;
 b=l+FoI+gfxLslt7FKLEi64Icz4LS4rfeFE1pT5I4bHi06Sg7afxwT09obiV7ieETqaOrOdDmNbXMAncuKVOeShtrQztERuMSuOxOhNqEtnNFvj3Woh4dmGFJd7f74fcSGQFa3rA4843CU4PUVtEuOx3QqNyfBIQlT5q7nlgmGRL4zOev2746h2vA0ivG1pR5tZPZHlIM53xCGufJdBRsaDuyfCSu9ZI+0As2zVA0IXY3KdRoHb9Kw7nqK0b8K9i/94Fcqtc5QcCOYDRhUXdey350nt+XO/nIFdAubIE3NDhg5oqYs5MreOkWWgVfTu8kVvsEN5yGwBRiVRnUndlRY9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ1PR12MB6074.namprd12.prod.outlook.com (2603:10b6:a03:45f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 07:37:17 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 07:37:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 16:37:13 +0900
Message-Id: <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
 <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
In-Reply-To: <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
X-ClientProxiedBy: TY4P301CA0058.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ1PR12MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: 678677f0-4988-4b58-c057-08de7a8a0666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: NHkmnoPkLjTcaV0BwoVTBVYbYtyOUrW0YTg3of9f4uA8fHCWN93m8Ta5dK39pLNg/CrPGduhN80NLwPF4rXOpk4Ggdt6LXogyJujwRcM3FjbPO5J6ZhO2Vy7tJ2zAUnKBiq0vD45tqTn7pYlz3hbi3aUkadzil2dFve6fOEipD5Pdkr5MTclHOSEb9GbeuojAOzCzwQnzCN5OS7LU/kuq72iRhbFXy6qD8nmMkMjrzLgpXw951BYOsXaSjI9Cn+xlrelQD8/eqUDBf5siWXRHvXm96wNJtFcPvxNLiFV6EJW4LFipx8fgFpFQO3tron/sPBjrZkSD83fc8d8BKYxVvoWN3HTY5DMOxvaAVunCyyEWhmcBLR0kmYoc5MIGFhmBpLE9TMOdvhbpPCBiNozCxRK6UoG0t0W8Vy/HG48TH715JOkxx/Gcww0y8nYN2oxnS2ZNrSJVFVyhKIgVV3+3OjfCoZ8wUbtWzIyzntsjDIHjLOTXbOkIAlLFxxY9301XmeNqLLAkqkFVModljH54nDn6CqJYwmYjtF+GxxJQWHyUrcp3+HioN0X9wAGnnNrO5+JhVoZeKC7K3QM8DcywglVTOfh0ApLF7NGM+ZG5OtVs79kHEffv4+tHdFTRCqngtJsWWoEfp6rxiCbwKjX4GUtoKmT2/e/+2XS3JfqdkjREpKHQQGNwusCZ/wIuaofKmZC9f7tLrTNrjudseReMiDH5GrGxxLOkaq6zsrrNs8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnpCM2dFVFNzYnlsZCtOMUZhOG00d0lyWTVERUs5Y0lRRGQvN3BMWVlkM29B?=
 =?utf-8?B?cGxkL2l2Q0trek5yNHRtdlRxbzVWQ2VUczYvNDJVQzZGUnptZG1RL2F6ckds?=
 =?utf-8?B?ZFJMamJtMytoZmg1czNpTFh2SHMwdEFGOVpyNVFlZ1hTWmZvYmVWK2dLSUNi?=
 =?utf-8?B?cWtTN2JxZ1IrR3N5NUdqaUVPZktKQ080RHRVd0NMaVhlNEVUVks3MTlpN0oz?=
 =?utf-8?B?OXYzK05KRzlMeFE0UHNnQTRDUFhZUHpmTlFxRVF5eloyT2o4YnZydlFBaGNr?=
 =?utf-8?B?a0ovWUk5elVjVHpKd1FWV200WnNXeVhEODMzNkVYQWNCTnZHRkM1dEUxZ0hl?=
 =?utf-8?B?ZHlXcFV5MHpXUXA3TFhzcy9HNWlncCt6Smgzc1FpbU5JOFlaYjF0S1J4dFln?=
 =?utf-8?B?TnRodkR2eXFtdXExUVE5VXhlc1lDZWNIYjFJdDZPejVzT3E1S0kxdHhoRVcw?=
 =?utf-8?B?L05lT2tpamIvNWtTRlZKakhjN2I2ZkY2R2xOL0xUWnk4d1NLVHlXaUQ1SFc2?=
 =?utf-8?B?SlRrRmNBODc0eVpKUit5RDZua0VSaFNteDJQRDdMOXN2RjFTaGJsYi9BK0NK?=
 =?utf-8?B?d3U0alIzb1ZVUG9CM29kYjhNNCtaNmsxYnYzR0dKcUY1amtITlVBVTN4ZFdW?=
 =?utf-8?B?ZklqM2crZ1hwS0FKb3N0YXh4dno2ZXo4bEtBSlBYZXI3WHlWaDRWdTdwc2kz?=
 =?utf-8?B?SWEvTkUvamQ3V0lGZEI0dThkQlJYR01oSzJiaXJjQzMvUDEyR3ZxNjZzcFNi?=
 =?utf-8?B?RmZvVmZCbndWUHRMSHM4anBRb0dEWFBORXhsazF6dSt0TkNRaHpLT0FXVEdm?=
 =?utf-8?B?UXg1VWlROTcvTlZ2TCtYb08xb2RpZlhJSGtGOTBWcERMUTExaGlrbHRYV0gr?=
 =?utf-8?B?WFhwTXRwSjI2dW9JK3IrZEsveWYwSWRNSHJCdFhpSzNzU0pEK05JMFVVQXNY?=
 =?utf-8?B?K1BEbjhEbW5RRlY5RWErSWIyWnRRalZoZ3VOQUZFVGp2bUFLVW9hUXJCUlJC?=
 =?utf-8?B?b2l6OXlZRlZDYStWeGtLOHZaYzhTdEZZRThQNlU4dWNxUUJKQ0FyeWZIZmk5?=
 =?utf-8?B?MWxPNmVMTmZTSVlCRTFsNzdiYWpQTlBpamE0VXdOSzJuTEY1dUpYNk5iaVhx?=
 =?utf-8?B?N0o4cVA3UlZmTUJNb3BBV3dIcnpqSm1PSkZJcDFLTktIejMyZm5wT1B6R080?=
 =?utf-8?B?SzJFS2tBQlZKdjkwa21HU3JiZFpScFl5SjE0ZmU3Rm03ems1b2N1L2pxQXdX?=
 =?utf-8?B?TFR1ZnF0c3hJd1doVFhjV0FZN2ZwTldTaXppcE9pYk4vVFNJOVlPV1lNTDh3?=
 =?utf-8?B?VGE0Zk5QY3NhbjE1d09DdWVBUHQwMnpHcytJc1JPd2ZmRU1kczh4RHlMaXFu?=
 =?utf-8?B?QXorR1BkMHdYZTc2SXk1WVdJUzNWdjlUdXg0TzJpc2R3QjZLdS9NV3hZOFRa?=
 =?utf-8?B?dEdCTUpyR3FNVFFObTZ0TllONktiWmZPWDRKRUVNaVZkUUJGSUk5aVVXRFJw?=
 =?utf-8?B?N1J0Rk9wRjl4TDMvbUFZc1JJY3JGbWhVOTF1UzVTaFE0ZmVkK2dUUGd3dFZ5?=
 =?utf-8?B?cFNNSzFpSmVUOFVZN1N1NGtlWW95YjRTdWdGUEtDcXQrTk5sNXo5Uk5selJ2?=
 =?utf-8?B?VVkrY2VmZ29pM0FBeGV3V1grWFF6dlhEL3FGVVpKSzUrc21CUWJVbEg5aGFT?=
 =?utf-8?B?NzFGVzlnSWM4Z2R6WGhIYXEyeDVaa0h0QWJERE5TcEdmdGRtM1l4RUNxbkxZ?=
 =?utf-8?B?YkNwdFcvSHFJRHh3anJzeWZBeElOUEZYMnovVE1JZm1Fanpzbldzc2NTM25Z?=
 =?utf-8?B?TFdYMHpoZlZVNGRZRndidnhkVHFpeE9UY281VFkrNEhTWXVuaHJzZjhRdmIr?=
 =?utf-8?B?QmxlUS9JTXZPWUJ4MDlpNjFSWUZBdmRjL1kvMHFaVEFPUGNIRXJicHp3cmJu?=
 =?utf-8?B?Q1BCa2tqNnQ4MHZrWUcrSkFVMmwzQnJwandidVFhNmdSNi9iWWRFQ2FWUHFK?=
 =?utf-8?B?S2tQNXlWUWhLZi8ra01vYjBUbDBsWE53U2E0ZHBUMTZ2L0hGZWwzZ20vdWdI?=
 =?utf-8?B?ekdBb05oQXN1Wi9JQnRXNUdGL3NtVEJRV1h2NjU2ZjRIaGdZemdJMEhVemNp?=
 =?utf-8?B?a01zRVF2Rk1JaDdxS1AzTGhxWDArWVZ1LzNtNTNNYjRQcHVsMzV6amJDellT?=
 =?utf-8?B?UVY1VUdTUE1qai83WURWcHVvM0M1SmlGK2lGeHM3YUY3cW9pUkRHaTdqUmtZ?=
 =?utf-8?B?VFhYVjNFSHE1cHVtY3pyaVpLZ2dFMzljVVVoL1R5RHo4U280YWJzNXZObzB0?=
 =?utf-8?B?ZGF0WDc2cURRbkIvN3E0TEMrOFlOUjJGaE9xZFAxd1g0SlZKMTE0cWpWUE5O?=
 =?utf-8?Q?JlaCaAocm2x8vRTCstYfP1m1RZmG/YNbwWtj+9Vuxyy55?=
X-MS-Exchange-AntiSpam-MessageData-1: 6NsHgtXzQG/42A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678677f0-4988-4b58-c057-08de7a8a0666
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 07:37:16.7517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXQastBTOSFBHqp/q8C591Hbxpq2N18+Ku7toHJtTDaBLKDaod87hiiA/LDzc5cMEpP9TLXmcWokdViQC5CdTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6074
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
X-Rspamd-Queue-Id: 9F0DB20CC53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[google.com,nvidia.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim]
X-Rspamd-Action: no action

On Wed Mar 4, 2026 at 8:39 PM JST, Danilo Krummrich wrote:
> On Wed Mar 4, 2026 at 2:42 AM CET, Eliot Courtney wrote:
>> +    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Resu=
lt<GspCommand<'_>> {
>> +        read_poll_timeout(
>> +            || Ok(self.driver_write_area_size()),
>> +            |available_bytes| *available_bytes >=3D size_of::<GspMsgEle=
ment>() + size,
>> +            Delta::ZERO,
>
> Isn't this either creating unneccessary thrashing of the memory controlle=
r or
> unnecessary contention at the cache-coherency level?
>
> I think we should probably add at least a small delay of something around=
 1us.

This is what nouveau does (specifically `usleep_range(1, 2)`). OTOH,
openrm just does a busy wait, which is what I replicated here for now.
GSP command queue not having space IIUC is meant to be very exceptional.
I am not sure which is best, maybe Alex has an opinion, but also happy
to change it because that reasoning makes sense to me and I don't know
enough about the distribution of how often it would actually need
to wait to know if 0 delay is justified.
