Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBECACB540
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2836EAC2;
	Fri,  4 Oct 2019 07:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E19A89BA9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 04:14:45 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id d26so904518pgl.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 21:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMBWBObY5TAg6ccjViv94lsR9vhyqh//qqXjnxybPn4=;
 b=XXY8omMLxFyhmJI6/OXp3d6mYDbsU/Xcr1xnuNkd1ipdN35VjjLQDM+LKEvlf2sccm
 Kp6LPoWVObfnKGHRmJdyGrYLA9IbuMSCHkT+ZWCWd4vwFC0kkxMAmeSerL+V2fcSIVVo
 UNbxB2Yz1Trgp3oMaf97K/dLoUJeZX+Ssjn+AptiNy7+NqRJ2phcO5YarRUpPMiHKV4s
 +cQb3jhxCYfb/hlgLCk/jKbZ+fkIaO9wmV4Pm5HpJIO4xep6P4It2Jp9dPRP6HyUAAG+
 4HG146G/PXTIJEhNZ42WlmKzlYPJvJNnr4CxSXHCxJQO/YcDHTAPRPitnomoU56TOytE
 6VJg==
X-Gm-Message-State: APjAAAW8y//q+LMdG5BGI43BgbgWTzVp8CI1XJRa2gJ0yZ98i9F+oNqm
 Gk1qRsjU8kHC6zVE0a0qx7pzBA==
X-Google-Smtp-Source: APXvYqz6+m0BHndgOBBpcbuerLKGK0gYMwBss4tu7T/iC6fV04yrpAecbt/bgBysta04HsJtKsYn4A==
X-Received: by 2002:a63:1c09:: with SMTP id c9mr7498204pgc.347.1570076084849; 
 Wed, 02 Oct 2019 21:14:44 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id q42sm718700pja.16.2019.10.02.21.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 21:14:44 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] drm/bridge: dw-hdmi: Restore audio when setting a
 mode
Date: Thu,  3 Oct 2019 12:14:38 +0800
Message-Id: <20191003041438.194224-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMBWBObY5TAg6ccjViv94lsR9vhyqh//qqXjnxybPn4=;
 b=XqXsTJWVRpZea6TA7FBFgnhTI63A2/g03nfSRRb33FkaY5eHoSUvNUKEOdIMbnpkbB
 Pecea+Q0A331rSFnGj2eJ25IBgyIygcpzhSbOdlVrje4TCo89GmFdQxR3an9e70yYyn9
 A+wMolfWeeZXTHrgo82zxfTc7I+G9zjh+5wFk=
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
a2tAcm9jay1jaGlwcy5jb20+Ci0tLQogQ2hhbmdlIGZyb20gdjEgdG8gdjI6CiAgLSBVc2UgYXVk
aW9fbG9jayB0byBwcm90ZWN0IGF1ZGlvIGNsb2NrLgogIC0gRml4IHRoZSBwYXRjaCB0aXRsZS4K
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDEzICsrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwppbmRleCBhYTdlZmQ0ZGEx
YzguLjc0OWQ4ZTRjNTM1YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1o
ZG1pLmMKQEAgLTE5ODIsNiArMTk4MiwxNyBAQCBzdGF0aWMgdm9pZCBoZG1pX2Rpc2FibGVfb3Zl
cmZsb3dfaW50ZXJydXB0cyhzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKIAkJICAgIEhETUlfSUhfTVVU
RV9GQ19TVEFUMik7CiB9CiAKK3N0YXRpYyB2b2lkIGR3X2hkbWlfYXVkaW9fcmVzdG9yZShzdHJ1
Y3QgZHdfaGRtaSAqaGRtaSkKK3sKKwl1bnNpZ25lZCBsb25nIGZsYWdzOworCisJc3Bpbl9sb2Nr
X2lycXNhdmUoJmhkbWktPmF1ZGlvX2xvY2ssIGZsYWdzKTsKKworCWhkbWlfZW5hYmxlX2F1ZGlv
X2NsayhoZG1pLCBoZG1pLT5hdWRpb19lbmFibGUpOworCisJc3Bpbl91bmxvY2tfaXJxcmVzdG9y
ZSgmaGRtaS0+YXVkaW9fbG9jaywgZmxhZ3MpOworfQorCiBzdGF0aWMgaW50IGR3X2hkbWlfc2V0
dXAoc3RydWN0IGR3X2hkbWkgKmhkbWksIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQog
ewogCWludCByZXQ7CkBAIC0yMDQ1LDcgKzIwNTYsNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfc2V0
dXAoc3RydWN0IGR3X2hkbWkgKmhkbWksIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQog
CiAJCS8qIEhETUkgSW5pdGlhbGl6YXRpb24gU3RlcCBFIC0gQ29uZmlndXJlIGF1ZGlvICovCiAJ
CWhkbWlfY2xrX3JlZ2VuZXJhdG9yX3VwZGF0ZV9waXhlbF9jbG9jayhoZG1pKTsKLQkJaGRtaV9l
bmFibGVfYXVkaW9fY2xrKGhkbWksIHRydWUpOworCQlkd19oZG1pX2F1ZGlvX3Jlc3RvcmUoaGRt
aSk7CiAJfQogCiAJLyogbm90IGZvciBEVkkgbW9kZSAqLwotLSAKMi4yMy4wLjQ0NC5nMThlZWI1
YTI2NS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
