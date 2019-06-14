Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A8A46BCC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 23:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1061F88EEB;
	Fri, 14 Jun 2019 21:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0016188EEB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 21:22:36 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B23172184C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 21:22:36 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id x2so4199912qtr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:22:36 -0700 (PDT)
X-Gm-Message-State: APjAAAXvn2pqqK7KwxVc79LFuafUM3viqUfFljCTFI7VzRaiJpmZpuFB
 97oFKwTdP9PdZC2+U87j3DUD5GNLQ5WHY13A4w==
X-Google-Smtp-Source: APXvYqzNJbYe9Hf7c+0iD9N4OS8doEL5ky1jWlor2hiXoOp3UjX+/VTzqER/hAJCRXvebm79s7rE7zrkKNB3hgYpFAA=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr17756398qtf.110.1560547355956; 
 Fri, 14 Jun 2019 14:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190610170440.28525-1-robh@kernel.org>
 <CAAObsKAvmtHSja+-XW5aWHiBNiKdanjN1OHKZTpx1O9v__E_Dw@mail.gmail.com>
In-Reply-To: <CAAObsKAvmtHSja+-XW5aWHiBNiKdanjN1OHKZTpx1O9v__E_Dw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 Jun 2019 15:22:24 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+DPmcBr5r_vB1ucRYR2MXey_jpGPTZ16Q9Ab0dx8u_uw@mail.gmail.com>
Message-ID: <CAL_Jsq+DPmcBr5r_vB1ucRYR2MXey_jpGPTZ16Q9Ab0dx8u_uw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/panfrost: Add support for mapping BOs on GPU page
 faults
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560547356;
 bh=y759MXrLi0/+oKLPnby0AZT+m5UidybXZvuFcjrIak0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=U9HQysCc05ESB0whFkS2jHa/mPl2diehm2QdvVyUo7Fmg4YlWhAdqLPYQCuJU8LEs
 z2sXK/a8yWv4wFFiKURCnSvrg0n5VKmjuHFHGc1PfVnD8ruFc7bS9WhBqqx5hXHdVh
 xwu+txUR4hUf5WsQlDa6KDl8O/gO+UzHEPmjb/eY=
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgNjo1NSBBTSBUb21ldSBWaXpvc28gPHRvbWV1QHRvbWV1
dml6b3NvLm5ldD4gd3JvdGU6Cj4KPiBPbiBNb24sIDEwIEp1biAyMDE5IGF0IDE5OjA2LCBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBUaGUgbWlkZ2FyZC9iaWZy
b3N0IEdQVXMgbmVlZCB0byBhbGxvY2F0ZSBHUFUgbWVtb3J5IHdoaWNoIGlzIGFsbG9jYXRlZAo+
ID4gb24gR1BVIHBhZ2UgZmF1bHRzIGFuZCBub3QgcGlubmVkIGluIG1lbW9yeS4gVGhlIHZlbmRv
ciBkcml2ZXIgY2FsbHMKPiA+IHRoaXMgZnVuY3Rpb25hbGl0eSBHUk9XX09OX0dQRi4KPiA+Cj4g
PiBUaGlzIGltcGxlbWVudGF0aW9uIGFzc3VtZXMgdGhhdCBCT3MgYWxsb2NhdGVkIHdpdGggdGhl
Cj4gPiBQQU5GUk9TVF9CT19OT01BUCBmbGFnIGFyZSBuZXZlciBtbWFwcGVkIG9yIGV4cG9ydGVk
LiBCb3RoIG9mIHRob3NlIG1heQo+ID4gYWN0dWFsbHkgd29yaywgYnV0IEknbSB1bnN1cmUgaWYg
dGhlcmUncyBzb21lIGludGVyYWN0aW9uIHRoZXJlLiBJdAo+ID4gd291bGQgY2F1c2UgdGhlIHdo
b2xlIG9iamVjdCB0byBiZSBwaW5uZWQgaW4gbWVtb3J5IHdoaWNoIHdvdWxkIGRlZmVhdAo+ID4g
dGhlIHBvaW50IG9mIHRoaXMuCj4gPgo+ID4gSXNzdWVzL3F1ZXN0aW9ucy90aG91Z2h0czoKPiA+
Cj4gPiBXaGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBpX21hcHBpbmcgYW5kIGZfbWFwcGlu
Zz8KPiA+Cj4gPiBXaGF0IGtpbmQgb2YgY2xlYW4tdXAgb24gY2xvc2UgaXMgbmVlZGVkPyBCYXNl
ZCBvbiB2Z2VtIGZhdWx0cywgdGhlcmUKPiA+IGRvZXNuJ3Qgc2VlbSB0byBiZSBhbnkgcmVmY291
bnRpbmcuIEFzc3VtZSB1c2Vyc3BhY2UgaXMgcmVzcG9uc2libGUgZm9yCj4gPiBub3QgZnJlZWlu
ZyB0aGUgQk8gd2hpbGUgYSBwYWdlIGZhdWx0IGNhbiBvY2N1cj8KPgo+IEFyZW4ndCB3ZSB0YWtp
bmcgYSByZWZlcmVuY2Ugb24gYWxsIEJPcyB0aGF0IGEgam9iIHJlbGF0ZXMgdG8gYW5kCj4gdW5y
ZWZlcmVuY2luZyB0aGVtIG9uY2UgdGhlIGpvYiBpcyBkb25lPyBJIHdvdWxkIHRoaW5rIHRoYXQg
dGhhdCdzCj4gZW5vdWdoLCBvciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKTm8sIEkgdGhpbmsg
d2UncmUgZmluZS4KCj4gPiBXaGF0IGFib3V0IGV2aWN0aW9ucz8gTmVlZCB0byBjYWxsIG1hcHBp
bmdfc2V0X3VuZXZpY3RhYmxlKCk/IE1heWJlIHdlCj4gPiB3YW50IHRoZXNlIHBhZ2VzIHRvIGJl
IHN3YXBwYWJsZSwgYnV0IHRoZW4gd2UgbmVlZCBzb21lIG5vdGlmaWNhdGlvbiB0bwo+ID4gdW5t
YXAgdGhlbS4KPgo+IEknbSBub3Qgc3VyZSB0aGVyZSdzIG11Y2ggcG9pbnQgaW4gc3dhcHBpbmcg
b3V0IHBhZ2VzIHdpdGggbGlmZXRpbWVzCj4gb2YgYSBmZXcgbWlsbGlzZWNvbmRzLgoKVGhlIGxp
ZmV0aW1lIGlzICpmb3JldmVyKiB0aG91Z2guIElmIHdlIGRvbid0IGFsbG93IHN3YXBwaW5nLCB0
aGVuIHRoZQpoZWFwIGlzIGdyb3cgb25seSB1bnRpbCB0aGUgRkQgaXMgY2xvc2VkLiBJSVJDLCB0
aGUgbWF4aW11bSBzaXplIGlzIG9uCnRoZSBvcmRlciBvZiAxR0IuIFNlZW1zIGxpa2UgeW91J2Qg
d2FudCB0byBzaHJpbmsgaXQgd2l0aCBzb21lCnRyaWdnZXIuCgpSb2IKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
