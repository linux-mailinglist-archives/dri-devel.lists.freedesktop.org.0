Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D87D3DCCE4
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 19:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB34C6E1F9;
	Sun,  1 Aug 2021 17:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2051.outbound.protection.outlook.com [40.107.96.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620446E18E;
 Sun,  1 Aug 2021 17:19:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZMOOb5j41esWGAMoc7uWwlxMHlIojAH2JXJ/hk2waa6WjnoQgvxjAlipR5LuN1Hd/2OxGNOtNKAW0+94AwnqNBAze/Seb3XDRAZKZ2FZODbwKQHW2haXdSzWf7oRMvDb9aL1wEuj34DDM3ptaHTw0qUR0aShndeibjLH3JwxN3qEtYGBZ78UVZHR7ev6wDSUhnvRNw+aEXDOPV/jIipB3VEaSI3p7/WlzpsgKVeVqhgJDeVLIzKi1M4MBOqo5SxaUYYmq212XS2N0JXNoC88UZ+WziIGgnWBB3rYNC3aOCYLnRf9ZFlxjYfJTs3zIXFx0fgUZAqEPOEB0P30BbXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+goaxgEZ8Go68mPw8QgvPAfymMsoCOssqgo+tCkIoU=;
 b=eONv179FTyCrzgTAXpCq8RNIqilk2+nRu1ILNbbAVf2osED2MxCQGpIL5z30tU2LnroeoKzpLiUwu7hlntMtvq7F/1kwIB/9HSK9B+EDXVE5yLpUhjMgssk02dSXCY+5Ew7wYdSCH3zeKeIBO6SyKJOTeqt3VeZQwvfSXQKVfdpyz7rV0jg8h1Eg4KOuItaV1vrs8SFS/kD1G2ZW8PHPkSU3QJVAIsmuWZK5UGVM+fq2GaUh8no+OfflGhPpswHiVg34CE/CtjdcQ+BcKlInOiGpNQWcmiT9JfZMVqJsNSDXOV1Q08a+maARWkjUf1Q4VRgaYK7mo8+rZ7SOec4bWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+goaxgEZ8Go68mPw8QgvPAfymMsoCOssqgo+tCkIoU=;
 b=q0xf4RNdxPCybuUa8pIOalClL4lnlIs3D55eRohf+huAWKkvSNS0ZGFG+UDQcJ1eXWnA9wCdbbqOm4jmBDtMelqyYigFD9rCp1XIjjDOj2UNNdbTNTUkIsDZ8G/FfXSf6UeSEOFmFrWi4Tr7SD1igvGO6oZ632wAwzKVtVslAzI=
Authentication-Results: tsinghua.edu.cn; dkim=none (message not signed)
 header.d=none;tsinghua.edu.cn; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3903.namprd12.prod.outlook.com (2603:10b6:208:15a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Sun, 1 Aug
 2021 17:19:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.026; Sun, 1 Aug 2021
 17:19:08 +0000
Subject: Re: [PATCH] drm/amdgpu: fix possible null-pointer dereference in
 amdgpu_ttm_tt_populate()
To: Tuo Li <islituo@gmail.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, airlied@redhat.com, Felix.Kuehling@amd.com,
 Oak.Zeng@amd.com, nirmoy.das@amd.com, tzimmermann@suse.de,
 Philip.Yang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, baijiaju1990@gmail.com,
 TOTE Robot <oslab@tsinghua.edu.cn>
References: <20210731080437.74539-1-islituo@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <53ef6ff7-f793-5de4-4ab4-0efbfbfc0a54@amd.com>
Date: Sun, 1 Aug 2021 19:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210731080437.74539-1-islituo@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0043.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5926:2d3e:756a:8d42]
 (2a02:908:1252:fb60:5926:2d3e:756a:8d42) by
 PR3P189CA0043.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20 via Frontend Transport; Sun, 1 Aug 2021 17:19:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2910e0e-6e03-4ff8-a515-08d955107858
X-MS-TrafficTypeDiagnostic: MN2PR12MB3903:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3903706BA39E51121C48DF2283EE9@MN2PR12MB3903.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TgQZERCJp6PkOZ35ESf4dUYb1HmZL0u0ek8E/7ieEfmIUD9wg6dOCI6sk9k/TsD6U59C3N3F5rTqqKhp8AzU+/jueLNktpdbxrg27OzUX3hJ2zuX9BZgOa0Qz9ldba3PqDbsICa+0Ou2gISxV6UrBkwC0KON3t1hqYUuaaz5hqzC253EGjZi13iwyYOZrQmykBL4zuD56ik5V4GMV2ChqlEqBuomG2RhU5N9yUUUh9iUW33hK/jjM1wi/KNB1nNeN6CKbSJKpDY4f/KXSoTH4+GLtK1Phte0wh2bJth8FqZPypxjjdN3V2iqRlMcIedQAElvn40Z5e02xiPQkyXsVuekLZ8RcP+Hv1TRSyUkraqNlrT6o6UyTlDuNqb6rKVJJBSeMNtduyz3x8rpjTXJzL8MF9pYFBL5bVEF2uNwxl8u4Zx6B+EmO8b94n6avbHJ3yOYvznDcZ9zEsjsfBAXB5vf7fFWmJ7ysClFzMtYC4phhPaRKxLtbOzcLqQGhSlDkFFGclKrTob8A1rRxeOw8TVaPqb/5sz7IjRYQe1EoKbVchIFkPj2MNtYWZAtm5p3BxRg6thZtm5kGoxJL/Gi4Ft9pPHLgera9D4UyurZtbFqTyUl/UXV7YslN6DM5pzQtzn4sHdV+WajPgM/64gN6El93vHwNLpv2E7DSyxwQQnXUNg9Ek9SVI1ZVscEullil7V694Oojhv+OIRWL8a7sRUszeRDtmdxP2yZC9JIylkg8MX0itoBGHIPiBX5MF5n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(2616005)(5660300002)(316002)(2906002)(31696002)(6636002)(66946007)(31686004)(478600001)(186003)(83380400001)(8676002)(36756003)(6486002)(7416002)(8936002)(921005)(38100700002)(66476007)(66556008)(4326008)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXhXVmgrNks1azNOME9ST3dJTUNnSXpSMFpxNXFGd2E0a294SUd0QmtFeTRE?=
 =?utf-8?B?ZVdpMkZCVjJBMEZrcGdUK2FBUUwza1dubzNiSU9hUTdqbkxFaWVxcWlUckw5?=
 =?utf-8?B?R1FGOHYveS80bW5peUtmNnhKd2dNM3d6emgrek1NNllmVmhmdmFrRHJuWEV4?=
 =?utf-8?B?Rk40aElHUm96RnlrVncrVWROTGlCZ1orc2JzVXNMVDh1UkdlVkdORE8yTko4?=
 =?utf-8?B?K1gwRHAvYWtNWHVBSG1mcVdJQVlydWRlUnd2OVMzRENaRVUwT0tCd0lTNzhR?=
 =?utf-8?B?bURpcHpQQWJCbnNVc0w4MVo4ektEMVRlZVNxbUZFQ0ovWlB1ajkvdEFCZTVR?=
 =?utf-8?B?T21tUVFOeGpDWFdhaEZBVmQxdGNjTmMxUTgrSXhEQzJ0OVhITW0yYXU0em82?=
 =?utf-8?B?MytGWjVoSHBKSHhMRi9qbDlGL2lxWWJjeUlKd0JpWEE0bCtiQkxmaW5vOW54?=
 =?utf-8?B?Zk14SkFvZmFBYnQybEh6cVdsRDZDQ0RIQm01Q1N1ZERpbmhaN3ZEYVZoZVNY?=
 =?utf-8?B?OGo5Z05qTUhlZ0ZKM2VVWGcvaGJmK3VVNWZvL0JNRDdabS9vQ2oyVzU1Rnov?=
 =?utf-8?B?c005RmpSNmo1cGphVzRLOWlQd2l2ejBmVFpPL2I2ajJUYzJObWxFaEl2NUN1?=
 =?utf-8?B?ZkorRXZjK21GVDd5YzM3QkZUZnBMUnQ1RHV6YzJjZnVrUEdsY1c4L1FQSmZR?=
 =?utf-8?B?NEtjY0RYbnZwa2JDUVlBbzZ4cGo1bTFtclBMYU9qeWpaZVZPREprb0lVbkdM?=
 =?utf-8?B?a1p3aytxUTliOG0yNEQxZ0crY1dGSW1YaWhPR0JJNFBWb3JNVHM3U0NDazZZ?=
 =?utf-8?B?N1IwdnVVR2xCNE95SENBVC9hSFFrMk9xbmw3bU9YQ09OMFF2OHhKNDlOcW5Q?=
 =?utf-8?B?NlIxRDNmbmxLN0U1MGFlc2xZdTJMVm1xcVFmWjMxbmo1VDE5WC9rRW5YUGdt?=
 =?utf-8?B?dlFyblVwSnMxWFk5TDYreGNzUk05SG1XQUduYmZlaTk2dmFvRTNzYmQ4c1Z1?=
 =?utf-8?B?aUo2dWp4Mjkzd21PNm9neE5jVVlwa2VsaXRWM0UvdWZxNXR5RjBYQ21JZURE?=
 =?utf-8?B?TzdNSExQVHlBL1lEcVcyQXZxbFozQnhXL01XcjQ0MDVwTDdEcURnYkZKNU0y?=
 =?utf-8?B?ZzBTSXg3TjlZSHlsZFVGekUydk9nWEpOQjIwNHlvZDYrK0dLbEgvQVc0L3JT?=
 =?utf-8?B?bHROWjJCOFhrdGtiS0FMbUtscFNObUM3cUJIeHZqMmxRak1WM2dGM3BGeTZq?=
 =?utf-8?B?Sk5JUHdKY1BjMHJFWXBMTVloM1RHSnhVbnZnelJ0TFNqUnhFK01TS21QckxK?=
 =?utf-8?B?WHBFb3g4aFlQcC9KQVdJdFc5ZWpaMGlBanozcGxTVnliK0FpaEJFeUR3aGg5?=
 =?utf-8?B?MkhHR3V2T0ExWldOSEZyL1NndjVHWUFhR2lrNTE2bjNLT3B1am03amh6ZS9j?=
 =?utf-8?B?WGpDZHgrM2czTGhYdHFtT3NSTENZbkM5M2NTMFZpbkpkelhKUTVXZThvYW0x?=
 =?utf-8?B?Vmo0c0RKU2xyN2RPZFNRNngxNjdIeFk3L1RmcXZCNlJvbTV0Uy9rem4rS2xq?=
 =?utf-8?B?OTFRUVExYmZOdXc2RDA5NFRDcWJ3NWhMR1MxQVlWT2U2NUxSeUJhNXFLeWs1?=
 =?utf-8?B?amJsc1ZjVUZRNmpsZkdKcXA2NnNiaDNKbm5vVWNhc3F6ZkNQM0w3WGUyY2xx?=
 =?utf-8?B?ODcwMnplZGlxYWswWVZURXlBMzRDd25OSnJoYTVlYThBYmg0NFJlZDVLQ3BP?=
 =?utf-8?B?SXlyeHBocm1tVnkzandWaTF4NmVDMzBxWGh4VFE2cTR6S2p6WjUzeUVqRGh6?=
 =?utf-8?B?b0JuSE15K1ppTXhtWVIyTjZ2YWM4Rm55cW9iQTA4dVFrTlpVUTA4cUdOZjh6?=
 =?utf-8?Q?i3yefkGydU7BO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2910e0e-6e03-4ff8-a515-08d955107858
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2021 17:19:07.8737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZpsHNRmksJQEgwDc51E7nHOJPAvcGBda8I/bvdWONeqFldTYFqxQLbjdH58xDdt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3903
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

Am 31.07.21 um 10:04 schrieb Tuo Li:
> The variable ttm is assigned to the variable gtt, and the variable gtt
> is checked in:
>    if (gtt && gtt->userptr)
>
> This indicates that both ttm and gtt can be NULL.
> If so, a null-pointer dereference will occur:
>    if (ttm->page_flags & TTM_PAGE_FLAG_SG)
>
> Also, some null-pointer dereferences will occur in the function
> ttm_pool_alloc() which is called in:
>    return ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
>
> To fix these possible null-pointer dereferences, the function returns
> -EINVAL when ttm is NULL.

NAK, the NULL test is just a leftover from when the objects where distinct.

Please remove the NULL test instead.

Regards,
Christian.

>
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Tuo Li <islituo@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 3a55f08e00e1..80440f799c09 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1120,8 +1120,11 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
>   	struct amdgpu_ttm_tt *gtt = (void *)ttm;
>   
> +	if (ttm == NULL)
> +		return -EINVAL;
> +
>   	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
> -	if (gtt && gtt->userptr) {
> +	if (gtt->userptr) {
>   		ttm->sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
>   		if (!ttm->sg)
>   			return -ENOMEM;

