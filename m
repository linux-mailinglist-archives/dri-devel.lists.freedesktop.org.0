Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BA4296BDA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 11:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD1E6E4EC;
	Fri, 23 Oct 2020 09:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3F76E4EC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 09:13:04 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id s21so1151978oij.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 02:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qM5nhEMYeFdEA7QerSEffOkMoRD8vG6Y+rmNtsxnjd4=;
 b=Xxk1aGPWSfFkpkis6OoEqJ2gCaQ0ahlPrRIzd5LTpnMwyB8U4J5r+K0BKl7hDE+eYN
 3FcbH6Xq/dGBMGOJztPD8i+0aPOjlnDIfmE3yk5nKc52BxNSLHg2zElLlqf99LJUx8Jn
 jnSHwE5Y+hs0wMvh4+/GAgohgcKexUIqGABys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qM5nhEMYeFdEA7QerSEffOkMoRD8vG6Y+rmNtsxnjd4=;
 b=c4ipTwneG52qKXyHRcWgqeIYgZsaz7wGvNse1I8k7zYUR3b/y2DcML44CoL8GTUU8C
 QSolXvCYUGsWse3jm37Mc7vSLuY9tRU7HXDN9Yd7j3OCrFdjkjJLuh6jPK/kPLFfN9xb
 GAuq6oM9m89Nk3NN7PrjJ5CjPw5DjZu/L9CLMI6HyR0eabE96I9mtz3ZjhW3IcF93B1u
 u3Eq1vFD2zUaJiDWJLOH7w8lw/RBLaoC8OqJ+nh3ceuY2AutoM4NxbZqVhsstTvLGP3n
 AQmmbcJ4mtbWf7xjqtWcLg/+Ne7BMtmfafOuyFG9n65OfOF7/5/yYffel5+/62yhsDdS
 BWlw==
X-Gm-Message-State: AOAM532mP99Pr+zsKxnMi4RHEC2yLtg/S6CJsjw+q9lR0usrjmmZCWLC
 pwFBAgom//yJWLerAfRxt8zPxybeLEe4K8cXLsnDAEcWydF9lg==
X-Google-Smtp-Source: ABdhPJxJfW2e7RMT1o53fgdROAZNOXDUkt9dx9afCHGb/w0gAtXuC9OHLmkK0ZV4M3byXb+A+RT/xRPrOH90bLENhKU=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr958482oia.14.1603444384107; 
 Fri, 23 Oct 2020 02:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20201021085655.1192025-5-daniel.vetter@ffwll.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 23 Oct 2020 11:12:52 +0200
Message-ID: <CAKMK7uE50TPNruEQv5JDX91q0DDqy-CXfbQzc48YeqPzSE96yA@mail.gmail.com>
Subject: Re: [PATCH v3 04/16] misc/habana: Use FOLL_LONGTERM for userptr
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 KVM list <kvm@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Pawel Piskorski <ppiskorski@habana.ai>, John Hubbard <jhubbard@nvidia.com>,
 Daniel Vetter <daniel.vetter@ffwll.com>, Ofir Bitton <obitton@habana.ai>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, Omer Shpigelman <oshpigelman@habana.ai>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Moti Haimovski <mhaimovski@habana.ai>, Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgT2RlZCwKCkRpZCB0ZXN0aW5nIG9uIHlvdXIgZW5kIHR1cm4gdXAgYW55dGhpbmcsIG9yIGNh
biBJIHB1dCBhbgphY2smdGVzdGVkLWJ5IGZyb20geW91IG9uIHRoZSB0d28gaGFiYW5hIHBhdGNo
ZXMgZm9yIHRoZSBuZXh0IHJvdW5kPwoKVGhhbmtzLCBEYW5pZWwKCk9uIFdlZCwgT2N0IDIxLCAy
MDIwIGF0IDEwOjU3IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdy
b3RlOgo+Cj4gVGhlc2UgYXJlIHBlcnNpc3RlbnQsIG5vdCBqdXN0IGZvciB0aGUgZHVyYXRpb24g
b2YgYSBkbWEgb3BlcmF0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNh
Pgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gQ2M6IErDqXLDtG1lIEdsaXNzZSA8
amdsaXNzZUByZWRoYXQuY29tPgo+IENjOiBKYW4gS2FyYSA8amFja0BzdXNlLmN6Pgo+IENjOiBE
YW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KPiBDYzogbGludXgtbW1Aa3Zh
Y2sub3JnCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBs
aW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5r
ZXJuZWwub3JnCj4gQ2M6IE9kZWQgR2FiYmF5IDxvZGVkLmdhYmJheUBnbWFpbC5jb20+Cj4gQ2M6
IE9tZXIgU2hwaWdlbG1hbiA8b3NocGlnZWxtYW5AaGFiYW5hLmFpPgo+IENjOiBPZmlyIEJpdHRv
biA8b2JpdHRvbkBoYWJhbmEuYWk+Cj4gQ2M6IFRvbWVyIFRheWFyIDx0dGF5YXJAaGFiYW5hLmFp
Pgo+IENjOiBNb3RpIEhhaW1vdnNraSA8bWhhaW1vdnNraUBoYWJhbmEuYWk+Cj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1h
biA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gQ2M6IFBhd2VsIFBpc2tvcnNraSA8cHBp
c2tvcnNraUBoYWJhbmEuYWk+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1v
bi9tZW1vcnkuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21t
b24vbWVtb3J5LmMgYi9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMKPiBp
bmRleCAzMjdiNjQ0NzlmOTcuLjc2N2QzNjQ0YzAzMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21p
c2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMKPiArKysgYi9kcml2ZXJzL21pc2MvaGFiYW5h
bGFicy9jb21tb24vbWVtb3J5LmMKPiBAQCAtMTI4OCw3ICsxMjg4LDggQEAgc3RhdGljIGludCBn
ZXRfdXNlcl9tZW1vcnkoc3RydWN0IGhsX2RldmljZSAqaGRldiwgdTY0IGFkZHIsIHU2NCBzaXpl
LAo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiAgICAgICAgIH0KPgo+IC0gICAg
ICAgcmMgPSBwaW5fdXNlcl9wYWdlc19mYXN0KHN0YXJ0LCBucGFnZXMsIEZPTExfRk9SQ0UgfCBG
T0xMX1dSSVRFLAo+ICsgICAgICAgcmMgPSBwaW5fdXNlcl9wYWdlc19mYXN0KHN0YXJ0LCBucGFn
ZXMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRk9MTF9GT1JDRSB8IEZPTExf
V1JJVEUgfCBGT0xMX0xPTkdURVJNLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVzZXJwdHItPnBhZ2VzKTsKPgo+ICAgICAgICAgaWYgKHJjICE9IG5wYWdlcykgewo+IC0tCj4g
Mi4yOC4wCj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
