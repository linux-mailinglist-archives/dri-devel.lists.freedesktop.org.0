Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF1F72EA1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE07E6E4D2;
	Wed, 24 Jul 2019 12:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03086E4AB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:25:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n9so46012692wru.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XtfVe2y0PV6JCnkWUgt29BFtDKrtsJ9asmKj1fX6iHM=;
 b=hIzHUuMReaLZDut6LF3R857fyEUWQGx+wp4VZEQJW2KM4ceRN4XWbB2HdxpVaC6sec
 rmXB+uW1TayLIY5QOpAq5gKg23/ioxMC3qOB4Avi1UpdXiNwAyWS/C1N13N5XPp4MvnH
 kZ1KxPSD8c2NY7BGAu7IrNAn1JOv88hHG4OpK+ROiNXhmGK7uufwck/UtEwXKCSwneYH
 0U54rr2hfDFn6sBvHhHQHZXmOkAvfvYIPeEBG3wnsOmXc85KTVXr1IvslgkxUots0vR+
 a8EunNMSPyNrvfUrTWZwFhaTss5pse1OZyepgkAwTqqGfUiHSeazlk3zNcgUb0Sv/DWT
 Wa0g==
X-Gm-Message-State: APjAAAUiX0tENKxTmRyc+F7MAeKy0hFfc3f6ZGSIHC/sEgXXfO5fS1p7
 VT6oRIZmVC3iVR/zGfDGD/c=
X-Google-Smtp-Source: APXvYqwpDOFg0SMrkMrSkLYjQMLQnQYz0BaTUXKeEAnLvEP5ghElBAxYipQ0U+HL2Q/1CRGgVkParw==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr47444184wrr.5.1563956712658;
 Wed, 24 Jul 2019 01:25:12 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 01:25:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 0/7] backlight: gpio: simplify the driver
Date: Wed, 24 Jul 2019 10:25:01 +0200
Message-Id: <20190724082508.27617-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XtfVe2y0PV6JCnkWUgt29BFtDKrtsJ9asmKj1fX6iHM=;
 b=yS/fpv0lDg7cmmGiJlJuxWZDC7FTLbDacrHOf0iRdHeUNwswrCSddeVLBE4fTzDSh7
 Crlc8kCfIK9TKMmhBMLM1skpv9wTY7ZUenyFTibdYFbmNnH8OgZrxnSyIr+LnOLjf5GK
 iXdZ3gpPL2+YgwVWFQdaV3jQ7WP+5WionDivvwBsxj0D6JBVtrl8nolAO6STna0u8qXS
 XWm2eCsu8ikm2EnIFJSbRkXkIiWr1WSUG+j8I839mzmKDW9ZrJZYzrKh9efeK2HUtUSR
 6e5GIkzyc17iGtczLzfFbKCqD8HeRDPzb6a8BUuQOYcjOq/wKTn9VuuyZnWMBhrnvetc
 +hpg==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCldo
aWxlIHdvcmtpbmcgb24gbXkgb3RoZXIgc2VyaWVzIHJlbGF0ZWQgdG8gZ3Bpby1iYWNrbGlnaHRb
MV0gSSBub3RpY2VkCnRoYXQgd2UgY291bGQgc2ltcGxpZnkgdGhlIGRyaXZlciBpZiB3ZSBtYWRl
IHRoZSBvbmx5IHVzZXIgb2YgcGxhdGZvcm0KZGF0YSB1c2UgR1BJTyBsb29rdXBzIGFuZCBkZXZp
Y2UgcHJvcGVydGllcy4gVGhpcyBzZXJpZXMgdHJpZXMgdG8gZG8KdGhhdC4KClRoZSBmaXJzdCBw
YXRjaCBhZGRzIGFsbCBuZWNlc3NhcnkgZGF0YSBzdHJ1Y3R1cmVzIHRvIGVjb3ZlYzI0LiBQYXRj
aAoyLzcgdW5pZmllcyBtdWNoIG9mIHRoZSBjb2RlIGZvciBib3RoIHBkYXRhIGFuZCBub24tcGRh
dGEgY2FzZXMuIFBhdGNoZXMKMy00LzcgcmVtb3ZlIHVudXNlZCBwbGF0Zm9ybSBkYXRhIGZpZWxk
cy4gTGFzdCB0aHJlZSBwYXRjaGVzIGNvbnRhaW4KYWRkaXRpb25hbCBpbXByb3ZlbWVudHMgZm9y
IHRoZSBHUElPIGJhY2tsaWdodCBkcml2ZXIgd2hpbGUgd2UncmUgYWxyZWFkeQptb2RpZnlpbmcg
aXQuCgpJIGRvbid0IGhhdmUgYWNjZXNzIHRvIHRoaXMgSFcgYnV0IGhvcGVmdWxseSB0aGlzIHdv
cmtzLiBPbmx5IGNvbXBpbGUKdGVzdGVkLgoKWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5
LzYvMjUvOTAwCgp2MSAtPiB2MjoKLSByZWJhc2VkIG9uIHRvcCBvZiB2NS4zLXJjMSBhbmQgYWRq
dXN0ZWQgdG8gdGhlIHJlY2VudCBjaGFuZ2VzIGZyb20gQW5keQotIGFkZGVkIGFkZGl0aW9uYWwg
dHdvIHBhdGNoZXMgd2l0aCBtaW5vciBpbXByb3ZlbWVudHMKCnYyIC0+IHYzOgotIGluIHBhdGNo
IDcvNzogdXNlZCBpbml0aWFsaXplcnMgdG8gc2V0IHZhbHVlcyBmb3IgcGRhdGEgYW5kIGRldiBs
b2NhbCB2YXJzCgpCYXJ0b3N6IEdvbGFzemV3c2tpICg3KToKICBzaDogZWNvdmVjMjQ6IGFkZCBh
ZGRpdGlvbmFsIHByb3BlcnRpZXMgdG8gdGhlIGJhY2tsaWdodCBkZXZpY2UKICBiYWNrbGlnaHQ6
IGdwaW86IHNpbXBsaWZ5IHRoZSBwbGF0Zm9ybSBkYXRhIGhhbmRsaW5nCiAgc2g6IGVjb3ZlYzI0
OiBkb24ndCBzZXQgdW51c2VkIGZpZWxkcyBpbiBwbGF0Zm9ybSBkYXRhCiAgYmFja2xpZ2h0OiBn
cGlvOiByZW1vdmUgdW51c2VkIGZpZWxkcyBmcm9tIHBsYXRmb3JtIGRhdGEKICBiYWNrbGlnaHQ6
IGdwaW86IHJlbW92ZSBkZXYgZnJvbSBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQKICBiYWNrbGlnaHQ6
IGdwaW86IHJlbW92ZSBkZWZfdmFsdWUgZnJvbSBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQKICBiYWNr
bGlnaHQ6IGdwaW86IHVzZSBhIGhlbHBlciB2YXJpYWJsZSBmb3IgJnBkZXYtPmRldgoKIGFyY2gv
c2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAuYyAgICAgICAgIHwgMzMgKysrKysrLS0KIGRy
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgICAgIHwgODIgKysrKystLS0t
LS0tLS0tLS0tLS0KIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncGlvX2JhY2tsaWdodC5o
IHwgIDMgLQogMyBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCA3NCBkZWxldGlvbnMo
LSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
