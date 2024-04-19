Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B98AB1F2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 17:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15F410E26B;
	Fri, 19 Apr 2024 15:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="Oie4/xg4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uMfNdSWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2858810E26B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 15:34:47 +0000 (UTC)
Date: Fri, 19 Apr 2024 17:34:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1713540885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LjR+hMgOOIviyFlXVxnmansGbWA8tKdpCQ1OTyis+o=;
 b=Oie4/xg4HuGv2p1jKYMGBlvAjOUtDmS6cZohLywg7zad9+ccXByGV/dkkHVRyvlZW/6pPm
 U6Lqq9ZgpmmJWUV8KhXVuXX+2XvErS5cdMGlnQwadvDav3SCt7nnBtAFC1xbNeKMv4yuQq
 t3NGAKZioxyqtwJF/1y26QEpdbs762HJIeVTuJkSM5ZMlHOoBK8WrDy6hTLrZSwdIp/F/s
 gGtuGTJLlsdSlW6xbssdRclfI1tcLeYjRn+a5p7doXraiP3vpEr/nbaR7eNDYUSlarwr8E
 /tbQ5lfN4vlGcHKNVsmpN9X8y7qWeHd1RXhoy90rK3LCkn0TGuKCrQGciYa9Cg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1713540885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LjR+hMgOOIviyFlXVxnmansGbWA8tKdpCQ1OTyis+o=;
 b=uMfNdSWLan27BfBWRRXv+xSmDwICEfuBA3xX+rten5acv3HYwS3l2yJsq8RwiBlqhXCV6y
 FQoFWnfSfNsByYAA==
From: Nam Cao <namcao@linutronix.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, Harshit Mogalapalli
 <harshit.m.mogalapalli@oracle.com>, Helge Deller <deller@gmx.de>, Thomas
 Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bigeasy@linutronix.de, LKML <linux-kernel@vger.kernel.org>, Vegard Nossum
 <vegard.nossum@oracle.com>, George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
Message-ID: <20240419173443.6c49706e@namcao>
In-Reply-To: <CAMeQTsbEjUyOYDAF-kFwTcovLr+8gHQGa27jPkeeJqmLhwbTag@mail.gmail.com>
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <20240418160652.68df1a86@namcao> <87ttjywxv5.wl-tiwai@suse.de>
 <a7843657-c3f6-4d2e-8c36-5541d4c52956@gmx.de>
 <878r19voks.wl-tiwai@suse.de>
 <5febb249-1d4d-4ea7-b031-1df4d14620d2@oracle.com>
 <8734rhvlr2.wl-tiwai@suse.de>
 <CAMeQTsbEjUyOYDAF-kFwTcovLr+8gHQGa27jPkeeJqmLhwbTag@mail.gmail.com>
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

On 2024-04-19 Patrik Jakobsson wrote:
> Neither cancel_delayed_work_sync() or flush_delayed_work() prevent new
> work from being scheduled after they return.

flush_delayed_work() is called during device closing. And because no
writes are performed after the device has been closed, no new work
should be queued after flush_delayed_work().

> But
> cancel_delayed_work_sync() at least makes sure the queue is empty so
> the problem becomes less apparent.
> 
> Could this explain what we're seeing?

I suspect that cancel_delayed_work_sync() is only treating the symptoms
by preventing the deferred work from running. The real bug is "someone"
giving fb_deferred_io_work() invalid pages to work with. But that's
just a blind guess.

Best regards,
Nam
