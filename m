Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1093948BBA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 20:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD2B892AA;
	Mon, 17 Jun 2019 18:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AF4892AA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 18:16:06 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w17so5498711qto.10
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 11:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=37lcON4Q5cuuFVjtzVGGM/zMMeikjUdgaDG0gMlFfa0=;
 b=rv8+TBeaYhkp+aOeFOxXYl2rEcbp659AW1mEGTlu1nMW1sHB9rIZ7vYclRW6+1ROrF
 CMtosOkgV7oAbg62chVBjh5zAO0AzfwVwrzgHzbkuX4KRM9NrwsMpQkNJmHXILKRHjqO
 mC7y472aBKen1s82xsMK5jOr8WBB+VNIryitm+DkgmV6rGHv4U2gJxfY22cN5YCHfiJ/
 5MAP7LrWa19X58bP7oIIgOKdFhMWmk0hLAGP+Nmj8CyeIBD0sEZtRbsQcfpM58EsFVo/
 xCRrqp8+u7PR74sPaFvKC7dB9mOmLWS8KEoV7g+HEKx7pvDD2CSMXTJmb1Oi623qixLN
 0Dfg==
X-Gm-Message-State: APjAAAVnYiHHl082dxVTM8k+zYrh7OQFdwkZmQMc+NMPQARTBV5LCaKA
 5Kc10DFRwVMG5rhICy4jSl+FjI4XmCM=
X-Google-Smtp-Source: APXvYqxdM7PLs9QGhcr/Fx0QfODHq7qGPTdDffuZ6hzGaz6//LBmr2nkyDzhQxVJ9iRxyIuUsMMb1w==
X-Received: by 2002:a0c:88c3:: with SMTP id 3mr22062442qvo.21.1560795365692;
 Mon, 17 Jun 2019 11:16:05 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id 15sm6976783qtf.2.2019.06.17.11.16.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 11:16:05 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rcar-du: Fix error check when retrieving crtc state
Date: Mon, 17 Jun 2019 14:15:42 -0400
Message-Id: <20190617181548.124134-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=37lcON4Q5cuuFVjtzVGGM/zMMeikjUdgaDG0gMlFfa0=;
 b=G2wI1CqeTDlCGQ69ZKTKlW5ToPx1/aZ+J1j3AvhoR4iRaQejp0jafmg9E9Zo9fIcoi
 VWTDUsK/42dVlYodFSCqLNswkvHdc4HlrPx4U0GDcZy2LKVd5Pb5Mvv5nYHJVdY1PqC7
 C9YW6sSZcJ3cl/SsKqdZZp6hly82ti/EtswFNt36594jIan27PZeZACF+nyaugCExpz1
 ecWzp9n/70aeRY3AE179OZKfqMrxloVsr7pJX8asSqHwDLQfFmAjZhNh6/ueF+d6Vu1S
 BheM9zO9h3lV+8uF+dXDi9FAslkbjPc7UM822coUjymmIuZJrOxIgyDGO6evxaf6rUuN
 lKbQ==
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>, kbuild test robot <lkp@intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Karol Herbst <karolherbst@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cgpkcm1fYXRvbWljX2dldF9j
cnRjX3N0YXRlKCkgcmV0dXJucyBhbiBlcnJvciBwb2ludGVyIHdoZW4gaXQgZmFpbHMsIHNvCnRo
ZSBudWxsIGNoZWNrIGlzIGRvaW5nIG5vdGhpbmcgaGVyZS4KCkNyZWRpdCB0byAwLWRheS9EYW4g
Q2FycGVudGVyIGZvciByZXBvcnRpbmcgdGhpcy4KCkZpeGVzOiA2ZjNiNjI3ODFiYmQgKCJkcm06
IENvbnZlcnQgY29ubmVjdG9yX2hlbHBlcl9mdW5jcy0+YXRvbWljX2NoZWNrIHRvIGFjY2VwdCBk
cm1fYXRvbWljX3N0YXRlIikKQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBKYW5p
IE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgpDYzogSm9vbmFzIExhaHRpbmVu
IDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgpDYzogUm9kcmlnbyBWaXZpIDxyb2Ry
aWdvLnZpdmlAaW50ZWwuY29tPgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpD
YzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpD
YzogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNv
bT4KQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+CkNjOiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IFtmb3IgcmNhciBsdmRzXQpDYzog
U2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4
aW1lLnJpcGFyZEBib290bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVA
cmVkaGF0LmNvbT4KQ2M6IEthcm9sIEhlcmJzdCA8a2Fyb2xoZXJic3RAZ21haWwuY29tPgpDYzog
SWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PgpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGlu
dXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnClJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4KUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAb3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJv
bWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwppbmRleCBmMmE1ZDRkOTk3MDczLi4xYzYyNTc4NTkw
ZjQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwpAQCAtMTE1LDggKzExNSw4IEBA
IHN0YXRpYyBpbnQgcmNhcl9sdmRzX2Nvbm5lY3Rvcl9hdG9taWNfY2hlY2soc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvciwKIAogCS8qIFdlJ3JlIG5vdCBhbGxvd2VkIHRvIG1vZGlmeSB0
aGUgcmVzb2x1dGlvbi4gKi8KIAljcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfY3J0Y19zdGF0
ZShzdGF0ZSwgY29ubl9zdGF0ZS0+Y3J0Yyk7Ci0JaWYgKCFjcnRjX3N0YXRlKQotCQlyZXR1cm4g
LUVJTlZBTDsKKwlpZiAoSVNfRVJSKGNydGNfc3RhdGUpKQorCQlyZXR1cm4gUFRSX0VSUihjcnRj
X3N0YXRlKTsKIAogCWlmIChjcnRjX3N0YXRlLT5tb2RlLmhkaXNwbGF5ICE9IHBhbmVsX21vZGUt
PmhkaXNwbGF5IHx8CiAJICAgIGNydGNfc3RhdGUtPm1vZGUudmRpc3BsYXkgIT0gcGFuZWxfbW9k
ZS0+dmRpc3BsYXkpCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBD
aHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
