Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912625F37F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97876E27C;
	Thu,  4 Jul 2019 07:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EE36E261;
 Thu,  4 Jul 2019 05:53:00 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w20so4252599edd.2;
 Wed, 03 Jul 2019 22:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zFilk8inpqvXAk/7VOioDwq9okahAA+X1lVqweKxXoM=;
 b=XFzbOrZklKngTdhpWmOGekiyy/dcnmRfJkIZfZNYh8/ZTrJzVz/v905ANzFgqxKeKY
 2bgWkFQN2PiAMlX0cIVzIy7IothpJIMag2mjB6/868OU+3dGTBQt3nlljbt7jrq5/Dy2
 bKEYkNavCckY5TnDcCA+PY5xaKsgQl9acHUpXwVe+kIzX4iousgq4rJsBHhQUbVcJdpR
 nUvrNy6FJSzRb0I2DRlPLHvWt7He8pTgCK3SSXNZO2Cuj9gng+0kybczX4ZdDYl2tS99
 0buNkqZ8hV+qytexhEhVAaP+opne+Qlrld92uGl3hUMDMnaLD53ss+Qwh7aQtSVXJ3jX
 GREQ==
X-Gm-Message-State: APjAAAXZCHDRqY9U5AOtSW9uDJYajBQFc7aBg431j+eOqvtmKMEsVoSl
 9TlL7gLzZ4VyLC95OwwJDqI=
X-Google-Smtp-Source: APXvYqxrxXJqrMJF2LmfwiNUZ/GEweI6LA1cX8k67/CpoxPX7tAyR0f2GpL/tEM3wB3rH5vK7MV5Yw==
X-Received: by 2002:a17:906:7c8d:: with SMTP id
 w13mr37316234ejo.264.1562219578844; 
 Wed, 03 Jul 2019 22:52:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id j30sm1343532edb.8.2019.07.03.22.52.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 22:52:58 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [PATCH 7/7] drm/amd/powerplay: Zero initialize current_rpm in
 vega20_get_fan_speed_percent
Date: Wed,  3 Jul 2019 22:52:18 -0700
Message-Id: <20190704055217.45860-8-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704055217.45860-1-natechancellor@gmail.com>
References: <20190704055217.45860-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zFilk8inpqvXAk/7VOioDwq9okahAA+X1lVqweKxXoM=;
 b=vCN1JcMzPAY7/Tw39bVm1VyNdiPyea2R/hAHBGg6shiqhSTCl0vi3Fl/k0P9ZPWtcD
 fN844ICxUa05ilb7O1NX/2dcpDqQL/jQ0gQfQllMkkIfELHz0yoH7vMgqdu5Wku6NOqC
 jf0Aa0bV61JmAVZywNGeLDvFspJm3OCxmk4cU+Cvv5Wx5H8F0nMiEWqrN3eRTdPaA+gT
 Pf1ZLivIL5jjW+ZwA0LAjBQW6Ck4+zb7miSThxstmVBFe3dDr6kNEoN6LAsmF7OTbEll
 79ujDc0k9FWhs9XDHg6DgYsXkvTrF49NWoNduURhAkLkzNhyFtLfpU0QTbrqWMuOLcxC
 OjtQ==
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
bWRncHUvLi4vcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYzozMDIzOjg6IHdhcm5pbmc6CnZhcmlhYmxl
ICdjdXJyZW50X3JwbScgaXMgdXNlZCB1bmluaXRpYWxpemVkIHdoZW5ldmVyICc/OicgY29uZGl0
aW9uIGlzCmZhbHNlIFstV3NvbWV0aW1lcy11bmluaXRpYWxpemVkXQogICAgICAgIHJldCA9IHNt
dV9nZXRfY3VycmVudF9ycG0oc211LCAmY3VycmVudF9ycG0pOwogICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpzbXVfZ2V0X2N1cnJlbnRfcnBtIGV4
cGFuZHMgdG8gYSB0ZXJuYXJ5IG9wZXJhdG9yIGNvbmRpdGlvbmFsIG9uCnNtdS0+ZnVuY3MtPmdl
dF9jdXJyZW50X3JwbSBiZWluZyBub3QgTlVMTC4gV2hlbiB0aGlzIGlzIGZhbHNlLApjdXJyZW50
X3JwbSB3aWxsIGJlIHVuaW5pdGlhbGl6ZWQuIFplcm8gaW5pdGlhbGl6ZSBjdXJyZW50X3JwbSB0
bwphdm9pZCB1c2luZyByYW5kb20gc3RhY2sgdmFsdWVzIGlmIHRoYXQgZXZlciBoYXBwZW5zLgoK
Rml4ZXM6IGVlMGRiODIwMjdlZSAoImRybS9hbWQvcG93ZXJwbGF5OiBtb3ZlIFBQVGFibGVfdCB1
c2VzIGludG8gYXNpYyBsZXZlbCIpCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0
TGludXgvbGludXgvaXNzdWVzLzU4OApTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8
bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3ZlZ2EyMF9wcHQuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3Bw
dC5jCmluZGV4IGU2MmRkNjkxOWIyNC4uZTM3YjM5OTg3NTg3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC0zMDE2LDggKzMwMTYsNyBAQCBzdGF0aWMg
aW50IHZlZ2EyMF9nZXRfZmFuX3NwZWVkX3BlcmNlbnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
CiAJCQkJCXVpbnQzMl90ICpzcGVlZCkKIHsKIAlpbnQgcmV0ID0gMDsKLQl1aW50MzJfdCBwZXJj
ZW50ID0gMDsKLQl1aW50MzJfdCBjdXJyZW50X3JwbTsKKwl1aW50MzJfdCBjdXJyZW50X3JwbSA9
IDAsIHBlcmNlbnQgPSAwOwogCVBQVGFibGVfdCAqcHB0YWJsZSA9IHNtdS0+c211X3RhYmxlLmRy
aXZlcl9wcHRhYmxlOwogCiAJcmV0ID0gc211X2dldF9jdXJyZW50X3JwbShzbXUsICZjdXJyZW50
X3JwbSk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
