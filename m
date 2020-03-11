Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3A181970
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62E989FE6;
	Wed, 11 Mar 2020 13:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913316E434
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 13:18:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGJDu7BfAJbJW6M5fCzrHAMJl/W9KjiGn9B39tTx1MHJvrN74cZ3Bte7vwsY37oGSO0DH+Ua78l7QF1BilREb2nvEwiH322bAdOgnNRw5fhigxtP8qpcr1gVWmjiaolAl9R/FSQTbVmn69xG4AtKst7qOA+FT6uAcIFEQusJnvt7wPmZkrTkfmEZzWrb5t8HRhxKinjqiKZq6pNGBCuy8zCPIGoeRCTCMs6dBsYIuiahCXrFf0+jbQYb4/dLwAv0tEsjNT1rprd8nDOw3jHZvjcOTZ0HmuRxBLl8FCnWJP2TXa0Cqae7eWegSfg8AHWgYLxe6+kQhuyn6Cfr2lBYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrThXZkjgIZaBgvlf0qoh0kcPiuLhBphetOpt30Wl7M=;
 b=ng+VRtyWnSYvMUWlw52vsYh6w2toT3XA3B1HHGpqvmIdeb8rC+r6B7sOpzzOzI6dFBRJhLFnryqkwgIh+mczP5qRGiV1T2qt4q3MLMN07r/zrlSntIajqZI9+QUk+9GYWIxUe3Us2kEGI5MQFV8wW14TDCVz3ss6pbF18uLYP4kLycY2tcTVQ9yzp64EbdMbu2QNXMh6I1x9FOU0r3ZAd90wSfgJ9E/byjXiLzIR1VxwHo+SWOzOJILyt1gJwY7RcHyeKJfZkZgdT+gy4WHax+rSKtx5ufVUuMHDm3Hf2uIvZXx7SBenyX7po/HpQWx5d3QmCDacLtR6z8EqCp8gnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrThXZkjgIZaBgvlf0qoh0kcPiuLhBphetOpt30Wl7M=;
 b=QBcIL3XCsK3kzYSoN6rs+XqkiPxPNphg14fMQsKOKEvjFzE+83kwkxNIgFadcYQpWZEw0lbQaPKz6sJfMg8O/yhKHu1lRNx5FpteAPre9rMSUl4tz7h2lWaOCz21c8sdg5EC+qht/0aGueLgQSjeHb9Qdqe49I+ZQb1uAY7rhDc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1451.namprd12.prod.outlook.com (2603:10b6:4:d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Wed, 11 Mar 2020 13:18:20 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2793.018; Wed, 11 Mar
 2020 13:18:20 +0000
Subject: Re: [PATCH 3/3] RFC: dma-buf: Add an API for importing and exporting
 sync files (v4)
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20200303190318.522103-1-jason@jlekstrand.net>
 <20200311034351.1275197-1-jason@jlekstrand.net>
 <20200311034351.1275197-3-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bcd22ed3-c1fe-c018-5cb2-a077562eb1ff@amd.com>
Date: Wed, 11 Mar 2020 14:18:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200311034351.1275197-3-jason@jlekstrand.net>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16 via Frontend Transport; Wed, 11 Mar 2020 13:18:17 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4cc76f37-e918-47ac-288f-08d7c5beab23
X-MS-TrafficTypeDiagnostic: DM5PR12MB1451:
X-Microsoft-Antispam-PRVS: <DM5PR12MB14519AD72BA75A88E6A6AE9483FC0@DM5PR12MB1451.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(199004)(36756003)(86362001)(31686004)(6666004)(31696002)(478600001)(4326008)(6486002)(5660300002)(8936002)(66946007)(54906003)(316002)(2906002)(16526019)(8676002)(7416002)(6916009)(186003)(66556008)(81156014)(2616005)(52116002)(81166006)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1451;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tunja+SRvum3Ce13cC9n9/QqbdfiCzMiatwCY1xpsDVXyjy8IuTetZK6t8/LdG07ddYFZ08p9kEeS6JNdrJf1TYrJVjuPy9igadEw5FJJU/ALNFF6YryCxY3kPvKPpdUNOye+66i/9vjw+N/vVbL2UIZxFEfeYWq4aTMBNqWp9eRK4l15yuyK0CRUTaPuK7Hrxf5LZoUsYiXO1YJTXWPz8rxN/xKLUTlVXCNZmIQmBE0Ud+ACE8fOxXiUzTgTe9c3Y/5D5A811D61tQm4bH2lMYqRXP4W+xgcUW6VtffKCe3q7zmU+OQN87Mi89+EOqME8XlhzHYGO0W/ja0ZYHrsnDfauQjthBqyicHrHX680pYJU0ovpsRsFUjX8gOpd6jetYPcFylHmNNYPXkgISrqdLbjBCT7Uz9SyZZ7jrN4G6chec8ANvYnKd4VDs09cXc
X-MS-Exchange-AntiSpam-MessageData: 321WkAqk8XNkss6YSG5o0GiCp1tHsfSTzT9mPPYcsakwN7fJ9Yi1RZJUVBJFGSLTpk70cwgp8tEDnKlFOM1BqQZQSU01oiQWBxQH5D3B95eIyubkF/PWdowxhDCU50t19vGuQkc/vuTQL46IGbP25/wGO3QEz46PN96EKkaxhp6v2P1BBrkX3/kwHwUMHH0PV2d5NZaRoHebZeDaZE6ItA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc76f37-e918-47ac-288f-08d7c5beab23
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 13:18:20.7248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OJATtBygH+gYcDrZMYVFHUVRJ5eP/6D3fJUGWvSiuOtqej8ecLizU7MQRQG6fco
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1451
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
Cc: Chenbo Feng <fengc@google.com>, daniels@collabora.com,
 daniel.vetter@ffwll.ch, jajones@nvidia.com, linux-kernel@vger.kernel.org,
 Greg Hackmann <ghackmann@google.com>, linaro-mm-sig@lists.linaro.org,
 hoegsberg@google.com, dri-devel@lists.freedesktop.org, jessehall@google.com,
 airlied@redhat.com, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.03.20 um 04:43 schrieb Jason Ekstrand:
> Explicit synchronization is the future.  At least, that seems to be what
> most userspace APIs are agreeing on at this point.  However, most of our
> Linux APIs (both userspace and kernel UAPI) are currently built around
> implicit synchronization with dma-buf.  While work is ongoing to change
> many of the userspace APIs and protocols to an explicit synchronization
> model, switching over piecemeal is difficult due to the number of
> potential components involved.  On the kernel side, many drivers use
> dma-buf including GPU (3D/compute), display, v4l, and others.  In
> userspace, we have X11, several Wayland compositors, 3D drivers, compute
> drivers (OpenCL etc.), media encode/decode, and the list goes on.
>
> This patch provides a path forward by allowing userspace to manually
> manage the fences attached to a dma-buf.  Alternatively, one can think
> of this as making dma-buf's implicit synchronization simply a carrier
> for an explicit fence.  This is accomplished by adding two IOCTLs to
> dma-buf for importing and exporting a sync file to/from the dma-buf.
> This way a userspace component which is uses explicit synchronization,
> such as a Vulkan driver, can manually set the write fence on a buffer
> before handing it off to an implicitly synchronized component such as a
> Wayland compositor or video encoder.  In this way, each of the different
> components can be upgraded to an explicit synchronization model one at a
> time as long as the userspace pieces connecting them are aware of it and
> import/export fences at the right times.
>
> There is a potential race condition with this API if userspace is not
> careful.  A typical use case for implicit synchronization is to wait for
> the dma-buf to be ready, use it, and then signal it for some other
> component.  Because a sync_file cannot be created until it is guaranteed
> to complete in finite time, userspace can only signal the dma-buf after
> it has already submitted the work which uses it to the kernel and has
> received a sync_file back.  There is no way to atomically submit a
> wait-use-signal operation.  This is not, however, really a problem with
> this API so much as it is a problem with explicit synchronization
> itself.  The way this is typically handled is to have very explicit
> ownership transfer points in the API or protocol which ensure that only
> one component is using it at any given time.  Both X11 (via the PRESENT
> extension) and Wayland provide such ownership transfer points via
> explicit present and idle messages.
>
> The decision was intentionally made in this patch to make the import and
> export operations IOCTLs on the dma-buf itself rather than as a DRM
> IOCTL.  This makes it the import/export operation universal across all
> components which use dma-buf including GPU, display, v4l, and others.
> It also means that a userspace component can do the import/export
> without access to the DRM fd which may be tricky to get in cases where
> the client communicates with DRM via a userspace API such as OpenGL or
> Vulkan.  At a future date we may choose to add direct import/export APIs
> to components such as drm_syncobj to avoid allocating a file descriptor
> and going through two ioctls.  However, that seems to be something of a
> micro-optimization as import/export operations are likely to happen at a
> rate of a few per frame of rendered or decoded video.
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
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>   drivers/dma-buf/dma-buf.c    | 96 ++++++++++++++++++++++++++++++++++++
>   include/uapi/linux/dma-buf.h | 13 ++++-
>   2 files changed, 107 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d4097856c86b..09973c689866 100644
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
> @@ -348,6 +349,95 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>   	return ret;
>   }
>   
> +static long dma_buf_wait_sync_file(struct dma_buf *dmabuf,
> +				   const void __user *user_data)
> +{
> +	struct dma_buf_sync_file arg;
> +	struct dma_fence *fence;
> +	int ret = 0;
> +
> +	if (copy_from_user(&arg, user_data, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (arg.flags != 0 && arg.flags != DMA_BUF_SYNC_FILE_SYNC_WRITE)
> +		return -EINVAL;
> +
> +	fence = sync_file_get_fence(arg.fd);
> +	if (!fence)
> +		return -EINVAL;
> +
> +	dma_resv_lock(dmabuf->resv, NULL);
> +
> +	if (arg.flags & DMA_BUF_SYNC_FILE_SYNC_WRITE) {
> +		struct dma_fence *singleton = NULL;
> +		ret = dma_resv_get_singleton(dmabuf->resv, fence, &singleton);
> +		if (!ret && singleton)
> +			dma_resv_add_excl_fence(dmabuf->resv, singleton);
> +	} else {
> +		dma_resv_add_shared_fence(dmabuf->resv, fence);
> +	}

You also need to create a singleton when adding a shared fences.

The problem is that shared fences must always signal after exclusive 
ones and you can't guarantee that for the fence you add here.

Regards,
Christian.

> +
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	dma_fence_put(fence);
> +
> +	return ret;
> +}
> +
> +static long dma_buf_signal_sync_file(struct dma_buf *dmabuf,
> +				     void __user *user_data)
> +{
> +	struct dma_buf_sync_file arg;
> +	struct dma_fence *fence = NULL;
> +	struct sync_file *sync_file;
> +	int fd, ret;
> +
> +	if (copy_from_user(&arg, user_data, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (arg.flags != 0 && arg.flags != DMA_BUF_SYNC_FILE_SYNC_WRITE)
> +		return -EINVAL;
> +
> +	fd = get_unused_fd_flags(O_CLOEXEC);
> +	if (fd < 0)
> +		return fd;
> +
> +	if (arg.flags & DMA_BUF_SYNC_FILE_SYNC_WRITE) {
> +		/* We need to include both the exclusive fence and all of
> +		 * the shared fences in our fence.
> +		 */
> +		ret = dma_resv_get_singleton(dmabuf->resv, NULL, &fence);
> +		if (ret)
> +			goto err_put_fd;
> +	} else {
> +		fence = dma_resv_get_excl_rcu(dmabuf->resv);
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
> +		ret = -EINVAL;
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
> +
>   static long dma_buf_ioctl(struct file *file,
>   			  unsigned int cmd, unsigned long arg)
>   {
> @@ -390,6 +480,12 @@ static long dma_buf_ioctl(struct file *file,
>   	case DMA_BUF_SET_NAME:
>   		return dma_buf_set_name(dmabuf, (const char __user *)arg);
>   
> +	case DMA_BUF_IOCTL_WAIT_SYNC_FILE:
> +		return dma_buf_wait_sync_file(dmabuf, (const void __user *)arg);
> +
> +	case DMA_BUF_IOCTL_SIGNAL_SYNC_FILE:
> +		return dma_buf_signal_sync_file(dmabuf, (void __user *)arg);
> +
>   	default:
>   		return -ENOTTY;
>   	}
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index dbc7092e04b5..86e07acca90c 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -37,8 +37,17 @@ struct dma_buf_sync {
>   
>   #define DMA_BUF_NAME_LEN	32
>   
> +struct dma_buf_sync_file {
> +	__u32 flags;
> +	__s32 fd;
> +};
> +
> +#define DMA_BUF_SYNC_FILE_SYNC_WRITE	(1 << 0)
> +
>   #define DMA_BUF_BASE		'b'
> -#define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> -#define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
> +#define DMA_BUF_IOCTL_SYNC	    _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> +#define DMA_BUF_SET_NAME	    _IOW(DMA_BUF_BASE, 1, const char *)
> +#define DMA_BUF_IOCTL_WAIT_SYNC_FILE	_IOW(DMA_BUF_BASE, 2, struct dma_buf_sync)
> +#define DMA_BUF_IOCTL_SIGNAL_SYNC_FILE	_IOWR(DMA_BUF_BASE, 3, struct dma_buf_sync)
>   
>   #endif

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
