Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCA03DFB90
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 08:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0066A89C27;
	Wed,  4 Aug 2021 06:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3461D89BFD;
 Wed,  4 Aug 2021 06:49:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEYarYTigaYaLi8xSNpD2BBwiwGiOgsXf14IGQJL9O3CvdAozpPyOSCVjgnsouZM96ONove42l6KNpH8VxrkFOqwqX7aolLrrT/cfdxq9SJWjJhBV8kYwwY1GuuWiF19Ey/DRhXnO7Nn2X4rb+x5QRYFwFD8XyVpLm1Tdt/Pm19CuYRfNmH/7WpL9oqiMKiQxEYZGJExzrFxR00E/YXGLyg8OHWhFZU/7QZnpOXUAkXJ2oxDTvIJNfjGaTejF+bm/VvAs7f81bEzKS5ecKxMzNEh5JVkHr24xzQxqYxWLN7Hl2EUEchsVhizRAfra/P0rrHnSGM4LZhArsRM0YfoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R21oSnGALzqbjJeYzxNUJDx/qMtkpewI2Ldb9Zf3myo=;
 b=G9hZoVoe9eHiPSU2jGCxSFohCpz8P5t45UhxgOTKkTTKxM1+ICzZ3y6IUfzh7nZUDgU0m4S1blYUqdwZFLzbMXkm+66CwBKP9Do0/MQ84DiDZX+Hjmiuu3thUA5LODQ21Nr2xaNispwuu9N3YkKtcqGqolRZA4vqWnFdrAA6UIWOOiLenUbuFTpy61Vi3HIamW8IdYnBdDB93m+06GEBeFjkl30pHZDETWcJSI1K9GfRh5pnoASwPxk7DscIYPpv7RgbQeTm14XXu7KLBEI89vwcrANxNt02IMhg0LTMxNf0n2ddXvvWzcBZn53bTpIrrL7EF5oVaBKJt7t3AJxG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R21oSnGALzqbjJeYzxNUJDx/qMtkpewI2Ldb9Zf3myo=;
 b=C/ZT5enuuFdyLQunCZ88Lny5mR48e2ZmFLtlPmBjwQn6N5sASl5Jk2xjJSIB6yRjzl3BQ363TXuZPUvBe4zySnilG6im5ZBbDdVTE2dtofvM07+f0YrQ+srEDYg82yZNFa2gurzNHudUxb86qPRiR8NbgRSnB37xGIDuixMcQJI=
Authentication-Results: tsinghua.edu.cn; dkim=none (message not signed)
 header.d=none;tsinghua.edu.cn; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2514.namprd12.prod.outlook.com (2603:10b6:207:43::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 06:49:18 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 06:49:18 +0000
Subject: Re: [PATCH] drm/amdgpu: drop redundant null-pointer checks in
 amdgpu_ttm_tt_populate() and amdgpu_ttm_tt_unpopulate()
To: Tuo Li <islituo@gmail.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, airlied@redhat.com, Felix.Kuehling@amd.com,
 Oak.Zeng@amd.com, nirmoy.das@amd.com, tzimmermann@suse.de,
 Philip.Yang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, baijiaju1990@gmail.com,
 TOTE Robot <oslab@tsinghua.edu.cn>
References: <20210804015132.29617-1-islituo@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f515880f-17f8-66b3-20d9-c1a46a252463@amd.com>
Date: Wed, 4 Aug 2021 08:49:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210804015132.29617-1-islituo@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0024.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::37) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fc63:9f41:3d77:1613]
 (2a02:908:1252:fb60:fc63:9f41:3d77:1613) by
 AM0PR07CA0024.eurprd07.prod.outlook.com (2603:10a6:208:ac::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.4 via Frontend Transport; Wed, 4 Aug 2021 06:49:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2f79aee-7de1-4374-1ef2-08d95713fa73
X-MS-TrafficTypeDiagnostic: BL0PR12MB2514:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB251449AEEF598E86CFF8F3F683F19@BL0PR12MB2514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z6PzogWllAT/MkfYMMYVScVnhKZm0JTIEJi9QVKTWur/CPm4k0ACEtA2fjBxfw9UTnpwz89L8FC+4VamU8UrFq4RJDbLxK0Ykz8ruZFcA+7eBO68YfMRRj24uk6Z7fFJnWawirX7V5u6GlX08iSxSwnRshlgoiDguxj4RNyCZuprbGsdj/Id65/oxVAIos5ns30QDlsQ89MdNNivNZONMJGLunuFtUt/7xT2SankKKUsS1KLkeO2lyi/cMvMKZuFDrRylZWRexEagyPHKGNhtctYjq4zKBcxKFZ3N8avPzD2wKQydgEOiPWQMJZsDzoLhmlk3PNHb52TBGPMYaUmAM5uX0om212z1u8N5w6mAhm+wlWNCgAih8J0bq0L0mdRNagK1xUOzLRyQazEq5km2u41U90IW6myz4Aw0SZiwJTMV2pRf9V9GBgEMeS6GBJDWLswMwXoKOjNQIKmvwmtKMg5gMK1acv+y4XIqUrUMR1watKURA2NCe+Pu4Yhd/HQqEsE79xOuqQ8PgWN1NR9GQNkVlMRA136hr+cL7pNp9GFmj0LyUvLTR1/7hTC1peLenm3bOlaNBUnRxR7wCBQkNxmWqXgawtnSSt9Czuw2LAwHvJ4Vpt9skRWwGN2L9y4uWmG27UOH1jantkN/LHUnn1+KS5U/9Nd4BxfEdxItWMPuzWoemhv7xCKioMgpsq10FpoQl4IrpHbxMRlibSKzZhT36zBJZ1FSxmKRsGoYP0JL2v9z2DZ/Kch4ExZLb+M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(31696002)(86362001)(83380400001)(4326008)(8676002)(478600001)(38100700002)(8936002)(6636002)(5660300002)(6486002)(36756003)(921005)(7416002)(31686004)(66556008)(2906002)(66476007)(186003)(316002)(2616005)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejRXaHRwb3BoUUV4UjJsdUJGenBPYUNEY0hGem5iaXVYMUVEZThtdGhUU05L?=
 =?utf-8?B?TWlyQVE5U1BZcjMxYThEd0Y1ZWFxSmFWbFVKdkliTVZzK2o0eXNlc3dOWlpB?=
 =?utf-8?B?YUhZZFNEdU1xSnFRMzQzc2tva3JnYmlyd0EyWWoveWkyUFRLc2dwSXNGUEZr?=
 =?utf-8?B?RUVzR2NOTFZ2V1ZpbzFrOVc0cE9KWnBnNEhMd1Q0WVdkdld2UTVZcHpSV0h1?=
 =?utf-8?B?VXhpMDBOQnZZczZiTmhEWDFROTVNTnd4OUtzZm5WZGoyS3Z4bzk1R0ppR2Y1?=
 =?utf-8?B?Qlg2MmF4emxuRldQeHJlTXBralFxeEt2RFJvcnJvT3ZBY1IzMUFQMDNHSHNV?=
 =?utf-8?B?QW1sZDhuSkx2VCs4Q2RvKzFZZ1NzdDZPMWhPOGJUa3lPdXdNN3NoY2tkeFNP?=
 =?utf-8?B?VFgzS1QwZTkzaGtuajd5VnlId0dhN0dDanFLYnlvRk9rOURPeHI1a05UTWE5?=
 =?utf-8?B?ZzlJSzVzUzBZWW5PT1B1U05UVldVSHpRVjZoNWtxM0ljdEtFVDBnRVFWT1Bu?=
 =?utf-8?B?eUg0cEdVcjhvaW42T0dFYnZGUktXdHo5aG13Q2s3azc2U29KSHlpQzZhZ3RK?=
 =?utf-8?B?WitFS210dVhRUTFHNTlTSGNxUmFYdW4rWVlkbXdGT2pwTEg5OG1CRUdydERh?=
 =?utf-8?B?bGNjd1dmN2U4MitJR2NnT3RwTStKTUkwTWlzUlR6RVJKNk44eEhRL0Z4VjZX?=
 =?utf-8?B?WUxNd25jZWZiNkI3dkVKNUZrQ25SS2hXS0VjcmZUTGJYWXU3TmxvaWxkMGxm?=
 =?utf-8?B?dGtxcVBiWlIva2Y5Y0diRGZXQXQ4M25DaGVOandkaWdFTisycTNDSUtMSEZs?=
 =?utf-8?B?NXAzM0FjZFdkSmc3d2FteXd0a2o5SnBBTXhMeVRwTDdMK2NEbHRidVlPQ0xF?=
 =?utf-8?B?WDIzRm9ob1ZYZnBDbURla3JqSlc0bWhLZ1lLNzIvdHNCdUM0UkZkR29sK0F6?=
 =?utf-8?B?ZTJ3eUFlOTV1blNoYkpCek5FYzczcFE2UW5MdXo1d2g4UkVZQUdqem1ORFM5?=
 =?utf-8?B?Z0JPNUNHdHJ5dmNvckZLWFN5dUt0L1FTS281Ky9LWHdkQW14Q1MxQzExblk5?=
 =?utf-8?B?UjVIdEFkYTY2a2pzNnJkVllSVHBXd3ExeTF5WDZFWHE1Y2w2a1JNNTNOelkx?=
 =?utf-8?B?UVRCeWdjbi9nU2dJTzBtbmcxVk8rc1g3MXY3bDlPdmpScVR3Vm5CZFFmL0dL?=
 =?utf-8?B?aVRtZ2NuTTkzOS9BbEEyQlo5OXl3MDArdVJpc2UwcS9HL3dJcEFoWU5WL2M5?=
 =?utf-8?B?dGZHYi9BY1JNbkcva09vN1ZGZTVYakJEYi8rbUVIZjhSVFRNQXA3clUwQ3hm?=
 =?utf-8?B?dUM3RVdzYnFwbkdrRjk4WFg3dlNtLy9PTVVkc2RuSm5vY3lMVHdFc2s0UW0r?=
 =?utf-8?B?RGFNWlhUSFJ2WXNDS0liZnhrMXpnUVB4NVNRR1l5Q1lrOWJJQWtWd1BVZ3k3?=
 =?utf-8?B?YkZRbWFkRmZWVnovSDczK2FML2NzUFdMTzlQb2pKa3o5Ymk0elh1RVdpYlA3?=
 =?utf-8?B?TTJHZVQ1a0QvTEkrcVBpckpIbEZqVGVNaTJpbzRtL2Z5Wmtkay9QeFNEOUdX?=
 =?utf-8?B?RnhJcmo2ejQ0OHFnZlBzUDFqSnhQTnJiQ0FzdVBkdUR2UTRzRnF0SDVPejhF?=
 =?utf-8?B?ZFFIWmVOdGNRa01xWnpHVTIya0lMMG84NnVReGNZbWh2OGNiV1dYZGxOVjdn?=
 =?utf-8?B?dURIOWdIaXcvZG1oSkZRWVc5ZVVISU9aNDk0Z3RvRG16UEJ3WmpFdG9SaEo2?=
 =?utf-8?B?TU9mMTNMdFgwQS8yS1diYTlPLzI0MklHR2JWOU9DYjZyM1EzZE4zNU1YSmtW?=
 =?utf-8?B?YjRWMEMvVFVNYXJzcE0vMGlTZWpYUFpqMjJFZEZUTmNXSnZLbEVzeTRUN044?=
 =?utf-8?Q?od+dMww5VN9vC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f79aee-7de1-4374-1ef2-08d95713fa73
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 06:49:17.7693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +On/45LMIKsd7zxRBKEq8IoKbUkzHvteg3bW4SKXFnk5fTwe2KfdgKYqfOENFbfL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2514
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

Am 04.08.21 um 03:51 schrieb Tuo Li:
> The varialbe gtt in the function amdgpu_ttm_tt_populate() and
> amdgpu_ttm_tt_unpopulate() is guaranteed to be not NULL in the context.
> Thus the null-pointer checks are redundant and can be dropped.
>
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Tuo Li <islituo@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 3a55f08e00e1..719539bd6c44 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1121,7 +1121,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
>   	struct amdgpu_ttm_tt *gtt = (void *)ttm;
>   
>   	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
> -	if (gtt && gtt->userptr) {
> +	if (gtt->userptr) {
>   		ttm->sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
>   		if (!ttm->sg)
>   			return -ENOMEM;
> @@ -1146,7 +1146,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
>   	struct amdgpu_ttm_tt *gtt = (void *)ttm;
>   	struct amdgpu_device *adev;
>   
> -	if (gtt && gtt->userptr) {
> +	if (gtt->userptr) {
>   		amdgpu_ttm_tt_set_user_pages(ttm, NULL);
>   		kfree(ttm->sg);
>   		ttm->sg = NULL;

