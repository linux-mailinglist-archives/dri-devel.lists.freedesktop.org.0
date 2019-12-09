Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 126AF116CB1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 13:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A0A6E431;
	Mon,  9 Dec 2019 12:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452656E421;
 Mon,  9 Dec 2019 12:00:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so14620258wmi.3;
 Mon, 09 Dec 2019 04:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WWB0gv0IKvrIB1DiP2k54lYzCkgCyMMzc45SZZG00Os=;
 b=ugNNhdVTT8sUvUEsPNwWnyoWikN+K5laBWRwqcWDPvEbqWZec+hUdf0IRJLifY0aTo
 NVmxE4Wghvzgn7SF1hgdwWmNy28535QnZyUYnAx4ReH83Y/Wqc6fWhzrILg7U974dG3T
 Ygpe3+s3y1dnGgU7JBd8+PYKxlQ3te138D1Cb2BSqcN+dmUwqu4b9fmHlj3lh6hhG4C9
 1OfELeaF/YP4WH1K1DrANTascBgOqko0ci2lit830wC4gxVR8PGqtUtmMZLGaKtWxx86
 izZEz1mAJP7ix1ldgIZIv72KRKCTuOOfuRTMQ4nJmi3KeNu6WMaBDmdFeCoq9KBcfIwx
 xSwA==
X-Gm-Message-State: APjAAAW8WaIx2ZevgiEUSfaN/O402/bdvw9to+j32zjPkiTeUjFChmrV
 JSfa4UnMB8KgsjZ7jhaSzdk=
X-Google-Smtp-Source: APXvYqxdw3QGqId0WWIJ8FkEPSj74gaCo0YXXuupNcHzm44v6wyffmecyZxNMEwCEOOhxRKKC/h/QA==
X-Received: by 2002:a1c:4004:: with SMTP id n4mr23578319wma.153.1575892811780; 
 Mon, 09 Dec 2019 04:00:11 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id c1sm26876206wrs.24.2019.12.09.04.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 04:00:10 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v3 2/9] iommu: Add dummy dev_iommu_fwspec_get() helper
Date: Mon,  9 Dec 2019 12:59:58 +0100
Message-Id: <20191209120005.2254786-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WWB0gv0IKvrIB1DiP2k54lYzCkgCyMMzc45SZZG00Os=;
 b=oGcGDPaluv2mBeTtJ/vs1cgoT3/Yi9JY24nblOBc3AC3qvNYxsD63sgL33QiKkU6iB
 X8TDy4+G7ji6c6xTws1R7ECRQt7lgV1pf4j0kS9Sdtz5iNsgheiBNdCA/nRwGfwdXbbG
 VJ2Z8LK5nmL5Bphivwd4iGrV+HeiLjG7MEfFj7IdaYnvClWNLXBojZUunFPnrqggkhRd
 BOrH0+SRbKFrZS2KpV8qqux1pjbwa4vD9QqOTI6WXkAtigiPhfnORPebg+m9T+4kaaQ7
 YQhzF9WraavPVfSv6a7tq83qWbjQwA4IDb1jm1I0QMSVYBra1DulAO/gWPOt1+5Dec/Z
 RYrA==
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
Cc: Joerg Roedel <jroedel@suse.de>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoaXMgZHVtbXkgaW1w
bGVtZW50YXRpb24gaXMgdXNlZnVsIHRvIGF2b2lkIGEgZGVwZW5kZW5jeSBvbiB0aGUKSU9NTVVf
QVBJIEtjb25maWcgc3ltYm9sIGluIGRyaXZlcnMgdGhhdCBjYW4gb3B0aW9uYWxseSB1c2UgdGhl
IElPTU1VCkFQSS4KCkluIG9yZGVyIHRvIGZ1bGx5IHVzZSB0aGlzLCBhbHNvIG1vdmUgdGhlIHN0
cnVjdCBpb21tdV9md3NwZWMgZGVmaW5pdGlvbgpvdXQgb2YgdGhlIElPTU1VX0FQSSBwcm90ZWN0
ZWQgcmVnaW9uLgoKQWNrZWQtYnk6IEpvZXJnIFJvZWRlbCA8anJvZWRlbEBzdXNlLmRlPgpTaWdu
ZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KQ2hhbmdl
cyBpbiB2MzoKLSByZW1vdmUgZHVwbGljYXRlIHN0cnVjdCBpb21tdV9md3NwZWMgZGVmaW5pdGlv
bgoKIGluY2x1ZGUvbGludXgvaW9tbXUuaCB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAyMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2lvbW11LmggYi9pbmNsdWRl
L2xpbnV4L2lvbW11LmgKaW5kZXggMjE2ZTkxOTg3NWVhLi5iYjI4NDUzYmIwOWMgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvaW9tbXUuaAorKysgYi9pbmNsdWRlL2xpbnV4L2lvbW11LmgKQEAg
LTE5MCw2ICsxOTAsMjcgQEAgc3RydWN0IGlvbW11X3N2YV9vcHMgewogCWlvbW11X21tX2V4aXRf
aGFuZGxlcl90IG1tX2V4aXQ7CiB9OwogCisvKioKKyAqIHN0cnVjdCBpb21tdV9md3NwZWMgLSBw
ZXItZGV2aWNlIElPTU1VIGluc3RhbmNlIGRhdGEKKyAqIEBvcHM6IG9wcyBmb3IgdGhpcyBkZXZp
Y2UncyBJT01NVQorICogQGlvbW11X2Z3bm9kZTogZmlybXdhcmUgaGFuZGxlIGZvciB0aGlzIGRl
dmljZSdzIElPTU1VCisgKiBAaW9tbXVfcHJpdjogSU9NTVUgZHJpdmVyIHByaXZhdGUgZGF0YSBm
b3IgdGhpcyBkZXZpY2UKKyAqIEBmbGFnczogSU9NTVUgZmxhZ3MgYXNzb2NpYXRlZCB3aXRoIHRo
aXMgZGV2aWNlCisgKiBAbnVtX2lkczogbnVtYmVyIG9mIGFzc29jaWF0ZWQgZGV2aWNlIElEcwor
ICogQGlkczogSURzIHdoaWNoIHRoaXMgZGV2aWNlIG1heSBwcmVzZW50IHRvIHRoZSBJT01NVQor
ICovCitzdHJ1Y3QgaW9tbXVfZndzcGVjIHsKKwljb25zdCBzdHJ1Y3QgaW9tbXVfb3BzCSpvcHM7
CisJc3RydWN0IGZ3bm9kZV9oYW5kbGUJKmlvbW11X2Z3bm9kZTsKKwl2b2lkCQkJKmlvbW11X3By
aXY7CisJdTMyCQkJZmxhZ3M7CisJdW5zaWduZWQgaW50CQludW1faWRzOworCXUzMgkJCWlkc1sx
XTsKK307CisKKy8qIEFUUyBpcyBzdXBwb3J0ZWQgKi8KKyNkZWZpbmUgSU9NTVVfRldTUEVDX1BD
SV9SQ19BVFMJCQkoMSA8PCAwKQorCiAjaWZkZWYgQ09ORklHX0lPTU1VX0FQSQogCiAvKioKQEAg
LTU2NSwyNyArNTg2LDYgQEAgZXh0ZXJuIHN0cnVjdCBpb21tdV9ncm91cCAqZ2VuZXJpY19kZXZp
Y2VfZ3JvdXAoc3RydWN0IGRldmljZSAqZGV2KTsKIC8qIEZTTC1NQyBkZXZpY2UgZ3JvdXBpbmcg
ZnVuY3Rpb24gKi8KIHN0cnVjdCBpb21tdV9ncm91cCAqZnNsX21jX2RldmljZV9ncm91cChzdHJ1
Y3QgZGV2aWNlICpkZXYpOwogCi0vKioKLSAqIHN0cnVjdCBpb21tdV9md3NwZWMgLSBwZXItZGV2
aWNlIElPTU1VIGluc3RhbmNlIGRhdGEKLSAqIEBvcHM6IG9wcyBmb3IgdGhpcyBkZXZpY2UncyBJ
T01NVQotICogQGlvbW11X2Z3bm9kZTogZmlybXdhcmUgaGFuZGxlIGZvciB0aGlzIGRldmljZSdz
IElPTU1VCi0gKiBAaW9tbXVfcHJpdjogSU9NTVUgZHJpdmVyIHByaXZhdGUgZGF0YSBmb3IgdGhp
cyBkZXZpY2UKLSAqIEBmbGFnczogSU9NTVUgZmxhZ3MgYXNzb2NpYXRlZCB3aXRoIHRoaXMgZGV2
aWNlCi0gKiBAbnVtX2lkczogbnVtYmVyIG9mIGFzc29jaWF0ZWQgZGV2aWNlIElEcwotICogQGlk
czogSURzIHdoaWNoIHRoaXMgZGV2aWNlIG1heSBwcmVzZW50IHRvIHRoZSBJT01NVQotICovCi1z
dHJ1Y3QgaW9tbXVfZndzcGVjIHsKLQljb25zdCBzdHJ1Y3QgaW9tbXVfb3BzCSpvcHM7Ci0Jc3Ry
dWN0IGZ3bm9kZV9oYW5kbGUJKmlvbW11X2Z3bm9kZTsKLQl2b2lkCQkJKmlvbW11X3ByaXY7Ci0J
dTMyCQkJZmxhZ3M7Ci0JdW5zaWduZWQgaW50CQludW1faWRzOwotCXUzMgkJCWlkc1sxXTsKLX07
Ci0KLS8qIEFUUyBpcyBzdXBwb3J0ZWQgKi8KLSNkZWZpbmUgSU9NTVVfRldTUEVDX1BDSV9SQ19B
VFMJCQkoMSA8PCAwKQotCiAvKioKICAqIHN0cnVjdCBpb21tdV9zdmEgLSBoYW5kbGUgdG8gYSBk
ZXZpY2UtbW0gYm9uZAogICovCkBAIC02MzQsNyArNjM0LDYgQEAgaW50IGlvbW11X3N2YV9nZXRf
cGFzaWQoc3RydWN0IGlvbW11X3N2YSAqaGFuZGxlKTsKIAogc3RydWN0IGlvbW11X29wcyB7fTsK
IHN0cnVjdCBpb21tdV9ncm91cCB7fTsKLXN0cnVjdCBpb21tdV9md3NwZWMge307CiBzdHJ1Y3Qg
aW9tbXVfZGV2aWNlIHt9Owogc3RydWN0IGlvbW11X2ZhdWx0X3BhcmFtIHt9Owogc3RydWN0IGlv
bW11X2lvdGxiX2dhdGhlciB7fTsKQEAgLTk4MCw2ICs5NzksMTEgQEAgY29uc3Qgc3RydWN0IGlv
bW11X29wcyAqaW9tbXVfb3BzX2Zyb21fZndub2RlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25v
ZGUpCiAJcmV0dXJuIE5VTEw7CiB9CiAKK3N0YXRpYyBpbmxpbmUgc3RydWN0IGlvbW11X2Z3c3Bl
YyAqZGV2X2lvbW11X2Z3c3BlY19nZXQoc3RydWN0IGRldmljZSAqZGV2KQoreworCXJldHVybiBO
VUxMOworfQorCiBzdGF0aWMgaW5saW5lIGJvb2wKIGlvbW11X2Rldl9oYXNfZmVhdHVyZShzdHJ1
Y3QgZGV2aWNlICpkZXYsIGVudW0gaW9tbXVfZGV2X2ZlYXR1cmVzIGZlYXQpCiB7Ci0tIAoyLjIz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
