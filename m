Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDC43BE37
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 23:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D963089151;
	Mon, 10 Jun 2019 21:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518DE8914B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 21:18:23 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t7so1524353plr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 14:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bWLAT9NRUlrvBrwvfr/QvssLLaOWbMrJHilGpaJk6Vg=;
 b=UExacFOiIRo2eLRuHjNWAvNDKs++M7qWxrgQCb2S2EZSvAphq0FeMekutt80GdAoc6
 M9fRKZ1l5zP8zgf8FZtwbVjSGO1hvwDU0JN1XQVHCT9U6k2/VuyCkIbCk8M0C2xkMZEH
 /ehhfXKNXwhkyirXH2XjWcyqTmj7sSzyVEEWhncjICzJnX4TEQ9IW+kybzGUM7Ptp6bh
 QvXh0aOP731CLfd5jDJIhjChaJc7Z6B8lOkJbffu+NfCZ1yd3sHiLrgxi9AD1pzDyKvC
 Jfc/bR2kmvaFKIzkf6DjKZCTfZhD4X2qKzF0F4j4o4Vvfqmu0NM7gS2sAppvD+xw70rk
 TQcQ==
X-Gm-Message-State: APjAAAXepu7N62QD3scd4yEHSJa4BGu0ILfHYd/wfToflZoF0fZg8xJp
 +OgxSCcXrFb970EhSyRM6WIzrA==
X-Google-Smtp-Source: APXvYqwfPRIJrAHffgJVE/PjgxqqcuAjPPWZKIHoej5vh8l1LwNLGrzjub7p09dUcEeYhj9/su30qw==
X-Received: by 2002:a17:902:a716:: with SMTP id
 w22mr72043801plq.270.1560201502923; 
 Mon, 10 Jun 2019 14:18:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id y13sm14241062pfb.143.2019.06.10.14.18.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 14:18:22 -0700 (PDT)
From: davidriley@chromium.org
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v2 2/4] drm/virtio: Wake up all waiters when capset response
 comes in.
Date: Mon, 10 Jun 2019 14:18:08 -0700
Message-Id: <20190610211810.253227-3-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190605234423.11348-1-davidriley@chromium.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bWLAT9NRUlrvBrwvfr/QvssLLaOWbMrJHilGpaJk6Vg=;
 b=BTzCAwo8NHk+PHsfqTl2EKRbG/LlCt1ISxn+UsNbzk38J68Eg/Mk2VTGW55dB5oXjA
 XIhFJ4r7p/+0R5+GQoR+EfDPsQMC6lPpPTAx6o0dks7q+pOjNdAs5/Izn17m7TOcluBx
 hsV9CQJVZjpaUFYHgo07Z55lsL5rHeKj9BY5c=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
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
dmlydGlvX2dldF9lZGlkX2Jsb2NrKHZvaWQgKmRhdGEsIHU4ICpidWYsCi0tIAoyLjIyLjAucmMy
LjM4My5nZjRmYmJmMzBjMi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
