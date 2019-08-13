Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5158B178
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DF56E084;
	Tue, 13 Aug 2019 07:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BDF6E084
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:53:41 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id e11so264677pga.5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 00:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1w6tEv+UsY5F/hdJoPjOc+8EZA8fHnLVH5Ee68+K+14=;
 b=qBd4o55Emu+kQOC/Xzm53IeOF0LadaEweYuvYXCNKvb7PmpIJGmTOiCQKbb/fE9Ndk
 7FpssDp24D83fb/dbKZNMrnApZ8KuNI7XZ/cWgEkh2OXS64oebygPIloGals/JWOVh9i
 iYpWmedR+QmJtvE7c4znfGmIKJ6ub2YO2zFGq4iAgoEjQincii+TJCZPvvleYfGtVxTa
 xOzL0+QqmbzI26GHFmT7yyyIBu0u9vjWCP7MKhDekQOW/2flnA0yBtqnUZzc0SstmA/d
 B8xoQ6Wet7LX+Wbic2lBTxY6RebB42HFmRvMdLnqaLiCOBjMlYyjgJnTaPieRQ9y5ViV
 CwgA==
X-Gm-Message-State: APjAAAU6Zkp/EoaD0jBmfJVrjkv6qudkfTkQEM3qz7jQIOiJPDf3FHxl
 XUvFhVOGb69qko+uDcL5VbBAC0YYGzT5HVqDfX2xxQ==
X-Google-Smtp-Source: APXvYqwRt249N6Nnc3lDOtyH2RE286o2POCGTN4Y9Dd+KQhTUzxvnzvxmCpITQmOohY+Myh1tvYfqlbmJVebyc0CKlY=
X-Received: by 2002:a63:b919:: with SMTP id z25mr33087981pge.201.1565682820534; 
 Tue, 13 Aug 2019 00:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-11-brendanhiggins@google.com>
 <20190813042455.4A04320644@mail.kernel.org>
 <CAFd5g46LHq1sQaio2Vj5jt54YN-Y2HuCT8FbALQhJoekkYJ-uQ@mail.gmail.com>
 <20190813055707.8B2BB206C2@mail.kernel.org>
In-Reply-To: <20190813055707.8B2BB206C2@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 13 Aug 2019 00:53:28 -0700
Message-ID: <CAFd5g45rLTB965BX24DKFauumbdbn=m4kxtzgwr_4uj66Vmzmw@mail.gmail.com>
Subject: Re: [PATCH v12 10/18] kunit: test: add tests for kunit test abort
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1w6tEv+UsY5F/hdJoPjOc+8EZA8fHnLVH5Ee68+K+14=;
 b=nVz7SRzwhp+sIStWQOhdw7+eMounsWwWY4b9W+H2splMtvxXWG/v8uX0oyrPhi9Pc/
 DbYNbNpkCoegNiTUpPMiXg34BXPrPJrAjoIA7DyPnMkZHZfSastxpDXvu6zpEH76cIXz
 2ipKiw0wJIDxWMLZyrA5y40OVaB5InZkV31euGDTlfUD9NGVPd2AdaFiZI2HUpl+1Z71
 eZE6OVlRYXpa7v0Ieb0+s2HPAU8hcA299XGRboiSsBb0Wz4QiBbaFXHTBKHp4dwxoDYm
 Lyn/gNUB2QMFaYgVWF7lBw/U70QsznbaxSpwZOVQK35ds3v4ks7lmHH71KHdUCsOoz7q
 RS4A==
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
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTA6NTcgUE0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA4LTEyIDIy
OjA2OjA0KQo+ID4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgOToyNCBQTSBTdGVwaGVuIEJveWQg
PHNib3lkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBRdW90aW5nIEJyZW5kYW4gSGln
Z2lucyAoMjAxOS0wOC0xMiAxMToyNDoxMykKPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBpbnQg
a3VuaXRfdHJ5X2NhdGNoX3Rlc3RfaW5pdChzdHJ1Y3Qga3VuaXQgKnRlc3QpCj4gPiA+ID4gK3sK
PiA+ID4gPiArICAgICAgIHN0cnVjdCBrdW5pdF90cnlfY2F0Y2hfdGVzdF9jb250ZXh0ICpjdHg7
Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgY3R4ID0ga3VuaXRfa3phbGxvYyh0ZXN0LCBzaXpl
b2YoKmN0eCksIEdGUF9LRVJORUwpOwo+ID4gPgo+ID4gPiBDYW4gdGhpcyBmYWlsPyBTaG91bGQg
cmV0dXJuIC1FTk9NRU0gaW4gdGhhdCBjYXNlPwo+ID4KPiA+IFllcywgSSBzaG91bGQgZG8gdGhh
dC4KPgo+IExvb2tzIGxpa2UgaXQncyBhc3NlcnRlZCB0byBub3QgYmUgYW4gZXJyb3IuIElmIGl0
J3MgcHVzaGVkIGludG8gdGhlIEFQSQo+IHRoZW4gdGhlcmUncyBub3RoaW5nIHRvIGRvIGhlcmUs
IGFuZCB5b3UgY2FuIGhhdmUgbXkgcmV2aWV3ZWQtYnkgb24gdGhpcwo+IHBhdGNoLgo+Cj4gUmV2
aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KCkNvb2wsIHRoYW5rcyEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
