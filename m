Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C170D90C70F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 12:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B8410E631;
	Tue, 18 Jun 2024 10:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="Y1IYSpUA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279C010E624;
 Tue, 18 Jun 2024 10:33:39 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1718706816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptTO7D1wdxlQ3ntloeWD3U/gouzYuciZ4yKoIe8LFNs=;
 b=Y1IYSpUA/oo+qzTXgqv3/KSgqHPOZL+GwNcCb7yLUHH5hfsfxEPJDgciAGUW9LXmgbJPre
 1Z3LKCMNZ+5hGSlCEg9UKyVCCpoDXepZnBCyKeBlnZ7UkCJUTgarQEF75ByE4riLLv5PhY
 I1VZBSJ9/pLfKtozncYDU7QXR2TbhEPisrOFzOT6z8Fjx0raEdJee0QCyvm1ni9N2xxrPT
 hFG/Nt6wiL6v8A1nHQumExH5VbOPcV9jkceND+dfV0uXMLSnY3brknya0fJ+PkynfGeb3i
 knsPrde0yz2ZT3BKbQTckMTo9+1mrRu7fqEqVKVm5vc8fHyzxlsFZ8ngLRTlpQ==
Date: Tue, 18 Jun 2024 12:33:36 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 linux-kernel@vger.kernel.org, Philip Muller <philm@manjaro.org>, Oliver
 Smith <ollieparanoid@postmarketos.org>, Daniel Smith <danct12@disroot.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/lima: Mark simple_ondemand governor as softdep
In-Reply-To: <20240618-great-hissing-skink-b7950e@houat>
References: <fdaf2e41bb6a0c5118ff9cc21f4f62583208d885.1718655070.git.dsimic@manjaro.org>
 <CAKGbVbs8VmCXVOHbhkCYEHNJiKWwy10p0SV9J09h2h7xjs7hUg@mail.gmail.com>
 <CAKGbVbsM4rCprWdp+aGXE-pvCkb6N7weUyG2z4nXqFpv+y=LrA@mail.gmail.com>
 <20240618-great-hissing-skink-b7950e@houat>
Message-ID: <4813a6885648e5368028cd822e8b2381@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

Hello Qiang and Maxime,

On 2024-06-18 10:13, Maxime Ripard wrote:
> On Tue, Jun 18, 2024 at 04:01:26PM GMT, Qiang Yu wrote:
>> On Tue, Jun 18, 2024 at 12:33 PM Qiang Yu <yuq825@gmail.com> wrote:
>> >
>> > I see the problem that initramfs need to build a module dependency chain,
>> > but lima does not call any symbol from simpleondemand governor module.
>> > softdep module seems to be optional while our dependency is hard one,
>> > can we just add MODULE_INFO(depends, _depends), or create a new
>> > macro called MODULE_DEPENDS()?

I had the same thoughts, because softdeps are for optional module
dependencies, while in this case it's a hard dependency.  Though,
I went with adding a softdep, simply because I saw no better option
available.

>> This doesn't work on my side because depmod generates modules.dep
>> by symbol lookup instead of modinfo section. So softdep may be our 
>> only
>> choice to add module dependency manually. I can accept the softdep
>> first, then make PM optional later.

I also thought about making devfreq optional in the Lima driver,
which would make this additional softdep much more appropriate.
Though, I'm not really sure that's a good approach, because not
having working devfreq for Lima might actually cause issues on
some devices, such as increased power consumption.

In other words, it might be better to have Lima probing fail if
devfreq can't be initialized, rather than having probing succeed
with no working devfreq.  Basically, failed probing is obvious,
while a warning in the kernel log about no devfreq might easily
be overlooked, causing regressions on some devices.

> It's still super fragile, and depends on the user not changing the
> policy. It should be solved in some other, more robust way.

I see, but I'm not really sure how to make it more robust?  In
the end, some user can blacklist the simple_ondemand governor
module, and we can't do much about it.

Introducing harddeps alongside softdeps would make sense from
the design standpoint, but the amount of required changes wouldn't
be trivial at all, on various levels.
