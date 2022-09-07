Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C5C5B0799
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 16:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7194510E786;
	Wed,  7 Sep 2022 14:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFFA10E786;
 Wed,  7 Sep 2022 14:54:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB1936194E;
 Wed,  7 Sep 2022 14:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C091DC433D6;
 Wed,  7 Sep 2022 14:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662562443;
 bh=FnTuP15XLzFNLiYzDllSBtNOTSW5KL/gP6XWVJ3ejpw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ohdn/uVYqN+mXpJ77/NZg/rgPYe7ewGTDztOmZITM6VaNb8GEYm9/cGMFt2/tN2di
 2kYrgbXRjDM1SlGRmyajY20ani3Fxqdl2BpREJzjos+HupAJGq+F8Wr1EvJ9qVLgL3
 /7Cvj2/vodNIOTEG60Q+aoMEXKhAQJBKdzBeDPPs=
Date: Wed, 7 Sep 2022 16:54:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v6 21/57] dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes
Message-ID: <YxiwiO+Ni/CvAO5Q@kroah.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
 <20220904214134.408619-22-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220904214134.408619-22-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 04, 2022 at 03:40:58PM -0600, Jim Cromie wrote:
> Demonstrate use of DECLARE_DYNDBG_CLASSMAP macro, and expose them as
> sysfs-nodes for testing.

Wait, why sysfs?

sysfs isn't for testing, why not use debugfs?


> 
> For each of the 4 class-map-types:
> 
>   - declare a class-map of that type,
>   - declare the enum corresponding to those class-names
>   - share _base across 0..30 range
>   - add a __pr_debug_cls() call for each class-name
>   - declare 2 sysnodes for each class-map
>     for 'p' flag, and future 'T' flag
> 
> These declarations create the following sysfs parameter interface:
> 
>   :#> pwd
>   /sys/module/test_dynamic_debug/parameters
>   :#> ls
>   T_disjoint_bits  T_disjoint_names  T_level_names  T_level_num  do_prints
>   p_disjoint_bits  p_disjoint_names  p_level_names  p_level_num

What is in these files?

For sysfs stuff, you need Documentation/ABI entries so that you can't
abuse sysfs.  With debugfs, you can do anything you want :)

thanks,

greg k-h
