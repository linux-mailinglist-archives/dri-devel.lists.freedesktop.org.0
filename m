Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F59A18C6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 04:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B1C10E78E;
	Thu, 17 Oct 2024 02:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="Pm0f0Z8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4DE10E78E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 02:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M+c4UUDDc5vLehNLsTc8OwcGMJ1b/+YNBD20LuyHs6I=;
 b=Pm0f0Z8w9d71bWkF0fnVlxcA/l1o/u2LVHePRhPHXdry5dwuIxbCa0Qe
 5Po73c66FXftsJmbT0SaCUeGh2tWT98G0xxXEihxn82AARdIxs9yk1QfS
 xltDjq8SvpcjXcWbWndsVio+cCtQFxi/EqiL47jyIrOQ21cAuCLF4V6Pk
 v81Lbq4DDFMGSkxOSRmOSs4e2H3fhEo4cQsC/pw1BnwjdxDYvOPcPej7g
 U0GFV7TUYmr8Ao69s7cpIdD9JmIphPBvClk6zB7YDCbWRvO6jQztN6Mmp
 ckxfKTmowrbeBkfGUNL0E8Msp3QNj+vftrGtd6LdhRPhmaow8uZI/6Pf+ g==;
X-CSE-ConnectionGUID: 95R0Mxs9TFubw23q1Gok4g==
X-CSE-MsgGUID: Vf5vw6bbSQORsuOxYR8iqg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 17 Oct 2024 10:50:30 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 49H2oRoG084396;
 Thu, 17 Oct 2024 10:50:27 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 10:50:26 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Thu, 17 Oct 2024 10:50:26 +0800
From: <Hermes.Wu@ite.com.tw>
To: <treapking@chromium.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <Kenneth.Hung@ite.com.tw>, <Pet.Weng@ite.com.tw>
Subject: RE: [PATCH v6 00/10] drm/bridge: it6505: fix HDCP CTS fail items and
 add MCCS support
Thread-Topic: [PATCH v6 00/10] drm/bridge: it6505: fix HDCP CTS fail items and
 add MCCS support
Thread-Index: AQHbIBW12yCYgM8QaEWs6T2K4Uuy/LKKMpxw//+EEgCAAIbXkA==
Date: Thu, 17 Oct 2024 02:50:26 +0000
Message-ID: <e74db21267164456ab1c2807c7f89dc3@ite.com.tw>
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
 <CAEXTbpfSJJF7W6ga9R5ns5naHgK0r=smCierau5fbLAztkjVwA@mail.gmail.com>
 <7713a68327a849a5b83f6acd0661bfff@ite.com.tw>
 <CAEXTbpf-oyc2UYHmnHp4qLPm7r2D5O0R4Ya4mAnDRSoOt5KGrA@mail.gmail.com>
In-Reply-To: <CAEXTbpf-oyc2UYHmnHp4qLPm7r2D5O0R4Ya4mAnDRSoOt5KGrA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.80.25]
x-tm-snts-smtp: 9C6F3A672BD75CE9ED6E9F0D1B178004F3B3F96A9CBE19F620931E9B432D0A732002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 49H2oRoG084396
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

SGksDQoNCj5IaSwNCj4NCj5PbiBXZWQsIE9jdCAxNiwgMjAyNCBhdCAxMDoxMOKAr1BNIDxIZXJt
ZXMuV3VAaXRlLmNvbS50dz4gd3JvdGU6DQo+Pg0KPj4gPg0KPj4gPg0KPj4gPi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+PiA+RnJvbTogUGluLXllbiBMaW4gPHRyZWFwa2luZ0BjaHJvbWl1
bS5vcmc+DQo+PiA+U2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTcsIDIwMjQgNTo1MiBBTQ0KPj4g
PlRvOiBIZXJtZXMgV3UgKOWQs+S9s+WujykgPEhlcm1lcy5XdUBpdGUuY29tLnR3Pg0KPj4gPkNj
OiBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT47IE5laWwgQXJtc3Ryb25n
IA0KPj4gPjxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgUm9iZXJ0IEZvc3MgPHJmb3NzQGtl
cm5lbC5vcmc+OyBMYXVyZW50IA0KPj4gPlBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+OyBKb25hcyBLYXJsbWFuIA0KPj4gPjxqb25hc0Brd2lib28uc2U+OyBKZXJu
ZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPjsgTWFhcnRlbiANCj4+ID5MYW5r
aG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47IE1heGltZSBSaXBhcmQg
DQo+PiA+PG1yaXBhcmRAa2VybmVsLm9yZz47IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPjsgRGF2aWQgDQo+PiA+QWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IFNpbW9u
YSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD47IA0KPj4gPkFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJl
Z25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+OyANCj4+ID5kcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyANCj4+ID5LZW5uZXRoIEh1bmcgKOa0quWutuWAqykgPEtlbm5ldGguSHVuZ0BpdGUuY29tLnR3
PjsgUGV0IFdlbmcgKOe/geeOieiKrCkgDQo+PiA+PFBldC5XZW5nQGl0ZS5jb20udHc+DQo+PiA+
U3ViamVjdDogUmU6IFtQQVRDSCB2NiAwMC8xMF0gZHJtL2JyaWRnZTogaXQ2NTA1OiBmaXggSERD
UCBDVFMgZmFpbCANCj4+ID5pdGVtcyBhbmQgYWRkIE1DQ1Mgc3VwcG9ydA0KPj4gPg0KPj4gPkhp
IEhlcm1lcywNCj4+ID4NCj4+ID5PbiBXZWQsIE9jdCAxNiwgMjAyNCBhdCAzOjU04oCvQU0gSGVy
bWVzIFd1IHZpYSBCNCBSZWxheSA8ZGV2bnVsbCtIZXJtZXMud3UuaXRlLmNvbS50d0BrZXJuZWwu
b3JnPiB3cm90ZToNCj4+ID4+DQo+PiA+PiBUaGlzIGlzIGEgdjYgcGF0Y2gtc2V0Lg0KPj4gPj4N
Cj4+ID4+IFRoZXJlIGFyZSBsb3RzIG9mIGZhaWx1cmUgaXRlbXMgd2hpbGUgcnVubmluZyBIRENQ
IENUUyB1c2luZyBVTklHUkFGIERQUi0xMDAuDQo+PiA+PiBJbiBPcmRlciB0byBmaXggdGhvc2Ug
ZmFpbHVyZXMsIEhEQ1AgZmxvdyBuZWVkcyB0byBiZSBjaGFuZ2VkLg0KPj4gPj4NCj4+ID4+IFRo
ZSBEaXNwbGF5UG9ydCBBVVggcHJvdG9jb2wgc3VwcG9ydHMgSTJDIHRyYW5zcG9ydC4NCj4+ID4+
IEluIE9yZGVyIHRvIHN1cHBvcnQgTUNDUyB2aWEgdGhlIGF1eCBjaGFubmVsLCB0aGUgYXV4LWky
YyBvcGVyYXRpb24gaXMgYWRkZWQuDQo+PiA+Pg0KPj4gPj4gdjUtPnY2Og0KPj4gPj4gICAgICAg
ICAta2VlcCB0aGUgY29tbWl0IG1lc3NhZ2Ugd3JhcHBlZCBhdCA3Mi03NSBjaGFycy4NCj4+ID4+
ICAgICAgICAgLVsxMC8xMF0gZml4IHJldHVybiB2YXJpYWJsZSBiZWluZyB1c2VkIHdpdGhvdXQg
YmVpbmcgDQo+PiA+PiBpbml0aWFsaXplZA0KPj4gPj4NCj4+ID4+IHY0LT52NToNCj4+ID4+ICAg
ICAgICAgLWFkZCBtb3JlIG1lc3NhZ2VzIGZvciBjaGFuZ2VzLg0KPj4gPj4gICAgICAgICAtWzIv
MTBdIG1vZGlmaWVkIEFVWCB0cmFuc2ZlciBkYXRhIHNpemUganVkZ21lbnQuDQo+PiA+PiAgICAg
ICAgICAgICAgICAgY2hhbmdlIGZvci1sb29wIHRvIGRvLXdoaWxlLg0KPj4gPj4gICAgICAgICAt
WzcvMTBdIGNoYW5nZSBmb3ItbG9vcCB0byBkby13aGlsZS4NCj4+ID4+ICAgICAgICAgLVs5LzEw
XSBjaGFuZ2Ugd2FpdCB0aW1lciB3aXRoIHRpbWVyX2FmdGVyKCkNCj4+ID4+DQo+PiA+PiAgICAg
ICAgIGxpbmtzOg0KPj4gPj4gICAgICAgICANCj4+ID4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20v
djMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA5MjYwNzQNCj4+ID4+IDc1NS4y
MjE3Ni00LUhlcm1lcy5XdUBpdGUuY29tLnR3L19fOyEhSHRuTEU4QSFIMDZrbTVXTmE4VmdvUjI1
TXZXdU4NCj4+ID4+IEFHWXVKR1NjQ1hReDB0UXduaV9OUEhLd09xVDRoTnBhQ3JGWlBQTVZLZXFC
WFhIVFJvR2oxQzJwWmF6dW1FOHZBJA0KPj4gPj4NCj4+ID4+IGh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA5MjYwNzUNCj4+ID4+IDEz
NCANCj4+ID4+IC4yMjM5NC0xLUhlcm1lcy5XdUBpdGUuY29tLnR3L19fOyEhSHRuTEU4QSFIMDZr
bTVXTmE4VmdvUjI1TXZXdU5BR1kNCj4+ID4+IHVKRyBTY0NYUXgwdFF3bmlfTlBIS3dPcVQ0aE5w
YUNyRlpQUE1WS2VxQlhYSFRSb0dqMUMycFpiN1lGcjRtdyQNCj4+ID4+DQo+PiA+PiB2My0+djQ6
DQo+PiA+PiAgICAgICAgIC1zcGxpdCBjaGFuZ2VzICBpbnRvIHBhdGNoZXMuDQo+PiA+Pg0KPj4g
Pj4gdjItPnYzOg0KPj4gPj4gICAgICAgICAtc3BsaXQgYXV4IHJlYWQgIEtTViBmdW5jdGlvbiB0
byBhIHBhdGNoLg0KPj4gPj4gICAgICAgICAtWzEvM10gbmV3IGluIHYzDQo+PiA+PiAgICAgICAg
IC1bMi8zXSBhZGQgZGVzY3JpcHRpb24gb2YgcGF0Y2gNCj4+ID4+DQo+PiA+PiB2MS0+djI6DQo+
PiA+PiAgICAgICAgIC0gaWdub3JlZC4NCj4+ID4+DQo+PiA+PiBIZXJtZXMgV3UgKDEwKToNCj4+
ID4+ICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBDaGFuZ2UgZGVmaW5pdGlvbiBvZiBBVVhfRklGT19N
QVhfU0laRQ0KPj4gPj4gICBkcm0vYnJpZGdlOiBpdDY1MDU6IGltcHJvdmUgQVVYIG9wZXJhdGlv
biBmb3IgZWRpZCByZWFkDQo+PiA+PiAgIGRybS9icmlkZ2U6IGl0NjUwNTogYWRkIEFVWCBvcGVy
YXRpb24gZm9yIEhEQ1AgS1NWIGxpc3QgcmVhZA0KPj4gPj4gICBkcm0vYnJpZGdlOiBpdDY1MDU6
IENoYW5nZSBkZWZpbml0aW9uIE1BWF9IRENQX0RPV05fU1RSRUFNX0NPVU5UDQo+PiA+PiAgIGRy
bS9icmlkZ2U6IGl0NjUwNTogZml4IEhEQ1AgQnN0YXR1cyBjaGVjaw0KPj4gPj4gICBkcm0vYnJp
ZGdlOiBpdDY1MDU6IGZpeCBIRENQIGVuY3J5cHRpb24gd2hlbiBSMCByZWFkeQ0KPj4gPj4gICBk
cm0vYnJpZGdlOiBpdDY1MDU6IGZpeCBIRENQIENUUyBLU1YgbGlzdCByZWFkIHdpdGggVU5JR1JB
RiBEUFItMTAwLg0KPj4gPj4gICBkcm0vYnJpZGdlOiBpdDY1MDU6IGZpeCBIRENQIENUUyBjb21w
YXJlIFYgbWF0Y2hpbmcNCj4+ID4+ICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBmaXggSERDUCBDVFMg
S1NWIGxpc3Qgd2FpdCB0aW1lcg0KPj4gPj4gICBkcm0vYnJpZGdlOiBpdDY1MDU6IGFkZCBJMkMg
ZnVuY3Rpb25hbGl0eSBvbiBBVVgNCj4+ID4+DQo+PiA+PiBDaGFuZ2UtSWQ6IElhZDBjMDU2ZDcy
YWJmMjY1NTA4MTM1N2NmNDBjM2IwZDNkZjkxNmI1DQo+PiA+PiBTaWduZWQtb2ZmLWJ5OiBIZXJt
ZXMgV3UgPEhlcm1lcy53dUBpdGUuY29tLnR3Pg0KPj4gPj4gLS0tDQo+PiA+PiBIZXJtZXMgV3Ug
KDEwKToNCj4+ID4+ICAgICAgIGRybS9icmlkZ2U6IGl0NjUwNTogQ2hhbmdlIGRlZmluaXRpb24g
b2YgQVVYX0ZJRk9fTUFYX1NJWkUNCj4+ID4+ICAgICAgIGRybS9icmlkZ2U6IGl0NjUwNTogaW1w
cm92ZSBBVVggb3BlcmF0aW9uIGZvciBlZGlkIHJlYWQNCj4+ID4+ICAgICAgIGRybS9icmlkZ2U6
IGl0NjUwNTogYWRkIEFVWCBvcGVyYXRpb24gZm9yIEhEQ1AgS1NWIGxpc3QgcmVhZA0KPj4gPj4g
ICAgICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBDaGFuZ2UgZGVmaW5pdGlvbiBNQVhfSERDUF9ET1dO
X1NUUkVBTV9DT1VOVA0KPj4gPj4gICAgICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBmaXggSERDUCBC
c3RhdHVzIGNoZWNrDQo+PiA+PiAgICAgICBkcm0vYnJpZGdlOiBpdDY1MDU6IGZpeCBIRENQIGVu
Y3J5cHRpb24gd2hlbiBSMCByZWFkeQ0KPj4gPj4gICAgICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBm
aXggSERDUCBDVFMgS1NWIGxpc3QgcmVhZCB3aXRoIFVOSUdSQUYgRFBSLTEwMC4NCj4+ID4+ICAg
ICAgIGRybS9icmlkZ2U6IGl0NjUwNTogZml4IEhEQ1AgQ1RTIGNvbXBhcmUgViBtYXRjaGluZw0K
Pj4gPj4gICAgICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBmaXggSERDUCBDVFMgS1NWIGxpc3Qgd2Fp
dCB0aW1lcg0KPj4gPj4gICAgICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBhZGQgSTJDIGZ1bmN0aW9u
YWxpdHkgb24gQVVYDQo+PiA+Pg0KPj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0
NjUwNS5jIHwgMzM0DQo+PiA+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0N
Cj4+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMjc3IGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygt
KQ0KPj4gPj4gLS0tDQo+PiA+PiBiYXNlLWNvbW1pdDogYjgxMjhmNzgxNWZmMTM1ZjAzMzNjMWI0
NmRjZGYxNTQzYzQxYjg2MA0KPj4gPj4gY2hhbmdlLWlkOiAyMDI0MTAxNS11cHN0cmVhbS12Ni05
ZjRiMDE1ZmVjZjcNCj4+ID4+DQo+PiA+PiBCZXN0IHJlZ2FyZHMsDQo+PiA+PiAtLQ0KPj4gPj4g
SGVybWVzIFd1IDxIZXJtZXMud3VAaXRlLmNvbS50dz4NCj4+ID4+DQo+PiA+Pg0KPj4gPg0KPj4g
PkknbSBub3Qgc3VyZSBpZiB0aGlzIHJlcXVpcmVzIGEgcmUtc3BpbiwgYnV0IHlvdSBhcmUgc3Vw
cG9zZWQgdG8gY29sbGVjdCB0aGUgcmV2aWV3ZWQtYnkgdGFncyB5b3UgcmVjZWl2ZWQgd2hlbiB5
b3Ugc2VuZCBvdXQgYSBuZXcgdmVyc2lvbi4gaS5lLiwgcHV0IHRoZSAiUmV2aWV3ZWQtYnk6IiBs
aW5lcyB5b3UgcmVjZWl2ZWQgYmVmb3JlIHlvdXIgIlNpZ25lZC1vZmYtYnk6IiBsaW5lLg0KPj4N
Cj4+IG9ubHkgY292ZXItbGV0dGVyIG9yIGFsbCBwYXRjaGVzPyBuZWVkICJSRVNFTkQiIGZvciBz
YW1lIHY2IHBhdGNoIGhlYWRlcj8NCj4NCj5Zb3Ugc2hvdWxkIGFkZCB0aGUgcmV2aWV3IHRhZ3Mg
dG8gdGhlIGluZGl2aWR1YWwgcGF0Y2hlcyB0aGF0IGhhdmUgbm90IGNoYW5nZWQgc2luY2UgdGhl
IHByZXZpb3VzIHJldmlldy4gRm9yIHRoaXMgc2VyaWVzLCBJIHRoaW5rIHlvdSBjYW4gd2FpdCBh
IGZldyBkYXlzIGFuZCBjb2xsZWN0IGZlZWRiYWNrcyBmcm9tIHRoZSBjb21tdW5pdHkgZmlyc3Qu
DQo+Pg0KDQpvaywgDQoNCnRoYW5rcy4NCg0KPj4gPlJlZ2FyZHMsDQo+PiA+UGluLXllbg0KPj4N
Cj4+DQo+Pg0KPj4gQlIsDQo+PiBIZXJtZXMNCj4NCj5QaW4teWVuDQo+DQoNCkJSLA0KSGVybWVz
DQoNCg==
