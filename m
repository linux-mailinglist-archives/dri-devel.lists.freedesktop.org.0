Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FFA43700
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92DE89A75;
	Thu, 13 Jun 2019 13:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626BE89852;
 Thu, 13 Jun 2019 13:57:37 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n9so20955867wru.0;
 Thu, 13 Jun 2019 06:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mF/t8Vc3YmpUfAcfOp8dmky92LVPXpVO+34OWoDYALY=;
 b=lkF2nHRbv6J5pQg/0rKsbILLTsVUnRZ5dgnI6fifWo/0ACrkQsrmvCyhvd2kK/+3Mi
 zCkkawBmmSdHEsQGWxtXxlOGx6+Eg4XP4nKIRYmLdslP6J0mH8ggzNRImV712p7Sw0z/
 3jN/ra7xtVh9wbpPDPx6rF1Eu7HY0qf7eN4QHQcNDkc7kLUZ95jQA0LlDBW3RwDpKB75
 9ORzGXat4mDgqmb6roSUkxF1dvkhr3nrTFrw9dR0K+NOlwIX3Jn8jKUwJc+93IohmQiB
 oV1JHkg0adZu1h70Vzwh9qFbXlmqCZUzeXrBjUt7m3b5+YsKBASra4JlbyzQRreCwZO1
 SFVQ==
X-Gm-Message-State: APjAAAX3rITcsQq4ZvivQReaWDWjeyE7GvjJw/7vvFPjJsoETk3p3vFZ
 HTMi+hI/Sp0kQZjAT8HNgaojMksiKqVcY7lN834=
X-Google-Smtp-Source: APXvYqyGOk8mUWlcXn6d0r8IOUWdlMmLErqfMy6ExuXDc0C9puukqfkBOpVqz/zUvE5BpXaMuiDvB5XAxpVkVRjDQ7Q=
X-Received: by 2002:adf:f68f:: with SMTP id v15mr9752218wrp.4.1560434256044;
 Thu, 13 Jun 2019 06:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190530000819.GA25416@obi-wan> <20190604202149.GA20116@obi-wan>
In-Reply-To: <20190604202149.GA20116@obi-wan>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Jun 2019 09:57:24 -0400
Message-ID: <CADnq5_OqVSz7Vfo0zP88i=wJur=wtz6Jd99ZTiQSbFNBcc3j7w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay/smu7_hwmgr: replace blocking delay with
 non-blocking
To: Yrjan Skrimstad <yrjan@skrimstad.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mF/t8Vc3YmpUfAcfOp8dmky92LVPXpVO+34OWoDYALY=;
 b=JPlduTHaMif6czcMYjH+iK3zHDfuBg7MK5yig5ap/g7Ag1fTaFELEs+YoZW0y+d87C
 CU7htdxBFUN1SyhltslOLJT6dQoJReGZO+5fNgwDQI95qKOnCCY/9os6cBZXB/Re8G1u
 CnHQ2fKTzh8PM+cRx6udFksTDCI7/Bx2Eu8mAKwp9/usIFA8uMSXxtTaE5XcFpmVGg49
 vQGf6oOAXmZTw/dzqRwarMDvsm57qIcYj59YYrXGQi50dmU/glilhfLvp+dxsbqxM867
 zGtdcpKV6rNx8TbP0n1cvTETY/aZHlFHXGfq0agJBMWutPMajKINRzxMxQVtrBfQjjoh
 ovWQ==
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCA0OjIyIFBNIFlyamFuIFNrcmltc3RhZCA8eXJqYW5Ac2ty
aW1zdGFkLm5ldD4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1heSAzMCwgMjAxOSBhdCAwMjowODoyMUFN
ICswMjAwLCBZcmphbiBTa3JpbXN0YWQgd3JvdGU6Cj4gPiBUaGlzIGRyaXZlciBjdXJyZW50bHkg
Y29udGFpbnMgYSByZXBlYXRlZCA1MDBtcyBibG9ja2luZyBkZWxheSBjYWxsCj4gPiB3aGljaCBj
YXVzZXMgZnJlcXVlbnQgbWFqb3IgYnVmZmVyIHVuZGVycnVucyBpbiBQdWxzZUF1ZGlvLiBUaGlz
IHBhdGNoCj4gPiBmaXhlcyB0aGlzIGlzc3VlIGJ5IHJlcGxhY2luZyB0aGUgYmxvY2tpbmcgZGVs
YXkgd2l0aCBhIG5vbi1ibG9ja2luZwo+ID4gc2xlZXAgY2FsbC4KPgo+IEkgc2VlIHRoYXQgSSBo
YXZlIG5vdCBleHBsYWluZWQgdGhpcyBidWcgd2VsbCBlbm91Z2gsIGFuZCBJIGhvcGUgdGhhdCBp
cwo+IHRoZSByZWFzb24gZm9yIHRoZSBsYWNrIG9mIHJlcGxpZXMgb24gdGhpcyBwYXRjaC4gSSB3
aWxsIGhlcmUgYXR0ZW1wdCB0bwo+IGV4cGxhaW4gdGhlIHNpdHVhdGlvbiBiZXR0ZXIuCj4KPiBU
byBzdGFydCB3aXRoIHNvbWUgaGFyZHdhcmUgZGVzY3JpcHRpb24gSSBhbSBoZXJlIHVzaW5nIGFu
IEFNRCBSOSAzODAKPiBHUFUsIGFuIEFNRCBSeXplbiA3IDE3MDAgRWlnaHQtQ29yZSBQcm9jZXNz
b3IgYW5kIGFuIEFNRCBYMzcwIGNoaXBzZXQuCj4gSWYgYW55IG1vcmUgaGFyZHdhcmUgb3Igc29m
dHdhcmUgc3BlY2lmaWNhdGlvbnMgYXJlIG5lY2Vzc2FyeSwgcGxlYXNlCj4gYXNrLgo+Cj4gVGhl
IGJ1ZyBpcyBhcyBmb2xsb3dzOiBXaGVuIHBsYXlpbmcgYXVkaW8gSSB3aWxsIHJlZ3VsYXJseSBo
YXZlIG1ham9yCj4gYXVkaW8gaXNzdWVzLCBzaW1pbGFyIHRvIHRoYXQgb2YgYSBza2lwcGluZyBD
RC4gVGhpcyBpcyByZXBvcnRlZCBieQo+IFB1bHNlQXVkaW8gYXMgc2NoZWR1bGluZyBkZWxheXMg
YW5kIGJ1ZmZlciB1bmRlcnJ1bnMgd2hlbiBydW5uaW5nCj4gUHVsc2VBdWRpbyB2ZXJib3NlbHkg
YW5kIHRoZXNlIHNjaGVkdWxpbmcgZGVsYXlzIGFyZSBhbHdheXMganVzdCB1bmRlcgo+IDUwMG1z
LCB0eXBpY2FsbHkgYXJvdW5kIDQ5MG1zLiBUaGlzIG1ha2VzIGxpc3RlbmluZyB0byBhbnkgbXVz
aWMgcXVpdGUKPiB0aGUgaG9ycmlibGUgZXhwZXJpZW5jZSBhcyBQdWxzZUF1ZGlvIGNvbnN0YW50
bHkgd2lsbCBhdHRlbXB0IHRvIHJld2luZAo+IGFuZCBjYXRjaCB1cC4gSXQgaXMgbm90IGEgZ3Jl
YXQgc2l0dWF0aW9uLCBhbmQgc2VlbXMgdG8gbWUgdG8gcXVpdGUKPiBjbGVhcmx5IGJlIGEgY2Fz
ZSB3aGVyZSByZWd1bGFyIHVzZXIgc3BhY2UgYmVoYXZpb3VyIGhhcyBiZWVuIGJyb2tlbi4KPgo+
IEkgd2FudCB0byBub3RlIHRoYXQgdGhpcyBhdWRpbyBwcm9ibGVtIHdhcyBub3Qgc29tZXRoaW5n
IEkgZXhwZXJpZW5jZWQKPiB1bnRpbCByZWNlbnRseSwgaXQgaXMgdGhlcmVmb3JlIGEgbmV3IGJ1
Zy4KPgo+IEkgaGF2ZSBiaXNlY3RlZCB0aGUga2VybmVsIHRvIGZpbmQgb3V0IHdoZXJlIHRoZSBw
cm9ibGVtIG9yaWdpbmF0ZWQgYW5kCj4gZm91bmQgdGhlIGZvbGxvd2luZyBjb21taXQ6Cj4KPiAj
IGZpcnN0IGJhZCBjb21taXQ6IFtmNTc0MmVjMzY0MjJhMzliNTdmMDI1NmU0ODQ3ZjYxYjNjNDMy
ZjhjXSBkcm0vYW1kL3Bvd2VycGxheTogY29ycmVjdCBwb3dlciByZWFkaW5nIG9uIGZpamkKPgo+
IFRoaXMgY29tbWl0IGludHJvZHVjZXMgYSBibG9ja2luZyBkZWxheSAobWRlbGF5KSBvZiA1MDBt
cywgd2hlcmVhcyB0aGUKPiBvbGQgYmVoYXZpb3VyIHdhcyBhIHNtYWxsZXIgYmxvY2tpbmcgZGVs
YXkgb2Ygb25seSAxbXMuIFRoaXMgc2VlbXMgdG8gbWUKPiB0byBiZSB2ZXJ5IGN1cmlvdXMgYXMg
dGhlIHNjaGVkdWxpbmcgZGVsYXlzIG9mIFB1bHNlQXVkaW8gYXJlIGFsd2F5cwo+IGFsbW9zdCA1
MDBtcy4gSSBoYXZlIHRoZXJlZm9yZSB3aXRoIHRoZSBwcmV2aW91cyBwYXRjaCByZXBsYWNlZCB0
aGUKPiBzY2hlZHVsaW5nIGRlbGF5IHdpdGggYSBub24tYmxvY2tpbmcgc2xlZXAgKG1zbGVlcCku
Cj4KPiBUaGUgcmVzdWx0cyBvZiB0aGUgcGF0Y2ggc2VlbXMgcHJvbWlzaW5nIGFzIEkgaGF2ZSB5
ZXQgdG8gZW5jb3VudGVyIGFueQo+IG9mIHRoZSBvbGQgPDUwMG1zIHNjaGVkdWxpbmcgZGVsYXlz
IHdoZW4gdXNpbmcgaXQgYW5kIEkgaGF2ZSBhbHNvIG5vdAo+IGVuY291bnRlcmVkIGFueSBrZXJu
ZWwgbG9nIG1lc3NhZ2VzIHJlZ2FyZGluZyBzbGVlcGluZyBpbiBhbiBhdG9taWMKPiBjb250ZXh0
LgoKVGhlIHBhdGNoIGlzIGZpbmUgYW5kIEkgY2FuIGFwcGx5IGl0IChJIGRvbid0IHRoaW5rIHRo
ZXJlIGFyZSBhbnkKcmVzdHJpY3Rpb25zIG9uIHNsZWVwaW5nIGluIHN5c2ZzKSwgYnV0IHRoaXMg
Y29kZSBvbmx5IGdldHMgZXhlY3V0ZWQKd2hlbiB5b3UgYWN0dWFsbHkgcmVhZCB0aGUgcG93ZXIg
c3RhdHVzIGZyb20gdGhlIGNhcmQgKGUuZy4sIHZpYSBzeXNmcwpvciBkZWJ1Z2ZzKS4gIFByZXN1
bWFibHkgeW91IGhhdmUgc29tZXRoaW5nIGluIHVzZXJzcGFjZSBwb2xsaW5nIG9uZQpvZiB0aG9z
ZSBmaWxlcyBvbiBhIHJlZ3VsYXIgYmFzaXM/CgpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
