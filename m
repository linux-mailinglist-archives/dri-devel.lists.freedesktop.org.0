Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B656198F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 13:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F2311254E;
	Thu, 30 Jun 2022 11:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A7110EB1D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 11:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656589732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PuYKS2jgPzieTAQHjEiRWkzk1xJEb/FrbHOJrQZTZMA=;
 b=h9Q+mJtW5voCiocL+NFF71bKgsQQEshmzA+HAvYN5S5FOtsRbxhmTUsd6wwEZ76H2h8ILN
 AYlWCnQ0wM8MJtj7939LF6ThtRT4opdrhQjHWGkegVrAYdNiHMPG2SL2thEuCI6RbFjLrv
 4Jb2nEqcbB8tT3ZWkn9m26eRFaCYItk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-SFuN5JqqNKGE4otcBSwaiQ-1; Thu, 30 Jun 2022 07:48:51 -0400
X-MC-Unique: SFuN5JqqNKGE4otcBSwaiQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 q184-20020a378ec1000000b006b14460be35so4285808qkd.22
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 04:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PuYKS2jgPzieTAQHjEiRWkzk1xJEb/FrbHOJrQZTZMA=;
 b=aQky2JMq/0rlLGEryYcg+a/LKYK3KNhRIxqVpJoVP3uotZVTyXUM3RtGFq/My5wOhj
 eDCofZKxxKfvHfp+dOTy7xsIr5qU1uA7pi81tfKp3fylY/+pzEQiXQx4YlDdI02tqtsz
 ZY5KNTCR0rXpfAfgwwFy48/P+ob174+BwH7UYvV3YQDDlP/20bsjLrFcZoQQAuKBdnZz
 Gx7QF9dlpE6dWphPQSGfsB6gxVvz4yHlkr58z/qw6uTlO4g83m53UIQY+eFEEyCtHRxg
 GmycL4iU2BT79fYjQjqkSA90l5HrUaO3cVIeBk/2FtYErHf7AmdnKUt3YVkiCFx7lLju
 Y6cw==
X-Gm-Message-State: AJIora9UkWNJ/HpVnvm7REkhDeiQBLV/HrE2ldTpNIOZIg1GX3tg6NGs
 1ngAWTZII0orl6duHlL9zWuxKzSEl//G5AEKM9ufPRZch5TOvMLz49YbLOoVI06QAH026Hmw96A
 5ScWko/0/lDiGwRnyrLgGIt/z8AMo
X-Received: by 2002:a05:622a:109:b0:31d:23fe:7b4c with SMTP id
 u9-20020a05622a010900b0031d23fe7b4cmr6581293qtw.312.1656589730509; 
 Thu, 30 Jun 2022 04:48:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uRz44w+O3VbQzatODmiPcnbDn785yVVNQoG4sSqp1OaDj0ogmo2bhAXqTAqLnNxIU5BCVTqw==
X-Received: by 2002:a05:622a:109:b0:31d:23fe:7b4c with SMTP id
 u9-20020a05622a010900b0031d23fe7b4cmr6581266qtw.312.1656589730128; 
 Thu, 30 Jun 2022 04:48:50 -0700 (PDT)
Received: from bfoster (c-24-61-119-116.hsd1.ma.comcast.net. [24.61.119.116])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a37f90c000000b006b14fb1ba18sm2588043qkj.35.2022.06.30.04.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 04:48:49 -0700 (PDT)
Date: Thu, 30 Jun 2022 07:48:46 -0400
From: Brian Foster <bfoster@redhat.com>
To: Kalesh Singh <kaleshsingh@google.com>
Subject: Re: [PATCH v2 1/2] procfs: Add 'size' to /proc/<pid>/fdinfo/
Message-ID: <Yr2NngYE2qX8WzPV@bfoster>
References: <20220623220613.3014268-1-kaleshsingh@google.com>
 <20220623220613.3014268-2-kaleshsingh@google.com>
 <Yrrrz7MxMu8OoEPU@bfoster>
 <CAC_TJvejs5gbggC1hekyjUNctC_8+3FmVn0B7zAZox2+MkEjaA@mail.gmail.com>
 <YrxEUbDkYLE6XF6x@bfoster>
 <CAC_TJvcRd7=9xGXP5-t8v3g5iFWtYANpGA-nTqaGZBVTwa=07w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAC_TJvcRd7=9xGXP5-t8v3g5iFWtYANpGA-nTqaGZBVTwa=07w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bfoster@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Stephen Brennan <stephen.s.brennan@oracle.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 Christoph Hellwig <hch@infradead.org>,
 "Cc: Android Kernel" <kernel-team@android.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Suren Baghdasaryan <surenb@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ioannis Ilkos <ilkos@google.com>,
 LKML <linux-kernel@vger.kernel.org>, David.Laight@aculab.com,
 Johannes Weiner <hannes@cmpxchg.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 01:43:11PM -0700, Kalesh Singh wrote:
> On Wed, Jun 29, 2022 at 5:23 AM Brian Foster <bfoster@redhat.com> wrote:
> >
> > On Tue, Jun 28, 2022 at 03:38:02PM -0700, Kalesh Singh wrote:
> > > On Tue, Jun 28, 2022 at 4:54 AM Brian Foster <bfoster@redhat.com> wrote:
> > > >
> > > > On Thu, Jun 23, 2022 at 03:06:06PM -0700, Kalesh Singh wrote:
> > > > > To be able to account the amount of memory a process is keeping pinned
> > > > > by open file descriptors add a 'size' field to fdinfo output.
> > > > >
> > > > > dmabufs fds already expose a 'size' field for this reason, remove this
> > > > > and make it a common field for all fds. This allows tracking of
> > > > > other types of memory (e.g. memfd and ashmem in Android).
> > > > >
> > > > > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > > > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > > > ---
> > > > >
> > > > > Changes in v2:
> > > > >   - Add Christian's Reviewed-by
> > > > >
> > > > > Changes from rfc:
> > > > >   - Split adding 'size' and 'path' into a separate patches, per Christian
> > > > >   - Split fdinfo seq_printf into separate lines, per Christian
> > > > >   - Fix indentation (use tabs) in documentaion, per Randy
> > > > >
> > > > >  Documentation/filesystems/proc.rst | 12 ++++++++++--
> > > > >  drivers/dma-buf/dma-buf.c          |  1 -
> > > > >  fs/proc/fd.c                       |  9 +++++----
> > > > >  3 files changed, 15 insertions(+), 7 deletions(-)
> > > > >
> > ...
> > > >
> > > > Also not sure if it matters that much for your use case, but something
> > > > worth noting at least with shmem is that one can do something like:
> > > >
> > > > # cat /proc/meminfo | grep Shmem:
> > > > Shmem:               764 kB
> > > > # xfs_io -fc "falloc -k 0 10m" ./file
> > > > # ls -alh file
> > > > -rw-------. 1 root root 0 Jun 28 07:22 file
> > > > # stat file
> > > >   File: file
> > > >   Size: 0               Blocks: 20480      IO Block: 4096   regular empty file
> > > > # cat /proc/meminfo | grep Shmem:
> > > > Shmem:             11004 kB
> > > >
> > > > ... where the resulting memory usage isn't reflected in i_size (but is
> > > > is in i_blocks/bytes).
> > >
> > > I tried a similar experiment a few times, but I don't see the same
> > > results. In my case, there is not any change in shmem. IIUC the
> > > fallocate is allocating the disk space not shared memory.
> > >
> >
> > Sorry, it was implied in my previous test was that I was running against
> > tmpfs. So regardless of fs, the fallocate keep_size semantics shown in
> > both cases is as expected: the underlying blocks are allocated and the
> > inode size is unchanged.
> >
> > What wasn't totally clear to me when I read this patch was 1. whether
> > tmpfs refers to Shmem and 2. whether tmpfs allowed this sort of
> > operation. The test above seems to confirm both, however, right? E.g., a
> > more detailed example:
> >
> > # mount | grep /tmp
> > tmpfs on /tmp type tmpfs (rw,nosuid,nodev,seclabel,nr_inodes=1048576,inode64)
> > # cat /proc/meminfo | grep Shmem:
> > Shmem:              5300 kB
> > # xfs_io -fc "falloc -k 0 1g" /tmp/file
> > # stat /tmp/file
> >   File: /tmp/file
> >   Size: 0               Blocks: 2097152    IO Block: 4096   regular empty file
> > Device: 22h/34d Inode: 45          Links: 1
> > Access: (0600/-rw-------)  Uid: (    0/    root)   Gid: (    0/    root)
> > Context: unconfined_u:object_r:user_tmp_t:s0
> > Access: 2022-06-29 08:04:01.301307154 -0400
> > Modify: 2022-06-29 08:04:01.301307154 -0400
> > Change: 2022-06-29 08:04:01.451312834 -0400
> >  Birth: 2022-06-29 08:04:01.301307154 -0400
> > # cat /proc/meminfo | grep Shmem:
> > Shmem:           1053876 kB
> > # rm -f /tmp/file
> > # cat /proc/meminfo | grep Shmem:
> > Shmem:              5300 kB
> >
> > So clearly this impacts Shmem.. was your test run against tmpfs or some
> > other (disk based) fs?
> 
> Hi Brian,
> 
> Thanks for clarifying. My issue was tmpfs not mounted at /tmp in my system:
> 
> ==> meminfo.start <==
> Shmem:               572 kB
> ==> meminfo.stop <==
> Shmem:             51688 kB
> 

Ok, makes sense.

> >
> > FWIW, I don't have any objection to exposing inode size if it's commonly
> > useful information. My feedback was more just an fyi that i_size doesn't
> > necessarily reflect underlying space consumption (whether it's memory or
> > disk space) in more generic cases, because it sounds like that is really
> > what you're after here. The opposite example to the above would be
> > something like an 'xfs_io -fc "truncate 1t" /tmp/file', which shows a
> > 1TB inode size with zero additional shmem usage.
> 
> From these cases, it seems the more generic way to do this is by
> calculating the actual size consumed using the blocks. (i_blocks *
> 512). So in the latter example  'xfs_io -fc "truncate 1t" /tmp/file'
> the size consumed would be zero. Let me know if it sounds ok to you
> and I can repost the updated version.
> 

That sounds a bit more useful to me if you're interested in space usage,
or at least I don't have a better idea for you. ;)

One thing to note is that I'm not sure whether all fs' use i_blocks
reliably. E.g., XFS populates stat->blocks via a separate block counter
in the XFS specific inode structure (see xfs_vn_getattr()). A bunch of
other fs' seem to touch it so perhaps that is just an outlier. You could
consider fixing that up, perhaps make a ->getattr() call to avoid it, or
just use the field directly if it's useful enough as is and there are no
other objections. Something to think about anyways..

Brian

> Thanks,
> Kalesh
> 
> >
> > Brian
> >
> > > cat /proc/meminfo > meminfo.start
> > > xfs_io -fc "falloc -k 0 50m" ./xfs_file
> > > cat /proc/meminfo > meminfo.stop
> > > tail -n +1 meminfo.st* | grep -i '==\|Shmem:'
> > >
> > > ==> meminfo.start <==
> > > Shmem:               484 kB
> > > ==> meminfo.stop <==
> > > Shmem:               484 kB
> > >
> > > ls -lh xfs_file
> > > -rw------- 1 root root 0 Jun 28 15:12 xfs_file
> > >
> > > stat xfs_file
> > >   File: xfs_file
> > >   Size: 0               Blocks: 102400     IO Block: 4096   regular empty file
> > >
> > > Thanks,
> > > Kalesh
> > >
> > > >
> > > > Brian
> > > >
> > > > >
> > > > >       /* show_fd_locks() never deferences files so a stale value is safe */
> > > > >       show_fd_locks(m, file, files);
> > > > > --
> > > > > 2.37.0.rc0.161.g10f37bed90-goog
> > > > >
> > > >
> > >
> >
> > --
> > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> >
> 

