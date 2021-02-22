Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2A9321804
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 14:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B416E6E505;
	Mon, 22 Feb 2021 13:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE226E505;
 Mon, 22 Feb 2021 13:09:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/zH0Re/niRi9W0Epr55XYTy/qXxTMVE0lJQKkBeG+DJyVJpcYS0PT15+0TznXxk3fhXmChonemhanCMk0McHgwjqLDqOPTGZWi0bwXCqkVt/zpE/8YK5ug8SxrGAKK+UEQCtw5pRgHF9Rhnenr6UHwulwuBzqCKEz4fVa+0/bGotCxbOwaavZGOnwnn7x0IkFX6Yb1TgaDV8xOa4WDrW3bZioqNpl/OThj5rFgcjJM4b2mF87Rtp1h/Uk+gRs9LEg/cgctwXzg//R/HwC9RWbRT38HtZr5IN2axCSfmt1uolY4y0Nr3snAwruKTBGCoNO9Ix3+q+5FIkePMndVT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdLEgtK6zgPGxnDHWZQfaUGRc9YfUtEZb3QdOK8yDKE=;
 b=dRzbtWZMioNdo3279o29/gG9hfolTLk/S/rjrwJlA7pmZYMv0Ca8Q3u8TMnVyfa5g29HMfIvQmgDzOvEuKCqJDRzDxtn6df15OINus+K2NOhS47sDc0zTJjt+IR/C+yktfExLD0x3qlAojk/QFlD8hEJuYDj+cgcaEJzHCPgvUDUlJGHIevC+3XrnhQSqVMLnNdvjLy4sz4HI22caMBKwBPUjCN2kuqwqKU3pVCNjwTgPNk7LbX/jSvRFjETJQhIgcb4AhCjXx3UdG5zaKRn1i7gNtPn8quNiOau3Alk/JDmO1VEyAiT7Xrpgc9BsHzpRx43uSwZkBU482xMp1l86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdLEgtK6zgPGxnDHWZQfaUGRc9YfUtEZb3QdOK8yDKE=;
 b=MpXBGwvgOGo/Xkbcl8jnlR40ZfeH0k7S1vPKE4H5n8mlIY0Appl4w3ci0XeTCuxJuPZlh9SwRyg+HzDksGAZiZKAwtQi2za1An5YX0Ugm1HXJmuRPJZBrOPN2JW4J7OSzuPhVcueVNDaxpt4A4TakteZUcojH/XQxTK+iBsTmxM=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 13:09:15 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3868.031; Mon, 22 Feb 2021
 13:09:15 +0000
Subject: Re: [PATCH v2 0/3] drm/prime: Only call dma_map_sgtable() for devices
 with DMA support
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 yuq825@gmail.com, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, eric@anholt.net,
 sumit.semwal@linaro.org, stern@rowland.harvard.edu
References: <20210222124328.27340-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b190801b-b8be-c9df-f203-3e42eb97cea4@amd.com>
Date: Mon, 22 Feb 2021 14:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210222124328.27340-1-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [46.189.55.12]
X-ClientProxiedBy: ZRAP278CA0003.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::13) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.201.250.142] (46.189.55.12) by
 ZRAP278CA0003.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 13:09:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 72a5d381-ab30-43d7-e16a-08d8d7330d44
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4390CC0EE9D261362738C9D683819@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EW0gjAAwW1/2Zm8iSUFJdBH80jre+lF1daZcJeiEai45G4ZwgChrG+Qb31rN0OYn+ywJVB//kNd9JFIBcCyPwhjn1Ngx3QVBvQPaRqOhfOfmon9jFFtLo0UJMMGhdvH6nvC65F/bmVosMcrb2PPEWw+Ny/z+bdIn+IKmXfRtSSmPgTbdwrS43Kroc/qTH8Wn6C3YaojkOtOFGmgUBbNcZkQ6hsZoVGo01HOeJtUMXVI1JKxr8Ac9O5PBu5fVNp1G8DdLKGP9fgvqahysRBRAD7Cf99Z8I1SNc188lH60Ep8qAvAxzyBx7VeQEdRqyl4ZlkMqFKV1zTbodtnKm6Hw3cs8kTkgcADYxEk0jYqdVx3W0eHGaHlkTjLfBAy/vw6i3BtBBKrEJ3IUjJKT4fCM8htSywmxEHcm7aJne0ZUSApbL9InC30rDEqsqJx9WQVHdR1/1tjyUcU1sYtA9hnPdUiETHmZdti8Dhmj6nqGLePnVWyHccvHGykyitnnqug3IG+D+R0zxtrq+9amE2Ura2TgPLlJhNixEa2AzzKaHS3OfoCG25zKJ6yNpDxb8jYgW6W5WrouwiOk5JeiIwxJNA7lHJG3MYTP4byVF333Sv1/7WaIjtNptaqdsENEEZRL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(66476007)(66556008)(921005)(4326008)(66946007)(31686004)(83380400001)(7416002)(86362001)(26005)(2616005)(8936002)(6486002)(186003)(316002)(36756003)(478600001)(16526019)(8676002)(956004)(2906002)(16576012)(52116002)(5660300002)(6666004)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L0c3NnJlL2ltNEZNclU5V1B6dHo5NlhCb0lBTFJkc2FGaCtmblhwZjdGRGRk?=
 =?utf-8?B?Q1AwMlY4NlEyOHM5RUp5a0dvR0g2c1E5Z2ZkR3hqajdNTFF6S1NPYng3bDh4?=
 =?utf-8?B?R1c3WVNrS1pKZkJlMUNIaGZhVzM2SEdRbEFhekJIUW40OVVVRk1zZGs5YmM3?=
 =?utf-8?B?MEJ4YmlvamlVT2F3ZE0weGJMZ3NOK2RRbGdTNG9RenUvNzkzV1U1aEJwY1Iz?=
 =?utf-8?B?WEdKVkVlcllmT2twQUdLZEZSTXFnTXZnaEJKRTJJempPeXZXTVdEaUhRS1Q5?=
 =?utf-8?B?K2JSZFk2anpHVHdPMGl4Y1FrNjNQTEViZ0dUMmt4a2lucUFwMVNaK0t0c1Y0?=
 =?utf-8?B?NzhtU2ZXdDVsbmtzYmhwcHU5VXZzSWNpamw3clVjS2VkSG4xTm5HZFFEOGJo?=
 =?utf-8?B?dU5XZUpFeWY0ZGM3aEF4ZlprbUNDbTVCWkl6NmluRUlvdjNnczV6a0dSQXl3?=
 =?utf-8?B?QkJNL0RWd09SQjBZaXY3RHVVaFpGV2xNQ2xaaDhEYjlDNTFqUTE3KzV3SHRn?=
 =?utf-8?B?dFRMb0dQQUx6T0hXNTlvbkg2akJMcEdzVlRuM0VFeVdKUGNsd0xqTzBzdU5C?=
 =?utf-8?B?WFZHRjZHRGlHNlBPdXRjZFdVZkRicnhPRnhhRWNuNFVXSERIdERnQ0NSZ21X?=
 =?utf-8?B?QUNOMUR5dEw5ODVSL0ZqajE5VDNvd2NFaWNiWWlTYkhMdnV4OWYrcXlGcUlC?=
 =?utf-8?B?eEZxOHliSC9WdjA5VDhLR2JjdkRZdkxxZWFwdGNzQ000VUJCcXlEajhVeWEy?=
 =?utf-8?B?ZWlxcmdMZHRRSG96aFpKQzRmNjVpWkV3QnpjTi84L1dncGlIM1MrczNMZE1n?=
 =?utf-8?B?RkpFeVZwK2llbDBmdTBQWTlzZ1BxQWk2RXJNeFJtTUVwdU05U0JsYi9DdFBv?=
 =?utf-8?B?N0dFa2VhQWlPaG5uSTR3RnY5Z2tSODRjR2RnM1p6YnZOWHV2M3BSSGR3UzVK?=
 =?utf-8?B?WDk3QnNvdDhnWGJaYlNiOFhTTVpjQldsVVVOZFRMS1hTeFZYaE1JTHg0TVVK?=
 =?utf-8?B?L0Q1QTFGOHdVVTU5M0o2SFBNcEM1ZHRvLzB4STUxeEFoK3pDOGNUdHF6MUIw?=
 =?utf-8?B?RmdPd1JVNHgvOWNvZi96YUd3ZEFzUHM1akZMeW03OGt1LzRlc2UzdG9wU29q?=
 =?utf-8?B?Q28zdU5BLy9wUmhyVXV2S3dzOVcyZXNmR1R5U2Q2V0dCcDI0MlVMcm5scHRj?=
 =?utf-8?B?QzhQSENBY1B5QzZNSXFhM3FCZ2RGL1VuMDJoVUFySDQ0cU5NTnB4cVJlQXN5?=
 =?utf-8?B?MDhvdnVsY2hmRFBPd3NJSWVLdFB1Umc3WWFBeDhqSTRITmllMGZnMVdseGdT?=
 =?utf-8?B?WE5hTkxSNU1UcGI1Q0pCcVdTTXE1dGxTbGpjWEE2YWVqZHl6SHgvS2Nyc2Zt?=
 =?utf-8?B?T1gzbXp6QnREeHB3VGt5WXoxaklzQUUvVTQrdWpYNkoxV0FyWi9nNGhqd2Iv?=
 =?utf-8?B?RncwdGN2MlhVYlN1RzdDWlVkRDJKdG5NUlBNYWxPWE5rK1FXb09taDYvdTNE?=
 =?utf-8?B?aUdEeWRhcTdXOEV3aG9YWmFhOGhyMjFVQy9UNGg0UXQ2aCtDYWE2ekYrY01U?=
 =?utf-8?B?T3FpRWJweUQ2VHAvWTRadG01SWFRcDE1eG1EUE91U0poUnFJdWh6aGR5YjdL?=
 =?utf-8?B?UEpmeEx2Skc3RTBReHR0NHhydUt5ZXFYa3NFZWtiYVEwN0p4WlU1bUJHa1JS?=
 =?utf-8?B?WWV5OEw3dnVlMkVvakszaktubXU1M3gxSFdoNkxaaUowTk5pdmFvaWVpdE1q?=
 =?utf-8?Q?pb0AeJQ3AVMUn0UOUxiZo7Ku9NR3wE6Zow+0j5R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a5d381-ab30-43d7-e16a-08d8d7330d44
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:09:15.0230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSGWGC7GzC45zpvU5LNy5h9LFe4r2LjfkiBOCnlWnYDKuKLlrxkACyfcnpaO5rl/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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
Cc: linaro-mm-sig@lists.linaro.org, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 22.02.21 um 13:43 schrieb Thomas Zimmermann:
> USB-based drivers cannot use DMA, so the importing of dma-buf attachments
> currently fails for udl and gm12u320. This breaks joining/mirroring of
> displays.
>
> The fix is now a little series. To solve the issue on the importer
> side (i.e., the affected USB-based driver), patch 1 introduces a new
> PRIME callback, struct drm_driver.gem_prime_create_object, which creates
> an object and gives more control to the importing driver. Specifically,
> udl and gm12u320 can now avoid the creation of a scatter/gather table
> for the imported pages. Patch 1 is self-contained in the sense that it
> can be backported into older kernels.

Mhm, that sounds like a little overkill to me.

Drivers can already import the DMA-bufs all by them selves without the 
help of the DRM functions. See amdgpu for an example.

Daniel also already noted to me that he sees the DRM helper as a bit 
questionable middle layer.

Have you thought about doing that instead?

Christian.

>
> Patches 2 and 3 update SHMEM and CMA helpers to use the new callback.
> Effectively this moves the sg table setup from the PRIME helpers into
> the memory managers. SHMEM now supports devices without DMA support,
> so custom code can be removed from udl and g12u320.
>
> Tested by joining/mirroring displays of udl and radeon under Gnome/X11.
>
> v2:
> 	* move fix to importer side (Christian, Daniel)
> 	* update SHMEM and CMA helpers for new PRIME callbacks
>
> Thomas Zimmermann (3):
>    drm: Support importing dmabufs into drivers without DMA
>    drm/shmem-helper: Implement struct drm_driver.gem_prime_create_object
>    drm/cma-helper: Implement struct drm_driver.gem_prime_create_object
>
>   drivers/gpu/drm/drm_gem_cma_helper.c    | 62 ++++++++++++++-----------
>   drivers/gpu/drm/drm_gem_shmem_helper.c  | 38 ++++++++++-----
>   drivers/gpu/drm/drm_prime.c             | 43 +++++++++++------
>   drivers/gpu/drm/lima/lima_drv.c         |  2 +-
>   drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
>   drivers/gpu/drm/panfrost/panfrost_gem.c |  6 +--
>   drivers/gpu/drm/panfrost/panfrost_gem.h |  4 +-
>   drivers/gpu/drm/pl111/pl111_drv.c       |  8 ++--
>   drivers/gpu/drm/v3d/v3d_bo.c            |  6 +--
>   drivers/gpu/drm/v3d/v3d_drv.c           |  2 +-
>   drivers/gpu/drm/v3d/v3d_drv.h           |  5 +-
>   include/drm/drm_drv.h                   | 12 +++++
>   include/drm/drm_gem_cma_helper.h        | 12 ++---
>   include/drm/drm_gem_shmem_helper.h      |  6 +--
>   14 files changed, 120 insertions(+), 88 deletions(-)
>
> --
> 2.30.1
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
