Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3978B22B3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 16:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A05E6F3DC;
	Fri, 13 Sep 2019 14:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1886D6F3DC;
 Fri, 13 Sep 2019 14:54:59 +0000 (UTC)
Received: from localhost (unknown [104.132.45.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74F4320830;
 Fri, 13 Sep 2019 14:54:58 +0000 (UTC)
Date: Fri, 13 Sep 2019 15:54:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation
 failures
Message-ID: <20190913145456.GA456842@kroah.com>
References: <20190913130559.669563815@linuxfoundation.org>
 <20190913130606.981926197@linuxfoundation.org>
 <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com>
 <20190913144627.GH1546@sasha-vm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913144627.GH1546@sasha-vm>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568386498;
 bh=I7N/O9xEYf2S+/1euHytIwV3P/IP5katELShfV4ians=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lqP1Wlpgl1cMbfKyUFPqE69Wyp3hjAEy9a+k4Npoq58NLF4T+5sA7hQgFJ663QAzU
 lyBgII60a9xGRS5jgWgDnhaOFwixdpzkmW2nWAeaczl2D/zBbbZXXm2UUP+nT1X2Cz
 tB4lAE0yZ+ub0QARhDWbUPMMk3U40fPlP5sVCK/M=
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

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTA6NDY6MjdBTSAtMDQwMCwgU2FzaGEgTGV2aW4gd3Jv
dGU6Cj4gT24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDk6MzM6MzZBTSAtMDQwMCwgSWxpYSBNaXJr
aW4gd3JvdGU6Cj4gPiBIaSBHcmVnLAo+ID4gCj4gPiBUaGlzIGZlZWxzIGxpa2UgaXQncyBtaXNz
aW5nIGEgRnJvbTogbGluZS4KPiA+IAo+ID4gY29tbWl0IGI1MTNhMThjZjFkNzA1YmQwNGVmZDkx
YzQxN2U3OWU0OTM4YmUwOTMKPiA+IEF1dGhvcjogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNv
bT4KPiA+IERhdGU6ICAgTW9uIEphbiAyOCAxNjowMzo1MCAyMDE5IC0wNTAwCj4gPiAKPiA+ICAg
IGRybS9ub3V2ZWF1OiBEb24ndCBXQVJOX09OIFZDUEkgYWxsb2NhdGlvbiBmYWlsdXJlcwo+ID4g
Cj4gPiBJcyB0aGlzIGFuIGFydGlmYWN0IG9mIHlvdXIgbm90aWZpY2F0aW9uLW9mLXBhdGNoZXMg
cHJvY2VzcyBhbmQgSQo+ID4gbmV2ZXIgbm90aWNlZCBiZWZvcmUsIG9yIHdhcyB0aGUgcGF0Y2gg
aW5nZXN0ZWQgaW5jb3JyZWN0bHk/Cj4gCj4gSXQgd2FzIGFsd2F5cyBsaWtlIHRoaXMgZm9yIHBh
dGNoZXMgdGhhdCBjYW1lIHRocm91Z2ggbWUuIEdyZWcncyBzY3JpcHQKPiBnZW5lcmF0ZXMgYW4g
ZXhwbGljaXQgIkZyb206IiBsaW5lIGluIHRoZSBwYXRjaCwgYnV0IEkgbmV2ZXIgc2F3IHRoZQo+
IHZhbHVlIGluIHRoYXQgc2luY2UgZ2l0IGRvZXMgdGhlIHJpZ2h0IHRoaW5nIGJ5IGxvb2tpbmcg
YXQgdGhlICJGcm9tOiIKPiBsaW5lIGluIHRoZSBtYWlsIGhlYWRlci4KPiAKPiBUaGUgcmlnaHQg
dGhpbmcgaXMgYmVpbmcgZG9uZSBpbiBzdGFibGUtcmMgYW5kIGZvciB0aGUgcmVsZWFzZXMuIEZv
cgo+IHlvdXIgZXhhbXBsZSBoZXJlLCB0aGlzIGlzIGhvdyBpdCBsb29rcyBsaWtlIGluIHRoZSBz
dGFibGUtcmMgdHJlZToKPiAKPiBjb21taXQgYmRjYzg4NWJlNjgyODlhMzdkMGQwNjNjZDk0Mzkw
ZGE4MWZkODE3OAo+IEF1dGhvcjogICAgIEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4g
QXV0aG9yRGF0ZTogTW9uIEphbiAyOCAxNjowMzo1MCAyMDE5IC0wNTAwCj4gQ29tbWl0OiAgICAg
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBDb21taXRE
YXRlOiBGcmkgU2VwIDEzIDE0OjA1OjI5IDIwMTkgKzAxMDAKPiAKPiAgICBkcm0vbm91dmVhdTog
RG9uJ3QgV0FSTl9PTiBWQ1BJIGFsbG9jYXRpb24gZmFpbHVyZXMKClllYWgsIHdlIHNob3VsZCBm
aXggeW91ciBzY3JpcHRzIHRvIHB1dCB0aGUgZXhwbGljaXQgRnJvbTogbGluZSBpbiBoZXJlCmFz
IHdlIGFyZSBkZWFsaW5nIHdpdGggcGF0Y2hlcyBpbiB0aGlzIGZvcm1hdCBhbmQgaXQgY2F1c2Vz
IGNvbmZ1c2lvbiBhdAp0aW1lcyAobGlrZSBub3cuKSAgSXQncyBub3QgdGhlIGZpcnN0IHRpbWUg
YW5kIHRoYXQncyB3aHkgSSBhZGRlZCB0aG9zZQpsaW5lcyB0byB0aGUgcGF0Y2hlcy4KCnRoYW5r
cywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
