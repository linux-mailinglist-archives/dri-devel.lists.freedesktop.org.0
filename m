Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED044E717D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 13:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22DD6E830;
	Mon, 28 Oct 2019 12:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB466E82B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 12:37:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v3so9442584wmh.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 05:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VncOp+mUljsufXJnBUWLSxNXn7g2AiBvDFJ0LnGPK3g=;
 b=HUOFZU/krEPhcZcPFpuctQD4o8hMhY/QpBDVFw8Dw+oObpoPP71UelmiUsqEjsfLgl
 bFC3uRVUgeNmmWH0pyvbyomQsymlzjUC3osqTrqFeJQoXfTvRfh+dTTJ8baRmjzqJgZQ
 bwXYIHCk+dk8vHyU7qQ4UM6yN5lw/bI7DN9IKOuJMadkSgmx7xM6sGUhk4OKDNUs6FqX
 DpfOmzzBoHi0qXPkP1kF6PYhpaKM1rjlUG9+/9KEmCgUSs9gFM1g7xlvJ6QC5yGthSXv
 Qe2+tYyfGSUj6OYaFnYqv8t7RD5FUGweqXw7SmWJaWL6lOyLXpWAxGHlzzuf2ejMJx53
 7A3g==
X-Gm-Message-State: APjAAAU5qBB6fDaCIYj/qaPdEpJPPwk4ypKf31ZejaAeqhoTmp+rqt6Q
 ejxZdrAZkIwmxJK5eun6gH4=
X-Google-Smtp-Source: APXvYqxOVy+bTCgBsSYJR12Xu8F14DGtiViRIFkjBwX5BaBhbTDniBwKyD+QOm+sSjn1NoeYuaxx/g==
X-Received: by 2002:a1c:6146:: with SMTP id v67mr15687949wmb.102.1572266249852; 
 Mon, 28 Oct 2019 05:37:29 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id u1sm15316861wru.90.2019.10.28.05.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 05:37:29 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 04/12] gpu: host1x: Clean up debugfs on removal
Date: Mon, 28 Oct 2019 13:37:10 +0100
Message-Id: <20191028123718.3890217-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028123718.3890217-1-thierry.reding@gmail.com>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VncOp+mUljsufXJnBUWLSxNXn7g2AiBvDFJ0LnGPK3g=;
 b=uaeXfiXJ/j7C+zwGb61d7ibJLhREbj2cEPm/XJHipaZXsV38VifKgSdQmrtLCtUsDG
 Z+FaKqQqB3ahI45jyAIiUfl/rSZRpw7x06n0VxMt4Z0HA1r3RYze9eAR7a7YZe5Arjn8
 +4x/SMpisS6zTV7iNKWjnVR8YqD8YJ+Xa7FbLwsOowpjNxnykaV3fyEPdoAJwynFx/yZ
 hR6AGbX+teXfwO31TmcBnoA0WPuWH7qaofu3ns9V9v1j1a/V9+a7JsacfBUtjLY/rnS2
 HdoYqiOU6GXyorELDHXFyeiTdcYML4vRUcSWMGQF+LwvTGTmLdo3AO18zqtCL2z2OJ4T
 Fn6g==
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
Cc: linux-tegra@vger.kernel.org, Sachin Nikam <snikam@nvidia.com>,
 dri-devel@lists.freedesktop.org, Puneet Saxena <puneets@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBkZWJ1Z2ZzIGZp
bGVzIGNyZWF0ZWQgZm9yIGhvc3QxeCBhcmUgbmV2ZXIgcmVtb3ZlZCwgY2F1c2luZyB0aGVzZQpm
aWxlcyB0byBiZSBsZWZ0IGRhbmdsaW5nIGluIGRlYnVnZnMuIFRoaXMgcmVzdWx0cyBpbiBhIGNy
YXNoIHdoZW4gYW55Cm9mIHRoZXNlIGZpbGVzIGFyZSBhY2Nlc3NlZCBhZnRlciB0aGUgaG9zdDF4
IGRyaXZlciBoYXMgYmVlbiByZW1vdmVkLAphcyB3ZWxsIGFzIGEgZmFpbHVyZSB0byBjcmVhdGUg
dGhlIGRlYnVnZnMgZW50cmllcyB3aGVuIHRoZXkgYXJlIGFkZGVkCmFnYWluIG9uIGRyaXZlciBw
cm9iZS4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMgYi9kcml2
ZXJzL2dwdS9ob3N0MXgvZGV2LmMKaW5kZXggNDUyZWU1ZDY0MDIxLi5mMzBiODQ0N2EzMTkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYworKysgYi9kcml2ZXJzL2dwdS9ob3N0
MXgvZGV2LmMKQEAgLTQwMiw2ICs0MDIsNyBAQCBzdGF0aWMgaW50IGhvc3QxeF9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgaG9zdDF4ICpob3N0ID0gcGxhdGZv
cm1fZ2V0X2RydmRhdGEocGRldik7CiAKIAlob3N0MXhfdW5yZWdpc3Rlcihob3N0KTsKKwlob3N0
MXhfZGVidWdfZGVpbml0KGhvc3QpOwogCWhvc3QxeF9pbnRyX2RlaW5pdChob3N0KTsKIAlob3N0
MXhfc3luY3B0X2RlaW5pdChob3N0KTsKIAlyZXNldF9jb250cm9sX2Fzc2VydChob3N0LT5yc3Qp
OwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
