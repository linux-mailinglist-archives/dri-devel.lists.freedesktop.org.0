Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AC0D0800
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCF36E8F5;
	Wed,  9 Oct 2019 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339356E0E7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 10:21:53 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id s17so8263408plp.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 03:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GeMDvxk000kDXZOF/cVkZFJMD0gb/5P7FfXKteqfPL8=;
 b=OIn/E9SfI3g1Gq0fC7nUvjwLuixtEZeDqSo8Zwq3FGOYj2N94MvvRIyt0HIR+4nFJ4
 gd4RhgAmIvcnTwRysVqBlYKDg2okg9oZYzGKy2vxD0wivvXKEJXiP/WAYr/+pkHL+l7h
 kHDbPA+XbeQNpKxiF31b7CHueqrh3bYOkVb6fg4VV9VUsHM5XHAutKGp2aI4PAgbXT69
 gBrzrCFfGPdyO4c9QxieMBb3rt990y+5ncBS3CQellNiW9P0WDX+NrojerM+jVdVD5ZQ
 ni10jHtLQOaypjoTsYcbZWEVm7eHnIwF3GPK5n6E80VRvrVIzLwVHgAF6bs+Qv0pCv3c
 Sdlg==
X-Gm-Message-State: APjAAAX6O6FKVUNwRLPhLGQVtcz4ktTAZ7kEjzPRuPeJfmACdUlwZ0sc
 5Ay5kseE9hKA6cVyRaJGIv6IQQ==
X-Google-Smtp-Source: APXvYqw2a0XI5XUbrLM3Qio4U723/Y5fi8MXrTnqZEIoVScPrqDX2SVFu2OcatshFfvpyWcA9OlBRA==
X-Received: by 2002:a17:902:7895:: with SMTP id
 q21mr33495295pll.94.1570530112854; 
 Tue, 08 Oct 2019 03:21:52 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id b9sm15111763pfo.105.2019.10.08.03.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2019 03:21:52 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/bridge: dw-hdmi: Restore audio when setting a mode
Date: Tue,  8 Oct 2019 18:21:45 +0800
Message-Id: <20191008102145.55134-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GeMDvxk000kDXZOF/cVkZFJMD0gb/5P7FfXKteqfPL8=;
 b=cdJSJvCOf5lwlnvWxJxswCx6xNQ3AjanFRiUtsdswxZMfYmCMtj1PGMFewsVic258v
 Obg7GqwttJcCpt7nuw95onf8KC58807n8gbnHZJ/LRcDAza2N53eImEePNyxIg99BHpt
 Ebgr4PpV4SPUtutXxqVqDceBd9fiuEQOlx/sE=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, tzungbi@chromium.org,
 alsa-devel@alsa-project.org, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Yakir Yang <ykk@rock-chips.com>, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsIEt1cnR6IDxkamt1cnR6QGNocm9taXVtLm9yZz4KCldoZW4gc2V0dGluZyBh
IG5ldyBkaXNwbGF5IG1vZGUsIGR3X2hkbWlfc2V0dXAoKSBjYWxscwpkd19oZG1pX2VuYWJsZV92
aWRlb19wYXRoKCksIHdoaWNoIGRpc2FibGVzIGFsbCBoZG1pIGNsb2NrcywgaW5jbHVkaW5nCnRo
ZSBhdWRpbyBjbG9jay4KCldlIHNob3VsZCBvbmx5IChyZS0pZW5hYmxlIHRoZSBhdWRpbyBjbG9j
ayBpZiBhdWRpbyB3YXMgYWxyZWFkeSBlbmFibGVkCndoZW4gc2V0dGluZyB0aGUgbmV3IG1vZGUu
CgpXaXRob3V0IHRoaXMgcGF0Y2gsIG9uIFJLMzI4OCwgdGhlcmUgd2lsbCBiZSBIRE1JIGF1ZGlv
IG9uIHNvbWUgbW9uaXRvcnMKaWYgaTJzIHdhcyBwbGF5ZWQgdG8gaGVhZHBob25lIHdoZW4gdGhl
IG1vbml0b3Igd2FzIHBsdWdnZWQuCkFDRVIgSDI3N0hVIGFuZCBBU1VTIFBCMjc4IGFyZSB0d28g
b2YgdGhlIG1vbml0b3JzIHNob3dpbmcgdGhpcyBpc3N1ZS4KClNpZ25lZC1vZmYtYnk6IENoZW5n
LVlpIENoaWFuZyA8Y3ljaGlhbmdAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
S3VydHogPGRqa3VydHpAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBZYWtpciBZYW5nIDx5
a2tAcm9jay1jaGlwcy5jb20+Ci0tLQogQ2hhbmdlIGZyb20gdjIgdG8gdjM6CiAtIFJlbW92ZSBz
cGlubG9jayBhcm91bmQgc2V0dGluZyBjbG9jay4KCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMK
aW5kZXggYTE1ZmJmNzFiOWQ3Li5hZjA2MDE2MmIwYWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jCkBAIC0yMDU0LDcgKzIwNTQsNyBAQCBzdGF0aWMgaW50IGR3
X2hkbWlfc2V0dXAoc3RydWN0IGR3X2hkbWkgKmhkbWksIHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICptb2RlKQogCiAJCS8qIEhETUkgSW5pdGlhbGl6YXRpb24gU3RlcCBFIC0gQ29uZmlndXJlIGF1
ZGlvICovCiAJCWhkbWlfY2xrX3JlZ2VuZXJhdG9yX3VwZGF0ZV9waXhlbF9jbG9jayhoZG1pKTsK
LQkJaGRtaV9lbmFibGVfYXVkaW9fY2xrKGhkbWksIHRydWUpOworCQloZG1pX2VuYWJsZV9hdWRp
b19jbGsoaGRtaSwgaGRtaS0+YXVkaW9fZW5hYmxlKTsKIAl9CiAKIAkvKiBub3QgZm9yIERWSSBt
b2RlICovCi0tIAoyLjIzLjAuNTgxLmc3OGQyZjI4ZWY3LWdvb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
