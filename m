Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09CC3B7119
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23AB6E84D;
	Tue, 29 Jun 2021 11:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2042.outbound.protection.outlook.com [40.107.212.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FDB6E84C;
 Tue, 29 Jun 2021 11:05:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oy3UHiw5Nuu8VGi6fpjhDPDSIKLfIqgvTN5HmhCMq/P+E99fHWWF0Kd+yR0O/p7eZw7xRvP64iS0WgoMDY9Nb1qr8PpsbVOLrB9ffdwk0L4WgfPV5TvloAYXni01w6TBkOiRcNOvtnzRnzWCHTE3StBIq0ROgqTsjLKmVdQJED4MaqRX/F5UTitzIaRtgqUGY9gWtfam8Wrswrr0XRkIJGlvg659sRquI+Jzd0BoognfOsdl/49VXpCGwrYUuns2eto1W4DEoo28LXjLEVWIX5Q8d4PeV1TYIVjU1FuffatvseJYp6FLfFG58MlDTgUdMwArXYcmRZxlZEdS4LWDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnWu1MB8UAgbzOo0Pnyf+Dyrqyrmv9qvvcXQrlfBD/M=;
 b=OIIpA3eRbP5NYKUb6eG7LOsVhZ+vKwpQIYfCtdmq7RbEHkuF/CeEM6ma9wMo3LGCv0w5aIWm0iujgTgLIrMTmpNVvy93LxWJleftBRCdN/5SRVWvKUpdXVX0HnlRYLwP+N3gexZLfs/EWmhKrKxS86GmgyuQrYd6nBzJWL9v1ze0GtOVS29xYPpX0FPXnxcqi9z1GD23W28JQyp0+ClNtBmqGTyvMlJvcnGxT6M+0Yh1twVBC1mQnH3K1elLhG4fgzrJEHg5O5eoZDBi4TusfyaGo/T8EaE+zuUV9W0jpvAD29SVkrGdTarmYkTgtXoLK/QDJpwex4z4E5cHdRvwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnWu1MB8UAgbzOo0Pnyf+Dyrqyrmv9qvvcXQrlfBD/M=;
 b=qtUadhAYpu+4RTFgueCNzWPi9dCPxD3bJIDX9E8c+wgCSTZUUcltrPmKJSj56UA/vt1g+m5HuP9B7NbVz4oFUIsffK/paJ5SQoqmauU+zpGdCG2n3UNkxu1F0zNgvzPIV9kGUXq8ZCjbO2gcebXlv19s/dSt+HF9g7eRSdrxjRI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2515.namprd12.prod.outlook.com (2603:10b6:207:40::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 11:05:10 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 11:05:10 +0000
Subject: Re: [PATCH v2 1/2] drm/amdgpu: return early for non-TTM_PL_TT type BOs
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
References: <20210629073629.3069-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <844ab0e2-ccea-b2a3-cbf4-744726a2a026@amd.com>
Date: Tue, 29 Jun 2021 13:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210629073629.3069-1-nirmoy.das@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:acb7:5516:6a55:2bf5]
X-ClientProxiedBy: PR3P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::6) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:acb7:5516:6a55:2bf5]
 (2a02:908:1252:fb60:acb7:5516:6a55:2bf5) by
 PR3P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 11:05:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 868ee2b1-3597-4745-2599-08d93aedc2d0
X-MS-TrafficTypeDiagnostic: BL0PR12MB2515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2515D819DFCD8E4F156D4D0983029@BL0PR12MB2515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UzxoOT2kLomaA9PWIUYZYHxL7mrb8gRlJnfqYBQ54/VqcJODnx0xgoqjNk1Pb5YUEmV3N236/gwwrjFwVhoWRzTWA0+itWITAuDjEgdzBpM76s+yOCPk0xT6w672ByryGOrSFfj6VpWFT16HcZka+7Ny1dlzYHHo4AEGl4rrIAnNK7GHhQsAXyrlJ/Hf1Yld63mk9nseM0EnmpU+3hvN948zyoX7gBXj5b8UMmx65QxCqMm+bN4GkY8VjoWJ+qRYcRFbVtpPJj6NP1ZJGfrnnRJXx+LtS6GFP8zJFq/ufwsvzhPRUxaBg5xEBY0TFa1rBGUfrtnMcWw9chFJSFhMfFYWOvcvRYT04Xy8SUoYG+2KU6EEpRIqS4ObrKI35QYKnkyWOLIjrkp6tWUpkbV/POsuezbVx2lsx1FG0ugEqg/lOPOyP6zOY7rejNT2evx0PoOaexWiCGpflP0esn86QXs6tDAA/24lk3TjZ7K5ueM/b6xZxc70LFV0WaaC+KNW3GC7cdv4tr4AvYl6jhQMX1ZYTsFkIpp3+JggrYuQZ6++LzOSNgE7VXB/L1Nwt4Pj32pMdWfKc+KnEp7jfNi0reyP1mI/xJM6EHO24S/xbIFfFpThDwjN4g5i4o1ftCp3gz10iepBqLpl+OOhN2pkX0/IVC+e7Gw6l1PjzlLiWD600HtPmtdt5p5vgciM+ZOGBF7OkWs9KNytbsUBhLInu0i/lfEOI7NIgy5U6T/sdv4++Vg20T637m4/TOq6NKfh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(478600001)(38100700002)(83380400001)(316002)(66574015)(16526019)(5660300002)(186003)(8936002)(31686004)(2616005)(2906002)(6486002)(4326008)(66476007)(86362001)(66556008)(36756003)(450100002)(8676002)(31696002)(6666004)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3lHdDVrSURHbkppK3BOT0U5OTBmWFRjbWhJZnU0b053U2RnMkxWOE91dHZR?=
 =?utf-8?B?TTc2WVFZdXNjLys5b0tLOG5HWTN5Nkl1bDBtUllINDBIUktMZnJDRG4rcnd4?=
 =?utf-8?B?enBBSzVERlQ4UTlPQThaZDVWMGhkRTBHV1NtUFBUUFRYMm41ajM4aWFjZVd0?=
 =?utf-8?B?OVpqdk05Q2tkS2dZaFVyTzJCdkkxdko1eTJwYjRhcGlNckNzSmVwMkVRZzlq?=
 =?utf-8?B?QXJOVm05ZmN4Q1BEemkrSUFjUHpiM2ptenZxNG5VWVkrVmcyRkpWVFVKblhn?=
 =?utf-8?B?bHQraXgwb3N6TTZpOGdQNC8vWmxOOTN1UDRDR0dKTEk4SVVKaW1LNHVlRGc4?=
 =?utf-8?B?aEFKY3dMVWpuR3o2RFBhcFZJd1V5RUVMRlY5M1BaTlF6V2FpL1d2VWtRanhP?=
 =?utf-8?B?RzEvdXY1cWJpRUpOeDJnR1JDTHlpUTlmOU9QdjRBN0dPenVCUnlQcVBkK3RT?=
 =?utf-8?B?dHRFMkliTThtcjVNenlBdzdITWVFNTdPNjE3bS9LeEdoTm9PazMvN2h0Ulla?=
 =?utf-8?B?ZzY3cDhSeVdlL1ppT05lQ09UcHFDZmd6cWYwWHR1RmRnR1lyL1NTTUYycitn?=
 =?utf-8?B?SzluSTh4UnhWSmF2QWk1UHE1c25BUUIydkhzL1lnZitjdHp4Vm5KR1ZaUTRv?=
 =?utf-8?B?SGt6djQ1MkNPT2xGWkpMa2JIQjhxYm1Xc0pJdVZ5d1lOWlY4cGZtZC80N0J4?=
 =?utf-8?B?RVB2L0NDQk5seERDOVFBajlyMW5idnhPUGNDaWI5MFRhRGxvYVJjc0VxNEhX?=
 =?utf-8?B?b0hsbCs4TWZLMk85SnpHZjV0L2NXejUyQjF0OTA4TlM0RytaZDVGV3BxcGgr?=
 =?utf-8?B?c2lSN1ZPMkVSTEl1REZWNlUyN01aV0dwMm1yOXBwSkdxbXF6Y2tWdVlQVGFF?=
 =?utf-8?B?b3RNZzJmTzllU2pNbUNIYVl0aldBT0FMWkhEa0NYeXdxYkRhcnlmUGg0M1pE?=
 =?utf-8?B?S0tzK2p5MkJSWkp5NGZMS3Q3dTBOeE5QRUlZSGpKK2I1MFN5V09WaUliSmJW?=
 =?utf-8?B?cjVJR1hUNkRiUEZsUmVBdXVna0M5VC8rVythS2dBSFc1dGZhVjYwUTNOOUha?=
 =?utf-8?B?NWZiN09BY24zbXJUaUNFY1ZCQ1R3R01wVGFOTVJaVGIvUVZLekx2dFpReC94?=
 =?utf-8?B?YXZmUEtKVnREaUhHOUZJU0V2Q3J1OStaN2RLSEVvVFRaMlZCUHhyOE5ZNXhO?=
 =?utf-8?B?TmRndmhmSE1DQW9ydDQvVHZSc3hYbmpRVjBHUmEram1RN0NIWEgram9WaGtG?=
 =?utf-8?B?TnRWL2RwY3NuNXBkU285V3ZqMVpvTWJHZXNzcGRzcGF0N21mYjEvQVhBOGhI?=
 =?utf-8?B?a1VGdm4yMzdKcU84dVZQYW9vaWRVN0pjRGdkWG1BKzN6enZVMVg3cVZmbXZl?=
 =?utf-8?B?aE84aWQybmtDSEMwSENla09sNzY4aXFER3hOcFVzTUwrR3lFc2V0OXNDckpq?=
 =?utf-8?B?S0dpV01rUnNwak9pTFpxRHVzazBrNjdHMm5DZGFpYWdwdEVxZ1FDOGlNZ3dP?=
 =?utf-8?B?SCtxVHdRaGErdGNpeHVKM3hERkZHSE94NTJKeWp1QXUxVytITUdBVmVqd0FG?=
 =?utf-8?B?RFp5cXFHV29KRVMvWkZocklWeFVGSDhmNkVJbXpmNVJhM0tCVmZaTEM4THIx?=
 =?utf-8?B?c0M2ZDFwN3RBeXhNbkU0RFI1QkMxQUZCL1ppRm1zNjJIVnZQNTdMZWRaVFJn?=
 =?utf-8?B?R3RtdXplUUtNblNLMElFSVZaWWpzcjUzeVJHSGV4NXIvRlNpYUh2OHhmNVUz?=
 =?utf-8?B?UytOWS9YRWJWNiszY09RclhUQUdUcUhhQWxxNGthbXg4b0g3c2M2WEgzS2Jp?=
 =?utf-8?B?VHY1RlhtaFpyc1dtc0Q0Q21zWkNuaG1Rb1FOZ1RPQTk5c0MxejRnRENXcmtS?=
 =?utf-8?Q?FwhrYZqWJIJoV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 868ee2b1-3597-4745-2599-08d93aedc2d0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 11:05:10.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydPA0/jZcIXQ0AVzh/cSAZrS9EkZC6j07AwM3Le8avRC+vvCTw4F6qgmBrHN63S2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2515
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
Cc: Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.06.21 um 09:36 schrieb Nirmoy Das:
> Return early for non-TTM_PL_TT BOs so that we don't pass
> wrong pointer to amdgpu_gtt_mgr_has_gart_addr() which assumes
> ttm_resource argument to be TTM_PL_TT type BO's.
>
> v2: merge if-conditions
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index b46726e47bce..208bc3ec1aff 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -926,7 +926,8 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   	    bo_mem->mem_type == AMDGPU_PL_OA)
>   		return -EINVAL;
>
> -	if (!amdgpu_gtt_mgr_has_gart_addr(bo_mem)) {
> +	if ((bo_mem->mem_type != TTM_PL_TT) ||

Please drop the extra (), apart from that the patch is Reviewed-by: 
Christian König <christian.koenig@amd.com>

> +	    !amdgpu_gtt_mgr_has_gart_addr(bo_mem)) {
>   		gtt->offset = AMDGPU_BO_INVALID_OFFSET;
>   		return 0;
>   	}
> --
> 2.32.0
>

