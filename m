Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4246D68D5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D55B10E002;
	Tue,  4 Apr 2023 16:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E447A10E002;
 Tue,  4 Apr 2023 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680625799; x=1712161799;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ad2yLR2QGHM1zH+wT1W70rZoVZagkqBkiUabciymSJQ=;
 b=XE+oN4eSAkek9k3mdiHgbbbfhKXhb7qnOZ3XLl8GvcPT/c3IzjkWqO1L
 ekDGBnk4neV4XBYfNk7p27RR2mWXdTxQN9Je82lTLCGGTrZMm0GmFhPqp
 EcXHqN0mh/yr6WDZrr5+p3mo44gzhUOCdP1CE8Td4LbtmLgJYjzsRsw5a
 170I0nZVx8WPaKXQYTC4xKuFbFK+EoMVxmBhRCnkkqTTj/VmBSj/G8bBE
 ZZr8xONvWAjYBQkibBBKDLk13tZYl49LuJ/vV6dhIrTeh4zueSU65Z5M0
 Ga91ngBRg3WuKPTXQgI0WIRDsJVMx7uen+kuRL98umoFkS+4x8hDRO9vu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428523954"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="428523954"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 09:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="775709901"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="775709901"
Received: from vferra-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 09:29:54 -0700
Date: Tue, 4 Apr 2023 18:29:26 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v2] drm/i915/gt: Hold a wakeref for the active VM
Message-ID: <ZCxQZgU3U3vkcMnj@ashyti-mobl2.lan>
References: <20230330-hold_wakeref_for_active_vm-v2-1-724d201499c2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330-hold_wakeref_for_active_vm-v2-1-724d201499c2@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 31, 2023 at 04:16:36PM +0200, Andrzej Hajda wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> There may be a disconnect between the GT used by the engine and the GT
> used for the VM, requiring us to hold a wakeref on both while the GPU is
> active with this request.
> 
> v2: added explanation to __queue_and_release_pm
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> [ahajda: removed not-yet-upstremed wakeref tracking bits]
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thank you Tvrtko and Chris for answering my questions,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
