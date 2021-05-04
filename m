Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E546372A1B
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 14:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821E66EACE;
	Tue,  4 May 2021 12:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rhlx01.hs-esslingen.de (rhlx01.hs-esslingen.de [129.143.116.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23F56EACE;
 Tue,  4 May 2021 12:32:40 +0000 (UTC)
Received: by rhlx01.hs-esslingen.de (Postfix, from userid 1203)
 id 697B929FE16F; Tue,  4 May 2021 14:32:37 +0200 (CEST)
Date: Tue, 4 May 2021 14:32:37 +0200
From: Adrian Reber <adrian@lisas.de>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [RFC] CRIU support for ROCm
Message-ID: <YJE+5c7p+78rhVau@lisas.de>
References: <9245171d-ecc9-1bdf-3ecd-cf776dc17855@amd.com>
 <YI2J97Rg4+1+KVNs@lisas.de>
 <f8495cad-a532-91d0-a803-035d3da6d8d9@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8495cad-a532-91d0-a803-035d3da6d8d9@amd.com>
X-Url: <http://lisas.de/~adrian/>
X-Operating-System: Linux (5.10.10-200.fc33.x86_64)
X-Load-Average: 8.36 8.07 8.62
X-Unexpected: The Spanish Inquisition
X-GnuPG-Key: gpg --recv-keys D3C4906A
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
Cc: Alexander Mihalicyn <alexander@mihalicyn.com>,
 Pavel Emelyanov <ovzxemul@gmail.com>, Pavel Tikhomirov <snorcht@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Bhardwaj,
 Rajneesh" <Rajneesh.Bhardwaj@amd.com>, criu@openvz.org, "Yat Sin,
 David" <David.YatSin@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 03, 2021 at 02:21:53PM -0400, Felix Kuehling wrote:
> Am 2021-05-01 um 1:03 p.m. schrieb Adrian Reber:
> > On Fri, Apr 30, 2021 at 09:57:45PM -0400, Felix Kuehling wrote:
> >> We have been working on a prototype supporting CRIU (Checkpoint/Restore
> >> In Userspace) for accelerated compute applications running on AMD GPUs
> >> using ROCm (Radeon Open Compute Platform). We're happy to finally share
> >> this work publicly to solicit feedback and advice. The end-goal is to
> >> get this work included upstream in Linux and CRIU. A short whitepaper
> >> describing our design and intention can be found on Github:
> >> https://github.com/RadeonOpenCompute/criu/tree/criu-dev/test/others/ext-kfd/README.md
> >>
> >> We have RFC patch series for the kernel (based on Alex Deucher's
> >> amd-staging-drm-next branch) and for CRIU including a new plugin and a
> >> few core CRIU changes. I will send those to the respective mailing lists
> >> separately in a minute. They can also be found on Github.
> >>
> >>     CRIU+plugin: https://github.com/RadeonOpenCompute/criu/commits/criu-dev
> >>     Kernel (KFD):
> >>     https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/commits/fxkamd/criu-wip
> >>
> >> At this point this is very much a work in progress and not ready for
> >> upstream inclusion. There are still several missing features, known
> >> issues, and open questions that we would like to start addressing with
> >> your feedback.
> >>
> >> What's working and tested at this point:
> >>
> >>   * Checkpoint and restore accelerated machine learning apps: PyTorch
> >>     running Bert on systems with 1 or 2 GPUs (MI50 or MI100), 100%
> >>     unmodified user mode stack
> >>   * Checkpoint on one system, restore on a different system
> >>   * Checkpoint on one GPU, restore on a different GPU
> > This is very impressive. As far as I know this is the first larger
> > plugin written for CRIU and publicly published. It is also the first GPU
> > supported and people have been asking this for many years. It is in fact
> > the first hardware device supported through a plugin.
> >
> >> Major Known issues:
> >>
> >>   * The KFD ioctl API is not final: Needs a complete redesign to allow
> >>     future extension without breaking the ABI
> >>   * Very slow: Need to implement DMA to dump VRAM contents
> >>
> >> Missing or incomplete features:
> >>
> >>   * Support for the new KFD SVM API
> >>   * Check device topology during restore
> >>   * Checkpoint and restore multiple processes
> >>   * Support for applications using Mesa for video decode/encode
> >>   * Testing with more different GPUs and workloads
> >>
> >> Big Open questions:
> >>
> >>   * What's the preferred way to publish our CRIU plugin? In-tree or
> >>     out-of-tree?
> > I would do it in-tree.
> >
> >>   * What's the preferred way to distribute our CRIU plugin? Source?
> >>     Binary .so? Whole CRIU? Just in-box support?
> > As you are planing to publish the source I would make it part of the
> > CRIU repository and this way it will find its way to the packages in the
> > different distributions.
> 
> Thanks. These are the answers I was hoping for.
> 
> 
> >
> > Does the plugin require any additional dependencies? If there is no
> > additional dependency to a library the plugin can be easily be part of
> > the existing packages.
> 
> The DMA solution we're considering for saving VRAM contents would add a
> dependency on libdrm and libdrm-amdgpu.

For the CRIU packages I am maintaining I would probably put the plugin
in a sub-package so that not all users of the CRIU package have to
install the mentioned libraries.

> >>   * If our plugin can be upstreamed in the CRIU tree, what would be the
> >>     right directory?
> > I would just put it into criu/plugins/
> 
> Sounds good.
> 
> >
> > It would also be good to have your patchset submitted as a PR on github
> > to have our normal CI test coverage of the changes.
> 
> We'll probably have to recreate our repository to start as a fork of the
> upstream CRIU repository, so that we can easily send pull-requests.
> We're not going to be ready for upstreaming for a few more months,
> probably. Do you want to get occasionaly pull requests anyway, just to
> run CI on our work-in-progress code?

If you run it early through our CI it might make it easier for you to
see what it might break. Also, if your patches include fixes which are
not directly related to your plugin, it might make sense to submit those
patches earlier to reduce the size of the final patch. But this is up to
you.

		Adrian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
