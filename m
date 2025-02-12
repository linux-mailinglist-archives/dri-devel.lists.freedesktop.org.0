Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6426BA31B29
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 02:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14FE10E783;
	Wed, 12 Feb 2025 01:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nKdlkw6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D313B10E783;
 Wed, 12 Feb 2025 01:28:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkHbk3vWq/S2MrB3Ka/jeEdxAek41tM8VRqhXIF2HsgplBJMVINFEOyhcg5+13yWKe1euK/Lr/YyNgj5Cmzo/B51CnWvygyjHsoKY4DcjOwXZmcvq/glaDHXLQBvU5gouWPou/BqjPRco/ITKEfXVgeRpyvojzXncKEP/skNgwavlhmiuS0vvZaV9MkHPcYDFcCAJ6crQe2P8ImL0FxWhr5z+zx8PWK2Q4LUkOLNY/T1KNrFw6QnwL/dVSASDUQjX5DTuRusDKTje/hmZykfP3qd4uZYkU6ih6pd/yov1c9w+X9K6tDYjH1b3AGJw2s/5LDG2mqacpHpf4RrqFWXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LYk0XTjomOlJjlVweOsx89sctN4y8OfLcZppQxoPP4=;
 b=oc1ibA7VM2Rw1kAFlyiVmC3OiNU6ws1DtfQU8KA7CNv0gA2dEkurdiy/pYeba33TvJf0SwjZzoXZ9WPo+ATSDTbxLlDrOdXxJfZkdORRmBwbB2jhekwuCUbzs7R6Kbs+U8nPUg+Y9Es6gyBAnkbAMxVk93iu+k4LgCRl+UzCrtqqApvUml6lG1oTujlAoHOKl3qilHz3/qjrlw+GS4W6D1qXxH2UCenVHwiWmjQqSDSd/sXdsWDC0kTsMu38m2S+IFvRkP6+DZiGQ1j4urCJvoK6Ejg0zG/PPR6gzsLxUl8+6HVTyOfmqEqToIv0O27Bn6DYm+g9fNJWDgI0hLdKkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LYk0XTjomOlJjlVweOsx89sctN4y8OfLcZppQxoPP4=;
 b=nKdlkw6jMM5SV6HnggGBwpau+CUP/rNeq5lm20GcjJQMr7VHbZYQBHdeldNwKjPFQgvhgaEa7eO7POHuepQwHY+9F90vhqOpeZ7oNDF1lswtYMdDGLvwbE3+rXl3xCMOENd3UQEaFv4oz6GlUWn5xIOt8U5ejtVK9xv+8Z29ksSC6PjTEQsJpahCeMrTmPaUVRxQMOSNjzh3zFdUWJ12RKdq6dDMhvNRLdNRCfjkDlXyL1M8IWdTCvJ4VEfQ5pCouGXlzMpUpykVKvatyovxq0XlgtCeJq9Fmhj+ROltgPgghxHwg05g/VWIdeViyKielrZzWhObcdIkpeF2hmV45Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BN5PR12MB9509.namprd12.prod.outlook.com (2603:10b6:408:2a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 01:28:09 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 01:28:09 +0000
Date: Wed, 12 Feb 2025 12:28:04 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v1 2/2] nouveau/svm: don't initialize ret in
 nouveau_atomic_range_fault()
Message-ID: <4awlelarrasmkvpjdhnxabto3dr4j26yc2g5qk5cnqcvhrcdrt@sd3cpt7mo5kk>
References: <20250124181524.3584236-1-david@redhat.com>
 <20250124181524.3584236-3-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124181524.3584236-3-david@redhat.com>
X-ClientProxiedBy: SY5P282CA0140.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:205::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BN5PR12MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: 1558211f-0d62-4e70-a603-08dd4b048221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+GB5d1XBZmnBu6W5AIeV9O8NWIPAEDwm8AsAflh+HrTUQ9ijrnV9rWPsBztm?=
 =?us-ascii?Q?gbCC/Le+q2XrWVRxxHQ7MSgRQhnvchYnUi74UWU4a5f/v5jWb2msohN6eee6?=
 =?us-ascii?Q?kp/spynA3x6sUBuh1O3mj1QZGR5ZQ3gMOPswnYiTByvJPJn242xrqpYop1gz?=
 =?us-ascii?Q?J2Qf6aFxA/arGc4raCIiLfhblOwxSEbOo4MB1fwydgdE7Nf8jRijWt1ATHlF?=
 =?us-ascii?Q?q6WD9dsY94uGgLKaZCR7AP2Y3Qfo+XzgAPbgSy1Jt4uyhAwWUXw/b+i4RQ6B?=
 =?us-ascii?Q?o702Z5st1hYzqG35YODZhtXBVrm109xImSEz9n4jYW7+xfNxyO/YJ+OoPWM5?=
 =?us-ascii?Q?CKpKOu3kpygR5DXpD77tV/4ZU6dMM9NPsFJh0l1lijobrX3f0s1XChjHhCmN?=
 =?us-ascii?Q?6reTeF/ulUV9my2FpkRt/ZGawAKH2BpHSjiwnGjxU9YU7Y0ggKWo+l2JRWY+?=
 =?us-ascii?Q?fQxCt61W+mhuainUqCk2te4RY5i3oFDmGDPAxIzphFl2EQnHwT18iP4EB1Wi?=
 =?us-ascii?Q?Sx7WCe32799CmLGxGkyJ7cOQSp1K0jRotOyN64OQT6ofGpkYvH+X1qxx0JT2?=
 =?us-ascii?Q?x44oNRDLrqJagCAJml1n0vo8cNNnAR0smtflX1qapRFBi7tTZNJNILgegN//?=
 =?us-ascii?Q?r69HCSQeA2Wc15hpffbLiyHCHSaUJEnlmInvFhDbU0fngh0yCJK2M3FUBK9M?=
 =?us-ascii?Q?MNNWRY/Eg4p4/fve9vpN4FadbSPyuasBGMSNu3WwcbUsMi7Ia7GB/pMiTiCh?=
 =?us-ascii?Q?ljUACb/zFjAk2M6Rdm38tjgjEa8Tx0yrFa7aNiC5GepcwSC69TIO70PsgT0C?=
 =?us-ascii?Q?QlV3d0yv83hxLetAQtoaAwnxlgi6IMxOXncUjv7PGAyW477aoHzkIlMgE52R?=
 =?us-ascii?Q?TN0NvlqDNmzH060/8vRXLjJ0ffl145udCMhqAytj6Wpe4vC7juVCir35ycNv?=
 =?us-ascii?Q?mAD8uTqcgMT/2+Au7b12RN+Y3vnhn9UeP+PpnthBPizmhjQsNXQWTjv6nzaw?=
 =?us-ascii?Q?5kjqdTuBlpUcDV41WGyvoxaA1hXDng5G6ncRVMCuA3WkCYmoSpiVFStvHFH6?=
 =?us-ascii?Q?1LBAtTklA7SeX9AWKJzSF47/tugHKghoeFmtW+FQ/VgopTzYwhzoQ7hXADdZ?=
 =?us-ascii?Q?F9P02zn7C9qY3NuP+OoqHbQi+gaeT64jq9M76tYUZrICHWJnDuScenH/VGlz?=
 =?us-ascii?Q?C2uoRlXw5dMR7EPVE1HJdqpEPhDWHPLD6JyK7hRBo4Zdu39rTFwsT80GTdaC?=
 =?us-ascii?Q?ufjzfPL0X3Tt/ozoDPCregMq5E/ZjRrXUplbYI6f7sQnR26CRpfW6h1pXHID?=
 =?us-ascii?Q?qkZ7iHcHULuGq2YOLH/TKgLjPuU7XFaAApDbWc4DRnMeKaheluLJMyQfM99m?=
 =?us-ascii?Q?PG0cIYMLKxoGoo25hLynGwi6D/Zw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZrD6QMoROEIKK9LVeHBDGAxTbNg4bfqqIKLKiIG8oS4ARefKsqlJghW62N+F?=
 =?us-ascii?Q?x1PqcocLbQH/jfmHQbJEwpH6fCl/zzVDUOv4iejf7T7tJanuYnp10zJ1jBfl?=
 =?us-ascii?Q?Go57rQrHta26gjdiDQsCzKkeMh2vMYoSBdgG2P8u6IA2d0gv8hqvl3s9OeCl?=
 =?us-ascii?Q?7Oxjd2QP58/8B61FEG77/m0ER9/GzJRu/TweSV1iRLlArnEledy8Tdx7hRyH?=
 =?us-ascii?Q?UOnMfVSy+4mRVva67oZPtnYDVstCUJ8MFd/1LcpnBo9N4TVB5uEGdR3VbJAU?=
 =?us-ascii?Q?HTmbgZCQJ4hTBu4so7xGc80JPxv8rgfR6RDMh2cVMCEoBpUc79rXRM4VuoC+?=
 =?us-ascii?Q?KLvQnFk/An49O4PflfZKAK9L6Svk2lX1gqPnYpW059a9swF/xHxeIzkMrx16?=
 =?us-ascii?Q?UMJnbFi3H3iHwh3J6ZFhv7KOOL0uQhYZH5dp921gpwNyM9qO41UB2/fzr6i5?=
 =?us-ascii?Q?Nl6xFC+jm/rlYhFGyGbmiN+zIaH65Fa2STu8qPG9eWwtG2HARVvM9UZJtffy?=
 =?us-ascii?Q?6MomBh4omyVcrGcPKiV91iJjC5fkpMgFzureDCBoNYO3q4LgTRYo5nYBOin+?=
 =?us-ascii?Q?DsQi6vPmMkFhZjRjbqMJkDIb2237B2qpqO8CamJDx1riPg7X+M0elTg1Lm8a?=
 =?us-ascii?Q?KC7mg+YJgOM9eAb/YpvQzC0Zvte1KHn5c0DxLwJR1VJ+35YMbLmwaogMVxje?=
 =?us-ascii?Q?nN7/Hb3M+Kv3sAG+w/dh0Y+mJBYvPGmLTBUR2fJ01b5UrdmNkq2wZLWtdX43?=
 =?us-ascii?Q?EJGKELu/s6OeFoJgagGrEFnC7BOL4ghQVQUJTLQepZnlVK0Zr985MZ6/+D/C?=
 =?us-ascii?Q?YozUzBsU/X1mOEvRhuoNDukbfuyz8fkpqetioQSUJPoNM9zvmkLzbR6tWh1h?=
 =?us-ascii?Q?Pozpo+Q4f18cTwl/i6el4NGkP32+48ywNc6vNXvbfnjmIGLwy/a/VaWyR7O7?=
 =?us-ascii?Q?7N3fJQzY7ueqT7Fo1ONNputNLuY7guhF6yZJEqgRozbKg7PJIyyez9fuQhNp?=
 =?us-ascii?Q?nPwxTIwA6mQ2rM2m1ZVeasoVMkkDGvXd8ubSQz5X+Pf1YMvLTNYzw+siHJ+e?=
 =?us-ascii?Q?VrmrAasW9+L1yEiJ87mgOOqpp6qv46ItsBxSdZ1NLEwsgjlalUsufdb59sIK?=
 =?us-ascii?Q?3ikaeYCveCPTtlGaNMVTwSV5mnx0qvp2bIfP4qYSAdQcjHzENb5Y7yPMh8hn?=
 =?us-ascii?Q?IO/dFo8G+m6vvB1RvXVj4feCCiXMhEdkd6wa4AEuxqqg9m70qcxlbfeRFbXq?=
 =?us-ascii?Q?6byDjo9XlThZ7rCbfaGi3Z8uadUYnfWOBbkRHWxmFAI3at96fvPWLhKaDC0S?=
 =?us-ascii?Q?qK8MNAnh25SoceboKZ2zUEL2JR85atBSFi+1Tn5qTr1HgrGFu7Wo1YHSbpBI?=
 =?us-ascii?Q?80QAyKOTKw4Z/SfDxS9SJ6QxhUw5BIFvwudJdEkf2akNpnmsxyEBLNuH10Q1?=
 =?us-ascii?Q?WVH5OBnVeefvqBcR2/iKG7BJ1BXcuZva4ufx3BfWXQ0viV0Xo3C2duFKrQ4f?=
 =?us-ascii?Q?hTbrwvCq8xU3zy94uaZDCm2AH+eRd38nOVg9NsOJFVGeQC88E1aItDNbjhmI?=
 =?us-ascii?Q?d4G1Bxh8l5C6H7PWsJ6g2ofZk8ENoDbUb6Eg9aUI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1558211f-0d62-4e70-a603-08dd4b048221
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 01:28:09.2786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vu8bXmx5/CZMnEA5EqpZGMp5k3Uo7xRm190VPlsMRmBugfycUyXBivrjqPZR5/9SkmxT8gHRBsJrw0RasAAADQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9509
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

On Fri, Jan 24, 2025 at 07:15:24PM +0100, David Hildenbrand wrote:
> ret will be modified immediately afterwards.

Yep. Thanks for fixing.

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 8ea98f06d39af..2f8b8b978fc08 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -594,7 +594,7 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
>  	struct page *page;
>  	unsigned long start = args->p.addr;
>  	unsigned long notifier_seq;
> -	int ret = 0;
> +	int ret;
>  
>  	ret = mmu_interval_notifier_insert(&notifier->notifier, mm,
>  					args->p.addr, args->p.size,
> -- 
> 2.47.1
> 
