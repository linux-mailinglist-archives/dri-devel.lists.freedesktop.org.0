Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D218B1CB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D6189D43;
	Tue, 13 Aug 2019 07:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5769E89D43
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:57:45 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id r26so14886113pgl.10
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 00:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qxe9OCB0IqyHnARJf+JfT+i9JEoP4MCbV860ULsGU5s=;
 b=H8qDH8fxiHQgPuU9gC+hMnQYkMbYumfrSFBlOnUHMaf9wdkIL//h+MADokpfaxYvlC
 4g69Axl4bsZ0lybDcXrCXQdipdBq4Vm1iIRp2JvdgDFKZ13UQkDbYhNUXk56BhlNz8Ib
 8VqwDQnMQNYQIyciWCjI58jPVjUI0D1yc/n8kwtcItviP5bxB3IvKsgnlWHb++WJWn2t
 7xI+KTpxmDZKELQa54uB+HbFxoR1YrJ/R5iu+iqytCggZL6Py1EK0z5M/aovu23COD+V
 ArSE21/r4MNN5PNQbeORb7qj3rtdyjmDqD+ttZdud5oI23uKyslreUrphTieNgeC1FXU
 O/Tg==
X-Gm-Message-State: APjAAAXKLa35Z3cJQynGxQMM9ILPKIkSw0fN12zFtwcPoZ2QEBB96IN8
 9ojh88luwtsfMh7K/QZkzGDrJZNAskbTE1Kadd85KA==
X-Google-Smtp-Source: APXvYqzWk2rxD82fR19g3JsVNBllToOJJzR2xQFo11AJZitYxxxUqNbN9+PHkwurw7oZzFeN69t+CYdvTXIlmBWBICY=
X-Received: by 2002:a63:205f:: with SMTP id r31mr31222917pgm.159.1565683064346; 
 Tue, 13 Aug 2019 00:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-13-brendanhiggins@google.com>
 <20190813043140.67FF320644@mail.kernel.org>
In-Reply-To: <20190813043140.67FF320644@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 13 Aug 2019 00:57:33 -0700
Message-ID: <CAFd5g44Es4emKyQSxUkqckGJ02_o3sAcDLwUCW8ZFGX14j5=xg@mail.gmail.com>
Subject: Re: [PATCH v12 12/18] kunit: test: add tests for KUnit managed
 resources
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Qxe9OCB0IqyHnARJf+JfT+i9JEoP4MCbV860ULsGU5s=;
 b=fWxvwQ8Jg+CWf05NnJCeSWeVicnOoXy6BXG5VhOfTHwJWFVTHFtRdcNqJwjLSDCsVu
 jiiP3AZW2TJ9Y27gYXlQWYVFyW9cOeHAtkBDWUX3YWHKBu/HS+LKFfPpeMSX6W2l72tZ
 BRhzYAO288V5DleisjNQBfRbcy/Mz40/cEOLiUMhsZ95Bxp04BvhX0q6796bywFqCBqp
 NSnYasYkCLB4Txnd4bsLfaw/UOxBpmRM2L4ZKLjuNJtySeAykDmMbqKDwEkFdZmfV7CY
 oOe6Xd9hvm7QvXiKG5lkjN3mPEgj0ajH3yxwTU51S77P9cnCG7u1CaWqpN7xPuHVgKBk
 pF4g==
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
 Timothy" <Tim.Bird@sony.com>, Avinash Kondareddy <akndr41@gmail.com>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Josh Poimboeuf <jpoimboe@redhat.com>,
 kunit-dev@googlegroups.com, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgOTozMSBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6
MjQ6MTUpCj4gPiArCj4gPiArc3RhdGljIGludCBrdW5pdF9yZXNvdXJjZV90ZXN0X2luaXQoc3Ry
dWN0IGt1bml0ICp0ZXN0KQo+ID4gK3sKPiA+ICsgICAgICAgc3RydWN0IGt1bml0X3Rlc3RfcmVz
b3VyY2VfY29udGV4dCAqY3R4ID0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGt6YWxsb2Mo
c2l6ZW9mKCpjdHgpLCBHRlBfS0VSTkVMKTsKPiA+ICsKPiA+ICsgICAgICAgaWYgKCFjdHgpCj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4KPiBTaG91bGQgdGhpcyB1c2UgdGhl
IHRlc3QgYXNzZXJ0aW9uIGxvZ2ljIHRvIG1ha2Ugc3VyZSB0aGF0IGl0J3Mgbm90Cj4gZmFpbGlu
ZyBhbGxvY2F0aW9ucyBkdXJpbmcgaW5pdD8KClllcC4gV2lsbCBmaXguCgo+IEJUVywgbWF5YmUg
a3VuaXQgYWxsb2NhdGlvbiBBUElzIHNob3VsZAo+IGZhaWwgdGhlIHRlc3QgaWYgdGhleSBmYWls
IHRvIGFsbG9jYXRlIGluIGdlbmVyYWwuIFVubGVzcyB3ZSdyZSB1bml0Cj4gdGVzdGluZyBmYWls
dXJlIHRvIGFsbG9jYXRlIHByb2JsZW1zLgoKWWVhaCwgSSB0aG91Z2h0IGFib3V0IHRoYXQuIEkg
d2Fzbid0IHN1cmUgaG93IHBlb3BsZSB3b3VsZCBmZWVsIGFib3V0Cml0LCBhbmQgSSB0aG91Z2h0
IGl0IHdvdWxkIGJlIGEgcGFpbiB0byB0ZWFzZSBvdXQgYWxsIHRoZSBpc3N1ZXMKYXJpc2luZyBm
cm9tIGFib3J0aW5nIGluIGRpZmZlcmVudCBjb250ZXh0cyB3aGVuIHNvbWVvbmUgbWlnaHQgbm90
CmV4cGVjdCBpdC4KCkkgYW0gdGhpbmtpbmcgbGF0ZXIgd2UgY2FuIGhhdmUga3VuaXRfa21hbGxv
Y19vcl9hYm9ydCB2YXJpYW50cz8gQW5kCnRoZW4gd2UgY2FuIHB1bnQgdGhpcyBpc3N1ZSB0byBh
IGxhdGVyIHRpbWU/Cgo+ID4gKwo+ID4gKyAgICAgICB0ZXN0LT5wcml2ID0gY3R4Owo+ID4gKwo+
ID4gKyAgICAgICBrdW5pdF9pbml0X3Rlc3QoJmN0eC0+dGVzdCwgInRlc3RfdGVzdF9jb250ZXh0
Iik7Cj4gPiArCj4gPiArICAgICAgIHJldHVybiAwOwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
