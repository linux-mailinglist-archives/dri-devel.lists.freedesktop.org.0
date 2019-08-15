Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4908F4C3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 21:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773CE6EA5A;
	Thu, 15 Aug 2019 19:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34656EA5A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 19:37:09 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g17so2761555qkk.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 12:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8B7ZU3Bek5iBR0Gc89ftYh7TjZXjD4yEwlomz+Wjt2c=;
 b=ovtEbVEivfrEpA517OVUiZCX+X89+tECqnYlkj8PRQtszKcY5jKtBfQ/qEmNVV42EM
 9BXD4kz3nnefkJhDHuyQoozi+2w0mVZtxBn1Ps9sqzJHm0x0llmrM/2L3isWjrC+uozu
 Z0M5bPD3DtYSvSQozJuayivxGh8T1PtK6IrWfHYLyNYrDMmEVrifjx3nvOnwLSSG/F1y
 ruDVV/D3w9fLqW785Xa7sEWiHGYo1dwS4gyxkDErMzQUO+X4G9KM04tm6TcZ7TL5HY+y
 gzdxOyShM69gaBskYYTQMittuUFUEv+152x6gFcC9mevum8vhDoxrAKubbO9ua17AzsG
 Kgeg==
X-Gm-Message-State: APjAAAUDTY4JVNqD6QzJMELCood5yw9FdGlfpy4nML50nYTWRnXkDSM9
 h0ZLT6dytWdrXIWRoUFr7hBp1tAsKSw095rMtNDNvQ==
X-Google-Smtp-Source: APXvYqyN/Rpqc+hcug45XccFd01EyKUDyLxn6LexP6EjGyp4UwYCtw4O8N3LruktHoRZPbqNumM+D2HKyuMZBe8Knr8=
X-Received: by 2002:a37:c40d:: with SMTP id d13mr5642585qki.8.1565897829056;
 Thu, 15 Aug 2019 12:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-5-hch@lst.de>
 <20190807174548.GJ1571@mellanox.com>
 <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
 <20190808065933.GA29382@lst.de>
 <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
 <20190814073854.GA27249@lst.de> <20190814132746.GE13756@mellanox.com>
 <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
In-Reply-To: <20190815180325.GA4920@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 15 Aug 2019 12:36:58 -0700
Message-ID: <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
To: Jerome Glisse <jglisse@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8B7ZU3Bek5iBR0Gc89ftYh7TjZXjD4yEwlomz+Wjt2c=;
 b=tnL7VdGDL1IfU6GuDBD8g0drMYas0nnbVjc+7f8CZnUThvQdLzT7XOWxXXBLjg1Y14
 lm4/rSaWP/p9c9TiwpdLwVIspFL8XMuaFhv2W4/APnwO6Lkq5yNQbb97VuAkt86No62W
 4byyYEFKglar1JlJbV5SoVGpGcs8vVB7ulNv6COAP5ahYQQ3BFP00GX9pp/EUSIsFmiI
 C+6zXy6YwnvfBhu9ad48JcVkU/IYS8AeP/VF3pY/3CYccCFyZnZT2r/b9KQDac+vaNKl
 +EdL0ZkwY+b1e3Rr0nEiuuQnUOZfkzMO0xdrArQF38ZIjYDZVMd2s6DJqauS6Sx6neqY
 FcDQ==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTE6MDcgQU0gSmVyb21lIEdsaXNzZSA8amdsaXNzZUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDE0LCAyMDE5IGF0IDA3OjQ4OjI4QU0g
LTA3MDAsIERhbiBXaWxsaWFtcyB3cm90ZToKPiA+IE9uIFdlZCwgQXVnIDE0LCAyMDE5IGF0IDY6
MjggQU0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gT24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6Mzg6NTRBTSArMDIwMCwgQ2hyaXN0b3BoIEhl
bGx3aWcgd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDY6MzY6MzNQTSAt
MDcwMCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gPiA+ID4gU2VjdGlvbiBhbGlnbm1lbnQgY29u
c3RyYWludHMgc29tZXdoYXQgc2F2ZSB1cyBoZXJlLiBUaGUgb25seSBleGFtcGxlCj4gPiA+ID4g
PiBJIGNhbiB0aGluayBvZiBhIFBNRCBub3QgY29udGFpbmluZyBhIHVuaWZvcm0gcGdtYXAgYXNz
b2NpYXRpb24gZm9yCj4gPiA+ID4gPiBlYWNoIHB0ZSBpcyB0aGUgY2FzZSB3aGVuIHRoZSBwZ21h
cCBvdmVybGFwcyBub3JtYWwgZHJhbSwgaS5lLiBzaGFyZXMKPiA+ID4gPiA+IHRoZSBzYW1lICdz
dHJ1Y3QgbWVtb3J5X3NlY3Rpb24nIGZvciBhIGdpdmVuIHNwYW4uIE90aGVyd2lzZSwgZGlzdGlu
Y3QKPiA+ID4gPiA+IHBnbWFwcyBhcnJhbmdlIHRvIG1hbmFnZSB0aGVpciBvd24gZXhjbHVzaXZl
IHNlY3Rpb25zIChhbmQgbm93Cj4gPiA+ID4gPiBzdWJzZWN0aW9ucyBhcyBvZiB2NS4zKS4gT3Ro
ZXJ3aXNlIHRoZSBpbXBsZW1lbnRhdGlvbiBjb3VsZCBub3QKPiA+ID4gPiA+IGd1YXJhbnRlZSBk
aWZmZXJlbnQgbWFwcGluZyBsaWZldGltZXMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhhdCBzYWlk
LCB0aGlzIHNlZW1zIHRvIHdhbnQgYSBiZXR0ZXIgbWVjaGFuaXNtIHRvIGRldGVybWluZSAicGZu
IGlzCj4gPiA+ID4gPiBaT05FX0RFVklDRSIuCj4gPiA+ID4KPiA+ID4gPiBTbyBJIGd1ZXNzIHRo
aXMgcGF0Y2ggaXMgZmluZSBmb3Igbm93LCBhbmQgb25jZSB5b3UgcHJvdmlkZSBhIGJldHRlcgo+
ID4gPiA+IG1lY2hhbmlzbSB3ZSBjYW4gc3dpdGNoIG92ZXIgdG8gaXQ/Cj4gPiA+Cj4gPiA+IFdo
YXQgYWJvdXQgdGhlIHZlcnNpb24gSSBzZW50IHRvIGp1c3QgZ2V0IHJpZCBvZiBhbGwgdGhlIHN0
cmFuZ2UKPiA+ID4gcHV0X2Rldl9wYWdlbWFwcyB3aGlsZSBzY2FubmluZz8gT2RkcyBhcmUgZ29v
ZCB3ZSB3aWxsIHdvcmsgd2l0aCBvbmx5Cj4gPiA+IGEgc2luZ2xlIHBhZ2VtYXAsIHNvIGl0IG1h
a2VzIHNvbWUgc2Vuc2UgdG8gY2FjaGUgaXQgb25jZSB3ZSBmaW5kIGl0Pwo+ID4KPiA+IFllcywg
aWYgdGhlIHNjYW4gaXMgb3ZlciBhIHNpbmdsZSBwbWQgdGhlbiBjYWNoaW5nIGl0IG1ha2VzIHNl
bnNlLgo+Cj4gUXVpdGUgZnJhbmtseSBhbiBlYXNpZXIgYW4gYmV0dGVyIHNvbHV0aW9uIGlzIHRv
IHJlbW92ZSB0aGUgcGFnZW1hcAo+IGxvb2t1cCBhcyBITU0gdXNlciBhYmlkZSBieSBtbXUgbm90
aWZpZXIgaXQgbWVhbnMgd2Ugd2lsbCBub3QgbWFrZQo+IHVzZSBvciBkZXJlZmVyZW5jZSB0aGUg
c3RydWN0IHBhZ2Ugc28gdGhhdCB3ZSBhcmUgc2FmZSBmcm9tIGFueQo+IHJhY2luZyBob3R1bnBs
dWcgb2YgZGF4IG1lbW9yeSAoYXMgbG9uZyBhcyBkZXZpY2UgZHJpdmVyIHVzaW5nIGhtbQo+IGRv
IG5vdCBoYXZlIGEgYnVnKS4KClllcywgYXMgbG9uZyBhcyB0aGUgZHJpdmVyIHJlbW92ZSBpcyBz
eW5jaHJvbml6ZWQgYWdhaW5zdCBITU0Kb3BlcmF0aW9ucyB2aWEgYW5vdGhlciBtZWNoYW5pc20g
dGhlbiB0aGVyZSBpcyBubyBuZWVkIHRvIHRha2UgcGFnZW1hcApyZWZlcmVuY2VzLiBDYW4geW91
IGJyaWVmbHkgZGVzY3JpYmUgd2hhdCB0aGF0IG90aGVyIG1lY2hhbmlzbSBpcz8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
