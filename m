Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D58B22CB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 17:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952086F3E2;
	Fri, 13 Sep 2019 15:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343086F3E1;
 Fri, 13 Sep 2019 15:01:15 +0000 (UTC)
Received: from localhost (195-23-252-136.net.novis.pt [195.23.252.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58CB82054F;
 Fri, 13 Sep 2019 15:01:14 +0000 (UTC)
Date: Fri, 13 Sep 2019 11:01:11 -0400
From: Sasha Levin <sashal@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation
 failures
Message-ID: <20190913150111.GI1546@sasha-vm>
References: <20190913130559.669563815@linuxfoundation.org>
 <20190913130606.981926197@linuxfoundation.org>
 <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com>
 <20190913144627.GH1546@sasha-vm>
 <20190913145456.GA456842@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913145456.GA456842@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568386875;
 bh=d5LyY7lEBC5SV24eCUuLaBZ+kemQPetOKLdbtly1Mhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SyzHJxtY+DiAeTBBFqnKKVdTlRNhYA5/YA+nAgMJgirE71hpMhWU6ebQ/kg8+vWpM
 4cnlDLPdlrd6s0JsBhlc8hB6ZKcnhpr3l6Md54QBn7deDXGP8L5YjC99MPnOAPpXiM
 ZPbSRFuUWlSg3Zt0um7QIQ1FX5UrdNqPdKqsjeoc=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDM6NTQ6NTZQTSArMDEwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTA6NDY6MjdBTSAtMDQwMCwgU2Fz
aGEgTGV2aW4gd3JvdGU6Cj4+IE9uIEZyaSwgU2VwIDEzLCAyMDE5IGF0IDA5OjMzOjM2QU0gLTA0
MDAsIElsaWEgTWlya2luIHdyb3RlOgo+PiA+IEhpIEdyZWcsCj4+ID4KPj4gPiBUaGlzIGZlZWxz
IGxpa2UgaXQncyBtaXNzaW5nIGEgRnJvbTogbGluZS4KPj4gPgo+PiA+IGNvbW1pdCBiNTEzYTE4
Y2YxZDcwNWJkMDRlZmQ5MWM0MTdlNzllNDkzOGJlMDkzCj4+ID4gQXV0aG9yOiBMeXVkZSBQYXVs
IDxseXVkZUByZWRoYXQuY29tPgo+PiA+IERhdGU6ICAgTW9uIEphbiAyOCAxNjowMzo1MCAyMDE5
IC0wNTAwCj4+ID4KPj4gPiAgICBkcm0vbm91dmVhdTogRG9uJ3QgV0FSTl9PTiBWQ1BJIGFsbG9j
YXRpb24gZmFpbHVyZXMKPj4gPgo+PiA+IElzIHRoaXMgYW4gYXJ0aWZhY3Qgb2YgeW91ciBub3Rp
ZmljYXRpb24tb2YtcGF0Y2hlcyBwcm9jZXNzIGFuZCBJCj4+ID4gbmV2ZXIgbm90aWNlZCBiZWZv
cmUsIG9yIHdhcyB0aGUgcGF0Y2ggaW5nZXN0ZWQgaW5jb3JyZWN0bHk/Cj4+Cj4+IEl0IHdhcyBh
bHdheXMgbGlrZSB0aGlzIGZvciBwYXRjaGVzIHRoYXQgY2FtZSB0aHJvdWdoIG1lLiBHcmVnJ3Mg
c2NyaXB0Cj4+IGdlbmVyYXRlcyBhbiBleHBsaWNpdCAiRnJvbToiIGxpbmUgaW4gdGhlIHBhdGNo
LCBidXQgSSBuZXZlciBzYXcgdGhlCj4+IHZhbHVlIGluIHRoYXQgc2luY2UgZ2l0IGRvZXMgdGhl
IHJpZ2h0IHRoaW5nIGJ5IGxvb2tpbmcgYXQgdGhlICJGcm9tOiIKPj4gbGluZSBpbiB0aGUgbWFp
bCBoZWFkZXIuCj4+Cj4+IFRoZSByaWdodCB0aGluZyBpcyBiZWluZyBkb25lIGluIHN0YWJsZS1y
YyBhbmQgZm9yIHRoZSByZWxlYXNlcy4gRm9yCj4+IHlvdXIgZXhhbXBsZSBoZXJlLCB0aGlzIGlz
IGhvdyBpdCBsb29rcyBsaWtlIGluIHRoZSBzdGFibGUtcmMgdHJlZToKPj4KPj4gY29tbWl0IGJk
Y2M4ODViZTY4Mjg5YTM3ZDBkMDYzY2Q5NDM5MGRhODFmZDgxNzgKPj4gQXV0aG9yOiAgICAgTHl1
ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPj4gQXV0aG9yRGF0ZTogTW9uIEphbiAyOCAxNjow
Mzo1MCAyMDE5IC0wNTAwCj4+IENvbW1pdDogICAgIEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4+IENvbW1pdERhdGU6IEZyaSBTZXAgMTMgMTQ6MDU6Mjkg
MjAxOSArMDEwMAo+Pgo+PiAgICBkcm0vbm91dmVhdTogRG9uJ3QgV0FSTl9PTiBWQ1BJIGFsbG9j
YXRpb24gZmFpbHVyZXMKPgo+WWVhaCwgd2Ugc2hvdWxkIGZpeCB5b3VyIHNjcmlwdHMgdG8gcHV0
IHRoZSBleHBsaWNpdCBGcm9tOiBsaW5lIGluIGhlcmUKPmFzIHdlIGFyZSBkZWFsaW5nIHdpdGgg
cGF0Y2hlcyBpbiB0aGlzIGZvcm1hdCBhbmQgaXQgY2F1c2VzIGNvbmZ1c2lvbiBhdAo+dGltZXMg
KGxpa2Ugbm93LikgIEl0J3Mgbm90IHRoZSBmaXJzdCB0aW1lIGFuZCB0aGF0J3Mgd2h5IEkgYWRk
ZWQgdGhvc2UKPmxpbmVzIHRvIHRoZSBwYXRjaGVzLgoKSGVoLCBkaWRuJ3QgdGhpbmsgYW55b25l
IGNhcmVkIGFib3V0IHRoaXMgc2NlbmFyaW8gZm9yIHRoZSBzdGFibGUtcmMKcGF0Y2hlcy4KCkkn
bGwgZ28gYWRkIGl0LgoKQnV0Li4uIHdoeSBkbyB5b3UgYWN0dWFsbHkgY2FyZT8KCi0tClRoYW5r
cywKU2FzaGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
