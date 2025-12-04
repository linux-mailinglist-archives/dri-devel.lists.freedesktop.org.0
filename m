Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B85CA2E4D
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E9010E8E2;
	Thu,  4 Dec 2025 09:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IulQGxFN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FC010E1AA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 01:33:31 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-297f35be2ffso6190775ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 17:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764812011; x=1765416811; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1OLjEC1FU02v8o2+aL765z3ax4u9Wn8i4cyPIqv2NWg=;
 b=IulQGxFNLewIZPNUCIJOqYRCUPt6HxFkmsC+QAULX8ynicPfB7BvHWy1eSJtjzKJpa
 cQbE1pwCr5eYroGzUO2Sj8HpSgCOTu01QzR8kXevsXes5+evAgLiYIhTIeFe2DdtEm9g
 4zfS9nyzozf0cD0n1Tu+/MfEO1xFCG9A7SRA4SEfmGGoo/9wbarly8p6JU8S7FOK423h
 UFpqlrtTx1CC5h5MIlzWyu0jQcNIHbdalkoo6TU5siOwbWQmUxTmEJAvFyAw8ulwUlOA
 jeIgmvUsTAFWqHGj6Zm/jKR6AVB8Ki8QDSz+2HspV9Vruao00PSJjsgBRMc4SnrUf422
 BBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764812011; x=1765416811;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1OLjEC1FU02v8o2+aL765z3ax4u9Wn8i4cyPIqv2NWg=;
 b=lNXErktXzAk3qOg7Rb+BsaSMqeRmwrRBCnNW6g0YVZbGuYqsgG3hqbqKVovVcjhYCc
 1H6NtWsIwK8k3Gp7RLJ2Fq0e7DQqDElOUoV5Sk0XCmGf2Ix1jtE+ckXYvLbE5I1pzgd2
 toab3VsYUCpry5DvIs8qEpGQ/N03pTtt9kvCk+GAH4N8ZqT03dWEX5iw3NzqcukreDjF
 twgBqgAUcGSBlgaFdy8cNnShy89uOxQXkYGiKz496mBvR4bdJC3JxNbgZMJFFmS4874I
 PbrcX0SbTR3n2JhbWMYmSqm0cdz07aXk+VpmwR2EpWE/CDgtVSUXGXx9FM6vE/d+s/SH
 q/qA==
X-Gm-Message-State: AOJu0Yye8clUWfB+gYc7ojnRtYssx6KRNVCNo/se1O2Y8EU2KMvIaFb9
 LLBw/d0hJZOCCbNPvg0XUoWHrpW+ojrA0ckxQyaVDCk31RN9qABZ8+Ez
X-Gm-Gg: ASbGnct9SdleAKgizQdv2zZtDBV3f3haegdPITH2WdKx9EApKyeaihRB1+YEz3kJ6R5
 4Fp5GTJTnt33pNkTnW+Rkhox17xz6VEVM6tNBvUDHr0V5YmwZstyH/KpB1ho1s/+KE9eieF4THa
 AgErf+cymxnHgX8N0I9fcUYokDmSO44zGNzOUOjQlOSnHgkwrrcfIt0ns+bTshmBvsh95Ai+UMd
 IEIXlrxlEFek/43BdsGEtkCR3ZGu5XAaUI2KU/h4TcJO5T7Ci6s3H9ieSOy0bfL0TQ1j+nZnk9y
 172/9oa1ybdldmhr2zQGZaTluo1ZsC5cx8wEk4u6v7VGDlZO9w00Iibu43nFt1TGvWQoZrPbMYJ
 TlMuJWR0hOCPf3sqVNWn7JW0GOZkE/0kfbX3RkCjhGpQuIHZEC6/tz5WcnW6ry9PUc6NiahNMAy
 2vXPr5Tz6jhRTbM33JtNeINkKucGMSel5j/C8lMKzvh1rrpQ==
X-Google-Smtp-Source: AGHT+IE8Rvg94sCmcdZ3rOlKWQaPxgdUe5bYjXp+akgFFnSeqWM9ehkwCxofj9csZW166RntHbw50g==
X-Received: by 2002:a17:903:19e4:b0:295:8c80:fb94 with SMTP id
 d9443c01a7336-29d683e1cacmr50148045ad.59.1764812010639; 
 Wed, 03 Dec 2025 17:33:30 -0800 (PST)
Received: from ?IPV6:2601:1c0:5102:8330:1273:9a5a:e6fa:1903?
 ([2601:1c0:5102:8330:1273:9a5a:e6fa:1903])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae4cf98bsm1860585ad.36.2025.12.03.17.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 17:33:30 -0800 (PST)
Message-ID: <d37d6ca4-9b95-44ab-9147-5c0dff4bedc9@gmail.com>
Date: Wed, 3 Dec 2025 17:33:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Alex Williamson <alex@shazbot.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>,
 Christoph Hellwig <hch@infradead.org>
References: <20251127093934.1462188-1-michal.winiarski@intel.com>
 <20251127093934.1462188-5-michal.winiarski@intel.com>
Content-Language: en-US
From: Angela <angelagbtt1@gmail.com>
In-Reply-To: <20251127093934.1462188-5-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Dec 2025 09:04:28 +0000
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

On 11/27/25 01:39, Michał Winiarski wrote:
[snip]
> +static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!pdev->is_virtfn)
> +		return;
> +
> +	/*
> +	 * VF FLR requires additional processing done by PF driver.
> +	 * The processing is done after FLR is already finished from PCIe
> +	 * perspective.
> +	 * In order to avoid a scenario where VF is used while PF processing
> +	 * is still in progress, additional synchronization point is needed.
> +	 */
> +	ret = xe_sriov_vfio_wait_flr_done(xe_vdev->xe, xe_vdev->vfid);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to wait for FLR: %d\n", ret);
> +
> +	if (!xe_vdev->vfid)
> +		return;
> +
> +	/*
> +	 * As the higher VFIO layers are holding locks across reset and using
> +	 * those same locks with the mm_lock we need to prevent ABBA deadlock
> +	 * with the state_mutex and mm_lock.
> +	 * In case the state_mutex was taken already we defer the cleanup work
> +	 * to the unlock flow of the other running context.
> +	 */
> +	spin_lock(&xe_vdev->reset_lock);
> +	xe_vdev->deferred_reset = true;
> +	if (!mutex_trylock(&xe_vdev->state_mutex)) {
> +		spin_unlock(&xe_vdev->reset_lock);
> +		return;
> +	}
> +	spin_unlock(&xe_vdev->reset_lock);
> +	xe_vfio_pci_state_mutex_unlock(xe_vdev);
> +
> +	xe_vfio_pci_reset(xe_vdev);
> +}
[snip]

My first KVM review :)

I think xe_vfio_pci_reset(xe_vdev) need be protected by state_mutex. So,
we should move xe_vfio_pci_state_mutex_unlock(xe_vdev) after
xe_vfio_pci_reset(xe_vdev). Thoughts?

Thanks,
Angela
