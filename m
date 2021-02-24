Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E9F324626
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 23:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CEC89BB2;
	Wed, 24 Feb 2021 22:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D010589BB2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 22:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=NmMzVRS0kxP0bdHCCqL7SOLVBngEB4S9wkbjjir8I38=; b=2GUNnrC9tpda1NsnhbgrIo7/nC
 QV6opykR+PbvjtNZc3e9y95X2TpnxLmHsv8uTKUunhoKqDacWrRCRfg9SGauLo4W823LrcOhFH5Yd
 NqsMdbE3eZabRZtdJaJrM51fbuEMvZIYUlIyYao2pJhvc3Ys06mDbegPhaRda28bBmbDfYp5KOrt9
 EG2enDnn9Q3onH4J1/eXng7i0Ra6udynxUtL4AQCAPiHldZwEdOX6C8BEYkfSZ3/RKPDtbzLCwDUe
 XieJUTMo4utfpBUA0AuTqHTSqLxd4SnbfjKj+fM+/wPX9e0nBVaSUPZOKjQFXJVjgBJjgTPmSJxi9
 C2NawDsA==;
Received: from [2601:1c0:6280:3f0::d05b]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF2Tq-0003Rn-G9; Wed, 24 Feb 2021 22:18:02 +0000
Subject: Re: [PATCH -next] fbdev: atyfb: always declare aty_{ld,st}_lcd()
To: Nick Desaulniers <ndesaulniers@google.com>
References: <20210224215528.822-1-rdunlap@infradead.org>
 <CAKwvOdn5mF4UQ9F1h-ZSRKUk3Yq8QS4AExV6kCFY88W3KsK72g@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a6083478-0f9b-ab8d-c93b-c5c06283865f@infradead.org>
Date: Wed, 24 Feb 2021 14:17:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdn5mF4UQ9F1h-ZSRKUk3Yq8QS4AExV6kCFY88W3KsK72g@mail.gmail.com>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/24/21 2:07 PM, Nick Desaulniers wrote:
> On Wed, Feb 24, 2021 at 1:55 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> The previously added stubs for aty_{ld,}st_lcd() make it
>> so that these functions are used regardless of the config
>> options that were guarding them, so remove the #ifdef/#endif
>> lines and make their declarations always visible.
>> This fixes build warnings that were reported by clang:
> 
> Yes, though I think GCC would warn similarly with W=1 builds as well,
> which was set for the 0day bot report.
> 

<knocks head> I should enable that until it hurts too much.

>>
>>    drivers/video/fbdev/aty/atyfb_base.c:180:6: warning: no previous prototype for function 'aty_st_lcd' [-Wmissing-prototypes]
>>    void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
>>         ^
>>    drivers/video/fbdev/aty/atyfb_base.c:180:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>>    void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
>>
>>    drivers/video/fbdev/aty/atyfb_base.c:183:5: warning: no previous prototype for function 'aty_ld_lcd' [-Wmissing-prototypes]
>>    u32 aty_ld_lcd(int index, const struct atyfb_par *par)
>>        ^
>>    drivers/video/fbdev/aty/atyfb_base.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>>    u32 aty_ld_lcd(int index, const struct atyfb_par *par)
>>
>> They should not be marked as static since they are used in
>> mach64_ct.c.
> 
> Probably don't need to be marked extern either (since that's the
> implicit default), but I don't feel strongly about it.

Yeah, I was just leaving it as it was...

> Thanks for sending a cleanup for this.
> Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> 
>>
>> Fixes: bfa5782b9caa ("fbdev: atyfb: add stubs for aty_{ld,st}_lcd()")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Nick Desaulniers <ndesaulniers@google.com>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> ---
>>  drivers/video/fbdev/aty/atyfb.h |    3 ---
>>  1 file changed, 3 deletions(-)


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
