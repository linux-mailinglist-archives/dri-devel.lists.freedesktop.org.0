Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF48AE9BA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 16:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4649C10ECCE;
	Tue, 23 Apr 2024 14:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OGJU2beL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1235810EABC;
 Tue, 23 Apr 2024 14:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713883393; x=1745419393;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dTsegoRlJSgpiFRsMRtlD4ErrSx14VnQLV83pTPEtqU=;
 b=OGJU2beLsHnTZfnQpTZj6srxq+BQe7HwEEEr5rbQgsgOb2S4lnzZHOzL
 zmSPwXLUIqp1DTrvc890mqYOowJDWLtEjgb0CV8hzlD5xi9aeS3n2kmsg
 2JbaRouvXywMgwZL333tp9cO/eQECh/Sqcs4/NIovH+oKnSlxt4i8bpgV
 weZXaSqPVPggQxjfAtyFdkXSboLhaPANv3BPiEsGfQdm8zhJ9w+cjShRD
 6wFBympRHAYmqZZHSD1341KmuBHM0VPenBVa/j0230KXtrKEUR71CjIgC
 z+mTOVxiTf4M6gHA+2vfaNPFgoY3xBsj288WTcZuP/9ToXCtIpYRW2rD8 w==;
X-CSE-ConnectionGUID: XBiIZjIISoSOWkv21r1FmA==
X-CSE-MsgGUID: 3Erc0TLORDeIiZiK0LfQ6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9392513"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9392513"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 07:43:13 -0700
X-CSE-ConnectionGUID: kI+xrBDwR4Oc9RJz9Q5nQA==
X-CSE-MsgGUID: hPWzubphRxaTTMFkcrqYhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29185746"
Received: from unknown (HELO intel.com) ([10.247.119.84])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 07:43:02 -0700
Date: Tue, 23 Apr 2024 16:42:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, John.C.Harrison@intel.com
Subject: Re: [PATCH v2 2/2] drm/i915: Fix gt reset with GuC submission is
 disabled
Message-ID: <ZifI63mDmzFkLAJQ@ashyti-mobl2.lan>
References: <20240422201951.633-1-nirmoy.das@intel.com>
 <20240422201951.633-2-nirmoy.das@intel.com>
 <ZieAEGnCE88TY0GM@ashyti-mobl2.lan>
 <0df81d37-3cc6-4f60-9111-1f579e51ff18@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0df81d37-3cc6-4f60-9111-1f579e51ff18@linux.intel.com>
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

Hi Nirmoy,

> > > Currently intel_gt_reset() kills the GuC and then resets requested
> > > engines. This is problematic because there is a dedicated CSB FIFO
> > > which only GuC can access and if that FIFO fills up, the hardware
> > > will block on the next context switch until there is space that means
> > > the system is effectively hung. If an engine is reset whilst actively
> > > executing a context, a CSB entry will be sent to say that the context
> > > has gone idle. Thus if reset happens on a very busy system then
> > > killing GuC before killing the engines will lead to deadlock because
> > > of filled up CSB FIFO.
> > is this a fix?
> 
> I went quite far back in the commit logs, and it appears to me that we've
> always been using the current reset flow.
> 
> I believe we don't perform a GT reset immediately after sending a number of
> requests, which is what the current failed test is doing.
> 
> So, I don't think there will be any visible impact on the user with the
> current flow.

Agree... good thinking here... we often abuse on the Fixes tag.

Thanks,
Andi
