Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95888AADFD1
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 14:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0E610E7A9;
	Wed,  7 May 2025 12:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TrIiV7fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672EA10E7A9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 12:54:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axZeecIi70NnvT61JDphqEGMkqM6yiXMmR0lKNAoa1cfrM/WtxoZ0oakqY/DGI1A4B3ki1pBFjoQHuB8HvUP6m7yZjdS5DixWjdmFfai0UUt/6/8E6kCZhxaZoA3/LFXxKpwvCe7bj3/Ka0nhcXySCQm6NrEYMwydZrngzYC5+dNdgvX+LmHExLQBTnoGG3Ch138aQJT7bLvHOk7O77rbTS9l+YWN5LpKFFg+vd8OdRbyBd6lHxOhdkR66bgbODPBp2wAKBYUAPPvLHWdJgxgzv2XlOBAWZhPw0B0/FMlxNaKzUm4FNibHnGcVDaxYo5cMYb2GC9dF/OMHqOIgvVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZmkKTQYykc4sQLaMameXISYzp3WlV2XZHv0iJEhbNo=;
 b=xOzYkxmqnTNRnGVxrLn/kbszw633+YA8Ce1T7AeSY/7p3eCDphxMI5m2uEAo7jpfra40zEGh879J9or5mVHGldJyatC0zvAInlJrEl/0Y4LhEdu/+ZH2MjOkqm/S3C5whKQl9vAOglz2wnitVR3hzFJ9d6iyRpTK9UoG9NS0rWqiS/cZVL5pLAvr+iXLKK8XGeJKiMO/bAw1UkI7zv/isp4Q8xhxpAfTfp4EXRV1sT2gDMU6EJxlRsd9S35aDgq1Hk5xG6NLBvb3R/xNfNKCGXMASSCkdMBa7AK729zNYMWclTvzpaxwoE8vbkxKVoeNR9vQOXaALBubrcdnGcC5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZmkKTQYykc4sQLaMameXISYzp3WlV2XZHv0iJEhbNo=;
 b=TrIiV7fyxk5xMV2Bm0WY5UHs5gjtlz/5lGZ+/r/P0HxV+EkRmWrEFKls8DQafPdcbH5GIamPNHI9qrmQBmDHXQjHelxHUCKgPzHRB9MZHWlanaR78NcSp67q5hE6DTzfzyzvfNXD29TPoLl+vFMilXdj/HY704w32+iCrFlRmg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5686.namprd12.prod.outlook.com (2603:10b6:510:13d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 7 May
 2025 12:54:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 12:54:32 +0000
Message-ID: <67697ca1-e18e-4f9e-a315-43957e71dbef@amd.com>
Date: Wed, 7 May 2025 14:54:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/4] Some (drm_sched_|dma_)fence lifetime issues
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
 <29b27ae3-de56-475d-ae85-fd593a011ea3@amd.com>
 <e4acf86d-ff22-423d-9769-80316fa96cb5@igalia.com>
 <ff76a94e-97cd-4d19-a02b-cf2a1fc00ac8@amd.com>
 <67a89aac-5eb6-46d2-b456-32e9f3e72f09@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <67a89aac-5eb6-46d2-b456-32e9f3e72f09@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR01CA0058.prod.exchangelabs.com (2603:10b6:208:23f::27)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b4e4f8-c73c-40ad-c88b-08dd8d664fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUFreUVYT2RtOU1NNkRiVkZ6NWVkeXBNcVcrbGxvTnVaTzliM2N0dk1VWFNL?=
 =?utf-8?B?aS94NS9VaFdNR3dvTmxBd0FIMHV1NlUrRHM2TU1HZDY0RHlGYWlHbDFIUkpn?=
 =?utf-8?B?cUhOd2ZIVUJMZFZ1K0NlcXNidnRFQzBFM2YyekRSSzVnV3JGRTRLc2w1WjNo?=
 =?utf-8?B?cmFWNUwxZVBHanVMYk94T1dWNkUvVnZrSThZQ2xkRHFzaHp3TTQraFJ0cXlY?=
 =?utf-8?B?dXg1L1ZwVzFkRElzNUxtRmc1K2JuN1lmdktDMlIwSHBGV0JoeVI5NHI5QnhV?=
 =?utf-8?B?T04wZlZJdDZQQk5hUmJ4NE1ZN2p4R05VRllhK3Zacy9KU2Q1V2VCM09FY0g2?=
 =?utf-8?B?ckE1V3hGOVVDdU9zRW9Va25jalluS25iK0hoQnA1U2o1UmJyb1dsOCtHcTdq?=
 =?utf-8?B?YnJNMnpEWmdhN2lMV2JSY08ybkpFeXZzejVPYjkxZi9kRFcvQUVvMHAxMmtY?=
 =?utf-8?B?MXowME9YS3JBTzYxUUlJTlRYMkM4NU85ZTZLNjNKME4vZUo4c1V6b0ZWbVVi?=
 =?utf-8?B?YmRvK3ZGVzRSYlhDbUlrdUI0bnF0eWRQTmo0Q2NjV2Z1clgvYzBRdHAxVjF0?=
 =?utf-8?B?MU1LelVNZGllV0g4OUFIaTUxTEZCakpiRUVid09SbnRZbFRjK0RKZUVUVEdj?=
 =?utf-8?B?eGdDOEdaN1ZjbGJGYmZJMTdwcTFVWVI4YWYvTElSL2JhS1N3aUQ3akhsZWRl?=
 =?utf-8?B?elJMNC9tMWxyOFhVRVlSSkVXaWF1V25neEpQd1JUbHVyejJuMFZHV1h5L1lq?=
 =?utf-8?B?Tmxxa2dLdUF6U252UDF6ZjFzUjFPN2Zyc2M4SEh3NU5jREE5clRQTWt6WkNF?=
 =?utf-8?B?WStzZkp0Qm1sYUNaRDEreXJSSW1vNDl5ZkNOMmJuZFlzNkhMeFJ2ZzY5SFBq?=
 =?utf-8?B?UWs3SDhuOWo0aTltalBKbEtTaGJpYU9xcGVDUWYyZ0dWK295cStvTllsZ3lp?=
 =?utf-8?B?T2xmb0tJcis3ellSOWxYalFSbGgvWXMrMHZ5bUpJUmtFcEJpenpRUktiZmg3?=
 =?utf-8?B?V2ZHUTFvQkJwenVZZVVpSCtqNFNRc1dRRitqMytqMUVMY2s1aVVmQzM2YUx5?=
 =?utf-8?B?OGovcitCMExrNllqK3I1RUJlMlVBdFBJclNDNzUrWGhiT2gwMFJ0QnR1NCtr?=
 =?utf-8?B?bm1PcFRkaytsRFV1Qjh0TjFTSXhtSmpVZEg1NG5TME5Odis0cUR6TURlVUxy?=
 =?utf-8?B?K0lRcDd5VUhnbjFrUlpiREhRWWtFckczUXc0T1RHL1NyR01tZGsyWEQ0NG01?=
 =?utf-8?B?Z3lqUWlnaEdBaElPYXE4V1hua0JoaWEwa2hHdjBGQXRmMUZUSjhyQnZjUlAy?=
 =?utf-8?B?U01QVkc1c2o3ZWltK3V1U0d0RHFrQ1dhRDFQMmFsbjZleXhab0JsVFBJUHAz?=
 =?utf-8?B?WmllUURvVmVRcTVzR016RzNhem5IMklWbytoRXg0UjJIOHg5M1dCYktTTm4x?=
 =?utf-8?B?REVISXVwSXQ1OVJyZHBObnBRMGZreDdJYW9Nc2hudVJ0Zmtvam5aODloTjZ6?=
 =?utf-8?B?V0VvVU1jK01IZnJzdUp5NHRDT2FLWURJRWF2VXhUWTIySS9wRGFJN3R1RnFq?=
 =?utf-8?B?ZFVLRXY1L0hXREtWWXB5ZUo1ZENpOEY2bU9GSG56K0tjQ2VsSHdjSk1kOGpE?=
 =?utf-8?B?bU84OUtOT09mRkNnL1l1MjB1UmhzMkczWTM1ZEU5Um5GVk1wTklmc0ZhWGFz?=
 =?utf-8?B?eVJTcElpdFRROC9ScXRQUkUxV2taaGVEKzdPdEtpM2M1ZjQ1QTFsQ2V3RXQ3?=
 =?utf-8?B?enJoMTZJamFlK2lYVHhFd1dmUHZ6cisvUkhFQmtHV0tDdXB6bXdiMGZHeDZx?=
 =?utf-8?Q?5RQTAIKGjn15P5giPzfW1CSVWTa7wVEcjKfNQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anFuRmVsald5ZDFta3BpM3dWcmxkczNEU0N2eXJTRkt3RlFnWmZOQUhtSjA5?=
 =?utf-8?B?QUN6WUh6dy94TjJCT2hKV2ZCZUluS09UbVpSbGxEYTgrcFU4VElXWElmcWEr?=
 =?utf-8?B?VlJmdEFUS1pBc2Z0WTY5d0tQeU9jK1crM3JqRDRFZDBrWnNncWs5UzNIaVB4?=
 =?utf-8?B?dU1KU1RXa0lrMGhoYWlvZ2UyNm5sWXUxVHVJN0xabmxjNHRid240Nk5oWld5?=
 =?utf-8?B?N1NFQXdQSjJVbGwvSmNCbC9xZGdvcmFkY2xKc0xQMW1tbCswOW4ybzQyYXIr?=
 =?utf-8?B?TzJtMU1SYjVzSUtlMCtWWWpucHFaTnN2UzB0bjhuanNaRzFEV2E3aFNsQlZ1?=
 =?utf-8?B?YXllTEtVOXV6TEZkMWI5M2tJa0l3c28wc296THFudkpwMFFtMGF2bmU5MlN4?=
 =?utf-8?B?aGx3Ynd2VXIvOTZlQml5QjdEZVA4NmNTdHc5SG9ZNVlUc1l2QVhISnYyWG5t?=
 =?utf-8?B?RTMySnB2S1ViNFJZak9leldPbVBWbXdWT0NNVXUzRURGRFN4NUMyQmVxNjli?=
 =?utf-8?B?NjNFSmtnZ0NVVHd2S1VVbTVUa1d6QnMybXlYcExYMkM1RWl5WllOYlZ1SE8y?=
 =?utf-8?B?RDcrZGg1RDJCRXJIK3YrSnduNWlQd0FwMklzMmQvay9vYkt6SXkxNXJGS0Qr?=
 =?utf-8?B?aUFOVlR1eDBJK0g0cERPVTlraWFhcXpuUmtGUEQ1NWpjK2U5UisrWHVMWDY4?=
 =?utf-8?B?elhoQnI1amdiYUV4YWVQamhyc1poS2dvZjN0VXB3Tk04akNoMTlLcEtZMWpO?=
 =?utf-8?B?ZWUvc3hkb1VOWGh3bFpROVJBMTlWUjE4dnhjS2ptTzZERktBT3RNckJKZkVD?=
 =?utf-8?B?c1B4ekhIWXJvcWtqVWFKb3VsR1JCQmtQTXNZaVZ3Q282SkxlV2RHQ1VVbnRn?=
 =?utf-8?B?T2NEWlUyOHJrWUUxL3dkYmpuYURQOC9zWWhkTlBaaVpHTzhqVC9kVHhDY3hT?=
 =?utf-8?B?V3c4akNWcnE1STBIcXY4NG03WGpjbFhtMVJqbDcwaVJybkRrNkkyemw1WmdJ?=
 =?utf-8?B?ODg0VTRDUXlCcTVYMEFBOWRDZVdmTTdyc0srdlQ5VUdiNEtxVTVKY2U5VDBT?=
 =?utf-8?B?S3p1Q1Z0cnBieDJQN2RKbHcyYmtDRlhLSmhUOUpIWll6SDh2c2xKYXBYaHc3?=
 =?utf-8?B?c0U4di9QMWpNMHRMMzBqT0R5Z256VGkyMnNvQlZKU3cyWXNjb0lTZ2tKRnFX?=
 =?utf-8?B?QmxDK2dyOWJibk12YkJ5WGZpV0tmYWMxNHpWOC92SjlBT1VlWFM4bzhJK0oy?=
 =?utf-8?B?NDR2ZkZiTnU0WlRKYmtONjhZQlVZb1dLaFZjZXRFWjkvYk5ZRUV5NXVTSjNw?=
 =?utf-8?B?aXA3VmpPR292WXZYQUNXeG04azBmOGt5RUsycHZtcy82ektlMTYwNHRrNE1s?=
 =?utf-8?B?UEV4bGVOKzRGNGphWWpERUo5dVFvVWJXZm9vWXd0UXgxd0VUWTdQRXhkaGpO?=
 =?utf-8?B?MCsrZW5wUlZzNGZFWndWOWZuZTF6SEFmWk1ORCtiUWkweXVoMmVEcDVacS95?=
 =?utf-8?B?UHpLYUQ5TE1lRytEYmxtTkpmdTVPa29qenVIRkgrMytTZUlFVU50NzFWaU5s?=
 =?utf-8?B?SmdKb0k5YUdvQVhDUEpzQk9WUGo4cmtRa29NRVU1bEFsRlkwV0U5WHRzbGt4?=
 =?utf-8?B?b1ZZUWQza3JuTDRGNGhRT3pQQ0JJUkxCdWFMdUtiY3gxRE5PenNzbUVkMFQ0?=
 =?utf-8?B?eDVKS2Z4RFVVQ2V6dmsyT01Bd0V5Y21VMGc3R01VN3lLMzlYUzVoWHB6T0ll?=
 =?utf-8?B?MVltS3BrYUtKVnVxZ3hKZlBXaFNVODZPY1o5YmMxd2M5WkZnRjdVbDcxZllB?=
 =?utf-8?B?bWMzTFVvMkZKVitNaDlEQ1Nyd2pGaVlkdFFhVFVlNS8yODBMZkdYcFo3SlNP?=
 =?utf-8?B?alhlSlBNbFpjOWZ2MWw1MXM1c2RkdE80VTNNcjlVckJmRmZvTXFrVUR3SnBM?=
 =?utf-8?B?NHdGNFhBaWpaT2VuM3J6eFlLWS9NUXZDQWxDamQrRmdHRTJYU1dXVERMeGxj?=
 =?utf-8?B?cWg0d3lJdEo0ME9Rc01UT3FGdFlSRXAvQnFCc3g0Vll2K2lhMy82R202b0xu?=
 =?utf-8?B?cm9XSlozTkdxMnJyN3FiTzNsMmo4RGc0UGxjYUJXTCtZeTBBckloOGxwMThp?=
 =?utf-8?Q?9gYEx3RDhozEjzvonUx7SkOfH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b4e4f8-c73c-40ad-c88b-08dd8d664fde
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 12:54:32.4147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMb2TSRW+D4vNV6dcbQ+PfV0AeBdM0kwgx5/drnEgK1YDNIvp2ZxGzIfGWzO7X6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5686
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

On 5/7/25 14:28, Tvrtko Ursulin wrote:
> 
> On 28/04/2025 14:15, Christian König wrote:
>> On 4/24/25 09:07, Tvrtko Ursulin wrote:
>>>
>>> On 23/04/2025 14:12, Christian König wrote:
>>>> On 4/18/25 18:42, Tvrtko Ursulin wrote:
>>>>> Hi all,
>>>>>
>>>>> Recently I mentioned to Danilo about some fence lifetime issues so here is a
>>>>> rough series, more than anything intended to start the discussion.
>>>>>
>>>>> Most of the problem statement can be found in the first patch but to briefly
>>>>> summarise - because sched fence can outlive the scheduler, we can trivially
>>>>> engineer an use after free with xe and possibly other drivers. All that is
>>>>> needed is to convert a syncobj into a sync file behind drivers back, and I don't
>>>>> see what the driver can do about it.
>>>>
>>>>
>>>> Yeah that topic again :) The problem here is that this is not a bug, it is a feature!
>>>>
>>>> IIRC it was Alex who pointed that issue out on the very first fence patch set, and we already discussed what to do back then.
>>>>
>>>> The problem with grabbing module references for fences is that you get trivially into circle references and so basically always preventing the module from unloading.
>>>
>>> Where "always" is only "while there are active objects from that module", no?
>>
>>
>> The problem is that dma_fences stay around after they are signaled. And basically all drivers keep some dma_fence around for their resource management. E.g. amdgpu for the VMIDs.
>>
>> This means that some dma_fence is referenced by the module and the module referenced by some dma_fence. E.g. you are never able to unload the module.
> 
> Are you thinking truly never or for as long someone has a reference?

Truly never. It's simply a circle dependency you can never break up.

In other words the module references the fence and the fence references the module.

> 
> For example while userspace has a reference to dma_fence via sync_file fence owning module would not unloadable. One would have to terminate the process, which granted wouldn't be easy to see which process prevents the unload, before driver could be unloaded.
> 
> For the foreign fences kept around in kernel space, that would be solvable by some periodic house keeping at worst.
> 
> Also, about the use cases for module unload. Since you and Brost especially seem to be expressing a hard no to module references, what are the use cases you are concerned about?
> 
>>>> The decision was made to postpone this and live with the potential use after free on module unload until somebody has time to fix it. Well that was +10 years ago :)
>>>>
>>>> I discussed this with Sima again last year and we came to the conclusion that the easiest way forward would be to decouple the dma_fence implementation from the driver or component issuing the fence.
>>>>
>>>> I then came up with the following steps to allow this:
>>>> 1. Decouple the lock used for protecting the dma_fence callback list from the caller.
>>>> 2. Stop calling enable_signaling with the lock held.
>>>> 3. Nuke all those kmem_cache implementations and force drivers to always allocate fences using kvmalloc().
>>>> 4. Nuke the release callback (or maybe move it directly after signaling) and set fence->ops to NULL after signaling the fence.
>>>>
>>>> I already send patches out for #1 and #2, but don't have enough time to actually finish the work.
>>>>
>>>> If you want take a look at nuking all those kmem_cache implementations for allocating the fence memory. I think that can be completed completely separate to everything else.
>>>
>>> So enabling dma fence "revoke" so to say.
>>>
>>> Just to check we are on the same page, it is not just about the module references, but also use after frees which can happen even if module is still loaded but any memory reachable via dma fence entry points has been freed.
>>
>>
>> Yeah, that came much later when people started to use the scheduler dynamically. Basically the sched pointer in the drm_sched_fence implementation becomes invalid as soon as the fence signals.
>>
>>>
>>> In that case, as Matt has already asked, if you could dig up your unfinished work it would be interesting to see.
>>
>>
>> This is what I already send out: https://gitlab.freedesktop.org/ckoenig/linux-drm/-/commits/dma-fence-rework-enable-signaling
>>
>> A bunch of the cleanup patches in that branch have already been applied, only the last one is missing IIRC.
>>
>> And here is a WIP patch to decouple the lock I wrote halve a year ago or so: https://gitlab.freedesktop.org/ckoenig/linux-drm/-/commits/dma-fence-rework-locking
> 
> Thanks!
> 
> My concern here is that to me it appears the whole premise is to leave fences dangling in memory and somehow make them safe to be accessed by importers.

As soon as you unload the last module using it the fences will automatically be released. So I don't see the problem.

> For starters this can create permanent memory leaks. Or at least for the same window of duration as would the exporters be not unloadable with the reference counting alternative. So we would not a strong argument for why poorly bound memory leaks are better than poorly bound unloadable modules.

When the module unloads it drops the reference to the fences ultimately freeing them.

The only issue is that modules can both reference their own as well a foreign fences. So what can happen is that you have module A which references fences A1, A2 and B1 and module B which references B1, B2 and A2.

Now you can't unload either module first because they cross reference their fences and unloading one would leave the other module with fences which can't be released without crashing.

So what we need to have is that the dma_fence framework guarantees that you don't need the fence->ops nor the fence->lock pointer any more after the fence signaled.

> It is also a question how to "revoke" fences safely (race free). It sounds hard to me. It does not seem you got to this last problem in the above branches so I don't know if you had some elegant ideas for that.
> 
> Maybe first to ask if anyone is aware of a precedent where something in the kernel already uses this design pattern?

Of hand I don't know of any, but the problem sounds rather common to me.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 

