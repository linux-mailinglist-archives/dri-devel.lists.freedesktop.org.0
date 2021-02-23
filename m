Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4133227A5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 10:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E242E6E167;
	Tue, 23 Feb 2021 09:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C55B6E167
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 09:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CavRL1TPfRu282nJyIH5m9dJh4bBr8nCcaU0GE+XboGVr7hPFoBP9M98tK+gBOkJWLnLzMJmmmOdCvuLXsGr2E3G8TDZtDgJ93p+D6xa+zLEg472pLVlFaJ6B6JzB/lbcfFNAUpSbinp+7xsyEDsJlkMYPZ4dFtc1ltIRI5xKr6Ie47t0tBpyGCEdq1db+S8h36GbQ8IwIlKVIBIgtCxBvTkOLNDrlpYhzsP1j26sH0uACJQry3yKjKCVlwmipbYHBD8Sg8lqDl1F/cDIdzjBH8AgpgTuGa1m62yljnFFr2au6NU4tsYf+ooz/z8y5MLB+8oBrlMcfGxKt6d/7NkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuFEOZDHiGxi3VUZ1XDlD+hZmsc38ugPNrDu5/DfX0E=;
 b=lDGf0i7C+zxBA1d167VkKWSG4XNXWonRDCG1HIGyQ6CfFn0U08IFxfHV59xux4mvPla5O+3OI60Q0SeBU9GC6fck1+xXEZuUhj3oVuicybYQqLTJRP84uMsRG93Wdec6qmEsyDzIjYA9fhZ5Mmjma5C1KHMIfidby7bGOJYDPiei4RrpL4t2p/DWmDhM+Z8KCcn6fTFzU3WoBLcBVk+IeAorm7C8406MU7D6HUQOkI4K3n2p7X2wh7epa6Uulfrc9DM/2B8xRPnhUXSSSidfnlWFA+EX6bhTvMSW0WX+UNC0EnrchhgwqomeC5PvJ0j8u5ibeQq8taR3pnuu1+lA3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuFEOZDHiGxi3VUZ1XDlD+hZmsc38ugPNrDu5/DfX0E=;
 b=fRWoqcBo6bPaJUev2hWdU860xbFj3yb05h3X2xpp1vhdhpCK2IxW7DHGaYqcvumrPTXxKe5K+FmbKkXO4O5bvvQf3dl4WoCATf0SjohQYcND9vk8hI2UMxrVzQpyPA3qYda43ISMO8tfUg086GSRatEuR2lPpU3TIh8L6GfjgMs=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4659.namprd12.prod.outlook.com (2603:10b6:207:1d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Tue, 23 Feb
 2021 09:18:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3868.031; Tue, 23 Feb 2021
 09:18:49 +0000
Subject: Re: [PATCH] drm/ttm/ttm_bo: make ttm_bo_glob_use_count static
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <1614070452-91054-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5a2f3ed1-2867-25af-bb9b-51d99ef66d28@amd.com>
Date: Tue, 23 Feb 2021 10:18:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1614070452-91054-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
X-Originating-IP: [46.189.55.12]
X-ClientProxiedBy: ZR0P278CA0050.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.201.250.142] (46.189.55.12) by
 ZR0P278CA0050.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Tue, 23 Feb 2021 09:18:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b61af509-0e2b-4d2a-6af7-08d8d7dc06d5
X-MS-TrafficTypeDiagnostic: BL0PR12MB4659:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB465929C8F24CC58EBCC3E38D83809@BL0PR12MB4659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kjxz54Qvqa4yFlCu7ED5xWVIqXbxjMzM2wYVvS/lJLYAF8nC1B4h4iBygApACf5di9bW83QOjlPSCkUIGgabuTD+MekP5U+9T4srF3bYM8/07yC1QmUrD761tNknJ4fbtqeefu5HJ3XZwaevYQ0mRFUBmbqvhg56SedmBR+yAlmUcFsH7uHqe0LZZ8RpLgLrnvHQvsbJE+3RU2hsRkPwbcIgeY6HzajSdUd1Yl4vDWh5IxL9vxmygBD5gato8wlykA0KawbIWabLw69ZPTfRRWHycQ2L8hwK/KIhF08dBU4WKbsToVm/WBJOjuHNJo2bt7x67QoCP1UFRTJLkX7OWthBo/5Ksk+iCpQ4Zn8zCb3EPDGNJcxI7eQeRWRK7U/7AuR96xB7yzyCQ9ltIhZKQVpt/m8MZGe9yUxl6xytbn7o0Yn7NzyEjczS7LPWP0xtXPCcUt0U9eUOaQpQR5HynPY3sZG8HWIf5uTdl2fvkF0kT8UiYFodFgCE6uWuY8uX1H7WQSCXxt0YiXWaoqoEGh+VRMeWOWQUxd32Os4tTlN+6boKrFkjBdHekcwdhY6qEWyU8GLPpIUQEiz3FDRPvEArLBtFTWTCTSvMkjvgN7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(186003)(16526019)(316002)(8936002)(31686004)(956004)(2616005)(2906002)(26005)(16576012)(6916009)(4326008)(6666004)(6486002)(83380400001)(478600001)(66476007)(4744005)(52116002)(66946007)(8676002)(36756003)(86362001)(5660300002)(31696002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R0tXTHUzL0F1WkRDYVdOR2hZS0EzcmlZalY1RzdoY1pkOCtzSzhTaktVMlo4?=
 =?utf-8?B?R28yeERJVVJoeEhmNDZ6NWJuc2xoUy9EWXd4b3VtUU9KYkd6d2tVYXRHTk5q?=
 =?utf-8?B?aUREc1hqSG1oR0hWUmdjYlBDM3o0OE9UOTZiWTZFeTlNSERFRERMUTNpUFcy?=
 =?utf-8?B?cjU5dk1hU3A2c0ttMnJnUzJTYlhXOGs0NURlNW9ERXU4Y3FPcUpTQTU0dGdv?=
 =?utf-8?B?QTB1TUo4QnBubDBndm9lNGFFZ3JtZDJGUi90akV4RHg4blpDc0ZuaHIwaThJ?=
 =?utf-8?B?RStKekFhU3Q2NHVhMCtib3o1bjZxdlZDZ2QzczhkVEVYZG5FQ2lqMTNzcTNn?=
 =?utf-8?B?TDBmcmNvdWRyejZsYzZSSUhSVWxIUGRiU3YxTTU5enhWOWF0N2lLQk1RNHFi?=
 =?utf-8?B?M1ZYdFEvcWpxTkQvRmFlNm55WFIxYW9WRFlHa1dCMGw4MjY3M0FaOTE2eE5W?=
 =?utf-8?B?YXRPTS84ak9nY2NVenRkWjRYYXhveUhvaTdpZWdyYjdOZzl3Y0tMQ3dWdTV2?=
 =?utf-8?B?TEFzcTZKR1Z1ZDNuWXdXZ280SElhYlhGWnJqYkJ1dGRCYk1UeHd1TW5QY3Zz?=
 =?utf-8?B?ZFVZQWJ0bXk5cmFQNzVpRWxMakIwOUhCNmFheWZWQ1FBblQxZUQvR0JOcUVs?=
 =?utf-8?B?c3Ezb0QzZ2t2NXhSbnRDOWhqY0tXL1ZTUElsakpKQ2I1QnFwb2JTVmRGcWpa?=
 =?utf-8?B?aWw3N3pnaTBKSWdML1FNVGI2cTZubDlEeG1JMUE0NUFadzYzNUtuaWpqbGg4?=
 =?utf-8?B?VmJUS016WFJQNTZEeFVDUW90V1BPNGF0MFk3QVF5NC9pbUV1U3RiUFdRb2lT?=
 =?utf-8?B?d3EyaHZGQWNMRkFObjdrc3B4b3BwTWFEUXJxUDJEVjhBLytVMFA5cHNkU2w4?=
 =?utf-8?B?VXp4TTEyV3lSbGpvb0tIczdNdFBmWU1CemxXUWw1TVV1NTFlSUxnUWtvYmVy?=
 =?utf-8?B?TmNHRHFhSU03YU1yNzZxczVRcFJ5dWFlaExPazhkMXBKbU1OM050aDlLbnJO?=
 =?utf-8?B?WHNEdCtCOUdqcmkyUUExMmV4NmxROWF2UmZ4WDFZN2VSYkhKRjBCOExIUytJ?=
 =?utf-8?B?Yk0zQzhCZXZIN21PZzdOaGRSVTBZR3Vpd3ExQ1c2c1p5cTRJV3FRc2dmSW1q?=
 =?utf-8?B?aUhxcnRUNjhuREZhUTZ3VGtJdGV4VXdRTU92clRaSWZKQkErOEowU1ZNRXdz?=
 =?utf-8?B?MzFiTDVJR3N5TERuRHRVcUJ2SFN6U2JRZ256L2Nnb00xcGJRcWFYZ1lHaFhB?=
 =?utf-8?B?VTVpT0RYK3Z2anVUM0t4dmlrdzNObHRhcmUzNWxTNXVob1ZJLzJKSDljbzI4?=
 =?utf-8?B?eldyWkdWRjJyVnV4OGhVNHdqbEFQRTlvb2xqWlBYT2tLY3A0N05rK2VDQ0t3?=
 =?utf-8?B?QmJPc1p2aHJicStIV2ExdXlNZVVPTml1R2RMS0J1REY2eWtaOE1mZ0JIcnFX?=
 =?utf-8?B?T05ZdmdZbDd2c1JmSnFSMjYrUE43Rk1teVB3K2J5aVVxWWIrZVRyQUtrRzd5?=
 =?utf-8?B?TVU5RFB1ODk4VjB6QldTelVNenNMcnBBbVpMc2VnYXhXNWZKNnBFNkMybzI0?=
 =?utf-8?B?RThndU5DWVdTbzFjSVFzNFZlTHU2bzlCNUl5dmhLOEQ4WmQyOVBnYkpaRndi?=
 =?utf-8?B?b2JHVDZJZU85M3lVR1hKdXVTVThJMG1JWnIrNWhDeGNKR3l6NWJJbFM5a3Y0?=
 =?utf-8?B?S3h2VEFLRi9vclQxS0xYWnBGYjBQR1puUC9xQytabUdhZVRaajBhaThjM1k2?=
 =?utf-8?Q?444JORB0/BWfrfTbxMGg4Umdktl6yPtLmaka2Dj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b61af509-0e2b-4d2a-6af7-08d8d7dc06d5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 09:18:48.8717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFcrQXKcCg1+9sXUHtYumfwUO6x2+SPuG5JMXSkyKVaIdQ5+VW5v4o8lLNjTX+YB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4659
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 ray.huang@amd.com, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.02.21 um 09:54 schrieb Jiapeng Chong:
> Fix the following sparse warning:
>
> drivers/gpu/drm/ttm/ttm_bo.c:53:10: warning: symbol
> 'ttm_bo_glob_use_count' was not declared. Should it be static?

IIRC we already have a patch for this on the mailing list and the mutex 
can be static as well.

Christian.

>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index b65f4b1..107dd13 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -50,7 +50,7 @@
>    * ttm_global_mutex - protecting the global BO state
>    */
>   DEFINE_MUTEX(ttm_global_mutex);
> -unsigned ttm_bo_glob_use_count;
> +static unsigned ttm_bo_glob_use_count;
>   struct ttm_bo_global ttm_bo_glob;
>   EXPORT_SYMBOL(ttm_bo_glob);
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
