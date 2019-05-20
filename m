Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 702462660D
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF6F89BA9;
	Wed, 22 May 2019 14:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AE0892A0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:58:53 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id f97so6474882plb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 02:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+fjtvBI18+4dOm0uYdGwPyts2yAmhCRRn5DGw8hysxY=;
 b=c0bzsChglZ+9vb1QMHwD8QeNWBw/dGei5uqWvEmWbOcsinwtpaiyYnW2/m+6ur5mOD
 UC+WLD+pJoJddTAwLExDgPuZo2Hj94EwkcUpam0K1ti8krNK1gektGazhfvVpB1QgaQk
 LCnZFZ3xbMZmvICQ4Ei9Re3jY3c+XmPH3l0DDMrZs4YWZbZyjcxy1f1PT+nYjMH+u9n8
 maWhlwp7NVpV2tse+QuXNLQFNP+wKn+YFJgMGGfEG406pM+JR5Y2TXx7u3FQOBEPs/Ei
 CDX3SqQjTuthrdd3KIdVBqEn8yT7qYX7UK35LMbpZ0Ngy+0G/rcbJkcBpKHsrFmM5Vqz
 gJdQ==
X-Gm-Message-State: APjAAAVGZBrfHLn4F8flDsicoStteBIr0mEw4Tr0N0KaCP5oM+Q+BuqR
 QK9sJ5DuNVQhvSUyiheszqw=
X-Google-Smtp-Source: APXvYqy7fU+iLxVDEbeDCOO1oSk707NS1Ej98E8zi7p3r9tceXsN3JCf0fIzWH/wPdSZspfZX5UMXQ==
X-Received: by 2002:a17:902:243:: with SMTP id
 61mr30834953plc.132.1558346332842; 
 Mon, 20 May 2019 02:58:52 -0700 (PDT)
Received: from localhost.localdomain (112.237.225.49.dyn.cust.vf.net.nz.
 [49.225.237.112])
 by smtp.gmail.com with ESMTPSA id o7sm25129376pfp.168.2019.05.20.02.58.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 02:58:52 -0700 (PDT)
From: Murray McAllister <murray.mcallister@gmail.com>
To: 
Subject: [PATCH] drm/vmwgfx: integer underflow in vmw_cmd_dx_set_shader()
 leading to an invalid read
Date: Mon, 20 May 2019 21:57:34 +1200
Message-Id: <20190520095734.4655-1-murray.mcallister@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+fjtvBI18+4dOm0uYdGwPyts2yAmhCRRn5DGw8hysxY=;
 b=KUn1g5/T7/kkbkiWBQl45OWxshQehWVf1/UP9bgWFIfx9chCmsx6fpjCJaoEzKBo1a
 otJJsSeR/66OGpQdHq0U4tSLrCZ7lvim/usSC67EgaavaxXFCPxSrC+yZvHVK0Bhn7HX
 PTkga2R/vMEJgUP8LDZst+RSCzXwxAtMgNEuv0fpbqQQnONeSeYKi2MIoVDVB+GE9WbE
 IT5Ua3LPBc3IgbQidvWKTlxqeKkABXxE20AbQlTGAbvG7xXx+iJXX2W2igMBVmeNU574
 2aY64x0kCJGofeBSsN8VLt7zCSBcR7azS0Bt/Ag8JuJkm7y4DIbtoKThbVX8F3bF+oB8
 ZdFw==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 murray.mcallister@gmail.com,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgU1ZHQV8zRF9DTURfRFhfU0VUX1NIQURFUiBpcyBjYWxsZWQgd2l0aCBhIHNoYWRlciBJRApv
ZiBTVkdBM0RfSU5WQUxJRF9JRCwgYW5kIGEgc2hhZGVyIHR5cGUgb2YKU1ZHQTNEX1NIQURFUlRZ
UEVfSU5WQUxJRCwgdGhlIGNhbGN1bGF0ZWQgYmluZGluZy5zaGFkZXJfc2xvdAp3aWxsIGJlIDQy
OTQ5NjcyOTUsIGxlYWRpbmcgdG8gYW4gb3V0LW9mLWJvdW5kcyByZWFkIGluIHZtd19iaW5kaW5n
X2xvYygpCndoZW4gdGhlIG9mZnNldCBpcyBjYWxjdWxhdGVkLgoKU2lnbmVkLW9mZi1ieTogTXVy
cmF5IE1jQWxsaXN0ZXIgPG11cnJheS5tY2FsbGlzdGVyQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9leGVjYnVmLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2V4ZWNidWYuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2V4ZWNidWYuYwppbmRleCAyZmY3YmEwNGQ4YzguLjlhZWI1NDQ4Y2ZjMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2V4ZWNidWYuYwpAQCAtMjE5Myw3ICsyMTkzLDggQEAgc3Rh
dGljIGludCB2bXdfY21kX2R4X3NldF9zaGFkZXIoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJp
diwKIAogCWNtZCA9IGNvbnRhaW5lcl9vZihoZWFkZXIsIHR5cGVvZigqY21kKSwgaGVhZGVyKTsK
IAotCWlmIChjbWQtPmJvZHkudHlwZSA+PSBTVkdBM0RfU0hBREVSVFlQRV9EWDEwX01BWCkgewor
CWlmIChjbWQtPmJvZHkudHlwZSA+PSBTVkdBM0RfU0hBREVSVFlQRV9EWDEwX01BWCB8fAorCSAg
ICBjbWQtPmJvZHkudHlwZSA8IFNWR0EzRF9TSEFERVJUWVBFX01JTikgewogCQlWTVdfREVCVUdf
VVNFUigiSWxsZWdhbCBzaGFkZXIgdHlwZSAldS5cbiIsCiAJCQkgICAgICAgKHVuc2lnbmVkIGlu
dCkgY21kLT5ib2R5LnR5cGUpOwogCQlyZXR1cm4gLUVJTlZBTDsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
