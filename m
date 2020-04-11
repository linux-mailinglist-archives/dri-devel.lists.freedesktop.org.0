Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80311A4E05
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 06:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2466E297;
	Sat, 11 Apr 2020 04:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75B06E284;
 Sat, 11 Apr 2020 04:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvFtihCoKkQ7DqNdhw3GYvh+6EeWvXPiLoKkKgkX9g4amiedIXIXgsueoSrEm+N2ZskBNEU4y0ogX11O/0tDCLRxynwiwzYlLau67VYjkE7KhFViwHnKc0IH31oQJJYtjVqkS0PiAFPSGU48BIKtSzBxLIvAsFlxKIfQcsr4HW67qHa7ihbKaayi8ZfIKulCOVz6JgMV1YMx2xTQsqbIFiJhSkztgekzmnvNN3Z7vPA51Y/laDTaDi+S32/+vYr031r3AlvvvHvx+f7Iu8e79lB4R9mGKtPEPydgoP3e7nTQF/m9cgWAfW1MhCXM+cbKQKlYaXnD/lb+GnKgNf+AVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhnSLFnJsTyW1RhLGvzNwK4CD0i4RwIpz499vAy7v/Y=;
 b=moi7He9F770rjeo6RB5muFAELQJNUM2vywiwufd1wlYRMtsr9Azi1vLtwlrH4C47av+57xpk/6UIjdjVsyYEHAuRHhrOI2gGT2OvGKi3rUEnqBc9xcsHVjtrLOgN3bQ7yijkI93a06hWMCqC+ctM7+D3D5sLc5QpDhyBsdNGGKkMJ9RWzlgf0sYhaim/9tFaCppZkOON3J9P5AO8oSawQmAJU+B5CHMUuvHo5ds25uJLfTy3GUy3WTtfYesGSkPOyofLN2ZJgYbVoB8lmm4XH5hxa/YUjAXpVGhfDTyM31pWrfQHv3MLUG7FNUDACzZELk/qen+yigIK2dmHA8w/4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhnSLFnJsTyW1RhLGvzNwK4CD0i4RwIpz499vAy7v/Y=;
 b=I3/Vl7Cr0QOiTVBaz9kvL1xmSiGwNSPwXz+NF0ljXHOPiAX1kLxftd19mrHW6epGFTHqGhZhhAVMQgVRc+O+72bfPz0WkAzFDF8Sq/7Rohm6SSNftLII5vpLZj6qfLHI8Vs+4e2JO3ws/zKwpf1ZizjqjusO7zFe9sjhEEykOxQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.24; Sat, 11 Apr 2020 04:42:56 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::dd1:b466:cd80:38cf]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::dd1:b466:cd80:38cf%7]) with mapi id 15.20.2878.022; Sat, 11 Apr 2020
 04:42:56 +0000
Subject: Re: [PATCH] drm/amdgpu: ensure device_list is initialised before
 calling list_add_tail
To: Colin King <colin.king@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, John Clements <john.clements@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20200410225757.97473-1-colin.king@canonical.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <9d80a5a0-ee0d-1903-2631-6fa573e4453a@amd.com>
Date: Sat, 11 Apr 2020 00:42:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200410225757.97473-1-colin.king@canonical.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::26) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.10] (99.228.232.87) by
 YTBPR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Sat, 11 Apr 2020 04:42:55 +0000
X-Originating-IP: [99.228.232.87]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a28033ee-0cbe-4e5e-d5b9-08d7ddd2cdc4
X-MS-TrafficTypeDiagnostic: DM6PR12MB4169:|DM6PR12MB4169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB41692713B3628B9B77A1C9B6EADF0@DM6PR12MB4169.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-Forefront-PRVS: 03706074BC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(53546011)(31696002)(966005)(52116002)(316002)(16576012)(2906002)(110136005)(16526019)(36756003)(186003)(956004)(86362001)(2616005)(478600001)(6486002)(31686004)(66946007)(26005)(66476007)(81156014)(8936002)(5660300002)(8676002)(4326008)(66556008);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sx1LSEviOyWzNCXi50OXoVY0/pP4UvIKuqCNbyBQJ/jF6MRjSzJi21wJdCwqqJq3KCG6fmiFckD7z+aAPLIS8n4PTElowd1cMKFV2ckJ8O3iqVgJOlL9TgeXWLxDbrvkWIVhyneHe56j7ilLQoaWbhkZjkUF+3f+pT+nlJcnvWLjuciPASOfiN8OH40QKssCTmG+Mi5dEgtR28CeoRt43ysa4rbfmP5/e40QvOol05bST9dMuF7CXSAGpu++vdams8AGTOs3pllx+7jClAPFvlvAeoC+i7UXBdQmawf425L4kClAsUIvdlgl2PG/JB6ZBcevrjimp2sSA9a/sD3JJt+qE6wdoDfg9aLMq40QwmaVeYB/QVa7Xo7CU4dvXpozFfCeMVZPTdsHVgaJYET/73G6ZhsOGvvLQIG0r9RNWk69WJt47LhRlPp4X2xfU1TG0aoYC1GAPva7VMYitFfHdE3GEfDnPPRlDxl59hqGgbwLyzoj3J+XGjYlObh5ohJTRFuzs73Urryzxlewxuj+xQ==
X-MS-Exchange-AntiSpam-MessageData: iaeaNe18xqzaWAAKjgv3d4ZZpC2JRq1sRgfLLQIhjqo9lbH3Nh+M5cktNIf1kd2wz0P0IwcW9/vgbeafwD9N8h/0zbYC3GugnSjaS0oLoLZcDmFOihEPdo0IKth7cp6MKPOFRxyWdZbTZg7+AL34RA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a28033ee-0cbe-4e5e-d5b9-08d7ddd2cdc4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2020 04:42:56.6491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkXIcH+oAp8lfdQtlaK3BgaOENaOoL+C1TXZG8kc6MIiyDA815La9DPtrKhGHKAeAMF2E7++deaEt8zfdqg6BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/10/20 6:57 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the call to list_add_tail will access an the uninitalised
> device_list.prev. Fix this by ensuring device_list is initialized before
> adding items to it.
>
> Addresses-Coverity: ("Uninitialized pointer read")


That weird, I see that his is already initialized unconditionally here - 
https://elixir.bootlin.com/linux/v5.6.3/source/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c#L4022

Andrey


> Fixes: b3dbd6d3ec49 ("drm/amdgpu: resolve mGPU RAS query instability")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index b0aa4e1ed4df..caa4969bd46f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -1447,6 +1447,7 @@ static void amdgpu_ras_do_recovery(struct work_struct *work)
>   	if  (hive && adev->gmc.xgmi.num_physical_nodes > 1) {
>   		device_list_handle = &hive->device_list;
>   	} else {
> +		INIT_LIST_HEAD(&device_list);
>   		list_add_tail(&adev->gmc.xgmi.head, &device_list);
>   		device_list_handle = &device_list;
>   	}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
