Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B84AD2F0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9AE10E3C1;
	Tue,  8 Feb 2022 08:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478FD10E342;
 Tue,  8 Feb 2022 08:17:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJ+Yfj9eknH2RHRooYJfmm6DknWOyI8iBhePbYzXdNQPfhex23juW8oQxbMqmvkMIhZPQj44P5sMP7FqWU38CRoH4L4hSSypJUUL6rWi2m/gwY9mLw5Q+3XEGxmXXFWsSLiuQ1RGcnlgFWHBpME9W3u7auLR+1RT0YP9y/vuxg4Z5UYUhplbjaDAyyWBThCG1Zjd0YomEWZxdMhNO/5P3gB3SfN60s7Q7mjOtVc15Xol57Qhp7OzH/bns1tjw/4gZo9HYX7xGWCkc3f02IpviYF+hltwltG67sxmP+Is16H07Wck4dNOE9c8BSolX9MyiX6ZeuGRyDoDmrwl5KVZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4NJeVG0UT4X8ToqZSOI7wLnmxu1UKYbmkdnAUHs5ZM=;
 b=ABzLA4bVSt4AdFNgkkLueCOauZ20uLPb4IwSpM2PYDSB/qxJLWCxpTHRyhyEfmF/wBXPeikkyV28XjAgtjNaL1dBcy+wauJ3q4T3hf94caFAf0cn8r4nr5myG0B9f8y9wC9S3eiDyuZ6PC2JdVSc6fAaEM3qL+clN9OXTslU4pEsqW7e7EQYMUj12Aj2yI4ofl69z5I+Vw9ZLXWOYE/ttaAhf911juviaxvkQ5+1yNanN2q5micYno50axpvtzkXTVf/2HHSLX8QmygX4t7wNTllrwLBOXf+nfUPqgAPCQcvYdXCsnIIb6e9P45bCOFRalDafsph6JnOFyFkbUP2/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4NJeVG0UT4X8ToqZSOI7wLnmxu1UKYbmkdnAUHs5ZM=;
 b=mykaHo42q4bkXI6gLlX1DWfrOnXRhSFvfle+n6/9Rg9K/1ZPQzujYtxUBTu1Lt6eUks/oH/JkLjlMB0ffKYqsx7bam9wMzF4iCijWtha7jibYEiIiiO+WFgpZ7cKQgW7OA/HW0QqKZYYCbyIvR3we3y+Tnfyxms0O1TK8Srv4Kw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5052.namprd12.prod.outlook.com (2603:10b6:408:135::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 08:17:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 08:17:34 +0000
Message-ID: <108cc1b0-8630-7f41-5ef9-73df69d250e9@amd.com>
Date: Tue, 8 Feb 2022 09:17:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/2] drm/radeon/uvd: Fix forgotten unmap buffer objects
Content-Language: en-US
To: zhanglianjie <zhanglianjie@uniontech.com>
References: <20220208081443.28210-1-zhanglianjie@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220208081443.28210-1-zhanglianjie@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0103.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::44) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a86e5a7b-d80c-477a-4e4e-08d9eadb7548
X-MS-TrafficTypeDiagnostic: BN9PR12MB5052:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5052395AE108B01B3C6B9661832D9@BN9PR12MB5052.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AhMGHQ2kxnW64fNyNr405goCbP9jJ5vifeKzpKYxN+3J6mXpouaKyLm0zuGxjphsLnc5x7f8AhozsESL1IfySXwD8uGcMjbnKg/+MdkKhtVpVSYmzrBcx877aSDiwCgc49m7W5Hk0InHnJBECbONAup+o+cS1Hhl0OJZS7XEYQvId+/XbVTu+UPOoq1j5AEsDd//0A1WbbiK5v70az1oGNCjf3dAFjWWPitza4vGzcWp1TzRPUrEZnnVU+vPavTPFms+joNymbIPELnj8DvbCvyookt0L3N2G5GpnKT13EljmRDlX5XFI4Oe0DMleWuE0CE6nGm9UQZwG6TqkC4U1tXtcGGNe4QhPxpqBdjRSwx0wkcWjmJzy6UHPxezJW2QhPH7IsO5W1oTdSA3RF6jNBE+HPAlNA6vaQQqKM7yiofAUpHMKun6Bp8zGGdt0VxnV4y3wX+Cx/ZjFqgRUVmCjAJ2EKjc7VmVWBRrDKA0lJfcVN05vHWG73pWgJWf4NHnQCaUKC7zOPBrm5uCBN8Pr8YiPO2ZOCPUme2bKS0AOC5GYyuPqKSWVV56YJrcAEFjqdEUCx2z83Ya+KFGdlzlU1YPfoPh2He7C5cUfOL4RodFRs1eJ1eMINaQOqGHBbwwKDoTfxOca7fWwTKVVIlCFHoc4aqglvpoEPip4Mpxzjaa9Ilfq+xvzF5WZhFL25A/sP3elFUph0V39DU5sFRLk3vkq577thb6bZPS/G5U3Tfe5iIO7yBtdMn09gVyib03
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(83380400001)(6512007)(2616005)(36756003)(66556008)(31686004)(316002)(66946007)(54906003)(6916009)(38100700002)(508600001)(86362001)(6486002)(4326008)(8676002)(6506007)(8936002)(66476007)(5660300002)(31696002)(2906002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUNtdGZOb0J5VlBpTnZmWnM2T2IrSFlOYUcwK1JTSjg3anJORlo2dTVJYSsv?=
 =?utf-8?B?cGkvSzNGeGpFSjByTURuYmdIQ1BhVzJSNG8zbFVCa2hyOWdrTkpSWU1VejE0?=
 =?utf-8?B?YzNSRXdxWlh0TThLV1pXcTB2bDBwNmJ6d1dqUDBWaWovd1UvLzRsVGQ5VStP?=
 =?utf-8?B?WUJleHdjUXNrUFJsQlJyeVcwd3pzQlpKZTFnYTREMm1nb2g1NFZhd3ByRlpD?=
 =?utf-8?B?c3hhZWdPNjgxcE96UVp0dnM2U2dPTGJXYnlqaVhuK0pibFVXOVJXcEJKeVIx?=
 =?utf-8?B?Rkx0TmpSaWcvbGJoSEtXRTBOSlVPSVlvbkExS28xQ1hMNy9oWjVjVms0amxR?=
 =?utf-8?B?bjlLd1BxQksvT2VvelgrTHVsa0ZmQWRpMlc0ZzJ5dlNWN1ZqNjBwOEdJK3lp?=
 =?utf-8?B?RC9IUXVyQjMwTzR2SWF1SkFRSUU1WUhXNWcxMC9BYWZKKzZBeVhlR2tjd1By?=
 =?utf-8?B?TUJ6MEhQNEwvVmpnY2wzbUJSL2s1SWZWRlF2SjZ0bEFpUmFQY2l5SXM5Lzhi?=
 =?utf-8?B?QlRRM1pPcEVZRWtUUVJ4ZjV5czRtckJPcFRUSDhLQWF0YkdFVXYyRnRSMHNC?=
 =?utf-8?B?UkxlV0grTmxCa2J6VE5MSWcvZGVhZnhTcWo1QjNQQzNKVDAvWldyK2pKNGFx?=
 =?utf-8?B?Tmg3M2R3bytreUh6Ny9ZTGN5eDR4Qk92TDVCa0tLRVViaGhpcitDQ1FWN09R?=
 =?utf-8?B?ZmtCQVl1ZW1xMlZQdjgvZFMxUjFzdHVEQVR4eldsWGZCMUVDVFhpMWxndFdh?=
 =?utf-8?B?bzFaMWY4TERucUVYY044TC9KTURzUktJU2dldkxYT2tKYis5Rlp4NWR2d1RW?=
 =?utf-8?B?by8wQjE3NWd5d29HVHJpSWpHVXJ0TWFDR3c1eVhOazFpM0NmMVBGVTRLa0xR?=
 =?utf-8?B?SmFPRDFsNkV5aTM3SkJyS3g4VkZYVXdOQmVSanE1TXY4c2hVS1ZLSzlpQ2pz?=
 =?utf-8?B?Z0J5YXAxTjY5N0EyREh0RzRHUzMrZXlSZWxFemNoTStZYkd4S0M4RnhVZk9J?=
 =?utf-8?B?TGFGN1dKWFpkZGhjRENia1dEdHJWd0s0RTRvZk96dExnNnhoTjBkM0hETDJw?=
 =?utf-8?B?RXNxNWo0QXp3VFFNTXJLY3dKdVZpamtJQUNXSzM3SEpGMXROOHlRTGhteW1D?=
 =?utf-8?B?UVIxS1dBT01SZ1Q3UVJveVdIc1FlMDd6TUdacVRjajFHeUpNRC9GUEFsRW9h?=
 =?utf-8?B?cVdJd0FaQzcrY3lPajJISzRvYVFhOUxTWU1aazhzRmRPVWpJT1FaZSthRXk4?=
 =?utf-8?B?RHNWd0xkdDM1NWxUWXRYa0gwckprOW5MT2NObFhHemIwUjFxOUpnVndndmV0?=
 =?utf-8?B?TEk5ek5vbytsTHZBSFNGL1IycnhRYk1HV3A2NXRjREI1NFBlcmIxSHZFaUl0?=
 =?utf-8?B?Y3FEZyticy9kYTBJOFRxL0RMamlIYjFXaVVtajcyckpyYjdpc3ZobmdDVzJ1?=
 =?utf-8?B?V2UrNzQyVENtN3JHbU0xbmp3bHBpNlRqalFJVVAwZnNQcHozdWdzZ2NkWkZi?=
 =?utf-8?B?NytydlJOZnlFMndTZjRvcDZOWnlhN0YraEh3RFhudUx6U3Uwa3ZqRHRTL3h0?=
 =?utf-8?B?ekg1cnZsYUNTRm0yQWFOT0kzcmJRTS90aVF0c0dpaVVydVE3VGRxa2VBYUZt?=
 =?utf-8?B?ZTJBU21ocUM0Z2tKeXNYWmEvY1hCcDdzbm5aVkN0c0x3L3d0VEZLN3B3TjI1?=
 =?utf-8?B?dFVtNFkxWVA3NlBZRHBSdTFoSGhaVVBPY0p6U0F3emhRUVFOY3JqclNtVDhP?=
 =?utf-8?B?alZkWjJaRUEwMUsxeFFvR01UWjl1Vkh4b2NMMms4TmttTi91b3JjaXAzYUVx?=
 =?utf-8?B?aVFMaVpSUVk1RmlHNzhXTSs0dk1CcnpWQWVBZHJ1bHFyb0wvMHZOb05Fby8x?=
 =?utf-8?B?VnZFTUxvaUZUa1JWNTZuaVlUYU9XRUIwaWFodUQwYzgwMTVUdnlCMUt5eTFS?=
 =?utf-8?B?VTBGYkJXTzV0eEN1TllXWmhYQ2pack51RGVoS3dCL1hhVmlWSzQ4SWxKekVB?=
 =?utf-8?B?aUJnbUZkYnpSYUlqTkFtMWcwbEdlUy9HWW9vOWhKNUVqaWUzanB5aVBzS0pO?=
 =?utf-8?B?dkxFcjhuTVZoWHlnUDBMT1pKZEYvUHI5dUd2RkNMMGxDelVJNEphUEloM0pW?=
 =?utf-8?B?QkF4aGdQYlRKNDdvaUV4VzRVQWhVT0FQTTBqOFFtT1ZraXV5VmhQSlJQaStD?=
 =?utf-8?Q?F8nJFTAmjImcGjC9jLZV0fs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86e5a7b-d80c-477a-4e4e-08d9eadb7548
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 08:17:33.9014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWGqonisV8dPDiLs1p7pZT8gGQtu1KQdBxi2iftziqi7Louq+wTWitHmGOjjtgQ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5052
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
Cc: David Airlie <airlied@linux.ie>, PanXinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm scratching my head what you are doing here?

That's the fives time you send out the same patch, so something is going 
wrong here :)

Please double check why that lands in your outbox over and over again.

Regards,
Christian.

Am 08.02.22 um 09:14 schrieb zhanglianjie:
> after the buffer object is successfully mapped, call radeon_bo_kunmap before the function returns.
>
> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index 377f9cdb5b53..0558d928d98d 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -497,6 +497,7 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
>   	handle = msg[2];
>
>   	if (handle == 0) {
> +		radeon_bo_kunmap(bo);
>   		DRM_ERROR("Invalid UVD handle!\n");
>   		return -EINVAL;
>   	}
> @@ -559,12 +560,10 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
>   		return 0;
>
>   	default:
> -
>   		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
> -		return -EINVAL;
>   	}
>
> -	BUG();
> +	radeon_bo_kunmap(bo);
>   	return -EINVAL;
>   }
>
> --
> 2.20.1
>
>
>

