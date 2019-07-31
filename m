Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7547BA44
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BE86E61C;
	Wed, 31 Jul 2019 07:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E826D6E67E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 06:24:42 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t14so29990291plr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 23:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qPNDXgZPeD/yc67o95C8RuRDptaWT4TdPlrwZmzPvAk=;
 b=tGjhb8mpX52kTiylYKd6NXjHJIyn/eRgg6AW22+LKT7B2Ry3uUV+Q6Suyq1xd/phen
 fxb1yMyVHyJaISvQjKc/S2ZerOw6s0mVwCj54UGupvE3WlmX/qPwVvkpbmybgMW7iJdF
 E7siafM4xUu22JX393vrhxVB1wU6AIrWJU/5BgBH+oIv6gCrp6B0T/jsXlHxlFpoBWkk
 Y8oyHaZ+upoCmr3a+NeDhXe9oHXbVH0WZWbRQXr4wP3hoAuCNZSOFpK1w//LqPUGmcbP
 UsnoDKN3dT5OHgvMpcHNqimgjmQTcSJr6lkIRCWoSy1I8zAJdH0HiA5WudQnQhdnoNff
 O7rg==
X-Gm-Message-State: APjAAAUA8vQM/zNHYrRa4sUaPe2+ihJ1SIZ5UjloZn8KUncILmt+uN/e
 vCSoCDGAfZwCHaLUJtERf8/mSkK9DKc=
X-Google-Smtp-Source: APXvYqzDwdOaw51aou0XSnvwMPV94XYKJT1ktYDuiPl4gKkVyLYHDIMgCkcdcKASoo3qADpbxc7ZYA==
X-Received: by 2002:a17:902:7407:: with SMTP id
 g7mr120158084pll.214.1564554282501; 
 Tue, 30 Jul 2019 23:24:42 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id 11sm67552871pfw.33.2019.07.30.23.24.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 23:24:42 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH v2] drm: use trace_printk rather than printk in drm_dbg.
Date: Wed, 31 Jul 2019 14:24:16 +0800
Message-Id: <20190731062416.26238-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qPNDXgZPeD/yc67o95C8RuRDptaWT4TdPlrwZmzPvAk=;
 b=InbuIdvwP3Y4gywzK0Nf+ECkQVeMzVN3Sv0btkVQFK76yx4gxApm3XQaG3b8xnC+mv
 VdbRiNEOCdmiQVWEI+5/wQ+vJfgfJFc0QvctI70OhP8jETrKN/Dk/+Y5XCFavYlmmzzF
 obmNJY6nOr29lkInsWfdKDWYfrSidiyAXs2JlhdwJnuSRyvtHYT1g6ps7PD+UrFhZb4a
 w932/xzIvt4PQVaSYiDrm2/c8WWNT6/Z54mz/kPKTyQLi+TdLrFZf+KuSb5QCgIUutUW
 BkHryJsBJE4/si7kvVsyK409c/7VnlAi3AuSf84+Xi06x8HHhqkXubZ9eSTZvtjpYNoz
 3gyw==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Fuqian Huang <huangfq.daxian@gmail.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmMsCmFtZGdwdV9paF9wcm9j
ZXNzIGNhbGxzIERSTV9ERUJVRyB3aGljaCBjYWxscyBkcm1fZGJnIGFuZApmaW5hbGx5IGNhbGxz
IHByaW50ay4KQXMgYW1kZ3B1X2loX3Byb2Nlc3MgaXMgY2FsbGVkIGZyb20gYW4gaW50ZXJydXB0
IGhhbmRsZXIsCmFuZCBpbnRlcnJ1cHQgaGFuZGxlciBzaG91bGQgYmUgc2hvcnQgYXMgcG9zc2li
bGUuCgpBcyBwcmludGsgbWF5IGxlYWQgdG8gYm9nZ2luZyBkb3duIHRoZSBzeXN0ZW0gb3IgY2Fu
IGV2ZW4KY3JlYXRlIGEgbGl2ZSBsb2NrLiBwcmludGsgc2hvdWxkIG5vdCBiZSB1c2VkIGluIElS
USBjb250ZXh0LgpJbnN0ZWFkLCB0cmFjZV9wcmludGsgaXMgcmVjb21tZW5kZWQgaW4gSVJRIGNv
bnRleHQuCkxpbms6IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy8zNjU4MzUKClJldmlld2VkLWJ5
OiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPiAKU2lnbmVkLW9mZi1ieTogRnVxaWFuIEh1
YW5nIDxodWFuZ2ZxLmRheGlhbkBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgogIC0gT25s
eSBtYWtlIHRoZSBpbnRlcnJ1cHQgdXNlcyB0aGUgdHJhY2VfcHJpbnRrIHRvIGF2b2lkCiAgICBh
bGwgNDAwMCsgZHJtX2RiZy9EUk1fREVCVUcgdXNlcyBlbWl0dGluZyBhIHRyYWNlX3ByaW50ay4K
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMgfCAxMCArKysrKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fcHJpbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYwppbmRl
eCBhMTdjOGExNGRiYTQuLjc0NzgzNWQxNmZhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9wcmludC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYwpAQCAtMjM2LDkg
KzIzNiwxMyBAQCB2b2lkIGRybV9kYmcodW5zaWduZWQgaW50IGNhdGVnb3J5LCBjb25zdCBjaGFy
ICpmb3JtYXQsIC4uLikKIAl2YWYuZm10ID0gZm9ybWF0OwogCXZhZi52YSA9ICZhcmdzOwogCi0J
cHJpbnRrKEtFUk5fREVCVUcgIlsiIERSTV9OQU1FICI6JXBzXSAlcFYiLAotCSAgICAgICBfX2J1
aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCksICZ2YWYpOwotCisJaWYgKGluX2ludGVycnVwdCgpKSB7
CisJCXRyYWNlX3ByaW50ayhLRVJOX0RFQlVHICJbIiBEUk1fTkFNRSAiOiVwc10gJXBWIiwKKwkJ
ICAgICAgIF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSwgJnZhZik7CisJfSBlbHNlIHsKKwkJ
cHJpbnRrKEtFUk5fREVCVUcgIlsiIERSTV9OQU1FICI6JXBzXSAlcFYiLAorCQkgICAgICAgX19i
dWlsdGluX3JldHVybl9hZGRyZXNzKDApLCAmdmFmKTsKKwl9CiAJdmFfZW5kKGFyZ3MpOwogfQog
RVhQT1JUX1NZTUJPTChkcm1fZGJnKTsKLS0gCjIuMTEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
