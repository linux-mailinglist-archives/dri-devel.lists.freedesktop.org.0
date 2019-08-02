Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8527F21F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 11:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F796ED86;
	Fri,  2 Aug 2019 09:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF066ED86
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 09:45:25 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id n5so77594458otk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 02:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gwtot9TeklRqzA2mlAgP0qsNYR8mpKfqgQpyD7Xv9xQ=;
 b=AAU7mXsjuDJphXJ5E67NVGc9XSvRhxdLAwvOz/5rtS0CNMBlhOnX05v0pT20FomIfp
 9uHJ9LBNYUx0YqLWY6jcJkOQxIaDE6e457kPe7Rru6GPkWL+vZxz6Y7HBcS7aSID7j/U
 8UMFlRxKc4gIRMVTEOXqaA1WcJxOXYSrOp+VkVS8+F8NNPzC68u8EKeGnAPUmH+yDWyu
 qUQJHaCrNLQvYqfRTOgxKVRGSvG1edYR7sYzkTDEVGbvFrGFs9S/mYS+NTWvAh2JKyF+
 9WvM5dTsrIPrqTF5KQ54E3USsAyDvXCkqcdgB+DMRbZZPCgHUpm1BHatoNvMNMZbILO9
 oMNA==
X-Gm-Message-State: APjAAAVshVrn04Z6kIrTr1YYu4iaq09pxxL8/GSfCmiWQq9N0DG7ZwW/
 DRzOT5jdTxNYvljmNrjnTbZcQ+o/RDqbeGv3Cv8=
X-Google-Smtp-Source: APXvYqx6atiJUG/sjs4BaoFmi9Wh4Qwt4Vg1uYeBCLXFTQH2NdA5pxfrEzBWroGoy1Iiodaypgy51Sk3SvFRrEeldqM=
X-Received: by 2002:a05:6830:ce:: with SMTP id
 x14mr84006580oto.188.1564739124649; 
 Fri, 02 Aug 2019 02:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
 <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uEZaFEcs90+U3vzgH69+95BD58Dt=J=gT6=n6oah5Nbyg@mail.gmail.com>
In-Reply-To: <CAKMK7uEZaFEcs90+U3vzgH69+95BD58Dt=J=gT6=n6oah5Nbyg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 2 Aug 2019 11:45:13 +0200
Message-ID: <CAKMK7uH38rxyTyuYRGJ6NBejyUxQ6Qvr1CdjH2kpXiq+3-=t8Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
To: Brian Starkey <Brian.Starkey@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Gwtot9TeklRqzA2mlAgP0qsNYR8mpKfqgQpyD7Xv9xQ=;
 b=OUgcLNqK0s105ZDr95woraa74qxDrAheewlOE/XzMooHzoMBTbOARD5eNRHUSiMzcq
 IhBwJjTC9G7fBq9w/3UeeyRGEAdquOmn9Os9vU6NAyAtgvlfkjPl5wARtAnfrlzi0Zzz
 ZKHDCHSnQDuSytpcS279y89/7KWtlagEAyreQ=
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMiwgMjAxOSBhdCAxMTo0MyBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gRnJpLCBBdWcgMiwgMjAxOSBhdCAxMToyOSBBTSBCcmlhbiBT
dGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIExvd3J5LAo+
ID4KPiA+IE9uIFRodSwgQXVnIDAxLCAyMDE5IGF0IDA2OjM0OjA4QU0gKzAwMDAsIExvd3J5IExp
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiA+IEhpIEJyaWFuLAo+ID4gPgo+ID4g
PiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAwOToyMDowNFBNICswODAwLCBCcmlhbiBTdGFya2V5
IHdyb3RlOgo+ID4gPiA+IEhpIExvd3J5LAo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzIGZvciB0aGlz
IGNsZWFudXAuCj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAxMTowNDo0
NUFNICswMDAwLCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+
ID4gRHVyaW5nIGl0IHNpZ25hbHMgdGhlIGNvbXBsZXRpb24gb2YgYSB3cml0ZWJhY2sgam9iLCBh
ZnRlciByZWxlYXNpbmcKPiA+ID4gPiA+IHRoZSBvdXRfZmVuY2UsIHdlJ2QgY2xlYXIgdGhlIHBv
aW50ZXIuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQ2hlY2sgaWYgZmVuY2UgbGVmdCBvdmVyIGluIGRy
bV93cml0ZWJhY2tfY2xlYW51cF9qb2IoKSwgcmVsZWFzZSBpdC4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5s
aUBhcm0uY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV93
cml0ZWJhY2suYyB8IDIzICsrKysrKysrKysrKysrKy0tLS0tLS0tCj4gPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jCj4gPiA+ID4gPiBpbmRleCBmZjEzOGI2Li40M2Q5
ZTNiIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2su
Ywo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYwo+ID4gPiA+
ID4gQEAgLTMyNCw2ICszMjQsOSBAQCB2b2lkIGRybV93cml0ZWJhY2tfY2xlYW51cF9qb2Ioc3Ry
dWN0IGRybV93cml0ZWJhY2tfam9iICpqb2IpCj4gPiA+ID4gPiAgIGlmIChqb2ItPmZiKQo+ID4g
PiA+ID4gICAgICAgICAgIGRybV9mcmFtZWJ1ZmZlcl9wdXQoam9iLT5mYik7Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gKyBpZiAoam9iLT5vdXRfZmVuY2UpCj4gPiA+ID4KPiA+ID4gPiBJJ20gdGhpbmtp
bmcgaXQgbWlnaHQgYmUgYSBnb29kIGlkZWEgdG8gc2lnbmFsIHRoZSBmZW5jZSB3aXRoIGFuIGVy
cm9yCj4gPiA+ID4gaGVyZSwgaWYgaXQncyBub3QgYWxyZWFkeSBzaWduYWxlZC4gT3RoZXJ3aXNl
LCBpZiB0aGVyZSdzIHNvbWVvbmUKPiA+ID4gPiB3YWl0aW5nICh3aGljaCB0aGVyZSBzaG91bGRu
J3QgYmUpLCB0aGV5J3JlIGdvaW5nIHRvIGJlIHdhaXRpbmcgYSB2ZXJ5Cj4gPiA+ID4gbG9uZyB0
aW1lIDotKQo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+IC1Ccmlhbgo+ID4gPiA+Cj4g
PiA+IEhlcmUgaXQgaGFwcGVuZWQgYXQgYXRvbWljX2NoZWNrIGZhaWxlZCBhbmQgdGVzdCBvbmx5
IGNvbW1pdC4gRm9yIGJvdGgKPiA+ID4gY2FzZXMsIHRoZSBjb21taXQgaGFzIGJlZW4gZHJvcHBl
ZCBhbmQgaXQncyBvbmx5IGEgY2xlYW4gdXAuIFNvIGhlcmUgYmV0dGVyCj4gPiA+IG5vdCBiZSB0
cmVhdGVkIGFzIGFuIGVycm9yIGNhc2U6KQo+ID4KPiA+IElmIGFueW9uZSBlbHNlIGhhcyBhIHJl
ZmVyZW5jZSBvbiB0aGUgZmVuY2UsIHRoZW4gSU1PIGl0IGFic29sdXRlbHkgaXMKPiA+IGFuIGVy
cm9yIHRvIHJlYWNoIHRoaXMgcG9pbnQgd2l0aG91dCB0aGUgZmVuY2UgYmVpbmcgc2lnbmFsZWQg
LQo+ID4gYmVjYXVzZSBpdCBtZWFucyB0aGF0IHRoZSBmZW5jZSB3aWxsIG5ldmVyIGJlIHNpZ25h
bGVkLgo+ID4KPiA+IEkgZG9uJ3QgdGhpbmsgdGhlIEFQSSBnaXZlcyB5b3UgYSB3YXkgdG8gY2hl
Y2sgaWYgdGhpcyBpcyB0aGUgbGFzdAo+ID4gcmVmZXJlbmNlLCBzbyBpdCdzIHNhZmVzdCB0byBq
dXN0IG1ha2Ugc3VyZSB0aGUgZmVuY2UgaXMgc2lnbmFsbGVkCj4gPiBiZWZvcmUgZHJvcHBpbmcg
dGhlIHJlZmVyZW5jZS4KPiA+Cj4gPiBJdCBqdXN0IGZlZWxzIHdyb25nIHRvIG1lIHRvIGhhdmUg
dGhlIHBvc3NpYmlsaXR5IG9mIGEgZGFuZ2xpbmcgZmVuY2UKPiA+IHdoaWNoIGlzIG5ldmVyIGdv
aW5nIHRvIGdldCBzaWduYWxsZWQ7IGFuZCBpdCdzIGFuIGVhc3kgZGVmZW5zaXZlIHN0ZXAKPiA+
IHRvIG1ha2Ugc3VyZSBpdCBjYW4gbmV2ZXIgaGFwcGVuLgo+ID4KPiA+IEkga25vdyBpdCBfc2hv
dWxkbid0XyBoYXBwZW4sIGJ1dCB3ZSBvZnRlbiBwdXQgaW4gaGFuZGxpbmcgZm9yIGNhc2VzCj4g
PiB3aGljaCBzaG91bGRuJ3QgaGFwcGVuLCBiZWNhdXNlIHRoZXkgZnJlcXVlbnRseSBkbyBoYXBw
ZW4gOi0pCj4KPiBXZSdyZSBub3QgYXMgcGFyYW5vaWQgd2l0aCB0aGUgdmJsYW5rIGZlbmNlcyBl
aXRoZXIsIHNvIG5vdCBzdXJlIHdoeQo+IHdlIG5lZWQgdG8gYmUgdGhpcyBwYXJhbm9pZCB3aXRo
IHdyaXRlYmFjayBmZW5jZXMuIElmIHlvdXIgZHJpdmVyCj4gZ3JhYnMgYW55dGhpbmcgZnJvbSB0
aGUgYXRvbWljIHN0YXRlIGluIC0+YXRvbWljX2NoZWNrIGl0J3MgYnVnZ3kKPiBhbnl3YXkuCj4K
PiBJZiB5b3Ugd2FudCB0byBmaXggdGhpcyBwcm9wZXJseSBJIHRoaW5rIHdlIG5lZWQgdG8gbW92
ZSB0aGUgY2FsbCB0bwo+IHByZXBhcmVfc2lnbmFsbGluZygpIGluIGJldHdlZW4gYXRvbWljX2No
ZWNrIGFuZCBhdG9taWNfY29tbWl0LiBUaGVuIEkKPiB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBh
bHNvIGZvcmNlLWNvbXBsZXRlIHRoZSBmZW5jZSBvbiBlcnJvciAuLi4KPgo+ID4gPiBTaW5jZSBm
b3IgdXNlcnNwYWNlLCBpdCBzaG91bGQgaGF2ZSBiZWVuIGZhaWxlZCBvciBhIHRlc3Qgb25seSBj
YXNlLCBzbwo+ID4gPiB3cml0ZWJhY2UgZmVuY2Ugc2hvdWxkIG5vdCBiZSBzaWduYWxlZC4KPiA+
Cj4gPiBJdCdzIG5vdCBvbmx5IHVzZXJzcGFjZSB0aGF0IGNhbiB3YWl0IG9uIGZlbmNlcyAoYW5k
IGluIGZhY3QgdGhpcwo+ID4gZmVuY2Ugd2lsbCBuZXZlciBldmVuIHJlYWNoIHVzZXJzcGFjZSBp
ZiB0aGUgY29tbWl0IGZhaWxzKSwgdGhlIGRyaXZlcgo+ID4gbWF5IGhhdmUgdGFrZW4gYSBjb3B5
IHRvIHVzZSBmb3IgInNvbWV0aGluZyIuCgpJIGZvcmdvdCB0byBhZGQ6IHlvdSBjYW4gY2hlY2sg
dGhpcyBieSBsb29raW5nIGF0IHRoZSBmZW5jZSByZWZlcmVuY2UKY291bnQuIEEgV0FSTl9PTiBp
ZiB0aGF0J3MgbW9yZSB0aGFuIDEgb24gY2xlYW51cCAoYnV0IGFsc28gZm9yIHRoZQpvdXQgZmVu
Y2VzKSBjb3VsZCBiZSBhIG5pY2UgYWRkaXRpb24uCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4
IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
