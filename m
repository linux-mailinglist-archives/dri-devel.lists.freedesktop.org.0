Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3B0606302
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 16:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6BA10F2C5;
	Thu, 20 Oct 2022 14:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB03E10F2C5;
 Thu, 20 Oct 2022 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666276065; x=1697812065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QHy3Ko5XMie94gcwVnlxc1NXfyePOUN4SZHHzdRm/2c=;
 b=fW/FqGS9k1q7Q5s/NGApRTqkbNHPuP0MG5DyQ2x/PXC3WdPDS9ziz1Tc
 qjmqNswX2sCKwDIH04AtOL76vYHbHJ6SeBh2quxAjnTFpWu9Y4x7f6UOE
 UAfZhzi1jW3Lssael2bP8xUQPtaWpe0KCGmCsIRi25HuxhbChtVsLRTYy
 uKbRS9RTRZvOPKXcCGuWosyKToY+GQDOrwsDB7ph5s/Q9ALgRbfk06rim
 HE40ZTBjVPg34X2pvphYabQolYktWVDPmGa8W8/yzV/trJjvSLaOtBbFR
 Jx8V6aVnZ3W2/X7HLdexi4o+3T3R8J774ilQHK57MjY6/sgS4IkjakVYR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="368768088"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="368768088"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 07:27:43 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="958963503"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="958963503"
Received: from brockhau-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.43.208])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 07:27:40 -0700
Date: Thu, 20 Oct 2022 16:27:38 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v4 16/17] drm/i915/vm_bind: userptr dma-resv changes
Message-ID: <Y1Fa2k/Xk4s5V1ip@ashyti-mobl2.lan>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-17-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018071630.3831-17-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niranjana,

[...]

> @@ -307,6 +307,8 @@ struct i915_vma {
>  	struct list_head non_priv_vm_bind_link;
>  	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
>  	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
> +	/*@userptr_invalidated_link: link to the vm->userptr_invalidated_list */

nit: add a space here

Andi
