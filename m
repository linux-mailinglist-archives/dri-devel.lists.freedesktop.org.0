Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6C610CBE7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 16:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AB26E847;
	Thu, 28 Nov 2019 15:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8574589C05
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 15:37:52 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b11so11354248wmj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 07:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HrdYqIJ8Cxshs6Aa/bHGdGgDvlNcq34vR+c5j3HYNtA=;
 b=IKCURifBU+t2mgad2WvT21H/fnz33IjdFS0Yigms2hSSJpeP/3wK7Vyatyokzr/ASl
 TpwnAkYe5N20XuHgBoYvEmRUy8MiK57xiSDzAQIllvENO0ozQV1cQMMQE8ExQJcWYXOF
 ZdNSHUxFV7aFojdqM7Lgo096dS1/vBSdqv2qNO3hyG9j5DR+NKW8WKnoktc7l/37niXD
 9UnhvBl+ytvDr0Jf4o4Dfyv4SatbirUUrpRN+cKV5nonpx1XZ1acbg7SoeolE4ElutYG
 3eyHdGejMHIFYRdO8dDG5gmXwq+GHzXGe3Q/Yo+qpvr2TZN6V5DtHunJZt2TJfRbqWuK
 5CWg==
X-Gm-Message-State: APjAAAV+Cjo+fqdVtbQ++0MDXkp6FOCv/Vx11JiYWOhaVk/9JBm2sa1K
 J+/xyA6vt2YX7QdPg0LUV9mMtHVIDp4=
X-Google-Smtp-Source: APXvYqz8SKwAvHY3TytakMY5iSY6gVr7NcSbL5ZBcKy9HT6jLMl11Qps6inph4HJyMHNHUhNhtWFzg==
X-Received: by 2002:a7b:c004:: with SMTP id c4mr9913681wmb.45.1574955471094;
 Thu, 28 Nov 2019 07:37:51 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id s10sm2701711wrw.12.2019.11.28.07.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 07:37:50 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 4/9] drm/tegra: Use proper IOVA address for cursor image
Date: Thu, 28 Nov 2019 16:37:36 +0100
Message-Id: <20191128153741.2380419-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HrdYqIJ8Cxshs6Aa/bHGdGgDvlNcq34vR+c5j3HYNtA=;
 b=VfoW0WCZF+O9ztW6wTwsZMcCQ8NaJVc1t8TgojB5qpDu8Wi8cwhXomlYqyp7AlR06e
 eaWEng2jbKbaYA+K81DXFAfcC6m972l2XqOLYlgzrqXbf6DPCveZ7TNQMgT8tVk5sJlO
 BjMsUVLOE6h4OUQUsdzfYEE2iTL9FzXqylcoAvgpkW/fLJxCwO4r6DNXVZfkvYieAbcA
 4ojPNM7FuokCqYnzQ8RoFdFTuqAYZdCtv6gh4IP2ScJ2BbTtXOzbCqo+w5IlJROIGc1h
 YvunSypP2EUJEOlRbuAbcs8yHk6o7IQnQhKdlLVcGp9s2BLqMgsd+WKYjRwFCTgCL1Aq
 TcCQ==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBJT1ZBIGFkZHJl
c3MgZm9yIHRoZSBjdXJzb3IgaXMgdGhlIHJlc3VsdCBvZiBtYXBwaW5nIHRoZSBidWZmZXIKb2Jq
ZWN0IGZvciB0aGUgZ2l2ZW4gZGlzcGxheSBjb250cm9sbGVyLiBNYWtlIHN1cmUgdG8gdXNlIHRo
ZSBwcm9wZXIKSU9WQSBhZGRyZXNzIGFzIHN0b3JlZCBpbiB0aGUgY3Vyc29yJ3MgcGxhbmUgc3Rh
dGUuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jIHwgMTYgKysrKysrKystLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5j
CmluZGV4IGQwM2IzM2MzYjExNC4uMGE1Zjg2YjYxZmRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwpAQCAtODQ3
LDE2ICs4NDcsMTUgQEAgc3RhdGljIGludCB0ZWdyYV9jdXJzb3JfYXRvbWljX2NoZWNrKHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lLAogc3RhdGljIHZvaWQgdGVncmFfY3Vyc29yX2F0b21pY191cGRh
dGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJCQkJICAgICAgIHN0cnVjdCBkcm1fcGxhbmVf
c3RhdGUgKm9sZF9zdGF0ZSkKIHsKLQlzdHJ1Y3QgdGVncmFfYm8gKmJvID0gdGVncmFfZmJfZ2V0
X3BsYW5lKHBsYW5lLT5zdGF0ZS0+ZmIsIDApOworCXN0cnVjdCB0ZWdyYV9wbGFuZV9zdGF0ZSAq
c3RhdGUgPSB0b190ZWdyYV9wbGFuZV9zdGF0ZShwbGFuZS0+c3RhdGUpOwogCXN0cnVjdCB0ZWdy
YV9kYyAqZGMgPSB0b190ZWdyYV9kYyhwbGFuZS0+c3RhdGUtPmNydGMpOwotCXN0cnVjdCBkcm1f
cGxhbmVfc3RhdGUgKnN0YXRlID0gcGxhbmUtPnN0YXRlOwogCXUzMiB2YWx1ZSA9IENVUlNPUl9D
TElQX0RJU1BMQVk7CiAKIAkvKiByaWVuIG5lIHZhIHBsdXMgKi8KIAlpZiAoIXBsYW5lLT5zdGF0
ZS0+Y3J0YyB8fCAhcGxhbmUtPnN0YXRlLT5mYikKIAkJcmV0dXJuOwogCi0Jc3dpdGNoIChzdGF0
ZS0+Y3J0Y193KSB7CisJc3dpdGNoIChwbGFuZS0+c3RhdGUtPmNydGNfdykgewogCWNhc2UgMzI6
CiAJCXZhbHVlIHw9IENVUlNPUl9TSVpFXzMyeDMyOwogCQlicmVhazsKQEAgLTg3NCwxNiArODcz
LDE2IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX2N1cnNvcl9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lLAogCQlicmVhazsKIAogCWRlZmF1bHQ6Ci0JCVdBUk4oMSwgImN1cnNvciBz
aXplICV1eCV1IG5vdCBzdXBwb3J0ZWRcbiIsIHN0YXRlLT5jcnRjX3csCi0JCSAgICAgc3RhdGUt
PmNydGNfaCk7CisJCVdBUk4oMSwgImN1cnNvciBzaXplICV1eCV1IG5vdCBzdXBwb3J0ZWRcbiIs
CisJCSAgICAgcGxhbmUtPnN0YXRlLT5jcnRjX3csIHBsYW5lLT5zdGF0ZS0+Y3J0Y19oKTsKIAkJ
cmV0dXJuOwogCX0KIAotCXZhbHVlIHw9IChiby0+aW92YSA+PiAxMCkgJiAweDNmZmZmZjsKKwl2
YWx1ZSB8PSAoc3RhdGUtPmlvdmFbMF0gPj4gMTApICYgMHgzZmZmZmY7CiAJdGVncmFfZGNfd3Jp
dGVsKGRjLCB2YWx1ZSwgRENfRElTUF9DVVJTT1JfU1RBUlRfQUREUik7CiAKICNpZmRlZiBDT05G
SUdfQVJDSF9ETUFfQUREUl9UXzY0QklUCi0JdmFsdWUgPSAoYm8tPmlvdmEgPj4gMzIpICYgMHgz
OworCXZhbHVlID0gKHN0YXRlLT5pb3ZhWzBdID4+IDMyKSAmIDB4MzsKIAl0ZWdyYV9kY193cml0
ZWwoZGMsIHZhbHVlLCBEQ19ESVNQX0NVUlNPUl9TVEFSVF9BRERSX0hJKTsKICNlbmRpZgogCkBA
IC05MDIsNyArOTAxLDggQEAgc3RhdGljIHZvaWQgdGVncmFfY3Vyc29yX2F0b21pY191cGRhdGUo
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJdGVncmFfZGNfd3JpdGVsKGRjLCB2YWx1ZSwgRENf
RElTUF9CTEVORF9DVVJTT1JfQ09OVFJPTCk7CiAKIAkvKiBwb3NpdGlvbiB0aGUgY3Vyc29yICov
Ci0JdmFsdWUgPSAoc3RhdGUtPmNydGNfeSAmIDB4M2ZmZikgPDwgMTYgfCAoc3RhdGUtPmNydGNf
eCAmIDB4M2ZmZik7CisJdmFsdWUgPSAocGxhbmUtPnN0YXRlLT5jcnRjX3kgJiAweDNmZmYpIDw8
IDE2IHwKKwkJKHBsYW5lLT5zdGF0ZS0+Y3J0Y194ICYgMHgzZmZmKTsKIAl0ZWdyYV9kY193cml0
ZWwoZGMsIHZhbHVlLCBEQ19ESVNQX0NVUlNPUl9QT1NJVElPTik7CiB9CiAKLS0gCjIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
