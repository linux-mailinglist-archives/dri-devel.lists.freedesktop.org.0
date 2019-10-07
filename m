Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5E2CE587
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 16:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BC16E0F3;
	Mon,  7 Oct 2019 14:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF2A6E0F3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 14:42:54 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 652F821655;
 Mon,  7 Oct 2019 14:42:51 +0000 (UTC)
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
 <20191004232955.GC12012@mit.edu>
 <CAFd5g456rBSp177EkYAwsF+KZ0rxJa90mzUpW2M3R7tWbMAh9Q@mail.gmail.com>
 <63e59b0b-b51e-01f4-6359-a134a1f903fd@kernel.org>
 <CAFd5g47wji3T9RFmqBwt+jPY0tb83y46oj_ttOq=rTX_N1Ggyg@mail.gmail.com>
 <544bdfcb-fb35-5008-ec94-8d404a08fd14@kernel.org>
 <CAFd5g467PkfELixpU0JbaepEAAD_ugAA340-uORngC-eXsQQ-g@mail.gmail.com>
 <20191006165436.GA29585@mit.edu>
 <CAHk-=wjcJxypxUOSF-jc=SQKT1CrOoTMyT7soYzbvK3965JmCA@mail.gmail.com>
 <CAFd5g45djTX+FaXwn2abve1+6GbtNrv+8EJgDe_TXn1d+pzukA@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <ed26ac47-7f27-c3ec-56ae-8b3b9aa87654@kernel.org>
Date: Mon, 7 Oct 2019 08:42:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g45djTX+FaXwn2abve1+6GbtNrv+8EJgDe_TXn1d+pzukA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570459374;
 bh=8a9ttxrtf8XQAHoqUXfvVNJTnrKk2ig330NCAHu4lg8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AoB6OsaRPmZtmsSo+lnAiCXKXpAVYnRxoGldWXC/BBHobSDS+krxcX7IrlOfGHyrA
 TxYbr+Z5YnGt6XoXu3UMvJaolTAbaKL0uQsfA2rKEiZhsD8DybbBoZ3r44PxiMr/G5
 2Q6UI0fo3E2C4VIFC/24/CxuC6cNzrzr3VHDshCo=
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
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, shuah <shuah@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNy8xOSAyOjQwIEFNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gT24gU3VuLCBPY3Qg
NiwgMjAxOSBhdCAxMDoxOCBBTSBMaW51cyBUb3J2YWxkcwo+IDx0b3J2YWxkc0BsaW51eC1mb3Vu
ZGF0aW9uLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIFN1biwgT2N0IDYsIDIwMTkgYXQgOTo1NSBBTSBU
aGVvZG9yZSBZLiBUcydvIDx0eXRzb0BtaXQuZWR1PiB3cm90ZToKPj4+Cj4+PiBXZWxsLCBvbmUg
dGhpbmcgd2UgKmNhbiogZG8gaXMgaWYgKGEpIGlmIHdlIGNhbiBjcmVhdGUgYSBrc2VsZnRlc3QK
Pj4+IGJyYW5jaCB3aGljaCB3ZSBrbm93IGlzIHN0YWJsZSBhbmQgd29uJ3QgY2hhbmdlLCBhbmQg
KGIpIHdlIGNhbiBnZXQKPj4+IGFzc3VyYW5jZXMgdGhhdCBMaW51cyAqd2lsbCogYWNjZXB0IHRo
YXQgYnJhbmNoIGR1cmluZyB0aGUgbmV4dCBtZXJnZQo+Pj4gd2luZG93LCB0aG9zZSBzdWJzeXN0
ZW1zIHdoaWNoIHdhbnQgdG8gdXNlIGtzZWxmIHRlc3QgY2FuIHNpbXBseSBwdWxsCj4+PiBpdCBp
bnRvIHRoZWlyIHRyZWUuCj4+Cj4+IFllcy4KPj4KPj4gQXQgdGhlIHNhbWUgdGltZSwgSSBkb24n
dCB0aGluayBpdCBuZWVkcyB0byBiZSBldmVuIHRoYXQgZmFuY3kuIEV2ZW4KPj4gaWYgaXQncyBu
b3QgYSBzdGFibGUgYnJhbmNoIHRoYXQgZ2V0cyBzaGFyZWQgYmV0d2VlbiBkaWZmZXJlbnQKPj4g
ZGV2ZWxvcGVycywgaXQgd291bGQgYmUgZ29vZCB0byBqdXN0IGhhdmUgcGVvcGxlIGRvIGEgImxl
dCdzIHRyeSB0aGlzIgo+PiB0aHJvdy1hd2F5IGJyYW5jaCB0byB1c2UgdGhlIGt1bml0IGZ1bmN0
aW9uYWxpdHkgYW5kIHZlcmlmeSB0aGF0Cj4+ICJ5ZWFoLCB0aGlzIGlzIGZhaXJseSBjb252ZW5p
ZW50IGZvciBleHQ0Ii4KPj4KPj4gSXQgZG9lc24ndCBoYXZlIHRvIGJlIG1lcmdlZCBpbiB0aGF0
IGZvcm0sIGJ1dCBqdXN0IGNvbmZpcm1hdGlvbiB0aGF0Cj4+IHRoZSBpbmZyYXN0cnVjdHVyZSBp
cyBoZWxwZnVsIGJlZm9yZSBpdCBnZXRzIG1lcmdlZCB3b3VsZCBiZSBnb29kLgo+IAo+IEkgdGhv
dWdodCB3ZSBhbHJlYWR5IGhhZCBkb25lIHRoaXMgc2F0aXNmYWN0b3JpbHkuCj4gCkFkZGluZyBh
IGNvdXBsZSBtb3JlIHRlc3RzIHdpbGwgb25seSBoZWxwIGluIHRoZSBsb25nIHJ1bi4gVGhlIGlk
ZWEgaXMKdG8gc2VlIGNhbiB0aGlzIGhlbHAKCj4gV2UgaGF2ZSBvbmUgcHJvb2Ytb2YtY29uY2Vw
dCB0ZXN0IGluIHRoZSBicmFuY2ggaW4gdGhlIGtzZWxmdGVzdCByZXBvCj4gKHByb2Mgc3lzY3Rs
IHRlc3QpIHRoYXQgd2VudCBvdXQgaW4gdGhlIHB1bGwgcmVxdWVzdCwgYW5kIHdlIGFsc28gaGFk
Cj4gc29tZSBvdGhlciB0ZXN0cyB0aGF0IHdlcmUgbm90IGluIHRoZSBwdWxsIHJlcXVlc3QgKHRo
ZXJlIGlzIHRoZSBleHQ0Cj4gdGltZXN0YW1wIHN0dWZmIG1lbnRpb25lZCBhYm92ZSwgYW5kIHdl
IGFsc28gaGFkIG9uZSBhZ2FpbnN0IHRoZSBsaXN0Cj4gZGF0YSBzdHJ1Y3R1cmUpLCB3aGljaCB3
ZSB3ZXJlIHBsYW5uaW5nIG9uIHNlbmRpbmcgb3V0IGZvciByZXZpZXcgb25jZQo+IFNodWFoJ3Mg
cHVsbCByZXF1ZXN0IHdhcyBhY2NlcHRlZC4gSSBrbm93IHRoZSBhcHBhcm1vciBwZW9wbGUgYWxz
bwo+IHdyb3RlIHNvbWUgdGVzdHMgdGhhdCB0aGV5IHNhaWQgd2VyZSB1c2VmdWw7IGhvd2V2ZXIs
IEkgaGF2ZSBub3QKPiBjb29yZGluYXRlZCB3aXRoIHRoZW0gb24gdXBzdHJlYW1pbmcgdGhlaXIg
dGVzdHMuIEkga25vdyBvZiBzb21lIG90aGVyCj4gcGVvcGxlIHdobyBhcmUgdXNpbmcgaXQsIGJ1
dCBJIGRvbid0IHRoaW5rIHRoZSB0ZXN0cyBhcmUgYXMgZmFyIGFsb25nCj4gZm9yIHVwc3RyZWFt
aW5nLgo+IAoKTWF5YmUgdGhhdCBpcyBhIGdvb2Qgc3RhcnQuIFRvIGdldCB0aGUgdGVzdHMgdGhh
dCBhcmUgYWxyZWFkeSBpbiB1c2UKYW5kIGdldCB0aGVtIGluIHNoYXBlIGZvciB1cHN0cmVhbS4K
Cj4gVGhlIHBvaW50IGlzOiBJIHRob3VnaHQgd2UgaGFkIHBsZW50eSBvZiBzaWduYWwgdGhhdCBL
VW5pdCB3b3VsZCBiZQo+IHVzZWZ1bCB0byBoYXZlIG1lcmdlZCBpbnRvIHRoZSBtYWlubGluZSBr
ZXJuZWwuIEkgdGhvdWdodCB0aGUgb25seQo+IHJlYXNvbiBpdCB3YXMgcmVqZWN0ZWQgZm9yIDUu
NCB3YXMgZHVlIHRvIHRoZSBkaXJlY3RvcnkgbmFtZSBpc3N1ZQo+IGNvbWJpbmVkIHdpdGggYmFk
IHRpbWluZy4KPiAKClRoYXQgaXMgcHJvYmFibHkgdGhlIGluaXRpYWwgdGhvdWdodC4gSG93ZXZl
ciwgaXQgbWFrZXMgcGVyZmVjdCBzZW5zZQp0byBhZGQgYSBjb3VwbGUgb2YgdGVzdHMgaW4uIFdl
IGhhdmUgYSBmZXcgd2Vla3MgYW55d2F5IGFuZCBpdCBnaXZlcwp1cyBtb3JlIGNvbmZpZGVuY2Ug
b24ga3VuaXQuCgpJIGFscmVhZHkgaGF2ZSBhIGJyYW5jaCB0aGF0IGlzIGluIGxpbnV4LW5leHQg
YW5kIGl0IGp1c3QgaGFzIGt1bml0IGluCml0IGFuZCBJIHdpbGwgcmViYXNlIGl0IHRvIDUuNC1y
YzEuCgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zaHVh
aC9saW51eC1rc2VsZnRlc3QuZ2l0L2xvZy8/aD10ZXN0CgpMZXQncyB1c2UgdGhhdCBmb3Iga3Vu
aXQgd29yayBmb3IgNS41LiBJIHdvbid0IGFkZCBhbnkga3NlbGZ0ZXN0IHBhdGNoZXMKdG8gaXQg
YW5kIGtlZXAgaXQgZGVkaWNhdGVkIGZvciBrdW5pdCB3b3JrLiBXaGVuIHRlc3RzIGFyZSByZWFk
eSBmb3IKdXBzdHJlYW0sIEkgY2FuIGtlZXAgYWRkaW5nIHRoZW0gdG8gdGhpcyBicmFuY2guCgp0
aGFua3MsCi0tIFNodWFoCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
