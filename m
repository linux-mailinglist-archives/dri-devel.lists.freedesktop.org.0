Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C67961FD4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 08:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A35510E4AA;
	Wed, 28 Aug 2024 06:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rurUnijc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E7210E4AA;
 Wed, 28 Aug 2024 06:32:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlCHdrCxochuLVpaqFLF5k9+0pmfYcL6if3nOFHZcHULehjlURTwxehOR6mMj3O2e0ojV8mhKzm48Ff6EZcPgrErC4AucoPgQCT/7lT9yfzePO3wqFzvOs6A9gCbOxGuC5YqrcWLHLiZlYfqwT7jcH3FbF1mAaqGp+ipmoUdpApK9/jW6V2mVAURVASXJsISoo13bwBxz9qfNt/RkzCWOMG5jP7IyKGoe41E3giDe8fQxgd1JW/rtjLu7g1QMFgb4PYlQ/niBtTN2gnZ/+6WVaZHiag8/g+d0cb2KR0v+nI6RKbs/p2OAkc8bB/FB2pyJByNgO0WBYUEwu63a0mRRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdIoSmrEycn3uy3lW69GDHc3jlVtp6PiVNhp/w8FvUY=;
 b=vUwZWWZRZ6vQilcgCNcMwh7eciJeloK1JLPOtMtMlNIdJ2um9zyeqOiaUPKaTfsXR6olpBPSDfua8PGD3hVuHTc/VJFTrUOPAJn4zEH95hW4zyBwc+08OTkYuC200LQ++Si44PWgs0pFnLwXK/CLa7V6uQnLJbzghdutVlkKtn95kxSUmVOuK2A5uYl6pr9R+PU6WGFnOZlzxrlGr77sn9Cxog05+VmZOqvE3pu3kt7aHbVwX2qPZGDNBezZIzoOlXpxzSqR10Q8m66gphfJUisN/8tmShYuWKPKoxJOtg08gAOodMUC2oCuaXJG4bR9ZoXJu5ECqiPdVO/FJ0YjdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdIoSmrEycn3uy3lW69GDHc3jlVtp6PiVNhp/w8FvUY=;
 b=rurUnijcNUI+UOr2nRscaIAhP/OUa1tWJyoWqHzImd9uumMUwTAeA8Dqu72h1DjFj9PqMeLnacAyuROIh6Ab8QyvjTFriHZ2oGmvFWvBJ+v++fnmhKpvUMpH9bYasCnYqPPc/kCqEmjqvzEQS95d7laoBP3aAy65hsvXaRcvf80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7362.namprd12.prod.outlook.com (2603:10b6:930:52::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 06:32:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 06:32:33 +0000
Message-ID: <1e909d5a-a689-47be-bbaa-0cf9189ff714@amd.com>
Date: Wed, 28 Aug 2024 08:32:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Revert "drm/ttm: Add a flag to allow drivers to skip
 clear-on-free"
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240821095035.29083-1-nirmoy.das@intel.com>
 <20240821095035.29083-2-nirmoy.das@intel.com>
 <447e4cbd75e14e80b7d29e0e3b1859239b9e6c9a.camel@linux.intel.com>
 <lkifmjwznygo346uj7qeiz26re3npuk2i7zwnqqsyas57oskug@ztlurybma6ea>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <lkifmjwznygo346uj7qeiz26re3npuk2i7zwnqqsyas57oskug@ztlurybma6ea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a59be0-71b0-48b5-9192-08dcc72b330f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG5DeW5jUHhLcGpLTzlzQW0vOUYwTnFTaUN3VDdyRmJmTnAvWndta3lMTG9Z?=
 =?utf-8?B?WVF5OVJwRHJDN0daVlN1ODRZRkhDQkp2QUN5dzAvTTh1STdFU0JHbklNSTZZ?=
 =?utf-8?B?dHA0SjhOVk4rcE1tVk9QZXdTMVp5R1d1NzlxaWx0Y1MwNnpBc0dNRktSNkdx?=
 =?utf-8?B?bTFXbjJzZDF1NlZXazRyMnVlL2JqeG9LWnhTd0Z4MWFzc01SM3ZxcGFYSGRi?=
 =?utf-8?B?clM4cGNCUE9LZ2UzODF1NE5BNGJxMFp1TWE1TWhpcEphZUxFUzFkZHQ3dEhJ?=
 =?utf-8?B?cmlWT0Q2cFlEV0h0azJWS2E5WVJ0NEVybm9hUFZpSGFmNHZOOHBOWUNVakIx?=
 =?utf-8?B?bnU2Z3BtbDM1VEMwb0xnbjNNSng0OTdneVZjSnZ5b0pPWDgvc0xKTzNsMnJH?=
 =?utf-8?B?VDRJYWEvL0pHMUEwdkVhL09KcG9zVmx4UjhmMGU5TWhHR0hlSkxqWmsya2dW?=
 =?utf-8?B?aVUzOUg2VW9qeFNSRlpoOW1hWWJFbG0wQXBBM09RTTF5U3NoODRzK0dGSnFq?=
 =?utf-8?B?Q0o3SGExRkw5K1N3ZzJTdU5nNzlEYVdmT2xGL2E2blVFMGZWM0EzNlZhOFZs?=
 =?utf-8?B?QXRrdlM4STJZTkJQTUFlNEpGOXAzNGVySGxHMVErK3VTSEgxVHdLSzdYRE0w?=
 =?utf-8?B?eGEvWk5mNkhEUHY5c1QzdU1RMm9aQmNrL3VWc0xoMGVYdjVvTEhMV1B4ZnQ4?=
 =?utf-8?B?ZmQxakZoQlc3VEVJa0V2ZHhQdU92eEtvVGd6VGI1MUhPc1BBcWJIMEFIa21h?=
 =?utf-8?B?a2NUUjZCNWxIbEVtYTRqbXlRTUNqZmV2cHhjUlNyWllVSlhsSE1Lc0tzY0tz?=
 =?utf-8?B?K2d1TEhPaXdkTE43eU5jZlBvWVlxTENrWEtKRmo1dUlmdmJCMjFJdmxUcHI5?=
 =?utf-8?B?VjB5eDhnZVZCMUZHT1dwZzdISUkrd1p1NnB5UVArVDdJSjNjQU50N3ljeVFn?=
 =?utf-8?B?MWJFUGJFejVGODNpZmN2SGs1cnUvUjdEOGpTRVNTSjZrcVQzUDhIMU1sME9r?=
 =?utf-8?B?eFUzSjdZSC9nM0dDMmZZcEx4dGhseDBUc214a2VBZG5MbGxvdFZOZkZMNW5L?=
 =?utf-8?B?NnJ3UkE3eWFLTEJNMzhjeVo4cmYraWpidXdTeHBzdTIzRWJmMGRBRlhYZzJ1?=
 =?utf-8?B?OHZheVZWWnp2VEhHRDVWdDA1RGE1N0dmcytsKzgxUGZYOTBQM004NGFGbnY5?=
 =?utf-8?B?dlJ3bThVc2pmYUpRNFI3REY5TzJ6bHB6ZmN0VUk0YzIreFNudXVadUtiSlNV?=
 =?utf-8?B?bENyNUFNWHovcUtzdGIyNFlTdC9UNStnenplL1NQMGwyWWdZbW1oL2krOVFn?=
 =?utf-8?B?NUpjcWxJSDdycDJNRksxcXhacTllcSszT2JycEZFYWlSR01NdEtsMi9nclFU?=
 =?utf-8?B?RGZhenlQWTUxZzNhbFdIU3hoS3dEcHcyYzNtZnRpZ2FEUWFTejlwcHZQdHF6?=
 =?utf-8?B?a1hHT3RJWmtlM1lMWjc1M0dSWjZ6OHNXZXJKODl3ZFZrN1RBMExPK0VBUHJQ?=
 =?utf-8?B?S1JaNnZ4b05mcFV4a0tUa3FEc0IwZFMzTkpDR04zR3Z4NDcrdnBsT2JncVBI?=
 =?utf-8?B?dHVBeGhvaVNsZ3VNUGF0RDdqckdZQmVKYmgrQjkxSW1Ic2I5ZDBoMFhzVXVo?=
 =?utf-8?B?Y1I4bG1hSHZyR0ozUzl3QVBZUkNFV3BoKzArQ1BhRHh6ZkxqYXZkdkNIdk5t?=
 =?utf-8?B?UFNiWXpsSldXSFFISWdqb1Q4T2VRMzdibmxXOHJ3ek5OM3htYjhjZlVtY1p2?=
 =?utf-8?Q?oY2p8g5kY3EliORlR8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUhWelg0OWNGZkkrWFZNeEt3ek1IZkl2RDRHQWFjdWQ0RXlSZEo5TTZpSmFL?=
 =?utf-8?B?V2I3YXhWbVdXUWdlaFJiMW9Zei9KS3Vxdy9EWWhJK0RYWXhvUGV4aStDMkU4?=
 =?utf-8?B?KzdyM01kL2FkV2FORGFqbTF0RENWbXhNWTF1ZzdSY1hLRk02QTVrR083MXB6?=
 =?utf-8?B?eTJGZ3pUS1A0cEZ5SHRNc1NpWG1Eek5JaEIxMUN0NE4vbkJpZDlWZm1WUE1h?=
 =?utf-8?B?MERQVVpOS2VtVWk0ZjVHWWVjQTdLaVhXbkFBd1V5MXovUHN0OWdFMUNSTUJj?=
 =?utf-8?B?S2k0T3dPcjA5ejFiQWtrT1JuUndEMWp4eHEzVUEvaHBrYk9LSlZtdHhXSVFq?=
 =?utf-8?B?b1pkaXFIR0FNeFN2TFFaaVM0VFhvbjBsVktaVUxOZUhqOWZHdDY2RFF1dHVp?=
 =?utf-8?B?ckdJOTN1ZFZhWWtKMERCNnUxSi9RS3k0WktJZjl2dU5MWTVJVmpxeEVuSHBU?=
 =?utf-8?B?eHdJNXU4cGp4SnJEZFdFR2t5RGNFOGh2TUlDSmhuWThpOWxIa3U1djRDK1dt?=
 =?utf-8?B?QzVNUW5ubEFSdXkyRm5rOFhvNUI2UnYwdkM1Z3hwa2FKQzh5R1Z5T29SZ0Rt?=
 =?utf-8?B?ZU92NTU1TGJiRGRuQlIrUURLdXVZeW14NGFwalFKNFlraWNpYVNLc0tJZU1N?=
 =?utf-8?B?ODBqdG5FN0tUNWQyS0pNV3ZkQWszd0sxU0tTZWV3ZnJ6U2s2emJzdk1kQUN5?=
 =?utf-8?B?NGZudDRCTWdnejZpc2RxYy8xSE9WUnJMdmZzbWNNSHplOEdncW9vRElyS3ZY?=
 =?utf-8?B?UDdFMEQ4SlRrY3p4K3JnejhPQ0dNdW9SWjFSWE9rZmNiWnpIODlQcnVlVjdP?=
 =?utf-8?B?WmNYbFJiajlWbVlxOWxIbjhaYkhMcW1UYW14TnhLa2lsbm5vbTJwZlZ6ek5h?=
 =?utf-8?B?NGkxQ0I5N2E3cjdyOTIwUEFyY1Z6M1AzTnZxaUxUK0ZrbUZ5bFVSKzJBeGlj?=
 =?utf-8?B?R2lXY2VMR2ZsekNxbkdlRGRlSFR0RmhFVHVVWnJxWWJLOENveE1KTUpqemlH?=
 =?utf-8?B?K0p3OTVvNlc5ZnREYVJoN2hwUVRJOXV5eWxqbkFYQXpiM1dLWm5LeUl3Zjd0?=
 =?utf-8?B?VmdSMGlZcy9ra0hzZXlpU3FkK0JNdkRaaHdneU5ZTXF1d0VERlgzYzlUcm0y?=
 =?utf-8?B?SkRQUGs0V2NnQUZlOCtSSEZXUnRMUm1VLzFmS0IyQjQ4VzIxK05YSWMyZEMw?=
 =?utf-8?B?WEREM29DWE9RRU5wZVlCM2tOVy83UWxGenNwMDJpKzV1cU04WEdYTzBOdjBC?=
 =?utf-8?B?a3Q1MDFDU3RLZVJLTWFlSXVvWUlYMXV0VksxTUNZWVRPeUdTbmh4R2todGRz?=
 =?utf-8?B?RVplaHhXeExQTDBWUktwZTBaZEpQaHlJT3Z6VDFURlkwckVQSXdtZjZCbDZS?=
 =?utf-8?B?T2VabW1NVnI5ZEgzZHNmaC9rNmJlZitqT2tMR2lFSHZCcGo2bm1HbmxydjZh?=
 =?utf-8?B?S2wyUUU1WHREcWZYakRtb3hjWmVXMUpIN2hVWFR1V01Qend4Mzd1UDRoclVL?=
 =?utf-8?B?QjVvT2lXU2sxcHltbjZvR1oxOC9ocDQvQVp6MUJpMlBpc3pPd3NSMkg5a1Vj?=
 =?utf-8?B?RkZkZnpPTzd2bHF6R3M4aHVGdTBVOHdmaWRwL2hnZG5VemVnNk9qU2lLWm1W?=
 =?utf-8?B?UGF0L3ZwdVFYdUdNendRVWxabmdSYmxmWnRFVkt1SU1DZlI1U1Y5WlNDYW9U?=
 =?utf-8?B?bXF5Szltb3hSem9YeVM0dk5IYkFaNFpjOXQ5TDA1cUNvejF5WjZUTHY4MTF2?=
 =?utf-8?B?RlJiYTZubWZ3a2EzMStyRTZLNlkrcXQ2NnlLYUdhWEljaEZVaTVhYWhKM3Jh?=
 =?utf-8?B?QUdzSHFZdXNwV0RpWGs4L0dNWUxnay9BcXVwdit3WGR5MGwvS01ZK1dnNkNG?=
 =?utf-8?B?VFRoZ1ZQN0owb2pQaTRXMklFK2UrZ0J2bnltNXg5bERZNkMxYSt5c1pRaGNo?=
 =?utf-8?B?aVhLL1RSWW9MaGhWd3paaHVkalVLRXBjT1Z1TjNjQUQrQm9ZTkhRdzdvdk1W?=
 =?utf-8?B?cU5WN05NNWFtL1dmWXp1My94MlhNZ1hrNS9VV2EyakkxNFRNZE8wK21Xd3Qx?=
 =?utf-8?B?TXFLSXhnOVNQRWcrUnc2UnVsRHpTTnUwRjZZTzBpRHdQVEtWa24zaGxqQzVQ?=
 =?utf-8?Q?SRu4DiL5OG9Bf3NYVnoIDlcri?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a59be0-71b0-48b5-9192-08dcc72b330f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 06:32:33.6611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shguHX3jnDZ7h0j0klefR8RKGmtPhnSopPLuXX0gSnpXIeG7aoJToMpffN/ffgli
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7362
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

Am 27.08.24 um 18:14 schrieb Lucas De Marchi:
> On Tue, Aug 27, 2024 at 11:42:59AM GMT, Thomas Hellström wrote:
>> On Wed, 2024-08-21 at 11:50 +0200, Nirmoy Das wrote:
>>> Remove TTM_TT_FLAG_CLEARED_ON_FREE now that XE stopped using this
>>> flag.
>>>
>>> This reverts commit decbfaf06db05fa1f9b33149ebb3c145b44e878f.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>
>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> Christian, since that commit being reverted was merged through drm-xe...
> ack on reverting it in our branch? It's actually the only branch where
> it can be reverted. AFAICS you agreed with the revert in
> https://lore.kernel.org/intel-xe/02a383c5-db18-47ef-9118-72effd83a252@amd.com/ 
>

Yeah, of course. Please make sure that this gets removed before anybody 
else starts to use it :)

Christian.

>
>
> thanks
> Lucas De Marchi

