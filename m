Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB6zD8FTi2kMUAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 16:50:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DFC11CB9E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 16:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379E610E5B6;
	Tue, 10 Feb 2026 15:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nOiLoXMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013068.outbound.protection.outlook.com
 [40.93.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2E010E5B6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 15:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wciCKrpidVRSNrYxw0F3msv3Xiz5uUTLPMNiQ+w82bB5TYUeI3/f7jVhRSrgMqTB4O9QVqxTCDch6cGfgCIkz1IOkF2Q2gvoKeHl01kxZ0GXrr+gRcoNGby5EiI7ahlARIZEWRPAYGS8PsSKPhzcTdhvWEWv96IX5t5SAex5CRCwsSzL/ti6ICj6fPXJvX177NV9//uFjZvVjGIC5jeUYuKwX9VmE9iefnBm7E/JxgkfZS1YzagESchbxM/1Z6KtWzHV4JNc3NMyzIaNQeZhZyxFbTpTxN8cqgOD6lCyK22oGYhfGQsESsK3OJTKz6ocNaiDQXZ8kIFZc/Gbx54YcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Fofyb9TwdUlW5mw999TUh4eVHCoaQGzU3Nowi0N+oU=;
 b=LuTT+jbbxJlbMIRuNl9GWnQrCDY64PWDnPvHbzTZgRlFokPN/TUuKps2GvwjuNUNLA8q6+wylwytgE5koIWYE9RO2akpsCifr9/tEKbnOpP7kx7JHnRX+ec928aQSo5/0uyTn9Q6R6VpvOeJR0douZur7xtwVrL0YFC/Q3rqN73GTrKqnKmlRFURJSMWZ+Y+D9kRP/cES8OiIDySVvPhClWcxBCGYOFI88OJ6CRyCkZGz5Dqrx7RAW72k1QJjlG5tFrKRx7NiuA3qeCDwnO/5kDjSa7zmRqeaY46kG3ob3muvlls74PKM9br9tVFPi5eav8pKwu8/gyqSEO2AO4V4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Fofyb9TwdUlW5mw999TUh4eVHCoaQGzU3Nowi0N+oU=;
 b=nOiLoXMNlW2Tkjcx3MgVsi9DuQA9kor1VNVKOhUcMroaBIUs3mxdgPHb/05JzQgbo7WL7PINXzjbFkT/UKAvEva71TWSWHPWHxrNmYUigIdKaSbJZWxFl5k7+F3IgEfdRPJadEBwFuKPpqAz4fV7NNmIBEuuyQuK+iwFf32xfEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8360.namprd12.prod.outlook.com (2603:10b6:208:3d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 15:50:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 15:50:13 +0000
Message-ID: <4f3f36cb-3af7-4461-9852-9ababcc9b6cf@amd.com>
Date: Tue, 10 Feb 2026 16:50:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
To: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com> <aYruaIxn8sMXVI0r@google.com>
 <20260210101525.7fb85f25@fedora> <aYsFKOVrsMQeAHoi@google.com>
 <20260210133617.0a4be958@fedora> <aYsvc3Q8h-Gg27-g@google.com>
 <20260210142631.6f8a3411@fedora> <aYs3VVH_UXMFa5oC@google.com>
 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <fe2f97ae271116e7544be778a1d1aaace529dfec.camel@mailbox.org>
 <c1d4ad2a-44a0-4c04-b0b4-94d6242d4ae8@amd.com>
 <a8cf272158df69dbb3c856d8be248d525dc0a4c6.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a8cf272158df69dbb3c856d8be248d525dc0a4c6.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:408:e4::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8360:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb43767-419d-4cb6-ea39-08de68bc13c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eitLUUlheHVoZEp2TUZXRkMvSGdWaXhKMHJrM0VBejNyRDF2Qlhxenl1MGFC?=
 =?utf-8?B?WFJPd1FQOCtTemo0b1JOUW9Eb2N0MERhTHdaSG5qa3FWS0dFbmNMam9DK0RB?=
 =?utf-8?B?SXQzblBETll4NFdScHk4NUIzbWtHMVlVS214eVhyN1NjV1RNWkI1bnVwSXln?=
 =?utf-8?B?aEQyVnhxK2t3QmU4emFiL3hib3BnWFB0SG42K1cwQTh6VFBDU0pOOWI3K2VP?=
 =?utf-8?B?bW94cURaT3hueVBDRmI0QnNSY29kRVYvbCtiaEQ5cHNnbVJtNm8wS0NkZjJC?=
 =?utf-8?B?eGxRR1ZLcEZhY0ZhRTFPUERCQkJnendzeEI3TE5yNDlQN01uSkhESTM5cStn?=
 =?utf-8?B?blFKSzVUZ3pkZUFzL1lhZmN5RU9adXhaWmhwQnVZT2xKaGs3Z0lQUklNZTBV?=
 =?utf-8?B?R0oxOTVUM1dOdVY2S1VkK0NNOWF1TUlaUlpiN0EyK1d0WHBVNG9DcTIyaWRK?=
 =?utf-8?B?bW1HOXdkQ1QvL3N5Z1Y4UXF0dElGUkFVTXdtcU5Xa2c1bXU4UVNOZjkzejhv?=
 =?utf-8?B?MmhQNURCM1pLK2lYWXVienplOVdvVTVVQTBkdVNwMkZuWUxWSWNYanpkQTVu?=
 =?utf-8?B?NHk1TTdUUG5FTDJDSmhmV2pQQVU4NHltakxLelN5bXZibDNDbEl3MmhuMkdw?=
 =?utf-8?B?R3VyMTJ1SHhVRlVCZ1BkSEo1WmNGT2FnK2pTR0FkQmcxemRXYWkwemJ5a0Qv?=
 =?utf-8?B?d1NlT2RVa05sWDA2SWlNaGVnYTBJemVOL2hPSjBlUnRraUdXV0RIcmxvM3I4?=
 =?utf-8?B?S1RsMlQ2eFhKdWY5eW1Qd1gwaS8zcHRCMkVXL0w2WStyRTg5NHlFdzdvaDQ0?=
 =?utf-8?B?TlNhWHMxMUN5U0FSR3VSelVtQWlRV2R5SVNhM0NSVXM0L1pCWkptUzVOUmxr?=
 =?utf-8?B?WUJtV1RQMitqOGZHMHFRREFpUXg3YVk2eGlNWncraFhzODdlNG40b1NPWHNn?=
 =?utf-8?B?eVVZTzd4QnZ0MmVnVXppdG1LektteFRZNFBDSlE4bFh2SlBjOGx2cE15MDhr?=
 =?utf-8?B?SFB0WnZHcFkyTFAwcWhuaUNoemE4dzB0S0xWKzVKaWcycGYvbHg4dXJudmJE?=
 =?utf-8?B?Yzl2MitDaWErNkh1K3Bpa25Udm8vd1FnODd4U0ZmbGRmdGFzaDVMUWpPM1Nr?=
 =?utf-8?B?NUY1N09ndzFZT2Uyc0hUYXJ1d0tBcHF1U04vZUxUVHRUeW14V0RXYjRUckVa?=
 =?utf-8?B?U1A0azdLcE95aDB5dVlqdHVvM0dmUGF3UXMxeUpJQUlyODYwTEFMak9EcC9h?=
 =?utf-8?B?S2o5ZHBXait0V1kyb0lKakcrb1hnenZkcTJ4T2dzQlRmWWZWTzhlRUhsaVJY?=
 =?utf-8?B?Znc1QnBBYlR6M2psaGJEMUxIVXJIVWZCSi8ydDNjOStPY3ZZd1lUZmw0R2lZ?=
 =?utf-8?B?UG4zczhNSllQMnJxMDhVN1dBZDRiNjNIeVlxVEhrK3lzWDZjTjlOQnMyT2xh?=
 =?utf-8?B?WG5QQzljQi93SVRrcmRZRk1iTU1rNmFUUGlrZzFpUGlJeVNoRVM0ZGs5WWVl?=
 =?utf-8?B?N1dXZE9mU2c1Q0EyZFgxais5aU8zNUZTN1FoNklYNlozV0ZvM3Zvdm1jSUU2?=
 =?utf-8?B?WGFSLzhrdmFnWERCWm81cElFRDVEbUtXL2d4bEI5UWNzaWs1bFdoYUFhUjBp?=
 =?utf-8?B?dGcwSlNKNnRIekdxaGY1V1YvTGloUXgySDcwNmlFL1AwUlpQdFFGbGI3MEhk?=
 =?utf-8?B?aEZxc3JaSlpJTGtZcllIb0xqbzVaVzN4V0NLS2VtbU1IK3plNk1Wb1NHeXpR?=
 =?utf-8?B?eWV5eVdSNVZ2MWFmb2thNkNZeWxEVjhWM2R6WVRDc29oVEZXZk5wa050c2Jv?=
 =?utf-8?B?d3JiV0FkOVZPSm9SWU5uTnB1T3NFNUovdXE1TG1qN0NZOHdQRDhqR055eGRm?=
 =?utf-8?B?SEJuMVkzQldPVFdaUUtYcU95L0pzZEw0cDdXYUdWNXlucDVHVGVUN2xXaEJM?=
 =?utf-8?B?ell2dXhBV3hpbGJrOHRJcWFVK1VhRWd5eUtVREE3YnBxU2t2RTNRaS9LL1h5?=
 =?utf-8?B?OUpWSkhEbGxwcEtUUHcvTExsTDBndmhyd1N1V3QyR1RlRzdVbWNXd0dWYlY2?=
 =?utf-8?B?SHhwdVRiRWFEM1FiWFNRVXZYMmd5UlhsYkxzU2dXUnVraGNPTDI5TkF2bkFY?=
 =?utf-8?Q?vGaY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUxaTEtsTGRIeXhHM3hiempIZFBvWm5CMGZBT2JTeElpYmlHYXozVllkUXl1?=
 =?utf-8?B?RWRFV213bUVSU1dITG9uTVJkREp4OUYwY00yWXlyQzJDR0lGSjl1WEhTQ1Z3?=
 =?utf-8?B?Y2J6eldZb1EzSEk4ZnlOelNRSmR1VlNaZkNQSk1tL3ljWENGNWRMdGdCRStD?=
 =?utf-8?B?MlFkR21HS2NwSkIxb1I5d0tZcHFHaGhYeFZSWkFPemI2SlJ6WWRWWjNwditK?=
 =?utf-8?B?RE43WkR5c0xYYmtLUW8rcWZJdVl5U29ITDB2VStSbEhPUFQ0VHhlTVA3RUNm?=
 =?utf-8?B?MmxxTURpWTNCY0ZtTWJVZkhQdTdyMlpzeDNpUmRLRkFoRWltZVhPTlU5WmNX?=
 =?utf-8?B?ZVJqYkorT1FSMFFUUTZwb3N6dlhObE1OZFQ2K1Jsd1l3c1dFTDlHaHJTdWc5?=
 =?utf-8?B?RUE5Um5lWnlIMjlHd1ZUNkxPdUIyQ09xU1hXMTZVL1V1TWQ2RUZyODlPczEr?=
 =?utf-8?B?dEwxcW5iT3NCYXhaMUNDV0ZkSU9HeDFxVEd6OFlTb1l5alRMakJFMU9ZcG9G?=
 =?utf-8?B?ZUh3MzJ0L2V4aVI5OWRWTmJiRDd5MDJrS1dER2JTWlJtdEp5cWpQeVRsWU1v?=
 =?utf-8?B?KzBKZmxNaENXUzVyWDVCeVE2d2FtTTMvTFVXY0RaQkxjZklUUzk5M3RkSXBS?=
 =?utf-8?B?R3YvYmRzV0pFYzVCOGp3NGZqakpZTWZXRmdHNFNXMis4cUhsSmhMQjU0eVJF?=
 =?utf-8?B?eE9rNFZMUmVFUHJsT2YrY0Vkc1ZuL25XcUY5VzRNVjI0UDd1TnVuUldXZito?=
 =?utf-8?B?NzdPaXJ0QmtzZHNNVFhjd3hQMmJURHpKZThRWGlmSHZsWUlWdHo0dzQvK3lV?=
 =?utf-8?B?cFdUZ3RuNmduM1lQaHRVZTNxZTIwb3VKd1VRaDVMV2t6Q055VmlXQjZadUJB?=
 =?utf-8?B?Kzd6aWx1V1hwMVFuQWxKODhwNGlja0VHZUxVR0c5Ti9sTW5lQUF6L1FiaXFR?=
 =?utf-8?B?dDJCVUZXMmwyNjVLbjh6dmpBVkJBdnhkN3BJenhTdm5lY1R4V0VpRXV0UE82?=
 =?utf-8?B?VW5UZFpxT25VVFpMRjUwek4ySWJRM1N2TUMwUklBYXdBdW1ha0dCdHdiS1FS?=
 =?utf-8?B?M0JCejVaZnVaczNRQTJnQTRtcGhqZGpCRHUyTzRna2dQM1Fya1pmYWpSTDlP?=
 =?utf-8?B?bHliTWNFdFBOc3RRYUU1djdYTXhXRTB3cFVKOUw3Ti9tZGd4Y3hMWkdhUEpm?=
 =?utf-8?B?K0JabXd6N2R3MDEvR2ZqN1RucE5ERzlCVzhnZjhwMGR2SjMrckVWQk1vc085?=
 =?utf-8?B?TitDcXU4RjZZbFc2UXg3Vm1OcS9xeUgwTkozT0diSFkvRXUwcExmU2tPM2xn?=
 =?utf-8?B?Rm5MNTFWeTBTdWQwNG1HNC9JZHB6bk9GVzY0QnlydkhVZ09WZktiOWswcFhZ?=
 =?utf-8?B?UkhxTXZRM1dQMWpaWFZOUXdjR0xsZDhHeUwwKytkT0Rrd1dtQlhabmVuUFEy?=
 =?utf-8?B?VkJuak1MQTJER3hIQnh6ck5YZXRrQUJDOWEyamtvVWorNUhzc3BUZENDcGZa?=
 =?utf-8?B?QWlKWU1RZ1BkZFZQZUU2NjNYdkVqMG55SmQ2RlNFZ2xmeVJHOFJlQUVWNWdF?=
 =?utf-8?B?WDBvbXhDOW1TZEFaL2tQMjhNOHJnQ2FKTnZzWUdQU3FJcmhteVovcmorL2R1?=
 =?utf-8?B?ZVYzYWxPL1U2RGJVZ2NWS0xac1NtNktUbXp4Y0h6YjZZSzJHcEE0VXZzTzdh?=
 =?utf-8?B?c0Y3MEhzeC9oSEJ6STNrczYxSDRuQjdGMkpoSXVYbmhqY3FTU2dEZHkvU0c2?=
 =?utf-8?B?OWZzTnBlZHdYY29QVS9aMDU3eVRqQ1M2bm1LWU5LRVRYV0pYZnNFZUNEdmdK?=
 =?utf-8?B?a3AyYXRSMTFvbjJseU9jZk1laWpmNjdTZk1oLzhUU3FjV1RUcFRtVEgzbVVF?=
 =?utf-8?B?eG16L28yc05qWWdNV1RXbFpmZG9qcW5nYmlhdGpRWjR1RUNZajN2V05NMXRa?=
 =?utf-8?B?VFF6V3FZZHZaazc5RVNRc2QzYThKU0NEMldwclNhZFRuY1QrQStxanM2MFJQ?=
 =?utf-8?B?UTdBQ0hjelJsbEk2WHVScWtrMThKaW9ZVWFVU05UQ0o5MzZ1VmhabXgvUkZn?=
 =?utf-8?B?U1lXT282ZXhEYjIzODY0aytMemNRVW9hb250ZlNicHZUbE1EdXVHTW4veFBP?=
 =?utf-8?B?L1R2eVh2ZUxSVFk5RHFWVlZobFIrTk5STjRETHpoN21vNkEzTEkvVCtVeWFh?=
 =?utf-8?B?dUpZQjNZSjNpTkpLUG5MaUg0dGJBUlFlTDNPa2ZQT214d0NRM2pyTXBTM0Fp?=
 =?utf-8?B?bmZqNzd2TnY2ZGdwQzZ1UURrQ21ESSt1L3pSeUJFemNZcDAzbkFLZWxLWFRB?=
 =?utf-8?Q?W14woUPn5GXXh5BJlX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb43767-419d-4cb6-ea39-08de68bc13c6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:50:13.0341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgdfNZdANL2u2TFbk6kSAILptGKJFTBDIceW+y1BkhNPh+d81G3mmrdo7ss4iBFz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8360
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
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 70DFC11CB9E
X-Rspamd-Action: no action

On 2/10/26 16:32, Philipp Stanner wrote:
> On Tue, 2026-02-10 at 15:06 +0100, Christian König wrote:
>> On 2/10/26 15:00, Philipp Stanner wrote:
>>> On Tue, 2026-02-10 at 14:56 +0100, Christian König wrote:
>>>> On 2/10/26 14:49, Alice Ryhl wrote:
>>>>> On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
>>>>>> On Tue, 10 Feb 2026 13:15:31 +0000
>>>>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>
>>> […]
>>>
>>>>>> I mean, the timeout handler should also be considered a DMA-signalling
>>>>>> path, and the same rules should apply to it.
>>>>>
>>>>> I guess that's fair. Even with a timeout you want both to be signalling
>>>>> path.
>>>>>
>>>>> I guess more generally, if a fence is signalled by mechanism A or B,
>>>>> whichever happens first, you have the choice between:
>>>>
>>>> That doesn't happen in practice.
>>>>
>>>> For each fence you only have one signaling path you need to guarantee forward progress for.
>>>>
>>>> All other signaling paths are just opportunistically optimizations which *can* signal the fence, but there is no guarantee that they will.
>>>
>>> Are you now referring to the fast-path callbacks like fence->ops-
>>>> is_signaled()? Or are you talking about different reference holders
>>> which might want to signal?
>>
>> Yes, I'm referring to the is_signaled() callback.
>>
>> When you have multiple reference holders which can all signal the fence by calling dma_fence_signal then there is clearly something going wrong.
> 
> From our previous discussions it always seemed to me that there is
> already something wrong when is_signaled() fastpaths are being
> utilized. Remember the mess we have in Nouveau because of that?

Yeah, but that is Nouveau specific. In other words Nouveau has a problem with that because it doesn't like to have already signaled fences on its pending list but still wants to use the fast path.

> I agree that it sounds very sane to just have 1 party that can signal a
> fence.
> 
> However, that also implies that the fastpath is wrong because
> 
> a) a consumer of a fence can use that to poll on the fence and
> b) because it breaks good naming pattern, where a check whether a fence
> is signaled can result in the fence being signaled.
> 
> So I would kill that fast path for good.

Yeah that is not something we can do, some use cases completely rely on that.

E.g. on mobile devices it is normal to not enable fence interrupts and rely on repeating interrupts or timeouts to signal the fences.

> In the past you mentioned that you had users who were wondering why
> there fences are not signalling (like yeah, if you don't call
> dma_fence_signal(), then your fence will not signal). What ever the
> confusion was, this time we have the chance to set it straight.

Not sure what you mean with that.

Christian.

> 
> P.

