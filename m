Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A868A60714D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8E610E61B;
	Fri, 21 Oct 2022 07:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E99D10E61B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 07:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoVpR2Lg3v80VIyBBc0ji2WlFtRVeyuPqRGSwiGKqmsf/VxBNljnv+JSlIRyxV5rbh4y5NXOgrE6NJeqUtWJx8uG/ZdICieMmzIwUK8ki1vO/YbK8+UwCXe7bgE1PJ94L8V8G9tOHlhVn0lrqb4JCkkH7e7FJDoAbLrxpY8mi+8OVXvPdFiwB/i8QNgPeqP3hmCLjcGz12Tc9Zpl83NUBe3B6pRX5YnJnc+ZOz2qBlttQ1/3RWCU4DJGn0fYmhxN90VyFay+CWu1ujCxnfmjR1+wyFMpWWEmry16Gdex32PeSWTKR2TUSzwYXI4mQkKzMEDdcZn9hn/ucr90Fbqz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0WZ2JXBWreUV+pHrsIVHF7IGTBQQfDqyVTZk8KzSfc=;
 b=gU21xgQ8yskOCpJOAnrOnDaARZx4ZBqfDEmcpni+rukMTh+rFTuUfP8boXxqBEP/j3L5epJpta/kyUk8LIXmXC26ZXWOksbBglQUtrztte6A2HGM88JWXfOllYSb6teVHq2pKPQK2JvUbLIaJUPzXmcm7L5AOz3rn1Dfa/nvXfj3lTHiw5U0V4cqSVREAopXPh4A2Knxwm2AY+QZ36qQqfkn0RB9KAY9+/iUP5q2/BCxPMqh2jM4Sot9UgcUzlmuLI8YWdiiz+Ux8+zrDEyqM8CPvKy83beUgy/auOpnICM2kt9mZrcd/ZKLnkHeHjONc1V7kfwh+QK1+RjkIzShGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0WZ2JXBWreUV+pHrsIVHF7IGTBQQfDqyVTZk8KzSfc=;
 b=DBg6MFsBH0ALhcxJx4iafN1WuOMiVrvwJEXzSqvKGM4Vh+zqsRFZkK97wRbQLXXyQJQqXgk/JIPqEeL302lfovAOzbr09uBL7vyY8rkXnztDPJMgYA7yj/PIwDWMSg+SPHfCEPQ0IO3VfEkFanmpl14Q++emAe4H3nJPspcNSOb39tiQkAMAreyC6Nc3rgVHrvt3gcNAALAKeE4NuPMI7lQFmEZW+3mRCMBJenym4y3ABi4jUImYBP0xLsx76J2JTk+pSw7NyF+NGcn4L4Kxs8Ylbt57SGZQ+SNRv+dn5HZR6pHRo1VPggwJppw3Rk65S+rvMoVBPEWFHd/SQl+F7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BY5PR12MB4887.namprd12.prod.outlook.com (2603:10b6:a03:1c6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 07:42:02 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%5]) with mapi id 15.20.5723.033; Fri, 21 Oct 2022
 07:42:02 +0000
Message-ID: <a494905d-129d-afe9-1b06-5b35e67aad6b@nvidia.com>
Date: Fri, 21 Oct 2022 08:41:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] gpu: host1x: Avoid trying to use GART on Tegra20
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com
References: <39c44dce203112a8dfe279e8e2c4ad164e3cf5e5.1666275461.git.robin.murphy@arm.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <39c44dce203112a8dfe279e8e2c4ad164e3cf5e5.1666275461.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0199.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::19) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BY5PR12MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: 85db7fdc-9291-42db-773d-08dab337be34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S5wCeXQ9Js9U5wqBjXbUm/S7P6H065MoMTyZZItjVRIWpnwVfiF0GryGSnOsiU8dX6xPxt8ZOemHGosyYPGaiG9I91MygHKIfIr/9burC8O3RgoxEW2yQWOOiEW7LwlnGcqQpN29vEGFuXlZ+7J82blp2bm2bQh10VXeZIaOHZxe4u6hNm4zEe0QK8l4JWqqZzaIlDtXIWWizibsSYbXGoJ4Lzt8cUv6kOWI6tufBeEoYCJAZ5/QNqNsEJiYxooX12937Hs/0luGdrUnq6NOicBeAb4BhDoX8YnuLLNiFsLvQAyRj2z2+GuOk7naw9TTAADBk1x/5DDp5798Gt78UIikVZqQdbPADB6Oab4axVu7QhiTwOzqU/XpdEeqKse3C2VMXFgR2zDqlXKYPp73m0wRobxWJIXKbsMjfHvWOHQpZrvDq/doDijYMzcEC46AySRenf1CxjOE4iGiT5Y1FUCJWo0hflKi6zd+IPfjxodr9WetcQp80psSCrGd14hy4CbItwfRlc6FypXLleX/JurqCUSoigwJFIKhPQBmgIftD/f1Idy3YsRPZmc9waUOr4j5mHnQFxCkFHPVRTl3AVJmoX17IgDfkx0Ki58EaD7BvQUaxJsUDdeZ5CGUIxzp+vbYxowu8WEqgtmNzXTKkEHMWAH+srRLggZa2NdyUuHMP+wR4hOaLYBUwOHrPWxwBcfZnbmWuw5sJfWYX+XvTgtXrp+rs/3x6IwXn2l7+RPY8eKeEh/pFsc7KsJd3m1gsaT4gK6+y11GEI5MGKGylKf++2k6fjLGhU2dewCsMejZb2em98nBTNXSkVQMDgom2r8IIF4sveTigVDVD1DsIFKBs6vWy1fu9gciqYvHqnE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199015)(8676002)(186003)(2616005)(2906002)(31686004)(38100700002)(478600001)(6486002)(4326008)(6666004)(53546011)(66476007)(83380400001)(31696002)(66946007)(86362001)(36756003)(41300700001)(66556008)(6506007)(8936002)(5660300002)(6512007)(316002)(32563001)(45980500001)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE9wdWtiL1ZWZE9iSDdESE1oa09zY0JvUzhhMzcyQVlrNnYvYnNVRUM1Tmg4?=
 =?utf-8?B?T2hSdXVzNXhDOXRwbGhPNHVmcFVyVi9jajkvb0hMRTBkY243SGFzS2VxcHpE?=
 =?utf-8?B?VmJBM3F4dGYrczdGVkhoTUJOdUJhMEtPbVhkVDJXaW5lUTl3d0V5azh2cVdV?=
 =?utf-8?B?WERWRTNIY3NqaDlPOGdJYmgxWlpxcE1UZWVnbmkwdFAvbThhQnZXdFh3b0FC?=
 =?utf-8?B?cUI1MGMvYzZQVlN3dHIvcnA3VHVzcWJkQWh5b2VDb3RpWXpjaVJTM1Jhdm02?=
 =?utf-8?B?eVMvVVZ5RUE2RGl0djRXVnlPMGZCOUJSZi83b29LS3FCSjBxNUVVRWNQUEQ5?=
 =?utf-8?B?OHV6TS9McWJyN2lYeksrdGlMaHJHanhRTHgrcjJMczdNYzVyOGtTUlRFRFp5?=
 =?utf-8?B?UDdad3NiV3p6dzg0YTVydmRscXV4bGpGbmlvOHllTkROc0Uvb000OW9TTVBY?=
 =?utf-8?B?ektuOGkxcm9mcFJ4eUFPWWl0N3hsL2xwcG11UHErbCtjdGVTaEMvSlUzVzRR?=
 =?utf-8?B?V3ZFazRJQ1IyUDh2N3N3d1BSemNGSHl6T1hWM1lSUlREL0RMN0h1Mit2YUc1?=
 =?utf-8?B?MjdNNFRrOUZyeHFQSWNwWkNzR3dNeFhueHFOQjNDUHYvd0NwZDhBUGtIeks3?=
 =?utf-8?B?U2g3dzBxakgyMUNaeklwQUFGMjlPNmlmZ2RBSWIwWHF4WmQ5YWFkd0xvSCtl?=
 =?utf-8?B?SzR3OGQ1eUhkUjNkQ1BEU0FaWTUxeXd6RWE3U1dmcVpibXJoUGdLQ3pRSlpj?=
 =?utf-8?B?WHVmTjN5b090M3E5djFnYVZuQk5WcmM5eDg2eHY5VFZHZjZKbXBkZ01MRVZp?=
 =?utf-8?B?N2ppaVc5RFBQTmQybUI2ZW0rNm1rQjBUSENCdVMwUjBGTkc5UE5maDhKdzJE?=
 =?utf-8?B?RndyMm9Vb0xLQ3g0VEhISnNMWW90MEpKeDhYYXcza0JPMTZkR0owbHdJSWda?=
 =?utf-8?B?TC9jcjE1M0twVVRLVGFQaGxYa1pGMVdjN2dRcVlkM0szNTY2ZnJDd0t1Q3Fo?=
 =?utf-8?B?M1dNRUtzK3AzUUx4Ym5taVRQN3F1UmFudytieVlrREdNODlUWUt5dW5GZUR5?=
 =?utf-8?B?UmRuTmVSTGpmWjNLUHpiUWtNZVEvOXZVVnF0WnlkRHBwVUhIQjJPZ0thMEJa?=
 =?utf-8?B?OWRDakFhN2F3d0J3R0E0WktCa0hjbGlpUDRnb1owODJ3TWh6Z3A1YzFNS2lY?=
 =?utf-8?B?TCthbDU1ck9ucFhRTUFYZVY2NXBVRXhXU05tVlhLSTJEL1Ira2Fjd3FpSTl1?=
 =?utf-8?B?RFg3VFVzYnVXeW50OHFSVlVHNTRQMDI2N2E1ZDBGTUlDdGtxY3pVdlZTcEM4?=
 =?utf-8?B?cENXM09RdDIwek5mb04xeGxkU2pqU3hDem1UU3BzSUJUMTQrbTQrVzFGTkN3?=
 =?utf-8?B?WXVVNmRVZXdXc1VpS0g0R0pzVGdHWGxFRW1UMkM1bGdIVGRGTGtrZDNjdnJj?=
 =?utf-8?B?cS9QbFp6MGoya3dOeTV1Rjd3SzRhK2NGOE9SZGlYNjR5bGYxY1Z0RWtSN21S?=
 =?utf-8?B?cVlDTmkyZmdJUmd2Q0E1cTkzNnVDWDN1VGFGeVhtSUdpUm96QlBlMHd4VXVV?=
 =?utf-8?B?UUJta2F2RFl0ckRjeE54MHFqdkZtRzNTTjVrSFVEYzJKNmVtaU9jQ0xkeHVS?=
 =?utf-8?B?akNjbjFJallnaXY0WXBjNHkzd1NkY0VQN1NvbGNyN0RZdDlJTU5ac1o1NnRl?=
 =?utf-8?B?OThycFRITzdlZWxLY2pOZktWczJqZUlpR2FNMUVKYVdRRG5BV0I3TFhzTURa?=
 =?utf-8?B?Zk4yZjhOSHhpbUMyUlRHZmZZSGRuV3didnVGZzVSc0JlWHhsd2R1blBCUkdK?=
 =?utf-8?B?bFVjMVJNbXFueFEzT1FxNHZ6emxNNFlDc3VPejZSNHpxU2pXK2kzSjBzVzZw?=
 =?utf-8?B?TlEreGdTM0xkOFVsSGFITmZyVGd0QjI1NXlIdEl4U0VhMkZvdFJzRDJNR0dP?=
 =?utf-8?B?UzFscUhSYWhuKy9ZQktMaEJhc0lTeERGbGh5WG9SOUk4cVhVSDVEVXBjRDBh?=
 =?utf-8?B?aFkrTllNc0RibE5HUlFwK1dsQ3RuMDhPdmxJN2VSVnZlcE1DL3ZJL2MwdnRL?=
 =?utf-8?B?V1JjaFp5SDA4TDd1YnhtaXA1bUlRV3BkMTVFYUlYdWlsc1BrRklqWjJ4Um1Q?=
 =?utf-8?B?T1hxMk11Znorb0Foa3BUZUk4RzNydzhnRGVnNXlxN0ErMzR3L0hsVjhBQ1JC?=
 =?utf-8?B?QnFYVjBrRHhQd3d3NDB2MUN1K014S1I5L1hVZ0NseDJmaW0zTUFVcnZ3cDJZ?=
 =?utf-8?B?bHZhbkw5OExTN2ltbEE4bUc2NWpRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85db7fdc-9291-42db-773d-08dab337be34
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 07:42:02.4996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKBKsR8QC9nQLkVcHtjePZquVzeLz1gbICMcCoKbGtkA5XmGhOo5q2fxX6lYIkxXGfbOrSLy76GhBrHannYgCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4887
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
 Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/10/2022 15:23, Robin Murphy wrote:
> Since commit c7e3ca515e78 ("iommu/tegra: gart: Do not register with
> bus") quite some time ago, the GART driver has effectively disabled
> itself to avoid issues with the GPU driver expecting it to work in ways
> that it doesn't. As of commit 57365a04c921 ("iommu: Move bus setup to
> IOMMU device registration") that bodge no longer works, but really the
> GPU driver should be responsible for its own behaviour anyway. Make the
> workaround explicit.
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Suggested-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> v2: Cover DRM instance too, move into *_wants_iommu() for consistency
> 
>   drivers/gpu/drm/tegra/drm.c | 4 ++++
>   drivers/gpu/host1x/dev.c    | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 6748ec1e0005..a1f909dac89a 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1093,6 +1093,10 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
>   	struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
>   	struct iommu_domain *domain;
>   
> +	/* Our IOMMU usage policy doesn't currently play well with GART */
> +	if (of_machine_is_compatible("nvidia,tegra20"))
> +		return false;
> +
>   	/*
>   	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
>   	 * likely to be allocated beyond the 32-bit boundary if sufficient
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 0cd3f97e7e49..f60ea24db0ec 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -292,6 +292,10 @@ static void host1x_setup_virtualization_tables(struct host1x *host)
>   
>   static bool host1x_wants_iommu(struct host1x *host1x)
>   {
> +	/* Our IOMMU usage policy doesn't currently play well with GART */
> +	if (of_machine_is_compatible("nvidia,tegra20"))
> +		return false;
> +
>   	/*
>   	 * If we support addressing a maximum of 32 bits of physical memory
>   	 * and if the host1x firewall is enabled, there's no need to enable


Thanks! Works for me.

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
