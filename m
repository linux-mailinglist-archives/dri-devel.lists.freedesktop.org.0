Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 058A71B2109
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 10:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5AE89D9B;
	Tue, 21 Apr 2020 08:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E12F89D9B;
 Tue, 21 Apr 2020 08:06:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G503qkxpD2uTASDkSse71fzp72Y1jy3AVEg4BL5rzHCOj5MYrt+qLnG+ZLjw1oFiD3vXv+KcRRsHs38tgJ1Eyq2n45dFdveFy8kT4ceq0/LPKoaPlNIWg0Lozc4Vc0oviR1BvjcA+v5int180s3L5pfgCxuWcmijl4tRc/h3XQ+sCp8xyZ2nxqq4Zyg40dDLu/4QUFH0eFczkU3AZAfrpdostErK1RlxP7WA6+TMUzeLey07lt17u8mgM0bFohepIEn6oAc2xY3Tvqwi5z4xuAcwGUvGVhxvuAHm/Q8XYbJgS5Sv2iGe9xHcvlaNfYZFzQCplh74UecKzqAux6wO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmGyXfqp3pO5hlG9k/kcutzACFbGyOSdX/InZKoaXao=;
 b=OEyl2ocCt7w13AZNK8RGTZuZGdrYzGPsJnkRm6v28kkO4WvJcSqVnuJKvGzWwESkvs00OlZpKQF7abahKYDiGa+5niiJh/WCKbViJ0xYwd74FTgpwfVJOwvlUCs6cb2wb10VTgZ9/a7sFUHjlX0auOER6mejgCcuCIw2FUVYG35Fuigkd62qv/n4coJ4303cOxl3ghKY3jKXaRsgbw28yJQcHbuGbzV4HbKOGak59POF3drL0c4Y2wWiOapdgFTUogc215/ZMRJQ9GztYvHUmeiPWFKPgrac3kveLCm7MIMZwIqSs1qF37RhtqCGLLIqDfw5/vG4oENW0iBVHKOCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmGyXfqp3pO5hlG9k/kcutzACFbGyOSdX/InZKoaXao=;
 b=qT3F3Ti3bHJ8Y0DEs/HPhLHU5A2A9CQoEXMEn3KCokToUCsHLKeqLeRhax1+UmTfrpOFNr/8AVbA3DlrByyq3ET7Napiz77XL/g+7C3HWtOhecxR6Sqw7BBde9LeFEc9ESIokNlJ9oj59pr+a3Jr2NQv1vMbMa9J1vaQn8gegNI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (20.180.254.79) by
 DM6PR12MB3867.namprd12.prod.outlook.com (10.255.175.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.27; Tue, 21 Apr 2020 08:06:12 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 08:06:12 +0000
Subject: Re: [PATCH V3] amdgpu: remove unnecessary condition check
To: 1587180037-113840-1-git-send-email-bernard@vivo.com,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200421080324.130104-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4c027bd0-c2ff-b587-6389-62a3d25dec1b@amd.com>
Date: Tue, 21 Apr 2020 10:06:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200421080324.130104-1-bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0125.eurprd05.prod.outlook.com
 (2603:10a6:207:2::27) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0125.eurprd05.prod.outlook.com (2603:10a6:207:2::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.30 via Frontend Transport; Tue, 21 Apr 2020 08:06:08 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 08f116e8-4f73-48f6-909c-08d7e5cadb6b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3867:|DM6PR12MB3867:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3867B4095E590570B71C9A4783D50@DM6PR12MB3867.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(316002)(66476007)(66556008)(110136005)(2616005)(66946007)(8676002)(186003)(52116002)(31686004)(478600001)(45080400002)(16526019)(81156014)(36756003)(8936002)(6666004)(6486002)(2906002)(86362001)(5660300002)(31696002)(4326008);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y3AUnwIXYYOsWe2Tx2gwxuJ2fXAZH5Wg4SAXezJ0p5Qz1Kxtgkl+qaph9MLvv6PcqYZdm1W8iYolwKprPzUz3vcnD6NuEMobh6tPgszmMgEVSJccKQTgJzhQub/H3kSzwfSNhaEi0eWzyo47dwQpu3Glx+QPRjRBNJ9jTkywb3lpYTe+YWTO+zE6tOaWyyVq24sWsZHDzFtc0b0M5RTHn2CLwOsB040fGgw13GWynisBhpCWgQi011qryoaoKyOj+NQ238COQ2cla90Ld0sUk+2+NN40N6NKr+nEZLlDbdvZF4xL4R6kgGTRJBa4OlLoYZG1eCxK8mwaoZlVXTJ3Nz/AyzElxzSwulK7z7DdamZK9jjQ7ZLhXB5ufAZh/SoGWmRXjDVvatjwT8+9ODbjksspd0//qtf84keEsHQq14BESNOJ5oT3/JxSvYAa/gprsVaVrCmmWw/y1y4Q36SdOBo6Khs+66Of6cpse8zrC7M5cd2AWbhlXOtwLgsX34d7BdhPvHwvdrD8QprNECrBOA==
X-MS-Exchange-AntiSpam-MessageData: q8DCFN+5w9g6bqHqYjgQQssp5dzr0vmlavZnMDeeGZoQQK0ly/b+g92yQao1+k7/dawEZPuANHwmzyquXk0AOHirij1sxksoFc4e65euWAHn1xiUxwQ5I4zfuWQyWujg6zqklYhxeCO5go+44mEh5HuuJLTLc59s1fOBdOlGUbq4eE3AyK+dyV4Hk2VVomLAa34RWFz730SqKS6+VJ4zAvxNyTi1nJhfHXSOEcRwqocOZ4kcBiI4OVyygcAk5khX5SbLQVlbEP+6MEsGvb8jqREiPoid7E2kw+nyDq3iQUe5OGNwIgGQLfAfr5aAY0Sq6E+xWx/dryQEqROLCNW/53KXIVVzUnRIGxZkbzerVJE044REKNoHnN/1KnZf/LcTi01miFeP2byRb2ThvrcmJcb90alXWqEyFMaaW/DWCPHj7LwKSJu+27htubDt+4Y17UbD7hy1ZerB8oVY2MkcKdStrdWMUYJ0HQ6PbWVWUiQCncAEd5XleJS8q0hZictFRCb1lA73wbIRm1tmtbDJWayI5ZnvcKdROmjnPYORzaczU0SfuxmDGMRO70EMyzCSc4iJCDL2dKawlKfuEUwYVTrS86Ejts1GZDon8GAlxbqM1zFEOgaQ1NzOEdx1oM3kYZKb4acRJRmdtx7/zYu49ok8w9omoOjC9zxjOPoCJzFThPlyHprBXHJRpmQqXuchY3ERSF2FX6doaCykmKKuByWnXohStZ5ptLh0VJQWvt/7vqOG9kGFU5XXSH8AVWdVYSV6ZRjb0/SmaReyehaz77mCXyrE8NtKjAneg0q+oiKtlP6kuzW5STZgPHBC2ohphnKS3Nbgm6EL3JlfY24NNjVhl8xiAPMtR5WpJB6hSfw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f116e8-4f73-48f6-909c-08d7e5cadb6b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 08:06:12.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEW1r7Q7CRio9PC3byuI6FC5IffsHxv7msm0+dd3B3wA0euiMNXGSOPCl7Z9tLI1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3867
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.04.20 um 10:03 schrieb Bernard Zhao:
> There is no need to if check again, maybe we could merge
> into the above else branch.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
>
> Changes since V1:
> *commit message improve
> *code style refactoring
>
> Changes since V2:
> *code style adjust
>
> Link for V1:
> *https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1226587%2F&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C0b8fffafb715474289b208d7e5ca7f6c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637230530201280350&amp;sdata=Sewv5ESX%2B0B4DbFbE03uM5sifrEcmJllC8pt7J42I7M%3D&amp;reserved=0
> ---
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 9dff792c9290..5424bd921a7b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -660,13 +660,12 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
>   
>   	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
>   				     false, &ctx->duplicates);
> -	if (!ret)
> -		ctx->reserved = true;
> -	else {
> -		pr_err("Failed to reserve buffers in ttm\n");
> +	if (ret) {
> +		pr_err("Failed to reserve buffers in ttm.\n");
>   		kfree(ctx->vm_pd);
>   		ctx->vm_pd = NULL;
> -	}
> +	} else
> +		ctx->reserved = true;

That is still not correct coding style. In general when one branch of an 
if/else uses {} the other one should use it as well.

But I agree with Felix that this change looks rather superfluous to me 
as well.

Regards,
Christian.

>   
>   	return ret;
>   }
> @@ -733,15 +732,12 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
>   
>   	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
>   				     false, &ctx->duplicates);
> -	if (!ret)
> -		ctx->reserved = true;
> -	else
> -		pr_err("Failed to reserve buffers in ttm.\n");
> -
>   	if (ret) {
> +		pr_err("Failed to reserve buffers in ttm.\n");
>   		kfree(ctx->vm_pd);
>   		ctx->vm_pd = NULL;
> -	}
> +	} else
> +		ctx->reserved = true;
>   
>   	return ret;
>   }

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
