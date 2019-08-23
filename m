Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAE79B590
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 19:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9226ED04;
	Fri, 23 Aug 2019 17:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080006ED04
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 17:34:34 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36324206DD;
 Fri, 23 Aug 2019 17:34:31 +0000 (UTC)
Subject: Re: [PATCH v14 01/18] kunit: test: add KUnit test runner core
To: Brendan Higgins <brendanhiggins@google.com>
References: <20190820232046.50175-1-brendanhiggins@google.com>
 <20190820232046.50175-2-brendanhiggins@google.com>
 <7f2c8908-75f6-b793-7113-ad57c51777ce@kernel.org>
 <CAFd5g44mRK9t4f58i_YMEt=e9RTxwrrhFY_V2LW_E7bUwR3cdg@mail.gmail.com>
 <4513d9f3-a69b-a9a4-768b-86c2962b62e0@kernel.org>
 <CAFd5g446J=cVW4QW+QeZMLDi+ANqshAW6KTrFFBTusPcdr6-GA@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <42c6235c-c586-8de1-1913-7cf1962c6066@kernel.org>
Date: Fri, 23 Aug 2019 11:34:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g446J=cVW4QW+QeZMLDi+ANqshAW6KTrFFBTusPcdr6-GA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566581673;
 bh=MnDHgmtHVoUC5O71SAn2lWqY/5HpVQR/a6wzW32r/Fg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DDGJEOge//QDHu5P/vX2Lr/yo3am86JXIqoxGkq+riYVFfL/XboZECe6klOycuvjb
 0tvO9qW2HYpJH2K0hh1IidNs4DOI3GsR/6TrYboK8nXgYEBgvB+Swim4YYBu7T63cY
 lmqN2dgfMn6DPtS4BUA+cmQbdZtcfgd6quNsnZlI=
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

T24gOC8yMy8xOSAxMToyNyBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+IE9uIEZyaSwgQXVn
IDIzLCAyMDE5IGF0IDEwOjA1IEFNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3cm90ZToKPj4K
Pj4gT24gOC8yMy8xOSAxMDo0OCBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+Pj4gT24gRnJp
LCBBdWcgMjMsIDIwMTkgYXQgODozMyBBTSBzaHVhaCA8c2h1YWhAa2VybmVsLm9yZz4gd3JvdGU6
Cj4+Pj4KPj4+PiBIaSBCcmVuZGFuLAo+Pj4+Cj4+Pj4gT24gOC8yMC8xOSA1OjIwIFBNLCBCcmVu
ZGFuIEhpZ2dpbnMgd3JvdGU6Cj4+Pj4+IEFkZCBjb3JlIGZhY2lsaXRpZXMgZm9yIGRlZmluaW5n
IHVuaXQgdGVzdHM7IHRoaXMgcHJvdmlkZXMgYSBjb21tb24gd2F5Cj4+Pj4+IHRvIGRlZmluZSB0
ZXN0IGNhc2VzLCBmdW5jdGlvbnMgdGhhdCBleGVjdXRlIGNvZGUgd2hpY2ggaXMgdW5kZXIgdGVz
dAo+Pj4+PiBhbmQgZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIGNvZGUgdW5kZXIgdGVzdCBiZWhhdmVz
IGFzIGV4cGVjdGVkOyB0aGlzIGFsc28KPj4+Pj4gcHJvdmlkZXMgYSB3YXkgdG8gZ3JvdXAgdG9n
ZXRoZXIgcmVsYXRlZCB0ZXN0IGNhc2VzIGluIHRlc3Qgc3VpdGVzIChoZXJlCj4+Pj4+IHdlIGNh
bGwgdGhlbSB0ZXN0X21vZHVsZXMpLgo+Pj4+Pgo+Pj4+PiBKdXN0IGRlZmluZSB0ZXN0IGNhc2Vz
IGFuZCBob3cgdG8gZXhlY3V0ZSB0aGVtIGZvciBub3c7IHNldHRpbmcKPj4+Pj4gZXhwZWN0YXRp
b25zIG9uIGNvZGUgd2lsbCBiZSBkZWZpbmVkIGxhdGVyLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4+Pj4+IFJl
dmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
Pgo+Pj4+PiBSZXZpZXdlZC1ieTogTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29t
Pgo+Pj4+PiBSZXZpZXdlZC1ieTogTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+
Cj4+Pj4+IFJldmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4+Pj4+
IC0tLQo+Pj4+PiAgICAgaW5jbHVkZS9rdW5pdC90ZXN0LmggfCAxNzkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+PiAgICAga3VuaXQvS2NvbmZpZyAgICAgICAg
fCAgMTcgKysrKwo+Pj4+PiAgICAga3VuaXQvTWFrZWZpbGUgICAgICAgfCAgIDEgKwo+Pj4+PiAg
ICAga3VuaXQvdGVzdC5jICAgICAgICAgfCAxOTEgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+Pj4+PiAgICAgNCBmaWxlcyBjaGFuZ2VkLCAzODggaW5zZXJ0aW9u
cygrKQo+Pj4+PiAgICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUva3VuaXQvdGVzdC5oCj4+
Pj4+ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQga3VuaXQvS2NvbmZpZwo+Pj4+PiAgICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGt1bml0L01ha2VmaWxlCj4+Pj4+ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQg
a3VuaXQvdGVzdC5jCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2t1bml0L3Rlc3Qu
aCBiL2luY2x1ZGUva3VuaXQvdGVzdC5oCj4+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4+
IGluZGV4IDAwMDAwMDAwMDAwMDAuLmUwYjM0YWNiOWVlNGUKPj4+Pj4gLS0tIC9kZXYvbnVsbAo+
Pj4+PiArKysgYi9pbmNsdWRlL2t1bml0L3Rlc3QuaAo+Pj4+PiBAQCAtMCwwICsxLDE3OSBAQAo+
Pj4+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4+Pj4gKy8qCj4+
Pj4+ICsgKiBCYXNlIHVuaXQgdGVzdCAoS1VuaXQpIEFQSS4KPj4+Pj4gKyAqCj4+Pj4+ICsgKiBD
b3B5cmlnaHQgKEMpIDIwMTksIEdvb2dsZSBMTEMuCj4+Pj4+ICsgKiBBdXRob3I6IEJyZW5kYW4g
SGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPj4+Pj4gKyAqLwo+Pj4+PiArCj4+
Pj4+ICsjaWZuZGVmIF9LVU5JVF9URVNUX0gKPj4+Pj4gKyNkZWZpbmUgX0tVTklUX1RFU1RfSAo+
Pj4+PiArCj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4+Pj4gKwo+Pj4+PiArc3Ry
dWN0IGt1bml0Owo+Pj4+PiArCj4+Pj4+ICsvKioKPj4+Pj4gKyAqIHN0cnVjdCBrdW5pdF9jYXNl
IC0gcmVwcmVzZW50cyBhbiBpbmRpdmlkdWFsIHRlc3QgY2FzZS4KPj4+Pj4gKyAqIEBydW5fY2Fz
ZTogdGhlIGZ1bmN0aW9uIHJlcHJlc2VudGluZyB0aGUgYWN0dWFsIHRlc3QgY2FzZS4KPj4+Pj4g
KyAqIEBuYW1lOiB0aGUgbmFtZSBvZiB0aGUgdGVzdCBjYXNlLgo+Pj4+PiArICoKPj4+Pj4gKyAq
IEEgdGVzdCBjYXNlIGlzIGEgZnVuY3Rpb24gd2l0aCB0aGUgc2lnbmF0dXJlLCBgYHZvaWQgKCop
KHN0cnVjdCBrdW5pdCAqKWBgCj4+Pj4+ICsgKiB0aGF0IG1ha2VzIGV4cGVjdGF0aW9ucyAoc2Vl
IEtVTklUX0VYUEVDVF9UUlVFKCkpIGFib3V0IGNvZGUgdW5kZXIgdGVzdC4gRWFjaAo+Pj4+PiAr
ICogdGVzdCBjYXNlIGlzIGFzc29jaWF0ZWQgd2l0aCBhICZzdHJ1Y3Qga3VuaXRfc3VpdGUgYW5k
IHdpbGwgYmUgcnVuIGFmdGVyIHRoZQo+Pj4+PiArICogc3VpdGUncyBpbml0IGZ1bmN0aW9uIGFu
ZCBmb2xsb3dlZCBieSB0aGUgc3VpdGUncyBleGl0IGZ1bmN0aW9uLgo+Pj4+PiArICoKPj4+Pj4g
KyAqIEEgdGVzdCBjYXNlIHNob3VsZCBiZSBzdGF0aWMgYW5kIHNob3VsZCBvbmx5IGJlIGNyZWF0
ZWQgd2l0aCB0aGUgS1VOSVRfQ0FTRSgpCj4+Pj4+ICsgKiBtYWNybzsgYWRkaXRpb25hbGx5LCBl
dmVyeSBhcnJheSBvZiB0ZXN0IGNhc2VzIHNob3VsZCBiZSB0ZXJtaW5hdGVkIHdpdGggYW4KPj4+
Pj4gKyAqIGVtcHR5IHRlc3QgY2FzZS4KPj4+Pj4gKyAqCj4+Pj4+ICsgKiBFeGFtcGxlOgo+Pj4+
Cj4+Pj4gQ2FuIHlvdSBmaXggdGhlc2UgbGluZSBjb250aW51YXRpb25zLiBJdCBtYWtlcyBpdCB2
ZXJ5IGhhcmQgdG8gcmVhZC4KPj4+PiBTb3JyeSBmb3IgdGhpcyBsYXRlIGNvbW1lbnQuIFRoZXNl
IGNvbW1lbnRzIGxpbmVzIGFyZSBsb25nZXIgdGhhbiA4MAo+Pj4+IGFuZCB3cmFwLgo+Pj4KPj4+
IE5vbmUgb2YgdGhlIGxpbmVzIGluIHRoaXMgY29tbWl0IGFyZSBvdmVyIDgwIGNoYXJhY3RlcnMg
aW4gY29sdW1uCj4+PiB3aWR0aC4gU29tZSBhcmUgZXhhY3RseSA4MCBjaGFyYWN0ZXJzIChsaWtl
IGFib3ZlKS4KPj4+Cj4+PiBNeSBndWVzcyBpcyB0aGF0IHlvdSBhcmUgc2VlaW5nIHRoZSBkaWZm
IGFkZGVkIHRleHQgKCsgKSwgd2hpY2ggd2hlbgo+Pj4geW91IGFkZCB0aGF0IHRvIGEgbGluZSB3
aGljaCBpcyBleGFjdGx5IDgwIGNoYXIgaW4gbGVuZ3RoIGVuZHMgdXAKPj4+IGJlaW5nIG92ZXIg
ODAgY2hhciBpbiBlbWFpbC4gSWYgeW91IGFwcGx5IHRoZSBwYXRjaCB5b3Ugd2lsbCBzZWUgdGhh
dAo+Pj4gdGhleSBhcmUgb25seSA4MCBjaGFycy4KPj4+Cj4+Pj4KPj4+PiBUaGVyZSBhcmUgc2V2
ZXJhbCBjb21tZW50IGxpbmVzIGluIHRoZSBmaWxlIHRoYXQgYXJlIHdheSB0b28gbG9uZy4KPj4+
Cj4+PiBOb3RlIHRoYXQgY2hlY2twYXRjaCBhbHNvIGRvZXMgbm90IGNvbXBsYWluIGFib3V0IGFu
eSBvdmVyIDgwIGNoYXIKPj4+IGxpbmVzIGluIHRoaXMgZmlsZS4KPj4+Cj4+PiBTb3JyeSBpZiBJ
IGFtIG1pc3VuZGVyc3RhbmRpbmcgd2hhdCB5b3UgYXJlIHRyeWluZyB0byB0ZWxsIG1lLiBQbGVh
c2UKPj4+IGNvbmZpcm0gZWl0aGVyIHdheS4KPj4+Cj4+Cj4+IFdBUk5JTkc6IEF2b2lkIHVubmVj
ZXNzYXJ5IGxpbmUgY29udGludWF0aW9ucwo+PiAjMjU4OiBGSUxFOiBpbmNsdWRlL2t1bml0L3Rl
c3QuaDoxMzc6Cj4+ICsgICAgICAgICAgICAgICAgKi8gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+Cj4+IHRvdGFsOiAwIGVycm9y
cywgMiB3YXJuaW5ncywgMzg4IGxpbmVzIGNoZWNrZWQKPiAKPiBBaCwgb2theSBzbyB5b3UgZG9u
J3QgbGlrZSB0aGUgd2FybmluZyBhYm91dCB0aGUgbGluZSBjb250aW51YXRpb24uCj4gVGhhdCdz
IG5vdCBiZWNhdXNlIGl0IGlzIG92ZXIgODAgY2hhciwgYnV0IGJlY2F1c2UgdGhlcmUgaXMgYSBs
aW5lCj4gY29udGludWF0aW9uIGFmdGVyIGEgY29tbWVudC4gSSBkb24ndCByZWFsbHkgc2VlIGEg
d2F5IHRvIGdldCByaWQgb2YKPiBpdCB3aXRob3V0IHJlbW92aW5nIHRoZSBjb21tZW50IGZyb20g
aW5zaWRlIHRoZSBtYWNyby4KPiAKPiBJIHB1dCB0aGlzIFRPRE8gdGhlcmUgaW4gdGhlIGZpcnN0
IHBsYWNlIGEgTHVpcycgcmVxdWVzdCwgYW5kIEkgcHV0IGl0Cj4gaW4gdGhlIGJvZHkgb2YgdGhl
IG1hY3JvIGJlY2F1c2UgdGhpcyBtYWNybyBhbHJlYWR5IGhhZCBhIGtlcm5lbC1kb2MKPiBjb21t
ZW50IGFuZCBJIGRpZG4ndCB0aGluayB0aGF0IGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCBUT0RP
IGJlbG9uZ2VkCj4gaW4gdGhlIHVzZXIgZG9jdW1lbnRhdGlvbi4KPiAKPj4gR28gYWhlYWQgZml4
IHRoZXNlLiBJdCBhcHBlYXJzIHRoZXJlIGFyZSBmZXcgbGluZXMgdGhhdCBlaXRoZXIgbG9uZ2Vy
Cj4+IHRoYW4gODAuIEluIGdlbmVyYWwsIEkga2VlcCB0aGVtIGFyb3VuZCA3NSwgc28gaXQgaXMg
ZWFzaWVyIHJlYWQuCj4gCj4gU29ycnksIHRoZSBhYm92ZSBpcyB0aGUgb25seSBjaGVja3BhdGNo
IHdhcm5pbmcgb3RoZXIgdGhhbiB0aGUKPiByZW1pbmRlciB0byB1cGRhdGUgdGhlIE1BSU5UQUlO
RVJTIGZpbGUuCj4gCj4gQXJlIHlvdSBzYXlpbmcgeW91IHdhbnQgbWUgdG8gZ28gdGhyb3VnaCBh
bmQgbWFrZSBhbGwgdGhlIGxpbmVzIGZpdCBpbgo+IDc1IGNoYXIgY29sdW1uIHdpZHRoPyBJIGhv
cGUgbm90IGJlY2F1c2UgdGhhdCBpcyBnb2luZyB0byBiZSBhIHByZXR0eQo+IHN1YnN0YW50aWFs
IGNoYW5nZSB0byBtYWtlLgo+IAoKVGhlcmUgYXJlIHR3byB0aGluZ3Mgd2l0aCB0aGVzZSBjb21t
ZW50IGxpbmVzLiBPbmUgaXMgY2hlY2twYXRjaApjb21wbGFpbmluZyBhbmQgdGhlIG90aGVyIGlz
IGdlbmVyYWwgcmVhZGFiaWxpdHkuCgpQbGVhc2UgZ28gYWhlYWQgYW5kIGFkanVzdCB0aGVtLgoK
dGhhbmtzLAotLSBTaHVhaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
