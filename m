Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C352A2D8D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 16:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECC06E536;
	Mon,  2 Nov 2020 15:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B6F6E536;
 Mon,  2 Nov 2020 15:04:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aff/p/WSfn7PolgUJYrqZhkHSpx5EVRGHIE+Qbk3qdZ/6wKgkpBOA5mmAQXfrcVrMG9gFvJcD4b+j2afRDVCfV+/squLuNnQvuUd/SRUxMDeEPa2SE+e8MUoHYk4JTH5oz9pYCK1I4zjAvbYZkKYz6cDoXektkXyR8UBrhLn6HYcM//eg7YmZKoC4DpYl188VNDJAkbppxCB8l3Bo4SwL8rOlcRf5O/SbNE76X6WdDK88ilsfKPI+m4mRKlA5aTWoO5ImFqfTGZwlUpkQf3hafD3vjSNlVoeAeDSOQ6le3AQeU3I5fEn+fJXk26nFuQp6xFz3E0nurasbi965Ls8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPcDgzZQ/T5oKoMzCGZPMVA8bjRJeswUiU+uAHBKuXo=;
 b=d1l6Y/9EMGhRGnhWik3+exiVh3lasa8EMBeDJvCq7H8oriWNFCQPZB/Pbad8tTo5a82CSgEILPXNaWkeUiQK/WUFiql4AEkOMgyzJ1zcD1+visruiBpkRgv2/xJaoCN5IZUyPvMBOu8ayEsBdbL2Yh14qCp0kJt4GWz2gSwxEzEaz1PAHvZw4BhcUXN9BMk3qcHOBh6GXMhk7AC7GHKxiP+cbTj3fFUKZXgG6WzeKtmLwwmpfVV/u3bVjUfH18tevABmVoIvxaUnV/lTf0Mn0vxXltjO3fFy1Ld5BV8Kj1hsLoRZf/uGv2sCY6nHFMG+uiYA/5yAXh2h/MM5mNFH3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPcDgzZQ/T5oKoMzCGZPMVA8bjRJeswUiU+uAHBKuXo=;
 b=JpPObkMNvG5lgKuXlZ+j7pl5bGsFcYaTB0B2AfSjy/kMxnmkTFw7lN6vXts306KjBi1AwzUlREF8rrWquSBhG5cJeVy3yL+TEMDK8exwnkAyJXOsX2ZqVFNRs12xs7PAa04cTj4VTx3vE539K4lEVAA7e75HXtF6LBhUbtm3T90=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2577.namprd12.prod.outlook.com (2603:10b6:207:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 15:03:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 15:03:54 +0000
Subject: Re: [PATCH] drm/amd: move DRM_ERROR log out of the mutex protect area
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Evan Quan <evan.quan@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>,
 Changfeng <Changfeng.Zhu@amd.com>, Dave Airlie <airlied@redhat.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201102031423.4033-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <70145097-6157-dc62-3da6-3ba0b6cadb82@amd.com>
Date: Mon, 2 Nov 2020 16:03:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201102031423.4033-1-bernard@vivo.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 15:03:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0765ab72-fc54-4c5f-2b0a-08d87f408345
X-MS-TrafficTypeDiagnostic: BL0PR12MB2577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2577AA7C65FD40842DFB808983100@BL0PR12MB2577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ydX2KHXjbAvogww72MJgmJo5DaQyElzozYOcBJvz06hXqz+wI/aFzTaD0ZuomOq70/sVY6QG5IOW0LkFa/dof0IzcR6s9QlgLFaMelua3pD+vcYp4+Od0u/Z8m1vbqOyBjIpl6j1sDC7ltzW7RHZDt4Mhgb1WB9K2XK5cRCVrMhSWmbgZE8NqZY2QiQvEpY7affXG0DJ7HHTyJhzlQp2Semo/p+6lfGOkGFOqeeUNJFJhKeg4ThCck7766Azc76PkOEryu7375R8SF45jQroiTwaEXBhY6V6S5fbX2qM4+G3p9axl8lReXHESwv8pyR3vSEK+gfPooznnLo/Yo4rnAZVgH6NQovMNqQgmVQOkC+z2Z1TQHJ4hECNULAeoR0mafVPhmuW3pPhx56OxO8mFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(2906002)(86362001)(8676002)(4326008)(31696002)(31686004)(8936002)(52116002)(5660300002)(6486002)(110136005)(36756003)(478600001)(66946007)(66476007)(186003)(66556008)(6666004)(83380400001)(316002)(2616005)(16526019)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: KvWLE7lqeebwzalIXVRwGnOSywM2DLsxx0yaCO10zM1YDBbRv8JKbAdm+ikrgKrxC6afG9DbhwWDNlFjqwTSVuGleMHZd4Q9epval5SUD2Gj3wgAoEZ8ZQ3Bw+SAHNwtBrFL1eMSpvLat2wTsflOzYVzRuDdw8OFXKo5KdvlrfHhdqXRKgh2rm6CYUtH6322q3tP+cjRY9K7bHbuMTZzCid37z0F5HoTWVTuSJpKfi4RholGOyrUXxD0iCh8Q0OSdFz/rQN/WolGA6sLG8zxTMy6xdbqcNcMolLq5ilC8IvDKJ44AkLJNyPmjt4XFaybq1N5ulqB3DAvZyMiJgRaiugKGgS92qultqRfDmRHx0o/tWtzMNC8/+EcNeir7vc+2I7xrgzY4DdjKS1S2FCuxLsEerRU2DaYMoSq+4lQ5kgMtIuYNgkS69NOikzGHRWOZiZgKUPX4kdamP3n4FEIYCCYwFdv+3dVSs3bDVCqpQgArcX3OR/I72SfBehEG02tTt00FwubL7u/5hRC+G2aC96kJb0ItBjvDnUKbttcw46LqZJmQfDBso2qc/03c89GzzGO6b4mBsGyO5cAOnnFoBANioaYU8gLXKSiVQZ3gmCNFpiA8wwMGTkaMmwSJgQ/oZ4EZwnvrY/8Xkui57XdJE5kfmmgHL+6ajgg/nIlGYTONhK9vhfYjW8XGtXyYTRbjnnsToNZsHV5sKThf+nTRw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0765ab72-fc54-4c5f-2b0a-08d87f408345
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 15:03:54.6168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m24IgMpyvk+SVQhVCRsQlkylV5Lyezgziwnoc4qRvhhlhUDW8PT5qIh1GhDIjUd8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2577
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
Cc: opensource.kernel@vivo.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.11.20 um 04:14 schrieb Bernard Zhao:
> In function amdgpu_register_gpu_instance, there is no need to
> protect DRM_ERROR in mutex mgpu_info.mutex.
> This change is to make the code to run a bit fast.

NAK, performance for an error path in module load is pretty much irrelevant.

This just looks like a random unnecessary code change to me.

Regards,
Christian.

>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index efda38349a03..cc61b0a5b8d1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -104,8 +104,8 @@ void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
>   	mutex_lock(&mgpu_info.mutex);
>   
>   	if (mgpu_info.num_gpu >= MAX_GPU_INSTANCE) {
> -		DRM_ERROR("Cannot register more gpu instance\n");
>   		mutex_unlock(&mgpu_info.mutex);
> +		DRM_ERROR("Cannot register more gpu instance\n");
>   		return;
>   	}
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
