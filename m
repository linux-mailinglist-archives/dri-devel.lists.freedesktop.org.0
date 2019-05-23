Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224BF2846A
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 19:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366F089FA0;
	Thu, 23 May 2019 17:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134D789E2A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 17:00:07 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z5so6140158lji.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 10:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ks/LH2oyTEaijoOzEMOK4qT05od1mgbLgD6IvZvC3ac=;
 b=k8Er6VPy6+5ZxO7FhTg+yomOwCBZjZiW5cOlzbux/nSCupSBxkQFuT0mdsgAgBELHE
 gpPwCLvM+zmNBtARryX0db/d+Nw9/7o2KO2Vr2i/tX+pEyj6t7TUpWJ362dbFw1/06Hw
 YXyF+WbYf+jKkS+cXInSWewC/kj3GWFopeM/tLWxTyIFsl8JRHx14WQ17Y6YxxkD0cs+
 LbGpa4aBxakY5MxRMrQYPmO8IezVy9T80nDRjF+rT4gliPng3O6VpAwefiIXb+/vkF8+
 Ib7KSc9FvXkD5qvAYF4z6b6TEmzKt8iqypudUQFq5xT2yN98q2TGZMCk/KOKjHXJ0/3I
 wItg==
X-Gm-Message-State: APjAAAWDbz5DJRcirEfsGLF/WvUcxSk1tXa0k2fhAyqhLsXS73n/0yq1
 WVhY/0xDUglu3SbkE4g0TnnX22/30cI=
X-Google-Smtp-Source: APXvYqzFylns/za/71S98YKnWmd8NTuQEfQeEyl/L51YyOAyVM75nrBZQxVqkOY3PudWsG4W7tphww==
X-Received: by 2002:a2e:6545:: with SMTP id z66mr26334328ljb.146.1558630805197; 
 Thu, 23 May 2019 10:00:05 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id n1sm11456lfl.77.2019.05.23.10.00.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 10:00:04 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id y13so4916619lfh.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 10:00:04 -0700 (PDT)
X-Received: by 2002:a19:7d42:: with SMTP id y63mr41221787lfc.54.1558630305849; 
 Thu, 23 May 2019 09:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190523100013.52a8d2a6@gandalf.local.home>
 <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
 <20190523112740.7167aba4@gandalf.local.home>
In-Reply-To: <20190523112740.7167aba4@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 May 2019 09:51:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=whFJqTOk0mSxJGeh38ZxDksgRaMrNV8hqTngiuokyJzew@mail.gmail.com>
Message-ID: <CAHk-=whFJqTOk0mSxJGeh38ZxDksgRaMrNV8hqTngiuokyJzew@mail.gmail.com>
Subject: Re: [RFC][PATCH] kernel.h: Add generic roundup_64() macro
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ks/LH2oyTEaijoOzEMOK4qT05od1mgbLgD6IvZvC3ac=;
 b=UrcFcbzEFPGggz1NPXakVDUiIg5mDqTO4045eBb7udfHenM+Veb+rBZ0tlbryVNdJc
 qa5A4P3tgF5XCLb7D69n65wDt2yEO3fr0UKE7SehnvIvMriAPEG9xpGYM5u8gpQLeOdX
 1vpQBx74HKkfDoRasFV6IFoGOt3sYNk7jzZac=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgODoyNyBBTSBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBn
b29kbWlzLm9yZz4gd3JvdGU6Cj4KPiBJIGhhdmVuJ3QgeWV0IHRlc3RlZCB0aGlzLCBidXQgd2hh
dCBhYm91dCBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nOgoKU28gdGhhdCBhdCBsZWFzdCBo
YW5kbGVzIHRoZSBjb25zdGFudCBjYXNlIHRoYXQgdGhlIG5vcm1hbCAicm91bmR1cCgpIgpjYXNl
IGFsc28gaGFuZGxlcy4KCkF0IHRoZSBzYW1lIHRpbWUsIGluIHRoZSBjYXNlIHlvdSBhcmUgdGFs
a2luZyBhYm91dCwgSSByZWFsbHkgZG8Kc3VzcGVjdCB0aGF0IHdlIGhhdmUgYSAobm9uLWNvbnN0
YW50KSBwb3dlciBvZiB0d28sIGFuZCB0aGF0IHlvdQpzaG91bGQgaGF2ZSBqdXN0IHVzZWQgInJv
dW5kX3VwKCkiIHdoaWNoIHdvcmtzIGZpbmUgcmVnYXJkbGVzcyBvZgpzaXplLCBhbmQgaXMgYWx3
YXlzIGVmZmljaWVudC4KCk9uIGEgc2xpZ2h0IHRhbmdlbnQuLiBNYXliZSB3ZSBzaG91bGQgaGF2
ZSBzb21ldGhpbmcgbGlrZSB0aGlzOgoKI2RlZmluZSBzaXplX2ZuKHgsIHByZWZpeCwgLi4uKSAo
eyAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgdHlwZW9mKHgpIF9fcmV0OyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgIHN3aXRjaCAoc2l6ZW9mKHgpKSB7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICBjYXNlIDE6IF9fcmV0ID0gcHJlZml4
IyM4KF9fVkFfQVJHU19fKTsgYnJlYWs7ICBcCiAgICAgICAgY2FzZSAyOiBfX3JldCA9IHByZWZp
eCMjMTYoX19WQV9BUkdTX18pOyBicmVhazsgXAogICAgICAgIGNhc2UgNDogX19yZXQgPSBwcmVm
aXgjIzMyKF9fVkFfQVJHU19fKTsgYnJlYWs7IFwKICAgICAgICBjYXNlIDg6IF9fcmV0ID0gcHJl
Zml4IyM2NChfX1ZBX0FSR1NfXyk7IGJyZWFrOyBcCiAgICAgICAgZGVmYXVsdDogX19yZXQgPSBw
cmVmaXgjI2JhZChfX1ZBX0FSR1NfXyk7ICAgICAgXAogICAgICAgIH0gX19yZXQ7IH0pCgojZGVm
aW5lIHR5cGVfZm4oeCwgcHJlZml4LCAuLi4pICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAogICAgICAgIHR5cGVvZih4KSBfX3JldDsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAogICAgICAgIGlmICgodHlwZW9mKHgpKS0xID4gMSkgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgX19yZXQgPSBzaXplX2ZuKHgs
IHByZWZpeCMjX3UsIF9fVkFfQVJHU19fKTsgICAgXAogICAgICAgIGVsc2UgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAg
X19yZXQgPSBzaXplX2ZuKHgsIHByZWZpeCMjX3MsIF9fVkFfQVJHU19fKTsgICAgXAogICAgICAg
IF9fcmV0OyB9KQoKd2hpY2ggd291bGQgYWxsb3cgdHlwZWQgaW50ZWdlciBmdW5jdGlvbnMgbGlr
ZSB0aGlzLiBTbyB5b3UgY291bGQgZG8Kc29tZXRoaW5nIGxpa2UKCiAgICAgI2RlZmluZSByb3Vu
ZF91cCh4LCB5KSBzaXplX2ZuKHgsIHJvdW5kX3VwX3NpemUsIHgsIHkpCgphbmQgdGhlbiB5b3Ug
ZGVmaW5lIGZ1bmN0aW9ucyBmb3Igcm91bmRfdXBfc2l6ZTgvMTYvMzIvNjQgKGFuZCB5b3UKaGF2
ZSB0b2kgZGVjbGFyZSAtIGJ1dCBub3QgZGVmaW5lIC0gcm91bmRfdXBfc2l6ZWJhZCgpKS4KCk9m
IGNvdXJzZSwgeW91IHByb2JhYmx5IHdhbnQgdGhlIHVzdWFsICJhdCBsZWFzdCB1c2UgJ2ludCci
IHNlbWFudGljcywKaW4gd2hpY2ggY2FzZSB0aGUgInR5cGUiIHNob3VsZCBiZSAiKHgpKzAiOgoK
ICAgICAjZGVmaW5lIHJvdW5kX3VwKHgsIHkpIHNpemVfZm4oKHgpKzAsIHJvdW5kX3VwX3NpemUs
IHgsIHkpCgogYW5kIHRoZSA4LWJpdCBhbmQgMTYtYml0IGNhc2VzIHdpbGwgbmV2ZXIgYmUgdXNl
ZC4KCldlIGhhdmUgYSBsb3Qgb2YgY2FzZXMgd2hlcmUgd2UgZW5kIHVwIHVzaW5nICJ0eXBlIG92
ZXJsb2FkaW5nIiBieQpzaXplLiBUaGUgbW9zdCBleHBsaWNpdCBjYXNlIGlzIHBlcmhhcHMgImdl
dF91c2VyKCkiIGFuZCAicHV0X3VzZXIoKSIsCmJ1dCB0aGlzIHdob2xlIHJvdW5kX3VwIHRoaW5n
IGlzIGFub3RoZXIgZXhhbXBsZS4KCk1heWJlIHdlIG5ldmVyIHJlYWxseSBjYXJlIGFib3V0ICJj
aGFyIiBhbmQgInNob3J0IiwgYW5kIGFsd2F5cyB3YW50Cmp1c3QgdGhlICJpbnQtdnMtbG9uZy12
cy1sb25nbG9uZyI/IFRoYXQgd291bGQgbWFrZSB0aGUgY2FzZXMgc2ltcGxlcgooMzIgYW5kIDY0
KS4gQW5kIG1heWJlIHdlIG5ldmVyIGNhcmUgYWJvdXQgc2lnbi4gQnV0IHdlIGNvdWxkIHRyeSB0
bwpoYXZlIHNvbWUgdW5pZmllZCBoZWxwZXIgbW9kZWwgbGlrZSB0aGUgYWJvdmUuLgoKICAgICAg
ICAgICAgICAgICAgTGludXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
