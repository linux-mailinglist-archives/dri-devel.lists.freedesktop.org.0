Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D66C4448
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 01:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6276E8BF;
	Tue,  1 Oct 2019 23:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F196E8BF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 23:29:29 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id a24so10823845pgj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 16:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EcVg9u8V8Uf/idldytEF3NgOMyW0OU8oijTXHZJkyVg=;
 b=TOYI4pUr+ispKOGhtZZnAagsHKnPVmV5MF+u1Dtd1GqWNEt1g/GXMLbSXUvVRCSsry
 ZNcrRy6W91nHnWz5JdVq5b89KLAMuWN7/azNApn8QBwZ4Gfn1cTPCxQc5RsaaUuqE+hC
 d6q0LSUlxzS7lCva35eSr5mbMLSIS5gAUX6u/rAcYg1g3Ny+G2FO+DHcpkwe7bYmdfNI
 /54FBLa8QCOpIoPmYHmaOgERlp7rxwStMf8kBVbLI/zHrLAMssITqrBk2p5BFxR/aJDz
 9AG6s3A95y/gmziAAT1knQX9uWOJVs6TmnPxwVrUR3lXLn8YWK/pnl6Py6Adc1Rj1VkX
 fCtQ==
X-Gm-Message-State: APjAAAX7WVsAMCXGgBg85W+vZJlSZ+px5rR0+VcZSLKjOs7TBLl/zQfc
 8+sG0mK1IP2UfHpRQl8dLnox5Q==
X-Google-Smtp-Source: APXvYqyttY662qaZ9at4NRsqD7ukXbj1wr2h7SXDVAWfKw7gZzdYntUGCR2evMFpv1BqiZxzO5THcw==
X-Received: by 2002:a62:fc46:: with SMTP id e67mr1005912pfh.153.1569972568837; 
 Tue, 01 Oct 2019 16:29:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id c8sm20990266pga.42.2019.10.01.16.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2019 16:29:28 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] backlight: pwm_bl: Don't assign levels table repeatedly
Date: Tue,  1 Oct 2019 16:29:24 -0700
Message-Id: <20191001162835.1.I4f2ede1f55ddd1c72b0303b7fd7f73a782fa33e5@changeid>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EcVg9u8V8Uf/idldytEF3NgOMyW0OU8oijTXHZJkyVg=;
 b=LoLWuA/zt6wQo9niY6rS50WlST0jKh8TXiLphIX/HwUpy05ohub5qr5fmX/ajPIl38
 XXY9DeDYzLb3r6VQgb82GF+lkIrTF0YatAYRiWTOyE0EbZ19L9ZzOE4ZksI8EWzk99qF
 HppXuMICfou5mYFPWkwYg/UF2L+14P67qumf0=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cHdtX2JhY2tsaWdodF9wcm9iZSgpIHJlLWFzc2lnbnMgcGItPmxldmVscyBmb3IgZXZlcnkgYnJp
Z2h0bmVzcwpsZXZlbC4gVGhpcyBpcyBub3QgbmVlZGVkIGFuZCB3YXMgbGlrZWx5IG5vdCBpbnRl
bmRlZCwgc2luY2UKbmVpdGhlciBzaWRlIG9mIHRoZSBhc3NpZ25tZW50IGNoYW5nZXMgZHVyaW5n
IHRoZSBsb29wLiBBc3NpZ24KdGhlIGZpZWxkIG9ubHkgb25jZS4KClNpZ25lZC1vZmYtYnk6IE1h
dHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgotLS0KCiBkcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9wd21fYmwuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9w
d21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCmluZGV4IDc0NmVlYmM0
MTFkZi4uOTU5NDM2YjllOTJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9w
d21fYmwuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwpAQCAtNTY0LDYg
KzU2NCw4IEBAIHN0YXRpYyBpbnQgcHdtX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCW1lbXNldCgmcHJvcHMsIDAsIHNpemVvZihzdHJ1Y3QgYmFja2xpZ2h0
X3Byb3BlcnRpZXMpKTsKIAogCWlmIChkYXRhLT5sZXZlbHMpIHsKKwkJcGItPmxldmVscyA9IGRh
dGEtPmxldmVsczsKKwogCQkvKgogCQkgKiBGb3IgdGhlIERUIGNhc2UsIG9ubHkgd2hlbiBicmln
aHRuZXNzIGxldmVscyBpcyBkZWZpbmVkCiAJCSAqIGRhdGEtPmxldmVscyBpcyBmaWxsZWQuIEZv
ciB0aGUgbm9uLURUIGNhc2UsIGRhdGEtPmxldmVscwpAQCAtNTcyLDggKzU3NCw2IEBAIHN0YXRp
YyBpbnQgcHdtX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CQlmb3IgKGkgPSAwOyBpIDw9IGRhdGEtPm1heF9icmlnaHRuZXNzOyBpKyspIHsKIAkJCWlmIChk
YXRhLT5sZXZlbHNbaV0gPiBwYi0+c2NhbGUpCiAJCQkJcGItPnNjYWxlID0gZGF0YS0+bGV2ZWxz
W2ldOwotCi0JCQlwYi0+bGV2ZWxzID0gZGF0YS0+bGV2ZWxzOwogCQl9CiAKIAkJaWYgKHB3bV9i
YWNrbGlnaHRfaXNfbGluZWFyKGRhdGEpKQotLSAKMi4yMy4wLjQ0NC5nMThlZWI1YTI2NS1nb29n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
