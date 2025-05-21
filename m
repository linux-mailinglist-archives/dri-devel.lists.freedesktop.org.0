Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D377FABED50
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 09:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4524010E117;
	Wed, 21 May 2025 07:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EejRTxTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6213B10E117
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 07:50:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqKFw39pQ9VEhJahshJx3g2GvoXfD3qlTUKB6prB1IHsvC85Phrvwfjdn8IK+1glpCYiBSpVqGPkBZQs+J/PMQwhRJ0GN+HdHe1x3s1DgFZd5xxPHtYAUoJ+0CYWKesyCE3+pt2oiaXuqUvxERjycZLcuIVx3jbmNkrXS8o+fZwZaLoZJsJ9JTE4HGItgP0IIbmw2PE4a7FN4rhHfc8hk03sridqS7eQCFYFau5M+Zbj0sP5diS3NOwN7wGDIslKzJCIiJvROsLlSAjQKgRs8dX94gThG4cZhtSvznpin89KCR93Kem6cgsVwQwmupJjf9OTsyBwgwfzZfPA7LQJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWJrmfYC+aj70gxFHrxHzwoq/4c6NRvMmpvvIE8M+2I=;
 b=oY3VGJUwH2IlKfALWW+gV1lab9b0Hx+U3jAhb/Pa9rhQhDNeednrhYpF4mSjwDbjwxUAkdyr0XYFsGclBjoGhBT9g1eMohadzgDmrsSzIzBdQtus5h+T5GerpJW/X8sBK5DIj/DfmCPxTMXn7X71AU/okO4m9U4E8+xcrmKDzlV6b/uIKbz3NdxadylG78/e9sudTRkF+4dleexNevjrHsc0Znzeioz1CbJwKV5q/OXqAKhWeWdNBLErkLQtj8YfdByeoWIb0ro+P1zYb/nFE7GO+gckl76lzyvBbU4J65qevTkaq1MwmSle5SwSYU8TTOwzsB1QJo0MLSaRZInR5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWJrmfYC+aj70gxFHrxHzwoq/4c6NRvMmpvvIE8M+2I=;
 b=EejRTxTwHdYUM3AuEN9KQ7cfDqvxydXXaGY3qfwmQdPaMI50gTNObOiR14eaoNh7SLvfv98XOlpGQrbnB3qrpozs9eEjx2aPDlNBb7zKHiyvs0HNF+CLtEk9mIG12CobHVkcZGu/D5K/Aw70PEdUXk2ILh+9DvVZw6PW1eAA06Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6965.namprd12.prod.outlook.com (2603:10b6:a03:448::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 21 May
 2025 07:50:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 07:50:34 +0000
Message-ID: <ae02a8c2-924b-4e08-b78c-0c45563f8761@amd.com>
Date: Wed, 21 May 2025 09:50:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Dave Airlie <airlied@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9tw+DE5-q2o6Di2POEPcXq2kgE4DXbn_uoN+LAXYKMp06g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9tw+DE5-q2o6Di2POEPcXq2kgE4DXbn_uoN+LAXYKMp06g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR1501CA0006.namprd15.prod.outlook.com
 (2603:10b6:207:17::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef225ea-fcbe-4f55-201e-08dd983c2ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2FXZlNpWktHTDlKZGtMczdmK3VtY0NudlU4eCtQUnVzY0dtV0ljdUtyVjBh?=
 =?utf-8?B?MnpFS2NMOUlmb20va042bnBNRjlXMFJrK2RQdlBCemtGbm5jTklpT1dhOW1N?=
 =?utf-8?B?MDZzV0U2TmpBUFlEdTlqcUE2bGlWekVkUklrcHM2YWxJMlpQRjFqS0JPT1FB?=
 =?utf-8?B?UjR3WjVlVWs1bFRKTGhiSUpOQmkzSy9UcTMxMEpmMmdadnlrdUlpc1YzaGVz?=
 =?utf-8?B?RkZaSytUTUVOMW10OW42WGFEc3BxeVZxbHROOTVkZHpITTZMWkx3RXhkeTRC?=
 =?utf-8?B?N2RYY1h3ZEMySEd2aGl4RW5WVCtPOStsZGJJVDFzYTNOVGx4UGRnS2ltT1Ev?=
 =?utf-8?B?dkkyVWZCY00wMTlTVUt5WXNTeGN2OXNsOEZnaCtsekdKVnZUSmxIY3N5Qm9o?=
 =?utf-8?B?YldRZHBVZ1NPWTg2ZDNDUGhpU2hGeU9kS2p2WFZVdXpRSkd3b1JzQUx4czRm?=
 =?utf-8?B?UzMxbU5oNi93cHozanlRUG01QmY1WXlvV0wwVThEQnlvZkE5aEErNERoQWhh?=
 =?utf-8?B?VnJhMTU4YW1PbVRqd3NybVN4Y2ZuQjFWSmxnWXc5bXJtWW0wMk1DRTRQOVBj?=
 =?utf-8?B?YmxOMGkyQ3NPOGUydUxGVDkwQWFVT2FxLzZlVDYyMHZCQkZDVlZpSUowdlR4?=
 =?utf-8?B?K0pyVU1CRWZWQm1JOXhqTWVWVTJMVEExb00wWUtIdHVVRDdUd3NKaXppS2hr?=
 =?utf-8?B?ZmgyMkMzYldWVitrMFdqQmdvUUpxbGR6RklnbUpSbTY5QjRPTzJJSDd6MDBF?=
 =?utf-8?B?ZTFYTkQ1MHBmaHNYWmRHdms4dHJCRktTeitZTmpnVG9lYUEydTFUNk16TFJt?=
 =?utf-8?B?emlNNHBaaDcyMVFHZGs1Rk1HMk41bWxQOHRhait2aTlkbEVuNlJnVEluVDBk?=
 =?utf-8?B?a00yYlg3UE1NZUpPNC9NTzRvK25ybFQ2Tnd3d1lmSk1XRXA0K1duWlFFdW5Q?=
 =?utf-8?B?Qzk5KzNXa2lqY2RRMEM5SzlmQSt2WjB4bEhHUTVWclRFL2Zzb1hkVGtqK1NR?=
 =?utf-8?B?a0U2QnNwMDRiY1pXeFl5YnZJQXFUOGplSitiOUxHQXM1Yjg3YVBuZHBQWE5E?=
 =?utf-8?B?V2o0WjY3aEx5UnhIZWp4OUNlSEtBTEFHTWhhQUJpTVpIUlRsalh3ektlZzBn?=
 =?utf-8?B?TzNnQXNrZzg5S3Y1cFVTdFc0aDVxT3BmNlczZE42cHJCL3RuaEQ5bm5RR1gw?=
 =?utf-8?B?dWsraHN2L2sxcG5VSVVtZVNlSEVkbjB5WC9FbmNZRGY3aDRGaHZROGpnVU00?=
 =?utf-8?B?Yy9pK3VOMnJOMjBFTCtrZDcxb0dCRE81ZzJJWENFamF1NmdZdHNQaTdITGsv?=
 =?utf-8?B?U0h5dGRiR3FycE1RVU95aUZ4NkYza1FlaXdMZnNRMFlCa04xNFJPYzNsQzZi?=
 =?utf-8?B?aEYxbHNxREZ4ZHErQ1BBVjA0VlA3Si9NQkpzUXNNRDIvSE1HQlBhYjJsbnJz?=
 =?utf-8?B?WVh5ME82by9GVTQya3NyR21vb1FTV0l3SDFLeDZvQXdsY0FxdVRVWXMyMlZZ?=
 =?utf-8?B?d2xYVUFaUVlGeXl6KzVJVmhwMVVoOHZYRzllQ3ZncUFpTmRRaEszTE1VMDMw?=
 =?utf-8?B?djdJcFFRLzUxWDdJRXl6Ty9xUU8rcmwrY0NIZlNUNGdxWm9ZcmdOMG1TT2R4?=
 =?utf-8?B?LzV4TWdYZXNEVG41ditvUFY5OFhmR25QbnUwSmZRUWQxRUFkOGNvNDQ0aUln?=
 =?utf-8?B?dWNydEc3YzFHcXpXZ0k5UEovNXY4RGZhbXVxL29pcmV1U0JBa1RRVnVsdVFy?=
 =?utf-8?B?d1hQbnpibUNSYkp2alVrb0VKYTVndGNwMmZYRXdLTW02OEQrSGZQcTFYeUk0?=
 =?utf-8?B?cjVZQVNyZ0RWM1NEMUozRmdvb2w1N2hEblJKWkJQYjFZVDFZTWVRNW5NZHpv?=
 =?utf-8?B?SVRqbFU2WitMd1FFdytqTGFndyt1Q2FNOWh2UURJWFdPQUZUSUhHNTRoazJi?=
 =?utf-8?Q?FjyZjXkySCo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGtXVmtNSmVLN2JaaExuaUNrS3Y4U3V3ZnhkYmk1eDNnQmNBWmg2dUMwMldj?=
 =?utf-8?B?NXoyc0xISjhoVHJtSjBnNnRUQ0Q3MmpWTEt5SDNobSs4eUhMcXFYSTAzRG9U?=
 =?utf-8?B?WlBPT2QxcWFsb1Vic0RRakFjd1VlcXZnc2JFWktuMG5XMTVVNUpZVWN3Z3FO?=
 =?utf-8?B?UWQ4ZW5LRGxEMjhrN3RoSW9sSnlPUXlEQW1UQ003Nk1UWnFGZUFEL3ZoWkRI?=
 =?utf-8?B?d0dXM294cSsrc3dmSnNBZEpRczg0WXUwWEdlZGUzVlhvdlE3a0Rkb3c1VU5t?=
 =?utf-8?B?SnY5RTdOU3VsYkw4YlY5RStlM3FQMGZwUlBFSTcrT2JlWDlzK1praFZtTlBx?=
 =?utf-8?B?QWo5M2w1cmtQUnNGZVlhTlJjR1h2bTRFeGRNcTJ1dHl0cGsxVXFTWTdxSTFF?=
 =?utf-8?B?aDlMTlFCVkNEbmwrRHgrUnhZbTVRNm9Uc3c5R1ZvcTZCSG5aTHAvVWVkK2tR?=
 =?utf-8?B?RlB2UnMrTDlLamdXY1I5eTRMcERlOC82SnZWdkt3ZUgreUdLOXZzNUMwUkl5?=
 =?utf-8?B?K3FnR2l5VWNIVXpmaFZNSEpTbXBtOFJ4bnNaWm1QRmZ1MEJNaHhoSm53cGVy?=
 =?utf-8?B?bUxORkhMb1RFMmY1REhPbmJ1R1p4U2lsRXRDVzBSOFAxbnY3RFdQd2x3clFE?=
 =?utf-8?B?ajNQL2hQeUtMQXZEZkJvMkIxMC9nZ212UGxKaWVVaVNuSEE5SU51TWRKTGdX?=
 =?utf-8?B?RWlOVlp1V0tuTzE1Yk5qYTFrZElEWk9iZ3cxdnBaNENoc29WZDJJRm9RWWE5?=
 =?utf-8?B?bk4wWjc0c2FZcVJnNHNrRnYvK1FrTlJQTVBCbXhyRnQ3RWpkT2s5dFFOWnpU?=
 =?utf-8?B?RTdudEdxWXlSckZDMDBmN3pqaDhiUVIvbWhQVzBsZHRHYzhuWGk4Wkh6YjYy?=
 =?utf-8?B?dkQzY1hBVTJEWnhTMHpmOThxek9rbTY3ZTBaRnQ5YlE4c2pZQUVqdDlUOG0w?=
 =?utf-8?B?TTFicXR2dk1lSG9BMjl0a1BoNjlFWmYrbWtKMUNKSWxCV09GS1V5aFdTc2Rn?=
 =?utf-8?B?STQ4RXFhVFNjREdJWkRJeHl6Y2VTWkQ5ejRYQWJ3OE1jUVVPQXRUOTBNM3ND?=
 =?utf-8?B?Y3RLQUVHcXgvOFdWUy9paDJaemxhbmlFeHNkS1RGU3pNcmVPMEhuZnpVMitQ?=
 =?utf-8?B?VlViSTRMUXZ5OU9VUUIzRVRqUS93QllFRStEdzgxMXdaZVZTcnp3dEVjOWUr?=
 =?utf-8?B?TDZWVTM4TTlqcXB3d3lnZkNNaFFjREVVTm9pQm5RdUFTZ2wrMEI0ZCtlaXNo?=
 =?utf-8?B?UWxmL2N6aStXZzFwck1kZWtoaDlrcFNZR253YzRISElOWlpiekprbmFxQ2FX?=
 =?utf-8?B?a1V5dS9LYnpudVhyeTFQMWRySk1pQlhjNm9WQ3dJbkVJanFVQTdyT0c0Ukhr?=
 =?utf-8?B?aXdDcEd5RFUvVDVkOXRVVGM2T2pHa3diTFhlZW1OM0ovb2kvbS8zTi9GWUlo?=
 =?utf-8?B?K04rM1BlakQvc0xVRUkra2Y2R3F2U0Z1SjQ0YVhlaUFEdG9EVVU0MHZYelRt?=
 =?utf-8?B?eEpsclNRR1hVN1RnQkh2MVVSK25HL2lQOWwvSU1Yam5qMk5uUGZubytKWlBz?=
 =?utf-8?B?VThyekZOWDVTUnJ6RFo2bnB2MFB4WC9HTEFlVkZZd3FydU5pN3h0L1VudFRi?=
 =?utf-8?B?alZuUzlnZFBGR3k2WURVMmxlZFYwSlZxanZOZURkQVBCeUNVWEY1MnR4cU15?=
 =?utf-8?B?YW5Hclh4ajc3dmdUd0ZvdkNDUDFMQVcyVnh1aXhUWW41WTBxVnM4dkhDY1Ri?=
 =?utf-8?B?eDVMSWNnUkxxOSttTWxxUjN1VzZraG4ycmIvYmhNYkQvRzY0c2xHamNHcUx1?=
 =?utf-8?B?c1NJazVKUE1CWlBoWDExRHIzaWtyTzc2cnA4NWVLakRHL1lpLytHcWxlcmpG?=
 =?utf-8?B?bkljY01HbklMTzdwNVNpL1E2K3RuUkxyejEyUCtnSzBkUjNRL1V2WjhzQ1k4?=
 =?utf-8?B?bU9MY0x6T0I5NmhhTTZxanRwdUgxdjd5eWdiZ0F6YkFCMFVsQUxjbGlXVVZj?=
 =?utf-8?B?alZ1OXNpOWF5L3JibWpGK3ZwRS80RGtPcnNhTmc4bzcwUndOdGZhNjVhQnRM?=
 =?utf-8?B?RGtxdldtbFRhTlhPQ1pMSDRoTHlwbG14L3BTZVdSbXRMQTFJVlk4bW5mMU01?=
 =?utf-8?Q?3NTIYhRwwjfH49lTfqvqdM1nq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef225ea-fcbe-4f55-201e-08dd983c2ae3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 07:50:34.4444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wEsh8z7o404mMufeRircCaPsq/3n/A7CO4fcHhQxb+6jTbYxBmuUdEikDQEXptP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6965
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

On 5/21/25 04:23, Dave Airlie wrote:
>>
>> So in the GPU case, you'd charge on allocation, free objects into a
>> cgroup-specific pool, and shrink using a cgroup-specific LRU
>> list. Freed objects can be reused by this cgroup, but nobody else.
>> They're reclaimed through memory pressure inside the cgroup, not due
>> to the action of others. And all allocated memory is accounted for.
>>
>> I have to admit I'm pretty clueless about the gpu driver internals and
>> can't really judge how feasible this is. But from a cgroup POV, if you
>> want proper memory isolation between groups, it seems to me that's the
>> direction you'd have to take this in.
> 
> I've been digging into this a bit today, to try and work out what
> various paths forward might look like and run into a few impedance
> mismatches.
> 
> 1. TTM doesn't pool objects, it pools pages. TTM objects are varied in
> size, we don't need to keep any sort of special allocator that we
> would need if we cached sized objects (size buckets etc). list_lru
> doesn't work on pages, if we were pooling the ttm objects I can see
> being able to enable list_lru. But I'm seeing increased complexity for
> no major return, but I might dig a bit more into whether caching
> objects might help.
> 
> 2. list_lru isn't suitable for pages, AFAICS we have to stick the page
> into another object to store it in the list_lru, which would mean we'd
> be allocating yet another wrapper object. Currently TTM uses the page
> LRU pointer to add it to the shrinker_list, which is simple and low
> overhead.
> 
> If we wanted to stick with keeping pages in the pool, I do feel moving
> the pool code closer to the mm core and having some sort of more
> tightly integrated reclaim to avoid the overheads. Now in an ideal
> world we'd get a page flag like PG_uncached, and we can keep an
> uncached inactive list per memcg/node and migrate pages off it, but I
> don't think anyone is willing to give us a page flag for this, so I
> think we do need to find a compromise that isn't ideal but works for
> us now. I've also played a bit with the idea of MEMCG_LOWOVERHEAD
> which adds a shrinker to start of shrinker list instead of end and
> registering TTM pool shrinker as one of those.
> 
> Have I missed anything here that might make this easier?

Just for completeness of the picture, there is also the generic memory pool allocator (see include/linux/genalloc.h) which is an alternative to kmalloc() for uncached memory.

But we never used it because it isn't optimized for pages, but rather objects of certain size (e.g. like kmalloc/vmalloc).

Apart from that the general idea of having cgroup specific pools sounds bad to me. Instead of a technical need for this it only exists because we failed to integrate those device pools into the core memory management.

Regards,
Christian.


> 
> Dave.

