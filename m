Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64CE6685C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 10:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD556E2ED;
	Fri, 12 Jul 2019 08:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B8E6E2ED
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 08:17:51 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id c18so5292805pgk.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 01:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=UvKno1DQ1En2T0BAydqL8aKwWtOHxHpLOB0ZXuFETLs=;
 b=oPOwaid1CD+5675vbzT/nqxLzt5Fk02a7oQ+gEkWlaaX22wkiNQuNaR2pNdwZ/85wE
 8MApKYXS+gViKHC0dEXxX9eaYX3nQB3Vwg5M+IlEQo1i/Q/gy2CzqGm/mU3wJc2n4/et
 mVC0bA2mPtn7Z3JGWTqjvGnTqgYHHPFrcLpRJnpwrQqKYhL/NOSfm5+gnnwPzOUg/mMP
 VsazTlTmmY2xgk2ks3UN6tSr4G9R7NOcdxo+PfeabRl8crawznBCn4V+KE5iqgfDEuIi
 hde8BLN+5svDIV65rfhf+ep3sBKhWHeebsdKrn9e9g/ZJW5VlLh72jE8nnEm7ez94bFv
 ETyg==
X-Gm-Message-State: APjAAAWAilVqmHjBf4vjeRHP2Mz8lyWwE3Vc2r3f2PV3Y5bZkHCEcJjW
 LYoQqgPoWWX9AOfV4n/+P1QaSEBdjCfFMlXYlasH7w==
X-Google-Smtp-Source: APXvYqwxVjSSyLsmH5X5K9D5aFhrhgELvG+6tDMdeYJeUGZ3SfBpCQBrCaJmP5g1KYNhq+xNRut9+ZtuWUgQ3Ro3jfxY+Q==
X-Received: by 2002:a65:5348:: with SMTP id w8mr9232476pgr.176.1562919470178; 
 Fri, 12 Jul 2019 01:17:50 -0700 (PDT)
Date: Fri, 12 Jul 2019 01:17:26 -0700
Message-Id: <20190712081744.87097-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v9 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=UvKno1DQ1En2T0BAydqL8aKwWtOHxHpLOB0ZXuFETLs=;
 b=JtlStr7snNzmz5ulMB5eP37s7rbgIx50z+AVGP2t2WlEdfRbEZO8W2XTT3bE3WZnLv
 keBpChTguji20fGG9MZtiJLfIGuGAQMR0xBWsqfAPNv7xBwu2S4omSfLGIwdCobd9HG0
 xEIx+MC/l52zarabPfgQ095HslgbhlLi4Z2VOa7yRbXGn1OMnhIjlbG9wufHRgT48Rw8
 N31KLcKdJR3xIPKj8X7rcKFfr9bJzXFefGvAJSqFErU5ciZBVgJrNxh12tyuyphu+Fd0
 ntbZjblO4lofJT/rrUQvPdmmolFfkVV45QPFi2V3CSuuX8nBjrc2V4ynCPPNIkIg5MTd
 4B0w==
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
aGFuZ2UgdG8gYWRkcmVzcyBhIHNwYXJzZQp3YXJuaW5nIGluIHRoZSBQUk9DIFNZU0NUTCBLVW5p
dCB0ZXN0LiBPdGhlcndpc2UgdGhpcyBwYXRjaHNldCBpcwppZGVudGljYWwgdG8gdGhlIHByZXZp
b3VzLgoKQXMgSSBtZW50aW9uZWQgaW4gdGhlIHByZXZpb3VzIHBhdGNoc2V0LCBhbGwgcGF0Y2hl
cyBub3cgaGF2ZSBhY2tzIGFuZApyZXZpZXdzLgoKIyMgQmFja2dyb3VuZAoKVGhpcyBwYXRjaCBz
ZXQgcHJvcG9zZXMgS1VuaXQsIGEgbGlnaHR3ZWlnaHQgdW5pdCB0ZXN0aW5nIGFuZCBtb2NraW5n
CmZyYW1ld29yayBmb3IgdGhlIExpbnV4IGtlcm5lbC4KClVubGlrZSBBdXRvdGVzdCBhbmQga3Nl
bGZ0ZXN0LCBLVW5pdCBpcyBhIHRydWUgdW5pdCB0ZXN0aW5nIGZyYW1ld29yazsKaXQgZG9lcyBu
b3QgcmVxdWlyZSBpbnN0YWxsaW5nIHRoZSBrZXJuZWwgb24gYSB0ZXN0IG1hY2hpbmUgb3IgaW4g
YSBWTQooaG93ZXZlciwgS1VuaXQgc3RpbGwgYWxsb3dzIHlvdSB0byBydW4gdGVzdHMgb24gdGVz
dCBtYWNoaW5lcyBvciBpbiBWTXMKaWYgeW91IHdhbnRbMV0pIGFuZCBkb2VzIG5vdCByZXF1aXJl
IHRlc3RzIHRvIGJlIHdyaXR0ZW4gaW4gdXNlcnNwYWNlCnJ1bm5pbmcgb24gYSBob3N0IGtlcm5l
bC4gQWRkaXRpb25hbGx5LCBLVW5pdCBpcyBmYXN0OiBGcm9tIGludm9jYXRpb24KdG8gY29tcGxl
dGlvbiBLVW5pdCBjYW4gcnVuIHNldmVyYWwgZG96ZW4gdGVzdHMgaW4gYWJvdXQgYSBzZWNvbmQu
CkN1cnJlbnRseSwgdGhlIGVudGlyZSBLVW5pdCB0ZXN0IHN1aXRlIGZvciBLVW5pdCBydW5zIGlu
IHVuZGVyIGEgc2Vjb25kCmZyb20gdGhlIGluaXRpYWwgaW52b2NhdGlvbiAoYnVpbGQgdGltZSBl
eGNsdWRlZCkuCgpLVW5pdCBpcyBoZWF2aWx5IGluc3BpcmVkIGJ5IEpVbml0LCBQeXRob24ncyB1
bml0dGVzdC5tb2NrLCBhbmQKR29vZ2xldGVzdC9Hb29nbGVtb2NrIGZvciBDKysuIEtVbml0IHBy
b3ZpZGVzIGZhY2lsaXRpZXMgZm9yIGRlZmluaW5nCnVuaXQgdGVzdCBjYXNlcywgZ3JvdXBpbmcg
cmVsYXRlZCB0ZXN0IGNhc2VzIGludG8gdGVzdCBzdWl0ZXMsIHByb3ZpZGluZwpjb21tb24gaW5m
cmFzdHJ1Y3R1cmUgZm9yIHJ1bm5pbmcgdGVzdHMsIG1vY2tpbmcsIHNweWluZywgYW5kIG11Y2gg
bW9yZS4KCiMjIyBXaGF0J3Mgc28gc3BlY2lhbCBhYm91dCB1bml0IHRlc3Rpbmc/CgpBIHVuaXQg
dGVzdCBpcyBzdXBwb3NlZCB0byB0ZXN0IGEgc2luZ2xlIHVuaXQgb2YgY29kZSBpbiBpc29sYXRp
b24sCmhlbmNlIHRoZSBuYW1lLiBUaGVyZSBzaG91bGQgYmUgbm8gZGVwZW5kZW5jaWVzIG91dHNp
ZGUgdGhlIGNvbnRyb2wgb2YKdGhlIHRlc3Q7IHRoaXMgbWVhbnMgbm8gZXh0ZXJuYWwgZGVwZW5k
ZW5jaWVzLCB3aGljaCBtYWtlcyB0ZXN0cyBvcmRlcnMKb2YgbWFnbml0dWRlcyBmYXN0ZXIuIExp
a2V3aXNlLCBzaW5jZSB0aGVyZSBhcmUgbm8gZXh0ZXJuYWwgZGVwZW5kZW5jaWVzLAp0aGVyZSBh
cmUgbm8gaG9vcHMgdG8ganVtcCB0aHJvdWdoIHRvIHJ1biB0aGUgdGVzdHMuIEFkZGl0aW9uYWxs
eSwgdGhpcwptYWtlcyB1bml0IHRlc3RzIGRldGVybWluaXN0aWM6IGEgZmFpbGluZyB1bml0IHRl
c3QgYWx3YXlzIGluZGljYXRlcyBhCnByb2JsZW0uIEZpbmFsbHksIGJlY2F1c2UgdW5pdCB0ZXN0
cyBuZWNlc3NhcmlseSBoYXZlIGZpbmVyIGdyYW51bGFyaXR5LAp0aGV5IGFyZSBhYmxlIHRvIHRl
c3QgYWxsIGNvZGUgcGF0aHMgZWFzaWx5IHNvbHZpbmcgdGhlIGNsYXNzaWMgcHJvYmxlbQpvZiBk
aWZmaWN1bHR5IGluIGV4ZXJjaXNpbmcgZXJyb3IgaGFuZGxpbmcgY29kZS4KCiMjIyBJcyBLVW5p
dCB0cnlpbmcgdG8gcmVwbGFjZSBvdGhlciB0ZXN0aW5nIGZyYW1ld29ya3MgZm9yIHRoZSBrZXJu
ZWw/CgpOby4gTW9zdCBleGlzdGluZyB0ZXN0cyBmb3IgdGhlIExpbnV4IGtlcm5lbCBhcmUgZW5k
LXRvLWVuZCB0ZXN0cywgd2hpY2gKaGF2ZSB0aGVpciBwbGFjZS4gQSB3ZWxsIHRlc3RlZCBzeXN0
ZW0gaGFzIGxvdHMgb2YgdW5pdCB0ZXN0cywgYQpyZWFzb25hYmxlIG51bWJlciBvZiBpbnRlZ3Jh
dGlvbiB0ZXN0cywgYW5kIHNvbWUgZW5kLXRvLWVuZCB0ZXN0cy4gS1VuaXQKaXMganVzdCB0cnlp
bmcgdG8gYWRkcmVzcyB0aGUgdW5pdCB0ZXN0IHNwYWNlIHdoaWNoIGlzIGN1cnJlbnRseSBub3QK
YmVpbmcgYWRkcmVzc2VkLgoKIyMjIE1vcmUgaW5mb3JtYXRpb24gb24gS1VuaXQKClRoZXJlIGlz
IGEgYnVuY2ggb2YgZG9jdW1lbnRhdGlvbiBuZWFyIHRoZSBlbmQgb2YgdGhpcyBwYXRjaCBzZXQg
dGhhdApkZXNjcmliZXMgaG93IHRvIHVzZSBLVW5pdCBhbmQgYmVzdCBwcmFjdGljZXMgZm9yIHdy
aXRpbmcgdW5pdCB0ZXN0cy4KRm9yIGNvbnZlbmllbmNlIEkgYW0gaG9zdGluZyB0aGUgY29tcGls
ZWQgZG9jcyBoZXJlWzJdLgoKQWRkaXRpb25hbGx5IGZvciBjb252ZW5pZW5jZSwgSSBoYXZlIGFw
cGxpZWQgdGhlc2UgcGF0Y2hlcyB0byBhCmJyYW5jaFszXS4gVGhlIHJlcG8gbWF5IGJlIGNsb25l
ZCB3aXRoOgpnaXQgY2xvbmUgaHR0cHM6Ly9rdW5pdC5nb29nbGVzb3VyY2UuY29tL2xpbnV4ClRo
aXMgcGF0Y2hzZXQgaXMgb24gdGhlIGt1bml0L3JmYy92NS4yL3Y5IGJyYW5jaC4KCiMjIENoYW5n
ZXMgU2luY2UgTGFzdCBWZXJzaW9uCgpMaWtlIEkgc2FpZCBpbiB0aGUgVEw7RFIsIHRoZXJlIGlz
IG9ubHkgb25lIG1pbm9yIGNoYW5nZSBzaW5jZSB0aGUKcHJldmlvdXMgcmV2aXNpb24uIFRoYXQg
Y2hhbmdlIG9ubHkgYWZmZWN0cyBwYXRjaCAxNy8xODsgaXQgYWRkcmVzc2VzIGEKc3BhcnNlIHdh
cm5pbmcgaW4gdGhlIFBST0MgU1lTQ1RMIHVuaXQgdGVzdC4KClRoYW5rcyB0byBNYXNhaGlybyBm
b3IgYXBwbHlpbmcgcHJldmlvdXMgcGF0Y2hlcyB0byBhIGJyYW5jaCBpbiBoaXMKa2J1aWxkIHRy
ZWUgYW5kIHJ1bm5pbmcgc3BhcnNlIGFuZCBvdGhlciBzdGF0aWMgYW5hbHlzaXMgdG9vbHMgYWdh
aW5zdApteSBwYXRjaGVzLgoKWzFdIGh0dHBzOi8vZ29vZ2xlLmdpdGh1Yi5pby9rdW5pdC1kb2Nz
L3RoaXJkX3BhcnR5L2tlcm5lbC9kb2NzL3VzYWdlLmh0bWwja3VuaXQtb24tbm9uLXVtbC1hcmNo
aXRlY3R1cmVzClsyXSBodHRwczovL2dvb2dsZS5naXRodWIuaW8va3VuaXQtZG9jcy90aGlyZF9w
YXJ0eS9rZXJuZWwvZG9jcy8KWzNdIGh0dHBzOi8va3VuaXQuZ29vZ2xlc291cmNlLmNvbS9saW51
eC8rL2t1bml0L3JmYy92NS4yL3Y5CgotLSAKMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
