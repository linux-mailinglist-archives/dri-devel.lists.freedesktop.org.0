Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0EEA7804E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC8410E61B;
	Tue,  1 Apr 2025 16:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bY21t0uU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC7C10E61B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 16:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743524812; x=1775060812;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EAyuzCs+2aGA6JWNoYg1cV/7AgO8c1Rwc/lh1E8GXvE=;
 b=bY21t0uUDJaEHR3KJlklgPEBqHLY8DoRRVYDfqKe3ByQBpT4ifw2aL54
 OiSboFHZS6CrTf50zlH89tSFIH7wDq3AHoHvNCKMbzS6/L+tStbvGQ+I0
 si3kTfvIA2H+gmAOHW3Dqt5tKAExFqoauheq2n/DNuHaMrRh+juFKajAU
 FlMKcIgY5vabIcBP8+u6q/l8gCCenkUj8xt0ZduETcQ6wighe0u3c6Wpc
 hdNfVkwWbcI63CQVKVPo2eC+lYotN8tZcjkpYH3SNcWXL6iZRgMQrl84+
 Rd8tz2OxoPkhz00dUxBciRpTd8X6NvWBHfgt9E45ZLZHLttp6wmbRNh+5 w==;
X-CSE-ConnectionGUID: 0/Zq26F8ROeEmEtdDRrudw==
X-CSE-MsgGUID: KIKtXB+RRpycblNIk2CGEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55518122"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="55518122"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 09:26:51 -0700
X-CSE-ConnectionGUID: Dgz+hd4dTCWbkQrj6Lu6qQ==
X-CSE-MsgGUID: jUmcCMq5R7adXtl8eFdEPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131633982"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 01 Apr 2025 09:26:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Apr 2025 19:26:46 +0300
Date: Tue, 1 Apr 2025 19:26:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Denis Arefev <arefev@swemel.ru>
Cc: deller@gmx.de, dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, tzimmermann@suse.de
Subject: Re: [PATCH 1/1] fbdev: atyfb: Fix buffer overflow
Message-ID: <Z-wTxsV9C9MzoXl9@intel.com>
References: <e04f012b-cf10-4a84-8fbe-ece1a06f0f66@gmx.de>
 <20250401102330.7759-1-arefev@swemel.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401102330.7759-1-arefev@swemel.ru>
X-Patchwork-Hint: comment
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

On Tue, Apr 01, 2025 at 01:23:30PM +0300, Denis Arefev wrote:
> > It's old, but still runs in some configurations and people
> > still (although probably not on daily bases) use it.
> > Also don't forget about the various old non-x86 hardware machines
> > which often used ATI cards too, and those machines are still
> > supported by Linux as well.
> 
> Hi Helge.
> Thanks for the reply.
> 
>  Ok. Everyone agrees that there is an error (buffer overflow 
> lt_lcd_regs[LCD_MISC_CNTL]).

As I said, that will never happen.

>  Ok. Everyone agrees that this code is still needed.
> 
> Then I propose to fix this error.  :)
> 
> Unfortunately, I can't do everything by the rules, I didn't save
> the chip datasheet. (I didn't think I would ever need it again.). 
> 
> Regards Denis.

-- 
Ville Syrjälä
Intel
