Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA0D1ADCD
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 20:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADC28929C;
	Sun, 12 May 2019 18:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A29B8928D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 18:41:47 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id t187so5546001pgb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 11:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=McU3A/Y2+KH8KsiZ+LTp3qJ8zWb4gZuzV4pCEGTBglg=;
 b=lJYO9yS7KQQrIzWzao3DtD0e4opua+2TnE09jK3wBkdnz22uYxqGDKVZr/Im0qTs2C
 9ILyHsSlmIewejBLvjVjj10PdunKhOfYiLAd58zsRZZ5bS8v5HikiLSIZg9iCTKPbgM7
 z1vJQhSJ2J6n7oW3WsK4WzTDwnSAPmi6mCdR5rJi5BBnJBCN57ZdZ0sMHNiPCwHXlmoF
 upv/9i/ajv6J/kJ904OyHcODJQIRF30aA+hmGZanN4ldpdWlsfpwBdsoF3TEEyAB1iQw
 QfX5xeeVLFezk3P0H9ZQ2Q/052YPEdqaKS0LbxGBosJNvjeWVNHraXwQld0TBc2KPV8w
 ltwQ==
X-Gm-Message-State: APjAAAVzs8RWdGR5fVZgnXg8/jc8qtl8iEsF58aZW8mCoFtR3iE78ZsQ
 yUU3QDVA3yQDPHSw5FPMAxCWPA==
X-Google-Smtp-Source: APXvYqymxOYGSIxI7rUWYYOmlL1YU/UTYVdKySGM7lGUdp7qmHIxhsd9GhZCn1HJuCfA9pBG34sdAQ==
X-Received: by 2002:a63:f754:: with SMTP id f20mr26935381pgk.162.1557686506891; 
 Sun, 12 May 2019 11:41:46 -0700 (PDT)
Received: from localhost.localdomain ([115.97.185.144])
 by smtp.gmail.com with ESMTPSA id 37sm11041291pgn.21.2019.05.12.11.41.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 11:41:46 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v10 1/2] drm/sun4i: sun6i_mipi_dsi: Fix hsync_porch overflow
Date: Mon, 13 May 2019 00:11:26 +0530
Message-Id: <20190512184128.13720-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190512184128.13720-1-jagan@amarulasolutions.com>
References: <20190512184128.13720-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=McU3A/Y2+KH8KsiZ+LTp3qJ8zWb4gZuzV4pCEGTBglg=;
 b=SVFjdqYSyAPhETD5SmYAsNRKu3Wf4F+fbW/+KnD9toKXS3ehMbEWA4cauoMEyZxVM3
 W2/GPER2Zd9IkEVZf4W6g+lCw7bp/90c1izCMNumL1PsfyDh3Gl4sCCtp3yuJGmOxFrt
 ZpuHyTiZqAZYxxZSvyBL74T/y6FkIJ8C9XDws=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9vcCBOMSBpbnN0cnVjdGlvbiBkZWxheSBmb3IgYnVyc3QgbW9kZSBkZXZpY2VzIGFyZSBjb21w
dXRlZApiYXNlZCBvbiBob3Jpem9udGFsIHN5bmMgYW5kIHBvcmNoIHRpbWluZyB2YWx1ZXMuCgpU
aGUgY3VycmVudCBkcml2ZXIgaXMgdXNpbmcgdTE2IHR5cGUgZm9yIGNvbXB1dGluZyB0aGlzIGhz
eW5jX3BvcmNoCnZhbHVlLCB3aGljaCB3b3VsZCBmYWlsZWQgdG8gZml0IHdpdGhpbiB0aGUgdTE2
IHR5cGUgZm9yIGxhcmdlIHN5bmMKYW5kIHBvcmNoIHRpbWluZ3MgZGV2aWNlcy4gVGhpcyB3b3Vs
ZCByZXN1bHQgaW4gaHN5bmNfcG9yY2ggb3ZlcmZsb3cKYW5kIGV2ZW50dWFsbHkgY29tcHV0ZWQg
d3JvbmcgaW5zdHJ1Y3Rpb24gZGVsYXkgdmFsdWUuCgpFeGFtcGxlLCB0aW1pbmdzLCB3aGVyZSBp
dCBwcm9kdWNlcyB0aGUgb3ZlcmZsb3cKewoJLmhkaXNwbGF5ICAgICAgID0gMTA4MCwKCS5oc3lu
Y19zdGFydCAgICA9IDEwODAgKyA0MDgsCiAgICAgICAgLmhzeW5jX2VuZCAgICAgID0gMTA4MCAr
IDQwOCArIDQsCiAgICAgICAgLmh0b3RhbCAgICAgICAgID0gMTA4MCArIDQwOCArIDQgKyAzOCwK
fQoKSXQgcmVwcm9kdWNlcyB0aGUgZGVzaXJlZCBkZWxheSB2YWx1ZSA2NTQ4NyBidXQgdGhlIGNv
cnJlY3Qgd29ya2luZwp2YWx1ZSBzaG91bGQgYmUgNy4KClNvLCBGaXggaXQgYnkgY29tcHV0aW5n
IGhzeW5jX3BvcmNoIHZhbHVlIHNlcGFyYXRlbHkgd2l0aCB1MzIgdHlwZS4KCkZpeGVzOiAxYzFh
N2FhMzY2M2MgKCJkcm0vc3VuNGk6IGRzaTogQWRkIGJ1cnN0IHN1cHBvcnQiKQpTaWduZWQtb2Zm
LWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
NmlfbWlwaV9kc2kuYwppbmRleCA2ZmY1ODUwNTVhMDcuLmJmYTdlMmIxNDZkZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKQEAgLTQ1Nyw4ICs0NTcsOSBAQCBzdGF0aWMg
dm9pZCBzdW42aV9kc2lfc2V0dXBfaW5zdF9sb29wKHN0cnVjdCBzdW42aV9kc2kgKmRzaSwKIAl1
MTYgZGVsYXkgPSA1MCAtIDE7CiAKIAlpZiAoZGV2aWNlLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lf
TU9ERV9WSURFT19CVVJTVCkgewotCQlkZWxheSA9IChtb2RlLT5odG90YWwgLSBtb2RlLT5oZGlz
cGxheSkgKiAxNTA7Ci0JCWRlbGF5IC89IChtb2RlLT5jbG9jayAvIDEwMDApICogODsKKwkJdTMy
IGhzeW5jX3BvcmNoID0gKG1vZGUtPmh0b3RhbCAtIG1vZGUtPmhkaXNwbGF5KSAqIDE1MDsKKwor
CQlkZWxheSA9IChoc3luY19wb3JjaCAvICgobW9kZS0+Y2xvY2sgLyAxMDAwKSAqIDgpKTsKIAkJ
ZGVsYXkgLT0gNTA7CiAJfQogCi0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
