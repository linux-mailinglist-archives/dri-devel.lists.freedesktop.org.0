Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286C787BC18
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 12:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4783310FA94;
	Thu, 14 Mar 2024 11:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHCpeHrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9DA10FA94
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 11:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710416655; x=1741952655;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uHmXx1vffgb10IBWDDsRkysFRIXMcuzCGZ7lRM+V3YM=;
 b=UHCpeHrw9NemAVOFPXwD6rMInLadsGRc+0x8Auj+OuFAsyKQrPshaePj
 NO9BmI3oqeOt85ryz+h8Lzlu2ylLc9yEUVkbE8yXbim3W07bfJ/Kfdhi7
 kj40Fy7On3L3pYbBB8W9XJKNUW+nrdEk0MylihIFnhuaRsS4xdGrNZfqv
 IuST74GytH6VaJ+L9Zof31wmU4V3WTo9e3uI1u4paegXg/Cyj6q1VREu5
 XIlIE3v9wOnRFJDerTmHe3Gw6O1E/yhztamnVtelEYC3qcmmrdBnCK0PT
 ZCgE2+RmVVP0gegOL90WoK+TvPXjzuof+dH2iVmNtytRBdknBixbPgfqR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="30667521"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="30667521"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 04:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16923748"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.171])
 ([10.217.160.171])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 04:44:13 -0700
Message-ID: <e53e5a34-b9cd-4147-9d1a-f46f2cc65a63@linux.intel.com>
Date: Thu, 14 Mar 2024 12:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] accel/qaic: Add fifo queued debugfs
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ogabbay@kernel.org
References: <20240311165826.1728693-1-quic_jhugo@quicinc.com>
 <20240311165826.1728693-4-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240311165826.1728693-4-quic_jhugo@quicinc.com>
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
> When debugging functional issues with workload input processing, it is
> useful to know if requests are backing up in the fifo, or perhaps
> getting stuck elsewhere. To answer the question of how many requests are
> in the fifo, implement a "queued" debugfs entry per-dbc that returns the
> number of pending requests when read.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> ---
>  drivers/accel/qaic/qaic.h         |  1 +
>  drivers/accel/qaic/qaic_data.c    |  9 +++++++++
>  drivers/accel/qaic/qaic_debugfs.c | 31 +++++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index 03d9c9fbffb3..02561b6cecc6 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -288,6 +288,7 @@ int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
>  void enable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
>  void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
>  void release_dbc(struct qaic_device *qdev, u32 dbc_id);
> +void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail);
>  
>  void wake_all_cntl(struct qaic_device *qdev);
>  void qaic_dev_reset_clean_local_state(struct qaic_device *qdev);
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 2459fe4a3f95..e86e71c1cdd8 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -1981,3 +1981,12 @@ void release_dbc(struct qaic_device *qdev, u32 dbc_id)
>  	dbc->in_use = false;
>  	wake_up(&dbc->dbc_release);
>  }
> +
> +void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail)
> +{
> +	if (!dbc || !head || !tail)
> +		return;
> +
> +	*head = readl(dbc->dbc_base + REQHP_OFF);
> +	*tail = readl(dbc->dbc_base + REQTP_OFF);
> +}
> diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
> index 9d56cd451b64..12a65b98701d 100644
> --- a/drivers/accel/qaic/qaic_debugfs.c
> +++ b/drivers/accel/qaic/qaic_debugfs.c
> @@ -97,6 +97,36 @@ static const struct file_operations fifo_size_fops = {
>  	.release = single_release,
>  };
>  
> +static int read_dbc_queued(struct seq_file *s, void *unused)
> +{
> +	struct dma_bridge_chan *dbc = s->private;
> +	u32 tail = 0, head = 0;
> +
> +	qaic_data_get_fifo_info(dbc, &head, &tail);
> +
> +	if (head == U32_MAX || tail == U32_MAX)
> +		seq_printf(s, "%u\n", 0);
> +	else if (head > tail)
> +		seq_printf(s, "%u\n", dbc->nelem - head + tail);
> +	else
> +		seq_printf(s, "%u\n", tail - head);
> +
> +	return 0;
> +}
> +
> +static int queued_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, read_dbc_queued, inode->i_private);
> +}
> +
> +static const struct file_operations queued_fops = {
> +	.owner = THIS_MODULE,
> +	.open = queued_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
>  void qaic_debugfs_init(struct qaic_drm_device *qddev)
>  {
>  	struct qaic_device *qdev = qddev->qdev;
> @@ -112,6 +142,7 @@ void qaic_debugfs_init(struct qaic_drm_device *qddev)
>  		snprintf(name, QAIC_DBC_DIR_NAME, "dbc%03u", i);
>  		debugfs_dir = debugfs_create_dir(name, debugfs_root);
>  		debugfs_create_file("fifo_size", 0400, debugfs_dir, &qdev->dbc[i], &fifo_size_fops);
> +		debugfs_create_file("queued", 0400, debugfs_dir, &qdev->dbc[i], &queued_fops);
>  	}
>  }
>  
