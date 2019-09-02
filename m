Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E1EA5D00
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2EB89A20;
	Mon,  2 Sep 2019 20:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C2B89104
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:34:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g207so10425348wmg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 05:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XtfVe2y0PV6JCnkWUgt29BFtDKrtsJ9asmKj1fX6iHM=;
 b=aS4/Nsf8sV4BXC69Q9mQOeKLcCzQV9wZBtac71C6mbhngGCZLnp7PyK1GToNTO7ckL
 DAzBa8AnOtUCuWo9//zhzygdvKTKt+tZ6eAk57dt+rIAwUfl5HHivbCKZBIJK+pN1Crg
 73eJq14U7/xnx8cE8OPjabIqfEk2H4XgTX5d7+rmOH3mnQBaa6Uk+qUP3ytECEetdXh+
 mMlmnsqbzWmAllIhXXlLu8dyf5G3t6X3Q9D6VTlxvUtUwz528bMWkae8I8HON1uwQqMP
 2ww+YRpY2e/yX3JTvsELIeuMXmBcl5U9lhU6Rb6vbhkWNEf6Xbla7UZbbeFDDhZh/5QL
 4DgQ==
X-Gm-Message-State: APjAAAWJzCv2w483fzc3LYdKYDnx/eyuGUpqlX+8SdCWdB/xRB8nIwwU
 4nq2IZlBqMxBeCdMDOo6fAa1VQ==
X-Google-Smtp-Source: APXvYqyrnPWYmmZIE808s52Grv7xJXO5wACPj/78PCA7WIfz+B6gplbNIrHaV5BnZvS7GkbDFMpz5A==
X-Received: by 2002:a1c:7513:: with SMTP id o19mr34854254wmc.126.1567427691708; 
 Mon, 02 Sep 2019 05:34:51 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 05:34:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RESEND PATCH v3 0/7] backlight: gpio: simplify the driver
Date: Mon,  2 Sep 2019 14:34:37 +0200
Message-Id: <20190902123444.19924-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XtfVe2y0PV6JCnkWUgt29BFtDKrtsJ9asmKj1fX6iHM=;
 b=pVkk4EQb8Rw026QE2F67s/FRBhwcF2RyAloU19aASKmT4dLQntoYwfHzxQIV3lDTlX
 J2UPXFD2FdccyDHwI9GOSoMmWyKK6AWhN6uJu6eBjE9aq51c03XadnQfVpnCbnNsk4Pq
 Re8CdR5aYt1pqNEFBLX7O4Moo6VmqLxp/bu0REWCEuoPLedggkakQpNbB+m2zXBae4hd
 flGcAQIcc9FgyB3wsG4o+RhkuyJHlpVoaM+swKs0Zjxs27c/6T6SnaQ5wHSIn9/9E9h8
 WdgXWvWlzbDhxolhuq+K5d4TvZYiuFKKCjxnIXK3nv/yQrvryc5SByyykXN9SPHDVF65
 mUIg==
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
