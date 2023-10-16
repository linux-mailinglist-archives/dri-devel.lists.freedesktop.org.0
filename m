Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847187CACC7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79A810E1FE;
	Mon, 16 Oct 2023 15:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EA110E1FE;
 Mon, 16 Oct 2023 15:01:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 88B25B8165D;
 Mon, 16 Oct 2023 15:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA23C433C8;
 Mon, 16 Oct 2023 15:01:37 +0000 (UTC)
Date: Mon, 16 Oct 2023 11:03:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1] dynamic_debug: add support for logs destination
Message-ID: <20231016110312.3d18ea82@gandalf.local.home>
In-Reply-To: <ZSfCMBXOOi9Luc6F@phenom.ffwll.local>
References: <20231003155810.6df9de16@gandalf.local.home>
 <CAJfuBxyJyFbFEhRxrtxJ_RazaTODV6Gg64b1aiNEzt6_iE4=Og@mail.gmail.com>
 <CAK8ByeLNc9UbTNG4x=40AxYqjjRCsvBNtNFai0PMveM2X4XCow@mail.gmail.com>
 <CAJfuBxyRF4q_T8LmHwR=-PKKDDpiFg2nO03uLnL8aGpRyBByKw@mail.gmail.com>
 <CAK8ByeLpkSV6o6gPw8eJVqq5+ynQrSDjemY7mXkO1ZmA0rYKfQ@mail.gmail.com>
 <CAJfuBxw+ANLwssAGWpkn5PeJb8ZKn4LXQkk2Gfv3aGsSN=S55Q@mail.gmail.com>
 <CAJfuBxy9qn-4i3SteTL1LBbBxPrFM52KkBd=1UhcKV3S_KdQvw@mail.gmail.com>
 <20231011114816.19d79f43@eldfell>
 <ZSZuACLwt5_XAL2n@phenom.ffwll.local>
 <20231012115548.292fa0bb@eldfell>
 <ZSfCMBXOOi9Luc6F@phenom.ffwll.local>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: =?UTF-8?B?xYF1a2Fzeg==?= Bartosik <lb@semihalf.com>,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Oct 2023 11:53:52 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> > You said that turning the kernel ring buffer contents into strings is a
> > very heavy operation, so it is not possible to push this scope
> > separation to userspace, right?  
> 
> I think it's the kernel that does the formatting, but honestly not sure
> how this works with perf traces. Might be that it's actually userspace
> doing the formatting later on so that it doesn't incur the overhead while
> recording.

perf and trace-cmd do the formatting in user space via libtraceevent:

  git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git

It reads the format files of the events:

  /sys/kernel/tracing/events/*/*/format

and uses that to read the raw data saved from the kernel into human
readable output.

Note, this means that addresses coming from kernel trace events are not
hashed!

-- Steve
