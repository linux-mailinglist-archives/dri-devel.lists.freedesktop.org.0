Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EE3566A1F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2F39B37A;
	Tue,  5 Jul 2022 11:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D6C900BD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 11:39:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwIx9mx/0TyfwGU/h6nnC6NamuuLlMxx9EabhZJo8UyQeIwoKY2dmwM2sLy+bcHeBnJe0Xyir/ay8StyDohBlQfBofMTKnRUNvjO0zvwsI6AyQdNkeqAHsK6PjtNFMpQwXNx/XJOwECi4oh6lXCLecZMTUBIrLz3Bfv2kj/opCS9HOFNkZAwhyoLGoC1hrG803jExd/LOUJP1gW8mjtAa3KLZTLaJeoawKhdyzcfeQYWLrHheVVID7CivHPXg2T1M+g+gUNgWjJdMmyO45mIGxlQcgnE141XvblJ5AK8QPdBVdS9PNhrLFZkihCjjdRbLN8zxuJ+WmAqnaHdBlccAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DelXAiXGlRk2fvklJFbMtwD03U+BlcNKX6rBMkC+Bog=;
 b=dhQF1QYunGhYPKZ7AXD9Uqf4lBW7FN4zzFE8lbbViV8HCug4Z4Ew29wych5FZrW5B3fq2gm/3z1DTaWJ4ImCbE889Vsv615RUGaUNbWtQYozp6o/BssvCT2n8TB1vUu+7lL9U0Wx2j3cJBy9UQcRumTZeUDvMdb1mywRyGR41gpNk8q8oWfBJxi3c7wm5Li8gk+jljqWRFHYxLx+YxofCFzO/22rqAz9GVv6aHPaMH3zOAYvfRJAo6g/H5dIAS+YyM3oBjmu6Em2W3ULrhQuOWCkDI3Bdb0vn+suvIpNiHHWziXW/q7ZNCc1I66yPmKoOExvlvQ7LMtW1u49j093RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DelXAiXGlRk2fvklJFbMtwD03U+BlcNKX6rBMkC+Bog=;
 b=ERdvSHk2iGUleAGTWkVf7m38KUzCtnOwtp8C5HbR+98EkLg4Apcd9QjD9ZO2EphLoHnoy4ibjJ49h/vn3Q/Xaz5voQSoCb3ImVJimzM1Rs+6UY6ho9k+jwXpc4FL4EYvY3DN+e60Yg6Oc+qotumR+DVMrihqSU5ATdVCNqpO2z0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5134.namprd12.prod.outlook.com (2603:10b6:5:391::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 11:39:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 11:39:28 +0000
Message-ID: <2bb95e80-b60a-36c0-76c8-a06833032c77@amd.com>
Date: Tue, 5 Jul 2022 13:39:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 2/2] drm/gem: Don't map imported GEMs
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-3-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220701090240.1896131-3-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 338052e8-da48-42ec-1e94-08da5e7b0493
X-MS-TrafficTypeDiagnostic: DM4PR12MB5134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WyccyBLXdTD266a08cWaMRDyeZSrWSYubPUefUJy8Srck42wiYv4IHcbkJdsRluMLoTadhBGKDMZU5CZAXAS/4VrSYCYMedIwYLTDnjvdgIvxG0gV/0SW7A40XqumyF/KcBt/ggO1UvWdcsXtura/Ej7441xftKUg2pZ4yVeclkqA4S6fDLp/KpLnq2fKM1XHzamwaRsgh8BsHiS77JCtbETUQW/KQqzDL07qhtrY/0JOmNqtaKJvdCuE7/xO2go+EE7e8757aj4lYY/Ol5SMyjC4QU1+Q09bxGFlm/8kgBwBxCXBboMY0kXK1ztoZ7J9+guHb9q6MUkiPJxOZqc0/sitnbNBnm6DC+/R5TgOzvi5GyNNTd0gKEamGaD2pjzYstJ1sxN17w62f5Y/Du8Ug9gGDH9NJS9i2P5HsT4gg5JOIFLBDscKX6yak2fk8M/9oA9kdn4tEszcPymfB3GHEGT1n1PQyhLFt67l+4plzzJWXvbDDp2suRgnuOe1DOr3IiQzO6lj09y+cWKbkDf6OMK9Ot4i66XlT+9etWw5TzPvHByCPmoz82po6Kcw+LOZ3TyzvFmVEdwogg8PZVK4qPtr7fmGlp7g89gzgcX+2uUAj8gd+cELA9Tbk246WZmKWxWNyGOv50nuRZ1RuBjThWY1BsPDwH2T6kmm9wpwl9brnCdL2fBIZ0EonWyFHsIc+6Fpt0uo394ajrucjTjf/y+cZy6b3vR+F4gfPcnO0m1S2aNcbCD0332ORzKJi0XbNDOI8zGKAzvAwoI3kUtDc7BZAyRpFX7keJdi6RtmNkmjbar0QA2WZmds9pEhG0rMluVPRoMkhjZzkyiixVyz9/3Sl8aSpgwaDTdxpa9UyLEW+zbFXGVl5Cd0K6ZGFly
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(8936002)(7416002)(5660300002)(66574015)(4326008)(8676002)(66476007)(66556008)(66946007)(86362001)(41300700001)(921005)(31696002)(6666004)(110136005)(316002)(186003)(26005)(36756003)(6512007)(2616005)(6506007)(6486002)(2906002)(38100700002)(31686004)(83380400001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0lZMnBqZDRGMVhoN05qNUZNTy9YdCt1d2hpdUFBbHF2YllJa3YxWFJFYm1P?=
 =?utf-8?B?VmNVU2RTQW0zaTM2dTBzVW5ZKzIrdjRFdEZjeW5ReHE2dFU3MTROT0pVMklN?=
 =?utf-8?B?UW5McS9IMlBzWDV0bE8zanYvemROcUcrSTR1Vnh6TEdMQWMwOFZYNTM3T0ll?=
 =?utf-8?B?aXBjSlp6L3RNeGFyeGt2YTdhLzRMcnRZT2ZBa0FLZFFlUEk2aENhaFg4NmlX?=
 =?utf-8?B?c1lVcVJOdUo3MjhaWkl4RUV6dHRnZGdzWEJYUHkweXZUVDVvUGZtdjU0WVg4?=
 =?utf-8?B?MG5GOXJvQ3B3RUd2TGszb1YzeTJuSkltOGpPdS9ReXJta3R1L2xFLzlueE42?=
 =?utf-8?B?ckdyOUx2QVBJUStVUUxxd044MUxEcUdSK0pLVlRUdkdLUCs4VW9vN25PWnUv?=
 =?utf-8?B?VEVyTGZRQjlQL001djJCemdpQjMwR0krZCtwQ0VmQ1dwMVNmQk9IWUNvbTdE?=
 =?utf-8?B?Zzk4SFpMYkxyRUhjdTkwVFFmN2lJa25NL3VldEFNNXJicWZOK29WVnFnZ3NF?=
 =?utf-8?B?K21LcFozS2ROaGtJa3BUVG01d1QyRzdzdHZURVBNSlF0U2sxZmhxaW1zb3pJ?=
 =?utf-8?B?eTA2RTh2aTF6N0VWMFhkUVBrRW5WUmU4aDZicFhSUVlDdWVqSXVqNVJjS1p6?=
 =?utf-8?B?Q0NzbWdMcS9ha3ZJZkdmYXQ3SHBYSUlMNlc5NEJuVTNLQldQM0tNblE2Y0Vt?=
 =?utf-8?B?WW9QV2YwWlJSb2VJZWtiejJNdjZmU2F3M1pTOTBRcnNxL0NsclliSmh3TERZ?=
 =?utf-8?B?UmtLRHBsMk03R3JybUg1aWp1RDlWRGRMcW8zODJQa0tPVUFWNUx5RUpNYk9H?=
 =?utf-8?B?KzBDSlJxQkxvWEFSb3UxQTFpQTU1c0grRmVDWWFiaXNuRFZhdmU3TU1jMlY0?=
 =?utf-8?B?SjhkQUNvVGNFZmJXcmo1RzR0dkVqMFhKU2UybTkzTHdubjIzdjdOVkliQlZa?=
 =?utf-8?B?ZnN2dEYvMjhEZDI0TWxJN3NvU1ZJcnZieGlHNE9GVXVrRlBid2RJdVc0NWtj?=
 =?utf-8?B?RFlsRDlERG4wOHFwRlQrb0QxbktNcThoUm03enhJMDVMRFFseGFUSTZaUzlZ?=
 =?utf-8?B?bDB2UU9zYnAzcnV0U096UXhJS3NEV0tZejdTdzRQNS9idFlpUE4wYUJ5aS9B?=
 =?utf-8?B?cWpZZDdydTZQZ1VacWNtdUo4K0s4bGlJZ3ZmVkhmMjM0cFVuSkNiTzlTK2pr?=
 =?utf-8?B?ODZKWGVGN3ZKRGpJeFk5Y2oxL1RjTGdOTUhhLzhiWnhad0Z6cXZ4ZVI1dFZG?=
 =?utf-8?B?MkdCMm83MXhkY3BtVXN6bHBNRzcySTRrM1FpOFVQYTlqSTFZKzNhWUZDdGJ5?=
 =?utf-8?B?dGtrTGErbXNVeDhPT3M4eHBQL1R3OHEvRHkwdEN1TzhGaHJCTkNoM0tOVFc4?=
 =?utf-8?B?U0F2Qk00aWN2SnZXakJSV1ZJeURVdVBwTDNxRk9taXcydGtkZHBxZm0vdk5t?=
 =?utf-8?B?OERuQ2FPUk8zVDdpRlVQRXZMYiswSTA2bjl0QkR3MktQQ3NoM2JYTlNkQjAw?=
 =?utf-8?B?TzVtenJxQlVvVUtHaHFVL0xPZ2poYmRqM3JFTVhwUzNoemxJam55K3RQNm9s?=
 =?utf-8?B?VFdqejZsYnQxck9HZkNtd0w0c05OR1I4enpqZkZUYXdhUGdISXlRN1dTdzBU?=
 =?utf-8?B?OC9WMlZpcmFlUjhNVStkbUZHeVNIZ3lrU253Ym9jdkEzSEprV2R6R01kNCtl?=
 =?utf-8?B?SmdFdVhDOVROK3dTMXdTVkQ4TTliQUh5Nm1qbm5qZFBvOHA4NCtLSmZYYW1T?=
 =?utf-8?B?bEllSzNtQnJUcXYyOUd0dGdlODVDNWxTZStPZVc2SUhuSmYvcytKbWpBNUNC?=
 =?utf-8?B?SDk2QUpjZ2ZCNFpuaEJublQ2Y2RPQ2Y4VndacW12QUdZTHphd29seDdGSERs?=
 =?utf-8?B?WkFMZ09lRHFXTzVvUnFBVDE5TFVUTmh6c0pFend1dlJmSlIzOC9Sc05jb2V5?=
 =?utf-8?B?WFVrV0RpMVVIdHBVOTlWbTJpMVhmcXh5T0lmb1BkT0ZZUnNsMWJEV3dTSHFM?=
 =?utf-8?B?SDJxRldYOTF5V0FWWm5VMzFIL0NINWdFVHZDcWNFNVoveExlMXU3cHYyczhn?=
 =?utf-8?B?QTUxbWxYaGtadDc2ckljbUhjcTc4T2dDSGFCRVdZc01rZllvWmtBWVc1bE9R?=
 =?utf-8?Q?J3u/J4OOsNmhhd4mVxEdC4n5M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338052e8-da48-42ec-1e94-08da5e7b0493
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 11:39:27.9272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhrDG4CkCs7BPCqORgpsPG3xyRFbBDynlhHUnJXvjofnxQa9vgRVq86jm44x9Jg5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5134
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
> handle imported dma-bufs properly, which results in mapping of something
> else than the imported dma-buf. On NVIDIA Tegra we get a hard lockup when
> userspace writes to the memory mapping of a dma-buf that was imported into
> Tegra's DRM GEM.
>
> Majority of DRM drivers prohibit mapping of the imported GEM objects.
> Mapping of imported GEMs require special care from userspace since it
> should sync dma-buf because mapping coherency of the exporter device may
> not match the DRM device. Let's prohibit the mapping for all DRM drivers
> for consistency.
>
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

I'm pretty sure that this is the right approach, but it's certainly more 
than possible that somebody abused this already.

Anyway patch is Reviewed-by: Christian König <christian.koenig@amd.com> 
since you are really fixing a major stability problem here.

Regards,
Christian.

> ---
>   drivers/gpu/drm/drm_gem.c              | 4 ++++
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ---------
>   2 files changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 86d670c71286..fc9ec42fa0ab 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1034,6 +1034,10 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
>   {
>   	int ret;
>   
> +	/* Don't allow imported objects to be mapped */
> +	if (obj->import_attach)
> +		return -EINVAL;
> +
>   	/* Check for valid size. */
>   	if (obj_size < vma->vm_end - vma->vm_start)
>   		return -EINVAL;
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 8ad0e02991ca..6190f5018986 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -609,17 +609,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_ops);
>    */
>   int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma)
>   {
> -	struct drm_gem_object *obj = &shmem->base;
>   	int ret;
>   
> -	if (obj->import_attach) {
> -		/* Drop the reference drm_gem_mmap_obj() acquired.*/
> -		drm_gem_object_put(obj);
> -		vma->vm_private_data = NULL;
> -
> -		return dma_buf_mmap(obj->dma_buf, vma, 0);
> -	}
> -
>   	ret = drm_gem_shmem_get_pages(shmem);
>   	if (ret) {
>   		drm_gem_vm_close(vma);

