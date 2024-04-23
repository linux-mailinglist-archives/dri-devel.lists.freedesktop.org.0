Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DC28AE848
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988E9112E3B;
	Tue, 23 Apr 2024 13:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="WTKjNeqY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V+R4HkPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7291133C4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:34:53 +0000 (UTC)
Date: Tue, 23 Apr 2024 15:34:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1713879290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zQzgTOJxdV+4HqjR4K2Hng/ZiXcnP1iJM/wR6D3wAb4=;
 b=WTKjNeqY8xkmjrafgK3JHTMFWg4OmmtvBoHyR86Fz5DQGc8/m4JRw1pNturj88beqVCLmT
 u/3GvaY+7s3kCWvaUaDifQlr/v2fxGWoZwZRKq36MpJfVSR7U9iqQiDsb+Yaf1Yl8XWA6u
 kUIMap3Meje3OFinYmlFLMk4SyWh/0Pynrwvhp1WDbZ3SJZggVNkDtsfGMKqyUt4fy/nSl
 Gm04YqUim+3+mFh2FGUyWtktXFd37D71LIDKndamiMbkQgJczzSQOkBl0xmHIKKPAmT6QX
 tH0EeGkij45IWOvEoXwmtEvj3nwaeCN4OEiiEDYVuvd/7eoSzjoma6p9BB98rg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1713879290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zQzgTOJxdV+4HqjR4K2Hng/ZiXcnP1iJM/wR6D3wAb4=;
 b=V+R4HkPdnpgdtc0lWO90//+/pjHU2Wv+1ovkWI/lI/cCJ3k3ME+ubW3PIOsWmJQb2JUHs+
 Kju2+Ap2WqZxpOAA==
From: Nam Cao <namcao@linutronix.de>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jaya Kumar <jayalk@intworks.biz>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tiwai@suse.de, bigeasy@linutronix.de,
 patrik.r.jakobsson@gmail.com, Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] fbdev: fix incorrect address computation in deferred IO
Message-ID: <20240423133445.h44pcNzq@linutronix.de>
References: <20240423115053.4490-1-namcao@linutronix.de>
 <1722c1b6-59a5-429d-905c-bc1951a68a68@suse.de>
 <c2bf36b5-3145-491b-b272-d5afae73db7f@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2bf36b5-3145-491b-b272-d5afae73db7f@oracle.com>
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

On Tue, Apr 23, 2024 at 06:56:52PM +0530, Harshit Mogalapalli wrote:
> Thanks everyone!
> 
> I have tested the patched kernel with the syzkaller reproducer and couldn't
> see a problem.

If you want to take credit for testing it, send us:

	Tested-by: Your Name <your@email>

And that tag will appear in the final commit.

But completely up to you.

Best regards,
Nam
