Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF531089BA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6174889458;
	Mon, 25 Nov 2019 08:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405416E0E6;
 Sat, 23 Nov 2019 19:24:18 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id m15so9156688otq.7;
 Sat, 23 Nov 2019 11:24:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jsgedYWGcDm2gsEfcO7YvCurfXqqqHvXcUgzb0SkXvE=;
 b=iBVYVWJGHm1oTXRXNMY7fLf7OUWACqJUN1m8b0X7ugmIFiMPwbnK1bUxngyXVIv+xh
 Sh/BMuOpeFri4rbsp3bXVJQ1PIVpRVj4WIRjRkC5y3kvus62BJMjxuU9KpXOWIVvwFvq
 NeFfsq12RZYDidbmgNigZmW8goKb1HEng646A+GqZ0k707AZWZk2n11DAH611Kb+PVbj
 1cANRdsaS+vmbFXg8HM14Hshqo6V9jWkSqgO/x7bUv7qCqQvbHc1M0wc0D2BgfPQ9eJT
 zKa1FPD8fyzWKUqhPVnK5cc+pKNj4gKduBZbFzzbH9nkD2aitdcCqoOzAEe07U32+er1
 ikSQ==
X-Gm-Message-State: APjAAAV0Zs/s/EsUERqCjOvXFUykpPZ0erT4cLLB3gXAtNnl1Za1IFPX
 yba2O+HgrG5fO3IOZxu4uNU=
X-Google-Smtp-Source: APXvYqx1fpWBPu6g4gMwvZ8c8rzxDBf/2LNZhYGwrIsO/l49CfLoBbqhpoW6unLQv+Bq31U044WiOA==
X-Received: by 2002:a9d:37cb:: with SMTP id x69mr14555138otb.90.1574537057333; 
 Sat, 23 Nov 2019 11:24:17 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::7])
 by smtp.gmail.com with ESMTPSA id i12sm549134ota.10.2019.11.23.11.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2019 11:24:16 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>
Subject: [PATCH] drm/amdgpu: Ensure ret is always initialized when using
 SOC15_WAIT_ON_RREG
Date: Sat, 23 Nov 2019 12:23:36 -0700
Message-Id: <20191123192336.11678-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jsgedYWGcDm2gsEfcO7YvCurfXqqqHvXcUgzb0SkXvE=;
 b=DhKMGXayoU1zJxSIN7PkHAQmyyS8DnDHS7/rwmIF0HY9CQKJILJSswS3cBOGUI5NDc
 9lhNTEM+kKggalT3TCnneA5sSEwHd64La89Ae5uykGkOwYJE3I7R1TFu6WdeDr1DNMaT
 fgn+8778RSBtUsx0IKwlxFUbHomEhtxV27VE5J+/MnPm7ydJ+SUiHn+3xpqxSmWvTG1u
 ONFp8keGdHAQ3U8sUG9c36yNc3uAur0l+tLT3dOPUpGgQbRZRPmWLcmGNARcriPrAh1I
 5jQYTtmoVWAqJ5poW41jeLvrqUMxApWUUAJGzUI81gNAUaZQTiKyWv9350ti8vjQaUgv
 U+jA==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, amd-gfx@lists.freedesktop.org,
 Nathan Chancellor <natechancellor@gmail.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IGIwZjNjZDMxOTFjZCAoImRybS9hbWRncHU6IHJlbW92ZSB1bm5lY2Vzc2FyeSBKUEVH
Mi4wIGNvZGUgZnJvbQpWQ04yLjAiKSBpbnRyb2R1Y2VkIGEgbmV3IGNsYW5nIHdhcm5pbmcgaW4g
dGhlIHZjbl92Ml8wX3N0b3AgZnVuY3Rpb246CgouLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92Y25fdjJfMC5jOjEwODI6Mjogd2FybmluZzogdmFyaWFibGUgJ3InCmlzIHVzZWQgdW5pbml0
aWFsaXplZCB3aGVuZXZlciAnd2hpbGUnIGxvb3AgZXhpdHMgYmVjYXVzZSBpdHMgY29uZGl0aW9u
CmlzIGZhbHNlIFstV3NvbWV0aW1lcy11bmluaXRpYWxpemVkXQogICAgICAgIFNPQzE1X1dBSVRf
T05fUlJFRyhWQ04sIDAsIG1tVVZEX1NUQVRVUywgVVZEX1NUQVRVU19fSURMRSwgMHg3LCByKTsK
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KLi4vZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vYW1kZ3B1
L3NvYzE1X2NvbW1vbi5oOjU1OjEwOiBub3RlOgpleHBhbmRlZCBmcm9tIG1hY3JvICdTT0MxNV9X
QUlUX09OX1JSRUcnCiAgICAgICAgICAgICAgICB3aGlsZSAoKHRtcF8gJiAobWFzaykpICE9IChl
eHBlY3RlZF92YWx1ZSkpIHsgICBcCiAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KLi4vZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YyXzAuYzoxMDgzOjY6IG5vdGU6IHVuaW5pdGlhbGl6ZWQgdXNlCm9jY3VycyBoZXJlCiAgICAg
ICAgaWYgKHIpCiAgICAgICAgICAgIF4KLi4vZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YyXzAuYzoxMDgyOjI6IG5vdGU6IHJlbW92ZSB0aGUKY29uZGl0aW9uIGlmIGl0IGlzIGFsd2F5
cyB0cnVlCiAgICAgICAgU09DMTVfV0FJVF9PTl9SUkVHKFZDTiwgMCwgbW1VVkRfU1RBVFVTLCBV
VkRfU1RBVFVTX19JRExFLCAweDcsIHIpOwogICAgICAgIF4KLi4vZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vYW1kZ3B1L3NvYzE1X2NvbW1vbi5oOjU1OjEwOiBub3RlOgpleHBhbmRlZCBm
cm9tIG1hY3JvICdTT0MxNV9XQUlUX09OX1JSRUcnCiAgICAgICAgICAgICAgICB3aGlsZSAoKHRt
cF8gJiAobWFzaykpICE9IChleHBlY3RlZF92YWx1ZSkpIHsgICBcCiAgICAgICAgICAgICAgICAg
ICAgICAgXgouLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jOjEwNzI6Nzog
bm90ZTogaW5pdGlhbGl6ZSB0aGUKdmFyaWFibGUgJ3InIHRvIHNpbGVuY2UgdGhpcyB3YXJuaW5n
CiAgICAgICAgaW50IHI7CiAgICAgICAgICAgICBeCiAgICAgICAgICAgICAgPSAwCjEgd2Fybmlu
ZyBnZW5lcmF0ZWQuCgpUbyBwcmV2ZW50IHdhcm5pbmdzIGxpa2UgdGhpcyBmcm9tIGhhcHBlbmlu
ZyBpbiB0aGUgZnV0dXJlLCBtYWtlIHRoZQpTT0MxNV9XQUlUX09OX1JSRUcgbWFjcm8gaW5pdGlh
bGl6ZSBpdHMgcmV0IHZhcmlhYmxlIGJlZm9yZSB0aGUgd2hpbGUKbG9vcCB0aGF0IGNhbiB0aW1l
IG91dC4gVGhpcyBtYWNybydzIHJldHVybiB2YWx1ZSBpcyBhbHdheXMgY2hlY2tlZCBzbwppdCBz
aG91bGQgc2V0IHJldCBpbiBib3RoIHRoZSBzdWNjZXNzIGFuZCBmYWlsIHBhdGguCgpMaW5rOiBo
dHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy83NzYKU2lnbmVk
LW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNV9jb21tb24uaCB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTVfY29tbW9uLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2Mx
NV9jb21tb24uaAppbmRleCA4MzlmMTg2ZTExODIuLjE5ZTg3MGM3OTg5NiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTVfY29tbW9uLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTVfY29tbW9uLmgKQEAgLTUyLDYgKzUyLDcgQEAKIAkJdWlu
dDMyX3Qgb2xkXyA9IDA7CVwKIAkJdWludDMyX3QgdG1wXyA9IFJSRUczMihhZGV2LT5yZWdfb2Zm
c2V0W2lwIyNfSFdJUF1baW5zdF1bcmVnIyNfQkFTRV9JRFhdICsgcmVnKTsgXAogCQl1aW50MzJf
dCBsb29wID0gYWRldi0+dXNlY190aW1lb3V0OwkJXAorCQlyZXQgPSAwOwkJCQkJXAogCQl3aGls
ZSAoKHRtcF8gJiAobWFzaykpICE9IChleHBlY3RlZF92YWx1ZSkpIHsJXAogCQkJaWYgKG9sZF8g
IT0gdG1wXykgewkJCVwKIAkJCQlsb29wID0gYWRldi0+dXNlY190aW1lb3V0OwlcCi0tIAoyLjI0
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
