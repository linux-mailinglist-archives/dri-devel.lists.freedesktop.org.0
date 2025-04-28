Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC16AA9EE2F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 12:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9EF10E3A8;
	Mon, 28 Apr 2025 10:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cH5FAebY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9687410E3A8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 10:43:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o//KkP1pWbSSntXRCaJhsaDddA5DHGKuqUaCM+pvn6M6O+Xh5IP4tW9U68/s2UqO6OjJ7oBxq9T1PY6L0pbvBEBqtNKrYFJmHIDhKaC1AnFNc0mScTvoQC/S2AOPsWz+Quvm45Ao/5Ow4I+aB/tudr/aoEtqhQ72HIzwzOt9j9NZ6HAlo8H6tR61TmPoV5kTFlfbUMY/ET3m/T97C5uW1S2JPsgZ6Wnt1Grr0d0O7sIbJm0lZfdPeL1dJhMDBbKWTAwg3n3Pk6zbqgBfrndtqVe3YhWZtUfCKqLj81FzIRTvB/Rs2bJEwzCXiBxfzCQjx8YP37zl23anzjsVFiBL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeheR5fvS4+mCrmz2M/R8i4eFsIcA9dy3LAsupslRYE=;
 b=EP6MMfp+7dZMJh8qsW9jomMH9xTxl+N+vHv0oP+kqnYKmLzEjSMvzqtGtPnyr/4WGqP21P9o/UPD0BSWXLpb7B5N7OORvRmN4cLKEoygvXOvOez8xM2URQvg1s7JKduSJwo3iUElHIVttSbwyE1GnVfb8nhWqd7/8b+f7UIoIhZN+hz7PF8KMMoXuiQFF4Ru2x50/5if8vqNZtpMdAVzb+gvcuWLr/LFrFoj39Ylf1BUGj+LMak1nhLx+EZ2sJZH6v7cxpspWdrwDHIHsBj+gdM2NiO4P2b6Cub2fCXy8sYfJi+z+lWzLdkBljgdbue7LzCP9vC/2yRSEu6K2qUs2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeheR5fvS4+mCrmz2M/R8i4eFsIcA9dy3LAsupslRYE=;
 b=cH5FAebYwHrp8d5zTR+lBhIcikohHNg9bPqAgG3KcelPyreJusE+e/g0XAIH72WyBvAxtiCAUmByVqDpbduM/iTXAGijjTldd3ltzoO0ipqQV96xq84R7dMpF6QGz3eVw0SxuSWJmIzg2Uz/ggPlA06YJ/htsG6wfwDwiT/98Q0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB5625.namprd12.prod.outlook.com (2603:10b6:303:168::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 10:43:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 10:43:36 +0000
Message-ID: <4bac662a-228e-4739-b627-5d81df3d4842@amd.com>
Date: Mon, 28 Apr 2025 12:43:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org
Cc: cgroups@vger.kernel.org
References: <20250423214321.100440-1-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250423214321.100440-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d79d7fb-d9f3-47a4-0484-08dd8641878c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGJKemwrcGdEbDNnUlJYb2Mrb1o3Q0srbE9BNlc2UU0ydmp4UGZZVVFvT2Jx?=
 =?utf-8?B?WmdNbFBLK09PbndTRjhUMFp0YVRJT2MrSGV4enhid0g0QmFCS2N5SnJxbjRp?=
 =?utf-8?B?MGtmdWZSRXd4R1VrTkNmTERvSmkxb2YrY3JkRk1TaEZLZWdGcnUwdHVmbjR5?=
 =?utf-8?B?ODl6R2xOcE5ISnRVTkNueHk4Zkh2SHFyajZZODJRYzFjdDZJd0pwZWNDeHVu?=
 =?utf-8?B?TFVBUDBpVDlVMEJoekRJS0l1YXZXTzZNbE1SNVpoSkozNHk2Z2FEVy9lZU5x?=
 =?utf-8?B?UFR0azF1L0NUelRJTWdXd1pYUW9QM09wczZGRVJJbkVuMkxDakhxeUtlSzd4?=
 =?utf-8?B?VXEwZHE0ZHdrb2J4ZjRqdTdDL1paalVVSzd2bklxdzZlaDg5Unl1dVZnVUJk?=
 =?utf-8?B?Q1htYnFjbjNTRnBLNzhBaHlNZEZMTXMxWFQ1aGx0Z3p3MHNhQWtFcStoU0NF?=
 =?utf-8?B?Vk0xa0o0VkZ4dXpCcWJEQ0pTZ1ZycUVUYS9hRy9YWFM2UWg2MXg4L2k3VjJ3?=
 =?utf-8?B?TXY0Y3BwQ295YVVlLzdhL2N5RmRJVGtyTDZlckNpTlROV1VOYW1mZ2s0MkNV?=
 =?utf-8?B?aVRrdnZqNHpQenA3OUxaa2xOR09WS2diZnlueGV6bUp5dXJTTEtLeTZQSlkx?=
 =?utf-8?B?Tm1nOWpjUnNJQkh5YVlpOXYydWh2eEhPbmtHZWp5NzZLMk0xRWRYak92SEx6?=
 =?utf-8?B?dFlkdEwvZFNUeEZNT2pXaUdXRC9ZZXJiT1psMVFZS1hFY3NSRlJKaDNPMzV2?=
 =?utf-8?B?eFRLMDF1eHMxeFNlNjMrT1lIOHRkbXVBMXNMcmhTV0kvSnRZcEFJTUllNGFp?=
 =?utf-8?B?YmtaV2I0MDZETHkxeHRVZ1ZNbjNNY0lNNm1SemMxWUdsRW44Ryt0UzcySHBx?=
 =?utf-8?B?YUFvU2tPeFpsUGVvTk1ZUE41TjFrOVZCRHcwVDFEYm5TcXM4V0hWUUVQM21N?=
 =?utf-8?B?dEJKeUxNNGdjQzlsVmZWOVg5aitITlozN2RJYUc0WmpidlNyR2c0RER0aEhE?=
 =?utf-8?B?V3hCdkZqbzBUaklHU0hrWkNhVG9LdDNQREdkM2pWOEZGNk14Z2o2RkFWaWJh?=
 =?utf-8?B?R3ZzQmg0d0YrYVZ0dlJmblNDRDM5YXBpRlBxU0IxRjFXUmhUdEtLUDdMVEY1?=
 =?utf-8?B?RUZndHlIUzl3ZDNzU3g0SmZTQnpqQmRaeVd6dm9kMUdQSEovSWhGSCt1ckRx?=
 =?utf-8?B?MVFKa2VNYWVROFM0RzN0b0xhWU4vb2pITDBuMFhXMTVGZUpIR0ZDT3htdzA0?=
 =?utf-8?B?OHREOXVtMzZENkFDUW96ZmdHZEdkUmp4SEdQWDYxQTdiMGM1bjF4aTdLZDJK?=
 =?utf-8?B?Mit2WjZLNnFQVzNlOEY0UEZteTZVQ1VKTkxNelFxRytXVmpLdGFSdy9oMDRP?=
 =?utf-8?B?Mktwa01EZ3lYbUMra0QyVXhsWG9iZ1hZTEVKUHFhaHY1ODQ3YmxaTlhacEF2?=
 =?utf-8?B?anFrekEwVlVBblptaytSK0xqRFVySzhLU1gxazUySFNHVEk2ajBnTnpDS3hM?=
 =?utf-8?B?VnhndDVjd2NvQXFSc09NWDJVOWNZTUtLYXFrbWVEekduOFFWakd4dk9NSnZF?=
 =?utf-8?B?WjhiNE5vcmc3T0dreVIyZ1VsbWkzNlIrbW9ic3FnU0RBbENrWktab2tXSUV0?=
 =?utf-8?B?U0tmaDV6V0NrR1A4ejEveDZmOUMxc1FRdkpOMjM2K29BSllHSXdRc3JFQ2ZB?=
 =?utf-8?B?ZDVlQk9GTnRiODQ4MTBiR2JKSTYyTXN4c0N6ajI4VnJud3plV204UEw1YUli?=
 =?utf-8?B?OHhKUVNsODdpTjQ3R0pGY3BZR1FLQzBlVm1adnRORzJyK3g5WjkrZ0FDVCt4?=
 =?utf-8?B?MDBWWTVQYnpjLzNpMUViMjBjVlBhMHQzcmY0bUU1SzBnV0RHSXBsd0FCemR4?=
 =?utf-8?B?eVp0MTlLVkRvbnA4Y21Ja2hMMFdvbXZyQjJ2VnBscWFwQXQwTU15eGlDYjl4?=
 =?utf-8?Q?zSXsjnJTZuY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5HS0tMbVIwUHRrQllrUDRyM3ZvUHJGQ1FEa09sQUZZWld1ckVSekR6RUNx?=
 =?utf-8?B?UGljTUJ0SEcrZVpDcTc0amhvMks0OGNOL1FHcVBOV244MVJ5bW9WRjc3RzBZ?=
 =?utf-8?B?bTdkRy8zRUhzTWxZU0dsQ3pnSU1CVTU4UUxGangxZHRTN3RLR0gxTStPY3ZF?=
 =?utf-8?B?eEhLdWtQTVBBVzY3QktvZXBuRTY1K1M1Y3NYNEZPakI1OXlWeWd4SjVBM2dm?=
 =?utf-8?B?MUdWeEZydUJKdXZBMU1Va28vdTl3NXI5bS9ZcHVkTTRMdjFKNS9KcUNaWS9O?=
 =?utf-8?B?UjIraFVpRzdQWThhMWZBYjlyeXRTWjBqR3dCTEwvZ2V0dTlaRE1pdElWRlJn?=
 =?utf-8?B?U2QwZzBxL21VK2oydzhmVWtqTGRMUmVCNHduUE1TT3VRYnNUVzJ2N3lLS1pK?=
 =?utf-8?B?ZHFmemtzUVRDWXp5ZlM2ZlBvcVYxOHRUbjk2T3puSlZ2TGdSd2VVVHc2NDVl?=
 =?utf-8?B?NkxEYmJpTlZld3MybVZhY1pYWVUzZ3l4Nksyc1hXRGg5ZitrbXFkWTh3RVNI?=
 =?utf-8?B?WXNrdTVjVGd4L0lEL3M5SEM5VTJvSzRnTlZ0Y3pJdE1UKzJML3lGejVIeHZ1?=
 =?utf-8?B?OGoyK0o3b3RIS3kwb3NYUXlOaHZyT3paYktHQk91aHJPUDdBb3hmRFdwSWNV?=
 =?utf-8?B?emdsM3BTKzFOcDFtRzR6Njg0OWRZeFoyQnl1d0JGVG9YZVBnenpNUDBYdU14?=
 =?utf-8?B?enFnblVJRFcraGlsZ0pXMkZtbFBLamF0dVlCZEM0SHpkNUs2TTlYUGZaOENF?=
 =?utf-8?B?Y1ZmdXJwNUxyZm9RMmRUb1NMbEJvR2hQM1lQQkI5SFFsWkEwWThZbW0rSzZI?=
 =?utf-8?B?bU9uRmN4dU5HSmJBQklKR3NSN0NkV0tBM2FKcEJWZEVNSUxDNVNuMEZwc3hY?=
 =?utf-8?B?QTBGWUd2Sm5IUDlEUlVQRzRPT3IwSVUrdlo3RnY0dm42ckdBQXZ5ci94LzRN?=
 =?utf-8?B?bzMzZnBqbXFNOUxhN2g2VnlqQWh2WkxpL2VlMTlxdEdXTUJrVXpiTExUZDlx?=
 =?utf-8?B?S0FyL3NObytManhyS0FaYnRJbE1Hd0JhejBHcEtoT204clhQRGxURjcvK0FH?=
 =?utf-8?B?YzNwVkZPQitzQjlja0lHWTZSU3dOclZQVFdXdTk4NDh3UTJXM3RqTzZ4WGh3?=
 =?utf-8?B?QjlQd0d4cGpGcWg0L08vNGp5WGtobW9jdmNjRWNXRjR2VUVQeS9Pd08wbmVB?=
 =?utf-8?B?QytlY0FuaFc3VWVGckJ4UlBZb3BBWEw3b1VIUGxpbk1pNmxUNUtrK2RITUJh?=
 =?utf-8?B?RjJLc3V2Y29EVHRQNFV3a2Q4WlprS2ZCeGduc3JER3k1L2ZtQ0ZxZTBwOWZF?=
 =?utf-8?B?UmtoWlVMN3lwQU5DRkZLOVMwZUdjeXdkVkFlSER3dStjZWNjdW1OaTh2cmNj?=
 =?utf-8?B?amxlUG9vamZzelNJYnhCNHpBd2hFZU5Db1l4bmlDc2R2VmhUREZPeG4vV0Y4?=
 =?utf-8?B?VFcvL1YwZE1uVFBNdWNDNXJLVkN2Q0ZRbm1LZFNySFRTdkc0bjdQVGlXZU81?=
 =?utf-8?B?aUxHWW9kM0FDeDJ2R1dYMExvYTBxTjZlekVTN25GY1hlQXhoTjQ1RFU5NSt6?=
 =?utf-8?B?UVB4YmhJc0Q0MmFGYnVRamhRbm9hWHdRdWtvWGRFSDlUQUVQTDZzZm90ZlRS?=
 =?utf-8?B?Y1o0REhBVmlKZThsSkFBaEVFdXgxVHAyWHVuYUNiRXI5ZFRTWE9wSExQeEFw?=
 =?utf-8?B?STBpM0dFSEVFckthcWd2c3RqWWNSS2paa0tNSmRoNG5sMGJOOWhXaDJhNmxl?=
 =?utf-8?B?RjliMk44cWc0aldTdGQvbWQrblN1Tk1kZmZiVUFGdkRJd1NrMWxNVVpiYVFi?=
 =?utf-8?B?S0hDbU56UnJmeVBQQWVHSHYzZlJ0M2w5UlBaMVdORXJwQ2R0SWNjKzVicE9u?=
 =?utf-8?B?aXZBaWQ4N0tUUldQRnhKa3JzSGVIUE9UeFlwUWFqd2Nzc2dEamRTaWhJdTF6?=
 =?utf-8?B?K1drZkgwRGR0SFZPc1lzeDZFUkZyRENmNFZ0dDE5WHRVVkgrVzhXeGpnVm9y?=
 =?utf-8?B?RG1ONUhhMndQa21NYjhlVlFzYUg3d0JweTRWTjZQOHdSaUVPcDd1bXF0cG5w?=
 =?utf-8?B?bTVmUFRCY1M2K1hnWVZDcm9BZEU3QStBMmdtQTVMa0xLbWdxN0Z2WVdqaG9C?=
 =?utf-8?Q?f6dQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d79d7fb-d9f3-47a4-0484-08dd8641878c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 10:43:36.3005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txQFZn8OznXBnYGo12BoZIOV2y3OPWinURy4goJSBvmN5fqOEO36l6cX06ab4WUh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5625
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

On 4/23/25 23:37, Dave Airlie wrote:
> Hey,
> 
> I've been tasked to look into this, and I'm going start from hopeless
> naivety and see how far I can get. This is an initial attempt to hook
> TTM system memory allocations into memcg and account for them.

Yeah, this looks mostly like what we had already discussed.

> 
> It does:
> 1. Adds memcg GPU statistic,
> 2. Adds TTM memcg pointer for drivers to set on their user object
> allocation paths
> 3. Adds a singular path where we account for memory in TTM on cached
> non-pooled non-dma allocations. Cached memory allocations used to be
> pooled but we dropped that a while back which makes them the best target
> to start attacking this from.

I think that should go into the resource like the existing dmem approach instead. That allows drivers to control the accounting through the placement which is far less error prone than the context.

It would also completely avoid the pooled vs unpooled problematic.


> 4. It only accounts for memory that is allocated directly from a userspace
> TTM operation (like page faults or validation). It *doesn't* account for
> memory allocated in eviction paths due to device memory pressure.

Yeah, that's something I totally agree on.

But the major show stopper is still accounting to memcg will break existing userspace. E.g. display servers can get attacked with a deny of service with that.

The feature would need to be behind a module option or not account allocations for DRM masters or something like that.

> 
> This seems to work for me here on my hacked up tests systems at least, I
> can see the GPU stats moving and they look sane.
> 
> Future work:
> Account for pooled non-cached
> Account for pooled dma allocations (no idea how that looks)
> Figure out if accounting for eviction is possible, and what it might look
> like.

T.J. suggested to account but don't limit the evictions and I think that should work.

Regards,
Christian.

> 
> Dave.
> 

