Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7C54267B3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 12:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBECE6E0D6;
	Fri,  8 Oct 2021 10:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDE26E0D6;
 Fri,  8 Oct 2021 10:23:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exEF3EZChuk7DDhZbovqhdREXthr5tmfQZVb+B9+J6wRTPtB2Y8THpey8NWyYwEdAQSHNZU+4ptHJrbB2lFQ5elC6m/7BlHi7/mMlCPcB48E4PbhRr+kJDe8m6e2OCHC5/ApdDIcKk3y8ERW38xQkSPMT4P99WFPQ6k0KHIVDqx/b3j9kwV5OiJzEUT4vt7lYFkb/h/1uhUxUy/GC9PP5M8HbqZxs8oJrPm5TKpXBm4oO5+mKGMy+eVp4nDAWuhd/7EwrdYIfaSPlwG+R43FueK//sBn0S1H+eYh/LZY1gAfU9VENhtKPNRp5lzrqVBI0U3VSJgmUNrz+PgiPONg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejfqVAbzAkQpPdjb2xtz1+xitV5/K5CvkYcT12ekrfg=;
 b=OnzZMt63jzFuecg/zPBFObKj27nZYT6JDSwcLEjPNw3mdL6VtnjnpxETEN7UkUktVVNIb/H/x+8+k3WHBemjB4Qic20RglgcEsazvSHJ+POXf/N2nhFJHGRbRlQtHmpfnqt1ij3pi4GrwAAUpStKvhJSg/dDsGLyAsjoC16zYrbhYd8Q1YhQefvonAeZauaad/RFjbYkiRIrDwJCQqXvNTMn0b8IZ8h/h1022Hexs/85CxQ61Gqu21TciSc90mSjsDKHH2dqQroRnCmHeGNC1EJkcjvtzgWUmJOjo92t3vVi4Lz+xmPi0ioxvrbMUGmr1nxOTUvjUXLLwNS1y2ow6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejfqVAbzAkQpPdjb2xtz1+xitV5/K5CvkYcT12ekrfg=;
 b=LFmPadzYIrXs2eE03+zZ7N+v3pzYKTIRrRBLUJSF2wceMJvo45EUZW8wnrlOUawY/JWsavWko6EyPt3jbiYNNuk9UCsrhcWuXoGCnMV6pWI2Totzv3dRgmpTtdpkq+BoAWFKuBdktesodCRMrJZ0n3xVgORCSuTWNPsJinYh4eY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4457.namprd12.prod.outlook.com
 (2603:10b6:303:2e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 10:23:19 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 10:23:19 +0000
Subject: Re: [PATCH 3/5] drm/radeon: check dri root before debugfs init
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
 <20211008091704.27094-3-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <221c5237-6e7d-11d2-1de4-39e77c539663@amd.com>
Date: Fri, 8 Oct 2021 12:23:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211008091704.27094-3-nirmoy.das@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR0201CA0017.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::27) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:efac:61bc:bb73:d6b5]
 (2a02:908:1252:fb60:efac:61bc:bb73:d6b5) by
 AM5PR0201CA0017.eurprd02.prod.outlook.com (2603:10a6:203:3d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 10:23:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20e37e46-6ae5-49d9-12c4-08d98a45a60d
X-MS-TrafficTypeDiagnostic: MW3PR12MB4457:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB445797EDC255F3DE6D7124A583B29@MW3PR12MB4457.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vM9gUmip5pjN0Yeun7sG7ZqDq0ZZreVVtAEX7ofh1QsNxb5e1Bo5e9kqJyPVibk/TOdb4NJmlx0lA9Cj+QgmjHcForRAad+xNtPgdIvWVL8WNEv0+dRto14e25Ylg17T1rr6PCKGENDirLZ6EM4kx6eEavi7V6ELYRHOPE6/UAeHuNI0XsOUddnkuKvIDExX0NLZXv1KlYv0szOlcZQxtfbMBXb2dKXZaAFtLFpMlsVdUeiHGwVvmDrllEnFW5I+Au+OYCVleQvoFh6F9dsHfQQlshhZRNHJ2lanfu/icGG7dGN9OguAbzzMbNFnc3AZYlqNedy03eccUTxxPeGGYgkasgBXZmHm1zn65ugPFUXQJO1qf7BK4yvDrjB7y39y45qlvpb9hJNa/io/eAJUXttXgJ4VXZgITw6i1L7+CaGx0/6Rc/+glKAaUtwpW8VBYKTQBHryiELVw+kmQRfP5RG35HNTLh+Qy5N2hF5YLxwjfrcBweNaU9QkB6oBe0hGoEoxL4lfSKArH8A10RIg8EJVwCxAZXD53ZcO2G2muim7jEKzsvIGHbjr/+z63xcDqW3GcmBWGD1/mmVV/QFIaCPMM8UHz3t6eYseES5aLpfe9XNO0xRnBMWXib6/AgJKdQB3jQR43ghlPTFFn4QySDgaKpGdQJKB/jswWB6PZTGWLfDg5wy3AUo+AgdEEEJgTws0DgBhIKI9/Ly2nzzaZiSA4AkucPKX0fUuZS6tYyb/UpoFsNrIgThjEGehMUjF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(31686004)(8936002)(2616005)(38100700002)(450100002)(66476007)(4326008)(66946007)(5660300002)(36756003)(54906003)(83380400001)(31696002)(6486002)(66556008)(86362001)(6666004)(66574015)(186003)(2906002)(8676002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVJBNWxSNGRRYk1NdlY5eWQ5UDhLeW5rbDBGZFlOcitBcjFPS0Nnb25PVjNL?=
 =?utf-8?B?YWwxa0luajdLQW5OYmN0eTl5bGlOamQydGZlQ0pFU2N1bGxGTjBQNEI1NHJs?=
 =?utf-8?B?UGEyaDdaWVByRCt6VHpXalh1OXd3VFRUMHBNVmhTRDJwQUkvaEJCRzZ0bkdS?=
 =?utf-8?B?Vmd0TUlhT083RUVxTWpDMHZIK0tDZlJhZGFOcWp3TThlRDVYU2FVTDZPeU9Y?=
 =?utf-8?B?YnVVZTdNemlRWGt4NW1nWk5xMUs3ZnBVUWVabTVRRU50aUZEMFJ1UkFtNWhG?=
 =?utf-8?B?d1JDOEZYcXNZbHV1SkQ0WUt6eGpveXV0WjgvaWF1R1BsZnZqa2hoZ0tCUXFm?=
 =?utf-8?B?bmh5L1A1R3FpYVV3Z0tORTNxb2pPR3Q1czVSVXovNytIMHh4T05aQ0I5V1Ix?=
 =?utf-8?B?QUwwaW9HVHFSK29BcXU5SldJTXh1RUlabWUzTzd0Wmc5UENhaGxtR3VlNVdB?=
 =?utf-8?B?bE9VeW9FL2VDWU9BemFHV1Vua3BvYklCR3k0SVF4QUhWUHhJbFR6eVpqZU5Z?=
 =?utf-8?B?TnpOcE1ZYlJIZHRWRVFYZzZFU00yazRVMGl2VVZOTi94R0VqL0xUU05CbXdm?=
 =?utf-8?B?VXNoY0ErNUJYbmVod2RqNE1pZmNieUNPTUk2SXNyVE1Mc3prU0lOWnl6UGU0?=
 =?utf-8?B?cGdIOG1aamFWMEliNlJzRmFWRUxiYmlVTnlkeVNTQk5HeDVQdDZWY2UxcHc2?=
 =?utf-8?B?RVVsV1YxMmc0eFdvcll2U1Bocjl5REtZK1p2aUV2R2hadWlYektnbGlZZ285?=
 =?utf-8?B?azRzalhKTUpqTmdJOHJLSmhLMzBEeVNOaEZua0NuT2lRY002RDRQWVM3MWhn?=
 =?utf-8?B?VFhqMDJkUnZheFdZWklHMlAyeTNMNkxuUkZFREJscHcwTERlS2dpN1FLK1or?=
 =?utf-8?B?bW1YbzFDcVRwaVJEbFh4Y2xSOFE0bW1JcHQ0TzIxRGlUVkswQkpqdVV4bGYw?=
 =?utf-8?B?KzNDMFZQenoyUUw5anltRkNrelNlVk1KRi9wTTAzZkQ4QnBybjQ2dFdzVzNl?=
 =?utf-8?B?VlBDRDdzZGI5RlhyN3RWUmkxd3FpQmcwNHdrMjFTT29hcmhXdXFKVjZCd2RY?=
 =?utf-8?B?RVRpT3JFNVpsbHJISis2QlN1aGEzcnpoWFhKeituK2s1NW5Bc0JwWS9rWXVl?=
 =?utf-8?B?VFQ2S2xGcmpPZ2JGallOVWVrUXk1Z0hhaTZwd3pTcWR2TllEMFlVMmdsU1dL?=
 =?utf-8?B?UHVwSzNPT05Yb1YwSVpFZ2p2UkVLOEY3U2VOSXlvSDR1ZllqWGl6OGJYbjVV?=
 =?utf-8?B?MEdBVHVQZVZwM205Z1AvRzhFc3pZYUF0Sk43eTdybEwwSGF2cjg4RnZsWDZw?=
 =?utf-8?B?eGhKL2JWNGtCUE5STDB4S2xwYzBSSTlJVXRZMFNPWnh4anFVZk5PVGZiOVJv?=
 =?utf-8?B?Zmd2UEpFdHdkaGJKSzVBeFI5bTRsRkxDRHpxMTAyK0xFb1o4aFYvT1RST2c1?=
 =?utf-8?B?OTBIeXdrZitDZDk0cDBsa09Eek1YaytuTllNS1ptSUlIRjVMcTEvMU5XWlIr?=
 =?utf-8?B?N09HR0dIWGF4VEZ0cWRDSFVoc2VVK05JeGRnVDloN25tdXZCUlU0ckdCUldM?=
 =?utf-8?B?b2phSEUxdUhmTTR3eTUzWmp2VmdaOWZURXkyZmJzTmxVQ1MwRGhDaVhSTUxU?=
 =?utf-8?B?QzBCOGFINlUvelRzeGJIV1E0bnczWnZ6MTlpS1RyeDJCSFlIT2MySmhpMzVv?=
 =?utf-8?B?eGhoUHZJeGk3eEpVRCs0UEZ2SllqL3NXOVZvQ3VmQ01pVlBHbUxaZmZQZ0t0?=
 =?utf-8?B?aFZwbDkxV1lOMXNuSmlZdUo3ZzRXaUp5VHNNNGlDU1FwYVhZeTE1YXNScm84?=
 =?utf-8?B?QzhNREpraldGMlMxamRMK2JRdmxaVVB5Z29OdGRMR09iSTBwbnFYWVA0dzRv?=
 =?utf-8?Q?Y7F8gQ27Gk2+C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e37e46-6ae5-49d9-12c4-08d98a45a60d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 10:23:19.5465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJfiX+TwDZln/6VU3hrXf5vAZj1SydNylyjNEMpb8HN4UPde9kRn/DNEK4mXDFW8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457
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

Am 08.10.21 um 11:17 schrieb Nirmoy Das:
> Return early if dri minor root dentry is NULL.
>
> CC: Alex Deucher <alexander.deucher@amd.com>
> CC: "Christian König" <christian.koenig@amd.com>
> CC: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

Where are the other patches from the series?

Thanks,
Christian.

> ---
>   drivers/gpu/drm/radeon/r100.c          | 9 +++++++++
>   drivers/gpu/drm/radeon/r300.c          | 3 +++
>   drivers/gpu/drm/radeon/r420.c          | 3 +++
>   drivers/gpu/drm/radeon/r600.c          | 3 +++
>   drivers/gpu/drm/radeon/radeon_dp_mst.c | 3 +++
>   drivers/gpu/drm/radeon/radeon_fence.c  | 3 +++
>   drivers/gpu/drm/radeon/radeon_gem.c    | 3 +++
>   drivers/gpu/drm/radeon/radeon_ib.c     | 3 +++
>   drivers/gpu/drm/radeon/radeon_pm.c     | 5 ++++-
>   drivers/gpu/drm/radeon/radeon_ring.c   | 3 +++
>   drivers/gpu/drm/radeon/radeon_ttm.c    | 3 +++
>   drivers/gpu/drm/radeon/rs400.c         | 3 +++
>   drivers/gpu/drm/radeon/rv515.c         | 3 +++
>   13 files changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
> index 2dd85ba1faa2..ae6c95b34013 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -3059,6 +3059,9 @@ void  r100_debugfs_rbbm_init(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("r100_rbbm_info", 0444, root, rdev,
>   			    &r100_debugfs_rbbm_info_fops);
>   #endif
> @@ -3069,6 +3072,9 @@ void r100_debugfs_cp_init(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("r100_cp_ring_info", 0444, root, rdev,
>   			    &r100_debugfs_cp_ring_info_fops);
>   	debugfs_create_file("r100_cp_csq_fifo", 0444, root, rdev,
> @@ -3081,6 +3087,9 @@ void  r100_debugfs_mc_info_init(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("r100_mc_info", 0444, root, rdev,
>   			    &r100_debugfs_mc_info_fops);
>   #endif
> diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
> index 621ff174dff3..b22969e2394f 100644
> --- a/drivers/gpu/drm/radeon/r300.c
> +++ b/drivers/gpu/drm/radeon/r300.c
> @@ -618,6 +618,9 @@ static void rv370_debugfs_pcie_gart_info_init(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("rv370_pcie_gart_info", 0444, root, rdev,
>   			    &rv370_debugfs_pcie_gart_info_fops);
>   #endif
> diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.c
> index 7e6320e8c6a0..cdb4ac3e346b 100644
> --- a/drivers/gpu/drm/radeon/r420.c
> +++ b/drivers/gpu/drm/radeon/r420.c
> @@ -494,6 +494,9 @@ void r420_debugfs_pipes_info_init(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("r420_pipes_info", 0444, root, rdev,
>   			    &r420_debugfs_pipes_info_fops);
>   #endif
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
> index ca3fcae2adb5..d8f525cf0c3b 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -4360,6 +4360,9 @@ static void r600_debugfs_mc_info_init(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("r600_mc_info", 0444, root, rdev,
>   			    &r600_debugfs_mc_info_fops);
>
> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> index ec867fa880a4..cf06da89bb7c 100644
> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> @@ -771,6 +771,9 @@ void radeon_mst_debugfs_init(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("radeon_mst_info", 0444, root, rdev,
>   			    &radeon_debugfs_mst_info_fops);
>
> diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
> index 73e3117420bf..11f30349de46 100644
> --- a/drivers/gpu/drm/radeon/radeon_fence.c
> +++ b/drivers/gpu/drm/radeon/radeon_fence.c
> @@ -1006,6 +1006,9 @@ void radeon_debugfs_fence_init(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("radeon_gpu_reset", 0444, root, rdev,
>   			    &radeon_debugfs_gpu_reset_fops);
>   	debugfs_create_file("radeon_fence_info", 0444, root, rdev,
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 458f92a70887..e6df1451af37 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -890,6 +890,9 @@ void radeon_gem_debugfs_init(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("radeon_gem_info", 0444, root, rdev,
>   			    &radeon_debugfs_gem_info_fops);
>
> diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/radeon_ib.c
> index 62b116727b4f..28316eb4fd49 100644
> --- a/drivers/gpu/drm/radeon/radeon_ib.c
> +++ b/drivers/gpu/drm/radeon/radeon_ib.c
> @@ -311,6 +311,9 @@ static void radeon_debugfs_sa_init(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("radeon_sa_info", 0444, root, rdev,
>   			    &radeon_debugfs_sa_info_fops);
>   #endif
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
> index c67b6ddb29a4..c09e574d04f0 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -1958,6 +1958,9 @@ static void radeon_debugfs_pm_init(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("radeon_pm_info", 0444, root, rdev,
>   			    &radeon_debugfs_pm_info_fops);
>
> diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeon/radeon_ring.c
> index 7e207276df37..31a5b1ebf7c9 100644
> --- a/drivers/gpu/drm/radeon/radeon_ring.c
> +++ b/drivers/gpu/drm/radeon/radeon_ring.c
> @@ -550,6 +550,9 @@ static void radeon_debugfs_ring_init(struct radeon_device *rdev, struct radeon_r
>   	const char *ring_name = radeon_debugfs_ring_idx_to_name(ring->idx);
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	if (ring_name)
>   		debugfs_create_file(ring_name, 0444, root, ring,
>   				    &radeon_debugfs_ring_info_fops);
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 11b21d605584..2e18ec93768d 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -942,6 +942,9 @@ static void radeon_ttm_debugfs_init(struct radeon_device *rdev)
>   	struct drm_minor *minor = rdev->ddev->primary;
>   	struct dentry *root = minor->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("radeon_vram", 0444, root, rdev,
>   			    &radeon_ttm_vram_fops);
>
> diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs400.c
> index 6383f7a34bd8..b41a903a29c3 100644
> --- a/drivers/gpu/drm/radeon/rs400.c
> +++ b/drivers/gpu/drm/radeon/rs400.c
> @@ -380,6 +380,9 @@ static void rs400_debugfs_pcie_gart_info_init(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("rs400_gart_info", 0444, root, rdev,
>   			    &rs400_debugfs_gart_info_fops);
>   #endif
> diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv515.c
> index 63fb06e8e2d7..f39b6ab554f2 100644
> --- a/drivers/gpu/drm/radeon/rv515.c
> +++ b/drivers/gpu/drm/radeon/rv515.c
> @@ -257,6 +257,9 @@ void rv515_debugfs(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>   	struct dentry *root = rdev->ddev->primary->debugfs_root;
>
> +	if (!root)
> +		return;
> +
>   	debugfs_create_file("rv515_pipes_info", 0444, root, rdev,
>   			    &rv515_debugfs_pipes_info_fops);
>   	debugfs_create_file("rv515_ga_info", 0444, root, rdev,
> --
> 2.32.0
>

