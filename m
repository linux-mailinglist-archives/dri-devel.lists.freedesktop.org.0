Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5D523227
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0852110E4E3;
	Wed, 11 May 2022 11:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C6510E474;
 Wed, 11 May 2022 11:50:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EC6BB8220B;
 Wed, 11 May 2022 11:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1ADFC340F2;
 Wed, 11 May 2022 11:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652269854;
 bh=pbTu1SyOmaMoBMug74Cs/J6drhmgKaLsBjPev0VWet4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hBQw3J6kbqcWvUQHyx2hh13xUfDwIP/58AdyOtmKRjAbatz5H5HWDlte3eZbI1kV3
 vAkAh+j58tYbQAuZlSL2K8wUwXA8YtbdjA2VH82YJAGEcyRsvsyfKPFJndRgVUbSJv
 VWVqZwYwaq7f4RArduroU+JVpeAGfc+GOJmKUSIA=
Date: Wed, 11 May 2022 13:50:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
Message-ID: <YnujG0nkF0U6d5kd@kroah.com>
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <YntWQIXSqMCd6TYV@kroah.com>
 <1255a66a-121d-988a-19a7-316f703cb37d@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1255a66a-121d-988a-19a7-316f703cb37d@mailbox.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonathan Corbet <corbet@lwn.net>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 12:26:05PM +0200, Michel Dänzer wrote:
> On 2022-05-11 08:22, Greg Kroah-Hartman wrote:
> > On Wed, May 11, 2022 at 03:06:47PM +1000, Dave Airlie wrote:
> >>> And use it to store expectations about what the drm/msm driver is
> >>> supposed to pass in the IGT test suite.
> >>
> >> I wanted to loop in Linus/Greg to see if there are any issues raised
> >> by adding CI results file to the tree in their minds, or if any other
> >> subsystem has done this already, and it's all fine.
> > 
> > Why does the results need to be added to the tree?  Shouldn't they be
> > either "all is good" or "constantly changing and a constant churn"?
> > 
> >> I think this is a good thing after our Mesa experience, but Mesa has a
> >> lot tighter integration here, so I want to get some more opinions
> >> outside the group.
> > 
> > For systems that have "tight integration" this might make sense as proof
> > that all is working for a specific commit, but I can't see how this will
> > help the kernel out much.
> > 
> > What are you going to do with these results being checked in all the
> > time?
> 
> Having the expected results in the tree keeps them consistent with the driver code itself, and allows putting in place gating CI to prevent merging driver changes which make any of the tests deviate from the expected result.

Shouldn't "expected result" always be "pass"?

If not, then the test should be changed to be "skipped" like we have
today in the kselftest tests.

And how about tieing this into the kselftest process as well, why would
this be somehow separate from the rest of the kernel tests?

> Keeping them separate inevitably results in divergence between the driver code and the expected test results, which would result in spurious failures of such CI.

Again, "pass" should be the expected results :)

> I expect the main complication for the kernel will be due to driver changes merged via different trees, e.g. for cross-subsystem reworks. Since those will not go through the same CI, they may accidentally introduce inconsistencies. The ideal solution for this IMO would be centralizing CI such that the same gating tests have to pass regardless of how the code is merged. But there's likely quite a long way to go until we get there. :)

We have in-kernel tests for the rest of the kernel, why can't you put
your testing stuff into there as well?

thanks,

greg k-h
