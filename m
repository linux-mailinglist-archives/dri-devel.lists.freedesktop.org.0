Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E252AE6E
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 01:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CF91127DB;
	Tue, 17 May 2022 23:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C05A1127DB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 23:09:49 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id j28so795055eda.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 16:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YeWHEdiEl4Cq8ce8kfBVpVlo8D7OiDCUHl/qifLiacg=;
 b=Ac44BK8Oxljl1wYTS+T/ipuXIsyXnhAcD2EFhI7JosK6s2AsQoPQngNUvXID4XQU8R
 mW0BrgZPM9PBNfCplH1dStY4W0uPggK8Wt+6CMBU7mscY1UFX/6hj+LnoR0uGO52NXre
 +l1DxyMl5Jwi0KNt25psFVNG6+TgblbCYW2TtaI+GwLWcc0rj9ss2lo1oue9eMU5+mcl
 QXteQBsXYw0S2TIAGZrSAk7sk04efAskF4tiEnJP+nQNSTQe23HVsY46BflkEcbSzII4
 b0A+fWJDBtTWwT2EvWpIPUBE45sfCcfqGke+ggcODtNpXcqxB5rOTK9AMM+Nb18pnlM0
 rQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YeWHEdiEl4Cq8ce8kfBVpVlo8D7OiDCUHl/qifLiacg=;
 b=YqlYfYvu5A1cQhuzHqRAMUcn2s3wop5tv8u8vYnON8ivULd8j13oFEkD6ZlPn693po
 SgBDEEP32WIChd6hA37X6FaaVzdqAHF8asnzDlonclyLq+DtomnTlpGXZizxVytmnr1p
 lV/SmU1uBk3jrrYezvIujdH2UJs23WnoQuTSB1fXtsZe3QDtV8co/x5gLJ6E4POtPcK4
 9y+FfbpZx5Z4QLAkdQ9c9oZrYzgsGeEmfZ91f6fgTMXibLOXhD8TAE6zoLhNcryXyqsu
 CoAS/1kEWCRKmRjqMTbq7smeCvIw3w/DWAJbU6pbNiHuBKOFDmqGhL93C+Bks8R9u1Ye
 EkHg==
X-Gm-Message-State: AOAM533n+H6aqFLcSnAS7JtfmwPSmusqd6H3p+pCwVmixQ0Y9xrw/boe
 b8ZLW0ywaiSBoc+Zjt6PTjIlUU22+OkefrAidAdiSQ==
X-Google-Smtp-Source: ABdhPJx4nt0FkvBklwCxEBBCV/UBFXuXao7+3ByQEB1fVw4PsnGPgV8/sCFzvyTI3gvxHW8FGK42C/aj4o8mMw44U6w=
X-Received: by 2002:a50:ed8b:0:b0:42a:a7e0:f889 with SMTP id
 h11-20020a50ed8b000000b0042aa7e0f889mr17019013edr.79.1652828987857; Tue, 17
 May 2022 16:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
 <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
 <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
 <YoM9BAwybcjG7K/H@kroah.com>
In-Reply-To: <YoM9BAwybcjG7K/H@kroah.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 17 May 2022 16:09:36 -0700
Message-ID: <CABdmKX3SngXeq+X0YiQ8d4X3xpUhnUtewPiUam5Bfi7PCC6nWQ@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel-team@android.com, Minchan Kim <minchan@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, John Stultz <jstultz@google.com>,
 Kalesh Singh <kaleshsingh@google.com>, Hridya Valsaraju <hridya@google.com>,
 Greg Kroah-Hartman <gregkh@google.com>, Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 16, 2022 at 11:13 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, May 16, 2022 at 05:08:05PM -0700, T.J. Mercier wrote:
> > On Mon, May 16, 2022 at 12:21 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> > >
> > > Am 16.05.22 um 20:08 schrieb T.J. Mercier:
> > > > On Mon, May 16, 2022 at 10:20 AM Christian K=C3=B6nig
> > > > <christian.koenig@amd.com> wrote:
> > > >> Am 16.05.22 um 19:13 schrieb T.J. Mercier:
> > > >>> Recently, we noticed an issue where a process went into direct re=
claim
> > > >>> while holding the kernfs rw semaphore for sysfs in write (exclusi=
ve)
> > > >>> mode. This caused processes who were doing DMA-BUF exports and re=
leases
> > > >>> to go into uninterruptible sleep since they needed to acquire the=
 same
> > > >>> semaphore for the DMA-BUF sysfs entry creation/deletion. In order=
 to avoid
> > > >>> blocking DMA-BUF export for an indeterminate amount of time while
> > > >>> another process is holding the sysfs rw semaphore in exclusive mo=
de,
> > > >>> this patch moves the per-buffer sysfs file creation to the defaul=
t work
> > > >>> queue. Note that this can lead to a short-term inaccuracy in the =
dmabuf
> > > >>> sysfs statistics, but this is a tradeoff to prevent the hot path =
from
> > > >>> being blocked. A work_struct is added to dma_buf to achieve this,=
 but as
> > > >>> it is unioned with the kobject in the sysfs_entry, dma_buf does n=
ot
> > > >>> increase in size.
> > > >> I'm still not very keen of this approach as it strongly feels like=
 we
> > > >> are working around shortcoming somewhere else.
> > > >>
> > > > My read of the thread for the last version is that we're running in=
to
> > > > a situation where sysfs is getting used for something it wasn't
> > > > originally intended for, but we're also stuck with this sysfs
> > > > functionality for dmabufs.
> > > >
> > > >>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BU=
F stats in sysfs")
> > > >>> Originally-by: Hridya Valsaraju <hridya@google.com>
> > > >>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > >>>
> > > >>> ---
> > > >>> See the originally submitted patch by Hridya Valsaraju here:
> > > >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Flkml.org%2Flkml%2F2022%2F1%2F4%2F1066&amp;data=3D05%7C01%7Cchristian.koe=
nig%40amd.com%7C794614324d114880a25508da37672e4b%7C3dd8961fe4884e608e11a82d=
994e183d%7C0%7C0%7C637883213566903705%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;s=
data=3DbGlA2FeubfSeL5XDHYyWMZqUXfScoCphZjjK4jrqQJs%3D&amp;reserved=3D0
> > > >>>
> > > >>> v2 changes:
> > > >>> - Defer only sysfs creation instead of creation and teardown per
> > > >>> Christian K=C3=B6nig
> > > >>>
> > > >>> - Use a work queue instead of a kthread for deferred work per
> > > >>> Christian K=C3=B6nig
> > > >>> ---
> > > >>>    drivers/dma-buf/dma-buf-sysfs-stats.c | 56 +++++++++++++++++++=
+-------
> > > >>>    include/linux/dma-buf.h               | 14 ++++++-
> > > >>>    2 files changed, 54 insertions(+), 16 deletions(-)
> > > >>>
> > > >>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-=
buf/dma-buf-sysfs-stats.c
> > > >>> index 2bba0babcb62..67b0a298291c 100644
> > > >>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> > > >>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > > >>> @@ -11,6 +11,7 @@
> > > >>>    #include <linux/printk.h>
> > > >>>    #include <linux/slab.h>
> > > >>>    #include <linux/sysfs.h>
> > > >>> +#include <linux/workqueue.h>
> > > >>>
> > > >>>    #include "dma-buf-sysfs-stats.h"
> > > >>>
> > > >>> @@ -168,10 +169,46 @@ void dma_buf_uninit_sysfs_statistics(void)
> > > >>>        kset_unregister(dma_buf_stats_kset);
> > > >>>    }
> > > >>>
> > > >>> +static void sysfs_add_workfn(struct work_struct *work)
> > > >>> +{
> > > >>> +     struct dma_buf_sysfs_entry *sysfs_entry =3D
> > > >>> +             container_of(work, struct dma_buf_sysfs_entry, sysf=
s_add_work);
> > > >>> +     struct dma_buf *dmabuf =3D sysfs_entry->dmabuf;
> > > >>> +
> > > >>> +     /*
> > > >>> +      * A dmabuf is ref-counted via its file member. If this han=
dler holds the only
> > > >>> +      * reference to the dmabuf, there is no need for sysfs kobj=
ect creation. This is an
> > > >>> +      * optimization and a race; when the reference count drops =
to 1 immediately after
> > > >>> +      * this check it is not harmful as the sysfs entry will sti=
ll get cleaned up in
> > > >>> +      * dma_buf_stats_teardown, which won't get called until the=
 final dmabuf reference
> > > >>> +      * is released, and that can't happen until the end of this=
 function.
> > > >>> +      */
> > > >>> +     if (file_count(dmabuf->file) > 1) {
> > > >> Please completely drop that. I see absolutely no justification for=
 this
> > > >> additional complexity.
> > > >>
> > > > This case gets hit around 5% of the time in my testing so the else =
is
> > > > not a completely unused branch.
> > >
> > > Well I can only repeat myself: This means that your userspace is
> > > severely broken!
> > >
> > > DMA-buf are meant to be long living objects
> > This patch addresses export *latency* regardless of how long-lived the
> > object is. Even a single, long-lived export will benefit from this
> > change if it would otherwise be blocked on adding an object to sysfs.
> > I think attempting to improve this latency still has merit.
>
> Fixing the latency is nice, but as it's just pushing the needed work off
> to another code path, it will take longer overall for the sysfs stuff to
> be ready for userspace to see.
>
> Perhaps we need to step back and understand what this code is supposed
> to be doing.  As I recall, it was created because some systems do not
> allow debugfs anymore, and they wanted the debugging information that
> the dmabuf code was exposing to debugfs on a "normal" system.  Moving
> that logic to sysfs made sense, but now I am wondering why we didn't see
> these issues in the debugfs code previously?
>
The debugfs stuff doesn't happen on every export, right?

> Perhaps we should go just one step further and make a misc device node
> for dmabug debugging information to be in and just have userspace
> poll/read on the device node and we spit the info that used to be in
> debugfs out through that?  That way this only affects systems when they
> want to read the information and not normal code paths?  Yeah that's a
> hack, but this whole thing feels overly complex now.
>

And deprecate sysfs support? I'm happy to try out anything you think
might be a better way. As far as complexity of this patch, this
revision is a much simpler version of the one from Hridya you already
reviewed.

> thanks,
>
> greg k-h
