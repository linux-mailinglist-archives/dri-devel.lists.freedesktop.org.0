Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6646C3800
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 18:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6CA10E847;
	Tue, 21 Mar 2023 17:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599AF10E827;
 Tue, 21 Mar 2023 17:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679418960; x=1710954960;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/FkBJNWNhYD2NcqVJ8iNkyIEhSBftkt9bIvW7zOzZ68=;
 b=WlHGrc+rNS4n5sa2PB54dJB1SCVARM7HDJem01mP+lXjw8B1dFjVN5rh
 /6IoE+1EwPuNxXwZ5kbHUTOSMUAw7ww5AlD6AUGJjLSiXHk3v9w68J2ta
 lwG+j/xU4IBEjOk7WPW9grvr8AVm4HNDkep8olGdPdaXwrPMUndyI1cVB
 F/psz/f/n+DsqjDe5I7KuBx0OJQ2aL3xfiEFOH9Id9EkcLcGBYy0TB/zH
 uPtzmXWzA8IHd0XkHKdo78RMx2gRPUnzO//4ZRerzDgtv80XiiXwhkNmz
 WCJifvIwtFmSCIG5wIRhivmjJ1rATHfsviyxe0G+H4OmjOffFal5z/1Hg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="336512490"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="336512490"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 10:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750673539"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="750673539"
Received: from rbirkl-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.70])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 10:15:56 -0700
Date: Tue, 21 Mar 2023 18:15:33 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915: Sanitycheck MMIO access early in driver
 load
Message-ID: <ZBnmNdPMG/Hawmj/@ashyti-mobl2.lan>
References: <20230321170936.478631-1-andi.shyti@linux.intel.com>
 <20230321170936.478631-2-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321170936.478631-2-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>, dri-devel@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> We occasionally see the PCI device in a non-accessible state at the
> point the driver is loaded.  When this happens, all BAR accesses will
> read back as 0xFFFFFFFF.  Rather than reading registers and
> misinterpreting their (invalid) values, let's specifically check for
> 0xFFFFFFFF in a register that cannot have that value to see if the
> device is accessible.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
