Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A7B3915AA
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06BC6EC7B;
	Wed, 26 May 2021 11:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D1F6EC7B;
 Wed, 26 May 2021 11:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8k+x2AD78WvK12zuH6IBOAVjm+DBO/afynmV24ELXcDod68VHzXw/mRvOzcfCx9vHVcMPXSLXqP3KoWKy3OkDoRmf6tH2jVzbCNHCYElWhG7FPjSUp8og5HNjIKPSmlwfsifHLOkWQkFMX6vQ8aJr7/5FtyLw86bEVKEWObqe7KPfv7lyztmKDLpWe6er32nhsKKnxhByLMh2VxNz88sMir8Nj93R4stotZh0YYoW4BgaRf4mBiR98YZZwW+v64aIwDdiAJGIKEMWPx/xlYc5W0kMrr3HMGznZuyCYiGuc0hcSr2Jx4KRi9vggEHaULVBslMvgKayP9BTl80JQPFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulTTGLhFo2VIXzdRQaCbFiO3XmDCqAVYzJmK16hUo8M=;
 b=KSKDaDXxQScK0cJVs4X/++qQ/5cPu+4WZZ2Ur8PKNFm0f4og9VhxaNhaVnckmvdb8L3CB0tIApOyC5um35J1XlNpf12oN/EEABAB9vd/7mmFPBP3K/UTvfiZcl7FyfVM8dciHYMGzvGdtcaobdeUBy05ndZJpZQEpXi8+zl2H1GlsUO7sfFLA7boD9e+VPdvrD0N5KbyF3bVMu7fi+3awPjypxOaTy1MwLDr0nd0P4/rpfDKE9RPK0FPffAStHWPYfbQ4YuPeDM/dWGoMLqK2UgKVGZfXtkG4Q6IoXeN8Apeeb2xbSQfRnBSsvmiqInei8BVaFFcLELz00xn6guBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulTTGLhFo2VIXzdRQaCbFiO3XmDCqAVYzJmK16hUo8M=;
 b=t1YvJiqzMiAR7/FaIm8zNWYzDINUqJk1ArMh/kqdsB6MyqGPX0sOW2Z85TL4fEticNecB0q2GhMDtN1s4rLRHwXXGzvaiDdzTqXyVDvgTPpg8jiZuoOQ2zb+2GxqfnS/Dtekr28mVvclDd2/qoQ+UDiCNuPrTs0sMfLid9IXQgU=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Wed, 26 May
 2021 11:02:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 11:02:16 +0000
Subject: Re: [PATCH 5/7] dma-buf: Add an API for exporting sync files (v11)
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-6-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <acc1737c-261d-9da5-7ea7-759063136c56@amd.com>
Date: Wed, 26 May 2021 13:02:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210525211753.1086069-6-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:7216:94bf:3812:bd88]
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7216:94bf:3812:bd88]
 (2a02:908:1252:fb60:7216:94bf:3812:bd88) by
 FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Wed, 26 May 2021 11:02:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb92eb9e-e025-4954-af25-08d92035b96a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4343:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43437B491850331CE71193CF83249@MN2PR12MB4343.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nRt/ZWPh8xPdhMvi3OfP5P4Q58e7Z5wzJVcaa5uBXlya0rr1ATewrFfR27lqP2ajEPEF2Iz4WgPn+1ND6PkWnQ4aH5GQns2AF6m1gj1oeQ/bls9PWN1BQxaCCN5qb248Pqo9FOauXT3qSQsCzosyxwFoAgbQ4f3gu2YaGPbTmdaPw338+m2ZdSg6mxpoh1tw9M5ymOSZwwLXA/bN/RloszLqUxY2eZuU6Qs+gnGyMI8MOPelimjN6SDWkgP9REh4h90k9Z3B3gEltHZArMeSP/aZKWdwA2HM8P19uuNLE3jZlAf8lVw0mrc176TFkTZkkhbPxTGaeWBVRpPQsW4P/SxPfFE7rFqOFgskVHWy1ZWqF98O5pkC8MfJXo16kV/gY6FB6KBWdpAe+nljgke27wjTwmYcev1pKcZdPcSM2Rloi88dSBbgLLrZtvDiufEOWs6u0SNxcU/oGq4E+KBcEkmG4QZFQHKm8GBDy7GIjN8ssyXCiyGBiHTlftsayCJviakv9ifNZaeCRNaY0xIx/ScLosXzwVbc8FobrHXrA2Z3W08YX17LhOattBiqQWR2x6YYu3Lnam12PL4A7NGZjsdLtSSYLMoGxVuk4nsi3AZDtRvyb0TisEWRnUMxHPzEhsBEiBXw/5fJD81gAoIQ3bRShBmTmKncBhrxf7435p8LzXjcLKZqOzPAyrHKVvWo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(186003)(6486002)(38100700002)(2906002)(4326008)(16526019)(478600001)(66556008)(66574015)(66946007)(54906003)(31686004)(66476007)(8676002)(52116002)(83380400001)(8936002)(5660300002)(31696002)(86362001)(316002)(6666004)(2616005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Tk5XdmpHK05NcGJRUTd6WDZ5UGtndkpkVzB3WHVwUjgyVVlmWkJkK2NGRGlu?=
 =?utf-8?B?eEhwMktnMWw5ZFY1VnFBZTU4WXl2SWtrZ1c3OWE4QktPM1RnNmlWVmRmeE5p?=
 =?utf-8?B?YmludlpSUnU1bExWTTNZMmVXRnhMMWI2VU1aSCt6a0pDTTB6QXRaMUlhZkhr?=
 =?utf-8?B?MVdXTmk0ZVVnZ25oWU1zRmVMVFhpdXc0am96MzhqdDlKZjZvNzZhYm01UnQz?=
 =?utf-8?B?SHlJbWZoU3RZaUlBVTlNczM5UDZnUFNoSy9uNjdJdkZqMUpzZ3NWWmJPTmY4?=
 =?utf-8?B?VnJ2dWJMNjdWZC9ITTd5V1JHcEFsOUpBUVdzTjd1SFpBeWVCVVNGUkNYNDVF?=
 =?utf-8?B?VjE3ckhranpOWlNmbEVMc0Nyamp4eWlNUmhwOFB3Z2xJNFlYdUlIS0kyVkNm?=
 =?utf-8?B?NXdCQzkwaTQyeCsxL0tFRU00dUpFUG1uVE83TDd4eDE1TWpncHhsVDhVWHNx?=
 =?utf-8?B?TVBBeXROc241aVBoUVd5T1FqN0lRRjVmZWZ5NWRUbGt1bE9IWHgyR0VCL2hj?=
 =?utf-8?B?NlZ4SFpoY0NIOVBzbFUzM21NUWlUeStOTFplbHh4Skg2aU5Hbjg4U1lHVWZx?=
 =?utf-8?B?L3ZuNXhXZEo5TjEwWm9JbjJFVUtVd3FLWlc0dUZkbmxRdkFMT2drdzljdkN4?=
 =?utf-8?B?OFhtbkk4Yy9iUXVFUUVUMVgzTk9pNzVjZ2hoZUJoaFlyaTVJcU50OUNFTkQ4?=
 =?utf-8?B?aDFTRmRBMWVUKzlVS0U5UHVXaWZLbk93eDNTZlFmcldIWGhZZ0gxbS8wek16?=
 =?utf-8?B?blNRZm1kdUVITHpIWWp1TmpXak5oaENoV0pPSEJpdDdzbjNqME5pMnhiOE0x?=
 =?utf-8?B?cDVCQ1BMWXBDT2g0aEV4K3JlTWxHWENBekNiTGUrRHhZelJObHNiRjFLZDFJ?=
 =?utf-8?B?ZmtRNkNoY01aU0crZWVsYlYvcTc2QS9ycllNaCtMUk05NnpDZzJBT2U0UVQ3?=
 =?utf-8?B?d0FHYW1iaW9xK1hzb0M3L2lUUysyZ1MxSjNUZzVPaC9OS3lGZEdrZG5oWHR2?=
 =?utf-8?B?MlZoeUxQZ2UwZ0w4SFRGZ3JvSGU1QzlTbTBzMldtNHlJU01Tb3IwamJaUWhi?=
 =?utf-8?B?cFFBbStiMk8zS0ZRa3pmMDNjOUg2K1N2bEhMMzgwbzR4NTVUcnhtb2N5V052?=
 =?utf-8?B?N1kyK3F6K1lHMW5XbU5mR2d6S21RelAydGpLUnJIbDcyWDJITjZ0TlRycDRl?=
 =?utf-8?B?MXZzOENDS1A5ZG00cHE2VHg3d2piRXYrblhzMEhTV3J6d0ZOU2FpSVoxbjg3?=
 =?utf-8?B?M21XM3dTZDBBcUpoRmJ6eGdtQklCOHB4MGpCOXlZMmNvc0R1b0haVmVsUHll?=
 =?utf-8?B?NEZNMHJOWjhOeTVJSUZuVkF2bUZmQmQwb1V0L3VqdmpoWElpVUtQMkVOa3VB?=
 =?utf-8?B?UDBsek84L1pSQllyQXZLNzZZYkNhZlp1d2hzNXB5cHBFaHJnZG5NRXJBeitw?=
 =?utf-8?B?ZFo5UTJrSnp6TTFhekUzeWFPbHE2R0lzT2xacmNmdlc5N1pGSm52QVVBc3dk?=
 =?utf-8?B?OW90NlFqWUZNRWpFLzAwOU5BSWsrZStjT1U1L01WUXlLNU0xWW5iWTZXNmhr?=
 =?utf-8?B?bzBNMEdMVU5yOTNRRU1uYmNiaHc2a3M5UXFQR2JIVytXaStxYnZqa21aU0pN?=
 =?utf-8?B?amxTbmNaeEwxVXRtVjlMMWtQc0xZTFZBZEloakJzOS9GRGcrcWl2WkloRXlO?=
 =?utf-8?B?UlF2S25sUHpYSllxZDloQzJYa2UwUStSeGxiVitoVXBTTHdmVW1QSzY1emJ1?=
 =?utf-8?B?YWQyL3ZmSUM2N2JlNzJnYTkyTndYdzZ6b1dMQ09JRWQ3OEpvU1hUNE9rNGpu?=
 =?utf-8?B?czZndnVVZGNlUXZiZG5tOUkwWCt6RUFiS1A1NGtVTUEwMzJzYmh0Uks4WnVU?=
 =?utf-8?Q?mjNJ6SJ5uG8Ue?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb92eb9e-e025-4954-af25-08d92035b96a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 11:02:16.7497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++imsC5OkPRYV1COb0i2Rt1kFC1VK3B9zHo+T/D44K1nMiMKjoro4WjL+kbxar6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.05.21 um 23:17 schrieb Jason Ekstrand:
> Modern userspace APIs like Vulkan are built on an explicit
> synchronization model.  This doesn't always play nicely with the
> implicit synchronization used in the kernel and assumed by X11 and
> Wayland.  The client -> compositor half of the synchronization isn't too
> bad, at least on intel, because we can control whether or not i915
> synchronizes on the buffer and whether or not it's considered written.
>
> The harder part is the compositor -> client synchronization when we get
> the buffer back from the compositor.  We're required to be able to
> provide the client with a VkSemaphore and VkFence representing the point
> in time where the window system (compositor and/or display) finished
> using the buffer.  With current APIs, it's very hard to do this in such
> a way that we don't get confused by the Vulkan driver's access of the
> buffer.  In particular, once we tell the kernel that we're rendering to
> the buffer again, any CPU waits on the buffer or GPU dependencies will
> wait on some of the client rendering and not just the compositor.
>
> This new IOCTL solves this problem by allowing us to get a snapshot of
> the implicit synchronization state of a given dma-buf in the form of a
> sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
> instead of CPU waiting directly, it encapsulates the wait operation, at
> the current moment in time, in a sync_file so we can check/wait on it
> later.  As long as the Vulkan driver does the sync_file export from the
> dma-buf before we re-introduce it for rendering, it will only contain
> fences from the compositor or display.  This allows to accurately turn
> it into a VkFence or VkSemaphore without any over- synchronization.

Regarding that, why do we actually use a syncfile and not a drm_syncobj 
here?

The later should be much closer to a Vulkan timeline semaphore.

Christian.

>
> v2 (Jason Ekstrand):
>   - Use a wrapper dma_fence_array of all fences including the new one
>     when importing an exclusive fence.
>
> v3 (Jason Ekstrand):
>   - Lock around setting shared fences as well as exclusive
>   - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
>   - Initialize ret to 0 in dma_buf_wait_sync_file
>
> v4 (Jason Ekstrand):
>   - Use the new dma_resv_get_singleton helper
>
> v5 (Jason Ekstrand):
>   - Rename the IOCTLs to import/export rather than wait/signal
>   - Drop the WRITE flag and always get/set the exclusive fence
>
> v6 (Jason Ekstrand):
>   - Drop the sync_file import as it was all-around sketchy and not nearly
>     as useful as import.
>   - Re-introduce READ/WRITE flag support for export
>   - Rework the commit message
>
> v7 (Jason Ekstrand):
>   - Require at least one sync flag
>   - Fix a refcounting bug: dma_resv_get_excl() doesn't take a reference
>   - Use _rcu helpers since we're accessing the dma_resv read-only
>
> v8 (Jason Ekstrand):
>   - Return -ENOMEM if the sync_file_create fails
>   - Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)
>
> v9 (Jason Ekstrand):
>   - Add documentation for the new ioctl
>
> v10 (Jason Ekstrand):
>   - Go back to dma_buf_sync_file as the ioctl struct name
>
> v11 (Daniel Vetter):
>   - Go back to dma_buf_export_sync_file as the ioctl struct name
>   - Better kerneldoc describing what the read/write flags do
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Acked-by: Simon Ser <contact@emersion.fr>
> Acked-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/dma-buf/dma-buf.c    | 67 ++++++++++++++++++++++++++++++++++++
>   include/uapi/linux/dma-buf.h | 35 +++++++++++++++++++
>   2 files changed, 102 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index ed6451d55d663..65a9574ee04ed 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -20,6 +20,7 @@
>   #include <linux/debugfs.h>
>   #include <linux/module.h>
>   #include <linux/seq_file.h>
> +#include <linux/sync_file.h>
>   #include <linux/poll.h>
>   #include <linux/dma-resv.h>
>   #include <linux/mm.h>
> @@ -191,6 +192,9 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>    * Note that this only signals the completion of the respective fences, i.e. the
>    * DMA transfers are complete. Cache flushing and any other necessary
>    * preparations before CPU access can begin still need to happen.
> + *
> + * As an alternative to poll(), the set of fences on DMA buffer can be
> + * exported as a &sync_file using &dma_buf_sync_file_export.
>    */
>   
>   static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> @@ -362,6 +366,64 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>   	return ret;
>   }
>   
> +#if IS_ENABLED(CONFIG_SYNC_FILE)
> +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> +				     void __user *user_data)
> +{
> +	struct dma_buf_export_sync_file arg;
> +	struct dma_fence *fence = NULL;
> +	struct sync_file *sync_file;
> +	int fd, ret;
> +
> +	if (copy_from_user(&arg, user_data, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (arg.flags & ~DMA_BUF_SYNC_RW)
> +		return -EINVAL;
> +
> +	if ((arg.flags & DMA_BUF_SYNC_RW) == 0)
> +		return -EINVAL;
> +
> +	fd = get_unused_fd_flags(O_CLOEXEC);
> +	if (fd < 0)
> +		return fd;
> +
> +	if (arg.flags & DMA_BUF_SYNC_WRITE) {
> +		fence = dma_resv_get_singleton_unlocked(dmabuf->resv);
> +		if (IS_ERR(fence)) {
> +			ret = PTR_ERR(fence);
> +			goto err_put_fd;
> +		}
> +	} else if (arg.flags & DMA_BUF_SYNC_READ) {
> +		fence = dma_resv_get_excl_unlocked(dmabuf->resv);
> +	}
> +
> +	if (!fence)
> +		fence = dma_fence_get_stub();
> +
> +	sync_file = sync_file_create(fence);
> +
> +	dma_fence_put(fence);
> +
> +	if (!sync_file) {
> +		ret = -ENOMEM;
> +		goto err_put_fd;
> +	}
> +
> +	fd_install(fd, sync_file->file);
> +
> +	arg.fd = fd;
> +	if (copy_to_user(user_data, &arg, sizeof(arg)))
> +		return -EFAULT;
> +
> +	return 0;
> +
> +err_put_fd:
> +	put_unused_fd(fd);
> +	return ret;
> +}
> +#endif
> +
>   static long dma_buf_ioctl(struct file *file,
>   			  unsigned int cmd, unsigned long arg)
>   {
> @@ -405,6 +467,11 @@ static long dma_buf_ioctl(struct file *file,
>   	case DMA_BUF_SET_NAME_B:
>   		return dma_buf_set_name(dmabuf, (const char __user *)arg);
>   
> +#if IS_ENABLED(CONFIG_SYNC_FILE)
> +	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> +		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> +#endif
> +
>   	default:
>   		return -ENOTTY;
>   	}
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 1f67ced853b14..aeba45180b028 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -67,6 +67,40 @@ struct dma_buf_sync {
>   
>   #define DMA_BUF_NAME_LEN	32
>   
> +/**
> + * struct dma_buf_export_sync_file - Get a sync_file from a dma-buf
> + *
> + * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FILE to retrieve the
> + * current set of fences on a dma-buf file descriptor as a sync_file.  CPU
> + * waits via poll() or other driver-specific mechanisms typically wait on
> + * whatever fences are on the dma-buf at the time the wait begins.  This
> + * is similar except that it takes a snapshot of the current fences on the
> + * dma-buf for waiting later instead of waiting immediately.  This is
> + * useful for modern graphics APIs such as Vulkan which assume an explicit
> + * synchronization model but still need to inter-operate with dma-buf.
> + */
> +struct dma_buf_export_sync_file {
> +	/**
> +	 * @flags: Read/write flags
> +	 *
> +	 * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
> +	 *
> +	 * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRITE is not set,
> +	 * the returned sync file waits on any writers of the dma-buf to
> +	 * complete.  Waiting on the returned sync file is equivalent to
> +	 * poll() with POLLIN.
> +	 *
> +	 * If DMA_BUF_SYNC_WRITE is set, the returned sync file waits on
> +	 * any users of the dma-buf (read or write) to complete.  Waiting
> +	 * on the returned sync file is equivalent to poll() with POLLOUT.
> +	 * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_READ are set, this
> +	 * is equivalent to just DMA_BUF_SYNC_WRITE.
> +	 */
> +	__u32 flags;
> +	/** @fd: Returned sync file descriptor */
> +	__s32 fd;
> +};
> +
>   #define DMA_BUF_BASE		'b'
>   #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>   
> @@ -76,5 +110,6 @@ struct dma_buf_sync {
>   #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
>   #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
>   #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
> +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
>   
>   #endif

