Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C454B230D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 17:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2576F3EB;
	Fri, 13 Sep 2019 15:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173026F3E9;
 Fri, 13 Sep 2019 15:10:54 +0000 (UTC)
Received: from localhost (unknown [104.132.45.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82D4620640;
 Fri, 13 Sep 2019 15:10:53 +0000 (UTC)
Date: Fri, 13 Sep 2019 16:10:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation
 failures
Message-ID: <20190913151051.GB458191@kroah.com>
References: <20190913130559.669563815@linuxfoundation.org>
 <20190913130606.981926197@linuxfoundation.org>
 <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com>
 <20190913144627.GH1546@sasha-vm>
 <20190913145456.GA456842@kroah.com>
 <20190913150111.GI1546@sasha-vm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913150111.GI1546@sasha-vm>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568387454;
 bh=mlOuDQQnvN+0T53mUIADRJSv6FqN9GNg5U8ukgfoLYU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=onxugGw0+FvpKFku4WKZrbIlbGYrWkXA+zSq8pMPrkT4Zms2Ird03beT05J2Mnwyd
 ulhJV2LK1wFf7IPUqO6TL3N6lYuvtTORYx6hC+4Bx2bnaSh+Qf6bIfCeRnDXUfBoM0
 s+FSQWC4H793K2MM7LDjPgnhJJUccucswMqVYxrQ=
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "# 3.9+" <stable@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTE6MDE6MTFBTSAtMDQwMCwgU2FzaGEgTGV2aW4gd3Jv
dGU6Cj4gT24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDM6NTQ6NTZQTSArMDEwMCwgR3JlZyBLcm9h
aC1IYXJ0bWFuIHdyb3RlOgo+ID4gT24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTA6NDY6MjdBTSAt
MDQwMCwgU2FzaGEgTGV2aW4gd3JvdGU6Cj4gPiA+IE9uIEZyaSwgU2VwIDEzLCAyMDE5IGF0IDA5
OjMzOjM2QU0gLTA0MDAsIElsaWEgTWlya2luIHdyb3RlOgo+ID4gPiA+IEhpIEdyZWcsCj4gPiA+
ID4KPiA+ID4gPiBUaGlzIGZlZWxzIGxpa2UgaXQncyBtaXNzaW5nIGEgRnJvbTogbGluZS4KPiA+
ID4gPgo+ID4gPiA+IGNvbW1pdCBiNTEzYTE4Y2YxZDcwNWJkMDRlZmQ5MWM0MTdlNzllNDkzOGJl
MDkzCj4gPiA+ID4gQXV0aG9yOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+ID4gPiA+
IERhdGU6ICAgTW9uIEphbiAyOCAxNjowMzo1MCAyMDE5IC0wNTAwCj4gPiA+ID4KPiA+ID4gPiAg
ICBkcm0vbm91dmVhdTogRG9uJ3QgV0FSTl9PTiBWQ1BJIGFsbG9jYXRpb24gZmFpbHVyZXMKPiA+
ID4gPgo+ID4gPiA+IElzIHRoaXMgYW4gYXJ0aWZhY3Qgb2YgeW91ciBub3RpZmljYXRpb24tb2Yt
cGF0Y2hlcyBwcm9jZXNzIGFuZCBJCj4gPiA+ID4gbmV2ZXIgbm90aWNlZCBiZWZvcmUsIG9yIHdh
cyB0aGUgcGF0Y2ggaW5nZXN0ZWQgaW5jb3JyZWN0bHk/Cj4gPiA+IAo+ID4gPiBJdCB3YXMgYWx3
YXlzIGxpa2UgdGhpcyBmb3IgcGF0Y2hlcyB0aGF0IGNhbWUgdGhyb3VnaCBtZS4gR3JlZydzIHNj
cmlwdAo+ID4gPiBnZW5lcmF0ZXMgYW4gZXhwbGljaXQgIkZyb206IiBsaW5lIGluIHRoZSBwYXRj
aCwgYnV0IEkgbmV2ZXIgc2F3IHRoZQo+ID4gPiB2YWx1ZSBpbiB0aGF0IHNpbmNlIGdpdCBkb2Vz
IHRoZSByaWdodCB0aGluZyBieSBsb29raW5nIGF0IHRoZSAiRnJvbToiCj4gPiA+IGxpbmUgaW4g
dGhlIG1haWwgaGVhZGVyLgo+ID4gPiAKPiA+ID4gVGhlIHJpZ2h0IHRoaW5nIGlzIGJlaW5nIGRv
bmUgaW4gc3RhYmxlLXJjIGFuZCBmb3IgdGhlIHJlbGVhc2VzLiBGb3IKPiA+ID4geW91ciBleGFt
cGxlIGhlcmUsIHRoaXMgaXMgaG93IGl0IGxvb2tzIGxpa2UgaW4gdGhlIHN0YWJsZS1yYyB0cmVl
Ogo+ID4gPiAKPiA+ID4gY29tbWl0IGJkY2M4ODViZTY4Mjg5YTM3ZDBkMDYzY2Q5NDM5MGRhODFm
ZDgxNzgKPiA+ID4gQXV0aG9yOiAgICAgTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+
ID4gQXV0aG9yRGF0ZTogTW9uIEphbiAyOCAxNjowMzo1MCAyMDE5IC0wNTAwCj4gPiA+IENvbW1p
dDogICAgIEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4g
PiA+IENvbW1pdERhdGU6IEZyaSBTZXAgMTMgMTQ6MDU6MjkgMjAxOSArMDEwMAo+ID4gPiAKPiA+
ID4gICAgZHJtL25vdXZlYXU6IERvbid0IFdBUk5fT04gVkNQSSBhbGxvY2F0aW9uIGZhaWx1cmVz
Cj4gPiAKPiA+IFllYWgsIHdlIHNob3VsZCBmaXggeW91ciBzY3JpcHRzIHRvIHB1dCB0aGUgZXhw
bGljaXQgRnJvbTogbGluZSBpbiBoZXJlCj4gPiBhcyB3ZSBhcmUgZGVhbGluZyB3aXRoIHBhdGNo
ZXMgaW4gdGhpcyBmb3JtYXQgYW5kIGl0IGNhdXNlcyBjb25mdXNpb24gYXQKPiA+IHRpbWVzIChs
aWtlIG5vdy4pICBJdCdzIG5vdCB0aGUgZmlyc3QgdGltZSBhbmQgdGhhdCdzIHdoeSBJIGFkZGVk
IHRob3NlCj4gPiBsaW5lcyB0byB0aGUgcGF0Y2hlcy4KPiAKPiBIZWgsIGRpZG4ndCB0aGluayBh
bnlvbmUgY2FyZWQgYWJvdXQgdGhpcyBzY2VuYXJpbyBmb3IgdGhlIHN0YWJsZS1yYwo+IHBhdGNo
ZXMuCj4gCj4gSSdsbCBnbyBhZGQgaXQuCj4gCj4gQnV0Li4uIHdoeSBkbyB5b3UgYWN0dWFsbHkg
Y2FyZT8KCk9uIHRoZSBlbWFpbHMgd2Ugc2VuZCBvdXQsIGl0IGhhcyBpbnByb3BlciBhdXRob3Ig
aW5mb3JtYXRpb24gd2hpY2ggY2FuCmNhdXNlIGNvbmZ1c2lvbiB0aGF0IHRoZSBzZW5kZXIgb2Yg
dGhlIGVtYWlsIChpLmUuIG1lKSBpcyBzb21laG93IHNheWluZwp0aGF0IHRoZXkgYXJlIHRoZSBh
dXRob3Igb2YgdGhlIHBhdGNoLgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
