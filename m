Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI6aAJOUrmmmGQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:36:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135CE2363D3
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E8710E107;
	Mon,  9 Mar 2026 09:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xEWH1N89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013012.outbound.protection.outlook.com
 [40.107.201.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4865210E107
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 09:36:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0RldAKpXuoUhJy5i7OMaH1SYAX2Y8i5yH5WsB7b3XJOZQQQIjWpSmq69yGIdzy/7Fj8TFu6QwH2dLvU7Ta30o7fODw60Q08XkSqQlnyn3X8Xywc3v67aBriF1eVlZ7YxtuQ0Lwusy0Kfx/UZrmhYxkGpVpmzW/zXQx9Ywy3sLKFetIh8zT/K9d6Q92uLYhiqdPDsK/CqCN4/6KUhiCtC6IHcYkqlkyr7p99puV8jCSs0cDcDfjHaS56Mj9csVJsTdm2xKYdNWABF4Ne9R53ZZyFiux3sUD0CXFPpTbF3VpcdPrfQWhGr9PKElDp8Tv0GKoRZNVBF1JyUFfubWOemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIPfRfVnL+EmJ323RKHbC5a2OpYMu5RnFXTTWOIZPQ8=;
 b=y8yOQbcz87yytnZA4BUxtbQZCtbPeFETkHkpbA9tvEBnRAZwVgmu+X9wGEkI5qrkqE+9oMTRQntJ1zat9UwdnDNhZQ7aHHd+8rwFicypVKLS9wltbfMpTF8J+hTfcEKSx2J9bMT2iWHzZEG8Mm8n9Aus6eDLLKOQhW0uD6zOf7vWK/zzMLG6glIFAcpqrUUUeuovEyCSVpmh5lzN/Bcl0wEUDnbmt50PxGRZTshIWvrohCuRo/FCPMvrVyFF7Ian71/TN/vgSVAXI+rY53JqBqT7ZVaZqRGR5RemGzknWNseT7KDxlFRjKGCHks9RopRomf7QJB/M+D0+rMbmpFNCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIPfRfVnL+EmJ323RKHbC5a2OpYMu5RnFXTTWOIZPQ8=;
 b=xEWH1N894XLrcgyxMX+cAg7QBSweDFRdfVx9UfPUNe28nBJGl8oDgCHY5kS4J30LNI6YPfDsHwnelTqe8TrniCLdmg/SdJMg8YyQ5qXzphzKLJF61Q+VYJtw0dE16XusQO+bc5GfLeJgcTuIPFABOX9wzskyAjFZwxtPkZjqn4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 09:36:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 09:36:10 +0000
Message-ID: <8bac1559-e139-4a74-a6e8-c2846093db72@amd.com>
Date: Mon, 9 Mar 2026 10:36:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: dma_fence: force users to take the lock manually
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
 <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
 <20260306113723.1f13010c@fedora>
 <b5830a15-af9f-47b0-a811-d43c0c3828dd@amd.com>
 <20260306122417.6febebf4@fedora>
 <6246da89fed7669247527fc36bfee5d92ada96e3.camel@mailbox.org>
 <0009b35c-265f-43ff-84bc-39fbf7109a3d@amd.com>
 <87197ff8d812debbd348ccb2befff855b30abb31.camel@mailbox.org>
 <DGVPXPMB8JB3.3VWBBX3YOK3G5@kernel.org>
 <c3a23b78-68ec-4ee3-b142-3ebf0131a0ce@amd.com>
 <63dc8c72baac42199ede72b153fdec71e0b4fe9e.camel@mailbox.org>
 <90b8cc84-7fdb-4116-827a-3fe95b4a8119@amd.com>
 <20260306162525.7ff98df5@fedora> <20260306164315.42524bf0@fedora>
 <d7bc1e7a0d33c675ef42135717ceee604bf0876b.camel@mailbox.org>
 <20260309091613.427a3d2c@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260309091613.427a3d2c@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: b8a73a4f-8ef5-448c-5270-08de7dbf4bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: LDuadWrp57FT/b1aH+ODzC/qD9p1fbWlXVCMEIJ1hmyvgPdutmS5cCWaiV4m431SW9TDE2Qufywp0aUz0OY2q9NUtRe0JMZ1Zt+H+7I4IolL0ViaHXx7ZDVJioaaBPqP33LMPdbvAforOBrbGLirJbIwSLv1grVcrcSsr8azYdfEDhjP1QP53Pr0A9g7jWlVt/VqtDPWTPRhSF0Q8F/N8UmuUQhqOvWMynNYEwmr27P9zRDREip42h3LPABlDSULfIv+Kjrj01qXXHvs4LFR4P5B0Up/MTGVq1FCrL7X+nzZsAqgsJZS1dG7mG1S+VbyOO8zMSDcpy6PagFun4iAzeui4AeM3M0/BVgkgtpJlk/l7Bw/XZkDJAGTBcgRjEy8o5UFEhzqnlyMMb3AQMzz+ataOawJKcxxSkXN7GYoOUru4kJRNgUYCbr1nm6Rf0B+nZ2LQITJOWFaaWC3eOtGT7QJ9lT5QXsfb2Z1MpbFS9bA9oxZHAYAd5EIyicLsqgMV+5dSNX+JPw9b6sktId6qFXG/qgMhVBxNIBumuLXTzakEm9Dkg236L+OT5w8huPQ+kHSDS33ubBVuKPLfv4LgpwwHTtDcUeDiUE+j4QTBAsQTyRH8Jhmhl1gCnOnf+Pkg2KkLdFjSrRRyqdE05luexYrL/1+s1HJ269Njpy7rIqVRpD8UwcAtKiabQdtutWg2SRcRy/Dvop0wrarXRwKLpcCazgl6m8k5JKbU9KhEW8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ems3a2NHa2hSMWdGVm1STFJnaWZhRWx5a1pPM0MrNXFYWlZhRE1xMlBLYTRp?=
 =?utf-8?B?bmgrOW5wbUhWb2VDTjRrTXJQK29PMTJ1OGs2aENOVC92OUdSYWo1MCtrU3FM?=
 =?utf-8?B?SGIvTXRNbGs5TkZMRUF3U0dRYW8xR21BV2hPSVdFUjdpSlI4cG9BTzVGei80?=
 =?utf-8?B?V01LMWlBcm90dSs1TTRVOWdDUTZsd08rMWpJUTJFcjN3TzhCVnFVQzhlTm5T?=
 =?utf-8?B?SHdRM1pFTjlKUHFsQ2dIdENmZDZyRUxFY2lZcE1GS3dOOUFab0VUUzNoY1hQ?=
 =?utf-8?B?NG9lU29yNzd6Szd2NjZaeGF2YVVWRVpsOHZ2b2NRQzB6cHlKRFEzejJBMjlQ?=
 =?utf-8?B?YWxsTUpDTUljUHFKa3A2T2JJd25oNUErTURpd0xYbzlYaTI0MWk1ZTVoSW0r?=
 =?utf-8?B?TmQ3eHg5VC9pUjdVVjBWU29rNEpyKzZhMDV5QWEwL2YyQ05pa0FZaTBMNE1U?=
 =?utf-8?B?aFcvYVdnbUtHZnhjS3hwVThBb3ZlM2NyZU5pTFJzMWNWQTJIUjh3WXRkaENy?=
 =?utf-8?B?ODFMdytYUHJLTnNkbjBRNUV0cWZTb1k1SUJOalpIWnFYVnZ5cTZJZXZQWkdp?=
 =?utf-8?B?MDlxVUZua2hMckNpckxzM1lERHVXODN3MTRkTjM0TnBCZXVQcGJKellkNnRv?=
 =?utf-8?B?dFIyYVlSMFRSRFgyaE10cWpGdlFCb3NzdEJSNy82WlJxcXFUVlVvMUFGOHBD?=
 =?utf-8?B?T1BGVHFUZm5YN2V4TVlDT2RmbWdGbUc5a0Q2OXZoUlZCQjZ0WXNjbEhIUE5x?=
 =?utf-8?B?T0dsL0liTXE4RHl5dVB2dVd3c0s0bHFjRmZQRE9YM0Z4NHRNMUkrMnNoMUc4?=
 =?utf-8?B?TEt6TTNKbVhoWVdZbUdsTmJrbFZwREExYVQyRHlVSThwT1VUckc1UHd4QXZN?=
 =?utf-8?B?RnE5bmV2UXE5N0oySVlUaTFzbTRVczRITHBNQkVGYmRZM1Z5WEVUalBPMzVz?=
 =?utf-8?B?eTd1dU5GUndhMjN2eDcwMCtleTM4ZUxHK3NWYnEwUUxlVFE1TnJIQzMvczRy?=
 =?utf-8?B?MTR3Mjl6K3FIUTdUVEJZQzRWb0l0aU1acnBGazgzZzYrT1czTDc4OWdQRmFn?=
 =?utf-8?B?ZCtxMDhXa0FCQ3BWaXdGeTNqWG01cjVZbXdpaTFVdHlySHVweHBaR1N6NGdp?=
 =?utf-8?B?RmdQczVXZk9qamdnU1Z0OVZSM0FPR2xoZFhkNlRxL1FYbHRsN0x6QzRwclVC?=
 =?utf-8?B?V2Q0WEZNTUkwWUxUSFRlYXRvZTJPUkdYOUxYcVB2UUVJS0h2TGIyRXRsSFNL?=
 =?utf-8?B?UkFHVzNlVkxDRGRBK3o4Q1B1NWoxcGkrRUVDYzRPeXpPRWwwK2dvSmFIeFBl?=
 =?utf-8?B?MHMreHBNNXJpWndYeWRadXh2LzhyUW5MSDNuRmpHbTJxWWozZkxPN3FvZWg3?=
 =?utf-8?B?VTVpWkFZYnp0ZXZ2aGR1WlNRazlXbUVCUXF3R0pBYjlBUVJWY1RBdHZCMzhu?=
 =?utf-8?B?aytvdXFlK3htelRSRjlLOTZscGNRcWtZT0dMMzRqTlBoMTB0eGpZUGtCOUtu?=
 =?utf-8?B?bmM5cVY5dU1ha3ZtNUZVa3h5K2w4K0J0bENpVm8vN0t2Y2VTd25xekJacFFL?=
 =?utf-8?B?cjVqcVA1SWZlcTVkeEpwRW81SHluTVd2Y21xczI5d0ZidWk5TlBkM282cWpr?=
 =?utf-8?B?ZHY2cGZqR3pCWVorbVFwcVM1RzNPU2tRaStYeFBoWmVKU3NidHVvbEE4Uksx?=
 =?utf-8?B?WDR4bWpXNEsvQllWZ2oxWkUvRjBFdHhJcFFERmsrR1IyL1V5QzJSbkNDQXFv?=
 =?utf-8?B?U2FWK3lPWWsvZzlkNkJEa2VIaVptTy8xbjh0WWYyWkt3Y3gzejNJK2hic0VF?=
 =?utf-8?B?S2RmcVZvUE1BcVVtYkdBYWY5THpyQXhYRHR3eFB3ZkFmOHUxdzcvMnNNdzdV?=
 =?utf-8?B?OWdKTkNYTHNRRDBzK2ZXVnQySHF4ZDY5L25kTjhSMmJGUVJuSzBlUjZJb3Na?=
 =?utf-8?B?TlQvRkhMdlpSQ2Y5YzFnNEsvbVNnMkF0WXZ6dERoK3RUQTQ5cUdqVHlQMXJI?=
 =?utf-8?B?L1FveDFpRHJSS3RNOWcyMkdGYU1ZWTZZdjhqTHpUSy9IclpqRXExT2hldFIy?=
 =?utf-8?B?NXVoRmExdXZNZE02OUU2Y25TUDRQMEhjODdkcE9yMCs3M3ZFVWdYZ0x0QS9N?=
 =?utf-8?B?ZUJpa2IrdGxaRFBHbG9pMEtoZ1ZYRmFTWEZJcGk2M09pM3ljd3Z5OW04V2d2?=
 =?utf-8?B?N0dFYXJ0RFgyWEJSam9GN0hHaEFCTmpMQjBrTm9BZGh5SWNtQ01URjNDM2hk?=
 =?utf-8?B?Y2hSOXc3NUM0UytyN2lSTGE4WlZxbkdiUjhUNTQ2dFlFRFA2c2hXL2NucDlk?=
 =?utf-8?Q?t/0uWQ7fYl6c2laC6g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a73a4f-8ef5-448c-5270-08de7dbf4bd3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:36:10.0246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCykDfCeUdvpRY4BMP+j/0cObpdcZ4RiA58fHDvqAzuMj1lCKe7FQM2xFuxjpgKW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083
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
X-Rspamd-Queue-Id: 135CE2363D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,mailbox.org:email]
X-Rspamd-Action: no action

On 3/9/26 09:16, Boris Brezillon wrote:
> On Fri, 06 Mar 2026 20:02:58 +0100
> Philipp Stanner <phasta@mailbox.org> wrote:
> 
>> On Fri, 2026-03-06 at 16:43 +0100, Boris Brezillon wrote:
>>> On Fri, 6 Mar 2026 16:25:25 +0100
>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>   
>>>> On Fri, 6 Mar 2026 15:37:31 +0100
>>>> Christian König <christian.koenig@amd.com> wrote:
>>>>   
>>>>> On 3/6/26 14:36, Philipp Stanner wrote:    
>>>>>>>>>> In other words not signaling a fence can leave the system in a
>>>>>>>>>> deadlock state, but signaling it incorrectly usually results in
>>>>>>>>>> random data corruption.      
>>>>>>>>
>>>>>>>> Well, not signaling it results in a potential deadlock of the
>>>>>>>> whole kernel, whereas wrongly signaling it is "only" a functional
>>>>>>>> bug.      
>>>>>>>
>>>>>>> No, that results in random memory corruption. Which is easily a
>>>>>>> magnitude worse than just a kernel deadlock.
>>>>>>>
>>>>>>> When have seen such bugs numerous times with suspend and resume on
>>>>>>> laptops in different subsystems, e.g. not only GPU. And I'm
>>>>>>> absolutely clearly rejecting any attempt to signal DMA fences when
>>>>>>> an object runs out of scope because of that experience.      
>>>>>>
>>>>>> But you're aware that both in C and Rust you could experience UAF
>>>>>> bugs if fences drop unsignaled and the driver unloads?
>>>>>>
>>>>>> Though I tentatively agree that memory corruptions on a large scale
>>>>>> are probably the worst error you can have on a computer.      
>>>>>
>>>>> Yeah, of course I'm aware of the UAF issue we have.
>>>>>
>>>>> But those are relatively harmless compared to the random memory
>>>>> corruption issues.
>>>>>
>>>>> Linux has the unfortunate habit of re-using memory directly after
>>>>> freeing it because that means caches are usually hotter.
>>>>>
>>>>> So rough DMA operations have the tendency to end up anywhere and
>>>>> tools like KASAN can't find anything wrong.
>>>>>
>>>>> The only protection you sometimes have is IOMMU, but that is usually
>>>>> not able to catch everything either.
>>>>>     
>>>>>>>      
>>>>>>>>> It all stands and falls with the question whether a fence can
>>>>>>>>> drop by accident in Rust, or if it will only ever drop when the
>>>>>>>>> hw-ring is closed.
>>>>>>>>>
>>>>>>>>> What do you believe is the right thing to do when a driver
>>>>>>>>> unloads?      
>>>>>>>>
>>>>>>>> The fence has to be signaled -- ideally after shutting down all
>>>>>>>> queues, but it has to be signaled.      
>>>>>>>
>>>>>>> Yeah well this shutting down all queues (and making sure that no
>>>>>>> write operation is pending in caches etc...) is what people
>>>>>>> usually don't get right.
>>>>>>>
>>>>>>> What you can to is things like setting your timeout to zero and
>>>>>>> immediately causing terminating the HW operation and resetting the
>>>>>>> device.
>>>>>>>
>>>>>>> This will then use the same code path as the mandatory timeout
>>>>>>> functionality for DMA operations and that usually works reliable.      
>>>>>>
>>>>>> Why is all that even an issue? The driver controls the hardware and
>>>>>> must "switch it off" before it unloads. Then the hardware will not
>>>>>> access any memory anymore for sure.      
>>>>>
>>>>> Well exactly that is usually really complicated. Let me try to
>>>>> explain that on a HW example. 
>>>>>
>>>>> Between a shader and the actual system memory you usually have
>>>>> different IP blocks or stages where a memory access needs to go
>>>>> through:
>>>>>
>>>>> Shader -> device VM -> device cache -> PCI bus -> CPU cache -> memory
>>>>>
>>>>> Now when you want to terminate some shader or make some memory
>>>>> inaccessible because it is freed drivers update their page tables and
>>>>> issue the equivalent of TLB invalidation on a CPU.
>>>>>
>>>>> The problem is now that this will only invalidate the translation in
>>>>> the device VM. It doesn't affect the device cache nor any ongoing
>>>>> memory transaction on the bus which waits to snoop the CPU cache.
>>>>>
>>>>> To make sure that you don't corrupt system memory you actually need
>>>>> to wait for a cache flush event to be signaled and *not* just update
>>>>> the VM page tables and tell the HW to invalidate it's TLB.
>>>>>
>>>>> So what is needed is usually a fence operation. In other words a
>>>>> memory value written over the PCIe bus into system memory. Background
>>>>> is that memory writes are ordered and this one comes after all
>>>>> previous PCIe memory writes of the device and so is in the correct
>>>>> order.
>>>>>
>>>>> Only when the CPU sees this memory write you can be sure that your
>>>>> operation is completed.
>>>>>
>>>>> This memory write is then often implemented by using an MSI interrupt
>>>>> which in turn signals the DMA fence.
>>>>>
>>>>>
>>>>> So the right thing to do is to wait for the DMA fence to signal
>>>>> through its normal signaling path which includes both HW and SW
>>>>> functionality and *not* just tell the HW to stop some ring and then
>>>>> just assume that this is also sufficient to signal the DMA fence
>>>>> associated with the HW operation.    
>>>>
>>>> Ultimately this
>>>> "stop-HW-and-make-sure-all-outcomes-are-visible-even-for-partially-executed-jobs"
>>>> is something you'll have to do, no matter what. But it leading to
>>>> having to wait for each pending fence, I'm not too sure. What about the
>>>> case where jobs/ops further away in the HWRing were not even considered
>>>> for execution by the HW, because the STOP operation prevented them from
>>>> being dequeued. I'd expect that the only event we'll get for those is
>>>> "HW queue is properly stopped now". So at this point it's a matter of
>>>> signalling everything that's left, no? I mean, that's basically what
>>>> Panthor does:
>>>>
>>>> 1. it stops
>>>> 2. wait for all executing ops to land (with all the cache maintenance,
>>>> etc, you described)
>>>> 3. signal(ECANCELED) what's left (things not picked by the HW by
>>>> the time the STOP was effective).
>>>>
>>>> It's currently done manually, but does it have to?  
>>>
>>> All this being said, I'm also a pragmatic guy, so if you tell us "no
>>> way!" even after these arguments, I'd rather give up on this
>>> auto-signaling feature and have rust drivers be forced to manually
>>> signal stuff than have the whole Fence abstraction blocked. We can add
>>> a warn_on!(!is_signaled()) in the DriverFence::drop() path for the time
>>> being, so we can at least catch cases where the driver didn't signal
>>> the fence before dropping the signal-able object.  
>>
>>
>> In past discussions with my team members we were also not very
>> determined whether we want autosignal or not.
>>
>> The only thing I'm concerned about is the RCU vs. UAF feature. We
>> already invested a lot of time and pain into that feature, so we most
>> probably want it.
> 
> Right, there's this UAF situation too. I guess if auto-signal is not
> an option, we could add an _ORPHAN_BIT (or _DEAD_BIT) flag, and have
> it tested along the _SIGNALED_BIT one in paths where we check if
> dma_fence::ops are usable.

You mean to protect driver unload? Yeah that's a pretty good point.

But I think I have an idea how to tackle that sanely even on the C side.

Give me a day to go over the rest of my mails and hack something together. I have another DMA-fence cleanup I wanted to run by Tvrtko and you anyway.

Regards,
Christian.
