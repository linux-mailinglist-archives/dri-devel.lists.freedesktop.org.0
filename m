Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931793DCCEC
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 19:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524726E201;
	Sun,  1 Aug 2021 17:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2072.outbound.protection.outlook.com [40.107.101.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F059A6E1FB;
 Sun,  1 Aug 2021 17:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8w2TL58PQRPNkOoyhN5BY0T0u47vofebttmMWl3HKc9q3jEg/b74bUB4hU+3wnEVT28PSCubhWVY/TOk4GKD340WPvh8K8TXcNzSooNQikSUQVIk/7/ApGnjhLSHp9L1ZDGTRWFl/Q20a02xtkw0icUu/xVLb0UuFBQUtdC+5GxqRYlFjQqTickGl3txoEPH4lpBgOechZa13WvcGN7/J3j/XgSrp0oXkdMPWKWD90PrvbYIq3sm9E5RYc1NaJhDQncW6ICCQU2wWd0CGrPICJXwcpjwREYplHZIOJUFIPIFgkmRINXFPQRfY+yKs0WiFvidr+e+FfTTLUoB6m57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0D5FRems7QHvOdv2C1PeFKMtIGqwhiKr36/XjSP4YvU=;
 b=HiHoj4xj2YCNv8KBQMfeZkUGbS1P4qDItJ5xosQLpudNsp69nmRNYebmS4lkjIRY1NZzEBsX/JbdZzX7e+rVMzOpVpyDCQdeGNCYv3F78uTnspL7aIgATyQ/uA1QnwYgySPWt3vKH61w0DcPdHo8fShwoMqXUFakmAi6M5RpaLgkeSs6zGV9q6nCowVCfzhROEzyXrSFmwZd8HfpqWldxb514j1DMyP5hV2ee1GvsE7x/eGGl+7lkQ/67NhV24oKCrRsDE7ybRFBi0JfUIot5ajOKCBBiPKWSuhiG2McFdgHerJReb5+VJFlSdGKA/XHYHyWUGEhHmRYABNxDwMx/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0D5FRems7QHvOdv2C1PeFKMtIGqwhiKr36/XjSP4YvU=;
 b=i/h71vsxGYGsyaIAqHRXP2dBeVtGFouJAfd39Y1Fmd53wGhA933Dt7ocsg5rikf+Q2XEy1VTRVRskJBNzfsUgaqlBzLVG84R4+lv/lImAUANWgUHbafkuSf+UF58jwrNMu5g/fCmBrExGS8jRHRwRkJ00YEn1PPKx/rg+/oEzvo=
Authentication-Results: tsinghua.edu.cn; dkim=none (message not signed)
 header.d=none;tsinghua.edu.cn; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4847.namprd12.prod.outlook.com (2603:10b6:208:1ba::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Sun, 1 Aug
 2021 17:21:45 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.026; Sun, 1 Aug 2021
 17:21:45 +0000
Subject: Re: [PATCH] drm/amdgpu: fix possible null-pointer dereference in
 amdgpu_ttm_tt_unpopulate()
To: Tuo Li <islituo@gmail.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, airlied@redhat.com, Felix.Kuehling@amd.com,
 Oak.Zeng@amd.com, nirmoy.das@amd.com, tzimmermann@suse.de,
 Philip.Yang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, baijiaju1990@gmail.com,
 TOTE Robot <oslab@tsinghua.edu.cn>
References: <20210731081306.86523-1-islituo@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <047eccf1-70ac-669d-0d34-b0cb0483c24d@amd.com>
Date: Sun, 1 Aug 2021 19:21:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210731081306.86523-1-islituo@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5926:2d3e:756a:8d42]
 (2a02:908:1252:fb60:5926:2d3e:756a:8d42) by
 FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.8 via Frontend Transport; Sun, 1 Aug 2021 17:21:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9f9563e-4a09-43e1-3b92-08d95510d62c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4847C52B26EF3DF6D1A225E883EE9@MN2PR12MB4847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 14x9+MBF/XKJzuRBtww3i3T2gxlhRC7vdhp6mFh+pVFBnFEwT4zvFFqCWw2UwP2Wa1ozJxGrw+tCSi63TIiiYuImEmrECj+bZztaGLHhRGA60JWVETYD0R9m0YGz9zJ6aQOfsbf2ILA77WLW3eQ3YJUukTiuiAhPnNKhiloUeSKjCfQInILr2iliEwJLJPsZLhecJMlnyybLg+gXa9jSxwdAnwvFL8qvQa1OnS/74x2wom/PTt2KAloBBA2bdsKvYBu5Gsc5lD+7MVhI3Tc97GxCQMH6odjk5LzEVUf9eZmkSvODts+8xGx8dp/2SZWZGKEEVJITuj8xPz7EswINpuwCeokPCjeX8e2TzhLPTRv1rOQMXKne7okedoAkseN0v2c6gJEe1jVhwJU+tKu5DkT1ZbgB8y27yV2CRWt5MsqqRAck9uNC0xBTPxqCiuKRmPpPcS6ICLqWb21mv1y8yWvT/JHfnk5+H1SPOyu67UzE+gQ31CcTSh8S1tyQKprbUqT2F9rldy+q6y+Hq1w4ul1cHYvahU1Kms9tzMCH9t8QlGa7/BccyMIWPsyxXZjFTpNGoA3fLhuTBv2UgzYFlcUOiTQa1Cly0VWnnsH00J5lYP9WEIF6nU/D5zyL0CHHQxM2GnRVu3vMF3U0JXeQGPz8hao8GufY69+/gyiSIKUx4OTDgJ0wZtgrnHqyF7D7u8I5VfkQTcVhhqskh5nCopcAEbcvCPwDxrSwjGWt6IQCasaNrecQX5cllOVL0ZNd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(2616005)(5660300002)(316002)(2906002)(31696002)(6636002)(66946007)(31686004)(478600001)(186003)(83380400001)(8676002)(36756003)(6486002)(7416002)(8936002)(921005)(38100700002)(66476007)(66556008)(4326008)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmI1SU1PWEVVcGRMSGl1Rk8xdjBSMlZJRm1mZTlVem54RUk1Qm9YUU1ZNHUz?=
 =?utf-8?B?QXdJN29UZmJxOGlTMVZsakcxSkc3dVd4NlMyeTJYdnd3SGdOWEZ2WDZQSk4x?=
 =?utf-8?B?M0t3ay9WNVdIOHBuNGJhRmgrT0NnelpUZi9TVW9XV0J0VytoOTB2Q2pJL3JS?=
 =?utf-8?B?NXVsRUE5WnVTakM4QUtNbHZsd29tZmtoYmJ3SzNKKzYxQkdjb0J5clQ1YkdT?=
 =?utf-8?B?dUM1cTU3dGdOMk1aL3EyckZteUtiNTI5a1p0ZktvVmtpM1NZVnlnN3MzMWJB?=
 =?utf-8?B?Ynh4T3BhZy9Pb2tXbTZBbmRDRWw5dXVoenB2YjNlc05kRElyZllacHh5SWpR?=
 =?utf-8?B?WXc2ODdXVUtoSW5rNXRyUjBQeEswL2VBcXJ0aldHMFB2VmdZYzBZeGRhbzVw?=
 =?utf-8?B?MUI0R05IZHZHeHMrRkpqZDBoNUVzOXNISlRkT0xTdktSQ0ZuM1VRSFFIMGIv?=
 =?utf-8?B?aGNBTHYram1Oa3U4VFBjSWFtcUM5b1NHV29uNzhJQVZZMHpsTTZKV0w3Ympk?=
 =?utf-8?B?d0FZRjFNSmxqR3lyeU9MZFQ5WjVKR1ZpamdGeHIxM1BrbXdsL3hlSVhkbHBK?=
 =?utf-8?B?TnY1enUrb3lPRlp4S25qT1NQOU1HL2dzR0piVTZpc0lPV3RKbFFFZ3ZhdUhH?=
 =?utf-8?B?YjJScHB4czNaUGhyazVhWXo2UzVEVjU5cWFHcnJNY3ZIUGhCRjFicnkrNEl0?=
 =?utf-8?B?eHpsZUJaYms0eEpCcXZZL1hnMjFNNTRnc2dSWEcyS09wa3U2aUYwQkFzbjB2?=
 =?utf-8?B?TWlaUndiN3p3UmdiemU2d2dBL3Y5aG93SXRvM09hblprT2oyRG00dWtmUGlJ?=
 =?utf-8?B?bkZxRm43ZDdpU1NBWXcwd2dDbE1oREhMWlJKTjdDWVRCaU5DZUoxVDF5aDNM?=
 =?utf-8?B?T0FjQU4vNXdBRkc5Z3BkTHN6bFVyR1E3eW9ZSXl2R1RsSVJGZVV0YlRFcklV?=
 =?utf-8?B?RFhvRHQzWU9uNUduVGkxNU9oUGZDYTcvVWxDYXNrL0UwenpGY3ZPQm9EUEdu?=
 =?utf-8?B?Z0ZhTGFMM1dTU1Rza1l1Z29pcG1uR0h6eDhwRk94d1gvbjVYaUFseS9kVEs1?=
 =?utf-8?B?elA1dzYvbnJMUEViNmwrMUlRL0NybGpnRjJVcXFybFVMYnkwU0JYZ2pwN2E3?=
 =?utf-8?B?cjRGWEZCaGxIazEyVGJUMFBPYWpEL2ZXSXRHWmJXdFBpWmFJNnRIUTlCT0gx?=
 =?utf-8?B?YkJwL1ZnMTRucWVTYlFqOXlOVi9lMDhWbVNGRGdVOTJMSlBIbCtyRHlBNFN1?=
 =?utf-8?B?akxub0ZiNjE2QkNrKzZnWVJPaHQwbVpOZ3ZjMm94MDAzc0gyeGluVU4yTEtB?=
 =?utf-8?B?ZjVXQ1FGWWVKQVlqUTU1WElVS1lVa2FsT05pZ080Q2MvblRQeXV5a3lubGdQ?=
 =?utf-8?B?aTB4TEExRmh0NXM5MEZoZmE0R0NTbEJUN2JmcyszQlpRTlFLbjRUcndnQjB2?=
 =?utf-8?B?SGtDdkF4SmQ1RnhUd0xDNGVnZ25PWWpuaFFXN1VXb25TTDQ3RDZhQ1NrdXlu?=
 =?utf-8?B?cU9vZFZjMURSU1dMUDZGdnY4NkJoRjdxRUVzTHE2cEJoQ0FaNmFFOGdUb0g3?=
 =?utf-8?B?MnVFQnBiNkJxUU4zNlN1aTl5YkgvVkwxZDRzTGk3VHRIbUlzWHZBWDJ1YjlV?=
 =?utf-8?B?R2FGclZMRWhKeGUyMjZxMW9EdGJ6Zmd0WW1WdkRVV2p5c2hXZFR5RG16L1hP?=
 =?utf-8?B?dys3U1ZkWWNnNTgzKzNKc0NQQ05LdEM0aXJTOUlUZ00wczFmRnpDOU14RlBU?=
 =?utf-8?B?djJmenFoN2tQSWp1YlIwRndYenRQOTl5amxqdE55NS9rcTBObVhCVFVnZkM0?=
 =?utf-8?B?WU1xK2o3UXVXMVNTNG1sYnNQR2hRZmQ5bUFxQnZWd2xJRGVrd3Zpc1VHYmhv?=
 =?utf-8?Q?buA8UbCNldEXQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f9563e-4a09-43e1-3b92-08d95510d62c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2021 17:21:45.1905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ej1nIivRTWulOPWpqDVALU5HMCXaCKi/loqiM/RDEi/nktkj2T935B1jzr96ACZH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4847
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

Am 31.07.21 um 10:13 schrieb Tuo Li:
> The variable ttm is assigned to the variable gtt, and the variable gtt
> is checked in:
>    if (gtt && gtt->userptr)
>
> This indicates that both ttm and gtt can be NULL.
> If so, a null-pointer dereference will occur:
>    if (ttm->page_flags & TTM_PAGE_FLAG_SG)
>
> Also, some null-pointer dereferences will occur in the function
> ttm_pool_free() which is called in:
>    return ttm_pool_free(&adev->mman.bdev.pool, ttm);
>
> To fix these possible null-pointer dereferences, the function returns
> when ttm is NULL.

NAK, same as with the other patch.

The ttm object is mandatory, asking the driver to destroy a ttm object 
which doesn't exists makes no sense at all and is a bug in the upper layer.

The NULL check is just a leftover from when the gtt and ttm objects 
where distinct. Please remove that one instead.

BTW: Bonus points for changing the (void *) cast into a much cleaner 
container_of().

Thanks,
Christian.

>
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Tuo Li <islituo@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 3a55f08e00e1..0216ca085f11 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1146,7 +1146,10 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
>   	struct amdgpu_ttm_tt *gtt = (void *)ttm;
>   	struct amdgpu_device *adev;
>   
> -	if (gtt && gtt->userptr) {
> +	if (ttm == NULL)
> +		return;
> +
> +	if (gtt->userptr) {
>   		amdgpu_ttm_tt_set_user_pages(ttm, NULL);
>   		kfree(ttm->sg);
>   		ttm->sg = NULL;

