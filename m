Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C419F07D8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 22:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DCF6EA72;
	Tue,  5 Nov 2019 21:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83936EA3D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 21:11:01 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id y64so5981407ywe.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 13:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+WiVxRRU/BsDC4YALJAt3eFqvdwKtmFyjMHuXXIhN00=;
 b=qYVUkB1rbHOuIID8u8jESt0BPk0X/VxjmEDS+j38jiIjqLYBMyrry6lANCiv0/vjxf
 r/jDwObsKcnpzRqmKJ+DWwppOuzV65jjFPi41/XRqg+B72kLOx6k8SJUALwQeIiHA1vc
 QEa/HwJ+3cr619AITuNO8L8toFIHtMPb+nUWuMzSQhf2ChqpZXDoScUDaTgpmbe7HKCq
 SvB2xFwS0lyyPlxa/NggC5YLs/PMI71aj+3UXmdRAqiOY50kaPlsJV1bsBDFSSScjCsK
 1vPe+vkkihlHDU0+7ENBuQmIMQ+ZTJnAPvYEny7zkg7kGKdFZUeTo3pk0XOpOLBJgQEU
 acpQ==
X-Gm-Message-State: APjAAAUkrblUWbZgX0oeN7LfilxGN1JrCv8ih7LsUYDw/BMsPkRIWu7m
 dsUjHA/UAAt8yuBvIFTRgc0RcbLfg6E=
X-Google-Smtp-Source: APXvYqzqhKbfG6uj0C9QtCsk5hTcg0qnCB5SoNKDWw01NkumaG0mVUCnnbjJ/lO9GqEJnRlx8UxkVA==
X-Received: by 2002:a81:7053:: with SMTP id l80mr23239678ywc.377.1572988260799; 
 Tue, 05 Nov 2019 13:11:00 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j66sm1815216ywb.101.2019.11.05.13.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 13:11:00 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 7/7] drm/mediatek: Support 180 degree rotation
Date: Tue,  5 Nov 2019 16:10:24 -0500
Message-Id: <20191105211034.123937-8-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191105211034.123937-1-sean@poorly.run>
References: <20191105211034.123937-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+WiVxRRU/BsDC4YALJAt3eFqvdwKtmFyjMHuXXIhN00=;
 b=b7BvNVaq55rSQstmyVb7FVPxaDzfpQvfg2LWzAsNLXIw4Zgl5nKJ8oQMM9S+74IlZf
 6evcHrczQNvXo4hfr/qCgBgUU1QXMEibjDd9StKHdtKFZ8/2d2HqLAUO9A0UGR3lsrpn
 HUzkGW8k5Dvge9poGrqF0sURTtUNKfmb4kwUAnaOXEdwRJJVKqRDDS3P8DeScfku51AJ
 xBYemInVm9isbevgdMHl1h6n0R4KLDQ6m+CMiC1pHpmibukZ66lHryHliW1ga6HcwnVx
 mC2RhQ1///qyMnhFQh6+pp/VxcsN1UPACfXKltS0IxDOD9OPpCxKfbtpVGrKHi0jUkDc
 yxmg==
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
Cc: dcastagna@chromium.org, matthias.bgg@gmail.com, mcasas@chromium.org,
 Sean Paul <seanpaul@chromium.org>, frkoenig@chromium.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpOb3cgdGhhdCB3ZSBzdXBw
b3J0IGJvdGggcmVmbGVjdGlvbnMsIHdlIGNhbiBleHBvc2UgMTgwIGRlZ3JlZSByb3RhdGlvbgph
bmQgcmVseSBvbiB0aGUgc2ltcGxpZnkgcm91dGluZSB0byBjb252ZXJ0IHRoYXQgaW50byBSRUZM
RUNUX1ggfApSRUZMRUNUX1kKClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hy
b21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKaW5kZXggZjRjNGQzZmVkYzVm
Li40YTU1YmI2ZTIyMTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMK
QEAgLTE0Myw4ICsxNDMsOCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG10a19vdmxfbGF5ZXJfbnIo
c3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKIAogc3RhdGljIHVuc2lnbmVkIGludCBtdGtfb3Zs
X3N1cHBvcnRlZF9yb3RhdGlvbnMoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKIHsKLQlyZXR1
cm4gRFJNX01PREVfUk9UQVRFXzAgfCBEUk1fTU9ERV9SRUZMRUNUX1kgfAotCSAgICAgICBEUk1f
TU9ERV9SRUZMRUNUX1g7CisJcmV0dXJuIERSTV9NT0RFX1JPVEFURV8wIHwgRFJNX01PREVfUk9U
QVRFXzE4MCB8CisJICAgICAgIERSTV9NT0RFX1JFRkxFQ1RfWCB8IERSTV9NT0RFX1JFRkxFQ1Rf
WTsKIH0KIAogc3RhdGljIGludCBtdGtfb3ZsX2xheWVyX2NoZWNrKHN0cnVjdCBtdGtfZGRwX2Nv
bXAgKmNvbXAsIHVuc2lnbmVkIGludCBpZHgsCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2lu
ZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
