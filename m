Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E9E178E8C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2FF89B69;
	Wed,  4 Mar 2020 10:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF8089B38
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:41:00 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y17so1757132wrn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 02:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tlZFtTmligcUGV2ilGv6/Rl0JPmMhZmteeBqaEsq6sg=;
 b=p5N/NFyAuT8ukGGq70FLD7EFyzryrkzlSFGA0gCXfZFxRI8hmOfyqv+c0JPYRinVno
 dz8FZYsj9MLsdY9duoUA8YcA57relbWXeZqDOfcpFC9E9WrKALLhb1YqtDVkAkOPm+HH
 b7F10S1+LdUuN/riOdvhrf24aTAN9k6pHqqx6LxNrIcARf3cBWWkXNbfHTfyE77gyMbS
 rDXZf5n2/1yHQydhOv/LdgTKcEXvCXAPMk6cPoCRKIqn008fhy+K9XjrWGHNEgFj2IVQ
 BzyiT+1yUoQMgUY/G5xZJZIBkoFRi3JrVlzV1vARxcxSjZh8DoP3aplkTIc1Iftgw7tu
 Lhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tlZFtTmligcUGV2ilGv6/Rl0JPmMhZmteeBqaEsq6sg=;
 b=JOLT42EA7wN396P8OvXWtqy5P+DlQFRuHewzoc6k6sEYwY6ijbSFsgGqKwgp0ssotq
 QEsPY5iPubusHnJ2a0Jx6+KFxxsxg/ChGHA3t4l1zqmNwt7g3TFJdg6LynfIaQhU/0Mg
 8Px07r+C4KcYhqvmmPfLNp6QY0Ol1p61eKIYzvWmx3kYl230Y7J52x9zQRkwKW2EQfGM
 t9BR53vYGqsXysG1uhKAK8F9cAF+PwOogKnEFDJQgr+/v5DuvEWessRC7Wje3gc9psLm
 gCx7GxKTWYI3yQxnGS1T45AIjKhVkppKgOxO/qRJDxFFnHj+5sTu1cR1QqgZp0COYM8V
 e4Tg==
X-Gm-Message-State: ANhLgQ0wDZ578ruiJi4vQX77qvIptQQRFQlT+NpyxkxslYp5LFDbJYB5
 n3BidcKx+v01XASgGcuY2819IQ==
X-Google-Smtp-Source: ADFU+vs3gnEE2UIP5b+mmLx2vKVo2Uouk57cGecRqzNjEhKymPdorJNJJ26O032WTJZcTMZagGHwXw==
X-Received: by 2002:adf:fa07:: with SMTP id m7mr3439222wrr.384.1583318459144; 
 Wed, 04 Mar 2020 02:40:59 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm24006398wro.36.2020.03.04.02.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 02:40:58 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: p.zabel@pengutronix.de, heiko@sntech.de, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v5 01/11] drm/bridge: dw-hdmi: set mtmdsclock for deep color
Date: Wed,  4 Mar 2020 11:40:42 +0100
Message-Id: <20200304104052.17196-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200304104052.17196-1-narmstrong@baylibre.com>
References: <20200304104052.17196-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgoKQ29uZmlndXJlIHRoZSBjb3Jy
ZWN0IG10bWRzY2xvY2sgZm9yIGRlZXAgY29sb3JzIHRvIHByZXBhcmUgc3VwcG9ydApmb3IgMTAs
IDEyICYgMTZiaXQgb3V0cHV0LgoKU2lnbmVkLW9mZi1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNA
a3dpYm9vLnNlPgpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXls
aWJyZS5jb20+ClJldmlld2VkLWJ5OiBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5za3JhYmVjQHNp
b2wubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwg
MjEgKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LmMKaW5kZXggOWJhZDE5NGNmZDBhLi4xMGY5OGM5ZWU3N2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCkBAIC0xODE0LDEzICsxODE0LDMyIEBAIHN0YXRpYyB2
b2lkIGhkbWlfYXZfY29tcG9zZXIoc3RydWN0IGR3X2hkbWkgKmhkbWksCiAJaW50IGhibGFuaywg
dmJsYW5rLCBoX2RlX2hzLCB2X2RlX3ZzLCBoc3luY19sZW4sIHZzeW5jX2xlbjsKIAl1bnNpZ25l
ZCBpbnQgdmRpc3BsYXksIGhkaXNwbGF5OwogCi0Jdm1vZGUtPm10bWRzY2xvY2sgPSB2bW9kZS0+
bXBpeGVsY2xvY2sgPSBtb2RlLT5jbG9jayAqIDEwMDA7CisJdm1vZGUtPm1waXhlbGNsb2NrID0g
bW9kZS0+Y2xvY2sgKiAxMDAwOwogCiAJZGV2X2RiZyhoZG1pLT5kZXYsICJmaW5hbCBwaXhjbGsg
PSAlZFxuIiwgdm1vZGUtPm1waXhlbGNsb2NrKTsKIAorCXZtb2RlLT5tdG1kc2Nsb2NrID0gdm1v
ZGUtPm1waXhlbGNsb2NrOworCisJaWYgKCFoZG1pX2J1c19mbXRfaXNfeXV2NDIyKGhkbWktPmhk
bWlfZGF0YS5lbmNfb3V0X2J1c19mb3JtYXQpKSB7CisJCXN3aXRjaCAoaGRtaV9idXNfZm10X2Nv
bG9yX2RlcHRoKAorCQkJCWhkbWktPmhkbWlfZGF0YS5lbmNfb3V0X2J1c19mb3JtYXQpKSB7CisJ
CWNhc2UgMTY6CisJCQl2bW9kZS0+bXRtZHNjbG9jayA9IHZtb2RlLT5tcGl4ZWxjbG9jayAqIDI7
CisJCQlicmVhazsKKwkJY2FzZSAxMjoKKwkJCXZtb2RlLT5tdG1kc2Nsb2NrID0gdm1vZGUtPm1w
aXhlbGNsb2NrICogMyAvIDI7CisJCQlicmVhazsKKwkJY2FzZSAxMDoKKwkJCXZtb2RlLT5tdG1k
c2Nsb2NrID0gdm1vZGUtPm1waXhlbGNsb2NrICogNSAvIDQ7CisJCQlicmVhazsKKwkJfQorCX0K
KwogCWlmIChoZG1pX2J1c19mbXRfaXNfeXV2NDIwKGhkbWktPmhkbWlfZGF0YS5lbmNfb3V0X2J1
c19mb3JtYXQpKQogCQl2bW9kZS0+bXRtZHNjbG9jayAvPSAyOwogCisJZGV2X2RiZyhoZG1pLT5k
ZXYsICJmaW5hbCB0bWRzY2xvY2sgPSAlZFxuIiwgdm1vZGUtPm10bWRzY2xvY2spOworCiAJLyog
U2V0IHVwIEhETUlfRkNfSU5WSURDT05GICovCiAJaW52X3ZhbCA9IChoZG1pLT5oZG1pX2RhdGEu
aGRjcF9lbmFibGUgfHwKIAkJICAgKGR3X2hkbWlfc3VwcG9ydF9zY2RjKGhkbWkpICYmCi0tIAoy
LjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
