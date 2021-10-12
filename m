Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63F942ADC2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 22:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680DF6E02C;
	Tue, 12 Oct 2021 20:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BC26E02C;
 Tue, 12 Oct 2021 20:24:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIcPCqbVR99wM63bDr7N3ZkA1vZsYY/AayZ3BnOIHvVKt8dFfNX5A8l2mpzFal2xWSMbDiwK2d4Nthrup/9BxIG3H0paAu4umGCUYTW8Mk5+70l8RSIs3SCfe/XsjLFecZju5LNVW3KagALc3vp2rfmd38D1NtbMQQJzpMBEXMZpVReGbLMBvzo78WSaFIEcDC5zpHhxixBSrC0tgEbrqYzL80Ohi4wnvQREe+bKX7wpUPqtjwFBD/oqKV9zrdfKwLRtbT4jLwIkD0QqIpusJdkNYp1uXlf9sfQQ3cVBfxc+sMsKS38N08F076URkkAC2j+80U6srJoYd2Ik+/yxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfLTBtOjsfBK9t4GbCd2wg07KeecqOPjvlkk2tiQ9qM=;
 b=eBb75Ox7eCOHv9jBSSFLxEcCSBBnt5aO3n0SDXubMw3DwcgNDnsYp7Y1CZb2rm81uKrgtDSzKx44X5q2P+jIO/rVgCmpJWmZ8Ikt80gN4zFBhR20LGISxDgXLxJJFabt9QBXNsK5E3udRvpi3nSxgyWvfGS9DxAAvVBwUk/jvcQM9bfwzco+t3qhM//cmgcnSWRhzV4l2cHVcG4y0c7zhh/SXpkefaN+JvZXV8TksQa+h0aRzrkG9TxZ12JaKwEhhBU+QTs/rzOycacgy/bMV12SzqRIliaLPrrkA2KvYZTjLe5gbgAigbHMZrgR5yyLDRNZX4NSq0nw8kPLEvd1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfLTBtOjsfBK9t4GbCd2wg07KeecqOPjvlkk2tiQ9qM=;
 b=Y3/HDMb5oQH6rwEN/pzfFZr7RCpY4jMx99nxwZfzfHbD9LgnOBl9IdePhy4c4fj+ZRxhfqSJAjAuESkOedifVZJ7W1v43XyHGZMo4FGRKwLQ7aTP77bVQFzEM6Dk4pyFBMr5P0WfRonAJW8KbVwbkreifqqQsaHdRVZiFNHEPj0=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB2491.namprd12.prod.outlook.com (2603:10b6:3:eb::23)
 by DM5PR12MB1514.namprd12.prod.outlook.com (2603:10b6:4:f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.22; Tue, 12 Oct 2021 20:24:27 +0000
Received: from DM5PR1201MB2491.namprd12.prod.outlook.com
 ([fe80::d153:3aa6:4677:e29]) by DM5PR1201MB2491.namprd12.prod.outlook.com
 ([fe80::d153:3aa6:4677:e29%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 20:24:27 +0000
Subject: Re: [PATCH v1 00/12] MEMORY_DEVICE_COHERENT for CPU-accessible
 coherent device memory
To: Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Sierra <alex.sierra@amd.com>, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com, apopple@nvidia.com
References: <20211012171247.2861-1-alex.sierra@amd.com>
 <20211012113957.53f05928dd60f3686331fede@linux-foundation.org>
 <YWXd0leFtLepunVa@casper.infradead.org>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <1bcea911-58c6-c730-35b2-e8f1f8eddcd8@amd.com>
Date: Tue, 12 Oct 2021 16:24:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YWXd0leFtLepunVa@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::23) To DM5PR1201MB2491.namprd12.prod.outlook.com
 (2603:10b6:3:eb::23)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.118.126.231) by
 YTXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 12 Oct 2021 20:24:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 314dcfec-4399-4574-ef80-08d98dbe49ee
X-MS-TrafficTypeDiagnostic: DM5PR12MB1514:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1514ED2B59AF15EAC14AFD8D92B69@DM5PR12MB1514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WesRePnrRPBUwaZgwHc8HWPkOGiMgWga35eBUMOlOUcqCqQIqBgl//NdYxETbrGVih4DcuRgmaPhaI9/XUQovmkvVgBvTrQxdfEQRFY9duz9L36kK1dUhWciZPv17MzXWqxjfr6qz27HZw/deWRsbtU8O670wkWvNHex5EQd6U5eSQGerA1hFeeM71y2Ulf/PFAEam5kEV1/W4E2U3DrYOJ4pLiTbnewIw9lWRAIIbNpAkiBvEt8qeLEe2sWVXwzeQzi2vjnm2eq9nxLFgEJOq6L5tQLX3bCrgRvqzfShI1pn+RINgU9jYJ3VvSSzKR0uwfiZfrcbPXlXeIrky22OO2PAZcNR+jAMapHnl4+Jo55V0qVfaXvPeX4Yr9QZ7o4caxdBqKxjh6IuTBu6vXhddCV/rlu+iUacJvCrFfEUZfkyrGe5Y3UGquDstrOoEOPo7t/VfGNxxWdS54WX4/durkhmovCmmFHhCB0F1cAR+eKDTztxTQQ80bOblQu+pu9b/5/VWL8J6JCj3mK9F1WauDuJ/1zYZncq/awUTouQoaVUygjaYaweRXfmKiOkZeH7wRbDWyJTmuY9qjnzqDOl2v3GCXWg3NoAcPs//ZpjW02H4Sp/OM2XbC63S2psxprQmbgo8IsWyD65ac8fyvZi56c+KjCd93+5P0Op9jhfd9JaJlZ55NNbjsao7wtJDwWX5euhU8qbhrDi0UjIMOReP5jbGPpkRKWB1KRAW+cDpQs1ibYMNVox7g1KiXTCab6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB2491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(7416002)(6486002)(8936002)(5660300002)(4001150100001)(186003)(110136005)(36756003)(31686004)(26005)(44832011)(956004)(31696002)(508600001)(66476007)(66556008)(66946007)(2906002)(86362001)(4744005)(2616005)(316002)(8676002)(38100700002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXRjS2lISGFWNkxsTWd5QlhMWWpTVGFWWTF0bDE5bDBHaXk4MDhOTDZBQUZS?=
 =?utf-8?B?aHBQL1p2U2tCaXFBbFB2L0J0MTJzRTlPL2NCcnhLdnQ1NTR0RzlGT1RPZ0NW?=
 =?utf-8?B?d09zY3BleFFObk5kUGZQTXhrNVhZL2JGVWlJYldRaU4vd2t3THQwdEd5Q3NO?=
 =?utf-8?B?UkQ3ZThCdTh0OHdnZ0U5RHM3WThHYzF2QitqZkw2aTFCM24rak1QNE40R1N5?=
 =?utf-8?B?NnZwcG9UYVoxaUxBYklBb1ovRU9TR2JBS0ZUOFdLRmJsY0JoLyttTTlQdGkz?=
 =?utf-8?B?azJLZW45QUJjOWhzQjBDcmdoL0xCM1JobFlxNFhzU1BxNW9MbmxKdVRYT2hR?=
 =?utf-8?B?YzkzTkV3OGdvbHZLeURsOHY5K09hcmFHRGd4VEp1bEFQdmVzRkI0MVdGYXY1?=
 =?utf-8?B?ODFoOVM2dTRYc2M2NWJDOGlOUnZPZzYwdXNoaVJiM2VYcm9PYVNPQStybzcy?=
 =?utf-8?B?QnBoVEdrZkhibEV6OWpiejJmVGxFL2ZlemVpQ0VrQ2VwZFF0RXd0RTB6eWlo?=
 =?utf-8?B?RVovRkdHSnRUWE00UHZ0ZDlISmUxdG1hNGY3cE0vVitGbis4WDY1eHlKTmpj?=
 =?utf-8?B?RUtWYjQ3NFFRVFJLamh3aFpzV2JZZ0xrYUloYlBWc0pGVHk4c1I0a3lxM2lB?=
 =?utf-8?B?RU4yaklSN1EvaE8rTGZWNHJuazJ3R0FQb2QzVjlaKzkweEJheTUySGIzN3dP?=
 =?utf-8?B?RGpRTXBJTHFjR285emNLdXdZYlhWLzZaRVlQTUZmWjFHdDkrTEhDWkYxSlFD?=
 =?utf-8?B?Y1Zza01aRjV4KzNWSEFIRW1qSS9NZDhoN1lTQ0toRHpXVHZObHFmcnlmMnBt?=
 =?utf-8?B?dGd3WVh5WGdzMEpaekt1QUR1R0tuV2hBNXlDcThWVTFDMjhJWFVHS3VpbWdj?=
 =?utf-8?B?ajFoOFc4VStENXNQNHZTMzdmLzRRU2l6ZFg3YWFOOFNHbVIvN0xLQUNQSVU4?=
 =?utf-8?B?NS95dlU0c0xTYXVIYjFoRUl3UXhTWEJBSXk4bC8yTUYzZTEvcmtIWFp0NzZV?=
 =?utf-8?B?T3V1dER1elVBQTRGQVArdUVBMTk2WThKSTNqVFlabWlBTXVXOVFEZzZxSHB3?=
 =?utf-8?B?aFlSeDQyT1NFVmVJT3BFQUhjSlVGdDhGaWN4dm0yMlVIS2pmbkIrd0tzQmRi?=
 =?utf-8?B?SEFvY1VCYk9NVFZ5bkhxTFRud2JsL1kxNHM3dzU1cmlXWnFiWnNyL1V5OHJr?=
 =?utf-8?B?R1JINVFPclF5WWtmMCt5TmN5UEpqV3RvOHYvWVZwLzh6aUtJUzJXck81dDdE?=
 =?utf-8?B?TVIxcFQwTFN0VmNGN3ErK2d0TmlTNisrQjVzTnB2dTFrSnErL0wxSEVYcTVl?=
 =?utf-8?B?bm9DZzZuZGlveHZkWjVJSmExb0YxVW5WSmd5TWc3c0ZLYjFUUGM4KzBoK3Jk?=
 =?utf-8?B?aTBYdzc4YjQyVXdQclhwRHFSMU1MV0w3SENMZjE5TEk5WXZLV21YY3JpcVVL?=
 =?utf-8?B?cG1SR0F3QWRISklFWDZTclcrRGR2Uktrb2U2NFcrNkw3OS9NS0dWaTJjTmh3?=
 =?utf-8?B?QXZWRC92dzMvWUFOaVRGTjdUTHArNHlKYmZVbmFTSTVoVWJyK0FYUTBEWnVs?=
 =?utf-8?B?cWFwMEYzVW9FU1B6d3lwUWY5U0hnQ2V6T21jMFFiT1I1bCtMQ2RYNGpacEty?=
 =?utf-8?B?cDM2aHpDbWM2Kzl3K2tqMUZQLzFreDlKeExDTG1tRjg5ZDRhUGFKdlZlRGw5?=
 =?utf-8?B?MUxtMG9MSHdhZElCemQxWmNxWnN2RmlyS2N2bm0xQ1EvMWNFc0lwNDJyL2Np?=
 =?utf-8?B?bm5ISlE5RFF2bTlyajQrcGRDWUxLWXcyaHM0UlI2QzRiamNRMFhsOEhhWFZq?=
 =?utf-8?B?UDZScFFib1NMV3oyeVhZQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314dcfec-4399-4574-ef80-08d98dbe49ee
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB2491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 20:24:27.5313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByR8m+Cis0cHUjsBNF7TijElqt/m/qDdu2o3tbB/XzUo0BkeRcokv0B2GpEsyUYUatkysCoGPbaHyV/DgSUO4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1514
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


Am 2021-10-12 um 3:11 p.m. schrieb Matthew Wilcox:
> On Tue, Oct 12, 2021 at 11:39:57AM -0700, Andrew Morton wrote:
>> Because I must ask: if this feature is for one single computer which
>> presumably has a custom kernel, why add it to mainline Linux?
> I think in particular patch 2 deserves to be merged because it removes
> a ton of cruft from every call to put_page() (at least if you're using
> a distro config).  It makes me nervous, but I think it's the right
> thing to do.  It may well need more fixups after it has been merged,
> but that's life.

Maybe we should split the first two patches into a separate series, and
get it merged first, while the more controversial stuff is still under
review?

Thanks,
  Felix


