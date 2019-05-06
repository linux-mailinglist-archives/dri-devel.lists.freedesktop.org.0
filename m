Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA715E18
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC88989DDD;
	Tue,  7 May 2019 07:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5320989B06
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 17:44:08 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id x78so8668433vsc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 10:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OeGgjZBJ9uWD1pdsX/+zOfgOjAibZGBp9WPaU0eToUc=;
 b=hrZXQFn27XBOxm1R0c9KJAsLGekwcckIuhembPjLyohLjjugV2v6YaUPIrvfdgNXIF
 gVh1jreVT7LZWRBVn7Dd888wEa0ycULuYLZOW3PXi71zOJJfSJJO/E1wYozXbke0WQ7A
 HmCMQV0pZ3OA3DeDX0aLA7RC+OtC8e++T7zjexL8fhzFS4rEB+zbmIuswd4vmtN3Ky+v
 NuLx4oyrx+CNm6WPPFTL8IKcSv+cClkhiGjpgq8CmnSUqiYeD0GV550dUiPRUC//swpr
 3mctpOoqml6K+Gb0z8DMkiiJwi7oPssZHQH2hnEDNDPK44BpDDY1DtmcvvAU1EwvU8Zb
 OlGw==
X-Gm-Message-State: APjAAAX6RdQM3RIBT7ApxQm7yps+0D0rWv7sdADevgNmgZaF79D1MNXf
 zp0U4n/yfrAv2ie4PCDJSHNc/0YfgBLqGKm2S6baPQ==
X-Google-Smtp-Source: APXvYqxj9ho/3KigVFISlPQqfamyJ4vl1xCgP8i9j8q0ibA/ApDLHmmjNXKUf72ouvJJD/44drdXvLamKur++kGc2Rs=
X-Received: by 2002:a67:dd95:: with SMTP id i21mr8883021vsk.48.1557164647231; 
 Mon, 06 May 2019 10:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com>
 <20190502110220.GD12416@kroah.com>
 <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
 <a49c5088-a821-210c-66de-f422536f5b01@gmail.com>
 <CAFd5g44iWRchQKdJYtjRtPY6e-6e0eXpKXXsx5Ooi6sWE474KA@mail.gmail.com>
 <1a5f3c44-9fa9-d423-66bf-45255a90c468@gmail.com>
 <CAFd5g45RYm+zfdJXnyp2KZZH5ojfOzy++aq+4zBeE5VDu6WgEw@mail.gmail.com>
 <052fa196-4ea9-8384-79b7-fe6bacc0ee82@gmail.com>
 <CAFd5g47aY-CL+d7DfiyTidY4aAVY+eg1TM1UJ4nYqKSfHOi-0w@mail.gmail.com>
 <63f63c7c-6185-5e64-b338-6a5e7fb9e27c@gmail.com>
In-Reply-To: <63f63c7c-6185-5e64-b338-6a5e7fb9e27c@gmail.com>
From: Kees Cook <keescook@google.com>
Date: Mon, 6 May 2019 10:43:55 -0700
Message-ID: <CAGXu5jJpp2HyEWMtAde+VUt=9ni3HRu69NM4rUQJu4kBrnx9Kw@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
To: Frank Rowand <frowand.list@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>, Shuah Khan <shuah@kernel.org>
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OeGgjZBJ9uWD1pdsX/+zOfgOjAibZGBp9WPaU0eToUc=;
 b=m4Zw2fBY+VMLzhBfTBbz4Dtlq0Cc6l6MqEwoJ7YTjrYPzeO8QeIYW3yIFLyCL117Kt
 axxocOSPh/a+gWkz5TWdPKqb2BPRt/jtybJOfLKxxemlLxpId3LZKDrEsHYJlkXqRfwz
 fCTrKPtDSaBjY4auU4otyGauXVMtlpMTLmviNmwp8xF+tgZuQMZPsaKxN5HR6oBL5vv2
 Zb040i1FzkyXpGkN4I4IP7WFVE6iEZwE10S2R1vSIzVYWL40r/PqrLJElx8kQUpZMdyS
 9343jPbZPHbXIDd2SJlyBmLnUf59HZ8PtlBE/IOAyuF/EUfnmI/1F3+fvCafLr94a9B9
 gs7Q==
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
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgNSwgMjAxOSBhdCA1OjE5IFBNIEZyYW5rIFJvd2FuZCA8ZnJvd2FuZC5saXN0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gWW91IGNhbiBzZWUgdGhlIGZ1bGwgdmVyc2lvbiAxNCBkb2N1
bWVudCBpbiB0aGUgc3VibWl0dGVyJ3MgcmVwbzoKPgo+ICAgJCBnaXQgY2xvbmUgaHR0cHM6Ly9n
aXRodWIuY29tL2lzYWFjcy90ZXN0YW55dGhpbmcuZ2l0aHViLmlvLmdpdAo+ICAgJCBjZCB0ZXN0
YW55dGhpbmcuZ2l0aHViLmlvCj4gICAkIGdpdCBjaGVja291dCB0YXAxNAo+ICAgJCBscyB0YXAt
dmVyc2lvbi0xNC1zcGVjaWZpY2F0aW9uLm1kCj4KPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoZSB0
aGUgdmVyc2lvbiAxNCBzcGVjaWZpY2F0aW9uIGlzIG5vdCB0cnlpbmcgdG8KPiBhZGQgbmV3IGZl
YXR1cmVzLCBidXQgaW5zdGVhZCBjYXB0dXJlIHdoYXQgaXMgYWxyZWFkeSBpbXBsZW1lbnRlZCBp
bgo+IHRoZSB3aWxkLgoKT2ghIEkgZGlkbid0IGtub3cgYWJvdXQgdGhlIHdvcmsgb24gVEFQIDE0
LiBJJ2xsIGdvIHJlYWQgdGhyb3VnaCB0aGlzLgoKPiA+ICMjIEhlcmUgaXMgd2hhdCBJIHByb3Bv
c2UgZm9yIHRoaXMgcGF0Y2hzZXQ6Cj4gPgo+ID4gIC0gUHJpbnQgb3V0IHRlc3QgbnVtYmVyIHJh
bmdlIGF0IHRoZSBiZWdpbm5pbmcgb2YgZWFjaCB0ZXN0IHN1aXRlLgo+ID4gIC0gUHJpbnQgb3V0
IGxvZyBsaW5lcyBhcyBzb29uIGFzIHRoZXkgaGFwcGVuIGFzIGRpYWdub3N0aWNzLgo+ID4gIC0g
UHJpbnQgb3V0IHRoZSBsaW5lcyB0aGF0IHN0YXRlIHdoZXRoZXIgYSB0ZXN0IHBhc3NlcyBvciBm
YWlscyBhcyBhCj4gPiBvay9ub3Qgb2sgbGluZS4KPiA+Cj4gPiBUaGlzIHdvdWxkIGJlIHRlY2hu
aWNhbGx5IGNvbmZvcm1pbmcgd2l0aCBUQVAxMyBhbmQgaXMgY29uc2lzdGVudCB3aXRoCj4gPiB3
aGF0IHNvbWUga3NlbGZ0ZXN0cyBoYXZlIGRvbmUuCgpUaGlzIGlzIHdoYXQgSSBmaXhlZCBrc2Vs
ZnRlc3QgdG8gYWN0dWFsbHkgZG8gKGl0IHdhc24ndCBkb2luZyBjb3JyZWN0ClRBUDEzKSwgYW5k
IFNodWFoIGlzIHRlc3RpbmcgdGhlIHNlcmllcyBub3c6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3NodWFoL2xpbnV4LWtzZWxmdGVzdC5naXQvbG9nLz9o
PWtzZnQtdGFwLXJlZmFjdG9yCgpJJ2xsIGdvIHJlYWQgVEFQIDE0IG5vdy4uLgoKLS0gCktlZXMg
Q29vawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
