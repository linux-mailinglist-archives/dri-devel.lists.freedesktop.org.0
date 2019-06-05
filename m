Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039C536843
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 01:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD56895CA;
	Wed,  5 Jun 2019 23:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7374896AF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 23:44:30 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n2so201889pgp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 16:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JGZHkET7ircbdI4+qsEOTZZ3N7wqYFaIsKw134Y8zSg=;
 b=anHX7RvnUh3ia7CiciaE3SsuLYSuJRIUGXsIL5eXUzpKvkPpC1PYLozpO9wXEt5VHa
 LIxKMNmrwpo6zmNwc2DWepfksAFUMt8HuYvmPUnp54r/Pmt620ESf5AOSuuuGaCA3oYj
 Llsa6oh5dVnsgeSeE5N8HfOVDrkiern+uYIS4jhEQSZCeHYHysLNvYwmzbmXrNparPvz
 mpMroBumBnc9y943yQ+vXircSxyryqBGCh7zJSjqbYphPXdSBy88YukansIscbHYTGaA
 WNQbT83UNIZWLBeq3mG0I9LzJ1mQGGjwquf/s2iSvM5ZZo6cH5o9RG9Bg18GZ5eRfXD2
 RkFQ==
X-Gm-Message-State: APjAAAXORyzx2XZFGw82oA6LSmxeRY+a7oVPTTxNhzAEG+Y1Cu/4G9nj
 AcKJXchW5uKgjyOQ7GB8OJUNyKVEx84=
X-Google-Smtp-Source: APXvYqxFOCt0W56XzBova1UQmMRH+3FDeIu1QrMrvbTscJCf2fyKPmERQgzHuiUrdAh9B1tYQgUDGQ==
X-Received: by 2002:a63:5443:: with SMTP id e3mr408680pgm.265.1559778270052;
 Wed, 05 Jun 2019 16:44:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id ce3sm104736pjb.11.2019.06.05.16.44.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 16:44:29 -0700 (PDT)
From: davidriley@chromium.org
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH 2/4] drm/virtio: Wake up all waiters when capset response
 comes in.
Date: Wed,  5 Jun 2019 16:44:21 -0700
Message-Id: <20190605234423.11348-2-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190605234423.11348-1-davidriley@chromium.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JGZHkET7ircbdI4+qsEOTZZ3N7wqYFaIsKw134Y8zSg=;
 b=D/budo1PK18/IqefI0C+NDDtMB6Kq021s90lMxfG8mkD3QwgRZ3SpWJjeoeyjcMAjq
 qj7bZAPDW4RBkBNoGzwBg/d+5lm1QxrxIQBdze1XX4ZXAiZUxfn1h2CyqZwPUeYH+nd8
 XXZeeT5ys/4udAedP7+XQAEsiArU4JVoXlzOc=
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
Cc: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgUmlsZXkgPGRhdmlkcmlsZXlAY2hyb21pdW0ub3JnPgoKSWYgbXVsdGlwbGUg
Y2FsbGVycyBvY2N1ciBzaW11bHRhbmVvdXNseSwgd2FrZSB0aGVtIGFsbCB1cC4KClNpZ25lZC1v
ZmYtYnk6IERhdmlkIFJpbGV5IDxkYXZpZHJpbGV5QGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV92cS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMK
aW5kZXggZTYyZmUyNGIxYTJlLi5kYTcxNTY4YWRiOWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV92cS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV92cS5jCkBAIC01ODgsNyArNTg4LDcgQEAgc3RhdGljIHZvaWQgdmlydGlvX2dwdV9jbWRf
Y2Fwc2V0X2NiKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCiAJCX0KIAl9CiAJc3Bp
bl91bmxvY2soJnZnZGV2LT5kaXNwbGF5X2luZm9fbG9jayk7Ci0Jd2FrZV91cCgmdmdkZXYtPnJl
c3Bfd3EpOworCXdha2VfdXBfYWxsKCZ2Z2Rldi0+cmVzcF93cSk7CiB9CiAKIHN0YXRpYyBpbnQg
dmlydGlvX2dldF9lZGlkX2Jsb2NrKHZvaWQgKmRhdGEsIHU4ICpidWYsCi0tIAoyLjIyLjAucmMx
LjMxMS5nNWQ3NTczYTE1MS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
