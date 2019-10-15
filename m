Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A2DD7066
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DCE89D5C;
	Tue, 15 Oct 2019 07:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7628589D57
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:46:49 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a6so19632887wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 00:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SihB2BERFui2a5ZnG4/gZ4FQfE6NjJstFeY2lQhJ46U=;
 b=jd5TsHa85UUKf9dGiN+Q5bARO6COXlPt8olNFE7q5M2XvW8rk6iqjZXR8ik/UySVpL
 0CpMdlsEs+yJ00B/O5VXP2wJASStKTzGJM6PTEmzmB/PMQnSOSFSelHvwKYQMXaYyvvr
 BRlVU6Csl5cbTPc7pVzMNorLmkmakyZFp91zZq89gDj5yg+FbemjoWWANltf5X0a6Ue+
 wMaX/KsALjCEOdJs6lUfWf0tXO0AUfAARFDiYZOtLTfLX3jVOFwbPmxVSYE7SjjW/Ci9
 wmhs69DCxUF6fOTso27mfJ9vhhCa9Rh8a7ZNmbIcH+WMaHwO/FF7z4Da3duHk1lAX8of
 /BCQ==
X-Gm-Message-State: APjAAAXwWUQZKrzVuUPDLIAj6bPN5ktSfLEuMZdXwDKSB9uUlqOSylSV
 vKCZ5Vg3PM0jcTHNqAw5dT6Q0Q==
X-Google-Smtp-Source: APXvYqy8hyx7/iiK2L26yBpUuGHlhjlTUq3OW2QSB8Z+sfm8KTlG6BPISmZtOVK1xQFQe9qMgTpZ8w==
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr17897677wmj.3.1571125607813; 
 Tue, 15 Oct 2019 00:46:47 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t123sm35071848wma.40.2019.10.15.00.46.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 00:46:47 -0700 (PDT)
Subject: Re: [PATCH v3] drm/bridge: dw-hdmi: Restore audio when setting a mode
To: Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org
References: <20191008102145.55134-1-cychiang@chromium.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d0f03ff3-2743-b3e1-1b53-c4ef26b158db@baylibre.com>
Date: Tue, 15 Oct 2019 09:46:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008102145.55134-1-cychiang@chromium.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SihB2BERFui2a5ZnG4/gZ4FQfE6NjJstFeY2lQhJ46U=;
 b=EfJVmgUyLeJbJBtlWPtA9Eo7uqDTyRF5VA05/pN2eGVmG6R7E7FEZN8/VeKBR3wSx2
 I7KjXQ2kfAY7w1a2pbQnDjvMQ1oD4y+xPrnqwrYu4cHgP9OxslR0s6x2+89JQxrSYPfO
 1yBxavtbvaNWpHBnftKXfMh+OX8w5nl+g6WcnE+jlcFgwrbexkQGSB5x4eo9queoQRH6
 nmvgYrPKbe9Fo2OhSTi4wPFz2MPFM6WK6fq9rtT4Ux0x9LAKIMJgMYHYk/kmGB481mS/
 u72+h8BYZzG90OoRkIyJPU523JAj1OSm0KfHkL074EW/Bg2XbwvqBX+PIr6b9toIHHqP
 /Dgg==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, tzungbi@chromium.org,
 alsa-devel@alsa-project.org, Jonas Karlman <jonas@kwiboo.se>,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, Yakir Yang <ykk@rock-chips.com>,
 dgreid@chromium.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMTAvMjAxOSAxMjoyMSwgQ2hlbmctWWkgQ2hpYW5nIHdyb3RlOgo+IEZyb206IERhbmll
bCBLdXJ0eiA8ZGprdXJ0ekBjaHJvbWl1bS5vcmc+Cj4gCj4gV2hlbiBzZXR0aW5nIGEgbmV3IGRp
c3BsYXkgbW9kZSwgZHdfaGRtaV9zZXR1cCgpIGNhbGxzCj4gZHdfaGRtaV9lbmFibGVfdmlkZW9f
cGF0aCgpLCB3aGljaCBkaXNhYmxlcyBhbGwgaGRtaSBjbG9ja3MsIGluY2x1ZGluZwo+IHRoZSBh
dWRpbyBjbG9jay4KPiAKPiBXZSBzaG91bGQgb25seSAocmUtKWVuYWJsZSB0aGUgYXVkaW8gY2xv
Y2sgaWYgYXVkaW8gd2FzIGFscmVhZHkgZW5hYmxlZAo+IHdoZW4gc2V0dGluZyB0aGUgbmV3IG1v
ZGUuCj4gCj4gV2l0aG91dCB0aGlzIHBhdGNoLCBvbiBSSzMyODgsIHRoZXJlIHdpbGwgYmUgSERN
SSBhdWRpbyBvbiBzb21lIG1vbml0b3JzCj4gaWYgaTJzIHdhcyBwbGF5ZWQgdG8gaGVhZHBob25l
IHdoZW4gdGhlIG1vbml0b3Igd2FzIHBsdWdnZWQuCj4gQUNFUiBIMjc3SFUgYW5kIEFTVVMgUEIy
NzggYXJlIHR3byBvZiB0aGUgbW9uaXRvcnMgc2hvd2luZyB0aGlzIGlzc3VlLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdAY2hyb21pdW0ub3JnPgo+IFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBLdXJ0eiA8ZGprdXJ0ekBjaHJvbWl1bS5vcmc+Cj4gU2lnbmVkLW9m
Zi1ieTogWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPgo+IC0tLQo+ICBDaGFuZ2UgZnJv
bSB2MiB0byB2MzoKPiAgLSBSZW1vdmUgc3BpbmxvY2sgYXJvdW5kIHNldHRpbmcgY2xvY2suCj4g
Cj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMiArLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IGluZGV4IGExNWZiZjcxYjlkNy4u
YWYwNjAxNjJiMGFmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1o
ZG1pLmMKPiBAQCAtMjA1NCw3ICsyMDU0LDcgQEAgc3RhdGljIGludCBkd19oZG1pX3NldHVwKHN0
cnVjdCBkd19oZG1pICpoZG1pLCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiAgCj4g
IAkJLyogSERNSSBJbml0aWFsaXphdGlvbiBTdGVwIEUgLSBDb25maWd1cmUgYXVkaW8gKi8KPiAg
CQloZG1pX2Nsa19yZWdlbmVyYXRvcl91cGRhdGVfcGl4ZWxfY2xvY2soaGRtaSk7Cj4gLQkJaGRt
aV9lbmFibGVfYXVkaW9fY2xrKGhkbWksIHRydWUpOwo+ICsJCWhkbWlfZW5hYmxlX2F1ZGlvX2Ns
ayhoZG1pLCBoZG1pLT5hdWRpb19lbmFibGUpOwo+ICAJfQo+ICAKPiAgCS8qIG5vdCBmb3IgRFZJ
IG1vZGUgKi8KPiAKCkxvb2tzIGNvaGVyZW50IGZvciBtZS4KClJldmlld2VkLWJ5OiBOZWlsIEFy
bXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CgpBcHBseWluZyB0byBkcm0tbWlzYy1u
ZXh0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
