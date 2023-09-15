Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57DE7A1D07
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 13:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632CD10E61F;
	Fri, 15 Sep 2023 11:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DA410E61F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 11:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1694775711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pgqvvVn/6dCIhXw29WugfytAKiTjkJ56RVwcLGYEqn8=;
 b=NWLkophElwmTJGffxn/hJuSZuUHEjVKzcpXzWqedY1ty1baxXnbtGcgyTkYvr4f+GIEZPR
 yMZV9inditckvKxSOmSGkgpGC/cHkrwtP3gnHik9pPVzgrtEyx0Ou3tR7Dm3UoDmqRfJvT
 xFfffgnDSl9H1NqqjRTbgiBLshvJGK0=
Message-ID: <3dff2bfa521a03cd652a65d44ddd77c53f190f23.camel@crapouillou.net>
Subject: Re: [PATCH] drm: bridge: it66121: ->get_edid callback must not
 return err pointers
From: Paul Cercueil <paul@crapouillou.net>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Fri, 15 Sep 2023 13:01:50 +0200
In-Reply-To: <20230914131159.2472513-1-jani.nikula@intel.com>
References: <20230914131159.2472513-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Phong LE <ple@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFuaSwKCkxlIGpldWRpIDE0IHNlcHRlbWJyZSAyMDIzIMOgIDE2OjExICswMzAwLCBKYW5p
IE5pa3VsYSBhIMOpY3JpdMKgOgo+IFRoZSBkcm0gc3RhY2sgZG9lcyBub3QgZXhwZWN0IGVycm9y
IHZhbHVlZCBwb2ludGVycyBmb3IgRURJRAo+IGFueXdoZXJlLgo+IAo+IEZpeGVzOiBlNjY4NTY1
MDg3NDYgKCJkcm06IGJyaWRnZTogaXQ2NjEyMTogU2V0IEREQyBwcmVhbWJsZSBvbmx5Cj4gb25j
ZSBiZWZvcmUgcmVhZGluZyBFRElEIikKPiBDYzogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3Vp
bGxvdS5uZXQ+Cj4gQ2M6IFJvYmVydCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5hcm8ub3JnPgo+IENj
OiBQaG9uZyBMRSA8cGxlQGJheWxpYnJlLmNvbT4KPiBDYzogTmVpbCBBcm1zdHJvbmcgPG5laWwu
YXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4gQ2M6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFA
aW50ZWwuY29tPgo+IENjOiBSb2JlcnQgRm9zcyA8cmZvc3NAa2VybmVsLm9yZz4KPiBDYzogTGF1
cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IENjOiBK
b25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Cj4gQ2M6IEplcm5laiBTa3JhYmVjIDxqZXJu
ZWouc2tyYWJlY0BnbWFpbC5jb20+Cj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY2
LjMrCj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4K
CkFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCwgdGhhbmtzLgoKQ2hlZXJzLAotUGF1bAoKPiAKPiAt
LS0KPiAKPiBVTlRFU1RFRAo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2
NjEyMS5jIHwgNCArKy0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1p
dDY2MTIxLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjYxMjEuYwo+IGluZGV4
IDNjOWI0MmM5ZDJlZS4uMWNmM2ZiMWYxM2RjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvaXRlLWl0NjYxMjEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRl
LWl0NjYxMjEuYwo+IEBAIC04ODQsMTQgKzg4NCwxNCBAQCBzdGF0aWMgc3RydWN0IGVkaWQKPiAq
aXQ2NjEyMV9icmlkZ2VfZ2V0X2VkaWQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiDCoMKg
wqDCoMKgwqDCoMKgbXV0ZXhfbG9jaygmY3R4LT5sb2NrKTsKPiDCoMKgwqDCoMKgwqDCoMKgcmV0
ID0gaXQ2NjEyMV9wcmVhbWJsZV9kZGMoY3R4KTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkg
ewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlZGlkID0gRVJSX1BUUihyZXQpOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlZGlkID0gTlVMTDsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0X3VubG9jazsKPiDCoMKgwqDCoMKgwqDCoMKg
fQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHJldCA9IHJlZ21hcF93cml0ZShjdHgtPnJlZ21hcCwg
SVQ2NjEyMV9ERENfSEVBREVSX1JFRywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIElUNjYxMjFfRERDX0hFQURFUl9FRElEKTsKPiDCoMKgwqDC
oMKgwqDCoMKgaWYgKHJldCkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlZGlk
ID0gRVJSX1BUUihyZXQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlZGlkID0g
TlVMTDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0X3VubG9jazsK
PiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgCgo=

