Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250849B69C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 21:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823DF89CA1;
	Fri, 23 Aug 2019 19:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718F6899E6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 19:04:32 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3753421848;
 Fri, 23 Aug 2019 19:04:29 +0000 (UTC)
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
From: shuah <shuah@kernel.org>
Message-ID: <bb9384cd-bd62-2190-e0da-ed3537aff171@kernel.org>
Date: Fri, 23 Aug 2019 13:04:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g44NAs6KK0_sG9itgT5qxujpyx36XV6tT8=zMynG-ZyVhQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566587071;
 bh=IcUeS/+TSgwe3vpGhsSSuKosuUCpUPmBosbk8jcvaiQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rTIzWC5zV0nre7u91ZEq8hwQlH6tqRHWTl+qBs41DcDiAX1J7JTqdsK/8M+gB2aXV
 jY1KM2aXt9mhG0S7tsFYAxrQ8qevfBMbP/nt3ThaxmXWkJ+P5h+7YS7dFr0VNwcMvv
 q3bECzFy7Ss58ipoWy0HfZrpT07Z1h7kiD1/5jOw=
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

T24gOC8yMy8xOSAxMjo1NiBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+IE9uIEZyaSwgQXVn
IDIzLCAyMDE5IGF0IDExOjMyIEFNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3cm90ZToKPj4K
Pj4gT24gOC8yMy8xOSAxMTo1NCBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+Pj4gT24gRnJp
LCBBdWcgMjMsIDIwMTkgYXQgMTA6MzQgQU0gc2h1YWggPHNodWFoQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Pj4+Cj4+Pj4gT24gOC8yMy8xOSAxMToyNyBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+
Pj4+PiBPbiBGcmksIEF1ZyAyMywgMjAxOSBhdCAxMDowNSBBTSBzaHVhaCA8c2h1YWhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gT24gOC8yMy8xOSAxMDo0OCBBTSwgQnJlbmRhbiBI
aWdnaW5zIHdyb3RlOgo+Pj4+Pj4+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDg6MzMgQU0gc2h1
YWggPHNodWFoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBIaSBCcmVuZGFu
LAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiA4LzIwLzE5IDU6MjAgUE0sIEJyZW5kYW4gSGlnZ2lucyB3
cm90ZToKPj4+Pj4+Pj4+IEFkZCBjb3JlIGZhY2lsaXRpZXMgZm9yIGRlZmluaW5nIHVuaXQgdGVz
dHM7IHRoaXMgcHJvdmlkZXMgYSBjb21tb24gd2F5Cj4+Pj4+Pj4+PiB0byBkZWZpbmUgdGVzdCBj
YXNlcywgZnVuY3Rpb25zIHRoYXQgZXhlY3V0ZSBjb2RlIHdoaWNoIGlzIHVuZGVyIHRlc3QKPj4+
Pj4+Pj4+IGFuZCBkZXRlcm1pbmUgd2hldGhlciB0aGUgY29kZSB1bmRlciB0ZXN0IGJlaGF2ZXMg
YXMgZXhwZWN0ZWQ7IHRoaXMgYWxzbwo+Pj4+Pj4+Pj4gcHJvdmlkZXMgYSB3YXkgdG8gZ3JvdXAg
dG9nZXRoZXIgcmVsYXRlZCB0ZXN0IGNhc2VzIGluIHRlc3Qgc3VpdGVzIChoZXJlCj4+Pj4+Pj4+
PiB3ZSBjYWxsIHRoZW0gdGVzdF9tb2R1bGVzKS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBKdXN0IGRl
ZmluZSB0ZXN0IGNhc2VzIGFuZCBob3cgdG8gZXhlY3V0ZSB0aGVtIGZvciBub3c7IHNldHRpbmcK
Pj4+Pj4+Pj4+IGV4cGVjdGF0aW9ucyBvbiBjb2RlIHdpbGwgYmUgZGVmaW5lZCBsYXRlci4KPj4+
Pj4+Pj4+Cj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+Cj4+Pj4+Pj4+PiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPj4+Pj4+Pj4+IFJldmlld2VkLWJ5OiBM
b2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+Cj4+Pj4+Pj4+PiBSZXZpZXdlZC1i
eTogTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+Cj4+Pj4+Pj4+PiBSZXZpZXdl
ZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPgo+Pj4+Pj4+Pj4gLS0tCj4+Pj4+
Pj4+PiAgICAgICBpbmNsdWRlL2t1bml0L3Rlc3QuaCB8IDE3OSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4+Pj4+Pj4+PiAgICAgICBrdW5pdC9LY29uZmlnICAgICAg
ICB8ICAxNyArKysrCj4+Pj4+Pj4+PiAgICAgICBrdW5pdC9NYWtlZmlsZSAgICAgICB8ICAgMSAr
Cj4+Pj4+Pj4+PiAgICAgICBrdW5pdC90ZXN0LmMgICAgICAgICB8IDE5MSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+Pj4+PiAgICAgICA0IGZpbGVzIGNo
YW5nZWQsIDM4OCBpbnNlcnRpb25zKCspCj4+Pj4+Pj4+PiAgICAgICBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9rdW5pdC90ZXN0LmgKPj4+Pj4+Pj4+ICAgICAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBrdW5pdC9LY29uZmlnCj4+Pj4+Pj4+PiAgICAgICBjcmVhdGUgbW9kZSAxMDA2NDQga3VuaXQv
TWFrZWZpbGUKPj4+Pj4+Pj4+ICAgICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBrdW5pdC90ZXN0LmMK
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9rdW5pdC90ZXN0LmggYi9p
bmNsdWRlL2t1bml0L3Rlc3QuaAo+Pj4+Pj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+Pj4+
Pj4+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmUwYjM0YWNiOWVlNGUKPj4+Pj4+Pj4+IC0tLSAvZGV2
L251bGwKPj4+Pj4+Pj4+ICsrKyBiL2luY2x1ZGUva3VuaXQvdGVzdC5oCj4+Pj4+Pj4+PiBAQCAt
MCwwICsxLDE3OSBAQAo+Pj4+Pj4+Pj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wICovCj4+Pj4+Pj4+PiArLyoKPj4+Pj4+Pj4+ICsgKiBCYXNlIHVuaXQgdGVzdCAoS1VuaXQp
IEFQSS4KPj4+Pj4+Pj4+ICsgKgo+Pj4+Pj4+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAxOSwgR29v
Z2xlIExMQy4KPj4+Pj4+Pj4+ICsgKiBBdXRob3I6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbT4KPj4+Pj4+Pj4+ICsgKi8KPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICsj
aWZuZGVmIF9LVU5JVF9URVNUX0gKPj4+Pj4+Pj4+ICsjZGVmaW5lIF9LVU5JVF9URVNUX0gKPj4+
Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4+Pj4+Pj4+ICsK
Pj4+Pj4+Pj4+ICtzdHJ1Y3Qga3VuaXQ7Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArLyoqCj4+Pj4+
Pj4+PiArICogc3RydWN0IGt1bml0X2Nhc2UgLSByZXByZXNlbnRzIGFuIGluZGl2aWR1YWwgdGVz
dCBjYXNlLgo+Pj4+Pj4+Pj4gKyAqIEBydW5fY2FzZTogdGhlIGZ1bmN0aW9uIHJlcHJlc2VudGlu
ZyB0aGUgYWN0dWFsIHRlc3QgY2FzZS4KPj4+Pj4+Pj4+ICsgKiBAbmFtZTogdGhlIG5hbWUgb2Yg
dGhlIHRlc3QgY2FzZS4KPj4+Pj4+Pj4+ICsgKgo+Pj4+Pj4+Pj4gKyAqIEEgdGVzdCBjYXNlIGlz
IGEgZnVuY3Rpb24gd2l0aCB0aGUgc2lnbmF0dXJlLCBgYHZvaWQgKCopKHN0cnVjdCBrdW5pdCAq
KWBgCj4+Pj4+Pj4+PiArICogdGhhdCBtYWtlcyBleHBlY3RhdGlvbnMgKHNlZSBLVU5JVF9FWFBF
Q1RfVFJVRSgpKSBhYm91dCBjb2RlIHVuZGVyIHRlc3QuIEVhY2gKPj4+Pj4+Pj4+ICsgKiB0ZXN0
IGNhc2UgaXMgYXNzb2NpYXRlZCB3aXRoIGEgJnN0cnVjdCBrdW5pdF9zdWl0ZSBhbmQgd2lsbCBi
ZSBydW4gYWZ0ZXIgdGhlCj4+Pj4+Pj4+PiArICogc3VpdGUncyBpbml0IGZ1bmN0aW9uIGFuZCBm
b2xsb3dlZCBieSB0aGUgc3VpdGUncyBleGl0IGZ1bmN0aW9uLgo+Pj4+Pj4+Pj4gKyAqCj4+Pj4+
Pj4+PiArICogQSB0ZXN0IGNhc2Ugc2hvdWxkIGJlIHN0YXRpYyBhbmQgc2hvdWxkIG9ubHkgYmUg
Y3JlYXRlZCB3aXRoIHRoZSBLVU5JVF9DQVNFKCkKPj4+Pj4+Pj4+ICsgKiBtYWNybzsgYWRkaXRp
b25hbGx5LCBldmVyeSBhcnJheSBvZiB0ZXN0IGNhc2VzIHNob3VsZCBiZSB0ZXJtaW5hdGVkIHdp
dGggYW4KPj4+Pj4+Pj4+ICsgKiBlbXB0eSB0ZXN0IGNhc2UuCj4+Pj4+Pj4+PiArICoKPj4+Pj4+
Pj4+ICsgKiBFeGFtcGxlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBDYW4geW91IGZpeCB0aGVzZSBsaW5l
IGNvbnRpbnVhdGlvbnMuIEl0IG1ha2VzIGl0IHZlcnkgaGFyZCB0byByZWFkLgo+Pj4+Pj4+PiBT
b3JyeSBmb3IgdGhpcyBsYXRlIGNvbW1lbnQuIFRoZXNlIGNvbW1lbnRzIGxpbmVzIGFyZSBsb25n
ZXIgdGhhbiA4MAo+Pj4+Pj4+PiBhbmQgd3JhcC4KPj4+Pj4+Pgo+Pj4+Pj4+IE5vbmUgb2YgdGhl
IGxpbmVzIGluIHRoaXMgY29tbWl0IGFyZSBvdmVyIDgwIGNoYXJhY3RlcnMgaW4gY29sdW1uCj4+
Pj4+Pj4gd2lkdGguIFNvbWUgYXJlIGV4YWN0bHkgODAgY2hhcmFjdGVycyAobGlrZSBhYm92ZSku
Cj4+Pj4+Pj4KPj4+Pj4+PiBNeSBndWVzcyBpcyB0aGF0IHlvdSBhcmUgc2VlaW5nIHRoZSBkaWZm
IGFkZGVkIHRleHQgKCsgKSwgd2hpY2ggd2hlbgo+Pj4+Pj4+IHlvdSBhZGQgdGhhdCB0byBhIGxp
bmUgd2hpY2ggaXMgZXhhY3RseSA4MCBjaGFyIGluIGxlbmd0aCBlbmRzIHVwCj4+Pj4+Pj4gYmVp
bmcgb3ZlciA4MCBjaGFyIGluIGVtYWlsLiBJZiB5b3UgYXBwbHkgdGhlIHBhdGNoIHlvdSB3aWxs
IHNlZSB0aGF0Cj4+Pj4+Pj4gdGhleSBhcmUgb25seSA4MCBjaGFycy4KPj4+Pj4+Pgo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiBUaGVyZSBhcmUgc2V2ZXJhbCBjb21tZW50IGxpbmVzIGluIHRoZSBmaWxlIHRo
YXQgYXJlIHdheSB0b28gbG9uZy4KPj4+Pj4+Pgo+Pj4+Pj4+IE5vdGUgdGhhdCBjaGVja3BhdGNo
IGFsc28gZG9lcyBub3QgY29tcGxhaW4gYWJvdXQgYW55IG92ZXIgODAgY2hhcgo+Pj4+Pj4+IGxp
bmVzIGluIHRoaXMgZmlsZS4KPj4+Pj4+Pgo+Pj4+Pj4+IFNvcnJ5IGlmIEkgYW0gbWlzdW5kZXJz
dGFuZGluZyB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIHRlbGwgbWUuIFBsZWFzZQo+Pj4+Pj4+IGNv
bmZpcm0gZWl0aGVyIHdheS4KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFdBUk5JTkc6IEF2b2lkIHVu
bmVjZXNzYXJ5IGxpbmUgY29udGludWF0aW9ucwo+Pj4+Pj4gIzI1ODogRklMRTogaW5jbHVkZS9r
dW5pdC90ZXN0Lmg6MTM3Ogo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAqLyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+Pj4+Cj4+
Pj4+PiB0b3RhbDogMCBlcnJvcnMsIDIgd2FybmluZ3MsIDM4OCBsaW5lcyBjaGVja2VkCj4+Pj4+
Cj4+Pj4+IEFoLCBva2F5IHNvIHlvdSBkb24ndCBsaWtlIHRoZSB3YXJuaW5nIGFib3V0IHRoZSBs
aW5lIGNvbnRpbnVhdGlvbi4KPj4+Pj4gVGhhdCdzIG5vdCBiZWNhdXNlIGl0IGlzIG92ZXIgODAg
Y2hhciwgYnV0IGJlY2F1c2UgdGhlcmUgaXMgYSBsaW5lCj4+Pj4+IGNvbnRpbnVhdGlvbiBhZnRl
ciBhIGNvbW1lbnQuIEkgZG9uJ3QgcmVhbGx5IHNlZSBhIHdheSB0byBnZXQgcmlkIG9mCj4+Pj4+
IGl0IHdpdGhvdXQgcmVtb3ZpbmcgdGhlIGNvbW1lbnQgZnJvbSBpbnNpZGUgdGhlIG1hY3JvLgo+
Pj4+Pgo+Pj4+PiBJIHB1dCB0aGlzIFRPRE8gdGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlIGEgTHVp
cycgcmVxdWVzdCwgYW5kIEkgcHV0IGl0Cj4+Pj4+IGluIHRoZSBib2R5IG9mIHRoZSBtYWNybyBi
ZWNhdXNlIHRoaXMgbWFjcm8gYWxyZWFkeSBoYWQgYSBrZXJuZWwtZG9jCj4+Pj4+IGNvbW1lbnQg
YW5kIEkgZGlkbid0IHRoaW5rIHRoYXQgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsIFRPRE8gYmVs
b25nZWQKPj4+Pj4gaW4gdGhlIHVzZXIgZG9jdW1lbnRhdGlvbi4KPj4+Pj4KPj4+Pj4+IEdvIGFo
ZWFkIGZpeCB0aGVzZS4gSXQgYXBwZWFycyB0aGVyZSBhcmUgZmV3IGxpbmVzIHRoYXQgZWl0aGVy
IGxvbmdlcgo+Pj4+Pj4gdGhhbiA4MC4gSW4gZ2VuZXJhbCwgSSBrZWVwIHRoZW0gYXJvdW5kIDc1
LCBzbyBpdCBpcyBlYXNpZXIgcmVhZC4KPj4+Pj4KPj4+Pj4gU29ycnksIHRoZSBhYm92ZSBpcyB0
aGUgb25seSBjaGVja3BhdGNoIHdhcm5pbmcgb3RoZXIgdGhhbiB0aGUKPj4+Pj4gcmVtaW5kZXIg
dG8gdXBkYXRlIHRoZSBNQUlOVEFJTkVSUyBmaWxlLgo+Pj4+Pgo+Pj4+PiBBcmUgeW91IHNheWlu
ZyB5b3Ugd2FudCBtZSB0byBnbyB0aHJvdWdoIGFuZCBtYWtlIGFsbCB0aGUgbGluZXMgZml0IGlu
Cj4+Pj4+IDc1IGNoYXIgY29sdW1uIHdpZHRoPyBJIGhvcGUgbm90IGJlY2F1c2UgdGhhdCBpcyBn
b2luZyB0byBiZSBhIHByZXR0eQo+Pj4+PiBzdWJzdGFudGlhbCBjaGFuZ2UgdG8gbWFrZS4KPj4+
Pj4KPj4+Pgo+Pj4+IFRoZXJlIGFyZSB0d28gdGhpbmdzIHdpdGggdGhlc2UgY29tbWVudCBsaW5l
cy4gT25lIGlzIGNoZWNrcGF0Y2gKPj4+PiBjb21wbGFpbmluZyBhbmQgdGhlIG90aGVyIGlzIGdl
bmVyYWwgcmVhZGFiaWxpdHkuCj4+Pgo+Pj4gU28gZm9yIHRoZSBjaGVja3BhdGNoIHdhcm5pbmcs
IGRvIHlvdSB3YW50IG1lIHRvIG1vdmUgdGhlIGNvbW1lbnQgb3V0Cj4+PiBvZiB0aGUgbWFjcm8g
Ym9keSBpbnRvIHRoZSBrZXJuZWwtZG9jIGNvbW1lbnQ/IEkgZG9uJ3QgcmVhbGx5IHRoaW5rIGl0
Cj4+PiBpcyB0aGUgcmlnaHQgcGxhY2UgZm9yIGEgY29tbWVudCBvZiB0aGlzIG5hdHVyZSwgYnV0
IEkgdGhpbmsgaXQgaXMKPj4+IHByb2JhYmx5IGJldHRlciB0aGFuIGRyb3BwaW5nIGl0IGVudGly
ZWx5IChJIGRvbid0IHNlZSBob3cgZWxzZSB0byBkbwo+Pj4gaXQgd2l0aG91dCBqdXN0IHJlbW92
aW5nIHRoZSBjb21tZW50IGVudGlyZWx5KS4KPj4+Cj4+Cj4+IERvbid0IGRyb3AgdGhlIGNvbW1l
bnRzLiBJdCBtYWtlcyBwZXJmZWN0IHNlbnNlIHRvIHR1cm4gdGhpcyBpbnRvIGEKPj4ga2VybmVs
LWRvYyBjb21tZW50Lgo+IAo+IEkgYW0gZmluZSB3aXRoIHRoYXQuIEkgd2lsbCBkbyB0aGF0IGlu
IGEgc3Vic2VxdWVudCByZXZpc2lvbiBvbmNlIHdlCj4gZmlndXJlIG91dCB0aGUgY29sdW1uIGxp
bWl0IGlzc3VlLgo+IAo+PiBXZSBhcmUgZ29pbmcgYmFjayBmb3J0aCBvbiB0aGlzIGEgbG90LiBJ
IHNlZSBzZXZlcmFsIGxpbmVzIDgxKyBpbgo+PiB0aGlzIGZpbGUuIEkgYW0gYXQgNS4zLXJjNSBh
bmQgbXkgY29tbWl0IGhvb2tzIGFyZW4ndCBoYXBweS4gSSBhbQo+PiBmaW5lIHdpdGggaXQgaWYg
eW91IHdhbnQgdG8gY29udmVydCB0aGVzZSB0byBrZXJuZWwtZG9jIGNvbW1lbnRzLgo+PiBJIHRo
aW5rIGl0IG1ha2VzIHBlcmZlY3Qgc2Vuc2UuCj4gCj4gT2theSwgc28gdGhpcyBpcyBpbnRlcmVz
dGluZy4gV2hlbiBJIGxvb2sgYXQgdGhlIGFwcGxpZWQgcGF0Y2hlcyBpbiBteQo+IGxvY2FsIHJl
cG8sIEkgZG9uJ3Qgc2VlIGFueSA4MSsgbGluZXMuIFNvIGl0IHNlZW1zIHRoYXQgc29tZXRoaW5n
Cj4gaW50ZXJlc3RpbmcgaXMgZ29pbmcgb24gaGVyZS4KPiAKPiBUbyBiZSBjbGVhciAoc29ycnkg
Zm9yIHRoZSBzdHVwaWQgcXVlc3Rpb24pIHlvdSBhcmUgc2VlaW5nIHRoZSBpc3N1ZQo+IGFmdGVy
IHlvdSBhcHBsaWVkIHRoZSBwYXRjaCwgYW5kIG5vdCBpbiB0aGUgcGF0Y2ggZmlsZSBpdHNlbGY/
Cj4gCgpJIGFtIHVzaW5nIG15IG5vcm1hbCB3b3JrZmxvdy4gTXkgcHJlLWNvbW1pdCBjaGVjayBp
cyBjYXRjaGluZyB0aGlzLgpKdXN0IHRoaXMgcGF0Y2guIEFsbCBvdGhlcnMgYXJlIGdvb2Qgb3Ro
ZXIgdGhhbiB0aGUgOS8xOCBCVUcoKSBpc3N1ZS4KCj4gU2luY2Ugd2UgYXJlIHN0aWxsIGF0IE9T
Uywgd291bGQgeW91IG1pbmQgaWYgd2UgbWVldCB1cCB0aGlzIGFmdGVybm9vbgo+IHNvIEkgY2Fu
IHNlZSB0aGlzIGlzc3VlIHlvdSBhcmUgc2VlaW5nPyBJIGltYWdpbmUgd2Ugc2hvdWxkIGdldCB0
aGlzCj4gZmlndXJlZCBvdXQgcHJldHR5IHF1aWNrbHkuCj4gCgpZZWFoLiBXb3VsZCBoYXZlIGJl
ZW4gbmljZS4gSSBhbSBub3QgYXQgb3NzIHRvZGF5LgoKdGhhbmtzLAotLSBTaHVhaAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
