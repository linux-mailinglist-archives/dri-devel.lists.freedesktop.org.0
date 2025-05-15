Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A8EAB83D4
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 12:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B9B10E829;
	Thu, 15 May 2025 10:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lshKw8WU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156A210E830
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 10:29:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYWPKQ54H0HHeXfZJ+50T9D7OZp0JoOLRWQAif4FGGCGzAAxcYi22ix95rMIYMGT/zV+sjEKvmRp+ALo54GmS+E+Ipxgp82onzspCOdKEe234kRujEZ8IzXYEcNa51/xrK+LenWVDe/uylLv1hp4JrJZRM3Lwf+lBo+qpDbgtpuWkrbfmbTgfV4HBPgXFyX/gsub5BjyqA72SZjpIPGrXw5zKrpx98kR3n/EZfNl4F7JyeIOZm8c25E0t8xgHeMtTYHY/XpsKnfLFZ0HjjxjAUJ9VAQoyXVmkDF4RE+RtQ0zyz4l4EbkxT7cmUno00TumqeDme3wmENrEiiu3quz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yyas2n2fvpeeJes95u3AIkr9e8WxHGfNMHdhl2Kq13Y=;
 b=pUI7v4RmlCt9vHm+uC3GWnryksaJpmJRVojQp89HR3gowBzAix2jMNKoKDc6St8FiulhpBLOHrcppd8eDnlQ2ioFlvmILHwwdYSbhzFVz46Blg0PhYzgnLsAiXNlRs5ytCB7pOKEG2EDptUpUvnj2YjzOf+VgqK2IUn91NrPRAX5VUD7Gkp+ZACQfnSth3LjJn5x5AoQTVhFg6OAbO0xb6jGUbervPlffbuOH/IXupfcZ2ZWEmFyEP2lNbQqw6uFuZcCYa02wqS2w+gosXPMCGngR/KM/lHJCTAXnZdiVH0pkwnuOZkU4VIOvTsb5Mtn4cxK3I0jRxVGPNXoKsvx5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yyas2n2fvpeeJes95u3AIkr9e8WxHGfNMHdhl2Kq13Y=;
 b=lshKw8WUKlHkPUT1ZT1G4fFIdqoYvRAxF6QuMDiUId+ddLO7bdNo0hIQQgo5Jo1UUX3rLsETYGVaHn36twsbklbxH6gHDHwKyJbFecj4WZHerEiOMX5BiDuW3CkThpEimXgGuMXTCy52kB/puWHRmCvlqnw4LIZMYdwsTt43Td0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by DS7PR12MB8082.namprd12.prod.outlook.com (2603:10b6:8:e6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 10:29:26 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 10:29:26 +0000
Message-ID: <8bc605ad-54ad-4d3a-9547-caa9d15887f2@amd.com>
Date: Thu, 15 May 2025 20:29:16 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
To: Zhi Wang <zhiw@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050> <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <20250513130315.0158a626.zhiw@nvidia.com>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <20250513130315.0158a626.zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5P300CA0025.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1ff::18) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|DS7PR12MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: e314cf43-8478-447a-5271-08dd939b5d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTRuWHhKaFJrakJPMWJJQ3VJOUlKZkFmZFNFNitseFNtcnVEY0dJcGJpMi9a?=
 =?utf-8?B?LzEveHUzRjVXeDY2QWZtbzRFRHZBRGF6NmM2QmdySlVGZCs2UWc1eVVPK1F2?=
 =?utf-8?B?c3hJa2k1SzRHTzNIVTVpZ0xaTXdDUkZyZEVDN0Q2bFdnc1dhWUc3M3FEdHJE?=
 =?utf-8?B?aFF0bEI1N1ptS0VLMHpCOVE3b0ZZZWJvaGdCRTE3MXdHZ0RGWlRSbW1MUmpa?=
 =?utf-8?B?c2owUmNvdG5pdkVod1ZMWHhXU3k0QmNUN3M4QWdUZTJzSEtIWkZXMmZhTmgw?=
 =?utf-8?B?NmJKV2RKbW5DRE8rSTMvdWF3dGZGaXZrNDFRTnprK2pIV3FsNEs1QklCYzdl?=
 =?utf-8?B?bzgwUll3b2VqUk5jdmxnSkgwZ3ovejFScWtERUF1NHBGSWVjTGhLbHppN0Fo?=
 =?utf-8?B?MXdQVVpLbU93V1lKVjhST25wdEZWaFpuaEtJcEtLamRwbnBwQnJ4L2lVc1l6?=
 =?utf-8?B?SHErUkQvZ0FibThaSEk4MlBmcDArSmNsZC8wSzBGZ0dwZHg1dEk3aVlTcE5B?=
 =?utf-8?B?MXJtRHltYWc5L2RpRmYyckFuOEdJVTBLSEsrOEpzSVR4N1NIa2hhdVdMNjVP?=
 =?utf-8?B?Rk4xZU1kNnViaE9IUndzdGJWVzVuNTBxcy80cVpzT0ZyTnM0QUw5V1FyVzE5?=
 =?utf-8?B?blhQQzNhcTBUd2JXbFc5M3ErQWlBamorT1VqRUF1THhWQXZPTCs2b0VsVE9i?=
 =?utf-8?B?UjJ4M2VWZ1B1U2V3Y0JRTEVzL0N6Wkp3ME42TmVaVTgweTRvczVHdGRaaTAy?=
 =?utf-8?B?T3Q1R2RtczBMaWxFZkl4akc1V1NPZVhyM1dpUXlnUjJyQmVhdGxhZ0dhZjYx?=
 =?utf-8?B?dHR6UkhUQVR0cWpRSTJBbjFmd3RCR2d3eUdncmg4eUFFRFBjNWxzdXl5NWhI?=
 =?utf-8?B?SCtrQjJsTk1kNE13bnJUVTlNZHAxRmhrU1VXU2VTSWlINThwZjlmNkZXVitp?=
 =?utf-8?B?cDRldHg4QW9kY2h1Z2p3ZjNydmI1RFNjTzg2RUx0VU5VMThTWk5vQzdzRjRN?=
 =?utf-8?B?a3ZkczRIQkpIM2NOeGlsaWh6VVlFSmFScEdBUGhId1RyUC9qNDFjTmR1QlFO?=
 =?utf-8?B?Q1hNZ2hhVUhoTk44MXRDcnJpSCtjZ3ZxUi94OTdMVnFBZ1NiUWZxZnpNc2pu?=
 =?utf-8?B?OEttcjZvZHRWbEQwaDZzYU9EdTM3NjZxQWVESzB0T0lQU0V6Yitqc0pIRFQr?=
 =?utf-8?B?UjBrZjkvMjBja3JsSmtkZUwyamd2Y2lKcUdOZElGT2kvdHdiRkFWR2x4ZXpx?=
 =?utf-8?B?NlJQenNvYkg4eUs4QkgyaDFKa2FLL0N4VG84OVY5dHZPSG9iemNGbWUzZFBr?=
 =?utf-8?B?alM0c1RwcXpHRFMrcHJKY3pFRW1NZnJlYXNXYUlyVXFucExFT2tEZXdZSkgy?=
 =?utf-8?B?VTBTMlFKWUMyTEhBRzZhRWl1Y0RDUjFOQUNmeTR3cXk5bXhkcDJRVjkvSmRs?=
 =?utf-8?B?azYycUdDVmRNUGo5eXd3WjBmRFJuRUZmaHJkaEVjUy9kcHRwbGpFV3NLZXFt?=
 =?utf-8?B?dy9rWDRtRHVkdzkwanZWTmo5eTZpSUxPbXZsNWhnVlNnS2piekl5TkwzRWkz?=
 =?utf-8?B?ZDIrRUxEWTh0OERFajZtWlEvSmxkK0s3SE5XdlU4b1JscUo5YUdnZ0x2ZGVW?=
 =?utf-8?B?SmtlVHBMV2gxbE9iWjN0dTBBUGprZTU2MlpqcFMvSTRzREVwNmYxTThseE1x?=
 =?utf-8?B?NFRMcWplWEhtaDJrcnZUT2FPbzNXbG94OU9EV2FaTGlSMU1vekxFeE0zZzBj?=
 =?utf-8?B?UzhrYTBoY3RheGpmcnlUSVZMUmJDSVpLSThEbzcrc1Z6V2xQU2Mzd3RPc3NK?=
 =?utf-8?B?RlZuNXA4WWJLSVh6cjc4R29vUkhIT3RpZVRBdFRLNWhsZlg5dWx5YUxwZ3pE?=
 =?utf-8?B?MXBrZkpISG0rdy9mR2E1OTc1UjVEMnhOUGkzSmkveklTeUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUUwdlRvTkExS1RqMWxRMVdaRnZhMXBEVkJMMGFlRVFTUk5DdFhOalN1eUhB?=
 =?utf-8?B?K1RJanhFbVkzMUkzZkRpakhHanVaZGlZblhnSHk5UnJVUDBXNEZ4UDQwNmRG?=
 =?utf-8?B?VVR1bHBqTHVEQ3NCRzFjdE1FZno3SFQ4WldrNTQyZFZaZ1J4R0YyZGlqQUYx?=
 =?utf-8?B?V2MrZWJlSzhXdEVEdzdvR0FvQkVLVmRjeHVNcXFyQ1B4N1lDTXdhVDN3eW8v?=
 =?utf-8?B?bDJwK29ieFpadzBBUkNpejZ4Mk82NGNRQVlzQ1AvQU1CRXU3dGxWU2RKenFR?=
 =?utf-8?B?NjRrRzVrdExGYlJMTmVwY2tWWkVWS2FWU0xHbEVoR1FpWE9McDc1V1MwUUtD?=
 =?utf-8?B?R1Bsc2NmVDZQbUU4dTlndXN4RUFnSG94M09hZnc3alZPNUh2THJ2NThCWkVj?=
 =?utf-8?B?NTY4RGYvWmRFTmNiZW5xTGRVcEpoZGxIRjdMeGpxY1M5WVUvZ1FkVEhTZmI3?=
 =?utf-8?B?cW80ZDlacm91b3JKMGlrbzZIWXhBZHpsbFYwR0hVWXZ2NFdNaGdGWi9HUmRl?=
 =?utf-8?B?dklqNVFkekU2ZXZqQ0Q3Vno5cXdydS84OTg3TWM5R1JYWTVXVm4vbTE3aGY0?=
 =?utf-8?B?TXMwdEtyUnVMK0l5b2hEQ3VuSkl2OGZlQmVjYTZ1SE4vN2dKRHlGcFAvY0ZW?=
 =?utf-8?B?MGgvTVJ2TDFKb3JTMWdpSC9xRWhMVHpGZ3FrQzRNakhsUUovWVhhVUxrTnpI?=
 =?utf-8?B?K2p5OHJFUWJNV1FuMmY3Ty95d0tSa1BoSVdaaEVPQVp5clRJME5Zbzk4Y3VF?=
 =?utf-8?B?Zy9qWE5iRmluaXNLMm1CRW5ZSzhwdXRodW0zbjlWTGQ3NWVuK3BOVlB0ZVkv?=
 =?utf-8?B?WHdWWFJCczhIUm9VWUgveVIySk1nbHloc3VaWjBrVlBmT09XN3I5QzBsMWE2?=
 =?utf-8?B?LzQ2Ym8rL0Naa3FVV3hSUU83NXY5Ym9qWXBxZHY2THMyekdZTTVqbDllbVY2?=
 =?utf-8?B?ZzRkZjFBajFZMWk5NEI5VSt4Z0o2VjhlQmtqOEZFSmZtOElod0duN2ZwZU5a?=
 =?utf-8?B?a0JyNno0RFdPM0hNT0xUdGVYRWRLZ2R2UnNQWGJyNE5nb1ZSZFRHc1hnMklF?=
 =?utf-8?B?UTNKUXVyektVQ1BoSnVBQ0hpWmhEK1pQQWVlM2MwM0R6ME1XK2wrRmRKeEJB?=
 =?utf-8?B?OVUzZHBLdmR1alRNekwrK1BJR1FvVVA3VndHZElwYXVpc1RMZnpFOTNNR2Ju?=
 =?utf-8?B?b2ZSenVsVkkwTDFvY0pFTjFzV3pVbmJraEpVSzgwSTNnbUh3eG5sNnJMSlRZ?=
 =?utf-8?B?QkZKOUxCaStwdy9wenFURVl0T0xpR1BiRUlvOHZpR0dQR0U2L3NLWUxRTlh1?=
 =?utf-8?B?YnlUcWsrZ2VwQmhlRFFPdXdyZE5ybTVyYVl0ZWFkWDNLeDJSdHBzaTdJYllU?=
 =?utf-8?B?SytuamRZVWF2TzEzV0JmQWNISkZybjRnaU9obWpmV1BwWlFvaVpkOXF3Y2ts?=
 =?utf-8?B?ajJhc0RzWUE5SzJDS3JMZlQrNTFiT0JlUVFoN2szclJzYUNrVERCQUl5TEY4?=
 =?utf-8?B?RERqZ3ZYR2tKWWZvWWhJd3ZsRlFwYlZRQzVFR0ZlWEd3MGdvbFVPSVRVazRI?=
 =?utf-8?B?RUxjUU5rQWo4YVVFU01MRVRKc0lCZmRmZlQxYU54Q2tZWGplaTA3MjNBZDA3?=
 =?utf-8?B?WTVmV1I0M3hiYStOTERKZFdtY3RJTEV3MUJocEF0VG1kQUIrbFhhM0wvQ2tR?=
 =?utf-8?B?ZGRFc0RtdTdiTDlZLzBSK2ZzL2QrSHlJTTVkV3B4Q1RRL21CczY0amVWdWs2?=
 =?utf-8?B?VWZ4YnlGWUs4NTE2SGl0R2xOQnNoRU8vZk43N2Vwcm9TUDAyUjVLdnJ0d1BF?=
 =?utf-8?B?bUd2NmM3TnRDNzc5a1RCMUl5TVlzSkN2UTZPcDVyTHB4YzF6T1FtU05CYzBX?=
 =?utf-8?B?ZVNtKzlUd2daREZzK0tyckJZNUdUUlFBV1JOUzBGTCtkMmFQNlB2N25MRGdS?=
 =?utf-8?B?MTZuKzhHb3l3NmNGaUlGNHRXTFlzdFdjNnd5dDM0eTNDYWdXdkdrZjJzLzhl?=
 =?utf-8?B?WUVPQzc3QWhwaE1CS0I5TXRVZkhhOWdUcVJRME80YW9tOCtMNWJNQSttb05Y?=
 =?utf-8?B?b1BRRXVmUkQ5d1cvcGNzbGlqNVd3dXJwLzVCZVhud3VKVm9ldzkxUVJWZytK?=
 =?utf-8?Q?QVo8eLfClICpfOnbdihhXt6AQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e314cf43-8478-447a-5271-08dd939b5d98
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 10:29:25.9563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSnJhpSnGfKVIBJnhwl67ERhaTSs4sHXxMeWnjE76b8s2HrsVamOhPjX7C6i96ZrIb4+53FX63H8JLLICm1XFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8082
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



On 13/5/25 20:03, Zhi Wang wrote:
> On Mon, 12 May 2025 11:06:17 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
>> On Mon, May 12, 2025 at 07:30:21PM +1000, Alexey Kardashevskiy wrote:
>>
>>>>> I'm surprised by this.. iommufd shouldn't be doing PCI stuff,
>>>>> it is just about managing the translation control of the device.
>>>>
>>>> I have a little difficulty to understand. Is TSM bind PCI stuff?
>>>> To me it is. Host sends PCI TDISP messages via PCI DOE to put the
>>>> device in TDISP LOCKED state, so that device behaves differently
>>>> from before. Then why put it in IOMMUFD?
>>>
>>>
>>> "TSM bind" sets up the CPU side of it, it binds a VM to a piece of
>>> IOMMU on the host CPU. The device does not know about the VM, it
>>> just enables/disables encryption by a request from the CPU (those
>>> start/stop interface commands). And IOMMUFD won't be doing DOE, the
>>> platform driver (such as AMD CCP) will. Nothing to do for VFIO here.
>>>
>>> We probably should notify VFIO about the state transition but I do
>>> not know VFIO would want to do in response.
>>
>> We have an awkward fit for what CCA people are doing to the various
>> Linux APIs. Looking somewhat maximally across all the arches a "bind"
>> for a CC vPCI device creation operation does:
>>
>>   - Setup the CPU page tables for the VM to have access to the MMIO
>>   - Revoke hypervisor access to the MMIO
>>   - Setup the vIOMMU to understand the vPCI device
>>   - Take over control of some of the IOVA translation, at least for
>> T=1, and route to the the vIOMMU
>>   - Register the vPCI with any attestation functions the VM might use
>>   - Do some DOE stuff to manage/validate TDSIP/etc
>>
>> So we have interactions of things controlled by PCI, KVM, VFIO, and
>> iommufd all mushed together.
>>
>> iommufd is the only area that already has a handle to all the required
>> objects:
>>   - The physical PCI function
>>   - The CC vIOMMU object
>>   - The KVM FD
>>   - The CC vPCI object
>>
>> Which is why I have been thinking it is the right place to manage
>> this.
>>
>> It doesn't mean that iommufd is suddenly doing PCI stuff, no, that
>> stays in VFIO.
>>
>>>>> So your issue is you need to shoot down the dmabuf during vPCI
>>>>> device destruction?
>>>>
>>>> I assume "vPCI device" refers to assigned device in both shared
>>>> mode & prvate mode. So no, I need to shoot down the dmabuf during
>>>> TSM unbind, a.k.a. when assigned device is converting from
>>>> private to shared. Then recover the dmabuf after TSM unbind. The
>>>> device could still work in VM in shared mode.
>>
>> What are you trying to protect with this? Is there some intelism where
>> you can't have references to encrypted MMIO pages?
>>
> 
> I think it is a matter of design choice. The encrypted MMIO page is
> related to the TDI context and secure second level translation table
> (S-EPT). and S-EPT is related to the confidential VM's context.
> 
> AMD and ARM have another level of HW control, together
> with a TSM-owned meta table, can simply mask out the access to those
> encrypted MMIO pages. Thus, the life cycle of the encrypted mappings in
> the second level translation table can be de-coupled from the TDI
> unbound. They can be reaped un-harmfully later by hypervisor in another
> path.
> 
> While on Intel platform, it doesn't have that additional level of
> HW control by design. Thus, the cleanup of encrypted MMIO page mapping
> in the S-EPT has to be coupled tightly with TDI context destruction in
> the TDI unbind process.
> 
> If the TDI unbind is triggered in VFIO/IOMMUFD, there has be a
> cross-module notification to KVM to do cleanup in the S-EPT.

QEMU should know about this unbind and can tell KVM about it too. No cross module notification needed, it is not a hot path.


> So shooting down the DMABUF object (encrypted MMIO page) means shooting
> down the S-EPT mapping and recovering the DMABUF object means
> re-construct the non-encrypted MMIO mapping in the EPT after the TDI is
> unbound.

This is definitely QEMU's job to re-mmap MMIO to the userspace (as it does for non-trusted devices today) so later on nested page fault could fill the nested PTE. Thanks,


> 
> Z.
> 
>>>> What I really want is, one SW component to manage MMIO dmabuf,
>>>> secure iommu & TSM bind/unbind. So easier coordinate these 3
>>>> operations cause these ops are interconnected according to secure
>>>> firmware's requirement.
>>>
>>> This SW component is QEMU. It knows about FLRs and other config
>>> space things, it can destroy all these IOMMUFD objects and talk to
>>> VFIO too, I've tried, so far it is looking easier to manage. Thanks,
>>
>> Yes, qemu should be sequencing this. The kernel only needs to enforce
>> any rules required to keep the system from crashing.
>>
>> Jason
>>
> 

-- 
Alexey

