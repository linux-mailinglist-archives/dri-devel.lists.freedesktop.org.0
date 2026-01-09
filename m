Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5EBD06B80
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 02:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617F810E304;
	Fri,  9 Jan 2026 01:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bubi61px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F6710E304;
 Fri,  9 Jan 2026 01:18:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ResN7cV6/MHV/m8zU9w2Fhsrp/7XBlrmGqTio9IsLFXjkEVqHTsqznLwzCa8+/Lkfky5xx5t3gX5A07fXGW+0t5+wDjrK5GEQJi+qfa6yKNebC/K8dqJZ/xVYJwb8qlWEI8KAwhE2403akETQmHBT85BRzq+PGgsjvg9Hne3Mj7iJhlcZvkxqp4VultCLmjNYzZUZhpjzLyKYGjW4hv+0st7YoZ/H7v/RJitzjPa/ZqLBmPl42escE7vH1MARtbWvj9zfmuoYWnY4sY1hYKMqReqWseUMehoV1BLLd+MS3bCJ+nPPYoz8ArKobhho3sNvpPOAp1lceukO1WygiCDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6f3fQ2B9zWZ7Zkc3V4rOI6Eu1cSfMF5y2kbCkApHtyI=;
 b=CntOM6Pjfk4ejJK1CkRV90v03A7yQqqPznjLXuOfLWnhmAgzNmmvvdwrHBaruepjjaF/guKoYsvuKYOVil6uEn4eI7pRtsQwKlhhtN41OV3w68I4F3dAlBr1G+TwkXFWGaiabIJS3DtOXMJH8mLp8yW7cYW5gHkuyI9qC8yZ/Mr9AwCP0/5mUHGo+435YxTdl+X+NHcKDyWBpCNORk7qbJZ3vYhovbNIE9U0XPK4ldJOA5uchhlGrcfjwORTylFMViVnKtM5TH+h3JwQNlPfWpPAl9JReLo2RGXkM/mWNOx4rEE8QuAcLvBaIiyEY7+ow65XeFAFPH/RW37YrYupdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6f3fQ2B9zWZ7Zkc3V4rOI6Eu1cSfMF5y2kbCkApHtyI=;
 b=Bubi61pxu3JwiYt87Cte8wDA1oyUczsRPshMqQ7xArEzYj4vVCPZdkb1zSOIrqxzp94xwL7uE8OMYcXJH8GoZo4+QD6NXArvTCWetvGaZhjt5Z4O6Uwu4PkfUz2gLaBgtlRQEp+Rw0kn/N7m6+XpN+UacVAsONFeKzyr1QNkZBQ4oPwX84k0S5Ut8a7Vgv+tyi8zd62Kuw7655DskNjRbKfe+JaWBewO2+wGdaoAwXWnTLsTkrbOAt80pw9d6/Fj+EAKOyUWc4KYzjZ4zaxl39buvmbIGMtZsGZ9xWs7/RgqD1G4d6RwNM72I6VSZeL3UbRnkjaktS9+mr5n7+VDDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by SJ2PR12MB8009.namprd12.prod.outlook.com (2603:10b6:a03:4c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 01:18:35 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::bdb6:e12f:18b6:2b77]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::bdb6:e12f:18b6:2b77%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 01:18:35 +0000
Date: Thu, 8 Jan 2026 20:18:34 -0500
From: Yury Norov <ynorov@nvidia.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harish Chegondi <harish.chegondi@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] drm/xe/eustall: use bitmap_weighted_or() in
 xe_eu_stall_stream_init()
Message-ID: <aWBXakZVHr4si8UQ@yury>
References: <20251216000259.331293-1-yury.norov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216000259.331293-1-yury.norov@gmail.com>
X-ClientProxiedBy: BN9PR03CA0674.namprd03.prod.outlook.com
 (2603:10b6:408:10e::19) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|SJ2PR12MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: b59a0e68-9311-4db7-cfb5-08de4f1d02e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G7+9Korx67Aenn2xfUx7jLZh6ze/jg2d2I74GXW27FYps8ZPHmlVSXRhhCjV?=
 =?us-ascii?Q?MTFj4cCxKhjmnJlmdB3bEzv8N4zuZf2no9a7GR77i2L3d0QFYJndx/kyRboD?=
 =?us-ascii?Q?bvGwqIOOXI/Pd+fHxk6BPdOs9cT3oCV79sVP8uUgpe8QTMM5q3r94/SuFcUR?=
 =?us-ascii?Q?mRMknOx8/ReAzBqSkWc8CT8lT6gXyDGlXC1sWWRxi7h9At5k667PLYiWVJ/+?=
 =?us-ascii?Q?tyKU8BmWm5Rk6dwENjYTYhsvSCvrmo7wmCaHl/9MXvTlRGHjCUcqRAT7I7dV?=
 =?us-ascii?Q?l7iHRPgsxXPCd9YlV75pwnnFDpYoPlqKocIwKUUz5FxU17u8YMZtUv8kBOW2?=
 =?us-ascii?Q?aXRtxl6X0eZXbjj/MxO2OOf8eNFuoO/G9EX0YiaUc4dBt6MGZYp3PdyCGduT?=
 =?us-ascii?Q?rhGyFPIPdWMle1SUO1CBePsu7FfJAjPV8atLHZ6nDJFImA+if8ExKmk9MK9w?=
 =?us-ascii?Q?Fx8auovws+bB/m76Kot5CPy8cE/qXcEn08J6qcIoJUyYBGrDafCTdfiq5rT8?=
 =?us-ascii?Q?3QdqaxUK1W988N+825GS1i62ErDhDUilySHvf5e3KbR1JDQej4b7+kzwslrF?=
 =?us-ascii?Q?+2iwZN6nz25mX4khpDP4fkq4xKoP226jvvYkq452ajpcvx0t35XaqhSSsykI?=
 =?us-ascii?Q?gKCd4ICtuu2nww5xbXud/2pRInomlOKzNKAB6iMVru9jX6bTkT1dm+zu+0a0?=
 =?us-ascii?Q?uUs3GjMZ6ZmD2SI2jm+jyByuK5MgVKMoCXAkX31L6C+BA15ugML528K3IU4v?=
 =?us-ascii?Q?+muQ1vEDpuA793GXp7Vu4KQh6O1vf73N8nCMMAsaA12S5/7EKRfeL63cTnd6?=
 =?us-ascii?Q?9JoW5EYndhbVIKFPLBjEiC+Y4N2hcJET50jgzFfiYGDxPCR4jiJ9ufmA/LBn?=
 =?us-ascii?Q?VkU47HrTgMMI/q+kCzVApxvZhL0F8hi5yHK0+519g/vIkUUFLPOL9ivXm/jG?=
 =?us-ascii?Q?BSgqooa08sn8h+9vsEJhqkkx+KuP6BT1ODw6rIlvG1Kk3JT0iwLyn6ocNrR3?=
 =?us-ascii?Q?HcFZUQmYe8i1BhNE1RZEihvfYKU/EZoYXuf3eVYFumS5gleyFUK4t3UyGZvT?=
 =?us-ascii?Q?uvAdPvxN1gQ+TlKfbQKmVPSaivZfpFOzRdZ96kPKrVVA046a26Ct94QOOJux?=
 =?us-ascii?Q?3AOYkyI/36X4zenjaJYQ8Gn46XwYGo9DLH+xXKWlf1k77RkT1WUgIFDlmphY?=
 =?us-ascii?Q?Ngaot75Z7vdEbSKxof3XeMnD9JUmA3Bc8l17Uy4AWsIDirM00sPiDQpfx1VZ?=
 =?us-ascii?Q?QJYz+KKUTD36VdIxFW58XkejvgxtPOkwUVHKYPe4X/qbrrQsD9IlbVYjAzJg?=
 =?us-ascii?Q?QR8Isx4SV+LtEs8zw5iJwgOguwLGmZyEDDW4k0lGKUt00wy6wkx+C8EEnOS3?=
 =?us-ascii?Q?S71/Jkr3n8MYMSG4XpGwouOC4doY4KENx46kkJ6FkYyly8uI7yXEeQHcUuZf?=
 =?us-ascii?Q?h4wqru3hplemqjA1foO9OSYZ3ms5O0VM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KGxpnPOB2hy0cUfwZNm63WaYzH96KYoSgMSDfkqbA1qCK3e3x+TAK9b6hCln?=
 =?us-ascii?Q?jkJBRKBWf7tH46QcRLt6ANuUyPEqGFjuZWfR7AHMNJuLltoO9XDiohvAEL9p?=
 =?us-ascii?Q?PWVtL8f9qPdFSZKsOiyxh2hW6+MMBWaifNKZ3/FF1ZiGJJadBQpX8DaidOQt?=
 =?us-ascii?Q?dRJ3VoeBqGDJIHD5O+8Ko8X6TZtMA6y61FxrbBeCVZG7SaR6NbTrVMSdPQ0a?=
 =?us-ascii?Q?gaONHa3UzGdq7okCrHylbvo5wLIx6jIYNK8zVrPXotKrZoO6gJ3pXbTRsulH?=
 =?us-ascii?Q?6WOj2E+hX+oaPXrKU/7hYHWhR+zyOuMwR4OHGm237472I6w7aCfTvwOJ9Teb?=
 =?us-ascii?Q?CVbX1Orw82dbFiMXuuAA6MoEhCiYk6dEdU3CyregKi69KztgBWEPapYOGlEg?=
 =?us-ascii?Q?SF5ryvi7BOTeDUesElNbmmGyxpujDrCItSLc/4fxyB6VIX5dUyQzvuP/MXpC?=
 =?us-ascii?Q?1rCamWGDT6i77k1Ia9vZgsaCEdiAqJwk0s5xzER7RGxhtJW7zLzGw2jNFB7r?=
 =?us-ascii?Q?4JMNohWJ77RSyy+iFAqhIqitG6nYRFm5spTL6cxd5RUEVuj7fxWtJLqm/HrU?=
 =?us-ascii?Q?f4f3yBzrSvB+MBiLvGrycQMGzJEAodUIowdYrjAzRbaU5tefJ0E+0YB74r4X?=
 =?us-ascii?Q?igSugwMGNP+FZp5AZlPiCHJSxvOoNcaElxp0J0KVTKHGS00aR7EOi28IsiRY?=
 =?us-ascii?Q?fLfP5cDmiJ4JvVJIlTkRi/OI3AIhABqnE1pVfY/lmbanZzmE/UjvnnUJr+eA?=
 =?us-ascii?Q?7173MOjnljNDTEFdjS0UEnWL8wM5qrRHejljowvzWsm63hyJ5ZSfXQmRXuJO?=
 =?us-ascii?Q?5lU8AcPWlDeaFskQtzAfGkdipuUy5UMl+YV8qcLhtgCr92P7rpArHXSDGIpv?=
 =?us-ascii?Q?PtgAarQgrb2pAsGBOJ7N8E4+EAjIOF3klF40gbDQkE0muspcQ1BuzyGI1hTJ?=
 =?us-ascii?Q?0iB1EddSg1wDMkXo7r6Aq+66E26ht/EWWsn30e6jHGv9uXOTCakirwHsR9NT?=
 =?us-ascii?Q?H50JfO6ahZFX9Gexl6b0HD98fzymOxiOwFhvEX5JmJme0xgc/Bocq/G1vfNB?=
 =?us-ascii?Q?wx+nx1RCZISSXfVeHEAx4m8q2mLoz4WSvpMzkkmmN9hl7F55lvOoHWPdX4KA?=
 =?us-ascii?Q?ERoYDt6gRGOtVvG7z8qsHJRdpkGm0lkudGiun3RCo5yjcIx0dc+bU8+VZfwg?=
 =?us-ascii?Q?BON8Ag1nx8VxzES0l0I8mYdZYSF1eUApvCe9+YSFLKd4XVRobmgdALlkmvjl?=
 =?us-ascii?Q?zNNlSwh/TmkJ95Ow7tLbQ7xGKVBleKqhU4/ivfozyEks2sbCiyniDWphkLEW?=
 =?us-ascii?Q?rK6DeVXAtlRSXV3mEP8E2muXXJx16F8QkQ1r9pug1+jWTjnvt4lKYlDNV2St?=
 =?us-ascii?Q?4i/wspAh72yl1TZ/QP+H9D04MwN8zDuk8GcOO2u1BS7kAvppJMTWqVyKdIvC?=
 =?us-ascii?Q?j4OoNX9eYeNF2Xy9RxrirhzeYWtFz1qbYKAugLM4LE/QAwys/e9aTo58udO0?=
 =?us-ascii?Q?NjYanjk01ncqf1HDhgiBW9vIhzUkb65f8Sl8us5bDIr+AyTHyX/k5m7Og5hB?=
 =?us-ascii?Q?2H/O1nDJ5RcTmzHps2RxuR4j0wFxUPIeqPcbOHIUwzmd8I0K5CedhiiQrj+A?=
 =?us-ascii?Q?svx1vJP19+4ZMkqPJe0PFSll6PlgnKjcu5TwsLfLRPzf6HfG5bAMe9Ej/xXf?=
 =?us-ascii?Q?d4aqTCUPCRFP1LPO4QZahsalVFG87WYPCzDH+LWVz7qUUh/b5Sk4kNYEEu9L?=
 =?us-ascii?Q?1kjK/uudtIEMa0JrdWh9fy5x1+3olhA8lFqKkZ7aC95CZ43FbxKq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59a0e68-9311-4db7-cfb5-08de4f1d02e3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 01:18:35.5910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kuQSh8/74gGLEyoe44nt0FSCvEiN0sdbwsSWDQWPdtOONHraJ7ZU7CcTJQ2G3K2IbTAqHsBNIdDU7k7/3P+Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8009
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

Ping?

On Mon, Dec 15, 2025 at 07:02:58PM -0500, Yury Norov (NVIDIA) wrote:
> Commit 437cb3ded2503 ("cpumask: Introduce cpumask_weighted_or()") added
> the new helper, which fits well here. Use it.
> 
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>  drivers/gpu/drm/xe/xe_eu_stall.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index b896b7ff5900..8bd4307afbbd 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -737,9 +737,9 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
>  	u32 vaddr_offset;
>  	int ret;
>  
> -	bitmap_or(all_xecores, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> -		  XE_MAX_DSS_FUSE_BITS);
> -	num_xecores = bitmap_weight(all_xecores, XE_MAX_DSS_FUSE_BITS);
> +	num_xecores = bitmap_weighted_or(all_xecores, gt->fuse_topo.g_dss_mask,
> +						      gt->fuse_topo.c_dss_mask,
> +						      XE_MAX_DSS_FUSE_BITS);
>  	last_xecore = xe_gt_topology_mask_last_dss(all_xecores) + 1;
>  
>  	max_wait_num_reports = num_data_rows(per_xecore_buf_size * num_xecores);
> -- 
> 2.43.0
