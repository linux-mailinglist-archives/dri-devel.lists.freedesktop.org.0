Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE06065E7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 18:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0146710E50B;
	Thu, 20 Oct 2022 16:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DF710E50B;
 Thu, 20 Oct 2022 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666283662; x=1697819662;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DLLMFnwSFEBy8g9B/CMrBhtOU/2OuXYFy1O2BMKiD7w=;
 b=QA+giH39VDF+WMGqh7PcR6jy+Wk88HFz4NQDh8dNMX26c4Cp1gU4e5nQ
 YeYFsp2KAyMGNDRylrwgR15LJCzi8TYrpShw9RjBJPx78L1hEw96JooZ+
 rnh1F9AB+ipsPpILcOLO3YTNkLEYvKtlxcCr/Ux1yST8fgtymZktCYRFI
 JIGUA/JwRwVQbW2UtI9HdI/VmWachTlshQbuBp0ez76TEkjqojLCdok4W
 NCl1RbmQxZ1Ef75OfX/hNQ+Vu0xdUGtvMNYvOqd2QIZpGxyBZo3x6CQda
 AgswJQHR8GJF6dBf/aW4LXJI0Waj32YsfS+6/LAeLz0umBytua+ozqSV0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="307863991"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="307863991"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:34:02 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="663154244"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="663154244"
Received: from tcarvalx-mobl.ger.corp.intel.com (HELO [10.252.12.144])
 ([10.252.12.144])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:33:59 -0700
Message-ID: <8fcc8b57-33a5-7dd4-3a45-d18e3b84da62@intel.com>
Date: Thu, 20 Oct 2022 17:33:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v4 15/17] drm/i915/vm_bind: Handle persistent vmas in
 execbuf3
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-16-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221018071630.3831-16-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, jason@jlekstrand.net, andi.shyti@linux.intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
> Handle persistent (VM_BIND) mappings during the request submission
> in the execbuf3 path.
> 
> v2: Ensure requests wait for bindings to complete.
> v3: Remove short term pinning with PIN_VALIDATE flag.
>      Individualize fences before adding to dma_resv obj.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
