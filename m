Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3FC2B418
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636D889B48;
	Mon, 27 May 2019 12:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6696E13D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 18:17:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w1so9505248ljw.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 11:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WOTPz5lNju8Uwf51eJBHGL7FhyMKmYNlaIjFWCSiGME=;
 b=nD/2ALPDj+YIdESxps/x7nEJxGrHzCDljLBPObn3aHPQhctPgAAK7UCJEooDS4YSSC
 rQFL0bG12SSgWT4cahTYahqEUHg5t15L158mamSkB2ba2kQA1IgwVt5O6szlXealxbGN
 P9qD5pyKqtDmyUVq20NCdkkO3FvxuUJtfBSkAYs7gM/X37cGybf1IbSYs3NXf3B9phWG
 sZrBZxNxZzk0Q2UPXASOb2VSWLwQNLBvQkG/zvNZWECDAKtKWgs6+QQox1yHmqv1yrMC
 W0VlWKObJVtqBb42vAhL2cV8UuB16Ez8QOoKp/9000Pq3pW6Enm67M/bt42y2aZpOI+L
 I4hA==
X-Gm-Message-State: APjAAAUKQooAjVyo7ewuZHBTs28d7qm7h9Aqx7QlI5/dhZ39emhmkhGT
 VayK8O8SAzC0ODwz75omMXs=
X-Google-Smtp-Source: APXvYqy6t/I6JgVTAG71Jqtfllh/WzeZ3qSfINCsL566Fz5VwbQfcnbzSJCKnRiWwKYjFlFFkY6rRQ==
X-Received: by 2002:a2e:2c17:: with SMTP id s23mr768905ljs.214.1558721858446; 
 Fri, 24 May 2019 11:17:38 -0700 (PDT)
Received: from localhost.localdomain ([94.29.35.141])
 by smtp.gmail.com with ESMTPSA id h10sm810376ljm.9.2019.05.24.11.17.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 11:17:37 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 2/3] drm/tegra: dc: Extend debug stats with total number of
 events
Date: Fri, 24 May 2019 21:16:26 +0300
Message-Id: <20190524181627.16490-3-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190524181627.16490-1-digetx@gmail.com>
References: <20190524181627.16490-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WOTPz5lNju8Uwf51eJBHGL7FhyMKmYNlaIjFWCSiGME=;
 b=s2ZFjGlJcmB539B/LGdP4E0zY4XNlHT0ngjGl9uhJWqjDfzwF+gU+3VB7odWc+2nvM
 oxqBS5Ypscym2U7Es/IkT6Om0kGInRYq3nJIxx45XMClBzFwTRx9OESoAKn6SaFRmRci
 eTHX2pF2bzjVp8HVrFEIfclrHSsY7VT54qTez+aWoMgdnPr2yYUQY/da+bsuXh/CeB2r
 kmESwe03Al0CVQKfVGEaR137jaAELYf4VlJiQfYnwaCn/smQAVdrU/vNt7+XS/6s2xh2
 R136Jmbv5Z6Qc17wYcKRj4LzIrD77RCtWdKbPcTspu60gTDogFbVOb8hvYDzT5cKL9At
 BuGg==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBmb3VuZCB1c2VmdWwgdG8ga25vdyB0aGUgdG90YWwgbnVtYmVyIG9mIHVuZGVyZmxvdyBldmVu
dHMgd2hpbGUgd2FzCndvcmtpbmcgb24gYWRkaW5nIHN1cHBvcnQgZm9yIG1lbW9yeSBiYW5kd2lk
dGggbWFuYWdlbWVudC4gQ3VycmVudGx5CnRoZSBkZWJ1ZyBzdGF0cyBhcmUgZ2V0dGluZyByZXNl
dCBhZnRlciBkaXNhYmxpbmcgQ1JUQywgbGV0J3MgYWNjb3VudAp0aGUgb3ZlcmFsbCBudW1iZXIg
b2YgZXZlbnRzIHRoYXQgZG9lc24ndCBnZXQgcmVzZXQuCgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkg
T3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Rj
LmMgfCAxMCArKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuaCB8ICA1ICsrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdGVncmEvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCmluZGV4IDNl
MTM5NDhkY2RjZC4uZTUzN2MwZDRiZmRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwpAQCAtMTQ3Nyw2ICsxNDc3
LDExIEBAIHN0YXRpYyBpbnQgdGVncmFfZGNfc2hvd19zdGF0cyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMs
IHZvaWQgKmRhdGEpCiAJc2VxX3ByaW50ZihzLCAidW5kZXJmbG93OiAlbHVcbiIsIGRjLT5zdGF0
cy51bmRlcmZsb3cpOwogCXNlcV9wcmludGYocywgIm92ZXJmbG93OiAlbHVcbiIsIGRjLT5zdGF0
cy5vdmVyZmxvdyk7CiAKKwlzZXFfcHJpbnRmKHMsICJmcmFtZXMgdG90YWw6ICVsdVxuIiwgZGMt
PnN0YXRzLmZyYW1lc190b3RhbCk7CisJc2VxX3ByaW50ZihzLCAidmJsYW5rIHRvdGFsOiAlbHVc
biIsIGRjLT5zdGF0cy52YmxhbmtfdG90YWwpOworCXNlcV9wcmludGYocywgInVuZGVyZmxvdyB0
b3RhbDogJWx1XG4iLCBkYy0+c3RhdHMudW5kZXJmbG93X3RvdGFsKTsKKwlzZXFfcHJpbnRmKHMs
ICJvdmVyZmxvdyB0b3RhbDogJWx1XG4iLCBkYy0+c3RhdHMub3ZlcmZsb3dfdG90YWwpOworCiAJ
cmV0dXJuIDA7CiB9CiAKQEAgLTE5NDAsNiArMTk0NSw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB0
ZWdyYV9kY19pcnEoaW50IGlycSwgdm9pZCAqZGF0YSkKIAkJLyoKIAkJZGV2X2RiZyhkYy0+ZGV2
LCAiJXMoKTogZnJhbWUgZW5kXG4iLCBfX2Z1bmNfXyk7CiAJCSovCisJCWRjLT5zdGF0cy5mcmFt
ZXNfdG90YWwrKzsKIAkJZGMtPnN0YXRzLmZyYW1lcysrOwogCX0KIApAQCAtMTk0OCw2ICsxOTU0
LDcgQEAgc3RhdGljIGlycXJldHVybl90IHRlZ3JhX2RjX2lycShpbnQgaXJxLCB2b2lkICpkYXRh
KQogCQlkZXZfZGJnKGRjLT5kZXYsICIlcygpOiB2ZXJ0aWNhbCBibGFua1xuIiwgX19mdW5jX18p
OwogCQkqLwogCQlkcm1fY3J0Y19oYW5kbGVfdmJsYW5rKCZkYy0+YmFzZSk7CisJCWRjLT5zdGF0
cy52YmxhbmtfdG90YWwrKzsKIAkJZGMtPnN0YXRzLnZibGFuaysrOwogCX0KIApAQCAtMTk1NSw2
ICsxOTYyLDcgQEAgc3RhdGljIGlycXJldHVybl90IHRlZ3JhX2RjX2lycShpbnQgaXJxLCB2b2lk
ICpkYXRhKQogCQkvKgogCQlkZXZfZGJnKGRjLT5kZXYsICIlcygpOiB1bmRlcmZsb3dcbiIsIF9f
ZnVuY19fKTsKIAkJKi8KKwkJZGMtPnN0YXRzLnVuZGVyZmxvd190b3RhbCsrOwogCQlkYy0+c3Rh
dHMudW5kZXJmbG93Kys7CiAJfQogCkBAIC0xOTYyLDExICsxOTcwLDEzIEBAIHN0YXRpYyBpcnFy
ZXR1cm5fdCB0ZWdyYV9kY19pcnEoaW50IGlycSwgdm9pZCAqZGF0YSkKIAkJLyoKIAkJZGV2X2Ri
ZyhkYy0+ZGV2LCAiJXMoKTogb3ZlcmZsb3dcbiIsIF9fZnVuY19fKTsKIAkJKi8KKwkJZGMtPnN0
YXRzLm92ZXJmbG93X3RvdGFsKys7CiAJCWRjLT5zdGF0cy5vdmVyZmxvdysrOwogCX0KIAogCWlm
IChzdGF0dXMgJiBIRUFEX1VGX0lOVCkgewogCQlkZXZfZGJnX3JhdGVsaW1pdGVkKGRjLT5kZXYs
ICIlcygpOiBoZWFkIHVuZGVyZmxvd1xuIiwgX19mdW5jX18pOworCQlkYy0+c3RhdHMudW5kZXJm
bG93X3RvdGFsKys7CiAJCWRjLT5zdGF0cy51bmRlcmZsb3crKzsKIAl9CiAKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5oIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmgK
aW5kZXggMTI1NmRmYjZiMmY1Li5hYjI1MTU3Yzk0OGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5oCkBAIC00MSw2
ICs0MSwxMSBAQCBzdHJ1Y3QgdGVncmFfZGNfc3RhdHMgewogCXVuc2lnbmVkIGxvbmcgdmJsYW5r
OwogCXVuc2lnbmVkIGxvbmcgdW5kZXJmbG93OwogCXVuc2lnbmVkIGxvbmcgb3ZlcmZsb3c7CisK
Kwl1bnNpZ25lZCBsb25nIGZyYW1lc190b3RhbDsKKwl1bnNpZ25lZCBsb25nIHZibGFua190b3Rh
bDsKKwl1bnNpZ25lZCBsb25nIHVuZGVyZmxvd190b3RhbDsKKwl1bnNpZ25lZCBsb25nIG92ZXJm
bG93X3RvdGFsOwogfTsKIAogc3RydWN0IHRlZ3JhX3dpbmRvd2dyb3VwX3NvYyB7Ci0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
