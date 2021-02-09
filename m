Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227C2314F56
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93156EB16;
	Tue,  9 Feb 2021 12:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29FA6EB09;
 Tue,  9 Feb 2021 12:44:45 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612874684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5ZcLme2Lp8VoN6Vx25D29o/w3vPmzWDf5AKB/+kO9ME=;
 b=sOsmuNnfJ121YNbp7s4fCzyJxQs/SocqUD9Q9ZhIZquBrSM7jcKcITzQlpdcmkEH1MmJ5M
 z6QT756YG8guhW0HF7VIe5v+8AapjDG1ozzB7vlZZ3pjbyjZg2k8+VtR/GWMCAiOduDc1s
 bEl8dKloP9bbv2NB97tWCBV4AtryYIJmCuP+LbfkA1sVB9l79zHHdrU+HFhtxftZ4k3Q56
 5eQA2zpe5EOPh0zkj4qPAw6M3mO09D2D5FMqAlhpfjAk9/9ku0fy7BYc4S52zlaS6F/5rx
 isn6r2WjwMZ4AJnMK5VggugDVhAAyAHx7HISlbGpZK0H7xnHzIyaN3eTldPX3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612874684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5ZcLme2Lp8VoN6Vx25D29o/w3vPmzWDf5AKB/+kO9ME=;
 b=ltIbD7hM3Nvgs6Dmo1UOUfeDKhYS7R6Pm3//sl9+yJpXUmYf2IQNz4aAY5NOsL4CSz3skC
 iPrEhuyc7hZdrdDQ==
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/amdgpu: Remove in_interrupt() usage.
Date: Tue,  9 Feb 2021 13:44:36 +0100
Message-Id: <20210209124439.408140-1-bigeasy@linutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9sa3MsCgppbiB0aGUgZGlzY3Vzc2lvbiBhYm91dCBwcmVlbXB0IGNvdW50IGNvbnNpc3RlbmN5
IGFjcm9zcyBrZXJuZWwKY29uZmlndXJhdGlvbnM6CgogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDIwMDkxNDIwNDIwOS4yNTYyNjYwOTNAbGludXRyb25peC5kZS8KCml0IHdhcyBjb25jbHVk
ZWQgdGhhdCB0aGUgdXNhZ2Ugb2YgaW5faW50ZXJydXB0KCkgYW5kIHJlbGF0ZWQgY29udGV4dApj
aGVja3Mgc2hvdWxkIGJlIHJlbW92ZWQgZnJvbSBub24tY29yZSBjb2RlLgoKSW4gdGhlIGxvbmcg
cnVuLCB1c2FnZSBvZiAncHJlZW1wdGlibGUsIGluXyppcnEgZXRjLicgc2hvdWxkIGJlIGJhbm5l
ZCBmcm9tCmRyaXZlciBjb2RlIGNvbXBsZXRlbHkuCgpUaGlzIHNlcmllcyBhZGRyZXNzZXMgcGFy
dHMgb2YgdGhlIGFtZGdwdSBkcml2ZXIuICBUaGVyZSBhcmUgc3RpbGwgY2FsbCBzaXRlcwpsZWZ0
IGluIGluIHRoZSBhbWRncHUgZHJpdmVyLgoKdjHigKZ2MjoKICAgLSBMaW1pdCB0byBhZG1ncHUg
b25seQogICAtIHVzZSAiYm9vbCIgaW5zdGVhZCBvZiAiYm9vbCA9PSB0cnVlIgoKU2ViYXN0aWFu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
