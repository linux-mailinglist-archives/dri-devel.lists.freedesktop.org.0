Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIJmKfbupWlLHwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:11:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346541DF29F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DCC10E5B6;
	Mon,  2 Mar 2026 20:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SkUmbpXd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567AD10E5B6;
 Mon,  2 Mar 2026 20:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1zLgfDfpMGjgYYYbc2HZuBL3NRLwofSVlXCKT1/EI/Mz56WKpuCKpdjE+lg2sQ/tkfVAW7GZOBATUkg0F+OmWnWSeS1JTcHl6RHTBvzSamGIKjkoxHxeGgMt+8bw6Oq7wSjLNgU4ebYnBnUZoZiH9g91FWZBCavFLC1z3HAvNllMe9M2doDPGoXxmnJKPJ5RfYkan92Fhu+AybP/N4KUDuOIk6rKkwlMxGbj277PyK1k2+KqBCiEMYgMom0UbOE6ct5w5uUwDydSrba3o0alclPi7X8G42gL11JFNbOkpVwdHYrfdw1sOyFHmIODrM0ZZcyZ0tblNRGb0sHLeEMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYwDY8ip8wvymxeuWmSP85R4oOWZrHohLLNPVgb2zus=;
 b=FJgziLsBfnoExW0/m+RxJyhq4yiXXcROgPQ21rZYLEoH40OyrUDqeUjUXPK97FoD3IcPsp6LKXyBcwxG+EOJYX7yomEUd4hX+CU9bgHRZVqFNx6N2+7vAZUMzy91jVP8D6MrouI7dPYr+TajX781/QhWUog//7Nrhj9aq7AAX2DfNB5pTkk0upqffuknTAxfUzqeN8TJr55yVeU4OUh5YCa9NvqKpIl/HNTCt6O2utQ3WVQp1NGiFjw/Dt4odI9Hq0NGlTMhIdal/Pg9UijfhDhwwFcebw+wfDPQU9hlSHC7fTjNv2nWqL1Ecj8ddMan14fC6+cz5uLFs9D5s+0e4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYwDY8ip8wvymxeuWmSP85R4oOWZrHohLLNPVgb2zus=;
 b=SkUmbpXddewZ/Nw5FkNcY/dxaHWCq8IPp6D3dCFowa2/9zR8rqYm4OZftjCY5Ph2Jvqpmju+TFRIN7vfcDl62gNDxmpUOKnjFM5nb0UbWnZ2S5Bm5Jv+HwOGQyK1RnAkH6bHJdm/3XEqKwEaWH3gx3Wwro7xlzA3WxITYHtoyCfp7DSDWu6K4ko0eldmFb3n6FjjxUkn/824tHs9egO4+ONPsyAc0h96Hnro5thRkHPxqP4hgpxvOak+XnM99aSPTWHTucN3qtxrsOfTYmQWMqIwiBlX/AxoPALF1hMaKbA7YYsGVM08zmVnemFwAK129aIkYf8DK+74m1K1svlKAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM4PR12MB6663.namprd12.prod.outlook.com (2603:10b6:8:8f::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.20; Mon, 2 Mar 2026 20:11:19 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 20:11:19 +0000
Message-ID: <855853e7-f9cc-4661-bb62-c8d4fff86a76@nvidia.com>
Date: Mon, 2 Mar 2026 15:11:16 -0500
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v8 25/25] gpu: nova-core: mm: Add PRAMIN aperture
 self-tests
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>,
 joel@joelfernandes.org
References: <DGSA61C5BMSB.1RFPQAR3NFHKB@nvidia.com>
Content-Language: en-US
In-Reply-To: <DGSA61C5BMSB.1RFPQAR3NFHKB@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:208:236::32) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM4PR12MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e845b6-f1db-4aea-aed2-08de7897dd89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: Ht7M2jD4OXmh5MvQEkREY3j2utlJ8p6xA6VhICK0+HikAwsMZXeihcWrD8UNuxISfvKUjL4EvDwInwG4VNPsgpHUgL2VYtZjINzuGjwNKCBI/YuFGWRbL0u30ur4PZVNdsNBg5KwbuXtd3iP09TLXZwT6WJM+vJ8858GagFGpk8dBoxOMSJSjZLS+8uwRY9QGYkMbsVfDdBAaboviuseaudngG0pcdt451ObPMo/souA1YZAKxSk4ntzcTYOTDloe8gZGBWMLLQSxkzGrRQNegk3lpDOXyh0DEnnGKcDhDMeWs3/otSBOAhJIK4dl5BcozrcNuI0x1+74I9Bf5MfpmLBur+OSr5KN4h/Ns7DyOarhaCQtJcMNQFPe4R7mR4tirgLOfcs6gAdEeCNl7EMB3QJbuCV30SSsXpUW5qtkMABAolPxsJUvcrziNpHAHMShMO6IdCwMNG65SCITzaKI3VFf62ZwsKW1FRUAJjQ1K+fEf0KuI/RcrAR8CL5EWObrZsspR0d71a/SeLPaoj1Pm1NnJyijdnof0LYtqnm7G7/Dg8zqXJNs599tMchNEEs8pvuV6Cl6Ntd+WX7+gGOCDwOc8FsaYPAX2sEMtW+0l6Tc83RyQ5VBX/0YzCY1xb1V2YRBR6jMgO/QnjoZFbhp1HuYC3p5T8tL4s9C2BBi1qagWfRjjX4FqL4h9ZNigdIvBQ1z9QZk3wn6mv9UCA1ZZzx2qHmGbNhUK2KSObuD3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEJyNjBtUFV4cUNlRTNQSjVCOWdKY2RSRUM1aUdRNzB4YVpVeFRXb3oxMHhk?=
 =?utf-8?B?QzlkSWN5K0NKR0tLdWgvVlo2N2RraysvRlI3anFxQnhKdURaUFVLTHFsY3ZT?=
 =?utf-8?B?MkdSRzJ1RTU2cHdCSjlyZUc1VUFXRDlaV3Z1bUN1bHdBWWlkM05WemdVSUx4?=
 =?utf-8?B?aVRpNVVCeGRBUUlveFh3OUlTbUtCRjRwTHp2KzE1L0tVMDB5bmVMeEFudWFr?=
 =?utf-8?B?Yi8vTGR2WnJyZ2NiYUYxTFh1VzdXNEFpWFQwekZVaWJkOTlXaFNIY3kxVThS?=
 =?utf-8?B?cHZ1YlZGV3R1cmxRV2NKV2tSV1liamw4L0tnZTg2VlM1aDd1OUZvaUh4aW8x?=
 =?utf-8?B?MWFnL0YyMUNUUk16MjU1MjliWTZ5bFhncTRHL1NwT3ZubGx6ZVBwSzdLMmor?=
 =?utf-8?B?YXcvWEpPc3B3NEFwNFY1Qy8vY3dtalVuVHhvVktJdWFQUjNieU5JbUh3aXJW?=
 =?utf-8?B?amlMaW9PWGNJY3ZrVnBUdDh6aVFQTUpvaFhvZEJ1ZGhhR3M2dTlPNjNSd0lC?=
 =?utf-8?B?bU41ZTF3a1FJQ21KZVZHL0RVbm5PRUcwd1lhVXEwK2RTYWlhZlhwMVpsbzMz?=
 =?utf-8?B?T0lnTGpLUG0zZVljdUJCNllnWUtVZmw4ZUNjczZJUC9XeGllbFJOVFNtbkdr?=
 =?utf-8?B?bzRhUktIcjZ2bE05cFovb2MvOHlyWjFZQ1NsSkF3VmNGWU92MFNiTU5RTlN6?=
 =?utf-8?B?ZjE5RlpTeDRzT3ZRV05aeXIyQWJIQ2ZvelpmUjB5dUdiMkVGWHF4ejBzelR1?=
 =?utf-8?B?eWkrbWxaV2duRGg3TFFWL2JiRC9iSHBWNEJuZWNXZzlLQm9xeDgwZWtyeEo4?=
 =?utf-8?B?VE03NVRMUWtNS09iaDJWUlRHWUhMSnlWc0UrMkRrdnFIY002ZWdpTkNVSW1R?=
 =?utf-8?B?L2tFY3FJaW5YUE1CQ0dIVkgwMkZOckE2VkRrK25JaDNDbVpKME50R2lvZVpP?=
 =?utf-8?B?YVBLNmI5V0ZCd3hiWmxpUlBmVlV5d1JxVERQbllybFM2d1NONDZmWGNHTGk3?=
 =?utf-8?B?NFl6MGl1ejJJdmk4ekRTaE5wNXZjOHEzQVFMbEI2VkVqdGQ1UHlMK0dkOUhE?=
 =?utf-8?B?ZmxidjRiRVNOamNvUTRwWFA5cmMxUGlRajJ2VjZKZUptcU01OWUyR2ZBM0FE?=
 =?utf-8?B?c0w0TUpOS3VrVEEzR0hvM3VLYTBDemduZW5nMytzZ3JTb241aHcyMHIybnFB?=
 =?utf-8?B?RFRuWCtRak5SNmQ4TmQzL2NncE01Nk1Uc2NIZjBQVGJTMDFqMXM3dnl6cDM4?=
 =?utf-8?B?aDdFeGhrNXBPMTdpU09zNlZHY3prL2Jabm9yMjJreXZJdTNZNG5nNVdyWCtt?=
 =?utf-8?B?aVlZNGlNU1JPM0hNTlR0UnhPZWZ5Z29ZbXdhUklSKzArcHVoNkI5U2lwL3Fw?=
 =?utf-8?B?Yk4wbWlhT1d4a2Q5UnZvYzNZUk5VQ1BvVlExVUpIdHcwNUpwZmUzNE9LaGd1?=
 =?utf-8?B?VVZySHRjQkt2QUpveFNJZnl5SURqeXMzWkYvYTZ0NmJRSWRFUmE3UkV6ZGxP?=
 =?utf-8?B?bk0yd2tvajBSdG4yNmxiWUdueHpPOTYvQnBVT0lGUFhWV3Z5Q2M2eXlwazZV?=
 =?utf-8?B?NFBuWXJKZVpieGZQeFZNcmUvekMyNG5DKzcyY1k3TTVaS3VxV3ZUTEtISUpD?=
 =?utf-8?B?VWlRRDhxckQ0VkttMk1kUVo5QkxGYzV5YkZ2czZ1aEMrTGl4b1hZd2lvdjRk?=
 =?utf-8?B?dG1iYXc0eTQ0Qm5ORXl1Y0hSYnkrK05rRlg5SFA1dGZ6M0JsS25BcU4xdzUr?=
 =?utf-8?B?WXRuSHVFYThjUnU0QWthMHlYMnVFeXE5bUYrN01WYUFndDhhV3dKK2E5aTdz?=
 =?utf-8?B?Z3YzQ1F5UldhVEk2eEpGZGhKUnZPbWVZZjhxOVdWY0dSSmNHR0VpckpSZWVT?=
 =?utf-8?B?cFpTQ3ZMU1FTZDlncmN6NUFvdGJvVUhWZmVXUlpYL1ZTVVdDbUNZQ0JsdlZD?=
 =?utf-8?B?cEp6Z0lIZUF5SEtSN2xEQ3pEcWp1T0pEa01EMGhMNUtCQkZkVzVQQmdlbmJ4?=
 =?utf-8?B?MEM3SThQS09MeHVBcC9lOHpzRnFkSVUxSVVVOEhGQmdhaEdBZ3R3RWVKU3BS?=
 =?utf-8?B?RWI0ZkIyRFNKbUdQMk1XYjZvMWZGN0JnTTk1aXVnQmVrUWxQTldNQlFYcERF?=
 =?utf-8?B?UlJvY3ZxMjhWVkt6aWpqZWFoY1p4YnIyaWlIZnBtZkx0Tm9CdGI1Nm1MZUN0?=
 =?utf-8?B?QndyRCsxREJ0MFNHN0RMaVF5ZGJmYWdxU1AvTkpyTWkrY1lnYTN0Tmd2U1Fo?=
 =?utf-8?B?R0FyWEVEKzdTVS9xeVBVKytZSlhweTZHNWNPcHljdEZRUU4rS3hZeXRCMnh0?=
 =?utf-8?B?VWR1ZGdxU0VidnBXNGxrN0tEMFZwdzdoN1BYMm53Wk0zSW91OFR2Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e845b6-f1db-4aea-aed2-08de7897dd89
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:11:18.8967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGLEoxKZKzRcfc2382ps0TXmCH+F7hZbxU8k+L3QAsvuygAN4yiAc0AFXLMKdoftRzY2fFLpOKK61uTlpWD1kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6663
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
X-Rspamd-Queue-Id: 346541DF29F
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
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,Nvidia.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 09:04:07PM +0900, Alexandre Courbot wrote:
> > +    // PRAMIN support is only for MMU v2 for now (Turing/Ampere/Ada).
> > +    if mmu_version != MmuVersion::V2 {
>
> Why is that? I thought PRAMIN was also working on Hopper+. Isn't it
> orthogonal to the kind of MMU used?

The PRAMIN aperture window register changed on Hopper+: pre-Hopper uses
NV_PBUS_BAR0_WINDOW while Hopper+ uses NV_XAL_EP_BAR0_WINDOW. Our
current code only programs the former, so we'd need a HAL to support
both. For now, V2-only is the safe choice. I've updated the comment to
explain this.

> > +    // Test 1: Read/write at byte-aligned locations.
>
> Let's split each test into its own function for readability.

Done.

thanks,

--
Joel Fernandes

