Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EB68385B7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 03:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3754E10E0C9;
	Tue, 23 Jan 2024 02:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06A410E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 02:50:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E9F2FCE214B;
 Tue, 23 Jan 2024 02:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D56BC433C7;
 Tue, 23 Jan 2024 02:50:30 +0000 (UTC)
Date: Mon, 22 Jan 2024 21:52:00 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [BUG] BUG: kernel NULL pointer dereference at ttm_device_init+0xb4
Message-ID: <20240122215200.1ec02a4a@gandalf.local.home>
In-Reply-To: <CAPM=9tyCN1ZhvCTjoKn-Yg5BhnrMae4E5Ci4_u7BZ2vv5gDnKw@mail.gmail.com>
References: <20240122180605.28daf23a@gandalf.local.home>
 <20240122181547.16b029d6@gandalf.local.home>
 <20240122181901.05a3b9ab@gandalf.local.home>
 <CAHk-=whry+-JUDiiCkDkDn2TDg7SA5OvZpPbcQ_jkM_J5=ySdA@mail.gmail.com>
 <27c3d1e9-5933-47a9-9c33-ff8ec13f40d3@amd.com>
 <20240122203552.529eeb20@gandalf.local.home>
 <CAPM=9tyQ22nw4_u366EX=PnROYcWPD7ONRFpPEKxRvTZo0B4zQ@mail.gmail.com>
 <CAPM=9tyCN1ZhvCTjoKn-Yg5BhnrMae4E5Ci4_u7BZ2vv5gDnKw@mail.gmail.com>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, "Bhardwaj,
 Rajneesh" <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Fedor Pchelkin <pchelkin@ispras.ru>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Jan 2024 12:32:39 +1000
Dave Airlie <airlied@gmail.com> wrote:

> On Tue, 23 Jan 2024 at 12:21, Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Tue, 23 Jan 2024 at 12:15, Steven Rostedt <rostedt@goodmis.org> wrote:  
> > >
> > > On Mon, 22 Jan 2024 19:56:08 -0500
> > > "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com> wrote:
> > >  
> > > >
> > > > On 1/22/2024 7:43 PM, Linus Torvalds wrote:  
> > > > > On Mon, 22 Jan 2024 at 15:17, Steven Rostedt<rostedt@goodmis.org>  wrote:  
> > > > >> Perhaps this is the real fix?  
> > > > > If you send a signed-off version, I'll apply it asap.  
> > > >
> > > >
> > > > I think a fix might already be in flight. Please see Linux-Kernel
> > > > Archive: Re: [PATCH] drm/ttm: fix ttm pool initialization for
> > > > no-dma-device drivers (iu.edu)
> > > > <https://lkml.iu.edu/hypermail/linux/kernel/2401.1/06778.html>  
> > >
> > > Please use lore links. They are much easier to follow and use.  
> >
> > https://lore.kernel.org/dri-devel/20240123022015.1288588-1-airlied@gmail.com/T/#u
> >
> > should also fix it, Linus please apply it directly if Steven has a
> > chance to give it a run.  
> 
> I see Linus applied the other one, that's fine too.
> 

They don't look mutually exclusive. I can test the other one as well.

-- Steve
