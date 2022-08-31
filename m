Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4125A7DE7
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 14:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CB710E37E;
	Wed, 31 Aug 2022 12:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 487 seconds by postgrey-1.36 at gabe;
 Wed, 31 Aug 2022 12:49:26 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA3F10E37E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 12:49:26 +0000 (UTC)
Date: Wed, 31 Aug 2022 14:41:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1661949676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b4uXfTcXJzEovtZTYHUIWB1giQlX2EAgRixcjojyZUc=;
 b=LZdL38rlXuRLJh7odxvZiaog0QghoYrz6jGF0KjU2yYKL/MFXKyslMUh+d0OKuLAd2VNla
 6UVXKPozdmKKRpcxqP59K7VolpFF3F/uDqvkEYsI0tzcEBC/zFCgmpUHD4gZ1+yqXBZjxK
 2jGfrvK9xZLLK/D4XPk/Y8OXBaRboVZdClrSAEoPlhAUXe0OjKPxY7F0mfXsX+QMtrT5vt
 256CIi0U207an6+yv7j0exucpo8IV7qVeqwKQ1+UPBOrlN3ehjYxmbCkoBsxJ8O0PUvgxk
 Q0nK/tNEDlqb+DXP43HIwzyFT4TR/rF2dOEk7Rn4j8u+bR95rcEnNHVqiGkvgQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1661949676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b4uXfTcXJzEovtZTYHUIWB1giQlX2EAgRixcjojyZUc=;
 b=noyoIPRmtDlSp2u5341YWxmR8O99J08P5w5SpEnjqzejIfnvXse6u+sK5pphZML3GgZj7N
 zLBLvVMWNB7RylCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] kernel/panic: Drop unblank_screen call
Message-ID: <Yw9W6qYo6Acg7rad@linutronix.de>
References: <20220830145004.430545-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220830145004.430545-1-daniel.vetter@ffwll.ch>
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
Cc: Petr Mladek <pmladek@suse.com>, Yangxi Xiang <xyangxi5@gmail.com>,
 Marco Elver <elver@google.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 John Ogness <john.ogness@linutronix.de>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 nick black <dankamongmen@gmail.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Luis Chamberlain <mcgrof@kernel.org>, David Gow <davidgow@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, tangmeng <tangmeng@uniontech.com>,
 Jiri Slaby <jirislaby@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-30 16:50:04 [+0200], Daniel Vetter wrote:
> Long story short, I have no idea why the direct call to unblank_screen
> survived for so long (the infrastructure to do it properly existed for
> years), nor why it wasn't removed when the console_unblank() call was
> finally added. But it makes a ton more sense to finally do that than
> not - it's just better encapsulation to go through the console
> functions instead of doing a direct call, so let's dare. Plus it
> really does not make much sense to call the only unblank
> implementation there is twice, once without, and once with appropriate
> locking.

Yup, calling it twice is redundant. 
The only difference I see is that the console implementation relies on
CONFIG_VT_CONSOLE while the former relied only on CONFIG_VT. There
should be no console output without CONFIG_VT_CONSOLE so no need to
unblank it.

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
