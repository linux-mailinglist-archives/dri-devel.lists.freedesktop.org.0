Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2C26D68A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6518B6E997;
	Thu, 17 Sep 2020 08:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA75E6E997;
 Thu, 17 Sep 2020 08:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mW1rl+UE1jlLbYXBvA+buIrOHCUqRM6btCIvQ4IziQOjNeCCNA5Pb0U6l/YQHFvcSu4N/bmkB1I4SdyYDOzlg89sir/4ldfi6BfHvpoYBnYcf1KUNC7KIjlHQueQroJ5KXpfzjiEHIAZBFELytzx3ZmXIaFqVRCZcajHD1ei0kHS+HRO5/CI2bQ3po8iuk5/k9SjPEwPZrjQOnVQnnmI7YzAc8yhDMPS6jmLGScbRyMswVrc3clWmomu+GwSq+4prJJNjcOq8hhjRZmBcmode9RYYIyXfNGYhYdfsNYZ6pdBYPenI8wk6khMl9jpT1qqpynqr4Imil5M8jnsKkphDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+2PecgMNBZG18SbvGq9ipF5iZKRS3JIyLVDPPpzENc=;
 b=IfRqMMCPTE3MLA8LU90MdZf6pJrVk2U6KCEbOHtDV6THrn+8+vyOiG+pz3BDFPxEZ9kJ9bXl6SP+qjMja2ySNBVDsVsmI0NYPIpoctFuXANpJczDy1PwZLkyYIvoLRRbrBYaXCemrM/PsJizS4FCUTjkroUxKEAbVmT03JGj0UnjNgx8qSo4HsNFpsJ0IYhaH04Yqsf9uorukXok/Ueuj7k5Hx30IeDEVzZ0JnaMEYoHq/2W34mkGEIu9rbDOFAxSDImtTE7MxCy0kCnmvYRnKrlql2kcQaaz28l1GxxqdgDkBOGocd6lFU6720mVx3TDmrjvZ4MWYVxYPa9XaQzOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+2PecgMNBZG18SbvGq9ipF5iZKRS3JIyLVDPPpzENc=;
 b=UWlnuiR2gmSpufTdc/i6yzAz1qcW1yWRjFhZWX29mTz4PIR43KQmv3YsaBYg/Dsj8IhIfQvLMPL8lGjfEv1Xh1NRLNigEBwDxc5P9gFcu7xfm5Rnkg3uWgTNx6MQpFp8bD+KRkk/wFypw+6lm35FIy2bX2iq5x+P+cR/GjzMpws=
Authentication-Results: linux.alibaba.com; dkim=none (message not signed)
 header.d=none;linux.alibaba.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2419.namprd12.prod.outlook.com (2603:10b6:207:44::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.25; Thu, 17 Sep
 2020 08:28:30 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 08:28:30 +0000
Subject: Re: [PATCH v1] powerplay:hwmgr - modify the return value
To: Xiaoliang Pang <dawning.pang@gmail.com>, evan.quan@amd.com,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 kenneth.feng@amd.com, zhengbin13@huawei.com, pelle@vangils.xyz, yttao@amd.com
References: <20200917034610.21703-1-dawning.pang@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e4ac75c6-ce1f-7d4e-9402-82f499392521@amd.com>
Date: Thu, 17 Sep 2020 10:28:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200917034610.21703-1-dawning.pang@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0202CA0002.eurprd02.prod.outlook.com
 (2603:10a6:200:89::12) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0202CA0002.eurprd02.prod.outlook.com (2603:10a6:200:89::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Thu, 17 Sep 2020 08:28:28 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d62e4742-ec1f-4c1e-2f68-08d85ae3a849
X-MS-TrafficTypeDiagnostic: BL0PR12MB2419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2419CCEB6C82FBC156F50C94833E0@BL0PR12MB2419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Imx78aEOk184ZznKw6AiniFu/Trl87mbMZvz9aiSpZQIoZOALM1QpPyHM6VMFwNY+6q1YcwWP6HOdRpOiEe96z5JZ0ad8fVrfX8eZ3t2wXdC7L7gjfXq4jzyfM0vjfLEaxgZLc2GzXf4w0wnexkCui1t3Ty+1OgRteJHThbGZ1rzUTyr5eU7v1y8T66M9JK5jrXQ9nPqzEt9Gv6YEyCjSd+SVDhy0Vtm+ELV5408cEdeolHNJPtiE48uHGvtYfHyllR3HjtFA/gI4B9LIQBJm4vK0ck97B1INvaIHUZfYrKSYjUKkNPNi+Z/x+f58BEHWeMoNSH1o8VuqBfbOi9BQoUhDj7QhoMt9bSP57lJ0cd+p0OekdLYTH47W7YPEieX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(31696002)(66556008)(186003)(66476007)(16526019)(478600001)(6666004)(316002)(2616005)(8676002)(83380400001)(8936002)(66946007)(86362001)(2906002)(31686004)(6486002)(5660300002)(6636002)(4326008)(36756003)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: eP3WvTfGSBc1DZ6CqQ7f2yrhHMnWQ1PESVuptRu8eIlecBD3RK7Yos8H8hHSxnToPFlIB4sCd4vW3AVehqf2n2UjVpXTApL3rkwHT2j9LwYBPWKpV+W0ta/nuVqNkOBHkFNpMHe9axjM3ey9rA1R96LUCugrcNEq9lapzq+7XNyHhnfWMRr7ZyyjgedkEKP0AZ1nDKoj51hZZHCAdqI7/FAe3tQKERE+cLpAtTJP/zD4lQyKD8KdJMzagxQUBfgiGUCLM2Yux86++D/A8TL9y5NI4I1GJLqFPg0/5+mhOnTZ7XJyh+Fui3pzPdHdr/mBe8XQbhigktSPHOliiKNbMvqrvEetoEb/uBuzR7ciiUqgdX2AvkZ1t72poqRAsJMWSqtu50S4EgLai1jGD8kfGgFiqGcFlFYPjlbd9VkGrukFDHdX2CKaAHKjNw+cbQRyPb06KsaoYxpQR9X8afEc+X7d5jbNM0005CH4/+qqJ4kI91TIYp6EmOktnRHq2qJnLabNJI6jLfzvtlYfYYyqfO0cKIxOIrOsUH+6KLU/SLfDjgNOhr6sZHxW0CJfu5UMJc924yY32Ie+Y3WAcbs/ORzyknEvUq7J/iZyItiwnHsxc88v7xkScHOeFFcm36etoFpQMWaWohhuZZAj2X0VolzrZP7he4l7qmrh2IPTdBesHM2VelWrSL74vNKAMEAxHryACaV3Go/9lcHkaXrEtg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62e4742-ec1f-4c1e-2f68-08d85ae3a849
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 08:28:30.3627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5kCpH/lKV+xRE4O9NF/lCNlyeUXoWSYTVv/rFDMZa0iBkuPhA6z48rNk9pBcy7x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2419
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
Cc: tianjia.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nirmoy.das@amd.com,
 amd-gfx@lists.freedesktop.org, JinHuiEric.Huang@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.09.20 um 05:46 schrieb Xiaoliang Pang:
> modify the return value is -EINVAL

Maybe better write something like "The correct return value should be 
-EINVAL." With that done feel free to add my acked-by.

Christian.

>
> Fixes: f83a9991648bb("drm/amd/powerplay: add Vega10 powerplay support (v5)")
> Fixes: 2cac05dee6e30("drm/amd/powerplay: add the hw manager for vega12 (v4)")
> Cc: Eric Huang <JinHuiEric.Huang@amd.com>
> Cc: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Xiaoliang Pang <dawning.pang@gmail.com>
> ---
>   drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c | 2 +-
>   drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
> index c378a000c934..7eada3098ffc 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
> @@ -4659,7 +4659,7 @@ static int vega10_display_configuration_changed_task(struct pp_hwmgr *hwmgr)
>   	if ((data->water_marks_bitmap & WaterMarksExist) &&
>   			!(data->water_marks_bitmap & WaterMarksLoaded)) {
>   		result = smum_smc_table_manager(hwmgr, (uint8_t *)wm_table, WMTABLE, false);
> -		PP_ASSERT_WITH_CODE(result, "Failed to update WMTABLE!", return EINVAL);
> +		PP_ASSERT_WITH_CODE(result, "Failed to update WMTABLE!", return -EINVAL);
>   		data->water_marks_bitmap |= WaterMarksLoaded;
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
> index a678a67f1c0d..04da52cea824 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
> @@ -2390,7 +2390,7 @@ static int vega12_display_configuration_changed_task(struct pp_hwmgr *hwmgr)
>   			!(data->water_marks_bitmap & WaterMarksLoaded)) {
>   		result = smum_smc_table_manager(hwmgr,
>   						(uint8_t *)wm_table, TABLE_WATERMARKS, false);
> -		PP_ASSERT_WITH_CODE(result, "Failed to update WMTABLE!", return EINVAL);
> +		PP_ASSERT_WITH_CODE(result, "Failed to update WMTABLE!", return -EINVAL);
>   		data->water_marks_bitmap |= WaterMarksLoaded;
>   	}
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
