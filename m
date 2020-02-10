Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 292BE157182
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 10:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C926EB9B;
	Mon, 10 Feb 2020 09:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5806EB9B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 09:18:10 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so6600111wrh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 01:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fdq4V4NNkimlLI4jl7ariiYtfszcDU04PKAsj3DHA80=;
 b=DcaipFLM5NQnOep0rmE/Cp/7DcVe49qV8cqEVbBH69V94PG2cAydY6sYMUJLONioSM
 owmhPp0dXAPrvLIC0ywBKOaNCoRCsqcn6ZcuxaD6hATDvu0nNPDg/DhBC6vsSpFOViOy
 Y2m8Ig2HP+IbO6wM/JJIijll1biXf+VipvlPGQ1NI4ekZT+6+Snmsusj+BrHHmzTRSN5
 vRCGpMyn1IVPa4auZbBWuklxq3k5GKTQfSqX//mTZ/nqINCvyp0zVW5CVPnfp1DZSEhH
 c6JJN2BsnsEEDdQ4LiFyziTijZGnMotveIzualeSiPTsQYIBAOYPHaqP1GvJGm9yLlRE
 YBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fdq4V4NNkimlLI4jl7ariiYtfszcDU04PKAsj3DHA80=;
 b=BIBVcOQXIn0G2vYBb6mpC8a4h6FaaAVRiQvBqiCQpelsWLzRSk2Vraky6ts9XxG7Rs
 BVcgz758rFO2Ns+t8LEGxy8hMfWTT78tmWRFpMt+rltp9XTUZAcqFqTOxYaKh4oCbozR
 SytR1ZPSfTZOGM61aLM6TF5baX0IxEIHUT50VxjmDYuyHkoqr2/5q5m174MbHz+60sud
 nB/LgC7tYmKI8i9DW2GSGMERuVd7B2INeIonK5bLvkieQnMwx+SEi7eglrxyWX1QZDv7
 ZPHH2HyI0yErPG7uxZQPhUzcPSAttcq4i/m3MNX2B5k83/gApMjI6YBqAAXHsy2lZjTZ
 LtrA==
X-Gm-Message-State: APjAAAVOJKHUyvorbUIO/ucWiSvylKhRPvDXcOSMXeLPDjDIHgSaE+/M
 BFMcTdi3/NgVxp+N2TdTqelCJA==
X-Google-Smtp-Source: APXvYqzoWAZfQGXp3Zune4L3amEKH9Zel2n2L/0Luld6iqe1Wzp7b3/dD2Lju1+zmjlUsUfviaqmEw==
X-Received: by 2002:adf:f012:: with SMTP id j18mr831811wro.314.1581326288873; 
 Mon, 10 Feb 2020 01:18:08 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e17sm14703418wrn.62.2020.02.10.01.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 01:18:08 -0800 (PST)
Subject: Re: [PATCH] drm/bridge: tc358767: fix poll timeouts
To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20191209082707.24531-1-tomi.valkeinen@ti.com>
 <CAHQ1cqHJYrDzrK9AUOGdF8uggLNHOS1pfZfbJcicPnYBXzddsA@mail.gmail.com>
 <943cfd61-8756-a2f4-5659-1f0335c7ed1e@ti.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <eb7dde70-5dec-3d08-06db-abafa2f96e3e@baylibre.com>
Date: Mon, 10 Feb 2020 10:18:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <943cfd61-8756-a2f4-5659-1f0335c7ed1e@ti.com>
Content-Language: en-US
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
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Chris Healy <cphealy@gmail.com>, Jyri Sarha <jsarha@ti.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMvMDEvMjAyMCAxNDozMSwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gSGkgQW5kcnplaiwK
PiAKPiBPbiAwOS8xMi8yMDE5IDE2OjQ1LCBBbmRyZXkgU21pcm5vdiB3cm90ZToKPj4gKyBDaHJp
cyBIZWFseQo+Pgo+PiBPbiBNb24sIERlYyA5LCAyMDE5IGF0IDEyOjI3IEFNIFRvbWkgVmFsa2Vp
bmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+IHdyb3RlOgo+Pj4KPj4+IExpbmsgdHJhaW5pbmcg
ZmFpbHMgd2l0aDoKPj4+Cj4+PiDCoMKgIExpbmsgdHJhaW5pbmcgdGltZW91dCB3YWl0aW5nIGZv
ciBMVF9MT09QRE9ORSEKPj4+IMKgwqAgbWFpbiBsaW5rIGVuYWJsZSBlcnJvcjogLTExMAo+Pj4K
Pj4+IFRoaXMgaXMgY2F1c2VkIGJ5IHRvbyB0aWdodCB0aW1lb3V0cywgd2hpY2ggd2VyZSBjaGFu
Z2VkIHJlY2VudGx5IGluCj4+PiBhYTkyMjEzZjM4OGIgKCJkcm0vYnJpZGdlOiB0YzM1ODc2Nzog
U2ltcGxpZnkgcG9sbGluZyBpbiB0Y19saW5rX3RyYWluaW5nKCkiKS4KPj4+Cj4+PiBXaXRoIGEg
cXVpY2sgZ2xhbmNlLCB0aGUgY29tbWl0IGRvZXMgbm90IGNoYW5nZSB0aGUgdGltZW91dHMuIEhv
d2V2ZXIsCj4+PiB0aGUgbWV0aG9kIG9mIGRlbGF5aW5nL3NsZWVwaW5nIGlzIGRpZmZlcmVudCwg
YW5kIGFzIHRoZSB0aW1lb3V0IGluIHRoZQo+Pj4gcHJldmlvdXMgaW1wbGVtZW50YXRpb24gd2Fz
IG5vdCBleHBsaWNpdCwgdGhlIG5ldyB2ZXJzaW9uIGluIHByYWN0aWNlCj4+PiBoYXMgbXVjaCB0
aWdodGVyIHRpbWVvdXQuCj4+Pgo+Pj4gVGhlIHNhbWUgY2hhbmdlIHdhcyBtYWRlIHRvIG90aGVy
IHBhcnRzIGluIHRoZSBkcml2ZXIsIGJ1dCB0aGUgbGluawo+Pj4gdHJhaW5pbmcgdGltZW91dCBp
cyB0aGUgb25seSBvbmUgSSBoYXZlIHNlZW4gY2F1c2luZyBpc3N1ZXMuCj4+PiBOZXZlcnRoZWxl
c3MsIDEgdXMgc2xlZXAgaXMgbm90IHZlcnkgc2FuZSwgYW5kIHRoZSB0aW1lb3V0cyBsb29rIHBy
ZXR0eQo+Pj4gdGlnaHQsIHNvIGxldHMgZml4IGFsbCB0aGUgdGltZW91dHMuCj4+Pgo+Pj4gT25l
IGV4Y2VwdGlvbiB3YXMgdGhlIGF1eCBidXN5IHBvbGwsIHdoZXJlIHRoZSBwb2xsIHNsZWVwIHdh
cyBtdWNoCj4+PiBsb25nZXIgdGhhbiBuZWNlc3NhcnkgKG9yIG9wdGltYWwpLgo+Pj4KPj4+IEkg
bWVhc3VyZWQgdGhlIHRpbWVzIG9uIG15IHNldHVwLCBhbmQgbm93IHRoZSBzbGVlcCB0aW1lcyBh
cmUgc2V0IHRvCj4+PiBzdWNoIHZhbHVlcyB0aGF0IHRoZXkgcmVzdWx0IGluIG11bHRpcGxlIGxv
b3BzLCBidXQgbm90IHRvbyBtYW55IChzYXksCj4+PiA1LTEwIGxvb3BzKS4gVGhlIHRpbWVvdXRz
IHdlcmUgYWxsIGluY3JlYXNlZCB0byAxMDBtcywgd2hpY2ggc2hvdWxkIGJlCj4+PiBtb3JlIHRo
YW4gZW5vdWdoIGZvciBhbGwgb2YgdGhlc2UsIGJ1dCBpbiBjYXNlIG9mIGJhZCBlcnJvcnMsIHNo
b3VsZG4ndAo+Pj4gc3RvcCB0aGUgZHJpdmVyIGFzIG11bHRpLXNlY29uZCB0aW1lb3V0cyBjb3Vs
ZCBkby4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWlu
ZW5AdGkuY29tPgo+Pj4gRml4ZXM6IGFhOTIyMTNmMzg4YiAoImRybS9icmlkZ2U6IHRjMzU4NzY3
OiBTaW1wbGlmeSBwb2xsaW5nIGluIHRjX2xpbmtfdHJhaW5pbmcoKSIpCj4+Cj4+IFRlc3RlZCBv
biBSRFUyIHdpdGggVEMzNTg3NjcvZURQIHBhbmVsLCBkb2Vzbid0IHNlZW0gdG8gYnJlYWsgYW55
dGhpbmcKPj4gdGhlcmUsIHNvOgo+Pgo+PiBUZXN0ZWQtYnk6IEFuZHJleSBTbWlybm92IDxhbmRy
ZXcuc21pcm5vdkBnbWFpbC5jb20+Cj4gCj4gQW5kcnplaiwgY2FuIHlvdSBwaWNrIHRoaXMgdXAg
Zm9yIC1maXhlcz8KPiAKPiDCoFRvbWkKPiAKClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8
bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CgpBcHBsaWVkIHRvIGRybS1taXNjLWZpeGVzCgpOZWls
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
