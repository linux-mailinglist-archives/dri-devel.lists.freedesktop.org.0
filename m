Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5097127F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321EA895B4;
	Tue, 23 Jul 2019 07:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9270489C37
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:03:17 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c2so36589274wrm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdufiTePFKOcw3PXCBBvJkARSPrI+OCusBaTYJELEjQ=;
 b=WUn9+y3ml2EprPouyAoEaJa9JGf7HAtkX9BUcc2aZeGOBwBsMkv/KV6lCAyrtiYgiO
 o4h0g25GG/esT7e7o2F6SPx9RJODokEINmN6218gZiyTqyojBN4SN6ZR3mIUjVtYvwFg
 q0yv+V+puwBhfGwlCTiqpgsz4OIAEDryycVyvt6/WQVbnKtl80yGUvlvvyuMOStPT05p
 RRBFuXdxLz1AMWbdIhc+uV65cLxODZm2wDT3wEuSlFpIQZEyAh9T6L1QxXaZw/MOUYXy
 gRvGl1n84TDiuZP4gx6/fuuUGiW4wJcruM4oKLOwby25Rj8viG3td4dz15h20EtDq/1s
 ggwg==
X-Gm-Message-State: APjAAAW/QTc63coQJ5Ou3rQFR1rrT9ZoLgmrGl+oqyrKayh0EGuyVuTU
 nb8R52bTiATV7Mp0SdOWEFc=
X-Google-Smtp-Source: APXvYqwoKpD/MpcmzIu1lOX2+THt1HzZrurirW2Y9G174HfbVtdYjcEwBdY78NR/Z3UWvwPmL5JvNA==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr60089734wrv.239.1563807795684; 
 Mon, 22 Jul 2019 08:03:15 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:03:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/7] backlight: gpio: simplify the driver
Date: Mon, 22 Jul 2019 17:02:55 +0200
Message-Id: <20190722150302.29526-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdufiTePFKOcw3PXCBBvJkARSPrI+OCusBaTYJELEjQ=;
 b=TsqapSCFfaQBoVbpHKI/m+obmflr41GlOM1rPFV007j2Zv7OerhmRuJG21pozO+P1A
 jTOHiU/zOVdxrV2v/bG8njldvSpnDW/pU1d6WXmgBNL+ZAnPJupgIR2OUZFCHmVY5JRO
 NC6gJyFpSSdFodmwdDchaBFsttM8pha0dZkeDgf/TnHgkD16mDRERvJpAH/bTYE0OjoE
 VlXyqbWGtjvdZfwHscynD/iZnEqcFwQZhNU5rNIDzLMje3EkV/XxY8ZMvwv/X28jazwS
 NBASzJ6jmaUrYhaiWMIHR1bEPDSX8z4JsW9XGg0EN2DqxVK3oKAYiXwjq+EHr1zxllVK
 pNCQ==
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
dHdvIHBhdGNoZXMgd2l0aCBtaW5vciBpbXByb3ZlbWVudHMKCkJhcnRvc3ogR29sYXN6ZXdza2kg
KDcpOgogIHNoOiBlY292ZWMyNDogYWRkIGFkZGl0aW9uYWwgcHJvcGVydGllcyB0byB0aGUgYmFj
a2xpZ2h0IGRldmljZQogIGJhY2tsaWdodDogZ3Bpbzogc2ltcGxpZnkgdGhlIHBsYXRmb3JtIGRh
dGEgaGFuZGxpbmcKICBzaDogZWNvdmVjMjQ6IGRvbid0IHNldCB1bnVzZWQgZmllbGRzIGluIHBs
YXRmb3JtIGRhdGEKICBiYWNrbGlnaHQ6IGdwaW86IHJlbW92ZSB1bnVzZWQgZmllbGRzIGZyb20g
cGxhdGZvcm0gZGF0YQogIGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIGRldiBmcm9tIHN0cnVjdCBn
cGlvX2JhY2tsaWdodAogIGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIGRlZl92YWx1ZSBmcm9tIHN0
cnVjdCBncGlvX2JhY2tsaWdodAogIGJhY2tsaWdodDogZ3BpbzogdXNlIGEgaGVscGVyIHZhcmlh
YmxlIGZvciAmcGRldi0+ZGV2CgogYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5j
ICAgICAgICAgfCAzMyArKysrKystLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNr
bGlnaHQuYyAgICAgfCA4NyArKysrKystLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9saW51eC9wbGF0
Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmggfCAgMyAtCiAzIGZpbGVzIGNoYW5nZWQsIDQ4IGlu
c2VydGlvbnMoKyksIDc1IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
