Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EE63D5CF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E9E89186;
	Tue, 11 Jun 2019 18:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9763A89117
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:50:18 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E1C021744;
 Tue, 11 Jun 2019 18:50:18 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190611175830.GA236872@google.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-18-brendanhiggins@google.com>
 <20190517182254.548EA20815@mail.kernel.org>
 <CAAXuY3p4qhKVsSpQ44_kQeGDMfg7OuFLgFyxhcFWS3yf-5A_7g@mail.gmail.com>
 <20190607190047.C3E7A20868@mail.kernel.org>
 <20190611175830.GA236872@google.com>
To: Brendan Higgins <brendanhiggins@google.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 17/18] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
User-Agent: alot/0.8.1
Date: Tue, 11 Jun 2019 11:50:17 -0700
Message-Id: <20190611185018.2E1C021744@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560279018;
 bh=KSPugbVcFVjo2LRDUR30DOGlfU301RbHfc51FMakphQ=;
 h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
 b=eUcQmeuoyqCS292prTem1gEJTNrE/i4/3mRNGwiqnO3Tx9yQumA1yteW7iEE4JN1g
 eh2ADC167gKmUCTbEgDbjScSG5xLnIHWi5uWk5SVDUlKT9arAGeIY6q58Nsi/mtoWM
 Sissolu8Hy/cpsaYhChLTjhjFekH7GFD9BeulHFI=
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
 amir73il@gmail.com, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, yamada.masahiro@socionext.com,
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, Iurii Zaikin <yzaikin@google.com>, jdike@addtoit.com,
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDYtMTEgMTA6NTg6MzApCj4gT24gRnJpLCBK
dW4gMDcsIDIwMTkgYXQgMTI6MDA6NDdQTSAtMDcwMCwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+ID4g
UXVvdGluZyBJdXJpaSBaYWlraW4gKDIwMTktMDYtMDUgMTg6Mjk6NDIpCj4gPiA+IE9uIEZyaSwg
TWF5IDE3LCAyMDE5IGF0IDExOjIyIEFNIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBRdW90aW5nIEJyZW5kYW4gSGlnZ2lucyAoMjAxOS0wNS0x
NCAxNToxNzoxMCkKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9rZXJuZWwvc3lzY3RsLXRlc3QuYyBi
L2tlcm5lbC9zeXNjdGwtdGVzdC5jCj4gPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4g
PiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4uZmUwZjJiYWU2NjA4NQo+ID4gPiA+ID4gLS0tIC9k
ZXYvbnVsbAo+ID4gPiA+ID4gKysrIGIva2VybmVsL3N5c2N0bC10ZXN0LmMKPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgdm9pZCBzeXNjdGxfdGVzdF9kb2ludHZlY19o
YXBweV9zaW5nbGVfbmVnYXRpdmUoc3RydWN0IGt1bml0ICp0ZXN0KQo+ID4gPiA+ID4gK3sKPiA+
ID4gPiA+ICsgICAgICAgc3RydWN0IGN0bF90YWJsZSB0YWJsZSA9IHsKPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAucHJvY25hbWUgPSAiZm9vIiwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAu
ZGF0YSAgICAgICAgICAgPSAmdGVzdF9kYXRhLmludF8wMDAxLAo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgIC5tYXhsZW4gICAgICAgICA9IHNpemVvZihpbnQpLAo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgIC5tb2RlICAgICAgICAgICA9IDA2NDQsCj4gPiA+ID4gPiArICAgICAgICAgICAgICAg
LnByb2NfaGFuZGxlciAgID0gcHJvY19kb2ludHZlYywKPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAuZXh0cmExICAgICAgICAgPSAmaV96ZXJvLAo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIC5l
eHRyYTIgICAgICAgICA9ICZpX29uZV9odW5kcmVkLAo+ID4gPiA+ID4gKyAgICAgICB9Owo+ID4g
PiA+ID4gKyAgICAgICBjaGFyIGlucHV0W10gPSAiLTkiOwo+ID4gPiA+ID4gKyAgICAgICBzaXpl
X3QgbGVuID0gc2l6ZW9mKGlucHV0KSAtIDE7Cj4gPiA+ID4gPiArICAgICAgIGxvZmZfdCBwb3Mg
PSAwOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICB0YWJsZS5kYXRhID0ga3VuaXRfa3ph
bGxvYyh0ZXN0LCBzaXplb2YoaW50KSwgR0ZQX1VTRVIpOwo+ID4gPiA+ID4gKyAgICAgICBLVU5J
VF9FWFBFQ1RfRVEodGVzdCwgMCwgcHJvY19kb2ludHZlYygmdGFibGUsIDEsIGlucHV0LCAmbGVu
LCAmcG9zKSk7Cj4gPiA+ID4gPiArICAgICAgIEtVTklUX0VYUEVDVF9FUSh0ZXN0LCBzaXplb2Yo
aW5wdXQpIC0gMSwgbGVuKTsKPiA+ID4gPiA+ICsgICAgICAgS1VOSVRfRVhQRUNUX0VRKHRlc3Qs
IHNpemVvZihpbnB1dCkgLSAxLCBwb3MpOwo+ID4gPiA+ID4gKyAgICAgICBLVU5JVF9FWFBFQ1Rf
RVEodGVzdCwgLTksICooaW50ICopdGFibGUuZGF0YSk7Cj4gPiA+ID4KPiA+ID4gPiBJcyB0aGUg
Y2FzdGluZyBuZWNlc3Nhcnk/IE9yIGNhbiB0aGUgbWFjcm8gZG8gYSB0eXBlIGNvZXJjaW9uIG9m
IHRoZQo+ID4gPiA+IHNlY29uZCBwYXJhbWV0ZXIgYmFzZWQgb24gdGhlIGZpcnN0IHR5cGU/Cj4g
PiA+ICBEYXRhIGZpZWxkIGlzIGRlZmluZWQgYXMgdm9pZCogc28gSSBiZWxpZXZlIGNhc3Rpbmcg
aXMgbmVjZXNzYXJ5IHRvCj4gPiA+IGRlcmVmZXJlbmNlIGl0IGFzIGEgcG9pbnRlciB0byBhbiBh
cnJheSBvZiBpbnRzLiBJIGRvbid0IHRoaW5rIHRoZQo+ID4gPiBtYWNybyBzaG91bGQgZG8gYW55
IHR5cGUgY29lcmNpb24gdGhhdCA9PSBvcGVyYXRvciB3b3VsZG4ndCBkby4KPiA+ID4gIEkgZGlk
IGNoYW5nZSB0aGUgY2FzdCB0byBtYWtlIGl0IG1vcmUgY2xlYXIgdGhhdCBpdCdzIGEgcG9pbnRl
ciB0byBhbgo+ID4gPiBhcnJheSBvZiBpbnRzIGJlaW5nIGRlcmVmZXJlbmNlZC4KPiA+IAo+ID4g
T2ssIEkgc3RpbGwgd29uZGVyIGlmIHdlIHNob3VsZCBtYWtlIEtVTklUX0VYUEVDVF9FUSBjaGVj
ayB0aGUgdHlwZXMgb24KPiA+IGJvdGggc2lkZXMgYW5kIGNhdXNlIGEgYnVpbGQgd2FybmluZy9l
cnJvciBpZiB0aGUgdHlwZXMgYXJlbid0IHRoZSBzYW1lLgo+ID4gVGhpcyB3b3VsZCBiZSBzaW1p
bGFyIHRvIG91ciBtaW4vbWF4IG1hY3JvcyB0aGF0IGNvbXBsYWluIGFib3V0Cj4gPiBtaXNtYXRj
aGVkIHR5cGVzIGluIHRoZSBjb21wYXJpc29ucy4gVGhlbiBpZiBhIHRlc3QgZGV2ZWxvcGVyIG5l
ZWRzIHRvCj4gPiBjb252ZXJ0IG9uZSB0eXBlIG9yIHRoZSBvdGhlciB0aGV5IGNvdWxkIGRvIHNv
IHdpdGggYQo+ID4gS1VOSVRfRVhQRUNUX0VRX1QoKSBtYWNybyB0aGF0IGxpc3RzIHRoZSB0eXBl
cyB0byBjb2VyY2UgYm90aCBzaWRlcyB0bwo+ID4gZXhwbGljaXRseS4KPiAKPiBEbyB5b3UgdGhp
bmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGRvIGEgcGhvbnkgY29tcGFyZSBzaW1pbGFyIHRvIGhv
dwo+IG1pbi9tYXggdXNlZCB0byB3b3JrIHByaW9yIHRvIDQuMTcsIG9yIHRvIHVzZSB0aGUgbmV3
IF9fdHlwZWNoZWNrKC4uLikKPiBtYWNybz8gVGhpcyBtaWdodCBzZWVtIGxpa2UgYSBkdW1iIHF1
ZXN0aW9uIChhbmQgbWF5YmUgaXQgaXMpLCBidXQgSXVyaWkKPiBhbmQgSSB0aG91Z2h0IHRoZSBm
b3JtZXIgY3JlYXRlZCBhbiBlcnJvciBtZXNzYWdlIHRoYXQgd2FzIGEgYml0IGVhc2llcgo+IHRv
IHVuZGVyc3RhbmQsIHdoZXJlYXMgX190eXBlY2hlY2sgaXMgb2J2aW91c2x5IHN1cGVyaW9yIGlu
IHRlcm1zIG9mCj4gY29kZSByZXVzZS4KPiAKPiBUaGlzIGlzIHdoYXQgd2UgYXJlIHRoaW5raW5n
IHJpZ2h0IG5vdzsgaWYgeW91IGRvbid0IGhhdmUgYW55IGNvbXBsYWludHMKPiBJIHdpbGwgc3F1
YXNoIGl0IGludG8gdGhlIHJlbGV2YW50IGNvbW1pdHMgb24gdGhlIG5leHQgcmV2aXNpb246CgpD
YW4geW91IHByb3ZpZGUgdGhlIGRpZmZlcmVuY2UgaW4gZXJyb3IgbWVzc2FnZXMgYW5kIGRlc2Ny
aWJlIHRoYXQgaW4KdGhlIGNvbW1pdCB0ZXh0PyBUaGUgY29tbWl0IG1lc3NhZ2UgaXMgd2hlcmUg
eW91ICJzZWxsIiB0aGUgcGF0Y2gsIHNvCmJlaW5nIGFibGUgdG8gY29tcGFyZSB0aGUgdHJhZGVv
ZmYgb2YgaGF2aW5nIGFub3RoZXIgbWFjcm8gdG8gZG8gdHlwZQpjb21wYXJpc29ucyB2cy4gcmV1
c2luZyB0aGUgb25lIHRoYXQncyB0aGVyZSBpbiBrZXJuZWwuaCB3b3VsZCBiZSB1c2VmdWwKdG8g
YWxsYXkgY29uY2VybnMgdGhhdCB3ZSdyZSBkdXBsaWNhdGluZyBsb2dpYyBmb3IgYmV0dGVyIGVy
cm9yCm1lc3NhZ2VzLgoKSG9uZXN0bHksIEknZCBwcmVmZXIgd2UganVzdCB1c2UgdGhlIG1hY3Jv
cyB0aGF0IHdlJ3ZlIGRldmVsb3BlZCBpbgprZXJuZWwuaCB0byBkbyBjb21wYXJpc29ucyBoZXJl
IHNvIHRoYXQgd2UgY2FuIGdldCBjb2RlIHJldXNlLCBidXQgbW9yZQppbXBvcnRhbnRseSBzbyB0
aGF0IHdlIGRvbid0IHRyaXAgb3ZlciBwcm9ibGVtcyB0aGF0IGNhdXNlZCB0aG9zZSBtYWNyb3MK
dG8gYmUgY3JlYXRlZCBpbiB0aGUgZmlyc3QgcGxhY2UuIElmIHRoZSBlcnJvciBtZXNzYWdlIGlz
IGJhZCwgcGVyaGFwcwp0aGF0IGNhbiBiZSBmaXhlZCB3aXRoIHNvbWUgc29ydCBvZiBjb21waWxl
ciBkaXJlY3RpdmUgdG8gbWFrZSB0aGUgZXJyb3IKbWVzc2FnZSBhIGxpdHRsZSBtb3JlIHVzZWZ1
bCwgaS5lLiBjb21waWxldGltZV93YXJuaW5nKCkgdGhyb3duIGludG8KX190eXBlY2hlY2soKSBv
ciBzb21ldGhpbmcuCgo+IC0tLQo+IEZyb206IEl1cmlpIFphaWtpbiA8eXphaWtpbkBnb29nbGUu
Y29tPgo+IAo+IEFkZHMgYSB3YXJuaW5nIG1lc3NhZ2Ugd2hlbiBjb21wYXJpbmcgdmFsdWVzIG9m
IGRpZmZlcmVudCB0eXBlcyBzaW1pbGFyCj4gdG8gd2hhdCBtaW4oKSAvIG1heCgpIG1hY3JvcyBk
by4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJdXJpaSBaYWlraW4gPHl6YWlraW5AZ29vZ2xlLmNvbT4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
