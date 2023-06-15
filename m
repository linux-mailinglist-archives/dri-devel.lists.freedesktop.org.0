Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC3E731012
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 09:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993A910E42D;
	Thu, 15 Jun 2023 07:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA37910E42D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 07:05:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X79vdGDe74d0ViP88O9UR+o+1Jx5lVQgXoQRSZGLED+sOYi9+jLRnPLCuTT//Eps/qrhqVZbxMhKcPmechUmHu3ueqluHKer3K6woxYAALpKQIQhh0BEU44z8PUNCe94Cme25SB7cskyjdX1cSwVw3z501FSRi/VwNFVg7Jm0F+kGLjHQmX4nou1ZTJX4nE1FST6BRnzzV3zIqGv0/ykGLosUpIbussvUBrknp49w8QPQp4zEbmEq4gX6elLF0XeV8z91e/0B+2xfKuiVZc2IgYBAE5FOqkbHv+ihrEU/TfgTs19RWTuPeMvJeZArwAluZcF9nXjVFKnIMOK6hM1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLtCioAkKiKuhN7cN/J8BLXrgHuRRVRJm2G7HLIy0vc=;
 b=jKTEA7vkZEWmr4pRZimEXmpTaNLITWweECj4MBm5I5wrVJrHcZIhQL1S8lKtHWfP5QBxQlmaP5p4A9fYC84bx8eyaI5bP5tT0xkXz1NpUoMxvHq2503ugeTYjp9FMH47MyHsSUaRQD2GmCUD1YiYYgeb7H3M863WX8vEFfPVJa414nLzScajGlwEIoa7MoBsMAwHqGqXVRlXJxYSu+T1+9lEkGL3oQjugssv/KSXOPOcVCph4VEMtlqZG49dQmN/42zhfg7f4M6WL0l11+qJjN0ihrHhybni6vq04dlJwSxHjlDSfMgmxSGbHgy06Z6E3Kb3+xaXO7OmaxvdJnj3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLtCioAkKiKuhN7cN/J8BLXrgHuRRVRJm2G7HLIy0vc=;
 b=u8f6/48+wg9YzrkgmVEUcaPlHeVmj5eB6NdZq/7CinygnP+DldljUxArm+9z5q6Da9vvkPjRQdPp/H2oZRHmyNi+5nyfvuXLRGm1J0oYTnMVUwld7BADYCBYxVc6Ci4iMnV05B23JeQv6ZknIMFQQk+6JOJONhU2xYo8wvObtFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by IA0PR12MB8255.namprd12.prod.outlook.com (2603:10b6:208:404::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 07:05:20 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff%4]) with mapi id 15.20.6455.024; Thu, 15 Jun 2023
 07:05:20 +0000
Message-ID: <87ce15c9-670e-f270-94b7-580b0a54f59f@amd.com>
Date: Thu, 15 Jun 2023 09:05:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] accel/qaic: Call DRM helper function to destroy prime GEM
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com,
 quic_pkanojiy@quicinc.com, sukrut.bellary@linux.com, sumit.semwal@linaro.org
References: <20230614161528.11710-1-quic_jhugo@quicinc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230614161528.11710-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::19) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|IA0PR12MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 41f0e3b4-6e74-489e-724f-08db6d6ee15e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jYTm++mVn2DC6g1B3ydcXG1yo28MrjsAMcF5jLvUI1HddQ7FE2C1zcVqqmNOiCWqoSkY8oX+21S0bLTja7xgiWCBQR2pApRi7vm8GdjG0XeeCkr9ksYbkbcVTGWhUxNF8SjVBtlAmJknfG/rCXF5lLIyYnO+pTFfbca8E+BZQ9XUS1DaINDBNyAy7wFYDwg4wKM14hBvtTgRJeDef6zI9JYoJ2txDYJc+aUH1stBq83grzgLvOKodzskjHy1FHxvuGvKBBQGF6BFuM/VY8ycdT1glL7PFl6hITVLksgyRsd+67ZH8YPLzIJTlfQKdq/CvxI/PHyiD5U1xVjJ2V1COBhzCKv/GKT7KKkVMFqJTt3X9S5Ab81TRbnV+7tLfhZ90ISf0Ut3KunNvseC5fIaQRIz+T8q0gFXtZQsTHSI3Xg8EHs1vz+lEmTahEvMx3F0v1DyKSeUhgeY5yzPHJqrKhvQwrjF3w76yfsGAKWdk4R214GWJWfYxUd/hamYH+YS7hBxE6Dal5VArg5XcHAG4wRPgNyJW2c2TM9tukUCzlS+eE6HPfBjDY0tNZfzCt+d+pIlbd6R0oFPnX48XU3HhPK88cneq1gyAs9/GrQzyuNgTvbi1qUTUeib3ubJiBtq3kPai4LYB+w389t3PvBWPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(31686004)(66946007)(4326008)(66556008)(36756003)(66476007)(186003)(478600001)(66574015)(2906002)(2616005)(966005)(8676002)(41300700001)(316002)(31696002)(86362001)(6486002)(7416002)(6666004)(6506007)(8936002)(5660300002)(83380400001)(38100700002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWV1bklYSFZ1M3pxbjJBRElLbkNpNUpCazZTVDNTb2I1TmRqQTVlZEpOWHRE?=
 =?utf-8?B?bXU4K3NobVc4QXcweS81R0JMZFdNLzArL2JROU5IYzhVRUFwY2Z1SDBtdmxG?=
 =?utf-8?B?N0luZ1V4OGE2Y3g3R25PTjFvNGxFUkcxSm5IWDhpSG1QVEdTUXpPMFYvZExB?=
 =?utf-8?B?Ump1QVBjZzZQa0FXZi9icmFIWVg0MWh0MVdpZUFsK3c5YWd0NzF5MENuUGVy?=
 =?utf-8?B?SUF6Qit3dDIxOE1hd1RNTkdvNExMSFBrQitTZzlPZkNTdndKN3BtUjk4cFdO?=
 =?utf-8?B?QlE0YjZjbVlpeVl4U1BTdlc5MXN5YmE3OGF6ZnQvSGEybVptWWxiVTV6djMx?=
 =?utf-8?B?bFNTMlRrM3Jtbkk3ZzlsQStZM3JNaVdwc2tjZ0N1YXJMVzZBakVTNkF3MEcr?=
 =?utf-8?B?V0xyK00zeldZTzVNOFA4bHRHWDJQUkljc0t5OW1FdkdyTngrS1RybWYwNUZh?=
 =?utf-8?B?Qmt6RlZodmtWc3BJVE9NY3h2YmRtNmhucHQzZ1pNZ1NJN3EzcVg0eGM3OW9L?=
 =?utf-8?B?bUhud3JuSGtGL1l1aU5KeG9EbWNJTFRYcmN5SDNLSVpCN0hxdWQyTDRHRnhl?=
 =?utf-8?B?elBoODVVQUIvR1p1UEQ2REwzZjAxdi8vMGVNSE1lMlE4bk5rNnVQOHRMTW1E?=
 =?utf-8?B?ZXFnS3ZUWVlKWUZwbUZzV3lmZUNjaHNBRlRRRlR0N2dGUE9nT3VKVG9rcWt3?=
 =?utf-8?B?UUtVcExXbWtuZkYreENkUkUzbGg5OUl0M0pMeDBEUGtmbWp5enlERzh6VkN6?=
 =?utf-8?B?bWlQanBCd1hUQ0o1VUY2U0sxZW1NdXlMWStjY0dUblkrWHJGTTBCdVhxMFpH?=
 =?utf-8?B?eTY5NHNhenFvVkdpY3FQT3NOV3JtZEd0QnJVMFNlK1RlWWxkb2RhYXlVUGhX?=
 =?utf-8?B?UnFHZlkrMmNFNys2TVVrZHd4U2lWSVNndVU1YXlLSCtqajdSUGRKN29TZFY5?=
 =?utf-8?B?d3IvejN6c24ydXB5dXh6K2xRUlFBb3VQQVJkNUVaUXpQM0dlVVJZWTZKL2Zt?=
 =?utf-8?B?L09KZm1PUUR2MVFtRUZFRHF3UTlPOUltZWFDUThVejVLOUg5T09SRlMyQkNh?=
 =?utf-8?B?Y1p0bndUdE1yV3hPeVVPUFV2TkZ0a0JOcDZDb2lZM0ZEWE5qaCticVVLODRG?=
 =?utf-8?B?UkxvMXN6Uk1mLzdITEhWZzdydEIyMG4xTlV1TDE0clVDTGRpOWpRWW9tUHF1?=
 =?utf-8?B?QXBDMHZybC9pbnNUVXozaklQZE91cDlSdkcwb1lUN2E1UnNNTHA5Z1lFNDFR?=
 =?utf-8?B?MEtMaTh3YkQvenE1bXorbkZlUjVCaFplYUlzTXFhVVN5VXlHQ2F4cmdzcXg4?=
 =?utf-8?B?SjhGZ2EwOGlRL1NjVjZLejd5TU5BdzVzSWMvdHJMY0UrVjYxZUJqTk1tWjR5?=
 =?utf-8?B?bElRQVVkV3pSQnkxdG80MUkzUnNibXBuZzBWQUYvMVZJMWxKUGNwQ2dwNkJp?=
 =?utf-8?B?MXllVUhhajV3eW1vdVdPakpsOG91aFBJeTZIN2xBVUxBOHNLcWZFNDBKdUpn?=
 =?utf-8?B?cnROUTRmVXBadlhtUm0rNXNtSDhpRWJSVjE5WkFleDRkU05RYUJyZXFhMzFs?=
 =?utf-8?B?YnZ1eldTTHdZVWRUcDRHRUdvajc3T2hKREN4ODBHck5Wam5pWEhWNXlESmJ3?=
 =?utf-8?B?ZmIwTXYwTlZvNkdKaFBSKzNPMXpNZU9uVXBUZWt3K1pzUENhb3dkSFU5SzZR?=
 =?utf-8?B?MUFWWXQrbmZOeUt0ZmNESUUyVjRGYlhkRHloMkJ5emIzUnp0Vy9OeFlHQnp4?=
 =?utf-8?B?N1gxZ2x0MjZzTmVab3B1MGlDOXNOeXl5TndzWjBLcHdOanFzeTMvUWhEM0M2?=
 =?utf-8?B?a1BPMWNRTmpvOERacXJGamJxUWJTME5TdGNYclpKRnVvM0JCejhYYTVPVXNk?=
 =?utf-8?B?QlpsOWg5SkF3a25xZHlHbHN2N0t2RnVISU1ZNUs0UDFyQVdRVEZRVHdWNmty?=
 =?utf-8?B?U0JrekdyajJCaFA5blFOeTBoZkI4NzcrUllraWxYMXFyNllMU1RuYnRZWlJn?=
 =?utf-8?B?Q3FReEROUm5UV3JBWFo1VWtsdVkzSS9lU3VFeG9VM01ZYVA4MHl1UnBodlVI?=
 =?utf-8?B?aU5PaVk3ZVQycTYxTFRFVFNDazBYVXR3bnF4TWdwbHc3dzBXT09pMGRRaytD?=
 =?utf-8?B?ZVdqUW9OT21PdEo3YkI0a3Y1MHoxcmJVWG1NVEVFUDFvK29RUFcwNHYxaHhB?=
 =?utf-8?Q?HdLU/iQCVuKaW76DfW/wPb0/HDIRzPloUZkfJUDGc1ml?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f0e3b4-6e74-489e-724f-08db6d6ee15e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 07:05:20.0801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGQUJFbzoSJHvnXC7Y71WpmleeYvEHFWrLgNYgyZfCGwmCuZkesbxtTO5yiaKivk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8255
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
Cc: linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 14.06.23 um 18:15 schrieb Jeffrey Hugo:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>
> smatch warning:
> 	drivers/accel/qaic/qaic_data.c:620 qaic_free_object() error:
> 		dereferencing freed memory 'obj->import_attach'
>
> obj->import_attach is detached and freed using dma_buf_detach().
> But used after free to decrease the dmabuf ref count using
> dma_buf_put().
>
> drm_prime_gem_destroy() handles this issue and performs the proper clean
> up instead of open coding it in the driver.
>
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Reported-by: Sukrut Bellary <sukrut.bellary@linux.com>
> Closes: https://lore.kernel.org/all/20230610021200.377452-1-sukrut.bellary@linux.com/
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/accel/qaic/qaic_data.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index e42c1f9ffff8..e9a1cb779b30 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -23,6 +23,7 @@
>   #include <linux/wait.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_gem.h>
> +#include <drm/drm_prime.h>
>   #include <drm/drm_print.h>
>   #include <uapi/drm/qaic_accel.h>
>   
> @@ -616,8 +617,7 @@ static void qaic_free_object(struct drm_gem_object *obj)
>   
>   	if (obj->import_attach) {
>   		/* DMABUF/PRIME Path */
> -		dma_buf_detach(obj->import_attach->dmabuf, obj->import_attach);
> -		dma_buf_put(obj->import_attach->dmabuf);
> +		drm_prime_gem_destroy(obj, NULL);
>   	} else {
>   		/* Private buffer allocation path */
>   		qaic_free_sgt(bo->sgt);

