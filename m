Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465C915D36C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C106EB4B;
	Fri, 14 Feb 2020 08:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8206E438;
 Fri, 14 Feb 2020 05:47:14 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id p8so8026689oth.10;
 Thu, 13 Feb 2020 21:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z2iYSLYDGYaGS4KoVmwUDz00gZO0krvmf/FASHSxL8U=;
 b=el9uNpAFUFfHliLH4Z4jbnVRGLrbY4XJCMgjQAInLFb1g6MHwSnoL4lr/XCT/aBRxs
 jLIQlIY+LYx+G42rSeanORto31kVNlfg/uPUpsgxttGWd6iYOeSkO5tBAwlvITAVKoXJ
 pRN7k3xbLOqI59sPcsS9sdYl3ayzl3Oi6DqQp2UHlBNfh2NLjRGuREQABww6ycZbvhik
 6vbFLztDxrrUUH+YLqGOdm6B8i8KKZeXtpov7S686swqmBqCR3Lsa89cNJGJtcoy3z69
 mdMThjyAHWlFfHjibcRWFgNaObxbgOjEBTpJGv+IwxgYaKuW/Sef/LqhoPdnXTVnjVkS
 jf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z2iYSLYDGYaGS4KoVmwUDz00gZO0krvmf/FASHSxL8U=;
 b=HVrQEAbxaFqBSkyR+qEaZyr6nHTtTG67+BBH2fcA2hCop3fEIZk8B0XyDrxBAZzqvl
 idthdsiIqg+lSff4fVGGnTwcyqHYG51oFmEnYzgT2gAiH+bBKdWuvm8DbaRevyof9yMd
 1meqxrr1F9coyqlixD2ELqg8vlo1PhYhAEMuAK/qXpxgdTz74T3/zWOJ3tOX2b89urdx
 te6aM4rXvBTloZ08IYFHMRzo1LcN9wEB5QnssBsj5Hv3RuLf5LNcMyqHhIWv4vXw9gRF
 7CPZfDT36VE4PfLgFqRkaIsGcrYSuKxZD2jHmo0tsBm8OC/tEHdPaNusk63BwYJKQbnV
 ciuQ==
X-Gm-Message-State: APjAAAUJXJMAmP5VR1ql/bt6J8GLGgSzWEdfiXMciWB6K837DmxrHjyX
 As+GytU9glL2LS+go/taMj8=
X-Google-Smtp-Source: APXvYqxP9k20s4Fu210nTsiauDqN0WjeicH2Gh47BzP033Qga6MrRzcCeBD+F7pQTE7qnBVo46LUqA==
X-Received: by 2002:a9d:7342:: with SMTP id l2mr974746otk.98.1581659233352;
 Thu, 13 Feb 2020 21:47:13 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id j5sm1631830otl.71.2020.02.13.21.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 21:47:12 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915: Cast remain to unsigned long in eb_relocate_vma
Date: Thu, 13 Feb 2020 22:47:07 -0700
Message-Id: <20200214054706.33870-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSByZWNlbnQgY29tbWl0IGluIGNsYW5nIGFkZGVkIC1XdGF1dG9sb2dpY2FsLWNvbXBhcmUgdG8g
LVdhbGwsIHdoaWNoIGlzCmVuYWJsZWQgZm9yIGk5MTUgYWZ0ZXIgLVd0YXV0b2xvZ2ljYWwtY29t
cGFyZSBpcyBkaXNhYmxlZCBmb3IgdGhlIHJlc3QKb2YgdGhlIGtlcm5lbCBzbyB3ZSBzZWUgdGhl
IGZvbGxvd2luZyB3YXJuaW5nIG9uIHg4Nl82NDoKCiAuLi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
ZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jOjE0MzM6MjI6IHdhcm5pbmc6CiByZXN1bHQgb2YgY29t
cGFyaXNvbiBvZiBjb25zdGFudCA1NzY0NjA3NTIzMDM0MjM0ODcgd2l0aCBleHByZXNzaW9uIG9m
CiB0eXBlICd1bnNpZ25lZCBpbnQnIGlzIGFsd2F5cyBmYWxzZQogWy1XdGF1dG9sb2dpY2FsLWNv
bnN0YW50LW91dC1vZi1yYW5nZS1jb21wYXJlXQogICAgICAgICBpZiAodW5saWtlbHkocmVtYWlu
ID4gTl9SRUxPQyhVTE9OR19NQVgpKSkKICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fl5+fn5+
fn5+fn5+fn5+fn5+fn5+fgogLi4vaW5jbHVkZS9saW51eC9jb21waWxlci5oOjc4OjQyOiBub3Rl
OiBleHBhbmRlZCBmcm9tIG1hY3JvICd1bmxpa2VseScKICMgZGVmaW5lIHVubGlrZWx5KHgpICAg
IF9fYnVpbHRpbl9leHBlY3QoISEoeCksIDApCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXgogMSB3YXJuaW5nIGdlbmVyYXRlZC4KCkl0IGlzIG5vdCB3cm9uZyBp
biB0aGUgY2FzZSB3aGVyZSBVTE9OR19NQVggPiBVSU5UX01BWCBidXQgaXQgZG9lcyBub3QKYWNj
b3VudCBmb3IgdGhlIGNhc2Ugd2hlcmUgdGhpcyBmaWxlIGlzIGJ1aWx0IGZvciAzMi1iaXQgeDg2
LCB3aGVyZQpVTE9OR19NQVggPT0gVUlOVF9NQVggYW5kIHRoaXMgY2hlY2sgaXMgc3RpbGwgcmVs
ZXZhbnQuCgpDYXN0IHJlbWFpbiB0byB1bnNpZ25lZCBsb25nLCB3aGljaCBrZWVwcyB0aGUgZ2Vu
ZXJhdGVkIGNvZGUgdGhlIHNhbWUKKHZlcmlmaWVkIHdpdGggY2xhbmctMTEgb24geDg2XzY0IGFu
ZCBHQ0MgOS4yLjAgb24geDg2IGFuZCB4ODZfNjQpIGFuZAp0aGUgd2FybmluZyBpcyBzaWxlbmNl
ZCBzbyB3ZSBjYW4gY2F0Y2ggbW9yZSBwb3RlbnRpYWwgaXNzdWVzIGluIHRoZQpmdXR1cmUuCgpM
aW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy83NzgK
U3VnZ2VzdGVkLWJ5OiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0PgpTaWduZWQt
b2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgotLS0K
ClJvdW5kIDMgOikKClByZXZpb3VzIHRocmVhZHMvcGF0Y2hlczoKCmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAxOTExMjMxOTUzMjEuNDEzMDUtMS1uYXRlY2hhbmNlbGxvckBnbWFpbC5j
b20vCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDAyMTEwNTA4MDguMjk0NjMtMS1u
YXRlY2hhbmNlbGxvckBnbWFpbC5jb20vCgogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX2V4ZWNidWZmZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9leGVjYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhl
Y2J1ZmZlci5jCmluZGV4IDYwYzk4NGUxMGM0YS4uNDdmNGQ4YWIyODFlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMKQEAgLTE0MzAsNyArMTQz
MCw3IEBAIHN0YXRpYyBpbnQgZWJfcmVsb2NhdGVfdm1hKHN0cnVjdCBpOTE1X2V4ZWNidWZmZXIg
KmViLCBzdHJ1Y3QgaTkxNV92bWEgKnZtYSkKIAogCXVyZWxvY3MgPSB1NjRfdG9fdXNlcl9wdHIo
ZW50cnktPnJlbG9jc19wdHIpOwogCXJlbWFpbiA9IGVudHJ5LT5yZWxvY2F0aW9uX2NvdW50Owot
CWlmICh1bmxpa2VseShyZW1haW4gPiBOX1JFTE9DKFVMT05HX01BWCkpKQorCWlmICh1bmxpa2Vs
eSgodW5zaWduZWQgbG9uZylyZW1haW4gPiBOX1JFTE9DKFVMT05HX01BWCkpKQogCQlyZXR1cm4g
LUVJTlZBTDsKIAogCS8qCi0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
