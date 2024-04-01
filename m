Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA59893B01
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 14:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDA110F12F;
	Mon,  1 Apr 2024 12:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XjSknEkm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2095.outbound.protection.outlook.com [40.107.237.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E4E10F12B;
 Mon,  1 Apr 2024 12:35:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPG8qA3n1ZlZS3YGt2lEQZ7/BAG7ZBL7tVoSPiR1xTwdxg4uCty+DxqfoojLoJSaVJgEfkDXHO+uJiDrNbYSad/jjEIYQHfNb9yzCYh50UfWgN1gmZjukfwY1eB4TQGoCKb2nwyQAg1UuxnEJiEN4kSZI5mLqsnYlRW1RkJ9rWFixOSPUFWYwUk2Y+qWpDTG4XhsbGMprbuZdSMY/AaXdQAOjFBV75a8Go19+DXkXxUyJxbh6RM5XOkCj7lDHoEmKj1EOi7edWFzq4daQ8eGWs1fqkB1lnwlsnWvttlcV0TUzDpfbMy++Daiy45H4P5xAQLMpFb/5q3LOpsDUck4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucdoAYbja4uOUIG8TCLJ19/Rr1aQXrrah8r5Ustk0Ns=;
 b=JtwhYYghZo/iuEQRveaakxzkHttz2Txqi2BVw2LMR9/l7cuHpoJ/vTWP/CSilxL9MUNbp6iO2dlF+rkFnZs5BpvZx+edTdcRoFgCPteazfWDhEECGyy8LrY1kmjgG4zveIiUOk/rz+tq7dyd3cycd9QtDA3xQPABEsQxCTTAztAO8KwjLlXYbvuxY0GS9oKiwYVV9lcWLwDwhBgrxkxuM1BRPZ/p+8rIQoPIaRa8PMVAvPfnMXP0z+OfUmc2IvlinM6B3qF6G4l3nPhx9Rr9P98I4Sg5Y3GDz1lxJxHO7KD+DwIcWpdfTHG9tX3tTrT/WJxbUapmOl5W0+6Y03QlZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucdoAYbja4uOUIG8TCLJ19/Rr1aQXrrah8r5Ustk0Ns=;
 b=XjSknEkmIhe0aPrwbOsGzK1dQt1pDnZnqtN6UlFLzOjIDUoxwcnzKKLsRsV1CO2ZXl8GfZ9V/qm/t2r69ryd48EnW1FaTy9Yk4RllFOgTsOjNxVo1uMBPlUa96qT2EJYmYr0SLWv23LB4G07KdTpsFsxXbe8IKmU/svnwzj5tjE=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB9019.namprd12.prod.outlook.com (2603:10b6:303:23f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 12:35:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Mon, 1 Apr 2024
 12:35:42 +0000
Message-ID: <c2182ac1-368c-441b-b6ed-b5d15a8f9f38@amd.com>
Date: Mon, 1 Apr 2024 14:35:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/radeon/radeon_display: Decrease the size of
 allocated memory
To: Erick Archer <erick.archer@outlook.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Kees Cook <keescook@chromium.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <AS8PR02MB723799AFF24E7524364F66708B392@AS8PR02MB7237.eurprd02.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <AS8PR02MB723799AFF24E7524364F66708B392@AS8PR02MB7237.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB9019:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gqHEqjiLTsdwAVmAOoGEtbQMfgEGUds/k+8gQ6gV4ogm1cNw7rDkFiZIAzoNeHHEZq5APwj2+EkOuVx4pVLTk3L2ZXtSbAeu86iVAZ9SOCFUAnyNjZeIGj/aILZLMyCav3XKHX2JrRShBBgitt92bokzhmv0wIwaP2T2vVgWnZYiuzbUXQZNEPg6EpNGsxg6R1mLep78AybGhsW0TaSIYm/jgWdodtP5GcroQktf0dzd89Q/i17gZvO/8T9mduGpCFOT65VoRy7vGSXC3YPtgpdJ+kkdZ1j0ek4dR143HCjaHxs9UwN3QpigwzVJ0IYM0K35o61XW1PmhgLjPwo9rMvRvXQKDYkd1XfMeLAhdXWLyZEq16C4Yjabep5Yjq6AmfZKoxUAHfOWy7GGR4zPQ8eqGLrzxrimio3u6+E7Xf1A9AKjr6KwjtrU14oBGKFHTmnodqbvwDDzlzlcr9sDRps9fV/frHGOQLPo02NbzzVyj2UXV1YL8cEvL0mKhs8YfweETluOy/do4VoH+RYa0Bq9TXG4/IGZ2t52U19qxiDodnpVKoglWBEsUWFYtqG/JD+/sv7G/yb/5gDTdo2GmKtdmGcBoYX3h2YkDj8WaWryAdChz21OSYnVVmAb2XUN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1hHaUlIQ2UrZ0EvazF1THl4VlRLZ25hbGJ6azZack9qUVBZYm5xcTQwT1Zn?=
 =?utf-8?B?eDc5UVNmTUh5Zy9mR2V0eVJPRS8rYkFzQnc1bStWclRONFBSVi9aQnVETmtk?=
 =?utf-8?B?OERPUlI4T0RseGZKLzRFV2o4QXh1cCtJdkFOYTE0VlFoN3A1dmlNcDNBTEpE?=
 =?utf-8?B?bDVsY0hxaGFnRmw1b2NMZHBPdS9TMlpVQTV1SnVxV0tpNm45dE5POVFjbGhB?=
 =?utf-8?B?azRKWWdFSS9CbVVmQ2F4d1FieVFIZXV2Mk1pc29PSkJydnhraFdibWR6Vmdq?=
 =?utf-8?B?K1l5NnpxZmV6ZDNoWk1CNFVIWkZ1NUczYmRkTy9OL3hhR3lsV0tvelZhMzk3?=
 =?utf-8?B?eVJjRGhmNWJ5Ui9jQytKZUdXU0lVQlMwMW9QRHhrenVWZ1EvRERrYkt4NHdr?=
 =?utf-8?B?STBMcWk2emVJQjNaSm4rZzNrZkJOSlFoRlhTcEFhTUYyTlhYSUFDamVhL05K?=
 =?utf-8?B?ZlBNYzNzdjVFTEhMOCtsZVhLWnBYU3p6WFBGeHZnYW9jWDlpQXV0cG5IeDdT?=
 =?utf-8?B?aE1tY0w2VGxBUy9uWGdWNGxKdlhtN3VkT0FVaGlmY3hJdUpxVmZzeUtLZTIv?=
 =?utf-8?B?NjVPcEZFSE5UNnRZZStjN2tEdk9QVlByWldNUmpOc3ZmWE4wOE4yc1N1NmVz?=
 =?utf-8?B?R0diRjZDcnRoNzBhcnNJcy9vcXlXdWh5Zm43YlNOcmlWaG5hSGRWRU9vTEpn?=
 =?utf-8?B?ZytMeDVUYUlhMTROTlp4VlVpbXF0UVhtQUlBZGdRbTVlL1ZrckF6dzdEaVc0?=
 =?utf-8?B?eW4xV1NYZGZES0d5ZTgzZDJVaUJtZkUwMUl5Q2Fqemdac25mUHBYdHo3ZFdr?=
 =?utf-8?B?MjhGMXhta1lhQlBPQW5hMFgyOUxDRXJEZklHWDdwUzVzcThoelQyd3VmR2Rk?=
 =?utf-8?B?a3JFTGJGUkQvUStrUDh0ZDdiQlUyczhmY0c1c01Jdy95b3Q3alZPM1RzeEwy?=
 =?utf-8?B?bmdMUi9COFpDc1RMNTJ5Slo2dS9pLzNRdUdjRnVmWHdoWXQ5Mk1DeTNoR2dC?=
 =?utf-8?B?engxVTh4LzQ1VXh3TlZDWXpBMTZ5Rit6RDViZjJsOXUyUy9VTURXd1h6eUR6?=
 =?utf-8?B?Z283U3pURGIzcEU5WGY1RDFoSXl0MGg3TlNYbVJTQU1LNDJiYnhHMUlud2lt?=
 =?utf-8?B?a0RMUTRhY3NSRkdEQzc2TmwzT2taOWgwZ3VRMzZQbFQrWTNZd2k3QnY2Rmw2?=
 =?utf-8?B?V2hiYzZzVGlaajFLSExtd1gzSEZzSmg2emlIQkFMWmlaRlAzc1k0RjBvMVg2?=
 =?utf-8?B?c0hVc0N0SmdTSEpvL2dzaTJkZ1UvTWxGWHpQMTBaWThjT0FQZlVKSVVkRTNa?=
 =?utf-8?B?SUdxclRxTmlTSmcwVnFmZmtrVVJXSXhaZUdPcmREeHBHOWVaTlVpSWhmWVBh?=
 =?utf-8?B?UmJvanlUcDFJQThWcVFpbVpCQXBXYlE4OXFjODF3U2ZTcEFJTHdXU1lrdGdy?=
 =?utf-8?B?bUF3alhPMENCUlZuTFVWcGNPa3laUFYxRkF3d2FaQVVJaVVuck53S3VnZW9n?=
 =?utf-8?B?aVZnclRLUlhEL21Gc1hiMG9wVnRpVm93bWVwVlN3ay9ZRzROTFB5OEdJdENF?=
 =?utf-8?B?KzU5cUI3RUpOL05oK2h1eWxhenJ3cE5WZEkxTkVEdGorUWNWb0JnTXBIazVx?=
 =?utf-8?B?dk9wUzF2bDZKMjlJVGJrZlp3bG90Sks2V2pPZitzbDkvTnFOU1hEdlVVcUVv?=
 =?utf-8?B?YnFWTjU1djdYTzRvYmhxZy95c0FJMGVhRTdlZHhxblVPblgybXlJSmZteEdN?=
 =?utf-8?B?aWJXSEZHSXRRZDd5bVVjRlhTbE1BNXFEWjJkTTI4Y3pOckpwZjVtSFdsdTkw?=
 =?utf-8?B?SllQM3RnK0NzRnlqd0tHYzZocERqOW40bnh4VU9HMXkwMmI1dThTUDhibnU1?=
 =?utf-8?B?S2F3ZWxUVkM0T3ZzK3RCWGlOd295MFJhQlprNDNXRC93dWpBTk03ZElkWkJv?=
 =?utf-8?B?dXhyZmpiSm8rOVBXQlFnODQzT0ZOV1BCNitzOGdUUEZERnlHSTRSRmtTK2V2?=
 =?utf-8?B?UFhhY1RyMnhSd2FvUXpqTE5kTDFCTkI3OFdaVEJCSjhtbS9UdjE5ZUcxOFhB?=
 =?utf-8?B?WUFFSFVCOEVRcjVPUWRTbnkxOVhRSVdMd1NneDdPT2REYXVHOGVUM2k1NjZk?=
 =?utf-8?Q?a0QQ3/n8crS39lnkNeaHfRcE5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7922ad7-b17d-40d0-0104-08dc52483e9b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 12:35:42.2719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEI8UJQR7tO63jNLvWpx+lGlo1/EyoBxpxOJnqHDtz20I8tBllfzua2prXJo5CR4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9019
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

Am 30.03.24 um 17:34 schrieb Erick Archer:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1] [2].
>
> In this case, the memory allocated to store RADEONFB_CONN_LIMIT pointers
> to "drm_connector" structures can be avoided. This is because this
> memory area is never accessed.
>
> Also, in the kzalloc function, it is preferred to use sizeof(*pointer)
> instead of sizeof(type) due to the type of the variable can change and
> one needs not change the former (unlike the latter).
>
> At the same time take advantage to remove the "#if 0" block, the code
> where the removed memory area was accessed, and the RADEONFB_CONN_LIMIT
> constant due to now is never used.
>
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Well in general we don't do any new feature development any more for the 
radeon driver.

But this cleanup looks so straight forward that the risk of breaking 
something is probably very low.

Acked-by from my side, but Alex should probably take a look as well.

Regards,
Christian.

> ---
> Changes in v2:
> - Rebase against linux-next.
>
> Previous versions:
> v1 -> https://lore.kernel.org/linux-hardening/20240222180431.7451-1-erick.archer@gmx.com/
>
> Hi everyone,
>
> Any comments would be greatly appreciated. The first version was
> not commented.
>
> Thanks,
> Erick
> ---
>   drivers/gpu/drm/radeon/radeon.h         | 1 -
>   drivers/gpu/drm/radeon/radeon_display.c | 8 +-------
>   2 files changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index 3e5ff17e3caf..0999c8eaae94 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -132,7 +132,6 @@ extern int radeon_cik_support;
>   /* RADEON_IB_POOL_SIZE must be a power of 2 */
>   #define RADEON_IB_POOL_SIZE			16
>   #define RADEON_DEBUGFS_MAX_COMPONENTS		32
> -#define RADEONFB_CONN_LIMIT			4
>   #define RADEON_BIOS_NUM_SCRATCH			8
>   
>   /* internal ring indices */
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index efd18c8d84c8..5f1d24d3120c 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -683,7 +683,7 @@ static void radeon_crtc_init(struct drm_device *dev, int index)
>   	struct radeon_device *rdev = dev->dev_private;
>   	struct radeon_crtc *radeon_crtc;
>   
> -	radeon_crtc = kzalloc(sizeof(struct radeon_crtc) + (RADEONFB_CONN_LIMIT * sizeof(struct drm_connector *)), GFP_KERNEL);
> +	radeon_crtc = kzalloc(sizeof(*radeon_crtc), GFP_KERNEL);
>   	if (radeon_crtc == NULL)
>   		return;
>   
> @@ -709,12 +709,6 @@ static void radeon_crtc_init(struct drm_device *dev, int index)
>   	dev->mode_config.cursor_width = radeon_crtc->max_cursor_width;
>   	dev->mode_config.cursor_height = radeon_crtc->max_cursor_height;
>   
> -#if 0
> -	radeon_crtc->mode_set.crtc = &radeon_crtc->base;
> -	radeon_crtc->mode_set.connectors = (struct drm_connector **)(radeon_crtc + 1);
> -	radeon_crtc->mode_set.num_connectors = 0;
> -#endif
> -
>   	if (rdev->is_atom_bios && (ASIC_IS_AVIVO(rdev) || radeon_r4xx_atom))
>   		radeon_atombios_init_crtc(dev, radeon_crtc);
>   	else

