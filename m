Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9F997A30E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588FC10E372;
	Mon, 16 Sep 2024 13:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1wZziMp9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D6710E371
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:45:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYUn2bsYfeXoX0ThmOJVREbteD9/Bhm92cinuH7BStnNLE0Ksl8mZ1yNYAv8/LkisSV40dWCY+udhd2D82ojgMAt8ZqY7DXhq/IxxivDgeJX/Fs2Nooyybzv3BmP1VE+6eHlz2yoJJO4nJEcMQSOFQfDFaW6ZFhdPzFXzMucDNAjD6Uwcw+QlfucMR/nMcfc38/HOvHgtje5suHaC00DdzP7buO8POykrJk0aLcMCrevrXf1vJu7DEuOkB3FpPsCUSCdt+kScm07r7PcnNDHsa8Z9S4HzWe+HUcw/l/GZKg5IsQDydaEdjIcMV3TC+4Bg09lhosCNdBvmXo6R02Z/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/+w+f/CLDESFVDUGGXFEv10KcaSNP/ZoBvTAl8MRr4=;
 b=V4Guh0UIkb+/qzuGTKULucEHDF2QYbYzNfStCDnMqA+GJly2hYAsVoSFsHt7Qqmy1FDP1GLaj8ru7CSv8TKjmBnrg/px0ngFqtW8JjUpSXZ1qFbFyTjLaNoQUFuGGLHmdHHyFBC5YZ/Vte46gWAAHrm196Pt63lMYjtMmflni4Z1tbpWSkaqygcwToENuAYHq6Vfy1/PCdcYa8oh0FTclfN/q6yjXslheGhxFUx6wau8jTEhn90k3fKG4iJmRLIaCuQXW7egJNPROaCUk+xWpNo/SsP7n0KyOt9SCgbt1la7GxYuE3hr2EbEMz9VT0ADq/Dl8Ikbw1IieZzc1o7/UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/+w+f/CLDESFVDUGGXFEv10KcaSNP/ZoBvTAl8MRr4=;
 b=1wZziMp9Y2/DAaMKlBhezWsf4bmzBRw45Kj4ww81+1phErmfpiIRZe5VXLeRxvThyESaKB9ycMYAm591z5QoLYykPVO7IkKUW2ckxsKmdkYYOPx8HgGlOzkhngjlCA+aU0umdBe/318NsdfbM4Vqqw8Ybd1B8XGM8+ab3nImtsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6228.namprd12.prod.outlook.com (2603:10b6:930:20::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 13:45:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 13:45:29 +0000
Message-ID: <0d2dd5d7-71df-4151-8ce8-56a7e5e79aa4@amd.com>
Date: Mon, 16 Sep 2024 15:45:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm: use drm_file name in fdinfo
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, tursulin@igalia.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com
References: <20240916133223.1023773-1-pierre-eric.pelloux-prayer@amd.com>
 <20240916133223.1023773-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240916133223.1023773-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fa3e77-0420-422b-2e03-08dcd655d351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjQ3QkNBR3RnVmtlNkRBWm1HUlBwdDRnK2l5SmlnTTBBWUI0bmZlclp0VmhT?=
 =?utf-8?B?MVZzVytWTmg4b3ZybnVGaHFoWEVmYUIwbEdyR0s1SHVTRmxCRENIMEtZaEhW?=
 =?utf-8?B?QlJXNHlTNm5NMEhBOEM3THU5Z2hKSnZsYlhmSnF0R1ZCQ3BJK1ZRTFB6TlUv?=
 =?utf-8?B?WVYvTG1DZ2lRU2RHLzZBM0ZkcWhGWmtjVnI5Vi9CRjQrdTBXZlBJNDF1MStq?=
 =?utf-8?B?Wm1QVWdSTmNqbkJlemVzRGhYcXFibGdQNFhBR1dobXl1NjM5YUZqVmpnTE9m?=
 =?utf-8?B?VklvdkJEMG41RDdZVTBEMUxxNWR0WFFPdzU5Qlo2NTFuSkNjQk4xUG1lNENG?=
 =?utf-8?B?UmIwbnBKdERWUzZxVXZ3RG02MFpFQTU3dW5TbXhJV2xnQmZjbTFKd0x4cExS?=
 =?utf-8?B?ajhKTktSQkx1WndidE9WSkN5Q1NxM05IbnBrWXJYdmZPTlFZdnQ1L0NId1Ey?=
 =?utf-8?B?cFE3MHlMbUlSUU5lZkNjUkNWZFJzVDZ4ZkNiQ0p3MWtPRkRCT2tOd2llWHdp?=
 =?utf-8?B?Z1lscldGZU1lWVo4amcrRTRBMnNXVWhlQU52Nm16Ylg2bGxTbWNiZWsvYUVt?=
 =?utf-8?B?VlVmTk5NTWdMYk9rbHc0RUplRjhqakZRTmJwQjJrRU5GcE01cG51akF3SUFy?=
 =?utf-8?B?U0lKNUFKSHpFN0h4bmdoaGtuVkNpTnZwSjJXREtOT1VTTWF6Z1NsRCtPL2ZE?=
 =?utf-8?B?eFpoQjAxSkNiYXpzZDAwdURmQTBIQjRWbE5RcG5obUhKQ2pCRnZiV0NqQmo2?=
 =?utf-8?B?eHJzb0d4ZVBjOG9DVjNHUlhmQm1LS2dOOXpaRmVtWFcrWk1yN3JlNitmU3Vj?=
 =?utf-8?B?ejJrN3kycUM5VzNEbU15L0RXNFQyejExY3ozTG9HdG5SNlZTSVBlMnhhc0RE?=
 =?utf-8?B?NU1jTlgyZm5IZzdObnFQOEowNjR5cDhHTWFLQ1JHdTZETnh0Q3docjVDbHFF?=
 =?utf-8?B?RklGWm9LVnEyUnFYeU9qaTJldUl1NXAxOEppdkJ3V2RSRUtibmZoQ3FiWDYx?=
 =?utf-8?B?NE5BRTdDeHE4QVU1ZzJDTWtUYTJsTDlGakpvRndqclF2c2pNdUUxcUoyU09P?=
 =?utf-8?B?SDRFMXdJMzhDYlJWSWg1SFBiQWhFK0tkTWtVeFB2YUgxSHZLVER3R2hWWnZo?=
 =?utf-8?B?ckpQOWlEd09USmg1MnEwYStuOFZ5SElER2lqdXFGeGFFZnlpQlNwNVdJRFRa?=
 =?utf-8?B?MS9KSmZ6dGRMVytxZGRTOWhLZ1BrZk9xYWZlKzZ5ODFiYllua2w0a0U5R3lr?=
 =?utf-8?B?UEhXcVo1QTltNWtQbnJvdHhOb3MvMXJIODVxVndHazNzOFc0QkpmOEJla0Z4?=
 =?utf-8?B?VXZzdVBqR2tYQld4SGZ2aEpMaTZhOFlHMVBIc0ZwMkpVV2NUYjd1cit3QjNm?=
 =?utf-8?B?bUpRVE43dWduWXkzcFNyTE9YTVpYWmlqZ0JGaldRTDVnMmw5MWEyVkFtOW80?=
 =?utf-8?B?bUg0cEt3K3dXZUlEZ2dpbWxyZHdvRzZmSEtMdTgvejg1QU9RVCtVTUNEdXU2?=
 =?utf-8?B?K0xCWFNEZStIU1E1aksrMjIreXJDNUNEN0NyZ0svanVrMklVUDdFY3Rkc3l0?=
 =?utf-8?B?WnluemtpL1JnUGhJb0NmalRkNnR2RUlONVhBU0JSbnpmZTNWaXdCRGVDZi9W?=
 =?utf-8?B?WEd0citpdWpLaUtzYzhoUFNiYzU4d1BtN0t6QUw1T3kxTWJ0MGdEaWdSaGk3?=
 =?utf-8?B?Tzcwemh5RTdiUVRzYXIwcDRJVTJWWS9hSHZENldqc1VUN2l0Y1h4TGhmRmk1?=
 =?utf-8?B?alpoMlJrVVlQL1RFMmtIdVhxL01EV2FKZ01qVmxoaTJKK20vK0dTRHY0TUtN?=
 =?utf-8?B?NTM5NzVPbXNRT0htZ3ZFZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHlxQTcwaXlqeGJPeERNVXE2MlNOSm41eDFXS1NDNDVuOFhKeUlaVHVDbE9M?=
 =?utf-8?B?ZWJuU0Nhbm1rcmJKV1hqMDZ0MjNrTHd5MStpbDlIeXg3dFNEcVpvL0Fqc3Jp?=
 =?utf-8?B?dG9aVzM4ME1sYm9EMS9rSlRyUUt2dE9NT01GdHRYMFNrOGZtZGRFNWtnbUhN?=
 =?utf-8?B?NGhybnd5b1BFVUdSU2R6Tjd3MXV2RVB2Um5hcEJCVUc5VElQZ00vRDBvcXlp?=
 =?utf-8?B?K0swdW5BQ1F6ajljY2l3djkycmNIY1UvUzFoSklUMW1ETlJiMjVucUJmOWZJ?=
 =?utf-8?B?YTJ4YXh2SkRQWmdFZU9ONjdGTG9YN1Z1ZlRrdUllRFQwbkNSRi8yUkRKSmVG?=
 =?utf-8?B?MWcxa3lHMHBIRXRlVUF3dloxVGhJUnVBRUw2Sktta2lUWHFVd0REMzhCeDlx?=
 =?utf-8?B?UHdpT0tlUTFSa2h5NEZFMlUyNWYzT0lOTmdrVzkvWlJwdHVBa2x6ZGhxamFO?=
 =?utf-8?B?RXJWbytQZ0w5ODZHK3Y1Sm41dW5UbVh4Mk5CMHVkVThpR01maFZUekZFS2Er?=
 =?utf-8?B?RzFrM3VxdUE4em5ESzEra1psem1TVVozTTQ5dkFjYVp2NDFOQjlCQ1prWVRZ?=
 =?utf-8?B?YzcrQUk2Z3l2QTlhTDBTSnZCLzZ2SmxGdUpnV1pjSk82d0M4bmgvcGZMRmh4?=
 =?utf-8?B?WGovaFpDd0xEMXpYQjJUb2NZYzFiblhmZDcrYWJuNDVLdTBKckpSNFljNjlk?=
 =?utf-8?B?MEpROHU0bHFvVFJQTDJLNTNLT1FTR2E4T3FZSGtZaEZaN044NEwzNyswc0Uw?=
 =?utf-8?B?d3h0VHBtNjE4c0dsUGprWTNhTzdSYk5SZHdrRVRINjhMYlBZc2JKY3NEMUph?=
 =?utf-8?B?a1BtWEptSGQvWkVJQk1EaHlZcHVDVHNOa2RFWTA3ZUNKc1RZajU5VlRmbjBY?=
 =?utf-8?B?SE5Sempzbnh3SWtRSkN6MExVclJiVllxeTRyNXErV05QRCtrUGlyaWhOdzhz?=
 =?utf-8?B?NGdRcUhIenFjcUVhMk1BSmFvSW1OYmFMZ3U4ZlBRQzVsZ3VablJRM0xlY1Vw?=
 =?utf-8?B?YjFIbkZaOTYwSW42S2FHQnMyMXJaMmI4QlBMcWVzWnp6MUs0VzFiMngyTGZK?=
 =?utf-8?B?YldRWTVZNjVxQ2sxRm5rV0V6dVpORWpaSUZtWUFEUVFDcHpVSm1rbFNWdUdj?=
 =?utf-8?B?eVM4d1JEeGp4Z1orbVZac045QUdDOTFmMmErbFVLRjdzUk9tQVR1c3ZlU3JT?=
 =?utf-8?B?Z2cvalBBZndrWjVSOHYrUjR5cmJTOUpSM0NPVzJELy9lMVQ5R1FIL05rUTBr?=
 =?utf-8?B?SkQzaGZWUlZMN1hyNnpoNjJpYTF1dlZuQjZEWmxhV0drenVwUEgxTmRaMjBo?=
 =?utf-8?B?WWxseGU4UHlWaHJPbXNHcGYwbTV2V0FMemNHRGIya1h3YWZtUU54OUVsblFk?=
 =?utf-8?B?aXVuMi9YbkM2VnpnbmhoWjNCcjd5YmFtOEpyeWtUWG9nakpVK2p6L0NPZjQw?=
 =?utf-8?B?OUNIdHkvK3NoaGVjTTR3aFdzSnNkamUxdGZZanFzZGtDY3p2d1JMV3F6SWVU?=
 =?utf-8?B?ZFRJa0lWVFhHaStPbXNrLzE5bnpoZ0dsSXNkZUFDVkxiUEdJQ0d2THk0ZEtn?=
 =?utf-8?B?dmtuTzZxYUNNTkI2cFlLOE8zTGxwR3ZPVkM0YWs4N0hWNlpVSSt3eVkwYTl4?=
 =?utf-8?B?Skd3LzFTSnh2QmwxWis5V3IwalptYUN0QkwydUFpbXJ3aXE5cVNmeVdkZlEx?=
 =?utf-8?B?NVptL3VseFBSMHIwWFZ1d2t6SFROY2t4U3FRSjdGa28vVTJrWkJiU2pZVVVC?=
 =?utf-8?B?dENyTEFXRnhHZ0N3c0l2elFPaFhmeHZVNEVRUGpUemx6VERRclZ2ZUE0RVJw?=
 =?utf-8?B?K3pheDAyWmFQMEVuNGorWjgyME9zMkRwU3Zpa05zSmxaTy9Da1U2UE81L0Zr?=
 =?utf-8?B?SkdENnBnRXRFbTQzaXdVN1U3dUZCR1g4NDBYRUZDcVorL3B2alVLUi9GZWla?=
 =?utf-8?B?VUg5TVRnSWZZMVJxS3ZoNVJ4K2tLR0VpZ3pVTDRLQkZxVDhhUE1iOVlvbXUr?=
 =?utf-8?B?NVF2QVFCQjVlcjJkb3NDcFJJczdVUXFxd1phb3hkL243VE90bFQyNE1UTWF1?=
 =?utf-8?B?Y3E5K2txb2xzV3h1OGlUWlNtVlBLQUVjS0hqZVNkYzI0U1g2SmtmQ3JYTnJB?=
 =?utf-8?Q?q+hk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fa3e77-0420-422b-2e03-08dcd655d351
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 13:45:28.8829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0c4NQkFZ088xHxgCVVUOftNI57VH3IMLBSxzPqzJ3FD1OY8hi1C2ISc+IoiCMIq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6228
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

Am 16.09.24 um 15:32 schrieb Pierre-Eric Pelloux-Prayer:
> Add an optional drm-client-name field to drm fdinfo's output.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   Documentation/gpu/drm-usage-stats.rst | 5 +++++
>   drivers/gpu/drm/drm_file.c            | 5 +++++
>   2 files changed, 10 insertions(+)
>
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index a80f95ca1b2f..ed1d7edbbc5f 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -73,6 +73,11 @@ scope of each device, in which case `drm-pdev` shall be present as well.
>   Userspace should make sure to not double account any usage statistics by using
>   the above described criteria in order to associate data to individual clients.
>   
> +- drm-client-name: <valstr>
> +
> +String optionally set by userspace using DRM_IOCTL_SET_NAME.
> +
> +
>   Utilization
>   ^^^^^^^^^^^
>   
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index e9dd0e90a1f9..6a3621f50784 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -955,6 +955,11 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>   			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>   	}
>   
> +	mutex_lock(&file->name_lock);
> +	if (file->name)
> +		drm_printf(&p, "drm-client-name:\t%s\n", file->name);
> +	mutex_unlock(&file->name_lock);
> +
>   	if (dev->driver->show_fdinfo)
>   		dev->driver->show_fdinfo(&p, file);
>   }

