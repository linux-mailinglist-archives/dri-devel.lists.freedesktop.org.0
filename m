Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN0uGpx5lGkfFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:22:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8206114D185
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04F610E4DD;
	Tue, 17 Feb 2026 14:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fBequS29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011068.outbound.protection.outlook.com
 [40.93.194.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E3510E4DD
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 14:22:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0GzLCX7y8lZuZPju2W5TLEOtKeG8THnbdcCyiRYIVIKsIdZHtZNZXqc+wx0OQdezL5hxwKKPXHiEDXUjxBpD2aVhmGq/7LO+kQ1hlAGRoH5WY+uWx70/ayIjqhvGReO6B0vGIeU3iLMqeRUqVYgY0/Ux+y/tU9XZung/kJStk6+7KvBSIAPOyuNUStThub5PVALkSCBHcEa+UHSCZ9o0V8x5LzBAXPRtp7a4MmBHmxm8mz3Y36thAA71cJwME1zCJFxa6xzSfQXEAXiOGpHJCQHKJjRCgYTX6G0JwIupFJW9oTjJ2Om/GuRpJS7WU88Nj387PvbVFm8FNLkPWnD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhhV+9v4NpGOACnTsL/P7szWekhZM4hSVD1h9k5L3e0=;
 b=TLGVihmz2R2xnrfBU9Tm3SQPVxrdke0K1rms8F8oYr/doe8X/7vIqk9SajDUAMk8KhO35CwKHuJQ6Y7lGrMBRMRTMlz33CvnOfS/Ua2v+mBGZdxZq92ZXdBkumC4eNun5mDyl8I6BAqJQCSgoIoCzuMMwOtqx6KmAL9mtcDYAxyO2a7lPnzxb4/c1A2m81hRNg+Cudjd9rMy4AAnjFJuITotOD5TOCqCelaJEWtJgVLdQOfXpLaDs05yjmNHkblGt8ZrNHaVGTbymtACzq79Sgq9THEKc4ndZVPdj+Qd3721QdxwcsMNjLlZpuk90xHpNvul5vXMTnm9sWl7UsLwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhhV+9v4NpGOACnTsL/P7szWekhZM4hSVD1h9k5L3e0=;
 b=fBequS29lPDTn/ESwrNM5RJU/4aDQz1NNttNWdrBJuPw41mOKaePgpAoCnrKizrnVcXMrI5YmYvMkRJjU31wa6OeTuXbWvdnqWfgM74N86VPEwI48qCcAfT/bYkGjCHmnE/y1yJPYOU+uT3+FtIXX50cDRZ5OavJLyOXMmcvXTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7032.namprd12.prod.outlook.com (2603:10b6:303:1e9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 14:22:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Tue, 17 Feb 2026
 14:22:10 +0000
Message-ID: <50ee6f3f-82d3-4eb6-ae3f-9f032f3caf1d@amd.com>
Date: Tue, 17 Feb 2026 15:22:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
To: Alice Ryhl <aliceryhl@google.com>, phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com> <aYruaIxn8sMXVI0r@google.com>
 <20260210101525.7fb85f25@fedora> <aYsFKOVrsMQeAHoi@google.com>
 <20260210133617.0a4be958@fedora> <aYsvc3Q8h-Gg27-g@google.com>
 <20260210142631.6f8a3411@fedora> <aYs3VVH_UXMFa5oC@google.com>
 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com> <aYtJznZcCEYBffil@google.com>
 <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
 <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
 <CAH5fLgjNS1e420UX7muyEPWX3dZ-JsA_uy3=PM7QLA2NuoKJmw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAH5fLgjNS1e420UX7muyEPWX3dZ-JsA_uy3=PM7QLA2NuoKJmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0273.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 19416f0b-7068-4794-d688-08de6e2fefe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmFpWjJiQk5kQ1NnNFBZZ1NtVit4REV0c0k0MWkvTnI0K1NIK1drUTByQ0dK?=
 =?utf-8?B?MStkblFnQ2p4STVzUFlHSWFnb3ZIbHkwbUQ2d2F2S3Nib0w1empPSmlRNmcr?=
 =?utf-8?B?Qk5vSjdJbTRKVEtVOHZiYUwrWCtKeGwvYitNdHdxUnBXNmJDMnI5bXlCKzRQ?=
 =?utf-8?B?OFNWODlzSkhhd3hhTC94NUZiN1B6Y2x1cEtvQ1EyYnlsUjBIUTBiOS9aRHFx?=
 =?utf-8?B?bnJiTkQ3ZWZyYzdpT0gyK1l0WXpLN1pJQjFBZTVRUTBDdWMvNGNlYjRpN3J5?=
 =?utf-8?B?Z3NLVndCazBRc3BGOG9DYXA3TlpwTHN6SXZkYmhweEFLN0traFVkcllpSGVo?=
 =?utf-8?B?ZXV3aHk1OFBSRm1GMjI5Z3J4L0hEOExvSHlDaVUzdm9ML2tiWGZxT0Z4UHB0?=
 =?utf-8?B?Q09sNkZMNWxTdHFBZmxsUTRBWFMycjkyclR5cnFCZEhTd3RORWpXdDBwbEov?=
 =?utf-8?B?ZnNvMGpWOUxTVE9WVTQ2V1hkK3VVUjI5dlpuaDRDRjJFeTRFb3BlNWpUbWFZ?=
 =?utf-8?B?alRCTThyQXQvbStZNnhMZzJZbTllS05ZZVZSYmdtekl4M0x1TTJZbE15VDl5?=
 =?utf-8?B?ZVZ0ZXR6QU9Xcjk3UEZDczF3ak5mYnUra0hDUTB3RXZzZTBKUG1qR3lTTnNm?=
 =?utf-8?B?UDczUEQrU3J6TjUxVVUzeElLcTkvazRwNnl3NG5ISS9rVUduUHpOT2pUdDUy?=
 =?utf-8?B?bjlXcjJwbzhlMkRTZW5SMVUwZGl3UGdzQm5MbjdvSzF2bi9OeVlWM0dRb3Qv?=
 =?utf-8?B?eTdHVEp0ZkNoWnhCT1ZIK3lVU2RpVnFNYVJGUTF1bWtySXV5MWhpQ0pGNjBs?=
 =?utf-8?B?S01LdjVNa3dHVzNDai95dUtiZXZXdFo0TDdRbGx4cXgzS0xYckNMNW1DaHBS?=
 =?utf-8?B?ZC82SnZvcWF3aUpuSHY3QitOYTRCaDhEN2xuSVNEaVJDcXRUUVBHZVBxUDZR?=
 =?utf-8?B?OXR3a3pUcFVkd1V0QnlJUUFna1NDaE9WZ3dQbjRKNCtYRDd3cWlEYmFHVU5Y?=
 =?utf-8?B?RlVCc2JwRjQrck9xa2N0TVBBTDZaa1BUaHR6aGZlZUVmSnRONEhQQVFBcFBp?=
 =?utf-8?B?d1hYZW13eWlpSk13S2NzRTJHWDVtREVKQ1VmSnZXUlNkWXJtYzB6cFNrMXNl?=
 =?utf-8?B?VVMvR1dUbnlvR0FDRm9oUFlNMkZ3THFwWHNLREd5QXJTL01tSFg3NFAyWFI1?=
 =?utf-8?B?WEZ2aDk4Q25GbVMrM1VDVEJLakFObWFESTZmRzU0Z2liZ3FXT2V6Yk94ZXVh?=
 =?utf-8?B?KzArcTF4b2VQZDdtZi9kUW1JTXNHL1VmK3B2akEzNlBZbzczQkZoMUZZWnR4?=
 =?utf-8?B?QXpSUXhYMk1jRE9aY1RaVFNYMlNMNnJORGhQQk9SWUc5eStPeGhiSkZ2ZWZ4?=
 =?utf-8?B?MzlTUHlJMDZ1VUxha0FDOW5CWmxFdndZak96NnRVbDA0VU00NG9LMENMWDhx?=
 =?utf-8?B?Skh3Zy9WT1R0OVBQTUtCY0M2aEtlWERWb2Q1UTVSaTAxM0p3TjBuNjg1RWt1?=
 =?utf-8?B?cktDY3BEczJmOUhxdmErOTJseEp6KzI4dVM1SVhYS1dnOTg2Wk41TkNjcmJO?=
 =?utf-8?B?WmJadHp3aG9CbFhCT1RsY1R6VVAzRW01RVY1bW1SRXhneVJDRXkwZGFGY1NC?=
 =?utf-8?B?UzkyRGRWSXI5ZU04RnEwK3BJaXJrdDhlaTFudEQyUnZuK0YxRFQ2WjExVjR1?=
 =?utf-8?B?U2hhcmNmS0Zja1hDQTRaTjVrOUlIUkY2SGN1SlI3bDdqZlFFRThZYVgxNnVq?=
 =?utf-8?B?ZW5KSGdZTkt0S0RPSjU1YTFLMWpkZisrOTAwMXF6d08wa083Z2Q0bk5xTHVS?=
 =?utf-8?B?NlhnSTRXSVZ0Z2xPVmdyeElpR2EyZUl4S05ja2RkV3JZcDMzQ0orNHErMXAv?=
 =?utf-8?B?d2tNb2VDb0Z2WjVZUGtReFVYeXptMFJmWkRMRzhQZEl6WDNuRXFobDNGcFJP?=
 =?utf-8?B?WjZpVmR6YlVxWkZHb0xUZ1J0amNjNktsMEtObStHYVNSL2JHUlZ6cTZjRTNP?=
 =?utf-8?B?NkZlTkkySFhGVGh0VmZzTElUUWxiNmxGS1oxdjlsZFF3WlF2R0xYeTlCLzk3?=
 =?utf-8?B?YW9iWFk0d2lIcFE1ZW54VlFPdjY5ei9xVGllL3BXNS95WTV6Tk14Q2U1dHp1?=
 =?utf-8?Q?rUOo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJ4emd2REt6UndFKzh4d1NQS0pLNlh4Skh4Zm9sSGpZWnQzaUlrVjdmMGJh?=
 =?utf-8?B?aXFNTHdhckN1NGRkOVNnRUNGRmNqY1JXTkkyS0UxcmxiT2hhdVRQNTJCR2Za?=
 =?utf-8?B?YzJKMHhxWXQwSkV0U2pCYnZ4QWNwM2xVT0diSVFvYjBTTFFtZTdzeFdhekxQ?=
 =?utf-8?B?M05TWmV5MzB3dDNCeXNrSERidUVsQXgyRVJDL1o5VEpkeDRhSUQwRmxUSVBu?=
 =?utf-8?B?WmJKM1FaSWdPOEJtMzR4cHVibE5hNkMxbldlMzhDUkkveVlENjlOWGtoNG9R?=
 =?utf-8?B?eXAyTlRTVk5rSUtSdCt1a1B4Ymw2Zm9YdmtRLzFrOC9FL3NMNFM4eExhb2FM?=
 =?utf-8?B?NW5wQjdGZ2pOTTk2SklLa01BQ0U4eGdObU81ck5NRlNNcXBZaU8vZ09YNjVn?=
 =?utf-8?B?S1ZzTnhiYzR6Zm00WllUZ000WE14SHd4bVA4SmhyL0tWTmJkTTJIeVBGRGlF?=
 =?utf-8?B?VG9CTDNPTXByQ0VVaE1SL1JieVFmbWZrTWJYUURYQWcwa3J1T3hHWTU5Umly?=
 =?utf-8?B?d2drcHhuWDdMbGMvSjE0VEZjRnZKR2F4Y1VPWmsxZlJwdktJd3gxS0taSjFk?=
 =?utf-8?B?L29YeHI2OFlBSi9FSWxVTjFxeThRMXpZTlNhbWxuTmNLN1k0Uld2N0xCbE4y?=
 =?utf-8?B?aVo2a051WDR4R3dCNExyaVp0WWduTURUd2lTNDlqdTByL0JTRzlJVDZva0lr?=
 =?utf-8?B?VHlxQ0NOSEFpR0hUek45OEFkZVBkWDlYSG13aythMjZ4aVV1a0Z2dloyOHpF?=
 =?utf-8?B?TU82Tm0rZVZ2VEV2a2VOSC81UUxncy9QSTNlS1Z4NmZQZnpMN2xEeFMrSFdZ?=
 =?utf-8?B?WlhtN2hMRVdmSy9od3ZZRnJRM2RnQnY2QjhsbHQrRTZONmN3ZnRWK084TzFs?=
 =?utf-8?B?Ykh5a2hZeXVRcTkwWHJLZ29sSStFRlZKT3lqWWNwSVBlczRTbHBibEdLQzVv?=
 =?utf-8?B?Qzk2Uk1VaEdKUjB1a0hpRklNVWRhMnZvMEpNL292bEVjamtXRC9jOUVMSDRQ?=
 =?utf-8?B?aFE4czZoallmdEZUdCs4cDlkamNNZkJJejZGbi9leFVQOFhmUHliVzN1dHRB?=
 =?utf-8?B?R256akZwbXJpZWFtclRXRmk3YlozeHpTTXFSTXk5UFRRaUYrRG1XYXVBd21w?=
 =?utf-8?B?bi95UnA0eW5USjdDdk5KOHBxRUtQRGR5MndSRVUrdjFTc05odjJISGJCTkE3?=
 =?utf-8?B?SkhkazhSaHlFNlpIRURodlZNSmdXN0lpNUV3VW5aQ25mRnhrYnNhY3VoYlBk?=
 =?utf-8?B?Nnk5VHBSdHpHVmsvTVpGL0NETFBiZVpKVDR6ZWFDNTE3RmtYMXZQSzBYdHd5?=
 =?utf-8?B?RlhtK1pPY1BXNEZvc2tLdVk1STNTVy9lalk5Zk1pc0Z0WlVsK3kzblAwUWFr?=
 =?utf-8?B?WGtTT215bWZydDJwUE5lMWxENXNHUTBMck14Q3ZoZzFndjZWL3NxellGWmw5?=
 =?utf-8?B?K0UvalJqRmpwb3lrWGdKT1pHY3lWS1c2WjdWUFVoMmZRZzA3N2JtbVBEbHFu?=
 =?utf-8?B?SE5jbGlocU9qY2lBVUlRaHBDeWg5YTllVm44RlRHbDZkKyt2Y2FVRmM1MHo3?=
 =?utf-8?B?MjUybWRiQ1hpc1VFNDBhbWFzckc0aFhhSnEySjA1RENZT2hBYUdLdkhraStJ?=
 =?utf-8?B?K0JRWi9adGI5NkRGb3lEM0NZaFBRY2djQ1NIVFhoM3lMc1dmUzN0ZXRVamRI?=
 =?utf-8?B?UlNyaUc0cG5wcHJYYndhaXlyRFpISlVldkVkbjRxNmMwUlVMNDlZOEY1VTdz?=
 =?utf-8?B?VGxTRGlGUTNDTFpvaVVWcE1Tb2JwL1dSeDZGcHFQVzJsQUVZbUdUS0xDdTlp?=
 =?utf-8?B?NDVDL2xGaDZtM1RtSDd0OEd6eXZ3SFl4L0NrSUdMOXh3dWJ6L1FSS2QyRTRr?=
 =?utf-8?B?RDZ3S1Z4OE96M3RYdk1kY01Wdmp3eHVhcmxUeG0rZ3dacU9PVTI4MTBoejBT?=
 =?utf-8?B?dlZQVHRoR1VsbURJYWcrd3c0UXZsWE5rckJZR1hxQTQ4QWFiRnR5QjV5a3Rm?=
 =?utf-8?B?MFdDNzczM2x2TExwSUw0Q0d4NS96T1k1eGtBMHJ0aktZWElWUFVobmZtbThu?=
 =?utf-8?B?bXRLVnpQd0pqby9KMHRzSHBhbC80ZDBLQkxwaHpBeVQwUE0zSW15Q1ZDQ0My?=
 =?utf-8?B?alpBS0V2cy83Q0h1Tzc3dFpKUG5hYmhSM29RZUZoNFZtVWNtT3laa1AwWFZp?=
 =?utf-8?B?b1FHK1JDQmVib0MvUEJkT1BGZjFlYjZXUm9JN1BKODV4N0dPTzNETXkwdnYw?=
 =?utf-8?B?RlhsRVNXcjRvNDZNdE1FMEU5V0NrYUtCeFVIdjlmN25icDd6Y1JpMytMVlR6?=
 =?utf-8?Q?Lv+qu3D8Ua/scjcZB8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19416f0b-7068-4794-d688-08de6e2fefe6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 14:22:10.2462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGd2gLSzm9WDta6gTCPkovGgVKLoz57MfC4X1mu3Vw5KqfkpMhG4gPZfXKLoIhpE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7032
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 8206114D185
X-Rspamd-Action: no action

On 2/17/26 15:09, Alice Ryhl wrote:
> On Tue, Feb 17, 2026 at 3:04 PM Philipp Stanner <phasta@mailbox.org> wrote:
>>
>> On Tue, 2026-02-10 at 16:45 +0100, Christian König wrote:
>>> On 2/10/26 16:07, Alice Ryhl wrote:
>>>> On Tue, Feb 10, 2026 at 02:56:52PM +0100, Christian König wrote:
>>>>> On 2/10/26 14:49, Alice Ryhl wrote:
>>>>>> On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
>>>>>>> On Tue, 10 Feb 2026 13:15:31 +0000
>>>>>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>>>>>
>>>>>>>> On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wrote:
>>>>>>>>> On Tue, 10 Feb 2026 10:15:04 +0000
>>>>>>>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>>>>>>>
>>>>>>>>>> impl MustBeSignalled<'_> {
>>>>>>>>>>     /// Drivers generally should not use this one.
>>>>>>>>>>     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }
>>>>>>>>>>
>>>>>>>>>>     /// One way to ensure the fence has been signalled is to signal it.
>>>>>>>>>>     fn signal_fence(self) -> WillBeSignalled {
>>>>>>>>>>         self.fence.signal();
>>>>>>>>>>         self.i_promise_it_will_be_signalled()
>>>>>>>>>>     }
>>>>>>>>>>
>>>>>>>>>>     /// Another way to ensure the fence will be signalled is to spawn a
>>>>>>>>>>     /// workqueue item that promises to signal it.
>>>>>>>>>>     fn transfer_to_wq(
>>>>>>>>>>         self,
>>>>>>>>>>         wq: &Workqueue,
>>>>>>>>>>         item: impl DmaFenceWorkItem,
>>>>>>>>>>     ) -> WillBeSignalled {
>>>>>>>>>>         // briefly obtain the lock class of the wq to indicate to
>>>>>>>>>>         // lockdep that the signalling path "blocks" on arbitrary jobs
>>>>>>>>>>         // from this wq completing
>>>>>>>>>>         bindings::lock_acquire(&wq->key);
>>>>>>>>>>         bindings::lock_release(&wq->key);
>>>>>>>>>>
>>>>>>>>>>         // enqueue the job
>>>>>>>>>>         wq.enqueue(item, wq);
>>>>>>>>>>
>>>>>>>>>>         // The signature of DmaFenceWorkItem::run() promises to arrange
>>>>>>>>>>         // for it to be signalled.
>>>>>>>>>>         self.i_promise_it_will_be_signalled()
>>>>>>>>>>     }
>>>>>>>>>
>>>>>>>>> I guess what's still missing is some sort of `transfer_to_hw()`
>>>>>>>>> function and way to flag the IRQ handler taking over the fence
>>>>>>>>> signaling token.
>>>>>>>>
>>>>>>>> Yes, transfer to hardware needs to be another piece of logic similar to
>>>>>>>> transfer to wq. And I imagine there are many ways such a transfer to
>>>>>>>> hardware could work.
>>>>>>>>
>>>>>>>> Unless you have a timeout on it, in which case the WillBeSignalled is
>>>>>>>> satisfied by the fact you have a timeout alone, and the signalling that
>>>>>>>> happens from the irq is just an opportunistic signal from outside the
>>>>>>>> dma fence signalling critical path.
>>>>>>>
>>>>>>> Yes and no. If it deadlocks in the completion WorkItem because of
>>>>>>> allocations (or any of the forbidden use cases), I think we want to
>>>>>>> catch that, because that's a sign fences are likely to end up with
>>>>>>> timeouts when they should have otherwise been signaled properly.
>>>>>>>
>>>>>>>> Well ... unless triggering timeouts can block on GFP_KERNEL
>>>>>>>> allocations...
>>>>>>>
>>>>>>> I mean, the timeout handler should also be considered a DMA-signalling
>>>>>>> path, and the same rules should apply to it.
>>>>>>
>>>>>> I guess that's fair. Even with a timeout you want both to be signalling
>>>>>> path.
>>>>>>
>>>>>> I guess more generally, if a fence is signalled by mechanism A or B,
>>>>>> whichever happens first, you have the choice between:
>>>>>
>>>>> That doesn't happen in practice.
>>>>>
>>>>> For each fence you only have one signaling path you need to guarantee
>>>>> forward progress for.
>>>>>
>>>>> All other signaling paths are just opportunistically optimizations
>>>>> which *can* signal the fence, but there is no guarantee that they
>>>>> will.
>>>>>
>>>>> We used to have some exceptions to that, especially around aborting
>>>>> submissions, but those turned out to be a really bad idea as well.
>>>>>
>>>>> Thinking more about it you should probably enforce that there is only
>>>>> one signaling path for each fence signaling.
>>>>
>>>> I'm not really convinced by this.
>>>>
>>>> First, the timeout path must be a fence signalling path because the
>>>> reason you have a timeout in the first place is because the hw might
>>>> never signal the fence. So if the timeout path deadlocks on a
>>>> kmalloc(GFP_KERNEL) and the hw never comes around to wake you up, boom.
>>>
>>> Mhm, good point. On the other hand the timeout handling should probably be considered part of the normal signaling path.
>>
>>
>> Why would anyone want to allocate in a timeout path in the first place – especially for jobqueue?
>>
>> Timeout -> close the associated ring. Done.
>> JobQueue will signal the done_fences with -ECANCELED.
>>
>> What would the driver want to allocate in its timeout path, i.e.: timeout callback.
> 
> Maybe you need an allocation to hold the struct delayed_work_struct
> field that you use to enqueue the timeout?

And the workqueue were you schedule the delayed_work on must have the reclaim bit set.

Otherwise it can be that the workqueue finds all kthreads busy and tries to start a new one, e.g. allocating task structure......

You also potentially want device core dumps. Those usually use GFP_NOWAIT so that they can't cycle back and wait for some fence. The down side is that they can trivially fail under even light memory pressure.

Regards,
Christian.

> 
> Alice

