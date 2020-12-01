Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169CC2CB6CA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476BF6EA37;
	Wed,  2 Dec 2020 08:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54E76E560
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 14:17:23 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id v14so4468417lfo.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 06:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+/VDVLzOBDjqiEu/N1C0eMmuynbTWK2RMfkKzr3b440=;
 b=NFS1gJ6qIMEM0tjrCNFlTLXIiKzLUz8Gnm9RoDkDgAGoOrAmFH665FazAn65xfep9j
 q1MzYJOj3Zlv/6l+94KjbYlkwVpip2977xGSaKfNO/trDYc5k7c4/WcDtCzjHhJivaw4
 R3wSqZQpSfK8urUC+KUWSI03zjKLD2qUjSA1Sh36Vv3gkEPtGffag2dP6CvSTvSq3UKY
 YylNKX7Dx4eifs+51m341bLnClw1F91DSN9xMT666b1NKXE2m8BabsDyn4Az/aDh03d7
 EAnoQKdNqE2iVos9mifhxROnB6lM4QDKR2vwmfs0SCZYZPWhyhwrUHdSXnF5Z6q3a5OU
 KfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+/VDVLzOBDjqiEu/N1C0eMmuynbTWK2RMfkKzr3b440=;
 b=YMKogqFh78zR5gkPRoWAyRtPo+zsvpkIIRGGGnWdhQvom5GEb6RjSkaA/649+EXxTi
 4mRwlYcy+3WoXtv//peUJYUWmp0jNtxlCDvPb5TLHLbecjQiA9Swo4cPNcholXvf9kLI
 V6wI0hgoW9vVSGpfCJ9tF4rzOwA83GJR8cnfelcUqnMOn9x2UCcaFfO+/MX6qDlmGsq2
 sLgnB2mNKASBjvjRl3lMABGzATKaU6UAvVy0Q2o7q4NHMxVRm1q1M6CFCixeagXTzNDY
 JVBD24/PfeBlYmPr46MwEIiQcUOoU9zegIDwNWoq6+cRtTN6KERzUhHKJX4tCuGeWdwZ
 oDbw==
X-Gm-Message-State: AOAM532GR9JEbiTGbGkpYq7b6jemPghuOvbEGH6CHF9uIxgqkMlbpN7a
 4ysr1yTwHH5IsbSUT+KLTHQ=
X-Google-Smtp-Source: ABdhPJy45twU6WKpFARyvJXmOYuPohM+PTgEg36doZmYuxa+KLwfB3LOW5+S25YIdNCijAJHOc0fgg==
X-Received: by 2002:ac2:5503:: with SMTP id j3mr1305836lfk.94.1606832242037;
 Tue, 01 Dec 2020 06:17:22 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-53.dynamic.spd-mgts.ru.
 [109.252.192.53])
 by smtp.googlemail.com with ESMTPSA id p16sm214803lfe.255.2020.12.01.06.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:17:21 -0800 (PST)
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Chen <Peter.Chen@nxp.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Adrian Hunter <adrian.hunter@intel.com>, Peter Geis <pgwipeout@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolas Chauvet <kwizart@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones
 <lee.jones@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
 <160683107675.35139.13466076210885462180.b4-ty@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <858e4183-5064-084f-9b80-870e118c3edc@gmail.com>
Date: Tue, 1 Dec 2020 17:17:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <160683107675.35139.13466076210885462180.b4-ty@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMTIuMjAyMCAxNjo1NywgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIFRodSwgNSBOb3Yg
MjAyMCAwMjo0Mzo1NyArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiBJbnRyb2R1Y2Ug
Y29yZSB2b2x0YWdlIHNjYWxpbmcgZm9yIE5WSURJQSBUZWdyYTIwLzMwIFNvQ3MsIHdoaWNoIHJl
ZHVjZXMKPj4gcG93ZXIgY29uc3VtcHRpb24gYW5kIGhlYXRpbmcgb2YgdGhlIFRlZ3JhIGNoaXBz
LiBUZWdyYSBTb0MgaGFzIG11bHRpcGxlCj4+IGhhcmR3YXJlIHVuaXRzIHdoaWNoIGJlbG9uZyB0
byBhIGNvcmUgcG93ZXIgZG9tYWluIG9mIHRoZSBTb0MgYW5kIHNoYXJlCj4+IHRoZSBjb3JlIHZv
bHRhZ2UuIFRoZSB2b2x0YWdlIG11c3QgYmUgc2VsZWN0ZWQgaW4gYWNjb3JkYW5jZSB0byBhIG1p
bmltdW0KPj4gcmVxdWlyZW1lbnQgb2YgZXZlcnkgY29yZSBoYXJkd2FyZSB1bml0Lgo+Pgo+PiBU
aGUgbWluaW11bSBjb3JlIHZvbHRhZ2UgcmVxdWlyZW1lbnQgZGVwZW5kcyBvbjoKPj4KPj4gWy4u
Ll0KPiAKPiBBcHBsaWVkIHRvCj4gCj4gICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9zb3VuZC5naXQgZm9yLW5leHQKPiAKPiBUaGFua3Mh
Cj4gCj4gWzEvMV0gcmVndWxhdG9yOiBBbGxvdyBza2lwcGluZyBkaXNhYmxlZCByZWd1bGF0b3Jz
IGluIHJlZ3VsYXRvcl9jaGVja19jb25zdW1lcnMoKQo+ICAgICAgIChubyBjb21taXQgaW5mbykK
PiAKPiBBbGwgYmVpbmcgd2VsbCB0aGlzIG1lYW5zIHRoYXQgaXQgd2lsbCBiZSBpbnRlZ3JhdGVk
IGludG8gdGhlIGxpbnV4LW5leHQKPiB0cmVlICh1c3VhbGx5IHNvbWV0aW1lIGluIHRoZSBuZXh0
IDI0IGhvdXJzKSBhbmQgc2VudCB0byBMaW51cyBkdXJpbmcKPiB0aGUgbmV4dCBtZXJnZSB3aW5k
b3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dldmVyIGlmCj4gcHJvYmxlbXMg
YXJlIGRpc2NvdmVyZWQgdGhlbiB0aGUgcGF0Y2ggbWF5IGJlIGRyb3BwZWQgb3IgcmV2ZXJ0ZWQu
Cj4gCj4gWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3VsdGluZyBmcm9tIGF1dG9tYXRl
ZCBvciBtYW51YWwgdGVzdGluZwo+IGFuZCByZXZpZXcgb2YgdGhlIHRyZWUsIHBsZWFzZSBlbmdh
Z2Ugd2l0aCBwZW9wbGUgcmVwb3J0aW5nIHByb2JsZW1zIGFuZAo+IHNlbmQgZm9sbG93dXAgcGF0
Y2hlcyBhZGRyZXNzaW5nIGFueSBpc3N1ZXMgdGhhdCBhcmUgcmVwb3J0ZWQgaWYgbmVlZGVkLgo+
IAo+IElmIGFueSB1cGRhdGVzIGFyZSByZXF1aXJlZCBvciB5b3UgYXJlIHN1Ym1pdHRpbmcgZnVy
dGhlciBjaGFuZ2VzIHRoZXkKPiBzaG91bGQgYmUgc2VudCBhcyBpbmNyZW1lbnRhbCB1cGRhdGVz
IGFnYWluc3QgY3VycmVudCBnaXQsIGV4aXN0aW5nCj4gcGF0Y2hlcyB3aWxsIG5vdCBiZSByZXBs
YWNlZC4KPiAKPiBQbGVhc2UgYWRkIGFueSByZWxldmFudCBsaXN0cyBhbmQgbWFpbnRhaW5lcnMg
dG8gdGhlIENDcyB3aGVuIHJlcGx5aW5nCj4gdG8gdGhpcyBtYWlsLgoKSGVsbG8gTWFyaywKCkNv
dWxkIHlvdSBwbGVhc2UgaG9sZCBvbiB0aGlzIHBhdGNoPyBJdCB3b24ndCBiZSBuZWVkZWQgaW4g
YSB2Miwgd2hpY2gKd2lsbCB1c2UgcG93ZXIgZG9tYWlucy4KCkFsc28sIEknbSBub3Qgc3VyZSB3
aGV0aGVyIHRoZSAic291bmQiIHRyZWUgaXMgc3VpdGFibGUgZm9yIGFueSBvZiB0aGUKcGF0Y2hl
cyBpbiB0aGlzIHNlcmllcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
