Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E8FF1C05
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057BB6E9C7;
	Wed,  6 Nov 2019 17:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F70A6EDF6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 17:03:23 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id m15so12682410otq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 09:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13XiEQK8Wfi1t0rOXtClrpgGr0M1MsxM4DjcUQln3M4=;
 b=tTxfLwaz4RgZeDf3bohGkmWL/I1SM9ozstQl1ewp97aC0S/QQeHNbcWfAaJpINoNfB
 /0fW0QfFiOduHSaZG3zGgMEZDXA0bJXh+Xi7WufKBXhBpdXTD0CysOba1NWDZXZAgsMy
 QpE7Y9KXUVNfMVu+BxthaugiCHosX0JxdTYOJp75MX5aujxu8dH3yR5NGYGersDt/5q/
 zaCGaFqBiZvI2XlzcgOySbxphHIzkC9B7KTs2GsiPF4eTx1z4pXUfl5XtR5ZkRsB4YkO
 goFgbv3GLZ77XpSlluvaZgipESd3Ve2MgXaT80CRF8QUjtxyZB6Szyzr3QQ34/6zvVG+
 PRZg==
X-Gm-Message-State: APjAAAXeCey1uC6qkKetldjRVxmT35W64zd9XjzyPqnkawNe71M6d25g
 IJ/YBbkC+9iPyg2dOxdJXvgfea0NSANiUSuYxBWuRA==
X-Google-Smtp-Source: APXvYqxA21M83YXgjSCtZkjN7heKaT/7/0PT0b0l2nJ5K0JzCI1YBIavSwGU0cxJ2gksIniKC8dgfk8zYAAoPRimlnQ=
X-Received: by 2002:a9d:5a0b:: with SMTP id v11mr2687592oth.102.1573059801948; 
 Wed, 06 Nov 2019 09:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20191106042252.72452-1-john.stultz@linaro.org>
 <20191106042252.72452-2-john.stultz@linaro.org>
 <7154851c-fc55-e157-5a01-21abdd4a23e6@ti.com>
In-Reply-To: <7154851c-fc55-e157-5a01-21abdd4a23e6@ti.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 6 Nov 2019 09:03:10 -0800
Message-ID: <CALAqxLW1vgLCik5WfDN7qkRsO=K9U4otNBp72aOH5UNN1jUgMQ@mail.gmail.com>
Subject: Re: [PATCH v15 1/5] dma-buf: Add dma-buf heaps framework
To: "Andrew F. Davis" <afd@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=13XiEQK8Wfi1t0rOXtClrpgGr0M1MsxM4DjcUQln3M4=;
 b=Fg82y5+/m4XYC7+TXTEObVZp0oO/gdUR8ls6Gztw9ARyKO/M421qhy1RRD2jEGLEUw
 VKgI0VbcQ/Ao4avg6W+OSkcj5EtmXbztGbk75Dij721u4or6l8vc09DGum7kiIiKOfpC
 UAQxiKf8lrx49pgXN7OlNB4Bnew3F4rvfOvjOzLetyXYj4ZmBnVREiBqnbD+cid5C8TO
 1LvJzNXsM9/e2Ugvl4kkhlrp47+KgX1opNdqHpBu77Q9tnYbq443XxLelWgsTiNb+4dx
 vJVtmPmBBFVJJzKQO7Nq9OUTswoiu0YrIVYj1iivcboY6E5qag9Z+ZlyqEsUg9db/vpt
 4UWA==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Sandeep Patil <sspatil@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCA1OjUyIEFNIEFuZHJldyBGLiBEYXZpcyA8YWZkQHRpLmNv
bT4gd3JvdGU6Cj4KPiBPbiAxMS81LzE5IDExOjIyIFBNLCBKb2huIFN0dWx0eiB3cm90ZToKPiA+
ICt1bnNpZ25lZCBpbnQgZG1hX2hlYXBfaW9jdGxfY21kc1tdID0gewo+ID4gKyAgICAgRE1BX0hF
QVBfSU9DX0FMTE9DLAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIGxvbmcgZG1hX2hlYXBfaW9j
dGwoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCB1Y21kLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4gK3sKPiA+ICsgICAgIGNoYXIgc3Rh
Y2tfa2RhdGFbMTI4XTsKPiA+ICsgICAgIGNoYXIgKmtkYXRhID0gc3RhY2tfa2RhdGE7Cj4gPiAr
ICAgICB1bnNpZ25lZCBpbnQga2NtZDsKPiA+ICsgICAgIHVuc2lnbmVkIGludCBpbl9zaXplLCBv
dXRfc2l6ZSwgZHJ2X3NpemUsIGtzaXplOwo+ID4gKyAgICAgaW50IG5yID0gX0lPQ19OUih1Y21k
KTsKPiA+ICsgICAgIGludCByZXQgPSAwOwo+ID4gKwo+ID4gKyAgICAgaWYgKG5yID49IEFSUkFZ
X1NJWkUoZG1hX2hlYXBfaW9jdGxfY21kcykpCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+ID4gKwo+ID4gKyAgICAgLyogR2V0IHRoZSBrZXJuZWwgaW9jdGwgY21kIHRoYXQgbWF0
Y2hlcyAqLwo+ID4gKyAgICAga2NtZCA9IGRtYV9oZWFwX2lvY3RsX2NtZHNbbnJdOwo+Cj4KPiBX
aHkgZG8gd2UgbmVlZCB0aGlzIGluZGlyZWN0aW9uIGhlcmUgYW5kIGFsbCB0aGUgY29tcGxleGl0
eSBiZWxvdz8gSQo+IGtub3cgRFJNIGlvY3RsIGRvZXMgc29tZXRoaW5nIGxpa2UgdGhpcyBidXQg
aXQgaGFzIGEgbWFzc2l2ZSB0YWJsZSwKPiBsZWdhY3kgaW9jdGxzLCBkcml2ZXIgZGVmaW5lZCBp
b2N0bHMsIGV0Yy4uCj4KPiBJIGRvbid0IGV4cGVjdCB3ZSB3aWxsIGV2ZXIgbmVlZCBjb21wbGV4
IGhhbmRsaW5nIGxpa2UgdGhpcywgY291bGQgd2UKPiBzd2l0Y2ggYmFjayB0byB0aGUgbW9yZSBz
aW1wbGUgaGFuZGxlciBmcm9tIHYxMz8KCkkgYWdyZWUgaXQgZG9lcyBhZGQgY29tcGxleGl0eSwg
YnV0IEknbSBub3Qgc3VyZSBJIHNlZSBob3cgdG8gYXZvaWQKc29tZSBvZiB0aGlzLiBUaGUgbG9n
aWMgdHJ5aW5nIHRvIGhhbmRsZSB0aGF0IHRoZSB1c2VyIG1heSBwYXNzIGEgY21kCnRoYXQgaGFz
IHRoZSBzYW1lIF9JT0NfTlIoKSBhcyBETUFfSEVBUF9JT0NfQUxMT0MgYnV0IG5vdCB0aGUgc2Ft
ZQpzaXplLiBTbyB0aGUgc2ltcGxlICJzd2l0Y2goY21kKSB7IGNhc2UgRE1BX0hFQVBfSU9DX0FM
TE9DOiIgd2UgaGFkCmJlZm9yZSB3b24ndCB3b3JrIChhcyB0aGUgY21kIHdpbGwgYmUgYSBkaWZm
ZXJlbnQgdmFsdWUpLgoKVGh1cyB3aHkgSSB0aG91Z2h0IHRoZSBjbGVhbmVzdCBhcHByb2FjaCB3
b3VsZCBiZSB0byB1c2UgdGhlCmRtYV9oZWFwX2lvY3RsX2NtZHMgYXJyYXkgdG8gY29udmVydCBm
cm9tIHdoYXRldmVyIHRoZSB1c2VyIGNtZCBpcyB0bwp0aGUgbWF0Y2hpbmcga2VybmVsIGNtZCB2
YWx1ZS4KCkRvIHlvdSBoYXZlIGFuIGFsdGVybmF0aXZlIHN1Z2dlc3Rpb24gdGhhdCBJJ20gb3Zl
cmxvb2tpbmc/Cgp0aGFua3MKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
