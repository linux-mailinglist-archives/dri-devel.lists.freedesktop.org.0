Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D7BE132A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 09:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859C86E978;
	Wed, 23 Oct 2019 07:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779616E978
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 07:32:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o28so20821047wro.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 00:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VYLri5pd2Odae8b/vTSpf0oA1mpoNknFR1w47s8PBLE=;
 b=OGEqIDxl8AOf+4AW6VQRMG9yW0HCRCLwOkCjaX7hcupeITjEAGvnc8F2Bpt410H/hF
 6hiItRqyKr7n3hM4syxfX5+zO0eCILaSAY2AUQrnOG73ruhuAchiitqvOUwuFa9rRMVH
 2kL0zvuG2q5FuCSrkMyOrKvOzvIqHJ69bMInkdgJSwnFEpVa+vq6r2rj3XlM7AOxmX48
 S/I6JV8zAh8ec95AXv5XtvIFMmFUalV/tMsVmBnSnfMp1XGeZ9DM98PzxEU+RTVbSBs+
 AwSBHO7YvhHrk4Fgfbb02Pd+ncUG2mCeoVU8J4cTuADM/YXtGTWkW+ZM21KNFIU/cI4n
 frbA==
X-Gm-Message-State: APjAAAVqvLyYt9FUSi/zcLtAdTZif1KsAzmrK/EzTkdO0f362KVt69T6
 o0AEhHm3V1hdrjhckQKWLLiIFA==
X-Google-Smtp-Source: APXvYqzlMuR1EOQHTBp8eR0UGZyg6ZcumnwYn7xiS9/ynhb9xU1dYHtdOTAqRBYM+KJwPdfbORfMnw==
X-Received: by 2002:adf:d190:: with SMTP id v16mr7237205wrc.64.1571815952571; 
 Wed, 23 Oct 2019 00:32:32 -0700 (PDT)
Received: from [10.1.3.173] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n1sm24689409wrg.67.2019.10.23.00.32.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Oct 2019 00:32:32 -0700 (PDT)
Subject: Re: [PATCH v13 0/5] DMA-BUF Heaps (destaging ION)
To: John Stultz <john.stultz@linaro.org>
References: <20191021190310.85221-1-john.stultz@linaro.org>
 <be7286c7-3e67-4ffb-73b1-2622391d7c15@baylibre.com>
 <CALAqxLVjp-qNyy8wjG+fJYQqafK5Fsf8rpb3bNe3_p0X9VLjRg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <b6319fec-8536-a7d1-ee26-cd47438218b0@baylibre.com>
Date: Wed, 23 Oct 2019 09:32:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLVjp-qNyy8wjG+fJYQqafK5Fsf8rpb3bNe3_p0X9VLjRg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VYLri5pd2Odae8b/vTSpf0oA1mpoNknFR1w47s8PBLE=;
 b=THmwsyEX6n3Rzwii3QOMvb4P/flUezKTsJ0430eRbjc2bd+SQ7LQbl+/7fTxo7LWyB
 ewOve+4DIus64qNSeehvPem4Ki1GKTjhVaNMLAW/E02ZmcfL4VHIrLygljRzVQe+QbXE
 vNSaz4YeepYegoI95sZNAxsE1VsxMSoI5ycTvS0Qjah2bfXvTb092J5zUhQK38fyekyE
 /LSfVDkF0trPfRNwlnPG6Zr2pRJ/McufW5r4O0vfPPNSpojo5yAbIz5sU4FGU8RBn7ks
 b2YPzmnRW/hVYUsNYf9Krdck70amaYNAvCXegVVInS/PNk2rH/g0oUsDdq2UtW8Pc78B
 pU+Q==
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
Cc: Hillf Danton <hdanton@sina.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjIvMTAvMjAxOSAxNzo1NiwgSm9obiBTdHVsdHogd3JvdGU6Cj4gT24gVHVlLCBPY3QgMjIs
IDIwMTkgYXQgMToyMSBBTSBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+
IHdyb3RlOgo+Pgo+PiBIaSBKb2huLAo+Pgo+PiBPbiAyMS8xMC8yMDE5IDIxOjAzLCBKb2huIFN0
dWx0eiB3cm90ZToKPj4+IEx1Y2t5IG51bWJlciAxMyEgOikKPj4+Cj4+PiBMYXN0IHdlZWsgaW4g
djEyIEkgaGFkIHJlLWFkZGVkIHNvbWUgc3ltYm9sIGV4cG9ydHMgdG8gc3VwcG9ydAo+Pj4gbGF0
ZXIgcGF0Y2hlcyBJIGhhdmUgcGVuZGluZyB0byBlbmFibGUgbG9hZGluZyBoZWFwcyBmcm9tCj4+
PiBtb2R1bGVzLiBIZSByZW1pbmRlZCBtZSB0aGF0IGJhY2sgYXJvdW5kIHYzIChpdHMgYmVlbiBh
d2hpbGUhKSBJCj4+PiBoYWQgcmVtb3ZlZCB0aG9zZSBleHBvcnRzIGR1ZSB0byBjb25jZXJucyBh
Ym91dCB0aGUgZmFjdCB0aGF0IHdlCj4+PiBkb24ndCBzdXBwb3J0IG1vZHVsZSByZW1vdmFsLgo+
Pj4KPj4+IFNvIEknbSByZXNwaW5uaW5nIHRoZSBwYXRjaGVzLCByZW1vdmluZyB0aGUgZXhwb3J0
cyBhZ2Fpbi4gSSdsbAo+Pj4gc3VibWl0IGEgcGF0Y2ggdG8gcmUtYWRkIHRoZW0gaW4gYSBsYXRl
ciBzZXJpZXMgZW5hYmxpbmcgbW9kdWVscwo+Pj4gd2hpY2ggY2FuIGJlIHJldmlld2VkIGluZGVw
ZW50bHkuCj4+Pgo+Pj4gV2l0aCB0aGF0IGRvbmUsIGxldHMgZ2V0IG9uIHRvIHRoZSBib2lsZXJw
bGF0ZSEKPj4+Cj4+PiBUaGUgcGF0Y2hzZXQgaW1wbGVtZW50cyBwZXItaGVhcCBkZXZpY2VzIHdo
aWNoIGNhbiBiZSBvcGVuZWQKPj4+IGRpcmVjdGx5IGFuZCB0aGVuIGFuIGlvY3RsIGlzIHVzZWQg
dG8gYWxsb2NhdGUgYSBkbWFidWYgZnJvbSB0aGUKPj4+IGhlYXAuCj4+Pgo+Pj4gVGhlIGludGVy
ZmFjZSBpcyBzaW1pbGFyLCBidXQgbXVjaCBzaW1wbGVyIHRoZW4gSU9Ocywgb25seQo+Pj4gcHJv
dmlkaW5nIGFuIEFMTE9DIGlvY3RsLgo+Pj4KPj4+IEFsc28sIEkndmUgcHJvdmlkZWQgcmVsYXRp
dmVseSBzaW1wbGUgc3lzdGVtIGFuZCBjbWEgaGVhcHMuCj4+Pgo+Pj4gSSd2ZSBib290ZWQgYW5k
IHRlc3RlZCB0aGVzZSBwYXRjaGVzIHdpdGggQU9TUCBvbiB0aGUgSGlLZXk5NjAKPj4+IHVzaW5n
IHRoZSBrZXJuZWwgdHJlZSBoZXJlOgo+Pj4gICBodHRwczovL2dpdC5saW5hcm8ub3JnL3Blb3Bs
ZS9qb2huLnN0dWx0ei9hbmRyb2lkLWRldi5naXQvbG9nLz9oPWRldi9kbWEtYnVmLWhlYXAKPj4K
Pj4gRG8geW91IGhhdmUgYSA0LjE5IHRyZWUgd2l0aCB0aGUgY2hhbmdlcyA/IEkgdHJpZWQgYnV0
IHRoZSB4YXJyYXkgaWRyIHJlcGxhY2VtZW50Cj4+IGlzIG1pc3NpbmcuLi4gc28gSSBjYW4ndCB0
ZXN0IHdpdGggb3VyIGFuZHJvaWQtYW1sb2dpYy1ibWVzb24tNC4xOSB0cmVlLgo+Pgo+PiBJZiB5
b3UgY2FuIHByb3ZpZGUsIEknbGwgYmUgaGFwcHkgdG8gdGVzdCB0aGUgc2VyaWUgYW5kIHRoZSBn
cmFsbG9jIGNoYW5nZXMuCj4gCj4gVW5mb3J0dW5hdGVseSBJIGRvbid0IGhhdmUgYSA0LjE5IHZl
cnNpb24gb2YgZG1hYnVmIGhlYXBzIChhbGwgdGhlCj4gd29yayBoYXMgYmVlbiBkb25lIHRoaXMg
eWVhciwgcG9zdCA0LjE5KS4gSSdtIHBsYW5uaW5nIHRvIGJhY2twb3J0IHRvCj4gNS40IGZvciBB
T1NQLCBidXQgSSd2ZSBub3QgcmVhbGx5IHRob3VnaHQgYWJvdXQgNC4xOS4gTW9zdCBsaWtlbHkg
SQo+IHdvbid0IGhhdmUgdGltZSB0byBsb29rIGF0IGl0IHVudGlsIGFmdGVyIHRoZSBjaGFuZ2Vz
IGFyZSB1cHN0cmVhbSBhbmQKPiB0aGUgNS40IGJhY2twb3J0IGlzIGRvbmUuCj4gCj4gSXMgdGhl
IGJtZXNvbiB0cmVlIGxpa2VseSB0byBvbmx5IHN0YXkgYXQgNC4xOT8gT3Igd2lsbCBpdCBtb3Zl
IGZvcndhcmQ/CgpObyBpZGVhLCBJIGRvbid0IGhhdmUgYW55IGRldGFpbHMgb24gdGhlIGZ1dHVy
ZSBwbGFucy4KU2luY2Ugd2UgZGlkIGFuIHVwc3RyZWFtLWZpcnN0IHN1cHBvcnQsIDkwJSB3aWxs
IGJlIGF2YWlsYWJsZSBvbiB0aGUgZnV0dXJlIGFuZHJvaWQtNS40IHRyZWUgYW55d2F5LgoKTmVp
bAoKPiAKPiB0aGFua3MKPiAtam9obgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
