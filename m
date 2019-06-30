Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B195B04B
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 17:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6D789D57;
	Sun, 30 Jun 2019 15:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614E689D53;
 Sun, 30 Jun 2019 15:03:16 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so11882256qtn.7;
 Sun, 30 Jun 2019 08:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RWe1N3LG/0qF/4OtUPg5KudfEZRgRNv8F1jllSBzO58=;
 b=csAb0zSAYr5Z9gDpo9e4Olw3GMXC4TW2JIyKKEdG37OUa3ylWhqheh/vIQGp4yVXeP
 2+WUhLUjh+QXXAyDt+tN0qlMvdlMsv5xWJ7R/0LUEmbmkZ8PRLZTBFpzLImImAJkyJpf
 6Xq9I2KKzU4LXqiqvHCXbYEwRlbFjXPFi1sukqgtXXK2c8aMK0U6k4KzymLDckgqrbnR
 /erYm7TcPcoOS/5oQc27W12qrHzjprl+kRUuyZFMBwhg2NPtxv4uBgCTfzJx3N4FyS4a
 hqotd7hW9mNfYw7E0nMsLbULrFjnvRx1xsc0+OKvvcxN02PkhXtHf5x1mxdsOjrcgiUe
 NpDg==
X-Gm-Message-State: APjAAAULhesDAQb+ITV5WolXmXmu7GsUhqUi5/M3iCnHgBs+L93TqsJq
 /UsDL3KxjvHqFjQsLK7eqef0meQYGfw=
X-Google-Smtp-Source: APXvYqw+jlFz4lc9QWDni/7uD8aWjy+oIsfuvaIWeBwdqBoQFL00TSoQqCRML6G+VV/wap1Zdd6izw==
X-Received: by 2002:ac8:2b51:: with SMTP id 17mr16313957qtv.206.1561906994849; 
 Sun, 30 Jun 2019 08:03:14 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id l40sm4242251qtc.51.2019.06.30.08.03.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 08:03:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/5] drm/bridge: ti-sn65dsi86: support booloader enabled
 display
Date: Sun, 30 Jun 2019 08:01:43 -0700
Message-Id: <20190630150230.7878-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630150230.7878-1-robdclark@gmail.com>
References: <20190630150230.7878-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RWe1N3LG/0qF/4OtUPg5KudfEZRgRNv8F1jllSBzO58=;
 b=ffrROOTrYan4x30i16kRzeRZh0cNY1tR6zoQHYUxePgn0RD9arBQo0wHXqQS24AEO6
 z/yAVqI8q8G78Fg6d+1EUBN8UmExk2L1ugT6WNCVJALHVq01478i2+l1I2OsTqluOTvA
 hnUGXEUyh87ggaQ3r/9ItW5b4I1Kwg9/BxMmb+QqZfOz9+FOqBAvZwzWf6ScwuaMYKAo
 FQHpWCWZ8a8g/vHHXP38B6zewBop6StVjcS7RpIqxbEZlvtQHBQp0LLU8yWS7KWrdxue
 /Be2CIgOEwZ7ZYds7RkxeMFKCKVGQlqgebZ+v8Fs5+o6G3Ci8sa/+d+uWVzXQkc8J1nt
 D3Ww==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 linux-pm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKUmVxdWVzdCB0aGUgZW5h
YmxlIGdwaW8gQVNJUyB0byBhdm9pZCBkaXNhYmxpbmcgYnJpZGdlIGR1cmluZyBwcm9iZSwgaWYK
YWxyZWFkeSBlbmFibGVkLiAgQW5kIGlmIGFscmVhZHkgZW5hYmxlZCwgZGVmZXIgZW5hYmxpbmcg
cnVucG0gdW50aWwKYXR0YWNoIHRvIGF2b2lkIGN1dHRpbmcgb2ZmIHRoZSBwb3dlciB0byB0aGUg
YnJpZGdlLgoKT25jZSB3ZSBnZXQgdG8gYXR0YWNoLCB3ZSBrbm93IHBhbmVsIGFuZCBkcm0gZHJp
dmVyIGFyZSBwcm9iZWQKc3VjY2Vzc2Z1bGx5LCBzbyBhdCB0aGlzIHBvaW50IGl0IGkgcyBzYWZl
IHRvIGVuYWJsZSBydW5wbSBhbmQgcmVzZXQgdGhlCmJyaWRnZS4gIElmIHdlIGRvIGl0IGVhcmxp
ZXIsIHdlIGtpbGwgZWZpZmIgKGluIHRoZSBjYXNlIHRoYXQgcGFuZWwgb3IKZHJtIGRyaXZlciBk
byBub3QgcHJvYmUgc3VjY2Vzc2Z1bGx5LCBnaXZpbmcgdGhlIHVzZXIgbm8gd2F5IHRvIHNlZSB3
aGF0CmlzIGdvaW5nIG9uLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hy
b21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCAx
MiArKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCmluZGV4IDdhMDQ2YmNk
ZDgxYi4uOGJkYzMzNTc2OTkyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXNuNjVkc2k4Ni5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMK
QEAgLTI1Nyw2ICsyNTcsMTIgQEAgc3RhdGljIGludCB0aV9zbl9icmlkZ2VfYXR0YWNoKHN0cnVj
dCBkcm1fYnJpZGdlICpicmlkZ2UpCiAJCQkJCQkgICAubm9kZSA9IE5VTEwsCiAJCQkJCQkgfTsK
IAorCWlmIChncGlvZF9nZXRfdmFsdWUocGRhdGEtPmVuYWJsZV9ncGlvKSkgeworCQlwbV9ydW50
aW1lX2VuYWJsZShwZGF0YS0+ZGV2KTsKKwkJdGlfc25fYnJpZGdlX3Jlc3VtZShwZGF0YS0+ZGV2
KTsKKwkJdGlfc25fYnJpZGdlX3N1c3BlbmQocGRhdGEtPmRldik7CisJfQorCiAJcmV0ID0gZHJt
X2Nvbm5lY3Rvcl9pbml0KGJyaWRnZS0+ZGV2LCAmcGRhdGEtPmNvbm5lY3RvciwKIAkJCQkgJnRp
X3NuX2JyaWRnZV9jb25uZWN0b3JfZnVuY3MsCiAJCQkJIERSTV9NT0RFX0NPTk5FQ1RPUl9lRFAp
OwpAQCAtODEzLDcgKzgxOSw3IEBAIHN0YXRpYyBpbnQgdGlfc25fYnJpZGdlX3Byb2JlKHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQsCiAJZGV2X3NldF9kcnZkYXRhKCZjbGllbnQtPmRldiwgcGRh
dGEpOwogCiAJcGRhdGEtPmVuYWJsZV9ncGlvID0gZGV2bV9ncGlvZF9nZXQocGRhdGEtPmRldiwg
ImVuYWJsZSIsCi0JCQkJCSAgICBHUElPRF9PVVRfTE9XKTsKKwkJCQkJICAgIEdQSU9EX0FTSVMp
OwogCWlmIChJU19FUlIocGRhdGEtPmVuYWJsZV9ncGlvKSkgewogCQlEUk1fRVJST1IoImZhaWxl
ZCB0byBnZXQgZW5hYmxlIGdwaW8gZnJvbSBEVFxuIik7CiAJCXJldCA9IFBUUl9FUlIocGRhdGEt
PmVuYWJsZV9ncGlvKTsKQEAgLTg0Myw3ICs4NDksOSBAQCBzdGF0aWMgaW50IHRpX3NuX2JyaWRn
ZV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAogCWlmIChyZXQpCiAJCXJldHVybiBy
ZXQ7CiAKLQlwbV9ydW50aW1lX2VuYWJsZShwZGF0YS0+ZGV2KTsKKwlpZiAoIWdwaW9kX2dldF92
YWx1ZShwZGF0YS0+ZW5hYmxlX2dwaW8pKSB7CisJCXBtX3J1bnRpbWVfZW5hYmxlKHBkYXRhLT5k
ZXYpOworCX0KIAogCWkyY19zZXRfY2xpZW50ZGF0YShjbGllbnQsIHBkYXRhKTsKIAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
