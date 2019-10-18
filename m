Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D98DCEFC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 21:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCDC6EBC6;
	Fri, 18 Oct 2019 19:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ADD6EBC6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 19:04:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y135so9964312wmc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 12:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kVifxkwV57lbFaLMZ62E2MymQicYvTWMQCIWoJEOxVE=;
 b=I/yLio7406hWGj9miHiO6eJZ6perF97/ZTkM//XglMMHH4d2qvmen2eQ3P5qrnHArm
 UViMudhmoP7M76QPTcQ3ZJuwEE5k1H5dw+rzH210138GPCJaUXkxXH3ITB5La0XO+bWG
 HKQgVJ54B+OTlg1/hNBqDdYGi7ptx3qZE8RT/rBquKRABHbPcSLHs3FLN75hGu9sW0rB
 rIuIsuzSm63frfcfEH1E0wwH6V4lVkZCNumZr4VWycGPg5vtV+OaiOXGYW30e852tYKi
 xCqLHlTj6Mu+JNBTTGvC1uW+JgD2P9Rl5yP+J2En9ZY2OKnxo4/qSaaL1SapwxLVTOJr
 U8mQ==
X-Gm-Message-State: APjAAAWh82AwsIZGW5k7gMOqofL1+krANkpnptXuVFkStHA3dU2aZdb+
 lw1GnXlMwEM9Bupb5bgzhPaB2ItdofcEIdIBUb6B1w==
X-Google-Smtp-Source: APXvYqwa7ITNvRtiSOdskk4SkYRranN4eQE7juVdF/IwYGcYFc5PbwoFNc53WWVl4wD8gsZPH/JeOwOuUVc3Uwax8DY=
X-Received: by 2002:a05:600c:2388:: with SMTP id
 m8mr8328661wma.173.1571425476242; 
 Fri, 18 Oct 2019 12:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
 <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
 <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
 <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
 <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
 <CALAqxLWrsXG0XysL7RmhApbuZukDdG5VhdHOTS5odkG9f1ezwA@mail.gmail.com>
 <20191018095516.inwes5avdeixl5nr@DESKTOP-E1NTVVP.localdomain>
 <20191018184123.GA10634@arm.com>
 <CALAqxLXzOjyD1MpGeuZKLz+RNz1Utd8QpbvtSOodeqT-gCu6kA@mail.gmail.com>
 <20191018185723.GA27993@arm.com>
In-Reply-To: <20191018185723.GA27993@arm.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 18 Oct 2019 12:04:25 -0700
Message-ID: <CALAqxLVeo6=CHabFZv7qMkNw+h_5xez+aF7CuBT=37Dz-=s5eg@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
To: Ayan Halder <Ayan.Halder@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kVifxkwV57lbFaLMZ62E2MymQicYvTWMQCIWoJEOxVE=;
 b=xMqSU3dYbjRNXrK2X8mJ/bin+9yX01nMLFcUnxVFLpfdUixET5kIQRIzXkvV2uxO9O
 kpcRo/hk2WxPWy9wV9qo1Xxdk8WgRtI3qM6Co2dH7dwh7RuwKxOX4ylleKdUsIrwTPp1
 yIdT4fnHrv46kuyNWpEGCexOMl0Bcb46+XkOIBw+wWBVdUJXZGYiRex6IgkeP8mxLdpk
 6MJloWgTsrbwbR5GfCnNlabZWhh/e7ZU6zshSRdF4ukvYZ16k9884bM+9+9yFTXgtwXm
 WRk00HZkwETc9wrc6kFfJTbyt9EtQcId79EXlIFf+PwgBt/p+I68WUV9xOTFzSQR/YQA
 34sg==
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
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, nd <nd@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMTE6NTcgQU0gQXlhbiBIYWxkZXIgPEF5YW4uSGFsZGVy
QGFybS5jb20+IHdyb3RlOgo+IE9uIEZyaSwgT2N0IDE4LCAyMDE5IGF0IDExOjQ5OjIyQU0gLTA3
MDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMTE6NDEg
QU0gQXlhbiBIYWxkZXIgPEF5YW4uSGFsZGVyQGFybS5jb20+IHdyb3RlOgo+ID4gPiBXaXRoICdy
ZXVzYWJsZScsIHJtZW1fY21hX3NldHVwKCkgc3VjY2VlZHMgLCBidXQgdGhlIGtlcm5lbCBjcmFz
aGVzIGFzIGZvbGxvd3MgOi0KPiA+ID4KPiA+ID4gWyAgICAwLjQ1MDU2Ml0gV0FSTklORzogQ1BV
OiAyIFBJRDogMSBhdCBtbS9jbWEuYzoxMTAgY21hX2luaXRfcmVzZXJ2ZWRfYXJlYXMrMHhlYy8w
eDIyYwo+ID4KPiA+IElzIHRoZSB2YWx1ZSAweDYwMDAwMDAwIHlvdSdyZSB1c2luZyBzb21ldGhp
bmcgeW91IGp1c3QgZ3Vlc3NlZCBhdD8gSXQKPiA+IHNlZW1zIGxpa2UgdGhlIHdhcm5pbmcgaGVy
ZSBpcyBzYXlpbmcgdGhlIHBmbiBjYWxjdWxhdGVkIGZyb20gdGhlIGJhc2UKPiA+IGFkZHJlc3Mg
aXNuJ3QgdmFsaWQuCj4gSXQgaXMgYSB2YWxpZCBtZW1vcnkgcmVnaW9uIHdlIHVzZSB0byBhbGxv
Y2F0ZSBmcmFtZWJ1ZmZlcnMuCgpIcm0uIEkgZ3Vlc3MgSSdkIHN1Z2dlc3QgZGlnZ2luZyB0byBm
aWd1cmUgb3V0IHdoeSB0aGUga2VybmVsIGRvZXNuJ3QKc2VlIGl0IGFzIHN1Y2guCgpEb2VzIHRo
aXMgb25seSBoYXBwZW4gd2l0aCBteSBwYXRjaGVzIGFwcGxpZWQ/IEknbSBzb3J0IG9mIGFzc3Vt
aW5nCmNhbiB5b3UgdHJpcCB0aGlzIGV2ZW4gd2l0aG91dCB0aGVtLCBidXQgbWF5YmUgSSdtIHdy
b25nPwoKdGhhbmtzCi1qb2huCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
