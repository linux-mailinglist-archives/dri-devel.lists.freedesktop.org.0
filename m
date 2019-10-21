Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A337DDEFB3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5251E6E11E;
	Mon, 21 Oct 2019 14:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F9B6E11A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:34:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 3so13066671wmi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WL8rjnEQq3AKtO0OuAJyWbWJ+TqdvseXel9igOT1T8c=;
 b=R5zJF1rq6KC7aYDWlMzRx/a0kisGNLCHE6kAv/zu5HTsKgls3WhskRpFKoPDSyuWNY
 YThKmYzKFqV9A5y4Nlqw6j4t1169RP0dpYatYrkwdx7X8mnj9BgTdDrIOALgHibDCxS4
 rQ1g7tb5ehhK2+/7GzJiekMNEH0Zf4cG7e90Km7DDe+65ffAXHawVXmpLzyvwS0TD1Ji
 KdifPokbnsghpLZIFojNIMkfpWPsen2TPs1mrV9qUdXnEB90Pnux4KIArpeenoS4K+uc
 pVdOqV6x8NwlkbsLXxi+KMjltnnYQY40srhmsc4zvfye4/36ky8qsQLIDifjljBADrkO
 afBg==
X-Gm-Message-State: APjAAAVHsDpcqghjEMf5EdJ+mXZlcy+KWCaLDFvbVf4zRBwNYkDuX8ih
 AqWRfAqPasgNNut5m90GtKrpn/lw
X-Google-Smtp-Source: APXvYqxNdjp8P4SQ/fYf6Ic4SF9Sj4BL4b2ocdZ0VaSFNdjQ8TIJyOH6rj9SSvt9hoNq4E2Ar1rvDA==
X-Received: by 2002:a05:600c:294b:: with SMTP id
 n11mr3670596wmd.70.1571668491524; 
 Mon, 21 Oct 2019 07:34:51 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id 26sm2562906wmf.20.2019.10.21.07.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:34:49 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 04/13] drm/dp: Add drm_dp_channel_coding_supported() helper
Date: Mon, 21 Oct 2019 16:34:28 +0200
Message-Id: <20191021143437.1477719-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021143437.1477719-1-thierry.reding@gmail.com>
References: <20191021143437.1477719-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WL8rjnEQq3AKtO0OuAJyWbWJ+TqdvseXel9igOT1T8c=;
 b=PK+6gNF2iJKSik8OPHUngYM+G+hu1qONFnDgnSni/1WH/tqsHFwLYbFrtIgvbGUCAw
 sp0iE2rnxak56F4q/kknFmDUVtpanRONdtERtOrvBFddZDcBX6IS5559KCYRKlNo0Qm/
 R++g5VNVDZ6aLqIcuGnRtuk6WqhNCdAQkOtO7QUV6trTQQrtYdzXkUIv7Y14trl8gXIA
 7DoY6el/RTei2waT8CGr1IpSgYLlSHvGuDmMezbhpollWjhyAtWxySczN0PpEp3UdQrm
 mdPBeO8wAMVUL6nxSQk4vkNds1aljzOxq8KcoMHfKpOlYlag75rYi5xnlflOr1BfqYXF
 NvbA==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkFkZCBhIGhlbHBlciB0
byBjaGVjayB3aGV0aGVyIHRoZSBzaW5rIHN1cHBvcnRzIEFOU0kgOEIvMTBCIGNoYW5uZWwKY29k
aW5nIGNhcGFiaWxpdHkgYXMgc3BlY2lmaWVkIGluIEFOU0kgWDMuMjMwLTE5OTQsIGNsYXVzZSAx
MS4KClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGluY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaCB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUv
ZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCAxMTc5ZDNmMmJhN2MuLmJjMjc2YzgwYjkyNyAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2Ry
bV9kcF9oZWxwZXIuaApAQCAtMTM3LDYgKzEzNyw3IEBACiAjIGRlZmluZSBEUF9ERVRBSUxFRF9D
QVBfSU5GT19BVkFJTEFCTEUJICAgICgxIDw8IDQpIC8qIERQSSAqLwogCiAjZGVmaW5lIERQX01B
SU5fTElOS19DSEFOTkVMX0NPRElORyAgICAgICAgIDB4MDA2CisjIGRlZmluZSBEUF9DQVBfQU5T
SV84QjEwQgkJICAgICgxIDw8IDApCiAKICNkZWZpbmUgRFBfRE9XTl9TVFJFQU1fUE9SVF9DT1VO
VAkgICAgMHgwMDcKICMgZGVmaW5lIERQX1BPUlRfQ09VTlRfTUFTSwkJICAgIDB4MGYKQEAgLTEy
ODcsNiArMTI4OCwxMiBAQCBkcm1fZHBfc2lua19zdXBwb3J0c19mZWMoY29uc3QgdTggZmVjX2Nh
cGFibGUpCiAJcmV0dXJuIGZlY19jYXBhYmxlICYgRFBfRkVDX0NBUEFCTEU7CiB9CiAKK3N0YXRp
YyBpbmxpbmUgYm9vbAorZHJtX2RwX2NoYW5uZWxfY29kaW5nX3N1cHBvcnRlZChjb25zdCB1OCBk
cGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKK3sKKwlyZXR1cm4gZHBjZFtEUF9NQUlOX0xJTktf
Q0hBTk5FTF9DT0RJTkddICYgRFBfQ0FQX0FOU0lfOEIxMEI7Cit9CisKIC8qCiAgKiBEaXNwbGF5
UG9ydCBBVVggY2hhbm5lbAogICovCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
