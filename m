Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76CFA9B55
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC2F89DBF;
	Thu,  5 Sep 2019 07:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F50E89237
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 01:47:26 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id s28so533599otd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 18:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mF+PyrayTBs+6EUlPi/FAPHJkbrkGOC+w4HZRZC21uU=;
 b=USSZXFFw/72uBWYb5D/vTtGZWxkVXVBRX5EvRX/wt179g7nWJtoFBqGWl+vnq6nsMp
 8Xd4bVYlJzz47b3/76a4vQW0KDdWuvfoUM8VX8WKAGH5u/Bu1swC0kJkQD71NzGpI8Sp
 wvsVuGe4agvtBkYwS2+gXpbZFo/XgqOxve0F85exVebZCnqi3aO05CpsPjMDhbRS0Eci
 eFK2pfTAskWH4NYmxsUWpbh0ZFqHyrNiijWa6H9kPxMyAljalUsSWJU3SegV3K0zbVnN
 +0RI8GmsHbzDYus+daawZnmo9tiY9v9pW5qWY4oYCm+RAGzWuvLC2fH9faBxGK7jwd0R
 9wmg==
X-Gm-Message-State: APjAAAWNEVxC6XRTy+fELE9xkq37CmhLwpo2kNrLA5dE92WsUa4Blq0U
 bZc5wfLP2Rh7uu2eDDRreNuisZCxt3jLKHp9Ak68Fg==
X-Google-Smtp-Source: APXvYqw43p/uYYgAzSOozahZlzXabTMhHozC8Zwyus/oNppIbh7rBcXv72c6Tdb6xRr2QOo+h6G4HCVuoBawOfrM7jc=
X-Received: by 2002:a9d:6304:: with SMTP id q4mr437483otk.269.1567648045565;
 Wed, 04 Sep 2019 18:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567492316.git.baolin.wang@linaro.org>
 <5723d9006de706582fb46f9e1e3eb8ce168c2126.1567492316.git.baolin.wang@linaro.org>
 <20190904172548.GA10973@kroah.com>
In-Reply-To: <20190904172548.GA10973@kroah.com>
From: Baolin Wang <baolin.wang@linaro.org>
Date: Thu, 5 Sep 2019 09:47:14 +0800
Message-ID: <CAMz4kuJWPgqSyyn_-Qxq6SCY8Vps5SnA9W6_d1w-3TwgTPM+WA@mail.gmail.com>
Subject: Re: [BACKPORT 4.14.y 1/8] drm/i915/fbdev: Actually configure untiled
 displays
To: Greg KH <greg@kroah.com>
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mF+PyrayTBs+6EUlPi/FAPHJkbrkGOC+w4HZRZC21uU=;
 b=M7JS3jemmcLHmPAmZdRLNxGVYKx189Xz9ebu92+yMQkAxd//lI5cNhBH0TqbIc7BNQ
 3gjtXAoJkxCvVNRJvLK9aYYif0Eq716kvLoCpa+osdu4qYHI+HZrO6uJy+q2PXNY4cD5
 T+sSVnSAIB/9QQQN0wB9e+jpnAg13NkQZVDXK9SM3UI1XFsFyW4aj2fQfmPp7wXZEjUo
 sFRlqrFOVfuCqVP6xgP1NYmB6ZDz5iL16dIzVGTycywbsihFstFdSU3z+hRCQIP1D3os
 QdVqmy0f5ojxsi3On6b5n10lJiirCTEa0zJ3tv0RESaEjA1fISNlIOgeB3ySyuEfYTrY
 1WFA==
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "# 3.4.x" <stable@vger.kernel.org>, Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA1IFNlcCAyMDE5IGF0IDAxOjI1LCBHcmVnIEtIIDxncmVnQGtyb2FoLmNvbT4gd3Jv
dGU6Cj4KPiBPbiBUdWUsIFNlcCAwMywgMjAxOSBhdCAwMjo1NToyNlBNICswODAwLCBCYW9saW4g
V2FuZyB3cm90ZToKPiA+IEZyb206IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPgo+ID4KPiA+IElmIHdlIHNraXBwZWQgYWxsIHRoZSBjb25uZWN0b3JzIHRoYXQgd2VyZSBu
b3QgcGFydCBvZiBhIHRpbGUsIHdlIHdvdWxkCj4gPiBsZWF2ZSBjb25uX3NlcT0wIGFuZCBjb25u
X2NvbmZpZ3VyZWQ9MCwgY29udmluY2luZyBvdXJzZWx2ZXMgdGhhdCB3ZQo+ID4gaGFkIHN0YWdu
YXRlZCBpbiBvdXIgY29uZmlndXJhdGlvbiBhdHRlbXB0cy4gQXZvaWQgdGhpcyBzaXR1YXRpb24g
YnkKPiA+IHN0YXJ0aW5nIGNvbm5fc2VxPUFMTF9DT05ORUNUT1JTLCBhbmQgcmVwZWF0aW5nIHVu
dGlsIHdlIGZpbmQgbm8gbW9yZQo+ID4gY29ubmVjdG9ycyB0byBjb25maWd1cmUuCj4gPgo+ID4g
Rml4ZXM6IDc1NGE3NjU5MWIxMiAoImRybS9pOTE1L2ZiZGV2OiBTdG9wIHJlcGVhdGluZyB0aWxl
IGNvbmZpZ3VyYXRpb24gb24gc3RhZ25hdGlvbiIpCj4gPiBSZXBvcnRlZC1ieTogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiBS
ZXZpZXdlZC1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4KPiA+IExpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRj
aC9tc2dpZC8yMDE5MDIxNTEyMzAxOS4zMjI4My0xLWNocmlzQGNocmlzLXdpbHNvbi5jby51awo+
ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHYzLjE5Kwo+ID4gU2lnbmVkLW9mZi1i
eTogQmFvbGluIFdhbmcgPGJhb2xpbi53YW5nQGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9mYmRldi5jIHwgICAxMiArKysrKysrLS0tLS0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gV2hhdCBp
cyB0aGUgZ2l0IGNvbW1pdCBpZCBvZiB0aGlzIHBhdGNoIGluIExpbnVzJ3MgdHJlZT8KClRoZSBj
b21taXQgaWQgaXM6IGQ5YjMwOGIxZjhhMWFjYzBjMzI3OWY0NDNkNGZlMGY5ZjY2MzI1MmUKCj4K
PiBDYW4geW91IHBsZWFzZSBhZGQgdGhhdCBhcyB0aGUgZmlyc3QgbGluZSBvZiB0aGUgY2hhbmdl
bG9nIGxpa2UgaXMgZG9uZQo+IHdpdGggYWxsIG90aGVyIHN0YWJsZSBwYXRjaGVzPyAgVGhhdCB3
YXkgSSBjYW4gdmVyaWZ5IHRoYXQgd2hhdCB5b3UKPiBwb3N0ZWQgaGVyZSBpcyB0aGUgY29ycmVj
dCBvbmUuCj4KPiBQbGVhc2UgZml4IHRoZSB1cCBmb3IgYWxsIG9mIHRoZXNlIGFuZCByZXNlbmQu
CgpTdXJlLiBUaGFua3MuCgotLSAKQmFvbGluIFdhbmcKQmVzdCBSZWdhcmRzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
