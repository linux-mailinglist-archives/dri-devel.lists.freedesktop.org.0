Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8164DAC67F5
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 13:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FB18984C;
	Wed, 28 May 2025 11:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kokTXnuX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B9110E095
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 11:00:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfuI+Ath4G8cf92W8tPomelhNZuVuScFeintFJ16NneVyLyCKpc9J/mrX+PFoceHKiqo1klB0s4nReZwBWlU5SdLgcugOXKo4Y8wDYbtCVxAW/DCJcyuoziERw2E+ZkGvYJnvaFozP4/FPZTlbCn5gO5FY+AwgdEkWac9VKSFExnxM9UbDXKSBD/wrfSAc4JqpYNehGd3IHPApI6M7roFPkZ/kPPERFAlk9lL9qIfaKjoBNvmpxE2o0chXTYoyHfRKnk60fOW+hPO3kkd9ce8/lP0jlACI9MMnqXj20WqpfO5NsZDFTPn0bAh14kCuVbB3iZNIPKm0ZMCegrfNLYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABTDyA1YKjS+TLrkzipkC2+HPMC26gnf5Lxoo7obw4s=;
 b=O149HxZPNyll/pfBHKVxYXhlM5SYZMqZYzcjqWszY2SIn/xXDx0GlDRyyvuTw3n2zCyWi142KVS766Y3/7gxnxMbaGseWQ7Sj2XRZ+NlRW541fQY7bXrqWWz+1TWnNyjXTwe/aMpkf14ogkIwlWC6JLaHeNnS+yY8nvlus0tIQu8CHkMr17mKZHeoQUwb8AUuQ+m01ZpRJpgDzrPgyOnCirvqJ89kmD0G4Yuc9J4L/2Ms550bdN8de39fVOb4g20D+66YU6A8rbE9X9Xtse0Q1Noh+nwDvu/BU0ZE/LO5yIy8D8iZYRUmg1Dc5/rZRm9bOwORcw93Crn4g8xvfHtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABTDyA1YKjS+TLrkzipkC2+HPMC26gnf5Lxoo7obw4s=;
 b=kokTXnuXG/1SV0yCGdHtkVzBgqXtlX7F5V7Dqo1uW0n/eA7BoRJ0oJfY16QXnF0P0XpF8/D6xWBLHoDF18V9yATwyjFq7GiQ5kUFV5xWkyyeaxqdWC/ts6kObAaQUMBAQ38fniRjtXaxaR1JXLE+/Wc50jEy97iJyqPfTR4dLk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Wed, 28 May
 2025 11:00:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 11:00:44 +0000
Message-ID: <96d0a239-415c-4f61-b4c6-1f9b9d948736@amd.com>
Date: Wed, 28 May 2025 13:00:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/debugfs: add client-id to the debugfs entry
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dmitry.osipenko@collabora.com,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
References: <20250528072248.1490819-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250528072248.1490819-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL6PEPF00013DF9.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:c) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4084:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc03bb5-8eab-4fa6-17e0-08dd9dd6e4af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGJZRzNVNHVaTEhCZkNSbkpEdmFDUUx2R2dUZXZqOS9ad2lESjFwcmRBdU9U?=
 =?utf-8?B?YzZsVnJ5Ui9Lb000VmNjQjFhdFJMNEFwRWVQa1I1Yk50d01Tbi81WDJwNEZk?=
 =?utf-8?B?eXp6QlNPbWFSbUZDdDYvbnpuUEdSbndUanh3NnlYKzJKdEZBc09UMVd5U0tT?=
 =?utf-8?B?ZDVhVlE5aWhTOHU1cDVGYng3eHBWUEU0Y1htWlIzTlpqVkJyK0w5Rzd0VXds?=
 =?utf-8?B?UTc4WUIzSE5ONG1ibDNQakJvV0Qwc3dkdzdFWjBJNERkNmdTMys0a3pYSWpx?=
 =?utf-8?B?bnZ1aENqZ09KYUI1K2JqRVlIMXdJMWtadTJXYy9oSmZHSEtJSTJwaTN3WGlh?=
 =?utf-8?B?dlppNHBWQSt5M2c2elpvWmhpS2NYMnRSdEsyN0h4KytGNzIzTThYWVRFZjFl?=
 =?utf-8?B?bGZ5R0lUNlFWQWFBcGFhL2N5WHI1RzBjQ0xZbmNLZk4yTTkwMkxDUUh3c2Ey?=
 =?utf-8?B?a0FMTjZRVlpoOE41eHYySXhDRm9VZTNaNzlFcG5rTGMva3ZCSXoxZHFxOGtB?=
 =?utf-8?B?R2pZWnJTbTErNk82akY1Zk5GV0NlOEVBYW1jKzY2NWtIU1lLanBBVUNVNXFy?=
 =?utf-8?B?Wi9SSlVFREsyV2VsUzNFTVA0bHRHNjV4WkpEODQ5Y2FBZ2RxcTVPUHZIbjdk?=
 =?utf-8?B?N3NPaEFHZXZrSnYrSXBzQlhpeDkxNlpZVzA2Y1pqK0M1WnU4Ym9ham1zUzJy?=
 =?utf-8?B?ODF2UlYvOHlSdDArdFZ1NE1INXdFNjlaY2Y2eGdQbzN2U2VBd1BKR1laeENM?=
 =?utf-8?B?RVBtRFNYWnRUUFJQQ0QvTmFMTE9zS1BDc2dqN2Z5blRvNGlIZ004b2FPT2NR?=
 =?utf-8?B?OGxYMmIzRWxTSlloS3lUQ1pDUE03eC9PcGx0c2lJYjZNTHNaZEkrTldBZm1j?=
 =?utf-8?B?RFZDc1NaWWtmTUJoeS9QNEdlSnhic1NOMmhTSWU0bkwwZEROVUc3L1c4YlJC?=
 =?utf-8?B?L2tTaHIzMXI5emJhSzlub256SkRqVHlLS2NnZnlubmxxak90a3N4NEg4RStx?=
 =?utf-8?B?SlN5Nmc2SmJnRnRKbDlVaE5vdUYvZlM3L1VBcy9PN092NWk1Mm5oV3IrbnpU?=
 =?utf-8?B?elc2Q2VTQllURGZSZGRoby9rNC90SllMSjB3cHg5dUlvbW51SXlkQlcxT0tM?=
 =?utf-8?B?a0pBaDZ4TFhtWk92enczU2tTbWFJR3k0S3NJNGFJb3RaWW9Ec3dhUm9pbFR1?=
 =?utf-8?B?YXJMN0piSzZJYTh1alBpY0FzNkVuYXZ0OFNCbVg5a0JpQ1BzalFsLzJkREZx?=
 =?utf-8?B?enVZSEJxNEVzVGxRaFlQcUNnOXUxcFlwZXhmZ2I1KzJ4YlZnbDF5OWlEWjB0?=
 =?utf-8?B?RkRqaU52NTIyYlgzNVp3L2hiU1dDS0FSaldqVCtoRmU5OWhNZkpzVTZ5aEtR?=
 =?utf-8?B?K2ZuckRHQkwyMGRXSVM3R3kza0cvTEtBNjZMV1VyZUorSjc5R0x5MGRydUhS?=
 =?utf-8?B?cWlvUXl6VXgzTm1wZElZME9zUTZUME5hVFZ0dG5pNjVFS2ZHS0R3U3ZZWlNW?=
 =?utf-8?B?TlgxR215bElScWhYQ1ptdHYwUWlQUU5NQzBuV2JobTVtTkVTdjJKOWlxbGRu?=
 =?utf-8?B?cXNpbTROcGJWNDVQRDY5TU9tdkNuN2tRS1ZjMzB1YVFxeUkyZFZSNXkrUGVE?=
 =?utf-8?B?WWRRTDZnRHdwOElKMGdNS1p6OGlzY0g4L3N1Smh4L1hkR2ZVYlRnM0U3c2tu?=
 =?utf-8?B?eUJFMzZKenJPL0hMb0RZTmhIUk0xMlJjY3ROZVI5eEx6dDY1NzlldFJJNnVC?=
 =?utf-8?B?QW1YZUpJUXZNRkpVQzUvNW5FSzJZZlFCcGFKcFZUSHl1NWozTEprTEpTWTNp?=
 =?utf-8?B?Zm5LRTVod1BZUm1WTXRVbnBoMGplVzExZ1dkbEtHNFRlaDJsUmMvSUlSaEdn?=
 =?utf-8?B?Y0JGWXhiRFlKcURoK3pDR1luSGRxMjEyamdPSFFTUnZrSmltU3VNakxETU4r?=
 =?utf-8?Q?d/HGKr9A+L8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1QwWFppQU5FS3FSQ3FKNmNlblRYeXlFT1B0aVc2a0hweUtqQUJ5ZDl0Rm9H?=
 =?utf-8?B?OWVCenZMcDZYRE5BRUs3L04zb1VORkVmZkd5SmUvVHNSWDFxVVZINGl3RHlx?=
 =?utf-8?B?Myt2Y0xmb0l5TG5zNGdJWCthVWJNRHVsRmh0eWZnQnhuUUZYSmJMaGMwWWhz?=
 =?utf-8?B?VUp3UzdJWVNNYTRWK0dxVlZYRnp6MWhoRnozS0d0czB4NEdHelJoYVE3N1NG?=
 =?utf-8?B?WW5aRTVOWGJnWXNqTklrUEFvMXdpazVXbHZMcnhvWHBxMEZTaUNjaXdHRmFv?=
 =?utf-8?B?Rmwza1NzeDlQM24rbHVtYmNzU3dpN3FVVXhzOHEzZXVoYzI0UThqT0dNK2Ft?=
 =?utf-8?B?YVc2WXgrSHkxYW5wY1M1RFZ6LzY3bzZqVGxLdHIyY0xHR0RvdXdBcUIrS1Vn?=
 =?utf-8?B?THZiMkREc2ljeFdnUDVva1BKbnlGM3B6alBKN2lwZVY4MTI3ald3QkhGKzA2?=
 =?utf-8?B?cDFqN2tLTWhSZkVWMXMzN1hCOHRWM0U3dG9VZkxMYXVFWUV2eHRqWlBobkh1?=
 =?utf-8?B?Z0FaZ2ZGbUREUXNIMno2S1VEeUsrNGFyazE5a21BNHRTd2dkbHFkTEZoT1Yv?=
 =?utf-8?B?NEljMmhZQVpBSEpiampGMXhocndOdGVCaHZhai9HUExjaHNQQm1pNXU0eCtY?=
 =?utf-8?B?d0s4V2pma1dQQjVsMmpJUXpXZC9uRi92RGQrY2k2K2ZlRGZKVlF4U1pqL1dC?=
 =?utf-8?B?aHl2dzFDSllwNTlLR2p2SllXWWU3Y2RtWHV6Vi96SUhyVFQzY1V6MVZVMUMz?=
 =?utf-8?B?RmxSeUoxQzJqTlNLZmVPRXZZL0dvSlZuNmRscUF4OGkxdTBUMHRtc1N2SjZB?=
 =?utf-8?B?ZTNlK0Q5MHBnQy9mZ0VnVHNWUkNDaXpNWlZPYkNUcEgzcVhUZ1VKNHl4cFA2?=
 =?utf-8?B?OWVMOWd3Uzg3QzdvY1c0TG1qNWZpTnNXWjNNeGowQ2FnWC94QldFeWRwQm5x?=
 =?utf-8?B?czYyY3UrT0ovcmpWcnBZK0duNzdxbE1JamxiOFpubDFxc1ovWmJIYXVsVGJ5?=
 =?utf-8?B?UUV2NXl6OFgvZ2lQVG81ZEgwRVVzU0FjRE50RS9oWGdzOElsYmx1V3o0QXFj?=
 =?utf-8?B?azRpYVo5eG0yU08vZkR5UmFjZWhGa0pvdmhNZHF6L0JCZDYreTZXb3dKR0wz?=
 =?utf-8?B?YS9Mc3dCSWRlNUgyejZSNFVFTGN6QmVyVTV6Tjg4L1ZoS0c0cXhwcGg2b1Jk?=
 =?utf-8?B?enBBVTJuRjRxbVR4NmhTTU5la3lBZ3NMY1VEaXF6dHdBMW54cjR1di9XYnpy?=
 =?utf-8?B?c2c5YUNqaWhtVTVydXhOUG9rSldaM2NFNDAzaGxtb1RhcmVKWTM5UFNqaVdC?=
 =?utf-8?B?WEpIcjJ4TG5Za1BINm95OWhhTXFLdmRNNzcxOU8vZGhkczRydVBKdGYyemhV?=
 =?utf-8?B?MGZNVkdBNVRBdUVQWnJkMDBNdnFocE9NWE9yQmhEMlZjRHp2emdudGRlbjR2?=
 =?utf-8?B?OEkwNFkreWZNM1RrTFlXRHF2SFBGVHg3ZDF4cExHMldtYjZuMTBrQW5MS2NV?=
 =?utf-8?B?dnlaRkZEMDJydEExZGpKelhmRUl3cDJ0dDJkSWNSakFsWmZWa0ExUU54L0Vp?=
 =?utf-8?B?V0p6VmVkM3dQR25ESUFrZ3YwMDlpUjVnWnZvVktmMW9jMDNDaGQ5NnV5bU01?=
 =?utf-8?B?VHJ3NlJEL0NFUDBsenZuOEN4ZVBGNmVVbzRDZ3pOMHJ2T3RqUmdJa01WNHl2?=
 =?utf-8?B?QWN2VjNsUmlGei9pVFJiYmx2SFY2dVIvQXU5MXZvSVRodFJRVnBFZGhtYUZL?=
 =?utf-8?B?ZFUwYWFiOTVXcWtvZ0tZcEVhZTVva1V0aXZrQWFUY2xFdVhMQ2k3ekFITEJz?=
 =?utf-8?B?VVRqT1FXYzRwYk5uOGdESkFxZWRIMlBMVmlUSmE4WVpWbE9nS0k4MnRsa3F3?=
 =?utf-8?B?VytPNjYwQTZlWjdzQVVYa1hsRlZRY0N2d2ZnNDNVeFRpZUx0Wkd6aURGcDRn?=
 =?utf-8?B?d0xjQ2JrYnJ3WVMwaDkwVEJaYS9VeC91OFJPOW9PRGl0VkNSaGw1QWI4QTEz?=
 =?utf-8?B?c0xacUYxYzU0eUdoZGxjNzAxN2FVRjZnTmF1RW41WDJZMFdNRHRaSVJtRnl1?=
 =?utf-8?B?dnVveDRVdFRMMVdod3lzcGxuQjdnaTlyV295b0EzcGF5bE4vYTRrR3lKSDZq?=
 =?utf-8?Q?8yudIBbk/tyVRlqgUvkZVtxFM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc03bb5-8eab-4fa6-17e0-08dd9dd6e4af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 11:00:44.4404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8D3Wulxs4PH+X+/sKzWGrkc5IQWnYawJawBzw6+AlWCQLqf44ET0vWZ5ERG1Pod
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084
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

Adding some people who worked on the client name and client id fields.

On 5/28/25 09:22, Sunil Khatri wrote:
> pid is not always the right choice for fd to track
> the caller and hence adding drm client-id to the
> print which is unique for a drm client and can be
> used by driver in debugging
> 
> One of the use is to further enhance debugging for
> amdgpu driver based on client-id.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b2178864c7e..2d43bda82887 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -77,14 +77,15 @@ static int drm_clients_info(struct seq_file *m, void *data)
>  	kuid_t uid;
>  
>  	seq_printf(m,
> -		   "%20s %5s %3s master a %5s %10s %*s\n",
> +		   "%20s %5s %3s master a %5s %10s %*s %5s\n",
>  		   "command",
>  		   "tgid",
>  		   "dev",
>  		   "uid",
>  		   "magic",
>  		   DRM_CLIENT_NAME_MAX_LEN,
> -		   "name");
> +		   "name",
> +		   "client-id");

It might make sense to print the client id first and then the name.

Apart from that looks sane to me.

Regards,
Christian.

>  
>  	/* dev->filelist is sorted youngest first, but we want to present
>  	 * oldest first (i.e. kernel, servers, clients), so walk backwardss.
> @@ -100,7 +101,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
>  		pid = rcu_dereference(priv->pid);
>  		task = pid_task(pid, PIDTYPE_TGID);
>  		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
> -		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s\n",
> +		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s %5llu\n",
>  			   task ? task->comm : "<unknown>",
>  			   pid_vnr(pid),
>  			   priv->minor->index,
> @@ -109,7 +110,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
>  			   from_kuid_munged(seq_user_ns(m), uid),
>  			   priv->magic,
>  			   DRM_CLIENT_NAME_MAX_LEN,
> -			   priv->client_name ? priv->client_name : "<unset>");
> +			   priv->client_name ? priv->client_name : "<unset>", priv->client_id);
>  		rcu_read_unlock();
>  		mutex_unlock(&priv->client_name_lock);
>  	}

