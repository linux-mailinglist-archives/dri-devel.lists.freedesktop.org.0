Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F163070E3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2336B6E90C;
	Thu, 28 Jan 2021 08:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1128C6E560
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 11:02:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611745336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ju2N1jG53lMFxxVc2NAYc72E2pl8QR5olvZUsyDkBak=;
 b=AA9bvWk5QA70wiw6O1ZPSDKUoqyu0AVXkgupz7DWubfXYLwjZdranJNQOeXK67PiHXNqrP
 Ps2F1OxikIKZssE6h1Vs7SpZUjh9ufNGMSdPAtlyTn6XVfb1YJ4Z/8o58VS3Q7PIRxtVnv
 O6qDC/79DfVs86Id/zmCKilWMrRYH9M=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82B07AD2B;
 Wed, 27 Jan 2021 11:02:16 +0000 (UTC)
Date: Wed, 27 Jan 2021 12:02:08 +0100
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] procfs/dmabuf: Add /proc/<pid>/task/<tid>/dmabuf_fds
Message-ID: <YBFIMIR2FXoYDd+0@dhcp22.suse.cz>
References: <20210126225138.1823266-1-kaleshsingh@google.com>
 <20210127090526.GB827@dhcp22.suse.cz>
 <6b314cf2-99f0-8e63-acc7-edebe2ca97d7@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b314cf2-99f0-8e63-acc7-edebe2ca97d7@amd.com>
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

On Wed 27-01-21 11:53:55, Christian K=F6nig wrote:
[...]
> In general processes are currently not held accountable for memory they
> reference through their file descriptors. DMA-buf is just one special cas=
e.

True

> In other words you can currently do something like this
> =

> fd =3D memfd_create("test", 0);
> while (1)
> =A0=A0=A0 write(fd, buf, 1024);
> =

> and the OOM killer will terminate random processes, but never the one
> holding the memfd reference.

memfd is just shmem under cover, no? And that means that the memory gets
accounted to MM_SHMEMPAGES. But you are right that this in its own
doesn't help much if the fd is shared and the memory stays behind a
killed victim.

But I do agree with you that there are resources which are bound to a
process life time but the oom killer has no idea about those as they are
not accounted on a per process level and/or oom_badness doesn't take
them into consideration.
-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
