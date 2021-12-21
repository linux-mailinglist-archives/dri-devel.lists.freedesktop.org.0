Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0447BEF4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 12:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C435F10E19A;
	Tue, 21 Dec 2021 11:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F0D10E19A;
 Tue, 21 Dec 2021 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640086326; x=1671622326;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MIq9Hejz/P7WPFlTdDbbDEF1Mbos1v2XRBK+Ewj7Zqs=;
 b=LIEzn3wijbbyFrgJBFZje12b3wkRfLhiC7HUyHDfa2IuNBBynAgXUmGp
 gUpih+t/OrGOmDEmGgTkuPuKtT4eOKo6SeC8K0Gaf8xSFTCwBrcmj3LsI
 2NxVF5tIWw4d8Mwbh5gLfLPGCkBMz/YEXlUT/fsOy7LxVgyJRHFsiShup
 XXjNo2O89i33Hn0BMycaMpQkVSVrPPhoaBo4/GEpx1hFF9asKhkLC9R6Y
 UfRwAtgCpmisY7+Q/BXVLq7ZVay0crjlTnj1qwS2Vgg3ypxw6yxQTwTQS
 DLBmoSL2TxkEWO6y9uICQZtM5+kBkkUz6s/yCjD0k3CUaLhFrfKjWYuV8 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="227669925"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="227669925"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 03:32:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="607034175"
Received: from pjordan-mobl.ger.corp.intel.com (HELO [10.252.23.37])
 ([10.252.23.37])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 03:32:03 -0800
Message-ID: <54bc8c38-f5f0-961c-b9a8-d7272389e479@intel.com>
Date: Tue, 21 Dec 2021 11:32:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 3/7] drm/i915: Require the vm mutex for i915_vma_bind()
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211217145228.10987-1-thomas.hellstrom@linux.intel.com>
 <20211217145228.10987-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211217145228.10987-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 17/12/2021 14:52, Thomas Hellström wrote:
> Protect updates of struct i915_vma flags and async binding / unbinding
> with the vm::mutex. This means that i915_vma_bind() needs to assert
> vm::mutex held. In order to make that possible drop the caching of
> kmap_atomic() maps around i915_vma_bind().
> 
> An alternative would be to use kmap_local() but since we block cpu
> unplugging during sleeps inside kmap_local() sections this may have
> unwanted side-effects. Particularly since we might wait for gpu while
> holding the vm mutex.
> 
> This change may theoretically increase execbuf cpu-usage on snb, but
> at least on non-highmem systems that increase should be very small.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

