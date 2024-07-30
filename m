Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8560E9412D2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 15:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0523110E525;
	Tue, 30 Jul 2024 13:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aqjkf/9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485D310E09D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 13:11:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZnUUhxkUwWQEVRyfIvWCz+XXEH5GpRujjC3ZVdsfur8HNRzVCjcC7TwC8GuRkkIlb0ex5G4zFe0tXC/xgTjK14w2nmfbegPjVTVDQucMqz6tbNku/DXzP+B5YNz3CrSECbaHgNH5YN/8WyZ/CiNZ2fPfozRCU75yKpCOzfTy6XkJbbZMoIwsDZ5WzoXxHYv0quBpxgASF474PZKmbDhw9+pCZldwIxHFxqDly6Si/CwgmLHHnJP2zQhGFPVVIrdUChQx1x4pJN2aMbXD4l2x2efs/4wYr/1WqZOjItOECHOnvXOZcfeJ7qYvVDdW+3YeXWOlqOobV4YbP1y4P1UsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy1OdMBjKWiLrGStg2rIdYRgqLM+ZO0oASKEPzWUOd0=;
 b=VRKgy/JTkeBx8sdNrMEEjrPk/f6m/K+t06XeiXWwn3khsG/j8WoHnyU+ad8Re2bLhQ0ohaCiCAe+NW88HG3kMV+dSmzGA43jZntLHZE7hUoUFkXq1NnZpA0HneJ0yD5BCeTUnYAlfis6k2sFasgX3odlRvvE4Ox0EStLDPxedH+IfbNIXohxDYblEbwPZdhc5uHOz9tVuAax0yLrDIG3TLrvthSSWpJVpJ7l5cbmU+QB9SV8gIG604GCxyEc0WuR3XHUNTcnriImuGxrammUI6wE8qRGU77EyEtHgShQ2MCrwJqFTjr3zM6BZakTt/uucqOPe8n9QsaSo1mzapyt/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy1OdMBjKWiLrGStg2rIdYRgqLM+ZO0oASKEPzWUOd0=;
 b=aqjkf/9mLXCRIG9mla63pRG5Nb6o13fLEw0mDI7aAz+xtpDMJ5l3xlwZZSjso3bNSkjT2653jilvlsqKSIl7CcdaSws96MGO1QFGF9U26p4Kau+5fi4KcVSjSXc/sRIJFxCPCU2R5KMF+4kOOV96kShpp6DM7bfROzSvEhk+Lw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9077.namprd12.prod.outlook.com (2603:10b6:610:1a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 13:11:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7828.016; Tue, 30 Jul 2024
 13:11:08 +0000
Message-ID: <06c7266f-8789-47fa-bb42-a18c9d15a87d@amd.com>
Date: Tue, 30 Jul 2024 15:11:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <d2f56198-a3c2-4f7b-9d10-616deb348351@amd.com>
 <966651c0-42fc-4827-bf3e-2170dcf4688c@vivo.com>
 <d5d7674b-eab3-465b-97eb-e33bdbecd7c0@amd.com>
 <79b51a8f-9c28-488b-9be7-b5ce715aa1f2@vivo.com>
 <d8529566-249d-4ae0-87fd-04cdc7e4e573@amd.com>
 <2d94446c-72d1-4c4d-b7e0-696767b98654@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2d94446c-72d1-4c4d-b7e0-696767b98654@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca8440a-60a9-4715-287c-08dcb0991397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0hxSEd4TS9tUmVlZS91VGFZaThKM3kzWVJUNStyMTlyQ05mU0JLYjgrSkxT?=
 =?utf-8?B?dFJRWFpVZHNxMk9GNFJnUFpiNDdhMGFPUU43aW1pbFE4ME00UndIeW5mcUJ1?=
 =?utf-8?B?bFJtZkxLL1ZMaUNUc0pZdU9WU3Voa0RxNWhTRXh3dWxlcG5ldlUwdTRGOTRp?=
 =?utf-8?B?TGR6TTNJR1JxbkpXVGNKQUMyV1R0RnNtQ01pMTVhR2VrcjRhZVNxWUVRNGFD?=
 =?utf-8?B?TjQ4QkRsTGpOcWIyWC9kK3pXR2dOK1FpOHZiVEtUaWR6d1ZBYXdvd0RnRVdm?=
 =?utf-8?B?OFhkZFhuRlVYK2pGY2w1UjA0aGtrVGhWbGZIQVR3SndZSUpCaDFLQjgvRVFw?=
 =?utf-8?B?V095cUVCaFlLTTZsVmQzM0h5Z01GZllJNjErT2lkbjRwbno1RU1aZ3JMOUNS?=
 =?utf-8?B?cVhRQnFFOEYxR2dYYXJZbjVTYk5sUGxZU1FGTTFhVHYwa2wvN3VQQXU1aGo0?=
 =?utf-8?B?a054ME9yWkozR2pETkhqaVl2TU5wSnBJUUFYdFhSeGcxaHlKbW1JVmRGcVhi?=
 =?utf-8?B?R1lIZmN4KzVRMVR0QjRxR1dVdDJnbzAxZ1RYczhsMHZoOXdzNXRWMUo5emlI?=
 =?utf-8?B?TkgyV0x0UGV1T3I4cStHY2I1THRqOHN4aWxrMDlibHFjYTVrTEhVb3VNTzNG?=
 =?utf-8?B?VTRNekIzYXM2SVlwWlNvOVhiemcrazgxazA3eHFxdFRPZUVRdTZjb0tEVE1N?=
 =?utf-8?B?cncxTWxYdnZPcHNaRkhzbTRQSkVjZmhSQ2E4OUFBTUQ3MGtVd0lrZUJ6RitX?=
 =?utf-8?B?aDhFcW10RUlEU1pJd2gwMDV5Rnc0VUJDdS8zSGV5WnR6cjVRUElCK1NJOGNG?=
 =?utf-8?B?STN4VjBlUW96Z1FPb2FycEk5M1AzRHBWMjZEdmhOdzU2S0hwaHNHZkMza2Zu?=
 =?utf-8?B?dGppbjVmSHNsM2FjNTJMWGpoa1l0OFRsZGZCNlV3dHlkK2JycVU1cHhrMTdv?=
 =?utf-8?B?R1d3UWRJbTB2TTIvdmdLSXplL1czdnlCVDFTempkVHFsUFE5dVdyU3pkZjY1?=
 =?utf-8?B?djluY1FudElUNWlVZEJLU2ZvMXp6dXhYRzd4QUp4Ky9EMUdjdFVrbFRNd01n?=
 =?utf-8?B?YVEvN2U3UWJtVnVEVU5iQmlQUDJVSFdwaldBY3RtUVVYRFFUUGYrMDZFSmRz?=
 =?utf-8?B?L1E5MU5oQ3NhamQ1WXMyUFd1MjZxWVdiaEZqZExRL0o2UC9vSHZUYVpHdXpC?=
 =?utf-8?B?YWFSVi9KZ0MyUStiTHBSUDdyV1JHVndSYlh2c1J3SXRuTW5ySnhyQUR3WlNt?=
 =?utf-8?B?UUZGY1AxREJ6L3BTSFVoS2VmL3R2dWQ2OU5WYUZQRkc0UEZucE4raDEvN2FX?=
 =?utf-8?B?b0I3SE85Nm5IZXhCUU8yZ0JPVUNpMnF6NFp5M3E2a3cwalppblRnSElyMEgy?=
 =?utf-8?B?elpyeEQ0Y0kyVDZWbW1IWUpmT2kyVnhYUDhOMFJoUUMrZU92MUlwWW5YUlJI?=
 =?utf-8?B?T1E1Njhianhua2VXQmNKdTZKWFhCcGI3U0pVb2ZZZStwcDlxbmRIMnJhdUsw?=
 =?utf-8?B?L3BrR01HL25ySkdnWFJIeE9YeGJObENxVkxiaTh3UzJpZFkyaXUyTkRHbGZQ?=
 =?utf-8?B?aUM2TVFiY2Q0cU5IMElBM3c5WkJ6WjFsYTRXbmJYRDlveHMrY2V1a3FDbTN6?=
 =?utf-8?B?dXdmZkpCdVo1czBYN01JNGFGYkxFV0Q1VXRDQnZUOXU0d1ZpQkI1Z21uaU4v?=
 =?utf-8?B?Vko0cUhkSWM4RmJGU2ExbjNoSGFHU0JIbHVERmM3V2pqY2ROUi9aTnpVZ2lS?=
 =?utf-8?B?N1dHdHhxUmZyZUlKamhyQzVQaWFoR09NTldKZ0tBbUcyNFQ0eXY3L2VyeE5H?=
 =?utf-8?B?Uklnam5id2NKQnVMQmZmQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RCtIeWFqWGNneHcwVWgrUk41K29BZWVRQ3JsMjNKZGxRWjVRR2RiMkVjWTZu?=
 =?utf-8?B?UUYrYTdkd3RBbmt3TXNCaHI3dloxS0x3VktpMklxc1ZKcnJzbHRKa1g0TEpK?=
 =?utf-8?B?REcyUjZPT0pqZ0pqMnZ0VlU0UWlwWjZYRTRsZTJmVER4RGNDM1RIYTdrTUhQ?=
 =?utf-8?B?aU9VYTY5N283NndMN2ZHdE9ZZmZ1ZS9iQzZWY25UOU1qR28yNnR6c0Zkam1G?=
 =?utf-8?B?RTQ4SDI5bzNDbjlPYzZTQkVsYlJNVWhraXJXU3dmdW1WRG5SOThEdFVIWTY0?=
 =?utf-8?B?Q1RBQ3hOZWpJTCtwVmd4aUxDL095eE84WnpNZVAzbGxFSTAvNi9YQUdiZHhq?=
 =?utf-8?B?K3YzcElXa1ZCbXBURiszNzdQN1JOYjhrWENJZUNSejNrU2EyeDJidkxUZTU3?=
 =?utf-8?B?bHZMczRmZUJDWktCbmY1M2I0aGhOUkdYN2hnUjJ5Mnp6S2QvbnprUW55Y2Iy?=
 =?utf-8?B?SnJ2VlFCNjgzV0ZocnAvQ3paejFFaWl0M0tDS1paL0hXakNLdnJCVmpEek56?=
 =?utf-8?B?bEZNbEV5NzBhdy93UDdaNlBqeXhzVHQ3UnZPM1lQdlRmMkZ5aVV6UHgraGx5?=
 =?utf-8?B?b2xuNmtjdi9xclRySEtDbkZEbUx4b1JXN0gzSzBUSnlEbjRxaytPM2VCc3NS?=
 =?utf-8?B?TFFyc2RoM2tzS2dFemhQdWN0cm1YaVkrNE1uRzByNWVKMENpaFJtSzhiTW5Q?=
 =?utf-8?B?K1E1UHcxV2tWMmZvQ2JHMmhWdW42NVN3dVYxK2R3R1ozeGJFc0RwQ1BENkx3?=
 =?utf-8?B?NnNkSzZYTTVscmlWcGI5RFYwejlIRTRJZjUralB6YjlRVkQ4ZEZwWW9sVlMz?=
 =?utf-8?B?cmJVR25SQkFzZTE3aTVEaVgwcEt4eEtWczBibTZWRFBsdTExdHQ1R3k5T3Bt?=
 =?utf-8?B?U0lUbnpwSkhxbVRrRmV4VjZ6SkR6cE0za3J1K0FpY3VnNjFhT29Tc3RuNU1r?=
 =?utf-8?B?S3FVeVhVY29aVzUxaE5JVTRZczRnOFJCVndSWm9uM2wwa0g1S0dWR0lENk92?=
 =?utf-8?B?Q01zRDVYb2QrOTY2V2hlM0VXYjJDZUU5QkxjcDZweG44UmkrSjRYTVhPQkxV?=
 =?utf-8?B?OWNsRTZaaW9WWUNKWGErSlNVa3VTM25sdlRqWFZMNDZ6S2RzMDIxeGhhUHdN?=
 =?utf-8?B?ZzY2VUhSQUdDN1d2L2lTYjdoM3pkdmptbXRIdTZ4Sjk0WnhjdFc3b1R2Z2pN?=
 =?utf-8?B?MTIrQVRWaVFGL2JTVWxESW1EUzdTNDdQS04rb2dKNnVGTXMxN2VMYUhyTnI3?=
 =?utf-8?B?cDdVZnhRcms5U25Ha1VzeUpueDFRM3A5b0huSWQ0cnZyMStpaTBHTWtmb2N6?=
 =?utf-8?B?NlFjeHVvQW9TYXRKS1l2SmRhaUVvcmpFZitWNDVrVnFqM2xTSndnODcrMDA3?=
 =?utf-8?B?Qld5cFZlT3U1L3RvV1o4cU1iZDNRMm5QaC9PK3cvdHZTTXluODFhT1lVUkpo?=
 =?utf-8?B?MUswdlFqTDhQRDQ5cmx1SzlpRnhCSjBaNjhFRDhjZDlCM1MrVzhxR0ErdTFz?=
 =?utf-8?B?dmJVdmlyWDB1elpjbHJMVVVrSHptOFZQaklUTlExSDBweTBFb05TMVdHZVl0?=
 =?utf-8?B?ZGplZkJJNFRnZUVLUHgvMUpzTXNONXNmWEpuOWdaai9uUTJxSStrbG1ZOEVH?=
 =?utf-8?B?RU56cXZ3bUlxMGtQWmVCZXFOYlhtWTNRTnd1d3Z1bWtNWm1aWDNIWWJQYm1o?=
 =?utf-8?B?NExBQm1kUEY0blB3aFFQMkRRcUpBeGl4b2EvbEFOUFdEZ3JDSlhhUzNEajFz?=
 =?utf-8?B?dXFadTZsTVpFQ0RpTUpmaDUwanBsdC9EYVIrd3loQ3Z2NmN0enFvOUJMcm8x?=
 =?utf-8?B?VnZ3TEx4S2lQZGZoNkVQMWFBTmtUN0paSHJJUkplTlhiNGlkaDVzNUkwczZr?=
 =?utf-8?B?WnRTRi9leVNmMS83UVBJUDlVNmViNDNvZFZFZFhIMkN0eXROalpMaTMrY1E2?=
 =?utf-8?B?K3FuUkc2dVVZRjNMUkdNUjM2a3g2bXp0YkgvanZhT3NuSU96Q05tZkFrc3ky?=
 =?utf-8?B?bjl1cnd4WW5EOXFJY3k5UGNRVjhtL3EyVGt2V3BpVlF2RnZ0SzJaSkdIS244?=
 =?utf-8?B?ZzJHM3NtVmhEN29HdTFjeTFRVktBVG9zb1k0enVWYmI5VDBLeDBWUVh6dGJo?=
 =?utf-8?Q?8lvemblzXgLCjD3egiY4FUC9l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca8440a-60a9-4715-287c-08dcb0991397
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 13:11:08.5801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEvgdmmYtnDWSy0/5agWqvDcjMNC+bWM/F5ZRsIUoRSMn2iL45G6NsJk8n55C4Fx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9077
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

Am 30.07.24 um 13:36 schrieb Huan Yang:
>>>> Either drop the whole approach or change udmabuf to do what you 
>>>> want to do.
>>> OK, if so, do I need to send a patch to make dma-buf support sendfile?
>>
>> Well the udmabuf approach doesn't need to use sendfile, so no.
>
> Get it, I'll not send again.
>
> About udmabuf, I test find it can't support larget find read due to 
> page array alloc.
>
> I already upload this patch, but do not recive answer.
>
> https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
>
> Is there anything wrong with my understanding of it?

No, that patch was totally fine. Not getting a response is usually 
something good.

In other words when maintainer see something which won't work at all 
they immediately react, but when nobody complains it usually means you 
are on the right track.

As long as nobody has any good arguments against it I'm happy to take 
that one upstream through drm-misc-next immediately since it's clearly a 
stand a lone improvement on it's own.

Regards,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>> Apart from that I don't see a doable way which can be accepted into 
>>>> the kernel.
>>> Thanks for your suggestion.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>> Patch 1 implement it.
>>>>>>>
>>>>>>> Patch 2-5 provides an approach for performance improvement.
>>>>>>>
>>>>>>> The DMA_HEAP_ALLOC_AND_READ_FILE heap flag patch enables us to
>>>>>>> synchronously read files using direct I/O.
>>>>>>>
>>>>>>> This approach helps to save CPU copying and avoid a certain 
>>>>>>> degree of
>>>>>>> memory thrashing (page cache generation and reclamation)
>>>>>>>
>>>>>>> When dealing with large file sizes, the benefits of this 
>>>>>>> approach become
>>>>>>> particularly significant.
>>>>>>>
>>>>>>> However, there are currently some methods that can improve 
>>>>>>> performance,
>>>>>>> not just save system resources:
>>>>>>>
>>>>>>> Due to the large file size, for example, a AI 7B model of around 
>>>>>>> 3.4GB, the
>>>>>>> time taken to allocate DMA-BUF memory will be relatively long. 
>>>>>>> Waiting
>>>>>>> for the allocation to complete before reading the file will add 
>>>>>>> to the
>>>>>>> overall time consumption. Therefore, the total time for DMA-BUF
>>>>>>> allocation and file read can be calculated using the formula
>>>>>>>     T(total) = T(alloc) + T(I/O)
>>>>>>>
>>>>>>> However, if we change our approach, we don't necessarily need to 
>>>>>>> wait
>>>>>>> for the DMA-BUF allocation to complete before initiating I/O. In 
>>>>>>> fact,
>>>>>>> during the allocation process, we already hold a portion of the 
>>>>>>> page,
>>>>>>> which means that waiting for subsequent page allocations to 
>>>>>>> complete
>>>>>>> before carrying out file reads is actually unfair to the pages 
>>>>>>> that have
>>>>>>> already been allocated.
>>>>>>>
>>>>>>> The allocation of pages is sequential, and the reading of the 
>>>>>>> file is
>>>>>>> also sequential, with the content and size corresponding to the 
>>>>>>> file.
>>>>>>> This means that the memory location for each page, which holds the
>>>>>>> content of a specific position in the file, can be determined at 
>>>>>>> the
>>>>>>> time of allocation.
>>>>>>>
>>>>>>> However, to fully leverage I/O performance, it is best to wait and
>>>>>>> gather a certain number of pages before initiating batch 
>>>>>>> processing.
>>>>>>>
>>>>>>> The default gather size is 128MB. So, ever gathered can see as a 
>>>>>>> file read
>>>>>>> work, it maps the gather page to the vmalloc area to obtain a 
>>>>>>> continuous
>>>>>>> virtual address, which is used as a buffer to store the contents 
>>>>>>> of the
>>>>>>> corresponding file. So, if using direct I/O to read a file, the 
>>>>>>> file
>>>>>>> content will be written directly to the corresponding dma-buf 
>>>>>>> buffer memory
>>>>>>> without any additional copying.(compare to pipe buffer.)
>>>>>>>
>>>>>>> Consider other ways to read into dma-buf. If we assume reading 
>>>>>>> after mmap
>>>>>>> dma-buf, we need to map the pages of the dma-buf to the user 
>>>>>>> virtual
>>>>>>> address space. Also, udmabuf memfd need do this operations too.
>>>>>>> Even if we support sendfile, the file copy also need buffer, you 
>>>>>>> must
>>>>>>> setup it.
>>>>>>> So, mapping pages to the vmalloc area does not incur any additional
>>>>>>> performance overhead compared to other methods.[6]
>>>>>>>
>>>>>>> Certainly, the administrator can also modify the gather size 
>>>>>>> through patch5.
>>>>>>>
>>>>>>> The formula for the time taken for system_heap buffer allocation 
>>>>>>> and
>>>>>>> file reading through async_read is as follows:
>>>>>>>
>>>>>>>    T(total) = T(first gather page) + Max(T(remain alloc), T(I/O))
>>>>>>>
>>>>>>> Compared to the synchronous read:
>>>>>>>    T(total) = T(alloc) + T(I/O)
>>>>>>>
>>>>>>> If the allocation time or I/O time is long, the time difference 
>>>>>>> will be
>>>>>>> covered by the maximum value between the allocation and I/O. The 
>>>>>>> other
>>>>>>> party will be concealed.
>>>>>>>
>>>>>>> Therefore, the larger the size of the file that needs to be 
>>>>>>> read, the
>>>>>>> greater the corresponding benefits will be.
>>>>>>>
>>>>>>> How to use
>>>>>>> ===
>>>>>>> Consider the current pathway for loading model files into DMA-BUF:
>>>>>>>    1. open dma-heap, get heap fd
>>>>>>>    2. open file, get file_fd(can't use O_DIRECT)
>>>>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>>>>    4. mmap dma-buf fd, get vaddr
>>>>>>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>>>>>    6. share, attach, whatever you want
>>>>>>>
>>>>>>> Use DMA_HEAP_ALLOC_AND_READ_FILE JUST a little change:
>>>>>>>    1. open dma-heap, get heap fd
>>>>>>>    2. open file, get file_fd(buffer/direct)
>>>>>>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap 
>>>>>>> flag, set file_fd
>>>>>>>       instead of len. get dma-buf fd(contains file content)
>>>>>>>    4. share, attach, whatever you want
>>>>>>>
>>>>>>> So, test it is easy.
>>>>>>>
>>>>>>> How to test
>>>>>>> ===
>>>>>>> The performance comparison will be conducted for the following 
>>>>>>> scenarios:
>>>>>>>    1. normal
>>>>>>>    2. udmabuf with [3] patch
>>>>>>>    3. sendfile
>>>>>>>    4. only patch 1
>>>>>>>    5. patch1 - patch4.
>>>>>>>
>>>>>>> normal:
>>>>>>>    1. open dma-heap, get heap fd
>>>>>>>    2. open file, get file_fd(can't use O_DIRECT)
>>>>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>>>>    4. mmap dma-buf fd, get vaddr
>>>>>>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>>>>>    6. share, attach, whatever you want
>>>>>>>
>>>>>>> UDMA-BUF step:
>>>>>>>    1. memfd_create
>>>>>>>    2. open file(buffer/direct)
>>>>>>>    3. udmabuf create
>>>>>>>    4. mmap memfd
>>>>>>>    5. read file into memfd vaddr
>>>>>>>
>>>>>>> Sendfile step(need suit splice_write/write_iter, just use to 
>>>>>>> compare):
>>>>>>>    1. open dma-heap, get heap fd
>>>>>>>    2. open file, get file_fd(buffer/direct)
>>>>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>>>>    4. sendfile file_fd to dma-buf fd
>>>>>>>    6. share, attach, whatever you want
>>>>>>>
>>>>>>> patch1/patch1-4:
>>>>>>>    1. open dma-heap, get heap fd
>>>>>>>    2. open file, get file_fd(buffer/direct)
>>>>>>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap 
>>>>>>> flag, set file_fd
>>>>>>>       instead of len. get dma-buf fd(contains file content)
>>>>>>>    4. share, attach, whatever you want
>>>>>>>
>>>>>>> You can create a file to test it. Compare the performance gap 
>>>>>>> between the two.
>>>>>>> It is best to compare the differences in file size from KB to MB 
>>>>>>> to GB.
>>>>>>>
>>>>>>> The following test data will compare the performance differences 
>>>>>>> between 512KB,
>>>>>>> 8MB, 1GB, and 3GB under various scenarios.
>>>>>>>
>>>>>>> Performance Test
>>>>>>> ===
>>>>>>>    12G RAM phone
>>>>>>>    UFS4.0(the maximum speed is 4GB/s. ),
>>>>>>>    f2fs
>>>>>>>    kernel 6.1 with patch[7] (or else, can't support kvec direct 
>>>>>>> I/O read.)
>>>>>>>    no memory pressure.
>>>>>>>    drop_cache is used for each test.
>>>>>>>
>>>>>>> The average of 5 test results:
>>>>>>> | scheme-size         | 512KB(ns)  | 8MB(ns)    | 1GB(ns) | 
>>>>>>> 3GB(ns)       |
>>>>>>> | ------------------- | ---------- | ---------- | ------------- 
>>>>>>> | ------------- |
>>>>>>> | normal              | 2,790,861  | 14,535,784 | 1,520,790,492 
>>>>>>> | 3,332,438,754 |
>>>>>>> | udmabuf buffer I/O  | 1,704,046  | 11,313,476 | 821,348,000 | 
>>>>>>> 2,108,419,923 |
>>>>>>> | sendfile buffer I/O | 3,261,261  | 12,112,292 | 1,565,939,938 
>>>>>>> | 3,062,052,984 |
>>>>>>> | patch1-4 buffer I/O | 2,064,538  | 10,771,474 | 986,338,800 | 
>>>>>>> 2,187,570,861 |
>>>>>>> | sendfile direct I/O | 12,844,231 | 37,883,938 | 5,110,299,184 
>>>>>>> | 9,777,661,077 |
>>>>>>> | patch1 direct I/O   | 813,215    | 6,962,092  | 2,364,211,877 
>>>>>>> | 5,648,897,554 |
>>>>>>> | udmabuf direct I/O  | 1,289,554  | 8,968,138  | 921,480,784 | 
>>>>>>> 2,158,305,738 |
>>>>>>> | patch1-4 direct I/O | 1,957,661  | 6,581,999  | 520,003,538 | 
>>>>>>> 1,400,006,107 |
>>>>>
>>>>> With this test, sendfile can't give a good help base on pipe buffer.
>>>>>
>>>>> udmabuf is good, but I think our oem driver can't suit it. (And, 
>>>>> AOSP do not open this feature)
>>>>>
>>>>>
>>>>> Anyway, I am sending this patchset in the hope of further discussion.
>>>>>
>>>>> Thanks.
>>>>>
>>>>>>>
>>>>>>> So, based on the test results:
>>>>>>>
>>>>>>> When the file is large, the patchset has the highest performance.
>>>>>>> Compared to normal, patchset is a 50% improvement;
>>>>>>> Compared to normal, patch1 only showed a degradation of 41%.
>>>>>>> patch1 typical performance breakdown is as follows:
>>>>>>>    1. alloc cost 188,802,693 ns
>>>>>>>    2. vmap cost 42,491,385 ns
>>>>>>>    3. file read cost 4,180,876,702 ns
>>>>>>> Therefore, directly performing a single direct I/O read on a 
>>>>>>> large file
>>>>>>> may not be the most optimal way for performance.
>>>>>>>
>>>>>>> The performance of direct I/O implemented by the sendfile method 
>>>>>>> is the worst.
>>>>>>>
>>>>>>> When file size is small, The difference in performance is not
>>>>>>> significant. This is consistent with expectations.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Suggested use cases
>>>>>>> ===
>>>>>>>    1. When there is a need to read large files and system 
>>>>>>> resources are scarce,
>>>>>>>       especially when the size of memory is limited.(GB level) 
>>>>>>> In this
>>>>>>>       scenario, using direct I/O for file reading can even bring 
>>>>>>> performance
>>>>>>>       improvements.(may need patch2-3)
>>>>>>>    2. For embedded devices with limited RAM, using direct I/O 
>>>>>>> can save system
>>>>>>>       resources and avoid unnecessary data copying. Therefore, 
>>>>>>> even if the
>>>>>>>       performance is lower when read small file, it can still be 
>>>>>>> used
>>>>>>>       effectively.
>>>>>>>    3. If there is sufficient memory, pinning the page cache of 
>>>>>>> the model files
>>>>>>>       in memory and placing file in the EROFS file system for 
>>>>>>> read-only access
>>>>>>>       maybe better.(EROFS do not support direct I/O)
>>>>>>>
>>>>>>>
>>>>>>> Changlog
>>>>>>> ===
>>>>>>>   v1 [8]
>>>>>>>   v1->v2:
>>>>>>>     Uses the heap flag method for alloc and read instead of 
>>>>>>> adding a new
>>>>>>>     DMA-buf ioctl command. [9]
>>>>>>>     Split the patchset to facilitate review and test.
>>>>>>>       patch 1 implement alloc and read, offer heap flag into it.
>>>>>>>       patch 2-4 offer async read
>>>>>>>       patch 5 can change gather limit.
>>>>>>>
>>>>>>> Reference
>>>>>>> ===
>>>>>>> [1] 
>>>>>>> https://lore.kernel.org/all/0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.com/
>>>>>>> [2] 
>>>>>>> https://lore.kernel.org/all/ZpTnzkdolpEwFbtu@phenom.ffwll.local/
>>>>>>> [3] 
>>>>>>> https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
>>>>>>> [4] https://lore.kernel.org/all/Zpf5R7fRZZmEwVuR@infradead.org/
>>>>>>> [5] https://lore.kernel.org/all/ZpiHKY2pGiBuEq4z@infradead.org/
>>>>>>> [6] 
>>>>>>> https://lore.kernel.org/all/9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com/
>>>>>>> [7] 
>>>>>>> https://patchew.org/linux/20230209102954.528942-1-dhowells@redhat.com/20230209102954.528942-7-dhowells@redhat.com/
>>>>>>> [8] 
>>>>>>> https://lore.kernel.org/all/20240711074221.459589-1-link@vivo.com/
>>>>>>> [9] 
>>>>>>> https://lore.kernel.org/all/5ccbe705-883c-4651-9e66-6b452c414c74@amd.com/
>>>>>>>
>>>>>>> Huan Yang (5):
>>>>>>>    dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>>>>>>>    dma-buf: heaps: Introduce async alloc read ops
>>>>>>>    dma-buf: heaps: support alloc async read file
>>>>>>>    dma-buf: heaps: system_heap alloc support async read
>>>>>>>    dma-buf: heaps: configurable async read gather limit
>>>>>>>
>>>>>>>   drivers/dma-buf/dma-heap.c          | 552 
>>>>>>> +++++++++++++++++++++++++++-
>>>>>>>   drivers/dma-buf/heaps/system_heap.c |  70 +++-
>>>>>>>   include/linux/dma-heap.h            |  53 ++-
>>>>>>>   include/uapi/linux/dma-heap.h       |  11 +-
>>>>>>>   4 files changed, 673 insertions(+), 13 deletions(-)
>>>>>>>
>>>>>>>
>>>>>>> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
>>>>>>
>>>>
>>

