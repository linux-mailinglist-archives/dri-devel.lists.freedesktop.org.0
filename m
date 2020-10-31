Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C362A1722
	for <lists+dri-devel@lfdr.de>; Sat, 31 Oct 2020 12:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C096E17C;
	Sat, 31 Oct 2020 11:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0067.hostedemail.com
 [216.40.44.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059B26E098;
 Sat, 31 Oct 2020 11:52:55 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 7E2E8100E7B42;
 Sat, 31 Oct 2020 11:52:53 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2194:2199:2393:2525:2553:2560:2563:2682:2685:2693:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3000:3022:3138:3139:3140:3141:3142:3352:3622:3865:3866:3870:3871:3872:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:6119:7903:7904:9025:10004:10400:10471:10848:11026:11232:11473:11658:11914:12043:12114:12219:12297:12438:12555:12740:12760:12895:13069:13255:13311:13357:13439:14181:14659:14721:21080:21627:30054:30070:30074:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:75, LUA_SUMMARY:none
X-HE-Tag: hate63_1d141c52729e
X-Filterd-Recvd-Size: 2182
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Sat, 31 Oct 2020 11:52:51 +0000 (UTC)
Message-ID: <0b818156537f354904938f437cbb9dd02e765653.camel@perches.com>
Subject: Re: [Outreachy kernel] [PATCH] drm/amdgpu: use
 DEFINE_DEBUGFS_ATTRIBUTE with debugfs_create_file_unsafe()
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, Deepak R Varma <mh12gx2825@gmail.com>
Date: Sat, 31 Oct 2020 04:52:50 -0700
In-Reply-To: <20201030080316.GA1612206@kroah.com>
References: <20201030032245.GA274478@my--box>
 <20201030071120.GA1493629@kroah.com> <20201030075716.GA6976@my--box>
 <20201030080316.GA1612206@kroah.com>
User-Agent: Evolution 3.38.1-1 
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-10-30 at 09:03 +0100, Greg KH wrote:
> On Fri, Oct 30, 2020 at 01:27:16PM +0530, Deepak R Varma wrote:
> > On Fri, Oct 30, 2020 at 08:11:20AM +0100, Greg KH wrote:
> > > On Fri, Oct 30, 2020 at 08:52:45AM +0530, Deepak R Varma wrote:
> > > > Using DEFINE_DEBUGFS_ATTRIBUTE macro with debugfs_create_file_unsafe()
> > > > function in place of the debugfs_create_file() function will make the
> > > > file operation struct "reset" aware of the file's lifetime. Additional
> > > > details here: https://lists.archive.carbon60.com/linux/kernel/2369498
> > > > 
> > > > Issue reported by Coccinelle script:
> > > > scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
[]
> There is a reason we didn't just do a global search/replace for this in
> the kernel when the new functions were added, so I don't know why
> checkpatch is now saying it must be done.

I think it's not a checkpatch warning here.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
