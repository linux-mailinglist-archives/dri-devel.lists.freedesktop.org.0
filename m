Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5497739520
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 21:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F6989A44;
	Fri,  7 Jun 2019 19:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB6389A44
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 19:00:48 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3E7A20868;
 Fri,  7 Jun 2019 19:00:47 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAAXuY3p4qhKVsSpQ44_kQeGDMfg7OuFLgFyxhcFWS3yf-5A_7g@mail.gmail.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-18-brendanhiggins@google.com>
 <20190517182254.548EA20815@mail.kernel.org>
 <CAAXuY3p4qhKVsSpQ44_kQeGDMfg7OuFLgFyxhcFWS3yf-5A_7g@mail.gmail.com>
To: Iurii Zaikin <yzaikin@google.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 17/18] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
User-Agent: alot/0.8.1
Date: Fri, 07 Jun 2019 12:00:47 -0700
Message-Id: <20190607190047.C3E7A20868@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559934047;
 bh=SaF9wNj2glMXJrUlhGfPV51XspfvGCl4GV+n5wOltIk=;
 h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
 b=pOa773KinCbWZNwUdN0H2jdZol+fGp2XY6GywMUyTl3QZS5pW9hFAAcg/RQpuePFb
 6lPWUUf3AvmyqHdMay0eDupbNJ7WbuBfNXwJ4jnDfqEl3Pw+6YKFdZVlrZIY2LFVvc
 bfbI2V1LcTAYX/HU3jn8XFwP21qj/1NllQ+0AO60=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 amir73il@gmail.com, Brendan Higgins <brendanhiggins@google.com>,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 yamada.masahiro@socionext.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-nvdimm@lists.01.org,
 frowand.list@gmail.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, jpoimboe@redhat.com,
 kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBJdXJpaSBaYWlraW4gKDIwMTktMDYtMDUgMTg6Mjk6NDIpCj4gT24gRnJpLCBNYXkg
MTcsIDIwMTkgYXQgMTE6MjIgQU0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiB3cm90
ZToKPiA+Cj4gPiBRdW90aW5nIEJyZW5kYW4gSGlnZ2lucyAoMjAxOS0wNS0xNCAxNToxNzoxMCkK
PiA+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9zeXNjdGwtdGVzdC5jIGIva2VybmVsL3N5c2N0bC10
ZXN0LmMKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAw
MC4uZmUwZjJiYWU2NjA4NQo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL2tlcm5lbC9z
eXNjdGwtdGVzdC5jCj4gPiA+ICsKPiA+ID4gKwo+ID4gPiArc3RhdGljIHZvaWQgc3lzY3RsX3Rl
c3RfZG9pbnR2ZWNfaGFwcHlfc2luZ2xlX25lZ2F0aXZlKHN0cnVjdCBrdW5pdCAqdGVzdCkKPiA+
ID4gK3sKPiA+ID4gKyAgICAgICBzdHJ1Y3QgY3RsX3RhYmxlIHRhYmxlID0gewo+ID4gPiArICAg
ICAgICAgICAgICAgLnByb2NuYW1lID0gImZvbyIsCj4gPiA+ICsgICAgICAgICAgICAgICAuZGF0
YSAgICAgICAgICAgPSAmdGVzdF9kYXRhLmludF8wMDAxLAo+ID4gPiArICAgICAgICAgICAgICAg
Lm1heGxlbiAgICAgICAgID0gc2l6ZW9mKGludCksCj4gPiA+ICsgICAgICAgICAgICAgICAubW9k
ZSAgICAgICAgICAgPSAwNjQ0LAo+ID4gPiArICAgICAgICAgICAgICAgLnByb2NfaGFuZGxlciAg
ID0gcHJvY19kb2ludHZlYywKPiA+ID4gKyAgICAgICAgICAgICAgIC5leHRyYTEgICAgICAgICA9
ICZpX3plcm8sCj4gPiA+ICsgICAgICAgICAgICAgICAuZXh0cmEyICAgICAgICAgPSAmaV9vbmVf
aHVuZHJlZCwKPiA+ID4gKyAgICAgICB9Owo+ID4gPiArICAgICAgIGNoYXIgaW5wdXRbXSA9ICIt
OSI7Cj4gPiA+ICsgICAgICAgc2l6ZV90IGxlbiA9IHNpemVvZihpbnB1dCkgLSAxOwo+ID4gPiAr
ICAgICAgIGxvZmZfdCBwb3MgPSAwOwo+ID4gPiArCj4gPiA+ICsgICAgICAgdGFibGUuZGF0YSA9
IGt1bml0X2t6YWxsb2ModGVzdCwgc2l6ZW9mKGludCksIEdGUF9VU0VSKTsKPiA+ID4gKyAgICAg
ICBLVU5JVF9FWFBFQ1RfRVEodGVzdCwgMCwgcHJvY19kb2ludHZlYygmdGFibGUsIDEsIGlucHV0
LCAmbGVuLCAmcG9zKSk7Cj4gPiA+ICsgICAgICAgS1VOSVRfRVhQRUNUX0VRKHRlc3QsIHNpemVv
ZihpbnB1dCkgLSAxLCBsZW4pOwo+ID4gPiArICAgICAgIEtVTklUX0VYUEVDVF9FUSh0ZXN0LCBz
aXplb2YoaW5wdXQpIC0gMSwgcG9zKTsKPiA+ID4gKyAgICAgICBLVU5JVF9FWFBFQ1RfRVEodGVz
dCwgLTksICooaW50ICopdGFibGUuZGF0YSk7Cj4gPgo+ID4gSXMgdGhlIGNhc3RpbmcgbmVjZXNz
YXJ5PyBPciBjYW4gdGhlIG1hY3JvIGRvIGEgdHlwZSBjb2VyY2lvbiBvZiB0aGUKPiA+IHNlY29u
ZCBwYXJhbWV0ZXIgYmFzZWQgb24gdGhlIGZpcnN0IHR5cGU/Cj4gIERhdGEgZmllbGQgaXMgZGVm
aW5lZCBhcyB2b2lkKiBzbyBJIGJlbGlldmUgY2FzdGluZyBpcyBuZWNlc3NhcnkgdG8KPiBkZXJl
ZmVyZW5jZSBpdCBhcyBhIHBvaW50ZXIgdG8gYW4gYXJyYXkgb2YgaW50cy4gSSBkb24ndCB0aGlu
ayB0aGUKPiBtYWNybyBzaG91bGQgZG8gYW55IHR5cGUgY29lcmNpb24gdGhhdCA9PSBvcGVyYXRv
ciB3b3VsZG4ndCBkby4KPiAgSSBkaWQgY2hhbmdlIHRoZSBjYXN0IHRvIG1ha2UgaXQgbW9yZSBj
bGVhciB0aGF0IGl0J3MgYSBwb2ludGVyIHRvIGFuCj4gYXJyYXkgb2YgaW50cyBiZWluZyBkZXJl
ZmVyZW5jZWQuCgpPaywgSSBzdGlsbCB3b25kZXIgaWYgd2Ugc2hvdWxkIG1ha2UgS1VOSVRfRVhQ
RUNUX0VRIGNoZWNrIHRoZSB0eXBlcyBvbgpib3RoIHNpZGVzIGFuZCBjYXVzZSBhIGJ1aWxkIHdh
cm5pbmcvZXJyb3IgaWYgdGhlIHR5cGVzIGFyZW4ndCB0aGUgc2FtZS4KVGhpcyB3b3VsZCBiZSBz
aW1pbGFyIHRvIG91ciBtaW4vbWF4IG1hY3JvcyB0aGF0IGNvbXBsYWluIGFib3V0Cm1pc21hdGNo
ZWQgdHlwZXMgaW4gdGhlIGNvbXBhcmlzb25zLiBUaGVuIGlmIGEgdGVzdCBkZXZlbG9wZXIgbmVl
ZHMgdG8KY29udmVydCBvbmUgdHlwZSBvciB0aGUgb3RoZXIgdGhleSBjb3VsZCBkbyBzbyB3aXRo
IGEKS1VOSVRfRVhQRUNUX0VRX1QoKSBtYWNybyB0aGF0IGxpc3RzIHRoZSB0eXBlcyB0byBjb2Vy
Y2UgYm90aCBzaWRlcyB0bwpleHBsaWNpdGx5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
