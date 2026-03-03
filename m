Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDx5A0iSpmnxRAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:48:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612CA1EA5BE
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D21410E135;
	Tue,  3 Mar 2026 07:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ku7jNCP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012058.outbound.protection.outlook.com
 [40.107.200.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432CE10E135;
 Tue,  3 Mar 2026 07:48:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfA4oUHQt5zh+ZFTQ297E/p1X3NJS6+WObdbmVi/nhd+/ux+MGV0CpASZCHbYNECJNWnvblIHGu2+WZ5VBz9yRx+l7GwLYfFDAc7jHi/Z8w2LMW+pGJi5RQpXQFuZ04M2gZga3LvTCv9qyvzE6zazEf+DY0PWMp/F8hYS4Ljigdxbc7eXlFveX4Fw7LWfiqnVBHQ24IQxQCAoCD0hKCNGHYACy9uFVMDzSu0W4aInRyong5doWbaO0DjoXsk+alkJGzLB8QvMCx7p4Wkpbzew9WCUuH2w4SojxbO+vyKsQWVsiMti9sPRhXYUWQiK8QItLP5mhlBp91+LCqAvVK4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEyzxj7vCY+9ZXw0U5OGJrGGND7MnOA0cXdJFNLY37M=;
 b=NHv2TUrMQUVoNap0Y90hXCYLUWdAITvSp+e7uHyjJ/eUuCPJ3BvIThPpyotUeIRx01F/xIN5mTVtCzhmqUh+LNn7Mb/+Bgb1BiIVTcrB+NYONr2L9+24Ku2r9su982tp5CPPUAfdL0PNY8RIvWc1KXeFTUsn4fgblt9MOIG1zrYbVm9SACGOyzF12BQLvqIWXgkga+bspfTCMrsyTK4hAIKYGDuO9jRSt0wmyMJs8pzqqSdB5jDs5Qz9U9pVKAnACf5qq+OeJ9XAbBteZy5HECq2z7CjsAlGzawWLS78x5QV01KlxuWEPmHHxMxGWInrCRrn3/2E2AFJOESB+3SN3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEyzxj7vCY+9ZXw0U5OGJrGGND7MnOA0cXdJFNLY37M=;
 b=ku7jNCP8dkHsqmTEhgJSUZ1ejD0OwLH2kJnYOpw3ypAkIgirlJuY+7E+m8M+yz7Zj5hQw+cijyygwmIOxJfkULI0Szi+mA2hCi4irSPIreHFZ88erPUGFl9pAe7OBCmNk1R+mZf9xQuSaeC/OUQgqpUTI86vzcKy0w4eG+/7aFCUw1MusIc5yF8DnQ4Xl77s4yf97d1uMmXvCkycY4zO3O7mq/G7PNYqAV1d90r2NlsHWAPh/A/mYb9VHTyBGIdDNGNQAF8x284wjXZevFvHQQWoFzhJ1+qbbJH/57Y9kI07gcVWIMSf+TpD2AMp9cgExlhjlkdp+kE/ZblzVkaSsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Tue, 3 Mar
 2026 07:48:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 07:48:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 16:48:07 +0900
Message-Id: <DGSZCKMOFXNE.11NAD9FYO9EVO@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Zhi
 Wang" <zhiw@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
 <20260302-cmdq-continuation-v4-2-c011f15aad58@nvidia.com>
 <DGSD13LEUEZK.DXHNXLIRVY24@garyguo.net>
 <DGSTDZOHHCML.2B2UJOY4LLRR2@nvidia.com>
In-Reply-To: <DGSTDZOHHCML.2B2UJOY4LLRR2@nvidia.com>
X-ClientProxiedBy: TY4P286CA0130.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 680a9519-6d25-4425-4975-08de78f93824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: 7r2flLMsBMp5ivFVQ8CWiWdNhZcT5yeh3np/8RXn998oPyvLSUsw/AllkUvhcNgi78JsvK0MADIgdSvdEVkC8nEUv3lyBVMUhkoiy0+hmU3pdNc6AgVrXAXPp2iOkTUiTZLwO7/QniD+jT++2MjL3eCNoJXXZ5WeK+n5ApoIQVLIeYTBMPG6YTRM57jA74d5485QDrVKgIS/ii166/Cg+MLn0dalyYHs+Z0YwLDnAMNLKaQyQdlMs0Pr22fMnU8nAvbZnEOHDhEMdwLMjmluwC7qDxxwftO84eQTqrMK8VivVn29GUi8o5F4Ij0wPZog0+8hoUbiXqYbrLdiqIGOOKCdL95A4kOUMqJGE9o9NRSS7xaF75NmR5pI5Mp90NFVnj9sfy+U9LF3lRhIcVjeUhdgevM0xI7ENxUI7ZDZro8O89HMnNM0bPC0vT4p/XkmIUUx+fauT/9D7RTfZmphOKMRNjGPE8ZOmT9RyKGCfdK7oH2NH8/LwACnNSrLjGXYv9k0cRhsvFh13kghglqiAfkP7oNmjJeLqBb+bA1pOIxz3D1QZC8npHesm3xMPL9PaNHT+k9WrG2/5VTXZxThZbI+TUMiGIUt10AqyzkRxmeQfPebbqeEGyJmvcjZxbk9qm3cNH6TJWmUVOS0/eRPcZ0bbT1k0zeTssJ58/5z1K4vnTYGw8ZvSfDuIpFpkKuRPU6Y/oqBhw0r37zePc1bKuxOQ1VoWKmZMNO+Qii+sRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3UrN1lPdjhCdVo5VzEwSHZIZkxZaVlkQWNydjdzNVd4QVV0THJuM0ZLVWVB?=
 =?utf-8?B?czFXcE5OUlcxenNyL3pmWG1nQzJqUUFzMEYyMUNJVlpYajZZK0JYUzQ3UDhZ?=
 =?utf-8?B?N0x0RnRSKzZiVEd1Y2pJNlR0NDJJOExHZG5UM2YveC9vdGpCY1B0NFBFREtX?=
 =?utf-8?B?SkdWYVc0VVBhbXY3VE4xckwxYzRYSHdMeVVQd1ZkbUlXUnF6b1pFYjR3TVBu?=
 =?utf-8?B?Y0tjTWUxaTZ4WnhBL2ZoNEhVU3c5UEFnQU1qWHdvcUgrTmhDT3UxLzVMcTVv?=
 =?utf-8?B?cDhQa1dCeEJ4eGVzcGtWUEtPbjlIbEg3cjJ6SHdDOFB4b3RhcXZmTkJtd1dl?=
 =?utf-8?B?MXBDblVMYlVvaW5kM21BZEhyVldTc3NBY3BlNFl1RFRPbnJjQ2ZsMGo2d1V5?=
 =?utf-8?B?UldiL3RpZ2oxQmZnb0RwS3FqeTNsc1drZ0p2RHlydG5pU2R5WitDR0FETEVv?=
 =?utf-8?B?NlhxckdLR0J3V0VWWVh0RkNVR0hSaDcwWGdVTWYvQ0pCY2FpMyttUmFTWmVQ?=
 =?utf-8?B?QUhGMWxSb2J5eHQ3WmtBZEhqSzNiTGNHNGdRZGxkV1BvOVoyNGZma2pEWmxt?=
 =?utf-8?B?NTcyZ3JPMGlqRkEwRU1FMlJaL1hxOTE4eHBiTjZYSUVxcTAxdTJISDRMM1o4?=
 =?utf-8?B?T1AySUptbk82RktVYzRMOEUvYklabUdoMEEzNkpsb2F4TzdFaWpWbGpMTC96?=
 =?utf-8?B?Y2FSd0NnYWxZbk5HWUllUG1ITlFKV3o5UWJPSm0xekd1ZDJEVWhMdERuNlhr?=
 =?utf-8?B?TlhVTGZxN1NQNE9yQjN6NW41dUpxTFo5QXNtNVhCb1VYR0RTZ1VwTnVUMUlX?=
 =?utf-8?B?WHM1M0hKU0ZTSmJybGZRVGEwL3krMTVDUVh1b2dOM0lMMzJFcVlTbjE0UFlQ?=
 =?utf-8?B?OW15T3VJYnBZdUlWUE1GSGhLMzNvWU9tQ09DSDlkc1NXL1ZFVm4vOGtWdk9p?=
 =?utf-8?B?TXIvbzh2OXRZMWFxNE9VOVdyMXlTVjhjVTlHNUUxSjltUmE0S0k0N0R3elBM?=
 =?utf-8?B?dVJhVmFSY25Td0ZKTVV2dm1QMmFZci9UbGY1ZDdoR2U3d1NWMUVpdXk0b2wy?=
 =?utf-8?B?eW5vQzQ0R3ZGRFdYVWNiaGg5N1lORWYxeXNLMGFnU2hQZ0M3R0dTOVB0OGFj?=
 =?utf-8?B?czlmWW9UeVovVmVTY3BoOXZZS2JCNHJoWjhvaWY1TjFqUVJzdFl1TU53bFdw?=
 =?utf-8?B?a3dBM0U5ZWFBN2w3bHZmTFZJMFMyOTFZVDIxOHhxdFZEY1pMcjBWVldRZ3Bq?=
 =?utf-8?B?bmxVMXBIMUFKUms0YjBrL2FDT3B2aEVhSGI4Vm9EQVNPcmFMZEZpbDJySmtl?=
 =?utf-8?B?RjBDRHNtSzJhZkpnTEtoK0IwOFBrL0RjL084RExlQXF5bVRoVSt4UWdqWndT?=
 =?utf-8?B?WTVHelU4WEw5cWoxYWc3QTI3akFIOWdDVWhRMjY2Znd1R1NwOHEvS1AvK1ZY?=
 =?utf-8?B?M2xEK0Z3cmJVVmZQUXl4WFBIaVhKWEE2TmFJeFFrODB3RXl1U3BHZjFkN0FN?=
 =?utf-8?B?VmhYZjlCRGl4RFBpdmNuMHVhNk1JOXJZWHpocG8vNkZNNThpSmN5MHFiWm44?=
 =?utf-8?B?Sm9mcGNITTlVb3Q4SUY0TTkvaDJUdThucGREeGsxUE9xdmpjV2dIOVNMRUFo?=
 =?utf-8?B?UGlDTW1IS0M4b1J4NkVETFlXYVE0ODg0cENsVW9pN09hdkt5eHhzWlU0TUEr?=
 =?utf-8?B?MEhoQUlwRU9RUFVTNjFGQ1BXallvVGo2Vjc4M0h1eHBRdlBXQ3lNV2ZUZHlq?=
 =?utf-8?B?NXpLaTc1UHc1bzY4ZEl6bHlzb1NzMHZkaTljSjlPcGpMSnNIaVAwdDVSblYw?=
 =?utf-8?B?WDRCTHhFSFVsOXl5c1QrQmdxZTk0NWxBV3phVTEvb3V1NmhBSWNscmZObkln?=
 =?utf-8?B?QXViU2N6NzdUVWZUeng4RXBzckFXeFJxd0JFUWx4VG9vcGtZSFFheG9sYm9q?=
 =?utf-8?B?bkpIMzRFNEdHOHN5akN6QUdRMURySHFWNTF3M1pPWnhMMVNmZnB3ZWprczNB?=
 =?utf-8?B?K0xWZEtBTE5qclgxWHRIN2NSQmN6MVFuTlVmMmRGT0VEU2t4UHk4endsSkF6?=
 =?utf-8?B?U1hHbEZKNW1zU2VYU1JETUxHRCtSUStWcW9HQ3k4bFF0MzJMbWdIbzNrOW1M?=
 =?utf-8?B?c3ZVcmxGTkNYT1k0Z290cndiQVVDcXZETERJem9KdVR4WGc3WjdPV2hTVUF0?=
 =?utf-8?B?cStJQnZhMk1BNjd2UVl0eXJXeDFnc2NGd04wMHJKd1ZYemw0cGFjTXVSQy9s?=
 =?utf-8?B?REtHSmY0TEZoWldQS3U1L0RDL1doQVlyejhqVCt2QlQyNkJ4SHNOYnJpVnFD?=
 =?utf-8?B?M2dtcFd1ZVY1RmVsVU5EdFp2NUZ3d0h6ZXVOVkRTSzlEMStUbU1rdnVka2to?=
 =?utf-8?Q?WwRJ3QsEjXx/q/bChrwm1YJ4IbmkFse6FB2Mu7nln2PA/?=
X-MS-Exchange-AntiSpam-MessageData-1: Jw2x0mFFSyKcjw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680a9519-6d25-4425-4975-08de78f93824
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 07:48:12.3317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Q9NweHAkmUp+5ZvmsO2oBCWOwPjjdT2QTOBoNKtRTtYJEsU1s6PFVpJ7AIbsSAZXT7wJLC+4WyjIXvFgvSxIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9194
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
X-Rspamd-Queue-Id: 612CA1EA5BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,google.com,gmail.com,ffwll.ch,protonmail.com,umich.edu,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Action: no action

On Tue Mar 3, 2026 at 12:07 PM JST, Eliot Courtney wrote:
> On Mon Mar 2, 2026 at 11:18 PM JST, Gary Guo wrote:
>> On Mon Mar 2, 2026 at 11:42 AM GMT, Eliot Courtney wrote:
>>> Add a timeout to `allocate_command` which waits for space on the GSP
>>> command queue. It uses a similar timeout to nouveau.
>>>
>>> This lets `send_command` wait for space to free up in the command queue=
.
>>> This is required to support continuation records which can fill up the
>>> queue.
>>
>> Any reason that this isn't implemented as a `poll_allocate_command` whic=
h just
>> returns a `EAGAIN`, and then a wrapper function that just waits for spac=
e to be
>> ready when it got one? This way the logic is cleaner.
>
> This kind of structure is what I originally did (see=20
> https://lore.kernel.org/all/DGHRDFE9M6P7.L7JEOCLL3VS9@nvidia.com/)
> although it wasn't quite as nice since `allocate_command` takes
> &mut self and isn't callable from `read_poll_timeout`. Alex suggested
> merging these into one as it simplifies a few things. But maybe I am
> missing some better way to do it.

The rationale for this is that we don't have a case for polling for
command queue availability - the GSP is expected to consume all the data
sent to it rapidly, so we have a soft guarantee that the queue will be
ready soon. We also don't have a case for doing something else until the
queue is ready, AFAICT.

The current form is simpler code-wise, and if we ever need to break it
into two poll and wait methods, we can do it trivially when the need
arises.
