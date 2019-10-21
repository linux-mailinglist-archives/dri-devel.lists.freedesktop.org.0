Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E3DDEFB2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1752E6E11A;
	Mon, 21 Oct 2019 14:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC6E6E11A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:34:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p7so13621534wmp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W5H5qyGGsziM/i5CH5bmShvYIYxFUgq6AWdyID/nnnI=;
 b=grCc1EW54xo2bNo6xPpPHnXb1aqiDbbEpkPgn6cAHF8klvyY32Q3Js5iXswkVZZgsP
 aHf19R/PBCIhaUkS2emdOYdsLF8ztIfaZo3R7Zx/YYaklyVd1vzuTDFEd1FGtbmiuxBg
 Bq1dp6RGS6M11913g102RAmnUk2+nzmPQo/x1UDm8VKOdOnK2y5CjZoRlMcpPF/vXilL
 OSn1zUx9Rae8OIOivr2LSKTiNXgmgPluIVm/26J/NKNmmvVEcyGMpOTQVjAi1izaf1xe
 +CWF3n70xZB/TR2jN8VDgwzR8P2dxuEDRrvfDEySgdFZYPmf+bpSvunqI8eiG+3GA9oS
 SEXQ==
X-Gm-Message-State: APjAAAXzvN3KUOpQq9PMZkrZ0x0NroUq73DOZTGqACdFodUSncN+3WFL
 B/gzy7STmB59wW+vNiyU2I1601ou
X-Google-Smtp-Source: APXvYqxUDgecEBruDwIvLvTHhx82ZguGsnjS986ILGmbdOVIwc6Ei4A7xZssIylwXJtq3jrAD0w3Og==
X-Received: by 2002:a05:600c:1088:: with SMTP id
 e8mr20088814wmd.27.1571668494007; 
 Mon, 21 Oct 2019 07:34:54 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id u68sm18864529wmu.12.2019.10.21.07.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:34:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 05/13] drm/dp: Add drm_dp_alternate_scrambler_reset_cap()
 helper
Date: Mon, 21 Oct 2019 16:34:29 +0200
Message-Id: <20191021143437.1477719-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021143437.1477719-1-thierry.reding@gmail.com>
References: <20191021143437.1477719-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W5H5qyGGsziM/i5CH5bmShvYIYxFUgq6AWdyID/nnnI=;
 b=kFlA85SVcDXZov3Sb7FYc3pBhj5ZcKbsuGUVE8/9FYhuNzif/Jc1aUl5kaiTgpbeZC
 X8KyWPeNTJBMgS3OQAyWqRVmQfce66ErO2WPtbQTHN9Vf8Ul6HTxX8zwqAL+n4PEUMA8
 HaolGr8yKGikB6v5VRZFVA4uKxQC6pWbUX0XX/bjFTkrc6GScMZy3v9B57OBKwOLOQBc
 pSjyY4WaDYiop/HFhnxeYDQJDlXutqqwnTNXzPfr8wzgluTpahRR5+/NYP7apK3GyAkr
 OIsqNpGbnWtN9z8Oe8SKN7Y430EuvXlK3ldjm6tp8xDBKcz1D12O+1AYjAJpx5JVYPJX
 yZkg==
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
byBjaGVjayBpZiB0aGUgc2luayBzdXBwb3J0cyB0aGUgZURQIGFsdGVybmF0ZSBzY3JhbWJsZXIK
cmVzZXQgdmFsdWUgb2YgMHhmZmZlLgoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJl
ZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5j
b20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwgNyArKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Rw
X2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCmluZGV4IGJjMjc2YzgwYjky
Ny4uYjM0MDJjYjE4NmE0IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgK
KysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCkBAIC0xMjk0LDYgKzEyOTQsMTMgQEAg
ZHJtX2RwX2NoYW5uZWxfY29kaW5nX3N1cHBvcnRlZChjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVS
X0NBUF9TSVpFXSkKIAlyZXR1cm4gZHBjZFtEUF9NQUlOX0xJTktfQ0hBTk5FTF9DT0RJTkddICYg
RFBfQ0FQX0FOU0lfOEIxMEI7CiB9CiAKK3N0YXRpYyBpbmxpbmUgYm9vbAorZHJtX2RwX2FsdGVy
bmF0ZV9zY3JhbWJsZXJfcmVzZXRfY2FwKGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJ
WkVdKQoreworCXJldHVybiBkcGNkW0RQX0VEUF9DT05GSUdVUkFUSU9OX0NBUF0gJgorCQkJRFBf
QUxURVJOQVRFX1NDUkFNQkxFUl9SRVNFVF9DQVA7Cit9CisKIC8qCiAgKiBEaXNwbGF5UG9ydCBB
VVggY2hhbm5lbAogICovCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
