Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95899870E8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 11:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB41C10EB8B;
	Thu, 26 Sep 2024 09:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYy4AKAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28B310EB8B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727344655; x=1758880655;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+304ZXHvaUnXyTVgVP5esYF+bkLgy5z1wxS+r4gYVoQ=;
 b=kYy4AKAh3tbfN8l3MMqab4+g975TOvjr9wpnih/rIyrX485elQWW8h2P
 8ZPNmJuIvtda6jyCL2aeAn5YpAFsXLcb2DEORgEZfQbH8hHwzrwRGfZ9r
 smIU2Rxft1zc6ltVdA6EgB7+4MHwTttXOxccl6K13HbWYPxooArarDb8N
 K67m7PNqA6PWSvUS+Vcb2b2pvfYkth+vjoMIFhEoTL1+vFlySqI+s/q5s
 w43wLnp+eCvMrw9hYMlwOfdpKhDL7+TpLygVzHUghCuGYTSM82lLRXCoj
 AspqFwjH5rZUqqUm9nqmVXJgHe5lpEkUTKq/N3jRhHJTbC4VxnaTXFEd0 w==;
X-CSE-ConnectionGUID: TKDS65vyRFqKrpKYqnCr8Q==
X-CSE-MsgGUID: rJ3YRCvCQjGsJsNI12erTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26583419"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="26583419"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 02:57:33 -0700
X-CSE-ConnectionGUID: M8KP52xNT12Ke2Pmeq4PTw==
X-CSE-MsgGUID: hpF8F7t7RLGTAgVkvztj+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="72232161"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 26 Sep 2024 02:57:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 26 Sep 2024 12:57:29 +0300
Date: Thu, 26 Sep 2024 12:57:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured
 before fb devices appear
Message-ID: <ZvUwCVNPzp1UGY6h@intel.com>
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-2-ville.syrjala@linux.intel.com>
 <92ed9455-b175-46ef-b0c6-7c79e2b78371@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92ed9455-b175-46ef-b0c6-7c79e2b78371@gmx.de>
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

On Thu, Sep 26, 2024 at 08:08:07AM +0200, Helge Deller wrote:
> Hi Ville,
> 
> On 9/23/24 17:57, Ville Syrjala wrote:
> > Currently setting cursor_blink attribute to 0 before any fb
> > devices are around does absolutely nothing. When fb devices appear
> > and fbcon becomes active the cursor starts blinking. Fix the problem
> > by recoding the desired state of the attribute even if no fb devices
> > are present at the time.
> >
> > Also adjust the show() method such that it shows the current
> > state of the attribute even when no fb devices are in use.
> >
> > Note that store_cursor_blink() is still a bit dodgy:
> > - seems to be missing some of the other checks that we do
> >    elsewhere when deciding whether the cursor should be
> >    blinking or not
> > - when set to 0 when the cursor is currently invisible due
> >    to blinking, the cursor will remains invisible. We should
> >    either explicitly make it visible here, or wait until the
> >    full blink cycle has finished.
> 
> are you planning to send follow-up patches to address those shortcomings?

Nope. I don't really care about those as I never plan to 
turn the cursor blinking back on after turning it off via
udev.

-- 
Ville Syrjälä
Intel
