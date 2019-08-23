Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 282BA9B636
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 20:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB3F6ED15;
	Fri, 23 Aug 2019 18:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96C16ED16
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 18:32:16 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE6B820850;
 Fri, 23 Aug 2019 18:32:13 +0000 (UTC)
Subject: Re: [PATCH v14 01/18] kunit: test: add KUnit test runner core
To: Brendan Higgins <brendanhiggins@google.com>
References: <20190820232046.50175-1-brendanhiggins@google.com>
 <20190820232046.50175-2-brendanhiggins@google.com>
 <7f2c8908-75f6-b793-7113-ad57c51777ce@kernel.org>
 <CAFd5g44mRK9t4f58i_YMEt=e9RTxwrrhFY_V2LW_E7bUwR3cdg@mail.gmail.com>
 <4513d9f3-a69b-a9a4-768b-86c2962b62e0@kernel.org>
 <CAFd5g446J=cVW4QW+QeZMLDi+ANqshAW6KTrFFBTusPcdr6-GA@mail.gmail.com>
 <42c6235c-c586-8de1-1913-7cf1962c6066@kernel.org>
 <CAFd5g44hLgeqPtNw1zQ5k_+apBm=ri_6=wAgHk=oPOvQs6xgNg@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <54f3c011-d666-e828-5e77-359b7a7374e7@kernel.org>
Date: Fri, 23 Aug 2019 12:32:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g44hLgeqPtNw1zQ5k_+apBm=ri_6=wAgHk=oPOvQs6xgNg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566585136;
 bh=OphVK+Oj0NCE57doJUamX1ycmaZZJs0vBSwvonrMDJo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=0h6u0d4NuYP6VaSFcLNAuad38vRWJ57eWJLXxGtQ4JJHO88PWzl8oJ4tJq7FaMxjA
 Yz29nK0VmL9IqtZXRvwCyQXs+EroYz8qcgzVVSON4ehFiyFj8cdhmlzoTksNyRyciT
 zrPV2Cc4zlsDpETknamqTofuiYeQBy1EKbMMqw/M=
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, shuah <shuah@kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMy8xOSAxMTo1NCBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+IE9uIEZyaSwgQXVn
IDIzLCAyMDE5IGF0IDEwOjM0IEFNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3cm90ZToKPj4K
Pj4gT24gOC8yMy8xOSAxMToyNyBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+Pj4gT24gRnJp
LCBBdWcgMjMsIDIwMTkgYXQgMTA6MDUgQU0gc2h1YWggPHNodWFoQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Pj4+Cj4+Pj4gT24gOC8yMy8xOSAxMDo0OCBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+
Pj4+PiBPbiBGcmksIEF1ZyAyMywgMjAxOSBhdCA4OjMzIEFNIHNodWFoIDxzaHVhaEBrZXJuZWwu
b3JnPiB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBIaSBCcmVuZGFuLAo+Pj4+Pj4KPj4+Pj4+IE9uIDgv
MjAvMTkgNToyMCBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+Pj4+Pj4+IEFkZCBjb3JlIGZh
Y2lsaXRpZXMgZm9yIGRlZmluaW5nIHVuaXQgdGVzdHM7IHRoaXMgcHJvdmlkZXMgYSBjb21tb24g
d2F5Cj4+Pj4+Pj4gdG8gZGVmaW5lIHRlc3QgY2FzZXMsIGZ1bmN0aW9ucyB0aGF0IGV4ZWN1dGUg
Y29kZSB3aGljaCBpcyB1bmRlciB0ZXN0Cj4+Pj4+Pj4gYW5kIGRldGVybWluZSB3aGV0aGVyIHRo
ZSBjb2RlIHVuZGVyIHRlc3QgYmVoYXZlcyBhcyBleHBlY3RlZDsgdGhpcyBhbHNvCj4+Pj4+Pj4g
cHJvdmlkZXMgYSB3YXkgdG8gZ3JvdXAgdG9nZXRoZXIgcmVsYXRlZCB0ZXN0IGNhc2VzIGluIHRl
c3Qgc3VpdGVzIChoZXJlCj4+Pj4+Pj4gd2UgY2FsbCB0aGVtIHRlc3RfbW9kdWxlcykuCj4+Pj4+
Pj4KPj4+Pj4+PiBKdXN0IGRlZmluZSB0ZXN0IGNhc2VzIGFuZCBob3cgdG8gZXhlY3V0ZSB0aGVt
IGZvciBub3c7IHNldHRpbmcKPj4+Pj4+PiBleHBlY3RhdGlvbnMgb24gY29kZSB3aWxsIGJlIGRl
ZmluZWQgbGF0ZXIuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dp
bnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4+Pj4+Pj4gUmV2aWV3ZWQtYnk6IEdyZWcg
S3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4+Pj4+Pj4gUmV2aWV3
ZWQtYnk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KPj4+Pj4+PiBSZXZp
ZXdlZC1ieTogTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+Cj4+Pj4+Pj4gUmV2
aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KPj4+Pj4+PiAtLS0KPj4+
Pj4+PiAgICAgIGluY2x1ZGUva3VuaXQvdGVzdC5oIHwgMTc5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPj4+Pj4+PiAgICAgIGt1bml0L0tjb25maWcgICAgICAgIHwg
IDE3ICsrKysKPj4+Pj4+PiAgICAgIGt1bml0L01ha2VmaWxlICAgICAgIHwgICAxICsKPj4+Pj4+
PiAgICAgIGt1bml0L3Rlc3QuYyAgICAgICAgIHwgMTkxICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPj4+Pj4+PiAgICAgIDQgZmlsZXMgY2hhbmdlZCwgMzg4IGlu
c2VydGlvbnMoKykKPj4+Pj4+PiAgICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2t1bml0
L3Rlc3QuaAo+Pj4+Pj4+ICAgICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGt1bml0L0tjb25maWcKPj4+
Pj4+PiAgICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBrdW5pdC9NYWtlZmlsZQo+Pj4+Pj4+ICAgICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGt1bml0L3Rlc3QuYwo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUva3VuaXQvdGVzdC5oIGIvaW5jbHVkZS9rdW5pdC90ZXN0LmgKPj4+Pj4+PiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmUwYjM0YWNi
OWVlNGUKPj4+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+Pj4gKysrIGIvaW5jbHVkZS9rdW5pdC90
ZXN0LmgKPj4+Pj4+PiBAQCAtMCwwICsxLDE3OSBAQAo+Pj4+Pj4+ICsvKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMCAqLwo+Pj4+Pj4+ICsvKgo+Pj4+Pj4+ICsgKiBCYXNlIHVuaXQg
dGVzdCAoS1VuaXQpIEFQSS4KPj4+Pj4+PiArICoKPj4+Pj4+PiArICogQ29weXJpZ2h0IChDKSAy
MDE5LCBHb29nbGUgTExDLgo+Pj4+Pj4+ICsgKiBBdXRob3I6IEJyZW5kYW4gSGlnZ2lucyA8YnJl
bmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPj4+Pj4+PiArICovCj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsj
aWZuZGVmIF9LVU5JVF9URVNUX0gKPj4+Pj4+PiArI2RlZmluZSBfS1VOSVRfVEVTVF9ICj4+Pj4+
Pj4gKwo+Pj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4+Pj4+PiArCj4+Pj4+Pj4g
K3N0cnVjdCBrdW5pdDsKPj4+Pj4+PiArCj4+Pj4+Pj4gKy8qKgo+Pj4+Pj4+ICsgKiBzdHJ1Y3Qg
a3VuaXRfY2FzZSAtIHJlcHJlc2VudHMgYW4gaW5kaXZpZHVhbCB0ZXN0IGNhc2UuCj4+Pj4+Pj4g
KyAqIEBydW5fY2FzZTogdGhlIGZ1bmN0aW9uIHJlcHJlc2VudGluZyB0aGUgYWN0dWFsIHRlc3Qg
Y2FzZS4KPj4+Pj4+PiArICogQG5hbWU6IHRoZSBuYW1lIG9mIHRoZSB0ZXN0IGNhc2UuCj4+Pj4+
Pj4gKyAqCj4+Pj4+Pj4gKyAqIEEgdGVzdCBjYXNlIGlzIGEgZnVuY3Rpb24gd2l0aCB0aGUgc2ln
bmF0dXJlLCBgYHZvaWQgKCopKHN0cnVjdCBrdW5pdCAqKWBgCj4+Pj4+Pj4gKyAqIHRoYXQgbWFr
ZXMgZXhwZWN0YXRpb25zIChzZWUgS1VOSVRfRVhQRUNUX1RSVUUoKSkgYWJvdXQgY29kZSB1bmRl
ciB0ZXN0LiBFYWNoCj4+Pj4+Pj4gKyAqIHRlc3QgY2FzZSBpcyBhc3NvY2lhdGVkIHdpdGggYSAm
c3RydWN0IGt1bml0X3N1aXRlIGFuZCB3aWxsIGJlIHJ1biBhZnRlciB0aGUKPj4+Pj4+PiArICog
c3VpdGUncyBpbml0IGZ1bmN0aW9uIGFuZCBmb2xsb3dlZCBieSB0aGUgc3VpdGUncyBleGl0IGZ1
bmN0aW9uLgo+Pj4+Pj4+ICsgKgo+Pj4+Pj4+ICsgKiBBIHRlc3QgY2FzZSBzaG91bGQgYmUgc3Rh
dGljIGFuZCBzaG91bGQgb25seSBiZSBjcmVhdGVkIHdpdGggdGhlIEtVTklUX0NBU0UoKQo+Pj4+
Pj4+ICsgKiBtYWNybzsgYWRkaXRpb25hbGx5LCBldmVyeSBhcnJheSBvZiB0ZXN0IGNhc2VzIHNo
b3VsZCBiZSB0ZXJtaW5hdGVkIHdpdGggYW4KPj4+Pj4+PiArICogZW1wdHkgdGVzdCBjYXNlLgo+
Pj4+Pj4+ICsgKgo+Pj4+Pj4+ICsgKiBFeGFtcGxlOgo+Pj4+Pj4KPj4+Pj4+IENhbiB5b3UgZml4
IHRoZXNlIGxpbmUgY29udGludWF0aW9ucy4gSXQgbWFrZXMgaXQgdmVyeSBoYXJkIHRvIHJlYWQu
Cj4+Pj4+PiBTb3JyeSBmb3IgdGhpcyBsYXRlIGNvbW1lbnQuIFRoZXNlIGNvbW1lbnRzIGxpbmVz
IGFyZSBsb25nZXIgdGhhbiA4MAo+Pj4+Pj4gYW5kIHdyYXAuCj4+Pj4+Cj4+Pj4+IE5vbmUgb2Yg
dGhlIGxpbmVzIGluIHRoaXMgY29tbWl0IGFyZSBvdmVyIDgwIGNoYXJhY3RlcnMgaW4gY29sdW1u
Cj4+Pj4+IHdpZHRoLiBTb21lIGFyZSBleGFjdGx5IDgwIGNoYXJhY3RlcnMgKGxpa2UgYWJvdmUp
Lgo+Pj4+Pgo+Pj4+PiBNeSBndWVzcyBpcyB0aGF0IHlvdSBhcmUgc2VlaW5nIHRoZSBkaWZmIGFk
ZGVkIHRleHQgKCsgKSwgd2hpY2ggd2hlbgo+Pj4+PiB5b3UgYWRkIHRoYXQgdG8gYSBsaW5lIHdo
aWNoIGlzIGV4YWN0bHkgODAgY2hhciBpbiBsZW5ndGggZW5kcyB1cAo+Pj4+PiBiZWluZyBvdmVy
IDgwIGNoYXIgaW4gZW1haWwuIElmIHlvdSBhcHBseSB0aGUgcGF0Y2ggeW91IHdpbGwgc2VlIHRo
YXQKPj4+Pj4gdGhleSBhcmUgb25seSA4MCBjaGFycy4KPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBUaGVy
ZSBhcmUgc2V2ZXJhbCBjb21tZW50IGxpbmVzIGluIHRoZSBmaWxlIHRoYXQgYXJlIHdheSB0b28g
bG9uZy4KPj4+Pj4KPj4+Pj4gTm90ZSB0aGF0IGNoZWNrcGF0Y2ggYWxzbyBkb2VzIG5vdCBjb21w
bGFpbiBhYm91dCBhbnkgb3ZlciA4MCBjaGFyCj4+Pj4+IGxpbmVzIGluIHRoaXMgZmlsZS4KPj4+
Pj4KPj4+Pj4gU29ycnkgaWYgSSBhbSBtaXN1bmRlcnN0YW5kaW5nIHdoYXQgeW91IGFyZSB0cnlp
bmcgdG8gdGVsbCBtZS4gUGxlYXNlCj4+Pj4+IGNvbmZpcm0gZWl0aGVyIHdheS4KPj4+Pj4KPj4+
Pgo+Pj4+IFdBUk5JTkc6IEF2b2lkIHVubmVjZXNzYXJ5IGxpbmUgY29udGludWF0aW9ucwo+Pj4+
ICMyNTg6IEZJTEU6IGluY2x1ZGUva3VuaXQvdGVzdC5oOjEzNzoKPj4+PiArICAgICAgICAgICAg
ICAgICovICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+Pj4+Cj4+Pj4gdG90YWw6IDAgZXJyb3JzLCAyIHdhcm5pbmdzLCAzODggbGlu
ZXMgY2hlY2tlZAo+Pj4KPj4+IEFoLCBva2F5IHNvIHlvdSBkb24ndCBsaWtlIHRoZSB3YXJuaW5n
IGFib3V0IHRoZSBsaW5lIGNvbnRpbnVhdGlvbi4KPj4+IFRoYXQncyBub3QgYmVjYXVzZSBpdCBp
cyBvdmVyIDgwIGNoYXIsIGJ1dCBiZWNhdXNlIHRoZXJlIGlzIGEgbGluZQo+Pj4gY29udGludWF0
aW9uIGFmdGVyIGEgY29tbWVudC4gSSBkb24ndCByZWFsbHkgc2VlIGEgd2F5IHRvIGdldCByaWQg
b2YKPj4+IGl0IHdpdGhvdXQgcmVtb3ZpbmcgdGhlIGNvbW1lbnQgZnJvbSBpbnNpZGUgdGhlIG1h
Y3JvLgo+Pj4KPj4+IEkgcHV0IHRoaXMgVE9ETyB0aGVyZSBpbiB0aGUgZmlyc3QgcGxhY2UgYSBM
dWlzJyByZXF1ZXN0LCBhbmQgSSBwdXQgaXQKPj4+IGluIHRoZSBib2R5IG9mIHRoZSBtYWNybyBi
ZWNhdXNlIHRoaXMgbWFjcm8gYWxyZWFkeSBoYWQgYSBrZXJuZWwtZG9jCj4+PiBjb21tZW50IGFu
ZCBJIGRpZG4ndCB0aGluayB0aGF0IGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCBUT0RPIGJlbG9u
Z2VkCj4+PiBpbiB0aGUgdXNlciBkb2N1bWVudGF0aW9uLgo+Pj4KPj4+PiBHbyBhaGVhZCBmaXgg
dGhlc2UuIEl0IGFwcGVhcnMgdGhlcmUgYXJlIGZldyBsaW5lcyB0aGF0IGVpdGhlciBsb25nZXIK
Pj4+PiB0aGFuIDgwLiBJbiBnZW5lcmFsLCBJIGtlZXAgdGhlbSBhcm91bmQgNzUsIHNvIGl0IGlz
IGVhc2llciByZWFkLgo+Pj4KPj4+IFNvcnJ5LCB0aGUgYWJvdmUgaXMgdGhlIG9ubHkgY2hlY2tw
YXRjaCB3YXJuaW5nIG90aGVyIHRoYW4gdGhlCj4+PiByZW1pbmRlciB0byB1cGRhdGUgdGhlIE1B
SU5UQUlORVJTIGZpbGUuCj4+Pgo+Pj4gQXJlIHlvdSBzYXlpbmcgeW91IHdhbnQgbWUgdG8gZ28g
dGhyb3VnaCBhbmQgbWFrZSBhbGwgdGhlIGxpbmVzIGZpdCBpbgo+Pj4gNzUgY2hhciBjb2x1bW4g
d2lkdGg/IEkgaG9wZSBub3QgYmVjYXVzZSB0aGF0IGlzIGdvaW5nIHRvIGJlIGEgcHJldHR5Cj4+
PiBzdWJzdGFudGlhbCBjaGFuZ2UgdG8gbWFrZS4KPj4+Cj4+Cj4+IFRoZXJlIGFyZSB0d28gdGhp
bmdzIHdpdGggdGhlc2UgY29tbWVudCBsaW5lcy4gT25lIGlzIGNoZWNrcGF0Y2gKPj4gY29tcGxh
aW5pbmcgYW5kIHRoZSBvdGhlciBpcyBnZW5lcmFsIHJlYWRhYmlsaXR5Lgo+IAo+IFNvIGZvciB0
aGUgY2hlY2twYXRjaCB3YXJuaW5nLCBkbyB5b3Ugd2FudCBtZSB0byBtb3ZlIHRoZSBjb21tZW50
IG91dAo+IG9mIHRoZSBtYWNybyBib2R5IGludG8gdGhlIGtlcm5lbC1kb2MgY29tbWVudD8gSSBk
b24ndCByZWFsbHkgdGhpbmsgaXQKPiBpcyB0aGUgcmlnaHQgcGxhY2UgZm9yIGEgY29tbWVudCBv
ZiB0aGlzIG5hdHVyZSwgYnV0IEkgdGhpbmsgaXQgaXMKPiBwcm9iYWJseSBiZXR0ZXIgdGhhbiBk
cm9wcGluZyBpdCBlbnRpcmVseSAoSSBkb24ndCBzZWUgaG93IGVsc2UgdG8gZG8KPiBpdCB3aXRo
b3V0IGp1c3QgcmVtb3ZpbmcgdGhlIGNvbW1lbnQgZW50aXJlbHkpLgo+IAoKRG9uJ3QgZHJvcCB0
aGUgY29tbWVudHMuIEl0IG1ha2VzIHBlcmZlY3Qgc2Vuc2UgdG8gdHVybiB0aGlzIGludG8gYQpr
ZXJuZWwtZG9jIGNvbW1lbnQuCgpXZSBhcmUgZ29pbmcgYmFjayBmb3J0aCBvbiB0aGlzIGEgbG90
LiBJIHNlZSBzZXZlcmFsIGxpbmVzIDgxKyBpbgp0aGlzIGZpbGUuIEkgYW0gYXQgNS4zLXJjNSBh
bmQgbXkgY29tbWl0IGhvb2tzIGFyZW4ndCBoYXBweS4gSSBhbQpmaW5lIHdpdGggaXQgaWYgeW91
IHdhbnQgdG8gY29udmVydCB0aGVzZSB0byBrZXJuZWwtZG9jIGNvbW1lbnRzLgpJIHRoaW5rIGl0
IG1ha2VzIHBlcmZlY3Qgc2Vuc2UuCgpJIHdvdWxkIGxpa2UgaXQgaWYgeW91IHRha2UgYSBsb29r
IGFuZCBmaXggdGhlIGxpbmVzIHRoYXQgYXJlIGxvbmdlcgp0aGFuIDgwLiBJZiB5b3UgdGhpbmsg
eW91IHdvdWxkIHJhdGhlciBzcGVuZCB0aW1lIGNvbnZlcnRpbmcgdGhlbSB0bwprZXJuZWwtZG9j
LCBJIGFtIGZpbmUgd2l0aCBpdC4KCnRoYW5rcywKLS0gU2h1YWgKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
