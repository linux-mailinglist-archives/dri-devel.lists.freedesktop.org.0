Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D98BF92B9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 01:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D18A10E649;
	Tue, 21 Oct 2025 23:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="joUXckUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9B010E64E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 23:03:31 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-78f30dac856so85003926d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 16:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1761087811; x=1761692611; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t5Bh5O0u2edCj6s7JQTYVPlxSEp6IH0+GcP0uyaYNtA=;
 b=joUXckUBvv8/rYGx1eL07jMCYj/BdbGoq5UFUkRjL9Vs3GcNa7zqoiYOzcdJXxV4/2
 vTJc3Yqwj4+phxg670Fa9Qvr3TNKm8gBagzMF5fjHe5M68YKcPqk/RFbPqT041/Qy5cN
 fUQsbUN1k8e70iMwBv+RD/Z2K4r/ixG+wIIiGjE7VK/A02kZGqvGmTUHyU3LsQ9Sr09R
 6jHAlxxd/Qb+SNzt2cgYfiNw0C/0cFaeNdS+ZnSsmXzSIJZ67ptX0Bhxpv7LD0pCwDMa
 GsP435I+7G8MxfsXXi7dB49HXXp9K9NDh2e9XGQ5om9ahLtxHpScemTF9NiffUvZ6Hi/
 alAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761087811; x=1761692611;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t5Bh5O0u2edCj6s7JQTYVPlxSEp6IH0+GcP0uyaYNtA=;
 b=VI/n+F9E6oLJz3FuFnbaEVMkTg40w7c0P8qIy5F3GkhV2Zq5AgpiaGjKKUqp5zwr4F
 hfz5DN2huKDTFZlPoNs1KQQWDXY7jYCV5sOyGrwx67P98ak56Va0k5h6I/aiNEHcg1Wz
 fVbYy8BPzUjPUXgLfh3T26Aj7834UTXGOt5UPavFymeHaIgFIxnH3nrqiPa37wQEEHbE
 qao4REsxD16mSrG1Vx9yNSXyGMYiL0a7myrlw5xN0NbLDt5EUdOhJnRfRYs+QHGNDJCn
 JSAyrsqaba06tv/dmp5cVcRSICpBJIus84inOiq1odyVPrEmZS3j2KIlX1AWJYMhtJN9
 iviw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdFwcEiIwMY6IqLzC1mMaVgovlxf245BitW/BlYyLd76qwfvT7C+ArIiTo41w21/l607eUs3eeS3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsyyQLnVCP1ZuJ5wU08hxEQfksNZgZNEdoSE0Z14K6d3xZdbMe
 ZV3P2M+1GcDuiXZTzvcYDA+os6q4Yke/w6uZ0yyitMeF3mp+NVU3m03lvyXPFpSWEZI=
X-Gm-Gg: ASbGncuPQteM4f1kR8OcOWq+Xv9ElLNQ9d0dboxaup6veZYDwzJbqXRP+CpAmW/iE7B
 xzrGgoXeBkQ7S3nZiau/TYvqvpi/BS19VTLxX34X8DaGhv0yHFs/CVJ+MsaqDj84CcBz4832v61
 1tvyVYkl0UZxyW0wyD44P1f2DUqcBuktoofe/zie5wNrgmOCAWEYvhnmdlOz+BSRge7G355T5/7
 CgeIFhVR/Pr84Te4UPHGNgSuT9H2AC+NAy6k70qEgl5M5sviYW8nCAs399kao1OvaX9j+OZA+gd
 GpDOOMDpi7LKXAQ4wYUfbuo4+94TAPHufXHtMoqTTk9vs1XhM35i0hvA7M7L/+NVSU9AYzFLxsR
 VfzwpYhP9HepjugGxa4S+NNLS8rUWSMx6F6aXzox06dcPMBw0eg4Pwqa3Ojp5taLjTdf2jqM+Ex
 vXycWAYWmQl4pqlPr1DdnbtgtDVbFmOtFZx1DYab62PSiV5Kh/d/jmd+DY
X-Google-Smtp-Source: AGHT+IF5TEP/imVUZDeqxAFOvJLVSc/DIGvaFM794M9E7hmCaqBWJ7XSxLIfFTPccdLhgqmKXhQMqg==
X-Received: by 2002:a05:6214:1243:b0:87c:1032:e849 with SMTP id
 6a1803df08f44-87c2058e3e5mr236812616d6.30.1761087810447; 
 Tue, 21 Oct 2025 16:03:30 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87d02884878sm76147436d6.31.2025.10.21.16.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 16:03:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vBLO4-00000000NfJ-3RNd;
 Tue, 21 Oct 2025 20:03:28 -0300
Date: Tue, 21 Oct 2025 20:03:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 26/26] vfio/xe: Add vendor-specific vfio_pci driver for
 Intel graphics
Message-ID: <20251021230328.GA21554@ziepe.ca>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-27-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011193847.1836454-27-michal.winiarski@intel.com>
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

On Sat, Oct 11, 2025 at 09:38:47PM +0200, Michał Winiarski wrote:
> +	/*
> +	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't have the capability to
> +	 * selectively block p2p DMA transfers.
> +	 * The device is not processing new workload requests when the VF is stopped, and both
> +	 * memory and MMIO communication channels are transferred to destination (where processing
> +	 * will be resumed).
> +	 */
> +	if ((cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_STOP) ||
> +	    (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P)) {
> +		ret = xe_sriov_vfio_stop(xe_vdev->pf, xe_vdev->vfid);

This comment is not right, RUNNING_P2P means the device can still
receive P2P activity on it's BAR. Eg a GPU will still allow read/write
to its framebuffer.

But it is not initiating any new transactions.

> +static void xe_vfio_pci_migration_init(struct vfio_device *core_vdev)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =
> +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> +	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
> +
> +	if (!xe_sriov_vfio_migration_supported(pdev->physfn))
> +		return;
> +
> +	/* vfid starts from 1 for xe */
> +	xe_vdev->vfid = pci_iov_vf_id(pdev) + 1;
> +	xe_vdev->pf = pdev->physfn;

No, this has to use pci_iov_get_pf_drvdata, and this driver should
never have a naked pf pointer flowing around.

The entire exported interface is wrongly formed:

+bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev);
+int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid);
+int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid);
+int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid);
+int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid);

None of these should be taking in a naked pci_dev, it should all work
on whatever type the drvdata is.

And this gross thing needs to go away too:

> +       if (pdev->is_virtfn && strcmp(pdev->physfn->dev.driver->name, "xe") == 0)
> +               xe_vfio_pci_migration_init(core_vdev);

Jason
