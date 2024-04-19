Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA7A8AB192
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 17:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0BD10E0A5;
	Fri, 19 Apr 2024 15:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="xjCz/GSk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GMFja7Ny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3444D10E0A5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 15:18:38 +0000 (UTC)
Date: Fri, 19 Apr 2024 17:18:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1713539916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1u6M1I7hfUyhQBN/cwpO9ocGTQ1Qy4P5YzpeMaFhQk=;
 b=xjCz/GSkAs50I+QI7DCxQjyQohYIKc6gfvXM/lOOMOQ9u4NDYv4qdY0z6mGx+hROJgFmKZ
 9zWABT+BP9mqJwBa9/4yjtYDKpgRik0Cv9GA8jRsyhvXHu/MKWDm8b66esCWPBv2iLgmtT
 +ClBiXzbUFG/aZE+faPmaO96/IJ0GxLADiEcabH9wroL7jIYAF5/fsnkaYTATpoXx5G1gu
 UgVOwkWp2/Iqt4SGIo5q/Y+khYcmWoOpDBOZm1LsGnQBxF6IWpUDLvaO9NHxL5ECZ/Fox7
 Yx5FU8Trbb/wjAuloMMQjlBMJpWky5bQgDrrxWHMEZ7QpqqDNeF6CkxOGonjOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1713539916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1u6M1I7hfUyhQBN/cwpO9ocGTQ1Qy4P5YzpeMaFhQk=;
 b=GMFja7NyiVFhz0KcOQninz2/TkAOL/1k/FUec7DzdPA2AaqJJSnOAQ/5sXQ/BziLmr/ddB
 rUE1t7yBUbab7YDw==
From: Nam Cao <namcao@linutronix.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 jayalk@intworks.biz, Daniel Vetter <daniel@ffwll.ch>, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tiwai@suse.de, bigeasy@linutronix.de, LKML <linux-kernel@vger.kernel.org>,
 Vegard Nossum <vegard.nossum@oracle.com>, George Kennedy
 <george.kennedy@oracle.com>, Darren Kenny <darren.kenny@oracle.com>,
 chuansheng.liu@intel.com
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
Message-ID: <20240419171835.5f31e32d@namcao>
In-Reply-To: <CAMeQTsaGXv6hUmXg3ROLb83JZEAfoSuQGCQgz0wG38Me8UtQYA@mail.gmail.com>
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <CAMeQTsbCESSTrEyHgqF9HreSuzQ9kMBnGpKLT0QNJ+n4hv9qOw@mail.gmail.com>
 <20240418160526.3b3c385f@namcao>
 <CAMeQTsaGXv6hUmXg3ROLb83JZEAfoSuQGCQgz0wG38Me8UtQYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-04-18 Patrik Jakobsson wrote:
> On Thu, Apr 18, 2024 at 4:05=E2=80=AFPM Nam Cao <namcao@linutronix.de> wr=
ote:
> >
> > On 2024-04-18 Patrik Jakobsson wrote: =20
> > > This sounds similar to the SUSE bug [1]. We fixed it by reverting [2]
> > > in the SUSE kernel. The problem seems to be that flush_delayed_work()
> > > kills the timer and re-queues the work but doesn't guarantee that it
> > > is finished when returning. So when the device is closed, the
> > > fb_deferred_io_work() function can still be queued and tries to access
> > > memory that's been freed. =20
> >
> > flush_delayed_work() *does* guarantee the work is finished before
> > returning. =20
>=20
> Right, flush_work() does guarantee that the work is finished, but it
> doesn't guarantee that the queue is idle if work has been requeued
> since flush started. So fb_deferred_io_work() should be able to happen
> after the device is closed. Or am I missing something?

I'm confused: how is it possible for fb_deferred_io_work() to run after
the device is closed?

The workqueue is flushed during closing of device. If more work is
queued during/after the flushing, then someone must be writing to the
device during/after the closing of the device. How can that happen?

Best regards,
Nam

> > =20
> > > Patch [2] tries to solve the problem of not throwing away pending data
> > > when closing the device. Perhaps calling cancel_delayed_work_sync()
> > > and then follow up with a manual call to fb_deferred_io_work() would
> > > be enough to flush the remaining data?
> > >
> > > -Patrik
> > >
> > > [1] https://bugzilla.suse.com/show_bug.cgi?id=3D1221814
> > > [2] 33cd6ea9c067 fbdev: flush deferred IO before closing
> > > =20
> > > >
> > > >
> > > > Thanks,
> > > > Harshit =20
> > =20

