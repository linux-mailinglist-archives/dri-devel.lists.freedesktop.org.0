Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B60F9E565C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE98310EE44;
	Thu,  5 Dec 2024 13:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gUUBtWRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C20410EE61;
 Thu,  5 Dec 2024 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733404632; x=1764940632;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2kQkwr6i8WcbJ20yWLBxNYmNESKYxSeNNTDqrC4LG/g=;
 b=gUUBtWRGNBGivemQ633ia5rYXpnSZUk66KcYRhs5u7RJGneGqYOxeC+2
 Xmc933/nhCqDCoaSDFl0GoR39xAsr2CAKG8pmi0wagYLSmgSvwGezFM86
 5U2WgJNrIPKoAF7OJ6ZOENMTg5kBThn0DHiC/Nl3vXKTJR1Xrrfunyjww
 DjykNBK1gdi0ati1fmN3tk+DMeUgxaHv8FbDMPGVhNml2oJukZSp967GX
 y/JsffnkqrjccfEvOZgzUCqTeU/4vg6FRRwWXtvX01Rez12PSRge7ehyX
 rB/u29pry1Z9QVRbZ4rR7y89ssSSsIeyoQOrH/8DMu6HZNQq90gyN3Dx0 Q==;
X-CSE-ConnectionGUID: AdAVlCtnRz6IRf7XrZYtKg==
X-CSE-MsgGUID: 6NT1h152RBajHk3WJJ1SUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33775220"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33775220"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 05:17:12 -0800
X-CSE-ConnectionGUID: NYrdKQlnQPOgcnU8V4qYgA==
X-CSE-MsgGUID: wVhWn3xvRr+ANqemJojoHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="99172470"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.41])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 05:17:10 -0800
Date: Thu, 5 Dec 2024 14:17:06 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/i915/display: use drm_print_hex_dump() for
 buffer mismatch dumps
Message-ID: <Z1Gn0r5k7lTEmO8B@ashyti-mobl2.lan>
References: <cover.1733392101.git.jani.nikula@intel.com>
 <a536050b5f9dc2d7de32d29766c98477f58d746c.1733392101.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a536050b5f9dc2d7de32d29766c98477f58d746c.1733392101.git.jani.nikula@intel.com>
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

Hi Jani,

On Thu, Dec 05, 2024 at 11:49:35AM +0200, Jani Nikula wrote:
> Use the drm_printer based printer to get the device specific printing of
> the hex dump, and avoid the manual loglevel hacking.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
