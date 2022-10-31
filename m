Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2261613964
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 15:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D662610E1DF;
	Mon, 31 Oct 2022 14:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45B310E1D9;
 Mon, 31 Oct 2022 14:52:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiKJuz43Rbnm3GphWMTTcChvMJ/XCFybATzmDm0g8w66qgYda2MyEhAeEmq0+BgW0JXy+J1C8ZMDqKrtd7HqlM9hYpsYV8CkLDeXTb24xAmcANN2WUhOwwxjoyEL4H8ZZmS0nJ0WCI33Uo3FQZawiGXZw3ccWOsjY+QVDGzKwsklLSwRry+pUQxoSy1STYNDFJfka3MbH/IB4KIao0E+X32wqhzITlbFFXVHfdl74DiqY1F0Zus1Z6eL4l9hFfdIqqSvyt8JUD3bqf6qW7ITuFW4s+0DL1sWN5CRdz3pCZ8LYnS8yXVe7oD8ZrVkj+9H8vNXxlJsgzUTD1ATU3v0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLLuZ4KatH7UEeVqXdD4z5uc26qN4P2nEFHLLL1d2vo=;
 b=XajL2fklo3Fz3xVM+8PcqFFYHLcPJ/RXn+TV6XFSsZwQ223VZT9biqMStajnHwCtHqiU/G62xecaE4sCLH63OwEvZfiNcUzwVmLzkhn5lQ5QoWzSFheMPfZluGurHzj1t2ZJFUKO/R0dYp+MZLVmatS7BdrVwTZDN3tTC0KLczPp8oRnrEN4wVrf1/EdOd1tOJgdK/BdMEVjMDRSVaAe7G3fhfawtD4FpLpbj5QrIkqjsptWHIxpQRd8dQLhcldZewDUFvOGZ3t4Rojv9gtNaeHpUbOzgaC9zereZbDdruLWTLcsEqXonwoLqg1oikDRBFhzlISMkT3fsNouA8nujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLLuZ4KatH7UEeVqXdD4z5uc26qN4P2nEFHLLL1d2vo=;
 b=UwVIpB1R7c7TvyetYixUWYLJ3RSvx7MUUCvuxS/kUGMq65NzaNzFnrXV4V7u5O2dqDbgpzxgyVQ7VVHSgktQvUFyz8qlSxWL8hQXAjLoK2i35y2eiPlqsNYMYpJZjWJ9vSMkgrABC5XLSb76u/lxt9NrOEJYzlVV2Xs6Ba+YNno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB7379.namprd12.prod.outlook.com (2603:10b6:510:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 14:52:47 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::c741:a5f:2c1a:f8cd]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::c741:a5f:2c1a:f8cd%4]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 14:52:47 +0000
Message-ID: <9060a3ed-5aa0-c26c-f9b0-d91b0abf2c6f@amd.com>
Date: Mon, 31 Oct 2022 10:52:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/amd/display: drop vblank_lock from struct
 amdgpu_display_manager
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20221028204454.193752-1-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221028204454.193752-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0114.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b126271-faf6-4e9b-6a1b-08dabb4f92e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A03j4iHoKmz2ESCCIXY528Vw6AjxzzzIjjvO/UfLAZHL5UIrRZXyco94S09GqBFkuftBsK3/TurPSV1T/5r9HxllVdeS6YkpACJG9Gdwfsh8ADeEvGJ0GVCdDeoQ+kX452bQ24iAXLDdxseBaceIxyfJHluIgMfqsZYI7/INoNn2HJwR3K1QWKcW2D+KdZgoQNwVYP+rrptLNz/cfdF2cGlvBqsxS5KFRH/j4tkutQPS1px0h5oxnyhh/zDnTcWFW69fifX288Wd8PyHHGdKck54Violkr7qMwjNrd6rTJOWcyl3j6g9K3zVoe2ZRK//RN2xCxZ2oD+bMu88b2X5waxf/h+YAkOJCoH0gh1FG4gxn7/lBfBSlcnSjsNp0pxh+kA7jui0prMjxqaPjCFTkVBKHRKkvSYWnQu2pzfMEuVozbe10K2SpDZVdKLDWw4ThdQDdsCw58Hg1pbI7eTj/HKFK1PglU8q86IQ7E6D0A9JoxtCtTiGn13ejcnrnxLFTs/78uLsGp2xQvj/zyFQuTAIUTzDDoA9SSLaAkqymdUkRCtyS/Q8wrgIWElI2xGxvRPY23lGdniYEWapuKxzMvm7uRBbyMz39mHST+C4p0RaGpxw+Z7ILS4zSEuRryRGqWVWLoSU2q0VNp+ro6+X+cRsrk47Fm5Q6kJwUoUr11z5v0qPm103ebLqyg8BEGDZUgCm8f25UoRbQwUflgMjBhZIXF7zwpODWCm2mGdQEkEDbYqFy32pJ6r+ggX0CRiK012ANsii4qFOAVqiZHl62rPCuejp9chmKsMcBt7ofpg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199015)(26005)(6512007)(41300700001)(2906002)(4001150100001)(36756003)(44832011)(5660300002)(83380400001)(186003)(2616005)(8936002)(31686004)(38100700002)(478600001)(6486002)(31696002)(86362001)(66476007)(53546011)(66946007)(66556008)(4326008)(6506007)(8676002)(54906003)(316002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGdKNWRyWEJvd3FZdS9URUVSZ0xXNFN2dmdTbWZPRm5EOWltdjlienh2WWZU?=
 =?utf-8?B?TUxwV1VydHBTeDE1NlNaeWZXQWgrdDZxSkNGckJZdHR1QnFVY2NHNUdicFAz?=
 =?utf-8?B?Ty9neUdNZGVKM3dzd0RHMGkrek5LUmJiWHl6S3BtNDJYS2RhUUhENndiRVlB?=
 =?utf-8?B?YVo1NE0rTTdKNXRuVjQ0UC9xMGZITCtPK0FRYXVZeFZHNWhlaUxpNHBPanFM?=
 =?utf-8?B?T2VNNWxaS25zaFlWSjVBWDBLWHc4clFLTXplelhGL0k3YVN0T0hjVnVzeVNF?=
 =?utf-8?B?ZzloYzEvNFlaZnZuMXZYNndCdU1MLzBISi9zRFZIT2F5cGlBYkMwd0Q5NnRB?=
 =?utf-8?B?ZEhVS0syRS9RZGVyQUlPMkVwYkZvUmZuZWs0ZGVEdHh2Q08rUm00Y2hTdWtC?=
 =?utf-8?B?TG5oMGhpY3Zxd3k3ZG1kaUlyNXg5YjJld1Z1Q0hhRXdaMGVnOFlzc3g1WmtN?=
 =?utf-8?B?K3Z5aG5Qdnhnc3JXajlZQzd0V0w1dUY2d25OWkVENk1KNGtwMlkwazBHM3k5?=
 =?utf-8?B?ajMzRFRmVVZaODR2VUJVYjFDd0d2bjNwVUpaMVIwc01JM3UyYWpkSjRzR2Jw?=
 =?utf-8?B?QXkvS2hOcjl2YysyaFE2MzhZRTI1S0VkRUxBcXVGR3owdDlTMUtsVXFIc2h1?=
 =?utf-8?B?OU5EbzNxQzFxY3Q4YzZLbkF2OEg5TE80UXJHLzd5d1BJWXhOeTE3MGQ4YzQr?=
 =?utf-8?B?dVloQmw3QzlIRU1nd01EeDhBUTZtaWkvYjlIQnErWk9DMUZQVEMrZ3lwZTBl?=
 =?utf-8?B?eDJGRGgvR3JNYUVKUVBFZHpDbFZKM1hsd1ByUVRDdVI4OHhWRy90YWd6bldZ?=
 =?utf-8?B?NGVZYnoxRHhwSnovR2dMNzZhS2NwK0l0R212RVNCRStQdDRsVkxOSkdCUjdp?=
 =?utf-8?B?YU5oSVQ1MEkwRGRva1ltNVNzQThTNXJ3REF6TGxVWkxzbjBPN0RNaGN5QmVy?=
 =?utf-8?B?czV4V0F3M2Jxc2hmWHY1RmdtSGNKUHFKbVBvV1pEeWdVcXgzc2FabmZ1US9s?=
 =?utf-8?B?M1hPa3A2TmN2c1ZBaTBtK0lFekl1SjFqS3JjUzJpdjBGNUpZdVJKbEdZT2JE?=
 =?utf-8?B?WFpBcGo1TmZCNXhJVTN5Z2dHZXI0bUIvUi9TQ1FoRytkaVRLK0M0OE02MDNz?=
 =?utf-8?B?dWN6WFJDV1JsMDBLRFpKakZ6RFV3WHd2MXhVSEpxaFVoaWtqQ1BSTWZRMUt1?=
 =?utf-8?B?dG1pWlQyc0pKc1FSUjJPQ09qU2Z5M0RBY1B1YTNGZFZZcWVwcjdnazgybkEz?=
 =?utf-8?B?Zmw3aVJHckhtTGIxeXFrUHBhMWVsSlVsb1FWL00yWUlWc05xVElSb1pLNEtt?=
 =?utf-8?B?R2RTQVArSTF1ZXdjQzI1dTQzcmRWU0lqZTZsVkNBeHVuVXlIenRFUGtGcGFx?=
 =?utf-8?B?NDRabUp3NW5ZS3lKN1QvcHVGK1hIRmlZb3Y3aTZFKzRhbEdoUk41dlk5Mi85?=
 =?utf-8?B?K1BuVkRSRWhJY3VqK1IxeW9GSGFVQllRbmNtbitRU0JNdlo2Sk9wSG8zNVEv?=
 =?utf-8?B?aUwzNmRMK0t4Yk5EaEpyclRROWVlNFBRd0g2Rm5CWDhWS2Uzekx5YzB0di9D?=
 =?utf-8?B?QnJNWXNVdncvcnQ3cTJ5c3pNUEdsNlExb2JJTXNJaERPYkhDTHFITHYwdnNn?=
 =?utf-8?B?MVl4TUNBVndWRHFsQTI2V2Jibk05V1U1Vm05QUd1MUo4Uk1mUlFoalp1blhk?=
 =?utf-8?B?UWpMQWJZeTkxbENHRWFzZVdybnlENDBIMWZ5MkhsdTN0Mk5kRjFmVDM1U0FH?=
 =?utf-8?B?L2NkMGoweXdZNEpPbDZHK1hiU29FQ3dZNHU3dXlTVExsQ3YvNTMvTFVpQUVl?=
 =?utf-8?B?TDZMZko1SE5uL0JsN0RmQURZeVU0WjZoUmp5UEMrOWNadmRLUHo2T21ydWxt?=
 =?utf-8?B?Nk1ZS1FOTkQ2QUFtbzhON3cxN1Y1UkVuZnJ4aHhyQ1ZzeTVIQ0MxcGlBcWRw?=
 =?utf-8?B?VjJ6M3Noa0xNVFdCTUo3RnU5T2o5NHNrbGdlM3A5VjJzNStwM3N4WXpVQnVN?=
 =?utf-8?B?cGNkVFA0a2kvV29mRnZ3Zk1UeDBMSzQ0U01NakdMTVp1MmdZRW1QSXRlQVdo?=
 =?utf-8?B?R0FHZlZaeG9NY3NWdUczb0JPb21kTmt6cHVEektTZ1R5Vi9wTTlqaGV1RmlS?=
 =?utf-8?Q?fogiWb29ggi/N6XNqH4MhbwoR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b126271-faf6-4e9b-6a1b-08dabb4f92e7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 14:52:47.0608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEPR7+CrtSC4ZBxfD+oQSgONz+W2IXA6griWeiunBKvhC0m558HteNJg7OClloIPA2uD5Xa189ephSamJEJ7Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7379
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
Cc: Alex Hung <alex.hung@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Shirish S <shirish.s@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-28 16:44, Hamza Mahfooz wrote:
> As of commit 09a5df6c444c ("drm/amd/display: Fix multi-display support
> for idle opt workqueue"), vblank_lock is no longer being used. So, don't
> init it in amdgpu_dm_init() and remove it from struct
> amdgpu_display_manager.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 -
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 7 -------
>  2 files changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index eb4ce7216104..11afb4b24fd9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1394,7 +1394,6 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>  
>  	mutex_init(&adev->dm.dc_lock);
>  	mutex_init(&adev->dm.audio_lock);
> -	spin_lock_init(&adev->dm.vblank_lock);
>  
>  	if(amdgpu_dm_irq_init(adev)) {
>  		DRM_ERROR("amdgpu: failed to initialize DM IRQ support.\n");
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index b5ce15c43bcc..b618b2586e7b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -365,13 +365,6 @@ struct amdgpu_display_manager {
>  	 */
>  	struct mutex audio_lock;
>  
> -	/**
> -	 * @vblank_lock:
> -	 *
> -	 * Guards access to deferred vblank work state.
> -	 */
> -	spinlock_t vblank_lock;
> -
>  	/**
>  	 * @audio_component:
>  	 *

