Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D39B385E8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 10:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516988941D;
	Fri,  7 Jun 2019 08:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF9B8941D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 08:07:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f9so1145410wre.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 01:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TGCe8fx0UlZO6OAeMwkeA0yuINCEOxz47WO8wDGstMo=;
 b=ZIBhnFlGZUR/KtbloUnb8sI0XE+ppLDRZSpKGVfrce5eBB3zKDKPed+Qw3LO6Dqn1O
 VA9WMPO7F1uNfp+nOdHPK9jwT16IzSujPdcqg+ScrEpRX4/u+q5O+iGHh5AcLllt4pR+
 O9uqLILfSJdmZ4Gi5iMUs4YolPb2ten5hFiX4mNr5uVuUdScDkNnrAFdVcLdAN01qija
 cEs1JEyye1bgxcDZ3Zm/vQY9lojs5NIVmbIxT4Po+sNTYS9Ej3AWlHYoZH5RzetRrW2R
 e/a7I+hs8SRspxn3zqVt1jMA0XjnQGGBHhyGvnT/rn8D7SwfB4cDf/T4xQcddz9bQMuk
 VbxQ==
X-Gm-Message-State: APjAAAWJmlgAtDsDaYUcrpn+mdoR7NIYdV1v9+RmY+LU1EnM+UPFjn2P
 XKN7MsXa8+UabKzFL4rKxSdTYw==
X-Google-Smtp-Source: APXvYqw8VeI7sYPeDbZt8y66RLpmx0sPvBbqUVE0pzN1pqhW4oGaKmdS2xW2cekmH3Yr1FQaSe74Xg==
X-Received: by 2002:a5d:4886:: with SMTP id g6mr11412062wrq.108.1559894836951; 
 Fri, 07 Jun 2019 01:07:16 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w6sm1181860wro.71.2019.06.07.01.07.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 01:07:16 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/meson: fix G12A primary plane disabling
To: Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org
References: <20190605141253.24165-1-narmstrong@baylibre.com>
 <20190605141253.24165-3-narmstrong@baylibre.com>
 <7h1s06ei58.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c66e11b6-bf1b-8b6e-4110-42b20b879d3c@baylibre.com>
Date: Fri, 7 Jun 2019 10:07:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7h1s06ei58.fsf@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TGCe8fx0UlZO6OAeMwkeA0yuINCEOxz47WO8wDGstMo=;
 b=SfEXJXWvTlz+diRf4Umg411PBKsmUuZl6xYCzsst/EJAqneQX2hbgAgwUxfuS+TEWM
 GN/0OiTczR1pKMjdoZzQ4ZVuQCCM1JII3Yy7izyOYUr1GBTYve0GtZS9NtsuLa2DNBjY
 nEALnZBG8rW6QFyPsGn4JhRzV1NXZS1+wDn1Xw0yOuiK3BIqt0sB7rbwMBYXnLwZlpvi
 eEOIOcN4pEVTVYdFJIF56HRKIYzGu0pBMZoxyiQ9/yqLW139HdOEwH0Yc9OPHAZBioPa
 wCK8IVLApE09SSETwYvrPvlivgKvKhVu2puB4RDlQzmdzbV/blme6l5Na2R4uDP94y6o
 xudw==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYvMDYvMjAxOSAxOTozMCwgS2V2aW4gSGlsbWFuIHdyb3RlOgo+IE5laWwgQXJtc3Ryb25n
IDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4gd3JpdGVzOgo+IAo+PiBUaGUgRzEyQSBQcmltYXJ5
IHBsYW5lIHdhcyBkaXNhYmxlZCBieSB3cml0aW5nIGluIHRoZSBPU0QxIGNvbmZpZ3VyYXRpb24K
Pj4gcmVnaXN0ZXJzLCBidXQgdGhpcyBjYXVzZWQgdGhlIHBsYW5lIGJsZW5kZXIgdG8gc3RhbGwg
aW5zdGVhZCBvZiBjb250aW51aW5nCj4+IGJsZW5kZWQgb25seSB0aGUgb3ZlcmxheSBwbGFuZS4K
PiAKPiBncmFtbWFyIG5pdDogIi4uLmluc3RlYWQgb2YgY29udGludWluZyB0byBibGVuZCBvbmx5
IHRoZSBvdmVybGF5IHBsYW5lLiIKCkZpeGVkIHdoaWxlIGFwcGx5aW5nIG9uIGRybS1taXNjLWZp
eGVzCgo+IAo+PiBGaXggdGhpcyBieSBkaXNhYmxpbmcgdGhlIE9TRDEgcGxhbmUgaW4gdGhlIGJs
ZW5kZXIgcmVnaXN0ZXJzLCBhbmQgYWxzbwo+PiBlbmFibGluZyBpdCBiYWNrIHVzaW5nIHRoZSBz
YW1lIHJlZ2lzdGVyLgo+Pgo+PiBGaXhlczogNDkwZjUwYzEwOWQxICgiZHJtL21lc29uOiBBZGQg
RzEyQSBzdXBwb3J0IGZvciBPU0QxIFBsYW5lIikKPj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1z
dHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBLZXZpbiBI
aWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgo+IAo+IEFzIG5vdGVkIGVsc2V3aGVyZSwgdGhp
cyBkcml2ZXIgaXMgYWxzbyBmdWxsIG9mIG1hZ2ljIGNvbnN0YW50cyB1c2VkIGluCj4gcmVnaXN0
ZXIgd3JpdGVzIHdoaWNoIG1ha2VzIHJldmlld2luZyB0aGlzIGtpbmQgb2YgY2hhbmdlIGZvcgo+
IGNvcnJlY3RuZXNzIHRoYXQgbXVjaCBtb3JlIGRpZmZpY3VsdCwgYnV0IHNpbmNlIHRoYXQncyBh
bHJlYWR5IGJlZW4KPiBwb2ludGVkIG91dCBlbHNld2hlcmUsIGFuZCBpdCdzIGFscmVhZHkgb24g
eW91ciBUT0RPIGxpc3QsIGl0IHNob3VsZCBub3QKPiBibG9jayB0aGlzIGltcG9ydGFudCBmaXgu
CgpZZXAsIGl0J3MgdGhlIHRvcCBwcmlvcml0eSBub3cuCgpUaGFua3MsCgpOZWlsCgo+IAo+IEtl
dmluCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
