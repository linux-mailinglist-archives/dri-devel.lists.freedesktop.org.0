Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77A63C809D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 10:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A50D6E1BC;
	Wed, 14 Jul 2021 08:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24416E1BC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 08:46:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaekSL4yyyRNqQu78zDbYm3HxrC4U9Msp3IkYd/xtmDgqPELVI+BBB2nwWxEgNyJkNPdYSdgpuW/P3rggMq4rDm5CFyaM6dxZrLIHNygUoKNc3tcHDUYx5hnryctI2LL3Rg9NghXp/ZZl0fuiaJvv1I7EW04XN5OsMjjDPy5CsGnzCQfaHAbTDsgp777ls7tD5c4KpuyVCaE6/eVoQ9UAGdLJEoeBINXgHvvPpP6QjbPOgpKZ07bAEVP4aAbNMyeQVXbExWXk/0n7CPTDWUKD/817YdQEm5ha2zQPE/mi3bLuAlz0/fvj1Bg3Jk16QAPJMonoYpmDlYn9jK8vpL4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGGaM9Atj+U2kWqKjofzTjdslb6UICiEQviNglUjAAw=;
 b=Z5T94k99n5SIuXOoG70z2yBDwlGmytSNcdKtOuGiAzn++OtcjR2ya4vVWUl8eZR+hRdlYZhkOb6kWpC/WYZsdxmfxUPoo0WAcy3sy1uwAG/SMpTXwdpNZNjWqcOWGxB/JVjlGM3erIhObBXO6YW5vDSuXS63C7VAAOduH9kzYO+NGKMqfTAxLTtYqMbIUD3ZFZjmTSv3p5WNBKU6/m26yqqxzrs9YMv7i07ExwwJL18XLqEeOAhvnRyY5okdJgeTbu14h1L05b22HcT2LMZizVXG2wsuOG6ksw63xmXMXlHW1zLSZHtUxKQBokDUDbHOzCMWjNx6mfN7uNJGpDMl7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGGaM9Atj+U2kWqKjofzTjdslb6UICiEQviNglUjAAw=;
 b=x3yy05lZx4XjXRCm3L4Gd/SkNBN03EvmrgoIy9W2R/6MeXtKVUy6dMsdz1Y+lTpTVNbQK12d3x2hgfrnLKnMn6PMU9rbOT4Q+S17Oez6RSGy5n7SP1gZmQowE3sU+k2HhNP44m0B+02DWd4Uf4jBaK0tnwogpes7g4Gk8/p2or8=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3696.namprd12.prod.outlook.com (2603:10b6:208:169::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 14 Jul
 2021 08:46:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 08:46:46 +0000
Subject: Re: [PATCH] dma-buf: add kernel count for dma_buf
To: guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>
References: <20210714071144.62126-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1bfb2001-b7d7-28b0-7fdf-ae9dbb7395b5@amd.com>
Date: Wed, 14 Jul 2021 10:46:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210714071144.62126-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P251CA0029.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 PR3P251CA0029.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 08:46:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c57bd610-d363-40d2-0a97-08d946a3e974
X-MS-TrafficTypeDiagnostic: MN2PR12MB3696:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3696BAD93F21D37DE2A1CCD483139@MN2PR12MB3696.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ztFNX2YWcBBaeE9IJx0M7Q5i1YgwsqsvV6DwJcF2K6wjGEAgQ7tqVXlnt8Kyr6pMUgAplfGDG/SICE313wjsyZnvAh4OYcVe39yM2lEwgIA1DVTSERCGyLaIG0rTgVu1tvCXuLOaaA1P0qfH8qZtEWYHKJM+nPwZnINoV8mSDE965Gl4EFcoayN2Gt6uAkieqKSlNK5+x+bs+GSSbFmpeLaYbErcgfts4Gxt4Y6ftmEJUpOO51YtUhQbpR7ulk2pSlwDSz9DuUolXUvwXIpi4Sbg2RUAVceRJXAoKHbTfeBVZpsFQdwce1lqDSS1/7YOy8xQx9Wmi3jJST+5eWdS0ehoDHavz6uqKI7O+VUFnrfE1d4vU8tIFre+OZbX22gdeqbNEafwwHibVMxkXjt3yZkoy4VoXfqxUL7KQNh6ezWgKl4XywWtuszEZVWpd754VNHeDpAisq6Eca6WCjrMHL0q3AgPghLXbsiH22IfgpGEqOmmZph+QafSM2I0EhcxAsk/zHbkoU+yyJmanE7nEcx8B7Rc4sygRI+XBlRI82dF9JPOnzccpL4G7MHnpyPt72OnrOrtMGmzDmLCBzGyrqgSOD59q8KJ6D+KQTW+0aef0HKS66Lmcqow6gq85Ct320EQpKpDE5Bn2/ClYYnCQkApUf7Kr+wMyDvw2kccuobqcJSviGY4ipoMfODucaxoz0c+gSRFedKXOVjDzvipKJ/fZlOCYNyIgwT9A80a4Ts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(31696002)(2616005)(316002)(6916009)(8936002)(6486002)(4326008)(5660300002)(38100700002)(478600001)(8676002)(86362001)(83380400001)(36756003)(2906002)(6666004)(66946007)(186003)(66556008)(66476007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFk2U0pEOVIwdzVVSjU2azE1OXVFY2ROckNJd0VnbzVUV1FtMnVrZTdoOGVq?=
 =?utf-8?B?Z0d4WU81SjVLaVRjYzhZMDloeElkV2JsVHI4MGJQRmpHV2tyN3NXQ2Irbmdx?=
 =?utf-8?B?WnE1MGFTUE5wTjVVS0l6VmxkZGgrUGhkWnJOY0x3ZWJIYnFaMytNcS9tYVFI?=
 =?utf-8?B?MDgyQkVlRVBjTkRnK3RPcG1pM25pVUtsT3E1OUg5MlVkU3hJa1RpaU15RVVS?=
 =?utf-8?B?VnNxRzFsR3kyMTdxUHo4ZWVmSGtXL3E3N3ZZRFhxc1IxR1l6aDN3MDcrdHlE?=
 =?utf-8?B?VndZN1htODM1bjRHVHBibnRCTThwblcremdDTW1pR3VBZGp0S1hCQ29Mcldt?=
 =?utf-8?B?VmNXbEYwK0pQdEFBQWovY2tqZXYyRkYrbEFkTTNpOWlSdGJxcjNHNUx3OWJl?=
 =?utf-8?B?dFEzTWpYampnbTlwT2RKTEUzRzJXdE9lcjJ2T082TTZNS0tKOHNSeWVHdVYz?=
 =?utf-8?B?R0ZGUUREOHlVbit0SGNubkIzT3NPNDNEUlAwVnV1QnRKRXY1NWM1MENWR2Nm?=
 =?utf-8?B?Z0xvOThBWjhlZnRnOHAycUFNYWVjYkVkWE1UeXVJSWFlRXM2elJEeWhldXR0?=
 =?utf-8?B?ZEJEa0MzczY3cVJQbzM0TGpYLyttY0g0YmRWclUwZ2VrTnJCbVhBVDdJVytL?=
 =?utf-8?B?bDRtdlVZQ1Z0MGhnUzdxRFpRSnFmL0FNZzI5WVM3UzZpWk1MSVVUaVBOOWxo?=
 =?utf-8?B?cjFvUG0yU2pOejZ3a1RBSTlwRFNZcXpCMkRmdmVxY2tlV3R0dyswYXNDUTVm?=
 =?utf-8?B?dmV6YjRYTEU4OUdlQUpJUkhocUk1YlFwSkF2d3RHamhYaDRxR1lsT0d6VjVY?=
 =?utf-8?B?N3U2RFRMcm5zZVV1OEV2Nnh0YnpsNlcrS0h6OXZaY3VBanM1VmRlMGxXRkox?=
 =?utf-8?B?QnhqblJ2dStYRGdOQVpZd3RSam02UzNsTWgxT3ovQVk4ODNpMG9yL3Q1bmsy?=
 =?utf-8?B?ZHlCc0FOZE8zNFZRMmlkazQ1SXB0bkxTdzlkVU9ZazU5MG54TEtMZDNCczJU?=
 =?utf-8?B?bzJTNmx6YVZhR0ZKOXlVMWcxaEVrb0VWekd6NmJodVZtcE9TRFV1K3dMNnhi?=
 =?utf-8?B?TU1XdldWZU5XbU9UblZRQzQzMXJZdkZQaFFHS0pZOTg1em5lOTA0NUp1RlZK?=
 =?utf-8?B?ZmIwYTl6aHFTWXBoUVRZRGk1QTF2QTVlMDMzSjYrMjd4bWNBaklkbG5Pc29x?=
 =?utf-8?B?RlozV25TODBrUldPQ1NTeGxXUGh2R3k5Z1QrcGRqVExXcWltRTFyRFRobjdo?=
 =?utf-8?B?ZHJBWktpejdFckNpWGt1OCt3QnRBa3lLYnpwUjBKbVlpemNQVXE3elphR0VK?=
 =?utf-8?B?aHAwcXFObm5mVmFyQ0pGTFVEaDlwNzlJOFdmck9aM2RseDErQ2ZMdG5qbjRk?=
 =?utf-8?B?ZEt0cDJoK0dCTjlXS1V3SFlVMFljZE1sRzkwTTFTRkljMlBiMDVNcXVyK1Q1?=
 =?utf-8?B?N0VvMXlnVGxEaWQ2SC8wQnd6NXVpdlR3Q1hVWEhxUjc0Szdta3UrUmFQcks3?=
 =?utf-8?B?MHUvSFdScUFxSEp3ZTlMZkFweVN3OVdXYzZ1RGxLZ08vaWN6dkR1a0w4Ui9u?=
 =?utf-8?B?MytqQnJOZjc2ZHZycEhYUmJLMFFkVHg4VTlEYUJhYys4bDhxMDc5cDg0WEJq?=
 =?utf-8?B?VUhMNzQ4cWdGd2NaTTVidzd4dHFIWXFWODBtSGtielhoUFZiWEthTjBLb1Vw?=
 =?utf-8?B?TWNHRU1RaFVDcEVPOElsSXlEYTEva0VzTmNoL3F5QXVlNVpZZWFGQzc1aGdO?=
 =?utf-8?B?S05QdWNnMUxFSEpLeFJUTjhOUkNJbXgvU3pGZEhrejhzTGx1cXVMM2FsSzR1?=
 =?utf-8?B?Q3lnWms4UWRpTEkwczZtV2xRRlZYeXRzVmhSdHN2N0drNmtMYnNWUktQcnNU?=
 =?utf-8?Q?54XGwNq5ARAAO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57bd610-d363-40d2-0a97-08d946a3e974
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 08:46:46.1504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNtm9OjJZN3i1zY+fDG5R7ySAGtvck1kaTe0UNDzMAN1eYLwupTszlv4g0+XWiB5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.21 um 09:11 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> Add a refcount for kernel to prevent UAF(Use After Free) issue.

Well NAK on so many levels.

>
> We can assume a case like below:
>      1. kernel space alloc dma_buf(file count = 1)
>      2. kernel use dma_buf to get fd(file count = 1)
>      3. userspace use fd to do mapping (file count = 2)

Creating an userspace mapping increases the reference count for the 
underlying file object.

See the implementation of mmap_region():
...
                 vma->vm_file = get_file(file);
                 error = call_mmap(file, vma);
...

What can happen is the the underlying exporter redirects the mmap to a 
different file, e.g. TTM or GEM drivers do that all the time.

But this is fine since then the VA mapping is independent of the DMA-buf.

>      4. kernel call dma_buf_put (file count = 1)
>      5. userpsace close buffer fd(file count = 0)
>      6. at this time, buffer is released, but va is valid!!
>         So we still can read/write buffer via mmap va,
>         it maybe cause memory leak, or kernel exception.
>         And also, if we use "ls -ll" to watch corresponding process
>             fd link info, it also will cause kernel exception.
>
> Another case:
>       Using dma_buf_fd to generate more than 1 fd, because
>       dma_buf_fd will not increase file count, thus, when close
>       the second fd, it maybe occurs error.

Each opened fd will increase the reference count so this is certainly 
not correct what you describe here.

Regards,
Christian.

>
> Solution:
>      Add a kernel count for dma_buf, and make sure the file count
>          of dma_buf.file hold by kernel is 1.
>
> Notes: For this solution, kref couldn't work because kernel ref
>         maybe added from 0, but kref don't allow it.
>
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++----
>   include/linux/dma-buf.h   |  6 ++++--
>   2 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..04ee92aac8b9 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -62,6 +62,7 @@ static void dma_buf_release(struct dentry *dentry)
>   	if (unlikely(!dmabuf))
>   		return;
>   
> +	WARN_ON(atomic64_read(&dmabuf->kernel_ref));
>   	BUG_ON(dmabuf->vmapping_counter);
>   
>   	/*
> @@ -555,6 +556,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   		goto err_module;
>   	}
>   
> +	atomic64_set(&dmabuf->kernel_ref, 1);
>   	dmabuf->priv = exp_info->priv;
>   	dmabuf->ops = exp_info->ops;
>   	dmabuf->size = exp_info->size;
> @@ -617,6 +619,9 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
>   
>   	fd_install(fd, dmabuf->file);
>   
> +	/* Add file cnt for each new fd */
> +	get_file(dmabuf->file);
> +
>   	return fd;
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_fd);
> @@ -626,12 +631,13 @@ EXPORT_SYMBOL_GPL(dma_buf_fd);
>    * @fd:	[in]	fd associated with the struct dma_buf to be returned
>    *
>    * On success, returns the struct dma_buf associated with an fd; uses
> - * file's refcounting done by fget to increase refcount. returns ERR_PTR
> - * otherwise.
> + * dmabuf's ref refcounting done by kref_get to increase refcount.
> + * Returns ERR_PTR otherwise.
>    */
>   struct dma_buf *dma_buf_get(int fd)
>   {
>   	struct file *file;
> +	struct dma_buf *dmabuf;
>   
>   	file = fget(fd);
>   
> @@ -643,7 +649,12 @@ struct dma_buf *dma_buf_get(int fd)
>   		return ERR_PTR(-EINVAL);
>   	}
>   
> -	return file->private_data;
> +	dmabuf = file->private_data;
> +	/* replace file count increase as ref increase for kernel user */
> +	get_dma_buf(dmabuf);
> +	fput(file);
> +
> +	return dmabuf;
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_get);
>   
> @@ -662,7 +673,11 @@ void dma_buf_put(struct dma_buf *dmabuf)
>   	if (WARN_ON(!dmabuf || !dmabuf->file))
>   		return;
>   
> -	fput(dmabuf->file);
> +	if (WARN_ON(!atomic64_read(&dmabuf->kernel_ref)))
> +		return;
> +
> +	if (!atomic64_dec_return(&dmabuf->kernel_ref))
> +		fput(dmabuf->file);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_put);
>   
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..bc790cb028eb 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -308,6 +308,7 @@ struct dma_buf_ops {
>   struct dma_buf {
>   	size_t size;
>   	struct file *file;
> +	atomic64_t kernel_ref;
>   	struct list_head attachments;
>   	const struct dma_buf_ops *ops;
>   	struct mutex lock;
> @@ -436,7 +437,7 @@ struct dma_buf_export_info {
>   					 .owner = THIS_MODULE }
>   
>   /**
> - * get_dma_buf - convenience wrapper for get_file.
> + * get_dma_buf - increase a kernel ref of dma-buf
>    * @dmabuf:	[in]	pointer to dma_buf
>    *
>    * Increments the reference count on the dma-buf, needed in case of drivers
> @@ -446,7 +447,8 @@ struct dma_buf_export_info {
>    */
>   static inline void get_dma_buf(struct dma_buf *dmabuf)
>   {
> -	get_file(dmabuf->file);
> +	if (atomic64_inc_return(&dmabuf->kernel_ref) == 1)
> +		get_file(dmabuf->file);
>   }
>   
>   /**

