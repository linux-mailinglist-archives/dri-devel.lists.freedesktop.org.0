Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006FC6A516
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 11:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9126589F3B;
	Tue, 16 Jul 2019 09:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe4a.google.com (mail-vs1-xe4a.google.com
 [IPv6:2607:f8b0:4864:20::e4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014D689F3B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 09:43:09 +0000 (UTC)
Received: by mail-vs1-xe4a.google.com with SMTP id w76so4204978vsw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 02:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=pGdEsik+1M6jb/HINg07WI5yjzJ1jMxME0W4+2uDrMc=;
 b=M7c3/ZDJ/NdowtpqL3+eYAe99m8PhM1qbtJGa/5uDkubjY7ywTR/JYyNYznixBWKyE
 fZBBc0/bWD69wdHBZoZaTKzMw4nGFj9T4bcQaY6IeKYT6evhMdOJNjO7X6MDxQoJDd0o
 7sR/BBW+/hlAGZDOUkifXd1IVsK2ed0JGT16DarVll7/i+LHCbfi7vZV2XsiJVPIa1NN
 yqCheVAqYQlyPuCDkruvwSisuCSGlDC4BWzxtVUT8a0uLPquF+YH68Nh/yOaOzNMcqKp
 gLvOTcIQzdyy9BonwTGbJIOMiY7wBRUm4MNBhz8toKHTrHSUXtqZ0+pfZcb1MMvKn0cJ
 J1vw==
X-Gm-Message-State: APjAAAVxPDk5mzqakrrFuuMjmdEFbfPeC1P7A0GXA3i/UXnJxP2T9ili
 re5eyu0IJj2f7FX8Ozz82Gy4KelSzQF2F4iv5qtE0A==
X-Google-Smtp-Source: APXvYqw3wlXdIHgaqyGI3Fkb5EoQvIKrYD7PYJZvCXqueiq4LTaNvNX4mlOb1gL0HCxxqPqMgE7qX6kvoBg4NaGW2/1i8w==
X-Received: by 2002:a9f:230c:: with SMTP id 12mr15226541uae.85.1563270188644; 
 Tue, 16 Jul 2019 02:43:08 -0700 (PDT)
Date: Tue, 16 Jul 2019 02:42:44 -0700
Message-Id: <20190716094302.180360-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v10 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=pGdEsik+1M6jb/HINg07WI5yjzJ1jMxME0W4+2uDrMc=;
 b=eAEOpY1OH/FnKVljQodIm2gUsxEwhjJezpJfsDh5+L9jGMf2prsNq4n5iGGl8lhFcy
 3GIJYBh3yNP4rG6hnKRTyj90mHYFk0BHKtIgiGVyRA9kF/uIcjPZdmXbW8ZEQW4EZ5IH
 SXn4qORJzI5ksZoYb5wqvx7hlnvhT2sxT5FgtaGJr+HG+NjnhSJ69g9xxveqLaNBs89a
 ktkggSKnDQEOXJdhLHX3eRSCy+Xqa76qSYaf55Id0NRKz4na4h3mnh2/MOGZbY4WN6E8
 fCBR1frwWPhwmOtJudmJgXI/JrEuT7i8sdsJFK8HYCxGVYzU3slHOExwB171GfmM6DRJ
 5ZCQ==
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
b3lkLiBNb3N0IGNoYW5nZXMgYXJlCnByZXR0eSBtaW5vciwgYnV0IHRoaXMgZG9lcyBmaXggYSBj
b3VwbGUgb2YgYnVncyBwb2ludGVkIG91dCBieSBTdGVwaGVuLgoKSSBpbWFnaW5lIHRoYXQgU3Rl
cGhlbiB3aWxsIHByb2JhYmx5IGhhdmUgc29tZSBtb3JlIGNvbW1lbnRzLCBidXQgSQp3YW50ZWQg
dG8gZ2V0IHRoaXMgb3V0IGZvciBoaW0gdG8gbG9vayBhdCBhcyBzb29uIGFzIHBvc3NpYmxlLgoK
IyMgQmFja2dyb3VuZAoKVGhpcyBwYXRjaCBzZXQgcHJvcG9zZXMgS1VuaXQsIGEgbGlnaHR3ZWln
aHQgdW5pdCB0ZXN0aW5nIGFuZCBtb2NraW5nCmZyYW1ld29yayBmb3IgdGhlIExpbnV4IGtlcm5l
bC4KClVubGlrZSBBdXRvdGVzdCBhbmQga3NlbGZ0ZXN0LCBLVW5pdCBpcyBhIHRydWUgdW5pdCB0
ZXN0aW5nIGZyYW1ld29yazsKaXQgZG9lcyBub3QgcmVxdWlyZSBpbnN0YWxsaW5nIHRoZSBrZXJu
ZWwgb24gYSB0ZXN0IG1hY2hpbmUgb3IgaW4gYSBWTQooaG93ZXZlciwgS1VuaXQgc3RpbGwgYWxs
b3dzIHlvdSB0byBydW4gdGVzdHMgb24gdGVzdCBtYWNoaW5lcyBvciBpbiBWTXMKaWYgeW91IHdh
bnRbMV0pIGFuZCBkb2VzIG5vdCByZXF1aXJlIHRlc3RzIHRvIGJlIHdyaXR0ZW4gaW4gdXNlcnNw
YWNlCnJ1bm5pbmcgb24gYSBob3N0IGtlcm5lbC4gQWRkaXRpb25hbGx5LCBLVW5pdCBpcyBmYXN0
OiBGcm9tIGludm9jYXRpb24KdG8gY29tcGxldGlvbiBLVW5pdCBjYW4gcnVuIHNldmVyYWwgZG96
ZW4gdGVzdHMgaW4gYWJvdXQgYSBzZWNvbmQuCkN1cnJlbnRseSwgdGhlIGVudGlyZSBLVW5pdCB0
ZXN0IHN1aXRlIGZvciBLVW5pdCBydW5zIGluIHVuZGVyIGEgc2Vjb25kCmZyb20gdGhlIGluaXRp
YWwgaW52b2NhdGlvbiAoYnVpbGQgdGltZSBleGNsdWRlZCkuCgpLVW5pdCBpcyBoZWF2aWx5IGlu
c3BpcmVkIGJ5IEpVbml0LCBQeXRob24ncyB1bml0dGVzdC5tb2NrLCBhbmQKR29vZ2xldGVzdC9H
b29nbGVtb2NrIGZvciBDKysuIEtVbml0IHByb3ZpZGVzIGZhY2lsaXRpZXMgZm9yIGRlZmluaW5n
CnVuaXQgdGVzdCBjYXNlcywgZ3JvdXBpbmcgcmVsYXRlZCB0ZXN0IGNhc2VzIGludG8gdGVzdCBz
dWl0ZXMsIHByb3ZpZGluZwpjb21tb24gaW5mcmFzdHJ1Y3R1cmUgZm9yIHJ1bm5pbmcgdGVzdHMs
IG1vY2tpbmcsIHNweWluZywgYW5kIG11Y2ggbW9yZS4KCiMjIyBXaGF0J3Mgc28gc3BlY2lhbCBh
Ym91dCB1bml0IHRlc3Rpbmc/CgpBIHVuaXQgdGVzdCBpcyBzdXBwb3NlZCB0byB0ZXN0IGEgc2lu
Z2xlIHVuaXQgb2YgY29kZSBpbiBpc29sYXRpb24sCmhlbmNlIHRoZSBuYW1lLiBUaGVyZSBzaG91
bGQgYmUgbm8gZGVwZW5kZW5jaWVzIG91dHNpZGUgdGhlIGNvbnRyb2wgb2YKdGhlIHRlc3Q7IHRo
aXMgbWVhbnMgbm8gZXh0ZXJuYWwgZGVwZW5kZW5jaWVzLCB3aGljaCBtYWtlcyB0ZXN0cyBvcmRl
cnMKb2YgbWFnbml0dWRlcyBmYXN0ZXIuIExpa2V3aXNlLCBzaW5jZSB0aGVyZSBhcmUgbm8gZXh0
ZXJuYWwgZGVwZW5kZW5jaWVzLAp0aGVyZSBhcmUgbm8gaG9vcHMgdG8ganVtcCB0aHJvdWdoIHRv
IHJ1biB0aGUgdGVzdHMuIEFkZGl0aW9uYWxseSwgdGhpcwptYWtlcyB1bml0IHRlc3RzIGRldGVy
bWluaXN0aWM6IGEgZmFpbGluZyB1bml0IHRlc3QgYWx3YXlzIGluZGljYXRlcyBhCnByb2JsZW0u
IEZpbmFsbHksIGJlY2F1c2UgdW5pdCB0ZXN0cyBuZWNlc3NhcmlseSBoYXZlIGZpbmVyIGdyYW51
bGFyaXR5LAp0aGV5IGFyZSBhYmxlIHRvIHRlc3QgYWxsIGNvZGUgcGF0aHMgZWFzaWx5IHNvbHZp
bmcgdGhlIGNsYXNzaWMgcHJvYmxlbQpvZiBkaWZmaWN1bHR5IGluIGV4ZXJjaXNpbmcgZXJyb3Ig
aGFuZGxpbmcgY29kZS4KCiMjIyBJcyBLVW5pdCB0cnlpbmcgdG8gcmVwbGFjZSBvdGhlciB0ZXN0
aW5nIGZyYW1ld29ya3MgZm9yIHRoZSBrZXJuZWw/CgpOby4gTW9zdCBleGlzdGluZyB0ZXN0cyBm
b3IgdGhlIExpbnV4IGtlcm5lbCBhcmUgZW5kLXRvLWVuZCB0ZXN0cywgd2hpY2gKaGF2ZSB0aGVp
ciBwbGFjZS4gQSB3ZWxsIHRlc3RlZCBzeXN0ZW0gaGFzIGxvdHMgb2YgdW5pdCB0ZXN0cywgYQpy
ZWFzb25hYmxlIG51bWJlciBvZiBpbnRlZ3JhdGlvbiB0ZXN0cywgYW5kIHNvbWUgZW5kLXRvLWVu
ZCB0ZXN0cy4gS1VuaXQKaXMganVzdCB0cnlpbmcgdG8gYWRkcmVzcyB0aGUgdW5pdCB0ZXN0IHNw
YWNlIHdoaWNoIGlzIGN1cnJlbnRseSBub3QKYmVpbmcgYWRkcmVzc2VkLgoKIyMjIE1vcmUgaW5m
b3JtYXRpb24gb24gS1VuaXQKClRoZXJlIGlzIGEgYnVuY2ggb2YgZG9jdW1lbnRhdGlvbiBuZWFy
IHRoZSBlbmQgb2YgdGhpcyBwYXRjaCBzZXQgdGhhdApkZXNjcmliZXMgaG93IHRvIHVzZSBLVW5p
dCBhbmQgYmVzdCBwcmFjdGljZXMgZm9yIHdyaXRpbmcgdW5pdCB0ZXN0cy4KRm9yIGNvbnZlbmll
bmNlIEkgYW0gaG9zdGluZyB0aGUgY29tcGlsZWQgZG9jcyBoZXJlWzJdLgoKQWRkaXRpb25hbGx5
IGZvciBjb252ZW5pZW5jZSwgSSBoYXZlIGFwcGxpZWQgdGhlc2UgcGF0Y2hlcyB0byBhCmJyYW5j
aFszXS4gVGhlIHJlcG8gbWF5IGJlIGNsb25lZCB3aXRoOgpnaXQgY2xvbmUgaHR0cHM6Ly9rdW5p
dC5nb29nbGVzb3VyY2UuY29tL2xpbnV4ClRoaXMgcGF0Y2hzZXQgaXMgb24gdGhlIGt1bml0L3Jm
Yy92NS4yL3YxMCBicmFuY2guCgojIyBDaGFuZ2VzIFNpbmNlIExhc3QgVmVyc2lvbgoKLSBXZW50
IGJhY2sgdG8gdXNpbmcgc3BpbmxvY2sgaW4gYHN0cnVjdCBrdW5pdGAuIE5lZWRlZCBmb3IgcmVz
b3VyY2UKICBtYW5hZ2VtZW50IEFQSS4gVGhhbmtzIHRvIFN0ZXBoZW4gZm9yIHRoaXMgY2hhbmdl
LgotIEZpeGVkIGJ1ZyB3aGVyZSBhbiBpbml0IGZhaWx1cmUgbWF5IG5vdCBiZSByZWNvcmRlZCBh
cyBhIGZhaWx1cmUgaW4KICBwYXRjaCAwMS8xOC4KLSBBZGRlZCBhcHBlbmQgbWV0aG9kIHRvIHN0
cmluZ19zdHJlYW0gYXMgc3VnZ2VzdGVkIGJ5IFN0ZXBoZW4uCi0gTW9zdGx5IHByZXR0eSBtaW5v
ciBjaGFuZ2VzIGFmdGVyIHRoYXQsIHdoaWNoIG1vc3RseSBwZXJ0YWluIHRvCiAgc3RyaW5nX3N0
cmVhbSBhbmQga3VuaXRfc3RyZWFtLgoKWzFdIGh0dHBzOi8vZ29vZ2xlLmdpdGh1Yi5pby9rdW5p
dC1kb2NzL3RoaXJkX3BhcnR5L2tlcm5lbC9kb2NzL3VzYWdlLmh0bWwja3VuaXQtb24tbm9uLXVt
bC1hcmNoaXRlY3R1cmVzClsyXSBodHRwczovL2dvb2dsZS5naXRodWIuaW8va3VuaXQtZG9jcy90
aGlyZF9wYXJ0eS9rZXJuZWwvZG9jcy8KWzNdIGh0dHBzOi8va3VuaXQuZ29vZ2xlc291cmNlLmNv
bS9saW51eC8rL2t1bml0L3JmYy92NS4yL3YxMAoKLS0gCjIuMjIuMC41MTAuZzI2NGYyYzgxN2Et
Z29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
