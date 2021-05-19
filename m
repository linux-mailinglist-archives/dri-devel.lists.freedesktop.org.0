Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D23388C2A
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C366ED0D;
	Wed, 19 May 2021 10:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCDF6ED0B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 10:57:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VT/6YnpuMwS6YfhzL4nuyzO/DKclqELOE74JLkcysPEVUqr/Z5N5FCLJhCnSnArNsFeNXf/lax30wE2G51ALcJIwymvBnkm+Lgo39+E5k8oTneH/ILv8hRGoguQOMpXYthiLJY8xZ/b0gv/2dZVRDavfcPlW3S9SkPL7Uu6JX40mqiDdfOSd9BYGx6IviqdY/KckpkJRuoSaFBLgOaq1aA/1YD/8L9Lz5Q4TmZcAMOwFdPvb1XSqtDIzQsb0So6Rrp0Q5hSG9tRDfnp0+HvfKRua0M+W+9iqyXPnxIQ7PvtJq2nhB2MjupKoLkHWkJT7gvUx9A9CqEBbd8uyrbJELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z/ImnyPKCo/FWmLufxEPvmv132c5k1rPX1xeMIbNAk=;
 b=FFAcHJ/qDQqCoWvF47a2FI6DVigKzNHfW2Q+H5WlmK7ixWtt6e6HvkBpofutJguIegmuRbAZXQiw26smlFN5KQR3H4QVhDwTwsBNietdtp8cLGbD5iWW9JixFARkNTUE5TJyoAmE0fN3/sfwnKwllVfG+xz0XCWVx2jKp+mqosj7SN9vGbmmdX9zF/M3y2EI5NP7wJA7CZeiCf6zyD/8T1fNx8RvnV8kzPzlXKGQqDYJ2OZiXWx5p935OCIEBfHpz8k9jBPcZ8I0nuR0If3+sJXyRKWCkmYAYZSq0hY13UgA8HpEWanCK3J1DbFtdGtq1Qlfuzs8ZGn7VPq/xhWTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z/ImnyPKCo/FWmLufxEPvmv132c5k1rPX1xeMIbNAk=;
 b=EoB4GXWTzI1JdCjQh566b0/CGWEjUH0QHbteN5Ko2IymMS7rUhG+e9OPBiM3PSOre8U9d6YkyvZK+pNntmXCv0PlioXTOnqzLKFrjFZhY7erEdRoN+E2bkGSMZcU3dEdK4U7K55VKX5fYiF/51li32JjAo9PbzLHyL2qdfuTv7o=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MW2PR12MB2587.namprd12.prod.outlook.com (2603:10b6:907:f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.30; Wed, 19 May
 2021 10:57:10 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::f07c:dc0f:e7e8:416c]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::f07c:dc0f:e7e8:416c%4]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 10:57:10 +0000
Date: Wed, 19 May 2021 18:56:46 +0800
From: Huang Rui <ray.huang@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/ttm: Explain why ttm_bo_add_move_fence uses a shared
 slot
Message-ID: <20210519105646.GC1853643@hr-amd>
References: <20210519082409.672016-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210519082409.672016-1-daniel.vetter@ffwll.ch>
X-Originating-IP: [165.204.134.251]
X-ClientProxiedBy: HK0PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::14) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (165.204.134.251) by
 HK0PR01CA0050.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.32 via Frontend
 Transport; Wed, 19 May 2021 10:57:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c734d1f2-a9e9-476f-845b-08d91ab4d9b2
X-MS-TrafficTypeDiagnostic: MW2PR12MB2587:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2587BDADFCDEC549D5315553EC2B9@MW2PR12MB2587.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y/6npknvEu1x3zzg1Eny986yk6cDPspT1eRgWe0IcfbaEiE4j/W1m5H7/wvTkde+n0YZBv+VTZKMAIcT40pj4PT4848XQxJFTP9q2mlvFrJ7ADrOmJuIa/NsEXhqGQccBNwrC9e90o7kUPO+umGpNt4T5IZIWKUMdcKb9glFpAZqgrXOL2R8385Y3i3OROqNI5NUS4Qpb9CdQ1LOafUh7uCisWRLiinIsEV1KqphFeE4EIBBSCAw5U7LpvLhCjXNPaH98UvtfsypH6tMKU3bf0E/vvvmxSwojBizabwSkXECqhrJurlb13DAUQXObf8DPFVvH0WsK0j40YphpteJs4N6s61yCR3W43JvQbZEsppyZ53YVN0yxtgotAAvXTU+9Kx9IFrmIJyam8/DqZqHaHIfHYqx+CzvAto6GYT/wfuCDQErZWkEEzan0EhDd0WRMAQc5YKXxPsH6zTJ/CjxUgCvvAi3BmKgBqoy2OT8ysH4dQADL0NS8cMsCQA75BUbHOFw/C3TG5FPB4EtG84tfjRdq75rXvEba5hLuSqkwRkPkAecaEL2SU0ebavHOyR2Coz8sp+XGnMCnVtnMAtd/rlPrQ/Ps/CfCq2bBR0Wh8oqH656JVfVKFHua8ttdDdWJbIvpIGgFC0mLC8FpeLv8OFnvhx3f9e1Ou1jZanXAio=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(8676002)(6916009)(52116002)(478600001)(86362001)(16526019)(66574015)(6496006)(26005)(55016002)(186003)(4326008)(6666004)(9686003)(83380400001)(5660300002)(66476007)(66946007)(33656002)(66556008)(1076003)(8936002)(38350700002)(2906002)(316002)(38100700002)(956004)(33716001)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?UoYxVNIdZ3MKnslklQW074GaBGbWKmcqCFwjj0pKf2KnufugTQ7Hukkxf/?=
 =?iso-8859-1?Q?oUWAMPUmpj9t5DmFg8tPfYeCfNd9c5sRZQXR2rZWg5fhSEHx1+MPchwYv3?=
 =?iso-8859-1?Q?kHqDxIVlcsMTbNP1D44LEvd8p/pWmz9TRVQfa3tfVdR6s5NIPKfyl5AN6Z?=
 =?iso-8859-1?Q?0CGkFVHqQHXCNDts68Jto9Z+WLJUBG3wI8Iy4SDh9GfiTOc9uBSvTBTyha?=
 =?iso-8859-1?Q?Ct7cabzKgPJVGdpI8Op7r5PLHz1yZpS3BF5vzJ2+66GFczoSHfkSb1GM19?=
 =?iso-8859-1?Q?m5DeVXl9/Arv23d/kxFyzG7r0f70ZAScksLR1tkrgl+2rVcB9G/siQ7t4y?=
 =?iso-8859-1?Q?9L+PMgw6ftuNcgrn/2eWfk28QcE9oIrx4IANLkeKMwnEdHAJQ+UJxhObp0?=
 =?iso-8859-1?Q?FAE35LXSdWlfF/ATNJTwqnoJfztSXvZMI4o4lL60YEZnPv6zviiEjUdQQk?=
 =?iso-8859-1?Q?0JYNXhwJ8ag4JQPi+hQURwN2uGDTHw3GtC78Ywl/7lt77VXmBDKgD78BO0?=
 =?iso-8859-1?Q?QaTx7oOS9dHPBM4M0MyIKe72/PE9ZZWFXFgQBwCTqYrxzxr5l+lsUzVtr9?=
 =?iso-8859-1?Q?CyLBq5Vcm9IRD0f0pocFDwOemOESWWswE+fdkgyAuIVLljonNCYdHaH4am?=
 =?iso-8859-1?Q?GkxDJQERxfBGgRLU0brZDj3MHivBnxxUHVyvpQl4W0YYHnya3ib7JobwUm?=
 =?iso-8859-1?Q?hYmTPUKuxQ4AxEnlp8cwPSsLGXipGq2bREzUFR9mapOGI7CmuTOlKTlW0M?=
 =?iso-8859-1?Q?g794kyGrx+kMgNMovlHpSrRd2jFKvKeasUEtlpFMYV5zWMjeEeT3z5mxoK?=
 =?iso-8859-1?Q?l/PIX89e/U4NvNoQZ8YPpfhV31tGNMFOYXVa2yfI2fJtoRoQet2EkfMB1f?=
 =?iso-8859-1?Q?rEw/dlSvh+P8T4QFWY4uRdgsH0ASD5hlsUan6VBfYaj4aOiYkvdyIUHS1K?=
 =?iso-8859-1?Q?p3uAEgDli2BXWMJ0Xhehri9KdXjqfLl/IAaoReuiqqfoqb36hxRnJ7Arj4?=
 =?iso-8859-1?Q?3zxvUFU8dAD9+1D8FmpfRWm/cviwMxSwfyp/SiIz/lAI2E110lL314H6gs?=
 =?iso-8859-1?Q?sIS/3Ij/fbxTDhbXpyaZUOPRzcxiqWujkHX/tbFzwvyssVX7R0ffN+e5qS?=
 =?iso-8859-1?Q?xM9Th24kt8Rs+xF1GBoAkOTxIwtAyRkBLz/T7Sdem9JJvlBDI2GFtW9Qme?=
 =?iso-8859-1?Q?k7AG7kHbxZB4Mo/I+r+hB9hptYHL1mHUE3lfKF+6cpPraBObG/NTyCQMuL?=
 =?iso-8859-1?Q?wG5Vn/gmUR3Y8o/UDpjUpBFxIJL7KCJChZMtSnFPHkDFcXuIIGun7qlc6k?=
 =?iso-8859-1?Q?s8x07fOpVx2eBgRgMueRnD9xjhmlUpwXB5AcC2VfcL4B21G6fzXSTfjkF2?=
 =?iso-8859-1?Q?ZLX0EUtJ2z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c734d1f2-a9e9-476f-845b-08d91ab4d9b2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 10:57:09.9815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kD5l4GhRER9GyjVF16zHj2HkglXzsOF3tcw0YX08GVDhdgiE+wkx47Qe38mfQ9mvn/XNEcT/AhQDPq4fYW5Pkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2587
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 04:24:09PM +0800, Daniel Vetter wrote:
> Motivated because I got confused and Christian confirmed why this
> works. I think this is non-obvious enough that it merits a slightly
> longer comment.
> 
> Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index ca1b098b6a56..51a94fd63bd7 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -682,7 +682,9 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  }
>  
>  /*
> - * Add the last move fence to the BO and reserve a new shared slot.
> + * Add the last move fence to the BO and reserve a new shared slot. We only use
> + * a shared slot to avoid unecessary sync and rely on the subsequent bo move to
> + * either stall or use an exclusive fence respectively set bo->moving.
>   */
>  static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>  				 struct ttm_resource_manager *man,
> -- 
> 2.31.0
> 
