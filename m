Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA51EE13CC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22F46E9BF;
	Wed, 23 Oct 2019 08:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675F46E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:36:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l10so16579267wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvQLRHJvRjudaJXCpLtV7CQx5y9VARSzzzMBbffwoBQ=;
 b=PQ3osqEWBtJQjcP1PeXDDty6nYKCjyRRCy2RhihXOlnCrKtOFUonmge6HhVSYOkykl
 1ydgqxhoor/BIhCz+XBwlys37qHjuOMLzerQxWgt+DBdG3GaeJ3B5DGgWP1Z/OufSms9
 PghcbykP5+pj8Lw5TY3O7S6nGYMnIRCyxTHUV3qv/D8m4dFPy4h09S8grFVC6hEZ5kIq
 SfrFvPg9PXUh3s5+/uWkOjIfcsIzTCjdB1K9juXI7mRvXwVAvR7or5UKwZtzSolLafSw
 WT4nqCV4DGtbk/BAV6SbnR72FeubWMAgt+1shZnbBzkJVVOeIjjmAO72kcTAAt4zlk4Z
 lo9A==
X-Gm-Message-State: APjAAAVndQ88zBDF9FpdFlrtTRT8uspVDIDQC0bTt4bcuHdIPIl4xNEc
 Z70N7If2F6oNeLJK9p1UJQrzWQ==
X-Google-Smtp-Source: APXvYqyaselYLV/0dnxVgvDBqTCkwoVW8/nREL08BhLjGuMEQBFszR2zj3NmBAPYQD7CNxTVF2VrFw==
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr2450846wrr.50.1571733401978; 
 Tue, 22 Oct 2019 01:36:41 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:36:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v7 5/9] backlight: gpio: simplify the platform data handling
Date: Tue, 22 Oct 2019 10:36:26 +0200
Message-Id: <20191022083630.28175-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
References: <20191022083630.28175-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvQLRHJvRjudaJXCpLtV7CQx5y9VARSzzzMBbffwoBQ=;
 b=R0kpfQV0jZYq2r/gSdB59v/D7Ky/qC7QBaqd8jFL5iqpVaB7HbudHuRs3k/Du5yZrv
 RtLp9RXnK3Ac6JBmGc61233Jzc3czDf1nZkMp74sB5QkgfhDFSpXYx4SG6FF6KNOAcvK
 /xnwnzv9ysxeUNTqHWANmB+wu32P67SBprPLFSGNL0FSwskPlqDpo/ZF5YXHYp77tP89
 ruPFvimpaR67SUNYOCzZLwoadfWEfB1p5iS/pd3brQsJSi7qoQpOZFfXaEzQTRwn+V6Z
 JPHXS9Y72JOkuFLWYupTjAv/kuwlsgyMZ9/CdzY8lCwE8KVEsY8bW6MoCWUxYQsh6ztg
 9TeA==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCk5v
dyB0aGF0IHRoZSBsYXN0IHVzZXIgb2YgcGxhdGZvcm0gZGF0YSAoc2ggZWNvdmVjMjQpIGRlZmlu
ZXMgYSBwcm9wZXIKR1BJTyBsb29rdXAgYW5kIHNldHMgdGhlICdkZWZhdWx0LW9uJyBkZXZpY2Ug
cHJvcGVydHksIHdlIGNhbiBkcm9wIHRoZQpwbGF0Zm9ybV9kYXRhLXNwZWNpZmljIEdQSU8gaGFu
ZGxpbmcgYW5kIHVuaWZ5IGEgYmlnIGNodW5rIG9mIGNvZGUuCgpUaGUgb25seSBmaWVsZCB1c2Vk
IGZyb20gdGhlIHBsYXRmb3JtIGRhdGEgaXMgbm93IHRoZSBmYmRldiBwb2ludGVyLgoKU2lnbmVk
LW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4K
UmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KUmV2
aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+ClJl
dmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVs
LmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIHwgNjIg
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgNTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
Z3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0
LmMKaW5kZXggNTJmMTdjOWNhMWMzLi5kZGM3ZDNiMjg4YjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwpAQCAtNiw3ICs2LDYgQEAKICNpbmNsdWRlIDxsaW51eC9i
YWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KICNpbmNsdWRlIDxsaW51eC9mYi5o
PgotI2luY2x1ZGUgPGxpbnV4L2dwaW8uaD4gLyogT25seSBmb3IgbGVnYWN5IHN1cHBvcnQgKi8K
ICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvaW5pdC5o
PgogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgpAQCAtNjEsMjggKzYwLDYgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBiYWNrbGlnaHRfb3BzIGdwaW9fYmFja2xpZ2h0X29wcyA9IHsKIAkuY2hlY2tf
ZmIJPSBncGlvX2JhY2tsaWdodF9jaGVja19mYiwKIH07CiAKLXN0YXRpYyBpbnQgZ3Bpb19iYWNr
bGlnaHRfcHJvYmVfZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKLQkJCQkgICBzdHJ1
Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKLXsKLQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+
ZGV2OwotCWludCByZXQ7Ci0KLQlnYmwtPmRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFk
X2Jvb2woZGV2LCAiZGVmYXVsdC1vbiIpOwotCi0JZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0
KGRldiwgTlVMTCwgR1BJT0RfQVNJUyk7Ci0JaWYgKElTX0VSUihnYmwtPmdwaW9kKSkgewotCQly
ZXQgPSBQVFJfRVJSKGdibC0+Z3Bpb2QpOwotCi0JCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikg
ewotCQkJZGV2X2VycihkZXYsCi0JCQkJIkVycm9yOiBUaGUgZ3Bpb3MgcGFyYW1ldGVyIGlzIG1p
c3Npbmcgb3IgaW52YWxpZC5cbiIpOwotCQl9Ci0JCXJldHVybiByZXQ7Ci0JfQotCi0JcmV0dXJu
IDA7Ci19Ci0KIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfaW5pdGlhbF9wb3dlcl9zdGF0ZShz
dHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKIHsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUg
PSBnYmwtPmRldi0+b2Zfbm9kZTsKQEAgLTExNCwzNSArOTEsMTggQEAgc3RhdGljIGludCBncGlv
X2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJZ2JsLT5k
ZXYgPSAmcGRldi0+ZGV2OwogCi0JaWYgKHBkZXYtPmRldi5md25vZGUpIHsKLQkJcmV0ID0gZ3Bp
b19iYWNrbGlnaHRfcHJvYmVfZHQocGRldiwgZ2JsKTsKLQkJaWYgKHJldCkKLQkJCXJldHVybiBy
ZXQ7Ci0JfSBlbHNlIGlmIChwZGF0YSkgewotCQkvKgotCQkgKiBMZWdhY3kgcGxhdGZvcm0gZGF0
YSBHUElPIHJldHJpZXZlYWwuIERvIG5vdCBleHBhbmQKLQkJICogdGhlIHVzZSBvZiB0aGlzIGNv
ZGUgcGF0aCwgY3VycmVudGx5IG9ubHkgdXNlZCBieSBvbmUKLQkJICogU0ggYm9hcmQuCi0JCSAq
LwotCQl1bnNpZ25lZCBsb25nIGZsYWdzID0gR1BJT0ZfRElSX09VVDsKLQorCWlmIChwZGF0YSkK
IAkJZ2JsLT5mYmRldiA9IHBkYXRhLT5mYmRldjsKLQkJZ2JsLT5kZWZfdmFsdWUgPSBwZGF0YS0+
ZGVmX3ZhbHVlOwotCQlmbGFncyB8PSBnYmwtPmRlZl92YWx1ZSA/IEdQSU9GX0lOSVRfSElHSCA6
IEdQSU9GX0lOSVRfTE9XOwotCi0JCXJldCA9IGRldm1fZ3Bpb19yZXF1ZXN0X29uZShnYmwtPmRl
diwgcGRhdGEtPmdwaW8sIGZsYWdzLAotCQkJCQkgICAgcGRhdGEgPyBwZGF0YS0+bmFtZSA6ICJi
YWNrbGlnaHQiKTsKLQkJaWYgKHJldCA8IDApIHsKLQkJCWRldl9lcnIoJnBkZXYtPmRldiwgInVu
YWJsZSB0byByZXF1ZXN0IEdQSU9cbiIpOwotCQkJcmV0dXJuIHJldDsKLQkJfQotCQlnYmwtPmdw
aW9kID0gZ3Bpb190b19kZXNjKHBkYXRhLT5ncGlvKTsKLQkJaWYgKCFnYmwtPmdwaW9kKQotCQkJ
cmV0dXJuIC1FSU5WQUw7Ci0JfSBlbHNlIHsKLQkJZGV2X2VycigmcGRldi0+ZGV2LAotCQkJImZh
aWxlZCB0byBmaW5kIHBsYXRmb3JtIGRhdGEgb3IgZGV2aWNlIHRyZWUgbm9kZS5cbiIpOwotCQly
ZXR1cm4gLUVOT0RFVjsKKworCWdibC0+ZGVmX3ZhbHVlID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRf
Ym9vbCgmcGRldi0+ZGV2LCAiZGVmYXVsdC1vbiIpOworCisJZ2JsLT5ncGlvZCA9IGRldm1fZ3Bp
b2RfZ2V0KCZwZGV2LT5kZXYsIE5VTEwsIEdQSU9EX0FTSVMpOworCWlmIChJU19FUlIoZ2JsLT5n
cGlvZCkpIHsKKwkJcmV0ID0gUFRSX0VSUihnYmwtPmdwaW9kKTsKKwkJaWYgKHJldCAhPSAtRVBS
T0JFX0RFRkVSKQorCQkJZGV2X2VycigmcGRldi0+ZGV2LAorCQkJCSJFcnJvcjogVGhlIGdwaW9z
IHBhcmFtZXRlciBpcyBtaXNzaW5nIG9yIGludmFsaWQuXG4iKTsKKwkJcmV0dXJuIHJldDsKIAl9
CiAKIAltZW1zZXQoJnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
