Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB5084F2C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A52F6E710;
	Wed,  7 Aug 2019 14:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A506E710
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:52:55 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id j6so2218021ybm.7
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 07:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IGBRcGCkPaOEMUIey73vE+VlHNwMkGU/1H+FhTWmPFc=;
 b=HwcgiowSjHeKw6sf5MVidAnOosUry34Xuq3Dx2s1j3yRHpCviSiBVXuQblr/Xa1VcC
 SinXVGvBdq1wMgnZTn6oCdry0EW0fHaWg5OQXGOMwl8u63bRZfypdXfuN9tgBudMOXAe
 99oGLF2X5jzDsC5cPPd6ADQduj6RjDWTncX+uoC4HH/A2T+3BxV1bxctuf1HmIR+ZSA+
 65TQGbPNzzLPL8vQvmnLHryJEZ52A12NwiVDzlV0NYDV2BWcSwpe1jWjV6ZI7egrcUh2
 UFggMFUeDj+xg+dc17tMr+ICd2hAprl+KI7zZVdlVpNDfuK+yF+OvGRpPHcZaxOmBfZv
 K7Mg==
X-Gm-Message-State: APjAAAWObGmZHN/s6Wl5EeytjN6UFlbrGHgq0deOmOCgfozm85OQARkY
 Y1rOY/555C2gOZduKvyUY2nfultM904=
X-Google-Smtp-Source: APXvYqw2tBEHDGkGWOzfIQb/w2u1uErPf1egkIWP8Zk0xe2Kqf3yB4ykOECXcF/BBAoyOI/6+WG4GA==
X-Received: by 2002:a25:e055:: with SMTP id x82mr6764383ybg.8.1565189574858;
 Wed, 07 Aug 2019 07:52:54 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id c123sm712935ywf.25.2019.08.07.07.52.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:52:54 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, robh@kernel.org, emil.velikov@collabora.com
Subject: [PATCH 0/2] drm/panfrost: Revert drm_gem_map_offset changes
Date: Wed,  7 Aug 2019 10:52:46 -0400
Message-Id: <20190807145253.2037-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IGBRcGCkPaOEMUIey73vE+VlHNwMkGU/1H+FhTWmPFc=;
 b=Qo9zJ3vY8NEp+STHnLRanwF9S0udvoeB5O3H+bmu142FBjd7/wZRmxVo5UP46yY8fj
 M/eleVXif0rwH+d40CuCEd34tvP2++XmjdB2IrRn0vi6rGbSB76goGLcilcFJamHZKqi
 oQTtGNpWwA0tth1KBKS7jmOVXY2fB9/6KbnxTx9x/cVHrotO2fE81r0+gSkgkY+m1pPX
 krVa93QMZG0kS84PSzPJ2yer99YWiSCgsX6FZBDmUymy6Zoal8sfb76+C+79ogo2NFcg
 RT8Zy5XCGJumOMqsYkmahGJRz1A2Fwpk0Mb6dDdqDog3+bKcymIJdqB4j7uKWOVlHQPa
 V78A==
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpXaGVuIEkgc3RhcnRlZCBy
ZS1hcHBseWluZyB0aGVzZSBJIHJlYWxpemVkIHRoZXkgaGFkbid0IGhpdCB0aGUgbGlzdC4KClNl
YW4KClJvYiBIZXJyaW5nICgyKToKICBSZXZlcnQgImRybS9nZW06IFJlbmFtZSBkcm1fZ2VtX2R1
bWJfbWFwX29mZnNldCgpIHRvCiAgICBkcm1fZ2VtX21hcF9vZmZzZXQoKSIKICBSZXZlcnQgImRy
bS9wYW5mcm9zdDogVXNlIGRybV9nZW1fbWFwX29mZnNldCgpIgoKIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZHVtYl9idWZmZXJzLmMgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
LmMgICAgICAgICAgICAgICB8IDEwICsrKy0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9nZW0uYyB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2Rydi5jIHwgMTYgKysrKysrKysrKysrKystLQogaW5jbHVkZS9kcm0vZHJtX2dlbS5oICAg
ICAgICAgICAgICAgICAgIHwgIDQgKystLQogNSBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25z
KCspLCAxNCBkZWxldGlvbnMoLSkKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBH
b29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
