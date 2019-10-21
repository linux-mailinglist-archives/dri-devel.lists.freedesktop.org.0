Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294B2DF799
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 23:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CF489DBA;
	Mon, 21 Oct 2019 21:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633E089DBA
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 21:45:54 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id e11so12373449otl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nqe5QILtIpNsEaGhkK4nGkXs8zLkefJgCA+oa+2s7ok=;
 b=YNSjsNu2CCWUm/jfFupocfFhnEQ9BqQzE92yd8ltW7LnNQU/biaNAjW6TkvadOUEXc
 g0M9qLPb8R1x94Fl7hUIkq3EcUz3RiBRbWiR+cJFh5y9Y15LUPzmZd0wD2/6hxCJT06S
 AP8pryQqy7b5iuYJqFBVUvn53nRyFR+1mBvv0336a75ghVe/dMCZoiuPOs0LU+cFgRuE
 B6lIUTy3PgQ/ptEKF/D7weklQHBuEHKyOiZuw/4lHuc2ge74SnC9S9iGz4Qt3/PPQamq
 ZTXon4H/CY8R2kFCQCPiqC0APh7YA0Vza7l6JhX5xczpFu4MdtXPWZ0kk1xTgDthZC9L
 mbTQ==
X-Gm-Message-State: APjAAAU/HSryD6M1aSYhaQh09opESz/S8r5oi3J1MMK28MoiIVt2vBWh
 0UFblHMM1p9muK/kwsv9iYhhPck=
X-Google-Smtp-Source: APXvYqxCs8yabMuTaUbUxDWWtS2Wplp/U09Sf75zVuQx5s+Q4uVctXMoxLgtzYEKbav8DT5Bobt0qg==
X-Received: by 2002:a9d:3df7:: with SMTP id l110mr40031otc.245.1571694353132; 
 Mon, 21 Oct 2019 14:45:53 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id u130sm4122676oib.56.2019.10.21.14.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 14:45:52 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm: Support CMA per allocation kernel mappings
Date: Mon, 21 Oct 2019 16:45:44 -0500
Message-Id: <20191021214550.1461-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBDTUEvRE1BIHVzZXJzIHRvIHNraXAga2VybmVs
IG1hcHBpbmdzIGZvcgpHRU0gYWxsb2NhdGlvbnMuIFRoZSBETUEgQVBJIG9ubHkgZ3VhcmFudGVl
cyBhIGtlcm5lbCBtYXBwaW5nIGF0CmFsbG9jYXRpb24gdGltZS4gQ3JlYXRpbmcgbWFwcGluZ3Mg
d2l0aCB2bWFwKCkgYWZ0ZXIgYWxsb2NhdGlvbiBtYXkgb3IKbWF5IG5vdCB3b3JrIGFzIG5vdCBh
bGwgYWxsb2NhdGlvbnMgaGF2ZSBhIHN0cnVjdCBwYWdlLiBBcyB2aXJ0dWFsCm1lbW9yeSBzcGFj
ZSBpcyBsaW1pdGVkIG9uIDMyLWJpdCBzeXN0ZW1zIHNvbWUgZHJpdmVycyB3aWxsIHNraXAga2Vy
bmVsCm1hcHBpbmdzIHdoZW4gcG9zc2libGUuIFRoaXMgcHJldmVudHMgdGhvc2UgZHJpdmVycyBm
cm9tIHVzaW5nIENNQQpoZWxwZXJzIGFuZCB0aGUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24gd2hp
Y2ggcmVzdWx0cyBpbiBhIGxvdCBvZgpkdXBsaWNhdGVkIGNvZGUuCgpJbiBvcmRlciB0byBkaXN0
aW5ndWlzaCBiZXR3ZWVuIGtlcm5lbCBhbmQgdXNlcnNwYWNlIGFsbG9jYXRpb25zLAphIG5ldyBm
bGFnLCBEUk1fTU9ERV9EVU1CX0tFUk5FTF9NQVAsIGZvciBkcm1fbW9kZV9jcmVhdGVfZHVtYigp
IGlzCmludHJvZHVjZWQuIFRoaXMgYWxsb3dzIGRyaXZlcnMgdG8gb3ZlcnJpZGUgdGhlIGRlZmF1
bHQgYmVoYXZpb3IgZm9yCkNNQSBoZWxwZXJzIG9mIGFsd2F5cyBjcmVhdGluZyBhIGtlcm5lbCBt
YXBwaW5nLgoKTWVkaWF0ZWsgaXMgY29udmVydGVkIHRvIENNQSBoZWxwZXJzIGFuZCBSb2NrY2hp
cCBpcyBjb252ZXJ0ZWQgdG8gZ2VuZXJpYwpmYmRldiBzdXBwb3J0LiBJIGFsc28gaGF2ZSBwYXRj
aGVzIHRvIGNvbnZlcnQgUm9ja2NoaXAgdG8gQ01BIGFuZCBzaG1lbQpoZWxwZXJzLCBidXQgdGhl
eSBuZWVkIGEgYml0IG1vcmUgd29yay4gRXh5bm9zIGNhbiBhbHNvIHByb2JhYmx5IGJlCmNvbnZl
cnRlZCB0byB1c2UgQ01BIGhlbHBlcnMuCgpDb21waWxlIHRlc3RlZCBvbmx5LiBJIGRpZCB0ZXN0
IGZiZGV2IG9uIFJvY2tjaGlwLCBidXQgdGhlIGgvdyBJIGhhdmUKaGFzIGFuIElPTU1VLCBzbyB0
aGUgQ01BIGNvZGUgcGF0aCBkb2Vzbid0IGdldCB0ZXN0ZWQuCgpSb2IKClJvYiBIZXJyaW5nICg2
KToKICBkcm0va2lyaW46IFVzZSBEUk1fR0VNX0NNQV9WTUFQX0RSSVZFUl9PUFMKICBkcm06IElu
dHJvZHVjZSBEUk1fTU9ERV9EVU1CX0tFUk5FTF9NQVAgZmxhZwogIGRybS9jbWEtaGVscGVyOiBV
c2UgdGhlIGRtYV8qX2F0dHIgQVBJIHZhcmlhbnQKICBkcm0vY21hLWhlbHBlcjogU3VwcG9ydCBE
Uk1fTU9ERV9EVU1CX0tFUk5FTF9NQVAgZmxhZwogIGRybS9tZWRpYXRlazogQ29udmVydCB0byB1
c2UgQ01BIGhlbHBlcnMKICBkcm0vcm9ja2NoaXA6IENvbnZlcnQgdG8gdXNlIGdlbmVyaWMgZmJk
ZXYgZW11bGF0aW9uCgogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMu
YyAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jICAgICAgICAgICAg
ICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jICAgICAgICAgICAgICAgICAg
fCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYyAgICAgICAgICAgIHwg
ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMgICAgICAgICAgfCAg
NjggKysrLS0KIC4uLi9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMgICB8
ICAxMSArLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgIHwg
ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgICAgICB8ICAg
MiArLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAgICAgIHwgIDI4
ICstCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9mYi5jICAgICAgICAgfCAgIDEg
LQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMgICAgICAgIHwgMjg5IC0t
LS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmgg
ICAgICAgIHwgIDUxIC0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5l
LmMgICAgICB8ICAgNyArLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jICAgICAg
ICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgICAg
ICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvTWFrZWZpbGUgICAgICAgICAg
ICAgfCAgIDEgLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9kcnYuYyAg
IHwgIDEwICstCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5oICAg
fCAgIDIgLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jICAgIHwg
IDE0IC0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuaCAgICB8ICAg
NiAtCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiZGV2LmMgfCAxNzAg
LS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmJkZXYu
aCB8ICAyNCAtLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYyAg
IHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2dlbS5oICAg
fCAgIDQgLQogZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYuYyAgICAgICAgICAgICB8ICAg
MSArCiBpbmNsdWRlL2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaCAgICAgICAgICAgICAgfCAgIDEg
KwogaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oICAgICAgICAgICAgICAgICAgIHwgICAyICsK
IDI4IGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksIDYzMiBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwog
ZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5o
CiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV9mYmRldi5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX2RybV9mYmRldi5oCgotLQoyLjIwLjEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
