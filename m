Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709F69276F2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 15:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A68610EAE8;
	Thu,  4 Jul 2024 13:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fWF5HOqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B2C10EAE6;
 Thu,  4 Jul 2024 13:13:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEpKTOipCM8+rBhjIZGxWOpRa3nLuixJJ2QwB1qkJuvJTaLOhEFjBt8XDS4sEp4y/qQVMkh2WMxhoFaBYMQKonmdma0uSCOc2te8HYjJpfS68eg2g3m3n1uGLY6UWbrtGwTJANT2vlWevam5vuVT1Ct+lPoV/8bSbIBcyPODaIVuiDjTaxyLOMqL5l1UNnmArzzTzW6CCP/+muDQG6Yak53pul/opcs62dEIYS2V7kFusyydpiJJ+IuoSlKmLZAa7JZxuSfYMNDWFWLRjjzzexQGLdKnV9VLzx9RtXZEypXVfjSUxRsQlaqx/oBxkitNUFpjgluUg/yn/gPUeuKoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOmZmXURCP993l/sZw+hVIr357G0qxHojd3wmu0Y/es=;
 b=VNeiNsMHChPDNrs+k5Cfp4UdeAEt54Si8IIpfZQTtJwbD64+kl1u183jqJFqVJm2P4Nsqh9pg9kuQnbdW7rU3PFPQZoUqAcf9cexHgBjCkTtEcDjxpqtk0Z1zL0Nla4oDKT/aytUn1hASWszK3/ZONYcTKtGlsLwvqmVK66t++uRvpNbbJgW1Z/qJ+Aa4suiBvJTyxF66BHQ9z5e1cTDIuvs1j/SiaG2ADj4Gu9TAGftPWs51OARQBhHwTG+fQkEuVvIOXnzvDxbHYG7TA+SIV9cT7K1tUstf7grjxPuP34ZbRCnN3Hv8vvqZmw3qcWAZRvawB9qUWciYh47eDPTHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOmZmXURCP993l/sZw+hVIr357G0qxHojd3wmu0Y/es=;
 b=fWF5HOqD/zIWpXPEYa9xQ2+HFZn6cEazuEJBqLyISJK72xLSKNVaDQgA+d9aeVPEHtziG+98kAQrEH+JtY1GNA83f5xC1vV9nE3dW0NYMIUu7DvuSlkQ1sQJsSYJTRMy/5nySTjmhWA8HF0ixigOBsDuB20bhfvUp8TPDAY3QGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8973.namprd12.prod.outlook.com (2603:10b6:208:48e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Thu, 4 Jul
 2024 13:13:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 13:13:16 +0000
Message-ID: <c49319cf-c110-4743-9a63-4028b6e5aab8@amd.com>
Date: Thu, 4 Jul 2024 15:13:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/12] drm/ttm, drm/amdgpu, drm/xe: Consider hitch
 moves within bulk sublist moves
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-5-thomas.hellstrom@linux.intel.com>
 <6e675fdb-7656-46f1-8753-ade66ef9de7b@amd.com>
 <f3bb190b58659b332819e9ab8a4a79df0253dad9.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f3bb190b58659b332819e9ab8a4a79df0253dad9.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: f9514054-30a3-4637-4d49-08dc9c2b10e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGd2WkVWU2NXb0MxU3pUUDhZa2RMVFRXaXpXWjkzT1RvazJ1eTZoWURrMkwv?=
 =?utf-8?B?Z0RkOGU5KzZTRTNJbENtNXc2YXFnZjVUckJwV1d2cGl6WUtxRlNEMjJTWDF4?=
 =?utf-8?B?cnZ2dEc1SlVxSHBSU1c3VFBBSVdlLzBRQlhQUkczYisxWE5HUUVJQVNWOFIx?=
 =?utf-8?B?TmM0cnpRNGY1Zm85NFd5dEpqMUNJem9VcExhV09MWUFjajRUazdrejhQNEQx?=
 =?utf-8?B?WGpXeS9yaTVCRlpubGl5K0xzSmk0bXMyNktoOGlFMU4veDcyck5LZ0lvZitt?=
 =?utf-8?B?NHhWa0hQRnAyeUozb1VRUFE0aW1wMVhKenQraVYyMnAycWxjczlDK3c4Zzdm?=
 =?utf-8?B?bVFLQ1FQV0lEYTNybmpYc1k1dnIzd29DRTBiWEp2bktzUXQxdEhhY0ZCd3dF?=
 =?utf-8?B?dHQzV0lxalp6R25zUjV4cFkwMkQwR0tOUE5CMENtZzZOZGlIczh1K0tjajZP?=
 =?utf-8?B?NFI0ZlZDTFZ6MXBpZmYwUnJBalN4blJvMldtOUZIT2E4MVZqZnluaGNSLy9G?=
 =?utf-8?B?cklSM2dGdlJDMTdqWWZwYkNRYWNMbG5mMVRFMlVSVldLNTRQTzR1bWp3bUd6?=
 =?utf-8?B?clRSdGp0aDM2MWVOSUVpdXlMNXJmNzhCUjg4WWdjcU5VK0ZWTzRRdWpsYnN4?=
 =?utf-8?B?dmtYNU5LaFhwNDU3MmRVN01EV2RWTEdmYXlZYVdHMjJXSWNQc1BUUjVDNTlL?=
 =?utf-8?B?ZHkrL0hBbzBocHd6eUNSdjQ5d0pWTE9EKzhNRlVtc0JjSi9XUVRKZ2s3ODd2?=
 =?utf-8?B?TnFHbldiT0JLQlRwSDk3Zm1xQlZtVUlpY3lkUGowT1FOcTBnQVhlaFdZU1lL?=
 =?utf-8?B?djlPdDJPdmJraWNtVmZCc242QXNBL1dnOW8ydVhTSitXNlNLR1NJVWk3eHVn?=
 =?utf-8?B?UWZtTkd1NGtFZ2YwQ3RmcXFsV3ZQcnE3enlac0JWVUlycG11Q2FibHZ3R25T?=
 =?utf-8?B?bEltRnZibitKZ283cGRwRXF4SStaR09EYjMrMUIxbHZEQmxsOTM3dWF0VFEw?=
 =?utf-8?B?d0NUSmVjWWFOTkVxN2ZPb3luOU5kYkxPL0MrVXJsRG5KWnRraWI1amN2S1ZJ?=
 =?utf-8?B?cUxxVndTdElucElsMDEwMmZmcHlNdmxwcXdMaGpUNnlBZTlIZ2JMRkY5M3FD?=
 =?utf-8?B?WTZlSlIveEN4d0pyYk1EVHlqQjA1WlZFaDhEamxucFY2MGxGSDhHZnloK0p4?=
 =?utf-8?B?TU1paTh1S0t6clFYMVBKOTZvRjNKdXlWOUpiNjIxRFRZd1pCVGN2RmhFYXNm?=
 =?utf-8?B?cUtYNDBSSzJUVm5NUUZ6Ym1lSnd4VlRmcnRBK2x4KzRaZ1ZkVjhsWXBlL3Bj?=
 =?utf-8?B?L0tIaGRUdVM0NEVVQ1NVWTlQbDhoNG1CMFBweFdrZkFzNGxDSWVaZDY0MFQ4?=
 =?utf-8?B?TER5VXZJSFlqdEd6cFpJeVA5TFZlcEIyY1hKS3ozTVdFaWNJaXhmN0lTZTcx?=
 =?utf-8?B?cGF2TlNpRXU0NkYyMjF5bEJmZ25iZmplODJsNnhVNDJFdTFBVWFyQ2J5V3g2?=
 =?utf-8?B?ckFWOWlrSWs2bkRMUVhZU0Z3R0VGeFZjZXVCRnZLWE5uZlhNWEN0bXF5bjRp?=
 =?utf-8?B?RHRpZ0pESURwZnZ5SHpQd2RKaXF6azllWnNVajk2ZVlUaHBQekZNODR0Ly9r?=
 =?utf-8?B?dDlMOWpVZWRTLzBCZHlvNzFEbThXZUFoRlpBZEYzWjY1cEd2bS9mNFdwVUFl?=
 =?utf-8?B?RnlpQ05pMCtGSjV4cGdBNkt3SFhUY0VBM0FXSlNuRkRRUFNURnhKaWZLaU53?=
 =?utf-8?Q?rpCj3muqxTTISUdTQ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWRsNDE3cWgzM0FjYjNWUThsTEVLTzVucEpTSkpsQkdaZjhWUEc1YjlHUHhR?=
 =?utf-8?B?a01ZYlo4emtLcHpRNmVXWHovcWQwNmtvTDdVRG4ycUptalpMUmxtUVFnb1Qx?=
 =?utf-8?B?NmhkcExaSm44OXp1VEFhU2JMU3RER1JDRlVzSmVMUHFwUVVwRDI5eGtXNHMy?=
 =?utf-8?B?UHMxMW5BWlRFSU1Wdng3VHg3bUZYbHVQZTN5cE1nOVhkT1dCMldjbEQvSnV5?=
 =?utf-8?B?cmUrMmdmYlk5cktHaFlVRDNyVVlhb3lqS0pJOU9zUGxKZ3VJdE41L21OQTdx?=
 =?utf-8?B?aUNub0JmejRQZTZITTJ4SjdocjhDOEFjK3E0NjdtTEFvRVRLemVLRlhVMWRm?=
 =?utf-8?B?aUlqZFJlTmFRd2ZjMFpjNGtlV2VhdEh6YW9mZDZoMGJEdy9UaE5wZExudDFy?=
 =?utf-8?B?dDM5OFpOeHl1VWV0eHdpb3l5cXRxR1QyVHBURFpVU05BaFVKNHl2bTNPcnRL?=
 =?utf-8?B?REtURko5NUlsU1gzM1NXQTE5ZUQxNDlVczBETTZrbnJsQmJ2MVpwTnd0eXh1?=
 =?utf-8?B?V2FrTkRUZitUU212VElHbnFEZVgrNzJTTWFCMlc5N2grUUJtOVFVaXRiajFE?=
 =?utf-8?B?QWxCeDdIRUtZTFRwT1NTNGVXSDVJWVQxY1JZOExuNWRsblRHWG5RNk44Nnli?=
 =?utf-8?B?c0UxMG9UdlF5N1BjZC80WHdWakN4V3FvdVNhakRPc0tNN1JXV0VIMlFURFpo?=
 =?utf-8?B?T2lQSlVPYkowMWE3QzJMOEZUSHN1OHczUTg3aVI5dldYdytsS1RaV2o2R09q?=
 =?utf-8?B?RUxyRnhNU1htY1Ivd05ZM1QwbVVTTWhGbzJKQ0VnRms1VVdxeVh2SDZ3WTBx?=
 =?utf-8?B?OHIzVUM1OGlIb3dyV2hNV3ZlOWdXd2E4L3g1TW5HRTM0ajVpb1MxYnlXT2VF?=
 =?utf-8?B?Qk5MZVE1MFg5OHN0RGlhaDdKeXlsOXZDV0VRanp6akN5YzkwZnBOZjh5LzZi?=
 =?utf-8?B?OUdLMHRES2lDdjJPMlkxZ3dDZjR3VTJRUk5VdUdZRlV1bFBSZzMxWWY2QVpm?=
 =?utf-8?B?NDM3WVUrZUlZRi9oL2syeFp2N0xJVy9jNngyWm9FUUpxdUhEK0FaYU5mUTU2?=
 =?utf-8?B?MHpzREh2NnM5S1k5OG5wL05hSW9IQXp2NWxrb2xNeklETGNLWnpkeERiKzkr?=
 =?utf-8?B?QXM1ZjZWaGdwSW5vWEtJMmhrdzhTb1paT1FYUjdxNVg4a0pCLzZDNi9WVVZk?=
 =?utf-8?B?UkttNEpLZnpWdHhIdXVwQzNDdE9zOUhOV3hscWdPUTkvZmxBQnhkVk1KcmJI?=
 =?utf-8?B?dktRN1BKc093SWE2d2hiZmhCNVA4UFU0R3R5d2REQ28zaWxHNjFoRy9tcVVR?=
 =?utf-8?B?Zk9xak5vdDFrQjF0Njlwd2h5Q2FxY2MxVFJQbWhUcVFuVjYxc1lEYkQ0ei9F?=
 =?utf-8?B?QTBGT2lZcGRRNVZKY2g0SGJteTBzREFvbE0wWVZsYk9BRHNnbXhsTlpDWUdO?=
 =?utf-8?B?bm9xaGR2anEvMGpiZXAwbERCNk5PdzJIWE9lT0ZGTkJSeVRpT1RBRUlKOVBr?=
 =?utf-8?B?KzBFTzVCNFhoTDEvUzBkV0FLalZHandjeUpCYWFMODhvemgxdTBYQVltbm14?=
 =?utf-8?B?eTJPeFl5aDFYalpsOHFrUldYTE53K2l0eGZrMndpejh2VVRZMHZQenUxV3hB?=
 =?utf-8?B?ZS9taVVNQUcxdi9HRTc1WWR0TW9PTUlNdkNSRndnSWZ5UDVGdmZhdEdDeHIv?=
 =?utf-8?B?ZE85WktqOVh1aW04Z2JCb2hwRUloL0c0TjJRaEhac0FuWEFnUWVxaWFxbG1m?=
 =?utf-8?B?MVpIU3RmTktqa0M0TVFBbWVEdHpLalAxYWJXclA0b1VxV2dPbzUrYW9YVStL?=
 =?utf-8?B?U0pERmRyMDFFL3JNK0VJd3pRSjRlbjgvd3hHYmhzdDA2eHV3dUtDVitNOTF6?=
 =?utf-8?B?bHNEay9NeVRZTkNWODZTTnhDK0xXbm5QUWxzTWxzYStuSDFma1psbGw2SDdM?=
 =?utf-8?B?Y2JTTkxEdjhsaUpLVTEwTW5EMUI2TUtUQi9sNnlDY0ZpbHMzbmhZZWNjSFAz?=
 =?utf-8?B?cHVyWVpFNmNZTWp4OEZtSkJvYVpQYzNvUms2elpGaFgwSXQzTldFbDUrMmlJ?=
 =?utf-8?B?aStmS0wwZzZXUXdzemUyLzlqcUhPM0N1VDJMZ1lNU3o3VGxWejZVYjd6RTA4?=
 =?utf-8?Q?oCMo/8QQJbRpqkcdbrB4GoP5x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9514054-30a3-4637-4d49-08dc9c2b10e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 13:13:16.2556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXdi0yW0V90HhOOfsyaOedo5x3JWI5Z975u4UVGBWcP6lTBllXtydfGFp05Cy6+V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8973
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

Hey Thomas,

Am 04.07.24 um 14:41 schrieb Thomas Hellström:
> Hi, Christian,
>
> On Thu, 2024-07-04 at 11:21 +0200, Christian König wrote:
>> Am 03.07.24 um 17:38 schrieb Thomas Hellström:
>>> To address the problem with hitches moving when bulk move
>>> sublists are lru-bumped, register the list cursors with the
>>> ttm_lru_bulk_move structure when traversing its list, and
>>> when lru-bumping the list, move the cursor hitch to the tail.
>>> This also means it's mandatory for drivers to call
>>> ttm_lru_bulk_move_init() and ttm_lru_bulk_move_fini() when
>>> initializing and finalizing the bulk move structure, so add
>>> those calls to the amdgpu- and xe driver.
>>>
>>> Compared to v1 this is slightly more code but less fragile
>>> and hopefully easier to understand.
>> This is the only patch in the series which I see critical.
>>
>> I think the final goal when using drm_exec in TTMs eviction path is
>> to
>> keep all evicted (or evicting) BOs locked until we have enough space.
>>
>> This means that for bulk move sections on the LRU we would lock the
>> first BO and would only drop that lock again if we have gone over the
>> full bulk move section and know that all BOs are not valuable for
>> eviction.
>>
>> Because of this the issue of having to consider hitches move with a
>> bulk
>> move section on the LRU doesn't even occur because for that a
>> concurrent
>> process would need to grab the common lock of the BOs in the bulk
>> move
>> section.
> While I agree that this is something we should strive towards,
> following the previous discussion I already reworked this patch
> completely to remove the dual hitches and make it less fragile.

Yeah seen that and it indeed makes it much easier to understand what's 
going on.

> After that you mentioned you were ok with the high level approach for
> these first four patches here:
>
> https://lists.freedesktop.org/archives/dri-devel/2024-April/450288.html
>
> So is that not any longer the case?

I'm ok with having it as intermediate step, but for that it's a bit much 
of an hammer.

On the other hand having clean ttm_lru_bulk_move_init() and 
ttm_lru_bulk_move_fini() calls is probably something we should keep 
around anyway.

> To recap, the concerns I'm seeing with the "kept common lock" approach
> are
>
> a) Since when we release the LRU lock and the common bulk bo lock is
> not yet locked, a LRU bump may happen and the hitch will go with it. So
> to avoid that we need to place the hitch *before* then considered
> resource in the LRU list rather than *after*. Now on the next iteration
> we need to come up with some way to choose what's really the next
> resource? If the next resource pointer is the same we already
> considered, should we assume it might have been freed and re-alloced
> with the same virtual address?

My idea is for the general flow is this:

1. Grab the lru lock
2. Grab a reference to the BO after the hitch, eventually trylock the BO 
or just continue with a prelocked one
3. If locking wasn't successfully
     4. Drop the lru lock
     5. Block on the BO lock
     6. Check that this resource/BO is still the one the cursor points 
to, if not drop the lock and restart from #1
     7. Grab the lru lock
8. Advance the cursor.
9. Drop the lru lock.
10. Try to evict or swap the BO
11. Repeat if still not able to allocate memory.

The BO could be prelocked if it's part of the currently processed bulk 
or previously contended and prelocked by drm_exec.

And instead of checking if the resource is in the right domain we check 
if the resource/BO is still the one where the cursor points to.

This way we don't care if the resource was reallocated and by coincident 
ended up right after the cursor hitch again. As long as we still point 
to the BO we just locked everything is fine.

> b) It will be up to the user of the lru traversal to actually guarantee
> that locks are held across a bulk part, to make the resource traversal
> reasonably self-contained. In this case the LRU walker, because there's
> where the bo locking happens.
> This means that any other code that aims to walk the LRUs for various
> reasons, and doesn't provide any held lock guarantees, may be subject
> to unexpected results if someone bumped the LRU.
> So we would basically tailor the resource iteration here for a single
> use-case and not make it robust for various use-cases.

Yeah, that's also going into a direction I was questioning. Do we have 
use cases for the resource iterator were we don't lock the BO?

If not why don't we integrate all this into the first_resource() and 
next_resource() functions instead? Obviously with some helpers in the BO 
code.

> So my suggestion is we keep this until we've come up with a bullet-
> proof way to sort out a) and b) above and then we can rip it out.

Yeah if we can't make progress otherwise that works for me as well.

Regards,
Christian.

>
> /Thomas
>
>
>
>
>
>
>
>
>
>
>
>
>> Regards,
>> Christian.
>>
>>
>>> Changes in previous series:
>>> - Completely rework the functionality
>>> - Avoid a NULL pointer dereference assigning manager->mem_type
>>> - Remove some leftover code causing build problems
>>> v2:
>>> - For hitch bulk tail moves, store the mem_type in the cursor
>>>     instead of with the manager.
>>> v3:
>>> - Remove leftover mem_type member from change in v2.
>>> v6:
>>> - Add some lockdep asserts (Matthew Brost)
>>> - Avoid NULL pointer dereference (Matthew Brost)
>>> - No need to check bo->resource before dereferencing
>>>     bo->bulk_move (Matthew Brost)
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: <dri-devel@lists.freedesktop.org>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  4 ++
>>>    drivers/gpu/drm/ttm/ttm_resource.c     | 92
>>> ++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_vm.c             |  4 ++
>>>    include/drm/ttm/ttm_resource.h         | 56 ++++++++++------
>>>    4 files changed, 135 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index 3abfa66d72a2..97743993d711 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -2420,6 +2420,8 @@ int amdgpu_vm_init(struct amdgpu_device
>>> *adev, struct amdgpu_vm *vm,
>>>    	if (r)
>>>    		return r;
>>>    
>>> +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>>> +
>>>    	vm->is_compute_context = false;
>>>    
>>>    	vm->use_cpu_for_update = !!(adev-
>>>> vm_manager.vm_update_mode &
>>> @@ -2484,6 +2486,7 @@ int amdgpu_vm_init(struct amdgpu_device
>>> *adev, struct amdgpu_vm *vm,
>>>    error_free_delayed:
>>>    	dma_fence_put(vm->last_tlb_flush);
>>>    	dma_fence_put(vm->last_unlocked);
>>> +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm-
>>>> lru_bulk_move);
>>>    	amdgpu_vm_fini_entities(vm);
>>>    
>>>    	return r;
>>> @@ -2640,6 +2643,7 @@ void amdgpu_vm_fini(struct amdgpu_device
>>> *adev, struct amdgpu_vm *vm)
>>>    		}
>>>    	}
>>>    
>>> +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm-
>>>> lru_bulk_move);
>>>    }
>>>    
>>>    /**
>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>> index 9c8b6499edfb..b6a2daac5518 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>> @@ -33,6 +33,53 @@
>>>    
>>>    #include <drm/drm_util.h>
>>>    
>>> +/* Detach the cursor from the bulk move list*/
>>> +static void
>>> +ttm_resource_cursor_clear_bulk(struct ttm_resource_cursor *cursor)
>>> +{
>>> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
>>> +
>>> +	cursor->bulk = NULL;
>>> +	list_del_init(&cursor->bulk_link);
>>> +}
>>> +
>>> +/* Move the cursor to the end of the bulk move list it's in */
>>> +static void ttm_resource_cursor_move_bulk_tail(struct
>>> ttm_lru_bulk_move *bulk,
>>> +					       struct
>>> ttm_resource_cursor *cursor)
>>> +{
>>> +	struct ttm_lru_bulk_move_pos *pos;
>>> +
>>> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
>>> +
>>> +	if (WARN_ON_ONCE(bulk != cursor->bulk)) {
>>> +		list_del_init(&cursor->bulk_link);
>>> +		return;
>>> +	}
>>> +
>>> +	pos = &bulk->pos[cursor->mem_type][cursor->priority];
>>> +	if (pos->last)
>>> +		list_move(&cursor->hitch.link, &pos->last-
>>>> lru.link);
>>> +	ttm_resource_cursor_clear_bulk(cursor);
>>> +}
>>> +
>>> +/* Move all cursors attached to a bulk move to its end */
>>> +static void ttm_bulk_move_adjust_cursors(struct ttm_lru_bulk_move
>>> *bulk)
>>> +{
>>> +	struct ttm_resource_cursor *cursor, *next;
>>> +
>>> +	list_for_each_entry_safe(cursor, next, &bulk->cursor_list,
>>> bulk_link)
>>> +		ttm_resource_cursor_move_bulk_tail(bulk, cursor);
>>> +}
>>> +
>>> +/* Remove a cursor from an empty bulk move list */
>>> +static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move
>>> *bulk)
>>> +{
>>> +	struct ttm_resource_cursor *cursor, *next;
>>> +
>>> +	list_for_each_entry_safe(cursor, next, &bulk->cursor_list,
>>> bulk_link)
>>> +		ttm_resource_cursor_clear_bulk(cursor);
>>> +}
>>> +
>>>    /**
>>>     * ttm_resource_cursor_fini_locked() - Finalize the LRU list
>>> cursor usage
>>>     * @cursor: The struct ttm_resource_cursor to finalize.
>>> @@ -45,6 +92,7 @@ void ttm_resource_cursor_fini_locked(struct
>>> ttm_resource_cursor *cursor)
>>>    {
>>>    	lockdep_assert_held(&cursor->man->bdev->lru_lock);
>>>    	list_del_init(&cursor->hitch.link);
>>> +	ttm_resource_cursor_clear_bulk(cursor);
>>>    }
>>>    
>>>    /**
>>> @@ -73,9 +121,27 @@ void ttm_resource_cursor_fini(struct
>>> ttm_resource_cursor *cursor)
>>>    void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
>>>    {
>>>    	memset(bulk, 0, sizeof(*bulk));
>>> +	INIT_LIST_HEAD(&bulk->cursor_list);
>>>    }
>>>    EXPORT_SYMBOL(ttm_lru_bulk_move_init);
>>>    
>>> +/**
>>> + * ttm_lru_bulk_move_fini - finalize a bulk move structure
>>> + * @bdev: The struct ttm_device
>>> + * @bulk: the structure to finalize
>>> + *
>>> + * Sanity checks that bulk moves don't have any
>>> + * resources left and hence no cursors attached.
>>> + */
>>> +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
>>> +			    struct ttm_lru_bulk_move *bulk)
>>> +{
>>> +	spin_lock(&bdev->lru_lock);
>>> +	ttm_bulk_move_drop_cursors(bulk);
>>> +	spin_unlock(&bdev->lru_lock);
>>> +}
>>> +EXPORT_SYMBOL(ttm_lru_bulk_move_fini);
>>> +
>>>    /**
>>>     * ttm_lru_bulk_move_tail - bulk move range of resources to the
>>> LRU tail.
>>>     *
>>> @@ -88,6 +154,7 @@ void ttm_lru_bulk_move_tail(struct
>>> ttm_lru_bulk_move *bulk)
>>>    {
>>>    	unsigned i, j;
>>>    
>>> +	ttm_bulk_move_adjust_cursors(bulk);
>>>    	for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
>>>    		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>>>    			struct ttm_lru_bulk_move_pos *pos = &bulk-
>>>> pos[i][j];
>>> @@ -515,6 +582,28 @@ void ttm_resource_manager_debug(struct
>>> ttm_resource_manager *man,
>>>    }
>>>    EXPORT_SYMBOL(ttm_resource_manager_debug);
>>>    
>>> +static void
>>> +ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
>>> +			       struct ttm_lru_item *next_lru)
>>> +{
>>> +	struct ttm_resource *next = ttm_lru_item_to_res(next_lru);
>>> +	struct ttm_lru_bulk_move *bulk = NULL;
>>> +	struct ttm_buffer_object *bo = next->bo;
>>> +
>>> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
>>> +	bulk = bo->bulk_move;
>>> +
>>> +	if (cursor->bulk != bulk) {
>>> +		if (bulk) {
>>> +			list_move_tail(&cursor->bulk_link, &bulk-
>>>> cursor_list);
>>> +			cursor->mem_type = next->mem_type;
>>> +		} else {
>>> +			list_del_init(&cursor->bulk_link);
>>> +		}
>>> +		cursor->bulk = bulk;
>>> +	}
>>> +}
>>> +
>>>    /**
>>>     * ttm_resource_manager_first() - Start iterating over the
>>> resources
>>>     * of a resource manager
>>> @@ -535,6 +624,7 @@ ttm_resource_manager_first(struct
>>> ttm_resource_manager *man,
>>>    	cursor->priority = 0;
>>>    	cursor->man = man;
>>>    	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
>>> +	INIT_LIST_HEAD(&cursor->bulk_link);
>>>    	list_add(&cursor->hitch.link, &man->lru[cursor-
>>>> priority]);
>>>    
>>>    	return ttm_resource_manager_next(cursor);
>>> @@ -559,6 +649,7 @@ ttm_resource_manager_next(struct
>>> ttm_resource_cursor *cursor)
>>>    		lru = &cursor->hitch;
>>>    		list_for_each_entry_continue(lru, &man-
>>>> lru[cursor->priority], link) {
>>>    			if (ttm_lru_item_is_res(lru)) {
>>> +				ttm_resource_cursor_check_bulk(cur
>>> sor, lru);
>>>    				list_move(&cursor->hitch.link,
>>> &lru->link);
>>>    				return ttm_lru_item_to_res(lru);
>>>    			}
>>> @@ -568,6 +659,7 @@ ttm_resource_manager_next(struct
>>> ttm_resource_cursor *cursor)
>>>    			break;
>>>    
>>>    		list_move(&cursor->hitch.link, &man->lru[cursor-
>>>> priority]);
>>> +		ttm_resource_cursor_clear_bulk(cursor);
>>>    	}
>>>    
>>>    	ttm_resource_cursor_fini_locked(cursor);
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c
>>> b/drivers/gpu/drm/xe/xe_vm.c
>>> index 5b166fa03684..0c7e327bc9a2 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -1335,6 +1335,8 @@ struct xe_vm *xe_vm_create(struct xe_device
>>> *xe, u32 flags)
>>>    
>>>    	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
>>>    
>>> +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>>> +
>>>    	INIT_LIST_HEAD(&vm->preempt.exec_queues);
>>>    	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up
>>> to uAPI */
>>>    
>>> @@ -1458,6 +1460,7 @@ struct xe_vm *xe_vm_create(struct xe_device
>>> *xe, u32 flags)
>>>    	mutex_destroy(&vm->snap_mutex);
>>>    	for_each_tile(tile, xe, id)
>>>    		xe_range_fence_tree_fini(&vm->rftree[id]);
>>> +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
>>>    	kfree(vm);
>>>    	if (flags & XE_VM_FLAG_LR_MODE)
>>>    		xe_pm_runtime_put(xe);
>>> @@ -1601,6 +1604,7 @@ static void vm_destroy_work_func(struct
>>> work_struct *w)
>>>    		XE_WARN_ON(vm->pt_root[id]);
>>>    
>>>    	trace_xe_vm_free(vm);
>>> +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
>>>    	kfree(vm);
>>>    }
>>>    
>>> diff --git a/include/drm/ttm/ttm_resource.h
>>> b/include/drm/ttm/ttm_resource.h
>>> index 8fac781f641e..571abb4861a6 100644
>>> --- a/include/drm/ttm/ttm_resource.h
>>> +++ b/include/drm/ttm/ttm_resource.h
>>> @@ -269,26 +269,6 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
>>>    	return container_of(item, struct ttm_resource, lru);
>>>    }
>>>    
>>> -/**
>>> - * struct ttm_resource_cursor
>>> - *
>>> - * @man: The resource manager currently being iterated over.
>>> - * @hitch: A hitch list node inserted before the next resource
>>> - * to iterate over.
>>> - * @priority: the current priority
>>> - *
>>> - * Cursor to iterate over the resources in a manager.
>>> - */
>>> -struct ttm_resource_cursor {
>>> -	struct ttm_resource_manager *man;
>>> -	struct ttm_lru_item hitch;
>>> -	unsigned int priority;
>>> -};
>>> -
>>> -void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor
>>> *cursor);
>>> -
>>> -void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
>>> -
>>>    /**
>>>     * struct ttm_lru_bulk_move_pos
>>>     *
>>> @@ -304,8 +284,9 @@ struct ttm_lru_bulk_move_pos {
>>>    
>>>    /**
>>>     * struct ttm_lru_bulk_move
>>> - *
>>>     * @pos: first/last lru entry for resources in the each
>>> domain/priority
>>> + * @cursor_list: The list of cursors currently traversing any of
>>> + * the sublists of @pos. Protected by the ttm device's lru_lock.
>>>     *
>>>     * Container for the current bulk move state. Should be used with
>>>     * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
>>> @@ -315,8 +296,39 @@ struct ttm_lru_bulk_move_pos {
>>>     */
>>>    struct ttm_lru_bulk_move {
>>>    	struct ttm_lru_bulk_move_pos
>>> pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
>>> +	struct list_head cursor_list;
>>>    };
>>>    
>>> +/**
>>> + * struct ttm_resource_cursor
>>> + * @man: The resource manager currently being iterated over
>>> + * @hitch: A hitch list node inserted before the next resource
>>> + * to iterate over.
>>> + * @bulk_link: A list link for the list of cursors traversing the
>>> + * bulk sublist of @bulk. Protected by the ttm device's lru_lock.
>>> + * @bulk: Pointer to struct ttm_lru_bulk_move whose subrange
>>> @hitch is
>>> + * inserted to. NULL if none. Never dereference this pointer since
>>> + * the struct ttm_lru_bulk_move object pointed to might have been
>>> + * freed. The pointer is only for comparison.
>>> + * @mem_type: The memory type of the LRU list being traversed.
>>> + * This field is valid iff @bulk != NULL.
>>> + * @priority: the current priority
>>> + *
>>> + * Cursor to iterate over the resources in a manager.
>>> + */
>>> +struct ttm_resource_cursor {
>>> +	struct ttm_resource_manager *man;
>>> +	struct ttm_lru_item hitch;
>>> +	struct list_head bulk_link;
>>> +	struct ttm_lru_bulk_move *bulk;
>>> +	unsigned int mem_type;
>>> +	unsigned int priority;
>>> +};
>>> +
>>> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor
>>> *cursor);
>>> +
>>> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
>>> +
>>>    /**
>>>     * struct ttm_kmap_iter_iomap - Specialization for a struct
>>> io_mapping +
>>>     * struct sg_table backed struct ttm_resource.
>>> @@ -405,6 +417,8 @@ ttm_resource_manager_cleanup(struct
>>> ttm_resource_manager *man)
>>>    
>>>    void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
>>>    void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
>>> +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
>>> +			    struct ttm_lru_bulk_move *bulk);
>>>    
>>>    void ttm_resource_add_bulk_move(struct ttm_resource *res,
>>>    				struct ttm_buffer_object *bo);

