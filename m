Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23186B390
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 03:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5FB6E1D5;
	Wed, 17 Jul 2019 01:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686316E1D5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 01:55:53 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id a5so11180469pla.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 18:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=g73VbK9hP8iwHcV/w0DEWc6A8T81W2obxVf/JscQhPY=;
 b=rd7qsC3F/8w1bFYCZpna8lLbp17GUiiuugjUgDeVg6QZWfPi7bjlHGZ+U7t6UUGC82
 60JS+xmKKxVHtfx15TxNThuGedqY0y1TkgoLPXMLmfl7had2UJyel/bzuYC7T4ouMhZZ
 vzldwfmFAg4QvA4aMpM/xEC+4q9Xbn5vz6XsSnTPszbmGkUIOkF661BX5F+Tm4+JVyYT
 qV06ah7wVGoEZo4JLiuU2aEgldJFY4dvPQZeoF/Bz/QRmzMRzu0V+COS8K8+6BdqKU8m
 uMXuT2IpHmpRKArUZNO+jxt3Q9TFT+2PrltszECPNLJVupZMnGfTwX4o8at4AIumA4m9
 sOmg==
X-Gm-Message-State: APjAAAWmeaXj6m1KmsKyMrJZUXA1K0FNkRt6Jzf7DskVevWQRLZiHXwS
 0bjh9pxozh4S3/aJYqg47ORDaNX83WKIo3hbyZKtuQ==
X-Google-Smtp-Source: APXvYqzIJkjKQ3S+2BDLj5Fx/7Xa9wrPBuZpZW0wEdv7tjBDXndxr0psGCLPsqNbiarNlPEHuGD5doQNqhtuO1IsifVYng==
X-Received: by 2002:a63:2606:: with SMTP id m6mr37469748pgm.436.1563328552353; 
 Tue, 16 Jul 2019 18:55:52 -0700 (PDT)
Date: Tue, 16 Jul 2019 18:55:25 -0700
Message-Id: <20190717015543.152251-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v11 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=g73VbK9hP8iwHcV/w0DEWc6A8T81W2obxVf/JscQhPY=;
 b=Vbb6ETWdoL7/dyTwrtnSjUAJji8HmC0dbYlvBQhYL3ZtcFa53MTUkxRV21Vh+xQzRU
 gtcMrgV6CsUcmCq6PHa2QI2RapBr3kPi3qcDZTk/V+RQINbCgIAGW9XgyyKfzkIP+4A2
 Cj9ApaRpGtUkElZpxENbPQ4y/LhEkO32Y8s6YtL6EobTN8efWAzcypCT1B1B2UtD/u4i
 A3n0+WeJDp01P7yO5hdDAfarVytQtTxJ7QrOXdADRb4dC2e7V8+WsZndPYZvAMZpQ4s7
 2BclIo1VrtBu6iu7lEVSZ2YJI8piqhPI0Z2qIl5B2wcZ4ToCguieuFOeyAl4qvN2wNXh
 HDVg==
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, wfg@linux.intel.com,
 joel@jms.id.au, rientjes@google.com, Iurii Zaikin <yzaikin@google.com>,
 jdike@addtoit.com, dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 Michal Marek <michal.lkml@markovi.net>, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IyMgVEw7RFIKClRoaXMgcGF0Y2hzZXQgYWRkcmVzc2VzIGNvbW1lbnRzIGZyb20gU3RlcGhlbiBC
b3lkLiBObyBjaGFuZ2VzIGFmZmVjdAp0aGUgQVBJLCBhbmQgYWxsIGNoYW5nZXMgYXJlIHNwZWNp
ZmljIHRvIHBhdGNoZXMgMDIsIDAzLCBhbmQgMDQ7Cmhvd2V2ZXIsIHRoZXJlIHdlcmUgc29tZSBz
aWduaWZpY2FudCBjaGFuZ2VzIHRvIGhvdyBzdHJpbmdfc3RyZWFtIGFuZAprdW5pdF9zdHJlYW0g
d29yayB1bmRlciB0aGUgaG9vZC4KCiMjIEJhY2tncm91bmQKClRoaXMgcGF0Y2ggc2V0IHByb3Bv
c2VzIEtVbml0LCBhIGxpZ2h0d2VpZ2h0IHVuaXQgdGVzdGluZyBhbmQgbW9ja2luZwpmcmFtZXdv
cmsgZm9yIHRoZSBMaW51eCBrZXJuZWwuCgpVbmxpa2UgQXV0b3Rlc3QgYW5kIGtzZWxmdGVzdCwg
S1VuaXQgaXMgYSB0cnVlIHVuaXQgdGVzdGluZyBmcmFtZXdvcms7Cml0IGRvZXMgbm90IHJlcXVp
cmUgaW5zdGFsbGluZyB0aGUga2VybmVsIG9uIGEgdGVzdCBtYWNoaW5lIG9yIGluIGEgVk0KKGhv
d2V2ZXIsIEtVbml0IHN0aWxsIGFsbG93cyB5b3UgdG8gcnVuIHRlc3RzIG9uIHRlc3QgbWFjaGlu
ZXMgb3IgaW4gVk1zCmlmIHlvdSB3YW50WzFdKSBhbmQgZG9lcyBub3QgcmVxdWlyZSB0ZXN0cyB0
byBiZSB3cml0dGVuIGluIHVzZXJzcGFjZQpydW5uaW5nIG9uIGEgaG9zdCBrZXJuZWwuIEFkZGl0
aW9uYWxseSwgS1VuaXQgaXMgZmFzdDogRnJvbSBpbnZvY2F0aW9uCnRvIGNvbXBsZXRpb24gS1Vu
aXQgY2FuIHJ1biBzZXZlcmFsIGRvemVuIHRlc3RzIGluIGFib3V0IGEgc2Vjb25kLgpDdXJyZW50
bHksIHRoZSBlbnRpcmUgS1VuaXQgdGVzdCBzdWl0ZSBmb3IgS1VuaXQgcnVucyBpbiB1bmRlciBh
IHNlY29uZApmcm9tIHRoZSBpbml0aWFsIGludm9jYXRpb24gKGJ1aWxkIHRpbWUgZXhjbHVkZWQp
LgoKS1VuaXQgaXMgaGVhdmlseSBpbnNwaXJlZCBieSBKVW5pdCwgUHl0aG9uJ3MgdW5pdHRlc3Qu
bW9jaywgYW5kCkdvb2dsZXRlc3QvR29vZ2xlbW9jayBmb3IgQysrLiBLVW5pdCBwcm92aWRlcyBm
YWNpbGl0aWVzIGZvciBkZWZpbmluZwp1bml0IHRlc3QgY2FzZXMsIGdyb3VwaW5nIHJlbGF0ZWQg
dGVzdCBjYXNlcyBpbnRvIHRlc3Qgc3VpdGVzLCBwcm92aWRpbmcKY29tbW9uIGluZnJhc3RydWN0
dXJlIGZvciBydW5uaW5nIHRlc3RzLCBtb2NraW5nLCBzcHlpbmcsIGFuZCBtdWNoIG1vcmUuCgoj
IyMgV2hhdCdzIHNvIHNwZWNpYWwgYWJvdXQgdW5pdCB0ZXN0aW5nPwoKQSB1bml0IHRlc3QgaXMg
c3VwcG9zZWQgdG8gdGVzdCBhIHNpbmdsZSB1bml0IG9mIGNvZGUgaW4gaXNvbGF0aW9uLApoZW5j
ZSB0aGUgbmFtZS4gVGhlcmUgc2hvdWxkIGJlIG5vIGRlcGVuZGVuY2llcyBvdXRzaWRlIHRoZSBj
b250cm9sIG9mCnRoZSB0ZXN0OyB0aGlzIG1lYW5zIG5vIGV4dGVybmFsIGRlcGVuZGVuY2llcywg
d2hpY2ggbWFrZXMgdGVzdHMgb3JkZXJzCm9mIG1hZ25pdHVkZXMgZmFzdGVyLiBMaWtld2lzZSwg
c2luY2UgdGhlcmUgYXJlIG5vIGV4dGVybmFsIGRlcGVuZGVuY2llcywKdGhlcmUgYXJlIG5vIGhv
b3BzIHRvIGp1bXAgdGhyb3VnaCB0byBydW4gdGhlIHRlc3RzLiBBZGRpdGlvbmFsbHksIHRoaXMK
bWFrZXMgdW5pdCB0ZXN0cyBkZXRlcm1pbmlzdGljOiBhIGZhaWxpbmcgdW5pdCB0ZXN0IGFsd2F5
cyBpbmRpY2F0ZXMgYQpwcm9ibGVtLiBGaW5hbGx5LCBiZWNhdXNlIHVuaXQgdGVzdHMgbmVjZXNz
YXJpbHkgaGF2ZSBmaW5lciBncmFudWxhcml0eSwKdGhleSBhcmUgYWJsZSB0byB0ZXN0IGFsbCBj
b2RlIHBhdGhzIGVhc2lseSBzb2x2aW5nIHRoZSBjbGFzc2ljIHByb2JsZW0Kb2YgZGlmZmljdWx0
eSBpbiBleGVyY2lzaW5nIGVycm9yIGhhbmRsaW5nIGNvZGUuCgojIyMgSXMgS1VuaXQgdHJ5aW5n
IHRvIHJlcGxhY2Ugb3RoZXIgdGVzdGluZyBmcmFtZXdvcmtzIGZvciB0aGUga2VybmVsPwoKTm8u
IE1vc3QgZXhpc3RpbmcgdGVzdHMgZm9yIHRoZSBMaW51eCBrZXJuZWwgYXJlIGVuZC10by1lbmQg
dGVzdHMsIHdoaWNoCmhhdmUgdGhlaXIgcGxhY2UuIEEgd2VsbCB0ZXN0ZWQgc3lzdGVtIGhhcyBs
b3RzIG9mIHVuaXQgdGVzdHMsIGEKcmVhc29uYWJsZSBudW1iZXIgb2YgaW50ZWdyYXRpb24gdGVz
dHMsIGFuZCBzb21lIGVuZC10by1lbmQgdGVzdHMuIEtVbml0CmlzIGp1c3QgdHJ5aW5nIHRvIGFk
ZHJlc3MgdGhlIHVuaXQgdGVzdCBzcGFjZSB3aGljaCBpcyBjdXJyZW50bHkgbm90CmJlaW5nIGFk
ZHJlc3NlZC4KCiMjIyBNb3JlIGluZm9ybWF0aW9uIG9uIEtVbml0CgpUaGVyZSBpcyBhIGJ1bmNo
IG9mIGRvY3VtZW50YXRpb24gbmVhciB0aGUgZW5kIG9mIHRoaXMgcGF0Y2ggc2V0IHRoYXQKZGVz
Y3JpYmVzIGhvdyB0byB1c2UgS1VuaXQgYW5kIGJlc3QgcHJhY3RpY2VzIGZvciB3cml0aW5nIHVu
aXQgdGVzdHMuCkZvciBjb252ZW5pZW5jZSBJIGFtIGhvc3RpbmcgdGhlIGNvbXBpbGVkIGRvY3Mg
aGVyZVsyXS4KCkFkZGl0aW9uYWxseSBmb3IgY29udmVuaWVuY2UsIEkgaGF2ZSBhcHBsaWVkIHRo
ZXNlIHBhdGNoZXMgdG8gYQpicmFuY2hbM10uIFRoZSByZXBvIG1heSBiZSBjbG9uZWQgd2l0aDoK
Z2l0IGNsb25lIGh0dHBzOi8va3VuaXQuZ29vZ2xlc291cmNlLmNvbS9saW51eApUaGlzIHBhdGNo
c2V0IGlzIG9uIHRoZSBrdW5pdC9yZmMvdjUuMi92MTEgYnJhbmNoLgoKIyMgQ2hhbmdlcyBTaW5j
ZSBMYXN0IFZlcnNpb24KCi0gV2VudCBiYWNrIHRvIHVzaW5nIHNwaW5sb2NrIGluIGBzdHJ1Y3Qg
c3RyaW5nX3N0cmVhbWAuIE5lZWRlZCBmb3Igc28KICB0aGF0IGl0IGlzIGNvbXBhdGlibGUgd2l0
aCBkaWZmZXJlbnQgR0ZQIGZsYWdzIHRvIGFkZHJlc3MgY29tbWVudCBmcm9tCiAgU3RlcGhlbi4K
LSBBZGRlZCBzdHJpbmdfc3RyZWFtX2FwcGVuZCBmdW5jdGlvbiB0byBzdHJpbmdfc3RyZWFtIEFQ
SS4gLSBzdWdnZXN0ZWQKICBieSBTdGVwaGVuLgotIE1hZGUgYWxsIHN0cmluZyBmcmFnbWVudHMg
YW5kIG90aGVyIGFsbG9jYXRpb25zIGludGVybmFsIHRvCiAgc3RyaW5nX3N0cmVhbSBhbmQga3Vu
aXRfc3RyZWFtIG1hbmFnZWQgYnkgdGhlIEtVbml0IHJlc291cmNlCiAgbWFuYWdlbWVudCBBUEku
CgpbMV0gaHR0cHM6Ly9nb29nbGUuZ2l0aHViLmlvL2t1bml0LWRvY3MvdGhpcmRfcGFydHkva2Vy
bmVsL2RvY3MvdXNhZ2UuaHRtbCNrdW5pdC1vbi1ub24tdW1sLWFyY2hpdGVjdHVyZXMKWzJdIGh0
dHBzOi8vZ29vZ2xlLmdpdGh1Yi5pby9rdW5pdC1kb2NzL3RoaXJkX3BhcnR5L2tlcm5lbC9kb2Nz
LwpbM10gaHR0cHM6Ly9rdW5pdC5nb29nbGVzb3VyY2UuY29tL2xpbnV4Lysva3VuaXQvcmZjL3Y1
LjIvdjExCgotLSAKMi4yMi4wLjUxMC5nMjY0ZjJjODE3YS1nb29nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
