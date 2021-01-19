Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B450B2FC16F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 21:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B46789B11;
	Tue, 19 Jan 2021 20:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF04A89B11
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 20:45:12 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id n25so13735895pgb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 12:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gCsWuNpJqoaKmXUbqD2yoFjbhOP/NQNls4IpQYcF/Q=;
 b=BOomRctyxyEqp6sAYPFH+XcCAixJ9mdS3M4PS9Y1Hs6E8tPpzPoXFJ7GtEq0ZqmFX/
 bvhzR+TJgZVMqHH0HGzclpgi6jHb4tp/UtdkQysgd8hBfqUTrR17Y6FjSOhJWQ2F65jI
 r1SvnCIuGt5FEZtRnmIoXeTeKg9AnfvEJ8THUXkDay1yIct1VropoKQyZoua/576XOuD
 HIzDN4aSMbE4zlQfV44ERRSILhcgU3FKtUKbczAlrE/k83vWca3WhG+5a8lAddZX2g8Q
 Z5jTjcfBLXAGwxTXTJE5Rl1C1/t5U+IzOftefmhcvZTXwPrIAFUJ7fNQJ0hP5B+sqD5A
 ke+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gCsWuNpJqoaKmXUbqD2yoFjbhOP/NQNls4IpQYcF/Q=;
 b=onarAdtb1uPEf7fL4OasA7BYuLNEchQGWZpZy0Xy1pK4pZaHVpdl0HRtJWlgwPuYSQ
 gqri0Df1NAR2PrnkKuII+R0FoZ/G6PfZ+vMNirFZ21gMYX92seLlK8UyXYlcI0GIYOHy
 g0uhTkVJxZZ3E5ErdtxkW4mjxgziO5jq43zUQPKeeL5IDzvX9oWifjk6lwn8tmKN+yni
 mbAwzBmjaIDs9+61Z54Rs3mg7MGBiadVxFiULftEedmrBFmOB1rx7YMbPLq3F93LkT3A
 PsIlGcvzlue37x6iHiVAb4lG2C085FZ2c2D7SLhnCV9Sv5sr3qC04YtWyumll6Q5b2/n
 c95g==
X-Gm-Message-State: AOAM531nFaKQUe/IyzzCrGMxv6snNb3WqcMoaKEyLbR9CmwIznw0cYms
 PHGP/8BxH8zgUWRB19KjMqDnQg==
X-Google-Smtp-Source: ABdhPJzu4DX94t/qf1W5DtWbi8rKWJWe4eKwpUf4bPI5rvqgtbBrSK+Jq+SaY8+fAOZRUOFW+e520A==
X-Received: by 2002:a62:36c3:0:b029:1b9:e110:e126 with SMTP id
 d186-20020a6236c30000b02901b9e110e126mr3294942pfa.64.1611089112103; 
 Tue, 19 Jan 2021 12:45:12 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 md7sm4129838pjb.52.2021.01.19.12.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 12:45:11 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH 1/3] dma-buf: system_heap: Make sure to return an
 error if we abort
Date: Tue, 19 Jan 2021 20:45:06 +0000
Message-Id: <20210119204508.9256-1-john.stultz@linaro.org>
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
