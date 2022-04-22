Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C572850C0BB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 22:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A35E10E30B;
	Fri, 22 Apr 2022 20:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E3C10E30B;
 Fri, 22 Apr 2022 20:44:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2727B8325C;
 Fri, 22 Apr 2022 20:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD2DC385A0;
 Fri, 22 Apr 2022 20:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650660247;
 bh=HnbkQVOtfa7+/56LQ5INga98V0wHs2i7oJ/vI85Yrbo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ncbmxN3DmsIJneYRy5/ENYjoC5IpODUGNtoqIcYvp/kNhyNvjtlhNgLsf6F+yjb1g
 jVstrDggPk3uYKOKKFux0FNjQg3bs96RfiXaseCMLwErKmAc8oBTYrAdPRplYUgsCr
 QYNI4YeEOzSnE32G+XYQ8zz4EfY8tkrhGUEPj68EpOas+hjCUvS65aUIip7ajutCsd
 +gdiDnVGG5UwdRzvLF6aiIWhUeiNmoIpEkflQamA1hjzkDrTzh8s4lIvT10OyyMXKF
 AaV6d/p07sO4C8+ML8hhojkVpFX7fBRXEmpsgecLOiAB2R/yWEnqoAlV1bTEkyIF0K
 ZJXv69B6gizkw==
Date: Fri, 22 Apr 2022 13:44:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH 0/1] add support for enum module parameters
Message-ID: <20220422134405.7a519a0f@kernel.org>
In-Reply-To: <87sfq8qqus.fsf@tynnyri.adurom.net>
References: <20220414123033.654198-1-jani.nikula@intel.com>
 <YlgfXxjefuxiXjtC@kroah.com> <87a6cneoco.fsf@intel.com>
 <87sfq8qqus.fsf@tynnyri.adurom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-wireless@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Apr 2022 08:13:47 +0300 Kalle Valo wrote:
> Wireless drivers would also desperately need to pass device specific
> parameters at (or before) probe time. And not only debug parameters but
> also configuration parameters, for example firmware memory allocations
> schemes (optimise for features vs number of clients etc) and whatnot.
> 
> Any ideas how to implement that? Is there any prior work for anything
> like this? This is pretty hard limiting usability of upstream wireless
> drivers and I really want to find a proper solution.

In netdev we have devlink which is used for all sort of device
configuration. devlink-resource sounds like what you need,
but it'd have to be extended to support configuration which requires
reload/re-probe. Currently only devlink-params support that but params
were a mistake so don't use that.
