Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCEE872600
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 18:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99691128F7;
	Tue,  5 Mar 2024 17:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="O19GfPtP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B180F112C15
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 17:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OryvIzzC78fLNiJM5tDS7CTV+mpBOEM5K+ePV0wOwPk=; b=O19GfPtPID2BGaSmWQCLguZxAP
 D/yNCoLEHrezKsM6KVaOVznHugp7dZmQ//e7ggcsbplUqqJhCH9pwRbPA2g5ah3vBLXkEvj8cnrLT
 GZIflT5D80XVUnT5yHDwOEFM61Sh7cBIDL2lgOU6UnE3cMTLesLzlB7g0lBN28hTq9S8psqLDCqDu
 JbIGr4gg1lLFLK/3ZwSNYVHoyy1kJ9Pw0ArrN5VcBG2qxXVKYEE7EofhVyW+SFfa43ofdKOiKkgpQ
 CGLoWX/ZYhjCMuCm67HuyOEY02WxXXv/xCetL/4B7xOdQEIpsBlYsZlfUzD/E80ly2gmCb+xnPYxJ
 zgphCLag==;
Received: from [187.90.173.251] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rhYwM-006KfD-MC; Tue, 05 Mar 2024 18:50:58 +0100
Message-ID: <3d0c4180-aa6d-4519-d6d8-8f16b98587dc@igalia.com>
Date: Tue, 5 Mar 2024 14:50:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC] How to test panic handlers, without crashing the kernel
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Michael Kelley <mhklinux@outlook.com>,
 John Ogness <john.ogness@linutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Lukas Wunner <lukas@wunner.de>,
 Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
References: <266579a9-fde6-40ff-b13d-fb2312db406c@redhat.com>
 <87edcpn1l3.fsf@jogness.linutronix.de>
 <15015345-3068-2fb8-aa38-f32acf27e1d0@igalia.com>
 <SN6PR02MB4157AF2E765F7ED3B9487351D4222@SN6PR02MB4157.namprd02.prod.outlook.com>
 <d1d2093c-72a3-4f64-9a8f-9844dc38f0c5@redhat.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <d1d2093c-72a3-4f64-9a8f-9844dc38f0c5@redhat.com>
Content-Type: text/plain; charset=UTF-8
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

On 05/03/2024 13:52, Jocelyn Falempe wrote:
> [...]
> Or maybe have two lists of panic notifiers, the safe and the destructive 
> list. So in case of fake panic, we can only call the safe notifiers.
> 

I tried something like that:
https://lore.kernel.org/lkml/20220427224924.592546-1-gpiccoli@igalia.com/

There were many suggestions, a completely refactor of the idea (panic
lists are not really seen as reliable things).

Given that, I'm not really sure splitting in lists gonna fly; maybe
restricting the test infrastructure to drm_panic plus some paths of
panic would be enough for this debugfs interface, in principle? I mean,
to unblock your work on the drm panic stuff.

Cheers,


Guilherme
