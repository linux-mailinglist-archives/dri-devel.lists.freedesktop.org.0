Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKZaOLmXiGl3rwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 15:03:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF50108DE5
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 15:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AF010E08F;
	Sun,  8 Feb 2026 14:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTbVnctT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F5D10E08F;
 Sun,  8 Feb 2026 14:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770559412; x=1802095412;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cV940Lik96QcjKIDy0bcMBd1EZPtXN52moCKpfFr3Mg=;
 b=MTbVnctTOJmFc1W9GK6YqE1ruBnfrlpt3Sf4Fx50MDApAHKk52ivXDhl
 TEZQr/UeOYc/CICYcU3rDi+io68QnZJHxN8tTxhpIZADAldfWFlnb66oa
 xfymOlXxhsyg7ZEMzqM7RbTP4RrJexpLLeZ6r7YpExWwB7n+UQ0hWGcDy
 ci5QoBP7nZLrjAgqR50xnVok0OF84DEHcrqgwYB85cBZ4Ae2TgVKd0Evy
 jyTGu7J4LKto0KA5J0NA+GNRFZ6Qg8BNczwJ/AneWIT8PElFtiB4fnLyF
 awrjJtcAFkz11dw3fg0yofzJ7Yp0f24U84rtLOacblaU3UtxJ13PnwMqZ Q==;
X-CSE-ConnectionGUID: P1zkiIydRvC95mO5EY2Z6A==
X-CSE-MsgGUID: KFtc7grdTGK9G3izS+Hneg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="75538400"
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; d="scan'208";a="75538400"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 06:03:32 -0800
X-CSE-ConnectionGUID: iB4UQchvTG6wMT0qRLv3Iw==
X-CSE-MsgGUID: hV6ev9T3RyuR+52n17C61A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; d="scan'208";a="234279671"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.100])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 06:03:29 -0800
Date: Sun, 8 Feb 2026 16:03:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm/nouveau/gsp: simplify code with
 acpi_get_local_u64_address()
Message-ID: <aYiXr8f2hO6cU3uj@smile.fi.intel.com>
References: <20260120152049.1763055-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120152049.1763055-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 6AF50108DE5
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 04:20:49PM +0100, Andy Shevchenko wrote:
> Now we have a helper so there's no need to open-code.

Anybody to comment on this?

-- 
With Best Regards,
Andy Shevchenko


