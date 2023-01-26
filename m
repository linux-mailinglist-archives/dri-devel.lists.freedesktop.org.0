Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5967CC7F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F15F10E8F2;
	Thu, 26 Jan 2023 13:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E399810E8F1;
 Thu, 26 Jan 2023 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674740641; x=1706276641;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=IE9WImV6ttkpscX6WJP7EEbQlQIw2Hf/3vh9FYwkFfI=;
 b=A9pCKTP7B4+TDx3byrf0Da1TCzG82i8x1d0duy30IC0KNXpl45L1bmbQ
 RxrZtWqfbtCx91AJxKz3dixyMRR0Wg1R1RA9GnE/3x+C7iJc8AXq/BFgt
 aqrIkTe5XsWdT2D/Q5aGEkuoN5HD8YpcKsgv0zLQ8+SqxdIXqx6CfoIO0
 rIajX3VbsA5IPg1lFwEKQkXvPpfjnbW/KQILYQyuLChtvamKQ6+nZbYBZ
 AJkIEmjDYKLMJTHgIvxlE5UOo4vPNxJ4j12RfLmWCk9Ubs2kHAhKdp19H
 j0okqILCwGQ1SZ6e2QRq9IUHRsUMH4Dbr7mgYMzqdbLQsceLK7wW18dAA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="307158628"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="307158628"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 05:43:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="612790595"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="612790595"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.157])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 05:43:56 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Subject: Re: Assertion failure in i915 intel_display.c#assert_plane() after
 resume from hibernation
In-Reply-To: <20230124173127.os3rwxnt6m6nloce@nabtop.nabijaczleweli.xyz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <Y89xbXITTRFpjm5B@eldamar.lan> <87bkmo6ivf.fsf@intel.com>
 <20230124173127.os3rwxnt6m6nloce@nabtop.nabijaczleweli.xyz>
Date: Thu, 26 Jan 2023 15:43:53 +0200
Message-ID: <878rhp5s2u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 971068@bugs.debian.org,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Jan 2023, =D0=BD=D0=B0=D0=B1 <nabijaczleweli@nabijaczleweli.xyz>=
 wrote:
> Booted with both, hibernated, resumed; full dmesg below.

Unfortunately, this is probably hitting a regression with drm debug
logging, and we don't get proper debug logging for i915. :(

Please use DRM_USE_DYNAMIC_DEBUG=3Dn with v6.1. I don't know if the proper
fixes have been backported to v6.1 stable kernels.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
