Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F41B2019
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 09:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52256E8E5;
	Tue, 21 Apr 2020 07:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0969E6E8E4;
 Tue, 21 Apr 2020 07:41:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQ63RfGin7FcxlJDqmseJKFgLeTkiGNraxSRJ80Uqd8+DFiVscsdvNd0mXIrfK2ajdKVAPEWejrAgFbyGm4Ytmq2QUJ/UUIcNBC1GZr6u4R1ngcIafxZn2dEmRbGiTPziPM0Vlzhvg94jM06lVMExj6f+15MkLq8HUp4waR92H7JnZ2gZ4rdz99fnLFZX/Y9oNEuOthsgtRznIBAoSAz/HbY/t2Vtt9t/5OesncKyMv7yuWZoDOqtafC/PZGUKOCmDv/EdDnjFtMBGEyRmuf8KdB7z0AcwN6NYd29l5QRULr21HzY1ulyUqiCL0cRW42rbRYuah8hDtQr1UB3ipV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYV5fKre9YIYKdo2pM6z4RLcH76LXG2dW8OvKa7o5k4=;
 b=dyV4xg872bRUUnDjhmLuJdAgOsxRDLq92ia2FWd9rrcRnu8dMHMQHt4ob39LB6KEGj9h9zz57B617XlvGdRbvoXeqBMGyuAVsKeeMq5HEeTt0fjFMn6MzMxqIN/GC7CMJM9dDrdrdBYppGxmi7eFWrPU9goQxYDee1TD6umP18Np5iE8bE5drhnDqlLoJTAm5uRVhe9rpODHMNokzEhY1Vhh9AfYWUUdzOnOSERvjC/xIQK2lI1Ut1yDvFua3DS15BT6NYGvDdELPGQ8mNhzArr8rZrGP3inRd0MYzktQfRF9p1tl0qbJVYi+Hqxtl8JQuMf59zXsAhLVKIwHcw5Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYV5fKre9YIYKdo2pM6z4RLcH76LXG2dW8OvKa7o5k4=;
 b=ED/rpLte2nw4zQ+DJHyReZ1m4MwVm7b0doj7xKM3ASjVUBFNDmrf5F3C3a/r0QjfiW3st8zDecFnWIaqd+yHuDHiYaRmXynhhlVbceQhLZ0VTIp7kYwoiLUNqEHSva4xaWeF5lfGjA6JiKrpWEwuM8+HeZvRU6++xjwCa8vRjf4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3531.namprd12.prod.outlook.com (2603:10b6:5:18b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Tue, 21 Apr
 2020 07:41:56 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 07:41:56 +0000
Subject: Re: [PATCH V4] amdgpu: reduce no need mutex_lock area
To: 1587181464-114215-1-git-send-email-bernard@vivo.com,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200421073621.129690-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ad7af827-7e62-3493-ddfb-443e7f091118@amd.com>
Date: Tue, 21 Apr 2020 09:41:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200421073621.129690-1-bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.29 via Frontend Transport; Tue, 21 Apr 2020 07:41:53 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3531881c-3955-4140-0f8e-08d7e5c77740
X-MS-TrafficTypeDiagnostic: DM6PR12MB3531:|DM6PR12MB3531:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3531E0CDE3A6A47F587CCAD383D50@DM6PR12MB3531.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(5660300002)(110136005)(316002)(45080400002)(36756003)(52116002)(478600001)(6666004)(31686004)(2906002)(186003)(66556008)(86362001)(2616005)(4326008)(6486002)(16526019)(81156014)(66946007)(31696002)(66476007)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u8gUCJolJZQfKm88CHdWte+cKSD/j3wPoC4nfw0NBj65yH9JFrckO+67nWy23cOWmVvSp6YwiqnYJqRLZTyfu9O9MIsVmFPFcfx9Ic401vPlbweAoXoaD+UtqeUitOaP3Ckq0kiqnlQe9Mf6PMo/+Q34hw6ucywLAon/hykHVqGJ8iCerAsw5L686Oe455YW90o51cKtNS1u+pQoeaThyh4642pQkJmlquzO8juRENzEfAuPbfXN4lq67DOEXzh9xbUAlN+SGcFgbddAXtpYUqlFGCTWx+j5SwAovYIugv3q0a6pNPw+V5s3gw4a9vcC41EoY3kwdlFdIWsZDOu2XidJ6s4FN+1b5RfntAnlYcSImnPHSqwDFNyLzwYYGe+o1SCHfSHpW4vI6Zxd3ZCAJBDUwzrYazDP1x760Rxu7Y2eReExoRM6Y1KX6RwN1zO9MIqnhcLG4u1SSYIxyxND0ivWMyrUynY/PJsdviIss+JhNt7YpWALPpWFQ6JjJrfs/pvx+OQDZE0hgrkI5o++bQ==
X-MS-Exchange-AntiSpam-MessageData: 6xcSlIvvfvdeZnoqrS7jvccKz1pJoAS2o8pDZJvSoXQajjvtfDGEV8Fapsretn+XKe8sL51mev66hJ/AenlYr9VPz4QjUzXhX+V6Y6Xs2rOE/0EkOEAWbU0OHeHYfRmqW/LkX3cBEielcs38+8xZYyjHGwj8H1m6Wy/RbB0ZLJxseNplGzgTghGyBqcvS3P+hOwKeGh4z+aV+Pt1whwbte26Uufi8DLnfcWsYfO5KUzOyc3LzyB0l2GQFTQj2mZV1mk/yl7s64enEa92sXU1HQ8QUzennO9bmRRQaDbbn9EwIzkBF3O/RIERtAuLIUIR4xhs/w7bd14Wx2Tt5SiRGUgzbk4D96rttLTFK7+fnn7Feqt7mHKzOGen5j2sFjtwnDUFpB26yCZAEda7Fv+6JhoseS/K1h70VTlrOpYgq0m+BVBc5ni0r/2uEFH6NpjACxEKTOhBnZBTj7hVOOwBplTiJi2rBk3CKpGfwaSJt2HyMfA3CTEmWOWgXpkdZkUfhSXxTqdoR3aT6XalZiEgRxwqu/R+M5IaZ6/MDjfzZHSmFyWVnTkifgdSAZvoxdqqHhBFbho9+Oi/gAEtES6GBTD8Ls5cJ7GqflWfCrpkRmMJs2mIkSqnC0UHOlxckrNlu9xqtUMgITyISOtPEPzH8CX/C567UrbdhI0FTOL9+Crpht+kmWQMTz0SbQla7/KuneZyLmNCYx9kfcEWLh3RjrUVQ5ZBDWEqS8axgZpJfuna1Z0+kJkHlzeZD+4Urht5i3M+uLOUYc9zAxEWLrqRq1oEKstrLLyALcyM2wonLCc0qHm1wcubHsFE1C6Dn/klHsmXPSmvVFdxAZfngUKU98IRj0NVRRHSmxYEnLpuuhc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3531881c-3955-4140-0f8e-08d7e5c77740
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 07:41:56.0991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2e/SmAGHaMn8fpMW71kAoBnRsbVoVTa+oZp4ddrF3pqTI7BlOXaKiEI0n0etgxD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3531
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

Am 21.04.20 um 09:36 schrieb Bernard Zhao:
> Maybe we could reduce the mutex_lock(&mem->lock)`s protected code area,
> and no need to protect pr_debug.

Well that change looks rather superfluous to me.

This is for freeing memory which by definition can only be done once and 
so the should be exactly zero contention on the lock except in a case of 
an error.

Regards,
Christian.

>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
>
> Changes since V1:
> *commit message improve
>
> Changes since V2:
> *move comment along with the mutex_unlock
>
> Changes since V3:
> *lock protect the if check, there is some possibility of multi-threaded
>   racing modify.
>
> Link for V1:
> *https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1226588%2F&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C9f2b2080f4174c421e4f08d7e5c6b899%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637230513976133424&amp;sdata=6wezM%2F%2FjM5uuLblJejS9XFlE9DjWQ5zSt5PsqrfvCVo%3D&amp;reserved=0
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 327317c54f7c..549bdb429883 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1289,9 +1289,9 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>   	mutex_lock(&mem->lock);
>   
>   	if (mem->mapped_to_gpu_memory > 0) {
> +		mutex_unlock(&mem->lock);
>   		pr_debug("BO VA 0x%llx size 0x%lx is still mapped.\n",
>   				mem->va, bo_size);
> -		mutex_unlock(&mem->lock);
>   		return -EBUSY;
>   	}
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
