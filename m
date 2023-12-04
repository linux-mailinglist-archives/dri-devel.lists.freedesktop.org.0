Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD4980309E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 11:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB71D10E30A;
	Mon,  4 Dec 2023 10:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 55793 seconds by postgrey-1.36 at gabe;
 Mon, 04 Dec 2023 08:47:01 UTC
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [52.237.72.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4064310E17C;
 Mon,  4 Dec 2023 08:47:00 +0000 (UTC)
Received: from alexious$zju.edu.cn ( [124.90.105.255] ) by
 ajax-webmail-mail-app4 (Coremail) ; Mon, 4 Dec 2023 16:46:54 +0800
 (GMT+08:00)
X-Originating-IP: [124.90.105.255]
Date: Mon, 4 Dec 2023 16:46:54 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: alexious@zju.edu.cn
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: Re: [PATCH] drm/radeon/dpm: fix a memleak in
 sumo_parse_power_table
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.2-cmXT5 build
 20230825(e13b6a3b) Copyright (c) 2002-2023 www.mailtech.cn
 mispb-4df6dc2c-e274-4d1c-b502-72c5c3dfa9ce-zj.edu.cn
In-Reply-To: <b1fa2827-61fb-4594-8f80-e5083be8d5fa@amd.com>
References: <20231203171643.3287229-1-alexious@zju.edu.cn>
 <b1fa2827-61fb-4594-8f80-e5083be8d5fa@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7a726f38.19f2f.18c340249f7.Coremail.alexious@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgDHzTX_kW1lKXdIAA--.13484W
X-CM-SenderInfo: qrsrjiarszq6lmxovvfxof0/1tbiAgUTAGVsUQg1KAABsY
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mailman-Approved-At: Mon, 04 Dec 2023 10:39:24 +0000
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBBbSAwMy4xMi4yMyB1bSAxODoxNiBzY2hyaWViIFpoaXBlbmcgTHU6Cj4gPiBUaGUgcmRldi0+
cG0uZHBtLnBzIGFsbG9jYXRlZCBieSBrY2FsbG9jIHNob3VsZCBiZSBmcmVlZCBpbiBldmVyeQo+
ID4gZm9sbG93aW5nIGVycm9yLWhhbmRsaW5nIHBhdGguIEhvd2V2ZXIsIGluIHRoZSBlcnJvci1o
YW5kbGluZyBvZgo+ID4gcmRldi0+cG0ucG93ZXJfc3RhdGVbaV0uY2xvY2tfaW5mbyB0aGUgcmRl
di0+cG0uZHBtLnBzIGlzIG5vdCBmcmVlZCwKPiA+IHJlc3VsdGluZyBpbiBhIG1lbWxlYWsgaW4g
dGhpcyBmdW5jdGlvbi4KPiA+Cj4gPiBGaXhlczogODBlYTJjMTI5Yzc2ICgiZHJtL3JhZGVvbi9r
bXM6IGFkZCBkcG0gc3VwcG9ydCBmb3Igc3VtbyBhc2ljcyAodjIpIikKPiA+IFNpZ25lZC1vZmYt
Ynk6IFpoaXBlbmcgTHUgPGFsZXhpb3VzQHpqdS5lZHUuY24+Cj4gPiAtLS0KPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9zdW1vX2RwbS5jIHwgMSArCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3N1bW9fZHBtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3N1bW9fZHBtLmMKPiA+IGluZGV4
IGY3NGYzODFhZjA1Zi4uYmRlNjQwMDUzNzA4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9zdW1vX2RwbS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3N1
bW9fZHBtLmMKPiA+IEBAIC0xNDk0LDYgKzE0OTQsNyBAQCBzdGF0aWMgaW50IHN1bW9fcGFyc2Vf
cG93ZXJfdGFibGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4gPiAgIAkJbm9uX2Nsb2Nr
X2luZm8gPSAoc3RydWN0IF9BVE9NX1BQTElCX05PTkNMT0NLX0lORk8gKikKPiA+ICAgCQkJJm5v
bl9jbG9ja19pbmZvX2FycmF5LT5ub25DbG9ja0luZm9bbm9uX2Nsb2NrX2FycmF5X2luZGV4XTsK
PiA+ICAgCQlpZiAoIXJkZXYtPnBtLnBvd2VyX3N0YXRlW2ldLmNsb2NrX2luZm8pCj4gPiArCQkJ
a2ZyZWUocmRldi0+cG0uZHBtLnBzKTsKPiA+ICAgCQkJcmV0dXJuIC1FSU5WQUw7Cj4gCj4gVGhh
dCBjaGFuZ2UgaXMgb2J2aW91c2x5IG5vdCBjb3JyZWN0IHNpbmNlIHlvdSBub3cgYWx3YXlzIHJl
dHVybiAtRUlOVkFMLgo+IAo+IFlvdSBuZWVkIHRvIGF0IGxlYXN0IGFkZCB7fSBoZXJlLgo+IAoK
SSdtIHNvcnJ5IGZvciBteSBtaXN0YWtlIGFuZCBJJ2xsIHNlbmQgYSBuZXcgcGF0Y2ggc29vbi4K
ClJlZ2FyZHMsClpoaXBlbmcK
