Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C58CCAAB
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 04:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3EF10E15C;
	Thu, 23 May 2024 02:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="lCQztU9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921B410E15C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 02:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NJXcidCTRToYs0IwR46zej5GAyPnVh2cP1Z9J0t//Yc=;
 b=lCQztU9yDc7R3zhJli+6sXgEcCATROeRrD/Fm075bdPUqYJb0jZg4bqB
 3y9RKECjRPU+IsR5E8QN0U+EvfwNy0lHxS6heYJhy907p4bBmcNyrQt1Z
 ResmkNZ937deTVIGWCcq7Rok1lJZdWklhE9hcF8c8fgz4kkdutAhQvWXW
 HyQUJHaGYmpWMoTfATOuDBJFwKDrKGLVuCYVFy3C4641h4E+bCJJcV1A4
 ulk2la+/NZTyNhZJgN4OEvyOCv0/2dr5K9CZeICzzGmLD//YJsXlY6mgz
 rQNg1UGtKUPGlHOpE7ImAfaUQ39+GyyRyegJMVr3734DqC1CzysnMbtmP g==;
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 23 May 2024 10:20:16 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 44N2KBir068194;
 Thu, 23 May 2024 10:20:11 +0800 (GMT-8)
 (envelope-from kuro.chung@ite.com.tw)
Received: from CSBMAIL1.internal.ite.com.tw (192.168.65.58) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 23 May 2024 10:20:10 +0800
Received: from CSBMAIL1.internal.ite.com.tw ([fe80::c9da:6689:2b22:a2d6]) by
 CSBMAIL1.internal.ite.com.tw ([fe80::c9da:6689:2b22:a2d6%3]) with mapi id
 15.01.2507.035; Thu, 23 May 2024 10:20:10 +0800
From: <kuro.chung@ite.com.tw>
To: <rfoss@kernel.org>, <mripard@kernel.org>, <tzimmermann@suse.de>,
 <jonas@kwiboo.se>, <daniel@ffwll.ch>,
 <angelogioacchino.delregno@collabora.com>, <allen.chen@ite.com.tw>,
 <neil.armstrong@linaro.org>, <Laurent.pinchart@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <airlied@gmail.com>,
 <Kenneth.Hung@ite.com.tw>, <dri-devel@lists.freedesktop.org>,
 <treapking@chromium.org>, <andrzej.hajda@intel.com>,
 <jernej.skrabec@gmail.com>, <linux-kernel@vger.kernel.org>,
 <Hermes.Wu@ite.com.tw>
Subject: RE: [PATCH v13] drm/bridge: it6505: fix hibernate to resume no
 display issue
Thread-Topic: [PATCH v13] drm/bridge: it6505: fix hibernate to resume no
 display issue
Thread-Index: AQHarEF1RyVNwB74Y0uCe4AHqbJSWrGkFYQA
Date: Thu, 23 May 2024 02:20:10 +0000
Message-ID: <39420a7df0884000b993dea89c124b57@ite.com.tw>
References: <20240522065528.1053439-1-kuro.chung@ite.com.tw>
 <171637999486.1598011.4983921044000498146.b4-ty@kernel.org>
In-Reply-To: <171637999486.1598011.4983921044000498146.b4-ty@kernel.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.70.11]
x-tm-snts-smtp: 3E144EBE72A89DF0D9F0957737E552CFF494FD81F32C04417334BFC8901874A42002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 44N2KBir068194
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSb2JlcnQgRm9zcyA8cmZvc3NA
a2VybmVsLm9yZz4gDQpTZW50OiBXZWRuZXNkYXksIE1heSAyMiwgMjAyNCA4OjEzIFBNDQpUbzog
TWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+OyBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+OyBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPjsgQWxsZW4gQ2hlbiA8YWxs
ZW4uY2hlbkBpdGUuY29tLnR3PjsgTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFy
by5vcmc+OyBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5j
b20+OyBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
PjsgRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IEt1cm8gQ2h1bmcgKOmQmOS7leW7
tykgPGt1cm8uY2h1bmdAaXRlLmNvbS50dz47IEtlbm5ldGggSHVuZyAo5rSq5a625YCrKSA8S2Vu
bmV0aC5IdW5nQGl0ZS5jb20udHc+OyBvcGVuIGxpc3Q6RFJNIERSSVZFUlMgPGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc+OyBQaW4teWVuIExpbiA8dHJlYXBraW5nQGNocm9taXVtLm9y
Zz47IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPjsgSmVybmVqIFNrcmFi
ZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT47IG9wZW4gbGlzdCA8bGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZz47IEhlcm1lcyBXdSAo5ZCz5L2z5a6PKSA8SGVybWVzLld1QGl0ZS5jb20u
dHc+DQpTdWJqZWN0OiBSZTogW1BBVENIIHYxM10gZHJtL2JyaWRnZTogaXQ2NTA1OiBmaXggaGli
ZXJuYXRlIHRvIHJlc3VtZSBubyBkaXNwbGF5IGlzc3VlDQoNCk9uIFdlZCwgMjIgTWF5IDIwMjQg
MTQ6NTU6MjggKzA4MDAsIGt1cm8gd3JvdGU6DQo+IEZyb206IEt1cm8gQ2h1bmcgPGt1cm8uY2h1
bmdAaXRlLmNvbS50dz4NCj4gDQo+IFdoZW4gdGhlIHN5c3RlbSBwb3dlciByZXN1bWVzLCB0aGUg
VFRMIGlucHV0IG9mIElUNjUwNSBtYXkgZXhwZXJpZW5jZSANCj4gc29tZSBub2lzZSBiZWZvcmUg
dGhlIHZpZGVvIHNpZ25hbCBzdGFiaWxpemVzLCBuZWNlc3NpdGF0aW5nIGEgdmlkZW8gDQo+IHJl
c2V0LiBUaGlzIHBhdGNoIGlzIGltcGxlbWVudGVkIHRvIHByZXZlbnQgYSBsb29wIG9mIHZpZGVv
IGVycm9yIA0KPiBpbnRlcnJ1cHRzLCB3aGljaCBjYW4gb2NjdXIgd2hlbiBhIHZpZGVvIHJlc2V0
IGluIHRoZSB2aWRlbyBGSUZPIGVycm9yIA0KPiBpbnRlcnJ1cHQgdHJpZ2dlcnMgYW5vdGhlciBz
dWNoIGludGVycnVwdC4gVGhlIHBhdGNoIHByb2Nlc3NlcyB0aGUgDQo+IFNDRFQgYW5kIEZJRk8g
ZXJyb3IgaW50ZXJydXB0cyBzaW11bHRhbmVvdXNseSBhbmQgaWdub3JlcyBhbnkgdmlkZW8gDQo+
IEZJRk8gZXJyb3IgaW50ZXJydXB0cyBjYXVzZWQgYnkgYSB2aWRlbyByZXNldC4NCj4gDQo+IFsu
Li5dDQoNCkFwcGxpZWQsIHRoYW5rcyENCj4gdGhhbmtzIGV2ZXJ5b25lIGZvciB5b3VyIGhlbHAh
LCBJIHJlYWxseSBhcHByZWNpYXRlIGl0Lg0KDQpbMS8xXSBkcm0vYnJpZGdlOiBpdDY1MDU6IGZp
eCBoaWJlcm5hdGUgdG8gcmVzdW1lIG5vIGRpc3BsYXkgaXNzdWUNCiAgICAgIGh0dHBzOi8vY2dp
dC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9NDg0NDM2ZWM1YzJiDQoN
Cg0KDQpSb2INCg0K
