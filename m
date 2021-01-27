Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FD9307128
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91B86E95D;
	Thu, 28 Jan 2021 08:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500F489EB8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 11:23:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611746630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PqpTmCh3ho+cnaTSVLoFW4UVAwVWXacgRQ8K11OQqug=;
 b=A0Wcko1cqX604secuwtbyeQ8wWpszYFQnnwp2qTxgLmHN1G5M16dx+DyGbUJIGpvKkZoaG
 CM6tKnCe31ck37wl5r0KOLE6uoY/GT7xRtl8MI0+v/+kqt+G9dsvqNPXncHv5fSxgC5w28
 TY5IjZy1AyF6cB5rdaDKLAzZq0G1F+0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C03E4AC9B;
 Wed, 27 Jan 2021 11:23:49 +0000 (UTC)
Date: Wed, 27 Jan 2021 12:23:47 +0100
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] procfs/dmabuf: Add /proc/<pid>/task/<tid>/dmabuf_fds
Message-ID: <YBFNQ0Mxauknw68b@dhcp22.suse.cz>
References: <20210126225138.1823266-1-kaleshsingh@google.com>
 <20210127090526.GB827@dhcp22.suse.cz>
 <6b314cf2-99f0-8e63-acc7-edebe2ca97d7@amd.com>
 <YBFIMIR2FXoYDd+0@dhcp22.suse.cz>
 <7dd33165-4fb9-a424-9b5e-08c69583c979@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7dd33165-4fb9-a424-9b5e-08c69583c979@amd.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: linux-doc@vger.kernel.org, Szabolcs Nagy <szabolcs.nagy@arm.com>,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Kalesh Singh <kaleshsingh@google.com>, Hui Su <sh_def@163.com>,
 Michel Lespinasse <walken@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, kernel-team@android.com,
 Alexey Dobriyan <adobriyan@gmail.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, jannh@google.com,
 linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
 Bernd Edlinger <bernd.edlinger@hotmail.de>, surenb@google.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, minchan@kernel.org,
 Andrei Vagin <avagin@gmail.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexey Gladkov <gladkov.alexey@gmail.com>, hridya@google.com,
 Andrew Morton <akpm@linux-foundation.org>, linux-api@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 27-01-21 12:08:50, Christian K=F6nig wrote:
> Am 27.01.21 um 12:02 schrieb Michal Hocko:
> > On Wed 27-01-21 11:53:55, Christian K=F6nig wrote:
> > [...]
> > > In general processes are currently not held accountable for memory th=
ey
> > > reference through their file descriptors. DMA-buf is just one special=
 case.
> > True
> > =

> > > In other words you can currently do something like this
> > > =

> > > fd =3D memfd_create("test", 0);
> > > while (1)
> > >  =A0=A0=A0 write(fd, buf, 1024);
> > > =

> > > and the OOM killer will terminate random processes, but never the one
> > > holding the memfd reference.
> > memfd is just shmem under cover, no? And that means that the memory gets
> > accounted to MM_SHMEMPAGES. But you are right that this in its own
> > doesn't help much if the fd is shared and the memory stays behind a
> > killed victim.
> =

> I think so, yes. But I just tested this and it doesn't seem to work
> correctly.
> =

> When I run the few lines above the OOM killer starts to terminate process=
es,
> but since my small test program uses very very little memory basically
> everything else gets terminated (including X, desktop, sshd etc..) before=
 it
> is terminated as well.

Something worth looking into. Maybe those pages are not really accounted
properly after all. Can you send a separate email about details with oom
reports please?
-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
