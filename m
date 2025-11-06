Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D881C3C8DD
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E7210E956;
	Thu,  6 Nov 2025 16:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0ZnJL2m3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011070.outbound.protection.outlook.com [40.107.208.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9F610E955;
 Thu,  6 Nov 2025 16:46:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNaxYBOjoEJEIiRbgiyuhj6nCPen2Ef14/fUpezEc1JmrNZ8Yiym+lkmkydN6gMSN0QmG1xT/c0F+8vBCBsQUpLw2+0Fc9fWpkmXaplZOb599fZPO5ycmoPEUBnmOKpApFM1QHH8JSaoQtGNUwBvb7vAdkgyrVOmSYDRfEvstQzEau/1Qx6Hy35LoPrqW8Cq+cjg2m+Sg8dsTGCT12RR0gRoiky2ljjvKWAzfhosQKwwtFY0AAVSkfMI+y5QKIUcg6qS/afWxEev15pioN6FuJvCYF+LGQhgEdyhVFs6dAX48RvhnrZnSs2iQoZJXeVcyaMoM+TVyabht+PxjoxLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqylX1TFN3BBd4XC+iw7S4W/u1dNY4x4cEmpNm+9Mfc=;
 b=VPkkq/vstzz0xRFyj+WYDZon9qNICrIPdhHOMvDt2zuuovPwf9cJ4uQcvFswoKEHQukfwX0ShOpMBvEtJJWuNS6VNV7zsVQy1Tgt/APGBYgxjYSQCNFayApPKfhS+EriygDUDb4Idj+KpJLwb7jsD/gxvOF2P0s/gRwh62puCao2tUZG/r/xposvHCgutshCdgWliXavHDEpvfCtNu0qaSbq9dIinGGwBmt3NLi8LSe82062gjmz68O8vPlh7NYLVvj7AFErYFts/bqVf4MZI+nTH6tmxIkjN2seTl5MIVoGUR4U8xUr2adNgJdWzjhrgRJ0F7EGu0e+/tLxsWUeqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqylX1TFN3BBd4XC+iw7S4W/u1dNY4x4cEmpNm+9Mfc=;
 b=0ZnJL2m3TRx7UMcipRnsN3k4/M4T34QOfpi33gWc+Q3iVWo5uQox6l+9Basp3Up5HCnLbkPu2Z0xe2SJeZxEp9W6taOrj5TvQhQA22PrEemr+yUFuNGXSeXVJCqo3CoMGEiUfqsyGhzKPG/YbEvXkqHFODbFHPncELprkKE0DPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6119.namprd12.prod.outlook.com (2603:10b6:8:99::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Thu, 6 Nov 2025 16:46:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 16:46:43 +0000
Message-ID: <9484fec0-ca36-4968-9edc-ca517825fe68@amd.com>
Date: Thu, 6 Nov 2025 17:46:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] drm/amdgpu: fix KFD eviction fence enable_signaling
 path
To: "Kuehling, Felix" <felix.kuehling@amd.com>, phasta@kernel.org,
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net,
 airlied@gmail.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-12-christian.koenig@amd.com>
 <febe733b667c1700333044bce8649c6520d69148.camel@mailbox.org>
 <5a770cba-9fbb-4645-a987-afe25e446942@amd.com>
 <887de3dc-f6a8-46c7-baef-862fe1acaf02@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <887de3dc-f6a8-46c7-baef-862fe1acaf02@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c48ede3-7415-4f65-383c-08de1d5410f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjdSWHJNTXliMXk3US9PM1ZNckxjTVRzbWxuc1Z6UCt6NGg4emc5ek1OZnV1?=
 =?utf-8?B?dldoc29CRUNON3BtTlYyRldXRU9iV0tZdnVzaGcxUGhNUDBkVlBsTEVTcDd0?=
 =?utf-8?B?VVpzdE0xQmtBV04zbjZEeTJVSXRUTFpKckJwRmJlVFJ2L3NmREN5OCtuazZR?=
 =?utf-8?B?S1Vock8xWTF5ZjQwSFM2MUhWcUFQTnJmZ05aMTlQRkh6MVlLQ00zRk8xYzhW?=
 =?utf-8?B?alR3M3ZUU1I1RmZUd25PM0lwcE9Ta0xKZVBDdTRKaGxpUDJuRmltb2syZkV0?=
 =?utf-8?B?R3ROZkZMaDNSMURrY3FPS3BWdy80cDBVbFNCSDhORkdSOEZMMkh0THVRMGhj?=
 =?utf-8?B?ZHg2NTJJblBxOHZ1QVVGdEtOTVRIZTNSSVl2OHhWb1ZnemtVaE9rQTlkVVd2?=
 =?utf-8?B?YXdLdTlSaWRmZzVwbkJDWnBFZHZPR0U4WWVPRXNseElDd3dvVkh0WUQ5Q0Q1?=
 =?utf-8?B?dHQ3OWxucmsyUUZoeGYzTCsvVXRkMlp5ZTg5TjVsdGFmakpLWm5zMHYwQndL?=
 =?utf-8?B?a05FQkFPSGoyR2lYRkJRaThub2czUVRhcnJIWkVKbzAveEd6dzZXSDhBQi9j?=
 =?utf-8?B?d2laUDNqYy9nSndNZW80cFVZTTc2dEJiaEFva3ZtU3d1M05VcFh0MXVBUlpj?=
 =?utf-8?B?eXZFc3ROazRvc1FwUExvWFNtdm9Na09QRitIeVFzbTVGWlpsNllhd29kOWVH?=
 =?utf-8?B?dkJ1V0dtdnl0SEVaTC9aUUdYaWdrbUJZck1FOVFldWFYQTVVUmYrWWxtUjFY?=
 =?utf-8?B?c3BFMmhqaERPSjNnYnU5d25QWDZzZWQvTnY4NHlxNml3QzlaTURLMlNaeXhR?=
 =?utf-8?B?MytneEFIT3JzVm1zSnhuS25ockYvU1NjdHdmMDIyamxMN0drOHZ4S3pINFBS?=
 =?utf-8?B?Y1lSanF0c216RzNqcmZoaDJ6bWdXTzRPZW5lTnk2OEIvTnlzTGhGbksvWkZP?=
 =?utf-8?B?YmdycGo4NEVSMDFYQkN6c2FndjVhMUo4eTVEbklwWkVTbTdMZHpJbWJHVFVr?=
 =?utf-8?B?SEJvQlhWbDdwRmF5NmRPTVF6TytPQW9jRkpabUt4dENoQVdEQUg0WWZLbVpU?=
 =?utf-8?B?Tk5xUDNWNE8wQ21QRzRZV1Z3N1pqQ3d5aHZiMlQxaVdaMVdIZnZDZFBBN3ZX?=
 =?utf-8?B?a0dKTFppblhFVnZtTVRoY1JkWTdDcVpzK051ZitsZE1EZ2VLSXYzeEZsdWp5?=
 =?utf-8?B?WkkvSkNSUkFnaHI1WVVBZHEvUDVkMFgySGZiTGlpSnZYSE8wLzYyb2tKeDI0?=
 =?utf-8?B?MEtDUmkxdUUvNWtrcXJOaitZM1IrejFCNFpVQzQ3emdqbzRNZzgrUWc2dFFh?=
 =?utf-8?B?VVY2UUdYTHRiSWJXRDF3NDR5ZnZUZ04zd3Zua1RjVmZBaTZqV0F5TUhsRmZx?=
 =?utf-8?B?WTJycU1DdjJyTGhXZnN0THJKSzVhYTh0SVJmMmxMTjBZL1pnb2FYS0ZDa0xW?=
 =?utf-8?B?YWJCUUk5Rm11UnRadmk4dUJ2aDhyMXVXTzhHcHphU1NyN3l1anQzRlJIQnRp?=
 =?utf-8?B?Vzc2bjVIWDVuZXV2Zis5TTZIaGJVN2g2Ly92TmlRbDFDNjQ0U0dvZDFPUGUv?=
 =?utf-8?B?Wm93L1UxMDFhQUNSWm8zaTh3bGxOa1J2azM1dE1MY3NWRGF1K2lXYW5EZldr?=
 =?utf-8?B?TlpLMDBubXNjdUR6bW1BZzF4N3FzSzJKb0NNQUMyRGJOUjJPRXdnc2VJKzVl?=
 =?utf-8?B?WWE3RStRYlliWENTMVoyK1pRZkZhY1BMcDk1OUJ5R0xwQVBXR2l4T1k1KzYz?=
 =?utf-8?B?OUE1WHY1WkYxcGloaEpBSmxaYWpWejVnYmJ2cDVIOEdaY1ZtNVRSWGdML09W?=
 =?utf-8?B?aXA2VFpySzVGaG56V0NzTW5zMTFjekVDc2taTjNpTVFxc2UxdTl3RmJVU2Zj?=
 =?utf-8?B?Y3NyMmIxMytlMkcxbTZtT1JyZnp4eFdPa3RiVUM3aUM0WWFvNFNJTGVkb1E2?=
 =?utf-8?Q?ApdQriW2zGqJLBTu6f+92iQbGdhJu1gK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djdWZ3NXb0RpUERhbFpRdzEvTXBmbERQQWxpaERlbC9DSjFsUDhkNUt4dXNp?=
 =?utf-8?B?aTF3NFlTMjUvSGtHQUE4UGJubUNvMkVhYWQ0aFhUMS9YQjVab2lmbjJub1pQ?=
 =?utf-8?B?T2Q5R1JGVWVCYUQwN3pLSVRvRGlpS2duMFNtMGZNU0VtWTYzUENaQk91OEo1?=
 =?utf-8?B?bWJocVRoTXhDVlBNcjIzSmhvd3ByVXgxTVFMM0VZanFubVQ0ZjhKSnNNZVRq?=
 =?utf-8?B?RFo4TkcrUjNKNGVCZFo5cnpzTkhoNXVzQlEwVTNNNVF3NDNscm9temdqcUts?=
 =?utf-8?B?NzRiejRSMFl6dHAyZ2Zjb1lwK0gvTWY1d3lJeDUyZUpFb0svMXp1dVBrQmg3?=
 =?utf-8?B?R0c3RjVrd3cvaXUvOVJiRDFpRFozZ3FiMEcwZk1RUzRmZFQxaFNsVHR1M2Vu?=
 =?utf-8?B?NGZWK2kvRm9iTnRrbG5hWjdTN1ZyOXEvUEg5S1gxNUJCSTB5NmNacU5zUm9h?=
 =?utf-8?B?RWdJYUUwTVh3ZTFkbmM2YzhXenVydnJsUGI5d2xHc2YrdGcvV29rY3NBc2lw?=
 =?utf-8?B?biszOTRBU0lrZVlWaXYwUm9OaTMrNWwwVDdUaDdraDloamxnT3UwN3FRYkF1?=
 =?utf-8?B?Mll0a2t1UFZDRVViTDlZRWNnY1cxZG9CNnJMVGVvckFVTldYSzNDekdFS0J2?=
 =?utf-8?B?dFYveTZBVzJCOHYvdElNRVdUQWlFdjZjQjRsU291SE4rWEZPdnFxTEFSdkFu?=
 =?utf-8?B?NEl3aVFPQTN1NnhaWUYzOWFuYmFlelNaOGhIdzRaQkRISjQ0R01Qa3k2M1BP?=
 =?utf-8?B?cXBvYnpDMTFGeTNWc0huaklyL1BVR0Y0V0dFRzRTbGhsbkI5TlB2amdlay9m?=
 =?utf-8?B?cDFzUUtKd0JrTzQ4VTFUdHBLU2t6eFZhemo5NkxDOGtzNkdtWU5TOVp0aDFW?=
 =?utf-8?B?bVUrL1VWU2NUUVZad0RveFVpM2F5M0JFcExyMk55NUQ0N2hJdytjeTkya2I0?=
 =?utf-8?B?ckFINzM2enpUT1BDUzJDcmtkOC92TklWY3plRytkdE1ra1dKd2JySXBPZXF1?=
 =?utf-8?B?aWNtVW93d1h6M1E5WktFRFgwMnVhbVdTOEd3SzJKZVNtbVlsdGZ1L3JiR0xv?=
 =?utf-8?B?VlFLWEFxS3hndEtabk5DZm9VVElHdkJ3S2p6dHIzSFlBMEVlR2ZkSVBSME9O?=
 =?utf-8?B?YjdrSnc0cG1uR2N4eUR0VW41RlRJWUVGQlZqNWIrVnRTeERtRFpMWHBGTVNs?=
 =?utf-8?B?a3Zva3o3SENsWEJjZlBwNkZpNDJvamR2a0xFNmZIN1c1WHNMRUxhZlVJUVd5?=
 =?utf-8?B?alZ1Q01kVWJMM1JjaEYyOXZOWWx0UWp0NkRTamRKZEZHZWtsOWFaa3BTR2tn?=
 =?utf-8?B?SStBU0RMN2xoaFdmQ2tkMktYdWpxSFRjY05Ba1RMVGh1VVdxay8yemRQK1dH?=
 =?utf-8?B?ckt2WHQwZUdJOTVtSWQ1bEgxd3lCUWhKMmFGMFM2Y2VTbE14L3hhV0t6eGhV?=
 =?utf-8?B?OFJkTld2ZjhwNXJoT2gzaFl3V0U4THVVdDFlY2FML2RNMGJIVU1JOGVKL3pj?=
 =?utf-8?B?QWpoN09EQjU1b1c2Mkhud1VqeWsweFZRSWpIdkFneUhMVXdLWURhS3FMNTNJ?=
 =?utf-8?B?Qk4wVlJ1ZWd4bGZadG9VQUs3b3p1N0dvc1ZrcUNzcFhiTE5jaVF5cUVNYXBG?=
 =?utf-8?B?cVZyRFloTlNBMlZiTDJiRGdidDRZekFWcG9SeTBoRGsxTmVUTHk0Y3pBaXov?=
 =?utf-8?B?ekd0Q2dhZzU1MHNkTmRXME1MNTFqclNPMDdCYlVIZFpabGt0R3pZalM0ZXJ6?=
 =?utf-8?B?YTVWTHQ5VWpLeDZJZlhqN1RYYjdtemI1c3ZUUWJtQ2NONzVYRkVCSW1YUlM1?=
 =?utf-8?B?eTVoS3ZKaWR4bUs5b0RiNGJEL1B3RVRWTVZZbjBtQkxQUkllcEtNT1dNYi9h?=
 =?utf-8?B?SVd1K0ZKUWRmNkV0eXRNZDBVUmdDU2U1UUgvMjhFREtGMkpYOFFXV2g4R09m?=
 =?utf-8?B?LzA5UXV1QkpOc1FZb2tsMXFxT1VoNDlxd3MrdHBkMnRJNDBKb0tYQVc3MDFB?=
 =?utf-8?B?dm41K0ZBRFFSSUJGZXJNT3NERzNBVi9vRHI0N05VNlhaaVByZFphRTVFYVdU?=
 =?utf-8?B?bnp3VGVWVnVSaDZjSnIzTWhyNFVKVjVCTm02Und5RWx0SmR0eGJaRmNlRTZq?=
 =?utf-8?Q?xvjCW4tf6gihHsJ9Km7MGcQ3U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c48ede3-7415-4f65-383c-08de1d5410f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 16:46:43.3849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwB8dgf4/ajmk0I91YqCQ7e8armOh4Q05uud3OCzs7maSmxApCiZywnVlc5siYLJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6119
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

On 11/6/25 17:37, Kuehling, Felix wrote:
> 
> On 2025-11-06 08:43, Christian König wrote:
>> On 11/4/25 17:28, Philipp Stanner wrote:
>>> On Fri, 2025-10-31 at 14:16 +0100, Christian König wrote:
>>>> Calling dma_fence_is_signaled() here is illegal!
>>> The series was sent as a v2. But is this still an RFC?
>> I think when Matthew came up with the XE patches we pretty much agreed that this is the way to go.
>>
>>> If not, more detailed commit messages are a desirable thing.
>> Good point, how about:
>>
>> The enable_signaling callback is called with the same irqsave spinlock held than dma_fence_is_signaled() tries to grab. That will 100% reliable deadlock if that happens.
> 
> I guess we could use dma_fence_is_signaled_locked instead. That said, it only tries to take the lock (in dma_fence_signal) if fence->ops->signal is set, which isn't the case for these fences. That's why this has never caused a problem up till now.

But when fence->ops->signal isn't set then why are we calling this?

Regards,
Christian.

> 
> Regards,
>   Felix
> 
> 
>>
>> Thanks,
>> Christian.
>>
>>>
>>> P.
>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
>>>>   1 file changed, 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>> index 1ef758ac5076..09c919f72b6c 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>> @@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct
>>>> dma_fence *f)
>>>>   {
>>>>       struct amdgpu_amdkfd_fence *fence =
>>>> to_amdgpu_amdkfd_fence(f);
>>>>   -    if (!fence)
>>>> -        return false;
>>>> -
>>>> -    if (dma_fence_is_signaled(f))
>>>> -        return true;
>>>> -
>>>>       if (!fence->svm_bo) {
>>>>           if
>>>> (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
>>>>               return true;

