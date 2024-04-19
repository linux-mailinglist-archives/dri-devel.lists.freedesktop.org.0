Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2968AA977
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 09:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7E010FDDB;
	Fri, 19 Apr 2024 07:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Eby7e4Bb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ja5YI5De";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Eby7e4Bb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ja5YI5De";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D2D10F843
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 07:45:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 230925D42E;
 Fri, 19 Apr 2024 07:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713512730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2CbqxqiKRFhLuKxyiQ96b3q978YvjljtUswuKcL6eA=;
 b=Eby7e4Bb0ywUAAR9YC+ROvR6GD9JRvN+5K3U/JyzmfGQ45neTR/tOQx/vtsk4RSyaFjADd
 GFWrUrNShxSbAKMGKKJlTuZTtYn1hR4oS/g7yQvhGNsZyF7imrczZ6eWZcbiYnzdqvqLuq
 K7se6qmYqTPrLFq3ZS0aDKsJFf7XcAE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713512730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2CbqxqiKRFhLuKxyiQ96b3q978YvjljtUswuKcL6eA=;
 b=Ja5YI5De+zx2p+OzhhmPkIyRcU3x6qfyDuxjDfLiF/vngjDE3a0ATTB00PgaU8y0YOfynb
 isXa2/ERomvE7gBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713512730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2CbqxqiKRFhLuKxyiQ96b3q978YvjljtUswuKcL6eA=;
 b=Eby7e4Bb0ywUAAR9YC+ROvR6GD9JRvN+5K3U/JyzmfGQ45neTR/tOQx/vtsk4RSyaFjADd
 GFWrUrNShxSbAKMGKKJlTuZTtYn1hR4oS/g7yQvhGNsZyF7imrczZ6eWZcbiYnzdqvqLuq
 K7se6qmYqTPrLFq3ZS0aDKsJFf7XcAE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713512730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2CbqxqiKRFhLuKxyiQ96b3q978YvjljtUswuKcL6eA=;
 b=Ja5YI5De+zx2p+OzhhmPkIyRcU3x6qfyDuxjDfLiF/vngjDE3a0ATTB00PgaU8y0YOfynb
 isXa2/ERomvE7gBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B213D136CF;
 Fri, 19 Apr 2024 07:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MxorKhkhImavWQAAD6G6ig
 (envelope-from <tiwai@suse.de>); Fri, 19 Apr 2024 07:45:29 +0000
Date: Fri, 19 Apr 2024 09:45:37 +0200
Message-ID: <8734rhvlr2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>,
 Nam Cao <namcao@linutronix.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bigeasy@linutronix.de,
 patrik.r.jakobsson@gmail.com, LKML <linux-kernel@vger.kernel.org>,
 Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
In-Reply-To: <5febb249-1d4d-4ea7-b031-1df4d14620d2@oracle.com>
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <20240418160652.68df1a86@namcao> <87ttjywxv5.wl-tiwai@suse.de>
 <a7843657-c3f6-4d2e-8c36-5541d4c52956@gmx.de>
 <878r19voks.wl-tiwai@suse.de>
 <5febb249-1d4d-4ea7-b031-1df4d14620d2@oracle.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[suse.de,gmx.de,linutronix.de,ffwll.ch,vger.kernel.org,lists.freedesktop.org,gmail.com,oracle.com,intel.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
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

On Fri, 19 Apr 2024 09:39:09 +0200,
Harshit Mogalapalli wrote:
> 
> Hi Takashi,
> 
> On 19/04/24 12:14, Takashi Iwai wrote:
> > On Thu, 18 Apr 2024 21:29:57 +0200,
> > Helge Deller wrote:
> >> 
> >> On 4/18/24 16:26, Takashi Iwai wrote:
> >>> On Thu, 18 Apr 2024 16:06:52 +0200,
> >>> Nam Cao wrote:
> >>>> 
> >>>> On 2024-04-18 Harshit Mogalapalli wrote:
> >>>>> While fuzzing 5.15.y kernel with Syzkaller, we noticed a INFO: task hung
> >>>>> bug in fb_deferred_io_work()
> >>>> 
> >>>> Which framebuffer device are you using exactly? It is possible that
> >>>> the problem is with the device driver, not core framebuffer.
> >>> 
> >>> Note that it was already known that using flush_delayed_work() caused
> >>> a problem.  See the thread of the fix patch:
> >>>     https://lore.kernel.org/all/20230129082856.22113-1-tiwai@suse.de/
> >> 
> >> Harshit reported the hung tasks with kernel v5.15-stable, and can even reproduce
> >> that issue with kernel v6.9-rc4 although it has all of your patches from
> >> that referenced mail thread applied.
> >> So, what does your statement that "it was already known that it causes problems" exactly mean?
> >> Can it be fixed? Is someone looking into fixing it?
> > 
> > My original fix was intentionally with cancel_delayed_work_sync()
> > because flush_delayed_work() didn't work.  We knew that it'd miss some
> > last-minute queued change, but it's better than crash, so it was
> > applied in that way.
> > 
> 
> Thanks for sharing these details.
> 
> > Then later on, the commit 33cd6ea9c067 changed cancel_*() to
> > flush_delayed_work() blindly, and the known problem resurfaced again.
> > 
> 
> I have reverted that commit, but still could see some other task hung
> message as shared here on other reply:
> 
> https://lore.kernel.org/all/d2485cb9-277d-4b8e-9794-02f1efababc9@oracle.com/

Yes, then it could be a different cause, I suppose.
The crash with flush_delayed_work() was a real crash, no hanging task,
IIRC.

Can you reproduce the issue with the latest Linus upstream, too?


thanks,

Takashi
