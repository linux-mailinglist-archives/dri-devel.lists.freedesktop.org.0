Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F413898D0A8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 12:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A261010E1D2;
	Wed,  2 Oct 2024 10:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zp5Ntbo6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A418810E1D2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 10:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727863274; x=1759399274;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=MLr1JRAGzF98eS5MD9R/Nc8BcZNzc8wBtqKLH/3u/Aw=;
 b=Zp5Ntbo6U7e0Xw32CE20XMS2Xuo2v7npda9K0yFYDP2VE+4B9Z0qjYCu
 T5Uu07nz1b30tNQqaR7fcEal5iSkMyb+qsFdm3fNL1r5aivXE6m9EZIgm
 T7iU9/wH4fPrEnKmfRmUXsCZkqjGL6sG9wYS/huUm8riPqOAdw1TJ30uw
 hsCiZx1Cl6cOeXzHmlSE4E0ugX1/qWraaYsml7Tb6y16cPXtq8B/eRigP
 /uAEu0dlS8NH8KUqw25Q7e5dOxE9R+TGCR/6BVKC3ebokrS//JemEo7dq
 x3gp5AYGwoFN2m6kX/qlPuj7oMT7hEKMliJ/4hEifpMXXfPdPWP1A1DjJ A==;
X-CSE-ConnectionGUID: +OsYwSplTQ2mQnxZNfviHA==
X-CSE-MsgGUID: AxbWVrTuQa+Y9BDai022kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="49542845"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="49542845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 03:01:14 -0700
X-CSE-ConnectionGUID: +O3JIXVRRnmfejHgnMvfGQ==
X-CSE-MsgGUID: ppdFVU2oQjKi4BotMF3YGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74190312"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.31])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 03:01:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Oct 2024 13:01:05 +0300 (EEST)
To: Pavel Machek <pavel@ucw.cz>
cc: Werner Sembach <wse@tuxedocomputers.com>, 
 Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org, 
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org, 
 lee@kernel.org, linux-input@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, 
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com, 
 cs@tuxedo.de, platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/1] platform/x86/tuxedo: Add virtual LampArray
 for TUXEDO NB04 devices
In-Reply-To: <Zv0YlxQOFVGRS/DB@duo.ucw.cz>
Message-ID: <c2694d50-db7c-84ee-288a-06802e10ca8d@linux.intel.com>
References: <20241001180658.76396-1-wse@tuxedocomputers.com>
 <20241001180658.76396-2-wse@tuxedocomputers.com>
 <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com>
 <Zv0YlxQOFVGRS/DB@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 2 Oct 2024, Pavel Machek wrote:

> Hi!
> 
> > > +static struct wmi_driver tuxedo_nb04_wmi_ab_driver = {
> > > +	.driver = {
> > > +		.name = "tuxedo_nb04_wmi_ab",
> > > +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> > > +	},
> > > +	.id_table = tuxedo_nb04_wmi_ab_device_ids,
> > > +	.probe = probe,
> > > +	.remove = remove,
> > > +	.no_singleton = true,
> > > +};
> > > +
> > > +// We don't know if the WMI API is stable and how unique the GUID is for this ODM. To be on the safe
> > > +// side we therefore only run this driver on tested devices defined by this list.
> > 
> > Please limit comment length to 80 chars and since you need multiple lines 
> > here anyway, use the usual /* */ multiline comment formatting.
> 
> This driver needs to be split into generic part + hw specific part,
> and reasonable kernel/user API needs to be defined for the generic
> part. It is really too soon to tweak comment lengths.

Coding style is not something you add on top of everything after 
everything else is done. It's much better to start with that right from 
the beginning.

-- 
 i.

