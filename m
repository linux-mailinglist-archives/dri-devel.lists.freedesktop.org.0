Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EC5B5969F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 14:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB2510E7CF;
	Tue, 16 Sep 2025 12:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RL5nPs+X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013024.outbound.protection.outlook.com
 [40.107.201.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7213C10E317;
 Tue, 16 Sep 2025 12:51:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okAk3RZ9ilzTvbCeDTcpmoirXo+mGHR2A1qnDTkoY/Y/cpdhVB1PsRNxsv2y9CuzuDTfrmjDL6TmO29CD5AilH8KXRaAXl0ypdxbMvDBEzvYEYQXD7tojRiUtg+sLSuySJlNXwFJ9d58+wuSUSH7NALLwtiA9xhqcT/JeEePlkCFzPHAGWeOd+2dF/GuSIVDjqH2AqIM4SDiv5JE7GhNR+dZ73kRfUvS4rE4moSvnBITW1En7sJPOGEMpTOBtDkS8baWtQYL9rIdwQ4FYreP7wJWsnwfOPT86EHDJvr40ftEfL7LA1C7erarh9gP1sqfjBfv5WCy1cv5wV9VNC93kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5gcV7kWbrn5Vg5MXeSwIllfWAf3PPGpIxFDhSjF/EE=;
 b=ZIPC2mvSRONAS4phsgQYkXtbNn0iHn7fHYg45/ipZ2pvB1tBfGrU7fcBJGRN/CPjGSHh4OhK8OGcvaBjNgps9RIAb50XiMsGr1MZ/v7mRjHrBfA81z+v/qshQEYwKXgDQgR8E5/5U/uPzV0K2pNYxZ8QCR+GzaToWLMQzzh1IG9SE44+VC4eN3/z5u4ovemYX6Ih7PaGb4+b9gNoI5U8xClvuElG6gdTesB98AiyTZQF6gAEMuTDR8e85/TPbin/tXP8Y2u62hcKnnaBYKWvYVlXvTG/OYwBoKx+MH98jVQj9l628YyRiyj+aJSwQu5hGYg2rxxocaC6N5WAN/M4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5gcV7kWbrn5Vg5MXeSwIllfWAf3PPGpIxFDhSjF/EE=;
 b=RL5nPs+XUzybswjwYEoi+uZNE+1vzBywZ/su4xZbJaKJksZofhRekkjJCZR+ydr3FYukXS5wx8yfOWtk04lkWLUnlJEqkXLp4qGNQJKxct7rk/fVwMpleEDjDtB+WD2wCd2GR/U27XAnGjh56WRMknKYGDe8zooverLiuEf3y3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5897.namprd12.prod.outlook.com (2603:10b6:208:395::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 12:51:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 12:51:55 +0000
Message-ID: <388ddaf9-2a43-4c70-aed6-370b9f38887b@amd.com>
Date: Tue, 16 Sep 2025 14:51:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/amdgpu: make non-NULL out fence mandatory
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250916070846.5107-1-pierre-eric.pelloux-prayer@amd.com>
 <f66cc34f-b54b-4f91-a6fe-11a146c516b2@amd.com>
 <9e1964bf-7748-4e41-9048-b1a5ad63a8c9@damsy.net>
 <8a5f0bc8-4d3a-4e47-902e-7527759d1494@amd.com>
 <3b4f8837-e0a8-4e8c-9d33-5f107e41c55d@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3b4f8837-e0a8-4e8c-9d33-5f107e41c55d@damsy.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0421.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9b465f-6238-4147-6c2d-08ddf51fd0d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTA3WkJ0aCs2VzIraDU5ZktNS0lHTXpBem0zcnhwc3pRVDVOanNsc3hyZ1dH?=
 =?utf-8?B?cWZrS2xPT2hqZXRDdjJETmFGK3FOZzhlVmtzWUFzakY3VElKOVYvREMya0xx?=
 =?utf-8?B?anBmNjZxRnZzcFRKTkZZM0Z1c3BNM0YzQVYzdGkrR3k2ak9TemJlMElNUFZo?=
 =?utf-8?B?SEE0TTNHZUFyZURPb1o1UCtPK1czYmlrRmNWSXhmdWVtQzMzalBDemZKYTZp?=
 =?utf-8?B?U1hVL0NORTVIS29KYU44aTg3RDhiVzFHU2kvTEJNektudlRBVExiWTBsbUdH?=
 =?utf-8?B?UzlTTk44b1ZLMVhPSkN4eVZOeXQ3anFMb29LUm1yUzFCdUQxN3BsdDM5U21D?=
 =?utf-8?B?d0NRTXhhZ2dXUGo1N240Q0xPVGhNNkczL2NEdnFOa2tDSW1CTHhaUHcrQ2Ri?=
 =?utf-8?B?bFhoaEpEWnF2LzRoSHJEbldhandRdzhaejBIZldjdkFxTVNKSmRZdVFtQk1C?=
 =?utf-8?B?MU5tUXhJTXRlalJDT3hvcTJMYjBGYlAzRkNYcGI0dWtXZEx6NEJXWXQ4MUxJ?=
 =?utf-8?B?a3laTmMvRHVyejZqSlVWaGw2N3FLaEZJTTJwcDNWQ3Rud2pvL0hZTnF2SDBp?=
 =?utf-8?B?WEpqcjdIaXY3dEFwWkVVcEdBTGwxUWZZbHg5UVY2OVFTdUhZeWJFMGdvZXh2?=
 =?utf-8?B?VkxQMGhPVGRXMWZveG1BS1RBUkFuWEQ3ZWVwN21hclNFWUdmcFEwdzVkV1Mz?=
 =?utf-8?B?Z3RCYTZlTzU1NVNUQjVaNkVGdGt4WlJ6M0JPYk03eXM0QkhSckpncnBEL1NM?=
 =?utf-8?B?aXQyb2dGN05WU3I2ZzRDRFNDUzN3MU0xb0thTE00eVZYNmJSd3N5cW1sV0Zw?=
 =?utf-8?B?VkhQaUFUU2kyWkhtUk12cEpzNDNDdVdpa0loM3Y4eGF1NGFPaDZQV1ZnbDFV?=
 =?utf-8?B?THE2R0ZYOU5ETlNNVjBQdTVtMjBucW5jeHRtZkVGMzlkRDR1YWxyNlVIajQ2?=
 =?utf-8?B?ZlJqRENZa3BmbkNZMzdLVkZaeVhSUXhaUUJhZUlaV01sQ3RqY001M3VITXlB?=
 =?utf-8?B?ME9IRG9zcVJZMmNNeXAzanVwWjVjaTNxV3FWRXdRTmprN2c5emxOV1c3dnhI?=
 =?utf-8?B?MnNEL3JzSWtsOVFUbnZrVUNRdzN0YWEvZFlpN25YQktFclB2allva1FRckVY?=
 =?utf-8?B?V3NJbGZnVWhzZVFxNGd2SENyUVBCcmpDOHdRcEoxQ1gvajdvZkNsT0QrV1lC?=
 =?utf-8?B?dTV2amRCaGw4dVlDeVdpeFBiQ1p3bWxUMDMzRXl2b3ljdXF1WUxNZGsrWk9E?=
 =?utf-8?B?RlBUcVdDaTBjK3NmYlIwZWo5cHhML2I2c0oxUzl0UjIrRVNvMVJYc0FFcEFn?=
 =?utf-8?B?czRFVXZBZERxLzYrNHVhaVFYRDR2YjFwOFFzUGlid3FoZWkxTUR0MGNIQUxr?=
 =?utf-8?B?REF1ZVhzVkZjVzg4MnpvRTdKWVByR213KzFRVWRlRG9QRStLUThvWlV3YzZn?=
 =?utf-8?B?UExVRVJ6Zng3aDBKdHpFZmpYdnBJSVZ1T08wUk1YZ21GOFEzRlpGdFAwcWdz?=
 =?utf-8?B?d1JUL0c0cWUxK084emlQa3J2ZUZBd3NzYkUzdk4xbG5JbUZWK3JDeVV2YnU5?=
 =?utf-8?B?eTZwTFdSV0hUdWFPemd1OElDN2tMVUFRQXQ3Szh5Q3dIY2xHdGkxblhDRjFN?=
 =?utf-8?B?YW8vRGtsbkh5RnpTVnVJeGNXUjJWaG4rZ2c1d0xkVVo4OVk5TFNHTFhWOEdR?=
 =?utf-8?B?aEREdFNFRytRNXptelZXRmVQWE1hK2VzSkRFQVM3bWc2dFpTTnJYOHZpNGhw?=
 =?utf-8?B?dEVQdVdlOXcreHAvdlZ3K2Z0c2FSNlNwNmpiYWQ4N0wrY0lTZjFqdUgwblRy?=
 =?utf-8?Q?rCKPJUKm5T4q9YLXJmUI1v0HLSLGfJcrsOQxE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVpwamNob1NOQlNTZUkvaElSek8zYnNkK2FtdG9HVWFIdW9oR0NoNEswUG85?=
 =?utf-8?B?YldoeXJubk1vRENmcWUvL3lyRDEvdkkxcWlhZkVLdTNYV21jSnF6ZS9rSjU4?=
 =?utf-8?B?MzNxd2dYSEtlRU85dlU3U1A0RXRPS2tlMFhhdHlLdGlyK3lET0p6bEw3b0dD?=
 =?utf-8?B?LzNocktDN0VRQytxS0VHVS95eEhqcTJtWStMZkk0MjFHNXU0Q3NTc01RS25X?=
 =?utf-8?B?VUhnWVF5RnFYNENmTEVpVlhDU0VBRjhGVGNBa3h6QWZoVVgvZEx4dzA3d0Fj?=
 =?utf-8?B?NXIzbjFaSE4rTFhJSzFyeW9jWDJ2V0U1R0dHOG0vU1RJVGpGQXNKdklGNllS?=
 =?utf-8?B?a1YxMmVjeWFDell0VXp4WEthcko3bnh1L2djR0RYVEt5MGFkYldTaWNPRCto?=
 =?utf-8?B?VVcyZUp3dXkyWm4yWjdVVHlwSDNSWlhrUUVKaWZranFJcnNNZHdJR09leG4z?=
 =?utf-8?B?eC9oUG4wQVlzMDZsMEhLdDlNWVhqVDR0OWs5NElIckFtWm1ORnlYb3B3NnFK?=
 =?utf-8?B?UlZ5NXRXK0NMZWpQNmt5anA5N3NoK1lhblZMQlk3T0M5dUdPazJ4V2dmVGMz?=
 =?utf-8?B?ZTNGa0NkN3BXZTUzMzN6NW1HREp1QVNLVXhWQzNha0JTT3MzZ1Bic2xicjcy?=
 =?utf-8?B?Qm92MUI1TGN0SGx4YXRIUkpkUHErTE1aOVQyM1I5TXpRR0oxUmJzWXNaTkdY?=
 =?utf-8?B?eGZGcmtGQlRQdGloQkZuYjFZdHR3aEhta0MzMGJzdUFNaW5VR0dlTU1VYzNM?=
 =?utf-8?B?SU5PdVJmNTh5ZUE0TmRmZXoyMUpNL3FvK29XdW5sRE14TGI2NGtDbDZ3TTV5?=
 =?utf-8?B?ZWlmZjN4YTBmbXZjNFErb1hTaGdndzYySUNNK1RhQkZJVWhDRDVGNWVrVUY4?=
 =?utf-8?B?dlRIMWxPS2dCalVYVU5UdHBjV2Z4cXlhMisxMjN3Y3FTQlJta3FrajNmSzlq?=
 =?utf-8?B?NDB0eUJUM1dKSkZqWHJMOGlIYzZob0VmZVAwVjFkbDBYUk9vMzNTR2xob1dB?=
 =?utf-8?B?RmlIaWdIK1BlbFB3QTlzcHVMRVNjRDN1dUtZNTJrYU1iQWJINGRmbVJDc3pV?=
 =?utf-8?B?WnlqMVBzcXY5OXI1T2g4YmNpYkRYQ3JnNU82b2R2N2xsWlpaTkswWmluOEQr?=
 =?utf-8?B?RWZoRHdWM2YzNW9FY2ZCcDJadkNtUHozaHJabmtPY1UxQzNVajg1WDBpeldi?=
 =?utf-8?B?QTFnMVZYZW94WmVUQlJQaUcrN1FvdmNkLzRyMTUvV29ZbVhTSjdTZzV4dmNO?=
 =?utf-8?B?Y0FZVHhOdjcybm16R0pvTDY2TTJjUDhGOURTRGhXUXEvZGxkWnN2eWtZS2cr?=
 =?utf-8?B?eWE4Zkhjelh6aFR6Sm51Y0lJWFN5QTlSQ2pKNGRPa0xmV25Va1VsY2hQdTV6?=
 =?utf-8?B?dVRmc2EyVDYyUG5YbVBXSnNhczQzcFRlenMyWU5nRzJ1cUZCTlB3VDdBekRx?=
 =?utf-8?B?ZTBtSHllNU81WnVnSnhxajZKSEZwNlFFRHd3OWVRbisyYkpzRWxRMlhwT01h?=
 =?utf-8?B?RXkvK3NQeXJ2ZVZacUszWjEwT2RLVXptZXdDTloxTTBsSys4TE5SWFRNZnZR?=
 =?utf-8?B?M2w5enVYOHptajlrY3E2bGtKT0pyMXY3dUtPVlB3dEZpUU1xVWhNY0swNUc3?=
 =?utf-8?B?THV2cG5FS3RzeFlWc3Q5aXVqYVU2UkFMNEZzU3UrQjZ4MFByY2JBenFZeFJP?=
 =?utf-8?B?M055M0padkZzYVBPSUN1SjRKUXdWWkRSWjMrSmd6M2JpR01EbUZYUFdVVHRy?=
 =?utf-8?B?cjNrL1ozOStxSExHL1BoMVZDUU9JeGRVZDVyM2JrT3ZQdmU2Z1BoN1BoRnkx?=
 =?utf-8?B?dFVCWmlHSk1SOEpMdTMzWUdBdGRNT1NvNThCcFJuNE16WUpsdFJhQlZoYXFW?=
 =?utf-8?B?WTdpaHhoeEN0djlEL0RQUjVsejZUQXV5VDUrcnhDazdwT0lsY0EzN2lVT0U3?=
 =?utf-8?B?MjQvQ2hsRW9PL2d6dm54ZUQxZU1SaithRGhrZ3J3MHg2Tno2Q1grSTlaOEw5?=
 =?utf-8?B?S1JIVFRPaWVwMUlzN3p1SGpsNCsxaThuYkFIY2VBMFNnNnJUZGtEMm9hemtm?=
 =?utf-8?B?bllnTVA5SnVQSGNCemk4R1hIWUpLWS8zRGhzQTRtUjdIcWpTYm1IdWxyRGtD?=
 =?utf-8?Q?dpELHTleOtElllGQf0LSpXwDx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9b465f-6238-4147-6c2d-08ddf51fd0d9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 12:51:55.4915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iqm9v4fQFY2fb1CnQ6khv+QPkzsz32SK27F9IDNAuJ3CvnGeRF6I8xqtNIkDFJI9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5897
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

On 16.09.25 13:58, Pierre-Eric Pelloux-Prayer wrote:
> 
> 
> Le 16/09/2025 à 12:52, Christian König a écrit :
>> On 16.09.25 11:46, Pierre-Eric Pelloux-Prayer wrote:
>>>
>>>
>>> Le 16/09/2025 à 11:25, Christian König a écrit :
>>>> On 16.09.25 09:08, Pierre-Eric Pelloux-Prayer wrote:
>>>>> amdgpu_ttm_copy_mem_to_mem has a single caller, make sure the out
>>>>> fence is non-NULL to simplify the code.
>>>>> Since none of the pointers should be NULL, we can enable
>>>>> __attribute__((nonnull))__.
>>>>>
>>>>> While at it make the function static since it's only used from
>>>>> amdgpuu_ttm.c.
>>>>>
>>>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 17 ++++++++---------
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  6 ------
>>>>>    2 files changed, 8 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>> index 27ab4e754b2a..70b817b5578d 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>> @@ -284,12 +284,13 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>>>>>     * move and different for a BO to BO copy.
>>>>>     *
>>>>>     */
>>>>> -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>>> -                   const struct amdgpu_copy_mem *src,
>>>>> -                   const struct amdgpu_copy_mem *dst,
>>>>> -                   uint64_t size, bool tmz,
>>>>> -                   struct dma_resv *resv,
>>>>> -                   struct dma_fence **f)
>>>>> +__attribute__((nonnull))
>>>>
>>>> That looks fishy.
>>>>
>>>>> +static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>>> +                      const struct amdgpu_copy_mem *src,
>>>>> +                      const struct amdgpu_copy_mem *dst,
>>>>> +                      uint64_t size, bool tmz,
>>>>> +                      struct dma_resv *resv,
>>>>> +                      struct dma_fence **f)
>>>>
>>>> I'm not an expert for those, but looking at other examples that should be here and look something like:
>>>>
>>>> __attribute__((nonnull(7)))
>>>
>>> Both syntax are valid. The GCC docs says:
>>>
>>>     If no arg-index is given to the nonnull attribute, all pointer arguments are marked as non-null
>>
>> Never seen that before. Is that gcc specifc or standardized?
> 
> clang supports it:
> 
> https://clang.llvm.org/docs/AttributeReference.html#id10
> 
> And both syntaxes are already used in the drm subtree by i915.

Ok in that case Reviewed-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

> 
> Pierre-Eric
> 
>>
>>>
>>>
>>>>
>>>> But I think for this case here it is also not a must have to have that.
>>>
>>> I can remove it if you prefer, but it doesn't hurt to have the compiler validate usage of the functions.
>>
>> Yeah it's clearly useful, but I'm worried that clang won't like it.
>>
>> Christian.
>>
>>>
>>> Pierre-Eric
>>>
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>    {
>>>>>        struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>>>>        struct amdgpu_res_cursor src_mm, dst_mm;
>>>>> @@ -363,9 +364,7 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>>>        }
>>>>>    error:
>>>>>        mutex_unlock(&adev->mman.gtt_window_lock);
>>>>> -    if (f)
>>>>> -        *f = dma_fence_get(fence);
>>>>> -    dma_fence_put(fence);
>>>>> +    *f = fence;
>>>>>        return r;
>>>>>    }
>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>>> index bb17987f0447..07ae2853c77c 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>>> @@ -170,12 +170,6 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>>>>>                   struct dma_resv *resv,
>>>>>                   struct dma_fence **fence, bool direct_submit,
>>>>>                   bool vm_needs_flush, uint32_t copy_flags);
>>>>> -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>>> -                   const struct amdgpu_copy_mem *src,
>>>>> -                   const struct amdgpu_copy_mem *dst,
>>>>> -                   uint64_t size, bool tmz,
>>>>> -                   struct dma_resv *resv,
>>>>> -                   struct dma_fence **f);
>>>>>    int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>>>                    struct dma_resv *resv,
>>>>>                    struct dma_fence **fence);
>>

