Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 071D3247C43
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 04:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65D689C8D;
	Tue, 18 Aug 2020 02:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDAC789C8D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 02:41:39 +0000 (UTC)
X-UUID: 93079a44c1c7482691ce98d73eb1a0ea-20200818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=j56Gt4pCxYB+XONCMAUzqjSxYqX2Nyr1p1m6xZJHWhg=; 
 b=HG8DOknOg/9IEBIZCA6qhoz7uyKI8NnxMV77LsWEeRI+X8OaxL9Xfx6Y2fwr8oCGxM+EdBxyjU3ekOLm3wPORDfjenWuc3q4WvRMqCQjMX6XWQ/VjoYmEPgYiXwhV1aL/lAbPUR1K9IY5rDa9Vcz2GLJl5390/Sm7Ldx1FmVAWw=;
X-UUID: 93079a44c1c7482691ce98d73eb1a0ea-20200818
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 715428081; Tue, 18 Aug 2020 10:41:31 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 18 Aug 2020 10:41:25 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Aug 2020 10:41:24 +0800
Message-ID: <1597718492.6381.6.camel@mszsdaap41>
Subject: Re: [PATCH v2] drm/mediatek: dsi: fix scrolling of panel with small
 hfp or hbp
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 18 Aug 2020 10:41:32 +0800
In-Reply-To: <CAAOTY_9ggDUdDD9KoOaWBx3XaK+=Q=5qxahG7SJ5uYBQZ4aadw@mail.gmail.com>
References: <20200817130640.18021-1-jitao.shi@mediatek.com>
 <CAAOTY_9ggDUdDD9KoOaWBx3XaK+=Q=5qxahG7SJ5uYBQZ4aadw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B2EDE1793418E9C320064DD32C4D7E50B37FF645537BA7075AAD17680B2B1B742000:8
X-MTK: N
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTA4LTE4IGF0IDA3OjQyICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgSml0YW86DQo+IA0KPiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+IOaW
vCAyMDIw5bm0OOaciDE35pelIOmAseS4gCDkuIvljYg5OjA35a+r6YGT77yaDQo+ID4NCj4gPiBo
b3Jpem9udGFsX2JhY2twb3JjaF9ieXRlIHNob3VsZCBiZSBoYnAgKiBicHAgLSBoYnAgZXh0cmEg
Ynl0ZXMuDQo+ID4gU28gcmVtb3ZlIHRoZSB3cm9uZyBzdWJ0cmFjdGlvbiAxMC4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4NCj4gPiAt
LS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDkgKysrKy0tLS0t
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gPiBpbmRleCAyNzBiZjIyYzk4
ZmUuLjVkMDMxZTYzNDU3MSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
Yw0KPiA+IEBAIC00NzMsMTQgKzQ3MywxMyBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX2NvbmZpZ192
ZG9fdGltaW5nKHN0cnVjdCBtdGtfZHNpICpkc2kpDQo+ID4gICAgICAgICBob3Jpem9udGFsX3N5
bmNfYWN0aXZlX2J5dGUgPSAodm0tPmhzeW5jX2xlbiAqIGRzaV90bXBfYnVmX2JwcCAtIDEwKTsN
Cj4gDQo+IFNvIHRoaXMgc3VidHJhY3Rpb24gMTAgaXMgY29ycmVjdD8NCj4gDQo+IFJlZ2FyZHMs
DQo+IENodW4tS3VhbmcuDQo+IA0KDQpZZXMsIEl0IGlzIHJpZ2h0Lg0KDQpJbiB0aGUgY2VhODYx
IGFuZCBkbXQgc3BlYyB0aGUgbWluaSBoc3luYyBpcyA0MCBwaXhlbHMuDQpTbyB0aGUgdm0tPmhz
eW5jX2xlbiAqIGRzaV90bXBfYnVmX2JwcCA+PSAxMjAgPiAxMA0KDQpCZXN0IFJlZ2FyZHMNCmpp
dGFvDQo+ID4NCj4gPiAgICAgICAgIGlmIChkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RF
X1ZJREVPX1NZTkNfUFVMU0UpDQo+ID4gLSAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3Bv
cmNoX2J5dGUgPQ0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICh2bS0+aGJhY2tfcG9yY2gg
KiBkc2lfdG1wX2J1Zl9icHAgLSAxMCk7DQo+ID4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxf
YmFja3BvcmNoX2J5dGUgPSB2bS0+aGJhY2tfcG9yY2ggKiBkc2lfdG1wX2J1Zl9icHA7DQo+ID4g
ICAgICAgICBlbHNlDQo+ID4gLSAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5
dGUgPSAoKHZtLT5oYmFja19wb3JjaCArIHZtLT5oc3luY19sZW4pICoNCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICBkc2lfdG1wX2J1Zl9icHAgLSAxMCk7DQo+ID4gKyAgICAgICAgICAgICAg
IGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPSAodm0tPmhiYWNrX3BvcmNoICsgdm0tPmhzeW5j
X2xlbikgKg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZHNpX3RtcF9idWZfYnBwOw0KPiA+DQo+ID4gICAgICAgICBkYXRhX3BoeV9jeWNsZXMgPSB0aW1p
bmctPmxweCArIHRpbWluZy0+ZGFfaHNfcHJlcGFyZSArDQo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICB0aW1pbmctPmRhX2hzX3plcm8gKyB0aW1pbmctPmRhX2hzX2V4aXQgKyAzOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgdGltaW5nLT5kYV9oc196ZXJvICsgdGltaW5nLT5k
YV9oc19leGl0Ow0KPiA+DQo+ID4gICAgICAgICBpZiAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9E
U0lfTU9ERV9WSURFT19CVVJTVCkgew0KPiA+ICAgICAgICAgICAgICAgICBpZiAoKHZtLT5oZnJv
bnRfcG9yY2ggKyB2bS0+aGJhY2tfcG9yY2gpICogZHNpX3RtcF9idWZfYnBwID4NCj4gPiAtLQ0K
PiA+IDIuMTIuNQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0DQo+ID4gTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
