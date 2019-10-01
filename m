Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEEDC4837
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9FF6E8BC;
	Wed,  2 Oct 2019 07:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CFF6E788
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 12:59:26 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m18so3151724wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 05:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D9pO+0MHgzeKL2RcdyibfEgdagmW4iIx3RKTGovDgU8=;
 b=lTHnHrKj5+9ngT8BwqakW7zpt0knJ8DsVAZZEYM7aXkcbUX0vUf3rUMiJ66YftDfYs
 6Wy8QGPWuQ1TrmC+rOl00Bys2MCT5tNb5RqI+o8S1zfH/hBYMOBpPmsZScSE3nVH6H9d
 42veYUK/xyBY0cb7QrgAwJvTTvntfDrFSsX4ko9mFE+Mq5a+AxPL07jw9wUqxquM9c+U
 YVZq316Xr7QkjKEoPzqmhuwzSsbMQq3I0EygVS3JSRyJ0MFn5PvmsynKExjw/MozbVXT
 eL54qfm01Wqo/qk1SqVUEb4QeaW2rwEyyUmb+UGKg7JP59NwRl0uQoDthga/j+T17Ahp
 Bhmw==
X-Gm-Message-State: APjAAAUJ572Lr5Wf/3SYPD+LZ5eiDJVQXlv7d8fFNAQk+KNDJE7sC40U
 bMY17deJFydaCKx47jYXq1Mlzw==
X-Google-Smtp-Source: APXvYqwgsoHTTN2O/sjhKwhf6VnENZ+BBq9+zR+gMQ1rVj7IWWaM9XkzP/4I7WftaJ6UQlRAXrFYIg==
X-Received: by 2002:a7b:c4c7:: with SMTP id g7mr3528237wmk.11.1569934765149;
 Tue, 01 Oct 2019 05:59:25 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id 3sm3561400wmo.22.2019.10.01.05.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 05:59:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 0/7] backlight: gpio: simplify the driver
Date: Tue,  1 Oct 2019 14:58:30 +0200
Message-Id: <20191001125837.4472-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D9pO+0MHgzeKL2RcdyibfEgdagmW4iIx3RKTGovDgU8=;
 b=u4pYneTQzTMfqKIneJ+jhBxo32+eE1GwceL9ysZrc8f2tvOcstNDoaKkJQl1nbl+Ao
 6P3gq0jMdTVzSgHdStBHb/dblw7AifsDwmT2WULmhx+XzH5eyFiqBZiu3RBxqpKMns3p
 PYsleSE1ip85l87GJ+TqXIGekOkdHa+YcZ8ie87g7R7dn6/IoOyp/YZ90NXKJUx1xVUf
 7tCRMhmeMthTNRPtxRqcYYppS0ZoSb8Kh4UJ9zRYf9Y5D6XlKKW0d3mbk5Q2Wo1a615C
 Ks0pjYRCdT3yCg50J/ikzSsCuh0XiTQ8J/vzgbqiRjZIbjzSm7OjXCRQPaUaU3EhcvaJ
 zUEA==
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
d2VyIHN0YXRlIGhhbmRsaW5nIikKLSBhZGRlZCBwYXRjaCA3LzcKCkJhcnRvc3ogR29sYXN6ZXdz
a2kgKDcpOgogIGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIHVubmVlZGVkIGluY2x1ZGUKICBzaDog
ZWNvdmVjMjQ6IGFkZCBhZGRpdGlvbmFsIHByb3BlcnRpZXMgdG8gdGhlIGJhY2tsaWdodCBkZXZp
Y2UKICBiYWNrbGlnaHQ6IGdwaW86IHNpbXBsaWZ5IHRoZSBwbGF0Zm9ybSBkYXRhIGhhbmRsaW5n
CiAgc2g6IGVjb3ZlYzI0OiBkb24ndCBzZXQgdW51c2VkIGZpZWxkcyBpbiBwbGF0Zm9ybSBkYXRh
CiAgYmFja2xpZ2h0OiBncGlvOiByZW1vdmUgdW51c2VkIGZpZWxkcyBmcm9tIHBsYXRmb3JtIGRh
dGEKICBiYWNrbGlnaHQ6IGdwaW86IHVzZSBhIGhlbHBlciB2YXJpYWJsZSBmb3IgJnBkZXYtPmRl
dgogIGJhY2tsaWdodDogZ3BpbzogcHVsbCBncGlvX2JhY2tsaWdodF9pbml0aWFsX3Bvd2VyX3N0
YXRlKCkgaW50byBwcm9iZQoKIGFyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAuYyAg
ICAgICAgIHwgIDMzICsrKystLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGln
aHQuYyAgICAgfCAxMDcgKysrKystLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9saW51eC9wbGF0Zm9y
bV9kYXRhL2dwaW9fYmFja2xpZ2h0LmggfCAgIDMgLQogMyBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNl
cnRpb25zKCspLCA5MSBkZWxldGlvbnMoLSkKCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
