Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AF069C6B7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 09:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE63010E113;
	Mon, 20 Feb 2023 08:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FE810E113;
 Mon, 20 Feb 2023 08:31:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjSea0ZdpYyyNKbzN9vZCt7EKknmDRxhbtaDVsAwjYs3MZsDlBaXhSBKB5caoNqIJ2c55MjounwO31I5+qNatpNzNaIX1mTZZCoDi1hEjfygAcQ+QDduqZbhFI7wcSrOkx1KsmrpZzlrFS0l0RhybGLrGX9qvS/nhwBFylLp80qR+pvotQ3ZpwjlvcdNUUyhRtvb+QffR+o+xLt7JyqREaDGE3P0XDWqsTa7WMvMNV1XxWYIl6M20HUM8Nz2gH6g+EGAqTTHlokeoBfC/mS4M9yLlO185lLrDhclX+vMyoZrOejYNbECkM5mpgqTVdXQRx2SjNqypfRKzZs97A8/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP0+Tkv9NGhtx0IEyCcGMR4X8Ht2S+jUKE+V1JWfaHw=;
 b=Li7j5WoiWzRrvO69FBmpHTUOfbatAHPcD7rp3XxQJzSITrPAXnG9IM70NTB4bWnFy9aCuNq4K9kqXnatwKKyMpqvrct1XBCSTZUlIK/CQ28wb+jfGUDKJ6IRLPykEASSuwWbkd2LEyhj0oaquucoeMm74h3FP8k13xv9xH4GvXrIwlionTjykkyCiICCNz0mMyoYX/XKim+uo2h5yBH2nH0DkAaKsHV1XL82F2hpiVkTC99xznTjwbp/b6m1dtbT2EWn2a9a0y22H8+e9A+5OS+WtV69gavWNu71GcK/oRENYVr1fTSzMSzrYnmhjr8BYdE6Z155Cju0XLJ4sANHgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP0+Tkv9NGhtx0IEyCcGMR4X8Ht2S+jUKE+V1JWfaHw=;
 b=1a9O3jb5OdM0ZiZXQs9KHDdFFP0t+nCEyCM5ZGN1cpLU1hMugD7ifXPwvmWjxPEURYdSfJPuWiWyMwsnG/sdc51PoDOM5kUu5ovDpv26f2/Pnr3TM4GpMx83Y+CQJoJ77dv90+qukMmZ0biehTA8ETDLqJj5N3zZwgjCxxlyXBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB7337.namprd12.prod.outlook.com (2603:10b6:930:53::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 08:31:49 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 08:31:49 +0000
Message-ID: <2e6e9581-6de8-6aca-3e73-946fbc6ad2a3@amd.com>
Date: Mon, 20 Feb 2023 09:31:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230218211608.1630586-7-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec53a06-eb0c-4cc4-f7e0-08db131ce909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uyIEtX2RkHaTMZPi8wXouIHPteFoWCB9bDpeQggiR9sOPk9D8pJ3QN8iDyo0Q5m2S0S895qDl1Pd32qhghzfCJiy5o1ZafqRInoEMjq73P0kfyXUj8YmMF/N5LTGH6rXHqMcdJlRKGgm/7pFjXtOIdyF7rmuWF6vUrfiXkOz/VwLqI+6am9Ta+yDC1SeQtUeYfqyPYqfHol4jk88M676YmF2N5Ui6smRkNLrUsmq3xMMwNoCO7SM4xVPUe+ic7aYO3+o4gAz73DM1yzdBSHyPTe7kBh19bfWYZN3T1eMx9NTdJ899DL1FM1WspyCWHQoyvix88kgOmnoTUU2PR9/YsOXt6HAEFNbLjMLti8WiA39OVGBdGipazTMJrCUMo9YtvyaGY4eQCkdRPdRP14KQPLzUWC5OGVFoEkZeOJOhkGDlJK77qXO33nrkB0VAEpIUlaZVEZd/6UBDDssp+CP08U66u+AfQz/6Utwmq77igzDZMIgyQpQ5KJJrhh8RcYDt2u8Q4ptWkcYG297MZKaiudVonbGAwt9LuXg80pzaoME7I9QFZFYZIyTr1DtgVd+oEgjDg3q3DrRBTdwvj1FjKOX6mUQ8i565zJ/fHhxzoNagYFy/FjWI4XNz4RFvJoAkNxouJlsx+qISvSTukyZFeqnotT04LlrXhYpaCSMgKDbEGzZjhrWxhrAsIbLjLrrBA5cFOVjy1lO4B7XwukeofavJ9URBOSNiD6hgPa9gu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199018)(54906003)(478600001)(31696002)(38100700002)(86362001)(2906002)(316002)(41300700001)(36756003)(5660300002)(7416002)(8936002)(66476007)(8676002)(66556008)(4326008)(66946007)(83380400001)(2616005)(186003)(31686004)(6512007)(6486002)(6666004)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnZlWUxrZE5DNzFjVWtBeHBnZE1FUXh4NURFTjdTbHplSUN5NDA1cXFQU3VU?=
 =?utf-8?B?Q1pmeW9JNUFaTlFHVWV2UnhiZHJDSEUzVEEvRUFWK2xsbmhRU1owMnFMRm9E?=
 =?utf-8?B?NkRPUEEvMFVEckxqMFV4WnZhNURLSXJOY2RWR2tpZ0dvUVRkZUgzclBzYm5Z?=
 =?utf-8?B?cml6Q0UvT043cUhuVmlGYWx0SjdFQ3lQWWlQT3EzVWpSK3laSWp4QWZPaEVQ?=
 =?utf-8?B?a3JVWHowTFRrcmVPdnRoMmlxc09oeEREL09PaWZPeDk0NkJVbG9tY3RKQ2VN?=
 =?utf-8?B?Mnd6dkU3OUNaMzVaTEc3V2ZMQ04zYXJ6ZURLSUtIWFc4b05Ed3lpNnFYbVpZ?=
 =?utf-8?B?aE9pUlUya0x5eVpmWGNCNWpyWXhKYysxeVIzVnczMllHYnN2ZjBtbXcxdk1W?=
 =?utf-8?B?TWFhQkhPV3J2bWRJYTJzbXNLM0ptclVIK2VlcDJKYjRFR0hSUEpxTVRWT05G?=
 =?utf-8?B?akNXcUs5aWN0aSs0Y2pCcGFTdE41R2FVN1JNUkthV09qVExhK3JZQnJWMlZT?=
 =?utf-8?B?ZWltcWhhRUxiNGNucGRydmY1aWpqS1VjZll3ZHhVdnRMSlVXcmhuZUFqaHFN?=
 =?utf-8?B?R2pBLzNLKzBtWllTOHBDRG5pTTRXUXk0bXk2THNyemJZaGM4bkJGcW05KzBM?=
 =?utf-8?B?N2twcm8xM2c3cWsxZ0VJMTN6V2RzZ25EdTl6UmZNWi8wamFlQkRQOG9zdkJB?=
 =?utf-8?B?aUtTM1pHZU9HM1pWLzd4OElPaVIybnpUZzRSTHAvNWFwMjNLRHJ6RUhiQlhp?=
 =?utf-8?B?NjhuMEgwMjNqdGNRU1U1b1M5VmVyZlcxUnFVVXF5U2xxVC8yVjJVK2xwY0Ju?=
 =?utf-8?B?SHRtajFkVW9sUTZ4Z1pTWStnYTY2S2l3clk2WmRxYVE0cDQ5SmF3OHBYQ0N4?=
 =?utf-8?B?K0pIb3d3alhBN2VNVmtiTitubWZlRHhYZm5VUkJlMTZKZ1gzY3RENlcza0dz?=
 =?utf-8?B?THdyV1ZnTkJ3UFRZSTI2WGtwZm1hZ01jS3E1bzZXL2lWQzkybWtXa1MyKzAy?=
 =?utf-8?B?bVZYTEVxS1JRNHZFa1lZS2FlWk5wR0VlYzlFQ0ZERFVjV3ptcXNlTTMzaUpC?=
 =?utf-8?B?SU5rMEVFTStIaU1mSTVFWUhLU1l2ZFV4T1dqeDBRYnk0N1VOSFZ4OERnREto?=
 =?utf-8?B?SXlsdVJVa2hEdXdTZFRIKzNBTWgxWGV4a0J6a2NHRG5PYlZEbUIrMEhXQmhs?=
 =?utf-8?B?VEkvU2hac2lpNEQrMzdnTUFYeGMwVmlYWmtVWFhhOUthVXVzYmNDbWY1NlUr?=
 =?utf-8?B?ZStnOVN5akJCVWlnWDNmYUErUDhXTUtXRUlOY3NoKzNoS3dud2RyZkJybTFw?=
 =?utf-8?B?bitGSGRyTGFPWldDT2R4ZnJaaTF6RlM3UlJaaVM2aVVKS0RtZTZ1bjZScHRV?=
 =?utf-8?B?YlhoQk5WM0lia0M0RmFhbVRFMEY4c3piV3RRZmNqSlB4YW5iK1lEVE5ieTNq?=
 =?utf-8?B?TUNER3R5TmZTQ0JaakhPTXg4enByblRRK1czNVlLSzUxQzBvYUhQcDBXcnM0?=
 =?utf-8?B?SlRqMmFuWHpDUStOK2VFUk5xc3ZzMEpVOFdDYXcxbjZXQWhUbVF6WWZGcjRk?=
 =?utf-8?B?ZE5ROE1UUzQ0Y09yQTlaeWpzQ2RUdk5TZDZydFlZMnRvR0RSdzU4WmhxTHlB?=
 =?utf-8?B?Z3VxbzhFLzNveXR2Z0VCK1pSMktseHMvZk1HL3lFN0Fuak5SMyszdkxpMjA0?=
 =?utf-8?B?djVsTC9qSjdBNmRVZVUydTZET29uTVRiN1Fyekl4V00xeUhacXkzWmJteFFw?=
 =?utf-8?B?VG1vakkxb2NxMSsyVS9yeXRlTWRsemxXTVUwdmw4MUZOMGV0eEVMQk9rUWFG?=
 =?utf-8?B?WG5mL1dzZmNlaGhnRnphcXl1OVVla0VXRVN6dkt1QTZ5elMyWGZUazl0bmly?=
 =?utf-8?B?cEdwcFBNS2dsWVorNHNWeUpFUmNFSVdlWS9rd3NGV3A2WnVLTzZnWldJVDlV?=
 =?utf-8?B?TzdSbXA3aVFFcUV0QTNUTG16ZXBWcFZ1TENsYWJNR2RTbkUxbXVWUExsdTFZ?=
 =?utf-8?B?YjBYbnZuYWhwbE5wMEdIMTJvVG9IK3U4RElaS1hGL2Y1eTIvUzBtWXJpTWpn?=
 =?utf-8?B?czlTTWcyK2psMU55c0JOQVV4b0s3eEFPTnRub0E3SDk0azUwMk93Q2lRSUNE?=
 =?utf-8?B?bHhBa2RYZ2pxdG1QYjRNbFFUUVM2d3o3T1pob3dLMTNPMEViQSsvSmFNa2pY?=
 =?utf-8?Q?1VrgrfHBSeAMmCdwzFLh+2MiK872JC3qwTFxxhBV/aJs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec53a06-eb0c-4cc4-f7e0-08db131ce909
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 08:31:49.5313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ND2dKftjyXP6kHjAqttZPEPuWtvgymWMqDIuJq6VvYXERq37h1l5Taeq6XKybJly
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7337
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.02.23 um 22:15 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
> wait (as opposed to a "housekeeping" wait to know when to cleanup after
> some work has completed).  Usermode components of GPU driver stacks
> often poll() on fence fd's to know when it is safe to do things like
> free or reuse a buffer, but they can also poll() on a fence fd when
> waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
> lets the kernel differentiate these two cases.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

The code looks clean, but the different poll flags and their meaning are 
certainly not my field of expertise.

Feel free to add Acked-by: Christian König <christian.koenig@amd.com>, 
somebody with more background in this should probably take a look as well.

Regards,
Christian.

> ---
>   drivers/dma-buf/sync_file.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index fb6ca1032885..c30b2085ee0a 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -192,6 +192,14 @@ static __poll_t sync_file_poll(struct file *file, poll_table *wait)
>   {
>   	struct sync_file *sync_file = file->private_data;
>   
> +	/*
> +	 * The POLLPRI/EPOLLPRI flag can be used to signal that
> +	 * userspace wants the fence to signal ASAP, express this
> +	 * as an immediate deadline.
> +	 */
> +	if (poll_requested_events(wait) & EPOLLPRI)
> +		dma_fence_set_deadline(sync_file->fence, ktime_get());
> +
>   	poll_wait(file, &sync_file->wq, wait);
>   
>   	if (list_empty(&sync_file->cb.node) &&

