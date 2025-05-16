Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799F9AB964A
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 08:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E2C10E9A7;
	Fri, 16 May 2025 06:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uEph1c52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5EB10E117
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 06:53:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f87eYxJWjPHYGu7V5glk9XnSwrvcTID2w0npfPt64iF6AGqqejjfLkgimOd4U3QfXu2Ja5LyVe5K4XJ+2xAPinxEDACL6Ljj+D4knj7SU5thTG94vB9FBcuC65N1zVweDV1J1rVvDY4cbSJpxXPxjYTlR+wDJ5JzC801glxK40+H24tlj3Btbi/4ty3asmernFS1e6b8SBQSNLzpzJX+HP8vfpFBy1Di7NYDlBgBTQJchHfVJXK1tSzG/30hqZeFvU0OvCYy/1OL2jHAO78GCYBKsvOv28pw2CAChDSHqAEKHBGfA9jdycFuvRSGPKnStMU87pVm+NR5WrLEkezDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5a0e/8X78RrVdFUyIMbe9+ulFFtgtEKEFB7z86hh25o=;
 b=Zrxc0mcs4RKbofOQpkgyFIZHY5x3qTn8bmeULZS3l06y2Gi2s7jQEt97Om7TS28CXgxwd9RyUSAXaiyuPKvddTi7ecHPY4BEqkkeTx8rM56BUnoN8oqaOyTeY8mqjCIB0gzzKEI1Q/FB5SFfZ65Cu07FeEAm/aHNEtBXeQmu1RUzYhjx+0JGP/gSU+9VL7oOdFzSvbeM4nvFrcF2MWLqHrTpiKeJIBabMJyUCiBGXMtURlLUC443Ise1BsFj+5v7kTEEH7tsOhvMb2ZBjCZd0ZlmjJNcvPRJI9j9qMn/hFDmE2If2kqbFM405Iac/LAsI9AQqvzZhLbvN5HwXj0tKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5a0e/8X78RrVdFUyIMbe9+ulFFtgtEKEFB7z86hh25o=;
 b=uEph1c52skg8LCX4LaiCWwkWZVc67MmyTbZpe/v8fHmTEab0EttO8T8lbKjhmmiSS47/JEDs3A+eHO8vamQ4CglYxOVFvDJXhwrLg1XY07yQctdd3Ot/E6L31wwrp8UBfU1SouiXAKcNTHFS+P9k0qwIFdKibUGLieewR2GaLxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7268.namprd12.prod.outlook.com (2603:10b6:930:54::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Fri, 16 May
 2025 06:53:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 06:53:13 +0000
Message-ID: <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
Date: Fri, 16 May 2025 08:53:07 +0200
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250515160842.GA720744@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ff55e8-ecb1-4b74-36c8-08dd94465390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z01uMDVCbmxCTE55OHFOYktLTVp4L3RyWCtTYTJPM0xqSDVqdzU0M2EyTnFT?=
 =?utf-8?B?aXRhN085MTh5NXFQQ0hFTU51ZDlMdDgzTGNrVUdzYndzZ0VFcS9waDd4bWkr?=
 =?utf-8?B?OU5SK1VrQ3dpSVhoNnJhRjc2ZnJZb2ViU2FNU09IRXdiOGxZY1pVL29NTkUy?=
 =?utf-8?B?WU9HWHhlMytHVENnVVFlNHRKamFIQ1gxUitGNGVVekY2amRURmJRZVJuYVM2?=
 =?utf-8?B?UmIzRGUyMER0RnBnZkRBT3BGMzdmTHR2eWVoc1MzWVE5SlRFUHdkK2hZV1Nz?=
 =?utf-8?B?R2pYdTdPajNzNmV4TXBvc21OaGNQZjErT05SRjVWMnU5aU5hVFR4RjJYU2VX?=
 =?utf-8?B?d3N1VWgzVVZMWU1rOXlOZ2ZKR0dwck9YMjdJYzE4N2thTG9vQnZQeHB4VTJt?=
 =?utf-8?B?eTMwdG1oN3krUXMxZWltZitSckJCOFByOUNhYkZwWXplcmI3TS95anVGZGlM?=
 =?utf-8?B?cXYrY0txVFRGL1NhWkNWdktTY2Y1NW5Fd2lVS2FtVWhaSFhOTmlMcGdmZThL?=
 =?utf-8?B?QXBzS1MyK0cyU00xU3ZIK1pKNlNBd05FK3oyK256Z2ppRjEySDk0RHJObVhE?=
 =?utf-8?B?WE9ncmVpZzFrODYxcURIWUN2L2pCdFJDTk5ZOGViekZxY2p3YVdSTHJ6TlhG?=
 =?utf-8?B?b0V6ZFlDOHA1bER4SUUxUzFobWxiYWRJSDQ5SW5BRFRuVnpsMWI3TWVBRDUr?=
 =?utf-8?B?N1dEaHNySlBOTUd5MStwamp3UzBOR2c3VnBjRkJrR0xPN0ZURFhUWkw5d1Bu?=
 =?utf-8?B?QlZFTGU5NlVQUnNZOTFNL1ZNZCtSRjY2UUY4VTRWeU5KMFFwQVZHR2xUMWRV?=
 =?utf-8?B?OXRxZjByajhQUGt2cFhXYWhTODNSTnNreGE5Y00zZm5GWUhmcFk2b3VqdHZN?=
 =?utf-8?B?QU51WGtsQjM5R1hETjg3L2hFdDNCd3lZLzFLb2tubUlrUm5EeUhWaituelRT?=
 =?utf-8?B?bklENHl3Wm9QdFRrVndRRjI0UDhXbmVkbEZ1Tk9RbG1MdmJ2ZFhKL0diMmtE?=
 =?utf-8?B?R1AyVU5qa0VSMFg3c2VDNzk0OTArbHZVMldvL2JUSU1hVkg5TkJ5QlBDSVZG?=
 =?utf-8?B?NmZjcnFhenJORjhwdVBTMXlHeE40VTBUeWNaQ2REbjNObzN4S2RWaEM2MEp1?=
 =?utf-8?B?L3puSXpSM21zS3Vyajl0d0V2d0pEUWhEcURSem9ZcnNMRWZ2WUd5UnFkUHNh?=
 =?utf-8?B?dkRWNGFwRWR0WEJxNHNsSWg0YTZ5bGo5bWUwYUhIazBLd004TDN2K0w4TE1m?=
 =?utf-8?B?dVQ1N01DOVpTbXRXZHNwdlhyM1h3OWhaVDJiYW04cWNrOHdHTkxpb0lhS0N3?=
 =?utf-8?B?d3JZa1laSVhlSS9Xd0hjWWJKQi9EK0E0ZmhwT2RmQTJwSnFTMmV3UHo0RTJK?=
 =?utf-8?B?Q0hMbE54SmM5SWhMQkhhNVB3N0JpQzl6Y216UFhVLzVoRGkxZ0lPMVdGT2Qz?=
 =?utf-8?B?ajc3Tk5uSTlOcytFY2xHN0pNcHJQNXVQOVV0UUI3WWUySUFSYy9XcXo0UEpx?=
 =?utf-8?B?TlBUSlFyZE9yREl4dE9HWkxtcE5zakZLRnprbVB3YjFRa2NwNkdRU2RFZStv?=
 =?utf-8?B?dml6MXcxbStyOTh2dE5SaEZJeHQyL0lQSm9uc3BMU0l6VzVwRmdCYS94d0lP?=
 =?utf-8?B?bmxXQm45NFMwWG9zZW93Q2RvL082dEpqSUtFcGEzMVlNWmdtK1JaVE5uajk4?=
 =?utf-8?B?NXdnUllPMTArbmlFMTVWa3A0bGpaa0o5RWxhYXNwQXp3eWpWejVaMWljWisx?=
 =?utf-8?B?QVNsUWtPMldKd1dkcG9vWWtSZVlnbnpnNTJJWlFVUGJwSGF6WklRd1VHdDRT?=
 =?utf-8?B?eEJVZXpWb0lWditScmRvNE5GRmg1bkFjZ1NoOXN3ZGdudEt6WmEwL055SnhM?=
 =?utf-8?B?YkxlcEhNNUxDZzlYWXovcFUzYmFJckpucUllUW9uKzJVaExySGNsUG9pL2Jt?=
 =?utf-8?Q?4G8k4oAJtRQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUhvNTdrQ3FUeit0MTQ2NVl5aUJ6cGZjV0FCT2tSWDA2bmtXUmo1dktLemNB?=
 =?utf-8?B?VXR0YkgwMUdXV1hUamMxM1E0ZFQ3SnVad1pkblB3RWRWcTN0UlpCWFJwaE83?=
 =?utf-8?B?QTdFUlNBVUdFbFJJZ3pXZDBybGl3bFNBUmxUa2djQXUrbWszdDA4ZzZIYnQz?=
 =?utf-8?B?VEptWEYxS1ZTMGdkR1lMMVA0UC9rU09CYzNWZkFBam1VVHZDOENtc3hDZ2tQ?=
 =?utf-8?B?V2R6OGg2YkFtelVHbE5QL1djVHlqb0NNLzZCeVNwejVRd3Z6a21jOTd5Q1pG?=
 =?utf-8?B?OE9HTXgyOExtZG8xT0dvcXNCUUl3ay84UDVIVStpSnZLckZqNjlaYlZmeDB3?=
 =?utf-8?B?UGxKMzRqQTI0NmtxK1N0MzhMaVZTdGVzTmpMaGNHNGliWVZDQWdrdERrZWJ1?=
 =?utf-8?B?MkhlZzlZU2NPcG40RXhCanBRVU5kcGZRbWRNdUQ2aWt6bmVhMkRsNWllQTVn?=
 =?utf-8?B?R0crUjhQSHpNaW92UnYyeS8vWXNQRzBUR0VHOHJ2MmVsR3RwelAvdmQ4UHNa?=
 =?utf-8?B?SjBGdWk2a2hRcUxEMUhYQlp4L0p3ajVtekRXaDNNWTUzWmRYZys1TlBLaVJK?=
 =?utf-8?B?RXZhRVUzMlkvRzJlakN2d2ZOSkxNWjZxNWt0RnFrbHQvRjVlMC9LZUVJclYz?=
 =?utf-8?B?cU1MQTlYSy9WTWtTOWxNeGUwRDRyTTFadzNZSmg4cDVlSFpYYnh5Y0xXSVUx?=
 =?utf-8?B?T1hUbjU1RFIvcml0aHpLekswVmhpZ2tqVGNBODlJYzllOG92WUYxTTdWa3lX?=
 =?utf-8?B?a1JvME8rMFBtZHVtbjdNelhEdGkzVkVidTAvVUp5MExLemtiV3g2TnQzM2lG?=
 =?utf-8?B?TlZRd3Z3NnhjY0RvZ2pmR01JRStzYWR0SVlVQ0NyU01xcjZWNGFIK1FBSTA0?=
 =?utf-8?B?NXczWFdzaThlK2ZLakVTRmp2RHYzanFUcU02bVRucWNPUHZEd3U1M2drSStI?=
 =?utf-8?B?V0ZMZlhBM2w0UVcyUk5TQUNoN1loRlRxeTc0VjFQM0hmZVZoK0NyRElKYkJY?=
 =?utf-8?B?aEhmbG9OYlpVeDlWOVc0N3ZYOHJSYm5JenQyaEdhUFoyNDVsekxoSUFvaE94?=
 =?utf-8?B?ZU5ic1FRczk0bndwTTgwTUNIcFVRV0M2cDlwUXNrZndkR1R3TTc5M2tKOWpn?=
 =?utf-8?B?Si95eWZXYVZUVUJlZUZGWlJUTXdRYmF4VksrcXBXTE16aHgya3BjVjJmZUlS?=
 =?utf-8?B?bVM0Q1hTUzZIMWpqR1ptOTJmVGdrWFYwTytENG40OGRaUjJwTmQxUEUrcXFE?=
 =?utf-8?B?MENrVityN3h0RU55WStFS1VvYTlxY1R3SWYvdkRMbk1PRnFZeVhDeDcxNjN2?=
 =?utf-8?B?YmVaQWlMTEZyTEZZd2RKemxSbk5pc0RqdzQ2OENITVBFVzd1UTNwYWk1WFZh?=
 =?utf-8?B?SndpRGRDOExNUlZtVWZqRktWeUV4bExwLzVDV3U1b0luMnhBKzJoUGRMR2tK?=
 =?utf-8?B?OTl5d3l4azJ2Z1NsSkM5NStXZE1YUVRsNGF5cXg2WU40RXFTRVQySVBYQWZ4?=
 =?utf-8?B?N2ErYVFCcEpEa0JRc3dqSW9WalZ0SVd1UTVrL0ZPaDZOZ0pZSTFnSEY3Zm8y?=
 =?utf-8?B?MUNNbHUrQ2tIZDRJdDlxMXI2Q1VXUGNSZGFHZktyTjZYbnIyMzdsOXhrZDFn?=
 =?utf-8?B?L1V0U1ZQQ3B3bTJTb2NDeklaNnV4MkFHUXZyQkFZTzlINDJ1QXo5Vmh5c3pB?=
 =?utf-8?B?c3o0M1Y4ZTk4aWxXQWVEVHlKV094eFRHTzlVa0Vwb0Y0VlptY29PQlhPRGVB?=
 =?utf-8?B?TUl1a2d0dE5ISkRJeVIyVG9nUkx6WHFwdXpCU1V6cXRqazhLaTBwMVErSkl6?=
 =?utf-8?B?L0ZwZDhuL0U4ekRnVVhEU2ptTGhBT3M2L29qcXdqcm01cndKTit5L1lhb1cy?=
 =?utf-8?B?Zkdjc1MxUDYwUmZNVEVIRTJTT0M1dTBQeVAzckJwdHVDNEFZYm5hU0RDV2xt?=
 =?utf-8?B?YTFSK2YxTFloelkwaUh0b0NTbW5JODlKV0lQb2JMaHJ4aXlzNzVGYnJCa0pR?=
 =?utf-8?B?SDJWeUxpNUVkTC9uSFBhamJySUxvZnVJc3o3QkFSNWlxV3NJdUczalVjUDEr?=
 =?utf-8?B?T1AvNXlFZXZMZVVNWG5vbStjNnIydFJHZitoenFwcGpMVHdSWjZ4US8zU3Zz?=
 =?utf-8?Q?98mjj0NNpgPaNu5xIIcdaf8X6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ff55e8-ecb1-4b74-36c8-08dd94465390
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 06:53:12.9931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lK9tbIiGifhegLZICQYj2e+XGJ3OHR/DseH6UY6tsSMa9CLxx5fV8wz7bVtVad45
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7268
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

On 5/15/25 18:08, Johannes Weiner wrote:
>> Stop for a second.
>>
>> As far as I can see the shrinker for the TTM pool should *not* be
>> memcg aware. Background is that pages who enter the pool are
>> considered freed by the application.
> 
> They're not free from a system POV until they're back in the page
> allocator.
> 
>> The only reason we have the pool is to speed up allocation of
>> uncached and write combined pages as well as work around for
>> performance problems of the coherent DMA API.
>>
>> The shrinker makes sure that the pages can be given back to the core
>> memory management at any given time.
> 
> That's work. And it's a direct result of some cgroup having allocated
> this memory. Why should somebody else have to clean it up?

Because the cgroup who has allocated the memory is long gone. As soon as the pages enter the pool they must be considered freed by this cgroup.

The cgroup who originally allocated it has no reference to the memory any more and also no way of giving it back to the core system.

Keeping the memory accounted to the cgroup who allocated it would break the whole system.

See the pool only exists because of missing features in the core memory management.

> The shrinker also doesn't run in isolation. It's invoked in the
> broader context of there being a memory shortage, along with all the
> other shrinkers in the system, along with file reclaim, and
> potentially even swapping.
> 
> Why should all of this be externalized to other containers?

That's the whole purpose of the pool.

The pool only exists because the core memory management can't track the difference between unchached, write combined and cached memory. It's similar to moveable or DMA/DMA32.

> For proper memory isolation, the cleanup cost needs to be carried by
> the cgroup that is responsible for it in the first place - not some
> other container that's just trying to read() a file or malloc().

That makes no sense at all.

> This memory isn't special. The majority of memcg-tracked memory is
> shrinkable/reclaimable. In every single case it stays charged until
> the shrink work has been completed, and the pages are handed back to
> the allocator.

To be honest I think that memcg is the special case and what TTM or the network subsystem does for per device memory allocation is the norm.

Keeping memory accounted to the cgroup who originally allocated it after this cgroup has freed it back to a pool makes no sense at all because the pool is exactly there to improve the performance independent of the cgroup who is allocating.

Regards,
Christian.
