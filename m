Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 979917AFA0A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 07:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243F310E467;
	Wed, 27 Sep 2023 05:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB3510E466;
 Wed, 27 Sep 2023 05:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoDpN1MNmrI0YRBYYjOVrDrp7C6n5AYtDS+5j+ZFp+yI6wla4ZkePpmC2dwwurC4FG2SL8uN/qgrjW/9fETJMwKyO5sHcZIARooOOxpxRpI2oj1b4TNKMQZN+hnYZ0/zgOxZhd0J3OraJquAgTNPArtL2WI/kARAtbpvkIPQ6rPQbI+WtumeE2z7piGcIkw2VCyR23LAlVo1gV4Euzic0T1DOfDpih0SgqgfMRfN0QlGy0bQzpRu9pWTeeApy4PnOVJDEMyZlK8xDHoMgnhNwsUx0PEbpaBSKXXyXKrzhHx0mQMVU4uCRxT80CIA4Xo7xi0i3uHCD+UoIVAeZnsOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwr3hbibDWq4g4ddCq/8QAbAWvpajPrv8g2ZNbZGutQ=;
 b=Mzu6nOqagNeNPFZtSZto/ZFB1OI06fyuO9PfUvvMBmKJuMl+BqaCbJlp9y4vcid2Ino1Y6nA+pvjT0jSf+tNoFFXGUhkzJjMC2ABM7mDZutf7mgv94glisGiSKnfXisBgawQnk/2GB0zBDsffkzQwXannudizWGkl4Rsqx0nnxojg5XHF0xQ8iUAFhQiLjyCQo9kF4mRdIe2HkLbM1IeEoKtvFIAFWBmtJl/FS3sJtVPnOYhBksqeU8JsfiDlHnz6IJ43WvhR1Hop6Z7wbblOZinNDRVAoKwYND4TMa8KXzpPyZHH2bz3H2Ysc0zkdc5MFP8oZ3dwDMwn8t5yDWssg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwr3hbibDWq4g4ddCq/8QAbAWvpajPrv8g2ZNbZGutQ=;
 b=K5yFuVPdj4JIzWBN+p/dwVMLiJRPh1R6WZDupRyOPddm0c7EepREOl7IuKIdruK1HhTR/ALvQa/UfN++aOlMNy6BGb47zXyReaH8CuqgTtSOxEZjI+mXYcF0607CschialChw/ONMD8ehNt5TuKZ0CUO+dzxQZL/A20+qay5L8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5612.namprd12.prod.outlook.com (2603:10b6:a03:427::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 05:23:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 05:23:53 +0000
Message-ID: <82ff7880-f323-b208-b52b-90bd568af934@amd.com>
Date: Wed, 27 Sep 2023 07:23:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] drm/amd/display: Fix null pointer dereference in
 error message
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, Cong Liu <liucong2@kylinos.cn>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Tom Chung <chiahsuan.chung@amd.com>
References: <20230926055618.119195-1-liucong2@kylinos.cn>
 <a71a61fb-2330-4fba-85a7-9ba2a3642dc7@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <a71a61fb-2330-4fba-85a7-9ba2a3642dc7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0032.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::45) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: ce41d6ea-d259-4a81-5203-08dbbf19f03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bpGMaYqT5YKFFwk2aSzRj/TAfHJaL8LJkg/waaZ0FSaTki/QPyNPN0DcQxJZ/QqN7iPOpGSr5eTQ+aysoHTyWxJfv4/BzV37jGirnVSuh89u4RZW5Prj8Su/vZ+RjI5zHhnS0S0slP0gEWRgnzAjJzgXAwFS3s7VenY6Hu2BROTOSBPYUWq1Iixb3Ee+rk6ZCYdUDqIFfWKWYObRti32yfbv1KiAHAutcMPxprWFq6Bej3FW/d0/5EMr+keu8xrGIbC9v5KEHGeobJ3WAhpOz1mQhNzLD2IVSwdlGcJMLBsMoNgdkaDSiabe9vTng/l0NGRV3kinAlr5GY/dhRmFqWLkQLSAnM6qUyhtXRAosWR5fqZhcGvKwNHkBRg971MnJ1pnLHnR/S3yowrn68dZ3iwV1BAUth1wR2gWQIblEt3tKjAfFtVGL2k4b/eqWQez6Y0mjnq0QlMyyqSSMjk19BZVDXHjdeHP3VBn488UXSeovdFIUZ3TRWDNi2DwWxwAhVXz+Ypz2t3mD18wG8Azv/d194kTCk79beYuRpi9cGsor/kcB06qQ2nELJ0UNSZd8iZyKXjc6exvRoj3sPozHaL3qEIeyck+IwpFJNgsGmvC8Y/937wSTW/KKHyEtLbd5zbLP98Vtd+2JiMXyIF6WyReJrzPcqROxRxr2YZgIv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(366004)(39860400002)(376002)(230922051799003)(186009)(1800799009)(451199024)(26005)(2616005)(53546011)(6506007)(6512007)(31696002)(86362001)(921005)(36756003)(38100700002)(83380400001)(110136005)(31686004)(15650500001)(2906002)(316002)(6636002)(66946007)(66476007)(8936002)(41300700001)(4326008)(8676002)(5660300002)(66556008)(6666004)(6486002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEVnUkwzUlplM1lPOE5NczhZTGZlYjJMS1dvRjhqV0Q3dGRBWUVLbVhPRVBu?=
 =?utf-8?B?MHhPcTI0WnhXZ2wrRFVYUFdOSlVHVEo2bXROS2treG8vb09hUjFyNE5WZTV6?=
 =?utf-8?B?dGJ0SXE2bTBySWk0UW85WWI5OXJWcmo2ZlVCeWJyTmdyNXNQSktuRzZXd0Zj?=
 =?utf-8?B?cWM0MmZXU01oRW5yNkhqRXFNV1YxTnhqYjRYUngwY1lTcklia2dWRTEzTXNN?=
 =?utf-8?B?NVh4aUt4bkZoclB2c3lqUE4yTDFEYjNQYm5aQWZuaHhHQTh5TUplT3M1eEtl?=
 =?utf-8?B?SUNHRUYwa1RlVDV2c1FIakUxT0RVelBVNlljeG50bDA3OTBaQVdPNnR2Y0F4?=
 =?utf-8?B?RW4yOEtVM3o3U2YxUTlSbGNqUmFEci9tRGsrbUJNYzZUeDRGMHczZTRnRXN0?=
 =?utf-8?B?eVJNWE81MmsvVllVc2pBSDJCQkFjZGRQRGxNM3hnWmJ3V2VoTlU5T1VuOUpi?=
 =?utf-8?B?SEYybS9LWVZJZDl4SWMyU1BueEhOSHdoTlpSK21mREMvUWNWdjdSZWVJYU5E?=
 =?utf-8?B?Rk9Id0VKMzFxcktaQWFtWVhHQnhuclA5ODZjdTE4Uks2Y2JUb2FOSEN1Zll3?=
 =?utf-8?B?cGZGTlEvRTExeW1IOGh4OTVjZUZnaFhPbFVMdDh3aXhPdHJjOFA1WTBseDZ5?=
 =?utf-8?B?NDhLVGFXaXJkN1pwYkRTZTNsNkRtQUF2TVdydmFrM0tuRXZlWTZXU1gxSWQ0?=
 =?utf-8?B?MzhwNGNuVjk5OXh5aXZFMDBta2JnZkhDaDJienRjekdlaVl4Uk1TYzEzSndk?=
 =?utf-8?B?bm0vaCtRNElEanU1SzNpVHlGUUpoelNXQnN0QmRsNHZ3eEUvZkxzbWQ1cG54?=
 =?utf-8?B?V3JrcHlEdlpsRHJncGNJTjFUR0NsNXJOdXp0cGRiSzUyM3E4bHRxdHV1U3Nv?=
 =?utf-8?B?a1lNL1Z2Ky93WFVNUDAyZ01LQlZsT0xPcDVGWTllWHJsMjJVa25kWTYvMU9P?=
 =?utf-8?B?TmxqcURnd1JsSGVZNVNxdnRkbmROMWwvNUtGMnNsUjZsTU9sVFBBcnMvWlFi?=
 =?utf-8?B?UEZNTkVaMU1ocUNJUnR3S3FjTTd2cW1RazJlU1VYOHpLU1pnRWRiZ1AvQWtV?=
 =?utf-8?B?QlRDYUQ4aGxURERyM1hndURJQ2JZMFZWa0ROampmR1Azc01oTjE5aWdocXU2?=
 =?utf-8?B?Q3psT0pGcUp1eTNVLzhLYmZFMG5Ib0xKeHJvYjh2b0xWcGVMVFBQKzczUC9j?=
 =?utf-8?B?SzFlNkZQQkZyVDhlK216aWExUnNXNlVLQlBUblZyaW1DTFBlMENyWnZoMVk4?=
 =?utf-8?B?SmJRZGxVajQvRXlkVkwzelJwT25GekNNMXpHT1gyWW1rTUVsTzBxUjFCOHh0?=
 =?utf-8?B?MWwwSmdBczlsYm04YU55V0lRcDJGeWtkZzdVVVJTVHZNZ0ozUkJaSEhES3pW?=
 =?utf-8?B?dHpsbmZraStxREF0SDFNZ2IyUFlKVHVaMDRtK0E0NjdnZU1USmh2ZFMwZ3dy?=
 =?utf-8?B?eDRwUkZFWXoyVHFZN3hEK1VITm5Rc1JKVXpjUUtXcHRCVklWaWNwOFdseDJ3?=
 =?utf-8?B?TUxEek1DY0lPYnF1bE9XK09PREVGSzNQQXd3bkZ0YTZKT2NVTkMvVU1BQ0o4?=
 =?utf-8?B?MUdZbWJ1YzVvN05TOXVYb3B2aEVyZmpmOHhRbHdJRUhBa1NLaS9makx3TWNL?=
 =?utf-8?B?SjlyQkMyUzJBSEpqQkMvamN1T1BUV0pSZTV5Q1FDYWhjSGYrUng0T283OXhw?=
 =?utf-8?B?ZGd4YXg2d2x1bGFmbm1vWHp0S0tIRG42S2M0SmxaREZZYXUvMmJWMG91UGhT?=
 =?utf-8?B?TmVHc0ptcno1bU4xdWhKbm5vcTVzNzBvRHlUTXRGSUlXenlHM28wS2phTE55?=
 =?utf-8?B?bzA5eFI3RzBXWndFYy81WCsyMFZ2V3N6RkxQa2ZpUmNkdWNMWFIyUnM1Nmo2?=
 =?utf-8?B?ZGFqck13Y1J1bHRVeUQyUVhKRXBNdytXUUMzWlRvbzB2Uy9GQWhuRmFDK1lh?=
 =?utf-8?B?bTh2Ri8wTmJwcHozc3JXOVk4cFFZVlB4MmNlZzZJeGNoSzB3THhaMGtSRDhV?=
 =?utf-8?B?ZEpocFlTell1ajdPWitJTndDZGlKZmt2bzBWVEpYdzdpemREamxqUnhyV3l1?=
 =?utf-8?B?bXNITnA4R0F2UmJkM25GZGdXVm0wc21NT1ZjNXFWeWxkZEwrVFRReC9FVmRk?=
 =?utf-8?Q?b5K0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce41d6ea-d259-4a81-5203-08dbbf19f03a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 05:23:53.0120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BBmS/4j+TEdW3f3U5dSwiFGHyAMcUBfEBxEgdtcTg0IxUxkUS1/kwJEPvAD7zYg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5612
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.09.23 um 15:09 schrieb Harry Wentland:
>
> On 2023-09-26 01:56, Cong Liu wrote:
>> This patch fixes a null pointer dereference in the error message that is
>> printed when the Display Core (DC) fails to initialize. The original
>> message includes the DC version number, which is undefined if the DC is
>> not initialized.
>>
>> Fixes: 9788d087caff ("drm/amd/display: improve the message printed when loading DC")
>> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 8e98dda1e084..bf52a909f558 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -1703,8 +1703,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>>   		DRM_INFO("Display Core v%s initialized on %s\n", DC_VER,
>>   			 dce_version_to_string(adev->dm.dc->ctx->dce_version));
>>   	} else {
>> -		DRM_INFO("Display Core v%s failed to initialize on %s\n", DC_VER,
>> -			 dce_version_to_string(adev->dm.dc->ctx->dce_version));
>> +		DRM_INFO("Display Core failed to initialize with v%s!\n", DC_VER);
> There is value in printing the version number. Let's not remove it.
>
> Instead you can probably fix it by doing a NULL check on adev->dm.dc->ctx.

But as far as I understand it adev->dm.dc->ctx will always be NULL in 
this case.

Regards,
Christian.

>
> Harry
>
>>   		goto error;
>>   	}
>>   

