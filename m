Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028B2533896
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 10:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A35E10E497;
	Wed, 25 May 2022 08:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A7D10E3FD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 08:35:38 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4L7PXP3Th5z9sRp;
 Wed, 25 May 2022 10:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1653467733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rADouJORv9g2Oxs3F4jToXB+/X2s/QtwoVMYy8DTpJ0=;
 b=J+TD0ww3qfaAugmTQYYClza3pWoiWEq3VlcgMedVL7i9JkOfL8Ixe34qHiVVbAQzSs5ebt
 AY7RH6VJIL08Mf/n1lmXJvkomY88DqnSeULXcEZJIKaXoz+xF7TBxa1dp5s6aIBA6/q+LM
 iRre2Thx/mQi8pG4oXAJA/HW8XWoPwgGuzgqs4uNCPr6uZApTbjQ5ZD/FMXfvWc0gGPZcU
 lq+LqaT35e2FVuT3n4BU309agTnHDFO3vnRbQZELrc4EYAx+tBtKKBhchOpaqWBoJQsBe7
 D+vV/DY/Da5ZAnbzkYjHp0BIcIygNZMPevscGxcGFqLNqjVgVhUHFLHJ5+jDtQ==
Message-ID: <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
Date: Wed, 25 May 2022 10:35:32 +0200
MIME-Version: 1.0
Subject: Re: How should "max bpc" KMS property work?
Content-Language: en-CA
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <20220525102850.5a70e58f@eldfell>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20220525102850.5a70e58f@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2b2b071ff5426a010f8
X-MBO-RS-META: 853w6u9dcech894feyt85hm8j1wxseux
X-Rspamd-Queue-Id: 4L7PXP3Th5z9sRp
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-25 09:28, Pekka Paalanen wrote:
> On Mon, 23 May 2022 13:54:50 +0200
> Sebastian Wick <sebastian.wick@redhat.com> wrote:
> 
>> I was always under the impression that if you do an atomic commit
>> without changing any properties that it won't result in a mode set
>> which would clearly make the current behavior a bug.
> 
> This is a very good point.
> 
> If one does an atomic commit (even with ALLOW_MODESET) but has changed
> no KMS property at all, there should be no change in KMS hardware
> state.

The problem then becomes how to change the effective bpc to the maximum value?


> Also KMS properties with "auto" value are probably favoring "the
> best/highest possible" instead of "keep current state", which raises the
> question of how such KMS properties should be initialized when the
> firmware has chosen a different value from what "auto" in the driver
> would. At the same time, this should not regress old userspace that
> never sets a KMS property because the userspace was written before the
> kernel exposed the property and the only thing happening was the driver
> automatically choosing the value. Actually, the definition of "auto"
> therefore is neither; it is "whatever the driver happened to be doing
> before exposing this property".
> 
> Another question is how userspace can tell the kernel that it wants to
> keep the current hardware state. That's the Plymouth problem.
> 
> Mind that "max bpc" is *always* in auto. It's only an upper limit, with
> the assumption that the driver can choose less.

It seems to me like the "max bpc" property is just kind of bad API, and trying to tweak it to cater to more use cases as we discover them will take us down a rabbit hole. It seems better to replace it with new properties which allow user space to determine the current effective bpc and to explicitly control it.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
