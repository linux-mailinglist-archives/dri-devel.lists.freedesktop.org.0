Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738B178E9E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D229D6EB1C;
	Wed,  4 Mar 2020 10:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4B46EA4F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:41:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so1757811wrn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 02:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q1GUIN7KBO8lXS2YCrGPVdl4nGtrL7ahFAkqfmqdfyk=;
 b=UlLnoNwk9f5kegUhbueRDDWxZmwwbTz/9mK+jbJqiY+TA5vkYqqeQEZSng7llq7Ln6
 3XpI+06DOJVJceGP5no37stEXbDHZ9K4e2HgIdYK6KzzQfx4tN6dZKpckkjjYtiqaD4U
 0ocl7+LLwqGahhZMCEC2sKutkJSzaJfrJA07Ci2+EHpXnlVdi2gItXlFoaE04b7Rmikb
 uWbA0hC9Pp8iG18Sg88HEaQABd8tzPImtE1jI2GiYyjRayS8JxOyx70SvBrjABZIJd3S
 EU6XkbgbaUbzirFLd1Gep8pcDuB8xylF8PtdRjXQ2pg9CPjtqdFRRoabYHLvUP0DUY5x
 KVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q1GUIN7KBO8lXS2YCrGPVdl4nGtrL7ahFAkqfmqdfyk=;
 b=mB0uEo9tGm6wOGyG/ZCwtuXIZMMSbL1Z8wdZSrwo3fx32K9Ru/LdGSP4KOxc4/UwMU
 SFIlytRIX08+lmXl/AsF1so6m9HUKzUSASp+2m/se2yVrm70rz7f7qGqXMn52QSLe5rZ
 iLdHUox6FggMA4+PGRe1DqdNWPXKU0QiGkV/jpSg46Wv/PZE7l73RHjB9fZQZHBlMawU
 jPyhU8FMm5mBx5hJa6nBdmXQl6CzPnayeDOztdwdmFa+7WD9HvCNSApsYsiEcchZjdlG
 uUxjRm+rPiIxXPBO6lLDuD52sEn2kzRf3laYVXUeIeiW6dAsATDZaZXbw9M89FEB1Cb+
 SEsw==
X-Gm-Message-State: ANhLgQ0wnobwIIJR42k5n3xOT87AmqqcieFVseHUUcS2zxvVNxekxjw7
 +6DbBvjjmzFlsx7TgU0SaPo4Kw==
X-Google-Smtp-Source: ADFU+vvS03o6Ek7ni9t7Qukh+4J0GibYOTSNDC/K49iSwuqzgXiSA2El3UXkF9I+ytl2/KPQDxRQLQ==
X-Received: by 2002:adf:90cd:: with SMTP id i71mr3254354wri.63.1583318468390; 
 Wed, 04 Mar 2020 02:41:08 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm24006398wro.36.2020.03.04.02.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 02:41:07 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v5 09/11] drm/meson: venc: add support for YUV420 setup
Date: Wed,  4 Mar 2020 11:40:50 +0100
Message-Id: <20200304104052.17196-10-narmstrong@baylibre.com>
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

VGhpcyBwYXRjaCBhZGRzIGVuY29kaW5nIHN1cHBvcnQgZm9yIHRoZSBZVVY0MjAgb3V0cHV0IGZy
b20gdGhlCkFtbG9naWMgTWVzb24gU29DcyBWaWRlbyBQcm9jZXNzaW5nIFVuaXQgdG8gdGhlIEhE
TUkgQ29udHJvbGxlci4KClRoZSBZVVY0MjAgaXMgb2J0YWluZWQgYnkgZ2VuZXJhdGluZyBhIFlV
VjQ0NCBwaXhlbCBzdHJlYW0gbGlrZQp0aGUgY2xhc3NpYyBIRE1JIGRpc3BsYXkgbW9kZXMsIGJ1
dCB0aGVuIHRoZSBWaWRlbyBFbmNvZGVyIG91dHB1dApjYW4gYmUgY29uZmlndXJlZCB0byBkb3du
LXNhbXBsZSB0aGUgWVVWNDQ0IHBpeGVsIHN0cmVhbSB0byBhIFlVVjQyMApzdHJlYW0uCgpJbiBh
ZGRpdGlvbiBpZiBwaXhlbCBzdHJlYW0gZG93bi1zYW1wbGluZywgdGhlIFkgQ2IgQ3IgY29tcG9u
ZW50cyBtdXN0CmFsc28gYmUgbWFwcGVkIGRpZmZlcmVudGx5IHRvIGFsaWduIHdpdGggdGhlIEhE
TUkyLjAgc3BlY2lmaWNhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5OiBKZXJuZWogxaBrcmFiZWMgPGplcm5l
ai5za3JhYmVjQHNpb2wubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19o
ZG1pLmMgfCAzICsrLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYyAgICB8IDgg
KysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmggICAgfCAyICsrCiAz
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwppbmRleCA3MmMxMTgxNDJlYWYuLmIyMTA1YzBmZTIw
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCkBAIC03NTIsNyArNzUyLDgg
QEAgc3RhdGljIHZvaWQgbWVzb25fdmVuY19oZG1pX2VuY29kZXJfbW9kZV9zZXQoc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSwKIAlEUk1fREVCVUdfRFJJVkVSKCJcIiVzXCIgdmljICVkXG4iLCBt
b2RlLT5uYW1lLCB2aWMpOwogCiAJLyogVkVOQyArIFZFTkMtRFZJIE1vZGUgc2V0dXAgKi8KLQlt
ZXNvbl92ZW5jX2hkbWlfbW9kZV9zZXQocHJpdiwgdmljLCBtb2RlKTsKKwltZXNvbl92ZW5jX2hk
bWlfbW9kZV9zZXQocHJpdiwgdmljLCB5Y3JjYl9tYXAsIGZhbHNlLAorCQkJCSBWUFVfSERNSV9P
VVRQVVRfQ0JZQ1IpOwogCiAJLyogVkNMSyBTZXQgY2xvY2sgKi8KIAlkd19oZG1pX3NldF92Y2xr
KGR3X2hkbWksIG1vZGUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X3ZlbmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMKaW5kZXggYTlhYjc4
OTcwYmZlLi5mOTNjNzI1YjZmMDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl92ZW5jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYwpAQCAt
OTQ2LDYgKzk0Niw4IEBAIGJvb2wgbWVzb25fdmVuY19oZG1pX3ZlbmNfcmVwZWF0KGludCB2aWMp
CiBFWFBPUlRfU1lNQk9MX0dQTChtZXNvbl92ZW5jX2hkbWlfdmVuY19yZXBlYXQpOwogCiB2b2lk
IG1lc29uX3ZlbmNfaGRtaV9tb2RlX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2LCBpbnQgdmlj
LAorCQkJICAgICAgdW5zaWduZWQgaW50IHljcmNiX21hcCwKKwkJCSAgICAgIGJvb2wgeXV2NDIw
X21vZGUsCiAJCQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIHsK
IAl1bmlvbiBtZXNvbl9oZG1pX3ZlbmNfbW9kZSAqdm1vZGUgPSBOVUxMOwpAQCAtMTUyOCwxNCAr
MTUzMCwxNCBAQCB2b2lkIG1lc29uX3ZlbmNfaGRtaV9tb2RlX3NldChzdHJ1Y3QgbWVzb25fZHJt
ICpwcml2LCBpbnQgdmljLAogCWlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfUFZTWU5D
KQogCQlyZWcgfD0gVlBVX0hETUlfSU5WX1ZTWU5DOwogCi0JLyogT3V0cHV0IGRhdGEgZm9ybWF0
OiBDYllDciAqLwotCXJlZyB8PSBWUFVfSERNSV9PVVRQVVRfQ0JZQ1I7CisJLyogT3V0cHV0IGRh
dGEgZm9ybWF0ICovCisJcmVnIHw9IHljcmNiX21hcDsKIAogCS8qCiAJICogV3JpdGUgcmF0ZSB0
byB0aGUgYXN5bmMgRklGTyBiZXR3ZWVuIFZFTkMgYW5kIEhETUkuCiAJICogT25lIHdyaXRlIGV2
ZXJ5IDIgd3JfY2xrLgogCSAqLwotCWlmICh2ZW5jX3JlcGVhdCkKKwlpZiAodmVuY19yZXBlYXQg
fHwgeXV2NDIwX21vZGUpCiAJCXJlZyB8PSBWUFVfSERNSV9XUl9SQVRFKDIpOwogCiAJLyoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmggYi9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fdmVuYy5oCmluZGV4IDFhYmRjYmRmNTFjMC4uOTEzODI1NWZmYzll
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmgKQEAgLTYwLDYgKzYwLDggQEAgZXh0ZXJu
IHN0cnVjdCBtZXNvbl9jdmJzX2VuY2lfbW9kZSBtZXNvbl9jdmJzX2VuY2lfbnRzYzsKIHZvaWQg
bWVzb25fdmVuY2lfY3Zic19tb2RlX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2LAogCQkJICAg
ICAgIHN0cnVjdCBtZXNvbl9jdmJzX2VuY2lfbW9kZSAqbW9kZSk7CiB2b2lkIG1lc29uX3ZlbmNf
aGRtaV9tb2RlX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2LCBpbnQgdmljLAorCQkJICAgICAg
dW5zaWduZWQgaW50IHljcmNiX21hcCwKKwkJCSAgICAgIGJvb2wgeXV2NDIwX21vZGUsCiAJCQkg
ICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7CiB1bnNpZ25lZCBpbnQg
bWVzb25fdmVuY2lfZ2V0X2ZpZWxkKHN0cnVjdCBtZXNvbl9kcm0gKnByaXYpOwogCi0tIAoyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
