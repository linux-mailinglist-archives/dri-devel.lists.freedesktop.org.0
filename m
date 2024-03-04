Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134A5870E73
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 22:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCC110E394;
	Mon,  4 Mar 2024 21:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U3zf6rNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B430010E394
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 21:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E1Q94e5EFIOf0PrpzPHEslcyP80xmoYX4L90KOBiz38=; b=U3zf6rNlW1YXMwSvvbRZuUDWRZ
 Cl37Wj5eZvXsTJsanH+iaAWqoEpXQDzXg+9Jqeq3cPF/ouGZHidQuGM+vxalE6c9nvoRpmjIQQoLe
 XO624T7oaQmd6onbC46xoce6QfY32hMNsd+sVDoNSPIqYMZejVixOm382IdZui/m1xK256g4KtJX2
 b+vJzUXnP1dfmdlDuHlAMGxmdXHM14L9kx86q2VfGqsdfoN7j+pg4QBfPYzYKTrLHSse/A70H6wyT
 wf5bXJfau6sm74EEXWM7E9P6xSbreBxezugkZbV+iqq9+wz95PxZ3RDEySFNzCCxjxMjpqNV3pEvi
 d4Tky9dg==;
Received: from [187.90.173.251] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rhG5h-0060jN-5a; Mon, 04 Mar 2024 22:43:21 +0100
Message-ID: <15015345-3068-2fb8-aa38-f32acf27e1d0@igalia.com>
Date: Mon, 4 Mar 2024 18:43:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC] How to test panic handlers, without crashing the kernel
Content-Language: en-US
To: John Ogness <john.ogness@linutronix.de>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Lukas Wunner <lukas@wunner.de>,
 Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
References: <266579a9-fde6-40ff-b13d-fb2312db406c@redhat.com>
 <87edcpn1l3.fsf@jogness.linutronix.de>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <87edcpn1l3.fsf@jogness.linutronix.de>
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

On 04/03/2024 18:12, John Ogness wrote:
> [...]
>> The second question is how to simulate a panic context in a
>> non-destructive way, so we can test the panic notifiers in CI, without
>> crashing the machine.
> 
> I'm wondering if a "fake panic" can be implemented that quiesces all the
> other CPUs via NMI (similar to kdb) and then calls the panic
> notifiers. And finally releases everything back to normal. That might
> produce a fairly realistic panic situation and should be fairly
> non-destructive (depending on what the notifiers do and how long they
> take).
> 

Hi Jocelyn / John,

one concern here is that the panic notifiers are kind of a no man's
land, so we can have very simple / safe ones, while others are
destructive in nature.

An example of a good behaving notifier that is destructive is the
Hyper-V one, that destroys an essential host-guest interface (called
"vmbus connection"). What happens if we trigger this one just for
testing purposes in a debugfs interface? Likely the guest would die...

[+CCing Michael Kelley here since he seems interested in panic and is
also expert in Hyper-V, just in case my example is bogus.]

So, maybe the problem could be split in 2: the non-notifiers portion of
the panic path, and the the notifiers; maybe restricting the notifiers
you'd run is a way to circumvent the risks, like if you could pass a
list of the specific notifiers you aim to test, this could be
interesting. Let's see what the others think and thanks for your work in
the DRM panic notifier =)

Cheers,


Guilherme
