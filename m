Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5497548741A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 09:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7C211AC0A;
	Fri,  7 Jan 2022 08:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0B111AC04;
 Fri,  7 Jan 2022 08:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641544045; x=1673080045;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ioSguM5OtIT9tSottT6wy5ejOE5aBxF+mt5gl3vRQKA=;
 b=d1x5Y2w9/39mIeGsq5vZjX+SVqseIgMnMJcwRoKZUD8WdOePVb1iodgd
 HSXNjEranYC0/2jpFLzwJJg2mtTykWC6XjhJSrtkldIoRobzmAs5ehK2y
 mSHiRDi3MADn56nXeQalUO5sp5dyTJp5zaVcj3wxeElv6yUaIW4gAr4Mo
 KOc39NcqyBkRtQxK3J1fcO36JgDCr8mWNzeSWcWJMi0ihCqGiCn2K5qzo
 U66jLrUt0j+0GVeecjtJnFvgCtHf6ZinYocS5PaHRWUblrqP3RSBKPvnj
 4JxT5IOUzOmMPtAIaM5Qvyu45VDkPAQt7IIYN3xP8drAf8w+fNBVMOQ1D Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="243030374"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="243030374"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 00:27:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="763782559"
Received: from asparren-mobl2.ger.corp.intel.com (HELO [10.249.254.124])
 ([10.249.254.124])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 00:27:23 -0800
Message-ID: <4348e218-cacb-3392-ad4c-529f5a2ef00f@linux.intel.com>
Date: Fri, 7 Jan 2022 09:27:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 4/4] drm/i915/ttm: ensure we unmap when purging
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220106174910.280616-1-matthew.auld@intel.com>
 <20220106174910.280616-4-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220106174910.280616-4-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/6/22 18:49, Matthew Auld wrote:
> Purging can happen during swapping out, or directly invoked with the
> madvise ioctl. In such cases this doesn't involve a ttm move, which
> skips umapping the object.
>
> v2(Thomas):
> - add ttm_truncate helper, and just call into i915_ttm_move_notify() to
>    handle the unmapping step
>
> Fixes: cf3e3e86d779 ("drm/i915: Use ttm mmap handling for ttm bo's.")

Should this Fixes: tag be when we we introduce truncate for the TTM 
backend. IIRC that was in a later commit?

Otherwise

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

/Thomas


