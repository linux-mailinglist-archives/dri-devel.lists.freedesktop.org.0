Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A5C98F563
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 19:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF18910E237;
	Thu,  3 Oct 2024 17:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=adamthiede.com header.i=@adamthiede.com header.b="niJ092Ed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0963510E081
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 15:30:12 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XKFwv5DZ7z9t3b;
 Thu,  3 Oct 2024 17:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adamthiede.com;
 s=MBO0001; t=1727969407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VQ7Tdl23liWLVAg/y+01BU3yD+eB6aWTqWBSJ+/vJng=;
 b=niJ092EdrphluiifAVW5QfjhDYDzaGEabtMnbHrD9h9MdCnkuu7PnWAHwKhDyv3X+rcfbX
 YvVBMKj8xc7+OTaxMBUS1WCOx725nmUZAiuD0Lrye9ktjNlVEMCjJ47ljT9BrwDmdOcQbC
 1DCmk8COswoyAGrpNLtIDiGvouaEuF1/FlZw0E9RFc5A5vJ7GpNGPcV/w4pGXKbjrPbdcD
 Kj8kjwRljX0+RwPAV9nqKEfhr3AmbNSE5DAwOB3VAa06egnJB64vA+bym4+PoakrYt/KqP
 Nn1Jk2oWSOWOy3KpVYQwQ0h2JhwKriOghPfzXmVoyL/zka2GqytSyI8QOXYOOA==
Message-ID: <0d93420b-4d40-479c-bd51-98963e49c4ed@adamthiede.com>
Date: Thu, 3 Oct 2024 10:29:57 -0500
MIME-Version: 1.0
From: Adam Thiede <me@adamthiede.com>
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
 <06ed4527-3749-4fac-bd38-d837f1593311@adamthiede.com>
 <f7b4c6601d648e0eba2dc66f0fe1f34ca3d29cfb.camel@mediatek.com>
Content-Language: en-US
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
In-Reply-To: <f7b4c6601d648e0eba2dc66f0fe1f34ca3d29cfb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4XKFwv5DZ7z9t3b
X-Mailman-Approved-At: Thu, 03 Oct 2024 17:37:05 +0000
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

On 10/3/24 00:17, Jason-JH Lin (林睿祥) wrote:
>> Jason:
>> That is a lot of information, and quite above my head! Thank you
>> though.
>> 
>> I should note that the log items I sent you are from the "good"
>> kernel - 
>> 6.11 with the commit reverted. Here is a much longer set of logs: 
>> https://termbin.com/co6v
>> 
>> I've rebuild 6.11 with the log statement enabled and the "bad"
>> behavior.
>> Here is a dmesg from that: https://termbin.com/xiev
>> 
> Hi Adam,
> 
> I think something wrong with your dmesg links, both logs look the same.
> We should see this log in the "bad" one:
> fmt:0x34325258, has_alpha:0x0, alpha:0xffff, con:0x2000

Apologies, I did indeed upload the same file twice. Here is the "good" one:
https://termbin.com/tb33

And the "bad" one:
https://termbin.com/yhxx

I think the fact that we're not seeing that line in the "bad" one is 
part of the problem?
> 
> But anyway, I think the reason for the downgrade is clear enough to me.
> So let's try to figure out the solution.
> 
>> These logs are both from `dmesg`.
>> 
>> I'm fairly certain I've built with the patch you referenced enabled.
>> The 
>> kernels I run are just release kernels, not RCs or git branches or 
>> anything. The mainline v6.11 kernel is the one that has this problem.
>> If 
>> that patch has been merged into 6.11 (which, looks like it has) then 
>> it's in the kernel I'm building.
> 
> Got it.
> Then OVL_CONST_BLEND might be the unsupported configuration in MT8173,
> I think we should remove the XRGB8888 format for MT8173.
> 
> Could you please try this modification and see if it'll change to use
> others supported format to show the text?
> 
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -102,12 +102,9 @@ static inline bool is_10bit_rgb(u32 fmt)
>   }
> 
>   static const u32 mt8173_formats[] = {
> -       DRM_FORMAT_XRGB8888,
>          DRM_FORMAT_ARGB8888,
> -       DRM_FORMAT_BGRX8888,
>          DRM_FORMAT_BGRA8888,
>          DRM_FORMAT_ABGR8888,
> -       DRM_FORMAT_XBGR8888,
>          DRM_FORMAT_RGB888,
>          DRM_FORMAT_BGR888,
>          DRM_FORMAT_RGB565,
> 
I've not been able to get the kernel to build with that patch; it keeps 
segfaulting at the end. I will keep attempting though.

> 
> Regards,
> Jason-JH.Lin
> 
>> 
>> - Adam Thiede

