Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78ACA78D80
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 13:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6DD10E76F;
	Wed,  2 Apr 2025 11:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YmeVZNkC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E686610E78D;
 Wed,  2 Apr 2025 11:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blghIHV5A2vytoSvC0mRIJ2NOFfG7SU6xjsqYKYKeYWawffnVS8DzAetb2YI81usKPGLHvZXx44YvI8qhl95Ysc0pmkfF/mo6wZ19FSSofrNdYWG8usXdRL7LQw+0kD9wFlET7SkrvBj1R4SaoLYDCjK4vlyk/ojSkbQd0OIoaxpDnk94K0La/t1zAp64RLlizlt/fDwEwTfJ7aNMTkxylKXuVNEaGCPvEM+YY1p85TfNoOV1eKOjTby2PFAPHbfl5q6K6Ro/jg8hitqs/zQIH3kOMk0MIV8yF8fCAQt5rGIOUdUCr4sUlNYWNoVwYqbU7wxBTiS9A7ndh3ukGT3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMpORvw2Y1fDDbvH60z9vz7mt43FMQO2eJ8oChExYTI=;
 b=kiF1narxT7iuYyQMifJDGV+FIjjSu3MCY56g1mvclNOwuSZNLCx5W0ipU0FUtMfgDPeYFkn3DKN1OkxI1UpWelGJNzmYdQuLB/ubtkPdQrSHsl9trxiduuqx2zASuGWGZUGNQrGn33f7AflGoP4bTsL9OR3gYpjuHYidXcMSfgutpEduSB09ppI89wf3RDFPnunLnP/P4TH2t/IwFJCTsLuw4hS4lBtFSTRw8r5ba9XFd+0xKulyjsDuAw+yVH8KZ/8uBRZhO3YXjjvaa6EMri6dkaRvLdbNauz8E3IYxItdSZXiZ+NMCbPPf2kdKXu3Ira1x0pRCJVVtgt9Q177Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMpORvw2Y1fDDbvH60z9vz7mt43FMQO2eJ8oChExYTI=;
 b=YmeVZNkCsaeqM63m0gcq3aF1UAxSTE77MJLB7DgbaoQRQ3T/82ZFt3l9tVUchof0ggYSQ5PhMs1Fi2EaI0Nm6bTEeHuNwu+UWQ5QiSCNce2vLQLBeABa2rDImg6o+1z83o9I3m1w2Z8AmB6w2Fyl//u14o9nc3XTDD/a2ZcUqw0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7555.namprd12.prod.outlook.com (2603:10b6:208:43d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 11:53:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 11:53:11 +0000
Message-ID: <6f56080c-57af-454d-bc06-ca230734f7ba@amd.com>
Date: Wed, 2 Apr 2025 13:53:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 00/14] Deadline DRM scheduler
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 "Liu, Leo" <Leo.Liu@amd.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
 <5d2a726c-bdf0-45e1-abfa-3ed8d1ffbed4@amd.com>
 <df0a7e4e-9de1-40a3-9aa6-4b9051dbd624@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <df0a7e4e-9de1-40a3-9aa6-4b9051dbd624@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3dbbc9-f579-4d83-7922-08dd71dcf187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WW1Dby9JVTR6K3hlYXVSNVQ5S3lMTHpPbTlab2xPQTlpbE5Nb1JubWZvSURw?=
 =?utf-8?B?TlNWZUlHUXZQdUpRbUxUTmVFOHZac0YxaStjRFJFcGR6QUovcVpoQldYVjF2?=
 =?utf-8?B?V3ZuVUlyYXVwU1hMWGdMZzB0QldYdVlZNHBMREJObEtGZWIrZ2hYaXB6b3di?=
 =?utf-8?B?clRSKzlQWmw2RXRqNXNQUXVLMU56YndSc0Z5dWRseTF2OUYzN3pLR2ZqM2VJ?=
 =?utf-8?B?azVWamR1QVJYQ3VFVUJKbVErd1pWZzhtVkdBYVZ5VGJFWWdXN3hDNTUwTWhR?=
 =?utf-8?B?WlRpN3FuWEVMdlB6cklMOVZCN25ac043cTFPdVgvS2tpTWw2eEJ0cUpDZEdV?=
 =?utf-8?B?WHV1cGtPMng5TWJpM0dLdjVNdEtPTWJMTlNBOGlUZ1FCRFFEY0tFZ2U1Qm4v?=
 =?utf-8?B?RDcwTHRiRVZTb3NucGVVUXRMQUdGQmhTZitpRXNqaDFIbHROdnVuTjlFUHdO?=
 =?utf-8?B?UEl4ZXU3bUo2Y0o3NXRDT2d5Q0REbE9HUnIrM2w0ajV1WEY1ZDl3dDVUcTc2?=
 =?utf-8?B?bGJsV3RWMGw4eFdkeDVaUUpvazlGQ0NVVlRBSjkzby95Y016bEFtR3RQN3R6?=
 =?utf-8?B?SDVYMjRYeTQ5c21OV3d2UEtGckxvcU9wRkRTa3Rrald0V3dwRjBCUlNsM1Vk?=
 =?utf-8?B?ejNZNzRuTG5mQmxlTW1EOG5PYndnaExSWUw4K3BuMWVTQVQrRlpPTmF0YUpi?=
 =?utf-8?B?SGpYczdXTkRIR0pTTlB3VjBJRzBLWTV4V2RteERiWll1Q3A5USsveTk1eGs2?=
 =?utf-8?B?NmlNelo4ZlJSVHZGY3dySjhteEpKVkFtYXU5d2wrMUdVNXpGYkFJK2pqcDkx?=
 =?utf-8?B?S2Fac0xRdytYRlc5UytuSFNkOU40bHVvb3dCOUN1OWllTzZmcFFwUmdBY3dv?=
 =?utf-8?B?OUtaNVZCS016S1R0VTVIZXdCbDBtcmhSNElPMFhOQWFTeU02dGZnc2FMN2pW?=
 =?utf-8?B?c09KVjQ4UTlBVG9DdFpvZnBsem5Vd0tnaDN2ZFBJMFEwTHFNNVJZUko4OEx5?=
 =?utf-8?B?Ym0vYzVtcDBZWXVLc1lDRlMxVkM1dWR1OU9FamgxV1VVeWRHdUhmc0h0Ymlq?=
 =?utf-8?B?MmlZZ2Z1YWc3cUg1bkt1M1RCbXFFRml6Y2orN09xbXlqQ1NkY0dEUkNoS2wz?=
 =?utf-8?B?NnJjRUM2NklOck42dExSa0c0dC95Q1l4ZUx2TVhNaVBCRjUxV3RXeXpXWmRO?=
 =?utf-8?B?YzNqV1FLL1hqSWF4UjRIQzZuTGdEekNQc2ZsMnlVaDhEeVNodUVDNHgrcHEv?=
 =?utf-8?B?TmpFSGNHam5Dc1k4dnlsVEZJWW9UdHRpdlYwWHJhcnhDOWZQZmQvT09mZmxY?=
 =?utf-8?B?ZnRvSEtIVHFWUnpidGhQeVo5aFRxZHFEZnQvRDMzeW4yZmE3NkRzeUdFMmx4?=
 =?utf-8?B?Sm54RmtmVGFsTmpnZmdETGZ0S0QrcjFWZHFGMUZIUzc3VDhVT0htWXdBcWRU?=
 =?utf-8?B?c3RnMGlqQWJGNzRmem00TDBhdVhoZ29hSEEyTnA1dGZScDRaK0JhVnNnaFNC?=
 =?utf-8?B?N2xySDVuMUVBbE9hZVFxRnloVlNTK0hQNDVHYlFOeVQ4VXQyb05tU1BVQVdZ?=
 =?utf-8?B?ZWtzTnFOcGM4UnlsSVYvOUdWQlZ4cjFoSWl4MG1Id3RXa3RnaW90N3JFTEN1?=
 =?utf-8?B?VE9vV210ODZvcGhKZ2N2Y3F5bHJRTmpTbXFNV0tOdGV2cHFIOTNLb0liayt1?=
 =?utf-8?B?SlJYbUlZNFZ1cnFBMmhGaEVmeExBaVhvNTVIVCtlWStzais5NkhrYm9MUFMy?=
 =?utf-8?B?K3pwU21kQnBJbDlhTjN6aFVucjh2aHMyS2x4UnpOMGpaQXNJODg0MUFuUTVT?=
 =?utf-8?B?ckYwTkFPQnFDSitMR0RFdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFNWa21ycWdidGZmdSs5VEN2RHozK3lua1JGVFI5WUcyd3NlcXVqOXRGK1FQ?=
 =?utf-8?B?UzFjRWxUZm53ZEJXU2tLSDJ1Wjk5d3BvVCtpWFhGaHVNa296blR0NGF3NGF4?=
 =?utf-8?B?WmVOSG5RU0I5c1M4eWZCQkp6VlRrODVzV0dlZnVvS2YzckRMOE9MemlQNXRa?=
 =?utf-8?B?Vk9PZjJWRmQ5Ly8vMjBSZ0IxUlMwRm9nREpoUTlFYWJhMmZITzlsc2FJbE5r?=
 =?utf-8?B?N001UmRUdGw0K2VndnR4dmZOelk5VGc1YnBkWStkRmUzMWt0MWYrL01pbW9B?=
 =?utf-8?B?OEV0ZWJya1BzMWtmSmgvcVFrSW1VVnJhQ3ZQQUZCcG4yVHp6c054OFowcmxy?=
 =?utf-8?B?V3pBMFhOM2xISHBWSzhKdU5pOXByWFhQRDF0VHlKV0ZqRmRvWUhYVUJGdUt3?=
 =?utf-8?B?TnVhcCtaNFQvSTdlcTlUZld6MVRyVjYveExobStKK3c1K0FmemgvS2RFN1FK?=
 =?utf-8?B?ejVESkcrdWN3QkNXQ2ZKS2RvZ2c4bHF1WW1rZmdhL3NTbEFrYXVvWjFiL0Y1?=
 =?utf-8?B?VTlUc2Q0M2pVVkNXblEvYzNWREl6bVFodzFYZ0ZSblNYWkpCSVVpSG56YjY4?=
 =?utf-8?B?RFNLSWpXNWZRbXNVc0ZPN28wZUk5VGE4M3ZWQzVhMDdzSTJCb2VVQzV0WnFn?=
 =?utf-8?B?bDFnN283NXE4bGVRaXdkMkV4R3Vkc1FTejhWVXJVVEhtbXB1ajJiUVJlNlFu?=
 =?utf-8?B?SFJTMWJmZlZuNU05R0Q3emMva2pPcEw4dXJsOFVma0l5L1FTMGlqTXlGZVIr?=
 =?utf-8?B?Tm9reDVRcUhLcGdBYjZQUHU3SkgyRVBUc1NyVk4yZ1MvVXhHbUh5SVpPdlVY?=
 =?utf-8?B?SGxwcjhDdXUwU3ZWN1JVYkN0MmRxbGxDQnNEOW9kWmlQZW5nOThyTTd6QTlM?=
 =?utf-8?B?KzBaMDRsd2FYM2xLY013RFJwcU5xUk10a1QzY3VrOG51bHQ5MW1kT0ZPQXNk?=
 =?utf-8?B?YTFreDFDeGlOWUVMUys4RnF4dTlhSCtMbm1PQjk3SG8xQVpjVElydkNDYzdP?=
 =?utf-8?B?ejdIcDZrL0ltSGtLQ1RuZ3hRbU1pZXZOZzZMSmpmdkQydTRQSG5FR3VpN1I0?=
 =?utf-8?B?cWRwUzY5dVVVbmQvQThJeFFlUkUrMFMrbVdtRlJiOUNZb3RUMFNjMUpjUW5D?=
 =?utf-8?B?di9Wc3g1dWd5WTZWS0Z6Q3liVW4zdDlDUzVFYlVoTmFiMTlKdDBrWXBSdG9C?=
 =?utf-8?B?MWV3TnlPb2RmanRkaEh4Y1hwZWUrM09OV3l6bjNVWDY5U2tJdS9ES1RIZEZI?=
 =?utf-8?B?akJha09jaGNYS3I3YWpNLzZNcnk1Q0g0bEJoOE12VXMrQVRKaGJ4OFZqc3p1?=
 =?utf-8?B?akVwYSs2dzFMREU0WTA1ekZqeEg3U3lidXBrRGd3bWRacHdHcE43d1VpZVJ2?=
 =?utf-8?B?VmxMMWZBeE5lQjNyR282U2NyeEF4enRsWi9ySXk1Zkg1TDRxU3NHanpMWkhN?=
 =?utf-8?B?bmFCNVRDRnFMYy9GSy9pU1UzMFh2cy9ZbUtkZzkwd1ZYTWk4ZE1GZlJQbGJk?=
 =?utf-8?B?cVFEd3lCYld4MlVjdmJJK0gvOWJPTkdTYVdwbXlQdTgxLzdnaVJ4SmxnUWVI?=
 =?utf-8?B?YThNRTRJTEQyTFlYZEFCaEdTNnkxNFRMbExwZldGMjJRdndOUTdIeitzS0I2?=
 =?utf-8?B?QzdTMHNQMEVnZXZFMEZwczNQZkpHcTlBaHV1TEV0aFBObGgwSHg3aGlLdTZh?=
 =?utf-8?B?Um9vQm5kTFUrcE9tWWNubjRyOVpycFhmamh3MUNlalp0NW9VbWQ2OERTOUxK?=
 =?utf-8?B?Y3ZuazB1aEZyWkozSjhObG8xV1FxZ1U4V0dZWWdMVDA1ZnAzUk9CUWhabE5N?=
 =?utf-8?B?S3BzcVVEWmZ3OFBPUnhaY2M5RkF3R0ZZWDljOGFycTNCV29jL1VnK1Qvb0dL?=
 =?utf-8?B?UG1Fd3E1NE9taWlUc0w2ZTY0TXplSjZTdE9tUWo0L1dOMFVLL2thN3BEUXlp?=
 =?utf-8?B?UUdFMXY2Nm5NbDNveFhRbmRCdFJtcDZaYVhSc1loaDRabi9MRTN5NFBhTGJo?=
 =?utf-8?B?bWE5cWRaMGJReDZjVzRzYktXcW9FVWljMnduWVVkS012UFhQVUpLaDVMYStQ?=
 =?utf-8?B?NnNhWU4zUVZPSlJFbXVNbFdQdGhjTzZtNkNSSm9mQzNpTE5NV2l6NnZlMW9z?=
 =?utf-8?Q?+7Xg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3dbbc9-f579-4d83-7922-08dd71dcf187
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:53:11.8176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GK/DPWwjLLrT/pwdBfHAV7ZC0GCAg5yqD7tWI6EONDr+kGxonXFUZn4GZxsgk/gd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7555
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

Am 02.04.25 um 10:26 schrieb Tvrtko Ursulin:
> On 02/04/2025 07:49, Christian König wrote:
>>
>> First of all, impressive piece of work.
>
> Thank you!
>
> I am not super happy though, since what would be much better is some sort of a CFS. But to do that would require to crack the entity GPU time tracking problem. That I tried two times so far and failed to find a generic, elegant and not too intrusive solution.

When the numbers you posted hold true I think this solution here is perfectly sufficient. Keep in mind that GPU submission scheduling is a bit more complicated then classic I/O scheduling.

E.g. you have no idea how much work a GPU submission was until it is completed, for an other I/O transfer you know pre-hand how many bytes are transferred. That makes tracking things far more complicated.

>
>>> Lets look at the results:
>>>
>>> 1. Two normal priority deep queue clients.
>>>
>>> These ones submit one second worth of 8ms jobs. As fast as they can, no
>>> dependencies etc. There is no difference in runtime between FIFO and qddl but
>>> the latter allows both clients to progress with work more evenly:
>>>
>>> https://people.igalia.com/tursulin/drm-sched-qddl/normal-normal.png
>>>
>>> (X axis is time, Y is submitted queue-depth, hence lowering of qd corresponds
>>>    with work progress for both clients, tested with both schedulers separately.)
>>
>> This was basically the killer argument why we implemented FIFO in the first place. RR completely sucked on fairness when you have many clients submitting many small jobs.
>>
>> Looks like that the deadline scheduler is even better than FIFO in that regard, but I would also add a test with (for example) 100 clients doing submissions at the same time.
>
> I can try that. So 100 clients with very deep submission queues? How deep? Fully async? Or some synchronicity and what kind?

Not deep queues, more like 4-8 jobs maximum for each. Send all submissions roughly at the same time and with the same priority.

When you have 100 entities each submission from each entity should have ~99 other submissions in between them.

Record the minimum and maximum of that value and you should have a good indicator how well the algorithm performs.

You can then of course start to make it more complicated, e.g. 50 entities who have 8 submissions, each taking 4ms and 50 other entities who have 4 submissions, each taking 8ms.

>
>>> 2. Same two clients but one is now low priority.
>>>
>>> https://people.igalia.com/tursulin/drm-sched-qddl/normal-low.png
>>>
>>> Normal priority client is a solid line, low priority dotted. We can see how FIFO
>>> completely starves the low priority client until the normal priority is fully
>>> done. Only then the low priority client gets any GPU time.
>>>
>>> In constrast, qddl allows some GPU time to the low priority client.
>>>
>>> 3. Same clients but now high versus normal priority.
>>>
>>> Similar behaviour as in the previous one with normal a bit less de-prioritised
>>> relative to high, than low was against normal.
>>>
>>> https://people.igalia.com/tursulin/drm-sched-qddl/high-normal.png
>>>
>>> 4. Heavy load vs interactive client.
>>>
>>> Heavy client emits a 75% GPU load in the format of 3x 2.5ms jobs followed by a
>>> 2.5ms wait.
>>>
>>> Interactive client emites a 10% GPU load in the format of 1x 1ms job followed
>>> by a 9ms wait.
>>>
>>> This simulates an interactive graphical client used on top of a relatively heavy
>>> background load but no GPU oversubscription.
>>>
>>> Graphs show the interactive client only and from now on, instead of looking at
>>> the client's queue depth, we look at its "fps".
>>>
>>> https://people.igalia.com/tursulin/drm-sched-qddl/heavy-interactive.png
>>>
>>> We can see that qddl allows a slighty higher fps for the interactive client
>>> which is good.
>>
>> The most interesting question for this is what is the maximum frame time?
>>
>> E.g. how long needs the user to wait for a response from the interactive client at maximum?
>
> I did a quick measure of those metrics, for this workload only.
>
> Measured time from submit of the first job in the group (so frame), to time last job in a group finished, and then subtracted the expected jobs duration to get just the wait plus overheads latency.
>
> Five averaged runs:
>
>     min    avg    max     [ms]
> FIFO    2.5    13.14    18.3
> qddl    3.2    9.9    16.6
>
> So it is a bit better in max, more so in max latencies. Question is how representative is this synthetic workload of the real world.

Well if I'm not completely mistaken that is 9,2% better on max and nearly 24,6% better on average, the min time is negligible as far as I can see.

That is more than a bit better. Keep in mind that we usually deal with interactive GUIs and background worker use cases  which benefits a lot of that stuff.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>> 5. Low priority GPU hog versus heavy-interactive.
>>>
>>> Low priority client: 3x 2.5ms jobs client followed by a 0.5ms wait.
>>> Interactive client: 1x 0.5ms job followed by a 10ms wait.
>>>
>>> https://people.igalia.com/tursulin/drm-sched-qddl/lowhog-interactive.png
>>>
>>> No difference between the schedulers.
>>>
>>> 6. Last set of test scenarios will have three subgroups.
>>>
>>> In all cases we have two interactive (synchronous, single job at a time) clients
>>> with a 50% "duty cycle" GPU time usage.
>>>
>>> Client 1: 1.5ms job + 1.5ms wait (aka short bursty)
>>> Client 2: 2.5ms job + 2.5ms wait (aka long bursty)
>>>
>>> a) Both normal priority.
>>>
>>> https://people.igalia.com/tursulin/drm-sched-qddl/5050-short.png
>>> https://people.igalia.com/tursulin/drm-sched-qddl/5050-long.png
>>>
>>> Both schedulers favour the higher frequency duty cycle with qddl giving it a
>>> little bit more which should be good for interactivity.
>>>
>>> b) Normal vs low priority.
>>>
>>> https://people.igalia.com/tursulin/drm-sched-qddl/5050-normal-low-normal.png
>>> https://people.igalia.com/tursulin/drm-sched-qddl/5050-normal-low-low.png
>>>
>>> Qddl gives a bit more to the normal than low.
>>>
>>> c) High vs normal priority.
>>>
>>> https://people.igalia.com/tursulin/drm-sched-qddl/5050-high-normal-high.png
>>> https://people.igalia.com/tursulin/drm-sched-qddl/5050-high-normal-normal.png
>>>
>>> Again, qddl gives a bit more share to the higher priority client.
>>>
>>> On the overall qddl looks like a potential improvement in terms of fairness,
>>> especially avoiding priority starvation. There do not appear to be any
>>> regressions with the tested workloads.
>>>
>>> As before, I am looking for feedback, ideas for what kind of submission
>>> scenarios to test. Testers on different GPUs would be very welcome too.
>>>
>>> And I should probably test round-robin at some point, to see if we are maybe
>>> okay to drop unconditionally, it or further work improving qddl would be needed.
>>>
>>> v2:
>>>   * Fixed many rebase errors.
>>>   * Added some new patches.
>>>   * Dropped single shot dependecy handling.
>>>
>>> v3:
>>>   * Added scheduling quality unit tests.
>>>   * Refined a tiny bit by adding some fairness.
>>>   * Dropped a few patches for now.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
>>>
>>> Tvrtko Ursulin (14):
>>>    drm/sched: Add some scheduling quality unit tests
>>>    drm/sched: Avoid double re-lock on the job free path
>>>    drm/sched: Consolidate drm_sched_job_timedout
>>>    drm/sched: Clarify locked section in drm_sched_rq_select_entity_fifo
>>>    drm/sched: Consolidate drm_sched_rq_select_entity_rr
>>>    drm/sched: Implement RR via FIFO
>>>    drm/sched: Consolidate entity run queue management
>>>    drm/sched: Move run queue related code into a separate file
>>>    drm/sched: Add deadline policy
>>>    drm/sched: Remove FIFO and RR and simplify to a single run queue
>>>    drm/sched: Queue all free credits in one worker invocation
>>>    drm/sched: Embed run queue singleton into the scheduler
>>>    drm/sched: De-clutter drm_sched_init
>>>    drm/sched: Scale deadlines depending on queue depth
>>>
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  27 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   5 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |   8 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |   8 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |   8 +-
>>>   drivers/gpu/drm/scheduler/Makefile            |   2 +-
>>>   drivers/gpu/drm/scheduler/sched_entity.c      | 121 ++--
>>>   drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>>>   drivers/gpu/drm/scheduler/sched_internal.h    |  17 +-
>>>   drivers/gpu/drm/scheduler/sched_main.c        | 581 ++++--------------
>>>   drivers/gpu/drm/scheduler/sched_rq.c          | 188 ++++++
>>>   drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
>>>   .../gpu/drm/scheduler/tests/tests_scheduler.c | 548 +++++++++++++++++
>>>   include/drm/gpu_scheduler.h                   |  17 +-
>>>   15 files changed, 962 insertions(+), 579 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>>>   create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c
>>>
>>
>

