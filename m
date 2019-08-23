Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A279B730
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 21:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA5C6ED28;
	Fri, 23 Aug 2019 19:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962486ED27
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 19:43:15 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98F41204EC;
 Fri, 23 Aug 2019 19:43:12 +0000 (UTC)
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
 <54f3c011-d666-e828-5e77-359b7a7374e7@kernel.org>
 <CAFd5g44NAs6KK0_sG9itgT5qxujpyx36XV6tT8=zMynG-ZyVhQ@mail.gmail.com>
 <bb9384cd-bd62-2190-e0da-ed3537aff171@kernel.org>
 <CAFd5g47bJjp94bbCRmho8yUXNWx3PpQ4Cu6Y1UnErKVKWuedNw@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <6cb3a6b5-8570-07b2-dffb-eeca5a1c663b@kernel.org>
Date: Fri, 23 Aug 2019 13:43:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g47bJjp94bbCRmho8yUXNWx3PpQ4Cu6Y1UnErKVKWuedNw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566589395;
 bh=A5eeAEPetBRLMvoXmWpeJWVupdyZjGQb5uqPUxSopRE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Lp0kgTaL2ER1ikXu9l5+TknQpBRLVfc4BleH5oF+NdBkxB+c5LFY/2x7o82/KSivI
 T2zrEDSyzyNekmuNL6JiduReArBzQm9I4NzNK3pfgxz77LI6LzJ40njjfbD25tI8Sf
 8bH3aLvOlHHgvixhW1XFYsbJ5xt34UdIwlMptUtI=
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

T24gOC8yMy8xOSAxOjIwIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gT24gRnJpLCBBdWcg
MjMsIDIwMTkgYXQgMTI6MDQgUE0gc2h1YWggPHNodWFoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+
PiBPbiA4LzIzLzE5IDEyOjU2IFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4+PiBPbiBGcmks
IEF1ZyAyMywgMjAxOSBhdCAxMTozMiBBTSBzaHVhaCA8c2h1YWhAa2VybmVsLm9yZz4gd3JvdGU6
Cj4+Pj4KPj4+PiBPbiA4LzIzLzE5IDExOjU0IEFNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4+
Pj4+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDEwOjM0IEFNIHNodWFoIDxzaHVhaEBrZXJuZWwu
b3JnPiB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBPbiA4LzIzLzE5IDExOjI3IEFNLCBCcmVuZGFuIEhp
Z2dpbnMgd3JvdGU6Cj4+Pj4+Pj4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6MDUgQU0gc2h1
YWggPHNodWFoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiA4LzIzLzE5
IDEwOjQ4IEFNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4+Pj4+Pj4+PiBPbiBGcmksIEF1ZyAy
MywgMjAxOSBhdCA4OjMzIEFNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+IEhpIEJyZW5kYW4sCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBPbiA4LzIw
LzE5IDU6MjAgUE0sIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPj4+Pj4+Pj4+Pj4gQWRkIGNvcmUg
ZmFjaWxpdGllcyBmb3IgZGVmaW5pbmcgdW5pdCB0ZXN0czsgdGhpcyBwcm92aWRlcyBhIGNvbW1v
biB3YXkKPj4+Pj4+Pj4+Pj4gdG8gZGVmaW5lIHRlc3QgY2FzZXMsIGZ1bmN0aW9ucyB0aGF0IGV4
ZWN1dGUgY29kZSB3aGljaCBpcyB1bmRlciB0ZXN0Cj4+Pj4+Pj4+Pj4+IGFuZCBkZXRlcm1pbmUg
d2hldGhlciB0aGUgY29kZSB1bmRlciB0ZXN0IGJlaGF2ZXMgYXMgZXhwZWN0ZWQ7IHRoaXMgYWxz
bwo+Pj4+Pj4+Pj4+PiBwcm92aWRlcyBhIHdheSB0byBncm91cCB0b2dldGhlciByZWxhdGVkIHRl
c3QgY2FzZXMgaW4gdGVzdCBzdWl0ZXMgKGhlcmUKPj4+Pj4+Pj4+Pj4gd2UgY2FsbCB0aGVtIHRl
c3RfbW9kdWxlcykuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEp1c3QgZGVmaW5lIHRlc3QgY2Fz
ZXMgYW5kIGhvdyB0byBleGVjdXRlIHRoZW0gZm9yIG5vdzsgc2V0dGluZwo+Pj4+Pj4+Pj4+PiBl
eHBlY3RhdGlvbnMgb24gY29kZSB3aWxsIGJlIGRlZmluZWQgbGF0ZXIuCj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNA
Z29vZ2xlLmNvbT4KPj4+Pj4+Pj4+Pj4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4+Pj4+Pj4+Pj4+IFJldmlld2VkLWJ5OiBMb2dh
biBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+Cj4+Pj4+Pj4+Pj4+IFJldmlld2VkLWJ5
OiBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZAa2VybmVsLm9yZz4KPj4+Pj4+Pj4+Pj4gUmV2aWV3
ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KPj4+Pj4+Pj4+Pj4gLS0tCj4+
Pj4+Pj4+Pj4+ICAgICAgICBpbmNsdWRlL2t1bml0L3Rlc3QuaCB8IDE3OSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+Pj4+Pj4+ICAgICAgICBrdW5pdC9LY29u
ZmlnICAgICAgICB8ICAxNyArKysrCj4+Pj4+Pj4+Pj4+ICAgICAgICBrdW5pdC9NYWtlZmlsZSAg
ICAgICB8ICAgMSArCj4+Pj4+Pj4+Pj4+ICAgICAgICBrdW5pdC90ZXN0LmMgICAgICAgICB8IDE5
MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+Pj4+Pj4+
ICAgICAgICA0IGZpbGVzIGNoYW5nZWQsIDM4OCBpbnNlcnRpb25zKCspCj4+Pj4+Pj4+Pj4+ICAg
ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9rdW5pdC90ZXN0LmgKPj4+Pj4+Pj4+Pj4g
ICAgICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBrdW5pdC9LY29uZmlnCj4+Pj4+Pj4+Pj4+ICAgICAg
ICBjcmVhdGUgbW9kZSAxMDA2NDQga3VuaXQvTWFrZWZpbGUKPj4+Pj4+Pj4+Pj4gICAgICAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBrdW5pdC90ZXN0LmMKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUva3VuaXQvdGVzdC5oIGIvaW5jbHVkZS9rdW5pdC90ZXN0LmgKPj4+
Pj4+Pj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+Pj4+Pj4+Pj4gaW5kZXggMDAwMDAwMDAw
MDAwMC4uZTBiMzRhY2I5ZWU0ZQo+Pj4+Pj4+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+Pj4+Pj4+
ICsrKyBiL2luY2x1ZGUva3VuaXQvdGVzdC5oCj4+Pj4+Pj4+Pj4+IEBAIC0wLDAgKzEsMTc5IEBA
Cj4+Pj4+Pj4+Pj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+Pj4+
Pj4+Pj4+PiArLyoKPj4+Pj4+Pj4+Pj4gKyAqIEJhc2UgdW5pdCB0ZXN0IChLVW5pdCkgQVBJLgo+
Pj4+Pj4+Pj4+PiArICoKPj4+Pj4+Pj4+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAxOSwgR29vZ2xl
IExMQy4KPj4+Pj4+Pj4+Pj4gKyAqIEF1dGhvcjogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGln
Z2luc0Bnb29nbGUuY29tPgo+Pj4+Pj4+Pj4+PiArICovCj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+
Pj4gKyNpZm5kZWYgX0tVTklUX1RFU1RfSAo+Pj4+Pj4+Pj4+PiArI2RlZmluZSBfS1VOSVRfVEVT
VF9ICj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+
Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+ICtzdHJ1Y3Qga3VuaXQ7Cj4+Pj4+Pj4+Pj4+ICsKPj4+
Pj4+Pj4+Pj4gKy8qKgo+Pj4+Pj4+Pj4+PiArICogc3RydWN0IGt1bml0X2Nhc2UgLSByZXByZXNl
bnRzIGFuIGluZGl2aWR1YWwgdGVzdCBjYXNlLgo+Pj4+Pj4+Pj4+PiArICogQHJ1bl9jYXNlOiB0
aGUgZnVuY3Rpb24gcmVwcmVzZW50aW5nIHRoZSBhY3R1YWwgdGVzdCBjYXNlLgo+Pj4+Pj4+Pj4+
PiArICogQG5hbWU6IHRoZSBuYW1lIG9mIHRoZSB0ZXN0IGNhc2UuCj4+Pj4+Pj4+Pj4+ICsgKgo+
Pj4+Pj4+Pj4+PiArICogQSB0ZXN0IGNhc2UgaXMgYSBmdW5jdGlvbiB3aXRoIHRoZSBzaWduYXR1
cmUsIGBgdm9pZCAoKikoc3RydWN0IGt1bml0ICopYGAKPj4+Pj4+Pj4+Pj4gKyAqIHRoYXQgbWFr
ZXMgZXhwZWN0YXRpb25zIChzZWUgS1VOSVRfRVhQRUNUX1RSVUUoKSkgYWJvdXQgY29kZSB1bmRl
ciB0ZXN0LiBFYWNoCj4+Pj4+Pj4+Pj4+ICsgKiB0ZXN0IGNhc2UgaXMgYXNzb2NpYXRlZCB3aXRo
IGEgJnN0cnVjdCBrdW5pdF9zdWl0ZSBhbmQgd2lsbCBiZSBydW4gYWZ0ZXIgdGhlCj4+Pj4+Pj4+
Pj4+ICsgKiBzdWl0ZSdzIGluaXQgZnVuY3Rpb24gYW5kIGZvbGxvd2VkIGJ5IHRoZSBzdWl0ZSdz
IGV4aXQgZnVuY3Rpb24uCj4+Pj4+Pj4+Pj4+ICsgKgo+Pj4+Pj4+Pj4+PiArICogQSB0ZXN0IGNh
c2Ugc2hvdWxkIGJlIHN0YXRpYyBhbmQgc2hvdWxkIG9ubHkgYmUgY3JlYXRlZCB3aXRoIHRoZSBL
VU5JVF9DQVNFKCkKPj4+Pj4+Pj4+Pj4gKyAqIG1hY3JvOyBhZGRpdGlvbmFsbHksIGV2ZXJ5IGFy
cmF5IG9mIHRlc3QgY2FzZXMgc2hvdWxkIGJlIHRlcm1pbmF0ZWQgd2l0aCBhbgo+Pj4+Pj4+Pj4+
PiArICogZW1wdHkgdGVzdCBjYXNlLgo+Pj4+Pj4+Pj4+PiArICoKPj4+Pj4+Pj4+Pj4gKyAqIEV4
YW1wbGU6Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBDYW4geW91IGZpeCB0aGVzZSBsaW5lIGNvbnRp
bnVhdGlvbnMuIEl0IG1ha2VzIGl0IHZlcnkgaGFyZCB0byByZWFkLgo+Pj4+Pj4+Pj4+IFNvcnJ5
IGZvciB0aGlzIGxhdGUgY29tbWVudC4gVGhlc2UgY29tbWVudHMgbGluZXMgYXJlIGxvbmdlciB0
aGFuIDgwCj4+Pj4+Pj4+Pj4gYW5kIHdyYXAuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gTm9uZSBvZiB0
aGUgbGluZXMgaW4gdGhpcyBjb21taXQgYXJlIG92ZXIgODAgY2hhcmFjdGVycyBpbiBjb2x1bW4K
Pj4+Pj4+Pj4+IHdpZHRoLiBTb21lIGFyZSBleGFjdGx5IDgwIGNoYXJhY3RlcnMgKGxpa2UgYWJv
dmUpLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE15IGd1ZXNzIGlzIHRoYXQgeW91IGFyZSBzZWVpbmcg
dGhlIGRpZmYgYWRkZWQgdGV4dCAoKyApLCB3aGljaCB3aGVuCj4+Pj4+Pj4+PiB5b3UgYWRkIHRo
YXQgdG8gYSBsaW5lIHdoaWNoIGlzIGV4YWN0bHkgODAgY2hhciBpbiBsZW5ndGggZW5kcyB1cAo+
Pj4+Pj4+Pj4gYmVpbmcgb3ZlciA4MCBjaGFyIGluIGVtYWlsLiBJZiB5b3UgYXBwbHkgdGhlIHBh
dGNoIHlvdSB3aWxsIHNlZSB0aGF0Cj4+Pj4+Pj4+PiB0aGV5IGFyZSBvbmx5IDgwIGNoYXJzLgo+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFRoZXJlIGFyZSBzZXZlcmFsIGNvbW1lbnQg
bGluZXMgaW4gdGhlIGZpbGUgdGhhdCBhcmUgd2F5IHRvbyBsb25nLgo+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+IE5vdGUgdGhhdCBjaGVja3BhdGNoIGFsc28gZG9lcyBub3QgY29tcGxhaW4gYWJvdXQgYW55
IG92ZXIgODAgY2hhcgo+Pj4+Pj4+Pj4gbGluZXMgaW4gdGhpcyBmaWxlLgo+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+IFNvcnJ5IGlmIEkgYW0gbWlzdW5kZXJzdGFuZGluZyB3aGF0IHlvdSBhcmUgdHJ5aW5n
IHRvIHRlbGwgbWUuIFBsZWFzZQo+Pj4+Pj4+Pj4gY29uZmlybSBlaXRoZXIgd2F5Lgo+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gV0FSTklORzogQXZvaWQgdW5uZWNlc3NhcnkgbGluZSBjb250
aW51YXRpb25zCj4+Pj4+Pj4+ICMyNTg6IEZJTEU6IGluY2x1ZGUva3VuaXQvdGVzdC5oOjEzNzoK
Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAqLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+Pj4+Pj4KPj4+Pj4+Pj4gdG90YWw6
IDAgZXJyb3JzLCAyIHdhcm5pbmdzLCAzODggbGluZXMgY2hlY2tlZAo+Pj4+Pj4+Cj4+Pj4+Pj4g
QWgsIG9rYXkgc28geW91IGRvbid0IGxpa2UgdGhlIHdhcm5pbmcgYWJvdXQgdGhlIGxpbmUgY29u
dGludWF0aW9uLgo+Pj4+Pj4+IFRoYXQncyBub3QgYmVjYXVzZSBpdCBpcyBvdmVyIDgwIGNoYXIs
IGJ1dCBiZWNhdXNlIHRoZXJlIGlzIGEgbGluZQo+Pj4+Pj4+IGNvbnRpbnVhdGlvbiBhZnRlciBh
IGNvbW1lbnQuIEkgZG9uJ3QgcmVhbGx5IHNlZSBhIHdheSB0byBnZXQgcmlkIG9mCj4+Pj4+Pj4g
aXQgd2l0aG91dCByZW1vdmluZyB0aGUgY29tbWVudCBmcm9tIGluc2lkZSB0aGUgbWFjcm8uCj4+
Pj4+Pj4KPj4+Pj4+PiBJIHB1dCB0aGlzIFRPRE8gdGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlIGEg
THVpcycgcmVxdWVzdCwgYW5kIEkgcHV0IGl0Cj4+Pj4+Pj4gaW4gdGhlIGJvZHkgb2YgdGhlIG1h
Y3JvIGJlY2F1c2UgdGhpcyBtYWNybyBhbHJlYWR5IGhhZCBhIGtlcm5lbC1kb2MKPj4+Pj4+PiBj
b21tZW50IGFuZCBJIGRpZG4ndCB0aGluayB0aGF0IGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCBU
T0RPIGJlbG9uZ2VkCj4+Pj4+Pj4gaW4gdGhlIHVzZXIgZG9jdW1lbnRhdGlvbi4KPj4+Pj4+Pgo+
Pj4+Pj4+PiBHbyBhaGVhZCBmaXggdGhlc2UuIEl0IGFwcGVhcnMgdGhlcmUgYXJlIGZldyBsaW5l
cyB0aGF0IGVpdGhlciBsb25nZXIKPj4+Pj4+Pj4gdGhhbiA4MC4gSW4gZ2VuZXJhbCwgSSBrZWVw
IHRoZW0gYXJvdW5kIDc1LCBzbyBpdCBpcyBlYXNpZXIgcmVhZC4KPj4+Pj4+Pgo+Pj4+Pj4+IFNv
cnJ5LCB0aGUgYWJvdmUgaXMgdGhlIG9ubHkgY2hlY2twYXRjaCB3YXJuaW5nIG90aGVyIHRoYW4g
dGhlCj4+Pj4+Pj4gcmVtaW5kZXIgdG8gdXBkYXRlIHRoZSBNQUlOVEFJTkVSUyBmaWxlLgo+Pj4+
Pj4+Cj4+Pj4+Pj4gQXJlIHlvdSBzYXlpbmcgeW91IHdhbnQgbWUgdG8gZ28gdGhyb3VnaCBhbmQg
bWFrZSBhbGwgdGhlIGxpbmVzIGZpdCBpbgo+Pj4+Pj4+IDc1IGNoYXIgY29sdW1uIHdpZHRoPyBJ
IGhvcGUgbm90IGJlY2F1c2UgdGhhdCBpcyBnb2luZyB0byBiZSBhIHByZXR0eQo+Pj4+Pj4+IHN1
YnN0YW50aWFsIGNoYW5nZSB0byBtYWtlLgo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gVGhlcmUgYXJl
IHR3byB0aGluZ3Mgd2l0aCB0aGVzZSBjb21tZW50IGxpbmVzLiBPbmUgaXMgY2hlY2twYXRjaAo+
Pj4+Pj4gY29tcGxhaW5pbmcgYW5kIHRoZSBvdGhlciBpcyBnZW5lcmFsIHJlYWRhYmlsaXR5Lgo+
Pj4+Pgo+Pj4+PiBTbyBmb3IgdGhlIGNoZWNrcGF0Y2ggd2FybmluZywgZG8geW91IHdhbnQgbWUg
dG8gbW92ZSB0aGUgY29tbWVudCBvdXQKPj4+Pj4gb2YgdGhlIG1hY3JvIGJvZHkgaW50byB0aGUg
a2VybmVsLWRvYyBjb21tZW50PyBJIGRvbid0IHJlYWxseSB0aGluayBpdAo+Pj4+PiBpcyB0aGUg
cmlnaHQgcGxhY2UgZm9yIGEgY29tbWVudCBvZiB0aGlzIG5hdHVyZSwgYnV0IEkgdGhpbmsgaXQg
aXMKPj4+Pj4gcHJvYmFibHkgYmV0dGVyIHRoYW4gZHJvcHBpbmcgaXQgZW50aXJlbHkgKEkgZG9u
J3Qgc2VlIGhvdyBlbHNlIHRvIGRvCj4+Pj4+IGl0IHdpdGhvdXQganVzdCByZW1vdmluZyB0aGUg
Y29tbWVudCBlbnRpcmVseSkuCj4+Pj4+Cj4+Pj4KPj4+PiBEb24ndCBkcm9wIHRoZSBjb21tZW50
cy4gSXQgbWFrZXMgcGVyZmVjdCBzZW5zZSB0byB0dXJuIHRoaXMgaW50byBhCj4+Pj4ga2VybmVs
LWRvYyBjb21tZW50Lgo+Pj4KPj4+IEkgYW0gZmluZSB3aXRoIHRoYXQuIEkgd2lsbCBkbyB0aGF0
IGluIGEgc3Vic2VxdWVudCByZXZpc2lvbiBvbmNlIHdlCj4+PiBmaWd1cmUgb3V0IHRoZSBjb2x1
bW4gbGltaXQgaXNzdWUuCj4+Pgo+Pj4+IFdlIGFyZSBnb2luZyBiYWNrIGZvcnRoIG9uIHRoaXMg
YSBsb3QuIEkgc2VlIHNldmVyYWwgbGluZXMgODErIGluCj4+Pj4gdGhpcyBmaWxlLiBJIGFtIGF0
IDUuMy1yYzUgYW5kIG15IGNvbW1pdCBob29rcyBhcmVuJ3QgaGFwcHkuIEkgYW0KPj4+PiBmaW5l
IHdpdGggaXQgaWYgeW91IHdhbnQgdG8gY29udmVydCB0aGVzZSB0byBrZXJuZWwtZG9jIGNvbW1l
bnRzLgo+Pj4+IEkgdGhpbmsgaXQgbWFrZXMgcGVyZmVjdCBzZW5zZS4KPj4+Cj4+PiBPa2F5LCBz
byB0aGlzIGlzIGludGVyZXN0aW5nLiBXaGVuIEkgbG9vayBhdCB0aGUgYXBwbGllZCBwYXRjaGVz
IGluIG15Cj4+PiBsb2NhbCByZXBvLCBJIGRvbid0IHNlZSBhbnkgODErIGxpbmVzLiBTbyBpdCBz
ZWVtcyB0aGF0IHNvbWV0aGluZwo+Pj4gaW50ZXJlc3RpbmcgaXMgZ29pbmcgb24gaGVyZS4KPj4+
Cj4+PiBUbyBiZSBjbGVhciAoc29ycnkgZm9yIHRoZSBzdHVwaWQgcXVlc3Rpb24pIHlvdSBhcmUg
c2VlaW5nIHRoZSBpc3N1ZQo+Pj4gYWZ0ZXIgeW91IGFwcGxpZWQgdGhlIHBhdGNoLCBhbmQgbm90
IGluIHRoZSBwYXRjaCBmaWxlIGl0c2VsZj8KPj4+Cj4+Cj4+IEkgYW0gdXNpbmcgbXkgbm9ybWFs
IHdvcmtmbG93LiBNeSBwcmUtY29tbWl0IGNoZWNrIGlzIGNhdGNoaW5nIHRoaXMuCj4+IEp1c3Qg
dGhpcyBwYXRjaC4KPiAKPiBPa2F5LCAqdGhhdCogaXMgc3VwZXIgc3RyYW5nZSEKPiAKPiBTbyBJ
IGhhdmUgbGluZXMgaW4gdGhpcyBwYXRjaCAoMDEvMTgpIHRoYXQgYXJlIGV4YWN0bHkgODAgY2hh
ciB3aWRlCj4gYW5kIEkgd2FzIHRoaW5raW5nIHRoYXQgaXQgbWlnaHQgYmUgYW4gb2ZmIGJ5IG9u
ZSBpc3N1ZSBvbiBlaXRoZXIgbXkKPiB3b3JrZmxvdyBvciB5b3VyIHdvcmtmbG93LCBidXQgSSBo
YXZlIGxpbmVzIGluIG90aGVyIHBhdGNoZXMgdGhhdCBhcmUKPiBleGFjdGx5IDgwIGNoYXIgd2lk
ZSBhbmQgb3VyIHNldHVwcyBhZ3JlZSB0aGF0IHRoZXkgYXJlIGZpbmUsIHNvIEkKPiByZWFsbHkg
YW0gbm90IHN1cmUgd2hhdCdzIGdvaW5nIG9uIGhlcmUuCj4gCj4gSXQgc291bmRzIGxpa2UgeW91
IGFyZSBvbmx5IHNlZWluZyB0aGUgaXNzdWUgaW4gb25seSBhIGNvdXBsZSBwbGFjZXMsCj4gZG8g
eW91IG1pbmQgY2FsbGluZyBvdXQgdGhlIHNwZWNpZmljIGxpbmVzIHRoYXQgYXJlIHByb2JsZW1h
dGljPwoKVGFrZSBhIGxvb2sgYXQgdGhlIGNvbW1lbnQgYmxvY2tzLiBUaGF0IGlzIHdoZXJlIHRo
ZSBwcm9ibGVtIGFyZS4KCj4gCj4+IEFsbCBvdGhlcnMgYXJlIGdvb2Qgb3RoZXIgdGhhbiB0aGUg
OS8xOCBCVUcoKSBpc3N1ZS4KPj4+IFNpbmNlIHdlIGFyZSBzdGlsbCBhdCBPU1MsIHdvdWxkIHlv
dSBtaW5kIGlmIHdlIG1lZXQgdXAgdGhpcyBhZnRlcm5vb24KPj4+IHNvIEkgY2FuIHNlZSB0aGlz
IGlzc3VlIHlvdSBhcmUgc2VlaW5nPyBJIGltYWdpbmUgd2Ugc2hvdWxkIGdldCB0aGlzCj4+PiBm
aWd1cmVkIG91dCBwcmV0dHkgcXVpY2tseS4KPj4+Cj4+Cj4+IFllYWguIFdvdWxkIGhhdmUgYmVl
biBuaWNlLiBJIGFtIG5vdCBhdCBvc3MgdG9kYXkuCj4gCj4gRGFuZy4KPiAKCnRoYW5rcywKLS0g
U2h1YWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
