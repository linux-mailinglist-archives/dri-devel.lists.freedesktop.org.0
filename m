Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFBBABB0D5
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 18:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E728210E098;
	Sun, 18 May 2025 16:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kms597Hj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658BE10E098
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 16:28:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrJ6wDg6FxGb5IaK4MT+AvOs7VS+RP//V5/B/iUJ/A0BrHkJjWz8rn2qv5XARDvjT3qxQl6BQyBM06DMqgV9U2ioMm7rGYs8vNvIzqWJK9diN2ZnFO6P6SUTRbHmtnXi54TLm98ol2ZN+RnU6pVybmqVwMRD4EYchBW0ARcjkmEd+QyMDClaPnF4ZENwu/YuVjHHsiZb15vzSGg3hXUUfG48wMlduo0a3lUhnhdejY4fERgYmIQ4/YolHppmAyX4plfS4a1a6oYwmkY50uHYVx0mTV9sTjvGKzpbgxeLr445YcYfY8UNN3bi6dk3gB1GfKZ03Ek1pVkT+hzGX8z/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbZ6ws+SWh+rbvvOzbOHNLd1p+xwcUz5kSyiuu0MsQE=;
 b=lq2N59IAry2+zqpXwfdNeWPE7ikU8IPbDiZsgvih9Bbl2O7BNjwLBsc9W1P6aLEzcjUscvdisD2g/7t16HeRbl21ErlF9R04z2VT7/6apMPn+Bpgrvvwevjw/OWqDcwJXqj7xk5xeXGz/IHIDDRwAoFdWe6GGYV/f5KhXPeEtjYBWBmTLmO0+ncwU2VIsgFm/DJdYmuIAOW2Qoe7l6tB6nPSUb6OF2rGiNCBQH+ahiqdnYnnFPC8F023FounNqblh20yQ4Pk39Mb/4mKX+U1GgdBT5irKh5uLW8VBzmioaXQTCArc7Pmb2Hh55Efu1bypEih0CctrtskxWvzUpXN6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbZ6ws+SWh+rbvvOzbOHNLd1p+xwcUz5kSyiuu0MsQE=;
 b=kms597HjUn5Vom0Liemfy7jNylh4l/FEJwEO1gXjraE/8KOFaexGF3uzdM2i/mwN5z8R9eccTLwP82eBpId5VSdVm266BPpZQqe9RQDZYXyS3ExRyaFiK0gS/2fJcY7jj7h7zrTvt0t6TSHG+aHDf08qUC1f/XiTs7x7mOToBzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8723.namprd12.prod.outlook.com (2603:10b6:806:385::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Sun, 18 May
 2025 16:28:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Sun, 18 May 2025
 16:28:48 +0000
Message-ID: <5c0df728-2100-4078-8020-4aac8eb31d2b@amd.com>
Date: Sun, 18 May 2025 18:28:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Dave Airlie <airlied@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
 <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
 <20250516164150.GD720744@cmpxchg.org>
 <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
 <20250516200423.GE720744@cmpxchg.org>
 <CAPM=9txLaTjfjgC_h9PLR4H-LKpC9_Fet7=HYBpyeoCL6yAQJg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9txLaTjfjgC_h9PLR4H-LKpC9_Fet7=HYBpyeoCL6yAQJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 351335d2-2dd3-477a-2bdb-08dd962910f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1NBQ0loaVNJVnFkbHAxZ2tlZVNkMXRzWEMwM0hpVzA4clZxK2xNbDdMbHd3?=
 =?utf-8?B?cCs5QWZuWDJyR004WmVWQm8rdUhlaFV6NTdBQ2ZWNjhiYkoySy9VMUNuaWRx?=
 =?utf-8?B?blduanNMaUZ0VGtjOU9kSUdGMTBWZ0hlUkprUVpZQ2M5MnlqUWo4cUVjOU5h?=
 =?utf-8?B?Mmtjdkd5bktzV2J1SjF0TXMzbmdrNE0weFJGeGE3TkFLQkdDVndQdnRINkJj?=
 =?utf-8?B?by80L2dXSUlEU2tEVlp4YnpVQ3N2bG5udE1ObWMxbm1HQU54YS9BTUlIS2Rz?=
 =?utf-8?B?SGxBWUFYTi9pdUZoUUhTRjdOSFREbDdFNWNySWlJWWNDVTFCdjF1TEwzT0hD?=
 =?utf-8?B?VjVwSG8zSlRHZUdwTWp5bTJjeFBDMGU0Ti9lSW5kdlVrdHZ5YXNoYUs2WlVi?=
 =?utf-8?B?TmROSE9DTkd2OWhxQzdoTTZ3MkVmbEVwZlhMOWJmeXNvR1F2M1c4ak0veUlm?=
 =?utf-8?B?dEdUdjl4Y3IxQ29OMzRYdGFsZzJ3eHBEVGM0aVlDRndpOFE0MkNYVlhnSFYv?=
 =?utf-8?B?ZGFxRk1wR3pIZFE5NytjZW9KTXk2SlQrOEJDTlkzZDhtSTlwNVFLanlWSjBx?=
 =?utf-8?B?WThhNEM0MG5ldHdsQXhZY0VhTTM1RkxoZ1NZU3RIL0M3ZGswVmFDVGRvWm5y?=
 =?utf-8?B?UTd5NTM5NkJYNlhpZTgxb3RIT08yMzU1TkhKaDY1SXhuSk1KRGFLQnNPVHhD?=
 =?utf-8?B?dk4zV2drWlMraTFzWEI1TGFxcmgwSkVrVWRTTlBneUU0T2ZxUmhlQ0k1RnhZ?=
 =?utf-8?B?bDVFVm1Od05PcjVJcUE1cFJ6aVJvWHJuaTBJdVdtcWY1dWJORjhhRHJFdlBp?=
 =?utf-8?B?U1FuYkw4RUpzT1hwVFFDTksxNk1tK0NCTlVaSkhhRHJ2OC9ycXhWWVRwbHlO?=
 =?utf-8?B?SDdYUit0c0N6TFJEV3ZDNldMTUpEVHdUcTR4QVA0OGlGQ2hXSnExNTAzbVEw?=
 =?utf-8?B?QS9BOE9yWGNZditTTFdvMzV6MXl3cGhNTmY4eWIyMUh3UkcxM0dXSDJwbENz?=
 =?utf-8?B?Z1JBM0k1NkJoRUdRbm1iMzc2MkZqU2dta2RYcE0vRGZtMjJEeis1V3ZudGdF?=
 =?utf-8?B?SVdhOXhvWENsNkQvYzB6cThrNlIrQ1Jyb1lCa2V5WWQxRHRId0tESUM5cEx5?=
 =?utf-8?B?cjV5cUVSK0V1TXBjTUk3N3dhdDBFREpiMG56STZScWp6RFRzcFJ4bmsxM21t?=
 =?utf-8?B?bkNGVnhaVllyYU1tV1d0NWt6dFlyakZDODQ0OVhGM09UUmVSY0FsbUxBUGhR?=
 =?utf-8?B?Y2FIaHcvODFkaGhTOFhSSHpWdllKaUZ1NlBzanU5R1dzbWhVZm1CdVNQTnE3?=
 =?utf-8?B?NEk1UkJrZCt4RmlqeHJiL0c3a2szVGFqVmk2b1BpVWtPN0d6dFhjdll3MGJm?=
 =?utf-8?B?UVdhbkFMY05NVzFBYzgxQU5ReHEydjExdkZFdDF4MjhWOWFxVnZSWHFDUmRo?=
 =?utf-8?B?SlZGYUpWbzFQZVQ0VVB3VkFjUzU2NWF2eUFJVDJLM1VobThsSk5kaGQ3MDZY?=
 =?utf-8?B?a0xBWkU0Y0daK21mblBkQzRxTFdxYVEvN2RsM0o5aE9vdTQzUDJhUDBjZmJX?=
 =?utf-8?B?dUJNVFpSdFp2MDEyTWJpMHJod3NrRFBUdnJkYXg1M1M0cTZmWHBqY1VNRzJE?=
 =?utf-8?B?VzhtMUFidUthemdBcFA4dytsem1ySUhPczRLa3h3UTdNOUhKMzYrRUZnWVl0?=
 =?utf-8?B?UzhDRnI2b3RUVVUvZW03cVh3cHp3QlBEZEQ3Uzc5UWxnbm51bHEvdmpFZjJX?=
 =?utf-8?B?YzNhUXdKUmZYUnREMlYrVmxJYU90eDlGektrblNTd00wYjQvMWRlTkNNRkVX?=
 =?utf-8?B?SzFTRnNqVEVtREowMHgvSmdNbFVBb1lGcXFBSEliOTB0U2RNeXljb1dlbnEx?=
 =?utf-8?B?dENDNDIzMHJuRmI3OVRXT2hzVENmckdXcWxmMjFqaERzcG9HOHZta1M3Vjg5?=
 =?utf-8?Q?ZcxF4cYH79o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2RJdnY3Z0VUMnloY1dXeXBiNW04N0ltSk44VXJLWDV5bSt5eS9qYUplZWpY?=
 =?utf-8?B?RE9ib1pPaUlZY2FGM2xKL0RYTG51U1ZlU3crOWtyZzNwZndEUDRzYk9PUnBn?=
 =?utf-8?B?NG0zM3ZCeHdiNUlTUG9Oa3lxbDZ0QS9md3NkanhzRUJyQy92cUtZVEtlM2Nv?=
 =?utf-8?B?ek1iSnJFV0diNnMzc1IvUHB1dHBEK2F6VXAraFFCbGlOcUwwMDlaTTJ3RnRO?=
 =?utf-8?B?dDczMmN0TzVKaDBuR3ZENmRKUmFCbHVMSGMwUmN3dVBpeTZOdnZzbXNmUHBJ?=
 =?utf-8?B?L0FadWwrOWQyN1QvMnNqREdCV055Vzd1dmlJMjJ5ZTZWU1ZlTllqNzhKSytw?=
 =?utf-8?B?Tk1xWUNGWllNQWRhVjYwT2wvRFM5L1czRmNNNXlxVHp5WTB4MTFoZ3V6K2t4?=
 =?utf-8?B?UWpMbmZJbkxWbFkxekE5cUl6dy81UXRVZUlaWFFsSlJ1YkRwMXJUYktGcnBw?=
 =?utf-8?B?WjFXMmNRd3NGQzJYNndhRDNQdWExZVBJR1JPZVJRSktnNlVhK1V6L3FOTGZE?=
 =?utf-8?B?dnZWTktZUEQ0cDJjMjhlQW92VjZNajhwK2llNmJsaEg0MWd5VS9Tek4waDQr?=
 =?utf-8?B?eUEyRU1ZTE9pL01XU21vR2pzZ2FoUDNTeGRWc2k4ck9VSTE2UWNOYkE1Sk96?=
 =?utf-8?B?Y29NNXFoVEZLQTEyZEtxRXkydWg4TWNrQVRDUjFmNGd6dms4bDR3UWY2Slc3?=
 =?utf-8?B?RHA1SEIzWGNkU2ZzZ2NsUDNkQjNBeUdhNnd5NnBva2Z4cjlLSUNtWGRhT3pY?=
 =?utf-8?B?UVBpZFRjUE4zaVRkMmtTZUQ1M0I5ZzZEcU9HNWhSVGsyeXRXMitGUVhsQkdp?=
 =?utf-8?B?YmNlek5MWkZPTFZZVGovMlVpaVphZ2pNNGJWWjVpL2tIWlFiK2t1TFNTNy9X?=
 =?utf-8?B?VG9sLzJMbWpQUUNZejRRa2FpYnR6N0F4S1VlKzhrTTRTa2w2ODFzdUpMdGs1?=
 =?utf-8?B?bTBscHFtVEY5bGpJMHpOQkdhTFFJNGNuNFQ3MGFMQ3JPamcyNFFJUHB3UnJa?=
 =?utf-8?B?SzJWdDA2YXFoYi9iaU42NVNQTkdpRjErRmZ6T2xpa3ZpczJEYVd3Y2NRd0V4?=
 =?utf-8?B?R1c2RkUwUk5URHpXU1B0bDh0Y0xIVFVjTmMrVDJ3WHRzNHJqQjJTQmhxb1Bw?=
 =?utf-8?B?U1JtSUE1KzQ4OG82TDVLeEZHbm5OUmZJcDl5VkYxR1lrM200TEVndExWNTZF?=
 =?utf-8?B?ZlJNSXhyM2hjM3dsQnlMU2JGVUxnMGNYbnRFWEFPcGtIaUE4Qlo4M3I0VVg1?=
 =?utf-8?B?UEt6VS81aUhYWHNGSXJndW42bzZjaWk0bmlCNVdHWUxycFRXRk00MEVSOUx0?=
 =?utf-8?B?eWxpakwxbDhRb1lXTmZuODE3YjFjRE1COGFpdGM5ZVVQbEhJUldKTHcyWlhj?=
 =?utf-8?B?aUZSVjREV1RDa2lnZlJCQ0sxUFNvbERBQ2lNbUE1V1diWGNrang1ZXVtTEpy?=
 =?utf-8?B?TGYwTFNmbnlFak9jTnBKZ2ovKzRBcDBFelh4SGU1NDlNZTFNMDNRUDk1UTRk?=
 =?utf-8?B?WWEvN1hKcTIvUTRGRjROenIrQW1NandFOXlsdUJWSUN5N3k5Q1A5OUJlZUV4?=
 =?utf-8?B?Q0RCcEZ5YXlGYzAzdllWUHJocVU4YkNtM0lKR2U5dFlQT3E4WWx2VmtlNU9K?=
 =?utf-8?B?cjY1S1NVUG13WjV6MGNPRkVZV1N6RTR0VldicnlFQ2s4YUxZQjNOVlBQdHh3?=
 =?utf-8?B?MkIzajA2aXdhRGd5WlBJckZQeHFnUzNYdXZoUFgvTnFPakVVT0RxUUN5eE52?=
 =?utf-8?B?MkdCOEJteEF0VFRuL094RFljWFp4dUNoQ2xMN0dnRjlRRTA4alM0NjEwYkYw?=
 =?utf-8?B?UThObHo5cmEwZStPY3Q1YVBoTDRiTEJUT1pSRmNkTHpDUkpseEZzc25TNHp6?=
 =?utf-8?B?VGVTZHFnTFcvSHQ2dFQ1cGdQRTd3ZVh1YW5MNUxXWEpPZGJKaDZhUDdaQ2Rq?=
 =?utf-8?B?eksxb0JUUGhlOFZ2Q0sxSU1QK3RQMkNqOW1ONGxwd2J1aUhDNC9ONE9IV0pF?=
 =?utf-8?B?NzR2anBPbzJXa3hWZXJIU1RSQ21rcVRnOHhuSnI3M0J6THA3UzlLUDVFYjZh?=
 =?utf-8?B?SXEvRmlzRlJUQ2dzWmFHSmR6ZjY0MlNxSE9jU0xydm96alUvNkVrdWpzbER3?=
 =?utf-8?Q?lgpw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351335d2-2dd3-477a-2bdb-08dd962910f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 16:28:48.1691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0V1SiP6Sea61gz9yhz1NcWmFwvZA7R3Vk/LhCJzCYPN1xTVUW1jISnNVOM/0nYoT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8723
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

On 5/16/25 22:25, Dave Airlie wrote:
> On Sat, 17 May 2025 at 06:04, Johannes Weiner <hannes@cmpxchg.org> wrote:
>>> The memory properties are similar to what GFP_DMA or GFP_DMA32
>>> provide.
>>>
>>> The reasons we haven't moved this into the core memory management is
>>> because it is completely x86 specific and only used by a rather
>>> specific group of devices.
>>
>> I fully understand that. It's about memory properties.
>>
>> What I think you're also saying is that the best solution would be
>> that you could ask the core MM for pages with a specific property, and
>> it would hand you pages that were previously freed with those same
>> properties. Or, if none such pages are on the freelists, it would grab
>> free pages with different properties and convert them on the fly.
>>
>> For all intents and purposes, this free memory would then be trivially
>> fungible between drm use, non-drm use, and different cgroups - except
>> for a few CPU cycles when converting but that's *probably* negligible?
>> And now you could get rid of the "hack" in drm and didn't have to hang
>> on to special-property pages and implement a shrinker at all.
>>
>> So far so good.
>>
>> But that just isn't the implementation of today. And the devil is very
>> much in the details with this:
>>
>> Your memory attribute conversions are currently tied to a *shrinker*.
>>
>> This means the conversion doesn't trivially happen in the allocator,
>> it happens from *reclaim context*.

Ah! At least I now understand your concern here.

>> Now *your* shrinker is fairly cheap to run, so I do understand when
>> you're saying in exasperation: We give this memory back if somebody
>> needs it for other purposes. What *is* the big deal?
>>
>> The *reclaim context* is the big deal. The problem is *all the other
>> shrinkers that run at this time as well*. Because you held onto those
>> pages long enough that they contributed to a bonafide, general memory
>> shortage situation. And *that* has consequences for other cgroups.

No it doesn't, or at least not as much as you think.

We have gone back and forth on this multiple times already when discussion the shrinker implementations. See the DRM mailing list about both the TTM and the GEM shared mem shrinker.

The TTM pool shrinker is basically just a nice to have feature which is used to avoid deny of service attacks and allows to kick in when use cases change. E.g. between installing software (gcc) and running software (Blender, ROCm etc..).

In other words the TTM shrinker is not even optimized and spends tons of extra CPU cycles because the expectation is that it never really triggers in practice.

> I think this is where we have 2 options:
> (a) moving this stuff into core mm and out of shrinker context
> (b) fix our shrinker to be cgroup aware and solve that first.

(c) give better priorities to the shrinker API.

E.g. the shrinker for example assumes that the users of the API must scan the pages to be able to clean them up.

But implementations like the TTM pool could basically just throw away pages as many as necessary.

So by saying to the shrinker please ask us on reclaim first we would completely solve the problem.

That was considered before but never done because it's basically just nice to have and most likely not really important.

> The main question I have for Christian, is can you give me a list of
> use cases that this will seriously negatively effect if we proceed
> with (b).

It would basically render the whole TTM pool useless, or at least massively limit its usefulness.

See the main benefit is to be able to quickly allocate buffers on HW use cases which needs then, e.g. scanout on APUs, PSP for secure playback etc....

The idea is that when you alt+tab or swipe between applications that the new application can just grab the memory the previous application has just released.

And yes, it is explicitly required that those applications can be in different cgroups.

> From my naive desktop use case and HPC use case scenarios, I'm not
> seeing a massive hit, now maybe I see more consistency from an
> application overheads inside a cgroup.

Yeah for HPC it is most likely completely irrelevant, for desktop it might have some minor use cases.

But the killer argument is that we do have some cloud gaming and embedded use cases where it is really important to get this right.

> Android? I've no idea.

Mainline Android currently has it's complete own way of doing mostly the same what cgroup does, but in userspace.

The problem is that this doesn't account for memory allocated in kernel space. See the discussion on DMA-buf accounting with T.J. and the older discussion with Greg (sysfs) about that.

In my opinion it would make sense to just use cgroups for a lot of that as well, but we would need to convince Google of that.

Regards,
Christian.

> Like what can we live with here, vs what needs to be a Kconfig option
> vs what needs to be a kernel command line option,
> 
> I'm also happy to look at (a) but I think for (a) it's not just
> uncached pool that is the problem, the dma pools will be harder to
> deal with.
> 
> Dave.

