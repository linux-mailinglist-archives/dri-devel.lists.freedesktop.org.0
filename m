Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D7B8C5909
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 17:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AB610E57B;
	Tue, 14 May 2024 15:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nfSaHqM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA89510E401;
 Tue, 14 May 2024 15:47:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bl5ruFLYthbOn37QYle+curdVqEIsUksGcfmoSKMn9pKp8WrGyIj5WgRZW5yFso2oyGZnF7T8IRRS+uPrK/GpozJjtwz7lggjHRe59ApRajf/UZsMjJrWGKme3MNdXKMsaivDCD3fWg39s3xPt6n0KXNqmMFWPRrLtHTOiLT9E38HRlEYNQGKkTJjmCNLmj6xwi9hjQXIWoCg1mX8CIo1Wq1PoL8Vr5JbSUsK1cUEIoRKcHuMqicTYf4NkQF94+0UmVW6j2FDDQlbV60iYROOIl65vnMyw5hobf0Nz0qyVLe/p6jp7/b2eoyVYr1aAQEJ5ZnbpTX1l2vGxxyxAncGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kr+kTrbXwqmVQRsKe/o2KADwtZho0NSYl3zKss3I5hw=;
 b=N4oa47uJBgvW0GZxI3WiPHAiBZF6fsccOd9X8ybqITEUb6v3vRgEALrkxuTx8faRtxfUnBVceJTiWQRTJt5+qhe8yhR5xBl9SLcazcncMdej317MeK7BdIN9YSotRt3Gakk6QX+5AoAvlvem86XKJ2tf0aRbxvccOQgtoD0Fz0TR6Y3J6tGabUNWwZrtwPlqvE8egCTlow0fQ5f312zB2aRclKTkA23KnZUEkBUCinidnr6CptJSxdViG4Wp6786bwzWBHSiobVQf2nII4umeWfjnAwZlNWx/tRnJ9Gv4gbTdeEo6uD4FevVB8GGYs+UKMJTXtsWEzY4u35fWXEYrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kr+kTrbXwqmVQRsKe/o2KADwtZho0NSYl3zKss3I5hw=;
 b=nfSaHqM+JneQytvWNWoax4QPUQL+UcG/Mh1TAS+Y35iiXS1BEaKtmCVaasQTaco0iQQCmnaVvOSnCVO2okky3WCrHdLJ0l1vVwK/1FAGx7gCmcoaWkx+8kEPcRqmGV2Tnm5J/zbMnFgwmv5pL58jldHt1Am49ce7BaVMVsdmogA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6298.namprd12.prod.outlook.com (2603:10b6:930:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 15:47:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.025; Tue, 14 May 2024
 15:47:38 +0000
Message-ID: <fc645b96-08cf-44bb-9fed-855ce537b8e7@amd.com>
Date: Tue, 14 May 2024 17:47:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/5] Discussion around eviction improvements
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
References: <20240508180946.96863-1-tursulin@igalia.com>
 <e39bcdd1-90e7-42f3-94a9-ea1af6b0d278@ursulin.net>
 <6b4bbb02-3f12-4a6a-8e61-c776da636d1d@ursulin.net>
 <d48740a3-ea97-447f-9103-c4bb30194971@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d48740a3-ea97-447f-9103-c4bb30194971@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 06eef629-73ac-484b-d4b1-08dc742d2e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVFhZC9DLzZmZllRN3BIUzNycWxndm5YcU5JRGh3MEM0OFBma3dRNGFWQW44?=
 =?utf-8?B?bENRenBYc2t0Sk9tTXNXUDkyVjJTOGJKc3ZrQVlta0c5NmRuYkZEOHRmNXZU?=
 =?utf-8?B?WUE1dEpheDdySks0UndVbVJKaFlucnk5TjFyRjJscVc4RUZycDdTRUhkTFhF?=
 =?utf-8?B?SG81RWpUc1duaGRxQ2d6cUpKUjNLZlY0MXZSeGdabFhGdmM4L29PSWdjeC96?=
 =?utf-8?B?akc2T0Rvd01zc2ZIOGhtRTZoRW5oYzluYXZrK1UzRGlpM0x2ZGlzMHBBZ2xG?=
 =?utf-8?B?UTNydDhJL0h5N1JsNS9paUdobFloNHVFNTdYWTdBeGlzVVdCdk5TODRhU2c0?=
 =?utf-8?B?aTUyQzJpQjRObkhKS05MZGhoa0J5aTd0SHJHY2NibVFYSk1lbjczcUpWVjVi?=
 =?utf-8?B?ekpncmYwdWJFdDh2aTJpUGRQaU9ySFFzVmM4OEdMeVZEUG4yZElySHJKeEt4?=
 =?utf-8?B?d0ZPMytXUEYvK0ZYc3A5azVFUFE4Rng5RWF2bHZVODlrWDFWNVRwYnFkbjBM?=
 =?utf-8?B?QXlBbUZRMFZReGpwTzltZkNYdmF3V25Pa0Z3YkMzZmVlNXU3THA3SDNTZXlT?=
 =?utf-8?B?RW5rM2JTUk11NkdvQ05vYkFBOUhtcFAzNERlTXpsbWFhSy9Gdnh4alEyamcv?=
 =?utf-8?B?TzBqZlFjNks0aFo3WGN6aktaT0F2Q0laVWw2U1hnenNBY0R0L2dzRmFEQmpa?=
 =?utf-8?B?NXFxL0RQakRaYVFqV3A1djcwSm9RcWdmemFidVJJOHZmd0pwYXdrSHIwSzN5?=
 =?utf-8?B?dE9lZnRFa29FWElJY2dTckd2QW1HUDI0a0RCbmlSVWErb2dOWFZLL0Vuc1pT?=
 =?utf-8?B?ME45N0J3RGlCM2I3Q1dIWGhvMkgxc0htYm14U3g0R1R3dlpEUmVvWXZUekxx?=
 =?utf-8?B?cTNaZk1tQndST3ZtQS81b2FjRlhGWWY0azhONloxSC9kOFl6OGl2WHdTODN5?=
 =?utf-8?B?WjdXWmZaQkE5YmFjaVRjL0NHY0Zvc2MxN3YxK0UxSmY0SWRqUjBUdkhPd1BQ?=
 =?utf-8?B?RXU3ck5QNFA2aXZQT0JaTU5JbUNOaldPajE2am5ZNkprZ3djTUlqUitSSFU4?=
 =?utf-8?B?SmZuNVdFcXFFd0pQcFgycldzTG5oZmpoUHp3eXZQOTVMRjlxd1QzNWRaaGVs?=
 =?utf-8?B?VzlpRktiTzRxaThPTEQ1MTlHcVVnY0tNUHdzSUdxT1RvTFRJZWJweGR4MlZG?=
 =?utf-8?B?ZTUwbnZ5RGdWWnBlN0prZThqUTVVeTN2MllFNllaSG84U2ZKU1QrMkNQNE9V?=
 =?utf-8?B?MzBaNXFVdEhOR3B3bm5QMk53TUNDRldPVmsxVkJabkFGbE1rVm9jQ3pvOUZC?=
 =?utf-8?B?K0o5dHlnWlFWeWI2NUltenJCdUY1V2hGZHpLcWFPRGtranowaGlSWWNPajl1?=
 =?utf-8?B?VWxFRVRUMVhWcC9YeEJvNHpoNk1odGZ0bjVic2tMVTU0V1F1U2NGVitCN1Vy?=
 =?utf-8?B?REk4c1RNMEtaNU5EK2IvaGtVQXdSZks5Z2F6WThpcnF6di9JM0d6Ym5LZ0kw?=
 =?utf-8?B?NXJXWkpTSjh3U3BxNG9qcGVVYThzSkt5SEEwbFh0ZlJTM2N4K1ZFMmN2ekVk?=
 =?utf-8?B?OEcyZnJwMS91ZFVOMGh1MjRIWDRuZUFPK3V2MjFRZHJLdHhRUHRWeEZQanI3?=
 =?utf-8?B?cEExa3A4alIzc3hTNmhEaTNQbUwreVdlYlBTWUhld2JSYXZYVVZMYVVsanFv?=
 =?utf-8?B?MWE4N1lWQ1JpWjlDUFVNOUt0dkpVOGxMWW1ueEYxaE9FQVdSUWw3aUFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjNDSFBKdXVmMGpBM2VVWG0zUys4a1JERm9ia0RiY1BpODN2QzY2SS93NFhS?=
 =?utf-8?B?SVVWaEovZ3hiTzMxV1A5NHZlbHU0UHdHWDc1V2xaN0NyalVFRnRjN25hYVc1?=
 =?utf-8?B?UDNLbkozTGY3TklJM1lnTDQzb3dyZW1hK0tsbmRIS2d3bUJPK1JqUERwWEFm?=
 =?utf-8?B?bmpETGNqWGdZWnA2eE8xMHJBRlVXeUJCb25FSlZqYnpBZEJXUHVHWHZpWlk3?=
 =?utf-8?B?VWxMRjJiVXp1ZHJ3a2xOWDhYSDNFL2k4b1RRMmVERG1nN2ZDbEFaQVRoLzQ2?=
 =?utf-8?B?cUlZR2F0RWo3djI3YU9iK2VadnovS015azF6RVhGS0lqQ2dkdWlacElrWldP?=
 =?utf-8?B?c1NiM3JoaFJNSkYrZEl6aGc4ekFWdWRia1pJWDNlcFRydVZjN0MxeWgweGVF?=
 =?utf-8?B?RnZHcVFZU1RGQVRVL0kxK3lBMWUwaXFzUysxL2g4VmhxRDdhZXlJdnhlL3ZC?=
 =?utf-8?B?SG1LTEUvSXcwekxld0N2UDNJNW1BVW51Rkc3U3g5UDdwZU4wRUlvTkJXNERR?=
 =?utf-8?B?TXdEeTErajdEZHg3V2hGZ3plZmhZYmViajRMeHJSM1dWbjdCVHNZTHdrQnFr?=
 =?utf-8?B?NWNWMlVOMnFSeDZaUmlnbndOKzFuZ0N1Y0FaSFQrQnZ5d1J0bXJRUzBMY0Zj?=
 =?utf-8?B?SUVVeGVScENwVGU1QkNkY3FRVkdWS2NvLzFESkJSbmlUaEk2b1RrNEJEKzdj?=
 =?utf-8?B?aVRMVDJqR0Q1WjF1VHR6WkYxdlFsMTN0NThtOGNvTlc1dlVIRC9aUFUwaUhj?=
 =?utf-8?B?QTFGU2pRbjdNUWtLQStEZVRkblU2ZFJGWURMRVRETGs4b3U4UEUvVDhsR0RS?=
 =?utf-8?B?WTUyNDZYTit6U281a3p3MFFoWFBTdjVQRTdSNngzSUEvRVFySXRXRTY5eVZw?=
 =?utf-8?B?N2thSmJaNzM2SjNOOS90SWNUN3RoUjJRRlU4Y0ZaeFRScVFFbUFhc2sremVl?=
 =?utf-8?B?bzk5NURBcGgvMDBOb0E1UGxnam12K0R6TnJ6bjQ4ajkxekFWaHd5eDNPcjY4?=
 =?utf-8?B?Ry82ODJSVlV5ZGNZL3BJNis3TThqTjRxZ09JWk0wbm5vaC8yZmQ4QXAzRk1y?=
 =?utf-8?B?VFovN281RUJTMWdvNkwxTHpWejQzN2NlMDJkWUd4eXdOODlENmRORUtpZnpM?=
 =?utf-8?B?Q3hxdWNiMlRDQkFzaGJxN1djTkhhdHNhLzZiOSs4aW9RRDcxTG9jeFliZk1F?=
 =?utf-8?B?UVAvcXdWVEJ2Z3BOR0NwRC9kaFdoUlN4eUlEdmxLSVZ5Y0RRWng5dmdWZ25Y?=
 =?utf-8?B?YW9idDJsbE9kMlBRcHR1UXRTYmV1SUZCdnJkU1NoTUlsZ0RQejZnODZmVTN3?=
 =?utf-8?B?OVVzQzlMTm84ZlB2RGFyZmxxVkVESk5BM2ZndEI0dCsxd0ZFTHlwbWFlQitj?=
 =?utf-8?B?KzBvOThCV2U5dDBQVDI1QTZsU1RQSTNsV090bGVIODFVZkd6bHF4RXduWW5t?=
 =?utf-8?B?STM4ZGdsajhKbmRDMzhTaksrbXhLSHBKL3NUd2NvbnBlalIxbXl2VTVIcTZi?=
 =?utf-8?B?Vk1xTERsVUlaV1I3MVRCSVZFR0pVdys2V3dhMmNHTXlhelR3T2ZGWGM2M1pm?=
 =?utf-8?B?d3NZOWdEcTk1cWJyWDQ1WVhtZWlmUiswSnlaa0g0MXRlMVNuS3J2MFBtamQv?=
 =?utf-8?B?RXdWWW9XcTNYZTZkMC9JWTBDb3R6MGhNbW9UaXloQlB4dWMzSnUrMFgxUkw1?=
 =?utf-8?B?bi9sQXI3eE5Sb0VzMG9mUjVMemsyOXR1RWpRTkdCQytRcWw0Skltb01nWmNt?=
 =?utf-8?B?L1ZWY3dmd28zczJCK1BWYXN3U2VYV0UzSDUxemczbUtBb1BjdktkMzJEb3dj?=
 =?utf-8?B?WlFCM3hJVC9oMFdud0toaUlsNmtReTY2b1dBOTVIZ3BaTTZiTkpWU0NmSEpQ?=
 =?utf-8?B?SWwrMU5wdTdFVDBaVkF1T05SM3JqK0l4SzZrL2g4SXBBdXlvTkxvRzlGVnhT?=
 =?utf-8?B?ZGlURWdDcnc4OVBIdlFYWllOdjY5RVhpbFIyS1d2VnJveGVUdE5oWThQM01q?=
 =?utf-8?B?dW12WXpOR2hvUDJ5SHdRQUpQTVAzQmo0alVUN2tqYWhIQkwzckRHS24ydHh3?=
 =?utf-8?B?dXNlcDFLVjQ2bWI1L1FiRklPSXhQNS94b3FzdkZIWmNBUFVWbW83dEpLVFZT?=
 =?utf-8?Q?NnnWouIOoiCUBUE5E6pV9bpF8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06eef629-73ac-484b-d4b1-08dc742d2e43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 15:47:38.2033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7WLw3NX4RTX5t5lpctj0Cj6sCELxtcWhzyn8mRqfZjXXC6OuOLLDXgGlnMefxR2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6298
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

Am 14.05.24 um 17:14 schrieb Tvrtko Ursulin:
>
> On 13/05/2024 14:49, Tvrtko Ursulin wrote:
>>
>> On 09/05/2024 13:40, Tvrtko Ursulin wrote:
>>>
>>> On 08/05/2024 19:09, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> Last few days I was looking at the situation with VRAM over 
>>>> subscription, what
>>>> happens versus what perhaps should happen. Browsing through the 
>>>> driver and
>>>> running some simple experiments.
>>>>
>>>> I ended up with this patch series which, as a disclaimer, may be 
>>>> completely
>>>> wrong but as I found some suspicious things, to me at least, I 
>>>> thought it was a
>>>> good point to stop and request some comments.
>>>>
>>>> To perhaps summarise what are the main issues I think I found:
>>>>
>>>>   * Migration rate limiting does not bother knowing if actual 
>>>> migration happened
>>>>     and so can over-account and unfairly penalise.
>>>>
>>>>   * Migration rate limiting does not even work, at least not for 
>>>> the common case
>>>>     where userspace configures VRAM+GTT. It thinks it can stop 
>>>> migration attempts
>>>>     by playing with bo->allowed_domains vs bo->preferred domains 
>>>> but, both from
>>>>     the code, and from empirical experiments, I see that not 
>>>> working at all. Both
>>>>     masks are identical so fiddling with them achieves nothing.
>>>>
>>>>   * Idea of the fallback placement only works when VRAM has free 
>>>> space. As soon
>>>>     as it does not, ttm_resource_compatible is happy to leave the 
>>>> buffers in the
>>>>     secondary placement forever.
>>>>
>>>>   * Driver thinks it will be re-validating evicted buffers on the 
>>>> next submission
>>>>     but it does not for the very common case of VRAM+GTT because it 
>>>> only checks
>>>>     if current placement is *none* of the preferred placements.
>>>>
>>>> All those problems are addressed in individual patches.
>>>>
>>>> End result of this series appears to be driver which will try 
>>>> harder to move
>>>> buffers back into VRAM, but will be (more) correctly throttled in 
>>>> doing so by
>>>> the existing rate limiting logic.
>>>>
>>>> I have run a quick benchmark of Cyberpunk 2077 and cannot say that 
>>>> I saw a
>>>> change but that could be a good thing too. At least I did not break 
>>>> anything,
>>>> perhaps.. On one occassion I did see the rate limiting logic get 
>>>> confused while
>>>> for a period of few minutes it went to a mode where it was 
>>>> constantly giving a
>>>> high migration budget. But that recovered itself when I switched 
>>>> clients and did
>>>> not come back so I don't know. If there is something wrong there I 
>>>> don't think
>>>> it would be caused by any patches in this series.
>>>
>>> Since yesterday I also briefly tested with Far Cry New Dawn. One run 
>>> each so possibly doesn't mean anything apart that there isn't a 
>>> regression aka migration throttling is keeping things at bay even 
>>> with increased requests to migrate things back to VRAM:
>>>
>>>               before         after
>>> min/avg/max fps        36/44/54        37/45/55
>>>
>>> Cyberpunk 2077 from yesterday was similarly close:
>>>
>>>          26.96/29.59/30.40    29.70/30.00/30.32
>>>
>>> I guess the real story is proper DGPU where misplaced buffers have a 
>>> real cost.
>>
>> I found one game which regresses spectacularly badly with this series 
>> - Assasin's Creed Valhalla. The built-in benchmark at least. The game 
>> appears to have a working set much larger than the other games I 
>> tested, around 5GiB total during the benchmark. And for some reason 
>> migration throttling totally fails to put it in check. I will be 
>> investigating this shortly.
>
> I think that the conclusion is everything I attempted to add relating 
> to TTM_PL_PREFERRED does not really work as I initially thought it 
> did. Therefore please imagine this series as only containing patches 
> 1, 2 and 5.

Noted (and I had just started to wrap my head around that idea).

>
> (And FWIW it was quite annoying to get to the bottom of since for some 
> reason the system exibits some sort of a latching behaviour, where on 
> some boots and/or some minutes of runtime things were fine, and then 
> it would latch onto a mode where the TTM_PL_PREFERRED induced breakage 
> would show. And sometimes this breakage would appear straight away. Odd.)

Welcome to my world. You improve one use case and four other get a 
penalty. Even when you know the code and potential use cases inside out 
it's really hard to predict how some applications and the core memory 
management behave sometimes.

>
> I still need to test though if the subset of patches manage to achieve 
> some positive improvement on their own. It is possible, as patch 5 
> marks more buffers for re-validation so once overcommit subsides they 
> would get promoted to preferred placement straight away. And 1&2 are 
> notionally fixes for migration throttling so at least in broad sense 
> should be still valid as discussion points.

Yeah, especially 5 kind of makes sense but could potentially lead to 
higher overhead. Need to see how we can better handle that.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>>> Series is probably rough but should be good enough for dicsussion. 
>>>> I am curious
>>>> to hear if I identified at least something correctly as a real 
>>>> problem.
>>>>
>>>> It would also be good to hear what are the suggested games to check 
>>>> and see
>>>> whether there is any improvement.
>>>>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>>>>
>>>> Tvrtko Ursulin (5):
>>>>    drm/amdgpu: Fix migration rate limiting accounting
>>>>    drm/amdgpu: Actually respect buffer migration budget
>>>>    drm/ttm: Add preferred placement flag
>>>>    drm/amdgpu: Use preferred placement for VRAM+GTT
>>>>    drm/amdgpu: Re-validate evicted buffers
>>>>
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     | 38 
>>>> +++++++++++++++++-----
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  8 +++--
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     | 21 ++++++++++--
>>>>   drivers/gpu/drm/ttm/ttm_resource.c         | 13 +++++---
>>>>   include/drm/ttm/ttm_placement.h            |  3 ++
>>>>   5 files changed, 65 insertions(+), 18 deletions(-)
>>>>

