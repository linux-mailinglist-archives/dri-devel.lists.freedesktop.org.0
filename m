Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F785EF89
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 01:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAADC6E216;
	Wed,  3 Jul 2019 23:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B7F6E216
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 23:11:46 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k18so4181551ljc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 16:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UP+qxKT5rVjcWek7KzsMBfffszv54jR92VkwBR/jGz0=;
 b=s69juZgMU4ch54b1oTReUyYJmFlM66WO8nkNkw0O/spSVxdf/bFAynzEivRMdjvuG4
 Bbo5YCnV/9gowD679Gu4jcKpBCCcGURppb7cxeXTl6rv9IUmzJvT7lmg2Cb88BH12dKw
 j8yKi3ldl6Y+Y+NK3KDDmFdokzHT9LszYtNx4AVTVXB/zAjvwfimL6dbCzYxod0C9cE4
 x2oLSTvPFqeaXcCOmCFd+VO/LBwucRgyAKqyrl8NzUmngWHrrCCcrEUFZ1rZOT1t33Kk
 j9v0TVABJm0sMubCU3xLwqYh5RtfIO7PxLi4xWvyUkZ0idD2BYjuvlFhC+wFFi3pWySX
 vSEA==
X-Gm-Message-State: APjAAAVCVKZB7lzWRPj0uV6I27DLAL4G0i1+Dp1817tiPbr/IZheccet
 HspJuei5KAaSA5wifsDcJiO3rr42FP15x+VraJNyuA==
X-Google-Smtp-Source: APXvYqzZF2qms9SKK53fAVCvJv1RN+MZtTtgMYoI42VqDQ6BxFVX18oItEruFDL5MuzmBcvvjtk/MtdpSZD4X7Yl4T4=
X-Received: by 2002:a2e:9a10:: with SMTP id o16mr3126839lji.95.1562195504800; 
 Wed, 03 Jul 2019 16:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com>
 <a9764210-9401-471b-96a7-b93606008d07@amd.com>
 <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
 <20190704073214.266a9c33@canb.auug.org.au>
In-Reply-To: <20190704073214.266a9c33@canb.auug.org.au>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Jul 2019 09:11:33 +1000
Message-ID: <CAPM=9tx+w5ujeaFQ1koqsqV5cTw8M8B=Ws_-wB1Z_Jy-msFtAQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UP+qxKT5rVjcWek7KzsMBfffszv54jR92VkwBR/jGz0=;
 b=AaZ3mUvL8AP96UyzVBT0wxy8e2SkMqvx50vLcd+2kNzxqNml8a56RhWeDZ8Q5Fc2wl
 KVqgai+DjYeH0uxdb1Ognc5BPZmL4WZWdPwoU9e/1vsBuhzhe15MUQC2vQ3x6DppiYYz
 keGu6n4LLGu0Lemc6scDgcDK2s7pVyjXKF1ICSfd81PCtTR04+43X2bbtckqCIgtQabF
 eve1j/83zkjYW5NYa8HNRPStRAQvookixhnFrvr6KwHgPAoLrwAZkKZg4Z+8+30v+HAZ
 eeMs9aX8DfP59lB6jGwMLBV4CWUVYTp0o5DmD1U0q7rtvnIXP4lu7165G3Kaz4iUbfda
 ev0g==
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, Dave Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA0IEp1bCAyMDE5IGF0IDA3OjMyLCBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5h
dXVnLm9yZy5hdT4gd3JvdGU6Cj4KPiBIaSBBbGV4LAo+Cj4gT24gV2VkLCAzIEp1bCAyMDE5IDE3
OjA5OjE2IC0wNDAwIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToK
PiA+Cj4gPiBHbyBhaGVhZCBhbmQgcmVzcGluIHlvdXIgcGF0Y2ggYXMgcGVyIHRoZSBzdWdnZXN0
aW9uIGFib3ZlLiAgdGhlbiBJCj4gPiBjYW4gYXBwbHkgaXQgSSBjYW4gZWl0aGVyIG1lcmdlIGht
bSBpbnRvIGFtZCdzIGRybS1uZXh0IG9yIHdlIGNhbiBqdXN0Cj4gPiBwcm92aWRlIHRoZSBjb25m
bGljdCBmaXggcGF0Y2ggd2hpY2hldmVyIGlzIGVhc2llci4gIFdoaWNoIGhtbSBicmFuY2gKPiA+
IGlzIGZvciA1LjM/Cj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9yZG1hL3JkbWEuZ2l0Lz9oPWhtbQo+Cj4gUGxlYXNlIGRvIG5vdCBtZXJnZSB0aGUg
aG1tIHRyZWUgaW50byB5b3VycyAtIGVzcGVjaWFsbHkgaWYgdGhlCj4gY29uZmxpY3QgY29tZXMg
ZG93biB0byBqdXN0IGEgZmV3IGxpbmVzLiAgTGludXMgaGFzIGFkZHJlc3NlZCB0aGlzIGluCj4g
dGhlIHBhc3QuICBUaGVyZSBpcyBhIHBvc3NpYmlsaXR5IHRoYXQgaGUgbWF5IHRha2Ugc29tZSBv
YmplY3Rpb24gdG8KPiB0aGUgaG1tIHRyZWUgKGZvciBleGFtcGxlKSBhbmQgdGhlbiB5b3VyIHRy
ZWUgKGFuZCBjb25zZXF1ZW50bHkgdGhlIGRybQo+IHRyZWUpIHdvdWxkIGFsc28gbm90IGJlIG1l
cmdlYWJsZS4KPgoKSSdtIGZpbmUgd2l0aCBtZXJnaW5nIHRoZSBobW0gdHJlZSBpZiBKYXNvbiBo
YXMgYSBzdGFibGUgbm9uLXJlYmFzaW5nCmJhc2UuIEknZCByYXRoZXIgbWVyZ2UgaW50byBkcm0g
dHJlZSBhbmQgdGhlbiBoYXZlIGFtZCBiYWNrbWVyZ2UgaWYgaXQKd2UgYXJlIGRvaW5nIGl0LgoK
QnV0IGlmIHdlIGNhbiBqdXN0IHJlZHVjZSB0aGUgY29uZmxpY3RzIHRvIGEgc21hbGwgYW1vdW50
IGl0J3MgZWFzaWVyCmZvciBldmVyeW9uZSB0byBqdXN0IGRvIHRoYXQuCgpEYXZlLgoKCj4gSnVz
dCBzdXBwbHkgTGludXMgd2l0aCBhIGhpbnQgYWJvdXQgdGhlIGNvbmZsaWN0IHJlc29sdXRpb24u
Cj4KPiAtLQo+IENoZWVycywKPiBTdGVwaGVuIFJvdGh3ZWxsCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
