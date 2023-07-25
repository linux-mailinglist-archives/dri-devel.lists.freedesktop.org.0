Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBCA761A46
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 15:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737ED10E3CE;
	Tue, 25 Jul 2023 13:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3813 seconds by postgrey-1.36 at gabe;
 Tue, 25 Jul 2023 13:44:17 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC2910E3CE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 13:44:16 +0000 (UTC)
Received: from fsav119.sakura.ne.jp (fsav119.sakura.ne.jp [27.133.134.246])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 36PCeGQT060305;
 Tue, 25 Jul 2023 21:40:16 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav119.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav119.sakura.ne.jp);
 Tue, 25 Jul 2023 21:40:16 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav119.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 36PCeFMV060302
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 25 Jul 2023 21:40:16 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <41b72295-8eb2-8609-7494-cb8f57c4443a@I-love.SAKURA.ne.jp>
Date: Tue, 25 Jul 2023 21:40:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Revert "fbcon: Use kzalloc() in fbcon_prepare_logo()"
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>
References: <98b79fbdde69a4a203096eb9c8801045c5a055fb.1690218016.git.geert+renesas@glider.be>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <98b79fbdde69a4a203096eb9c8801045c5a055fb.1690218016.git.geert+renesas@glider.be>
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
Cc: Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 kasan-dev <kasan-dev@googlegroups.com>, linux-kernel@vger.kernel.org,
 Alexander Potapenko <glider@google.com>, dri-devel@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/07/25 2:03, Geert Uytterhoeven wrote:
> The syzbot report turned out to be a false possitive, caused by a KMSAN
> problem.  Indeed, after allocating the buffer, it is fully initialized
> using scr_memsetw().  Hence there is no point in allocating zeroed
> memory, while this does incur some overhead.

I suggest using below description, for this problem was reported by me
using a kernel built with syzbot's config file (i.e. syzbot is irrelevant).

Commit a6a00d7e8ffd ("fbcon: Use kzalloc() in fbcon_prepare_logo()") is
redundant, for the root cause that resulted in a false positive was fixed
by commit 27f644dc5a77 ("x86: kmsan: use C versions of memset16/memset32/
memset64").

