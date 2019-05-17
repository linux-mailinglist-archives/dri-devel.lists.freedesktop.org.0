Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EEA2115D
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 02:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6368289791;
	Fri, 17 May 2019 00:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB3C89791
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 00:38:47 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0962F2082E;
 Fri, 17 May 2019 00:38:47 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190514221711.248228-3-brendanhiggins@google.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-3-brendanhiggins@google.com>
Subject: Re: [PATCH v4 02/18] kunit: test: add test resource management API
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Thu, 16 May 2019 17:38:46 -0700
Message-Id: <20190517003847.0962F2082E@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558053527;
 bh=h7x4s8lT+SFQAKT2oROUOwG99nmbA/iuhNAdlGK/1zk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=pwJefM32rVyc17BV4NKTMNz9bAtRXF3fs8QXDQmfCoQ8dGWwvrJtKIhWefJVALK8E
 uExHbjAOgbiFZVFaM8n4hSxNXniqu1kMlprj5ffN87QHOgHX7iyfmP5RLT5V0AIfD4
 Pob5g1PWM6wWtC9518tZ1d/0IihjJAgMh1BsvFf4=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDUtMTQgMTU6MTY6NTUpCj4gZGlmZiAtLWdp
dCBhL2t1bml0L3Rlc3QuYyBiL2t1bml0L3Rlc3QuYwo+IGluZGV4IDg2ZjY1YmEyYmNmOTIuLmEx
NWU2ZjhjNDE1ODIgMTAwNjQ0Cj4gLS0tIGEva3VuaXQvdGVzdC5jCj4gKysrIGIva3VuaXQvdGVz
dC5jClsuLl0KPiArCj4gK3ZvaWQgKmt1bml0X2ttYWxsb2Moc3RydWN0IGt1bml0ICp0ZXN0LCBz
aXplX3Qgc2l6ZSwgZ2ZwX3QgZ2ZwKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qga3VuaXRfa21hbGxv
Y19wYXJhbXMgcGFyYW1zOwo+ICsgICAgICAgc3RydWN0IGt1bml0X3Jlc291cmNlICpyZXM7Cj4g
Kwo+ICsgICAgICAgcGFyYW1zLnNpemUgPSBzaXplOwo+ICsgICAgICAgcGFyYW1zLmdmcCA9IGdm
cDsKPiArCj4gKyAgICAgICByZXMgPSBrdW5pdF9hbGxvY19yZXNvdXJjZSh0ZXN0LAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3VuaXRfa21hbGxvY19pbml0LAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3VuaXRfa21hbGxvY19mcmVlLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBhcmFtcyk7Cj4gKwo+ICsgICAgICAgaWYg
KHJlcykKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJlcy0+YWxsb2NhdGlvbjsKPiArICAgICAg
IGVsc2UKPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7CgpDYW4gYmUgd3JpdHRlbiBhcwoK
CWlmIChyZXMpCgkJcmV0dXJuIC4uLi4KCXJldHVybiAKCmFuZCBzb21lIHN0YXRpYyBhbmFseXNp
cyB0b29scyBwcmVmZXIgdGhpcy4KCj4gK30KPiArCj4gK3ZvaWQga3VuaXRfY2xlYW51cChzdHJ1
Y3Qga3VuaXQgKnRlc3QpCj4gK3sKPiArICAgICAgIHN0cnVjdCBrdW5pdF9yZXNvdXJjZSAqcmVz
b3VyY2UsICpyZXNvdXJjZV9zYWZlOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiAr
Cj4gKyAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmdGVzdC0+bG9jaywgZmxhZ3MpOwoKQWggb2ss
IHRlc3QtPmxvY2sgaXMgcHJvdGVjdGluZyBldmVyeXRoaW5nIG5vdz8gRG9lcyBpdCBuZWVkIHRv
IGJlIGEKc3BpbmxvY2ssIG9yIGNhbiBpdCBiZSBhIG11dGV4PwoKPiArICAgICAgIGxpc3RfZm9y
X2VhY2hfZW50cnlfc2FmZShyZXNvdXJjZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXNvdXJjZV9zYWZlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ0
ZXN0LT5yZXNvdXJjZXMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbm9kZSkg
ewo+ICsgICAgICAgICAgICAgICBrdW5pdF9mcmVlX3Jlc291cmNlKHRlc3QsIHJlc291cmNlKTsK
PiArICAgICAgIH0KPiArICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnRlc3QtPmxvY2ss
IGZsYWdzKTsKPiArfQo+ICsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
