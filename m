Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D19D1F6D18
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 20:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215206E1B7;
	Thu, 11 Jun 2020 18:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0007.hostedemail.com
 [216.40.44.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4432F6E1B7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 18:01:45 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id E01D5181D3042;
 Thu, 11 Jun 2020 18:01:43 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3872:3873:3874:4321:4605:5007:6119:7576:7903:8603:10004:10400:10848:11232:11658:11914:12043:12048:12296:12297:12555:12679:12740:12760:12895:13069:13311:13357:13439:14096:14097:14181:14659:14721:21080:21433:21451:21627:21939:30012:30054:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: ant15_2a17d4e26dd5
X-Filterd-Recvd-Size: 2064
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf10.hostedemail.com (Postfix) with ESMTPA;
 Thu, 11 Jun 2020 18:01:41 +0000 (UTC)
Message-ID: <17564b0632ef8ca6a64023fe430d69e861f252f1.camel@perches.com>
Subject: Re: [PATCH] drm/bridge: make array frs_limits static, makes object
 smaller
From: Joe Perches <joe@perches.com>
To: Colin King <colin.king@canonical.com>, Andrzej Hajda
 <a.hajda@samsung.com>,  Neil Armstrong <narmstrong@baylibre.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 11 Jun 2020 11:01:41 -0700
In-Reply-To: <20200611133924.923774-1-colin.king@canonical.com>
References: <20200611133924.923774-1-colin.king@canonical.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-06-11 at 14:39 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array frs_limits on the stack but instead make it
> static. Makes the object code smaller by 123 bytes
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   23456	   5712	     64	  29232	   7230	drivers/gpu/drm/bridge/tc358768.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   23333	   5712	     64	  29109	   71b5	drivers/gpu/drm/bridge/tc358768.o
> 
> (gcc version 9.3.0, amd64)

It's curious that the data size didn't change.

Perhaps you should make sure you do not compile
with allyesconfig when you show these change.

For instance: x86-64 defconfig with this bridge
enabled:

$ size drivers/gpu/drm/bridge/tc358768.o
   text	   data	    bss	    dec	    hex	filename
   9423	    300	      0	   9723	   25fb	drivers/gpu/drm/bridge/tc358768.o


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
