Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6992D7D85D5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 17:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD7E10E830;
	Thu, 26 Oct 2023 15:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDC410E844;
 Thu, 26 Oct 2023 15:20:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8havNIv29Mmq7u1P7NmF6hDIr02oJN7MVc43kbwJwb3yphY5D6S+MZHb0713hAmbsRkUkCc8f32kyxskrr3HBBmRa0YFLu+8VewHSE4LU4/n4tmoM+sdXwYHjijk+7RuSZj/sC2uFo3jDjALKjxQMUgzkn5wlMEQv2bM2lRYjIa1ddpm86OXm+U5lMDO0NVOIM7PcasFo0enuhL0Vfx+RC6sR74xyvSxLvJvirKSFS3xZ4gF4uFNXIXD093asHnN9GfsJH87CfEhZkhmjDeQ6RrlxHnINi3tG5Bw+MeSUsh4LXPBA0bvij6RboRk502BAVyer2VODRyZRK56rYI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqE1FX3bQNn40mu36asBFZbdFJ5REaRopbNahHA0Dik=;
 b=YPByiLrtEyy9sSQe4p4rF1uddb1CVIh+2qRzPRIL+XqcuNJr2nyny+fYOFiVyHXBS/XRUfD1ezGv4BCsKKsDW/qkpIUstT+dl9ocujq7nxs00snp1RnGVJsLhu+veO3q9M/XTcTvf0xkhaSkmoS3FCWQ7u5TWjZ8U256D0D8vGBxMnBD4Oo56q8k5v9bsTDdX5nF2QCmhKIK1waVyy6Dc5NJtOXndsU6eH0ij+UqaIAL6COkwBUmEwIKSfO6XbyBoOkSka2U3UMXlV7YJCfcnZyFmT6ZIkRpxxpBucjb+4DB+EW2hYBjMJmbwJilhGFFVcMvgOaig5mU6gkf2dqLFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqE1FX3bQNn40mu36asBFZbdFJ5REaRopbNahHA0Dik=;
 b=cdiXWCdaY9FXT8Wa+p9nbjvRFtq03xSC6My+MpyfaTBLHTExGf0B5NOw20UXKiTmxpme7YTZI+5EV7q/CqMs2dmad+krQESU4DRNaZQu7K6vhiL3LdmJE6yAIGiWhXJZORGs0FUiu5x/5kcR5hO4jaUCH88Ht6FuER7nuvM/cC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.19; Thu, 26 Oct 2023 15:20:11 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Thu, 26 Oct 2023
 15:20:10 +0000
Message-ID: <0b67a7c7-95d3-4f6c-9289-ba939fd65982@amd.com>
Date: Thu, 26 Oct 2023 11:20:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH] drm/sched: Convert the GPU scheduler to variable number
 of run-queues
Content-Language: en-CA, en-US
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231023032251.164775-1-luben.tuikov@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20231023032251.164775-1-luben.tuikov@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0278.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::12) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee03c24-e8fb-4b2d-1737-08dbd6370abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: keIJM4oXhT18E1dM3C9kJZHZ3wT5KNQ5foTsferyVcKc/+7415pO7Wi7krPxP1Aave29ColmhQ1chno7z52d9bweSLo4f/+D7L+7JLrSYvKT8zExLkW0hwzIMuyIfXh/TkBjrDZRWcP0SUuhQVy1vvpY8OdPjB4uxqxk9mvq56kSewziW06rjxvo3R7UCWhMlUudxcV6kKBZBmfXkPK0xLboIcrDHDD3ZBhDEW4qXIeFIQKMuPDv7H+QR04wDTBQSUtCwLMG7LVTE+NqPmxT7Pc6zTF4BJPJhRt2IW0tJyDbGf0tVW+Gx5wQIsCE+kBF3q39w64/wwqUbUrkvLFfjR7cQn+jxcpov+2mdfOGZ2+R9GaelTCvJSaBaVSvr9KANLBMLfomO21KG8i/dFjWvEuTkQVfq6Y9iR/iWhDIRb+z0s31rrOMiiNg+ar0EJEOi+9M1rUyDlJkDSQyrQGfLNUFVfGURpT+tdVILN6q/lDq1qxWZKds2+fvaKDNUWT7sVsxX7D1riGg5/GP0wjEtcA04bje/qDrOfzFeTX+hN+WgGWyUrDl8/FkBockVmG1LobfO9vaHnTYl4YjW2teUNKi+1Mma5NBASRPngEIslj/Mwz82ec9p79l7JbxI+853NQ5oOVUr6ZOGmjlChV17Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(396003)(39860400002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(478600001)(316002)(6666004)(6512007)(86362001)(6506007)(6916009)(66946007)(38100700002)(66556008)(66476007)(54906003)(36756003)(66574015)(2616005)(7416002)(6486002)(44832011)(30864003)(4001150100001)(2906002)(83380400001)(4326008)(8676002)(8936002)(31686004)(5660300002)(41300700001)(53546011)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkxlNVhrODF1eU5qRlMramZHVDVJZlZicURTOUZOckY5S0FHdDhuN3M4cVgy?=
 =?utf-8?B?cmEzUmlnekxtdngweGRVZkRsR3gwL2ZZdlJObk54ZjFTRGltVWRMcVlRaUd5?=
 =?utf-8?B?QndvcVpRVnNEQTdmWmZuN3grcXpteWRQM3VxWnBSVTROeXROVnNORzIxTVNB?=
 =?utf-8?B?bHJKQm5CY2dadWVMeWVrSktWUUhNMHRlaDJJUUlyRldhNlNiVjR2d0tmVkY3?=
 =?utf-8?B?OGpNOXpPNDEzRCtQdmh2ajN3ckhBcjk3bjk3c1pZY2R4eXNROTVpL2I1UXlC?=
 =?utf-8?B?b040TGwyTEJ4QVNJTy8zUHN4WHNuakRmemgzbk5xRVFmekd2aCtpRjU5RUFv?=
 =?utf-8?B?bm11UFp5UUJxVEVNYTBqNm1NQ1ZnNitMbmozOVlCa2g3VnlFTmVwMmt1dERo?=
 =?utf-8?B?S2IyMVNHZjJLTGFNZFZoTDBSSWtBL0c3STNVd0owOWtweEc1NjVKdnIxVjRN?=
 =?utf-8?B?UTVSTGxwN2hsZFFHYWpTenhLYnUxUkVhR25GaVJoYVVmNE5UYkw4djMwSnZp?=
 =?utf-8?B?OGhuekJUMENDVTB6MEg3WnJQVzZXWUNQQVFHd05tWEFXdTNFbW8xUGtxVWtp?=
 =?utf-8?B?anM3V0JDaEpzTWk4MHlLdzR4N3Y0eklzaStoR3JLTEV3NmpVSzJ5U0dXOTdT?=
 =?utf-8?B?ZXVFcjdZbEtreWp1Q3lzeFlFQmFMUzJCdmo1Nk92UEtuR1p3MzcxVks0SFFo?=
 =?utf-8?B?RDRrSFJEWE94blp3U3hUVVFLdnlxdUtacnZkS3JvMnRNNTN4YUx0SE1DUExI?=
 =?utf-8?B?UkxURUNyMGs3R1NEWitxS25wbGk0a1psZVJIb0Q4RG1NaUxKWEtlcWwrTkcz?=
 =?utf-8?B?dFpuSGI3bFluV25XbjEyd0YrWGZQSW4wd0lYenFnWVpvMmpEMDRRVGV5U2hv?=
 =?utf-8?B?a0xJQTVjOTBtd0NzRm9Pei82VndsZTZkRFdmem41czdhNFhzbmlTaHRPa0l3?=
 =?utf-8?B?cnZFWVJXcVVYVXJLQk0rYUloV2RubUVUYlZQZzM0ckI4MlhFbzc5LzB4d011?=
 =?utf-8?B?L2gwa0pwVTJSQVRyWUdRc1p6MURPSXU2b1hNUFNpRGJreGQySVBWN1J3cFhE?=
 =?utf-8?B?eWpKWkRZOVk4YlNqeGRMbE9KVlZMaVIyd080Ynd5bURFWUQ0ZFNJY01LbFkz?=
 =?utf-8?B?aEh5alA2YVdSZzNCWGpVU0plQTVTZVJXVCsvZzk4VHNiWHErTWhMOFpWT3pn?=
 =?utf-8?B?NW5NVDBqZkQ4Y3NjYU9GampiR2VsTm5Zb3BVbTZzSnNXcDBQbWd6M2c1ci9t?=
 =?utf-8?B?NERJZTg5YlpmQjlheWVta3lrbFdVakptMFlTekNtTFRsbGVQZlFTdG1PY0xK?=
 =?utf-8?B?Yy9BRTZjVDVjZXVraWx1SjlJa2lRa1ZvOUdlMktkSEFpdmpVSXhLWkhqL09y?=
 =?utf-8?B?bVZuSXR5ZWxyTzdIeVcxQnZITGxONjQyMHR2enlSVDRzVmh2aTdiemx2L2lx?=
 =?utf-8?B?TUpoemNySjI5YXIxNmM2Z2FUVHZoL0FLZStVTkZxeStOTngwN3lmT2wvQ3BH?=
 =?utf-8?B?a3NkQ3dya2lOZXQ5b2JHNEZJVnBsMXJrNjdFWEFUVHppb2tGOEpjT0FzREZ2?=
 =?utf-8?B?QU5VNmN2SndkNlNPaTJNZkxLUzAxbEJ0b1YwdlFjQkNMZmhGZW9XVUpTWFRR?=
 =?utf-8?B?bXVTTFNrazljZnZYbHY0ajc1amRzcUNDbW55UUhkTU9uL0hpWXpGdWFvakZL?=
 =?utf-8?B?cGpkVUJ3SkF2VG1JdHNYVGdiNWlORVYvTGc4NnZzT2lhbVVoMC84VEZYUSsr?=
 =?utf-8?B?THROcXRNTFpzWjVYQ2FlSzZockpqSFo4YVdOWmVtY1IrU0pmTGE2empxN3ZG?=
 =?utf-8?B?eFROZGkydmVibW1hVDFQcExKdzFDRTVxcC9YZCtpMnVYUGc1VUxINDRiUmdp?=
 =?utf-8?B?UHNQcFNmY0NHSEJaNFdnNkdnWHlWVmM3L1c0SE11ekJPcmVreXRtVnk4a3Rv?=
 =?utf-8?B?aitGeGwxN0hscWE1eTBFc2Q5SE14dTFsOVFNa2lFa0VkRDIwaGdpZlBhbllH?=
 =?utf-8?B?Zk1MeUh2OU9rdm56c2tKelU5R2hXYkhXMWRESFJ1Mi9LUTBnREtib0h4T2pP?=
 =?utf-8?B?S3ZFNHpVeXNYMTR2ODMvMGlySDd0d0haNFF3U01pMmR6U2VmZjZreEJqa2pp?=
 =?utf-8?Q?e/K0Za5uH9hT5ro2qpelvJWQX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee03c24-e8fb-4b2d-1737-08dbd6370abe
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 15:20:10.4964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //lobZpKe6+s65WUpJIMlUcb273yJA4tctjwmQxB8NXCKJ72tkRUNAbq1zFKtbTX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604
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
Cc: Matthew Brost <matthew.brost@intel.com>, ltuikov@yahoo.com,
 lima@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 nouveau@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 ltuikov89@gmail.com, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 etnaviv@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping!

On 2023-10-22 23:22, Luben Tuikov wrote:
> The GPU scheduler has now a variable number of run-queues, which are set up at
> drm_sched_init() time. This way, each driver announces how many run-queues it
> requires (supports) per each GPU scheduler it creates. Note, that run-queues
> correspond to scheduler "priorities", thus if the number of run-queues is set
> to 1 at drm_sched_init(), then that scheduler supports a single run-queue,
> i.e. single "priority". If a driver further sets a single entity per
> run-queue, then this creates a 1-to-1 correspondence between a scheduler and
> a scheduled entity.
> 
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: etnaviv@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  1 +
>  drivers/gpu/drm/lima/lima_sched.c          |  4 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c       |  5 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c    |  1 +
>  drivers/gpu/drm/panfrost/panfrost_job.c    |  1 +
>  drivers/gpu/drm/scheduler/sched_entity.c   | 18 +++++-
>  drivers/gpu/drm/scheduler/sched_main.c     | 74 ++++++++++++++++++----
>  drivers/gpu/drm/v3d/v3d_sched.c            |  5 ++
>  include/drm/gpu_scheduler.h                |  9 ++-
>  11 files changed, 98 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 2b8356699f235d..251995a90bbe69 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2280,6 +2280,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>  		}
>  
>  		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> +				   DRM_SCHED_PRIORITY_COUNT,
>  				   ring->num_hw_submission, 0,
>  				   timeout, adev->reset_domain->wq,
>  				   ring->sched_score, ring->name,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 78476bc75b4e1d..1f357198533f3e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -325,8 +325,8 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
>  	int i;
>  
>  	/* Signal all jobs not yet scheduled */
> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		struct drm_sched_rq *rq = &sched->sched_rq[i];
> +	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +		struct drm_sched_rq *rq = sched->sched_rq[i];
>  		spin_lock(&rq->lock);
>  		list_for_each_entry(s_entity, &rq->entities, list) {
>  			while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 345fec6cb1a4c1..9b79f218e21afc 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -135,6 +135,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>  	int ret;
>  
>  	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> +			     DRM_SCHED_PRIORITY_COUNT,
>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>  			     msecs_to_jiffies(500), NULL, NULL,
>  			     dev_name(gpu->dev), gpu->dev);
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index ffd91a5ee29901..295f0353a02e58 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -488,7 +488,9 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>  
>  	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>  
> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> +	return drm_sched_init(&pipe->base, &lima_sched_ops,
> +			      DRM_SCHED_PRIORITY_COUNT,
> +			      1,
>  			      lima_job_hang_limit,
>  			      msecs_to_jiffies(timeout), NULL,
>  			      NULL, name, pipe->ldev->dev);
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 40c0bc35a44cee..95257ab0185dc4 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -95,8 +95,9 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>  
>  	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> -			num_hw_submissions, 0, sched_timeout,
> -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> +			     DRM_SCHED_PRIORITY_COUNT,
> +			     num_hw_submissions, 0, sched_timeout,
> +			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>  	if (ret) {
>  		goto fail;
>  	}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 3b7ea522122605..7c376c4ccdcf9b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -436,6 +436,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>  		return -ENOMEM;
>  
>  	return drm_sched_init(sched, &nouveau_sched_ops,
> +			      DRM_SCHED_PRIORITY_COUNT,
>  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>  			      NULL, NULL, "nouveau_sched", drm->dev->dev);
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index a8b4827dc42586..95510d481fab3a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -832,6 +832,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  
>  		ret = drm_sched_init(&js->queue[j].sched,
>  				     &panfrost_sched_ops,
> +				     DRM_SCHED_PRIORITY_COUNT,
>  				     nentries, 0,
>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>  				     pfdev->reset.wq,
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index a42763e1429dc1..409e4256f6e7d6 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -75,8 +75,20 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>  	RB_CLEAR_NODE(&entity->rb_tree_node);
>  
> -	if(num_sched_list)
> -		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> +	if (!sched_list[0]->sched_rq) {
> +		/* Warn drivers not to do this and to fix their DRM
> +		 * calling order.
> +		 */
> +		pr_warn("%s: called with uninitialized scheduler\n", __func__);
> +	} else if (num_sched_list) {
> +		/* The "priority" of an entity cannot exceed the number
> +		 * of run-queues of a scheduler.
> +		 */
> +		if (entity->priority >= sched_list[0]->num_rqs)
> +			entity->priority = max_t(u32, sched_list[0]->num_rqs,
> +						 DRM_SCHED_PRIORITY_MIN);
> +		entity->rq = sched_list[0]->sched_rq[entity->priority];
> +	}
>  
>  	init_completion(&entity->entity_idle);
>  
> @@ -533,7 +545,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>  
>  	spin_lock(&entity->rq_lock);
>  	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
> -	rq = sched ? &sched->sched_rq[entity->priority] : NULL;
> +	rq = sched ? sched->sched_rq[entity->priority] : NULL;
>  	if (rq != entity->rq) {
>  		drm_sched_rq_remove_entity(entity->rq, entity);
>  		entity->rq = rq;
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 5a3a622fc672f3..99797a8c836ac7 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -632,8 +632,14 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
>  		       void *owner)
>  {
> -	if (!entity->rq)
> +	if (!entity->rq) {
> +		/* This will most likely be followed by missing frames
> +		 * or worse--a blank screen--leave a trail in the
> +		 * logs, so this can be debugged easier.
> +		 */
> +		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
>  		return -ENOENT;
> +	}
>  
>  	job->entity = entity;
>  	job->s_fence = drm_sched_fence_alloc(entity, owner);
> @@ -671,7 +677,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>  	sched = entity->rq->sched;
>  
>  	job->sched = sched;
> -	job->s_priority = entity->rq - sched->sched_rq;
> +	job->s_priority = entity->priority;
>  	job->id = atomic64_inc_return(&sched->job_id_count);
>  
>  	drm_sched_fence_init(job->s_fence, job->entity);
> @@ -888,10 +894,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  		return NULL;
>  
>  	/* Kernel run queue has higher priority than normal run queue*/
> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>  		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> +			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
> +			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
>  		if (entity)
>  			break;
>  	}
> @@ -1071,6 +1077,7 @@ static int drm_sched_main(void *param)
>   *
>   * @sched: scheduler instance
>   * @ops: backend operations for this scheduler
> + * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
>   * @hw_submission: number of hw submissions that can be in flight
>   * @hang_limit: number of times to allow a job to hang before dropping it
>   * @timeout: timeout value in jiffies for the scheduler
> @@ -1084,11 +1091,12 @@ static int drm_sched_main(void *param)
>   */
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
> -		   unsigned hw_submission, unsigned hang_limit,
> +		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name, struct device *dev)
>  {
>  	int i, ret;
> +
>  	sched->ops = ops;
>  	sched->hw_submission_limit = hw_submission;
>  	sched->name = name;
> @@ -1097,8 +1105,36 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	sched->hang_limit = hang_limit;
>  	sched->score = score ? score : &sched->_score;
>  	sched->dev = dev;
> -	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> -		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> +
> +	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> +		/* This is a gross violation--tell drivers what the  problem is.
> +		 */
> +		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
> +			__func__);
> +		return -EINVAL;
> +	} else if (sched->sched_rq) {
> +		/* Not an error, but warn anyway so drivers can
> +		 * fine-tune their DRM calling order, and return all
> +		 * is good.
> +		 */
> +		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
> +		return 0;
> +	}
> +
> +	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
> +					GFP_KERNEL | __GFP_ZERO);
> +	if (!sched->sched_rq) {
> +		drm_err(sched, "%s: out of memory for sched_rq\n", __func__);
> +		return -ENOMEM;
> +	}
> +	sched->num_rqs = num_rqs;
> +	ret = -ENOMEM;
> +	for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
> +		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
> +		if (!sched->sched_rq[i])
> +			goto Out_unroll;
> +		drm_sched_rq_init(sched, sched->sched_rq[i]);
> +	}
>  
>  	init_waitqueue_head(&sched->wake_up_worker);
>  	init_waitqueue_head(&sched->job_scheduled);
> @@ -1115,11 +1151,18 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		ret = PTR_ERR(sched->thread);
>  		sched->thread = NULL;
>  		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
> -		return ret;
> +		goto Out_unroll;
>  	}
>  
>  	sched->ready = true;
>  	return 0;
> +Out_unroll:
> +	for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
> +		kfree(sched->sched_rq[i]);
> +	kfree(sched->sched_rq);
> +	sched->sched_rq = NULL;
> +	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_sched_init);
>  
> @@ -1138,8 +1181,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  	if (sched->thread)
>  		kthread_stop(sched->thread);
>  
> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		struct drm_sched_rq *rq = &sched->sched_rq[i];
> +	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +		struct drm_sched_rq *rq = sched->sched_rq[i];
>  
>  		spin_lock(&rq->lock);
>  		list_for_each_entry(s_entity, &rq->entities, list)
> @@ -1150,7 +1193,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  			 */
>  			s_entity->stopped = true;
>  		spin_unlock(&rq->lock);
> -
> +		kfree(sched->sched_rq[i]);
>  	}
>  
>  	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
> @@ -1160,6 +1203,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  	cancel_delayed_work_sync(&sched->work_tdr);
>  
>  	sched->ready = false;
> +	kfree(sched->sched_rq);
> +	sched->sched_rq = NULL;
>  }
>  EXPORT_SYMBOL(drm_sched_fini);
>  
> @@ -1186,9 +1231,10 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>  	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
>  		atomic_inc(&bad->karma);
>  
> -		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_KERNEL;
> +		for (i = DRM_SCHED_PRIORITY_MIN;
> +		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
>  		     i++) {
> -			struct drm_sched_rq *rq = &sched->sched_rq[i];
> +			struct drm_sched_rq *rq = sched->sched_rq[i];
>  
>  			spin_lock(&rq->lock);
>  			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 06238e6d7f5cda..038e1ae589c718 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -389,6 +389,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  
>  	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
>  			     &v3d_bin_sched_ops,
> +			     DRM_SCHED_PRIORITY_COUNT,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
>  			     NULL, "v3d_bin", v3d->drm.dev);
> @@ -397,6 +398,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  
>  	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
>  			     &v3d_render_sched_ops,
> +			     DRM_SCHED_PRIORITY_COUNT,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
>  			     NULL, "v3d_render", v3d->drm.dev);
> @@ -405,6 +407,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  
>  	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
>  			     &v3d_tfu_sched_ops,
> +			     DRM_SCHED_PRIORITY_COUNT,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
>  			     NULL, "v3d_tfu", v3d->drm.dev);
> @@ -414,6 +417,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  	if (v3d_has_csd(v3d)) {
>  		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
>  				     &v3d_csd_sched_ops,
> +				     DRM_SCHED_PRIORITY_COUNT,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
>  				     NULL, "v3d_csd", v3d->drm.dev);
> @@ -422,6 +426,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  
>  		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
>  				     &v3d_cache_clean_sched_ops,
> +				     DRM_SCHED_PRIORITY_COUNT,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
>  				     NULL, "v3d_cache_clean", v3d->drm.dev);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index ac65f0626cfc91..d2fb81e34174dc 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -471,7 +471,9 @@ struct drm_sched_backend_ops {
>   * @hw_submission_limit: the max size of the hardware queue.
>   * @timeout: the time after which a job is removed from the scheduler.
>   * @name: name of the ring for which this scheduler is being used.
> - * @sched_rq: priority wise array of run queues.
> + * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
> + *           as there's usually one run-queue per priority, but could be less.
> + * @sched_rq: An allocated array of run-queues of size @num_rqs;
>   * @wake_up_worker: the wait queue on which the scheduler sleeps until a job
>   *                  is ready to be scheduled.
>   * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
> @@ -500,7 +502,8 @@ struct drm_gpu_scheduler {
>  	uint32_t			hw_submission_limit;
>  	long				timeout;
>  	const char			*name;
> -	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
> +	u32                             num_rqs;
> +	struct drm_sched_rq             **sched_rq;
>  	wait_queue_head_t		wake_up_worker;
>  	wait_queue_head_t		job_scheduled;
>  	atomic_t			hw_rq_count;
> @@ -520,7 +523,7 @@ struct drm_gpu_scheduler {
>  
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
> -		   uint32_t hw_submission, unsigned hang_limit,
> +		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name, struct device *dev);
>  
> 
> base-commit: 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1

-- 
Regards,
Luben

