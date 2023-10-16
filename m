Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A5A7CA636
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 13:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3010D10E1B9;
	Mon, 16 Oct 2023 11:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649E210E1B9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 11:03:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3vru3qIDJtpqJgOa0ONSUhdGqupUnXnZjlwY3UkTiZ6QAcyw2bogSD5APNgb4Y+Vo8uPt5nYBE1Hf3K0s0l98yw+1UQmYbRhYCB8xLuPxRC26PX1Rk2/kTEmpTz1bSK58vsuqh7uMzgV3sOZhl9lxHpA2MwhWPDxxshHLbJIoUC053Np1v4MxG3MCkdqnffn6Jet8/70xZJL3ZPsb2twS+ySAI6aPJdWyXJbFxx2JXWL4vVu5d3OAFo/7ViHJ1jKFv2m7FT99v2O5EzzS84tFoxCoqviFWYTfFiymb7IjSm2HCCb4j5j3ynOkG8CZ8W/Jt9/UdnZHOO5bwX0dYiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeCutIknIadR0Q5U2i1fCXVJshzXLfz8hxXOwxoY84o=;
 b=dv4pI3I7/KUKMQtxMI9GZO/I55Rd/QrerIYQa6v8slyGG1Xiim/StvCDQtvzu8Q5OhAoSR93W7EC9W1XHdyfeI5KQfg27tjyUBrv4+HshZHav7p2IWasVnhYCzc6d8QrLy/MuEMV0SXWNokDkv7sS671iJoFP/9qmV2OhQKTqQH6mouWzrom4GPR1qPRu0BeHBxL2DI6iPcxi9vZglziIrKbHFzE9EdSYVx6zZJ/ShTHc0q9zy6vG0JGzUYlSnjio0SgG5xDTI7v+SAQRsbZEg3NkLESrZ3BjWP+A/ZHnn+UwRjatNwUih8AKznXf0uJEq9BzPCOWtWPzuRyxH+okw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeCutIknIadR0Q5U2i1fCXVJshzXLfz8hxXOwxoY84o=;
 b=ybuBE/UcwcMvZldlhZAbfC5QGVB7PlyrR1mmrr1FfNAYM4UXokNBOZd8x+xUn40Ors8FDgXT9EjbnLP+GsJBjHe3UeGjiHpDA8iFRbIIAL+yIL33O0q3n+3eVoJydzr9viKQLdzJ2IJ8Zqw3uJvJniIog4l2InDD4pMVmIb2rzg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8247.namprd12.prod.outlook.com (2603:10b6:8:f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 11:03:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 11:03:26 +0000
Message-ID: <1a210998-ec32-4012-a3de-f4f250e4b118@amd.com>
Date: Mon, 16 Oct 2023 13:03:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Drain workqueue before sys manager release
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20231013143423.1503088-1-karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231013143423.1503088-1-karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ec19c9-bbde-4656-f154-08dbce378556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r9axUgkWT25ta8p7KgJ0UuBbV7Onz9KKiOht/sw9DjnzSgprv+bJLQvEDWzDeShcgJVnaeDmnkHg9RjGSXYY+rpw9YHp8os+tXhViOLRzdYVZVYlEyw8YdSSbdRbS87SoEAo3G+1WLGLZQsWnBFB3bUv07q54HRPfpmPLtr4yY2s5TWxlJsAaQNs+fJf41F4Mf0UdIedq8V/+pfPjfusMqrap2LE4TuYrIOCL3/Nt87Fbv+/FMkTtX1vg8OSsf2X1bAotCU/UwnHD7ndrNKwixGuXWNJoFiGIqY5nR/H1nrpjNmfNr03DRljqwoPcdyM/wWjpXUDorsU1Uhsi+cyoJnVVzcBaNmdmtvulgOb+6Nu5g5SVmguiK6HKgWTa7JgHC1OfwReOOELyFdN/yVZ4fZDE6KkHV0uoQC6q/mC/bhgkUmJgtSNCvKHUVjH7d2WaDFRzK/nMoIrzKl71bg2SlY0FwSmybJ5T/ymmB2rRj7eWBEToK+cWn4jf3gdppX/4W07NvoDOF+b85hEI45CtJFZ8EX4eYtrlG1Tt/Yw4OpLIvwoKSfQ5ZCm6516VT2pUIjkIDP5thd77FuyXNEs5U5ClCAPIrfqMPNB5tKploLVJgqcKbvySKzgNcqglP83syOsLtflHa391I1cviBOU0WppBswh6BxDkz9qqWdE6c9nVJP+M8LYMH/vnoT55s3oN2BeN4w0V46gS2PlRSDYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(346002)(366004)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6506007)(26005)(2616005)(38100700002)(31686004)(316002)(66946007)(66476007)(66556008)(6486002)(6512007)(83380400001)(6666004)(478600001)(8936002)(8676002)(5660300002)(2906002)(31696002)(41300700001)(36756003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3ZKdkdYWTJDMTZnWWdER2tneDFhVDU4cFFTeHlPNWp2MTlaTmVMcVBiSlM2?=
 =?utf-8?B?QlZFV0VtN2lNb2RLNXF6VE1GQXliSzhSWWVSRHdWNVFKODNMdlp2NXVXd1Jv?=
 =?utf-8?B?aUUrMkpGc054UjJPeWVMcDNPRXNlMElIUk51K3ZwWXN6SXdvRXNnSUlGY1VW?=
 =?utf-8?B?dVg3RS9Ibk1qcUlaQ1VlTWQ2S3BGYmNTRjdnZWN5YjkxY0hldnhUaWhzRS9D?=
 =?utf-8?B?S09WWmdIR014alBTNUN5WStIWlB3Q0FTaHRtRWMvcEcvRDFha1lheGxNZlZU?=
 =?utf-8?B?S2dOSjNwVGJwT0tGNzN0UDduRkdVTjdkVjRJNHlxc0kwZXlzdUNyZkJNdE5u?=
 =?utf-8?B?TFZMcVpJTXZORThRMnF6V1diRnFBVHY3OG5sQ0l5RWl4UWRSc3lBYWZyYy9m?=
 =?utf-8?B?Z0JSS2srTEllMTk1b1dvRktKMTFzWlNmSWhiSCtvRk96YUNqakhTOUhieVUy?=
 =?utf-8?B?SVgzRkMvenE1aTZxQmQ4eXNYSGY0U3g2MEJacHlodlMzTDJxWlp3eW1pbE4v?=
 =?utf-8?B?d21rWktVMlJCT2d1ZHEwaWk0VDcwU04rU0o1U0tvSGkxQThkSG01bTVrR29K?=
 =?utf-8?B?bjdXZFk0TGtGTjBaUHBDOHVZbE12MVdJSjRqVHdmVytaYzEyZVk4WkIxa3RV?=
 =?utf-8?B?MCtRWlM1YWVkRkp4LzJIQVJ0aVBEdGhlRHhneUZXT0QybkcwTkZqa2VVMUp3?=
 =?utf-8?B?REdhOG4wOVRnb09kZVVEK0Zhak5EZjMyM0IxSDVxakFFeW4yV05ub1BEekYv?=
 =?utf-8?B?SjZVZkNzaWNUUktHZHQ5Slo0dlNCWHRiRkhJOGN0aEJGcklDYXZtc2dWUTNZ?=
 =?utf-8?B?YlJqUzVhZzhWRHdWbmR6c3FpY3pHQVFXVGFWTW9mSUhEa29reERRZFQxSmNI?=
 =?utf-8?B?VlNQN3M5bnNRc0N4TWptdkFDV1BMRS82Q1Y0SWMvTGUzSG9QQVI4OWg1ZEc4?=
 =?utf-8?B?MTdqdTNVaEdzTHErbk5vbFRodDNsRnNTVzFsakxoQzNLQWE1TFdjcWcwZEpi?=
 =?utf-8?B?czdTQis4aFF4cFFMdVI4R0ZWajBmTjZWK2c3dEJuMjRwT2IvQkY5ZEhxZ2V0?=
 =?utf-8?B?V296aTVmMFUvc2JPeHUzTmJVekVua1JQaVoxalhhWG13NW40WXVGYnlPNUxI?=
 =?utf-8?B?QVRLbGZ0cTN1VUtqTkpHVG5YbUxXVTBqZWxZYTduZEMvMjUwOWphMkkyTnB0?=
 =?utf-8?B?VFl1eThsb1RtTkdObUFZR1FveVp1V1VnYzd1YlVDeXBFeUI4d3N4YktsTjI3?=
 =?utf-8?B?OERpV3huSVJYVFdGSVJMdmoxQlFaUlZNT29TZk83a2tCZE4wcUU1MS9IVTNT?=
 =?utf-8?B?azBFSUxTS2ZxK2lxZzZEc0xOVmlLaXRzTk9yUS9QN0ZtOWpkekNyekI2Zk9P?=
 =?utf-8?B?MEliZnplRFBKNmtwRCtBSkZmTWRkR1llT0p4YklaMHFzdjN0M21SUWswQWdJ?=
 =?utf-8?B?N3Vkd1BYWW9PVk5LZmN0YTJRdTc3bjl5RGJCSFFsU3BZRmZTZDM3ZmdldG9R?=
 =?utf-8?B?dkV5M2tQZExhNkNjSGh5S0hEMEZnTHg0d3I3LzJEYW5PRnpBWUN4V2VJYUdz?=
 =?utf-8?B?dU8rTXBpK2lINzNJMytqNE9DR1RIVEg1VFBkZHMrdVg4bVRpWGZVUDgwRmJl?=
 =?utf-8?B?S0hHdTIrYTZFb0cxWDFzNDVxenBHVHhRTDQ2di9KTUFRRmplWk1WbllvR0hh?=
 =?utf-8?B?bXJ1aGJDZjgrdU91SGhGcHBSNkc5dERzK01SNGR5ZTlqL1lMOTJlRlp0dUh1?=
 =?utf-8?B?NS8zODR3cTVpbnJqT1djSFRDcTVSemdmRFJKVHZkU0JGeEdwVElKZnRwTDVy?=
 =?utf-8?B?UWg2Si9QN3JuL0czNTd1Z0pPZUxlRTBBQVdBWCtRVFNqRlNNUVR6QTJKSUxy?=
 =?utf-8?B?bnl3Rk5GQkJFTXBFNmw0R2IzS045ZVVOV3JZT0NHWnJ3ZTN2YkUwNk1ENVFp?=
 =?utf-8?B?UmhLQXVuMnhtZ3VBUHl0WmFsbk9hWGR4QnBSa3JpYUIrcnRGTDVpR0tlRGNq?=
 =?utf-8?B?ZkU3WS9TZXo3UVhjdTRTOSt6d0tOUy8wek9zWFpMUlVvTjIrQlJwcHNaVXNu?=
 =?utf-8?B?WjBsVy9TZjV4ODY2aE9HZWpjNVB3L1JCanc1aERMeS82RGdoUktra0hwOE51?=
 =?utf-8?Q?zMLs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ec19c9-bbde-4656-f154-08dbce378556
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 11:03:25.9555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Gi/CxHvlTSLXdozr0e00E474i4S4z3LvbrL/cNMPiXbG3+QT3mx4Po8qlRXPAF+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8247
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

Am 13.10.23 um 16:34 schrieb Karolina Stolarek:
> In rare cases, a delayed destruction of a BO with a system resource
> could stay in the workqueue until drain_workqueue() is called
> in ttm_device_fini(). An attempt to free a resource from an already
> released manager results in NULL pointer dereference. Move the step
> of draining and destroying the workqueue so it happens before
> the ttm_sys_manager cleanup.

Good catch! But it's not only the drainage of the workqueue which is at 
the wrong place here.

Removing the device from the device list should come before destroying 
the system domain as well.

So I think you should probably rather move the chunk:

         man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
         ttm_resource_manager_set_used(man, false);
         ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);

after the destroy_workqueue() instead of the other way around.

Apart from that looks good to me.

Thanks,
Christian.

>
> Fixes: 9bff18d13473 ("drm/ttm: use per BO cleanup workers")
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
> Some background: I stumbled upon this issue when testing
> ttm_bo_pipeline_gutting() with BO with an active dma_resv fence. In ~2% of
> the runs, the delayed destruction of the ghost wouldn't happen until the
> drain_queue() step. man->func->free(man, *res) got called via
> ttm_bo_cleanup_memtype_use(), the manager and its functions were nowhere to
> be seen, resulting in a nulptr deref.
>
>   drivers/gpu/drm/ttm/ttm_device.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 7726a72befc5..753126581620 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -232,6 +232,9 @@ void ttm_device_fini(struct ttm_device *bdev)
>   	struct ttm_resource_manager *man;
>   	unsigned i;
>   
> +	drain_workqueue(bdev->wq);
> +	destroy_workqueue(bdev->wq);
> +
>   	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
>   	ttm_resource_manager_set_used(man, false);
>   	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
> @@ -240,9 +243,6 @@ void ttm_device_fini(struct ttm_device *bdev)
>   	list_del(&bdev->device_list);
>   	mutex_unlock(&ttm_global_mutex);
>   
> -	drain_workqueue(bdev->wq);
> -	destroy_workqueue(bdev->wq);
> -
>   	spin_lock(&bdev->lru_lock);
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>   		if (list_empty(&man->lru[0]))

