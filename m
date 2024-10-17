Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C329A1878
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 04:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948DC10E0DA;
	Thu, 17 Oct 2024 02:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="L+AHFFI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5C410E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 02:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k42tcIqLJPUEQU4jEZANNNZR7VizoD6t5WjSlNEnAlE=;
 b=L+AHFFI9guRhmS9jajfxw8D6ANhbyhsqd6Ydkwx7fSGTyC83CqUIZXc0
 rwbK0InejrA2mFxkMyOo3EDXfgZmYy3E6+1H8OtYl7B5TelmFL9gq/zdn
 iTGXBUX2BmnlDG5EGo9CWidBh1EuDjgxa8yY6CQI/i4Fw7UHDvJ6p8FWV
 VGyBQ5laWXpqDQm9lF3zsTTKAKUzzQyXlAr9gyy+ywqJ0hOEh0pu8PtHN
 RS422i1VCUk52cxgVu3s0KRE5bDeKgqY37Mhg6xF5n/WCO8hglIpfdupi
 o7VRLSB7yhhzHAwgjEbZ/64Xyj5g8OOnCV9pbKbfhrgipL1Z//G8DgL8B Q==;
X-CSE-ConnectionGUID: HIb/NzemTkexCMQcjyqF0A==
X-CSE-MsgGUID: QRXnn+z2QZSOPGb77JiC6A==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 17 Oct 2024 10:10:55 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 49H2ArwB049646;
 Thu, 17 Oct 2024 10:10:53 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 10:10:52 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Thu, 17 Oct 2024 10:10:52 +0800
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
Thread-Index: AQHbIBW12yCYgM8QaEWs6T2K4Uuy/LKKMpxw
Date: Thu, 17 Oct 2024 02:10:52 +0000
Message-ID: <7713a68327a849a5b83f6acd0661bfff@ite.com.tw>
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
 <CAEXTbpfSJJF7W6ga9R5ns5naHgK0r=smCierau5fbLAztkjVwA@mail.gmail.com>
In-Reply-To: <CAEXTbpfSJJF7W6ga9R5ns5naHgK0r=smCierau5fbLAztkjVwA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.80.25]
x-tm-snts-smtp: 38A58F91081E22C59BC956B91B0763BE414791FD6215F2933490E9B566CA2FBF2002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 49H2ArwB049646
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

Pg0KPg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUGluLXllbiBMaW4gPHRy
ZWFwa2luZ0BjaHJvbWl1bS5vcmc+IA0KPlNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDE3LCAyMDI0
IDU6NTIgQU0NCj5UbzogSGVybWVzIFd1ICjlkLPkvbPlro8pIDxIZXJtZXMuV3VAaXRlLmNvbS50
dz4NCj5DYzogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+OyBOZWlsIEFy
bXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz47IFJvYmVydCBGb3NzIDxyZm9zc0Br
ZXJuZWwub3JnPjsgTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPjsgSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPjsgSmVybmVqIFNrcmFiZWMg
PGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT47IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5v
cmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+OyBB
bmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xs
YWJvcmEuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgS2VubmV0aCBIdW5nICjmtKrlrrblgKspIDxLZW5uZXRoLkh1bmdA
aXRlLmNvbS50dz47IFBldCBXZW5nICjnv4HnjonoiqwpIDxQZXQuV2VuZ0BpdGUuY29tLnR3Pg0K
PlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMDAvMTBdIGRybS9icmlkZ2U6IGl0NjUwNTogZml4IEhE
Q1AgQ1RTIGZhaWwgaXRlbXMgYW5kIGFkZCBNQ0NTIHN1cHBvcnQNCj4NCj5IaSBIZXJtZXMsDQo+
DQo+T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMzo1NOKAr0FNIEhlcm1lcyBXdSB2aWEgQjQgUmVs
YXkgPGRldm51bGwrSGVybWVzLnd1Lml0ZS5jb20udHdAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pg0K
Pj4gVGhpcyBpcyBhIHY2IHBhdGNoLXNldC4NCj4+DQo+PiBUaGVyZSBhcmUgbG90cyBvZiBmYWls
dXJlIGl0ZW1zIHdoaWxlIHJ1bm5pbmcgSERDUCBDVFMgdXNpbmcgVU5JR1JBRiBEUFItMTAwLg0K
Pj4gSW4gT3JkZXIgdG8gZml4IHRob3NlIGZhaWx1cmVzLCBIRENQIGZsb3cgbmVlZHMgdG8gYmUg
Y2hhbmdlZC4NCj4+DQo+PiBUaGUgRGlzcGxheVBvcnQgQVVYIHByb3RvY29sIHN1cHBvcnRzIEky
QyB0cmFuc3BvcnQuDQo+PiBJbiBPcmRlciB0byBzdXBwb3J0IE1DQ1MgdmlhIHRoZSBhdXggY2hh
bm5lbCwgdGhlIGF1eC1pMmMgb3BlcmF0aW9uIGlzIGFkZGVkLg0KPj4NCj4+IHY1LT52NjoNCj4+
ICAgICAgICAgLWtlZXAgdGhlIGNvbW1pdCBtZXNzYWdlIHdyYXBwZWQgYXQgNzItNzUgY2hhcnMu
DQo+PiAgICAgICAgIC1bMTAvMTBdIGZpeCByZXR1cm4gdmFyaWFibGUgYmVpbmcgdXNlZCB3aXRo
b3V0IGJlaW5nIA0KPj4gaW5pdGlhbGl6ZWQNCj4+DQo+PiB2NC0+djU6DQo+PiAgICAgICAgIC1h
ZGQgbW9yZSBtZXNzYWdlcyBmb3IgY2hhbmdlcy4NCj4+ICAgICAgICAgLVsyLzEwXSBtb2RpZmll
ZCBBVVggdHJhbnNmZXIgZGF0YSBzaXplIGp1ZGdtZW50Lg0KPj4gICAgICAgICAgICAgICAgIGNo
YW5nZSBmb3ItbG9vcCB0byBkby13aGlsZS4NCj4+ICAgICAgICAgLVs3LzEwXSBjaGFuZ2UgZm9y
LWxvb3AgdG8gZG8td2hpbGUuDQo+PiAgICAgICAgIC1bOS8xMF0gY2hhbmdlIHdhaXQgdGltZXIg
d2l0aCB0aW1lcl9hZnRlcigpDQo+Pg0KPj4gICAgICAgICBsaW5rczoNCj4+ICAgICAgICAgaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0
MDkyNjA3NDc1NS4yMjE3Ni00LUhlcm1lcy5XdUBpdGUuY29tLnR3L19fOyEhSHRuTEU4QSFIMDZr
bTVXTmE4VmdvUjI1TXZXdU5BR1l1SkdTY0NYUXgwdFF3bmlfTlBIS3dPcVQ0aE5wYUNyRlpQUE1W
S2VxQlhYSFRSb0dqMUMycFphenVtRTh2QSQgDQo+PiAgICAgICAgIA0KPj4gaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDkyNjA3NTEz
NA0KPj4gLjIyMzk0LTEtSGVybWVzLld1QGl0ZS5jb20udHcvX187ISFIdG5MRThBIUgwNmttNVdO
YThWZ29SMjVNdld1TkFHWXVKRw0KPj4gU2NDWFF4MHRRd25pX05QSEt3T3FUNGhOcGFDckZaUFBN
VktlcUJYWEhUUm9HajFDMnBaYjdZRnI0bXckDQo+Pg0KPj4gdjMtPnY0Og0KPj4gICAgICAgICAt
c3BsaXQgY2hhbmdlcyAgaW50byBwYXRjaGVzLg0KPj4NCj4+IHYyLT52MzoNCj4+ICAgICAgICAg
LXNwbGl0IGF1eCByZWFkICBLU1YgZnVuY3Rpb24gdG8gYSBwYXRjaC4NCj4+ICAgICAgICAgLVsx
LzNdIG5ldyBpbiB2Mw0KPj4gICAgICAgICAtWzIvM10gYWRkIGRlc2NyaXB0aW9uIG9mIHBhdGNo
DQo+Pg0KPj4gdjEtPnYyOg0KPj4gICAgICAgICAtIGlnbm9yZWQuDQo+Pg0KPj4gSGVybWVzIFd1
ICgxMCk6DQo+PiAgIGRybS9icmlkZ2U6IGl0NjUwNTogQ2hhbmdlIGRlZmluaXRpb24gb2YgQVVY
X0ZJRk9fTUFYX1NJWkUNCj4+ICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBpbXByb3ZlIEFVWCBvcGVy
YXRpb24gZm9yIGVkaWQgcmVhZA0KPj4gICBkcm0vYnJpZGdlOiBpdDY1MDU6IGFkZCBBVVggb3Bl
cmF0aW9uIGZvciBIRENQIEtTViBsaXN0IHJlYWQNCj4+ICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBD
aGFuZ2UgZGVmaW5pdGlvbiBNQVhfSERDUF9ET1dOX1NUUkVBTV9DT1VOVA0KPj4gICBkcm0vYnJp
ZGdlOiBpdDY1MDU6IGZpeCBIRENQIEJzdGF0dXMgY2hlY2sNCj4+ICAgZHJtL2JyaWRnZTogaXQ2
NTA1OiBmaXggSERDUCBlbmNyeXB0aW9uIHdoZW4gUjAgcmVhZHkNCj4+ICAgZHJtL2JyaWRnZTog
aXQ2NTA1OiBmaXggSERDUCBDVFMgS1NWIGxpc3QgcmVhZCB3aXRoIFVOSUdSQUYgRFBSLTEwMC4N
Cj4+ICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBmaXggSERDUCBDVFMgY29tcGFyZSBWIG1hdGNoaW5n
DQo+PiAgIGRybS9icmlkZ2U6IGl0NjUwNTogZml4IEhEQ1AgQ1RTIEtTViBsaXN0IHdhaXQgdGlt
ZXINCj4+ICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBhZGQgSTJDIGZ1bmN0aW9uYWxpdHkgb24gQVVY
DQo+Pg0KPj4gQ2hhbmdlLUlkOiBJYWQwYzA1NmQ3MmFiZjI2NTUwODEzNTdjZjQwYzNiMGQzZGY5
MTZiNQ0KPj4gU2lnbmVkLW9mZi1ieTogSGVybWVzIFd1IDxIZXJtZXMud3VAaXRlLmNvbS50dz4N
Cj4+IC0tLQ0KPj4gSGVybWVzIFd1ICgxMCk6DQo+PiAgICAgICBkcm0vYnJpZGdlOiBpdDY1MDU6
IENoYW5nZSBkZWZpbml0aW9uIG9mIEFVWF9GSUZPX01BWF9TSVpFDQo+PiAgICAgICBkcm0vYnJp
ZGdlOiBpdDY1MDU6IGltcHJvdmUgQVVYIG9wZXJhdGlvbiBmb3IgZWRpZCByZWFkDQo+PiAgICAg
ICBkcm0vYnJpZGdlOiBpdDY1MDU6IGFkZCBBVVggb3BlcmF0aW9uIGZvciBIRENQIEtTViBsaXN0
IHJlYWQNCj4+ICAgICAgIGRybS9icmlkZ2U6IGl0NjUwNTogQ2hhbmdlIGRlZmluaXRpb24gTUFY
X0hEQ1BfRE9XTl9TVFJFQU1fQ09VTlQNCj4+ICAgICAgIGRybS9icmlkZ2U6IGl0NjUwNTogZml4
IEhEQ1AgQnN0YXR1cyBjaGVjaw0KPj4gICAgICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBmaXggSERD
UCBlbmNyeXB0aW9uIHdoZW4gUjAgcmVhZHkNCj4+ICAgICAgIGRybS9icmlkZ2U6IGl0NjUwNTog
Zml4IEhEQ1AgQ1RTIEtTViBsaXN0IHJlYWQgd2l0aCBVTklHUkFGIERQUi0xMDAuDQo+PiAgICAg
ICBkcm0vYnJpZGdlOiBpdDY1MDU6IGZpeCBIRENQIENUUyBjb21wYXJlIFYgbWF0Y2hpbmcNCj4+
ICAgICAgIGRybS9icmlkZ2U6IGl0NjUwNTogZml4IEhEQ1AgQ1RTIEtTViBsaXN0IHdhaXQgdGlt
ZXINCj4+ICAgICAgIGRybS9icmlkZ2U6IGl0NjUwNTogYWRkIEkyQyBmdW5jdGlvbmFsaXR5IG9u
IEFVWA0KPj4NCj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYyB8IDMzNCAN
Cj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQ0KPj4gIDEgZmlsZSBjaGFu
Z2VkLCAyNzcgaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRpb25zKC0pDQo+PiAtLS0NCj4+IGJhc2Ut
Y29tbWl0OiBiODEyOGY3ODE1ZmYxMzVmMDMzM2MxYjQ2ZGNkZjE1NDNjNDFiODYwDQo+PiBjaGFu
Z2UtaWQ6IDIwMjQxMDE1LXVwc3RyZWFtLXY2LTlmNGIwMTVmZWNmNw0KPj4NCj4+IEJlc3QgcmVn
YXJkcywNCj4+IC0tDQo+PiBIZXJtZXMgV3UgPEhlcm1lcy53dUBpdGUuY29tLnR3Pg0KPj4NCj4+
DQo+DQo+SSdtIG5vdCBzdXJlIGlmIHRoaXMgcmVxdWlyZXMgYSByZS1zcGluLCBidXQgeW91IGFy
ZSBzdXBwb3NlZCB0byBjb2xsZWN0IHRoZSByZXZpZXdlZC1ieSB0YWdzIHlvdSByZWNlaXZlZCB3
aGVuIHlvdSBzZW5kIG91dCBhIG5ldyB2ZXJzaW9uLiBpLmUuLCBwdXQgdGhlICJSZXZpZXdlZC1i
eToiIGxpbmVzIHlvdSByZWNlaXZlZCBiZWZvcmUgeW91ciAiU2lnbmVkLW9mZi1ieToiIGxpbmUu
DQoNCm9ubHkgY292ZXItbGV0dGVyIG9yIGFsbCBwYXRjaGVzPyBuZWVkICJSRVNFTkQiIGZvciBz
YW1lIHY2IHBhdGNoIGhlYWRlcj8NCg0KPlJlZ2FyZHMsDQo+UGluLXllbg0KDQoNCg0KQlIsDQpI
ZXJtZXMNCg==
