Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F698EA6E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0742D10E7B6;
	Thu,  3 Oct 2024 07:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=adamthiede.com header.i=@adamthiede.com header.b="KYwwcY/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4758510E174
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 15:29:14 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4XJdyG6SbBz9snJ;
 Wed,  2 Oct 2024 17:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adamthiede.com;
 s=MBO0001; t=1727882950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BiL/DBkNOSpHAL/rXdvRv/I6MG/Wa7UFwuCjpRXvGTM=;
 b=KYwwcY/ydmA1ufdJ7ywrIvOC+uZS4lrpT4xvGg/0dfJwYcn4i7fPiJ/4Qa/ByFzeZRtfJ3
 kewOowXBYT7OvTbVAodqh90mnTfO5/VXsK8a6Ey5ibAwf4P+e9/Bz8kSJJk8TRBl6WmVmJ
 frLfG//H/QEaaFh0jLi2HrxNO0tDwhboWvTLp1pCY5634UjTjwH2HU+w7YVfecT4eqmB3E
 o19kX825jDr6wDPo6l8IoI4ObO/QT6qOsWP42gHg811vjW+FqLgYeRmi+wC6MhrNA2mUPL
 IAz2BvezIbj3RcRog1Llxps49g3vjOk3XCqz8ZKh2X3QMDBodLdpgwIjK9edAg==
Message-ID: <06ed4527-3749-4fac-bd38-d837f1593311@adamthiede.com>
Date: Wed, 2 Oct 2024 10:28:56 -0500
MIME-Version: 1.0
Subject: Re: [PATCH v3 13/14] drm/mediatek: Support DRM plane alpha in OVL
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 =?UTF-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "djkurtz@chromium.org" <djkurtz@chromium.org>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "littlecvr@chromium.org" <littlecvr@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?WVQgU2hlbiAo5rKI5bKz6ZyGKQ==?= <Yt.Shen@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
 <20240620-igt-v3-13-a9d62d2e2c7e@mediatek.com>
 <1a3af354-bd15-4219-960e-089b6a6e673c@adamthiede.com>
 <49df03e8b982cc5ee97e09ef9545c1d138c32178.camel@mediatek.com>
 <00ebe9ca262b6a95fd726e5be06334b1e923db02.camel@mediatek.com>
 <5975b361-c1b4-4c57-89d4-0d247ae99d8c@adamthiede.com>
 <272b47f0c9e27268d29b58c341e0b48bce7e8e25.camel@mediatek.com>
Content-Language: en-US
From: Adam Thiede <me@adamthiede.com>
Autocrypt: addr=me@adamthiede.com; keydata=
 xsBNBF+n+90BCAC2ZRLVcvdXDgfY7EppN05eNor3U7/eeiNCCEIWZkYLhikUEP1ReLGBkXpK
 Pc70hfnKAKkCoth3IwhDty9WXMNU+iLNei4ieb2luW+UqluR6xIUIA+txahMU9YcjVaQTKf/
 yZWO4yl6pfBPCxC2UdPZKBAdGoi5NnE0ABFNbhBETQhhBic533lZn33ByupfI3acECnQdjgQ
 llCUpDbw4I+S/N1iFiEHcbMXH7ZB00e3IYNorZ1E9v7p++5rDY1fQ9gXpieg1vFKwSq1NJWo
 9xx336YjaTUbX0EwrdKd9l8AktA3yRjckaK5TAcwSQaDtHvhpbl4ebvPhtwHh699MroXABEB
 AAHNH0FkYW0gVGhpZWRlIDxtZUBhZGFtdGhpZWRlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIG
 FQoJCAsCBBYCAwECHgECF4AWIQQtG9pGQ7sz3tf8M/kC7fV9o/vRzgUCZL1HxQAKCRAC7fV9
 o/vRzgyRB/wLqRCvvWhQCMgvzeKvru9wcXquhb77K8H/ByLbfiT8YBuP3lZFVh0IQhgO9Ylk
 fIoOJE4V+jjxyOnO2d9xjGbvAmmR6yT0gfLzSVWqrC4k+V9MWLv43nrNzxt41dvo5j824FAl
 X+zaiRZCdO8Jtxg5Elpiop2SKLi1utX1Z8i6YZh+ccJZlchUBAGUTk+D4UjK7vUcjLWT96ya
 CtdtTfXyw36CvGOPEWfc6++Kkl/5sgej1i7biPYzu/r0vssaQYTXKSrv6Cfa3Maa89ASiTtv
 q4qmhLnJeCrPxWlRAf6LEizeBEkOasYni2u8sp4wBezEq45Ozu45sfPkqLpPolG7zsBNBF+n
 +90BCADBRt+vrToRBEG580n77S99qSEkbKD+oJtCVyovnjMNkg0K9UG68LIeCX/ezngiV1M8
 JISvw5iFOuUFqGX/1hLl9wgt/YpuIrgWOp8XxkotavTCloLDvQmufJPO1L8bnnA+WgP2YgVZ
 5MJTj/t4DI+yQgysEjsH8aurHO2uuqgJE+xK+2dy6Cl/wskuGxObksSPmmFH5PH0Joziwrtl
 61ouLE2XwKbkMgIGEKkbFgbfwz3/QuLZGBni+OOtLzXeZ9wNTW/AHUPy6S9U4F+5z6/09fVT
 tTH0cvrgAGjbASlYx2VqGONXAsxCfjulq6ryJBFlPLp949c/JTTgOojukCSbABEBAAHCwHYE
 GAEIACACGwwWIQQtG9pGQ7sz3tf8M/kC7fV9o/vRzgUCZL1H0gAKCRAC7fV9o/vRzlamCACs
 vHw+0heTm+BfC3S8DUST6889gidIIwdqBep1ByzetCph7Bq8Y8BlT5YTX0u/bSKkxCzFgeTm
 vC341Q09ST2XjLAl1ZTdzGhH9gcgYyOw34pr5fPQRJLB392mPzD8YReRzciNbhWzj+DLgeVe
 ouyfGajd6jDjkf4FEq+trQLGZhpfsKn3JnDbzBUs945D50l/vz9q/QN3qZO+H4F6g8ZeMnqo
 FOEFN26xVtdEDr+0DNFsbgKmEzs675kdAY78ZZdbEetX/FSknxJ+FK1ZW3J7Yswwulj34AXP
 LB49Mk8Ot7fo6mdt0DkV11JS9LmKxKvpY+KTlrKG+i7pVCSZvVUx
In-Reply-To: <272b47f0c9e27268d29b58c341e0b48bce7e8e25.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Oct 2024 07:37:11 +0000
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

On 10/2/24 02:50, Jason-JH Lin (林睿祥) wrote:
>> >> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> >> > > b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> >> > > index 943db4f1bd6b..4b370bc0746d 100644
>> >> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> >> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> >> > > @@ -458,8 +458,10 @@ void mtk_ovl_layer_config(struct device
>> >> > > *dev, unsigned int idx,
>> >> > >   }
>> >> > >   
>> >> > >   con = ovl_fmt_convert(ovl, fmt);
>> >> > > -if (state->base.fb && state->base.fb->format->has_alpha)
>> >> > > -con |= OVL_CON_AEN | OVL_CON_ALPHA;
>> >> > > +if (state->base.fb) {
>> >> > > +con |= OVL_CON_AEN;
>> >> > > +con |= state->base.alpha & OVL_CON_ALPHA;
>> > 
>> > Hi Adam,
>> > 
>> > Could you print out the "fmt", "state->base.fb->format-
>> >>has_alpha", "state->base.alpha" and "con" here?
>> > 
>> > pr_info("fmt:0x%x, has_alpha:0x%x, alpha:0x%x, con:0x%x \n",
>> >          fmt, state->base.fb->format->has_alpha,
>> >          state->base.alpha, con);
>> > 
>> > I'm not sure if it's the color format setting problem, maybe there
>> is
>> > something wire configuration here, such as XRGB8888 with alpha or
>> > ARGB8888 without alpha.
>> > 
>> > So I want these information to compare with my MT8188. Thanks!
>> > 
>> > Regards,
>> > Jason-JH.Lin
>> > 
>> Jason, thank you for your timely reply. I added the code you provided
>> to 
>> my patch, and now get this line on endless repeat in dmesg:
>> 
>> fmt:0x34325258, has_alpha:0x0, alpha:0xffff, con:0x2000
>> 
> 
> This function is used to configure the 4 OVL hardware layer per-frame,
> so it may be called 4 times in every VSYNC. If your display device is
> 60fps, then this line would be called N layers times in every 16.66ms.
> 
>> This line also shows up sometimes in there, but I have no idea what 
>> triggers it.
>> 
>> fmt:0x34325241, has_alpha:0x1, alpha:0xffff, con:0x21ff
>> 
> 
>  From the DRM color format definition here:
> 
> https://elixir.bootlin.com/linux/v6.11.1/source/include/uapi/drm/drm_fourcc.h#L198
> 
> We can see the MACROs:
> #define fourcc_code(a, b, c, d) \
>          (((uint32_t)(a) << 0) | ((uint32_t)(b) << 8) | \
>          ((uint32_t)(c) << 16) | ((uint32_t)(d) << 24))
> ...
> #define DRM_FORMAT_XRGB8888 fourcc_code('X', 'R', '2', '4')
> ...
> #define DRM_FORMAT_ARGB8888 fourcc_code('A', 'R', '2', '4')
> 
> Given the fourcc_code macro as previously described,
> the DRM_FORMAT_XRGB8888 macro would translate the characters
> 'X', 'R', '2', '4' into a 32-bit integer value, with each character
> occupying 8 bits in the order from least significant byte to most
> significant byte.
> 
> Here are the ASCII values for these characters:
> 
> 'A' has an ASCII value of 65 (0x41)
> 'X' has an ASCII value of 88 (0x58)
> 'R' has an ASCII value of 82 (0x52)
> '2' has an ASCII value of 50 (0x32)
> '4' has an ASCII value of 52 (0x34)
> 
> Therefore, the integer value of XR24 with hex format would be:
> 0x34325258, and AR24 would be: 0x34325241
> 
>> Does that help?
>> 
>> -Adam
> 
> Here is the translation from your logs :
> 
> fmt:0x34325258, has_alpha:0x0, alpha:0xffff, con:0x2000
> - DRM color format=XRGB8888
> - user set has_alpha=0
> - user set alpha value=0xff
> - configure value to OVL hardware=0x2000
> 
> fmt:0x34325241, has_alpha:0x1, alpha:0xffff, con:0x21ff
> - DRM color format=ARGB8888
> - user set has_alpha=1
> - user set alpha value=0xff
> - configure value to OVL hardware=0x21ff
> 
> Could you tell me in which log you can see and not see the text on the
> tty?
> 
> 
> 
> Here is some of my analysis:
> 
> In original condition:
> if (state->base.fb && state->base.fb->format->has_alpha)
> con |= OVL_CON_AEN | OVL_CON_ALPHA;
> - XRGB8888 will get con = 0x2000
> - ARGB8888 will get con = 0x21ff
> 
> In current condition:
> if (state->base.fb) {
> con |= OVL_CON_AEN;
> con |= state->base.alpha & OVL_CON_ALPHA;
> }
> - XRGB8888 will get con = 0x21ff
> - ARGB8888 will get con = 0x21ff
> 
> But then XRGB8888 will set the ignore_pixel_alpha by the code below:
> /* CONST_BLD must be enabled for XRGB formats although the alpha
> channel
>   * can be ignored, or OVL will still read the value from memory.
>   * For RGB888 related formats, whether CONST_BLD is enabled or not
> won't
>   * affect the result. Therefore we use !has_alpha as the condition.
>   */
> if ((state->base.fb && !state->base.fb->format->has_alpha) ||
>      blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
> ignore_pixel_alpha = OVL_CONST_BLEND;
> 
> Does your code include this patch?
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240620-igt-v3-3-a9d62d2e2c7e@mediatek.com/
> 
> If you have included this patch, I would then check with the OVL
> hardware designers whether the MT8173 supports OVL_CONST_BLEND.
> 
> Regards,
> Jason-JH.Lin
Jason:
That is a lot of information, and quite above my head! Thank you though.

I should note that the log items I sent you are from the "good" kernel - 
6.11 with the commit reverted. Here is a much longer set of logs: 
https://termbin.com/co6v

I've rebuild 6.11 with the log statement enabled and the "bad" behavior.
Here is a dmesg from that: https://termbin.com/xiev

These logs are both from `dmesg`.

I'm fairly certain I've built with the patch you referenced enabled. The 
kernels I run are just release kernels, not RCs or git branches or 
anything. The mainline v6.11 kernel is the one that has this problem. If 
that patch has been merged into 6.11 (which, looks like it has) then 
it's in the kernel I'm building.

- Adam Thiede
