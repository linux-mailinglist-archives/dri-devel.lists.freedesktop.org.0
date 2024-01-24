Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3983ACD0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 16:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D184510F784;
	Wed, 24 Jan 2024 15:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 485 seconds by postgrey-1.36 at gabe;
 Wed, 24 Jan 2024 15:10:24 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD18510F78C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 15:10:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FB6F2230C;
 Wed, 24 Jan 2024 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706108501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DajeaSEzTnB3arsXBMutuR8UGsQIe50M5bLSZDHRxaE=;
 b=osrFdeJe+V6nUTIDy8yaKQkD/1OyHRoFPIrq5mH+nFwR3NPWP87uEhJxWITLIarWKRjscI
 vOJNb4uTZTLyaelqM2HzekkgMbmgipIQlJOuXVy6b3pzJwMyHWS4Ez/EIC0tPwi0G/wUtp
 Bs33w+ShJDAV+ClFEN0XVInOrNS3/C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706108501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DajeaSEzTnB3arsXBMutuR8UGsQIe50M5bLSZDHRxaE=;
 b=1zn3uQloqriIk5Ye9paPiS8PDE/zNsCqDYI5Ok7l4OKEcC/C1Ug/OGu+0ztnu3FYdMhBTC
 XUfp843i6MaM7UDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706108501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DajeaSEzTnB3arsXBMutuR8UGsQIe50M5bLSZDHRxaE=;
 b=osrFdeJe+V6nUTIDy8yaKQkD/1OyHRoFPIrq5mH+nFwR3NPWP87uEhJxWITLIarWKRjscI
 vOJNb4uTZTLyaelqM2HzekkgMbmgipIQlJOuXVy6b3pzJwMyHWS4Ez/EIC0tPwi0G/wUtp
 Bs33w+ShJDAV+ClFEN0XVInOrNS3/C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706108501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DajeaSEzTnB3arsXBMutuR8UGsQIe50M5bLSZDHRxaE=;
 b=1zn3uQloqriIk5Ye9paPiS8PDE/zNsCqDYI5Ok7l4OKEcC/C1Ug/OGu+0ztnu3FYdMhBTC
 XUfp843i6MaM7UDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BBD513786;
 Wed, 24 Jan 2024 15:01:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Zwv7DVUmsWXwBgAAD6G6ig
 (envelope-from <vbabka@suse.cz>); Wed, 24 Jan 2024 15:01:41 +0000
Message-ID: <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz>
Date: Wed, 24 Jan 2024 16:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm for 6.8
To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-3.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.09
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/24 20:49, Dave Airlie wrote:
> Hi Linus,
> 
> This is the main drm pull request for 6.8.

When testing the rc1 on my openSUSE Tumbleweed desktop, I've started
experiencing "frozen desktop" (KDE/Wayland) issues. The symptoms are that
everything freezes including mouse cursor. After a while it either resolves,
or e.g. firefox crashes (if it was actively used when it froze) or it's
frozen for too long and I reboot with alt-sysrq-b. When it's frozen I can
still ssh to the machine, and there's nothing happening in dmesg.
The machine is based on Amd Ryzen 7 2700 and Radeon RX7600.

I've bisected the merge commits so far and now will try to dig into this
one. I've noticed there was also a drm fixes PR later in the merge window but
since it was also merged into rc1 and thus didn't prevent the issue for me,
I guess it's not relevant here?

Because the reproduction wasn't very deterministic I considered a commit bad
even if it didn't lead to completely frozen desktop and a forced reboot.
Even the multi-second hangs that resolved were a regression compared to 6.7
anyway.

If there are known issues and perhaps candidate fixes already, please do tell.

Thanks,
Vlastimil

git bisect start '--first-parent'
# status: waiting for both good and bad commits
# bad: [6613476e225e090cc9aad49be7fa504e290dd33d] Linux 6.8-rc1
git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
# status: waiting for good commit(s), bad commit known
# good: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
git bisect good 0dd3ee31125508cd67f7e7172247f05b7fd1753a
# bad: [b4442cadca2f97239c8b80f64af7937897b867b1] Merge tag 'x86_tdx_for_6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad b4442cadca2f97239c8b80f64af7937897b867b1
# bad: [c4c6044d35f06a93115e691e79436839962c203e] Merge tag 'for-linus' of git://git.armlinux.org.uk/~rmk/linux-arm
git bisect bad c4c6044d35f06a93115e691e79436839962c203e
# bad: [42bff4d0f9b9c8b669c5cef25c5116f41eb45c6b] Merge tag 'pwm/for-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm
git bisect bad 42bff4d0f9b9c8b669c5cef25c5116f41eb45c6b
# good: [32720aca900b226653c843bb4e06b8125312f214] Merge tag 'fsnotify_for_v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs
git bisect good 32720aca900b226653c843bb4e06b8125312f214
# good: [5bad490858c3ebdbb47e622e8f9049f828d2abba] Merge tag 'soc-defconfig-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 5bad490858c3ebdbb47e622e8f9049f828d2abba
# good: [70d201a40823acba23899342d62bc2644051ad2e] Merge tag 'f2fs-for-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs
git bisect good 70d201a40823acba23899342d62bc2644051ad2e
# bad: [141d9c6e003b806d8faeddeec7053ee2691ea61a] Merge tag 'firewire-updates-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394
git bisect bad 141d9c6e003b806d8faeddeec7053ee2691ea61a
# bad: [61f4c3e6711477b8a347ca5fe89e5e6613e0a147] Merge tag 'linux-watchdog-6.8-rc1' of git://www.linux-watchdog.org/linux-watchdog
git bisect bad 61f4c3e6711477b8a347ca5fe89e5e6613e0a147
# bad: [7912a6391f3ee7eb9f9a69227a209d502679bc0c] Merge tag 'sound-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
git bisect bad 7912a6391f3ee7eb9f9a69227a209d502679bc0c
# bad: [cf65598d5909acf5e7b7dc9e21786e386356bc81] Merge tag 'drm-next-2024-01-10' of git://anongit.freedesktop.org/drm/drm
git bisect bad cf65598d5909acf5e7b7dc9e21786e386356bc81
# first bad commit: [cf65598d5909acf5e7b7dc9e21786e386356bc81] Merge tag 'drm-next-2024-01-10' of git://anongit.freedesktop.org/drm/drm






