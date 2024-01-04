Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5118246B0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 17:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A026110E4CB;
	Thu,  4 Jan 2024 16:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9DC10E4CB
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704387129; x=1735923129;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=UdCcRXEMi569p6+ITr0KHlXsSxx0feyXn0U+aodkq0k=;
 b=LBoa7s14zlBu+Bm9BobbzvbUh5Co/AW7tqWVe7NYu+AEoOz+yxgIdfcn
 ADLnQiSNOzzGyaU9x5Wec5rvGApnyBIeXL1VZvcNpSW46JiJvEncqzf0J
 AT8mJj7IqFUqSnBHFgQVVsrAaFzjKm3Qc6b+7R3EKK6BeO/pwoHjkR0lz
 eiKK3ijnHwQ33O7IqewRuHpurmz4kh7LrSQnLp0QoghGEYZ5FVEHHiWll
 6+HRiVBAQIeH5LLiD+3ncpd0cw/GDv+A3zbtQFlrkt7fS/ng7XACMZ1+z
 HTNr4+oScE5Lb4IBSaIajK/jP4yOGIuXHILlLJ3Mk0RXKiD6YIljAM900 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="382278651"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="382278651"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 08:52:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="814705023"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="814705023"
Received: from pdelarag-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.32])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 08:52:06 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build warning after merge of the drm tree
In-Reply-To: <20240103122734.16b29e09@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240102111222.2db11208@canb.auug.org.au>
 <20240103121911.4ec8f237@canb.auug.org.au>
 <20240103122734.16b29e09@canb.auug.org.au>
Date: Thu, 04 Jan 2024 18:52:03 +0200
Message-ID: <87frzdyrbg.fsf@intel.com>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 03 Jan 2024, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> OK, the only thing I can find is that there are 2 intel_wakeref.h files
> that have different definitions for intel_wakeref_t:
>
> ./drivers/gpu/drm/i915/intel_wakeref.h:typedef unsigned long intel_wakeref_t;
> ./drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h:typedef bool intel_wakeref_t;
>
> and the two compilations above seem to use different include paths, but
> how the single character change causes that is beyond me.

There are a few things going on here, but the gist of it is that
intel_wakeref_t is supposed to be an opaque cookie, and printing its
value does not make sense, especially not when you can't be certain
which printf format should be used for it.

Fix at [1], thanks for the report.

BR,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/20240104164600.783371-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
