Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A88873A6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1062C6ED2D;
	Fri,  9 Aug 2019 08:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D3E6ECDB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 23:03:05 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id b13so44929346pfo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 16:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w4PN33Lkfcqftf0QvPt6llyr/NqrBtuKXP5AjG4sS2I=;
 b=nFWcV/qAEaVEs0e/dG1aMtoNKNQWwwmse2ny6Sc5ZyiDLioubkqssPyGxxnfy80TrU
 7CH9nlP8U5quQkUrEv23gqNm/5hMGmPJjj6zArOidKKCe3VHmYLEw51EbHvhyW87JbUv
 sNB8hUaPDjSMpUOyOFPLGdiZtYr8IaTWeqQaOFycj2RxdmfjEjTm5+OpIJXLE4xD5jh4
 lW5V4AQcbhxE+C9dDyXbcIxFmy6qPtiT/3AdZu32cwK5wzuQBMUxwIOuZ7dZLnCfDTvs
 iN2D2SUuvjw0WuoK7EFf6T7gT15/VXEjjPZFPXOXknolhMfFuipIVyF7jSRCEuuzgwh3
 kBaA==
X-Gm-Message-State: APjAAAVpP6I8dKvGQJ5pB5USp3HE5o8MUOWmPZJW+DBRJNrp93Vs8h84
 cFF4/ShLKGj+1lMov+u5zldBe3cX9i7xYe7kXj32SA==
X-Google-Smtp-Source: APXvYqzH449xBvCrlqjQwzF5xj2tRIVmQKanSHXknIuOYx+GTnQuSh1A8LBUrt41WSJC5l3ogvCmflURVarkffJBOuU=
X-Received: by 2002:a17:90a:c20f:: with SMTP id
 e15mr358266pjt.123.1565305385027; 
 Thu, 08 Aug 2019 16:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <51a4155c5bc2ca847a9cbe85c1c11918bb193141.1564086017.git.jpoimboe@redhat.com>
 <alpine.DEB.2.21.1907252355150.1791@nanos.tec.linutronix.de>
 <156416793450.30723.5556760526480191131@skylake-alporthouse-com>
 <alpine.DEB.2.21.1907262116530.1791@nanos.tec.linutronix.de>
 <156416944205.21451.12269136304831943624@skylake-alporthouse-com>
 <CA+icZUXwBFS-6e+Qp4e3PhnRzEHvwdzWtS6OfVsgy85R5YNGOg@mail.gmail.com>
 <CA+icZUWA6e0Zsio6sthRUC=Ehb2-mw_9U76UnvwGc_tOnOqt7w@mail.gmail.com>
 <20190806125931.oqeqateyzqikusku@treble>
 <CAKwvOd=wa-XPCpoLQoQJH8Me7S=fXLfog0XsiKyFZKu8ojW_UQ@mail.gmail.com>
 <alpine.DEB.2.21.1908082221150.2882@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1908082221150.2882@nanos.tec.linutronix.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 8 Aug 2019 16:02:53 -0700
Message-ID: <CAKwvOdkTD-0inuEKLTsH_tKXzXjvzwnUDwYZ++-hOUrC_FU=sw@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Remove redundant user_access_end() from
 __copy_from_user() error path
To: Thomas Gleixner <tglx@linutronix.de>
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=w4PN33Lkfcqftf0QvPt6llyr/NqrBtuKXP5AjG4sS2I=;
 b=VDlEGmqQayUasSCsFFl/kgJP0QooO8SApmQBdfy+BJLl5TJEwpbGtwtJq7T+qOSyqP
 4pr+f9f/cobDjVxMHFw9yEWd6ystcw7NzJfLo/UBCyxRAllppqjZECKri1MBeMdHWnt5
 lPecE59M+Yu4biklKc21qNhg6dGcDqL4iSekPE3+nzudK3ae0ckmJXABQK2P4yao4Ms+
 gpT9Ha7D9di8pymw27zH6y5sFYK8o/fxUS9DMABoCbNg29v2kJf90UAAw9+HndEWWJpZ
 6NSHmgdEp3UZTKKAQsBoYJDcv2cdrc4vbuU/x3uvPWGh/z4COVpgRk2oEyTytwH+OcvW
 YyYQ==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Sedat Dilek <sedat.dilek@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCAxOjIyIFBNIFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51
dHJvbml4LmRlPiB3cm90ZToKPiA+IHRnbHgganVzdCBwaWNrZWQgdXAgMiBvdGhlciBwYXRjaGVz
IG9mIG1pbmUsIGJ1bXBpbmcganVzdCBpbiBjYXNlIGhlJ3MKPiA+IG5vdCBwaWNraW5nIHVwIHBh
dGNoZXMgd2hpbGUgb24gdmFjYXRpb24uIDspCj4KPiBJJ20gb25seSBoYWxmIG9uIHZhY2F0aW9u
IDopCj4KPiBTbyBJIGNhbiBwaWNrIGl0IHVwLgoKVGhhbmtzLCB3aWxsIHNlbmQgaGFsZiBtYXJn
YXJpdGFzLgoKLS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
