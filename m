Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F110ACB532
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547436EABC;
	Fri,  4 Oct 2019 07:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FA96E02C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 04:05:50 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id s1so888953pgv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 21:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ipcV5l1n/8It2aLom5M2l+YXf6MikdW6xOH7ijHIWC4=;
 b=nM3Z9MiLpmuCqUZ3h5TfZgwCw7ThsE2dmtfa3rHPWjkPClae6GDp127K+hYvtBwtkJ
 dZCMB3UfsWRvL32aXCQJTYRlY4mJMZt5lIwL2qNW/wxDaC5eTZOxR1P10QDh+oT/I/Ql
 jYbIs09v9EHcBscXTiagLFHynXJvKp3EDRoJFhAchccFXwbEkIUw4gjrn/OkjUgE9eI5
 h+twNvci+KBwH2jIRAzmJr0W+57qSI042V4yBAcyMexLthH/zJA4RHlkT/xwIaP7tuHD
 MIJYfFuxI5fsnX9sX6L281Yle/BoK7iUxQu50xW8SF1w61Tlb5Ne6GjUb4D//W/0wULX
 BGcQ==
X-Gm-Message-State: APjAAAUtnH27un2tJiv6edTZ6t1FdomRBKHVHG6oHMk/xS5QZ03cGZWv
 EpBsMub7maVVBB+T0ncYmNB3sg==
X-Google-Smtp-Source: APXvYqzWiB8hQkm2uo7S8xni0GVmAx2W9Y1kaKW4dhI8KN2xpmpX/enaUKzWwxDftTpN40iGJ57rhw==
X-Received: by 2002:a62:754a:: with SMTP id q71mr8685426pfc.70.1570075550111; 
 Wed, 02 Oct 2019 21:05:50 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id z5sm954845pgi.19.2019.10.02.21.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 21:05:49 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] FROMLIST: drm/bridge: dw-hdmi: Restore audio when setting
 a mode
Date: Thu,  3 Oct 2019 12:05:40 +0800
Message-Id: <20191003040540.180310-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ipcV5l1n/8It2aLom5M2l+YXf6MikdW6xOH7ijHIWC4=;
 b=GJ8dCYphiCUor6hJ8Gk2a0LVJjkKGKBK0qYgul5TeGjsdlVTkyabw4iWB5Tf+iw8Ua
 FiN7fu0PJaIxegA5BQ9wp6F5l6rFTNhY5aFK9pAnie4HM6QzrpFmxoq8pnTTVRFeYJAV
 OE4PSBL5YMHVsOurDvxBxxhEypEBCMV34tWV0=
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
a2tAcm9jay1jaGlwcy5jb20+Ci0tLQogQ2hhbmdlIGZyb20gdjEgdG8gdjI6CiAtIFVzZSBhdWRp
b19sb2NrIHRvIHByb3RlY3QgYXVkaW8gY2xvY2suCgogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMgfCAxMyArKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLmMKaW5kZXggYWE3ZWZkNGRhMWM4Li43NDlkOGU0YzUzNWIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCkBAIC0xOTgyLDYgKzE5ODIsMTcg
QEAgc3RhdGljIHZvaWQgaGRtaV9kaXNhYmxlX292ZXJmbG93X2ludGVycnVwdHMoc3RydWN0IGR3
X2hkbWkgKmhkbWkpCiAJCSAgICBIRE1JX0lIX01VVEVfRkNfU1RBVDIpOwogfQogCitzdGF0aWMg
dm9pZCBkd19oZG1pX2F1ZGlvX3Jlc3RvcmUoc3RydWN0IGR3X2hkbWkgKmhkbWkpCit7CisJdW5z
aWduZWQgbG9uZyBmbGFnczsKKworCXNwaW5fbG9ja19pcnFzYXZlKCZoZG1pLT5hdWRpb19sb2Nr
LCBmbGFncyk7CisKKwloZG1pX2VuYWJsZV9hdWRpb19jbGsoaGRtaSwgaGRtaS0+YXVkaW9fZW5h
YmxlKTsKKworCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmhkbWktPmF1ZGlvX2xvY2ssIGZsYWdz
KTsKK30KKwogc3RhdGljIGludCBkd19oZG1pX3NldHVwKHN0cnVjdCBkd19oZG1pICpoZG1pLCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIHsKIAlpbnQgcmV0OwpAQCAtMjA0NSw3ICsy
MDU2LDcgQEAgc3RhdGljIGludCBkd19oZG1pX3NldHVwKHN0cnVjdCBkd19oZG1pICpoZG1pLCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIAogCQkvKiBIRE1JIEluaXRpYWxpemF0aW9u
IFN0ZXAgRSAtIENvbmZpZ3VyZSBhdWRpbyAqLwogCQloZG1pX2Nsa19yZWdlbmVyYXRvcl91cGRh
dGVfcGl4ZWxfY2xvY2soaGRtaSk7Ci0JCWhkbWlfZW5hYmxlX2F1ZGlvX2NsayhoZG1pLCB0cnVl
KTsKKwkJZHdfaGRtaV9hdWRpb19yZXN0b3JlKGhkbWkpOwogCX0KIAogCS8qIG5vdCBmb3IgRFZJ
IG1vZGUgKi8KLS0gCjIuMjMuMC40NDQuZzE4ZWViNWEyNjUtZ29vZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
