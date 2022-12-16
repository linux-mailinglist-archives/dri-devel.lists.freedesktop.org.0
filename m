Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B15D64EC92
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 15:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777DD10E11D;
	Fri, 16 Dec 2022 14:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700C310E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 14:03:26 +0000 (UTC)
Received: from fsav315.sakura.ne.jp (fsav315.sakura.ne.jp [153.120.85.146])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 2BGE30pY022162;
 Fri, 16 Dec 2022 23:03:00 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav315.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav315.sakura.ne.jp);
 Fri, 16 Dec 2022 23:03:00 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav315.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 2BGE2xnN022155
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 16 Dec 2022 23:03:00 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <86bdfea2-7125-2e54-c2c0-920f28ff80ce@I-love.SAKURA.ne.jp>
Date: Fri, 16 Dec 2022 23:02:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] fbcon: Use kzalloc() in fbcon_prepare_logo()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev <kasan-dev@googlegroups.com>
References: <cad03d25-0ea0-32c4-8173-fd1895314bce@I-love.SAKURA.ne.jp>
 <CAMuHMdUH4CU9EfoirSxjivg08FDimtstn7hizemzyQzYeq6b6g@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAMuHMdUH4CU9EfoirSxjivg08FDimtstn7hizemzyQzYeq6b6g@mail.gmail.com>
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
Cc: DRI <dri-devel@lists.freedesktop.org>, Helge Deller <deller@gmx.de>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/12/15 18:36, Geert Uytterhoeven wrote:
> The next line is:
> 
>         scr_memsetw(save, erase, array3_size(logo_lines, new_cols, 2));
> 
> So how can this turn out to be uninitialized later below?
> 
>         scr_memcpyw(q, save, array3_size(logo_lines, new_cols, 2));
> 
> What am I missing?

Good catch. It turned out that this was a KMSAN problem (i.e. a false positive report).

On x86_64, scr_memsetw() is implemented as

        static inline void scr_memsetw(u16 *s, u16 c, unsigned int count)
        {
                memset16(s, c, count / 2);
        }

and memset16() is implemented as

        static inline void *memset16(uint16_t *s, uint16_t v, size_t n)
        {
        	long d0, d1;
        	asm volatile("rep\n\t"
        		     "stosw"
        		     : "=&c" (d0), "=&D" (d1)
        		     : "a" (v), "1" (s), "0" (n)
        		     : "memory");
        	return s;
        }

. Plain memset() in arch/x86/include/asm/string_64.h is redirected to __msan_memset()
but memsetXX() are not redirected to __msan_memsetXX(). That is, memory initialization
via memsetXX() results in KMSAN's shadow memory being not updated.

KMSAN folks, how should we fix this problem?
Redirect assembly-implemented memset16(size) to memset(size*2) if KMSAN is enabled?

