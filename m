Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E687BC16
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 12:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB5010FAAE;
	Thu, 14 Mar 2024 11:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J73i6yPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3B010FA98
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710416648; x=1741952648;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ct0qtteLWRuP4T+oueuENUKOt33yRcrAKOAHbGdNbKA=;
 b=J73i6yPnP99w3zhfNmUCDXRD4xKws9UzXg8IeZ99l5X2Goi+AL2dnk5k
 7cIWg7izCCi6Xithj7PqzhuwjWF1Vjl7TSVMXrIQ0BkVldt0TQbdZVB/X
 FxDxwV48av1G1Gi7KubIFo14fmag0FZaqus0JUO/jWfhF85BsPSJHSsAc
 SOKXMylga91si4OXJqChl+EV2TCjgB4UXpi1TGWG12JkhO66aMsHf77OA
 fZhj6tcvVq0WI7mrgsmGxsY4mY8gFVtsP0QLUYVAUYOHKF1oUBjYLEODB
 QdhBtZLLEU9Z6D+VcvBGC7svPGdyt5TkhOdTAdg2T+dhlCB3BzLcBaPNE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="30667515"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="30667515"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 04:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16923703"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.171])
 ([10.217.160.171])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 04:44:06 -0700
Message-ID: <a66d528b-e086-434f-9429-2f99352ba6a4@linux.intel.com>
Date: Thu, 14 Mar 2024 12:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] accel/qaic: Add fifo size debugfs
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ogabbay@kernel.org
References: <20240311165826.1728693-1-quic_jhugo@quicinc.com>
 <20240311165826.1728693-3-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240311165826.1728693-3-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 11.03.2024 17:58, Jeffrey Hugo wrote:
> Each DMA Bridge Channel (dbc) has a unique configured fifo size which is
> specified by the userspace client of that dbc. Since the fifo is
> circular, it is useful to know the configured size when debugging
> issues.
> 
> Add a per-dbc subdirectory in debugfs and in each subdirectory add a
> fifo_size entry that will display the size of that dbc's fifo when read.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> ---
>  drivers/accel/qaic/qaic_debugfs.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
> index 4f87fe29be1a..9d56cd451b64 100644
> --- a/drivers/accel/qaic/qaic_debugfs.c
> +++ b/drivers/accel/qaic/qaic_debugfs.c
> @@ -11,6 +11,7 @@
>  #include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/seq_file.h>
> +#include <linux/sprintf.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
> @@ -20,6 +21,7 @@
>  
>  #define BOOTLOG_POOL_SIZE		16
>  #define BOOTLOG_MSG_SIZE		512
> +#define QAIC_DBC_DIR_NAME		9
>  
>  struct bootlog_msg {
>  	/* Buffer for bootlog messages */
> @@ -74,14 +76,43 @@ static const struct file_operations bootlog_fops = {
>  	.release = single_release,
>  };
>  
> +static int read_dbc_fifo_size(struct seq_file *s, void *unused)
> +{
> +	struct dma_bridge_chan *dbc = s->private;
> +
> +	seq_printf(s, "%u\n", dbc->nelem);
> +	return 0;
> +}
> +
> +static int fifo_size_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, read_dbc_fifo_size, inode->i_private);
> +}
> +
> +static const struct file_operations fifo_size_fops = {
> +	.owner = THIS_MODULE,
> +	.open = fifo_size_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
>  void qaic_debugfs_init(struct qaic_drm_device *qddev)
>  {
>  	struct qaic_device *qdev = qddev->qdev;
>  	struct dentry *debugfs_root;
> +	struct dentry *debugfs_dir;
> +	char name[QAIC_DBC_DIR_NAME];
> +	u32 i;
>  
>  	debugfs_root = to_drm(qddev)->debugfs_root;
>  
>  	debugfs_create_file("bootlog", 0400, debugfs_root, qdev, &bootlog_fops);
> +	for (i = 0; i < qdev->num_dbc; ++i) {
> +		snprintf(name, QAIC_DBC_DIR_NAME, "dbc%03u", i);
> +		debugfs_dir = debugfs_create_dir(name, debugfs_root);
> +		debugfs_create_file("fifo_size", 0400, debugfs_dir, &qdev->dbc[i], &fifo_size_fops);
> +	}
>  }
>  
>  static struct bootlog_page *alloc_bootlog_page(struct qaic_device *qdev)
