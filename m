Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6574E8A9C36
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9B8113CBC;
	Thu, 18 Apr 2024 14:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="Wu93NQS1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gqs+4Wd3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71234113C8B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:05:31 +0000 (UTC)
Date: Thu, 18 Apr 2024 16:05:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1713449128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MdvgBf6ZpsA4n+BoYvD1NnnaPdS5+NDIXIaVMmgP4hU=;
 b=Wu93NQS1Iz2e7QuZtENBDdrlllSJjvCgf3fn/D4KJTe7mIoe907CKwFSkJ4vcoHBfDgzt5
 0aD0nIh0fAk2xY64eYSssFby3uybIltLqPaLyDz1uA3VDX0xiEc6TtiNHaiZfWZrNTSfVJ
 BL64QPsCzkIqpV0gPY5T/ywIVa7y0m3pLDRnbXzFPKIVg+3KGrmpsdALVmEUotkxmOl+T5
 UkTIRKffnude85aVxnGmuMwKmH5CM5HRoHL98stWY2jV61m7ZvL0df+cJKFPngrUf1iL5B
 4uGFoFeLoEPbpbwauSObHWyUkGuyhFtKApyOgq4AXwHCS4KvfRHTDAhampTEyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1713449128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MdvgBf6ZpsA4n+BoYvD1NnnaPdS5+NDIXIaVMmgP4hU=;
 b=gqs+4Wd3U0rfgEjP80HwkKZ4qF3kQb0jGka9A+b37lMDO0zvuizvVSj2HFl1TbSt4JzOKl
 GMPiRTk6EfmtCHCw==
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
Message-ID: <20240418160526.3b3c385f@namcao>
In-Reply-To: <CAMeQTsbCESSTrEyHgqF9HreSuzQ9kMBnGpKLT0QNJ+n4hv9qOw@mail.gmail.com>
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <CAMeQTsbCESSTrEyHgqF9HreSuzQ9kMBnGpKLT0QNJ+n4hv9qOw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-04-18 Patrik Jakobsson wrote:
> This sounds similar to the SUSE bug [1]. We fixed it by reverting [2]
> in the SUSE kernel. The problem seems to be that flush_delayed_work()
> kills the timer and re-queues the work but doesn't guarantee that it
> is finished when returning. So when the device is closed, the
> fb_deferred_io_work() function can still be queued and tries to access
> memory that's been freed.

flush_delayed_work() *does* guarantee the work is finished before
returning.

> Patch [2] tries to solve the problem of not throwing away pending data
> when closing the device. Perhaps calling cancel_delayed_work_sync()
> and then follow up with a manual call to fb_deferred_io_work() would
> be enough to flush the remaining data?
> 
> -Patrik
> 
> [1] https://bugzilla.suse.com/show_bug.cgi?id=1221814
> [2] 33cd6ea9c067 fbdev: flush deferred IO before closing
> 
> >
> >
> > Thanks,
> > Harshit  

