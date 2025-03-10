Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A88A59933
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 16:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F125210E2B0;
	Mon, 10 Mar 2025 15:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x5mfVe5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F63B10E2A1;
 Mon, 10 Mar 2025 15:09:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONspvDYbs8RDqps/8aJCQpVn2bfsJXpGN8kN2POpJEfucJdItzOzPr7zwY0AK/76KxZWS2u6dc/ofbMQjkhZgvFZk+PnUGIAaQOFKeoVZzW73SQ2gS+Hx1HNEynki9siyfVAwqpYJ0p3dTCDORSw3DbGUoYWPhN7KWOLKyKz6NR6hx0kWcCzAYAfeqgZOB7VsQL6UDMG3DLSCpnUOg380uTQGBrt9qdJU4gIVeMEWraPW8jN0qaJY1BPjSSoPoVufXPNRkFTRWBplh+DneQ8YMtSoLyTgA7pafFOq6airZQyY/jf03rvMVZoTxCglzYR3Z4j4R8E+PWtrcPm4TwdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yFLX3i6eO5J5h2GUaj1DGMnI9Ph0kJkraJmhYgfxoY=;
 b=tIV3ZJDwdeaUOO2sjzHiQZ32HHHxtVA4/aNdvcM/fAyZ/j5FLslqXwIvxP3ZWKPiRaYDWkRxaour58eLRjermCAukRtEq6mo5P9gxP+tODfZQn3W40emyEToTnwt90R4JvtCBM5ffGf12UedFXok5T8WzN7Uck4IvnRFMdgsGAcvU/LuB/wvX5cL+QcO9yfo5KKJVQ04+7OGB0ecpE0Rz1wyBh+7ncxSRT7qvgK0Lw+6gLc88vOimQdjA4J6nHgDtNfk3UK9F6HB4+93N5SqwyirqpoH/dQiTjOCsP+XwHpQM0CGu+WPmfQDGCkbj82SERetUjmmFu6Y7mppPrfvYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yFLX3i6eO5J5h2GUaj1DGMnI9Ph0kJkraJmhYgfxoY=;
 b=x5mfVe5A8AMifDkhvgLCaick1L9ANhMbCLa0H4jUGRLBav2U4KLZLdAxhKpsAfLKSiXjxp85Ag+pcgrVLDxVul5Dk73JKCLswwJxUkl0o/lHasAtrozFcWUByH7VPmdcPkzyWNor+RbA3jkd7YNqjePWRlIft/rV5WmySrSz+TE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB8058.namprd12.prod.outlook.com (2603:10b6:806:348::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 15:09:46 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.8489.033; Mon, 10 Mar 2025
 15:09:44 +0000
Message-ID: <379160f4-9399-4c48-b355-eb2bd2d90015@amd.com>
Date: Mon, 10 Mar 2025 11:09:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 15/45] drm/vkms: Add kunit tests for linear and sRGB LUTs
To: Louis Chauvet <louis.chauvet@bootlin.com>, Alex Hung <alex.hung@amd.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-16-alex.hung@amd.com>
 <cf3528d1-9e56-4fe2-beb1-de7cb9c172f3@bootlin.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <cf3528d1-9e56-4fe2-beb1-de7cb9c172f3@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0313.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: a45310b9-0438-4e25-23d6-08dd5fe5973f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTkxTTVzc1Zwczk5Y2pobVh6K25pUVRIV3ZpR1hQUDZpTEhWUGpvL25Vd3R6?=
 =?utf-8?B?TFRmb2s4bDVFdE96K3luL21sdkcwREFOaDNTVmFHbzcvMW01UStvZHgzRzlY?=
 =?utf-8?B?VW9qaWNWb3Npa2NxeUIvZWR0OXFnMC9nTVZEbjUxNkNESjZtdm1jTXRTVXdU?=
 =?utf-8?B?WlhISUVVTUdqb3M4S2RSbnI5WXZrQUJBL3AwY0xCSmRFaXM1SmRITGFXQnhN?=
 =?utf-8?B?eE5tS2UzbnBnZkxBWWYzRHB3Z3VOVW9RcVJydXRUTjhydWJ1NDRnd3Vsd2d6?=
 =?utf-8?B?eEp5R0h6Rmw3UjR1TSt2R2JzTlNJaXJaSXFHcUsvdkg5SW9nbEc2Ty9heDY3?=
 =?utf-8?B?WHBTNnJlbEllMzR5NjBUeFpMVVkvd1d0eVZDaVRhNnVMWHA3blNNTW83Unl1?=
 =?utf-8?B?N2ZVMW41NlF0QzMvazl3bHJVdlhTL3B4bFY4SmJ6c2pYY1RmVTlYWjVya1dC?=
 =?utf-8?B?eDFodGpZcUpOSkFoamtMZEY1bHVvcHY0TEdWcTdOSnArcXVsNUxGUmRtNGxU?=
 =?utf-8?B?dkp5RXdjWFErbVdSSGw3aUNRQXJaeHF4ckNXOUQ0QmptZkovZWJ3TFJkc0V4?=
 =?utf-8?B?aUlkTFJXSmVnUXhKelhhT21VdVB5MHUxT3Y3Njd6Ny9MWFAveHZBQUhPWG9i?=
 =?utf-8?B?RUVZZDVMT3BRLzlxbFNvN1gvUVdBQ3pTQlRFYWVQbDU0RVFYZmt5Y3NVbUk5?=
 =?utf-8?B?ZncraURHM1lwalZhWFk5YWhuMGpGVjFDSVRJZHVsZWtLUjhvNjdVM2ZJUHQy?=
 =?utf-8?B?VkdwcE15SkJPRHlGdWwwVlMzbG5NMWgyV1BnaGhyUWw1anRSQmlmU2lLcnhj?=
 =?utf-8?B?TTNPNzN1UWdzSlpYSTNQZjRJVFNCL1BwcjVIMk1leVlaajZCSHdTSFl3R0Nz?=
 =?utf-8?B?WXl2VysvQnBYWDVhdUNLMFJSbC80V1p1V2dGbVNUQ3lRa29QQjR2NXMzQllP?=
 =?utf-8?B?MG45SFhROEtFWWE0ell4T0VaN09Wc2Z3OFRGamZiTUhwcmhPQ2RUZ01QREFZ?=
 =?utf-8?B?amROQXlGUW5RcVcxL3lDN1EwdUVmWFg4WUdMOElpM3NMbnZnL0VxUU93eTg1?=
 =?utf-8?B?dDlCYmRRb3BLTC9BWERReVRUUHZvMk5Da1NWRWptNy9VVG5wU1ZsV0pHQUVm?=
 =?utf-8?B?c3VjTnFvMVRUNlV4YlFQTndCRmp4eEF5UVpkM0dRNWp0NHpWRll4eEVsYjFV?=
 =?utf-8?B?VktjWE5iTGNyd2V5ajRhSmJaK2N3SnYvZzIvNkJCWERtaXVSc3N2ejBnZmxN?=
 =?utf-8?B?ZXhqdVA0djdwWnhDYXExL1lISVBQOWNrN1hBenR0WUlTV2djRjl3Y1U2ZzFN?=
 =?utf-8?B?VlZpU2x0S2dXQnR2Q2puMDJ6T3owM01ZWVAvZXA0cXU2WjBPNm5TczR6Vm44?=
 =?utf-8?B?bHBCUHpxSnlLa2h3dlA5b0w5eUZPZU5tUENMVTRHUWwrbURLdURTaUM5a0VL?=
 =?utf-8?B?cWZkVHpEVGZmT1l5MnlvQVNhRDZvck9PRkNkNjJueUZDLzJiaWRGSHhWQXpZ?=
 =?utf-8?B?elJleVF3NE45YlRSVEN6QjdKNzFuclg4c1Joa3NpSHlNay90cENZM0hBaTRM?=
 =?utf-8?B?QVZkbnBWdy9xaXB6UUsxNUtYalR3YWo3cmZmRjNPai9XZmIyUjNTMWNnQVJG?=
 =?utf-8?B?T3JWOWVUV3lERGhKNkhoa1NWWDN5ZnZNaDF3RkdiZWNsUlQyVGQvMEc2UFJs?=
 =?utf-8?B?TnA3akk2RlJGRlVKdWt6MWtVVFRQNktEZ0xGNGFXUmNyTE93b1VLTDhtTkRy?=
 =?utf-8?B?WXkzRzZQWTNhSkVnWlEwZ2MxTjJNM2VPVDFYUlNTSzNnblpnTGRKVU8vZ0FX?=
 =?utf-8?B?TFYvaG13TzRlWE1DUlRxQjNXbTMwYlNxUXlHdnFXbkxxcWZlcmt6eVcvTlMy?=
 =?utf-8?Q?W5nQnq++FdBhI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHB2ZUgwbTU2cGFodjVMMWpLcnBqTnFPaUF5ck05QzlJU3VOSkp0dDRDUklP?=
 =?utf-8?B?S2I1aVE2bFYzTzRIT1F0TjZTcWJoQU9PdmFyeWJYZzB6azlKZWVxTCtnWFJ4?=
 =?utf-8?B?S1hKYmVjVTZBVVd2dThpQXdSS0ExOWpIVXVlZVFXRjQ0S0dhekRReGpHMXlz?=
 =?utf-8?B?TFRCRGJVbmQrVDV3TkVsUUZrTlgxTysvYkR2WllwWFFEcmJkZEdlTXdiVlVU?=
 =?utf-8?B?K3p5cWlvTktzQm5LSkpRVlczcWkwaWRJczBZbjluV0JGSVl2UGJuelQ5L0t4?=
 =?utf-8?B?QlJMN3NKSHJsVDRPOU4xdkRXajBhWjRhZHVnNE1DNFRJdmRjVU1yRTVJNXhz?=
 =?utf-8?B?WUFFSEhBQWhsQ0Q4QnJXUUtFeDJVUWVaQjBuVkpDcVhxNUVUR2c3WkhJOE9G?=
 =?utf-8?B?N1hmb0lXdDNSWnY5VHdiWVFuOVpNN1RUNFVaSWFaTk9DeEVzM25oNXFPM1NP?=
 =?utf-8?B?akFRWW4xMkxzblU2SG5IMkJBUzByUVYrM3Q5MDBVZkZSa3BkKzRYSkpFVDB4?=
 =?utf-8?B?dkJZeEdJYnZmSndiR3N3c0ZzQU1lZVoxdHd1clAxUm9TMkRhckFZSGNhYS9D?=
 =?utf-8?B?UjE5c25YR3hKZXVkRlNkRG5LVlhocG0wSDI4UmNVa0tWa01XUHRiRFBOTjRF?=
 =?utf-8?B?MzB6elB2NUlHZTVqZ2s3M1luQmV2dWgvaTRCUU1KSHJycmVvcnZLc2trd0tC?=
 =?utf-8?B?S1A5a2J1MytaSmhsZ2VyV3lzaDQ5ZzV5YXZ6RzBBcnZ6WXlxSTRDanlvR21y?=
 =?utf-8?B?RiszamtFQ0VkT1BOWFVjSmlGZjEwMlFsNVovU0xWcUhyQjVKTmtHRlVWd1hp?=
 =?utf-8?B?K1NPYUlpMzgzY3hJUFFnNWcya1U1WEFVYkhOL1pnUTZRNGNkY3FybFlBZUxu?=
 =?utf-8?B?QkZTeGRwaW5TME14dkt3Zm1oWmx3Y1NhMVpaMjlxaVdKNVp3SWpRQm4vQ2pZ?=
 =?utf-8?B?Qk9rRjI1QTNwZzhJQ2RMSDJnTnJoU1hsOHdUcmtpTGk3Y2NQdUs4bU52SFky?=
 =?utf-8?B?Q25wL3Y2Nk8zOG8zS2d5YnBXeFFrZUJLNi9MbVJxZUlEeTEvZkVDdGhZb3Jq?=
 =?utf-8?B?TzdxUjkzNG1CRGFXWnRHcXlWUllPZ2cxcHF0Rmp5Q2x6MjdVWGx2WlhLd2F6?=
 =?utf-8?B?TEwrOHY2SlFkd2dHTUMydDJtNGljemI2YnhEeGVnV01hanVVTG9FTS9wVzRq?=
 =?utf-8?B?ZkhCUTN4bkMxczVNeEhjem5KOGI5by9UUGRYTm9jVnVOZmdqaUZ4aXN1NWxF?=
 =?utf-8?B?dGN2akFoVm9qUnZFWkswNlJDR1FFa3RRdkk1cC9OenJQL1RvNjlGZGphZDFl?=
 =?utf-8?B?eWNnYldLZEtMZVFsVGFrU2Vpa3c5VDhvNWR3c0ZPbEpPeVJNc1RqcElHWWZv?=
 =?utf-8?B?Rys3R3ZXQ2hIMUdFM2UrV2ZGUjVnMTJFeHp5VEJRRG9YTnY2Tk1qYmVTU2FI?=
 =?utf-8?B?WCthRllXK3FHU2ZodmtoQ3ZZZGU0S1pwNW1RUy91a0d3Q0lHbnZaOVJLUGdT?=
 =?utf-8?B?Ty9SemtibkNYZTM1eEs2ZkxNcVRIMW9Fb0ZGV3JjUEtWNTRYdzRoZjg2MHJ0?=
 =?utf-8?B?cm82SjI3R3FVZG9ZNmNubkIwNVdYeDNaUlIyQ04vdmkvZlV0bXZxM2ZuUzJQ?=
 =?utf-8?B?N1diTVFVclpNOFRabzBNc3VCelpLTE1yK1VtZWxxeHY0U0hkc0FIbFYzZXRn?=
 =?utf-8?B?bWJ3RmRDZ3hheW5mMTRvT2k4ZkU5NXhlR3lZSmhNOFhFL0xTRU1TSjdqRkVs?=
 =?utf-8?B?aW9RVDRRemQxbVkwS1AxSnU5MGpMdlNZVFpORXg4S1cvSVRST0hwOGRiT0NE?=
 =?utf-8?B?RWUyNGRuaUVNV2haS0NZbXNyOXU1cGo3UzhuNTQyUnNBVnY5SUI5eXNXY1lr?=
 =?utf-8?B?WExqUHFmU0pHNDJXcDlvZUhFd1hrL1dPbFYrSThUSzd0NWliVCtpTGZ5cjJK?=
 =?utf-8?B?MFlSTUFna0JJbE9JSllza2hnaGVta0RWM1NqUVVPYSs0a1dhd3RiTlo3S0p4?=
 =?utf-8?B?SEtCU0dnUGgycktHOTI1dlpxSzF1Q21WR2x5RCt2TGxDNEJlM0lieHJxM2NI?=
 =?utf-8?B?RmRxV3czYlEvcFJCVndKTmUvMklhR0hSVWZCNWFhQUJ3Qmltak5WMXY5NThK?=
 =?utf-8?Q?ZBFwdl8siKhgoOaTMxDEhxNRC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45310b9-0438-4e25-23d6-08dd5fe5973f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 15:09:44.7843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTn8MPIyRm3xJkAVGVH4IcWnZ4Ko+2MRaIDUvAU2WX35hHYxgEjLS9ClmoQbarLavpXI0xtvg4yj3jA86PoXhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8058
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



On 2025-02-25 06:19, Louis Chauvet wrote:
> 
> 
> Le 20/12/2024 à 05:33, Alex Hung a écrit :
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> Two tests are added to VKMS LUT handling:
>> - linear
>> - inv_srgb
>>
>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>> v7:
>>   - Fix checkpatch warnings (Louis Chauvet)
>>    - Adde a commit messages
>>    - Fix code styles by adding and removing spaces (new lines, tabs and so on)
>>
>>   drivers/gpu/drm/vkms/tests/vkms_color_test.c | 39 +++++++++++++++++++-
>>   drivers/gpu/drm/vkms/vkms_composer.c         | 17 ++-------
>>   drivers/gpu/drm/vkms/vkms_composer.h         | 13 +++++++
>>   3 files changed, 55 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
>> index b53beaac2703..d765c5eb5d88 100644
>> --- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
>> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
>> @@ -6,6 +6,7 @@
>>   #include <drm/drm_mode.h>
>>   #include "../vkms_drv.h"
>>   #include "../vkms_composer.h"
>> +#include "../vkms_luts.h"
>>     #define TEST_LUT_SIZE 16
>>   @@ -36,7 +37,6 @@ static const struct vkms_color_lut test_linear_lut = {
>>       .channel_value2index_ratio = 0xf000fll
>>   };
>>   -
>>   static void vkms_color_test_get_lut_index(struct kunit *test)
>>   {
>>       s64 lut_index;
>> @@ -49,6 +49,19 @@ static void vkms_color_test_get_lut_index(struct kunit *test)
>>           lut_index = get_lut_index(&test_linear_lut, test_linear_array[i].red);
>>           KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(lut_index), i);
>>       }
>> +
>> +    KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_eotf, 0x0)), 0x0);
>> +    KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x0)), 0x0);
>> +    KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x101)), 0x1);
>> +    KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x202)), 0x2);
>> +
>> +    KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
>> +    KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
>> +    KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x101)), 0x1);
>> +    KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x202)), 0x2);
>> +
>> +    KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xfefe)), 0xfe);
>> +    KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xffff)), 0xff);
> 
> Did you see the kernel bot warning? I think you can simply add EXPORT_SYMBOL_IF_KUNIT(srgb_eotf) in vkms_lut.h.
> 

I did not and don't see any warnings if I run this locally.
Adding EXPORT_SYMBOL_IF_KUNIT would require pulling in kunit
headers into vkms_luts.h. I would prefer not to do that if
it's not needed.

Harry

>>   }
>>     static void vkms_color_test_lerp(struct kunit *test)
>> @@ -155,9 +168,33 @@ static void vkms_color_test_lerp(struct kunit *test)
>>       KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
>>   }
>>   +static void vkms_color_test_linear(struct kunit *test)
>> +{
>> +    for (int i = 0; i < LUT_SIZE; i++) {
>> +        int linear = apply_lut_to_channel_value(&linear_eotf, i * 0x101, LUT_RED);
>> +
>> +        KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(linear, 0x101), i);
>> +    }
>> +}
>> +
>> +static void vkms_color_srgb_inv_srgb(struct kunit *test)
>> +{
>> +    u16 srgb, final;
>> +
>> +    for (int i = 0; i < LUT_SIZE; i++) {
>> +        srgb = apply_lut_to_channel_value(&srgb_eotf, i * 0x101, LUT_RED);
>> +        final = apply_lut_to_channel_value(&srgb_inv_eotf, srgb, LUT_RED);
>> +
>> +        KUNIT_EXPECT_GE(test, final / 0x101, i - 1);
>> +        KUNIT_EXPECT_LE(test, final / 0x101, i + 1);
>> +    }
>> +}
>> +
>>   static struct kunit_case vkms_color_test_cases[] = {
>>       KUNIT_CASE(vkms_color_test_get_lut_index),
>>       KUNIT_CASE(vkms_color_test_lerp),
>> +    KUNIT_CASE(vkms_color_test_linear),
>> +    KUNIT_CASE(vkms_color_srgb_inv_srgb),
>>       {}
>>   };
>>   diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index 983654540ee5..ee3cfe153d8f 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -113,19 +113,8 @@ VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel
>>   }
>>   EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
>>   -/*
>> - * This enum is related to the positions of the variables inside
>> - * `struct drm_color_lut`, so the order of both needs to be the same.
>> - */
>> -enum lut_channel {
>> -    LUT_RED = 0,
>> -    LUT_GREEN,
>> -    LUT_BLUE,
>> -    LUT_RESERVED
>> -};
>> -
>> -static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
>> -                      enum lut_channel channel)
>> +VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
>> +                        enum lut_channel channel)
>>   {
>>       s64 lut_index = get_lut_index(lut, channel_value);
>>       u16 *floor_lut_value, *ceil_lut_value;
>> @@ -150,6 +139,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
>>       return lerp_u16(floor_channel_value, ceil_channel_value,
>>               lut_index & DRM_FIXED_DECIMAL_MASK);
>>   }
>> +EXPORT_SYMBOL_IF_KUNIT(apply_lut_to_channel_value);
>> +
>>     static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
>>   {
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
>> index 9316a053e7d7..67ae09913460 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.h
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.h
>> @@ -5,9 +5,22 @@
>>     #include <kunit/visibility.h>
>>   +/*
>> + * This enum is related to the positions of the variables inside
>> + * `struct drm_color_lut`, so the order of both needs to be the same.
>> + */
>> +enum lut_channel {
>> +    LUT_RED = 0,
>> +    LUT_GREEN,
>> +    LUT_BLUE,
>> +    LUT_RESERVED
>> +};
>> +
>>   #if IS_ENABLED(CONFIG_KUNIT)
>>   u16 lerp_u16(u16 a, u16 b, s64 t);
>>   s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
>> +u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
>> +                   enum lut_channel channel);
>>   #endif
>>     #endif /* _VKMS_COMPOSER_H_ */
> 

