Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD3CAF228
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 22:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718436E141;
	Tue, 10 Sep 2019 20:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669656E141
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 20:06:59 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id q21so12166678pfn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 13:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0QByh7nMUE4DnF1EZmnVCO0LesBewegKmGWKg2jdIyE=;
 b=rAPGzzWV5FHVxGwihyRn5Iwhy/NMcxGI7GHHTtMFmU4fR87M/oupij16Lg6HUgJfso
 oSn0lrPTCgI07DP6bBuqzqg675De30UCQFkkFnKougzDFdfLUq6K2nlTLZDLYCoKTHNo
 T+1UErPlIRf/g+IqDl/VjhYCtAFkVFOl7PNn0dNudwHeV2O4dDYzvFlUUv4up9mdZk72
 JltOyq8/hoTSkwfFk0OZy1qg4MccIeu48R9i6vEx/O32GZDhnQIQdRLjcv73oWmJlR/H
 DAO2MGjunxhig+oMFr1vym/PKPvq+Ufarg4edU8Wj7XVpriOkGNse3VPnRMyGUQUxp0u
 IcXg==
X-Gm-Message-State: APjAAAXBhFfk1IqZnCDtHWclaDTmwSqMz3jvqUPXKS7HEf/Emr9SIEhy
 yskow6vFJ+IpPzwOV2bmeTJpqmDPwlM=
X-Google-Smtp-Source: APXvYqwY8ZIVNVGdt/gxFNSdRhnyOwo46cUOwbhh5f13J3xXT4X/se8iTQ5/XLLxoCcy8JMm8lWmtg==
X-Received: by 2002:a63:1:: with SMTP id 1mr29256800pga.162.1568146018680;
 Tue, 10 Sep 2019 13:06:58 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id q20sm35751990pfg.85.2019.09.10.13.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2019 13:06:58 -0700 (PDT)
From: David Riley <davidriley@chromium.org>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH v3 1/2] drm/virtio: Rewrite virtio_gpu_queue_ctrl_buffer using
 fenced version.
Date: Tue, 10 Sep 2019 13:06:50 -0700
Message-Id: <20190910200651.118628-1-davidriley@chromium.org>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
In-Reply-To: <20190829212417.257397-1-davidriley@chromium.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0QByh7nMUE4DnF1EZmnVCO0LesBewegKmGWKg2jdIyE=;
 b=nTUelCMWT/OF5pwZR9T+jGu510zTnmwud9l5EN0tgRovfWW3EYCEcVjRSwfD8F+hPw
 yAIdumgV1m7JRyUG7aabeXsBuJzUH71TonbwfImsqF5M8kj+jUqR8e83DIwTd/uGBLma
 /lCZB6Hq4zwK53E1k9KIQDRF0+VKGvwzIwlyM=
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
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RmFjdG9yIGZ1bmN0aW9uIGluIHByZXBhcmF0aW9uIHRvIGdlbmVyYXRpbmcgc2NhdHRlcmxpc3Qg
cHJpb3IgdG8gbG9ja2luZy4KClNpZ25lZC1vZmYtYnk6IERhdmlkIFJpbGV5IDxkYXZpZHJpbGV5
QGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyB8
IDE5ICsrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV92cS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMKaW5kZXggOTgx
ZWUxNmUzZWU5Li5iZjVhNGE1MGIwMDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV92cS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5j
CkBAIC0yOTksMTcgKzI5OSw2IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9xdWV1ZV9jdHJsX2J1
ZmZlcl9sb2NrZWQoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKIAlyZXR1cm4gcmV0
OwogfQogCi1zdGF0aWMgaW50IHZpcnRpb19ncHVfcXVldWVfY3RybF9idWZmZXIoc3RydWN0IHZp
cnRpb19ncHVfZGV2aWNlICp2Z2RldiwKLQkJCQkJc3RydWN0IHZpcnRpb19ncHVfdmJ1ZmZlciAq
dmJ1ZikKLXsKLQlpbnQgcmM7Ci0KLQlzcGluX2xvY2soJnZnZGV2LT5jdHJscS5xbG9jayk7Ci0J
cmMgPSB2aXJ0aW9fZ3B1X3F1ZXVlX2N0cmxfYnVmZmVyX2xvY2tlZCh2Z2RldiwgdmJ1Zik7Ci0J
c3Bpbl91bmxvY2soJnZnZGV2LT5jdHJscS5xbG9jayk7Ci0JcmV0dXJuIHJjOwotfQotCiBzdGF0
aWMgaW50IHZpcnRpb19ncHVfcXVldWVfZmVuY2VkX2N0cmxfYnVmZmVyKHN0cnVjdCB2aXJ0aW9f
Z3B1X2RldmljZSAqdmdkZXYsCiAJCQkJCSAgICAgICBzdHJ1Y3QgdmlydGlvX2dwdV92YnVmZmVy
ICp2YnVmLAogCQkJCQkgICAgICAgc3RydWN0IHZpcnRpb19ncHVfY3RybF9oZHIgKmhkciwKQEAg
LTMzNSwxMyArMzI0LDE5IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9xdWV1ZV9mZW5jZWRfY3Ry
bF9idWZmZXIoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKIAkJZ290byBhZ2FpbjsK
IAl9CiAKLQlpZiAoZmVuY2UpCisJaWYgKGhkciAmJiBmZW5jZSkKIAkJdmlydGlvX2dwdV9mZW5j
ZV9lbWl0KHZnZGV2LCBoZHIsIGZlbmNlKTsKIAlyYyA9IHZpcnRpb19ncHVfcXVldWVfY3RybF9i
dWZmZXJfbG9ja2VkKHZnZGV2LCB2YnVmKTsKIAlzcGluX3VubG9jaygmdmdkZXYtPmN0cmxxLnFs
b2NrKTsKIAlyZXR1cm4gcmM7CiB9CiAKK3N0YXRpYyBpbnQgdmlydGlvX2dwdV9xdWV1ZV9jdHJs
X2J1ZmZlcihzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAorCQkJCQlzdHJ1Y3Qgdmly
dGlvX2dwdV92YnVmZmVyICp2YnVmKQoreworCXJldHVybiB2aXJ0aW9fZ3B1X3F1ZXVlX2ZlbmNl
ZF9jdHJsX2J1ZmZlcih2Z2RldiwgdmJ1ZiwgTlVMTCwgTlVMTCk7Cit9CisKIHN0YXRpYyBpbnQg
dmlydGlvX2dwdV9xdWV1ZV9jdXJzb3Ioc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwK
IAkJCQkgICBzdHJ1Y3QgdmlydGlvX2dwdV92YnVmZmVyICp2YnVmKQogewotLSAKMi4yMy4wLjE2
Mi5nMGI5ZmJiMzczNC1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
