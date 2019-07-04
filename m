Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAC75F38D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E593C6E2B1;
	Thu,  4 Jul 2019 07:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279B66E25B;
 Thu,  4 Jul 2019 05:52:54 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id d4so4212874edr.13;
 Wed, 03 Jul 2019 22:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sk7x/uIvEdvnOhCPEBQK8xnGMTAhDlc8g18Tgsd50+s=;
 b=Y9PA3Kakn8FWLahgyX71ojV7LYUe3/YWPg3avP7CZ7nWzRoLTk4AjgCmWNU5Fgq1lJ
 68qxY1l53bHz9ZwlotW2esLX0Zqigy9Vdzgr9pNZ6SFFO66PHTSjyi62KJRSIuvQ1v3d
 hRS8eYyadqkAKyREapX0AUmikSQh/Jed7pneBp4RQx7vp9Zd5T+ZDRQGphc1TXWF8My0
 a3sByCdEpA4CSgxol2qI+xs1XSxDSlHDx8JnoONU7WMvyHUh0nmuJfe/QGRlFqYoJ6LK
 gYVgJqQlVXAqb3WROBm/e1nqPM/f/ac2ruRaKucMiajRJjaA1BAUVw6Lv2f2zji3yFYa
 Huig==
X-Gm-Message-State: APjAAAWOsV1r1NvesAqoBSCVBYW/1sZfsJ8tv8Q9MqDczM3LCiDktA3o
 QFixbmwDdInE+OEN3RptZuI=
X-Google-Smtp-Source: APXvYqwCKPS2hEek618wWEP0KFmsaYwMHuJ0lWVI6Mz4KIFr5ilCUyX+l2b0RP8EIu445RFt+d9oKw==
X-Received: by 2002:a17:906:edd7:: with SMTP id
 sb23mr28250772ejb.309.1562219572730; 
 Wed, 03 Jul 2019 22:52:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id j30sm1343532edb.8.2019.07.03.22.52.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 22:52:52 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [PATCH 4/7] drm/amd/powerplay: Zero initialize freq in
 smu_v11_0_get_current_clk_freq
Date: Wed,  3 Jul 2019 22:52:15 -0700
Message-Id: <20190704055217.45860-5-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704055217.45860-1-natechancellor@gmail.com>
References: <20190704055217.45860-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sk7x/uIvEdvnOhCPEBQK8xnGMTAhDlc8g18Tgsd50+s=;
 b=X31O77djkxsK14FGB/XNRtzgI/6Xi8+vcGgZzqR51BVRF9R51PjC4m7RTkRWKcpRVq
 oPNOSfHC1eU7T7y0WBDld+PMP6AJtu7YVdUufwqCvWNVJiQzSh82vqi8FwY6nr4ACp6i
 0MBcMyaocwVoW5Hl2mINO8yaxMGY3K/+XDt7GyXma1BG7pLVDvHvAjQeSX3FvSXBIWVZ
 RQX28ykaX5qfvfFJTYtHXVUD5etlX5vXudvbKTqeIxYUhDpfHDsjUwuF6tzv4m2MQvvI
 RzNt6/5acyN/+BA+HP+S43FWgIJYFUGFJNZxkjfCcoWKbu+ID32EBPX6qhOQWudpIosv
 kzCw==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y2xhbmcgd2FybnMgKHRyaW1tZWQgZm9yIGJyZXZpdHkpOgoKZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vcG93ZXJwbGF5L3NtdV92MTFfMC5jOjEwOTg6MTA6IHdhcm5pbmc6CnZhcmlhYmxl
ICdmcmVxJyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQgd2hlbmV2ZXIgJz86JyBjb25kaXRpb24gaXMg
ZmFsc2UKWy1Xc29tZXRpbWVzLXVuaW5pdGlhbGl6ZWRdCiAgICAgICAgICAgICAgICByZXQgPSAg
c211X2dldF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlKHNtdSwgY2xrX2lkLCAmZnJlcSk7CiAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KCklmIGdldF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlIGlzIGV2
ZXIgTlVMTCwgZnJlcSB3aWxsIGZhaWwgdG8gYmUKcHJvcGVybHkgaW5pdGlhbGl6ZWQuIFplcm8g
aW5pdGlhbGl6ZSBpdCB0byBhdm9pZCB1c2luZyB1bmluaXRpYWxpemVkCnN0YWNrIHZhbHVlcy4K
CnNtdV9nZXRfY3VycmVudF9jbGtfZnJlcV9ieV90YWJsZSBleHBhbmRzIHRvIGEgdGVybmFyeSBv
cGVyYXRvcgpjb25kaXRpb25hbCBvbiBzbXUtPmZ1bmNzLT5nZXRfY3VycmVudF9jbGtfZnJlcV9i
eV90YWJsZSBiZWluZyBub3QgTlVMTC4KV2hlbiB0aGlzIGlzIGZhbHNlLCBmcmVxIHdpbGwgYmUg
dW5pbml0aWFsaXplZC4gWmVybyBpbml0aWFsaXplIGZyZXEgdG8KYXZvaWQgdXNpbmcgcmFuZG9t
IHN0YWNrIHZhbHVlcyBpZiB0aGF0IGV2ZXIgaGFwcGVucy4KCkZpeGVzOiBlMzYxODI0OTBkZWMg
KCJkcm0vYW1kL3Bvd2VycGxheTogZml4IGRwbSBmcmVxIHVuaXQgZXJyb3IgKDEwS0h6IC0+IE1o
eikiKQpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vl
cy81ODUKU2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdt
YWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKaW5kZXggNjMyYTIwNTg3Yzhi
Li5hNmY4Y2Q2ZGY3ZjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3NtdV92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFf
MC5jCkBAIC0xMDg4LDcgKzEwODgsNyBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9nZXRfY3VycmVu
dF9jbGtfZnJlcShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCQkJICB1aW50MzJfdCAqdmFs
dWUpCiB7CiAJaW50IHJldCA9IDA7Ci0JdWludDMyX3QgZnJlcTsKKwl1aW50MzJfdCBmcmVxID0g
MDsKIAogCWlmIChjbGtfaWQgPj0gU01VX0NMS19DT1VOVCB8fCAhdmFsdWUpCiAJCXJldHVybiAt
RUlOVkFMOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
