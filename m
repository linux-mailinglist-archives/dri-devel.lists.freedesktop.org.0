Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01709BA1C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 03:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283326ED7C;
	Sat, 24 Aug 2019 01:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372B06ED7C
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 01:34:37 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id f188so1030220vkh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 18:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=u6vmmnwRUzLKD5y/rsoe3hBquEKZMDYQLdEtGhcWv3g=;
 b=RNZEQjdusLjeyb8IUzCyZHY5co9dI+rqmxEcbEkB1JrVaGes8Rv93e5kxN2ai+DwkS
 lHj6VRfrf36fD9y73UayBvrF1EQ2JVSI7nU8YvmARlJjILoJHDfdC9eLx9nbHtYOSsMo
 I3L/3zf+Zv6RVhntPawJk+9+9fFdwgPm+FBgc4x1pz39ocOjtegoixaXNbg8OOmlEF6H
 q7+vsQhlVWmDS8ZWGTuyyWubbWzFWJkNFb5Yk5kGxR6r8b6f7OoBnnmd8bTE+6apVgyj
 E6hJNH2FWIptSEq8OalwXW8IxxvDCLEaT3sLLgtLTZKcZ/aHV2bnHyfE9N1Sevl4aPOq
 N1uw==
X-Gm-Message-State: APjAAAVNbo6L+l9l113KrMqlDio7dV6QW90HI5NwAAohAS1kuaobk+rS
 C+FOcoGmMy/aFiPh9Dm1Xknllj1jxq+VmHOU5Oslwg==
X-Google-Smtp-Source: APXvYqwBNX0MXCogqcD2ZWv4/PeYSKyopYGJC89lxHpR6CjYFzzu83jqcycsHbnwRnQxtUoBH+I61TfjBVcTRyxmbsVxMw==
X-Received: by 2002:a67:dd91:: with SMTP id i17mr4328220vsk.21.1566610475582; 
 Fri, 23 Aug 2019 18:34:35 -0700 (PDT)
Date: Fri, 23 Aug 2019 18:34:07 -0700
Message-Id: <20190824013425.175645-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v15 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=u6vmmnwRUzLKD5y/rsoe3hBquEKZMDYQLdEtGhcWv3g=;
 b=HVklJPxbqbRBtpBK3hdl+VswNRV4P2EWUoTQ6/jzlla/43tMUYx52ieNsrWja1cMAd
 aJXK63eT0AeMDFxYtZyBESJGuF52uPkRIRazyPmUFSSpZlHx/sV1I2pC8wcJoG/Jy+z7
 0ebrqRvPPaqx+epAoYNiv2Z6F0OPXUrzfluIz3B0PZsRxGAjoAWPYO3kBtG4yhrHecAA
 fwkXjbrqFMOaTYkIzZof+8WI+OZNq8YRk4OSEiBdVc0hDOjOiYENTJZIZIQpFAlgeRT6
 5UwDu9vDrX9VEXJMCDM32wr6kC4xm78SHY7UBAnZUT4L8JjxDdyUQ0eJ2Gew4CMdHuAQ
 esXA==
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
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IyMgVEw7RFIKClRoaXMgcmV2aXNpb24gYWRkcmVzc2VzIGNvbW1lbnRzIGZyb20gU2h1YWggYnkg
Zml4aW5nIGEgY291cGxlCmNoZWNrcGF0Y2ggd2FybmluZ3MgYW5kIGZpeGluZyBzb21lIGNvbW1l
bnQgcmVhZGFiaWxpdHkgaXNzdWVzLiBObyBBUEkKb3IgbWFqb3Igc3RydWN0dWFsIGNoYW5nZXMg
aGF2ZSBiZWVuIG1hZGUgc2luY2UgdjEzLgoKIyMgQmFja2dyb3VuZAoKVGhpcyBwYXRjaCBzZXQg
cHJvcG9zZXMgS1VuaXQsIGEgbGlnaHR3ZWlnaHQgdW5pdCB0ZXN0aW5nIGFuZCBtb2NraW5nCmZy
YW1ld29yayBmb3IgdGhlIExpbnV4IGtlcm5lbC4KClVubGlrZSBBdXRvdGVzdCBhbmQga3NlbGZ0
ZXN0LCBLVW5pdCBpcyBhIHRydWUgdW5pdCB0ZXN0aW5nIGZyYW1ld29yazsKaXQgZG9lcyBub3Qg
cmVxdWlyZSBpbnN0YWxsaW5nIHRoZSBrZXJuZWwgb24gYSB0ZXN0IG1hY2hpbmUgb3IgaW4gYSBW
TQooaG93ZXZlciwgS1VuaXQgc3RpbGwgYWxsb3dzIHlvdSB0byBydW4gdGVzdHMgb24gdGVzdCBt
YWNoaW5lcyBvciBpbiBWTXMKaWYgeW91IHdhbnRbMV0pIGFuZCBkb2VzIG5vdCByZXF1aXJlIHRl
c3RzIHRvIGJlIHdyaXR0ZW4gaW4gdXNlcnNwYWNlCnJ1bm5pbmcgb24gYSBob3N0IGtlcm5lbC4g
QWRkaXRpb25hbGx5LCBLVW5pdCBpcyBmYXN0OiBGcm9tIGludm9jYXRpb24KdG8gY29tcGxldGlv
biBLVW5pdCBjYW4gcnVuIHNldmVyYWwgZG96ZW4gdGVzdHMgaW4gYWJvdXQgYSBzZWNvbmQuCkN1
cnJlbnRseSwgdGhlIGVudGlyZSBLVW5pdCB0ZXN0IHN1aXRlIGZvciBLVW5pdCBydW5zIGluIHVu
ZGVyIGEgc2Vjb25kCmZyb20gdGhlIGluaXRpYWwgaW52b2NhdGlvbiAoYnVpbGQgdGltZSBleGNs
dWRlZCkuCgpLVW5pdCBpcyBoZWF2aWx5IGluc3BpcmVkIGJ5IEpVbml0LCBQeXRob24ncyB1bml0
dGVzdC5tb2NrLCBhbmQKR29vZ2xldGVzdC9Hb29nbGVtb2NrIGZvciBDKysuIEtVbml0IHByb3Zp
ZGVzIGZhY2lsaXRpZXMgZm9yIGRlZmluaW5nCnVuaXQgdGVzdCBjYXNlcywgZ3JvdXBpbmcgcmVs
YXRlZCB0ZXN0IGNhc2VzIGludG8gdGVzdCBzdWl0ZXMsIHByb3ZpZGluZwpjb21tb24gaW5mcmFz
dHJ1Y3R1cmUgZm9yIHJ1bm5pbmcgdGVzdHMsIG1vY2tpbmcsIHNweWluZywgYW5kIG11Y2ggbW9y
ZS4KCiMjIyBXaGF0J3Mgc28gc3BlY2lhbCBhYm91dCB1bml0IHRlc3Rpbmc/CgpBIHVuaXQgdGVz
dCBpcyBzdXBwb3NlZCB0byB0ZXN0IGEgc2luZ2xlIHVuaXQgb2YgY29kZSBpbiBpc29sYXRpb24s
CmhlbmNlIHRoZSBuYW1lLiBUaGVyZSBzaG91bGQgYmUgbm8gZGVwZW5kZW5jaWVzIG91dHNpZGUg
dGhlIGNvbnRyb2wgb2YKdGhlIHRlc3Q7IHRoaXMgbWVhbnMgbm8gZXh0ZXJuYWwgZGVwZW5kZW5j
aWVzLCB3aGljaCBtYWtlcyB0ZXN0cyBvcmRlcnMKb2YgbWFnbml0dWRlcyBmYXN0ZXIuIExpa2V3
aXNlLCBzaW5jZSB0aGVyZSBhcmUgbm8gZXh0ZXJuYWwgZGVwZW5kZW5jaWVzLAp0aGVyZSBhcmUg
bm8gaG9vcHMgdG8ganVtcCB0aHJvdWdoIHRvIHJ1biB0aGUgdGVzdHMuIEFkZGl0aW9uYWxseSwg
dGhpcwptYWtlcyB1bml0IHRlc3RzIGRldGVybWluaXN0aWM6IGEgZmFpbGluZyB1bml0IHRlc3Qg
YWx3YXlzIGluZGljYXRlcyBhCnByb2JsZW0uIEZpbmFsbHksIGJlY2F1c2UgdW5pdCB0ZXN0cyBu
ZWNlc3NhcmlseSBoYXZlIGZpbmVyIGdyYW51bGFyaXR5LAp0aGV5IGFyZSBhYmxlIHRvIHRlc3Qg
YWxsIGNvZGUgcGF0aHMgZWFzaWx5IHNvbHZpbmcgdGhlIGNsYXNzaWMgcHJvYmxlbQpvZiBkaWZm
aWN1bHR5IGluIGV4ZXJjaXNpbmcgZXJyb3IgaGFuZGxpbmcgY29kZS4KCiMjIyBJcyBLVW5pdCB0
cnlpbmcgdG8gcmVwbGFjZSBvdGhlciB0ZXN0aW5nIGZyYW1ld29ya3MgZm9yIHRoZSBrZXJuZWw/
CgpOby4gTW9zdCBleGlzdGluZyB0ZXN0cyBmb3IgdGhlIExpbnV4IGtlcm5lbCBhcmUgZW5kLXRv
LWVuZCB0ZXN0cywgd2hpY2gKaGF2ZSB0aGVpciBwbGFjZS4gQSB3ZWxsIHRlc3RlZCBzeXN0ZW0g
aGFzIGxvdHMgb2YgdW5pdCB0ZXN0cywgYQpyZWFzb25hYmxlIG51bWJlciBvZiBpbnRlZ3JhdGlv
biB0ZXN0cywgYW5kIHNvbWUgZW5kLXRvLWVuZCB0ZXN0cy4gS1VuaXQKaXMganVzdCB0cnlpbmcg
dG8gYWRkcmVzcyB0aGUgdW5pdCB0ZXN0IHNwYWNlIHdoaWNoIGlzIGN1cnJlbnRseSBub3QKYmVp
bmcgYWRkcmVzc2VkLgoKIyMjIE1vcmUgaW5mb3JtYXRpb24gb24gS1VuaXQKClRoZXJlIGlzIGEg
YnVuY2ggb2YgZG9jdW1lbnRhdGlvbiBuZWFyIHRoZSBlbmQgb2YgdGhpcyBwYXRjaCBzZXQgdGhh
dApkZXNjcmliZXMgaG93IHRvIHVzZSBLVW5pdCBhbmQgYmVzdCBwcmFjdGljZXMgZm9yIHdyaXRp
bmcgdW5pdCB0ZXN0cy4KRm9yIGNvbnZlbmllbmNlIEkgYW0gaG9zdGluZyB0aGUgY29tcGlsZWQg
ZG9jcyBoZXJlWzJdLgoKQWRkaXRpb25hbGx5IGZvciBjb252ZW5pZW5jZSwgSSBoYXZlIGFwcGxp
ZWQgdGhlc2UgcGF0Y2hlcyB0byBhCmJyYW5jaFszXS4gVGhlIHJlcG8gbWF5IGJlIGNsb25lZCB3
aXRoOgpnaXQgY2xvbmUgaHR0cHM6Ly9rdW5pdC5nb29nbGVzb3VyY2UuY29tL2xpbnV4ClRoaXMg
cGF0Y2hzZXQgaXMgb24gdGhlIGt1bml0L3JmYy92NS4zL3YxNSBicmFuY2guCgojIyBDaGFuZ2Vz
IFNpbmNlIExhc3QgVmVyc2lvbgoKLSBNb3ZlZCBjb21tZW50IGZyb20gaW5saW5lIGluIG1hY3Jv
IHRvIGtlcm5lbC1kb2MgdG8gYWRkcmVzcyBjaGVja3BhdGNoCiAgd2FybmluZy4KLSBEZW1vdGVk
IEJVRygpIHRvIFdBUk5fT04uCi0gRm9ybWF0dGVkIHNvbWUga2VybmVsLWRvYyBjb21tZW50cyB0
byBtYWtlIHRoZW0gbW9yZSByZWFkaWJsZS4KClsxXSBodHRwczovL2dvb2dsZS5naXRodWIuaW8v
a3VuaXQtZG9jcy90aGlyZF9wYXJ0eS9rZXJuZWwvZG9jcy91c2FnZS5odG1sI2t1bml0LW9uLW5v
bi11bWwtYXJjaGl0ZWN0dXJlcwpbMl0gaHR0cHM6Ly9nb29nbGUuZ2l0aHViLmlvL2t1bml0LWRv
Y3MvdGhpcmRfcGFydHkva2VybmVsL2RvY3MvClszXSBodHRwczovL2t1bml0Lmdvb2dsZXNvdXJj
ZS5jb20vbGludXgvKy9rdW5pdC9yZmMvdjUuMy92MTUKCi0tIAoyLjIzLjAuMTg3LmcxN2Y1Yjc1
NTZjLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
