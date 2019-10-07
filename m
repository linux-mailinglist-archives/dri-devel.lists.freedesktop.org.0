Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76545CDC0A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F096E457;
	Mon,  7 Oct 2019 07:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FB26E44D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 03:31:06 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c3so4720499plo.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2019 20:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m6ZVj+HV49loAv95ReQOh5GSunOnE35wX2Bc+0q93oo=;
 b=K+ixpmBsWWmEpRlhNusODKEqTIIvmCxDpLQCRMVkIqkZDJKMUuQg1HKhTmjOpQWI9m
 ht3H71/EacTA/O+Bk3Gr0tiiMatwbbwxx3WSg5fmZiu8ksaLCkJu+2KfGk7icEJf128q
 Wzqt4NoONL0ZJhPU0dluG2F+tQkEYFBkDf174KzYu5C8iOd6MNNI4iibntzWGJ4pby1W
 FIoEKCxNiQjv4U6YXzWAJHWpH1vIZIZMKTY8dcikLVVySFPoaygbqeuubfynf5g5RRpo
 4apq3OAKTDmGVucg+i5Ff+O71ko/vTTxygYcyIATKLaxrstuyXAQp791lIsPO68GPtC/
 qLUg==
X-Gm-Message-State: APjAAAX2UaPMGewZ2GNh8ywC0Ilz3Z5XXl5EyUoIcsic7agAzxnhdDQj
 r9/Eupdm3Hf4h6cYcj6dALgeew==
X-Google-Smtp-Source: APXvYqyK0cGcQPhMCq/YDWqIcKNCnGXD/gye49/b2NpR1/JcBFAoohrPihSNRV8mJk6K6mrH0RrbQw==
X-Received: by 2002:a17:902:8b83:: with SMTP id
 ay3mr25944522plb.143.1570419066195; 
 Sun, 06 Oct 2019 20:31:06 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net.
 [96.95.220.76])
 by smtp.gmail.com with ESMTPSA id r28sm15025580pfg.62.2019.10.06.20.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 20:31:05 -0700 (PDT)
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
Date: Mon,  7 Oct 2019 05:30:54 +0200
Message-Id: <20191007033101.13343-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m6ZVj+HV49loAv95ReQOh5GSunOnE35wX2Bc+0q93oo=;
 b=YFfCnyCDD3PB6NmfHCvMPu4D33I3gel2/ZiQH7/oNm+0P6Vb31d0cOZtFqmxJe7s4b
 NDIz0EAz6COcMXSH0q8CbgvDr7hWY8KEICppEuUvMOd5PQ2oL7sKJ6qi8Wm2whbWIal6
 KNTtNHDBwyZFpSluNwVRAezxYHNw04FE8jrlENf7RwOcNhPKafLezLW2cNwzT8CzXMby
 2/TgEjatxwc0FrXbCP0SrG9oTuFqYcWEXgRJlOeQIqImOHIdLYqAcpoA+HSJlAnaXeke
 zyB39m8imjKnTWIAO+rY+2oTqtAlnD/UO1m+SdTZcEC4urp8OUa0afre5skaUcylBwsb
 ZKaw==
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
