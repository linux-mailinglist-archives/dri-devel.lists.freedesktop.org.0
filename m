Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF924E56A6
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 00:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20366EBBC;
	Fri, 25 Oct 2019 22:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0089A6EBBB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 22:50:18 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w3so2502999pgt.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 15:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KxqkayFb7m9sYPELw0DxQ5VjRvj+WqO4uI8I+KYabjE=;
 b=CJSRBjgVzHsc3mJcWBYbCAwy9BpRMUzUx3CKF++OJRZHcHi2vBZUDgJqdp1tF7XzIV
 oDhBMry4LNOfHqlXRV5WVbh5tFPw9b4YzYXwJVFj/IcRwHFZJUvthgl+QbFrHd8ngdzo
 f748sxsB+zOJZ1JyH5IkrNm7E/wEVIgqPDf0+abDdANcv/6h72kIXhhretExiwqOHFfF
 HNN7UKkvI/6MZ/9TxPaPSw+7/FYZotMApi8O07+GpC0ajFGXGkZR5B1O/Bsh7TMnOWWa
 I1Sls2SkgxcRAzX0CCYlfwwO8VuJ3YQCf/q8K2RZF6lmJtgKW0QRrqSsLze6ttb2/kfO
 mYow==
X-Gm-Message-State: APjAAAXyZf0NpIOKr+CbsIMB8iohAjp8W2JDmfvD0AcI1cRLHJ9lJGFG
 DDE9sd2hSTM8liEX5Vb6k95xlQ==
X-Google-Smtp-Source: APXvYqwH7FDeikwYbqOx/o7f38x/ORIOox29XW0WwLYwBPb50atXz5l+ZpfB/8ub7NnMSoQQiqTbow==
X-Received: by 2002:a65:638a:: with SMTP id h10mr7136687pgv.388.1572043818363; 
 Fri, 25 Oct 2019 15:50:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 o15sm2758018pjs.14.2019.10.25.15.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 15:50:17 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 2/3] dma-buf: heaps: Allow adding specified non-default
 CMA heaps
Date: Fri, 25 Oct 2019 22:50:08 +0000
Message-Id: <20191025225009.50305-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191025225009.50305-1-john.stultz@linaro.org>
References: <20191025225009.50305-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KxqkayFb7m9sYPELw0DxQ5VjRvj+WqO4uI8I+KYabjE=;
 b=YPNNxVZOZJlLKs7oXdvUCzvzCrltQPL8eWMoKdZWWv6dR9YRavL7O8GUrDdJN+aF1c
 NONSin6KYmGXn/ghUVTQuPQPS7fDeC0To+Axtws+gmTPLAZH8XKDibrwFAtn9aXa44zn
 z3R6iQ02U7OFyhYvs8GNx7UWmkS60YLobBM9GP1y/oHOBiWjS0KRzPNBiXLalgKt0/lk
 luVuTeAece9hd7my2vsqWp2iOIEILuRyhxB675rOPv/o+UmDNg2pK5vP4bAZ5+L+q3Bu
 EBPnMKcpO1TROkAZXERNtRg70QdVQbrEdXao1+P4SsHD5z1hkzgeGU7RNdmqeG+6JL4B
 pVhQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sandeep Patil <sspatil@google.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 "Andrew F . Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Pratik Patel <pratikp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZWFybGllciB2ZXJzaW9ucyBvZiB0aGUgZG1hYnVmIENNQSBoZWFwLCB3ZSBhZGRlZCBhbGwg
Q01BCmFyZWFzIGFzIENNQSBoZWFwcy4gQW5kcmV3IG5vdGVkIHRoaXMgbWlnaHQgbm90IGJlIGRl
c2lyZWQsCmFuZCBzbyB3ZSBjaGFuZ2VkIHRoZSBjb2RlIHRvIG9ubHkgYWRkIHRoZSBkZWZhdWx0
IENNQSBhcmVhLgoKVGhpcyBwYXRjaCBleHRlbmRzIHRoZSBlYXJsaWVyIGVmZm9ydCBzbyB0aGF0
IGRldmljZXMgY2FuCnNwZWNpZml5IHdoaWNoIENNQSBhcmVhcyB0aGV5IHdhbnQgdG8gYWRkIGFz
IGRtYWJ1ZiBoZWFwcyB2aWEKRFQsIGFuZCB3ZSdsbCBvbmx5IGFkZCB0aG9zZS4KClRoaXMgYWxs
b3dzIG11bHRpcGxlIENNQSBhcmVhcyB0byBiZSBleHBvcnRlZCB2aWEgdGhlIGRtYWJ1ZgpoZWFw
cyBpbnRlcmZhY2UuCgpDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KQ2M6IE1h
cmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+CkNjOiBMYXVyYSBBYmJvdHQgPGxhYmJv
dHRAcmVkaGF0LmNvbT4KQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBs
aW5hcm8ub3JnPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6
IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+CkNjOiBQcmF0aWsgUGF0ZWwgPHByYXRp
a3BAY29kZWF1cm9yYS5vcmc+CkNjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5j
b20+CkNjOiBBbmRyZXcgRi4gRGF2aXMgPGFmZEB0aS5jb20+CkNjOiBDaGVuYm8gRmVuZyA8ZmVu
Z2NAZ29vZ2xlLmNvbT4KQ2M6IEFsaXN0YWlyIFN0cmFjaGFuIDxhc3RyYWNoYW5AZ29vZ2xlLmNv
bT4KQ2M6IFNhbmRlZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xlLmNvbT4KQ2M6IEhyaWR5YSBWYWxz
YXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgpDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcK
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBT
dHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2hlYXBz
L2NtYV9oZWFwLmMgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYv
aGVhcHMvY21hX2hlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jCmluZGV4
IDA2NDkyNmI1ZDczNS4uMGQ1MjMxYTFlNTYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYv
aGVhcHMvY21hX2hlYXAuYworKysgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hlYXAuYwpA
QCAtMTUsNiArMTUsOSBAQAogI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+CiAjaW5jbHVkZSA8bGlu
dXgvaGlnaG1lbS5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgorI2luY2x1ZGUgPGxpbnV4
L21vZF9kZXZpY2V0YWJsZS5oPgorI2luY2x1ZGUgPGxpbnV4L29mX3Jlc2VydmVkX21lbS5oPgor
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIu
aD4KICNpbmNsdWRlIDxsaW51eC9zY2F0dGVybGlzdC5oPgogI2luY2x1ZGUgPGxpbnV4L3NjaGVk
L3NpZ25hbC5oPgpAQCAtMTc0LDUgKzE3Nyw0MCBAQCBzdGF0aWMgaW50IGFkZF9kZWZhdWx0X2Nt
YV9oZWFwKHZvaWQpCiAJcmV0dXJuIHJldDsKIH0KIG1vZHVsZV9pbml0KGFkZF9kZWZhdWx0X2Nt
YV9oZWFwKTsKKworc3RhdGljIGludCBjbWFfaGVhcHNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKK3sKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25v
ZGU7CisJc3RydWN0IGNtYSAqY21hX2FyZWE7CisJaW50IHJldDsKKworCXJldCA9IG9mX3Jlc2Vy
dmVkX21lbV9kZXZpY2VfaW5pdF9ieV9pZHgoJnBkZXYtPmRldiwgbnAsIDApOworCWlmIChyZXQp
IHsKKwkJcHJfZXJyKCJFcnJvciAlcygpOiBvZl9yZXNlcnZlZF9tZW1fZGV2aWNlX2luaXRfYnlf
aWR4IGZhaWxlZCFcbiIsIF9fZnVuY19fKTsKKwkJcmV0dXJuIHJldDsKKwl9CisKKwljbWFfYXJl
YSA9IGRldl9nZXRfY21hX2FyZWEoJnBkZXYtPmRldik7CisJaWYgKGNtYV9hcmVhKQorCQlyZXQg
PSBfX2FkZF9jbWFfaGVhcChjbWFfYXJlYSwgTlVMTCk7CisKKwlyZXR1cm4gcmV0OworfQorCitz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBjbWFfaGVhcF9kdF9pZHNbXSA9IHsKKwl7
IC5jb21wYXRpYmxlID0gImRtYWJ1Zi1oZWFwLWNtYSIgfSwKKwl7fSwKK307CitNT0RVTEVfREVW
SUNFX1RBQkxFKG9mLCBjbWFfaGVhcF9kdF9pZHMpOworCitzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciBjbWFfaGVhcHNfZHJpdmVyID0geworCS5kcml2ZXIJPSB7CisJCS5uYW1lCQk9ICJD
TUEgSGVhcHMiLAorCQkub2ZfbWF0Y2hfdGFibGUJPSBjbWFfaGVhcF9kdF9pZHMsCisJfSwKKwku
cHJvYmUJPSBjbWFfaGVhcHNfcHJvYmUsCit9OworCittb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGNt
YV9oZWFwc19kcml2ZXIpOwogTU9EVUxFX0RFU0NSSVBUSU9OKCJETUEtQlVGIENNQSBIZWFwIik7
CiBNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
