Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959FFA0794E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 15:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC2510EE02;
	Thu,  9 Jan 2025 14:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="B4JeJ+Xp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F90510EE02
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 14:33:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736433217; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TRbofxRG6kLKwwx7dLk5yoIPcPtIagbVrY3yIt/m2x5mNIK10ZwkUJm0SwugF72kqwHY2+a35L4JIinTz54pjx3IEzhthyTvu0b37aFlIc2/K67DHaxUZy4hd98teFdtyzKP8VAtzzTrsVmL2HR8AKPgrTMP7WI7Ap/7QCDJVrE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736433217;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=r08Q1WaG1jfUysK6PfYcK7ARnLuiCI5/X6ejvM/S2qQ=; 
 b=bMM0sYf1B/dfYW+U471gc66QrIV4QkZCZ5SQcY6lpqrh6IC6ktpAl3R7wAN3JvCbqHgLtFrE3o336xJ4IKdXv0uj7mGHpSTI7mcomjdMBx5ery2hntcduLBYaOHHj5js9CuXePrEuFKKF7P/b6KYkv4h4wW+0/Ob6xSXUAYfp8s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736433217; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=r08Q1WaG1jfUysK6PfYcK7ARnLuiCI5/X6ejvM/S2qQ=;
 b=B4JeJ+XplSkuE0Wt4adf/diD77QGXs/SJcEVC1goyiJ5cdirJB3UUGEa8zblghnM
 MqBNoQk49SPao+VluEA99M8qalRs9AO/7AEEyQD7tlXE0sq1OSePKjJvGj8pSdISTcY
 XEGQU8BL/JF6PiAZXcczs4ofenVjoFjRP8GBM0Gc=
Received: by mx.zohomail.com with SMTPS id 1736433214563520.0910854084935;
 Thu, 9 Jan 2025 06:33:34 -0800 (PST)
Message-ID: <154187ae-fff1-49f9-9605-b50c5e1fd57e@collabora.com>
Date: Thu, 9 Jan 2025 17:33:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Lock the VGA resources during initialization
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20241211064343.550153-1-vivek.kasireddy@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20241211064343.550153-1-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 12/11/24 09:43, Vivek Kasireddy wrote:
> +static int __init virtio_gpu_driver_init(void)
> +{
> +	struct pci_dev *pdev;
> +	int ret;
> +
> +	pdev = pci_get_device(PCI_VENDOR_ID_REDHAT_QUMRANET,
> +			      PCI_DEVICE_ID_VIRTIO_GPU,
> +			      NULL);
> +	if (!pdev)
> +		return -ENODEV;

I realized that we likely shouldn't assume that virtio-gpu is always on
PCI bus. It could be MMIO device, AFAICT. And then we shouldn't error
out if PCI not found.

-- 
Best regards,
Dmitry
