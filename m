Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628312ECBCB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E186E409;
	Thu,  7 Jan 2021 08:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 724 seconds by postgrey-1.36 at gabe;
 Thu, 07 Jan 2021 08:38:58 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63996E409
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 08:38:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1078LNPk025289; Thu, 7 Jan 2021 09:26:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=4tF/JarS6SNf7Z2YbkbvKZ6l54Xi5C7snXD0THCu/gk=;
 b=eEWsEexC1sTKTpHB3kzMRJsbpjU1vEjExLGPAtFY2fzaL6yMIJ/Vk1wnWwIHsrqdrDyO
 ymOhbNQivBhJbPaDBvlPQ5PbCulPMKEOmuuRkdusUJaHAtgmmY5NB/M9/R3I2fa8e2E9
 NwG4dJYadK7Mg50jT5ss7KGbOvT0aeSyWsN8XiuMRrGBl3YCVmL8PJ9D4YG4wXcSgPB6
 vqnJTXfpqZSIKbBSJFYIR7znPBXFixWYK/+5lVO5Zhi8xsVMrrOuEUik59t/ErjEi4SI
 u+cEIRMGur58U2yLOdubH2B7r9bXeJ2JYsyjonlYBqHuEDsqupWxu1ybKVa2NTlx+FMJ Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35wt32h5mr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 09:26:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C490210002A;
 Thu,  7 Jan 2021 09:26:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0EFB22AA65;
 Thu,  7 Jan 2021 09:26:47 +0100 (CET)
Received: from SFHDAG2NODE1.st.com (10.75.127.4) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 7 Jan
 2021 09:26:47 +0100
Received: from SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90]) by
 SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90%20]) with mapi id
 15.00.1473.003; Thu, 7 Jan 2021 09:26:47 +0100
From: Yannick FERTRE <yannick.fertre@st.com>
To: Marek Vasut <marex@denx.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH V2] drm/stm: Fix bus_flags handling
Thread-Topic: [PATCH V2] drm/stm: Fix bus_flags handling
Thread-Index: AQHW2bzOILrKXc2q+UyiFZreMH9ZZ6ob2W8A
Date: Thu, 7 Jan 2021 08:26:47 +0000
Message-ID: <8e46e07d-b0c7-f0f5-fa2e-2d84623fa599@st.com>
References: <20201224061953.92229-1-marex@denx.de>
In-Reply-To: <20201224061953.92229-1-marex@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <2E15316A989AA94CABB31D1E17777FC4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-07_04:2021-01-06,
 2021-01-07 signatures=0
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
Cc: Alexandre TORGUE <alexandre.torgue@st.com>,
 Antonio BORNEO <antonio.borneo@st.com>, Vincent ABRIOU <vincent.abriou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFyZWssDQp0aGFua3MgZm9yIHRoZSBwYXRjaC4gSXQgd29ya3MgZmluZSBvbiBzdG0zMm1w
MSBldmFsIGJvYXJkIHdpdGggYnJpZGdlIA0KRFNJICYgRFBJIHBhbmVsLg0KDQpUZXN0ZWQtYnk6
IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KDQpCZXN0IHJlZ2FyZHMN
Cg0KT24gMTIvMjQvMjAgNzoxOSBBTSwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+IFRoZSBkcm1fZGlz
cGxheV9tb2RlX3RvX3ZpZGVvbW9kZSgpIGRvZXMgbm90IHBvcHVsYXRlIERJU1BMQVlfRkxBR1Nf
REVfTE9XDQo+IG9yIERJU1BMQVlfRkxBR1NfUElYREFUQV9ORUdFREdFIGZsYWdzIGluIHN0cnVj
dCB2aWRlb21vZGUuIFRoZXJlZm9yZSwgbm8NCj4gbWF0dGVyIHdoYXQgcG9sYXJpdHkgdGhlIG5l
eHQgYnJpZGdlIG9yIGRpc3BsYXkgbWlnaHQgcmVxdWlyZSwgdGhlc2UgZmxhZ3MNCj4gYXJlIG5l
dmVyIHNldCwgYW5kIHRodXMgdGhlIExUREMgR0NSX0RFUE9MIGFuZCBHQ1JfUENQT0wgYml0cyBh
cmUgbmV2ZXIgc2V0LA0KPiBhbmQgdGhlIExUREMgYmVoYXZlcyBhcyBpZiBib3RoIERJU1BMQVlf
RkxBR1NfUElYREFUQV9QT1NFREdFIGFuZA0KPiBESVNQTEFZX0ZMQUdTX0RFX0hJR0ggd2VyZSBh
bHdheXMgc2V0Lg0KPiANCj4gVGhlIGZpeCBmb3IgdGhpcyBwcm9ibGVtIGlzIHRha2VuIGFsbW9z
dCB2ZXJiYXRpbSBmcm9tIE1YU0ZCIGRyaXZlci4gSW4NCj4gY2FzZSB0aGVyZSBpcyBhIGJyaWRn
ZSBhdHRhY2hlZCB0byB0aGUgTFREQywgdGhlIGJyaWRnZSBtaWdodCBoYXZlIGV4dHJhDQo+IHBv
bGFyaXR5IHJlcXVpcmVtZW50cywgc28gZXh0cmFjdCBidXNfZmxhZ3MgZnJvbSB0aGUgYnJpZGdl
IGFuZCB1c2UgdGhlbQ0KPiBmb3IgTFREQyBjb25maWd1cmF0aW9uLiBPdGhlcndpc2UsIGV4dHJh
Y3QgYnVzX2ZsYWdzIGZyb20gdGhlIGNvbm5lY3RvciwNCj4gd2hpY2ggaXMgdGhlIGRpc3BsYXku
DQo+IA0KPiBGaXhlczogYjc1OTAxMmM1ZmE3ICgiZHJtL3N0bTogQWRkIFNUTTMyIExUREMgZHJp
dmVyIikNCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+IENj
OiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4NCj4gQ2M6IEFudG9u
aW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0BzdC5jb20+DQo+IENjOiBCZW5qYW1pbiBHYWlnbmFy
ZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPg0KPiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29x
dWVsaW4uc3RtMzJAZ21haWwuY29tPg0KPiBDYzogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNv
cm51QHN0LmNvbT4NCj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4gQ2M6
IFZpbmNlbnQgQWJyaW91IDx2aW5jZW50LmFicmlvdUBzdC5jb20+DQo+IENjOiBZYW5uaWNrIEZl
cnRyZSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnDQo+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tDQo+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IC0tLQ0KPiBW
MjogQ2hlY2sgaWYgbGRldi0+YnJpZGdlLT50aW1pbmdzIGlzIG5vbi1OVUxMIGJlZm9yZSBhY2Nl
c3NpbmcgaXQNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAyMiArKysr
KysrKysrKysrKysrKysrKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmggfCAgMiAr
Kw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9zdG0vbHRkYy5jDQo+IGluZGV4IDFjOWYxOGI0YWRmYy4uMjJjN2U5ZmE1YWI3IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vc3RtL2x0ZGMuYw0KPiBAQCAtNTQ2LDExICs1NDYsMTcgQEAgc3RhdGljIHZvaWQg
bHRkY19jcnRjX21vZGVfc2V0X25vZmIoc3RydWN0IGRybV9jcnRjICpjcnRjKQ0KPiAgIAlzdHJ1
Y3QgZHJtX2RldmljZSAqZGRldiA9IGNydGMtPmRldjsNCj4gICAJc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm1vZGUgPSAmY3J0Yy0+c3RhdGUtPmFkanVzdGVkX21vZGU7DQo+ICAgCXN0cnVjdCB2
aWRlb21vZGUgdm07DQo+ICsJdTMyIGJ1c19mbGFncyA9IDA7DQo+ICAgCXUzMiBoc3luYywgdnN5
bmMsIGFjY3VtX2hicCwgYWNjdW1fdmJwLCBhY2N1bV9hY3RfdywgYWNjdW1fYWN0X2g7DQo+ICAg
CXUzMiB0b3RhbF93aWR0aCwgdG90YWxfaGVpZ2h0Ow0KPiAgIAl1MzIgdmFsOw0KPiAgIAlpbnQg
cmV0Ow0KPiAgIA0KPiArCWlmIChsZGV2LT5icmlkZ2UgJiYgbGRldi0+YnJpZGdlLT50aW1pbmdz
KQ0KPiArCQlidXNfZmxhZ3MgPSBsZGV2LT5icmlkZ2UtPnRpbWluZ3MtPmlucHV0X2J1c19mbGFn
czsNCj4gKwllbHNlIGlmIChsZGV2LT5jb25uZWN0b3IpDQo+ICsJCWJ1c19mbGFncyA9IGxkZXYt
PmNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmJ1c19mbGFnczsNCj4gKw0KPiAgIAlpZiAoIXBtX3J1
bnRpbWVfYWN0aXZlKGRkZXYtPmRldikpIHsNCj4gICAJCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5
bmMoZGRldi0+ZGV2KTsNCj4gICAJCWlmIChyZXQpIHsNCj4gQEAgLTU4NiwxMCArNTkyLDEwIEBA
IHN0YXRpYyB2b2lkIGx0ZGNfY3J0Y19tb2RlX3NldF9ub2ZiKHN0cnVjdCBkcm1fY3J0YyAqY3J0
YykNCj4gICAJaWYgKHZtLmZsYWdzICYgRElTUExBWV9GTEFHU19WU1lOQ19ISUdIKQ0KPiAgIAkJ
dmFsIHw9IEdDUl9WU1BPTDsNCj4gICANCj4gLQlpZiAodm0uZmxhZ3MgJiBESVNQTEFZX0ZMQUdT
X0RFX0xPVykNCj4gKwlpZiAoYnVzX2ZsYWdzICYgRFJNX0JVU19GTEFHX0RFX0xPVykNCj4gICAJ
CXZhbCB8PSBHQ1JfREVQT0w7DQo+ICAgDQo+IC0JaWYgKHZtLmZsYWdzICYgRElTUExBWV9GTEFH
U19QSVhEQVRBX05FR0VER0UpDQo+ICsJaWYgKGJ1c19mbGFncyAmIERSTV9CVVNfRkxBR19QSVhE
QVRBX0RSSVZFX05FR0VER0UpDQo+ICAgCQl2YWwgfD0gR0NSX1BDUE9MOw0KPiAgIA0KPiAgIAly
ZWdfdXBkYXRlX2JpdHMobGRldi0+cmVncywgTFREQ19HQ1IsDQo+IEBAIC0xMDk4LDYgKzExMDQs
OCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2hlbHBlcl9mdW5jcyBsdGRjX2Vu
Y29kZXJfaGVscGVyX2Z1bmNzID0gew0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgbHRkY19lbmNvZGVy
X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYsIHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Up
DQo+ICAgew0KPiArCXN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGRkZXYtPmRldl9wcml2YXRl
Ow0KPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yX2xpc3RfaXRlciBpdGVyOw0KPiAgIAlzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXI7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+IEBAIC0xMTE5LDYg
KzExMjcsMTYgQEAgc3RhdGljIGludCBsdGRjX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGRldiwgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCj4gICAJCXJldHVybiAtRUlOVkFM
Ow0KPiAgIAl9DQo+ICAgDQo+ICsJbGRldi0+YnJpZGdlID0gYnJpZGdlOw0KPiArDQo+ICsJLyoN
Cj4gKwkgKiBHZXQgaG9sZCBvZiB0aGUgY29ubmVjdG9yLiBUaGlzIGlzIGEgYml0IG9mIGEgaGFj
aywgdW50aWwgdGhlIGJyaWRnZQ0KPiArCSAqIEFQSSBnaXZlcyB1cyBidXMgZmxhZ3MgYW5kIGZv
cm1hdHMuDQo+ICsJICovDQo+ICsJZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oZGRldiwg
Jml0ZXIpOw0KPiArCWxkZXYtPmNvbm5lY3RvciA9IGRybV9jb25uZWN0b3JfbGlzdF9pdGVyX25l
eHQoJml0ZXIpOw0KPiArCWRybV9jb25uZWN0b3JfbGlzdF9pdGVyX2VuZCgmaXRlcik7DQo+ICsN
Cj4gICAJRFJNX0RFQlVHX0RSSVZFUigiQnJpZGdlIGVuY29kZXI6JWQgY3JlYXRlZFxuIiwgZW5j
b2Rlci0+YmFzZS5pZCk7DQo+ICAgDQo+ICAgCXJldHVybiAwOw0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3N0bS9sdGRjLmggYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuaA0KPiBp
bmRleCBmMTUzYjkwOGM3MGUuLmQwZDJjODFkZTI5YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmgNCj4g
QEAgLTM4LDYgKzM4LDggQEAgc3RydWN0IGx0ZGNfZGV2aWNlIHsNCj4gICAJdTMyIGlycV9zdGF0
dXM7DQo+ICAgCXN0cnVjdCBmcHNfaW5mbyBwbGFuZV9mcHNpW0xURENfTUFYX0xBWUVSXTsNCj4g
ICAJc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN1c3BlbmRfc3RhdGU7DQo+ICsJc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZTsNCj4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOw0K
PiAgIH07DQo+ICAgDQo+ICAgaW50IGx0ZGNfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldik7
DQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
