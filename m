Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE28D9C0936
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 15:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2C310E86B;
	Thu,  7 Nov 2024 14:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bLcHiHbE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2089.outbound.protection.outlook.com [40.107.102.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4693D10E86A;
 Thu,  7 Nov 2024 14:48:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrbZRcqWVlvmJ7j9mt61SOR2E7jjgbLW1BfAM06VAzAkaMvJVzleW4L0HM24n95J7jBoDE/RwjlZHkHhpDpSntaRmBe4vh8+bLB01ZMJS/UJNrp44JlOiW2nxN3ALabxBtm18Z0jrqVycOgr+hCpKXO01mHivnRLESIMh6gDBdDepwI4QRDxX6FYcJ2Ep/+H/eO1OGrWKcyAySCSKwo94vn2h+LeuONvYGFpk/vuO+qwAYMwsESR7omNnJpu4P5+3P03NdXiXRjMiUjyi3DdrbfafqgH8wwr+sZahOJbEKwxWZxHcn4nvXUgXjXVyY/al+8c0JvZg/3CIu33qmKBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeAcUupymKMiZYgC5DLT++xw+e68Wc7hEsYgFA4adUQ=;
 b=OssbDobhFbs2PJ14mtHJ7vSVtdkGhzWhUT03RXYQCKlU5LdXTBIYr4LSEGkxzx5s8ntgkov59wvQWxCVyg0Nv6P0yzustymPboQndQNpYtXPHUhdA4J45a6akM76cXv7HoXIkVX9obg4QGzAFoLBh1keiGYfGVuC0tgh13vIHoYwzt5ucirvDHaS98qchcoYprGP7mQoMyIi6zsRN2yMQXD7SqcCO0+/xAXDjZLh2RjWzDR/48nLLFM2qzc7dcFjBxScc4j5SonufbAiq1U2+Mxf8BGwZdyCt3ckfRw/BNZOmfqDpgmBb94q7fcFn6QMwDmxOyl0QAQaMDdMwW5OYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeAcUupymKMiZYgC5DLT++xw+e68Wc7hEsYgFA4adUQ=;
 b=bLcHiHbEG7osE17kqcrC7YwmZJU8Wc01xwnSnDosyLfRD4dsbr7QBaEMr1uv4z/4+kEO7FY/WFac1KlrKeZbisZHMQgdVIuQoCAJs3vh+nex4FuJWxFeTvvnjFeROzkYEP9JI9tjaVp6jyXvWqNY3Ai/Ya/Tp5Y5Ozr3js1xcAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6198.namprd12.prod.outlook.com (2603:10b6:208:3c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 14:48:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 14:48:03 +0000
Message-ID: <4f3f2ac3-6a89-48bd-a5a3-bad5ffba26ed@amd.com>
Date: Thu, 7 Nov 2024 15:47:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] drm: add drm_memory_stats_is_zero
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20241025174113.554-1-Yunxiang.Li@amd.com>
 <20241025174113.554-5-Yunxiang.Li@amd.com>
 <b31fd5b2-094a-4d3a-bab9-83102726eefa@igalia.com>
 <SA1PR12MB8599D376A7EBAB3F46302297ED5C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <bac29354-640f-4f39-b694-b611407c35ae@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <bac29354-640f-4f39-b694-b611407c35ae@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f77178b-4c48-4fb2-eb43-08dcff3b2ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1pUclRsZG9ESVpXOVVVNzR5NDNDYy8va3ZCQWpQc3k3dzdscGh6WUlsUE8y?=
 =?utf-8?B?dWJ2dWVSaHlDanJkek5XSFdIdHU0Vk1ZZCtMU2ZmNEVEWVh1RVNlVzZreTVo?=
 =?utf-8?B?Vm9BQUJRcHhNSnFqajUyeWRCbWdBekI1TDJyaUp1TjhYSHVLVllVZjdGWVNG?=
 =?utf-8?B?R1Q4N1VjY0xFcWtoTzBFMFZ2MFlVYS96V3RkUnlySTIwZ0JyZVBmcTg0WDkv?=
 =?utf-8?B?MVJhejI5TXB5dSt5NUlQZFV3Q0lHZHdDVE5WeVFsTXZkck5DZEtueXVHa1Fh?=
 =?utf-8?B?MEg2SENQVmtJYWZyWElCYmhxT0o3VHRWRjhFU2VxSlRTTmJNSmN3MDU5VE8x?=
 =?utf-8?B?MEd3Q1h3dVQxWDRiMzhQNHFuMllMbHI5T1FhSFZTRk9iSGE5S1JobXRCV0NT?=
 =?utf-8?B?UlNKeHZrSkdmMVFxNU9vajJQRDlJczM2emN0emlpYkpWN3E1ZDIzNG5uRlox?=
 =?utf-8?B?NHFWUCtWQldWUUJYZ1FqNEllUDNnb0xTVjBDOHpqU2dTK3NKRHZ4K1ViNEg1?=
 =?utf-8?B?czBzeHlkZVFHcnRwYVJyN0J2eDFNYXNSVlR5M21mZXl1Z0E1YUtsVzVROW9C?=
 =?utf-8?B?WHpEam9NTG5sYnRualB3WTNNWU8xZGtGR2NXQ1krT2hkbWNSN2xjaDlTWTBv?=
 =?utf-8?B?TE1jZXhySTBJaVZzMU5FTDFYMklEZmt2R2FRMVNCcGVxUUt3YkdNVmpkRUtB?=
 =?utf-8?B?SlNYOFZLdmRMUm52WDhNcVJIN1E0Sy9keHl3QithY2NHYmoxNkNtYit1L0xU?=
 =?utf-8?B?M2dUQ0llSFBNNmdnUVRxbEU1dEl4SHFZZkpGZ1A3NlM3MEpZdXJpWXpTb0tp?=
 =?utf-8?B?dmF1UlpaNjh4bjBUd1RITkY4Nm1hbVpZRG9LNUVWemJDam5JS1RVWjNPalo4?=
 =?utf-8?B?aXNyVkMyZkZ3Zk55bEtiN3NnYUlKNDdaUit2ZTU4dnR3ZlBiUW5qWVJ0bTZR?=
 =?utf-8?B?bHkwcENZZmNmTXJwUTc4eDJDczZjSlNRR29CSjJlbmF5L2gwTlRITG5BTm85?=
 =?utf-8?B?NFpiNG1za1UzaWZIcnJaQmRDQng5djdVTzE3UDQvVkJUcTdkWTZUMFJDZEJD?=
 =?utf-8?B?TjRIMmJoQ2tZcWJIUHE2c0RiUzB6UzFPRGxkcCtFNmlyU3VJbitvZ1FGTXlJ?=
 =?utf-8?B?cjlGSXNiZVpNNUlNdGozdm5EN09BYTgwQmYveXB0RTRyQ0wycXpRSmRvdC9M?=
 =?utf-8?B?eVhvTlBCUFBTMmdXRzFLRkc1Z0hyaHJXcWROdThETmRQait4VGFSZDFUUmNV?=
 =?utf-8?B?aklpT3dwNzEzSUZ5V2dseTZCMFpBSGIwc1Y5cUdGUFZ4SEtYMzl4b3h0SFBU?=
 =?utf-8?B?WVpHV080UG9JaW9mOXlHcGJadVVNT1I1T0FPM3g4dkJhZitKQWQvVkpKL1Qw?=
 =?utf-8?B?N2JSOHpLUjYrQS9FVVdDYVdkdzJyUXRlZUo4NytBZ2JWV0pxbjNlQVpiOEo1?=
 =?utf-8?B?akRWelc0VjNtdExyd20xYm5pemV0a3dIUXd4SWJ4RnVmRTF0TkpaRk1ObjRy?=
 =?utf-8?B?VW9rcU81N013d3ZLTHVmK2xyNlBES2NObWsxajdRQXlkZFpXb0YxLy9ESmZD?=
 =?utf-8?B?NThsVFZid3JEdjFUaXJzaUNmWWZsUmE0SFdmd0ltN3VEUVYvdWtqVlFJZmIr?=
 =?utf-8?B?ZERnYnc3MFdSc3AxZG1nQjJmaE9CN3kxWUpyQy9QNUZqallLTUlHUDBoMTdx?=
 =?utf-8?B?VTZkUTd5cFdtVStFUlYweWQ0TmtBTjQ3aThIOXBMeFdpOGtxK0NpK0tJTWMy?=
 =?utf-8?Q?V8fqUc6xOSrrIiZdYpjNSQ4obUvMkfKva33R9Bm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d25vdzVid2ZTY2NVY3VucDdsbVJzTFFjMlFKZE9qV2d5ZHc5a0IzY1lIeU9U?=
 =?utf-8?B?KzNKVkhmOFRaWCtOQmRXSnc1UGJXTFJsM1NDeEdiVWdTRlJhL3R1NU9QOUhk?=
 =?utf-8?B?bWVxSklzOWlRd2pkaDFNT0JiSVZsWVVwYThDb2pUcnlnSjdDbzEzaXZVZ05h?=
 =?utf-8?B?V0pFTVVlTlB5cUw0emtoa3ZyY096dTZuVlR0V1JNWUcvNHZLQlNmZmVUUXRB?=
 =?utf-8?B?Q3lTc2FmdWNpMFh5am9qV2hhd2k2dkRCWmZuakh0byt6amJyaVFFVituQU01?=
 =?utf-8?B?blRHSXFxdWRtdDJUdlRna213ZHpYK01oaWQvRFBSTEsyS044MmtJaFplVW42?=
 =?utf-8?B?bG9vTmJXL1ovOUpyM2ovMXQzM3dlUFR3LzNEZUNlOHRRV2Q3aVcrZkVSTTJJ?=
 =?utf-8?B?a3VwRWgzSUZKZzdUSTJ0SUh6UXFqYzJUQ0NMYU9vUHR5UjNrd0lFUTh1SEcv?=
 =?utf-8?B?d0RIMk11MFUvbUZvNDVoSm5pd1FzdHJNTFNLQi9oQnY4MDM1cXZGeW5EWVdV?=
 =?utf-8?B?bm9NcWlxc3RMbUtYcy9GZUtJRjZjdVh0OGliT0tCTC9KRmFFK3Bkc1ExY29k?=
 =?utf-8?B?UXlWUS9ad09XMVhzRjJPbXJubVROQTNNbWNmekFZUjlSMEE5WTNlTXRmQVVr?=
 =?utf-8?B?dXlKZGRUTXBPc0NUbDNqNEJCYWtVQ21wT2FGeENveUQzY0NEMmhNdUIvS2ZW?=
 =?utf-8?B?RHU5MnkweEtxK0ZyYmNVQ1NYdG5nRFltTTlkaVlPeGROb3FEN2lmM3JVY0xn?=
 =?utf-8?B?c3JIRG5RRnoxWi9qTk90b2xQV1orUTVkQm5QRG5aZUt5ZjBmVFJObVFVUzAy?=
 =?utf-8?B?YnpwOXJFRkFMbURLRXBpRSt5WElra05qZkNiMTBWM3MvR3VNdjcxb1FScS9C?=
 =?utf-8?B?czlZR3UxRUFyVGUvcGFPY04rdTdPOEQ2bnUxNFltazNOMzBSMEZjekhJMjdh?=
 =?utf-8?B?RlZRKzQrSS9oVy9pR3ExMUVNSEVKRzcvWlg0TlN0OXVhd3UwNDZla0xCbDhQ?=
 =?utf-8?B?NS9uY2JHNS9rU2FiQS84Tk5HUDNSZkRuWHhTRi9JME5DcU44Y3BCd3FUMi8v?=
 =?utf-8?B?NTlrN2ZzcS92ZE5Ob3RHbVFHd3R4ZlFMbmJUYkVZUU1jM0xGMjRWdVFuUmJ6?=
 =?utf-8?B?eUtSdDlEbExYZUxUV1lJM0hqRVd0SkNnaEovWUY3QTI2RUZlRHJTY2lSQWsr?=
 =?utf-8?B?WGpXQWhLaitWWnZTcEE5WkZCQmhveHhjSUQzdjVxSnRHOWIxUnJja3JHbHBj?=
 =?utf-8?B?WHVYZW5aVGJWK295cTVKRmhheThHd05KYndaUDZlRFExN0ZRSSswUkhycmZr?=
 =?utf-8?B?ZE5zSEg3WktERU43eVlZcWdXRGtPOUtsNjROUmFoWWh6RWJqaGR2ZStZYXB2?=
 =?utf-8?B?QUx4OXpiSTZ3d0poMkxvU2tFV1h3UEFGdDkrM3JiVmRTYk50eUFVdFp2TUJ6?=
 =?utf-8?B?WnRHRWxFVUFHWmF6d0JnbWRDWlcwUDlDSVZ1UlVURS9yN2pzNy9GYVZscUFK?=
 =?utf-8?B?Q2VndVR6cFI0RkhHaXJRcG01aTJhc2phMFpMbVJKcEZEeWpwbys1SWxFR0FH?=
 =?utf-8?B?NkZaYUFJR21FWndVL2JwMVB0aWU1bGtBNVY4a1JOOFZWL3BmcVZNanBYZStJ?=
 =?utf-8?B?THpyRnhFYmEvYmllZkl6amYwQVpjY3RFSUhkWlB4bGFJQzNrT1JpWDA5L3BQ?=
 =?utf-8?B?U1pJWUpTNEwvMURUWEN3S2REeUdMN2xxQ3R2TGxVcHE3UkcvemJ0VmlJcDJs?=
 =?utf-8?B?enJmR2dhdndmQmFTb1QrRWM5RjlsNG8zaTY3QnE1Y0srMFZ4eE43ZEZPRjRs?=
 =?utf-8?B?TXBxMFRFaDNwWi9IMFFUOHJ0UDFvVGk4VWlQaktHQkhSa01nNTNTYmFsTS9N?=
 =?utf-8?B?TGdBNFNuMXcvTDZ4b0lZQ1hqMFdQSjFFSWRXdHg4OGYwVU9FWFpET2ZRazBt?=
 =?utf-8?B?a2h2QmFrV1Y4bXYvWWVUQW9rWW8vMHNncTZQamtKVDl5aTJ0MVZFYW5sczdZ?=
 =?utf-8?B?SmkySUVwRmtPVTZId1N1d2tRY05GdTFGSlhpTFZjQmhOL3ZWMng2TFlTbGU3?=
 =?utf-8?B?dUdLeWpiWWYwdWE1SzF0QmZvak0rTm9XMndaanhMamFIcVhCNFVuVzZCWjBo?=
 =?utf-8?Q?1Dc7vR+wnfB4KP7mkRyMo3nHQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f77178b-4c48-4fb2-eb43-08dcff3b2ea4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 14:48:03.2841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOBW9y9iu105BDiJze7LksRZ8N40UxJl+4eSvy4RwBxR/aubsrqh8QF9MLiRbsle
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6198
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

Am 07.11.24 um 15:43 schrieb Tvrtko Ursulin:
> On 07/11/2024 14:17, Li, Yunxiang (Teddy) wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Sent: Thursday, November 7, 2024 5:41
>>> On 25/10/2024 18:41, Yunxiang Li wrote:
>>>> Add a helper to check if the memory stats is zero, this will be used
>>>> to check for memory accounting errors.
>>>>
>>>> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_file.c | 9 +++++++++
>>>>    include/drm/drm_file.h     | 1 +
>>>>    2 files changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>> index 714e42b051080..75ed701d80f74 100644
>>>> --- a/drivers/gpu/drm/drm_file.c
>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>> @@ -859,6 +859,15 @@ static void print_size(struct drm_printer *p, 
>>>> const char
>>> *stat,
>>>>      drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, 
>>>> units[u]);
>>>>    }
>>>>
>>>> +int drm_memory_stats_is_zero(const struct drm_memory_stats *stats) {
>>>> +   return (stats->shared == 0 &&
>>>> +           stats->private == 0 &&
>>>> +           stats->resident == 0 &&
>>>> +           stats->purgeable == 0 &&
>>>> +           stats->active == 0);
>>>> +}
>>>
>>> Could use mem_is_zero() for some value of source/binary compactness.
>>
>> Yeah, the patch set started out with that when it's just a function 
>> in amdgpu, but Christ didn't like it.
>
> Okay, I don't feel so strongly about the implementation details.

mem_is_zero() just has the tendency to randomly fail when the compiler 
adds padding in between fields.

>>>> +EXPORT_SYMBOL(drm_memory_stats_is_zero);
>>>> +
>>>
>>> I am not a huge fan of adding this as an interface as the only 
>>> caller appears to be a
>>> sanity check in amdgpu_vm_fini():
>>>
>>>        if (!amdgpu_vm_stats_is_zero(vm))
>>>                dev_err(adev->dev, "VM memory stats is non-zero when 
>>> fini\n");
>>>
>>> But I guess there is some value in sanity checking since amdgpu does 
>>> not have a
>>> notion of debug only code (compiled at production and exercised via 
>>> a test suite).
>>>
>>> I do suggest to demote the dev_err to notice log level would suffice 
>>> and be more
>>> accurate.
>>
>> I think it's very important to have a check like this when we have a 
>> known invariant, especially in this case where there's stat tracking 
>> code spread out everywhere and we have very little chance of catching 
>> a bug right when it happened. And since whenever this check fails we 
>> know for sure there is a bug, I don't see the harm of keeping it as 
>> an error.
> It would indeed be a programming error if it can happen, but from the 
> point of view of a driver and system log I think a warning is actually 
> right.

Yeah agree, an error usually means you have either done something wrong 
or your data is corrupted because something bad happened (failed disk 
etc...).

The the stats are nonsense that is annoying but not fatal, so not really 
an error.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>> Now that I think about it, I probably want to have the process & task 
>> name in here to aid in reproduction.
>>
>> Teddy

