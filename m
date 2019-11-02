Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED43ED017
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 18:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B426E321;
	Sat,  2 Nov 2019 17:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B216E321;
 Sat,  2 Nov 2019 17:56:46 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 11so12571220wmk.0;
 Sat, 02 Nov 2019 10:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B2PT8OgwUzPeHw6hJgNkyoN6vsJ1kDG8Ap5UUKvhze0=;
 b=H+hg+36TN9Jhyw0HFbzG7+ZTfqy6isEH/lBhi4k4OLmaBYCfvcU5a2SSzuNXE3OJ+A
 trCZ7KNFuxojo8LLWjhCzrza83sooXN+HQ0Zz2So00efroWaVg1yDj0a3d9as4l6xPe5
 0bIJLOGL3dMAR3l8VRkQ58hfEIc6LRKSqDdL+qCwszaWcwc00Bjdyu33m3y7eA/zeqSx
 h4LNrLzA9NNefmT2Yb4Qs8ScUTWzUrekuu7DkVHa4zKqVVyY2NcmQiVNkc2u6TniFgYg
 tR6/7Olo5aumn2uge2M4sWl+ArvpoCQvDSj9zb1HhzjaStsLYvqQtPKedtn7c8Xg11iT
 X0Cg==
X-Gm-Message-State: APjAAAVfGF2wcW31Ha/AQ1msdngBCZOVpHTdKJGI/HgcaQ23MLdevP0Z
 TbQzJ8PfezGaHrVsTCt6f5gCjWRz
X-Google-Smtp-Source: APXvYqwh0vcSVJl/llQBGAobzeyZMsr7O0KniFZ1e9AEUl48sSDcCxY9VqTZMS3MRW5xlWyEDtHt4A==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr14933173wmf.85.1572717404745; 
 Sat, 02 Nov 2019 10:56:44 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id t5sm673642wro.76.2019.11.02.10.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2019 10:56:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 2/9] iommu: Add dummy dev_iommu_fwspec_get() helper
Date: Sat,  2 Nov 2019 18:56:30 +0100
Message-Id: <20191102175637.3065-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B2PT8OgwUzPeHw6hJgNkyoN6vsJ1kDG8Ap5UUKvhze0=;
 b=UoJ1t+XNs6ajs9GVONSz3qXRw34jZ58PHRGKTpcmzpZuD3Rldp27aTujMwoeMc636j
 6eYYSls+GuGPc4z5GkVaQO3S6Uj+JAk1AJNbZM+TWhAk/SsBEScS4O2aTPto/521WH5j
 25s3jNzMOxDZqwDquoQmQ7o9fgs8hKKS+unmnXs8R1E+5dACuL4NtIdc/0COAUc7Rjqq
 LnNZKJ08GAL1/1WZG7VIg5Qn81kVdFOBLfgx6IJp3cX4HP9ICsFdtjrlufZQ8KJZaOSX
 6m5/eagAAZeFQEoHvsGgoUTWm289Fztk2pB7yQ0B0FZEYFg3jod1/YAb+ET6nm25SdMk
 /SzA==
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoaXMgZHVtbXkgaW1w
bGVtZW50YXRpb24gaXMgdXNlZnVsIHRvIGF2b2lkIGEgZGVwZW5kZW5jeSBvbiB0aGUKSU9NTVVf
QVBJIEtjb25maWcgc3ltYm9sIGluIGRyaXZlcnMgdGhhdCBjYW4gb3B0aW9uYWxseSB1c2UgdGhl
IElPTU1VCkFQSS4KCkluIG9yZGVyIHRvIGZ1bGx5IHVzZSB0aGlzLCBhbHNvIG1vdmUgdGhlIHN0
cnVjdCBpb21tdV9md3NwZWMgZGVmaW5pdGlvbgpvdXQgb2YgdGhlIElPTU1VX0FQSSBwcm90ZWN0
ZWQgcmVnaW9uLgoKU3VnZ2VzdGVkLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsu
Y28udWs+ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+
Ci0tLQogaW5jbHVkZS9saW51eC9pb21tdS5oIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDIx
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaW9tbXUuaCBiL2luY2x1
ZGUvbGludXgvaW9tbXUuaAppbmRleCA3YmYwMzhiMzcxYjguLmIwOTJlNzNiMmM4NiAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9saW51eC9pb21tdS5oCisrKyBiL2luY2x1ZGUvbGludXgvaW9tbXUuaApA
QCAtMTkwLDYgKzE5MCwyNyBAQCBzdHJ1Y3QgaW9tbXVfc3ZhX29wcyB7CiAJaW9tbXVfbW1fZXhp
dF9oYW5kbGVyX3QgbW1fZXhpdDsKIH07CiAKKy8qKgorICogc3RydWN0IGlvbW11X2Z3c3BlYyAt
IHBlci1kZXZpY2UgSU9NTVUgaW5zdGFuY2UgZGF0YQorICogQG9wczogb3BzIGZvciB0aGlzIGRl
dmljZSdzIElPTU1VCisgKiBAaW9tbXVfZndub2RlOiBmaXJtd2FyZSBoYW5kbGUgZm9yIHRoaXMg
ZGV2aWNlJ3MgSU9NTVUKKyAqIEBpb21tdV9wcml2OiBJT01NVSBkcml2ZXIgcHJpdmF0ZSBkYXRh
IGZvciB0aGlzIGRldmljZQorICogQGZsYWdzOiBJT01NVSBmbGFncyBhc3NvY2lhdGVkIHdpdGgg
dGhpcyBkZXZpY2UKKyAqIEBudW1faWRzOiBudW1iZXIgb2YgYXNzb2NpYXRlZCBkZXZpY2UgSURz
CisgKiBAaWRzOiBJRHMgd2hpY2ggdGhpcyBkZXZpY2UgbWF5IHByZXNlbnQgdG8gdGhlIElPTU1V
CisgKi8KK3N0cnVjdCBpb21tdV9md3NwZWMgeworCWNvbnN0IHN0cnVjdCBpb21tdV9vcHMJKm9w
czsKKwlzdHJ1Y3QgZndub2RlX2hhbmRsZQkqaW9tbXVfZndub2RlOworCXZvaWQJCQkqaW9tbXVf
cHJpdjsKKwl1MzIJCQlmbGFnczsKKwl1bnNpZ25lZCBpbnQJCW51bV9pZHM7CisJdTMyCQkJaWRz
WzFdOworfTsKKworLyogQVRTIGlzIHN1cHBvcnRlZCAqLworI2RlZmluZSBJT01NVV9GV1NQRUNf
UENJX1JDX0FUUwkJCSgxIDw8IDApCisKICNpZmRlZiBDT05GSUdfSU9NTVVfQVBJCiAKIC8qKgpA
QCAtNTY1LDI3ICs1ODYsNiBAQCBleHRlcm4gc3RydWN0IGlvbW11X2dyb3VwICpnZW5lcmljX2Rl
dmljZV9ncm91cChzdHJ1Y3QgZGV2aWNlICpkZXYpOwogLyogRlNMLU1DIGRldmljZSBncm91cGlu
ZyBmdW5jdGlvbiAqLwogc3RydWN0IGlvbW11X2dyb3VwICpmc2xfbWNfZGV2aWNlX2dyb3VwKHN0
cnVjdCBkZXZpY2UgKmRldik7CiAKLS8qKgotICogc3RydWN0IGlvbW11X2Z3c3BlYyAtIHBlci1k
ZXZpY2UgSU9NTVUgaW5zdGFuY2UgZGF0YQotICogQG9wczogb3BzIGZvciB0aGlzIGRldmljZSdz
IElPTU1VCi0gKiBAaW9tbXVfZndub2RlOiBmaXJtd2FyZSBoYW5kbGUgZm9yIHRoaXMgZGV2aWNl
J3MgSU9NTVUKLSAqIEBpb21tdV9wcml2OiBJT01NVSBkcml2ZXIgcHJpdmF0ZSBkYXRhIGZvciB0
aGlzIGRldmljZQotICogQGZsYWdzOiBJT01NVSBmbGFncyBhc3NvY2lhdGVkIHdpdGggdGhpcyBk
ZXZpY2UKLSAqIEBudW1faWRzOiBudW1iZXIgb2YgYXNzb2NpYXRlZCBkZXZpY2UgSURzCi0gKiBA
aWRzOiBJRHMgd2hpY2ggdGhpcyBkZXZpY2UgbWF5IHByZXNlbnQgdG8gdGhlIElPTU1VCi0gKi8K
LXN0cnVjdCBpb21tdV9md3NwZWMgewotCWNvbnN0IHN0cnVjdCBpb21tdV9vcHMJKm9wczsKLQlz
dHJ1Y3QgZndub2RlX2hhbmRsZQkqaW9tbXVfZndub2RlOwotCXZvaWQJCQkqaW9tbXVfcHJpdjsK
LQl1MzIJCQlmbGFnczsKLQl1bnNpZ25lZCBpbnQJCW51bV9pZHM7Ci0JdTMyCQkJaWRzWzFdOwot
fTsKLQotLyogQVRTIGlzIHN1cHBvcnRlZCAqLwotI2RlZmluZSBJT01NVV9GV1NQRUNfUENJX1JD
X0FUUwkJCSgxIDw8IDApCi0KIC8qKgogICogc3RydWN0IGlvbW11X3N2YSAtIGhhbmRsZSB0byBh
IGRldmljZS1tbSBib25kCiAgKi8KQEAgLTk4MCw2ICs5ODAsMTEgQEAgY29uc3Qgc3RydWN0IGlv
bW11X29wcyAqaW9tbXVfb3BzX2Zyb21fZndub2RlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25v
ZGUpCiAJcmV0dXJuIE5VTEw7CiB9CiAKK3N0YXRpYyBpbmxpbmUgc3RydWN0IGlvbW11X2Z3c3Bl
YyAqZGV2X2lvbW11X2Z3c3BlY19nZXQoc3RydWN0IGRldmljZSAqZGV2KQoreworCXJldHVybiBO
VUxMOworfQorCiBzdGF0aWMgaW5saW5lIGJvb2wKIGlvbW11X2Rldl9oYXNfZmVhdHVyZShzdHJ1
Y3QgZGV2aWNlICpkZXYsIGVudW0gaW9tbXVfZGV2X2ZlYXR1cmVzIGZlYXQpCiB7Ci0tIAoyLjIz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
