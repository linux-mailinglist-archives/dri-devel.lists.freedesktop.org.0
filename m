Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E4D613BBD
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 17:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF0C10E311;
	Mon, 31 Oct 2022 16:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8A210E311
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 16:52:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 97A0A424A1;
 Mon, 31 Oct 2022 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
 t=1667235134; bh=o08sw/arPh96bJY89MqskY8CZh/cVSygU5C9r2EQpZ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=rHtL7wXxEfAOZDOmFm3c8i2Te+BzCJmPT+ros4QNxPqC6dwNd28WT8+dCtiW8yhm9
 p55kDgnRLlvS3bBlyUI9XmuxXHvQJHvonVJ+EVs/m1XmiuxZE2ZpgICqqkcMCLEskD
 /8jKHoY8G1YV4cg9IvKlibb1r7AIb+LfWNnVd3H6gXCBH3oUPxAtqyU2VX3h+woDyz
 4pQrREFPOo8/5I1rXed5EW/BOT5nTc4wIWXw0yeXV7tgrsWHmLPvy/Z5W/yIp5hD11
 fZkGRdngAninf4YmsgRy8Zbcax2dPiaLWnNjsW+0iW9J4cuM2MmqEt+MnyOrSALpk/
 FgcYPfwBM2arg==
Message-ID: <8cd3c731-5501-8bfb-9432-b1b9554aeb23@marcan.st>
Date: Tue, 1 Nov 2022 01:52:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] drm/format-helper: Only advertise supported formats
 for conversion
Content-Language: en-US
To: Justin Forbes <jmforbes@linuxtx.org>
References: <20221027135711.24425-1-marcan@marcan.st>
 <CAFxkdAqjdonoEgOm4Nv-mbyw3OJuuO1=3dXYyn2+yszUp13Bbg@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <CAFxkdAqjdonoEgOm4Nv-mbyw3OJuuO1=3dXYyn2+yszUp13Bbg@mail.gmail.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/11/2022 01.15, Justin Forbes wrote:
> On Thu, Oct 27, 2022 at 8:57 AM Hector Martin <marcan@marcan.st> wrote:
>>
>> drm_fb_build_fourcc_list() currently returns all emulated formats
>> unconditionally as long as the native format is among them, even though
>> not all combinations have conversion helpers. Although the list is
>> arguably provided to userspace in precedence order, userspace can pick
>> something out-of-order (and thus break when it shouldn't), or simply
>> only support a format that is unsupported (and thus think it can work,
>> which results in the appearance of a hang as FB blits fail later on,
>> instead of the initialization error you'd expect in this case).
>>
>> Add checks to filter the list of emulated formats to only those
>> supported for conversion to the native format. This presumes that there
>> is a single native format (only the first is checked, if there are
>> multiple). Refactoring this API to drop the native list or support it
>> properly (by returning the appropriate emulated->native mapping table)
>> is left for a future patch.
>>
>> The simpledrm driver is left as-is with a full table of emulated
>> formats. This keeps all currently working conversions available and
>> drops all the broken ones (i.e. this a strict bugfix patch, adding no
>> new supported formats nor removing any actually working ones). In order
>> to avoid proliferation of emulated formats, future drivers should
>> advertise only XRGB8888 as the sole emulated format (since some
>> userspace assumes its presence).
>>
>> This fixes a real user regression where the ?RGB2101010 support commit
>> started advertising it unconditionally where not supported, and KWin
>> decided to start to use it over the native format and broke, but also
>> the fixes the spurious RGB565/RGB888 formats which have been wrongly
>> unconditionally advertised since the dawn of simpledrm.
>>
>> Fixes: 6ea966fca084 ("drm/simpledrm: Add [AX]RGB210101
> 
> 
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hector Martin <marcan@marcan.st>
> 
> There is a CC for stable on here, but this patch does not apply in any
> way on 6.0 or older kernels as the fourcc bits and considerable churn
> came in with the 6.1 merge window.  You don't happen to have a
> backport of this to 6.0 do you?

v1 is probably closer to such a backport, and I offered to figure it out
on Matrix but I heard you're already working on it ;)

- Hector
