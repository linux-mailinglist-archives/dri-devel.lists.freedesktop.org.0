Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EE9641C5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A27F8989E;
	Wed, 10 Jul 2019 07:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA8C897C3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 07:15:31 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id t19so920557pgh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 00:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=0pW1BcsjTPSHyEkMo96k/o71l5W8M51wh7ZyhpVzADM=;
 b=GaKnKPZUZ+ceba7+LdPr0FWypGKeldD9U73LVim/i77Bz8u6K3P4WBatmDHJeyArAA
 rJQ4BnXXGEJggsCX2unW2rDeWdR13lDK8zKffhykSvjYqwAqErllLT1VCifKCK5jCAWn
 BKeYzysaI6X1BGUc7d8etAESHo1OASPxbK7H3FjgCDR0fDJoxUNRM7QSpq+w4Ug9+JW/
 TxP1wPLcJ6pSYsM320gBkORiEQ/qrFEs8GDdtbVOGY7iLXVxVVjvcTJAmW282mspi5De
 pNtQASVhPn8TLBArl3UvmNqC3iROwCNIJJ0TaQENyuHyO31NBdIchFrkUKZbg4UdUsa5
 Ujtw==
X-Gm-Message-State: APjAAAVNsyRUyz69pUNshrUkZtxI/FA9zFrueUytpJMZ9+de3rBQWKw9
 p8lvuCiZv1WFULwYldQWXFmJZ5H4VBENCWEA1PNNYw==
X-Google-Smtp-Source: APXvYqyb0LRYaKSRSGjVUbWvUV4R01ShtwO7/fsNXpVB/VnszhSBSXJqqHQquziMhALgKYKtHVI7t5pL3wpE0iRmNMtOpg==
X-Received: by 2002:a63:1f56:: with SMTP id q22mr33295799pgm.315.1562742929971; 
 Wed, 10 Jul 2019 00:15:29 -0700 (PDT)
Date: Wed, 10 Jul 2019 00:14:50 -0700
Message-Id: <20190710071508.173491-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v8 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=0pW1BcsjTPSHyEkMo96k/o71l5W8M51wh7ZyhpVzADM=;
 b=mHi2l865KLWjgVk77JKmNtYGZe0xgmJqUcNAffie+cN+57XolMX3GDCpJ2ZH1ceLYR
 MfFyvnNY0Qwe0x/ZOIiekj7NzIlsbUZDTxthSd/LJOgqPFNF5dEsFtGMwPVF/nYSdHyJ
 3VdZcCGqzormHX3dS/yuInQiUg9E6laAPfQmLbGCGEz4HepJhwqJgmDJF7yj1dr6aCix
 Siqg+NV9jVwUY3x9AB0/e1BJUu0lC4cmATkNcO/Wd9E8nEXdmqgE1jZEc5mwC0ai37Am
 Pbg5JO4uqte1qi5grtXQRrH7O14tsuFUMbYzcI0pjXuihXi7w4+aV03+iVTZpiuzAPq1
 67HA==
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

IyMgVEw7RFIKClRoaXMgbmV3IHBhdGNoIHNldCBvbmx5IGNvbnRhaW5zIGEgdmVyeSBtaW5vciBj
aGFuZ2Ugc3VnZ2VzdGVkIGJ5Ck1hc2FoaXJvIHRvIFtQQVRDSCB2NyAwNi8xOF0gYW5kIGlzIG90
aGVyd2lzZSBpZGVudGljYWwgdG8gUEFUQ0ggdjcuCgpBbHNvLCB3aXRoIEpvc2gncyBhY2sgb24g
dGhlIHByZWNlZGluZyBwYXRjaCBzZXQsIEkgdGhpbmsgd2Ugbm93IGhhdmUKYWxsIG5lY2Vzc2Fy
eSByZXZpZXdzIGFuZCBhY2tzIGZyb20gYWxsIGludGVyZXN0ZWQgcGFydGllcy4KCiMjIEJhY2tn
cm91bmQKClRoaXMgcGF0Y2ggc2V0IHByb3Bvc2VzIEtVbml0LCBhIGxpZ2h0d2VpZ2h0IHVuaXQg
dGVzdGluZyBhbmQgbW9ja2luZwpmcmFtZXdvcmsgZm9yIHRoZSBMaW51eCBrZXJuZWwuCgpVbmxp
a2UgQXV0b3Rlc3QgYW5kIGtzZWxmdGVzdCwgS1VuaXQgaXMgYSB0cnVlIHVuaXQgdGVzdGluZyBm
cmFtZXdvcms7Cml0IGRvZXMgbm90IHJlcXVpcmUgaW5zdGFsbGluZyB0aGUga2VybmVsIG9uIGEg
dGVzdCBtYWNoaW5lIG9yIGluIGEgVk0KKGhvd2V2ZXIsIEtVbml0IHN0aWxsIGFsbG93cyB5b3Ug
dG8gcnVuIHRlc3RzIG9uIHRlc3QgbWFjaGluZXMgb3IgaW4gVk1zCmlmIHlvdSB3YW50WzFdKSBh
bmQgZG9lcyBub3QgcmVxdWlyZSB0ZXN0cyB0byBiZSB3cml0dGVuIGluIHVzZXJzcGFjZQpydW5u
aW5nIG9uIGEgaG9zdCBrZXJuZWwuIEFkZGl0aW9uYWxseSwgS1VuaXQgaXMgZmFzdDogRnJvbSBp
bnZvY2F0aW9uCnRvIGNvbXBsZXRpb24gS1VuaXQgY2FuIHJ1biBzZXZlcmFsIGRvemVuIHRlc3Rz
IGluIGFib3V0IGEgc2Vjb25kLgpDdXJyZW50bHksIHRoZSBlbnRpcmUgS1VuaXQgdGVzdCBzdWl0
ZSBmb3IgS1VuaXQgcnVucyBpbiB1bmRlciBhIHNlY29uZApmcm9tIHRoZSBpbml0aWFsIGludm9j
YXRpb24gKGJ1aWxkIHRpbWUgZXhjbHVkZWQpLgoKS1VuaXQgaXMgaGVhdmlseSBpbnNwaXJlZCBi
eSBKVW5pdCwgUHl0aG9uJ3MgdW5pdHRlc3QubW9jaywgYW5kCkdvb2dsZXRlc3QvR29vZ2xlbW9j
ayBmb3IgQysrLiBLVW5pdCBwcm92aWRlcyBmYWNpbGl0aWVzIGZvciBkZWZpbmluZwp1bml0IHRl
c3QgY2FzZXMsIGdyb3VwaW5nIHJlbGF0ZWQgdGVzdCBjYXNlcyBpbnRvIHRlc3Qgc3VpdGVzLCBw
cm92aWRpbmcKY29tbW9uIGluZnJhc3RydWN0dXJlIGZvciBydW5uaW5nIHRlc3RzLCBtb2NraW5n
LCBzcHlpbmcsIGFuZCBtdWNoIG1vcmUuCgojIyMgV2hhdCdzIHNvIHNwZWNpYWwgYWJvdXQgdW5p
dCB0ZXN0aW5nPwoKQSB1bml0IHRlc3QgaXMgc3VwcG9zZWQgdG8gdGVzdCBhIHNpbmdsZSB1bml0
IG9mIGNvZGUgaW4gaXNvbGF0aW9uLApoZW5jZSB0aGUgbmFtZS4gVGhlcmUgc2hvdWxkIGJlIG5v
IGRlcGVuZGVuY2llcyBvdXRzaWRlIHRoZSBjb250cm9sIG9mCnRoZSB0ZXN0OyB0aGlzIG1lYW5z
IG5vIGV4dGVybmFsIGRlcGVuZGVuY2llcywgd2hpY2ggbWFrZXMgdGVzdHMgb3JkZXJzCm9mIG1h
Z25pdHVkZXMgZmFzdGVyLiBMaWtld2lzZSwgc2luY2UgdGhlcmUgYXJlIG5vIGV4dGVybmFsIGRl
cGVuZGVuY2llcywKdGhlcmUgYXJlIG5vIGhvb3BzIHRvIGp1bXAgdGhyb3VnaCB0byBydW4gdGhl
IHRlc3RzLiBBZGRpdGlvbmFsbHksIHRoaXMKbWFrZXMgdW5pdCB0ZXN0cyBkZXRlcm1pbmlzdGlj
OiBhIGZhaWxpbmcgdW5pdCB0ZXN0IGFsd2F5cyBpbmRpY2F0ZXMgYQpwcm9ibGVtLiBGaW5hbGx5
LCBiZWNhdXNlIHVuaXQgdGVzdHMgbmVjZXNzYXJpbHkgaGF2ZSBmaW5lciBncmFudWxhcml0eSwK
dGhleSBhcmUgYWJsZSB0byB0ZXN0IGFsbCBjb2RlIHBhdGhzIGVhc2lseSBzb2x2aW5nIHRoZSBj
bGFzc2ljIHByb2JsZW0Kb2YgZGlmZmljdWx0eSBpbiBleGVyY2lzaW5nIGVycm9yIGhhbmRsaW5n
IGNvZGUuCgojIyMgSXMgS1VuaXQgdHJ5aW5nIHRvIHJlcGxhY2Ugb3RoZXIgdGVzdGluZyBmcmFt
ZXdvcmtzIGZvciB0aGUga2VybmVsPwoKTm8uIE1vc3QgZXhpc3RpbmcgdGVzdHMgZm9yIHRoZSBM
aW51eCBrZXJuZWwgYXJlIGVuZC10by1lbmQgdGVzdHMsIHdoaWNoCmhhdmUgdGhlaXIgcGxhY2Uu
IEEgd2VsbCB0ZXN0ZWQgc3lzdGVtIGhhcyBsb3RzIG9mIHVuaXQgdGVzdHMsIGEKcmVhc29uYWJs
ZSBudW1iZXIgb2YgaW50ZWdyYXRpb24gdGVzdHMsIGFuZCBzb21lIGVuZC10by1lbmQgdGVzdHMu
IEtVbml0CmlzIGp1c3QgdHJ5aW5nIHRvIGFkZHJlc3MgdGhlIHVuaXQgdGVzdCBzcGFjZSB3aGlj
aCBpcyBjdXJyZW50bHkgbm90CmJlaW5nIGFkZHJlc3NlZC4KCiMjIyBNb3JlIGluZm9ybWF0aW9u
IG9uIEtVbml0CgpUaGVyZSBpcyBhIGJ1bmNoIG9mIGRvY3VtZW50YXRpb24gbmVhciB0aGUgZW5k
IG9mIHRoaXMgcGF0Y2ggc2V0IHRoYXQKZGVzY3JpYmVzIGhvdyB0byB1c2UgS1VuaXQgYW5kIGJl
c3QgcHJhY3RpY2VzIGZvciB3cml0aW5nIHVuaXQgdGVzdHMuCkZvciBjb252ZW5pZW5jZSBJIGFt
IGhvc3RpbmcgdGhlIGNvbXBpbGVkIGRvY3MgaGVyZVsyXS4KCkFkZGl0aW9uYWxseSBmb3IgY29u
dmVuaWVuY2UsIEkgaGF2ZSBhcHBsaWVkIHRoZXNlIHBhdGNoZXMgdG8gYQpicmFuY2hbM10uIFRo
ZSByZXBvIG1heSBiZSBjbG9uZWQgd2l0aDoKZ2l0IGNsb25lIGh0dHBzOi8va3VuaXQuZ29vZ2xl
c291cmNlLmNvbS9saW51eApUaGlzIHBhdGNoc2V0IGlzIG9uIHRoZSBrdW5pdC9yZmMvdjUuMi92
OCBicmFuY2guCgojIyBDaGFuZ2VzIFNpbmNlIExhc3QgVmVyc2lvbgoKTGlrZSBJIHNhaWQgaW4g
dGhlIFRMO0RSLCB0aGVyZSBpcyBvbmx5IG9uZSBtaW5vciBjaGFuZ2Ugc2luY2UgdGhlCnByZXZp
b3VzIHJldmlzaW9uLiBUaGF0IGNoYW5nZSBvbmx5IGFmZmVjdHMgcGF0Y2ggMDYvMTg7IGl0IG1h
a2VzIGl0IHNvCnRoYXQgbWFrZSBkb2Vzbid0IGF0dGVtcHQgdG8gc2NhbiB0aGUga3VuaXQvIGRp
cmVjdG9yeSB3aGVuIENPTkZJR19LVU5JVAppcyBub3Qgc2V0IGFzIHN1Z2dlc3RlZCBieSBNYXNh
aGlyby4KClsxXSBodHRwczovL2dvb2dsZS5naXRodWIuaW8va3VuaXQtZG9jcy90aGlyZF9wYXJ0
eS9rZXJuZWwvZG9jcy91c2FnZS5odG1sI2t1bml0LW9uLW5vbi11bWwtYXJjaGl0ZWN0dXJlcwpb
Ml0gaHR0cHM6Ly9nb29nbGUuZ2l0aHViLmlvL2t1bml0LWRvY3MvdGhpcmRfcGFydHkva2VybmVs
L2RvY3MvClszXSBodHRwczovL2t1bml0Lmdvb2dsZXNvdXJjZS5jb20vbGludXgvKy9rdW5pdC9y
ZmMvdjUuMi92OAoKLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
