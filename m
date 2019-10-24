Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CBDE38B6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB386E4FE;
	Thu, 24 Oct 2019 16:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5DA6E4FE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w9so2096684wmm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t2AaSAVqpbDL04En9DdcntuJXoHrsGRIQaneDm/xPB8=;
 b=eUGJRvaVMU4fnfKAX1ADCYyF1Ym+ysrjQOqayqDW7n+cWySvHX7+JB+8GLu9nl72Al
 my3+HWjfY8g/B7PZW/NCqzaY7wY/Aa/HJdpTeBGTbHNMYDMXcfRgbGnt/tam2Tt4G7qW
 wZuAHUn0W47jse/low4P4xalriN1EuLq8OpPZ5o1KM7ErbimMEj5yPfzdfqyDxUGD+cG
 xrviF3RKKE8HvFFcyhvediIgJOdN/fcm70bBqNEgHs5JCC4D92omxjElkRxl4jSBwYG0
 StkBf8pfoBBZnd7IrNMXdHyTfIK3mNMMICHBzsFsYjJg1+AtFlJof37biCHqZ7vfC/Z4
 ZIdg==
X-Gm-Message-State: APjAAAWNyW3pIjEauBLHCgyxxYEVQ2KVDCCcOMuZ4ABflfh5iPFD1trc
 Vvzg57aXXtsHu0udS67QL8g=
X-Google-Smtp-Source: APXvYqy7rcaOm0vrlMBYNbbmx6UJLakTaiIUDoQkKpFg2C2Z5vcT45qLo+YnNhjrRvUuuqbrqKh7Cg==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr5674271wmj.126.1571935578299; 
 Thu, 24 Oct 2019 09:46:18 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id q12sm2627267wrj.87.2019.10.24.09.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:17 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 18/32] drm/tegra: sor: Hook up I2C-over-AUX to output
Date: Thu, 24 Oct 2019 18:45:20 +0200
Message-Id: <20191024164534.132764-19-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t2AaSAVqpbDL04En9DdcntuJXoHrsGRIQaneDm/xPB8=;
 b=G3twkFZ2mXV/rLLmlkVA04C7g/kJioutmqx7VJWaFEkPh7Bx/z+g3/63gG12vQEYzL
 lrnuPYLxPkqmK6V8+gRewfRtZgJ5VZQZtE9tNGh77vt3V8wbrL2ZMyTvyyegG9R0a77F
 TRWbHZp5dfpzBbLZmS3i+g6538kXX2GM08zAM4WQi/tq4JMrmczCA6obAJXlAiMEl/WG
 olE9mhDzBhdETOOjZHo9ZzvAohsQRKWEGC1L4xaTPH64/LRw1OzvVXbduQSxcyCHUSuX
 CVhRUUtBFDBSNLjnYEglPnxBO05n27n+jFGpp226y91XKVwas3/7rFq9SgbIgm/yCQ6I
 8+sA==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoaXMgaXMgbmVjZXNz
YXJ5IGZvciB0aGUgb3V0cHV0IGFic3RyYWN0aW9uIHRvIHJldHJpZXZlIGEgbGlzdCBvZiB2YWxp
ZAptb2RlcyBmcm9tIHRoZSBFRElEIG9mIGEgY29ubmVjdGVkIHBhbmVsL21vbml0b3IuIFRoaXMg
d2lsbCBiZSB1c2VmdWwgaW4KY29uanVuY3Rpb24gd2l0aCBEaXNwbGF5UG9ydCBzdXBwb3J0IHRo
YXQgd2lsbCBiZSBhZGRlZCBpbiBhIHN1YnNlcXVlbnQKcGF0Y2gsIHNvIHRoYXQgdGhlIGRyaXZl
ciBjYW4gcmVhZCBFRElEIHZpYSB0aGUgQVVYIGNoYW5uZWwuCgpTaWduZWQtb2ZmLWJ5OiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdy
YS9zb3IuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
c29yLmMKaW5kZXggNjM2ODA3ZTA0N2YwLi42Zjk3OWM1ZmZmN2IgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9zb3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMK
QEAgLTM1MjQsNiArMzUyNCw4IEBAIHN0YXRpYyBpbnQgdGVncmFfc29yX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAkJaWYgKCFzb3ItPmF1eCkKIAkJCXJldHVybiAtRVBS
T0JFX0RFRkVSOworCisJCXNvci0+b3V0cHV0LmRkYyA9ICZzb3ItPmF1eC0+ZGRjOwogCX0KIAog
CWlmICghc29yLT5hdXgpIHsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
