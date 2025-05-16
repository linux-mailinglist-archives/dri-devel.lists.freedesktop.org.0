Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E60AB9FF8
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428C510E03E;
	Fri, 16 May 2025 15:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K0/GIEly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB65910E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 15:35:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkvID6r3AqfquXpwHqx8w4CpXv5Hrnjqi2tjsfW3Ou+fQqw4GHnnLWPyVqMSgcnWp5gjQIhnlSAJaR3IqWmjtKjMfjIf2Y0pgs9l8t5n1BYe/Nf54e3806MsV3sMzlNhlq5M8/vwW33rn5QNLjJr0EJTv1irKS/besjMpn2swqticabK26ghZdJrhDcqwYpv7lm9GSORjlbgnYarf3qpQBT4nDnRZ9k8MuXJ9ShzT8QFQlhG6HrjuK7SUzLJGVRnkc8bfAHErT6v4fmpYb4v8FWRpG77X4zw94VEpbRstYXwQ5PWcQJqwjE4RSjcMWreVJZPCKC74PWUCUe6XBj5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkBfx/l9iagbNUpoi5UOIkdraZuckYU2lQPyQLOnLHU=;
 b=G0qoNoieKXHcM3DgRRktINJcm+TqewjBUqoQyo/O/KVy19BYG+J40kg35y4wl0OdmHy7/BXIGJdlPIRoJ7OKTKS5Gbg/eFYV2Hwy8dkqpVbgJiSn13Cp+oulj8n1k9Ht12g6abjenJJbgMg3DMHntxleozqjcaQ8ljVp9vORRNABWKlu9GyUKuXe7oN3wFm3vp8+8E6BrNpAmiamslFc+9xLZDLZYsFQVVcd8v7Fn11x4ojAE9pMn8hQIgBnkUjnmbN9nbB84330Ya1xPdfZh2pRoaHEpRqQAwUWEV80qG0hQgCfZ26BgER9YIdbAKu9FuSwvh93M+ZltfTk80W9iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkBfx/l9iagbNUpoi5UOIkdraZuckYU2lQPyQLOnLHU=;
 b=K0/GIElym/JmiWMeoNjA78CKF2Q231TgMj5bOtooNfQuxwpkwWomzHrnfkJsf8RYihPxkcTzSfmqQYOAzki5xJv/MmbY7fpQ1ixL0ur39nImJLwlJTnZP7yM4TwC1QXiwk5KZ0dQWB7O6kwNTAUYnvgCXP3ZP1K2DCIJ/ZQ7CGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Fri, 16 May
 2025 15:35:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 15:35:17 +0000
Message-ID: <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
Date: Fri, 16 May 2025 17:35:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
 <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250516145318.GB720744@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: c41e24fa-0693-4bed-e88e-08dd948f421e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUwvbXpmWlo4cGxVQWpBTEs1ZkJOY0hKM3B4Q3A2SEdRTGdVSTNlZStSQzRJ?=
 =?utf-8?B?TWhJbEYyM1FGalNBc3V3ajJjVlJIMERBcFhWcTFLS0RhUk55VnhlUzlwMkpw?=
 =?utf-8?B?TkpxNk4xQXd2SE1ib29vejF2TmpIWWdiekVoWEl5S1VDdk51MWJUTEpLQWpR?=
 =?utf-8?B?ZWh1ZmNVQUlnRW1HMWx5ZHBuRjA4NlpnRVQrL01BeTFmaHdWZGI2bVU4cTVM?=
 =?utf-8?B?OVVOM0pEaEFRelJoYTlNSVdIRW1RaDFaZUxzS2tRQ1htTUhhRTB5MlVGd3pI?=
 =?utf-8?B?MU1kSTNEaTJIdXphUm5tK2VrWnM2TVB5NW1nako0TlRXOVQyTmc1T0Q3cm0x?=
 =?utf-8?B?UkxCT0Z3RHl0ZmZwZEVTdiswOCtoRjVzNGhpb1lEd2JPcDg4T25zUEdLQ0wx?=
 =?utf-8?B?b0JiTWpJTU5rUU9CNTFhbFFBVXBJTlNBNEJXYk81YitOa3FpTVN1OXBUd01o?=
 =?utf-8?B?Y2R5ZzBDNjlObHN0bFN4dlc3K0RuYTFLSG9MbGhyZEdWTkRkYjVaeVpTNlkw?=
 =?utf-8?B?aTJ1RkVBcndOSU9rM0Q0SEZJMU1jQlZjdHgxd0Z0S20rbkp0NlAwTVNvRk5x?=
 =?utf-8?B?MDFxZWk0QmVIdzhVYm0wcDZiWmJQSjR0NEpGTVFxa2tBMjBxMW93UnJXWWx0?=
 =?utf-8?B?aWZFc0dZYy96dVhtblZLcmNNOFF4T3YvYWdndGJKb3lnL3ZDRzFURGh2OCs5?=
 =?utf-8?B?d3pPL2V4TU85UGs2WnMveEVJeitJeVBwaUV5em15MEs0Tm9YN3owWGtaMEp0?=
 =?utf-8?B?S0pCbnRvVzFWVnZDam5qZU91Qk4vRmh0a0w5Mkg4d2FYdW9YSnoyanZNTVVP?=
 =?utf-8?B?ZDhtZFVrZWJoU3FIOTBQVDl3eHJML0dJMnJWOHhSVEo1bk1lTTZJVnY2cGNz?=
 =?utf-8?B?S2o4SXQrWSttdXJIUlpkZ0tKV3NQcDFtV2Z4bGIwNmE4bzByVmdQNG1jUzVL?=
 =?utf-8?B?a3p4dk1TU1JYSXpuRXBlSTdxV2M3ckE5WC9yM3VmSkNUUlQ4TFBpNDNPMktl?=
 =?utf-8?B?Zk9tRHVzSkIzdWo1MHJkWHFTcXJSUlNqYkR0Y09BOTU4WitKamErUHdWWTJm?=
 =?utf-8?B?akhocVNUemlTeG91cW0rKzZjTnFvRDRuYmVENm1CcFo1SlFyZ0NwSXltRTRR?=
 =?utf-8?B?N3BJcjJXM2ZEb2ZLY041NmY1enVFdjVINnlNaWlSWFhLaVpEY2xWV1lIQWpn?=
 =?utf-8?B?VDFpMjU2aDR4OG95K2FtcFRaSU9mV1VEZmtMb2N0dUl1YXlvMXhwTWRtVUVr?=
 =?utf-8?B?MlFxdXZUVG1ualpLb0UzRU1ybFYzVGxOczVUNjQ4V253UW0rZmJlcWJkWnRR?=
 =?utf-8?B?U0x4YlQ4ZVVWMzE3S0ZBUzZ4SHE4RUxOeE8vT3JJY3pQZ0hMWlgyakhCNEJs?=
 =?utf-8?B?YjNMZ3hBc0xhN24weEl1UUxsUEpIRHJSbkErbHJwbzVwYVQ3QVZmeTcxTWpC?=
 =?utf-8?B?VFRWUHJwcDR2a0RJTmxHeVY3OG5ETzk3TE56MW1uTzFYZzc5NVNlNEVOd2dy?=
 =?utf-8?B?VkZyV0tFTWhKTnpjTXpLdjMvd2swaXBndWVlQzg2VjU2OWtZTHkwTzhZaSs3?=
 =?utf-8?B?LzcwdjFYc25USTExdHREcDZ3cHRVTVhmQ0puMndNSDQrSy9PTDVCSlJLbFN1?=
 =?utf-8?B?ZEJPK01Uc1ZZOFNzQkd3YjdDdFZZVXBaZVBZQnkzaWNMMG1IVFo1VmdUVFVJ?=
 =?utf-8?B?MFpFNmRpZ28yRVNsYzBGR0V6eE1qNkNWQ1BoZ01MZHdvN296cUJ1OVp6MWdV?=
 =?utf-8?B?RzF1VmlndStZb1NhNXpjaERXVWgyZDZ1QXlMVEJUQXZDTGc2VXI1UVZnTlor?=
 =?utf-8?B?YTNqQzdra2FnSFh5YnM3QUorUXoxT1Uva202YitBRy9nTTJkUGUyOW5CQzE0?=
 =?utf-8?B?aDZ5SzBHNVZJTGlNc1Z5MHJoT1B4ZzZnT05qWWpkUzgrazNKWkNpSnBmRHVj?=
 =?utf-8?Q?iFPh26jJ5BY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnVkNzNoY2orc3RKWjdYYVBCdlhNVWJvOTYrR21heEltb3dmNzJZNUhxU1Vm?=
 =?utf-8?B?VERhQXVpRlVEdU5tUGZJekNuRTFCWWVBOGtxVXFqVDhtejdrTm14QmhtRXJl?=
 =?utf-8?B?MkxZU3ZqS3NoZ1F4L1hTZXVRbkdXcmJtbGU0OVg4SkVublRJWU5DeXh6MjFS?=
 =?utf-8?B?cUx5TVkvcjB2R1U0a0loWWM1QkVVNSt0cDI1UkwvL2w2Q29KVXRudWJ4ZHdp?=
 =?utf-8?B?aHlacGJtT2RDQzRXbnlwZTFSd0RxeU1CMlhBeTdQUE1JRTU0eFZpU2ZYRUoz?=
 =?utf-8?B?cGdWQ1FBNUx6UFd4SDZGRXlVZi83K1lVUFQrN2ZESHd1V09tL1VabTBkTlp5?=
 =?utf-8?B?Z0xkQmVpZTRRSjZOOGg0RzNGcWlCL21ZbVlFWm4zUkhxam5PWlFXd2JCNkJt?=
 =?utf-8?B?Zmp2MWhoTUxENkJZdUhDMVViM3U0UTJ6UmhxMGM2K3p3NktqdVVjTTI3dFFJ?=
 =?utf-8?B?RC9JZ2k3YUtLVC9BZG8wQjZFZUJqUXVVSG5NNU03QklXMEVTK0htLzE0OXlv?=
 =?utf-8?B?VzRDRnBaQUtRZHNNdFg3U3NKSDBaQU95UHlIcUdXYURWcGJERUIySUFrUWFD?=
 =?utf-8?B?YUtNOHRUSzFpc2VpSVdXQ0l2Zzd2NDZqOG41czZTOWNsRnFHVW04Y09SYXBv?=
 =?utf-8?B?aXF2ZENYcFhPNVlOYzZIRHRWY3IyajdFMmZnaGVzWVFCSEFDR3pnL3N0d2tZ?=
 =?utf-8?B?NTBwc2s1SXBBbVM0WUJHZmRkS3R2NkVON1RXZTI5R0RFMkZZL2UwdDE1bFVP?=
 =?utf-8?B?SFd3S2x3Nm5NMmw1NnVNbVdZaUFNU2xtMkt4ZGhJeXE3d04xTGpzcWJuZE93?=
 =?utf-8?B?a0wvTVpka3QrS3ArdmczWUxUOGdnaFVGZS8zMVJFalJVUVVJRXZ3R3doZ0l1?=
 =?utf-8?B?OGRHcTN0K0ZXck5SMkcxZ0xyOXEyN0h4WHJUWVROaEdDTVpTZWZJcWFGc0xR?=
 =?utf-8?B?TUV1elUzY04wRnpDcXZlbkhFRmh3OFpvSmlLQk45ZnhGRTF4eUUzY2lYZFMr?=
 =?utf-8?B?UksyR2ErYjdPc1MvRE96dXhKZldjWHZVcWtRWGVxMEhiTUNkOGFOc2Z2UGdY?=
 =?utf-8?B?N2EvRTlTeFBrRGdQUUZ1YUN2REtqS1I3RktwclVqNW5CdVl1NXpKNzNHTFpu?=
 =?utf-8?B?eVpBS0hSQ2pNcHZzZjZvalhJSmZuaW9JbC9FNEJ5YldiK1pFN1dLdlpjYlBT?=
 =?utf-8?B?RWlyTk1pNU5GVHdySzJQc1VRMnpYN084TjRPQUx2UVM2UzVqVjhhTlhvMTlW?=
 =?utf-8?B?cS9XTWVJNXh0V21yYjhLQkU1aVVFYW0yNm9oOFl2eFFwM0pTM1loV2JONEV3?=
 =?utf-8?B?WXpWams2RDZ1ZXU4djA3bXoxeDAvQUhhMEg3aGkxY0QvbWhXTHdiT092ZXFS?=
 =?utf-8?B?WDZFVnByNkhteFZVNWVlekVmblc2OUgwa0dJVjQ1Vmt3Ylp6OW1JSTBhb0ly?=
 =?utf-8?B?d2RGZzRtazNIMEpHd1BIOVJIVjlhdXVMaitRR1c0blppb2wxQVE0MGtmcnVo?=
 =?utf-8?B?VmtzeVFxNGhlR3FJNTVTNm1iTmVYemhRalVqOWFHMG9XazcwVEF3RExzd09N?=
 =?utf-8?B?bDFxZFN5N0pNekRuVTFyTmRmaEN2ZlhiNEgxblE3YkZTbllCK2dEUnJmMFc5?=
 =?utf-8?B?SFd4ZjdCS3BvM0wxdjRFWnpCL3I4Q3NTcVNMZ01oNlB2NCsveWExNGlQRHZD?=
 =?utf-8?B?Q2ZxdzlrMlRDWmRZV2FVSVlnN3lJdTRsVjRYQmpESHhGVGpLOTZYK2NYYkdP?=
 =?utf-8?B?M09hc3lvMWRQM2VyM3dpQnRiRFNGL2VxcjRsQUtNUkVYS0piWEpiNnhpZDkz?=
 =?utf-8?B?WkczWWdxSEFmSklJS2dpSFc0alVPam5mbExXbkFkeUlLZ1hacXpVb2RBTkVt?=
 =?utf-8?B?WTg0UjA1V3ZQMEFNNzlmUFJKSDFVY012VExzOFlGRlFzRXI2U3N2WTk3bmJl?=
 =?utf-8?B?SnFnMGZOWW9SV1QvZ3lSWXJDQy9aNHBUZkd5L29HS0s4VzhKbUszeDMyNmtG?=
 =?utf-8?B?Z3lmclN5OHJJV0twY1VMWVhUREMvR25oY2YvWWxQTmhDSmZWVWR4MDdYakxk?=
 =?utf-8?B?a2l5WXpKanpiSWdGaEhwd0Y5MFdhZGltL2ZVQzRKclYzL3pHcTI0VE9mVjNM?=
 =?utf-8?Q?xd7laoqwOhygqcdrjCPjcGlSJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41e24fa-0693-4bed-e88e-08dd948f421e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:35:16.9454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gq7Mi9EAoV85lZDJw0RRb1j656t5GNQNBLoy3GieuxwjO6VtSSrTlj+CDQDN6CBu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930
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

On 5/16/25 16:53, Johannes Weiner wrote:
> On Fri, May 16, 2025 at 08:53:07AM +0200, Christian König wrote:
>> On 5/15/25 18:08, Johannes Weiner wrote:
>>>> Stop for a second.
>>>>
>>>> As far as I can see the shrinker for the TTM pool should *not* be
>>>> memcg aware. Background is that pages who enter the pool are
>>>> considered freed by the application.
>>>
>>> They're not free from a system POV until they're back in the page
>>> allocator.
>>>
>>>> The only reason we have the pool is to speed up allocation of
>>>> uncached and write combined pages as well as work around for
>>>> performance problems of the coherent DMA API.
>>>>
>>>> The shrinker makes sure that the pages can be given back to the core
>>>> memory management at any given time.
>>>
>>> That's work. And it's a direct result of some cgroup having allocated
>>> this memory. Why should somebody else have to clean it up?
>>
>> Because the cgroup who has allocated the memory is long gone. As
>> soon as the pages enter the pool they must be considered freed by
>> this cgroup.
> 
> Nope, not at all.

Why not? The process belonging to this cgroup has freed up it's memory so that other processes potentially belonging to other cgroups can allocate it again.

>> The cgroup who originally allocated it has no reference to the
>> memory any more and also no way of giving it back to the core
>> system.
> 
> Of course it does, the shrinker LRU.

No it doesn't. The LRU handling here is global and not per cgroup.

When some cgroup asks for memory we also give it pages which were previously allocated to other cgroups.

Because who allocated it doesn't matter in this moment, what matters are the properties of the memory.

> Listen, none of this is even remotely new. This isn't the first cache
> we're tracking, and it's not the first consumer that can outlive the
> controlling cgroup.

Yes, I knew about all of that and I find that extremely questionable on existing handling as well.

Memory pools which are only used to improve allocation performance are something the kernel handles transparently and are completely outside of any cgroup tracking whatsoever.

>>> The shrinker also doesn't run in isolation. It's invoked in the
>>> broader context of there being a memory shortage, along with all the
>>> other shrinkers in the system, along with file reclaim, and
>>> potentially even swapping.
>>>
>>> Why should all of this be externalized to other containers?
>>
>> That's the whole purpose of the pool.
>>
>> The pool only exists because the core memory management can't track
>> the difference between unchached, write combined and cached
>> memory. It's similar to moveable or DMA/DMA32.
> 
> And because of that, in the real world, you are operating a
> shrinker-managed cache for those setup costs, yes? And I explained to
> you the implications and consequences of that.

Yes and I explained that those implications and consequences are intentional.

>>> For proper memory isolation, the cleanup cost needs to be carried by
>>> the cgroup that is responsible for it in the first place - not some
>>> other container that's just trying to read() a file or malloc().
>>
>> That makes no sense at all.
> 
> How about we stay in our respective lanes of expertise and find a more
> productive way to get alignment on this, shall we?

I completely respect your opinion, but I have to point out that I have strong evidence disproving your that this approach won't work at all for this use case.

Regards,
Christian.
