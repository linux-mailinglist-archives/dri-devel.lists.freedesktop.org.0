Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F95A54E0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B3789A0E;
	Mon,  2 Sep 2019 11:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5279889A0E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so4833719wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6cE/xv/U0fBPBmKtqaF9y7E9fzhVX7Pxsb5pN0WeB1I=;
 b=VzIq6ooSVruJ2pK8yrqM1J1FTSRr1Zbukk9Dl3NsK2t/gtsbstgV0B/j22th8HBD+J
 VzVV+1unK9DOlmffUKBvwPZZrIvJUGa0ZhJdLQY5I/bC45qoNzNvvDC8JsX+uAtIUf4F
 WMVwSjRzNyOudZbA5ah2gF5MDQhx1qoZsZn/YKmj1cRjUxuvbKsepNN8Y1+8GYN1O8pw
 6yOE9QBkLgKBE0uYoRw5BX1Qpb9u0Vp+JSAqxtHjLt8GgXcFqiW/zy+yJp8SB+lluac3
 kNOQCk0PIO/+DWATKeLk2ED8pFlXn7hHFECEeqRksDzX0EgBtl+214ND6x38zCzQcHo5
 PbCw==
X-Gm-Message-State: APjAAAW+FlIwxfVnRUK2GHC/NKgga0q2eaFGsqKzxI1LI5A6ZSQdEuxS
 jpGryqKdJ4fKEePSHzUJ6Ij0n6Jb
X-Google-Smtp-Source: APXvYqxyHLaJ5erB59QfGTJT6pcjepbSVJ5kkThMyLzYtqT+j8u9al1pOr0Fc+6wDYmjxBQfjhAgCw==
X-Received: by 2002:a5d:458b:: with SMTP id p11mr5821373wrq.160.1567423889605; 
 Mon, 02 Sep 2019 04:31:29 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id s19sm28105920wrb.94.2019.09.02.04.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:28 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/21] drm/dp: Add drm_dp_link_reset() implementation
Date: Mon,  2 Sep 2019 13:31:03 +0200
Message-Id: <20190902113121.31323-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6cE/xv/U0fBPBmKtqaF9y7E9fzhVX7Pxsb5pN0WeB1I=;
 b=eTdMc1Ox+2Zub2dtyuJrYeQoINMd2P5sI2iGCrZTRaDovqs6F72LeEfaNQMpYhxr58
 +3YsT7jMpK5u7RVM6GQqnWHpNqDzaMzJOAvghc8IvHQ05sHx7TYWTtoBAy5+53cAL2Rr
 +vejn2TLDSNe6PQLdL4dzrdx8+5oCjCRc69Rk7LFxrWygAuEiU+M25oU7NQXsKV+v5Lm
 aPznEX5SgJhfdeQqBLDFjww4vmWwAwsqk99rxxb1T3Fa9MRSXLaCM7YLXMAzjKym3s2u
 Q1owBpkE6KxR8Y9yU7xJjITASRjQEOHjqrERq4CyQSjq/hukG5eZ2EjVVyw285BcLCUm
 rWDA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClN1YnNlcXVlbnQgcGF0
Y2hlcyB3aWxsIGFkZCBub24tdm9sYXRpbGUgZmllbGRzIHRvIHN0cnVjdCBkcm1fZHBfbGluaywK
c28gaW50cm9kdWNlIGEgZnVuY3Rpb24gdG8gemVybyBvdXQgb25seSB0aGUgdm9sYXRpbGUgZmll
bGRzLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMTMgKysrKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9oZWxwZXIuYwppbmRleCBmZmM2OGQzMDVhZmUuLmY1YWY3MWVjMWI3ZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jCkBAIC0zMzYsNiArMzM2LDE3IEBAIGludCBkcm1fZHBfZHBjZF9yZWFk
X2xpbmtfc3RhdHVzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiB9CiBFWFBPUlRfU1lNQk9MKGRy
bV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMpOwogCitzdGF0aWMgdm9pZCBkcm1fZHBfbGlua19y
ZXNldChzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmspCit7CisJaWYgKCFsaW5rKQorCQlyZXR1cm47
CisKKwlsaW5rLT5yZXZpc2lvbiA9IDA7CisJbGluay0+cmF0ZSA9IDA7CisJbGluay0+bnVtX2xh
bmVzID0gMDsKKwlsaW5rLT5jYXBhYmlsaXRpZXMgPSAwOworfQorCiAvKioKICAqIGRybV9kcF9s
aW5rX3Byb2JlKCkgLSBwcm9iZSBhIERpc3BsYXlQb3J0IGxpbmsgZm9yIGNhcGFiaWxpdGllcwog
ICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKQEAgLTM1Miw3ICszNjMsNyBAQCBpbnQg
ZHJtX2RwX2xpbmtfcHJvYmUoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgc3RydWN0IGRybV9kcF9s
aW5rICpsaW5rKQogCXU4IHZhbHVlc1szXTsKIAlpbnQgZXJyOwogCi0JbWVtc2V0KGxpbmssIDAs
IHNpemVvZigqbGluaykpOworCWRybV9kcF9saW5rX3Jlc2V0KGxpbmspOwogCiAJZXJyID0gZHJt
X2RwX2RwY2RfcmVhZChhdXgsIERQX0RQQ0RfUkVWLCB2YWx1ZXMsIHNpemVvZih2YWx1ZXMpKTsK
IAlpZiAoZXJyIDwgMCkKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
