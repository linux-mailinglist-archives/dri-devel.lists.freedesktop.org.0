Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E229B67E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 20:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115C16ED1F;
	Fri, 23 Aug 2019 18:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714C06ED1F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 18:56:16 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id i18so6232615pgl.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 11:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s/+aPLXaaGZm0z/f+opsuLonUw7MdHLn7J6CRhMZwFI=;
 b=HoodB7M+YtVF6UXgSErog4DWFVnXl8l2k1sYfymHz1s0+lnHbEIOp4xT97rQcLlESD
 eFT2h8JRJHRp7v/0bHUtcFBzR0joN9UAm+p9AyUU2qEC6wSaMhfYfAsp0vdA8dfH7ekF
 tpEZimNsJxyg6jrXMXatJbgWbsh+0hlCiL8BMrDkNkXq+O4xtcyuaMB/KhtxJAxBedSi
 Gho8mpxZG9ikIEcwuk1gppuiS/wouMovlY8NZcPlHDClVpRaxxJEhzBd5Plt5Y1R6Dnu
 JcRxYqan3ML6yYHSQPU0JR3YRk+8VVbvjrkfM4K6JMRLNxSnNhc9mlc8PayULvKodcgF
 flvA==
X-Gm-Message-State: APjAAAU6rJLJoCQab9oyXXjwuwLnuDKDReYy/RrMfgh5Jhijvk2RGGGK
 hsf2LYUG1CgXCDp2nsVd8OcKUc9Rsu2D7/kNJjxWhQ==
X-Google-Smtp-Source: APXvYqwVWo6KNiW0mQ1ETfauvPQKOgX6Abfum/nAPgc5t6Yzc0edHSPUqib3OQFJdFu2HNr4tJqGaSMlXFS9ixOmggs=
X-Received: by 2002:a17:90a:25ea:: with SMTP id
 k97mr6804556pje.131.1566586575337; 
 Fri, 23 Aug 2019 11:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190820232046.50175-1-brendanhiggins@google.com>
 <20190820232046.50175-2-brendanhiggins@google.com>
 <7f2c8908-75f6-b793-7113-ad57c51777ce@kernel.org>
 <CAFd5g44mRK9t4f58i_YMEt=e9RTxwrrhFY_V2LW_E7bUwR3cdg@mail.gmail.com>
 <4513d9f3-a69b-a9a4-768b-86c2962b62e0@kernel.org>
 <CAFd5g446J=cVW4QW+QeZMLDi+ANqshAW6KTrFFBTusPcdr6-GA@mail.gmail.com>
 <42c6235c-c586-8de1-1913-7cf1962c6066@kernel.org>
 <CAFd5g44hLgeqPtNw1zQ5k_+apBm=ri_6=wAgHk=oPOvQs6xgNg@mail.gmail.com>
 <54f3c011-d666-e828-5e77-359b7a7374e7@kernel.org>
In-Reply-To: <54f3c011-d666-e828-5e77-359b7a7374e7@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 23 Aug 2019 11:56:03 -0700
Message-ID: <CAFd5g44NAs6KK0_sG9itgT5qxujpyx36XV6tT8=zMynG-ZyVhQ@mail.gmail.com>
Subject: Re: [PATCH v14 01/18] kunit: test: add KUnit test runner core
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=s/+aPLXaaGZm0z/f+opsuLonUw7MdHLn7J6CRhMZwFI=;
 b=aLqCki7OFRYb/zbxlgpGpa4MLZg24uOYeXo+bf759ur8hv1j2TRWPaLstl3a5bk10n
 k9gZHsbj7RxEFvNm/UBw4x6AHMOqoIf/ZGCxlxIps6H1nGB4dHIYzRm+iwSZsHo9cyep
 NQSVwGP5NR+YSOXJmM805vzb7tKcZoohUkGLv2BSmjPrKeneCaMQK2eneKbObMLvTYkP
 lUd9iMs9dZblf94k6Ei365fYzU3AUwiPyeM1OqmPPs95PxMEymqhlGu1BcqjfCV5P0OP
 qkLQ4DDcSRoXYkgDNbUMDsSyuoKrdlN3EVmPRXJtcw1zjcwJLDnJgdEsctFaR5HmJxC5
 nJLQ==
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
 devicetree <devicetree@vger.kernel.org>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTE6MzIgQU0gc2h1YWggPHNodWFoQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Cj4gT24gOC8yMy8xOSAxMTo1NCBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+
ID4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6MzQgQU0gc2h1YWggPHNodWFoQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gOC8yMy8xOSAxMToyNyBBTSwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+ID4+PiBPbiBGcmksIEF1ZyAyMywgMjAxOSBhdCAxMDowNSBBTSBzaHVhaCA8c2h1
YWhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gT24gOC8yMy8xOSAxMDo0OCBBTSwg
QnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4+Pj4+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDg6
MzMgQU0gc2h1YWggPHNodWFoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Pj4+Pgo+ID4+Pj4+PiBI
aSBCcmVuZGFuLAo+ID4+Pj4+Pgo+ID4+Pj4+PiBPbiA4LzIwLzE5IDU6MjAgUE0sIEJyZW5kYW4g
SGlnZ2lucyB3cm90ZToKPiA+Pj4+Pj4+IEFkZCBjb3JlIGZhY2lsaXRpZXMgZm9yIGRlZmluaW5n
IHVuaXQgdGVzdHM7IHRoaXMgcHJvdmlkZXMgYSBjb21tb24gd2F5Cj4gPj4+Pj4+PiB0byBkZWZp
bmUgdGVzdCBjYXNlcywgZnVuY3Rpb25zIHRoYXQgZXhlY3V0ZSBjb2RlIHdoaWNoIGlzIHVuZGVy
IHRlc3QKPiA+Pj4+Pj4+IGFuZCBkZXRlcm1pbmUgd2hldGhlciB0aGUgY29kZSB1bmRlciB0ZXN0
IGJlaGF2ZXMgYXMgZXhwZWN0ZWQ7IHRoaXMgYWxzbwo+ID4+Pj4+Pj4gcHJvdmlkZXMgYSB3YXkg
dG8gZ3JvdXAgdG9nZXRoZXIgcmVsYXRlZCB0ZXN0IGNhc2VzIGluIHRlc3Qgc3VpdGVzIChoZXJl
Cj4gPj4+Pj4+PiB3ZSBjYWxsIHRoZW0gdGVzdF9tb2R1bGVzKS4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+
PiBKdXN0IGRlZmluZSB0ZXN0IGNhc2VzIGFuZCBob3cgdG8gZXhlY3V0ZSB0aGVtIGZvciBub3c7
IHNldHRpbmcKPiA+Pj4+Pj4+IGV4cGVjdGF0aW9ucyBvbiBjb2RlIHdpbGwgYmUgZGVmaW5lZCBs
YXRlci4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMg
PGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gPj4+Pj4+PiBSZXZpZXdlZC1ieTogR3JlZyBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiA+Pj4+Pj4+IFJldmll
d2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+Cj4gPj4+Pj4+PiBS
ZXZpZXdlZC1ieTogTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+Cj4gPj4+Pj4+
PiBSZXZpZXdlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPgo+ID4+Pj4+Pj4g
LS0tCj4gPj4+Pj4+PiAgICAgIGluY2x1ZGUva3VuaXQvdGVzdC5oIHwgMTc5ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+Pj4+Pj4+ICAgICAga3VuaXQvS2NvbmZp
ZyAgICAgICAgfCAgMTcgKysrKwo+ID4+Pj4+Pj4gICAgICBrdW5pdC9NYWtlZmlsZSAgICAgICB8
ICAgMSArCj4gPj4+Pj4+PiAgICAgIGt1bml0L3Rlc3QuYyAgICAgICAgIHwgMTkxICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+Pj4+Pj4+ICAgICAgNCBmaWxl
cyBjaGFuZ2VkLCAzODggaW5zZXJ0aW9ucygrKQo+ID4+Pj4+Pj4gICAgICBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS9rdW5pdC90ZXN0LmgKPiA+Pj4+Pj4+ICAgICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGt1bml0L0tjb25maWcKPiA+Pj4+Pj4+ICAgICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGt1bml0
L01ha2VmaWxlCj4gPj4+Pj4+PiAgICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBrdW5pdC90ZXN0LmMK
PiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9rdW5pdC90ZXN0LmggYi9p
bmNsdWRlL2t1bml0L3Rlc3QuaAo+ID4+Pj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+Pj4+
Pj4+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmUwYjM0YWNiOWVlNGUKPiA+Pj4+Pj4+IC0tLSAvZGV2
L251bGwKPiA+Pj4+Pj4+ICsrKyBiL2luY2x1ZGUva3VuaXQvdGVzdC5oCj4gPj4+Pj4+PiBAQCAt
MCwwICsxLDE3OSBAQAo+ID4+Pj4+Pj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wICovCj4gPj4+Pj4+PiArLyoKPiA+Pj4+Pj4+ICsgKiBCYXNlIHVuaXQgdGVzdCAoS1VuaXQp
IEFQSS4KPiA+Pj4+Pj4+ICsgKgo+ID4+Pj4+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAxOSwgR29v
Z2xlIExMQy4KPiA+Pj4+Pj4+ICsgKiBBdXRob3I6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbT4KPiA+Pj4+Pj4+ICsgKi8KPiA+Pj4+Pj4+ICsKPiA+Pj4+Pj4+ICsj
aWZuZGVmIF9LVU5JVF9URVNUX0gKPiA+Pj4+Pj4+ICsjZGVmaW5lIF9LVU5JVF9URVNUX0gKPiA+
Pj4+Pj4+ICsKPiA+Pj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+Pj4+Pj4+ICsK
PiA+Pj4+Pj4+ICtzdHJ1Y3Qga3VuaXQ7Cj4gPj4+Pj4+PiArCj4gPj4+Pj4+PiArLyoqCj4gPj4+
Pj4+PiArICogc3RydWN0IGt1bml0X2Nhc2UgLSByZXByZXNlbnRzIGFuIGluZGl2aWR1YWwgdGVz
dCBjYXNlLgo+ID4+Pj4+Pj4gKyAqIEBydW5fY2FzZTogdGhlIGZ1bmN0aW9uIHJlcHJlc2VudGlu
ZyB0aGUgYWN0dWFsIHRlc3QgY2FzZS4KPiA+Pj4+Pj4+ICsgKiBAbmFtZTogdGhlIG5hbWUgb2Yg
dGhlIHRlc3QgY2FzZS4KPiA+Pj4+Pj4+ICsgKgo+ID4+Pj4+Pj4gKyAqIEEgdGVzdCBjYXNlIGlz
IGEgZnVuY3Rpb24gd2l0aCB0aGUgc2lnbmF0dXJlLCBgYHZvaWQgKCopKHN0cnVjdCBrdW5pdCAq
KWBgCj4gPj4+Pj4+PiArICogdGhhdCBtYWtlcyBleHBlY3RhdGlvbnMgKHNlZSBLVU5JVF9FWFBF
Q1RfVFJVRSgpKSBhYm91dCBjb2RlIHVuZGVyIHRlc3QuIEVhY2gKPiA+Pj4+Pj4+ICsgKiB0ZXN0
IGNhc2UgaXMgYXNzb2NpYXRlZCB3aXRoIGEgJnN0cnVjdCBrdW5pdF9zdWl0ZSBhbmQgd2lsbCBi
ZSBydW4gYWZ0ZXIgdGhlCj4gPj4+Pj4+PiArICogc3VpdGUncyBpbml0IGZ1bmN0aW9uIGFuZCBm
b2xsb3dlZCBieSB0aGUgc3VpdGUncyBleGl0IGZ1bmN0aW9uLgo+ID4+Pj4+Pj4gKyAqCj4gPj4+
Pj4+PiArICogQSB0ZXN0IGNhc2Ugc2hvdWxkIGJlIHN0YXRpYyBhbmQgc2hvdWxkIG9ubHkgYmUg
Y3JlYXRlZCB3aXRoIHRoZSBLVU5JVF9DQVNFKCkKPiA+Pj4+Pj4+ICsgKiBtYWNybzsgYWRkaXRp
b25hbGx5LCBldmVyeSBhcnJheSBvZiB0ZXN0IGNhc2VzIHNob3VsZCBiZSB0ZXJtaW5hdGVkIHdp
dGggYW4KPiA+Pj4+Pj4+ICsgKiBlbXB0eSB0ZXN0IGNhc2UuCj4gPj4+Pj4+PiArICoKPiA+Pj4+
Pj4+ICsgKiBFeGFtcGxlOgo+ID4+Pj4+Pgo+ID4+Pj4+PiBDYW4geW91IGZpeCB0aGVzZSBsaW5l
IGNvbnRpbnVhdGlvbnMuIEl0IG1ha2VzIGl0IHZlcnkgaGFyZCB0byByZWFkLgo+ID4+Pj4+PiBT
b3JyeSBmb3IgdGhpcyBsYXRlIGNvbW1lbnQuIFRoZXNlIGNvbW1lbnRzIGxpbmVzIGFyZSBsb25n
ZXIgdGhhbiA4MAo+ID4+Pj4+PiBhbmQgd3JhcC4KPiA+Pj4+Pgo+ID4+Pj4+IE5vbmUgb2YgdGhl
IGxpbmVzIGluIHRoaXMgY29tbWl0IGFyZSBvdmVyIDgwIGNoYXJhY3RlcnMgaW4gY29sdW1uCj4g
Pj4+Pj4gd2lkdGguIFNvbWUgYXJlIGV4YWN0bHkgODAgY2hhcmFjdGVycyAobGlrZSBhYm92ZSku
Cj4gPj4+Pj4KPiA+Pj4+PiBNeSBndWVzcyBpcyB0aGF0IHlvdSBhcmUgc2VlaW5nIHRoZSBkaWZm
IGFkZGVkIHRleHQgKCsgKSwgd2hpY2ggd2hlbgo+ID4+Pj4+IHlvdSBhZGQgdGhhdCB0byBhIGxp
bmUgd2hpY2ggaXMgZXhhY3RseSA4MCBjaGFyIGluIGxlbmd0aCBlbmRzIHVwCj4gPj4+Pj4gYmVp
bmcgb3ZlciA4MCBjaGFyIGluIGVtYWlsLiBJZiB5b3UgYXBwbHkgdGhlIHBhdGNoIHlvdSB3aWxs
IHNlZSB0aGF0Cj4gPj4+Pj4gdGhleSBhcmUgb25seSA4MCBjaGFycy4KPiA+Pj4+Pgo+ID4+Pj4+
Pgo+ID4+Pj4+PiBUaGVyZSBhcmUgc2V2ZXJhbCBjb21tZW50IGxpbmVzIGluIHRoZSBmaWxlIHRo
YXQgYXJlIHdheSB0b28gbG9uZy4KPiA+Pj4+Pgo+ID4+Pj4+IE5vdGUgdGhhdCBjaGVja3BhdGNo
IGFsc28gZG9lcyBub3QgY29tcGxhaW4gYWJvdXQgYW55IG92ZXIgODAgY2hhcgo+ID4+Pj4+IGxp
bmVzIGluIHRoaXMgZmlsZS4KPiA+Pj4+Pgo+ID4+Pj4+IFNvcnJ5IGlmIEkgYW0gbWlzdW5kZXJz
dGFuZGluZyB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIHRlbGwgbWUuIFBsZWFzZQo+ID4+Pj4+IGNv
bmZpcm0gZWl0aGVyIHdheS4KPiA+Pj4+Pgo+ID4+Pj4KPiA+Pj4+IFdBUk5JTkc6IEF2b2lkIHVu
bmVjZXNzYXJ5IGxpbmUgY29udGludWF0aW9ucwo+ID4+Pj4gIzI1ODogRklMRTogaW5jbHVkZS9r
dW5pdC90ZXN0Lmg6MTM3Ogo+ID4+Pj4gKyAgICAgICAgICAgICAgICAqLyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+Pj4+Cj4g
Pj4+PiB0b3RhbDogMCBlcnJvcnMsIDIgd2FybmluZ3MsIDM4OCBsaW5lcyBjaGVja2VkCj4gPj4+
Cj4gPj4+IEFoLCBva2F5IHNvIHlvdSBkb24ndCBsaWtlIHRoZSB3YXJuaW5nIGFib3V0IHRoZSBs
aW5lIGNvbnRpbnVhdGlvbi4KPiA+Pj4gVGhhdCdzIG5vdCBiZWNhdXNlIGl0IGlzIG92ZXIgODAg
Y2hhciwgYnV0IGJlY2F1c2UgdGhlcmUgaXMgYSBsaW5lCj4gPj4+IGNvbnRpbnVhdGlvbiBhZnRl
ciBhIGNvbW1lbnQuIEkgZG9uJ3QgcmVhbGx5IHNlZSBhIHdheSB0byBnZXQgcmlkIG9mCj4gPj4+
IGl0IHdpdGhvdXQgcmVtb3ZpbmcgdGhlIGNvbW1lbnQgZnJvbSBpbnNpZGUgdGhlIG1hY3JvLgo+
ID4+Pgo+ID4+PiBJIHB1dCB0aGlzIFRPRE8gdGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlIGEgTHVp
cycgcmVxdWVzdCwgYW5kIEkgcHV0IGl0Cj4gPj4+IGluIHRoZSBib2R5IG9mIHRoZSBtYWNybyBi
ZWNhdXNlIHRoaXMgbWFjcm8gYWxyZWFkeSBoYWQgYSBrZXJuZWwtZG9jCj4gPj4+IGNvbW1lbnQg
YW5kIEkgZGlkbid0IHRoaW5rIHRoYXQgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsIFRPRE8gYmVs
b25nZWQKPiA+Pj4gaW4gdGhlIHVzZXIgZG9jdW1lbnRhdGlvbi4KPiA+Pj4KPiA+Pj4+IEdvIGFo
ZWFkIGZpeCB0aGVzZS4gSXQgYXBwZWFycyB0aGVyZSBhcmUgZmV3IGxpbmVzIHRoYXQgZWl0aGVy
IGxvbmdlcgo+ID4+Pj4gdGhhbiA4MC4gSW4gZ2VuZXJhbCwgSSBrZWVwIHRoZW0gYXJvdW5kIDc1
LCBzbyBpdCBpcyBlYXNpZXIgcmVhZC4KPiA+Pj4KPiA+Pj4gU29ycnksIHRoZSBhYm92ZSBpcyB0
aGUgb25seSBjaGVja3BhdGNoIHdhcm5pbmcgb3RoZXIgdGhhbiB0aGUKPiA+Pj4gcmVtaW5kZXIg
dG8gdXBkYXRlIHRoZSBNQUlOVEFJTkVSUyBmaWxlLgo+ID4+Pgo+ID4+PiBBcmUgeW91IHNheWlu
ZyB5b3Ugd2FudCBtZSB0byBnbyB0aHJvdWdoIGFuZCBtYWtlIGFsbCB0aGUgbGluZXMgZml0IGlu
Cj4gPj4+IDc1IGNoYXIgY29sdW1uIHdpZHRoPyBJIGhvcGUgbm90IGJlY2F1c2UgdGhhdCBpcyBn
b2luZyB0byBiZSBhIHByZXR0eQo+ID4+PiBzdWJzdGFudGlhbCBjaGFuZ2UgdG8gbWFrZS4KPiA+
Pj4KPiA+Pgo+ID4+IFRoZXJlIGFyZSB0d28gdGhpbmdzIHdpdGggdGhlc2UgY29tbWVudCBsaW5l
cy4gT25lIGlzIGNoZWNrcGF0Y2gKPiA+PiBjb21wbGFpbmluZyBhbmQgdGhlIG90aGVyIGlzIGdl
bmVyYWwgcmVhZGFiaWxpdHkuCj4gPgo+ID4gU28gZm9yIHRoZSBjaGVja3BhdGNoIHdhcm5pbmcs
IGRvIHlvdSB3YW50IG1lIHRvIG1vdmUgdGhlIGNvbW1lbnQgb3V0Cj4gPiBvZiB0aGUgbWFjcm8g
Ym9keSBpbnRvIHRoZSBrZXJuZWwtZG9jIGNvbW1lbnQ/IEkgZG9uJ3QgcmVhbGx5IHRoaW5rIGl0
Cj4gPiBpcyB0aGUgcmlnaHQgcGxhY2UgZm9yIGEgY29tbWVudCBvZiB0aGlzIG5hdHVyZSwgYnV0
IEkgdGhpbmsgaXQgaXMKPiA+IHByb2JhYmx5IGJldHRlciB0aGFuIGRyb3BwaW5nIGl0IGVudGly
ZWx5IChJIGRvbid0IHNlZSBob3cgZWxzZSB0byBkbwo+ID4gaXQgd2l0aG91dCBqdXN0IHJlbW92
aW5nIHRoZSBjb21tZW50IGVudGlyZWx5KS4KPiA+Cj4KPiBEb24ndCBkcm9wIHRoZSBjb21tZW50
cy4gSXQgbWFrZXMgcGVyZmVjdCBzZW5zZSB0byB0dXJuIHRoaXMgaW50byBhCj4ga2VybmVsLWRv
YyBjb21tZW50LgoKSSBhbSBmaW5lIHdpdGggdGhhdC4gSSB3aWxsIGRvIHRoYXQgaW4gYSBzdWJz
ZXF1ZW50IHJldmlzaW9uIG9uY2Ugd2UKZmlndXJlIG91dCB0aGUgY29sdW1uIGxpbWl0IGlzc3Vl
LgoKPiBXZSBhcmUgZ29pbmcgYmFjayBmb3J0aCBvbiB0aGlzIGEgbG90LiBJIHNlZSBzZXZlcmFs
IGxpbmVzIDgxKyBpbgo+IHRoaXMgZmlsZS4gSSBhbSBhdCA1LjMtcmM1IGFuZCBteSBjb21taXQg
aG9va3MgYXJlbid0IGhhcHB5LiBJIGFtCj4gZmluZSB3aXRoIGl0IGlmIHlvdSB3YW50IHRvIGNv
bnZlcnQgdGhlc2UgdG8ga2VybmVsLWRvYyBjb21tZW50cy4KPiBJIHRoaW5rIGl0IG1ha2VzIHBl
cmZlY3Qgc2Vuc2UuCgpPa2F5LCBzbyB0aGlzIGlzIGludGVyZXN0aW5nLiBXaGVuIEkgbG9vayBh
dCB0aGUgYXBwbGllZCBwYXRjaGVzIGluIG15CmxvY2FsIHJlcG8sIEkgZG9uJ3Qgc2VlIGFueSA4
MSsgbGluZXMuIFNvIGl0IHNlZW1zIHRoYXQgc29tZXRoaW5nCmludGVyZXN0aW5nIGlzIGdvaW5n
IG9uIGhlcmUuCgpUbyBiZSBjbGVhciAoc29ycnkgZm9yIHRoZSBzdHVwaWQgcXVlc3Rpb24pIHlv
dSBhcmUgc2VlaW5nIHRoZSBpc3N1ZQphZnRlciB5b3UgYXBwbGllZCB0aGUgcGF0Y2gsIGFuZCBu
b3QgaW4gdGhlIHBhdGNoIGZpbGUgaXRzZWxmPwoKU2luY2Ugd2UgYXJlIHN0aWxsIGF0IE9TUywg
d291bGQgeW91IG1pbmQgaWYgd2UgbWVldCB1cCB0aGlzIGFmdGVybm9vbgpzbyBJIGNhbiBzZWUg
dGhpcyBpc3N1ZSB5b3UgYXJlIHNlZWluZz8gSSBpbWFnaW5lIHdlIHNob3VsZCBnZXQgdGhpcwpm
aWd1cmVkIG91dCBwcmV0dHkgcXVpY2tseS4KCkNoZWVycwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
