Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172E711E8C3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181966EB3D;
	Fri, 13 Dec 2019 16:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0138.hostedemail.com
 [216.40.44.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDC66EB3C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 16:54:41 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 11CEC1800F72A;
 Fri, 13 Dec 2019 16:54:40 +0000 (UTC)
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, rostedt@goodmis.org,
 :::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:541:599:800:960:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1593:1594:1711:1714:1730:1747:1777:1792:2393:2553:2559:2562:3138:3139:3140:3141:3142:3350:3622:3865:3866:3867:3870:3871:3872:3873:5007:6119:6120:6261:6742:7875:7901:7903:9207:10004:10400:10848:10967:11026:11232:11657:11658:11914:12043:12297:12740:12760:12895:13069:13138:13231:13311:13357:13439:14181:14659:14721:21080:21627:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: cent85_b668a39b531d
X-Filterd-Recvd-Size: 1958
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225]) (Authenticated sender: nevets@goodmis.org)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Fri, 13 Dec 2019 16:54:38 +0000 (UTC)
Date: Fri, 13 Dec 2019 11:54:36 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v3] drm: Funnel drm logs to tracepoints
Message-ID: <20191213115436.4e14a8ae@gandalf.local.home>
In-Reply-To: <20191213164652.GB41609@art_vandelay>
References: <20191212203301.142437-1-sean@poorly.run>
 <20191212222050.0bdddc13@rorschach.local.home>
 <20191213164652.GB41609@art_vandelay>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Dec 2019 11:47:03 -0500
Sean Paul <sean@poorly.run> wrote:

> > Why is there a separate trace event for each of these?
> >   
> 
> To make it easier on userspace to enable just a single drm category.
> 

But trace events can easily be filtered. Say you have a field called
category, you could then just set in the trace event filter:

 echo 'category == 1 || category == 5 || (category > 8 && category < 12)' > /sys/kernel/tracing/drm_print/drm_category_log/filter
 echo 1 > /sys/kernel/tracing/drm_print/drm_category_log/enable

-- Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
