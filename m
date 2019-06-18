Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC3E49DDD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 11:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30AB6E12B;
	Tue, 18 Jun 2019 09:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594AD6E12B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 09:57:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5I9ufeL007558; Tue, 18 Jun 2019 11:57:28 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t4nt882mp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Jun 2019 11:57:28 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61CA13D;
 Tue, 18 Jun 2019 09:57:26 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 866DA25C4;
 Tue, 18 Jun 2019 09:57:26 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 11:57:26 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 18 Jun 2019 11:57:26 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/stm: drv: fix suspend/resume
Thread-Topic: [PATCH 1/3] drm/stm: drv: fix suspend/resume
Thread-Index: AQHVJNzXyLfazNf0rE+kj6DQpMP/WqahDTWA
Date: Tue, 18 Jun 2019 09:57:26 +0000
Message-ID: <7e6a87b6-e442-20cb-0d4e-68eb40c56042@st.com>
References: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <B021E7D4B0B92447AAFAEA456492E001@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_05:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=stn6VY8/mD5ZefE09LCqZtOZMuTRoV8O+VbLHK8wlag=;
 b=A+NVeecVL65i4SorepSWrkddZhoJCr9+F2/ROXo+HxkT+v45vF1IVmrRA9fGrYnRGIso
 KXlU+j768EZOcSydA0Xd4qCjaYtuZknGPM+eh82T7pm4FvC9rI/qe29mG4zwMTUbt54c
 AGjga+Rmd+hcfF9p1qsNmI3GA+XnYw/36B3JnVGGU1JAaEECogSpU5GqC/hbJzYcT2M9
 ARfg4mTEOj1ZeZOB7icfuLukh/WJsLtthQXUGllhd6q8aXDnrQ/4VlPqgBB9NTzDlCgB
 5rPDm9koiyhMrZUE349h4KWksGC2GWHCvitOADyokwvi4v42TCbco8LAPZTpEUtWs4ET 3g== 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWWFubmljaywNCg0KVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLg0KDQpBY2tlZC1ieTogUGhp
bGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4NCg0KUGhpbGlwcGUgOi0pDQoNCk9u
IDYvMTcvMTkgOToxOCBBTSwgWWFubmljayBGZXJ0csOpIHdyb3RlOg0KPiBXaXRob3V0IHRoaXMg
Zml4LCB0aGUgc3lzdGVtIGNhbiBub3QgZ28gaW4gInN1c3BlbmQiIG1vZGUNCj4gZHVlIHRvIGFu
IGVycm9yIGluIGRydl9zdXNwZW5kIGZ1bmN0aW9uLg0KPiANCj4gRml4ZXM6IDM1YWI2Y2YgKCJk
cm0vc3RtOiBzdXBwb3J0IHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudCIpDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4gLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyB8IDE1ICsrKysrKysrLS0tLS0tLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0v
ZHJ2LmMNCj4gaW5kZXggNTY1OTU3Mi4uOWRlZTRlNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3N0bS9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jDQo+IEBA
IC0xMzYsOCArMTM2LDcgQEAgc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBkcnZfc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAgCXN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGRkZXYt
PmRldl9wcml2YXRlOw0KPiAgIAlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGU7DQo+ICAg
DQo+IC0JaWYgKFdBUk5fT04oIWxkZXYtPnN1c3BlbmRfc3RhdGUpKQ0KPiAtCQlyZXR1cm4gLUVO
T0VOVDsNCj4gKwlXQVJOX09OKGxkZXYtPnN1c3BlbmRfc3RhdGUpOw0KPiAgIA0KPiAgIAlzdGF0
ZSA9IGRybV9hdG9taWNfaGVscGVyX3N1c3BlbmQoZGRldik7DQo+ICAgCWlmIChJU19FUlIoc3Rh
dGUpKQ0KPiBAQCAtMTU1LDE1ICsxNTQsMTcgQEAgc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBk
cnZfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gICAJc3RydWN0IGx0ZGNfZGV2aWNlICps
ZGV2ID0gZGRldi0+ZGV2X3ByaXZhdGU7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+ICsJaWYgKFdB
Uk5fT04oIWxkZXYtPnN1c3BlbmRfc3RhdGUpKQ0KPiArCQlyZXR1cm4gLUVOT0VOVDsNCj4gKw0K
PiAgIAlwbV9ydW50aW1lX2ZvcmNlX3Jlc3VtZShkZXYpOw0KPiAgIAlyZXQgPSBkcm1fYXRvbWlj
X2hlbHBlcl9yZXN1bWUoZGRldiwgbGRldi0+c3VzcGVuZF9zdGF0ZSk7DQo+IC0JaWYgKHJldCkg
ew0KPiArCWlmIChyZXQpDQo+ICAgCQlwbV9ydW50aW1lX2ZvcmNlX3N1c3BlbmQoZGV2KTsNCj4g
LQkJbGRldi0+c3VzcGVuZF9zdGF0ZSA9IE5VTEw7DQo+IC0JCXJldHVybiByZXQ7DQo+IC0JfQ0K
PiAgIA0KPiAtCXJldHVybiAwOw0KPiArCWxkZXYtPnN1c3BlbmRfc3RhdGUgPSBOVUxMOw0KPiAr
DQo+ICsJcmV0dXJuIHJldDsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIF9fbWF5YmVfdW51c2Vk
IGludCBkcnZfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
