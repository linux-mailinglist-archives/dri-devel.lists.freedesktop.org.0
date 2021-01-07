Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702232EE77B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 22:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0150D6E402;
	Thu,  7 Jan 2021 21:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5606E402
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 21:15:29 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id n10so5977831pgl.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 13:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gCsWuNpJqoaKmXUbqD2yoFjbhOP/NQNls4IpQYcF/Q=;
 b=K8BGJ9oHdqpLDSsv4ZzOKEHEpyQXmBiqo3CQDjAFOiubf8uMAXb8rE+2Q+8w+MuenT
 r39dpZHy1UjTwLvLcHtkgKqx7m1yH/VZCVvUsyblpu4gsHE8oyEh27knqvqkNx99hfd/
 OdLjIgReRKvwFliH9XDPaVNHEjCr8ivL1CuAOS5SsvSCJwjtqzf9bEeTilTgDDB91z1d
 d8gKjlz+Dsl9OtsTbJ+dMP1JwATb4Hb+DNbBTib+6EpAlAhzwgHklh5i6ggogkXvBu0w
 Sl0lvmy8kDpa3UVvGMnYPvuuD5pjaQCOY4j8xR9yncAL6VXY3VpNQLEDm0Rk5MWF1r7S
 80MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gCsWuNpJqoaKmXUbqD2yoFjbhOP/NQNls4IpQYcF/Q=;
 b=rVVvnvz0ANyTJTJ3hKvSJgeJkRIZfb3AdwuWKINDFWcPquqZU5hp/rGQ6embHaNIIE
 9o8LKhH+xdtIk1LDZd7ZjYXdFCp260oFzx/p46kqoJTnd5LQrTbP9LF/n/icvxkNwHd4
 Qnhatbrh0oRsvPOo/hPt9CmynATLAs4JpeHVVTybcCQ/oVxb58jEsMc9+zQEoMk4MUHU
 cADflpibHTb7K/CNejHcegW93WQ3IUBm/1vpDPoyULAkqkktAxUAANZHbBX2DhZflWzF
 J5j6BQiK3dFjSCve6htAHbr2rQs4iiczN2tBtOPHkBnd/Kz6vGrclzLTmnEVCpDeU4TU
 FWug==
X-Gm-Message-State: AOAM5328/73g9zf5kjd9wySoh7cR3PbCiEGN9M35aW5UtWYwMabj0Bo4
 CNzS+XwJIpq4jQ7oQ3hwGjF3xQ==
X-Google-Smtp-Source: ABdhPJw+uBkf603u8DBtRcPFLax4GUhUMXlfkuBYTBlYX9IqNd80YY3GhmwaHOU9hi8B00BuqmRrDQ==
X-Received: by 2002:a65:6249:: with SMTP id q9mr3744816pgv.82.1610054128730;
 Thu, 07 Jan 2021 13:15:28 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 b6sm6574055pfd.43.2021.01.07.13.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 13:15:27 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] dma-buf: system_heap: Make sure to return an error if we
 abort
Date: Thu,  7 Jan 2021 21:15:23 +0000
Message-Id: <20210107211525.75951-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Sandeep Patil <sspatil@google.com>, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgd2UgYWJvcnQgZnJvbSB0aGUgYWxsb2NhdGlvbiBkdWUgdG8gYSBmYXRhbF9zaWduYWxfcGVu
ZGluZygpLApiZSBzdXJlIHdlIHJlcG9ydCBhbiBlcnJvciBzbyBhbnkgcmV0dXJuIGNvZGUgcGF0
aHMgZG9uJ3QgdHJpcApvdmVyIHRoZSBmYWN0IHRoYXQgdGhlIGFsbG9jYXRpb24gZGlkbid0IHN1
Y2NlZWQuCgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IExp
YW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+CkNjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRA
a2VybmVsLm9yZz4KQ2M6IEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0YXJrZXlAYXJtLmNvbT4KQ2M6
IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgpDYzogU3VyZW4gQmFnaGRhc2Fy
eWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KQ2M6IFNhbmRlZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xl
LmNvbT4KQ2M6IERhbmllbCBNZW50eiA8ZGFuaWVsbWVudHpAZ29vZ2xlLmNvbT4KQ2M6IENocmlz
IEdvbGRzd29ydGh5IDxjZ29sZHN3b0Bjb2RlYXVyb3JhLm9yZz4KQ2M6IMOYcmphbiBFaWRlIDxv
cmphbi5laWRlQGFybS5jb20+CkNjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29t
PgpDYzogRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgpDYzogU2ltb24g
U2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgpDYzogSmFtZXMgSm9uZXMgPGpham9uZXNAbnZpZGlh
LmNvbT4KQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpTdWdnZXN0ZWQtYnk6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5i
QGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5h
cm8ub3JnPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jIHwgNCArKyst
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMgYi9kcml2ZXJzL2RtYS1i
dWYvaGVhcHMvc3lzdGVtX2hlYXAuYwppbmRleCAxN2UwZTlhNjhiYWYuLjQwNTM1MWFhZDJhOCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMKKysrIGIvZHJp
dmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMKQEAgLTM2Myw4ICszNjMsMTAgQEAgc3Rh
dGljIGludCBzeXN0ZW1faGVhcF9hbGxvY2F0ZShzdHJ1Y3QgZG1hX2hlYXAgKmhlYXAsCiAJCSAq
IEF2b2lkIHRyeWluZyB0byBhbGxvY2F0ZSBtZW1vcnkgaWYgdGhlIHByb2Nlc3MKIAkJICogaGFz
IGJlZW4ga2lsbGVkIGJ5IFNJR0tJTEwKIAkJICovCi0JCWlmIChmYXRhbF9zaWduYWxfcGVuZGlu
ZyhjdXJyZW50KSkKKwkJaWYgKGZhdGFsX3NpZ25hbF9wZW5kaW5nKGN1cnJlbnQpKSB7CisJCQly
ZXQgPSAtRUlOVFI7CiAJCQlnb3RvIGZyZWVfYnVmZmVyOworCQl9CiAKIAkJcGFnZSA9IGFsbG9j
X2xhcmdlc3RfYXZhaWxhYmxlKHNpemVfcmVtYWluaW5nLCBtYXhfb3JkZXIpOwogCQlpZiAoIXBh
Z2UpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
