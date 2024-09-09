Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7082971B9A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241A710E598;
	Mon,  9 Sep 2024 13:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0idrbT7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2082.outbound.protection.outlook.com [40.107.101.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B4710E593;
 Mon,  9 Sep 2024 13:50:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qfj+mRL7L+WKiDLi6CtcS0mrF/O4GMfVYIYziuizRJdDhOzjfbMzUzNaJI6wbJepGF2Yyud0LxOQ22JhcTv1SUDFtUNaD/abqef2V6EG1InClsEF9oDCDI+O31DPZmKl8i5vHTE5oUDugNxHBD1DCh8Khx0g4pw6S/w/Xi57OeohDYnnNnHEDnoe6llIzIj3r0x/0xrACN1MpqpI9qIlHNo9/JxnQjfRjxZZ5UHDAOqZaBoqtDWqctN8xsPKF1CrxN1AqUpC69AWyuHC94kC2E5jXCwhKKg0gdPlaBRZbNwmQFT0fwkmcYGMAuUIkLOOG1fXayGrkUOTtLaQjq6bgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5gr1ociCIrMIB0R6NlDN1uV/xzRARrpcI67SVwn51s=;
 b=PmeoOU0zDBTEwm2/Z8tAMLK/Z4PYu+e0E6wB0IAH8iTBPcKCBXUaCwAvs4hwiZqeHqHrCZwUemn+Pv2YnDAjecXak5HZUD4u3i5MvS435ZvrKG7m/DYiffOkFaDYtksStHz8QiQiSniC9TyHMrjXbfhjajIezIiAsyLdmmuGWuBbHa2xP+NuuoKlZDYA8S6Se6Ld9OaQmTYzol+UU66fPCE5sogCEKyG45eeUGmmadZvEGg+faeb1mC/dbRdDeUbNQ8BpjUzt3uTflNdI90H4nN1v+XfUUPZ756h+bS02ZOG2gBfXnB0AOHxL1iw6iUheGv+RI2L1fHeViiwUNh6yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5gr1ociCIrMIB0R6NlDN1uV/xzRARrpcI67SVwn51s=;
 b=0idrbT7D6UYMcLJ7TdQR62o4OHKEw8NCrFVrDVVgohaU1oktotQ+jscIv3+hJsMuTIIMxfHjK2RTbiBHaSH05CdHdMGfNqSF/03w95TslnByaCM7f97RtUrknzQWBSAbz3O8IfbqNVa8zBGTVrY/PpMsSRp78/Hd0lntI95vcT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9119.namprd12.prod.outlook.com (2603:10b6:408:1a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Mon, 9 Sep
 2024 13:50:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 13:50:36 +0000
Message-ID: <cfd39275-f167-4953-b7ad-f723281be9d8@amd.com>
Date: Mon, 9 Sep 2024 15:50:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/4] drm/sched: Add locking to drm_sched_entity_modify_sched
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <pstanner@redhat.com>, Tvrtko Ursulin <tursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 stable@vger.kernel.org
References: <20240906180618.12180-1-tursulin@igalia.com>
 <20240906180618.12180-2-tursulin@igalia.com>
 <8d763e5162ebc130a05da3cefbff148cdb6ce042.camel@redhat.com>
 <80e02cde-19e7-4fb6-a572-fb45a639a3b7@amd.com>
 <2356e3d66da3e5795295267e527042ab44f192c8.camel@redhat.com>
 <fb9556a1-b48d-49ed-9b9c-74b21fb76af4@amd.com>
 <14ef37f4-b982-41c1-8121-80882917e9c0@igalia.com>
 <d8944e6ad57e4efcd480d917a38f9cee9475d59c.camel@redhat.com>
 <1848b0fc-7031-46f2-b7f8-f7c086fb00ce@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <1848b0fc-7031-46f2-b7f8-f7c086fb00ce@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9119:EE_
X-MS-Office365-Filtering-Correlation-Id: f3510f12-3508-4e24-3d69-08dcd0d66193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmQySmw2QmJ5WnV5QlpBaDNoM0x4UlU3THQ5Z25GSi83OHpac2VxaXRNSUhL?=
 =?utf-8?B?aDFlTXdVL1Z2THg5M2VkejBrSjBwQVVIdEkydTExdzY2SGFOYzZFaWhVTE5Z?=
 =?utf-8?B?MElRYU05Mm9HSWNjY2ViZldmL0FNOG9JM3N2UkhDMVZTYy9lenRkdUwraFUx?=
 =?utf-8?B?MnV0ckJNQS8zbDhhRTVTdGFFMlRFZGFpb0dvN2YrVmVFdzFGSkQrRTlSaG5N?=
 =?utf-8?B?aVJZMDJoUkZVMG9iU1hzTDdZNlg2WTFlZlRBdFJKZDBVTEhCUlVzRkhzOEcx?=
 =?utf-8?B?MUJSandxNGljanMzUWRyQjZEU0ZJK3Q4NCtMZFBzYmttTERGSXZZRE5pUDZy?=
 =?utf-8?B?UGNqbFBjeW5wS3lwdGdIbTRHWGV5WkRNZlpHbXprR1NRZUxTU0tYY1ZYbCtT?=
 =?utf-8?B?ZGxSZGdEdHE3UDRBcC9zZkZkNS9tbzVtT1B5YTVKT2FYMFZ5UDRWQS9ITkpJ?=
 =?utf-8?B?QVVTbkNYTFhSNGEzYmtvV2E5Qy83RnkvN2FPZ3RSaGhqN2JHRExSazROWTVY?=
 =?utf-8?B?U0xXOUVtVTQzQnExdnVkL3ZEV3czY2NmemZCWitiQ3dGaUdLejVrUjh3QmFT?=
 =?utf-8?B?b1Y4NERNNktuYlVSd25UUTNOQTA3UGJ0cW5xejBMSkZNai93aEJKYUZKOXEy?=
 =?utf-8?B?WVpoNVlBbHlMSHpNNXpuenFJdUxaWjRicEhRZDM0UzhHOWFGYVVkZCtqcVI0?=
 =?utf-8?B?YWhLdlpWUkRnWDJmL0N6VjRDb1RqWE1wV3crcm9PYkhWbVRhRitnN1pDa2tR?=
 =?utf-8?B?eWw3WWp0WDA3eHNTWElRUmlLdkN0Q2JSU0FvM2NZSzFXVFVtYmMxQzY4aThV?=
 =?utf-8?B?ckhueDhia015VlpwSVdmQ0g4QTRraVRjUkdoQzN1ekU5K2pDVFdCdHZnWWJ3?=
 =?utf-8?B?WWE2TjBiOW5STVdxU01uY2N6V1A5TmxmeFhZZ28wS1ZtZmxESGZuQU50MGRR?=
 =?utf-8?B?aWxDRjhJM2Z5YWRjNzZuRGVHb1l6bzR2QlA3ak1jTUc0Q2ZidGNHeG83bGts?=
 =?utf-8?B?eFgzQ3lrMkkvVjAxdW9kaCtIK3FpZUpsc1RKQjd3cFg5WDAvR1gvTWRhd3Nt?=
 =?utf-8?B?RVUrOEx5aWNHaHVBY2xTYmxMbHJhN20zaVZGYjhyVGk4WVhFNVczUFpXaENh?=
 =?utf-8?B?UU1COVJBYldLeGUrdml1VFowVnFjcnYvSXA1a1ZsNFFTejE3THNMdUlpMFBi?=
 =?utf-8?B?RnZRMER0WVBLeHU5Y283TU5ENVFXRGJoYWpJTTVvbjhyRzF5bjFBTU9NekZu?=
 =?utf-8?B?UnhTQlUydFJDK3FpVGgvQWNVaGorc1puSDlpRHJKU3l1U2dsN2YzWTBnMzQ2?=
 =?utf-8?B?RUkvZ1FwNGRxSWp2UDZBY051YkpvTzEyNTNGYi85TERGSGppRElpWnVwa1lR?=
 =?utf-8?B?Z1V0blNVVkR0RnZPamZqYU1vQVJib2dXVWsxTitxWDlnK1JlVlJXbG1SUmFQ?=
 =?utf-8?B?dFQreWpMeVk4Tkd6bHVhcEZ4OXNQNkNYM2hoa0cxdXE4OE9Mb3RLU1Fpa0h0?=
 =?utf-8?B?ZzF2NXhva295VnJrQUhiY0JSc1c2dEUvUkNaaTdxRFVXRG1FVmQzUXZDQld2?=
 =?utf-8?B?REkrOFBtMmdiRDdWYzErZktDMkh6K1FhNHVUb3BoUXlxQnhEWTkxV2tKK3dH?=
 =?utf-8?B?ZStmbTBwNGUyMTRSSnIvWTIyYkxJM09kRjBHY1labXpGUE1hQ1ZnZTJ5Tkxk?=
 =?utf-8?B?YzUyd2lQbjVXWVJIY0o5ek1XdGxsb1JDL1ZSaDZXZlNyalZzcUlTQ2ppMnF1?=
 =?utf-8?B?dTJrQ2pqSThPN25GSVpXQlNncGZTZ0V6c3BQSmxOVWY1OFN6R0VQdUljbklC?=
 =?utf-8?B?RU4vbkFVQzUwN1E5VG1CZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG9Nd2ZEZzlsdEMySC9pLzNHaUVQL1hWSWU2TFVwd1JKMUtDdHZOaXl3K2NS?=
 =?utf-8?B?OW9ZNzVvTnhCeGcydjFlMmtBTmx2c1ZxSyt0eDhiRFZZTjhsYnFiZFNLeXJa?=
 =?utf-8?B?NE1ETnU1ZkZQR2JpK2NUUVlNRURVeGhLWGU4dmFFbFg0cE5xQTFkQ2JMUmJK?=
 =?utf-8?B?dDdTZTk3N0ZyY2p1d1Mzck1QeE0zcm5HbVpxYUljTVBwQU4vT3c4blEwQzRG?=
 =?utf-8?B?MFJWMjBWRXlHVDVrTGRwUk9janJMSzlCZzFva3UzT3ZPa282c0VIZEw5MEpW?=
 =?utf-8?B?U2pkVk9qcGVyaVE3V3U5b2gwd01FclZCRklYVFFTR2svbWUyZGhBZjJBdWpH?=
 =?utf-8?B?QTFWSDQ3Mmcwb21sVjhtb3lEbkVmWVd0c04yZzJ0cHB6TmRSNTZrWTdWTm5X?=
 =?utf-8?B?dzRrUE4xb1R0OVpmUG9BeWErVWU0QVg5enRQZWJFcE9WZkdQYllkMmVvVXEv?=
 =?utf-8?B?VU9MWGV6VEc2RmxIcHJ4Q0tWWlNEcS9LYVppSVVaSDZHaURRRVhRZFFtY3dR?=
 =?utf-8?B?WUhBTFM2c3VhT3JjM2d5RFZpVkJyTGlvdEFzZFFHVHVQS2VtQnFTVnQ5WEkw?=
 =?utf-8?B?MDlkenZwLzlpQ0RDRDVId09PVjQxVlErdHcwU1RnL2R4VVJPZ05HS1dOSjBy?=
 =?utf-8?B?WitsOUY2c2J1R01BTHhvWkdMTFd6UTJoSEQ1THVPeHEyUG51UXZIcjgzdHBh?=
 =?utf-8?B?eE1GdThwL2J5SXhIN3JFaHZzUmR2aVU5K1A5ajU0Q2hXQ0paMXVGRDZtMGxH?=
 =?utf-8?B?dHVsK2M1WmUyNnpFVmgycHpKY0c5b1FVMU1vMUJhalE2THdHSGpuTm5xaUlt?=
 =?utf-8?B?V0hnWXFBVE51VldVdzlEZFhjVkEvSFpUeGtYV3RXVE56eW45Qi8xTXBxMlB6?=
 =?utf-8?B?RjBMa1M1Wjdpc1lhelZLNkRQb0Zwd2Rpa2VzZEZLNzhGQTEvemdmR2tYTnk5?=
 =?utf-8?B?Q3lNWG1tRURtemRQM214bGZUVDNQUmoycnI5UGZvUWd5OEFvQ2FtKzk1ZWcv?=
 =?utf-8?B?QW91dHU2Z05yTWRpb3F2am9OVkVnV3AxRWoxeW1yNUFKcERSSWszeURNeVp3?=
 =?utf-8?B?WXVEdHZYRHR2NUpObVBJaDN5Vm9pTnpKaFZCUGlZc3hKMnBYcHpwdjZ1VE52?=
 =?utf-8?B?YkJtY3puZHA3OE1VNFBTd0J6c2ptU05ZQ1V0UVZ1dEg4MWNvYjJkSEhMNm51?=
 =?utf-8?B?N0c5V29YWnpJbVZDT1R1R0UrWEhucFovZkZXUzV4bDhqbHora3kvTTBXc3VN?=
 =?utf-8?B?NnBmZ0tXcjNFMEo0VDhmWXlvWnlrSjRxQlZaYjl2c3g4Zjhzc0gzejNIZ2Q2?=
 =?utf-8?B?b3FQZWYxdUpSUk9qbTZjQWtOajVQZno4WjFFSzBUTVBPTU5PcHpONjEvQzUy?=
 =?utf-8?B?a3RtZ0hodEZrc3huL0x1dlI3bXVyYkU0RUcyUi9oUTdvdHJ4Ry85eVV2Ykx2?=
 =?utf-8?B?ZmlRSU9ZVHFlMDExU1NWelNoVERGanIzdFdvWWZ6SHpEVjBIc2RENkFiWnI1?=
 =?utf-8?B?U3ZyWUk1UDBDV3JWWGxHVVNkeVZ4UXQ4SVduM3lGSVJoQkhnL2FKSGYzUTJ2?=
 =?utf-8?B?cVZsdnZnUUs1UEZqYWQwYW54K1pIMTNWSFEvV1JjODdLdWNtcHBMNzR6dVg0?=
 =?utf-8?B?K0FaeElYWStXbGNPQ04wZUFjTmJnM085dFFUeVdQWXRQaGxhdS9Rb1dRU1RX?=
 =?utf-8?B?WHRjMDFBS0lDcUcreUxValU4SWwycFlrYzhKQ2JEd2YvM2s0NnJIT01JK0pm?=
 =?utf-8?B?TmtoZjFiaDNaejBSVUpRYVdHYWEydjNOT1h1R3VlbmtOdEZLaVc2cFk3WDVK?=
 =?utf-8?B?M1hlbkFUSU5FbUlzYWVYUUVIRHJuUXh4K01GWjM3NnBLeUVJNjZ4VGZidCtJ?=
 =?utf-8?B?WUdYaHdJdHk3Rzd0eGN3Vzk5TVhLSUYyQVFoTEJueGpvY3Z4cTlxMk84cit0?=
 =?utf-8?B?aitJaHBibnNsbHlCR1JGWVAzMU82aXE0TFB6WkNUWGJNSHhBeElTTzFQVU1i?=
 =?utf-8?B?eVdWMElCSmNjSlFpSFlabDhSZHRIWDMxckt4MVpWeENmSVpYeDNGK0JsZUNZ?=
 =?utf-8?B?VW9ML2hyNTN4OXo3VlRGbkhvTnMyTXNnRFFFTnlZWGJiVjB1Ky96MVh5TEFV?=
 =?utf-8?Q?LENg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3510f12-3508-4e24-3d69-08dcd0d66193
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 13:50:36.1178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjhEkrh2oG714iHvScgzhnAbWydJvUSNpfXyDBagIJ8w4RJa7yo1lEdNv8P4Vrll
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9119
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

Am 09.09.24 um 15:27 schrieb Tvrtko Ursulin:
>
> On 09/09/2024 13:46, Philipp Stanner wrote:
>> On Mon, 2024-09-09 at 13:37 +0100, Tvrtko Ursulin wrote:
>>> [SNIP]
>>>>> That could also be a great opportunity for improving the lock
>>>>> naming:
>>>>
>>>> Well that comment made me laugh because I point out the same when
>>>> the
>>>> scheduler came out ~8years ago and nobody cared about it since
>>>> then.
>>>>
>>>> But yeah completely agree :)
>>>
>>> Maybe, but we need to keep in sight the fact some of these fixes may
>>> be
>>> good to backport. In which case re-naming exercises are best left to
>>> follow.
>>
>> My argument basically. It's good if fixes and other improvements are
>> separated, in general, unless there is a practical / good reason not
>> to.
>
> Ah cool, I am happy to add follow up patches after the fixes.

+1

>
>>> Also..
>>>
>>>>> void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
>>>>> ktime_t
>>>>> ts)
>>>>> {
>>>>>      /*
>>>>>       * Both locks need to be grabbed, one to protect from entity-
>>>>>> rq
>>>>> change
>>>>>       * for entity from within concurrent
>>>>> drm_sched_entity_select_rq
>>>>> and the
>>>>>       * other to update the rb tree structure.
>>>>>       */
>>>>>      spin_lock(&entity->rq_lock);
>>>>>      spin_lock(&entity->rq->lock);
>>>
>>> .. I agree this is quite unredable and my initial reaction was a
>>> similar
>>> ugh. However.. What names would you guys suggest and for what to make
>>> this better and not lessen the logic of naming each individually?
>>
>> According to the documentation, drm_sched_rq.lock does not protect the
>> entire runque, but "@lock: to modify the entities list."
>>
>> So I would keep drm_sched_entity.rq_lock as it is, because it indeed
>> protects the entire runqueue.
>
> Agreed on entity->rq_lock.

I would just name that lock since it should be a protection of fields in 
the drm_sched_entity structure.

That those fields are the rq and priority member should not necessary 
have an influence on the name of the lock protecting it.

Only when we have multiple locks in the same structure then we need to 
start giving them distinct names.

>
>> And drm_sched_rq.lock could be named "entities_lock" or
>> "entities_list_lock" or something. That's debatable, but it should be
>> something that highlights that this lock is not for locking the entire
>> runque as the one in the entity apparently is.
>
> AFAICT it also protects rq->current_entity and rq->rb_tree_root in 
> which case it is a bit more tricky. Only rq->sched is outside its 
> scope. Hm. Maybe just re-arrange the struct to be like:
>
> struct drm_sched_rq {
>     struct drm_gpu_scheduler    *sched;
>
>     spinlock_t            lock;
>     /* Following members are protected by the @lock: */
>     struct list_head        entities;
>     struct drm_sched_entity        *current_entity;
>     struct rb_root_cached        rb_tree_root;
> };
>
> I have no ideas for better naming. But this would be inline with 
> Christian's suggestion for tidying the order in drm_sched_entity.

+1

Yeah I mean see the other structure we have in DRM and general Linux 
kernel. The stuff that is static is usually grouped together since that 
is good for cache locality and documentation at the same time.

>
> I am also not sure what is the point of setting rq->current_entity in 
> drm_sched_rq_select_entity_fifo().

No idea either, Luben could answer that.

Christian.

>
> Regards,
>
> Tvrtko
>
>>
>>
>> Cheers,
>> P.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>> [...]
>>>>>
>>>>>
>>>>> P.
>>>>>
>>>>>
>>>>>> Then audit the code if all users of rq and priority actually
>>>>>> hold the
>>>>>> correct locks while reading and writing them.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> P.
>>>>>>>
>>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>>> Fixes: b37aced31eb0 ("drm/scheduler: implement a function
>>>>>>>> to
>>>>>>>> modify
>>>>>>>> sched list")
>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>>>> Cc: <stable@vger.kernel.org> # v5.7+
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/scheduler/sched_entity.c | 2 ++
>>>>>>>>     1 file changed, 2 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> index 58c8161289fe..ae8be30472cd 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> @@ -133,8 +133,10 @@ void
>>>>>>>> drm_sched_entity_modify_sched(struct
>>>>>>>> drm_sched_entity *entity,
>>>>>>>>     {
>>>>>>>>         WARN_ON(!num_sched_list || !sched_list);
>>>>>>>> +    spin_lock(&entity->rq_lock);
>>>>>>>>         entity->sched_list = sched_list;
>>>>>>>>         entity->num_sched_list = num_sched_list;
>>>>>>>> +    spin_unlock(&entity->rq_lock);
>>>>>>>>     }
>>>>>>>>     EXPORT_SYMBOL(drm_sched_entity_modify_sched);
>>>>
>>>
>>

