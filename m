Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF759E1BE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 10:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD4A890ED;
	Tue, 27 Aug 2019 08:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E97488F9A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 08:14:35 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 10so2056806wmp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 01:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NHmY8pxEcNdhvGFCmnE/5DGDKeL3pKczVPiHriBHsDc=;
 b=ucDSNTdAo1Rg7+mcOI5lQcOFWZUb5o5ODcsfbGY5GSexHyPuCpFX0oyFiTE62nDPy6
 uG3bpQ6LD8eB2MOH65YjTELtP+Fpj1DbKe1DRA5BOEEp9+ciNAKE1frC/LJEVEMsM+hk
 s8BH52QFQEBydAuxLWHZmrLM9YxUCZF+z+GVRrey8nK5TIk1dghIuQUVnA8YqxJ1Plyg
 8vIMQXVQHruzL0YBywtT4ln2JZMt3uVMMhn2BgaQzC/mlEhhrNUOPPk87wDezeNWZuCs
 T9+rWTTvg3kldvMx67n6bqY6L0MLt/jcq9iLy2zD5rPkT8yARWORR89jPtvE89qjpgij
 lygQ==
X-Gm-Message-State: APjAAAWgvbfCWVs2M/CMTLSxfjSbJOGU8IzVY1HnEoW2tG7/jffwvUM+
 B0nbxYRFRXxFNi8v9W/MEFDIFA==
X-Google-Smtp-Source: APXvYqwQCFhuEkIldrSpk+reMaSAS12NfRiuafCS3NYofTZVdHef/iSfRYZqvq3vcQKqXQ2NDSy6bQ==
X-Received: by 2002:a05:600c:21d3:: with SMTP id
 x19mr26083979wmj.45.1566893673444; 
 Tue, 27 Aug 2019 01:14:33 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f18sm11911792wrx.85.2019.08.27.01.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 01:14:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH RFC v2 6/8] drm/meson: venc: add support for YUV420 setup
Date: Tue, 27 Aug 2019 10:14:23 +0200
Message-Id: <20190827081425.15011-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827081425.15011-1-narmstrong@baylibre.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NHmY8pxEcNdhvGFCmnE/5DGDKeL3pKczVPiHriBHsDc=;
 b=jwq4busvYotbATUX25Jrg9zhdC3QfcvMCXHpyn1j80JhduMKwxdP9ZOtml83XfPubY
 B1+oM52yDCWmWx+ud7fOQ+LXO1/33wW/7MxWDxehokqCXSFdUhOByah6A9NsHd/7vbyc
 rfkwvDz/TMJX2CZYQDyqaTAKaJX9ZjWVT9bnHSu85IDYNlF7l0vXRYtO3pXXAKC9+mPK
 UwzM8R8R6RHfz+9PxRpgrRsw4J84FPNE32+4JOpvnqjh8PItCd3Y3U8p2GPXfqcCwcqn
 wUWvwITuucTmb7HXFSRrUHeXgNpaWqlxhcG163ZFP5ZxZgJ9phy4YZ2ozR+juhu0LUhb
 ryWQ==
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
bXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3
X2hkbWkuYyB8IDMgKystCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jICAgIHwg
OCArKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuaCAgICB8IDIgKysK
IDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCmluZGV4IDlhZTI0Y2M1ZmFhMi4uMmM2OTAyNGU1
YmNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKQEAgLTc1OCw3ICs3NTgs
OCBAQCBzdGF0aWMgdm9pZCBtZXNvbl92ZW5jX2hkbWlfZW5jb2Rlcl9tb2RlX3NldChzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlLAogCURSTV9ERUJVR19EUklWRVIoIlwiJXNcIiB2aWMgJWRcbiIs
IG1vZGUtPm5hbWUsIHZpYyk7CiAKIAkvKiBWRU5DICsgVkVOQy1EVkkgTW9kZSBzZXR1cCAqLwot
CW1lc29uX3ZlbmNfaGRtaV9tb2RlX3NldChwcml2LCB2aWMsIG1vZGUpOworCW1lc29uX3ZlbmNf
aGRtaV9tb2RlX3NldChwcml2LCB2aWMsIHljcmNiX21hcCwgZmFsc2UsCisJCQkJIFZQVV9IRE1J
X09VVFBVVF9DQllDUik7CiAKIAkvKiBWQ0xLIFNldCBjbG9jayAqLwogCWR3X2hkbWlfc2V0X3Zj
bGsoZHdfaGRtaSwgbW9kZSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVz
b25fdmVuYy5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYwppbmRleCBkMmQ0
YzNlYmY0NmIuLmJlMWZiMDhhODBmNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29u
L21lc29uX3ZlbmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jCkBA
IC05NDYsNiArOTQ2LDggQEAgYm9vbCBtZXNvbl92ZW5jX2hkbWlfdmVuY19yZXBlYXQoaW50IHZp
YykKIEVYUE9SVF9TWU1CT0xfR1BMKG1lc29uX3ZlbmNfaGRtaV92ZW5jX3JlcGVhdCk7CiAKIHZv
aWQgbWVzb25fdmVuY19oZG1pX21vZGVfc2V0KHN0cnVjdCBtZXNvbl9kcm0gKnByaXYsIGludCB2
aWMsCisJCQkgICAgICB1bnNpZ25lZCBpbnQgeWNyY2JfbWFwLAorCQkJICAgICAgYm9vbCB5dXY0
MjBfbW9kZSwKIAkJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQog
ewogCXVuaW9uIG1lc29uX2hkbWlfdmVuY19tb2RlICp2bW9kZSA9IE5VTEw7CkBAIC0xNTI4LDE0
ICsxNTMwLDE0IEBAIHZvaWQgbWVzb25fdmVuY19oZG1pX21vZGVfc2V0KHN0cnVjdCBtZXNvbl9k
cm0gKnByaXYsIGludCB2aWMsCiAJaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR19QVlNZ
TkMpCiAJCXJlZyB8PSBWUFVfSERNSV9JTlZfVlNZTkM7CiAKLQkvKiBPdXRwdXQgZGF0YSBmb3Jt
YXQ6IENiWUNyICovCi0JcmVnIHw9IFZQVV9IRE1JX09VVFBVVF9DQllDUjsKKwkvKiBPdXRwdXQg
ZGF0YSBmb3JtYXQgKi8KKwlyZWcgfD0geWNyY2JfbWFwOwogCiAJLyoKIAkgKiBXcml0ZSByYXRl
IHRvIHRoZSBhc3luYyBGSUZPIGJldHdlZW4gVkVOQyBhbmQgSERNSS4KIAkgKiBPbmUgd3JpdGUg
ZXZlcnkgMiB3cl9jbGsuCiAJICovCi0JaWYgKHZlbmNfcmVwZWF0KQorCWlmICh2ZW5jX3JlcGVh
dCB8fCB5dXY0MjBfbW9kZSkKIAkJcmVnIHw9IFZQVV9IRE1JX1dSX1JBVEUoMik7CiAKIAkvKgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuaCBiL2RyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmgKaW5kZXggMWFiZGNiZGY1MWMwLi45MTM4MjU1ZmZj
OWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuaApAQCAtNjAsNiArNjAsOCBAQCBleHRl
cm4gc3RydWN0IG1lc29uX2N2YnNfZW5jaV9tb2RlIG1lc29uX2N2YnNfZW5jaV9udHNjOwogdm9p
ZCBtZXNvbl92ZW5jaV9jdmJzX21vZGVfc2V0KHN0cnVjdCBtZXNvbl9kcm0gKnByaXYsCiAJCQkg
ICAgICAgc3RydWN0IG1lc29uX2N2YnNfZW5jaV9tb2RlICptb2RlKTsKIHZvaWQgbWVzb25fdmVu
Y19oZG1pX21vZGVfc2V0KHN0cnVjdCBtZXNvbl9kcm0gKnByaXYsIGludCB2aWMsCisJCQkgICAg
ICB1bnNpZ25lZCBpbnQgeWNyY2JfbWFwLAorCQkJICAgICAgYm9vbCB5dXY0MjBfbW9kZSwKIAkJ
CSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKTsKIHVuc2lnbmVkIGlu
dCBtZXNvbl92ZW5jaV9nZXRfZmllbGQoc3RydWN0IG1lc29uX2RybSAqcHJpdik7CiAKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
