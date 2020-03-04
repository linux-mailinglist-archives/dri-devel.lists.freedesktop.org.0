Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9982178E93
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5266E136;
	Wed,  4 Mar 2020 10:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97ADF6E136
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:41:05 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q8so1763434wrm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 02:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBV+Mcykh4jSy5LpMQRzAqt2z+ZaR095g4MjbXShAoU=;
 b=mx3iwudlVrvCSNzwqeOyAiR9iitVlgrIa99spLuUe7EBWEDzGsbfPJwUu/KChoErXv
 h+x7mYH4pOYQK/gcuqO2/KiRhpkfhw4SqJ+ijRydXIHTihh3jCfnuwVFvE7/bBsRpjSo
 YBHe8jApAPWuwbuR3E6ulkOBVLLeYNlIb8z2sfscv+9NWVBDWb1jw1FEGVbfaZdb3S2G
 SqE3edSCmjs3PY4oDy47OO6WbgnP7lbPYdcRzSmj6RbirUvScmGhMBpnIZh++HUN1Igk
 AQmQx91AAzSSK13TZy1OAfbzdS5FaHA0ymybCPHhkIPN9URKH7R/mvUd1wqOfe8t2Fs2
 GFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBV+Mcykh4jSy5LpMQRzAqt2z+ZaR095g4MjbXShAoU=;
 b=jiaj8WkFs49z0KIrEamlXVWiTxZp+gk6HDEOr6hiXz8Hlx6KrhZY2nvaDBZA17X7e4
 E3MXHjYdmdSaCnNF8sUBmClsLSTBpxUHqIY38Pf9U49V6IMBgmWm5NzNJMMK5bCsRLOj
 AV3Vi0QtFMySZPok4/1eApHDo3+BqmtmOsYbmxGf5AIuyeGxAGAOI9MpVfIYMYOcABez
 D7wIjet6APbUMo8mtgXjdDxQurxnYebKH4IBLOmPiXjTDIPKhWf0PnnP0s6dn9GB+nCH
 DBekE80iU3f5cv0HxHqHIu+EjUE7Hipr0tZsjEYxPFi0N7Wl1HJjs+QIq8D4yTWpXLs7
 wl6A==
X-Gm-Message-State: ANhLgQ2knhvPWhG4cdh817I4F74H8s2RqFtN+OPPjLSpQ1rNNH/FoZqi
 2Cs8DQSV8tp43GKLxz2W/kblhg==
X-Google-Smtp-Source: ADFU+vsAiBhy5hUXNqkS6IUhDPu3/5igsqNw0fPqWtjcAmSwSaZaQwxoNYwzPB6lgmNIuSlWEmlnGA==
X-Received: by 2002:adf:e74e:: with SMTP id c14mr3643854wrn.128.1583318464154; 
 Wed, 04 Mar 2020 02:41:04 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm24006398wro.36.2020.03.04.02.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 02:41:03 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: p.zabel@pengutronix.de, heiko@sntech.de, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v5 05/11] drm/bridge: synopsys: dw-hdmi: allow ycbcr420 modes
 for >= 0x200a
Date: Wed,  4 Mar 2020 11:40:46 +0100
Message-Id: <20200304104052.17196-6-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoZSBEVy1IRE1JIENvbnRyb2xsZXIgc3VwcG9ydHMgdGhlIEhETUkyLjAgbW9kZXMsIGVu
YWJsZSBzdXBwb3J0CmZvciB0aGVzZSBtb2RlcyBpbiB0aGUgY29ubmVjdG9yIGlmIHRoZSBwbGF0
Zm9ybSBzdXBwb3J0cyB0aGVtLgpXZSBsaW1pdCB0aGVzZSBtb2RlcyB0byBEVy1IRE1JIElQIHZl
cnNpb24gPj0gMHgyMDBhIHdoaWNoCmFyZSBkZXNpZ25lZCB0byBzdXBwb3J0IEhETUkyLjAgZGlz
cGxheSBtb2Rlcy4KClNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5j
b20+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+ClJldmlld2VkLWJ5OiBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5za3JhYmVj
QHNpb2wubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
IHwgNiArKysrKysKIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggICAgICAgICAgICAgIHwg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKaW5kZXggZGUxOWU4OTkzZTFkLi5mODVjMTVhZDg0ODYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCkBAIC0zMjUyLDYg
KzMyNTIsMTIgQEAgX19kd19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYs
CiAJaGRtaS0+YnJpZGdlLm9mX25vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKICNlbmRpZgogCisJ
aWYgKGhkbWktPnZlcnNpb24gPj0gMHgyMDBhKQorCQloZG1pLT5jb25uZWN0b3IueWNiY3JfNDIw
X2FsbG93ZWQgPQorCQkJaGRtaS0+cGxhdF9kYXRhLT55Y2Jjcl80MjBfYWxsb3dlZDsKKwllbHNl
CisJCWhkbWktPmNvbm5lY3Rvci55Y2Jjcl80MjBfYWxsb3dlZCA9IGZhbHNlOworCiAJbWVtc2V0
KCZwZGV2aW5mbywgMCwgc2l6ZW9mKHBkZXZpbmZvKSk7CiAJcGRldmluZm8ucGFyZW50ID0gZGV2
OwogCXBkZXZpbmZvLmlkID0gUExBVEZPUk1fREVWSURfQVVUTzsKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggYi9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oCmlu
ZGV4IDlkNGQ1Y2M0Nzk2OS4uMGIzNGExMmM0YTFjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9i
cmlkZ2UvZHdfaGRtaS5oCisrKyBiL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmgKQEAgLTEy
OSw2ICsxMjksNyBAQCBzdHJ1Y3QgZHdfaGRtaV9wbGF0X2RhdGEgewogCXVuc2lnbmVkIGxvbmcg
aW5wdXRfYnVzX2Zvcm1hdDsKIAl1bnNpZ25lZCBsb25nIGlucHV0X2J1c19lbmNvZGluZzsKIAli
b29sIHVzZV9kcm1faW5mb2ZyYW1lOworCWJvb2wgeWNiY3JfNDIwX2FsbG93ZWQ7CiAKIAkvKiBW
ZW5kb3IgUEhZIHN1cHBvcnQgKi8KIAljb25zdCBzdHJ1Y3QgZHdfaGRtaV9waHlfb3BzICpwaHlf
b3BzOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
