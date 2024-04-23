Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60E18AE43D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 13:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1194113310;
	Tue, 23 Apr 2024 11:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="ZMiuRte7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rOvjDt4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B349113310
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 11:39:40 +0000 (UTC)
Date: Tue, 23 Apr 2024 13:39:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1713872377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C0HVSv5euflJb8c+If9F5GRU+WYrGKFtrWnWjuUiGzI=;
 b=ZMiuRte76KcnQlXMkfARsv0/NVu9zZTf2RdRW62fJ1f8UkdMBDZtxd8rMIa0DKT1jip65R
 fY1CXtvwDxQDBURnwLAbSOkmad0Ccwr+Y1SwtwRmsF7DjNDCZWdrp3XxZGFa4ZJuU3IBtL
 oySHtTsXQ31/BuRd4zqmXnqvcocZp9LciGRDgR1uG2REbMWQ/g8zrtZdeSEaMs+vYu1uDq
 lQBfl01lVKtO2sA1MhjWBw+LGfDNQ11u078L1d9gXX9izl0QkatZAzLT/rqLJmawgRk7yS
 2Ct9cy4dsW+QAxxI6t/VkyuZycV2MPGtZYllVgaL39l9BtCP/GKOVP6KCwz5Vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1713872377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C0HVSv5euflJb8c+If9F5GRU+WYrGKFtrWnWjuUiGzI=;
 b=rOvjDt4a/9i+oY2ZeothsvDr4PfDNwf7LljBPfGHyxVmolGoL7M4aB5i8+rAntGPMvNvDI
 PRjoFBIs7JDUlJBw==
From: Nam Cao <namcao@linutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jaya Kumar <jayalk@intworks.biz>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tiwai@suse.de, bigeasy@linutronix.de,
 patrik.r.jakobsson@gmail.com, Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] fbdev: fix incorrect address computation in deferred IO
Message-ID: <20240423113933.IpMjHGw7@linutronix.de>
References: <20240419190032.40490-1-namcao@linutronix.de>
 <666d986e-5227-4b6d-829c-95ff16115488@suse.de>
 <20240423095538.m79ML6a0@linutronix.de>
 <64c1585d-70e0-47d4-9d78-405b483b433c@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64c1585d-70e0-47d4-9d78-405b483b433c@suse.de>
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

On Tue, Apr 23, 2024 at 01:27:09PM +0200, Thomas Zimmermann wrote:
> Am 23.04.24 um 11:55 schrieb Nam Cao:
...
> > > The page-fault handler at [1] use vm_fault.pgoff to retrieve the page
> > > structure. Can we do the same here and avoid that computation?
> > Yes, thanks for the suggestion.
> > 
> > It will change things a bit: offset will not be the exact value anymore,
> > but will be rounded down to multiple of PAGE_SIZE. But that doesn't matter,
> > because it will only be used to calculate the page offset later on.
> > 
> > We can clean this up and rename this "offset" to "pg_offset". But that's
> > for another day.
> 
> But can't we use struct vm_fault.pgoff directly? The page-fault handler has
> used it since forever. The look-up code for the pageref should probably do
> the same, because there's a 1:1 connection between the page and the pageref.
> The pageref structure only exists because we cannot store its data in struct
> page directly.
> 
> AFAICT pgoff is exactly the value want to compute. See [1] and  the
> calculation at [2].

Completely agree. I just wanted to point out that the value inside the
variable "offset" won't be the same as before, but it's still correct.

I just tested the patch on real hardware, will send it shortly.

Best regards,
Nam
