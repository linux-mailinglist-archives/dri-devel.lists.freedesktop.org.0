Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC0910F492
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 02:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022106E042;
	Tue,  3 Dec 2019 01:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60E66E042
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 01:36:35 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id l4so747365pjt.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 17:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eyMX2jKq1sPFGtoRJAfpFto0SNDC6mF6mb3kZ39tKjo=;
 b=pzogdz6Yu2Sa/j8vaPos47bQJcBZfPaiMvWxdXXzI1UwilqbMt+/6Eu80aoN3INMvT
 9IeW91Hd5UC2SZ1P1b+jCUyRNPo7wSUORzLBD5nvY04/n34Iz0LuRHCrtsV0s1qjtEiz
 XGgIe8mynjxfZsclJjmQMgXrMaIb50KUjsrzZIQObL2EDcaCzDzBNuBRmjzGuWfhjzG8
 MJK0pkFpGcrIIPILKnJ14TagqnjvlW8hkHxAiocuJNSw24WYONqIowpKC+Jf7twr3CFe
 +8LK/4cVhSCrqvyFPAppl16IhrsjJupSJCyhtSbQtwHB7Pl7CL2uuksUWfHtjIEPmh3D
 h2eg==
X-Gm-Message-State: APjAAAUNyzEt8Yv3+z7wgzDVU9c6zr7mnMcUhalP27e7fEvLye4zPnTg
 rYwrUcCG7CGTsWHCzonMzM2QpLJmPtY=
X-Google-Smtp-Source: APXvYqwaGMHA5NbDfKUFoHH4ANQHr1Y1bjq723bn9RFW476GDxLJC3uYOtkZJGlgQEd1n7JCcbNepg==
X-Received: by 2002:a17:902:68:: with SMTP id 95mr2375780pla.117.1575336995095; 
 Mon, 02 Dec 2019 17:36:35 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r4sm581916pji.11.2019.12.02.17.36.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 02 Dec 2019 17:36:34 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] udmabuf: use cache_sgt_mapping option
Date: Mon,  2 Dec 2019 17:36:24 -0800
Message-Id: <20191203013627.85991-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eyMX2jKq1sPFGtoRJAfpFto0SNDC6mF6mb3kZ39tKjo=;
 b=EQ0wbwx9vwY2J+uurdI+PHBch3oyfTJsCq6Dt8lSeOJYdC4cSeAjfvsCBhHGPNQ91L
 1/9NpmuuASlHjrzI2PPM7o2sp05KlDnmd78lbQ9Ny/amY9uQSib1dCPmO8ZKzY5aLGHn
 rXnnIPLpffPYzUTiG/zNMv5sMZvIQ6Zaa3ZTw=
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 hch@lst.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdFTSBwcmltZSBoZWxwZXJzIGRvIGl0LCBzbyBzaG91bGQgd2UuIEl0J3MgYWxzbyBwb3Nz
aWJsZSB0byBtYWtlCml0IG9wdGlvbmFsIGxhdGVyLgoKU2lnbmVkLW9mZi1ieTogR3VyY2hldGFu
IFNpbmdoIDxndXJjaGV0YW5zaW5naEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9kbWEtYnVm
L3VkbWFidWYuYyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMg
Yi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCmluZGV4IDlkZTUzOWMxZGVmNC4uYmUxNWViNmIw
NTg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCisrKyBiL2RyaXZlcnMv
ZG1hLWJ1Zi91ZG1hYnVmLmMKQEAgLTk0LDEwICs5NCwxMSBAQCBzdGF0aWMgdm9pZCByZWxlYXNl
X3VkbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1ZikKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBk
bWFfYnVmX29wcyB1ZG1hYnVmX29wcyA9IHsKLQkubWFwX2RtYV9idWYJICA9IG1hcF91ZG1hYnVm
LAotCS51bm1hcF9kbWFfYnVmCSAgPSB1bm1hcF91ZG1hYnVmLAotCS5yZWxlYXNlCSAgPSByZWxl
YXNlX3VkbWFidWYsCi0JLm1tYXAJCSAgPSBtbWFwX3VkbWFidWYsCisJLmNhY2hlX3NndF9tYXBw
aW5nID0gdHJ1ZSwKKwkubWFwX2RtYV9idWYJICAgPSBtYXBfdWRtYWJ1ZiwKKwkudW5tYXBfZG1h
X2J1ZgkgICA9IHVubWFwX3VkbWFidWYsCisJLnJlbGVhc2UJICAgPSByZWxlYXNlX3VkbWFidWYs
CisJLm1tYXAJCSAgID0gbW1hcF91ZG1hYnVmLAogfTsKIAogI2RlZmluZSBTRUFMU19XQU5URUQg
KEZfU0VBTF9TSFJJTkspCi0tIAoyLjI0LjAuMzkzLmczNGRjMzQ4ZWFmLWdvb2cKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
