Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8516C06DD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 01:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AE010E050;
	Mon, 20 Mar 2023 00:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4E410E050;
 Mon, 20 Mar 2023 00:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679272730; x=1710808730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k8MlJ5wC5CEGcPxXpNqSMEYG1WOgf+fkWCJ4Oq2iZ3E=;
 b=c/cJ/KrOia1mLIwQWSWxnqFTB9kzWX60kQ14I5WQTmXsrLvF6MLmtC9n
 cEAHJ1nHVW+RNs2zJJkwvQbbv6HYg3QpFE72o/Fok3bbqyBvNZjA9HEfo
 zOwRmG9son17sgWhbfm3PfyBwoN+9bvRlCcJCAJ0cHLJpA+OFRtfXwgrH
 cJFRfMA1pP96IGvdMO0x9IRXev6KH3aOrlnSOeZ0IfMfwYudsYJ95VMpb
 W/SNhZ6McmIEofsFooVuN7YeWFT08w0Un/QJ1glGaX/cbUCOBzftp2pSt
 IL6CnY9viHEYmh5o7WivixCgzaBMwkdl8+JG6q4W3e+X32fU9Db2M6Em9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="424825389"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="424825389"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 17:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="674164997"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="674164997"
Received: from msbunten-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.251.221.102])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 17:38:46 -0700
Date: Mon, 20 Mar 2023 01:38:21 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [RFC PATCH 1/2] drm/i915: Add a function to mmap framebuffer obj
Message-ID: <ZBeq/bqrpeuUMkp0@ashyti-mobl2.lan>
References: <20230316172220.16068-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230316172220.16068-1-nirmoy.das@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Thu, Mar 16, 2023 at 06:22:19PM +0100, Nirmoy Das wrote:
> Implement i915_gem_fb_mmap() to enable fb_ops.fb_mmap()
> callback for i915's framebuffer objects.
> 
> v2: add a comment why i915_gem_object_get() needed(Andi).
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

I think you can fire the PATCH here instead of the RFC. Looks
good to me.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
