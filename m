Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A93126684
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 17:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A4D6E366;
	Thu, 19 Dec 2019 16:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C856D6E366
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 16:18:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id 21BB829309C
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org, Yiwei Zhang <zzyiwei@google.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
Date: Thu, 19 Dec 2019 17:18:13 +0100
Message-ID: <2981882.gi1CFgH74X@saphira>
In-Reply-To: <CAKT=dDkGCKuE=CNr=9dfXCZw-exc570cc67w_uV_X322cGf3Og@mail.gmail.com>
References: <CAKT=dDnhth-6giOWgym7qpLNeH=86=XhQmPcgHM2J8B_L3myRQ@mail.gmail.com>
 <20191112201808.GE31272@redhat.com>
 <CAKT=dDkGCKuE=CNr=9dfXCZw-exc570cc67w_uV_X322cGf3Og@mail.gmail.com>
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
Cc: Alistair Delva <adelva@google.com>, Prahlad Kilambi <prahladk@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Kenny Ho <y2kenny@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <seanpaul@chromium.org>,
 Chris Forbes <chrisforbes@google.com>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey

> Is it reasonable to add another ioctl or something equivalent to label
> a BO with what PID makes the allocation? When the BO gets shared to
> other processes, this information also needs to be bookkept somewhere
> for tracking. Basically I wonder if it's possible for upstream to
> track BOs in a similar way Android tracks dmabuf. Then there's a node
> implemented by cgroup in proc listing all the BOs per process with
> information like label, refcount, etc. Then Android GPU vendors can
> implement the same nodes which is going to be compatible even if they
> later adopts drm subsystem.
> 
> So my sketch idea for the nodes are:
> (1) /proc/gpu0_meminfo, /proc/gpu1_meminfo
> This is a list of all BOs with pids holding a reference to it and the
> current label of each BO
> (2) /proc/<pid>/gpu0_meminfo, /proc/<pid>/gpu1_meminfo
> This is a list of all BOs this process holds a reference to.
> (3) Is it reasonable to implement another nodes for {total,
> total_unmapped} counters? or just surface through /proc/meminfo?
> 

This would be tricky to implement because:

(1) PID's are not unique, PID namespaces allow linux userspace to potentially 
share the same PID.

(2) Specifically in the case of mesa, there isn't a way to (AFAIK) associate a 
BO with a PID.

Cheers
Rohan Garg


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
