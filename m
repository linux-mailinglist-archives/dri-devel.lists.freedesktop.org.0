Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44AD5245A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D359889F4A;
	Tue, 25 Jun 2019 07:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AD089C29
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:48:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c66so13105370wmf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:references:reply-to
 :message-id:mime-version;
 bh=xaKJDnae1EFjh86fZ1Qltct9/8V3S9KXOq3PYZYvyHI=;
 b=Pkw1GCqeDSkKtl0FYw3D2ibEkGmqgSSby5nA/JjhAyglZMLBS+hjsP4bmm/o5fTT2G
 yFdMwFeEm0iUtCDJvc6aWPUq2nVgJY6u3u2o4uDLdKFdcJqNGTBbPbh/OaW1o0OGOlAY
 B/U/Mtgwv0BYTZctW8xueD8Ngfy6ghSOZgYRmeisUpp5xXC09ZGGtoQV9NReYqb32X11
 3AK5AAqOZcvUE9LqdSFKAvkmaaSgAgwHHSSYJN6KXrUUfssjcPJ9YTQyi7HRQSJGB7gn
 0jbxvMn8D04wvImdcWedvSxCATEfpwtHTQ6f3QppGfUIBVfqeC6c086jY3FH1jpOfQvA
 Lhew==
X-Gm-Message-State: APjAAAUoDlN+YVarHBaG2OpAb0ARWzWhqOoptU3U9DiXUw3GYYSlYGft
 cSPUQcdBtnxB7+8vnafZhJhM+g==
X-Google-Smtp-Source: APXvYqxMhHyWV9UpqhUB/TjiFBls09nQ4ITZssbVwFmGLt+2Qeug/pb+O9Tv3bAeSgwK1fKA3bQl0g==
X-Received: by 2002:a1c:21c6:: with SMTP id h189mr10837205wmh.79.1561387692414; 
 Mon, 24 Jun 2019 07:48:12 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v65sm18451669wme.31.2019.06.24.07.48.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 07:48:12 -0700 (PDT)
From: Julien Masson <jmasson@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/9] drm: meson: mask value when writing bits relaxed
Date: Mon, 24 Jun 2019 16:47:56 +0200
References: <86zhm782g5.fsf@baylibre.com>
Message-ID: <86y31r82fo.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:references:reply-to:message-id:mime-version;
 bh=xaKJDnae1EFjh86fZ1Qltct9/8V3S9KXOq3PYZYvyHI=;
 b=eNChcKNO7dQANYLf2uCgCftyZNvelvdSK9R+1wtb/lP9OqVCiyaG3OIdIrJvfY5CIT
 UY6txHTM80Vo8+OFktdSz6aeq0tQrXNrcH9S8vrofzKfN4JIMdEv0cjGK/tg1Xnf5J9r
 LGTDyFDGYPkJYSN3BL2uLc7MFCMZj8qFjO4wv/q1Z4WP5PJZaNPa1Quw7jUcK5mZwsCw
 bxOKPjYmtLYt6DMV9GRNb1VFVsyCrJseC+dwSBZLumuyrzMfUcaYhy/ugT8CsDxtM99h
 kr+/TsVx7bAyAIowCC2Iuo0mz79kTiaBTIQgYSf7LmCriUKVmfYEcTchX22VzgZR06tj
 3XcQ==
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
Reply-To: 86zhm782g5.fsf@baylibre.com
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHZhbHVlIHVzZWQgaW4gdGhlIG1hY3JvIHdyaXRlbF9iaXRzX3JlbGF4ZWQgaGFzIHRvIGJl
IG1hc2tlZCBzaW5jZQp3ZSBkb24ndCB3YW50IGNoYW5nZSB0aGUgYml0cyBvdXRzaWRlIHRoZSBt
YXNrLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIE1hc3NvbiA8am1hc3NvbkBiYXlsaWJyZS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3JlZ2lzdGVycy5oIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3JlZ2lzdGVycy5oIGIvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX3JlZ2lzdGVycy5oCmluZGV4IGNmYWY5MDUwMWJiMS4uYzdkZmJkNzQ1NGU1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcmVnaXN0ZXJzLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3JlZ2lzdGVycy5oCkBAIC0yMCw3ICsyMCw3
IEBACiAjZGVmaW5lIF9SRUcocmVnKQkoKHJlZykgPDwgMikKIAogI2RlZmluZSB3cml0ZWxfYml0
c19yZWxheGVkKG1hc2ssIHZhbCwgYWRkcikgXAotCXdyaXRlbF9yZWxheGVkKChyZWFkbF9yZWxh
eGVkKGFkZHIpICYgfihtYXNrKSkgfCAodmFsKSwgYWRkcikKKwl3cml0ZWxfcmVsYXhlZCgocmVh
ZGxfcmVsYXhlZChhZGRyKSAmIH4obWFzaykpIHwgKCh2YWwpICYgKG1hc2spKSwgYWRkcikKIAog
LyogdnBwMiAqLwogI2RlZmluZSBWUFAyX0RVTU1ZX0RBVEEgMHgxOTAwCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
