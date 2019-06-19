Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BA44BCB2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 17:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C228A88E37;
	Wed, 19 Jun 2019 15:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C4E88E37
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 15:22:59 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 207so2276860wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 08:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Btr9AY8nFOSZFQQa6OLvfTmDFBlPBiJQhlPwHQK99Bk=;
 b=BoeNSisxSm5iPfABjV43LQVZ/Y4N684FmXsNJ2RXYqPZma8FBLEEAAaU2LQcCpNRhk
 MdtrJ4KOVa2lVZ+gEj7AW7EWopvMsG4HKna8ibrl2VGvouo8IhS9I/uwpW40glKU4dTD
 405nQ12O8Eeram4bizcoLCNFffRxMnTiiVz4chffjQk4flDajHvbIGovmaoM5hcceku7
 0jM9Zjzoh+pni/0Bydn37OVvv9iJa5HaeAntniIMX+z4C7dWN5vlRNOxtg1VAKjzZ/za
 MQzvyQm30EghKLxYr0CKzxMQRwPDQZHZCOxdMV85RJXeUg+78ou8RTBOSzSkD/aD/E+A
 LkRA==
X-Gm-Message-State: APjAAAWNQ+5CxQEYHremqqsDZuPVwp65wgCUb6gBG7SfQPep9+2QEgNu
 DE2y20tSfiPLtdOy+kWCr01KOMSmIeenBQ==
X-Google-Smtp-Source: APXvYqx8TGPVPngaABxWz2gFmiu8TyKUlDsVMwrBAc/qnjWmednIBnI4pHR107r2KLKcpV2KR0Pxaw==
X-Received: by 2002:a7b:cb84:: with SMTP id m4mr9509470wmi.50.1560957777470;
 Wed, 19 Jun 2019 08:22:57 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm17124521wrt.49.2019.06.19.08.22.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 08:22:56 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge/synopsys: dw-hdmi: Handle audio for more clock
 rates
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>
References: <20190617235558.64571-1-dianders@chromium.org>
 <6219398.I55JWXAmVF@jernej-laptop>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9bba43cb-7070-8b2a-cfc6-f601fd22a315@baylibre.com>
Date: Wed, 19 Jun 2019 17:22:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6219398.I55JWXAmVF@jernej-laptop>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Btr9AY8nFOSZFQQa6OLvfTmDFBlPBiJQhlPwHQK99Bk=;
 b=Voz3JLvpp6hNRBtcCMY+hsLLUAxTwYSxNFffW5t0XZT/zlVyHLxlgMejP7hhVcCFlJ
 rPeaL2eDyAHs9KBNp+NtDRTB8y0J6TM6xQ+zBn/3nLEBbHQyGOttlO1fYcQ9+dEGuXoa
 vcfYBLeu+FQNxRmxhNX//Bk426aZWvjWeSae4fgi2+H9v+uBjQYLiI1Y+8qxT5IOKHZD
 VZSfHsRuzOQ93Va0JA+g1kfN9q9vKa287K6I3IJkJRfcJqBtMlq196FuZMuK8mLS4CX1
 Uxd33aM3duYuVMC4MSTe1dw1wzJWMjWMlMCksvIpNsDoN+mBnofstpfVI+hz4BHNXxl7
 fd5g==
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
Cc: linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dgreid@chromium.org, Zheng Yang <zhengyang@rock-chips.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Gleixner <tglx@linutronix.de>,
 cychiang@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMDYvMjAxOSAxOToyMywgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+IEhpIQo+IAo+IERu
ZSB0b3JlaywgMTguIGp1bmlqIDIwMTkgb2IgMDE6NTU6NTggQ0VTVCBqZSBEb3VnbGFzIEFuZGVy
c29uIG5hcGlzYWwoYSk6Cj4+IExldCdzIGFkZCBzb21lIGJldHRlciBzdXBwb3J0IGZvciBIRE1J
IGF1ZGlvIHRvIGR3X2hkbWkuCj4+IFNwZWNpZmljYWxseToKPj4KPj4gMS4gRm9yIDQ0LjEga0h6
IGF1ZGlvIHRoZSBvbGQgY29kZSBtYWRlIHRoZSBhc3N1bXB0aW9uIHRoYXQgYW4gTiBvZgo+PiA2
MjcyIHdhcyByaWdodCBtb3N0IG9mIHRoZSB0aW1lLiAgVGhhdCB3YXNuJ3QgdHJ1ZSBhbmQgdGhl
IG5ldyB0YWJsZQo+PiBzaG91bGQgZ2l2ZSBiZXR0ZXIgNDQuMSBrSHogYXVkaW8gZm9yIG1hbnkg
bW9yZSByYXRlcy4KPj4KPj4gMi4gVGhlIG5ldyB0YWJsZSBoYXMgdmFsdWVzIGZyb20gdGhlIEhE
TUkgc3BlYyBmb3IgMjk3IE1IeiBhbmQgNTk0Cj4+IE1Iei4KPj4KPj4gMy4gVGhlcmUgaXMgbm93
IGNvZGUgdG8gdHJ5IHRvIGNvbWUgdXAgd2l0aCBhIG1vcmUgaWRlYSBOL0NUUyBmb3IKPj4gY2xv
Y2sgcmF0ZXMgdGhhdCBhcmVuJ3QgaW4gdGhlIHRhYmxlLiAgVGhpcyBjb2RlIGlzIGEgYml0IHNs
b3cgYmVjYXVzZQo+PiBpdCBpdGVyYXRlcyBvdmVyIGV2ZXJ5IHBvc3NpYmxlIHZhbHVlIG9mIE4g
YW5kIHBpY2tzIHRoZSBiZXN0IG9uZSwgYnV0Cj4+IGl0IHNob3VsZCBtYWtlIGEgZ29vZCBmYWxs
YmFjay4KPj4KPj4gNC4gVGhlIG5ldyBjb2RlIGFsbG93cyBmb3IgcGxhdGZvcm1zIHRoYXQga25v
dyB0aGV5IG1ha2UgYSBjbG9jayByYXRlCj4+IHNsaWdodGx5IGRpZmZlcmVudGx5IHRvIHBpY2sg
ZGlmZmVyZW50IE4vQ1RTIHZhbHVlcy4gIEZvciBpbnN0YW5jZSBvbgo+PiByazMyODggd2UgY2Fu
IG1ha2UgMjUsMTc2LDQ3MSBIeiBpbnN0ZWFkIG9mIDI1LDE3NCw4MjUuMTc0OC4uLiBIego+PiAo
MjUuMiBNSHogLyAxLjAwMSkuICBBIGZ1dHVyZSBwYXRjaCB0byB0aGUgcmszMjg4IHBsYXRmb3Jt
IGNvZGUgY291bGQKPj4gZW5hYmxlIHN1cHBvcnQgZm9yIHRoaXMgY2xvY2sgcmF0ZSBhbmQgc3Bl
Y2lmeSB0aGUgTi9DVFMgdGhhdCB3b3VsZCBiZQo+PiBpZGVhbC4KPj4KPj4gTk9URTogdGhlIG9k
ZGVzdCBwYXJ0IG9mIHRoaXMgcGF0Y2ggY29tZXMgYWJvdXQgYmVjYXVzZSBjb21wdXRpbmcgdGhl
Cj4+IGlkZWFsIE4vQ1RTIG1lYW5zIGtub3dpbmcgdGhlIF9leGFjdF8gY2xvY2sgcmF0ZSwgbm90
IGEgcm91bmRlZAo+PiB2ZXJzaW9uIG9mIGl0LiAgVGhlIGRybSBmcmFtZXdvcmsgbWFrZXMgdGhp
cyBoYXJkZXIgYnkgcm91bmRpbmcgcmF0ZXMKPj4gdG8ga0h6LCBidXQgZXZlbiBpZiBpdCBkaWRu
J3QgdGhlcmUgbWlnaHQgYmUgY2FzZXMgd2hlcmUgdGhlIGlkZWFsCj4+IHJhdGUgY291bGQgb25s
eSBiZSBjYWxjdWxhdGVkIGlmIHdlIGtuZXcgdGhlIHJlYWwgKG5vbi1pbnRlZ3JhbCkgcmF0ZS4K
Pj4gVGhpcyBtZWFucyB0aGF0IGluIGNhc2VzIHdoZXJlIHdlIGtub3cgKG9yIGJlbGlldmUpIHRo
YXQgdGhlIHRydWUgcmF0ZQo+PiBpcyBzb21ldGhpbmcgb3RoZXIgdGhhbiB0aGUgcmF0ZSB3ZSBh
cmUgdG9sZCBieSBkcm0uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRp
YW5kZXJzQGNocm9taXVtLm9yZz4KPiAKPiBXaGljaCBidXMgaXMgdXNlZCBmb3IgYXVkaW8gdHJh
bnNmZXIgb24geW91ciBkZXZpY2U/IElmIGl0IGlzIEkyUywgd2hpY2ggaXMgCj4gY29tbW9ubHkg
dXNlZCwgdGhlbiBwbGVhc2UgYmUgYXdhcmUgb2YgdGhpcyBwYXRjaDoKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdW5lLzIyMTUzOS5odG1s
Cj4gCj4gSXQgYXZvaWRzIGV4YWN0IE4vQ1RTIGNhbGN1bGF0aW9uIGJ5IGVuYWJsaW5nIGF1dG8g
ZGV0ZWN0aW9uLiBJdCBpcyB3ZWxsIAo+IHRlc3RlZCBvbiBtdWx0aXBsZSBTb0NzIGZyb20gQWxs
d2lubmVyLCBBbWxvZ2ljIGFuZCBSb2NrY2hpcC4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gSmVybmVq
Cj4gCj4gCkhpIERvdWdsYXMsCgpUaGFua3MgZm9yIHlvdXIgd29yayAhCgpJZiB5b3UgY291bGQg
cmViYXNlIG9uIHRvcCBvZiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9k
cmktZGV2ZWwvMjAxOS1KdW5lLzIyMTUzOS5odG1sCnNvIHdlIGNhbiBtYWtlIHVzZSBvZiB5b3Vy
IGV4dGVuZGVkIE4gdGFibGUgd2l0aCBhdXRvbWF0aWMgQ1RTIEhXIGNhbGN1bGF0aW9uLCBpdCB3
b3VsZCBiZSBncmVhdCAhCgpGaW5hbGx5IGNvdWxkIHlvdSBhZGQgdGhlIHBsYXRfZGF0YSB0bWRz
IHRhYmxlIGFzIGEgc2VwYXJhdGUgcGF0Y2ggdG8gc2ltcGxpZnkgcmV2aWV3ID8KClRoYW5rcywK
TmVpbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
