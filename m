Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2AD88BA6
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 15:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849D36E40E;
	Sat, 10 Aug 2019 13:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42A06EE93;
 Fri,  9 Aug 2019 20:19:45 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k2so13468442wrq.2;
 Fri, 09 Aug 2019 13:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=CU5GhqD34I+4I/wKjBx1pJkLxBMLeU2dxzdKCeha0fA=;
 b=ESGw+Uy6XxsBBfzhxZVidm4Kuh0xShzDiy9UYSIpCtXP2cG5tyEphziU8jmlHEgVBT
 HZXLFk9ORt6SWVy7pjAOsBx+FZ4iU93dT1bNGgePCRHBAR0eOx+OAc3IrATk0Bf5QRbS
 G4Zt4xvS2FJbtqNJPtireSsEM2gF9FlujRsH3ZU/H3kxamMHynN6fOGki+yNww/qEGQE
 /kWTRFR+B7EB0JiqI1VLI/hcOldIMxLlO48sc+YQDYF/2XyXS2WP+fXeS7eLUGc2kzs4
 l0/DI3EvXnReY6VUKi2LNHurOq6wdzAGpiPUCAdsy3fKC2kA8bN5odXzR3R7KtWIXbmh
 PcaA==
X-Gm-Message-State: APjAAAV4x9P6IvCgCjw3IyMkmn9PQzZCD9ugxQzOocoPaECig01w8rXL
 YrCF4zOKfIc1GD5iq97cX++v3+fcY+FeSBxZoB4=
X-Google-Smtp-Source: APXvYqw1d8OiVM9mT4FhG4ORzaAQl8RXTI++5oh9pTnSV2jbRTCIlgRjRVIzeFLnTix5RHO3L43d6TZ7ztP6VYbljjE=
X-Received: by 2002:adf:a54d:: with SMTP id j13mr9228694wrb.261.1565381984439; 
 Fri, 09 Aug 2019 13:19:44 -0700 (PDT)
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
 <CAKwvOdkTD-0inuEKLTsH_tKXzXjvzwnUDwYZ++-hOUrC_FU=sw@mail.gmail.com>
In-Reply-To: <CAKwvOdkTD-0inuEKLTsH_tKXzXjvzwnUDwYZ++-hOUrC_FU=sw@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 9 Aug 2019 22:19:29 +0200
Message-ID: <CA+icZUWgE5NTEa9Q0jof0Hv52tZM8-869Daww7dueaaMMXt+7A@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Remove redundant user_access_end() from
 __copy_from_user() error path
To: Nick Desaulniers <ndesaulniers@google.com>
X-Mailman-Approved-At: Sat, 10 Aug 2019 13:55:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=CU5GhqD34I+4I/wKjBx1pJkLxBMLeU2dxzdKCeha0fA=;
 b=Jn7GTGxDyJkhDN/2Znu08WIaawEzU0y6yZSlwmsQiY61RlJd1eTogokXAabXcJ5sPc
 SXvb0BWDnGnooi20lIATilnQeAUQ4ooGrHUWBK4w4Hhxwleeq43+5duHzNbagPiTp1zB
 //D8eFPwgmPWtCQm8eKbZYV9KoqZosG7D8DKZLi+2/UFNOesZok78wudchx8dsDwDuBr
 xcI9Xljqc/xCoUe3ho7+c6QR8zLD32gJ6Fzp9gF76OLK+AqZbVlM9ctjF/HJSGsbMQmk
 4jL54osofXOPPZGgO6vUXjGloK+dOmgP0U+hIjLvj72ITF5d//tNFEjXSoi0eH0Z8OE2
 DlhQ==
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
Reply-To: sedat.dilek@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgOSwgMjAxOSBhdCAxOjAzIEFNIE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxu
aWVyc0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDgsIDIwMTkgYXQgMToyMiBQ
TSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3JvdGU6Cj4gPiA+IHRnbHgg
anVzdCBwaWNrZWQgdXAgMiBvdGhlciBwYXRjaGVzIG9mIG1pbmUsIGJ1bXBpbmcganVzdCBpbiBj
YXNlIGhlJ3MKPiA+ID4gbm90IHBpY2tpbmcgdXAgcGF0Y2hlcyB3aGlsZSBvbiB2YWNhdGlvbi4g
OykKPiA+Cj4gPiBJJ20gb25seSBoYWxmIG9uIHZhY2F0aW9uIDopCj4gPgo+ID4gU28gSSBjYW4g
cGljayBpdCB1cC4KPgo+IFRoYW5rcywgd2lsbCBzZW5kIGhhbGYgbWFyZ2FyaXRhcy4KPgoKU2Vu
ZHMgc29tZSBUdXJraXNoIENheS4KCi0gU2VkYXQgLQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
