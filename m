Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7596F39F9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 22:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4C06F7C6;
	Thu,  7 Nov 2019 21:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0256F7BB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 21:03:19 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id q140so1141639ywg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 13:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mNJ/WjFYqEZstYP6CYthaxZhr+6XTQ2uyC/5tjyC2n4=;
 b=tvZi9RwXj8fFs5LMZoP+dctOKRY9QNr80XGN7TU7MLbQiPHGwNgcujvXvrJ9mC+ROd
 YASs/pi9RMBWX8gx6cZmGhbCUYQrUvZzkkq07+g1CB68FpYREBN0xLdLK8GpHDhlJA8K
 x4OY/fVn6ShKvKlWbasyLHA3uscZAHmmvPc1iKuJE+UM70+TFBbLhQVNDKP9Haaf6SJ+
 sK/hfgbQhKj/dimMWSiEAYjOLa3a0UR0Nutl/PTKm07xDHpYb4vx7JJAx1sRTwgL6z26
 vGrRPWNbvyQLtorQnKI6BHffteAw2YGMeiF5WFc2wxquXn661wuWwcBE6as+sb0Jpbk+
 eS0Q==
X-Gm-Message-State: APjAAAU0ybyL96Dq0+nZ4q1iu0PwhRbjx0IPkItV/PcKvTkRaT+YyDB3
 jleLpSWquMQwYDGTwG+egWuvHfBpSIc=
X-Google-Smtp-Source: APXvYqwShZY+4+Lo97dZTbufPLZBtjuInUMnhygFPkagEQAwPvEPCeKWRONy7WjPbXeXAjSKaYQA4Q==
X-Received: by 2002:a0d:df92:: with SMTP id i140mr4271725ywe.512.1573160598024; 
 Thu, 07 Nov 2019 13:03:18 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id r14sm1064196ywl.97.2019.11.07.13.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 13:03:17 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm: trace: Introduce drm_trace() and instrument
 drm_atomic.c
Date: Thu,  7 Nov 2019 16:02:59 -0500
Message-Id: <20191107210316.143216-1-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mNJ/WjFYqEZstYP6CYthaxZhr+6XTQ2uyC/5tjyC2n4=;
 b=KBTNSqaIG3JrORXVGHRdUEorm0e5Bm5MHnQbDP3RHi5epEtkG07zB+IsUy7iMhAjJK
 V8W6Sp6XbTtFJdHgb2wElLaUxSG29avPcyYBd5jPE0WaRiHhk7utqdIsoefY9T6Q6+XR
 xWwRX4sOT7BMuh1r1XdYpdoMewwKlk57OJGAbwVbEOxc2cRpNFTCjvQvaAM65iyUZ+u3
 D43xH2Y1SMMRe2gwTad0rXlHZ+PzZVdTU7qerBYDIETi8dVAxXIpamuj11lVRpqjsUka
 yQPw2FmRhX8c8ZiwYhCgv+rQBXyeapY9ELo+TQvjSSSQ2MFCloVcSZqE81kXtPt1GNpo
 3kbA==
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
Cc: daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
 tzimmermann@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpIZXkgYWxsLApJJ20gYmFj
ayB3aXRoIGFub3RoZXIgdHJhY2UgZXZlbnRzIHBhdGNoc2V0LiBNeSBmaXJzdCBhdHRlbXB0IFsx
XSB3ZW50CmJldHRlciB0aGFuIGV4cGVjdGVkLCB3aXRoIGVudGh1c2lhc20gZm9yIHRoZSBpZGVh
IGFuZCBkaXN0YWluIGZvciB0aGUKaW1wbGVtZW50YXRpb24uCgpBcyBwcm9taXNlZCwgSSB3ZW50
IHRocm91Z2ggYW5kIGFkZGVkIHByb3BlciB0cmFjZSBldmVudHMuCgpCZWZvcmUgSSBnZXQgX3Rv
b18gZmFyLCBJIHdhbnRlZCB0byBwb3N0IHRoaXMgc2V0IHRvIGdldCBmZWVkYmFjayBvbiB0aGUK
ZGlyZWN0aW9uIEknbSBnb2luZy4gSSd2ZSBnb25lIGJhY2sgYW5kIGZvcnRoIG9uIHdoZXRoZXIg
dG8gaW50cm9kdWNlIGEKYnVuY2ggb2YgdHJhY2Ugc3lzdGVtcyB2cyB1c2luZyB0aGUgdHJhY2Ug
Y2xhc3MgZW51bS4gSSd2ZSBzZXR0bGVkIG9uCnRoZSB0cmFjZSBjbGFzcyBlbnVtIHNpbmNlIGl0
IHNlZW1zIG1vcmUgZXh0ZW5zaWJsZSBhbmQgZWFzaWVyIHRvIHVzZSBpbgpwcm9kdWN0aW9uIHRo
YXQganVzdCBoYXZpbmcgdGhlIGJsdW50ICJlbmFibGUgdGhpcyBzeXN0ZW0iLCBvcgp0aGUgdGVk
aW91cyAiZW5hYmxlIGVhY2ggZXZlbnQgSSdtIGludGVyZXN0ZWQgaW4gaW5kaXZpZHVhbGx5IiBt
ZXRob2RzLgoKU28sIGNvbnNpZGVyIHRoaXMgb25lIGFuIFJGQyB1bmxlc3Mgd2UncmUgYWxsIGlu
IGFncmVlbWVudCwgaW4gd2hpY2gKY2FzZSB3ZSBzaG91bGQgYXBwbHkgaXQgOikKClNlYW4KClsx
XS0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMzNTM1MC8KClNlYW4g
UGF1bCAoNik6CiAgZHJtOiB0cmFjZTogTWFrZSB0aGUgdmJsYW5rIHF1ZXVlZC9kZWxpdmVyZWQg
ZXZlbnRzIGNsYXNzZWQKICBkcm06IHRyYWNlOiBJbnRyb2R1Y2UgZHJtX3RyYWNlKCkgYW5kIHRy
YWNlIGV2ZW50IGNsYXNzZXMKICBkcm06IHRyYWNlOiBBZGQgdHJhY2UgZXZlbnRzIGZvciBhdG9t
aWMgc3RhdGUgbGlmZXRpbWUKICBkcm06IHRyYWNlOiBBZGQgY3J0YyBzdGF0ZSB0cmFjZSBldmVu
dHMKICBkcm06IHRyYWNlOiBBZGQgY29ubmVjdG9yIHN0YXRlIHRyYWNpbmcKICBkcm06IHRyYWNl
OiBBZGQgcGxhbmUgc3RhdGUgdHJhY2luZwoKIERvY3VtZW50YXRpb24vZ3B1L2RybS1pbnRlcm5h
bHMucnN0IHwgICA5ICsKIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMgICAgICAgIHwgIDYx
ICsrLQogZHJpdmVycy9ncHUvZHJtL2RybV90cmFjZS5oICAgICAgICAgfCA1NjMgKysrKysrKysr
KysrKysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyAgICAgICAg
fCAgIDggKy0KIDQgZmlsZXMgY2hhbmdlZCwgNjA5IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9u
cygtKQoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVt
IE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
