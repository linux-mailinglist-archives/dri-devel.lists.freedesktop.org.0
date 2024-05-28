Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F828D2717
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 23:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F25510E52C;
	Tue, 28 May 2024 21:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="eKKTTVsO";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/F8BJdjs";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="eKKTTVsO";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/F8BJdjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11FF10E452;
 Tue, 28 May 2024 21:33:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D3A0D2045D;
 Tue, 28 May 2024 21:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1716931978;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y271KPi+tCyRmzKrDCwqISkFoY5mXolXM/ZhCYK6JPs=;
 b=eKKTTVsOye+aPNKRzZ122169aw7bdpQ6y9COLPAXegCVrG5iSFsKe8NmabTrtfzVmJzDv5
 Ne2IuD4WBUJ9KFI2/n+OeUSe50fsuI871CPGI9BXPcJJwGF3yCfpaEpNu/AstvRM8I1NMM
 jJQ5ZoiYnmImiq61l3/GUCVuppLSong=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1716931978;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y271KPi+tCyRmzKrDCwqISkFoY5mXolXM/ZhCYK6JPs=;
 b=/F8BJdjswiKMjas+DwonGKmjEG3HjzGZ3ZDNGxX+svqxoF5eTGLjTUR3XiAExDuzESXHh8
 mDMDQki+foK9VsAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1716931978;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y271KPi+tCyRmzKrDCwqISkFoY5mXolXM/ZhCYK6JPs=;
 b=eKKTTVsOye+aPNKRzZ122169aw7bdpQ6y9COLPAXegCVrG5iSFsKe8NmabTrtfzVmJzDv5
 Ne2IuD4WBUJ9KFI2/n+OeUSe50fsuI871CPGI9BXPcJJwGF3yCfpaEpNu/AstvRM8I1NMM
 jJQ5ZoiYnmImiq61l3/GUCVuppLSong=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1716931978;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y271KPi+tCyRmzKrDCwqISkFoY5mXolXM/ZhCYK6JPs=;
 b=/F8BJdjswiKMjas+DwonGKmjEG3HjzGZ3ZDNGxX+svqxoF5eTGLjTUR3XiAExDuzESXHh8
 mDMDQki+foK9VsAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB93113A5D;
 Tue, 28 May 2024 21:32:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jMu/KYpNVmbCTwAAD6G6ig
 (envelope-from <dsterba@suse.cz>); Tue, 28 May 2024 21:32:58 +0000
Date: Tue, 28 May 2024 23:32:49 +0200
From: David Sterba <dsterba@suse.cz>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 6dc544b66971c7f9909ff038b62149105272d26a
Message-ID: <20240528213249.GH8631@twin.jikos.cz>
References: <202405290242.YsJ4ENkU-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405290242.YsJ4ENkU-lkp@intel.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Level: 
X-Spamd-Result: default: False [-3.58 / 50.00]; BAYES_HAM(-2.58)[98.11%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 HAS_REPLYTO(0.30)[dsterba@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[14]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 REPLYTO_ADDR_EQ_FROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto]
X-Spam-Score: -3.58
X-Spam-Flag: NO
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
Reply-To: dsterba@suse.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 29, 2024 at 02:19:47AM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 6dc544b66971c7f9909ff038b62149105272d26a  Add linux-next specific files for 20240528
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/oe-kbuild-all/202405282036.maEDO54Q-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202405282148.jaF0FLhu-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202405282308.UEzt6hqC-lkp@intel.com
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
> drivers/dma-buf/udmabuf.c:45:(.text+0x140): undefined reference to `vmf_insert_pfn'
> fs/btrfs/fiemap.c:822:26: warning: 'last_extent_end' may be used uninitialized [-Wmaybe-uninitialized]

The report says it's gcc 13.2, that one I use (and expect others as well
as it's a recent one) and we also have -Wmaybe-uninitialized enabled in
fs/btrfs/ to catch such warnings. Yet this is reported on mips64, is
there something special about that compiler+architecture?

The warning is IMO a false positive, the maybe-uninitialized variable is
passed as pointer but initialized on success and never used on failure.
We can safely silence the warning by initializing the variable to 0 but
this may be pointing to a problem with mips64+gcc namely because other
compiler+host combinations do not warn abou that.
