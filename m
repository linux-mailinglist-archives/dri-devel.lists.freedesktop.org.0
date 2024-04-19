Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D98AB343
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 18:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B0410F759;
	Fri, 19 Apr 2024 16:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="D/i3EPnk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ILQh7zBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD9710F759
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 16:23:18 +0000 (UTC)
Date: Fri, 19 Apr 2024 18:23:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1713543796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2tAw1Bq+UGriHq05hD23m4NS+gVnMuksa7pvzwC3RZ4=;
 b=D/i3EPnkCg6QRKwxR6Cz0sCXhVmB2m7VlRYLCxxTP+mDVFTdb6sdiToLQKYB3peonObWAR
 TTA0XpQl8IqVR34mAyc4Yl/RCy8YxcI5QlFVDKrvOjtJBHvH+BZclwv+lH5XxvrMu59EoD
 /DL3qfcnc1WIVmiwFfIg1Vd30g23zKfZVOxuhoeaKeijUo4YaSbLYuka44fnbb48P6MKtu
 6l1cpKQKfX4Eug/4jozh8G5ODjw7npkYR2nsms1pK26jXMJQZuZahxhRD5B2n5FW1Rpy5h
 l0bDQg8Qgr23mE8HXCH9KxVAn9wgKquQth6wqYkO2SRREurAopSJj+36bXQqDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1713543796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2tAw1Bq+UGriHq05hD23m4NS+gVnMuksa7pvzwC3RZ4=;
 b=ILQh7zBTTk+j3vcZIhpdjyIJ52Lt6bounPhyT23Uynvd4jRKoad2bFNptUSYGrnhqVJt9N
 W0NI1X3XpVbcVDDg==
From: Nam Cao <namcao@linutronix.de>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: jayalk@intworks.biz, Daniel Vetter <daniel@ffwll.ch>, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tiwai@suse.de, bigeasy@linutronix.de, patrik.r.jakobsson@gmail.com, LKML
 <linux-kernel@vger.kernel.org>, Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>, Darren Kenny
 <darren.kenny@oracle.com>, chuansheng.liu@intel.com,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
Message-ID: <20240419182313.3f36ac0b@namcao>
In-Reply-To: <796eecdb-f574-4eca-8cb7-ff426505435c@oracle.com>
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <20240419165915.228c76e9@namcao>
 <796eecdb-f574-4eca-8cb7-ff426505435c@oracle.com>
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

On 2024-04-19 Harshit Mogalapalli wrote:
> +CC stable( heads up as this is a regression affecting 5.15.y and 
> probably others, Greg: this was reproducible upstream so reported 
> everything w.r.t upstream code but initially found on 5.15.y)

No worry about this, I will add a "Cc: <stable@vger.kernel.org>" tag
to the patch, and the stable folks (or their scripts) will pick it up.

> This patch works well against the reproducer, this simplified repro and 
> the longer repro which syzkaller generated couldn't trigger any hang 
> with the below patch applied.

Great, thanks! Can I add
	Reported-and-tested-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
to the patch?

Best regards,
Nam
