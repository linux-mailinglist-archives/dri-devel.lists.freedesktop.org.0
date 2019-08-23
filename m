Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806FF9B509
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 19:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3A26E082;
	Fri, 23 Aug 2019 17:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5955B6E082
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 17:05:39 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AE5222CE3;
 Fri, 23 Aug 2019 17:05:36 +0000 (UTC)
Subject: Re: [PATCH v14 01/18] kunit: test: add KUnit test runner core
To: Brendan Higgins <brendanhiggins@google.com>
References: <20190820232046.50175-1-brendanhiggins@google.com>
 <20190820232046.50175-2-brendanhiggins@google.com>
 <7f2c8908-75f6-b793-7113-ad57c51777ce@kernel.org>
 <CAFd5g44mRK9t4f58i_YMEt=e9RTxwrrhFY_V2LW_E7bUwR3cdg@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <4513d9f3-a69b-a9a4-768b-86c2962b62e0@kernel.org>
Date: Fri, 23 Aug 2019 11:05:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g44mRK9t4f58i_YMEt=e9RTxwrrhFY_V2LW_E7bUwR3cdg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566579938;
 bh=nxBLgk8vy88bDQ4Gy8gLYJzufdYGTQ7XtUM6JqEXDA0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=O30aLpnr4wR6RV3N8mtzuIwqjR4pVRciIGqcKMKqRxgQeexe3DQTFu7wLf0ucs6pd
 f7LERWiM15wbjLXop4rZCGtrGB+P5H5sTrfEx/6zUqN9gIAyJVuBsS52i6gSBIEa3N
 Okrm+v4nJmDbL6aK4SO4xEICK/zDQDTaPoFPQAwI=
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

T24gOC8yMy8xOSAxMDo0OCBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+IE9uIEZyaSwgQXVn
IDIzLCAyMDE5IGF0IDg6MzMgQU0gc2h1YWggPHNodWFoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+
PiBIaSBCcmVuZGFuLAo+Pgo+PiBPbiA4LzIwLzE5IDU6MjAgUE0sIEJyZW5kYW4gSGlnZ2lucyB3
cm90ZToKPj4+IEFkZCBjb3JlIGZhY2lsaXRpZXMgZm9yIGRlZmluaW5nIHVuaXQgdGVzdHM7IHRo
aXMgcHJvdmlkZXMgYSBjb21tb24gd2F5Cj4+PiB0byBkZWZpbmUgdGVzdCBjYXNlcywgZnVuY3Rp
b25zIHRoYXQgZXhlY3V0ZSBjb2RlIHdoaWNoIGlzIHVuZGVyIHRlc3QKPj4+IGFuZCBkZXRlcm1p
bmUgd2hldGhlciB0aGUgY29kZSB1bmRlciB0ZXN0IGJlaGF2ZXMgYXMgZXhwZWN0ZWQ7IHRoaXMg
YWxzbwo+Pj4gcHJvdmlkZXMgYSB3YXkgdG8gZ3JvdXAgdG9nZXRoZXIgcmVsYXRlZCB0ZXN0IGNh
c2VzIGluIHRlc3Qgc3VpdGVzIChoZXJlCj4+PiB3ZSBjYWxsIHRoZW0gdGVzdF9tb2R1bGVzKS4K
Pj4+Cj4+PiBKdXN0IGRlZmluZSB0ZXN0IGNhc2VzIGFuZCBob3cgdG8gZXhlY3V0ZSB0aGVtIGZv
ciBub3c7IHNldHRpbmcKPj4+IGV4cGVjdGF0aW9ucyBvbiBjb2RlIHdpbGwgYmUgZGVmaW5lZCBs
YXRlci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdn
aW5zQGdvb2dsZS5jb20+Cj4+PiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPj4+IFJldmlld2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUg
PGxvZ2FuZ0BkZWx0YXRlZS5jb20+Cj4+PiBSZXZpZXdlZC1ieTogTHVpcyBDaGFtYmVybGFpbiA8
bWNncm9mQGtlcm5lbC5vcmc+Cj4+PiBSZXZpZXdlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBr
ZXJuZWwub3JnPgo+Pj4gLS0tCj4+PiAgICBpbmNsdWRlL2t1bml0L3Rlc3QuaCB8IDE3OSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+PiAgICBrdW5pdC9LY29uZmln
ICAgICAgICB8ICAxNyArKysrCj4+PiAgICBrdW5pdC9NYWtlZmlsZSAgICAgICB8ICAgMSArCj4+
PiAgICBrdW5pdC90ZXN0LmMgICAgICAgICB8IDE5MSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4+PiAgICA0IGZpbGVzIGNoYW5nZWQsIDM4OCBpbnNlcnRpb25z
KCspCj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9rdW5pdC90ZXN0LmgKPj4+ICAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBrdW5pdC9LY29uZmlnCj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2
NDQga3VuaXQvTWFrZWZpbGUKPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBrdW5pdC90ZXN0LmMK
Pj4+Cj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9rdW5pdC90ZXN0LmggYi9pbmNsdWRlL2t1bml0
L3Rlc3QuaAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAwMDAu
LmUwYjM0YWNiOWVlNGUKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL2luY2x1ZGUva3VuaXQv
dGVzdC5oCj4+PiBAQCAtMCwwICsxLDE3OSBAQAo+Pj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wICovCj4+PiArLyoKPj4+ICsgKiBCYXNlIHVuaXQgdGVzdCAoS1VuaXQpIEFQ
SS4KPj4+ICsgKgo+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAxOSwgR29vZ2xlIExMQy4KPj4+ICsg
KiBBdXRob3I6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPj4+
ICsgKi8KPj4+ICsKPj4+ICsjaWZuZGVmIF9LVU5JVF9URVNUX0gKPj4+ICsjZGVmaW5lIF9LVU5J
VF9URVNUX0gKPj4+ICsKPj4+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4+ICsKPj4+ICtz
dHJ1Y3Qga3VuaXQ7Cj4+PiArCj4+PiArLyoqCj4+PiArICogc3RydWN0IGt1bml0X2Nhc2UgLSBy
ZXByZXNlbnRzIGFuIGluZGl2aWR1YWwgdGVzdCBjYXNlLgo+Pj4gKyAqIEBydW5fY2FzZTogdGhl
IGZ1bmN0aW9uIHJlcHJlc2VudGluZyB0aGUgYWN0dWFsIHRlc3QgY2FzZS4KPj4+ICsgKiBAbmFt
ZTogdGhlIG5hbWUgb2YgdGhlIHRlc3QgY2FzZS4KPj4+ICsgKgo+Pj4gKyAqIEEgdGVzdCBjYXNl
IGlzIGEgZnVuY3Rpb24gd2l0aCB0aGUgc2lnbmF0dXJlLCBgYHZvaWQgKCopKHN0cnVjdCBrdW5p
dCAqKWBgCj4+PiArICogdGhhdCBtYWtlcyBleHBlY3RhdGlvbnMgKHNlZSBLVU5JVF9FWFBFQ1Rf
VFJVRSgpKSBhYm91dCBjb2RlIHVuZGVyIHRlc3QuIEVhY2gKPj4+ICsgKiB0ZXN0IGNhc2UgaXMg
YXNzb2NpYXRlZCB3aXRoIGEgJnN0cnVjdCBrdW5pdF9zdWl0ZSBhbmQgd2lsbCBiZSBydW4gYWZ0
ZXIgdGhlCj4+PiArICogc3VpdGUncyBpbml0IGZ1bmN0aW9uIGFuZCBmb2xsb3dlZCBieSB0aGUg
c3VpdGUncyBleGl0IGZ1bmN0aW9uLgo+Pj4gKyAqCj4+PiArICogQSB0ZXN0IGNhc2Ugc2hvdWxk
IGJlIHN0YXRpYyBhbmQgc2hvdWxkIG9ubHkgYmUgY3JlYXRlZCB3aXRoIHRoZSBLVU5JVF9DQVNF
KCkKPj4+ICsgKiBtYWNybzsgYWRkaXRpb25hbGx5LCBldmVyeSBhcnJheSBvZiB0ZXN0IGNhc2Vz
IHNob3VsZCBiZSB0ZXJtaW5hdGVkIHdpdGggYW4KPj4+ICsgKiBlbXB0eSB0ZXN0IGNhc2UuCj4+
PiArICoKPj4+ICsgKiBFeGFtcGxlOgo+Pgo+PiBDYW4geW91IGZpeCB0aGVzZSBsaW5lIGNvbnRp
bnVhdGlvbnMuIEl0IG1ha2VzIGl0IHZlcnkgaGFyZCB0byByZWFkLgo+PiBTb3JyeSBmb3IgdGhp
cyBsYXRlIGNvbW1lbnQuIFRoZXNlIGNvbW1lbnRzIGxpbmVzIGFyZSBsb25nZXIgdGhhbiA4MAo+
PiBhbmQgd3JhcC4KPiAKPiBOb25lIG9mIHRoZSBsaW5lcyBpbiB0aGlzIGNvbW1pdCBhcmUgb3Zl
ciA4MCBjaGFyYWN0ZXJzIGluIGNvbHVtbgo+IHdpZHRoLiBTb21lIGFyZSBleGFjdGx5IDgwIGNo
YXJhY3RlcnMgKGxpa2UgYWJvdmUpLgo+IAo+IE15IGd1ZXNzIGlzIHRoYXQgeW91IGFyZSBzZWVp
bmcgdGhlIGRpZmYgYWRkZWQgdGV4dCAoKyApLCB3aGljaCB3aGVuCj4geW91IGFkZCB0aGF0IHRv
IGEgbGluZSB3aGljaCBpcyBleGFjdGx5IDgwIGNoYXIgaW4gbGVuZ3RoIGVuZHMgdXAKPiBiZWlu
ZyBvdmVyIDgwIGNoYXIgaW4gZW1haWwuIElmIHlvdSBhcHBseSB0aGUgcGF0Y2ggeW91IHdpbGwg
c2VlIHRoYXQKPiB0aGV5IGFyZSBvbmx5IDgwIGNoYXJzLgo+IAo+Pgo+PiBUaGVyZSBhcmUgc2V2
ZXJhbCBjb21tZW50IGxpbmVzIGluIHRoZSBmaWxlIHRoYXQgYXJlIHdheSB0b28gbG9uZy4KPiAK
PiBOb3RlIHRoYXQgY2hlY2twYXRjaCBhbHNvIGRvZXMgbm90IGNvbXBsYWluIGFib3V0IGFueSBv
dmVyIDgwIGNoYXIKPiBsaW5lcyBpbiB0aGlzIGZpbGUuCj4gCj4gU29ycnkgaWYgSSBhbSBtaXN1
bmRlcnN0YW5kaW5nIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gdGVsbCBtZS4gUGxlYXNlCj4gY29u
ZmlybSBlaXRoZXIgd2F5Lgo+IAoKV0FSTklORzogQXZvaWQgdW5uZWNlc3NhcnkgbGluZSBjb250
aW51YXRpb25zCiMyNTg6IEZJTEU6IGluY2x1ZGUva3VuaXQvdGVzdC5oOjEzNzoKKwkJICovCQkJ
CQkJCSAgICAgICBcCgp0b3RhbDogMCBlcnJvcnMsIDIgd2FybmluZ3MsIDM4OCBsaW5lcyBjaGVj
a2VkCgpHbyBhaGVhZCBmaXggdGhlc2UuIEl0IGFwcGVhcnMgdGhlcmUgYXJlIGZldyBsaW5lcyB0
aGF0IGVpdGhlciBsb25nZXIKdGhhbiA4MC4gSW4gZ2VuZXJhbCwgSSBrZWVwIHRoZW0gYXJvdW5k
IDc1LCBzbyBpdCBpcyBlYXNpZXIgcmVhZC4KCnRoYW5rcywKLS0gU2h1YWgKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
