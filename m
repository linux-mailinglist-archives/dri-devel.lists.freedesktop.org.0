Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BCB2A9770
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 15:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DD66E087;
	Fri,  6 Nov 2020 14:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498A26E087
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 14:10:06 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id q3so1386209edr.12
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sdU9FVbXUFeKUSNyXT/9YfsoqLhRNVxeFY6j5EMelX0=;
 b=tPSqULw2HmwfD133NWn5LUhyJuLcyMyUpYRTBT79dnkfDbc0rpGvNi/hstrstwnvEB
 UkSxHRQznPJghiEFa4WlaRSG+wsiSDfjt0ZnmvFky+PGfYQm9mJ3iKHOKvJFIIXrPdSY
 WcQAZH/2uICo7ZLBCa2X6MbODCyW+ySobid8fT2AEFlHp9Ns2zl75H45Xsw3C52kg8eD
 enPm8H4RyxBX57B3ODAE2mqgTrEWB59iPiJ1ndv0mlHsEVjbpZe+PCnvMZyTFu8CwLeT
 6bKeBlr3i78fsoN0WSB61rojU9tXKm/culqSY47zz8QyLgmGgMfMqys8NsXuQ3tT5GP3
 O67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sdU9FVbXUFeKUSNyXT/9YfsoqLhRNVxeFY6j5EMelX0=;
 b=nUzdxWbQXOsT12iIFE6jDuPxti9NQhYqH55DGLW9br10dGoJ8eamDADEk4p+Mr10yW
 99R7GrOWtiK+AhpHhn3iKu5j2tIbZPYcyYLnutzcsJwqWhtF2pI+jXriDlLW6fBUFksU
 LqfAfpjvuF60j4ngDNzrEXL1mY0+zbxO323awVXmE4p3tXNh+Hwn+fKve+3MYyHsN+RN
 P/JsuhUCHjScNJW6hxsq1SgkZfLS4nUzOJuvDwKofZbsUsBbB4kFYPJn07emqb8RLEr7
 VBdNYrVIrQGtvtGTjQoYcsg5wYck9UdWgzV/G6VEmEPLmwD/GJwTHkeIDowDkaYEuITu
 prlA==
X-Gm-Message-State: AOAM5308kPtdZcEnn/tUubb95FxGmmQ0cNlF0YOQR5ajOJZQsN5zGdgb
 eqFII8ZTZ6IMHNboGFZ5S68=
X-Google-Smtp-Source: ABdhPJz/PwJ+Ue8sOFeZzcbdDWt+aMUs8eP540r4tSCUhLbEmVreznzswNZ8grca8B6dP78uOI86jQ==
X-Received: by 2002:aa7:c792:: with SMTP id n18mr2138899eds.209.1604671804939; 
 Fri, 06 Nov 2020 06:10:04 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:498e:9cb1:92c7:4119])
 by smtp.gmail.com with ESMTPSA id l25sm1110200eds.65.2020.11.06.06.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 06:10:04 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: andy.lavr@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix missing NULL check in the new page pool
Date: Fri,  6 Nov 2020 15:10:03 +0100
Message-Id: <20201106141003.2535-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

VGhlIHBvb2wgcGFyYW1ldGVyIGNhbiBiZSBOVUxMIGlmIHdlIGZyZWUgdGhyb3VnaCB0aGUgc2hy
aW5rZXIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
cG9vbC5jCmluZGV4IDQ0ZWM0MWFhNzhkNi4uMWI5Njc4MGI0OTg5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
cG9vbC5jCkBAIC0xMzUsNyArMTM1LDcgQEAgc3RhdGljIHZvaWQgdHRtX3Bvb2xfZnJlZV9wYWdl
KHN0cnVjdCB0dG1fcG9vbCAqcG9vbCwgZW51bSB0dG1fY2FjaGluZyBjYWNoaW5nLAogCQlzZXRf
cGFnZXNfd2IocCwgMSA8PCBvcmRlcik7CiAjZW5kaWYKIAotCWlmICghcG9vbC0+dXNlX2RtYV9h
bGxvYykgeworCWlmICghcG9vbCB8fCAhcG9vbC0+dXNlX2RtYV9hbGxvYykgewogCQlfX2ZyZWVf
cGFnZXMocCwgb3JkZXIpOwogCQlyZXR1cm47CiAJfQotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
