Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA838A50E5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 10:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABB289B4D;
	Mon,  2 Sep 2019 08:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C96F89B4D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 08:08:07 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so4159573wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 01:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RZo8WArml/7vG0RYj24lta//5luoUJUJmAZY76UyZ14=;
 b=qmN9n4lw71uu4fnrxHIcPFffB+x7D09euSQ5RgtUSE+chL8xsIeUqYPiVbbxsVXGid
 A8Ar9oyzYrXFp/sI7vLgVGdgQqa7lZsKvrCbG2jxXbW8SWPDx/bNzO05rDEcppWZuQgo
 PT2t5uexm3kb1PgbIBnf/7znrCjEWEXipVXe5VpPvU9dNrnpAyF7qqqcWU8Oim7twdGk
 VR6ssNX9v+F2jHieNdqqUFXdGOceHdbILXmfPQlTnEswE5KOGGIfDPKU5fyxYjHIviGo
 z5+WQpz7yP3jV+SoriAmKdXB9z/SFbXxwypRThBsDOjTTJxME92CgDz/72aDmhhTzDQ5
 Mzdw==
X-Gm-Message-State: APjAAAUQlD/tnY8s5JaAb2hjk1EgkVfD7kZpQT2+YGptGo+ubWozxqZh
 iI+zPf9Kv+5nBne/6KSdfvDjeA==
X-Google-Smtp-Source: APXvYqwt5QLqP19OkwKHcqUGCNFPAGKgzyqicVbDJkc+YQcUn5LJMd8evQtXKLeCCr/KgCwBQQi+Ww==
X-Received: by 2002:a5d:4382:: with SMTP id i2mr18266108wrq.297.1567411685447; 
 Mon, 02 Sep 2019 01:08:05 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 189sm11540852wmz.19.2019.09.02.01.08.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Sep 2019 01:08:04 -0700 (PDT)
Subject: Re: [PATCH 5/5] drm: dw-hdmi: update ELD on HPD event
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <a.hajda@samsung.com>
References: <AM0PR06MB40049562E295DD62302C8DB7ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
 <20190901161426.1606-1-jonas@kwiboo.se>
 <AM0PR06MB4004F589E60DA4BA958FD316ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <29a3cd0b-af69-98ae-26c5-947526a7fc68@baylibre.com>
Date: Mon, 2 Sep 2019 10:08:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR06MB4004F589E60DA4BA958FD316ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RZo8WArml/7vG0RYj24lta//5luoUJUJmAZY76UyZ14=;
 b=NmmVnOK7mXVQEe2XN0vdjc4SNOo+SjNOGMEIlZwSPmUjjCsbOkLMs+fUsPklF7kJqy
 1tenxiZhLfUc7qNt+CJ20JhmLwuvTxXzS0PAyQNyezhuBckB+16e/LuVMYoZxfYx2pjY
 ObLRjoa+Y25brv2KeMCuj17/u1jueOZGdfArPsCqHjgB2Hr9KK7sHsoKo+9uGFDrp/8A
 IsAlu8WZe5gWgXiMmfoBnnVfalQlD0PNvjbOcg15AAUrqhNtKlDrUUZwLyEGiEI129Qd
 iwBXETj6qJUTiNZjPxXiQQcN+ooXCZQzUVqWI3YBELbPmfEMVtJ8Ne+SSSJQ1lGJ8cgd
 /SOw==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEvMDkvMjAxOSAxODoxNCwgSm9uYXMgS2FybG1hbiB3cm90ZToKPiBVcGRhdGUgY29ubmVj
dG9yIEVMRCBvbiBIUEQgZXZlbnQsIGZpeGVzIHN0YWxlIEVMRCB3aGVuCj4gSERNSSBjYWJsZSBp
cyB1bnBsdWdnZWQvcmVwbHVnZ2VkIG9yIEFWUiBpcyBwb3dlcmVkIG9uL29mZi4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMiArKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMKPiBpbmRleCAwZjA3YmUxYjU5MTQuLjBhODI2OGIyMDU2MSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gQEAgLTIxNzgsNiArMjE3
OCw4IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9jb25uZWN0b3JfdXBkYXRlX2VkaWQoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvciwKPiAgCQljZWNfbm90aWZpZXJfc2V0X3BoeXNfYWRkcl9m
cm9tX2VkaWQoaGRtaS0+Y2VjX25vdGlmaWVyLCBlZGlkKTsKPiAgCQlpZiAoYWRkX21vZGVzKQo+
ICAJCQlyZXQgPSBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVjdG9yLCBlZGlkKTsKPiArCQllbHNl
Cj4gKwkJCWRybV9lZGlkX3RvX2VsZChjb25uZWN0b3IsIGVkaWQpOwo+ICAJCWtmcmVlKGVkaWQp
Owo+ICAJfSBlbHNlIHsKPiAgCQlkZXZfZGJnKGhkbWktPmRldiwgImZhaWxlZCB0byBnZXQgZWRp
ZFxuIik7Cj4gCgpSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGli
cmUuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
