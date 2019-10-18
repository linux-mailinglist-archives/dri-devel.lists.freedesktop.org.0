Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19384DCE03
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23576EB87;
	Fri, 18 Oct 2019 18:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3C16EB87
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:33:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o15so6836161wru.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 11:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YTy5f2+zY9spxEP1tzucC058EkWg/q4aswm6QPb2oF8=;
 b=qAZemMk0gmzfVkt0p5behzSunfJ1F12f7yOfiOpkJNrxH+62wxXV1jOWZ19ctT806f
 OSKbwcDqcUUYq3u4U1YckGdtRNh2POvoVj/QKZgrKgyWyZWFskN1KTgeJOxbbUC5WZre
 mCpe7U+A/wU3zzqbsXZNAI2TUn+ZThC1CUd8etFHAvikxBDcS1ctoNONhX2nC+YUDV4m
 vaOo7uxIRx2WYt0BhcQ9WwRlo9qV+1hoX4ZKbQQRrao8yNVJXdPYYIvcxfPqT/KYo1G1
 afbMKD8MrH7cbT/ev1dYl29NKIEIqS5SO7GAbdz0Bt/4LpoQI4qZYTEDHNw1ZHJ0hibI
 MAJg==
X-Gm-Message-State: APjAAAV0jIlMRBpnpIt19LhSFp+s7T+QlS47vUhZALtXHVRdnAa+3G8a
 ePmdecTj2Mkc9Qm3RS4HtTO69Md+nOha7WFeAjQVeA==
X-Google-Smtp-Source: APXvYqwgIWYJJDAiGtxfixr8mMv75c1FwoNJKCZXJXp4Ve9GiF2P8nizw0jQz33xCf4hgFZlBAN+LuklCLockt8bYo4=
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr9356659wrr.50.1571423604842; 
 Fri, 18 Oct 2019 11:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
 <20190924162217.GA12974@arm.com> <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
 <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
 <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
 <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
 <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
 <CALAqxLWrsXG0XysL7RmhApbuZukDdG5VhdHOTS5odkG9f1ezwA@mail.gmail.com>
 <20191018095516.inwes5avdeixl5nr@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191018095516.inwes5avdeixl5nr@DESKTOP-E1NTVVP.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 18 Oct 2019 11:33:13 -0700
Message-ID: <CALAqxLWpjgoj5Zni=FCnTWwR6JyCAjY=W6gQvjCG8aLQvGavXQ@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
To: Brian Starkey <Brian.Starkey@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YTy5f2+zY9spxEP1tzucC058EkWg/q4aswm6QPb2oF8=;
 b=WVDJqeiQYZtH8hMM+aXz0b4B3qmg0/C8GHS3Y81PPaEmhwXFfwl8SfTtRMuZjNubb3
 m6cCeKKkHeqwn71IIO50qf6q1obwl93SEh+GpPs2FwyRrwjFwcG0SPatLwlF4sG0kj1p
 p/P3HfZljB3iekyAnxJMgLM1qQn+o/fugsMezmvSABMaXwIvODfjs4CcbV1xZSPMxozD
 kf6sap/+C7IRy8scXVPNTohcP7Q5TzcpK7vB58dH+0UYVfnUgVHJzwRKty3rAWSGli30
 xLz5Cy3sY/fOI9EzzW0AYr/VZHjGWGtvVC+3dBORbo5/s9U9RGnSFEXXk4kI8XdMnxlb
 UTXw==
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
Cc: Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 lkml <linux-kernel@vger.kernel.org>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Ayan Halder <Ayan.Halder@arm.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, nd <nd@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMjo1NSBBTSBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFy
a2V5QGFybS5jb20+IHdyb3RlOgo+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDAxOjU3OjQ1UE0g
LTA3MDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6
MjkgUE0gQW5kcmV3IEYuIERhdmlzIDxhZmRAdGkuY29tPiB3cm90ZToKPiA+ID4gT24gMTAvMTcv
MTkgMzoxNCBQTSwgSm9obiBTdHVsdHogd3JvdGU6Cj4gPiA+ID4gQnV0IGlmIHRoZSBvYmplY3Rp
b24gc3RhbmRzLCBkbyB5b3UgaGF2ZSBhIHByb3Bvc2FsIGZvciBhbiBhbHRlcm5hdGl2ZQo+ID4g
PiA+IHdheSB0byBlbnVtZXJhdGUgYSBzdWJzZXQgb2YgQ01BIGhlYXBzPwo+ID4gPiA+Cj4gPiA+
IFdoZW4gaW4gc3RhZ2luZyBJT04gaGFkIHRvIHJlYWNoIGludG8gdGhlIENNQSBmcmFtZXdvcmsg
YXMgdGhlIG90aGVyCj4gPiA+IGRpcmVjdGlvbiB3b3VsZCBub3QgYmUgYWxsb3dlZCwgc28gY21h
X2Zvcl9lYWNoX2FyZWEoKSB3YXMgYWRkZWQuIElmCj4gPiA+IERNQS1CVUYgaGVhcHMgaXMgbm90
IGluIHN0YWdpbmcgdGhlbiB3ZSBjYW4gZG8gdGhlIG9wcG9zaXRlLCBhbmQgaGF2ZQo+ID4gPiB0
aGUgQ01BIGZyYW1ld29yayByZWdpc3RlciBoZWFwcyBpdHNlbGYgdXNpbmcgb3VyIGZyYW1ld29y
ay4gVGhhdCB3YXkKPiA+ID4gdGhlIENNQSBzeXN0ZW0gY291bGQgZGVjaWRlIHdoYXQgYXJlYXMg
dG8gZXhwb3J0IG9yIG5vdCAobWF5YmUgYmFzZWQgb24KPiA+ID4gYSBEVCBwcm9wZXJ0eSBvciBz
aW1pbGFyKS4KPiA+Cj4gPiBPay4gVGhvdWdoIHRoZSBDTUEgY29yZSBkb2Vzbid0IGhhdmUgbXVj
aCBzZW5zZSBvZiBEVCBkZXRhaWxzIGVpdGhlciwKPiA+IHNvIGl0IHdvdWxkIHByb2JhYmx5IGhh
dmUgdG8gYmUgZG9uZSBpbiB0aGUgcmVzZXJ2ZWRfbWVtIGxvZ2ljLCB3aGljaAo+ID4gZG9lc24n
dCBmZWVsIHJpZ2h0IHRvIG1lLgo+ID4KPiA+IEknZCBwcm9iYWJseSBndWVzcyB3ZSBzaG91bGQg
aGF2ZSBzb21lIHNvcnQgb2YgZHQgYmluZGluZyB0byBkZXNjcmliZQo+ID4gYSBkbWFidWYgY21h
IGhlYXAgYW5kIGZyb20gdGhhdCBub2RlIGxpbmsgdG8gYSBDTUEgbm9kZSB2aWEgYQo+ID4gbWVt
b3J5LXJlZ2lvbiBwaGFuZGxlLiBBbG9uZyB3aXRoIG1heWJlIHRoZSBkZWZhdWx0IGhlYXAgYXMg
d2VsbD8gTm90Cj4gPiBlYWdlciB0byBnZXQgaW50byBhbm90aGVyIGJpbmRpbmcgcmV2aWV3IGN5
Y2xlLCBhbmQgSSdtIG5vdCBzdXJlIHdoYXQKPiA+IG5vbi1EVCBzeXN0ZW1zIHdpbGwgZG8geWV0
LCBidXQgSSdsbCB0YWtlIGEgc2hvdCBhdCBpdCBhbmQgaXRlcmF0ZS4KPiA+Cj4gPiA+IFRoZSBl
bmQgcmVzdWx0IGlzIHRoZSBzYW1lIHNvIHdlIGNhbiBtYWtlIHRoaXMgY2hhbmdlIGxhdGVyIChp
dCBoYXMgdG8KPiA+ID4gY29tZSBhZnRlciBETUEtQlVGIGhlYXBzIGlzIGluIGFueXdheSkuCj4g
Pgo+ID4gV2VsbCwgSSdtIGhlc2l0YW50IHRvIG1lcmdlIGNvZGUgdGhhdCBleHBvc2VzIGFsbCB0
aGUgQ01BIGhlYXBzIGFuZAo+ID4gdGhlbiBhZGQgcGF0Y2hlcyB0aGF0IGJlY29tZXMgbW9yZSBz
ZWxlY3RpdmUsIHNob3VsZCBhbnlvbmUgZGVwZW5kIG9uCj4gPiB0aGUgaW5pdGlhbCBiZWhhdmlv
ci4gOi8KPgo+IEhvdyBhYm91dCBvbmx5IGF1dG8tYWRkaW5nIHRoZSBzeXN0ZW0gZGVmYXVsdCBD
TUEgcmVnaW9uIChjbWEtPm5hbWUgPT0KPiAicmVzZXJ2ZWQiKT8KCkdyZWF0IG1pbmRzLi4uIDop
Cgo+IEFuZC9vciB0aGUgQ01BIGF1dG8tYWRkIGNvdWxkIGJlIGJlaGluZCBhIGNvbmZpZyBvcHRp
b24/IEl0IHNlZW1zIGEKPiBzaGFtZSB0byBmdXJ0aGVyIGRlbGF5IHRoaXMsIGFuZCB0aGUgQ01B
IGhlYXAgaXRzZWxmIHJlYWxseSBpcyB1c2VmdWwuCgp0aGFua3MKLWpvaG4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
