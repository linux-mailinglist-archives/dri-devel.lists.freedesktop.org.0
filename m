Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2037FB81B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B441410E4B4;
	Tue, 28 Nov 2023 10:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DC710E4B4;
 Tue, 28 Nov 2023 10:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701167950; x=1732703950;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MXwHFEX9kq9p9CKpYfhWlu3F+DrEniFzh7s8EukFtrw=;
 b=n2nWOF/S3ZyBOVel8Tnfz0fpND4j+XZjbVnoT78aRiQ3wLLGSas80we4
 buu+cMhV5PXpZj9ul0oSRcw0UBiJSNh1Jc7FUuURtTnY37ktLm2CKs2GD
 tZtUu5sb16QoKPC42nzqCOEqytK93uDkv3RYl5htMaIxX7/WKNrAvWNs+
 V/5mBIiK8/uMtAAk2utGnsBQ749IdpjK2SyDMwZsn5Gt4CSNlpVLj2H9M
 zMK0FHearIaB1/ZwiwIFMEUunamSvWxj9fbDeW5g9ngpR4yAj6O+TNTX4
 1mm68Ca8mH1tFIusiV8uI/Xr5rC+h0dmabtH804TzI5LywwajDXlJdt8o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377923320"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="377923320"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 02:39:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="16898587"
Received: from mravivx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 02:39:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Vignesh Raman
 <vignesh.raman@collabora.com>,  "David E. Box"
 <david.e.box@linux.intel.com>, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI: qcom: Fix compile error
In-Reply-To: <20231128065104.GK3088@thinkpad>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231128042026.130442-1-vignesh.raman@collabora.com>
 <20231128051456.GA3088@thinkpad>
 <50a9f061-e1d3-6aca-b528-56dbb6c729d9@collabora.com>
 <20231128065104.GK3088@thinkpad>
Date: Tue, 28 Nov 2023 12:39:02 +0200
Message-ID: <87a5qy88mx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: daniels@collabora.com, linux-pci@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, helen.koike@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Nov 2023, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> On Tue, Nov 28, 2023 at 11:44:26AM +0530, Vignesh Raman wrote:
>> Hi Mani,
>> 
>> On 28/11/23 10:44, Manivannan Sadhasivam wrote:
>> > On Tue, Nov 28, 2023 at 09:50:26AM +0530, Vignesh Raman wrote:
>> > > Commit a2458d8f618a ("PCI/ASPM: pci_enable_link_state: Add argument
>> > > to acquire bus lock") has added an argument to acquire bus lock
>> > > in pci_enable_link_state, but qcom_pcie_enable_aspm calls it
>> > > without this argument, resulting in below build error.
>> > > 
>> > 
>> > Where do you see this error? That patch is not even merged. Looks like you are
>> > sending the patch against some downstream tree.
>> 
>> I got this error with drm-tip - git://anongit.freedesktop.org/drm-tip
>> 
>> This commit is merged in drm-intel/topic/core-for-CI -
>> https://cgit.freedesktop.org/drm-intel/log/?h=topic/core-for-CI
>> 
>
> Okay. Since this patch is just for CI, please do not CC linux-pci as it causes
> confusion.

Agreed. More on-topic for linux-pci is what happened with [1].

We've been running CI with that for months now to avoid lockdep splats,
and it's obviously in everyone's best interest to get a fix upstream.

David, Bjorn?


BR,
Jani.


[1] https://lore.kernel.org/all/20230321233849.3408339-1-david.e.box@linux.intel.com/




>
> - Mani
>
>> Regards,
>> Vignesh

-- 
Jani Nikula, Intel
