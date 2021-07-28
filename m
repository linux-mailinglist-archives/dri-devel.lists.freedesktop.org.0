Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 054E33D8BB0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 12:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E135D6E02D;
	Wed, 28 Jul 2021 10:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056B86E02D;
 Wed, 28 Jul 2021 10:27:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxfOY7wg9RaUDnpTuFVW4q32eC4kpK7whDzSzO8SgkLs79w7xTnOGM1i/zSVW4GYFdD3RhQjZQ3fOmqXymhhXYvJWW7jQdkAesAr8PxUUCgJ7CvMsDeJJFGynpgMI7UbmkmzwWhtoKov2Q8hV7oEMJNvJrbnezZzubnLfsHAc2EnyX6uDgVdruntXYIAGTVVGseOdvUQaohoq2QfMFi/sx6xGD5Xhsfti5sbb8cDQJsYuWl9UQuLKTSpiBKnzTemTpNQHv6UhXkzwFxRTaFDqtMjXW8gj9dv3YmrS5PYuQqOJb54EOPg3J3RPOvHGgLNGoDhiOenB+1hjCJ9uH7GsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJpTtCMpM0/F8YulJgdsFKHywu6fFZKjKHoz3GTGKG8=;
 b=IshVPFSny8U9Iixvx1ZnNDEaYW46JefhGf06ADJMQVOnlWQz4YbeniIrUBFfJPYqzbgX4WBJ5Wbod8peolWFZ4GnUS+OKNayQMnj5/bCpiALY/0YRBV98OyExVAZT16XRE6o2w8AxXmeK4s53ZVR08kNGXQ5WcAEYrkkaxMExoFjnEzLhdBbRYG04iYgeCQy/dQ2uoTLGf1SamMyQMFwkvexGsuesZEob9oCsVnPwdj21s1H00zUqSXBd6ecUIoRBb8K3ujI8MmZXdxPsE5JF28ErZRYIve7cl7hNZ4x3Dnu68HoUGFrtD87n+66iyaAIoiDpINYUnTskNBuCkQEmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJpTtCMpM0/F8YulJgdsFKHywu6fFZKjKHoz3GTGKG8=;
 b=G/7xU8PaGOS1Driuh/DPimOnDA/FhkIqGft9GZSteF6uCAA7AqUllI31BPx5sAIPr4S9u4CQjUYBQis7GEBKk8kgcgNOqEVd50Ogfpatqtz94pj8ZMGpQWOZG5sOQIwxXR6MYs8yfgk8rZXmgLgp/kXVdymGet7bcCH9W4g8nGc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2577.namprd12.prod.outlook.com (2603:10b6:207:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 10:27:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 10:27:36 +0000
Subject: Re: [PATCH 01/14] drm/amdgpu: Convert to Linux IRQ interfaces
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, alexander.deucher@amd.com, liviu.dudau@arm.com,
 brian.starkey@arm.com, sam@ravnborg.org, bbrezillon@kernel.org,
 nicolas.ferre@microchip.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
 patrik.r.jakobsson@gmail.com, anitha.chrisanthus@intel.com,
 robdclark@gmail.com, edmund.j.dea@intel.com, sean@poorly.run,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 jyri.sarha@iki.fi, tomba@kernel.org
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <24a8b2ab-ef38-219b-99d4-806a44fa6aba@amd.com>
Date: Wed, 28 Jul 2021 12:27:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210727182721.17981-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0104.eurprd05.prod.outlook.com
 (2603:10a6:207:1::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:502c:190e:1ca:e49a]
 (2a02:908:1252:fb60:502c:190e:1ca:e49a) by
 AM3PR05CA0104.eurprd05.prod.outlook.com (2603:10a6:207:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Wed, 28 Jul 2021 10:27:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d72ae12-4bd0-4c5f-a134-08d951b250cd
X-MS-TrafficTypeDiagnostic: BL0PR12MB2577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB257766F12E5C8F4AD2E7CAD983EA9@BL0PR12MB2577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nT/XJCI2pmOhBEjlRrJnkWC/LAYZU1ZPxrjtR+c7BGJOwxvYopPmIRu4Y/TsFdHKT/4B87G8g1dQkqU8tRXGGP/nJELl96m+WGwnwpfCzJimkJ3GoaJPIzslGmHLLS2eMWyEMTApTQfk3leUZCxrCkiP+tyQWiuXvD+QO1QxJs6XFWpRkiPAWsyHiIfh+2lUtnLeCpfJn5spL8e4r5UrmALzsHu7nF4Rnpvuupr3aaWXyDNZXiS+MyyKnnnyfs7WR/7WD35rtfDldwfUGTfDP7OAbvhB0W8o48InY1n+VwVUHRzV8IHZy2o8UZqCrzu4F9w4RsZVEJ56aPJDUQvGXYu4zsQ+xCLNqzR3FT7tuSS9G0wQW6NXz4NUvzbQQ3SIN9P8E6kfnjwa6OXWbvyBI0tbt/WFdmkaL7BFEkw46yg+Dkvejd58uTaiZ4TIYSq3BN6OoNhQNmWeBFMBfGsJAC9jj/s1mnl6ueaNOUGLJam/ReyuXHqiAzB7jIGDLuh24p0dq2jXL2kvPwktTqKqeuRbxLH276Mao1jkKvkjEjZgzUbs5XyfE3Zkfe3f7YqZuOOIGxXx1rLVttb/G0ZWuym+g0EnoFM57Jx3qD1DqOgnMTpXLy9tZo1IaH4tNdrpENvzHnOA+i2X6qljYKD1B5lVXXz9tLaltUr5cm06suLJAWRcPpFfWWKciPAKTBOtxSUgAlPlTbMDw13U5jQnPOQ4bN02+BjH21j6ADNXyEkBUDiAnYyo1A192G84tg0k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(4326008)(36756003)(31696002)(31686004)(7416002)(83380400001)(5660300002)(316002)(6486002)(66574015)(186003)(8936002)(86362001)(8676002)(2906002)(66476007)(66556008)(478600001)(921005)(38100700002)(6666004)(2616005)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG1oZTJkbU9UU2hPbS9HeDYzditlUmxuWEN2SWFXckczMThqbGdUc1JZMUhw?=
 =?utf-8?B?WGZuZ0ZHaFloQm51UjI2MjRTR01JenpucEdBMHA5L255cVh3bTBhR0NvWVRj?=
 =?utf-8?B?S1dWejRXMTFCOUh5UUdYM0R6eVNYaHFMa1ExcnNSbXJXK0ZjWE83TlUwcENy?=
 =?utf-8?B?SGQwRnFZdEpjc0Ezbm1zSHdOcGhKdmpyR1JEdURocU5EenhQWWdCUURuZjZ4?=
 =?utf-8?B?VUh1M1MzREhvM2lIWEo5WjQ4Y2x5MDV2MitWSVIrWlduMm1VQUp5SkViYTZY?=
 =?utf-8?B?WVN6U0tKUkpSS2RGdjJ3VVRnRzRSVmV0K2Fkd0NvL2N0UHUrZUUxZndRZ3JN?=
 =?utf-8?B?ZjJQajBxMXBXUXBqOEFldmtJR0UxQzh3UElmTjloOWVvbHRYVWk1aUNEUnBt?=
 =?utf-8?B?YVZ2OFlpeXVDdm1CVU52K3ZwVXdicG13akdGTHF3RzlWSkFISThhcWdjZk5L?=
 =?utf-8?B?QlY3MnNsU044UnZCRGw3QlZnbmVacFhjckhlc28rYUI2dlVCNFNQbEhieXZZ?=
 =?utf-8?B?UzZUMU1UejVKMmZEbmc5R2ZkTVMzd0psb253YldkR0hJaW9CcHdtNDZZNGpp?=
 =?utf-8?B?eG9QY240VThxbHM3cndnNTdvcW9weDBuRUJxVUxQbmRIVnp6eXp6d2FaWjc0?=
 =?utf-8?B?RU5iUjJOMTVXdGJrWUpiek9lOHBXRmJNTzhvcG5wSXpiVndTWDdDK1dtNE45?=
 =?utf-8?B?Vm15aVMzMDZTMDRRMUtXN25xTFZ6UzdOL2M0SFp3NGVsQWtaQytqUnpaaCsz?=
 =?utf-8?B?YU1tZm5QSnBrbEpnVHZ6UDlZMDEzeWlkSTIwcmpLbjZRNk1Hc29TSEtyKzRF?=
 =?utf-8?B?RFphNExRRE9MTVppNm9SQXlVQ1M1WWhNRjN3RXZQN3k3U0o4aXZ5R2RGdDdp?=
 =?utf-8?B?NVg3VWVZT0F6T210SEVrSkVXdlFjRzBWVndHK21nNVBVMXhoK1JMeUJUa3N3?=
 =?utf-8?B?OUVja1ZTRHFOVWxjSlJHQUtJVDVQdUF5b1JSKzQ4RzdIU2xkOHlWeUxNQ3Ns?=
 =?utf-8?B?OVA2bSt1T3krL2QxSjFZVmZ5ejE2cTNHS0dNaUdjS3k4RUt0d1dRWmdNNVQ5?=
 =?utf-8?B?ZUVlQjBDU1hBOGNud21McjI3a2p6TytLby84WTBONTFRQlpyUG5pZ0VQUTJx?=
 =?utf-8?B?VEpOUjZ4bDNOTUFrNEpOV3ljQ2RTMCs2SkdpVjlDeFBhaXpSQzU5a0loU29m?=
 =?utf-8?B?ZEVZNDRGTmc4dmlpdnozUlE1ZnVSUktMWElXdUQ3c0hmQzVSZGgyRkYyMTg4?=
 =?utf-8?B?RzFENnMzR2N2cjIyV3AyZ2I0aDh5ZGtCNmwwSTJqLzBsdlJnMDRiVk82OXpp?=
 =?utf-8?B?K2RremxmamYvQ1FqZkJ6V3FlczJnL3FLcDlvQzNnODFadlo1cmNRMmhxZklN?=
 =?utf-8?B?eFJPZnFadTZrSzR0Q2I3ZmQ3WWVYczl0ZEp5VnZ4aTU0TWFQU1NETEtKdzVq?=
 =?utf-8?B?U28zTkpsUUxqZkdaZk5LWmphOER6d1EvaWNzcWlSRmZka1JuNm5ndXJVYkJR?=
 =?utf-8?B?am5hMkxhTlNqVW9QVSs3ZG1kUU9KRi9SeFRyamJFOU5xWVRmRHNYYXRlZ3Vx?=
 =?utf-8?B?MEw1RTNUcFpqREpOeDM2U3dYMjMwZDgrQkxrMnVQRkVpbkxCNTBmblB4Q0U1?=
 =?utf-8?B?RzNreklGTlNUOFhDb1RLaks0MC9GajdqR0dEWUpENDM4Q1IveHZDRnlUc3F3?=
 =?utf-8?B?dldWeURDWkFxUHI1WGxnZnc0MmJFYmpIenZMV1ZzUFd1Z3huUGFHWUUwclh0?=
 =?utf-8?B?b3VCODFtSzZ5M1o1bHp3UEtDd1Voemp3MmorQzhQa0M3SXYwditZb3MvWmM2?=
 =?utf-8?B?d3hXam9yTUNYaVU2ZVRQaGl6cUNqUDJYSisvaFhMRlhuMEtBK3NVYTFKdGo2?=
 =?utf-8?Q?BK7ebwK4+tEO7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d72ae12-4bd0-4c5f-a134-08d951b250cd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:27:36.3151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dA4jfKnjfxLae+o3MWfi2AJs1lS2g8z+8z0qI4Z2YoyOS8iqKvNCjy/bYc+ZZ0VY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2577
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
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.07.21 um 20:27 schrieb Thomas Zimmermann:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
>
> DRM IRQ callbacks are now being called directly or inlined.
>
> The interrupt number returned by pci_msi_vector() is now stored
> in struct amdgpu_irq. Calls to pci_msi_vector() can fail and return
> a negative errno code. Abort initlaizaton in thi case. The DRM IRQ
> midlayer does not handle this correctly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Alex needs to take a look at this as well, but of hand the patch is 
Acked-by: Christian König <christian.koenig@amd.com>.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 21 ++++++++++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h |  2 +-
>   3 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 2bd13fc2541a..1e05b5aa94e7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1775,7 +1775,6 @@ static const struct drm_driver amdgpu_kms_driver = {
>   	.open = amdgpu_driver_open_kms,
>   	.postclose = amdgpu_driver_postclose_kms,
>   	.lastclose = amdgpu_driver_lastclose_kms,
> -	.irq_handler = amdgpu_irq_handler,
>   	.ioctls = amdgpu_ioctls_kms,
>   	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
>   	.dumb_create = amdgpu_mode_dumb_create,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> index 0d01cfaca77e..a36cdc7323f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> @@ -46,7 +46,6 @@
>   #include <linux/pci.h>
>   
>   #include <drm/drm_crtc_helper.h>
> -#include <drm/drm_irq.h>
>   #include <drm/drm_vblank.h>
>   #include <drm/amdgpu_drm.h>
>   #include <drm/drm_drv.h>
> @@ -184,7 +183,7 @@ void amdgpu_irq_disable_all(struct amdgpu_device *adev)
>    * Returns:
>    * result of handling the IRQ, as defined by &irqreturn_t
>    */
> -irqreturn_t amdgpu_irq_handler(int irq, void *arg)
> +static irqreturn_t amdgpu_irq_handler(int irq, void *arg)
>   {
>   	struct drm_device *dev = (struct drm_device *) arg;
>   	struct amdgpu_device *adev = drm_to_adev(dev);
> @@ -307,6 +306,7 @@ static void amdgpu_restore_msix(struct amdgpu_device *adev)
>   int amdgpu_irq_init(struct amdgpu_device *adev)
>   {
>   	int r = 0;
> +	unsigned int irq;
>   
>   	spin_lock_init(&adev->irq.lock);
>   
> @@ -349,15 +349,22 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
>   	INIT_WORK(&adev->irq.ih2_work, amdgpu_irq_handle_ih2);
>   	INIT_WORK(&adev->irq.ih_soft_work, amdgpu_irq_handle_ih_soft);
>   
> -	adev->irq.installed = true;
> -	/* Use vector 0 for MSI-X */
> -	r = drm_irq_install(adev_to_drm(adev), pci_irq_vector(adev->pdev, 0));
> +	/* Use vector 0 for MSI-X. */
> +	r = pci_irq_vector(adev->pdev, 0);
> +	if (r < 0)
> +		return r;
> +	irq = r;
> +
> +	/* PCI devices require shared interrupts. */
> +	r = request_irq(irq, amdgpu_irq_handler, IRQF_SHARED, adev_to_drm(adev)->driver->name,
> +			adev_to_drm(adev));
>   	if (r) {
> -		adev->irq.installed = false;
>   		if (!amdgpu_device_has_dc_support(adev))
>   			flush_work(&adev->hotplug_work);
>   		return r;
>   	}
> +	adev->irq.installed = true;
> +	adev->irq.irq = irq;
>   	adev_to_drm(adev)->max_vblank_count = 0x00ffffff;
>   
>   	DRM_DEBUG("amdgpu: irq initialized.\n");
> @@ -368,7 +375,7 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
>   void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
>   {
>   	if (adev->irq.installed) {
> -		drm_irq_uninstall(&adev->ddev);
> +		free_irq(adev->irq.irq, adev_to_drm(adev));
>   		adev->irq.installed = false;
>   		if (adev->irq.msi_enabled)
>   			pci_free_irq_vectors(adev->pdev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
> index 78ad4784cc74..e9f2c11ea416 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
> @@ -80,6 +80,7 @@ struct amdgpu_irq_src_funcs {
>   
>   struct amdgpu_irq {
>   	bool				installed;
> +	unsigned int			irq;
>   	spinlock_t			lock;
>   	/* interrupt sources */
>   	struct amdgpu_irq_client	client[AMDGPU_IRQ_CLIENTID_MAX];
> @@ -100,7 +101,6 @@ struct amdgpu_irq {
>   };
>   
>   void amdgpu_irq_disable_all(struct amdgpu_device *adev);
> -irqreturn_t amdgpu_irq_handler(int irq, void *arg);
>   
>   int amdgpu_irq_init(struct amdgpu_device *adev);
>   void amdgpu_irq_fini_sw(struct amdgpu_device *adev);

