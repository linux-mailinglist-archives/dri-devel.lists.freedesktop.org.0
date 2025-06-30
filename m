Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF8AAEE6D4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 20:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F71C10E4B3;
	Mon, 30 Jun 2025 18:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gfxt3CmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B3710E236;
 Mon, 30 Jun 2025 18:34:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQDljAL8IPe3i7bYRJ7JW/oLdnfCVucNEuD1I/PKKHsJSfOaq6WxAJOUh0Gcs7VYTTcsaa69b7xi3VefK8nC6zrUD9Wh6+fYeG3o8+B/qz5dbB+zrsg/5gGWQO1GyFvP02ZvBfJBxLOySE2G9yaHHFeeK96UGHTVd6o/FGfhmImfGpvk2qLhem9BTrctfvIhyC+NtUs3H4PmCmbaDbt6/EPwrrggMhzdIKGrcUgwy3apOtroku0/gxSLWZJG20WvD/B9BNJH/50ewoNoe5ppYQfucCupm1Q9GtZ9VFgzcFtXzTUHlo2K3aqGVHv/qMvqwHO8vfDL2JeusUHYPwC6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55Ld5p6fiHfyEAU1Ve+ugQLXWHmoS2SrLFwSWRYDWuA=;
 b=kxIUqhdUt+7G+qReyiNS1i5FdJkYKOXXXpOaj0xwAanqYt4UDuHpou2bI3abJeKxEuXNbIQzWMI/XMFkjL3KVP69APYTcguUoEOv7HVBpMKyEZuuVWhWhROsvyxiHqvQ8O5764HpQCo+hJPMZ0N0SDFosDyJEW8G6vep769hV/1hO5RxxhILSBouebyL2SXvTSDdhxZDsYMP4MJHBlA/dCpAdUPbdnSFNBesX+RG+GNYt9O9PorCa0l/+7i1uzp5RrBGAdA9SBFNauF8sXZwo3auUNUEsUCdwkpd7xNr3uEwr+DogruLI6PrFpOkCN4Kx3XIY6sUyQ/PQghVPR2efA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55Ld5p6fiHfyEAU1Ve+ugQLXWHmoS2SrLFwSWRYDWuA=;
 b=gfxt3CmTlPr2XrrBl4u2JV6wIs6KrFpyrGZ8zGcsXFlqdDlzMMj5FlIgMUM7oczRouSAXsraU8ruaJszEqU0Pn/PYn8HsOmjbKmijrk2viE0TNj9J59PrUILNMa7EpzwHYqztB8C1iN9gqWP+59roWloAKXKTx8hWFU8xBefY0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6544.namprd12.prod.outlook.com (2603:10b6:8:8d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.30; Mon, 30 Jun 2025 18:34:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 18:34:44 +0000
Message-ID: <d8ade1e5-c173-434c-bb81-e1365a5ec339@amd.com>
Date: Mon, 30 Jun 2025 20:34:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: move the debugfs accel driver code to drm
 layer
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250630143613.2520111-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250630143613.2520111-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAP220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 35347eb5-4c25-48be-1ec1-08ddb804c86f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OStpNTFyMFdGZkpjRnRYeGx4SUhsbzVZNUhUSVdDS3h1U0NLN1lpK2tUK21V?=
 =?utf-8?B?RlU3Z3NCRko3Y3RVRzlzQ2IxRUM4a0x1dWFPTXJaVnZ2M0NhYjBnYi9qcEdD?=
 =?utf-8?B?ZmJGY1pwdmRHTGh4d3NpQURINDhFU0FNRXFUL0l2WHJ5enlGcWRGaFJ0U3B6?=
 =?utf-8?B?SUxiUEdPMDViNFMxMi9qakpZZzlhWXRZWGViT21wNmJXNHZaV3VxY3V4eldI?=
 =?utf-8?B?c1NQa1ZjQnNuWlIxNm1SanZDUGlrL0ZhRDFoRHhMT3pwS3luTFRyQkc3YnJX?=
 =?utf-8?B?ZHF4M0c4ek0xZEN3eHVKOU5ESnJCWE0xZWZZd2U0QlZaRGRzWFpTaTVMQ1hs?=
 =?utf-8?B?K2xqQTdWTjduYW8yQlB6SE9ReFFhTWlveDgxTnMvZkZzcGIvaVJXTEpJU3Bx?=
 =?utf-8?B?R0NwazJRZUR1aDlSQ3hvOXJuK0JIczdnajc4Sm9URGl4WUhOazhKWlhZQlJJ?=
 =?utf-8?B?T1pDczMwenc5ZnRpOFBFaUlCbnlBYmh5anZ6TWJoMGdSYW9MWWtDejRKNlor?=
 =?utf-8?B?a3c2SXhjKzRpazFqWDFYc3BiRkduVS9iYUtNTm5sV2pwTkNkZ0hJV3BMU2dU?=
 =?utf-8?B?Y2dqZEFGMUNxdVNwc0dsWXczT0QwN0J2QkZUNGw0bi94VHh4cTdXY3kxYXpa?=
 =?utf-8?B?RXdNd0dpMGM2eFZ4N1U1VUJVY2Y0OTQ2MWR5RmlVUDN5S280dEsrb3RkUFAv?=
 =?utf-8?B?QkNKRTNSZXZlS0MzRCtJQkRpVUFOQkRXQ3pYL3V3K3NBVW1uNTZqM0owbG5M?=
 =?utf-8?B?dW1ZN3kzcmR1TXNDRlJyZUR6MWl1Rk5uM1EvUXJ3Y2k1TU5HWU44NnBuTURx?=
 =?utf-8?B?Q2w3UFdZSFFpa1hTTWczWkk4OU5qOWVRTVJMZ09RbStxQmVBdWg0VTYzbitm?=
 =?utf-8?B?Z0N1alVxYzgwR1V1MDBZaS90aTdTWTNqRUhBR3NqQ2dWNTl0Nzh1anRFT2Ur?=
 =?utf-8?B?alg1b2I2VGczZHErUndXWHEyeXpDR0tzU2F3bHdZc2VXUnpqNmZVQTlibFhr?=
 =?utf-8?B?bGpsNUQ1SzlQdkhBN1N3RlU2M29KREpreHhyR1NlSGFoeGNKakdzSUdSUUhK?=
 =?utf-8?B?T01CMmx2YkxLLzlxMFdQbDd6d2tvanJpK0pLYmIwYXRESDRBcU1FUm9lU2ZT?=
 =?utf-8?B?ZzIzWVlrVGFnbE53Y3IwcWpIUVB2R3JBNm8wSCt0cUxDd2JKTkErL0U1NGIx?=
 =?utf-8?B?M0VBN2QyWjRONEVDdUxUNTdqTEthTWVIdkhFRm44aG50Y0M3RzJURGlwV2lL?=
 =?utf-8?B?WEdQV25wOVBDUFk4ZEZyYUNhdDA1c054OUVPdlpCRmVZWGoyL1JrSXJMWDRh?=
 =?utf-8?B?V3hyZGk0UjdPcnZ3YnpuTTB2TXh2QytJUzhyWkhTcHU5VXBydm0wYWtJUTYz?=
 =?utf-8?B?NExjV0E3VmZKMzR3czNmOUxtMVBkbFZWbERPeXovWGNmN016L2RydUtQYXMw?=
 =?utf-8?B?ZGJZTURuWmVhRFFCckNlQ2UxV21KdE9UbTZEVFVmc0hYLzk0T00xTXQvVktC?=
 =?utf-8?B?TWtMeWNRZVFOZVpUR080K0prR3RIVys2VFlqOWFPeXphZVc2VkpUTWtVRDhs?=
 =?utf-8?B?WUtPejIvcTB1MUczMk01QTg0MnRpNFZXeW9Nby9jTGZtb1oxcmNJZEFEK0Y3?=
 =?utf-8?B?OG5USGoreHhYY0c1TUsxUmdpN2lIWkREQngrR05BU2NSZE5lakpvcUQvQWdY?=
 =?utf-8?B?REtsdU1vaU01ZDd6Ylp6TkcxamtwT1RiVTNLSDBvS1hVQTB6Z1ZtanVORURs?=
 =?utf-8?B?eWFxVVZ2U2kxR09XbXFjc1BlMmwrdWQ1elVZNHNodkFiakFTck12UWxZN3dk?=
 =?utf-8?B?UEgvV2VBZEUxWTNqV0hMSTk3QzJyRStReG5IV3FTTXRYamw0Z0NFa081M0Yx?=
 =?utf-8?B?NkM5ZWlOckcxREZZY2YwVXlyOFZKQ2o0dDVQa2ZQd3laY3JzM1VNbkJXbXcv?=
 =?utf-8?Q?/b6j1MqcvI4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmxTbDJZdlQ4a3ZmcGFEU2ZYSS91dkhyc0gvNEpyQnY0UlVPamZuRXpKbHFZ?=
 =?utf-8?B?aUwwU0hBVUMvSDE2VmcrVy9SZjhRbTRUb295RnY0eXlOU2MzUzYyYXZJV1Zu?=
 =?utf-8?B?d2xaLzk4NUtnd1ZvTDVrUXE1eElzR3dkVE5vU0xWcnhCdzBHRUZ5ZEhqVlg0?=
 =?utf-8?B?UGZibFgwaHQ0TlpnbThVZVQxQjdCcmlCUWpEY3R6b0RRUjZhWE4wVTdjdmtZ?=
 =?utf-8?B?UTFWS21VQytNTFVEMjl1bUdyOUM4ZVB4TzJzaFZobXQvbHVhSnluV3ZPZTdE?=
 =?utf-8?B?ekdQOVJ1WXRCV29HY3pHTjJyMGZ3SGpMR1lidkJRdEtoenBQTTF4cUFCa0ow?=
 =?utf-8?B?cXpEV2xTdVhRbXMyVmtQNEJlMWx4Rm00SjZlT2RTVlVVQzRvODZaSmdKYk5a?=
 =?utf-8?B?TXpqNTUxL1J0UTZpckZ4N2dOREYwSEkwL01jMExIeUZqMzR0amdIWERaVlNX?=
 =?utf-8?B?MWVZTU9ldWhDWCsraVhpdDZteDZ1WE5PeVpwbndjSVg4MjBOZXNZdlR6OXdq?=
 =?utf-8?B?VlhDdkUrcW5kT252NVpyWGJzSUNjY3NjRVFkRVJRUFM1bkdyU2swUENvVDlB?=
 =?utf-8?B?UTZFNExPTURWOXpNWlNYTjB6ejZJemNONW5XcFM4c04xUG1NMHFoTHZTWVFu?=
 =?utf-8?B?dWUvYkRKTGdoaWJpazU1ZlI4YXMwM05IQ3BTQTlYRlRCZ3ZDT3RkbHpzbzY3?=
 =?utf-8?B?WEhDeERiSVkvV3pCZGtKajBwMG5HaVNaMUFFeW4xdVM0ZDlVU3FHLzN0dlBa?=
 =?utf-8?B?d1RXbG9iMXRRNy9nRHRjcEZWWnJaTUVWdFNQYkdZdVlyK0hPc254QUVwZFBP?=
 =?utf-8?B?aUx2dTFUMXlqUTJPcG5lZzBNUkE5bnJ1MXMxWWtqblpteE1vK2xLbzBzL0Mv?=
 =?utf-8?B?QzVKcG9VSGdXT291NTJzaHBUd1QzNmdvaDVsYUNkempUNVB2a0J0K0dTT1cr?=
 =?utf-8?B?cllwK0RtQmFtSzdab1ZVMDhjRzRGT2FxQ3VSdTYvOS9ZeVR4STZoSlNMY1FO?=
 =?utf-8?B?Z3JkV2xWTHZKQlNpbnI3TkVFOUw4SmUrV0pyOFRIVlJ4UUp4OGRmMWlRK0VK?=
 =?utf-8?B?K05yRU1FSEVBUVpTaldicmZmMGVMS2pEVzNzNHdUcDNtcHdzMWVQYVJHUzZO?=
 =?utf-8?B?dVFvTVlFbkNmajVIaVZYZG1hV0ZyZ2VXVmNhRmxON0Q2ZXV3Q0JtNXo1cUp4?=
 =?utf-8?B?YldYYlJyVWNCaVJCZzRqdGNLNlllaVlaQUdyd3h4RHVKa2JIT1c4WTdERDQy?=
 =?utf-8?B?RzREK2hnUzgvS1l0UHNLSEFxSEd3UlVkYlRvcmQ3OU9BQTVTQUh0cDZ4NHZ4?=
 =?utf-8?B?UmUrcGRsNG5iUUkxY2JaK2JxMHNuMHU5S3pSUlBkdi9SSytQbGo0MzdEM0N3?=
 =?utf-8?B?cTBpanFFaDJ1ajFKaGl5ek5WWUhCQjNlcSt6UFVnc2NRZk1RZkJYOFpuNXpZ?=
 =?utf-8?B?Y2Q5aUV0Z3lFYk4yQStmVmU4K2kzaitWVWZXVlIwZmFZODcvMGoxUURBYll3?=
 =?utf-8?B?QlFQR2VzdUVQbnlQaWFzYWZUOUJIaWx0b2ZqYVc1RldLZ0RFTVVXU2cxSXov?=
 =?utf-8?B?dW9GaDNDc0JNNld3UzhZMndHcVp5YlpjL3pER3oyTnlGSmM5TDRJYmZ1VGEy?=
 =?utf-8?B?RERqanBBSFFJREl2Lzl3NVBmZXozcGhhNlRJaEJ6a1psNS9yQlJPcUVVQThV?=
 =?utf-8?B?WDB4NWpZcFZXZ25aUWRmZnN1TDl6Ni9YM1B6LzNOMmJ0WUhBdG1raGxiK3B0?=
 =?utf-8?B?UE1lL2gwZEx6Sys2VmlxMVBuTGtCMVhuWjRqWmt4Q296OWhyUDUyY0VXWFRH?=
 =?utf-8?B?V0k3ZUtlbzd4NHRSbWpLOThBd1FudVExU2JGK2ZVMVAxR3ZUdlhvN0huM0Z6?=
 =?utf-8?B?NEdzTDA2OUNHTlBZNmhLbkFReFlOaXdBcGJzbXZ6UzM0bVFMZW95T1RwWjd1?=
 =?utf-8?B?YUNFR0tzbEVzaXIrUmtqc0wrc3VLZzNLUzNkVkhPVy9ibDdoOFcyM3dKVFVw?=
 =?utf-8?B?N28xampXMlFvdVZxQTdmdjg3SG9QVzlabThkMVZWc1hRRGhvTmlLdkhTY0lP?=
 =?utf-8?B?UUF1WE5uSXBiUk5hSWJBMXV6WmJ6cTNacThKeHdLRzBJTm1yN2lOWjVEWmd6?=
 =?utf-8?Q?KAXULvI5hjg3K9AtvHyXw8NmD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35347eb5-4c25-48be-1ec1-08ddb804c86f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 18:34:44.0447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgH3/AFX5BzQZ6aQg3T/NoiuVE9EZzJP+4RWmUTeBv7Ojth7gqvZ2JTP06HzDXV0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6544
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



On 30.06.25 16:36, Sunil Khatri wrote:
> Move the debugfs accel driver code to the drm layer
> and it is an intermediate step to move all debugfs
> related handling into drm_debugfs.c
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/accel/drm_accel.c | 16 ----------------
>  drivers/gpu/drm/drm_drv.c |  6 +++++-
>  include/drm/drm_accel.h   |  5 -----
>  3 files changed, 5 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
> index aa826033b0ce..ca3357acd127 100644
> --- a/drivers/accel/drm_accel.c
> +++ b/drivers/accel/drm_accel.c
> @@ -20,8 +20,6 @@
>  
>  DEFINE_XARRAY_ALLOC(accel_minors_xa);
>  
> -static struct dentry *accel_debugfs_root;
> -
>  static const struct device_type accel_sysfs_device_minor = {
>  	.name = "accel_minor"
>  };
> @@ -73,17 +71,6 @@ static const struct drm_info_list accel_debugfs_list[] = {
>  };
>  #define ACCEL_DEBUGFS_ENTRIES ARRAY_SIZE(accel_debugfs_list)
>  
> -/**
> - * accel_debugfs_init() - Initialize debugfs for device
> - * @dev: Pointer to the device instance.
> - *
> - * This function creates a root directory for the device in debugfs.
> - */
> -void accel_debugfs_init(struct drm_device *dev)
> -{
> -	drm_debugfs_dev_init(dev, accel_debugfs_root);
> -}
> -

As pointed out by somebody on the mailing list this doesn't remove the accel_debugfs_init() dummy which is used when CONFIG_DRM_ACCEL isn't enabled.

>  /**
>   * accel_debugfs_register() - Register debugfs for device
>   * @dev: Pointer to the device instance.
> @@ -194,7 +181,6 @@ static const struct file_operations accel_stub_fops = {
>  void accel_core_exit(void)
>  {
>  	unregister_chrdev(ACCEL_MAJOR, "accel");
> -	debugfs_remove(accel_debugfs_root);
>  	accel_sysfs_destroy();
>  	WARN_ON(!xa_empty(&accel_minors_xa));
>  }
> @@ -209,8 +195,6 @@ int __init accel_core_init(void)
>  		goto error;
>  	}
>  
> -	accel_debugfs_root = debugfs_create_dir("accel", NULL);
> -
>  	ret = register_chrdev(ACCEL_MAJOR, "accel", &accel_stub_fops);
>  	if (ret < 0)
>  		DRM_ERROR("Cannot register ACCEL major: %d\n", ret);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 17fc5dc708f4..5d57b622f9aa 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -70,6 +70,7 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>  static bool drm_core_init_complete;
>  
>  static struct dentry *drm_debugfs_root;
> +static struct dentry *accel_debugfs_root;
>  
>  DEFINE_STATIC_SRCU(drm_unplug_srcu);
>  
> @@ -752,7 +753,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	}
>  
>  	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
> -		accel_debugfs_init(dev);
> +		drm_debugfs_dev_init(dev, accel_debugfs_root);
>  	else
>  		drm_debugfs_dev_init(dev, drm_debugfs_root);
>  
> @@ -1166,6 +1167,7 @@ static void drm_core_exit(void)
>  {
>  	drm_privacy_screen_lookup_exit();
>  	drm_panic_exit();
> +	debugfs_remove(accel_debugfs_root);
>  	accel_core_exit();
>  	unregister_chrdev(DRM_MAJOR, "drm");
>  	debugfs_remove(drm_debugfs_root);
> @@ -1193,6 +1195,8 @@ static int __init drm_core_init(void)
>  	if (ret < 0)
>  		goto error;
>  
> +	accel_debugfs_root = debugfs_create_dir("accel", NULL);
> +

We should potentially make that depend on CONFIG_DRM_ACCEL.

Probably best to merge the first and second patch, this also avoids the question why we have the first patch.

Regards,
Christian.

>  	ret = accel_core_init();
>  	if (ret < 0)
>  		goto error;
> diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
> index 038ccb02f9a3..20a665ec6f16 100644
> --- a/include/drm/drm_accel.h
> +++ b/include/drm/drm_accel.h
> @@ -58,7 +58,6 @@ void accel_core_exit(void);
>  int accel_core_init(void);
>  void accel_set_device_instance_params(struct device *kdev, int index);
>  int accel_open(struct inode *inode, struct file *filp);
> -void accel_debugfs_init(struct drm_device *dev);
>  void accel_debugfs_register(struct drm_device *dev);
>  
>  #else
> @@ -77,10 +76,6 @@ static inline void accel_set_device_instance_params(struct device *kdev, int ind
>  {
>  }
>  
> -static inline void accel_debugfs_init(struct drm_device *dev)
> -{
> -}
> -
>  static inline void accel_debugfs_register(struct drm_device *dev)
>  {
>  }

