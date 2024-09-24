Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E67984083
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E786A10E11E;
	Tue, 24 Sep 2024 08:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKVgJK9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE82A10E11E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727166610; x=1758702610;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MW8yLfs1M2Ib46K8xqdSxahCJ8UTa1poRKjP8Gxs74k=;
 b=GKVgJK9MCogWh3B8/uvqtXSY2QWtwV4/J+/Tzjaf6NOCzJO9CEmV/Tk5
 ZO7jIyydBkaMQ2lq4JsHqFFfx0xP8MO3AfmQCTRdxyR0cbMVPcm9WkV0d
 /toos8N9wfr72mDufn+kpHwz53zRvq265GsioRrFIwggSv4Ev0PBqRc0r
 MqT5I3Z1MxRGtnfcC+J/SlC43vTj65xpCM3SP+okx4IpaU0DqaY0utubt
 5sow3wAe0WJaTXpN7MbFCgOaXdoo2UrtKTbj7aQHfZ70AWnvUqAK83uTM
 79HhTQ+rLL/2mECp7Xu601tfgwxNy4iiYBotA5Z6+lzqPL/8NyDTSHxPj Q==;
X-CSE-ConnectionGUID: BHQ6M7ekSvywO//TNxR7Xw==
X-CSE-MsgGUID: VrjhRy/4TMO0FmBqFy1UBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26265260"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="26265260"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:30:09 -0700
X-CSE-ConnectionGUID: cUSAg6yYSriVgqBsedIoQw==
X-CSE-MsgGUID: d3EVjTOgSVa70Kg69XtRTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="71484533"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 24 Sep 2024 01:30:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 24 Sep 2024 11:30:05 +0300
Date: Tue, 24 Sep 2024 11:30:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured
 before fb devices appear
Message-ID: <ZvJ4jS0ThljULq2v@intel.com>
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-2-ville.syrjala@linux.intel.com>
 <3e3fac51-ee46-462e-9418-095845b18ccb@gmx.de>
 <ZvHd8VV6MO4kfLcL@intel.com>
 <93c63567-d183-402e-82e0-f64b97b74ba8@gmx.de>
 <a6369def-6076-4a9f-b8d8-ff32385235dc@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6369def-6076-4a9f-b8d8-ff32385235dc@gmx.de>
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

On Tue, Sep 24, 2024 at 10:27:02AM +0200, Helge Deller wrote:
> Ville,
> 
> On 9/23/24 23:50, Helge Deller wrote:
> > I've added your patch series to the fbdev for-next git tree
> > to get some feedback from the autobuilders and testsuites.
> > I had to manually adjust patch #4 and #6 (after applying your v2
> > patches), so maybe you send a v3 of your whole series at some point.
> 
> Your (fixed) patch series was OK. I had to update to latest git head
> from Linus to get it applied.
> 
> I applied the series again, including Thomas Zimmermanns R-b tag, so
> no action needed from your side for now.

Cool. Thanks.

-- 
Ville Syrjälä
Intel
