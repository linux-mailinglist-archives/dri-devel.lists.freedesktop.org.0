Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44C0CDC0B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8D56E461;
	Mon,  7 Oct 2019 07:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63296E44D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 03:32:03 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id e1so7331827pgj.6
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2019 20:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m6ZVj+HV49loAv95ReQOh5GSunOnE35wX2Bc+0q93oo=;
 b=OIiCRy4yyPODH8ZrdIZZ0PK1PzhsksmGrnPSYQyHU3ov2PR3F4kofr1k15chqCxqIT
 bffFLnsn3UDCDMTgNvPCaL9uZi0rCqLVqsaQ1cnpbSywE4zNQC5p7n484EYcxmGtNETS
 bo7s3CiFYRoPVDACzWco27ZxZjDk2DCD2qcMUUUOfh0twmhUvL/uDuAYEEdjMqCMq6Xq
 Czi+mdV9D9X5/iRUIK9Hf36KMaruD0/NFkBon1l4MOnTiq3VpOFCzVKMdPJG3qqM4Yg/
 NjmAaOIEDnh63xJC6IktEG/QK5E3OPGrW9TSIJoDszkBbm1yvVa5fWJl5IQp/v0MBgU0
 W+SQ==
X-Gm-Message-State: APjAAAW5AghsEXVlMRmX8jzre2mvR4+BhOkeJmSKcL3CMSwvu8pVlWEh
 0y0L18ByKKbRK9qoCVosO27hUQ==
X-Google-Smtp-Source: APXvYqzOOwyanRyMiJGsVbmq0P686Fa+QDrzb4QYm1IDHlrNgzTjC4nRJtm6F85fOzT8iD4OWtQP0g==
X-Received: by 2002:a17:90a:3387:: with SMTP id
 n7mr29905561pjb.26.1570419123161; 
 Sun, 06 Oct 2019 20:32:03 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net.
 [96.95.220.76])
 by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 20:32:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v5 0/7] backlight: gpio: simplify the driver
Date: Mon,  7 Oct 2019 05:31:53 +0200
Message-Id: <20191007033200.13443-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m6ZVj+HV49loAv95ReQOh5GSunOnE35wX2Bc+0q93oo=;
 b=KpBM+zmvrOzbdWsfbpdXfUOh/HlwxVlM6JtPhdxdQrGG/iNat1s44Xk1dIe5G0yytN
 g4uFYUJgcL/7ZzJwYBoBSxbzLFp1yUnec+Kny7Hh9U0uLRzHbCgQ1JisnLiswN2gc5KV
 uWItlqydSYWsSq6Bfpsfzu9YC5jWFxlOelQ4GueEHJkh+czXgYhKgiYvDM0mMVsRgkXu
 9rm2kFk2xxohwng1/1LGytYCrVv7SpCWybwGabJEkzbE2+w5xiJQCpuU5Qy5ywjhif9l
 aAYdY0MmHol877lte5vNPlPFhXptGVMnqp1pXpQ37tF8TGcxxvOs7VAB08YCFBw63bvU
 jpmw==
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
b2NhbCB2YXJzCgp2MyAtPiB2NDoKLSByZWJhc2VkIG9uIHRvcCBvZiB2NS40LXJjMQotIHJlbW92
ZWQgY2hhbmdlcyB0aGF0IGFyZSBubyBsb25nZXIgcmVsZXZhbnQgYWZ0ZXIgY29tbWl0IGVjNjY1
Yjc1NmU2ZgogICgiYmFja2xpZ2h0OiBncGlvLWJhY2tsaWdodDogQ29ycmVjdCBpbml0aWFsIHBv
d2VyIHN0YXRlIGhhbmRsaW5nIikKLSBhZGRlZCBwYXRjaCA3LzcKCnY0IC0+VjU6Ci0gaW4gcGF0
Y2ggNy83OiBhZGRlZCBhIGNvbW1lbnQgcmVwbGFjaW5nIHRoZSBuYW1lIG9mIHRoZSBmdW5jdGlv
biBiZWluZwogIHB1bGxlZCBpbnRvIHByb2JlKCkKCkJhcnRvc3ogR29sYXN6ZXdza2kgKDcpOgog
IGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIHVubmVlZGVkIGluY2x1ZGUKICBzaDogZWNvdmVjMjQ6
IGFkZCBhZGRpdGlvbmFsIHByb3BlcnRpZXMgdG8gdGhlIGJhY2tsaWdodCBkZXZpY2UKICBiYWNr
bGlnaHQ6IGdwaW86IHNpbXBsaWZ5IHRoZSBwbGF0Zm9ybSBkYXRhIGhhbmRsaW5nCiAgc2g6IGVj
b3ZlYzI0OiBkb24ndCBzZXQgdW51c2VkIGZpZWxkcyBpbiBwbGF0Zm9ybSBkYXRhCiAgYmFja2xp
Z2h0OiBncGlvOiByZW1vdmUgdW51c2VkIGZpZWxkcyBmcm9tIHBsYXRmb3JtIGRhdGEKICBiYWNr
bGlnaHQ6IGdwaW86IHVzZSBhIGhlbHBlciB2YXJpYWJsZSBmb3IgJnBkZXYtPmRldgogIGJhY2ts
aWdodDogZ3BpbzogcHVsbCBncGlvX2JhY2tsaWdodF9pbml0aWFsX3Bvd2VyX3N0YXRlKCkgaW50
byBwcm9iZQoKIGFyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAuYyAgICAgICAgIHwg
IDMzICsrKystLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyAgICAg
fCAxMDggKysrKystLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dw
aW9fYmFja2xpZ2h0LmggfCAgIDMgLQogMyBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCsp
LCA5MSBkZWxldGlvbnMoLSkKCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
