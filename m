Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3BA6C06E0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 01:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3CC10E079;
	Mon, 20 Mar 2023 00:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA87A10E069;
 Mon, 20 Mar 2023 00:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679272828; x=1710808828;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z9S4Ocujm697uI0QPW3BOPLmiDUKdoGMmd0U0rBRY/4=;
 b=SV9fezbahyM3V3ppHjxxYrT91v8Ln7GVgnU74WGVf22iP5uiFqI9kgnl
 Y7efXXtfwn+bXUV8BDo0G//IWzXnm7TXifDiFQHYk1lP2n6R8MxUgUvnk
 i2l2uL6tX8oRPJZQLG8OoJcJYrrFNyRw9DHnM6aAl60s710OWxMMbPRM2
 NDj8V5dPc+rQIVrym72975IonH727oS8eyk3BxG6aqV47oKFVUyJt5S0y
 w240F0X7r9rePoqQZbGGvG6HPixwzQvWrYVB9nHZpf2d8QUlDTQYxIHE+
 FdK6GZJzeaQj2Ul0sQkI5VUbnJkDLmH/fyNIqB0/IqBY5HE8xqJCE5qBR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="318201712"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="318201712"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 17:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="680886324"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="680886324"
Received: from msbunten-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.251.221.102])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 17:40:25 -0700
Date: Mon, 20 Mar 2023 01:40:00 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [RFC PATCH 2/2] drm/i915/display: Implement fb_mmap callback
 function
Message-ID: <ZBerYMHjihNfIAF5@ashyti-mobl2.lan>
References: <20230316172220.16068-1-nirmoy.das@intel.com>
 <20230316172220.16068-2-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230316172220.16068-2-nirmoy.das@intel.com>
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

On Thu, Mar 16, 2023 at 06:22:20PM +0100, Nirmoy Das wrote:
> If stolen memory allocation fails for fbdev, the driver will
> fallback to system memory. Calculation of smem_start is wrong
> for such framebuffer objs if the platform comes with no gmadr or
> no aperture. Solve this by adding fb_mmap callback which will
> use GTT if aperture is available otherwise will use cpu to access
> the framebuffer.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

with Jani's suggestion:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
