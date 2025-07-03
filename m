Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FB0AF7F7D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 20:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBBF10E002;
	Thu,  3 Jul 2025 18:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dfK5olg1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007EE10E002
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 18:01:14 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so1444145e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 11:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751565673; x=1752170473; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fTshLlsKj+ATXO6dyHN4a5UpqPObqjMidh09Ube9JsE=;
 b=dfK5olg1IBdDc1LMRT4GM/0/RFl4iuJp5BX5op6vv3C7a9LoH+JGBjE1hwstirFh3k
 wVM2qBV9WW0gTzP8SNRvklfgPCx+0VIJnEDwN6u4UB2LfBRJJZGtg8UvWRmQ5fR8Sk3/
 K2NDBqM/xPgYoSX2VFlyUAAq/Szu9Pvwh36WZS6o4PODK2FUoy/bucG0ZyUMMGDG2qPC
 aRPxciLp/iev9Azj+7r4plqDFDfmWbjTNaM0FKU3GSDNz67UVgMDDEmKVfff1W/8LPKe
 osxs4rBWXZTzHDCv6dbqYHpBfx+nodQoM7+dlcYZ2vLVFmj8qXF/OWyJJkYJb+OhYOIw
 Lpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751565673; x=1752170473;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fTshLlsKj+ATXO6dyHN4a5UpqPObqjMidh09Ube9JsE=;
 b=HZopeDvsCC5PXigJaZEEIbMaRr5lSck361LdA8okd9o7uEIgUQ2Al1PUAe5q8Q5mgG
 ctAilViKwyQi3qOi0c1v0yvLlLr8EozXZ/QchfXk2GWMUKUSYVYUO528VhuOlWjEUOZt
 oOmwmcSeofDVvDPdO/Chpx3bqShBvm/MGn+kbQCJ3YGGhNeMEjIAEsEFd8QMgIRhrCpO
 +9tar+6IJcCMnvNYiS0lBqQBb++Z/yExUn8BEN7ICEvhQuL5cLax49A8mbGJqFXVyzI1
 t5xQiOOV+n0GeJSxiD98hlCrhoGa5QhN/+Q17rQ3q5zHbAsrd/m0pJRtU+SP/4uhv0Xq
 G7Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1wooshlUvHw+0+7/QTAqWrBS4LhGlkf/2g9vHXY0XIiB/L6w4OsBRFu047o247IDIZYIdxj5FfvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylwuG6Xx/ZxDyh9mLocftGfsEgoINUqfMRLnvH9lZ9xM/L7o3E
 EdjCtRlhSbkAihQDcWQ9lH01rOFXeYptOMQlJDEhjL93Nv6w4qbs8oFM
X-Gm-Gg: ASbGncte7b7zfPZYz3w0c3Rzm57HNef2IsFPLKjpCJuYYIM6+Sef9m9n5mcNXjtwlC7
 aB9T7UodpXqKdRCQvRds2BWYCBQPmcJ387gxtDJ4q0DpDCOi13XWDtuZ/6+oEvCWldKGv3ufZN0
 bqI8UfSxNml+00AAD+nNCpTrLnJXEnGjXnup8sMykO5FbnIYID2fP8f4+flZHEt/MAoMU8bsUl0
 GfAKAEtWA+cNMDb6mgUEKzxxxLLHmAt+YLY6DC5/WOOOjnJQt+14Qvs4mBrp4YcavlDFUZAAcP9
 qx5LvK7M5rt8TFLjjSHxRwWsGPwEjX6aZEzQGOvPvraGyaVGo4X+Jml5DnMBWsBbSOFN
X-Google-Smtp-Source: AGHT+IHh0Nc+teZIfC3byY0jqgAiOo2GFhus1VeRBR9xYdTneIp8TQB5DVqSLOv9yOLqn+Gr3AkrVg==
X-Received: by 2002:a05:600c:4f8b:b0:450:d30e:ff96 with SMTP id
 5b1f17b1804b1-454a3678b9emr94223805e9.0.1751565672373; 
 Thu, 03 Jul 2025 11:01:12 -0700 (PDT)
Received: from [192.168.1.201] ([87.254.0.133])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-454b1698e24sm3936015e9.34.2025.07.03.11.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 11:01:11 -0700 (PDT)
Message-ID: <e40eb387-00cc-4e5d-88aa-6ea6a04bab51@gmail.com>
Date: Thu, 3 Jul 2025 19:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: tc358767: fix uninitialized variable
 regression
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250703-drm-bridge-alloc-fix-tc358767-regression-v1-1-8f224cd063c4@bootlin.com>
Content-Language: en-US
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Autocrypt: addr=colin.i.king@gmail.com; keydata=
 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
 FVPMkxl2UyaayDvhrO9kNXvl1SKCpdzCMQ==
In-Reply-To: <20250703-drm-bridge-alloc-fix-tc358767-regression-v1-1-8f224cd063c4@bootlin.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OG236j0h0XoY7IECKBJWNydq"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OG236j0h0XoY7IECKBJWNydq
Content-Type: multipart/mixed; boundary="------------B0GaHKNrEtpib7OkZCjV6BGX";
 protected-headers="v1"
From: "Colin King (gmail)" <colin.i.king@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <e40eb387-00cc-4e5d-88aa-6ea6a04bab51@gmail.com>
Subject: Re: [PATCH] drm/bridge: tc358767: fix uninitialized variable
 regression
References: <20250703-drm-bridge-alloc-fix-tc358767-regression-v1-1-8f224cd063c4@bootlin.com>
In-Reply-To: <20250703-drm-bridge-alloc-fix-tc358767-regression-v1-1-8f224cd063c4@bootlin.com>

--------------B0GaHKNrEtpib7OkZCjV6BGX
Content-Type: multipart/mixed; boundary="------------2tmEwhpBIQcwaWPTsM8EINoD"

--------------2tmEwhpBIQcwaWPTsM8EINoD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMvMDcvMjAyNSAxNzozMiwgTHVjYSBDZXJlc29saSB3cm90ZToNCj4gQ29tbWl0IGE1
OWEyNzE3NjkxNCAoImRybS9icmlkZ2U6IHRjMzU4NzY3OiBjb252ZXJ0IHRvDQo+IGRldm1f
ZHJtX2JyaWRnZV9hbGxvYygpIEFQSSIpIHNwbGl0IHRjX3Byb2JlX2JyaWRnZV9lbmRwb2lu
dCgpIGluIHR3bw0KPiBmdW5jdGlvbnMsIHRodXMgZHVwbGljYXRpbmcgdGhlIGxvb3Agb3Zl
ciB0aGUgZW5kcG9pbnRzIGluIGVhY2ggb2YgdGhvc2UNCj4gZnVuY3Rpb25zLiBIb3dldmVy
IGl0IG1pc3NlZCBkdXBsaWNhdGluZyB0aGUgb2ZfZ3JhcGhfcGFyc2VfZW5kcG9pbnQoKSBj
YWxsDQo+IHdoaWNoIGluaXRpYWxpemVzIHRoZSBzdHJ1Y3Qgb2ZfZW5kcG9pbnQsIHJlc3Vs
dGluZyBpbiBhbiB1bmluaXRpYWxpemVkDQo+IHJlYWQuDQo+IA0KPiBGaXhlczogYTU5YTI3
MTc2OTE0ICgiZHJtL2JyaWRnZTogdGMzNTg3Njc6IGNvbnZlcnQgdG8gZGV2bV9kcm1fYnJp
ZGdlX2FsbG9jKCkgQVBJIikNCj4gUmVwb3J0ZWQtYnk6IENvbGluIEtpbmcgKGdtYWlsKSA8
Y29saW4uaS5raW5nQGdtYWlsLmNvbT4NCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMDU2YjM0YzMtYzFlYS00YjhjLTk2NzItYzk4OTAzZmZkMDEyQGdtYWlsLmNv
bTA1NmIzNGMzLWMxZWEtNGI4Yy05NjcyLWM5ODkwM2ZmZDAxMkBnbWFpbC5jb20NCj4gU2ln
bmVkLW9mZi1ieTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4N
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgMSArDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90YzM1ODc2Ny5jDQo+IGluZGV4IDYxNTU5NDY3ZTJkMjJiNGIxYjQyMjNjOTc3NjZj
YTNiZjU4OTA4ZmQuLjU2MmZlYTQ3YjNlY2YzNjBlNjRhNDE0ZTk1YWI1ZDY0NWU2MTBlOWUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMNCj4gQEAgLTI0MjIsNiAr
MjQyMiw3IEBAIHN0YXRpYyBpbnQgdGNfcHJvYmVfYnJpZGdlX2VuZHBvaW50KHN0cnVjdCB0
Y19kYXRhICp0YywgZW51bSB0Y19tb2RlIG1vZGUpDQo+ICAgCXN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbm9kZSA9IE5VTEw7DQo+ICAgDQo+ICAgCWZvcl9lYWNoX2VuZHBvaW50X29mX25vZGUo
ZGV2LT5vZl9ub2RlLCBub2RlKSB7DQo+ICsJCW9mX2dyYXBoX3BhcnNlX2VuZHBvaW50KG5v
ZGUsICZlbmRwb2ludCk7DQo+ICAgCQlpZiAoZW5kcG9pbnQucG9ydCA9PSAyKSB7DQo+ICAg
CQkJb2ZfcHJvcGVydHlfcmVhZF91OF9hcnJheShub2RlLCAidG9zaGliYSxwcmUtZW1waGFz
aXMiLA0KPiAgIAkJCQkJCSAgdGMtPnByZV9lbXBoYXNpcywNCj4gDQo+IC0tLQ0KPiBiYXNl
LWNvbW1pdDogYjRjZDE4ZjQ4NTY4N2EyMDYxZWU3YTBjZTY4MzM4NTFmYzQ0MzhkYQ0KPiBj
aGFuZ2UtaWQ6IDIwMjUwNzAzLWRybS1icmlkZ2UtYWxsb2MtZml4LXRjMzU4NzY3LXJlZ3Jl
c3Npb24tNTM2ZWEyODYxYWY2DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQoNCkxvb2tzIGdvb2Qg
dG8gbWUuIFRoYW5rcyBMdWNhLg0KDQpSZXZpZXdlZC1ieTogQ29saW4gSWFuIEtpbmcgPGNv
bGluLmkua2luZ0BnbWFpbC5jb20+DQoNCg==
--------------2tmEwhpBIQcwaWPTsM8EINoD
Content-Type: application/pgp-keys; name="OpenPGP_0x68C287DFC6A80226.asc"
Content-Disposition: attachment; filename="OpenPGP_0x68C287DFC6A80226.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBE6TJCgBEACo6nMNvy06zNKj5tiwDsXXS+LhT+LwtEsy9EnraKYXAf2xwazc
ICSjX06efanlyhB0figzQO0n/tP7BcfMVNG7n1+DC71mSyRK1ZERcG1523ajvdZO
xbBCTvTitYOy3bjs+LXKqeVMhK3mRvdTjjmVpWnWqJ1LL+Hn12ysDVVfkbtuIm2N
oaSEC8Ae8LSSyCMecd22d9PnLR4UeFgrWEkQsqROq6ZDJT9pBLGe1ZS0pVGhkRyB
P9GP65oPev39SmfAx9R92SYJygCy0pPvBMWKvEZS/7bpetPNx6l2xu9UvwoeEbpz
UvH26PHO3DDAv0ynJugPCoxlGPVf3zcfGQxy3otydNTWkP6Wh3Q85m+AlifgKZud
jZLrO6c+fAw/jFu1UMjNuyhgShtFU7NvEzL3RqzFf9O1qM2muj83IeFQ1FZ65QAi
CdTa3npz1vHc7N4uEQBUxyXgXfCI+A5yDnjHwzU0Y3RYS52TA3nfa08yLGPLTf5w
yAREkFYou20vh5vRvPASoXx6auVf1MuxokDShVhxLpryBnlKCobs4voxN54BUO7m
zuERXN8kadsxGFzItAyfKYzEiJrpUB1yhm78AecDyiPlMjl99xXk0zs9lcKriaBy
VUv/NsyJFQj/kmdxox3XHi9K29kopFszm1tFiDwCFr/xumbZcMY17Yi2bQARAQAB
zSdDb2xpbiBJYW4gS2luZyA8Y29saW4uaS5raW5nQGdtYWlsLmNvbT7CwZEEEwEI
ADsCGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AWIQRwYtqk8AG5xmFnAM9owoff
xqgCJgUCY8GcawIZAQAKCRBowoffxqgCJtd/EACIWcaxfVt/MH4qqo5ELsjCFPVp
+RhVpQDWy8v9Np2YbTcZ4AY2Zj4Pq/HrZ3F/Bh02v85C6mNv8BDTKev6Qcq3BYw0
iqw6/xLNvRcSFHM81mQI9xtnAWIWfI9k5hpX19QooPIIP3GOMdMc1uRUGTxTgTFA
AsAswRY3kMzo6k7arQnUs9zbiZ9SmS43qWOIxzGnvneekHHDAcomc/oho7kgj6rK
p/f9qRrhForkgVQwdj6iBlW934yRXzeFVF3wr7Lk5GQNIEkJiNQPZs54ojBS/Kx6
3UTLT1HgOp6UY9RPEi9wubmUR+J6YjLRZMr5PCcA86EYmRoysnnJ8Q/SlBVD8npp
GVEcuvrbH3MBfhmwOPDc3RyLkEtKfSTB92k1hsmRkx9zkyuUzhcSnqQnpWGJD+xt
KHvcHRT7Uxaa+SDwUDM36BjkyVcZQy8c+Is2jA55uwNgPpiA7n82pTeT+FRGd+7i
CLQHaryu6FO6DNDv09RbPBjIiC/q814aeKJaSILP1ld9/PEBrLPdm+6lG6OKOt9D
DV6jPmfR96FydjxcmI1cgZVgPomSxv2JB1erOggB8rmX4hhWYsVQl1AXZs3LdEpJ
6clmCPspn/ufZxHslgR9/WR1EvPMQc8XtssF55p8ehRIcVSXDRcMFr3ZuqMTXcL6
8YbDmv5OGS95O1Gs4c0iQ29saW4gS2luZyA8Y29saW4ua2luZ0B1YnVudHUuY29t
PsLBdwQTAQgAIQUCTwq47wIbAwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgAAKCRBo
woffxqgCJo1bD/4gPIQ0Muy5TGHqTQ/bSiQ9oWjS5rAQvsrsVwcm2Ka7Uo8LzG8e
grZrYieJxn3Qc22b98TiT6/5+sMa3XxhxBZ9FvALve175NPOz+2pQsAV88tR5NWk
5YSzhrpzi7+klkWEVAB71hKFZcT0qNlDSeg9NXfbXOyCVNPDJQJfrtOPEuutuRuU
hrXziaRchqmlhmszKZGHWybmPWnDQEAJdRs2Twwsi68WgScqapqd1vq2+5vWqzUT
JcoHrxVOnlBq0e0IlbrpkxnmxhfQ+tx/Sw9BP9RITgOEFh6tf7uwly6/aqNWMgFL
WACArNMMkWyOsFj8ouSMjk4lglT96ksVeCUfKqvCYRhMMUuXxAe+q/lxsXC+6qok
Jlcd25I5U+hZ52pz3A+0bDDgIDXKXn7VbKooJxTwN1x2g3nsOLffXn/sCsIoslO4
6nbr0rfGpi1YqeXcTdU2Cqlj2riBy9xNgCiCrqrGfX7VCdzVwpQHyNxBzzGG6JOm
9OJ2UlpgbbSh6/GJFReW+I62mzC5VaAoPgxmH38g0mA8MvRT7yVpLep331F3Inmq
4nkpRxLd39dgj6ejjkfMhWVpSEmCnQ/Tw81z/ZCWExFp6+3Q933hGSvifTecKQlO
x736wORwjjCYH/A3H7HK4/R9kKfL2xKzD+42ejmGqQjleTGUulue8JRtpM1AQ29s
aW4gSWFuIEtpbmcgKEludGVsIENvbGluIElhbiBLaW5nIGtleSkgPGNvbGluLmtp
bmdAaW50ZWwuY29tPsLBjgQTAQgAOBYhBHBi2qTwAbnGYWcAz2jCh9/GqAImBQJn
MiLBAhsDBQsJCAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEGjCh9/GqAImQ0oP/AqO
rA08X6XKBdfSCNnqPDdjtvfQhzsO+1FYnuQmyJcXu6h07OmAdwDmN720lUT/gXVn
w0st3/1DqQSepHx0xRLMF7vHcH1AgicSLnS/YMBhpoBLck582FlBcHbKpyJPH/7S
iM5BAso0SpLwLzQsBNWZxl8tK8oqdX0KjmpxhyDUYlNCrCvxaFKuFDi9PmHOKghb
vdH9Zuagi9lM54GMrT9IfKsVmstzmF2jiFaRpuZWxNbsbxzUSPjXoYP+HguZhuNV
BwndS/atKIr8hm6W+ruAyHfne892VXE1sZlJbGE3N8gdi03aMQ+TIx5VLJfttudC
t0eFc50eYrmJ1U41flK68L2D+lw5b9M1+jD82CaPwvC/jY45Qd3NWbX8klnPUDT+
0foYLeBnu3ugKhpOnr4EFOmYDRn2nghRlsXnCKPovZHPD/3/iKU5G+CicRLv5ted
Y19zU0jX0o7gRTA95uny3NBKt93J6VsYMI+5IUd/1v2Guhdoz++rde+qYeZB/NJf
4H/L9og019l/6W5lS2j2F5Q6W+m0nf8vmF/xLHCu3V5tjpYFIFc3GkTV1J3G6479
4azfYKMNKbw6g+wbp3ZL/7K+HmEtE85ZY1msDobly8lZOLUck/qXVcw2KaMJSV11
ewlc+PQZJfgzfJlZZQM/sS5YTQBj8CGvjB6z+h5hzsFNBE6TJCgBEADF+hz+c0qF
0R58DwiM8M/PopzFu5ietBpl0jUzglaKhMZKKW7lAr4pzeE4PgJ4ZwQd0dSkx63h
RqM963Fe35iXrreglpwZxgbbGluRJpoeoGWzuUpXE6Ze0A2nICFLk79aYHsFRwnK
yol9M0AyZHCvBXi1HAdj17iXerCYN/ZILD5SO0dDiQl570/1Rp3d1z0l16DuCnK+
X3I7GT8Z9B3WAr6KCRiP0Grvopjxwkj4Z191mP/auf1qpWPXEAPLVAvu5oM7dlTI
xX7dYa6fwlcm1uobZvmtXeDEuHJ3TkbFgRHrZwuh50GMLguG1QjhIPXlzE7/PBQs
zh5zGxPj8cR81txs6K/0GGRnIrPhCIlOoTU8L+BenxZF31uutdScHw1EAgB6AsRd
wdd8a9AR+XdhHGzQel8kGyBp4MA7508ih0L9+MBPuCrSsccjwV9+mfsTszrbZosI
hVpBaeHNrUMphwFe9HbGUwQeS6tOr+pybOtNUHeiJ5aU3Npo3eZkWVGePP2O4vr8
rjVQ1xZMIWA18xUaLTvVSarV7/IqjLb0uMTz6Ng7SceqjsgxO4J35pPOCG8gy85T
md5NKe46K1xGsNG2zzfXQ6cNkofUyQFGVbLCtdfQyWV7+dgUnOnPhrTKpFfJ5lnW
pLpze0LfyW03CpWx9x4yMlwcvIFw2hLaOQARAQABwsFfBBgBCAAJBQJOkyQoAhsM
AAoJEGjCh9/GqAImeJYP/jdppMeb7AZnLGVXd8rN7CLBtfMOkXCWaOUhjMRAY7dV
IMiF1iPZc6SgiiMSsdG7JJhMjMuLTxA0kX2Z6P0+6dZlO4bDOKMIv4nNGhgSj9Nu
SKJPRiyiXKKD/wNnPXVFdBZsoHnEXGyAFGnidu4KLUJIiSm4tHJdoMk0ZaJSmwt0
dtytuC1IWH8eIaVo/Ah6FxCaznRzvGNFx+9Ofcc7+aMZ15dkg9XagOuiDZ1/r6Vu
Ew9ovnkDT4H5BAsysxo/qykX4XQ2RQSY/P3td9WNLeXLvt1aJNRcwcIEKgZ5AO3Y
QbEJt1dEfCU7TAKiRpsjnC/iQiQHGt2IvNci8oZmM3EQEi7yZqD07A6dpGTnRq9O
Q7fGhj0SS99yZvooH3fBIHA2LRuvhfDAgTrpbU0wLvkAIo0T2b9SoRCV8FEpHvR2
b86NbTU5WN4eqZQbAbnxC7tJp6kLx2Zn2uQMvfXRfnS9R1jaetvpk3h7F+r/RAAh
+EvgsPUNaiRJRRLvf9bxTQZhmNrw79eIFNsRIktniLyomJf2+WPOUECzh1lfLqe9
yiuUKv+m5uAalXdayhiPbp/JHs1EDRgSq3tiirOsKrh/KMpwz/22qGMRBjFwYBhf
6ozgujmPlO5DVFtzfwOydzNlXTky7t4VU8yTGXZTJprIO+Gs72Q1e+XVIoKl3MIx
=3DQKm6
-----END PGP PUBLIC KEY BLOCK-----

--------------2tmEwhpBIQcwaWPTsM8EINoD--

--------------B0GaHKNrEtpib7OkZCjV6BGX--

--------------OG236j0h0XoY7IECKBJWNydq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEcGLapPABucZhZwDPaMKH38aoAiYFAmhmxUwFAwAAAAAACgkQaMKH38aoAian
FA//QkOoT5kZBFlMSbMS9FP90LyQOpgCs2FTKWA591T5DnyRY64lyF0WB0ugUcWSiS5tdYexOslx
L48Lo3pUVjJCwKZnufrF8gZcS6eRv967DhbCtP5AFx/js+rIMf2y0kmEULnVzJFIZ1M4cE8wOXGS
AG/npAewQUq1cnJ/M9+pXlQCKRBxAQ0ZjnPgZj1avEl/IyE9U1kMzHA1T+xt7pGaKEu3zMXznO/8
JqFNqzhPPu9Eq0Fp07l6GsD91mxhBA073sinCrz+Vmtn0dfSZwPO5JWRkeYMrM9Y8Ln6Si6Fe1HS
9YfAzXTj77VSJbnUpRUFqeydmVT7m0O/kcUf8Ew+KgTdN6VEIZ7LzeP8tvYg6xPuxb1+MyX4N+pr
12ieLVDMWTytao3O+Kf7sLiemRoiGZrKGtYcBvUlKro7m6hILpuA56K2pc7Qkfde3ssX4jPuz5Qa
e1VARrfyfYtw24RYbijpn92sMVUL3Zz/Ke9cKyFHiaIhFBe1pmiGauI2XHO0VnphOrpWkbFMKEe3
MRgdnIuwMvh5jTc1LQiwpit9hxyYTMpUd3srUQGBL8rTJzJdgnMsQAqira6upID7LNnshUrlHOhS
yDJdNoQCGJJdXAGDdWJ60qP71yV/Bpv/pcb9CpUk2DM1Y1IpH6pt5RyK6g31H0au7nQnbf3MFBv8
3bo=
=BWgT
-----END PGP SIGNATURE-----

--------------OG236j0h0XoY7IECKBJWNydq--
