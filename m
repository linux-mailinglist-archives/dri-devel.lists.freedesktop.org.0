Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF8CD2CEA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 16:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4E96EB63;
	Thu, 10 Oct 2019 14:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2339 seconds by postgrey-1.36 at gabe;
 Thu, 10 Oct 2019 14:52:01 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0B96EB63;
 Thu, 10 Oct 2019 14:52:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9AE64WR013966; Thu, 10 Oct 2019 16:07:26 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2pmev3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2019 16:07:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69AFB100038;
 Thu, 10 Oct 2019 16:07:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D0AF212523;
 Thu, 10 Oct 2019 16:07:24 +0200 (CEST)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Oct
 2019 16:07:23 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Thu, 10 Oct 2019 16:07:23 +0200
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Johan Hovold <johan@kernel.org>, Rob Clark <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Harald Freudenberger" <freude@linux.ibm.com>
Subject: Re: [PATCH 2/4] media: bdisp: fix memleak on release
Thread-Topic: [PATCH 2/4] media: bdisp: fix memleak on release
Thread-Index: AQHVf2yqC/jYoGn80Ees298jOdJYjqdTx7KA
Date: Thu, 10 Oct 2019 14:07:23 +0000
Message-ID: <5cb3040c-8c6a-ee38-be4f-b83fa9d98686@st.com>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010131333.23635-3-johan@kernel.org>
In-Reply-To: <20191010131333.23635-3-johan@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <09FA797EF141D1488C813B9ADD032BE3@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-10_05:2019-10-10,2019-10-10 signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=7yWUXL9Rc0acEqWqS7CkOitYwbC3Jm+sq0bKkZ4qLec=;
 b=1Zmb9dc0kz4QQ+jGoKss208+6ply1VtAYDEuo168rNTXbHccPV5ZMe7qFZ4R1MK+bBQS
 rB3Ak1s5zz7YQPGpUsTT+wUx6uF4z7uqQ4PUuqDTlKTTI+jeT5wOiVotCM6ciOCp90fX
 2aohlrOx2BQ9OKP2QmgrysZJuDVboIZRcBbcOV8huyW2/EXVtTLy5BdLTwriXBVkQIjB
 qqUoTxiq/nm9zMwcl02s9rLnH+oXcj1qSLdWqPlCKADfVhY5Ridk1JgfSC4HruswpcYd
 QQ9ww6pS6dAqxgDHGDJGnRBzqOkKMiLUotvHuUbrKvf9TsqfOgFmPqXrdhLOiE3hSCzx pQ== 
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 David Airlie <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Heiko
 Carstens <heiko.carstens@de.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Hans Verkuil <hans.verkuil@cisco.com>, stable <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9oYW4NCg0KVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gNCg0KQlINCg0KRmFiaWVuDQoNCg0K
T24gMTAvMTAvMjAxOSAzOjEzIFBNLCBKb2hhbiBIb3ZvbGQgd3JvdGU6DQo+IElmIGEgcHJvY2Vz
cyBpcyBpbnRlcnJ1cHRlZCB3aGlsZSBhY2Nlc3NpbmcgdGhlIHZpZGVvIGRldmljZSBhbmQgdGhl
DQo+IGRldmljZSBsb2NrIGlzIGNvbnRlbmRlZCwgcmVsZWFzZSgpIGNvdWxkIHJldHVybiBlYXJs
eSBhbmQgZmFpbCB0byBmcmVlDQo+IHJlbGF0ZWQgcmVzb3VyY2VzLg0KPg0KPiBOb3RlIHRoYXQg
dGhlIHJldHVybiB2YWx1ZSBvZiB0aGUgdjRsMiByZWxlYXNlIGZpbGUgb3BlcmF0aW9uIGlzDQo+
IGlnbm9yZWQuDQo+DQo+IEZpeGVzOiAyOGZmZWViYmI3YmQgKCJbbWVkaWFdIGJkaXNwOiAyRCBi
bGl0dGVyIGRyaXZlciB1c2luZyB2NGwyIG1lbTJtZW0gZnJhbWV3b3JrIikNCj4gQ2M6IHN0YWJs
ZSA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gICAgICMgNC4yDQo+IENjOiBGYWJpZW4gRGVzc2Vu
bmUgPGZhYmllbi5kZXNzZW5uZUBzdC5jb20+DQo+IENjOiBIYW5zIFZlcmt1aWwgPGhhbnMudmVy
a3VpbEBjaXNjby5jb20+DQo+IENjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAb3Nn
LnNhbXN1bmcuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5l
bC5vcmc+DQpSZXZpZXdlZC1ieTogRmFiaWVuIERlc3Nlbm5lIDxmYWJpZW4uZGVzc2VubmVAc3Qu
Y29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9iZGlzcC9iZGlzcC12
NGwyLmMgfCAzICstLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxl
dGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2Jk
aXNwL2JkaXNwLXY0bDIuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2JkaXNwL2JkaXNw
LXY0bDIuYw0KPiBpbmRleCBlOTBmMWJhMzA1NzQuLjY3NWI1ZjJiNGMyZSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRpc3AtdjRsMi5jDQo+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2JkaXNwL2JkaXNwLXY0bDIuYw0KPiBAQCAtNjUx
LDggKzY1MSw3IEBAIHN0YXRpYyBpbnQgYmRpc3BfcmVsZWFzZShzdHJ1Y3QgZmlsZSAqZmlsZSkN
Cj4gICANCj4gICAJZGV2X2RiZyhiZGlzcC0+ZGV2LCAiJXNcbiIsIF9fZnVuY19fKTsNCj4gICAN
Cj4gLQlpZiAobXV0ZXhfbG9ja19pbnRlcnJ1cHRpYmxlKCZiZGlzcC0+bG9jaykpDQo+IC0JCXJl
dHVybiAtRVJFU1RBUlRTWVM7DQo+ICsJbXV0ZXhfbG9jaygmYmRpc3AtPmxvY2spOw0KPiAgIA0K
PiAgIAl2NGwyX20ybV9jdHhfcmVsZWFzZShjdHgtPmZoLm0ybV9jdHgpOw0KPiAgIApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
