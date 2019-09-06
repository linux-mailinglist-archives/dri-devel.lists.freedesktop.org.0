Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1244BAC232
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 23:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDEF6E14E;
	Fri,  6 Sep 2019 21:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC36A6E14E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 21:48:48 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id s12so5450323pfe.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 14:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PmbeXR16EILkjisUuUV6rfWxt0BghSuM480d7BBoObE=;
 b=OqJoKl2co+erZyXHD0phMZQpWtT2O9f74nj2znq4heQ0BOF3cpmWO4DsLiK0ApdeP8
 mo2Dqjk13JWYjKLcN/RxAVtKlhK8rIyukYdtu8jlW2qcJCTQ2O+Q1tJ6p0oziXQ4ZaVp
 E8w36H9+KWp5BQdO0pobZv/8PRLqplX0Werd/ZQzNjbFhmQSOf4DDdZkqQnlAout7PK2
 8HtOy9a2GfsGsumTGoWudiO8QKMXFe+LN0ZLQPpsNgvJlK0B4WORoERATiNqiyhI4N5G
 Z5REzP0LwnTeiDsNVcwHPE17yO0i+lR233mDSRcy/tSt8Ll7NJ+LmW0jy4WHAE96W8Be
 OXeQ==
X-Gm-Message-State: APjAAAXz0WCFLpmur5Mx2tTAZKd3y5wQ3rWx8I/e5VberznH7yzKISRi
 5N5oTb5ZRET6K8iwkmVi35E=
X-Google-Smtp-Source: APXvYqxQCd7WFr1bk2mCpZ+S1Nv/UOSK0AKJu6DLOAfsUfGckUthB3lN7nqi/NUB8YzjJgdlC0+ugA==
X-Received: by 2002:a63:4823:: with SMTP id v35mr9858403pga.138.1567806528190; 
 Fri, 06 Sep 2019 14:48:48 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id j9sm6894230pfi.128.2019.09.06.14.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 14:48:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 1/2] iommu: add support for drivers that manage iommu
 explicitly
Date: Fri,  6 Sep 2019 14:44:01 -0700
Message-Id: <20190906214409.26677-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190906214409.26677-1-robdclark@gmail.com>
References: <20190906214409.26677-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PmbeXR16EILkjisUuUV6rfWxt0BghSuM480d7BBoObE=;
 b=l9KS64BP1B0VVFLP3cG+Fu9U3dUbCksmelSZOoyogDcNDZW7sjsm328l7B9JP6x26f
 DZaO/ojDzSUVS4Il84HxoyaRZCseDaFTbt0s08wXIhLhOunAvz314/stiuohiLGFMmpE
 o3ol62LvFBaKO08hIXHcKu89nLOnrucM/f4gr9kbmXTL/db0eQb2NfDz1gsUIVqf14t0
 QS0EoD8cKG4EdIQwYJ9KgSsGFyxXBCE3mbcRtamjbEN+ffrHwSzbUJ5ryEqWsTz7LGFr
 PJrVc19D7lpchjdUYFkmeYBA9fAiwKYdQ49Fv5Gw7pcbMrSl95PcHvVJdZOvz2bGBBlT
 Gx5w==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-msm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Sudeep Holla <sudeep.holla@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKQXZvaWQgYXR0YWNoaW5n
IGFueSBub24tZHJpdmVyIG1hbmFnZWQgZG9tYWluIGlmIHRoZSBkcml2ZXIgaW5kaWNhdGVzCnRo
YXQgaXQgbWFuYWdlcyB0aGUgaW9tbXUgZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xh
cmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9pb21tdS9pb21tdS5jICAg
IHwgMiArLQogZHJpdmVycy9pb21tdS9vZl9pb21tdS5jIHwgMyArKysKIGluY2x1ZGUvbGludXgv
ZGV2aWNlLmggICB8IDMgKystCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2lvbW11LmMgYi9kcml2ZXJz
L2lvbW11L2lvbW11LmMKaW5kZXggMGM2NzRkODBjMzdmLi4yYWM1ZThkNDhjYWUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvaW9tbXUvaW9tbXUuYworKysgYi9kcml2ZXJzL2lvbW11L2lvbW11LmMKQEAg
LTY3NCw3ICs2NzQsNyBAQCBpbnQgaW9tbXVfZ3JvdXBfYWRkX2RldmljZShzdHJ1Y3QgaW9tbXVf
Z3JvdXAgKmdyb3VwLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiAKIAltdXRleF9sb2NrKCZncm91cC0+
bXV0ZXgpOwogCWxpc3RfYWRkX3RhaWwoJmRldmljZS0+bGlzdCwgJmdyb3VwLT5kZXZpY2VzKTsK
LQlpZiAoZ3JvdXAtPmRvbWFpbikKKwlpZiAoZ3JvdXAtPmRvbWFpbiAmJiAhKGRldi0+ZHJpdmVy
ICYmIGRldi0+ZHJpdmVyLT5kcml2ZXJfbWFuYWdlc19pb21tdSkpCiAJCXJldCA9IF9faW9tbXVf
YXR0YWNoX2RldmljZShncm91cC0+ZG9tYWluLCBkZXYpOwogCW11dGV4X3VubG9jaygmZ3JvdXAt
Pm11dGV4KTsKIAlpZiAocmV0KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9vZl9pb21tdS5j
IGIvZHJpdmVycy9pb21tdS9vZl9pb21tdS5jCmluZGV4IDYxNGE5M2FhNTMwNS4uNjJiNDdlMzg0
YTc3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lvbW11L29mX2lvbW11LmMKKysrIGIvZHJpdmVycy9p
b21tdS9vZl9pb21tdS5jCkBAIC0yMjEsNiArMjIxLDkgQEAgY29uc3Qgc3RydWN0IGlvbW11X29w
cyAqb2ZfaW9tbXVfY29uZmlndXJlKHN0cnVjdCBkZXZpY2UgKmRldiwKIAl9IGVsc2UgaWYgKGVy
ciA8IDApIHsKIAkJZGV2X2RiZyhkZXYsICJBZGRpbmcgdG8gSU9NTVUgZmFpbGVkOiAlZFxuIiwg
ZXJyKTsKIAkJb3BzID0gTlVMTDsKKwl9IGVsc2UgaWYgKGRldi0+ZHJpdmVyICYmIGRldi0+ZHJp
dmVyLT5kcml2ZXJfbWFuYWdlc19pb21tdSkgeworCQlkZXZfZGJnKGRldiwgIkRyaXZlciBtYW5h
Z2VzIElPTU1VXG4iKTsKKwkJb3BzID0gTlVMTDsKIAl9CiAKIAlyZXR1cm4gb3BzOwpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9kZXZpY2UuaCBiL2luY2x1ZGUvbGludXgvZGV2aWNlLmgKaW5k
ZXggMWFhMzQxYjJhMGRiLi5iNzdhMTFiOGQ5YmIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgv
ZGV2aWNlLmgKKysrIGIvaW5jbHVkZS9saW51eC9kZXZpY2UuaApAQCAtMjg0LDcgKzI4NCw4IEBA
IHN0cnVjdCBkZXZpY2VfZHJpdmVyIHsKIAlzdHJ1Y3QgbW9kdWxlCQkqb3duZXI7CiAJY29uc3Qg
Y2hhcgkJKm1vZF9uYW1lOwkvKiB1c2VkIGZvciBidWlsdC1pbiBtb2R1bGVzICovCiAKLQlib29s
IHN1cHByZXNzX2JpbmRfYXR0cnM7CS8qIGRpc2FibGVzIGJpbmQvdW5iaW5kIHZpYSBzeXNmcyAq
LworCWJvb2wgc3VwcHJlc3NfYmluZF9hdHRyczoxOwkvKiBkaXNhYmxlcyBiaW5kL3VuYmluZCB2
aWEgc3lzZnMgKi8KKwlib29sIGRyaXZlcl9tYW5hZ2VzX2lvbW11OjE7CS8qIGRyaXZlciBtYW5h
Z2VzIElPTU1VIGV4cGxpY2l0bHkgKi8KIAllbnVtIHByb2JlX3R5cGUgcHJvYmVfdHlwZTsKIAog
CWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQJKm9mX21hdGNoX3RhYmxlOwotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
