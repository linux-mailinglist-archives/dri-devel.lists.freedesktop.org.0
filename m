Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7675E65270
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496366E148;
	Thu, 11 Jul 2019 07:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CB089C13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 02:14:16 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 44so4694189qtg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 19:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NxUDKpndtdH37r02jtP/ZlIzOK2B9SJpZuT4uAg/0AU=;
 b=jymRo2j/WUMqO9x+bymtq3VnCP0h+rmuLRk6X6/nzlZly8tWcI5K/nT5N5DiD185U+
 6K0ODdY7O6efBfwyxq0ejTdw0KNfD9+aDZ6tIwA/fJqk4xtEuZHnLAMzLDksCUvedrQj
 lyKhvPfdnopOBMBx8UrcrYIn6gg+nDyWL9EXc9tCvPbc/2XpFyjMqg8Odos1hy+RcccB
 X4SxLCqJrA6ep8IEArl7iQuZtm1vf1c07NfRdAn7Unjr77gjH2MfN5DzTGgetOcZQfZl
 0FIq4fmC1KSGytiJ3RgrBDHtfcefx3pbL5DEpE9yaypouTS3lec2xu032mMqEqxmcnMX
 IsvQ==
X-Gm-Message-State: APjAAAWwbIaziFYOHkyCyAHM6zZaJ4NC9Kr17/70NwIxJShQSDowHg3i
 n813AV4neqClk23KACo516jM1puI
X-Google-Smtp-Source: APXvYqwcTL4Hz3BceOiBvx+YeI0TA01sIV9kq2hfQaUvYx0b2wfMacpnvDvFd4ZChJOeO+tfcRXTDA==
X-Received: by 2002:a0c:f78d:: with SMTP id s13mr842039qvn.156.1562811255491; 
 Wed, 10 Jul 2019 19:14:15 -0700 (PDT)
Received: from localhost.localdomain (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.gmail.com with ESMTPSA id f20sm1699187qkh.15.2019.07.10.19.14.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 19:14:14 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: [PATCH v1] drm/modes: Don't apply cmdline's rotation if it wasn't
 specified
Date: Thu, 11 Jul 2019 05:13:13 +0300
Message-Id: <20190711021313.29445-1-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 11 Jul 2019 07:23:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NxUDKpndtdH37r02jtP/ZlIzOK2B9SJpZuT4uAg/0AU=;
 b=hFV3Tm8hMjw81TGWqaIE/iJ+vYJ+ZRUmqg0O5TaWBdgjuwlk6M9QhZcQST2Xy6yng5
 PFmQad7oIAcfhCR4hKFyu1acp5IHAIvShwlUaKTx/AJ9fyl3EIvyJPLZjevZAU60+IpA
 6uCZLiNrLDo7+SJgEcp0Tz+469D9PTW2+svWg+z9Pq4hKY7lkSl9ARYm6WL6YGuVeYIv
 S/kXxX3OlTnqNjf/H2hemRFvGHJa+6N6PCkF4kM6Etkjr+/2Gn7SiYt7BYSXh9mXLV8D
 eUoyR1Bbzfdd5Qt4gJfbEWL5KNrwdSbTYE9AWGsOrtqbk/G0k88vZStlyOB8PT4zlXC6
 19Xw==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHJvdGF0aW9uIG1vZGUgZnJvbSBjbWRsaW5lIHNob3VsZG4ndCBiZSB0YWtlbiBpbnRvIGFj
Y291bnQgaWYgaXQKd2Fzbid0IHNwZWNpZmllZCBpbiB0aGUgY21kbGluZS4gVGhpcyBmaXhlcyBp
Z25vcmVkIGRlZmF1bHQgZGlzcGxheQpvcmllbnRhdGlvbiB3aGVuIGRpc3BsYXkgbW9kZSBpcyBn
aXZlbiB1c2luZyBjbWRsaW5lIHdpdGhvdXQgdGhlCnJvdGF0aW9uIGJlaW5nIHNwZWNpZmllZC4K
CkZpeGVzOiAxYmY0ZTA5MjI3YzMgKCJkcm0vbW9kZXM6IEFsbG93IHRvIHNwZWNpZnkgcm90YXRp
b24gYW5kIHJlZmxlY3Rpb24gb24gdGhlIGNvbW1hbmRsaW5lIikKU2lnbmVkLW9mZi1ieTogRG1p
dHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
Y2xpZW50X21vZGVzZXQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21v
ZGVzZXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwppbmRleCA1NmQz
Njc3OWQyMTMuLmM4OTIyYjdjYWMwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
bGllbnRfbW9kZXNldC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQu
YwpAQCAtODU5LDcgKzg1OSw3IEBAIGJvb2wgZHJtX2NsaWVudF9yb3RhdGlvbihzdHJ1Y3QgZHJt
X21vZGVfc2V0ICptb2Rlc2V0LCB1bnNpZ25lZCBpbnQgKnJvdGF0aW9uKQogCSAqIHNpbXBsZSBY
T1IgYmV0d2VlbiB0aGUgdHdvIGhhbmRsZSB0aGUgYWRkaXRpb24gbmljZWx5LgogCSAqLwogCWNt
ZGxpbmUgPSAmY29ubmVjdG9yLT5jbWRsaW5lX21vZGU7Ci0JaWYgKGNtZGxpbmUtPnNwZWNpZmll
ZCkgeworCWlmIChjbWRsaW5lLT5zcGVjaWZpZWQgJiYgY21kbGluZS0+cm90YXRpb25fcmVmbGVj
dGlvbikgewogCQl1bnNpZ25lZCBpbnQgY21kbGluZV9yZXN0LCBwYW5lbF9yZXN0OwogCQl1bnNp
Z25lZCBpbnQgY21kbGluZV9yb3QsIHBhbmVsX3JvdDsKIAkJdW5zaWduZWQgaW50IHN1bV9yb3Qs
IHN1bV9yZXN0OwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
