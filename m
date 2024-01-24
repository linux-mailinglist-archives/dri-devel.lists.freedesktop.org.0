Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8402083AE4C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 17:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540F610F4E0;
	Wed, 24 Jan 2024 16:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F8710F4E0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 16:24:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4FCB1F7FC;
 Wed, 24 Jan 2024 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706113469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UsSpy/Y0Bf9swqzrSKXgT+4WoTa/jaJXCkrOsFP8epA=;
 b=en8tMvml0f49x8ahJeG6iB17vOCs4frJhU1hA/HlrV93jXxohfZuWs8codW97ukrJQX57o
 0hbB5Jx0TtoVrfxa1VRUJEbfigsPM5iInQkcXr+sezrfC5Y1gD19iclQLjzOMrKeZ/C6da
 xjRS8iYywekP7Z3wEpAei5quwuubWqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706113469;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UsSpy/Y0Bf9swqzrSKXgT+4WoTa/jaJXCkrOsFP8epA=;
 b=L1NRr150zQzCUuqoTYtbcDRPU3mYvMWZ96gFXKRqtM+SimlxKU9XnwH5aptoH972hyPFml
 hBZrPkdLfSPClxAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706113468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UsSpy/Y0Bf9swqzrSKXgT+4WoTa/jaJXCkrOsFP8epA=;
 b=bbyHOYSWYGCbSAqfNTlr7wyGKz78XSWDtMQBdODxvOywT6ygOpGuwVHKc16QbSFpVDE4BJ
 +tlmo+nfDM/UwPP/tCmnyh4U8KeaAztMfjwX5DzgC4b1DCNU0jdY04XJHA4jQL3by+q4AG
 sGZUZGYUKFJERzNkuzE4JxQDPF9VeLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706113468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UsSpy/Y0Bf9swqzrSKXgT+4WoTa/jaJXCkrOsFP8epA=;
 b=SJOfBy2XrgVuGLcWvMg76y/BhbVpgmjQQoMTzRsWbJw9/qZCaRo1auFmYt1UVBopqnBbKW
 x83pFiDicuvvFkBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2C401333E;
 Wed, 24 Jan 2024 16:24:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id o7Y8J7w5sWVtIgAAD6G6ig
 (envelope-from <vbabka@suse.cz>); Wed, 24 Jan 2024 16:24:28 +0000
Message-ID: <0a782904-bb19-4111-979a-31b52aa44ca9@suse.cz>
Date: Wed, 24 Jan 2024 17:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm for 6.8
To: Donald Carr <sirspudd@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
 <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz>
 <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=bbyHOYSW;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=SJOfBy2X
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.00 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_THREE(0.00)[3]; TO_DN_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.cz:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[10]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[gmail.com,amd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,leemhuis.info];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Score: -3.00
X-Rspamd-Queue-Id: C4FCB1F7FC
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Dave Airlie <airlied@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/24 16:31, Donald Carr wrote:
> On Wed, Jan 24, 2024 at 7:06 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>> When testing the rc1 on my openSUSE Tumbleweed desktop, I've started
>> experiencing "frozen desktop" (KDE/Wayland) issues. The symptoms are that
>> everything freezes including mouse cursor. After a while it either resolves,
>> or e.g. firefox crashes (if it was actively used when it froze) or it's
>> frozen for too long and I reboot with alt-sysrq-b. When it's frozen I can
>> still ssh to the machine, and there's nothing happening in dmesg.
>> The machine is based on Amd Ryzen 7 2700 and Radeon RX7600.
>>
>> I've bisected the merge commits so far and now will try to dig into this
>> one. I've noticed there was also a drm fixes PR later in the merge window but
>> since it was also merged into rc1 and thus didn't prevent the issue for me,
>> I guess it's not relevant here?
>>
>> Because the reproduction wasn't very deterministic I considered a commit bad
>> even if it didn't lead to completely frozen desktop and a forced reboot.
>> Even the multi-second hangs that resolved were a regression compared to 6.7
>> anyway.
>>
>> If there are known issues and perhaps candidate fixes already, please do tell.
> 
> I am experiencing the exact same symptoms; sddm (on weston) starts
> perfectly, launching a KDE wayland session freezes at various points
> (leading to plenty of premature celebration), but normally on the
> handoff from sddm to kde (replete with terminal cursor on screen)
> 
> Working perfectly as of the end of 6.7 final release, broken as of 6.8 rc1.
> Sometimes sddm can be successfully restarted via ssh, other times
> restarting sddm is slow and fails to complete.

Big thanks to Thorsten who suggested I look at the following:

https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/

https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/

Instead of further bisection I've applied Mario's revert from the first link
on top of 6.8-rc1 and the issue seems gone for me now.

Vlastimil

> Yours sincerely,
> Donald

