Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6CD8BEE8A
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 23:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F8110F8EA;
	Tue,  7 May 2024 21:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L4rD1orF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAC910F7BD;
 Tue,  7 May 2024 21:03:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2oFVddNi51x4O87ysffWqf++RG//hsuq/KGd46Ub2x6e3snTPzpt/lnJXhkCnJl+x1/Z01QI9P175IZiKdSJPfB4wrxo3OjPQUnnJcTLDjnUHWbwErD+qyBR0QeHiOc0Ev84tp+ayAKVSGHB8ln2eEXlcWYdKUdfv2dkmlZ7BKiKHdjEHPlMu3/RAac6OP/ZEek/LSzGGtzrhhE64fu6IittxiTq7XJe+PTrShbFMDvrGdiG5LUY1T5s3aD66GELOKse6icI1OcplM1qZqTyG5UAZq4BFUaEBfKmYfYmVn+Cr2YTZ9RlJYHg32WBSVoEz7V6k3Sw1I/nAP7HJj/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3lRRKyUenjAy3nA13vQlsiVs2ZSNaKdm+udKx+Q/mA=;
 b=JEuRq2OnDRuxihJ6ve8JQwGdjZ9TFqtsdb5LppVWgoFy4nWP/iCgW/V05c8nF7R/jK7QekZYrsIsRGT0F8wYeSZ+rri3le++jhBssqERfN4cjZXYgek51cnbUlV9n0+z2tmX2riG75aksF3RNPJJwlhaUSbbIRnrBp9bOpdQjhAAcx7R2LuzwMHw22d7DPv4qTraK3N/bCI2SoZLlSl10SveFVtjj6vdrNzOj9H8NK+qtLoPeUpGEzv8Q9ewyDJac6dDr+CHhyJrZBO6NVNTssN1iShH5vZ4IaPp9E9NYu4/ZVU1MISiLVB1PpIP33BCxcwWHZhzwvWUpAa5Tf0a/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3lRRKyUenjAy3nA13vQlsiVs2ZSNaKdm+udKx+Q/mA=;
 b=L4rD1orFwQ1A5n7Fj3bj1nvnJqusVg6jvIcDQqeIJ+RSSfLAkNTK/tygu9lnlS/5XwnCoue96k/tzCIqwzeYnReOyaKhuweDzMngvwPhkU+C2llx3fSWeQGNTgOmMK6NcJ1cbC8KY7v2AMumBcwH+JopBtZL6+yLEbQaA+7EkII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN0PR12MB6200.namprd12.prod.outlook.com (2603:10b6:208:3c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 7 May
 2024 21:03:45 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%4]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 21:03:45 +0000
Message-ID: <b463d432-669c-43a4-933a-cafef000f7da@amd.com>
Date: Tue, 7 May 2024 17:03:41 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] drm/tegra: Use fbdev client helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 linux@armlinux.org.uk, krzk@kernel.org, alim.akhtar@samsung.com,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, marijn.suijten@somainline.org,
 tomi.valkeinen@ideasonboard.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, thierry.reding@gmail.com,
 mperttunen@nvidia.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20240507120422.25492-1-tzimmermann@suse.de>
 <20240507120422.25492-12-tzimmermann@suse.de>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20240507120422.25492-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0119.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::22) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN0PR12MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f67d3a6-6a57-48be-978d-08dc6ed92e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|7416005|1800799015|376005|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjhGNU5zcmdsbnY3MWRvZ21NeE9FQTRFSG1rTGc3WE9LclFkQ2dUSDF4L2NI?=
 =?utf-8?B?VktZYUJyRUJidFdHdFUzNjZZKzdHZkNRZmhSa0VKbldJNytWaElEb2pLOUpj?=
 =?utf-8?B?d2pyb2pmV2k4WlNQUTViZ1NYVlJUekpMQ01Da2ZOR25iRFpMNmxzSjg0bUhR?=
 =?utf-8?B?cWVKeVVYbGYvekxwNkRQakNCWDUvZHROT3lZWVNjOTdONXVaZWY1WjQyVVpx?=
 =?utf-8?B?RXJZaEVQNmNweTFrbHNWeXJOd2pReDQyTkRIYzc0MFVBaDZBbDNYZEZHQk1o?=
 =?utf-8?B?SnNVd0YzL2F0cjhvV3hRdmZNUU00VUNYSDVZZDVYUVhEOUU0Yk1rNEs5TEds?=
 =?utf-8?B?QmtnbXpFMWxKa0ptRk0vUStCMWF3WlpHeW1QdDMxTHRqd3FPbzBjdlMwTW5u?=
 =?utf-8?B?NUFFY0gwdlIyaUM0Si8rUUpBTHR4WDJSZVVQTWJWclNQSzdKTk1ZZk96QlFP?=
 =?utf-8?B?TSthdXcxbDdIQ3hQR0dDMVlIQXVqcHYrSEduN2YyRjU1NVFGNUZrNUFheTJi?=
 =?utf-8?B?YUJPOHJRL3RvbWh0U2dyQjVRbVJkWmswenhPSy8rczFFcUk5R2ZTem1PNWE3?=
 =?utf-8?B?WXZMbXBBa1JUZUt0Ymt2bk9veHhLbFpyeFJHUWlRNVhvcWR6NzJJaWY3WnAy?=
 =?utf-8?B?UGFZcUQ4d2tQdWRJQUtGTjFVdGF2VndYd1EvZExUYUNSZjdiaDRHNCtzZXhk?=
 =?utf-8?B?bXRneHZrM0EwODRnUWlTamFqUmVlMy9CWjIrTlJvZEczSldKK0Z5QTYrci9p?=
 =?utf-8?B?bURCNkYveVQwNDh3am5xdVUyMk91ZHpYVGgyMnQxMS9tUmkrcyt4UE14bGdI?=
 =?utf-8?B?OURJK1p5QlhPSURwNlZDYzZUVEJDT1JBZEFmVmM4U0xsZDRoWWxLVjhtMTJ0?=
 =?utf-8?B?RVRLQ080T1d6R0VkZWpFSEc0dThCMnJPR0NEM0NQTjEwNjd1VGkxL2NiMDJW?=
 =?utf-8?B?RXZXZzhoT0JqVTluNVhHdEp3dHpxNUprWk5xdzc3TUdrWUNlRVllQUdvdWVj?=
 =?utf-8?B?K0dSVzZFeDJ1elV0bmlQOFhGSUdRcVFBS1FpWkRDTDNtZHFPVWJEem00bjVR?=
 =?utf-8?B?dEtLRHl5SUNmNXpsZkNtR0Z0VkIwWjY5RGQvUGgzUjJPU1NmS2o0b1R2OHZu?=
 =?utf-8?B?VWt6aG80M0N0RFpnMUlYUGhZNEwvNHlXcVppNk5hNkhuNjBpaDdyNjVMU2ZL?=
 =?utf-8?B?clRiMExTRktLeDAzMjVXTW1Pb0l2THJqVEZqZkw0VVk5S3hFTUxlZ2ptY1B5?=
 =?utf-8?B?SEdyTXFtc0gxR3VvQzM5MkQ0aXhTMDVLcU9nMm9wM1o1Rm1nbGd3WjdzbWxm?=
 =?utf-8?B?YVM2VjBhTXRaV2hUMmRsamk0MEZKUFpRSEdsZ1VlSWg3V2lLQmkxS2VRYXcw?=
 =?utf-8?B?clNLN1hhdElKRmhFTHNjOU92alN6enBwTUxNWDRVM3VmMUFyRW9HQXhzSnYr?=
 =?utf-8?B?V2VXcytSUmIvaTZUeCsycERqa0J1TFBtMlRhUlh3WS9vZTBaK2NQSWR4Snhu?=
 =?utf-8?B?dXlqNHEzTnZkM1U3dTM5SkIrUFpqckRWT3RYZURyQXJ0d2R4N1J6OGJ5eThx?=
 =?utf-8?B?YkVJbk4wYjdsbG1oKzJpM05XUStRRk9pVEFXMlRncjhmMUtwWVAvSHpYcVpv?=
 =?utf-8?B?bWdmYnA3b1dSZGczQmp2RS9xUzFJazJldTI3bHJWUkMyQzZ4dmZzbHFpQ2F6?=
 =?utf-8?B?YllCb3dzbHVpeEp6QVlJcUpwMkRVTURvZzcyRGlEZjJOZnRGYk5rQjBSOWVC?=
 =?utf-8?Q?l2g0UqW8ppHbKev3aznJZaOJVTFG29TbzgiaSmT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(376005)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVdmMU5NdWgxRUxiVlR3SDRyb1ZJa21MOGdHeG11dVZMNUxWUW1SUldFeFhh?=
 =?utf-8?B?MDFYdVhDdytYekI4Ylk5TTJCMkRwNjFkRkMrL3VUNzQ5b1VvSHJoTXZYT2Jy?=
 =?utf-8?B?Rk9iTzJGbEN5a1Babk1zNllmdzFPWkdDcXJmZEhaNmNnV1Vtem8xVWhSQkx2?=
 =?utf-8?B?TnhwQVJoSGl3ZHNBUWRFSjMwMzZPRHdoK09GaU4xRTljemJGQmZrSjZCamgx?=
 =?utf-8?B?Ri9GRVlxUDFFYUJ4SUFWeWQ2OFN4Y3NrajF2blVvQ2EvVVhaMkZzWkEyZFlG?=
 =?utf-8?B?VWx3RC82bStZeHMyei9VaWlnM3p3UDZEYWt2UjVKU2dwOGhTeE9LUnB0VVNW?=
 =?utf-8?B?eDRQS2JDMlVqeUE1L3lWS2pNUzEzMzBoaWFSSUVqejNhVmkxUHNBOWw1MDJQ?=
 =?utf-8?B?MkxEaUkwOGNKZGwyWkx1R3YwRVJYNjlsUEFBZWtvSEVTL2FNK0Y1WWlzVGF0?=
 =?utf-8?B?MS9TZkhxR2lvam1rRHgyTHgzR01NVFNSb3FxTFFFUnhlVDBTU0NvWk1vUHVM?=
 =?utf-8?B?b040UiswcnJJMVBJbExtQXptZ05IQlRIZ1BJMCtqOVpXanFnU0Q0U2ZyTWdn?=
 =?utf-8?B?bUZaK1JFQnNGZnBRT25EMmRLd3pzOWVIL1ErR2wxTXhBQi9Jd3dwYmx4bjhm?=
 =?utf-8?B?Y2NUQ3Q4dXpwcThBclI5L1ppNGZuN0EySmdrcE5zaHpMYnUveWlHUmZkeC9y?=
 =?utf-8?B?VUZHQ2dCQmhsNXNuR1dsRjZTTng4dGk0eE50eVVNc2ZES3ZnSW1ZUnUrMHJu?=
 =?utf-8?B?V3dtREx6dWNzWktWWEVjSGhTcGlGMENoNmlEV01JWXlvekxpWXIvQ0xwSHVU?=
 =?utf-8?B?d0NVUFU1T0ViTlI4clQyb2dzK1dqYmpTL3F5T1BhcEt4RmhNSkxRaFJ0dXNG?=
 =?utf-8?B?YU43c1hlOGpkU2hndWdzOHpPQlRBQnkxMy96Q09zaG9kT3c4aGNkNGNXK3Ju?=
 =?utf-8?B?MzR1MVFvbWxyOEMxRjNac3I2MXpDaFF2dmNFbkh2b0R4eEI5ZXRSR3J3dFBC?=
 =?utf-8?B?THNZdGU1c3FlZW5tWjJ2TWlTVUdYT2FBWVdZQ3Q4bnhQQ1pOUFc1SmM3cnBV?=
 =?utf-8?B?QzVpalNpSll1bGFHUmlYVm5xRlh0ZzhTWEw5RHZQeGw0MG9mYi9wMGkvWDFq?=
 =?utf-8?B?OURXMTBqTktmVTRBZG1qQ245Z2RTRDFRQzZFN1NONE9jQkppS3A3SGN3Y2Ru?=
 =?utf-8?B?Wnpldk1YZTFUNkh1c3Q0MU4xVEJIWkpqOTRwK01MaDlVNVkydkZ6c1hhVHlv?=
 =?utf-8?B?dlpvUjE5OGdRS0hPZkJaa3lsTVRrclgyNHJ5T1JKTXFJbjFINXVBeHZpYzhX?=
 =?utf-8?B?WTI1R24yWlJJNmc3alJSdTJOVnVWNkF6NUgwRGNaa0tVSW5heGdwV2pyWlgy?=
 =?utf-8?B?eTI1cTN0QnFFM0Ixa3RueE5XKzJ5MkNQRGtmQ0pDYUdDa0FzRWxFMmp6QjBZ?=
 =?utf-8?B?Y2wxSzBWTXkrRklPNnFMc3lnUkJCT0pZc3VuM1JXbms4SGdiYmdJMm90bDR4?=
 =?utf-8?B?WG1FTlJmazlGYXVCdkN3ckw0QTJTZ3ZkTklWV2UzSVRUTXlwQSs2dUhnYXFl?=
 =?utf-8?B?YW50S0pRUXZHVUdiV1NSQk01WXB0dHg4b0VLUUxaYnNOeWZLM3RQRU10WGly?=
 =?utf-8?B?bTVqMldOQmlDTGNvWC9VUENxcDhDNzFHQmwwOTFpYUlhUTgyS2RsUEFhRTFH?=
 =?utf-8?B?eUllZW82K2t1QkxaNzR3ZGhjYktxYzZ5QjFHRGpsQ01yRnE2VjdieVRIU0d3?=
 =?utf-8?B?ZGVldFJHT1kwOXJmakRiQzlwSkZwNW5CREFWS0tBTHZ2aU5iRldGQjVjZlpI?=
 =?utf-8?B?dTR2Tmh0VFFWajdnQmtrQ09KQ2VwT1JkRGhmZXduYmRRTFgrenpPSGYvYURF?=
 =?utf-8?B?TjZaRlIwUHdIcnQvOGNWUW0ycGRibWxKVXhLS3Z0OXNNZkdlWEUrNWU2ZURK?=
 =?utf-8?B?alNnUUt5UFRHb3pRRjYrWC9uZVhhU094ZzlIRmtzQWNLcjV5SnFQc2V6SElz?=
 =?utf-8?B?MnFpN2pJWkdOZk9ZUXdOcFA0dUJGVUoxdlAycm5mWlA1S1p6YndzNkFYUXJi?=
 =?utf-8?B?Sm5kMHFIazJHWk1KWEtQQUdFUEliTnhaQXFmdW50akswVm9ZMXZMVVlHbVZy?=
 =?utf-8?Q?7TK/+sqcSdZ+/kRFKSQwGJERN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f67d3a6-6a57-48be-978d-08dc6ed92e98
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 21:03:45.0469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gemzeDiFOxNJQh3u5PYnurlR+J5w9zhUvjeA4Fm8+cyKgfox384/c3XGl3+DoDT6Z26nqUSonLR9kM+TJy25nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200
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


On 2024-05-07 07:58, Thomas Zimmermann wrote:
> Implement struct drm_client_funcs with the respective helpers and
> remove the custom code from the emulation. The generic helpers are
> equivalent in functionality.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/radeon/radeon_fbdev.c | 66 ++-------------------------

Was radeon meant to be a separate patch?

Regards,
   Felix


>   drivers/gpu/drm/tegra/fbdev.c         | 58 ++---------------------
>   2 files changed, 6 insertions(+), 118 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
> index 02bf25759059a..cf790922174ea 100644
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -29,7 +29,6 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/vga_switcheroo.h>
>   
> -#include <drm/drm_crtc_helper.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
> @@ -293,71 +292,12 @@ static const struct drm_fb_helper_funcs radeon_fbdev_fb_helper_funcs = {
>   };
>   
>   /*
> - * Fbdev client and struct drm_client_funcs
> + * struct drm_client_funcs
>    */
>   
> -static void radeon_fbdev_client_unregister(struct drm_client_dev *client)
> -{
> -	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> -	struct drm_device *dev = fb_helper->dev;
> -	struct radeon_device *rdev = dev->dev_private;
> -
> -	if (fb_helper->info) {
> -		vga_switcheroo_client_fb_set(rdev->pdev, NULL);
> -		drm_helper_force_disable_all(dev);
> -		drm_fb_helper_unregister_info(fb_helper);
> -	} else {
> -		drm_client_release(&fb_helper->client);
> -		drm_fb_helper_unprepare(fb_helper);
> -		kfree(fb_helper);
> -	}
> -}
> -
> -static int radeon_fbdev_client_restore(struct drm_client_dev *client)
> -{
> -	drm_fb_helper_lastclose(client->dev);
> -	vga_switcheroo_process_delayed_switch();
> -
> -	return 0;
> -}
> -
> -static int radeon_fbdev_client_hotplug(struct drm_client_dev *client)
> -{
> -	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> -	struct drm_device *dev = client->dev;
> -	struct radeon_device *rdev = dev->dev_private;
> -	int ret;
> -
> -	if (dev->fb_helper)
> -		return drm_fb_helper_hotplug_event(dev->fb_helper);
> -
> -	ret = drm_fb_helper_init(dev, fb_helper);
> -	if (ret)
> -		goto err_drm_err;
> -
> -	if (!drm_drv_uses_atomic_modeset(dev))
> -		drm_helper_disable_unused_functions(dev);
> -
> -	ret = drm_fb_helper_initial_config(fb_helper);
> -	if (ret)
> -		goto err_drm_fb_helper_fini;
> -
> -	vga_switcheroo_client_fb_set(rdev->pdev, fb_helper->info);
> -
> -	return 0;
> -
> -err_drm_fb_helper_fini:
> -	drm_fb_helper_fini(fb_helper);
> -err_drm_err:
> -	drm_err(dev, "Failed to setup radeon fbdev emulation (ret=%d)\n", ret);
> -	return ret;
> -}
> -
>   static const struct drm_client_funcs radeon_fbdev_client_funcs = {
> -	.owner		= THIS_MODULE,
> -	.unregister	= radeon_fbdev_client_unregister,
> -	.restore	= radeon_fbdev_client_restore,
> -	.hotplug	= radeon_fbdev_client_hotplug,
> +	.owner = THIS_MODULE,
> +	DRM_FBDEV_HELPER_CLIENT_FUNCS,
>   };
>   
>   void radeon_fbdev_setup(struct radeon_device *rdev)
> diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
> index db6eaac3d30e6..f9cc365cfed94 100644
> --- a/drivers/gpu/drm/tegra/fbdev.c
> +++ b/drivers/gpu/drm/tegra/fbdev.c
> @@ -12,7 +12,6 @@
>   #include <linux/vmalloc.h>
>   
>   #include <drm/drm_drv.h>
> -#include <drm/drm_crtc_helper.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_framebuffer.h>
> @@ -150,63 +149,12 @@ static const struct drm_fb_helper_funcs tegra_fb_helper_funcs = {
>   };
>   
>   /*
> - * struct drm_client
> + * struct drm_client_funcs
>    */
>   
> -static void tegra_fbdev_client_unregister(struct drm_client_dev *client)
> -{
> -	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> -
> -	if (fb_helper->info) {
> -		drm_fb_helper_unregister_info(fb_helper);
> -	} else {
> -		drm_client_release(&fb_helper->client);
> -		drm_fb_helper_unprepare(fb_helper);
> -		kfree(fb_helper);
> -	}
> -}
> -
> -static int tegra_fbdev_client_restore(struct drm_client_dev *client)
> -{
> -	drm_fb_helper_lastclose(client->dev);
> -
> -	return 0;
> -}
> -
> -static int tegra_fbdev_client_hotplug(struct drm_client_dev *client)
> -{
> -	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> -	struct drm_device *dev = client->dev;
> -	int ret;
> -
> -	if (dev->fb_helper)
> -		return drm_fb_helper_hotplug_event(dev->fb_helper);
> -
> -	ret = drm_fb_helper_init(dev, fb_helper);
> -	if (ret)
> -		goto err_drm_err;
> -
> -	if (!drm_drv_uses_atomic_modeset(dev))
> -		drm_helper_disable_unused_functions(dev);
> -
> -	ret = drm_fb_helper_initial_config(fb_helper);
> -	if (ret)
> -		goto err_drm_fb_helper_fini;
> -
> -	return 0;
> -
> -err_drm_fb_helper_fini:
> -	drm_fb_helper_fini(fb_helper);
> -err_drm_err:
> -	drm_err(dev, "Failed to setup fbdev emulation (ret=%d)\n", ret);
> -	return ret;
> -}
> -
>   static const struct drm_client_funcs tegra_fbdev_client_funcs = {
> -	.owner		= THIS_MODULE,
> -	.unregister	= tegra_fbdev_client_unregister,
> -	.restore	= tegra_fbdev_client_restore,
> -	.hotplug	= tegra_fbdev_client_hotplug,
> +	.owner = THIS_MODULE,
> +	DRM_FBDEV_HELPER_CLIENT_FUNCS,
>   };
>   
>   void tegra_fbdev_setup(struct drm_device *dev)
