Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB1F2553ED
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 06:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5936E124;
	Fri, 28 Aug 2020 04:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0154.hostedemail.com
 [216.40.44.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B25D6E124
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 04:58:27 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id E8D7F18018051;
 Fri, 28 Aug 2020 04:58:25 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1394:1431:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3871:3874:4250:4321:5007:8526:10004:10400:10848:10967:11232:11658:11914:12297:12740:12760:12895:13069:13255:13311:13357:13439:14181:14659:14721:21080:21627:21972:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: ink23_410c29327073
X-Filterd-Recvd-Size: 1886
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Fri, 28 Aug 2020 04:58:24 +0000 (UTC)
Message-ID: <1fd895d12c756478ebfb92de1252b772b6fd417a.camel@perches.com>
Subject: Re: Printing bitfields in the kernel (Re: [PATCH] drm: Parse
 Colorimetry data block from EDID)
From: Joe Perches <joe@perches.com>
To: Pekka Paalanen <ppaalanen@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Date: Thu, 27 Aug 2020 21:58:22 -0700
In-Reply-To: <20200827103456.57edaf59@eldfell>
References: <20200826142328.131144-1-algea.cao@rock-chips.com>
 <20200827103456.57edaf59@eldfell>
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-08-27 at 10:34 +0300, Pekka Paalanen wrote:
> On Wed, 26 Aug 2020 22:23:28 +0800
> Algea Cao <algea.cao@rock-chips.com> wrote:
> 
> > CEA 861.3 spec adds colorimetry data block for HDMI.
> > Parsing the block to get the colorimetry data from
> > panel.

If flags are int, I could imagine another %p<foo> extension
where %*p<foo> is used like:

	printk("flags: %*p<foo>n", flags, bitstrings)

where flags is:

	BIT(0)
	BIT(1)
	...
	BIT(last)

and

	char *bitstrings[] = {
		"bit 0 description",
		"bit 1 description",
		...
		"last bit description"
	};

Or define YA struct with 2 entries as the struct members
and use that.

struct foo {
	unsigned long flags,
	char ** descriptions,
};

	struct foo bar = {.flags = <flags> .descriptions = bitstrings};

	printk("flags: %p<foo>\n, &bar);


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
