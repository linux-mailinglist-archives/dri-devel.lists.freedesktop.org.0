Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B14DB3FB29
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D7310E1C5;
	Tue,  2 Sep 2025 09:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LnyqkrWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F7610E1C5;
 Tue,  2 Sep 2025 09:50:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBhSF53v+3X6Qm6EiO+ZduUHYm1CBcYq/rn3OduEeIYzlya3gKlGFvo/IzxdHj4NZX5KkbudYwj/ue63SgEL4xoyHjus+NhbXHUXeV17thiGJ+ilR1LkdLfAcPHSMAV3FuRCIibkXKZ/UpvbK+0XuIYIUBLv6tuleZq+9j8vOe56HYwu8G9040sE+8DPdeC/ZgSPdMs1Dx9Pu2Iw4kDizNGOhjnSlUuK7HcIV1N0XhKROfatO7gkSCFX6R19OLsGbpY9W5l8tY9IS79+UH+BKsiyBTWCwWu6t/OghP4hgBGzTFKrGBkgjwaJ1N8m08THygv604LRKoQscL+aTI1JpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jug8eCVAVD4OybflX1MC7B0NtNm24qzuOek35HBb0VI=;
 b=W7BWFQuiRy9yrpeny6Pndzxd5Vo7w+x4MfhZ9xMvztmnh7TbR1AZyyOwgW+GysJD8tK/XdbADsL878Nypseit1Qw7pYgJ41HoRgY7zQCHNtNhrZos0yGN/gWiZw54TgmbSnaUWpR1ykMy5IKx9ukTMNwpQj93fHzINWk4l2mP+YyL1j2vimsTvPVnybOPa543DKszsSecfdyfE8O8ch7jus25xn9zWxON8Lq9rluJl0+44hw2fzxJBFUFQK7lWxMB601PiSUlbC3JzYr2bmMiG3sDIzM9CsFw5cO7CeKoVWhjwtZ2qx7F0axyLWNfD7NFjXdVpHgHFwDfJkvR+NyXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jug8eCVAVD4OybflX1MC7B0NtNm24qzuOek35HBb0VI=;
 b=LnyqkrWcdhjltpaIjX67LG2iFEgcqIkddBe1vBHdRJ6xUarWye2qoqE4e35EhpZgP6eB2HqzJHybeVpEyAOnJpPyw/sAPhf0bjPjPaHfebox5Vc/NZrL1K82rmLb6uvHOGafxRlH1jf7xVntOHyuxxtPR+aunBK01hBttFEWaORqNYcLH8e9TJJSxRc6Fs2UCx2+g1yS762rGd6QL/6FkZ3hDVCXXoODK8T8bp74hk6q6X3wuAFTgSoqK7CxBcoNeFC62weK6YUZW/oATmCMISnh90/s+01FSC9JnOfIrmhcsweA2NFJbY00a04pImI7tJKVkYSCmT1c9zHENJZjxQ==
Received: from BY3PR10CA0007.namprd10.prod.outlook.com (2603:10b6:a03:255::12)
 by DS7PR12MB5813.namprd12.prod.outlook.com (2603:10b6:8:75::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Tue, 2 Sep
 2025 09:50:43 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:255:cafe::f3) by BY3PR10CA0007.outlook.office365.com
 (2603:10b6:a03:255::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 09:50:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 09:50:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 2 Sep
 2025 02:49:53 -0700
Received: from [10.221.136.177] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 2 Sep
 2025 02:49:28 -0700
Message-ID: <1ccfeed2-0c52-4a5b-a7cf-3240a39ef3d3@nvidia.com>
Date: Tue, 2 Sep 2025 11:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/acr/ga102: fix NULL vs IS_ERR() check in
 ga102_acr_wpr_parse()
To: Dan Carpenter <dan.carpenter@linaro.org>, Ben Skeggs <bskeggs@redhat.com>
CC: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gourav Samaiya <gsamaiya@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
References: <aLaQO-dpTsHJ-oH9@stanley.mountain>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <aLaQO-dpTsHJ-oH9@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|DS7PR12MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a93208-1492-474c-7029-08ddea062ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFNSbGJmbVYxSTZRUzBGZHNVZ1c4QTVwSWh1RXEvRUs1K2dIckw1VUlxak9R?=
 =?utf-8?B?Tk82OXdlT0p6TmJ4QmNoV3FmZmNFQmFoOGgzem1OVXJZcWRrRUE1c2VoR204?=
 =?utf-8?B?ZUF2YS96YnptV0JNUG9EUHhJZHRJWTE2SytBa08zMFE3NXc0MWtIa05Odlh5?=
 =?utf-8?B?TUhCZy9hSzU4NTNDMDl6czdOQkUrVzZ5dTZnc1JIbGtsSlFvdUV6Nnk0YUdF?=
 =?utf-8?B?dytLOVEwbld3K3RsY1FKRGJvaXByMXFlM3E1bDJoVERGdW8zTmVadFNwaXI5?=
 =?utf-8?B?NmJsSjhGa2FucnhoTjFIOEloby92ZDVCbUUySHY1a2MrckNHcEQ3c1dNSHZO?=
 =?utf-8?B?U3dTcGxadUVySkZTVXF0N0FUZHJRd1lENFp6V25KWTd2Y2ViczEwQXRWa3lS?=
 =?utf-8?B?am1CY0t2aVJQczVKdXdOR1Rvd29NdzdYVGttY1hXMmMxV1A3Y08xc3BmOHdh?=
 =?utf-8?B?MTd0c0N5ZXd6U3FVMUxGRFRrejhmUjVIRUFDek0zdEszY2Q1eDdKeWhicnlX?=
 =?utf-8?B?aTVuSUFpbGtKWWY4ZUtFeUlSODJZaXU3RUtTd05RQU1YOVVSbG02T01pRHF2?=
 =?utf-8?B?TW1uM09sUVFYWjRhOXJIa3pkY3ZNL0xIaitZY2lSRTJFS1NkMlBabVpOcENr?=
 =?utf-8?B?TjlBYXNZZ3ZRN09keG9hMmJuazBldzRsWXRiREowVFdZV3d0aGxMRjMxQ2xy?=
 =?utf-8?B?NkwzVzNyLzN6dE93b1RLUEhKKzBCNlRNSjliVjlGL2ZrTVFRcmJLTkplbUV2?=
 =?utf-8?B?ZGVTUkQzVll1YVFHR3o0TzRWY0ovZjUyYWRvRE1nWFhQQktVM0Q1b1hTdmsz?=
 =?utf-8?B?eFliY1dkUjVqZTlGelY1L2xscVE1Sit3bUd0Skl1a1ZaU2RIMEhQc3lzOXNQ?=
 =?utf-8?B?TnJHZlVNZExiRjZUVDZYenoySmV4Z2lZMHZHNDArQkpHc3doK1BCRUlHZkdn?=
 =?utf-8?B?R3o4VnFGNDhGSFdMWDh4MGgrNUUyWGVRQmVjNm1UQ3NSWWpwVUJDWHorcCtn?=
 =?utf-8?B?WlRNNVZqRDFEaXZnTnVQQzFlZGZjQUVIc1RjZ21zN0JrYmZmVzlxSEdRM1Ju?=
 =?utf-8?B?NmlPMFdIeWJ4dVFDN2tXWDd4Q3VDY1I3ZU1JbnNDQ3h6VXlQK3FyWFRxWHlT?=
 =?utf-8?B?cmtncldWTGRsZGY4WDZmT1Q3MmtBekpoRHUyUzJscWs3bS9uQy9GNEtYZnJo?=
 =?utf-8?B?eWZ6MXJNYVcwSFVGK1pyN3pDN1JndXo2Q3lyU2t4VmdzeHZNSEtJMzJPVXh6?=
 =?utf-8?B?QXNwVmZVeDNkSkVScVlqQ3NHRThiYTZQQlNHZGZDQ2xSVEhkd2ttUkJMUHdR?=
 =?utf-8?B?VFYwQzZHbmhhSUMwUGF6MDBMWmJDbVc3KzdwV0tkUEd3KzRPRUZ6SHhRbWUx?=
 =?utf-8?B?a1IzUm9kQ0JYQ3B5OURreWhpZ21OdllzdVRaTmdWMExtZWdONVVkbnhZcEJp?=
 =?utf-8?B?UFZ1cXllVm8wY2o1eVUveFFpbHZWVWdMRmFvRVBIMFhqbnJXSGZSQ0tKVUpC?=
 =?utf-8?B?YS84UDlwVDE4UHJzaFlNek9uMjlMcW5OZUNBcTQxZDZCOXRwUVlML3ZmZXA5?=
 =?utf-8?B?NU12TDA5QWJHKzBnZTY3ZlJLZnpqY0JqTThpNE1lZnR1NG9MNS9BZSt0RFZa?=
 =?utf-8?B?emtrZi9RUHFzMDMveWdtVTV3cmNBWXphWnY2RXRuMDRVOURpTGI1WGpodDJ5?=
 =?utf-8?B?QVludGQvS1VLNTJtbFRDdUppOUlwVVVUWCtBWGEwbmpOc1ErTG12eUdNdi95?=
 =?utf-8?B?azRHcld5bXRLR2dzN1dQcHpaeVZuRUNiLytNaFE0RXZXMHVReGtSVWxuQ0F6?=
 =?utf-8?B?MWdpN1RnVnByNGswRGxJbUdsbWUwR1JQaTZ2SXkwNXdLR0xpQ3pZcThrNG9P?=
 =?utf-8?B?N09zNWRkUkZkSEcwcEVSYmU4RTZHNXZLVCtPL29FaG1kL0dZSmRhNlREVG9G?=
 =?utf-8?B?ZUV4R0VINTlCT1A4ZWczanVmb1hzRlBNM2IwdnFUdTBkNHk0YzFxbHdNdEI1?=
 =?utf-8?B?Tmpvek91R3o5UXRRNXpCRlpJbHJzeGh2UnNVUmxjVHBCNEhsNlROSWZUalNP?=
 =?utf-8?Q?T+A0Bq?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 09:50:43.0525 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a93208-1492-474c-7029-08ddea062ed9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5813
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


On 02.09.25 08:35, Dan Carpenter wrote:
> The nvkm_acr_lsfw_add() function never returns NULL, it returns error
> pointers.  Update the check to match.
>
> Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Nirmoy Das <nirmoyd@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
> index c7d38609bb7e..aae96a94acee 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
> @@ -218,11 +218,13 @@ static int
>   ga102_acr_wpr_parse(struct nvkm_acr *acr)
>   {
>   	const struct wpr_header_v2 *hdr = (void *)acr->wpr_fw->data;
> +	struct nvkm_acr_lsfw *lsfw;
>   
>   	while (hdr->wpr.falcon_id != WPR_HEADER_V1_FALCON_ID_INVALID) {
>   		wpr_header_v2_dump(&acr->subdev, hdr);
> -		if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->wpr.falcon_id))
> -			return -ENOMEM;
> +		lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->wpr.falcon_id);
> +		if (IS_ERR(lsfw))
> +			return PTR_ERR(lsfw);
>   	}
>   
>   	return 0;
