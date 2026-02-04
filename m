Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BJWBXrKhGk45QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 17:51:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48937F57E1
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 17:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC4A10E925;
	Thu,  5 Feb 2026 16:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kaspersky.com header.i=@kaspersky.com header.b="Fx731CpU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx9.kaspersky-labs.com (mx9.kaspersky-labs.com [195.122.169.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D10F10E100
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 14:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
 s=mail202505; t=1770217000;
 bh=hJRv7Oarwa60guT9O+RN6FK8kiq9wZipNgVGYy4yhUY=;
 h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
 b=Fx731CpUxFcBKcGTewFkc5SkqFi9oiQtiQ0wXJ5gyREpMhA3qKeYrCcPLa7JKNPqQ
 EhcyMueIWv4Xn8q0fwFJnvAh26t9eCKrQEkki0WIXng6CdZkXHk9eHqJFoIID6/MR6
 BnxpLNyWfRuBwu0HVf5+ItOFRrcg/goEsyPTqJUtdrSG2t7G0q5TvUIyCVdHp76BRz
 ohUI2pEJbkitGAEWkAlJCMbE067b9WOAW56a1S+gu3kPS+pRn4Kia1OxvITngX02v5
 Gq8KgRZNSnP9wEQdgctkAJUJCILyuEW/kxhNNeVJPXFhVYEJKnBUy5ECEYC/uJQ599
 NzxZ8IfYwgRHA==
Received: from relay9.kaspersky-labs.com (localhost [127.0.0.1])
 by relay9.kaspersky-labs.com (Postfix) with ESMTP id 15E538A084A;
 Wed,  4 Feb 2026 17:56:40 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail-hq2.kaspersky.com",
 Issuer "Kaspersky MailRelays CA G3" (verified OK))
 by mailhub9.kaspersky-labs.com (Postfix) with ESMTPS id 8D31F8A06F8;
 Wed,  4 Feb 2026 17:56:39 +0300 (MSK)
Received: from HQMAILSRV1.avp.ru (10.64.57.51) by HQMAILSRV3.avp.ru
 (10.64.57.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 4 Feb
 2026 17:56:38 +0300
Received: from HQMAILSRV1.avp.ru ([fe80::44b0:5a05:5379:9408]) by
 HQMAILSRV1.avp.ru ([fe80::44b0:5a05:5379:9408%2]) with mapi id
 15.02.2562.035; Wed, 4 Feb 2026 17:56:38 +0300
From: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>
To: Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, "nd@arm.com"
 <nd@arm.com>
Subject: RE: [PATCH] drm/komeda: fix integer overflow in AFBC framebuffer size
 check
Thread-Topic: [PATCH] drm/komeda: fix integer overflow in AFBC framebuffer
 size check
Thread-Index: AQHclRP6O05dHMqcvkmuYUf+ZXwIGLVxT70AgAEG/wCAAEltUA==
Date: Wed, 4 Feb 2026 14:56:38 +0000
Message-ID: <57df230af1624c679a947317152fd8ed@kaspersky.com>
References: <20260203134907.1587067-1-Alexander.Konyukhov@kaspersky.com>
 <ct5tkr764socel5o4gtd4k2fgofqiljy3yzdjokij3jjkcf2ks@c3p7fs33znoe>
 <aYNIjm8XIdxKNo-0@e142607>
In-Reply-To: <aYNIjm8XIdxKNo-0@e142607>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.32.57.18]
x-kse-serverinfo: HQMAILSRV3.avp.ru, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 2/4/2026 11:49:00 AM
x-kse-bulkmessagesfiltering-scan-result: InTheLimit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310,
 bases: 2026/02/04 11:41:00 #28178294
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52
X-Mailman-Approved-At: Thu, 05 Feb 2026 16:50:57 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	DATE_IN_PAST(1.00)[25];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kaspersky.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kaspersky.com:s=mail202505];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Alexander.Konyukhov@kaspersky.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:liviu.dudau@arm.com,m:brian.starkey@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lvc-project@linuxtesting.org,m:nd@arm.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,linuxtesting.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Alexander.Konyukhov@kaspersky.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kaspersky.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,kaspersky.com:email,kaspersky.com:dkim,kaspersky.com:mid,suse.de:email]
X-Rspamd-Queue-Id: 48937F57E1
X-Rspamd-Action: no action

VGhhbmsgeW91IGZvciB0aGUgcmVwbGllcy4NCg0KQWNjb3JkaW5nIHRvIElTTyA5ODk5IDYuMy4x
IGJvdGggb3BlcmFuZHMgYXJlIGZpcnN0IGNvbnZlcnRlZCB0byBhIGNvbW1vbiB0eXBlICh1MzIp
LCB0aGVyZSBhcmUgbm8gZGVmaW5lZCBsaW1pdHMgb2Yga2ZiLT5hZmJjX3NpemUgYW5kIGZiLT5v
ZmZzZXRzWzBdICwgc28gbWluX3NpemUgY2FuIGhhdmUgYW4gb3ZlcmZsb3dlZCB1MzIgdmFsdWUu
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBMaXZpdSBEdWRhdSA8bGl2aXUu
ZHVkYXVAYXJtLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDQsIDIwMjYgNDoyNSBQ
TQ0KVG86IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4NCkNjOiBBbGV4YW5k
ZXIgS29ueXVraG92IDxBbGV4YW5kZXIuS29ueXVraG92QGthc3BlcnNreS5jb20+OyBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJp
cGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRl
ciA8c2ltb25hQGZmd2xsLmNoPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbHZjLXByb2plY3RAbGludXh0ZXN0aW5nLm9yZzsg
bmRAYXJtLmNvbQ0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2tvbWVkYTogZml4IGludGVnZXIg
b3ZlcmZsb3cgaW4gQUZCQyBmcmFtZWJ1ZmZlciBzaXplIGNoZWNrDQoNCkNhdXRpb246IFRoaXMg
aXMgYW4gZXh0ZXJuYWwgZW1haWwuDQoNCg0KDQpPbiBUdWUsIEZlYiAwMywgMjAyNiBhdCAwOTo0
MzoxMlBNICswMDAwLCBCcmlhbiBTdGFya2V5IHdyb3RlOg0KPiBIaSBBbGV4YW5kZXIsDQo+DQo+
IE9uIFR1ZSwgRmViIDAzLCAyMDI2IGF0IDA0OjQ4OjQ2UE0gKzAwMDAsIEFsZXhhbmRlciBLb255
dWtob3Ygd3JvdGU6DQo+ID4gVGhlIEFGQkMgZnJhbWVidWZmZXIgc2l6ZSB2YWxpZGF0aW9uIGNh
bGN1bGF0ZXMgdGhlIG1pbmltdW0gcmVxdWlyZWQgDQo+ID4gYnVmZmVyIHNpemUgYnkgYWRkaW5n
IHRoZSBBRkJDIHBheWxvYWQgc2l6ZSB0byB0aGUgZnJhbWVidWZmZXIgb2Zmc2V0Lg0KPiA+IFRo
aXMgYWRkaXRpb24gaXMgcGVyZm9ybWVkIHdpdGhvdXQgY2hlY2tpbmcgZm9yIGludGVnZXIgb3Zl
cmZsb3cuDQo+ID4NCj4gPiBJZiB0aGUgYWRkaXRpb24gb3ZlZmxvd3MsIHRoZSBzaXplIGNoZWNr
IG1heSBpbmNvcnJlY3RseSBzdWNjZWQgYW5kIA0KPiA+IGFsbG93IHVzZXJzcGFjZSB0byBwcm92
aWRlIGFuIHVuZGVyc2l6ZWQgZHJtX2dlbV9vYmplY3QsIHBvdGVudGlhbGx5IA0KPiA+IGxlYWRp
bmcgdG8gb3V0LW9mLWJvdW5kcyBtZW1vcnkgYWNjZXNzLg0KPiA+DQo+ID4gQWRkIHVzYWdlIG9m
IGNoZWNrX2FkZF9vdmVyZmxvdygpIHRvIHNhZmVseSBjb21wdXRlIHRoZSBtaW5pbXVtIA0KPiA+
IHJlcXVpcmVkIHNpemUgYW5kIHJlamVjdCB0aGUgZnJhbWVidWZmZXIgaWYgYW4gb3ZlcmZsb3cg
aXMgZGV0ZWN0ZWQuDQo+ID4gVGhpcyBtYWtlcyB0aGUgQUZCQyBzaXplIHZhbGlkYXRpb24gbW9y
ZSByb2J1c3QgYWdhaW5zdCBtYWxmb3JtZWQuDQo+ID4NCj4gPiBGb3VuZCBieSBMaW51eCBWZXJp
ZmljYXRpb24gQ2VudGVyIChsaW51eHRlc3Rpbmcub3JnKSB3aXRoIFNWQUNFLg0KPiA+DQo+ID4g
Rml4ZXM6IDY1YWQyMzkyZGQ2ZCAoImRybS9rb21lZGE6IEFkZGVkIEFGQkMgc3VwcG9ydCBmb3Ig
a29tZWRhIA0KPiA+IGRyaXZlciIpDQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEtvbnl1
a2hvdiANCj4gPiA8QWxleGFuZGVyLktvbnl1a2hvdkBrYXNwZXJza3kuY29tPg0KPiA+IC0tLQ0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZl
ci5jIHwgNiArKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMgDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jDQo+ID4gaW5kZXggM2NhNDYx
ZWIwYTI0Li4zY2IzNGQwM2Y3ZjggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMNCj4gPiBAQCAt
NCw2ICs0LDggQEANCj4gPiAgICogQXV0aG9yOiBKYW1lcy5RaWFuLldhbmcgPGphbWVzLnFpYW4u
d2FuZ0Bhcm0uY29tPg0KPiA+ICAgKg0KPiA+ICAgKi8NCj4gPiArI2luY2x1ZGUgPGxpbnV4L292
ZXJmbG93Lmg+DQo+ID4gKw0KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4NCj4gPiAg
I2luY2x1ZGUgPGRybS9kcm1fZmJfZG1hX2hlbHBlci5oPg0KPiA+ICAjaW5jbHVkZSA8ZHJtL2Ry
bV9nZW0uaD4NCj4gPiBAQCAtOTMsNyArOTUsOSBAQCBrb21lZGFfZmJfYWZiY19zaXplX2NoZWNr
KHN0cnVjdCBrb21lZGFfZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpmaWxlLA0KPiA+ICAgICBr
ZmItPmFmYmNfc2l6ZSA9IGtmYi0+b2Zmc2V0X3BheWxvYWQgKyBuX2Jsb2NrcyAqDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgQUxJR04oYnBwICogQUZCQ19TVVBFUkJMS19QSVhFTFMgLyA4LA0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFGQkNfU1VQRVJCTEtfQUxJR05NRU5UKTsN
Cj4gPiAtICAgbWluX3NpemUgPSBrZmItPmFmYmNfc2l6ZSArIGZiLT5vZmZzZXRzWzBdOw0KPg0K
PiBDYW4gdGhpcyByZWFsbHkgb3ZlcmZsb3c/IElzIHRoZSBjb25jZXJuIGEgaHlwb3RoZXRpY2Fs
IElMUDY0IA0KPiBzaXR1YXRpb24/DQo+DQo+IG1pbl9zaXplIGlzIHU2NCwga2ZiLT5hZmJjX3Np
emUgaXMgdTMyLCBhbmQgZmItPm9mZnNldHNbMF0gaXMgdW5zaWduZWQgDQo+IGludC4NCg0KWWVh
aCwgSSB3YXMgdGhpbmtpbmcgdGhlIHNhbWUgdGhpbmcgeWVzdGVyZGF5IGF0IHRoZSBlbmQgb2Yg
dGhlIHdvcmsgZGF5IHdoZW4gSSBsb29rZWQgYXQgdGhlIHBhdGNoLiBJIGRvbid0IHRoaW5rIGZv
bGxvd2luZyB0aGUgY2FsbCBmbG93IHlvdSBjYW4gZW5kIHVwIHdpdGggYW4gb3ZlcmZsb3cuDQoN
CkJlc3QgcmVnYXJkcywNCkxpdml1DQoNCj4NCj4gVGhhbmtzLA0KPiAtQnJpYW4NCj4NCj4gPiAr
ICAgaWYgKGNoZWNrX2FkZF9vdmVyZmxvdyhrZmItPmFmYmNfc2l6ZSwgZmItPm9mZnNldHNbMF0s
ICZtaW5fc2l6ZSkpIHsNCj4gPiArICAgICAgICAgICBnb3RvIGNoZWNrX2ZhaWxlZDsNCj4gPiAr
ICAgfQ0KPiA+ICAgICBpZiAobWluX3NpemUgPiBvYmotPnNpemUpIHsNCj4gPiAgICAgICAgICAg
ICBEUk1fREVCVUdfS01TKCJhZmJjIHNpemUgY2hlY2sgZmFpbGVkLCBvYmpfc2l6ZTogMHglengu
IG1pbl9zaXplIDB4JWxseC5cbiIsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBvYmot
PnNpemUsIG1pbl9zaXplKTsNCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo=
