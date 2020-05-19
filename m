Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609331D9DDD
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 19:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07DF89D56;
	Tue, 19 May 2020 17:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E6389D56
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 17:27:11 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAA3E2075F;
 Tue, 19 May 2020 17:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589909231;
 bh=H0JVax6+rI5E8PoDQXfzlgFlvoFTlMX30NveHQ/xehM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mHq2BGF6FziUkAkpNryBRyJt8DLsHD5EJp4Rc8Zf0rYjDbT5xlFNZ9uCqgKgFnMFR
 GkU/QA9CDeyS6Tbh6I6ylxQo4Mrxd+S15IQOKX9Dd/Dyi6pkJ1knAZYYqbRz5ORvz/
 rc0bNzK2ubvHhna/FFM4Hc+Kl2HAqzMdr1K6QAN8=
Date: Tue, 19 May 2020 19:27:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [RFC PATCH 1/4] gpu: dxgkrnl: core code
Message-ID: <20200519172709.GA1150171@kroah.com>
References: <20200519163234.226513-1-sashal@kernel.org>
 <20200519163234.226513-2-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519163234.226513-2-sashal@kernel.org>
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com,
 tvrtko.ursulin@intel.com, haiyangz@microsoft.com, spronovo@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, wei.liu@kernel.org, linux-fbdev@vger.kernel.org,
 iourit@microsoft.com, alexander.deucher@amd.com, kys@microsoft.com,
 Hawking.Zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 19, 2020 at 12:32:31PM -0400, Sasha Levin wrote:
> +static int dxgglobal_init_global_channel(struct hv_device *hdev)
> +{
> +	int ret = 0;
> +
> +	TRACE_DEBUG(1, "%s %x  %x", __func__, hdev->vendor_id, hdev->device_id);
> +	{
> +		TRACE_DEBUG(1, "device type   : %pUb\n", &hdev->dev_type);
> +		TRACE_DEBUG(1, "device channel: %pUb %p primary: %p\n",
> +			    &hdev->channel->offermsg.offer.if_type,
> +			    hdev->channel, hdev->channel->primary_channel);
> +	}
> +
> +	if (dxgglobal->hdev) {
> +		/* This device should appear only once */
> +		pr_err("dxgglobal already initialized\n");
> +		ret = -EBADE;
> +		goto error;
> +	}
> +
> +	dxgglobal->hdev = hdev;
> +
> +	ret = dxgvmbuschannel_init(&dxgglobal->channel, hdev);
> +	if (ret) {
> +		pr_err("dxgvmbuschannel_init failed: %d\n", ret);
> +		goto error;
> +	}
> +
> +	ret = dxgglobal_getiospace(dxgglobal);
> +	if (ret) {
> +		pr_err("getiospace failed: %d\n", ret);
> +		goto error;
> +	}
> +
> +	ret = dxgvmb_send_set_iospace_region(dxgglobal->mmiospace_base,
> +					     dxgglobal->mmiospace_size, 0);
> +	if (ret) {
> +		pr_err("send_set_iospace_region failed\n");
> +		goto error;
> +	}
> +
> +	hv_set_drvdata(hdev, dxgglobal);
> +
> +	if (alloc_chrdev_region(&dxgglobal->device_devt, 0, 1, "dxgkrnl") < 0) {
> +		pr_err("alloc_chrdev_region failed\n");
> +		ret = -ENODEV;
> +		goto error;
> +	}
> +	dxgglobal->devt_initialized = true;
> +	dxgglobal->device_class = class_create(THIS_MODULE, "dxgkdrv");
> +	if (dxgglobal->device_class == NULL) {
> +		pr_err("class_create failed\n");
> +		ret = -ENODEV;
> +		goto error;
> +	}
> +	dxgglobal->device_class->devnode = dxg_devnode;
> +	dxgglobal->device = device_create(dxgglobal->device_class, NULL,
> +					  dxgglobal->device_devt, NULL, "dxg");
> +	if (dxgglobal->device == NULL) {
> +		pr_err("device_create failed\n");
> +		ret = -ENODEV;
> +		goto error;
> +	}
> +	dxgglobaldev = dxgglobal->device;
> +	cdev_init(&dxgglobal->device_cdev, &dxgk_fops);
> +	ret = cdev_add(&dxgglobal->device_cdev, dxgglobal->device_devt, 1);
> +	if (ret < 0) {
> +		pr_err("cdev_add failed: %d\n", ret);
> +		goto error;
> +	}
> +	dxgglobal->cdev_initialized = true;
> +
> +error:
> +	return ret;
> +}

As you only are asking for a single char dev node, please just use the
misc device api instead of creating your own class and major number on
the fly.  It's much simpler and easier overall to make sure you got all
of the above logic correct.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
