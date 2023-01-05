Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD6C65ECB2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A4110E712;
	Thu,  5 Jan 2023 13:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AF110E712
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:17:45 +0000 (UTC)
Received: from fsav313.sakura.ne.jp (fsav313.sakura.ne.jp [153.120.85.144])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 305DHOub054514;
 Thu, 5 Jan 2023 22:17:24 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav313.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp);
 Thu, 05 Jan 2023 22:17:24 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp)
Received: from [192.168.1.20] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 305DHOkc054511
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 5 Jan 2023 22:17:24 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <032386fc-fffb-1f17-8cfd-94b35b6947ee@I-love.SAKURA.ne.jp>
Date: Thu, 5 Jan 2023 22:17:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] fbcon: Use kzalloc() in fbcon_prepare_logo()
Content-Language: en-US
To: Alexander Potapenko <glider@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev <kasan-dev@googlegroups.com>, Helge Deller <deller@gmx.de>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>
References: <cad03d25-0ea0-32c4-8173-fd1895314bce@I-love.SAKURA.ne.jp>
 <CAMuHMdUH4CU9EfoirSxjivg08FDimtstn7hizemzyQzYeq6b6g@mail.gmail.com>
 <86bdfea2-7125-2e54-c2c0-920f28ff80ce@I-love.SAKURA.ne.jp>
 <CAG_fn=VJrJDNSea6DksLt5uBe_sDu0+8Ofg+ifscOyDdMKj3XQ@mail.gmail.com>
 <Y7a6XkCNTkxxGMNC@phenom.ffwll.local>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <Y7a6XkCNTkxxGMNC@phenom.ffwll.local>
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

On 2023/01/05 20:54, Daniel Vetter wrote:
>>> . Plain memset() in arch/x86/include/asm/string_64.h is redirected to __msan_memset()
>>> but memsetXX() are not redirected to __msan_memsetXX(). That is, memory initialization
>>> via memsetXX() results in KMSAN's shadow memory being not updated.
>>>
>>> KMSAN folks, how should we fix this problem?
>>> Redirect assembly-implemented memset16(size) to memset(size*2) if KMSAN is enabled?
>>>
>>
>> I think the easiest way to fix it would be disable memsetXX asm
>> implementations by something like:
>>
>> -------------------------------------------------------------------------------------------------
>> diff --git a/arch/x86/include/asm/string_64.h b/arch/x86/include/asm/string_64.h
>> index 888731ccf1f67..5fb330150a7d1 100644
>> --- a/arch/x86/include/asm/string_64.h
>> +++ b/arch/x86/include/asm/string_64.h
>> @@ -33,6 +33,7 @@ void *memset(void *s, int c, size_t n);
>>  #endif
>>  void *__memset(void *s, int c, size_t n);
>>
>> +#if !defined(__SANITIZE_MEMORY__)
>>  #define __HAVE_ARCH_MEMSET16
>>  static inline void *memset16(uint16_t *s, uint16_t v, size_t n)
>>  {
>> @@ -68,6 +69,7 @@ static inline void *memset64(uint64_t *s, uint64_t
>> v, size_t n)
>>                      : "memory");
>>         return s;
>>  }
>> +#endif
> 
> So ... what should I do here? Can someone please send me a revert or patch
> to apply. I don't think I should do this, since I already tossed my credit
> for not looking at stuff carefully enough into the wind :-)
> -Daniel
> 
>>
>>  #define __HAVE_ARCH_MEMMOVE
>>  #if defined(__SANITIZE_MEMORY__) && defined(__NO_FORTIFY)
>> -------------------------------------------------------------------------------------------------
>>
>> This way we'll just pick the existing C implementations instead of
>> reinventing them.
>>

I'd like to avoid touching per-arch asm/string.h files if possible.

Can't we do like below (i.e. keep asm implementations as-is, but
automatically redirect to __msan_memset()) ? If yes, we could move all
__msan_*() redirection from per-arch asm/string.h files to the common
linux/string.h file?

diff --git a/include/linux/string.h b/include/linux/string.h
index c062c581a98b..403813b04e00 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -360,4 +360,15 @@ static __always_inline size_t str_has_prefix(const char *str, const char *prefix
 	return strncmp(str, prefix, len) == 0 ? len : 0;
 }
 
+#if defined(__SANITIZE_MEMORY__) && defined(__NO_FORTIFY)
+#undef memset
+#define memset(dest, src, count) __msan_memset((dest), (src), (count))
+#undef memset16
+#define memset16(dest, src, count) __msan_memset((dest), (src), (count) << 1)
+#undef memset32
+#define memset32(dest, src, count) __msan_memset((dest), (src), (count) << 2)
+#undef memset64
+#define memset64(dest, src, count) __msan_memset((dest), (src), (count) << 3)
+#endif
+
 #endif /* _LINUX_STRING_H_ */


