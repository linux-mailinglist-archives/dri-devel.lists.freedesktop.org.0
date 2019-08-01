Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D527D355
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 04:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B886E32C;
	Thu,  1 Aug 2019 02:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B146E32C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 02:25:33 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id i2so31413816plt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 19:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RDvIT98WsFO1A5PQ+Bn6K/2QWwxhiilUGERAplpzShI=;
 b=R+wBVKCgasscXToa75B4XLI/nMmcyTr6MusOp3wx5NNQbxlUC733Sflp967OtqXZjD
 arUTS8oaCstehjwOpC50lFUVishPbWXcHOgEJTjrm2QLxCR342e0X86vFFMLbwxCU2rr
 qjWSOl5HYK7afNRZjE2xujFYmThi8javp+UIbHvBrhTpXj4vNKSQCOtGINoWYT9WAg/V
 4trpueL0L/Z5+NZlK1l7+sLydLq+PWXzCg3PaVUkau6ff4Uo7+agS0SkeFZ72FM/pE9o
 CoDvnZpkicmh/+dxSuvPVREwiemWka/KtsQwh1LoVbEmN1LXT1WaUEea2jiFXofDS7Z4
 3dyA==
X-Gm-Message-State: APjAAAWO5K6Kr0JY6+eb97L4pWiZDrpuM62O/hN7TIH0+AwFl9jnXtqA
 VSgogpbEhgJS+5Tn5Sbfs2B1SvSspX4=
X-Google-Smtp-Source: APXvYqyqIE6py30J7i0lRa2X7+ywni7gnB0WlXAB74Ovn29umnskJhTjJreAqc3Fya83sxLxQvx61Q==
X-Received: by 2002:a17:902:ab83:: with SMTP id
 f3mr123239894plr.122.1564626332843; 
 Wed, 31 Jul 2019 19:25:32 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id v184sm64911342pgd.34.2019.07.31.19.25.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 31 Jul 2019 19:25:32 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 5/6] udmabuf: separate out creating/destroying scatter-table
Date: Wed, 31 Jul 2019 19:25:16 -0700
Message-Id: <20190801022517.1903-6-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801022517.1903-1-gurchetansingh@chromium.org>
References: <20190801022517.1903-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RDvIT98WsFO1A5PQ+Bn6K/2QWwxhiilUGERAplpzShI=;
 b=hYQMYIcex1tChcdz+V+2cHB1R1TDYmvDvHaNhx5Wyp9PT21EY8p9RhsUXKWImDT1fo
 rPQMrxiwwptBMp0p6teXmzMNDHJ7F0xF2/TVo2f/JX/Pki5Sut0vHreHoMlqWE0SGMsS
 vubg6a0KuANLkCEOdfvIQz1kduBIHUJ3e6D0I=
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV1c2VkIGxhdGVyLgoKU2lnbmVkLW9mZi1ieTogR3VyY2hldGFuIFNpbmdoIDxndXJjaGV0YW5z
aW5naEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyB8IDI2ICsr
KysrKysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5j
IGIvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYwppbmRleCA0NzAwM2FiYmY0YzIuLjVmOGJlZTE4
NjJkZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYworKysgYi9kcml2ZXJz
L2RtYS1idWYvdWRtYWJ1Zi5jCkBAIC01NSwxMCArNTUsMTAgQEAgc3RhdGljIGludCBtbWFwX3Vk
bWFidWYoc3RydWN0IGRtYV9idWYgKmJ1Ziwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJ
cmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBzdHJ1Y3Qgc2dfdGFibGUgKm1hcF91ZG1hYnVmKHN0cnVj
dCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0LAotCQkJCSAgICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlv
biBkaXJlY3Rpb24pCitzdGF0aWMgc3RydWN0IHNnX3RhYmxlICpnZXRfc2dfdGFibGUoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgZG1hX2J1ZiAqYnVmLAorCQkJCSAgICAgZW51bSBkbWFfZGF0
YV9kaXJlY3Rpb24gZGlyZWN0aW9uKQogewotCXN0cnVjdCB1ZG1hYnVmICp1YnVmID0gYXQtPmRt
YWJ1Zi0+cHJpdjsKKwlzdHJ1Y3QgdWRtYWJ1ZiAqdWJ1ZiA9IGJ1Zi0+cHJpdjsKIAlzdHJ1Y3Qg
c2dfdGFibGUgKnNnOwogCWludCByZXQ7CiAKQEAgLTcwLDcgKzcwLDcgQEAgc3RhdGljIHN0cnVj
dCBzZ190YWJsZSAqbWFwX3VkbWFidWYoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXQsCiAJ
CQkJCUdGUF9LRVJORUwpOwogCWlmIChyZXQgPCAwKQogCQlnb3RvIGVycjsKLQlpZiAoIWRtYV9t
YXBfc2coYXQtPmRldiwgc2ctPnNnbCwgc2ctPm5lbnRzLCBkaXJlY3Rpb24pKSB7CisJaWYgKCFk
bWFfbWFwX3NnKGRldiwgc2ctPnNnbCwgc2ctPm5lbnRzLCBkaXJlY3Rpb24pKSB7CiAJCXJldCA9
IC1FSU5WQUw7CiAJCWdvdG8gZXJyOwogCX0KQEAgLTgyLDEzICs4MiwyNSBAQCBzdGF0aWMgc3Ry
dWN0IHNnX3RhYmxlICptYXBfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdCwK
IAlyZXR1cm4gRVJSX1BUUihyZXQpOwogfQogCitzdGF0aWMgdm9pZCBwdXRfc2dfdGFibGUoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgc2dfdGFibGUgKnNnLAorCQkJIGVudW0gZG1hX2RhdGFf
ZGlyZWN0aW9uIGRpcmVjdGlvbikKK3sKKwlkbWFfdW5tYXBfc2coZGV2LCBzZy0+c2dsLCBzZy0+
bmVudHMsIGRpcmVjdGlvbik7CisJc2dfZnJlZV90YWJsZShzZyk7CisJa2ZyZWUoc2cpOworfQor
CitzdGF0aWMgc3RydWN0IHNnX3RhYmxlICptYXBfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1Zl9hdHRh
Y2htZW50ICphdCwKKwkJCQkgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKQor
eworCXJldHVybiBnZXRfc2dfdGFibGUoYXQtPmRldiwgYXQtPmRtYWJ1ZiwgZGlyZWN0aW9uKTsK
K30KKwogc3RhdGljIHZvaWQgdW5tYXBfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50
ICphdCwKIAkJCSAgc3RydWN0IHNnX3RhYmxlICpzZywKIAkJCSAgZW51bSBkbWFfZGF0YV9kaXJl
Y3Rpb24gZGlyZWN0aW9uKQogewotCWRtYV91bm1hcF9zZyhhdC0+ZGV2LCBzZy0+c2dsLCBzZy0+
bmVudHMsIGRpcmVjdGlvbik7Ci0Jc2dfZnJlZV90YWJsZShzZyk7Ci0Ja2ZyZWUoc2cpOworCXJl
dHVybiBwdXRfc2dfdGFibGUoYXQtPmRldiwgc2csIGRpcmVjdGlvbik7CiB9CiAKIHN0YXRpYyB2
b2lkIHJlbGVhc2VfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1ZiAqYnVmKQotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
