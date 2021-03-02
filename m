Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F4E3295B1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 03:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA73B89D56;
	Tue,  2 Mar 2021 02:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F39989D4D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 02:56:36 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 i4-20020a17090a7184b02900bfb60fbc6bso509013pjk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 18:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+IZNoE4E9l3eWMVT2Obt86H5jq5BW9DleHnD2g9iNvw=;
 b=ZxZq/smZVpC9WlNe4MDL4pHr/HTA8pP44i22GmGeqCqsuxStxJ4pS8cxERjZNkuZJv
 8ThxGCSXUkL8yTS3EGUx59IAQU79hIJHzEhVtZgCwJzx52YmlJnwYycZSCG6YihxCgp1
 izaFAkOo5+o+BgIGuJGfhK7cHViZ9bhCuDpSQWQXWEotbeWx5+54lYZ7tYs19GAjAnsj
 alU2a9xA68rEEvsHLTC178xs2Qu07kCF6dB/DdNVP/xGoZDAh3TMTyLjOtg/14rbwUDR
 7khnMT7o0YBRpOWwaNWaRCcFoONoegT8TGGUL2zx9WGRlys1kU0qhrA37BbmvamwGydq
 alPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+IZNoE4E9l3eWMVT2Obt86H5jq5BW9DleHnD2g9iNvw=;
 b=YKIkoISBXlMv1GPfS/jsVJASLScCyC2jadHqOA3BitGs/iWdpmTVz0PUiemTz2Zt6n
 U9wSEjYErpZOuFPQ5zgFISu3zsoTe1b+j9ohyR0+4ErnxDaE3BYytsvXAU9lZ5GwEwWH
 rCGuSt3Lgb2O5VCgiYqM/lX7ejbLtYLo3kwcnZT58toPhs+FR4Z/e8xjznJQAVNXV+GQ
 FrO7hMnfecyRvobBCBVPPyhANXjrjzWPbs5RdrU7r82FfMy7a+b5s/ZeolP7t/S17Sp0
 VXc97Lead4IjImJ8VhToOR4hB8TAmVbzrjFfQb6CZcRz6o43mE5P+26pNbKQ6MbAYk8h
 y+aA==
X-Gm-Message-State: AOAM532Ltyg2n6zc7orA8yYEgscEVPYCatw2YdS0Dj3Oh2cdqmOjHLny
 9qd2RNeROtCUCTDT9Pw6z+cKsA==
X-Google-Smtp-Source: ABdhPJyBS9U+6AtdKNABLhwXXCBgjsOObPODZW8Oq9QBLmZ5tZ2NDADOH8ib3q/xB0NcIvIbDYUzig==
X-Received: by 2002:a17:90b:3890:: with SMTP id
 mu16mr2014337pjb.9.1614653795608; 
 Mon, 01 Mar 2021 18:56:35 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 r16sm18928400pfh.168.2021.03.01.18.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 18:56:35 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v2 1/2] dma-buf: dma-heap: Provide accessor to get
 heap name
Date: Tue,  2 Mar 2021 02:56:28 +0000
Message-Id: <20210302025629.2558215-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgY2FuIGJlIHVzZWZ1bCB0byBhY2Nlc3MgdGhlIG5hbWUgZm9yIHRoZSBoZWFwLApzbyBwcm92
aWRlIGFuIGFjY2Vzc29yIHRvIGRvIHNvLgoKQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBMaWFt
IE1hcmsgPGxtYXJrQGNvZGVhdXJvcmEub3JnPgpDYzogQ2hyaXMgR29sZHN3b3J0aHkgPGNnb2xk
c3dvQGNvZGVhdXJvcmEub3JnPgpDYzogTGF1cmEgQWJib3R0IDxsYWJib3R0QGtlcm5lbC5vcmc+
CkNjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+CkNjOiBIcmlkeWEgVmFs
c2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KQ2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5i
QGdvb2dsZS5jb20+CkNjOiBTYW5kZWVwIFBhdGlsIDxzc3BhdGlsQGdvb2dsZS5jb20+CkNjOiBE
YW5pZWwgTWVudHogPGRhbmllbG1lbnR6QGdvb2dsZS5jb20+CkNjOiDDmHJqYW4gRWlkZSA8b3Jq
YW4uZWlkZUBhcm0uY29tPgpDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4K
Q2M6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KQ2M6IFNpbW9uIFNl
ciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KQ2M6IEphbWVzIEpvbmVzIDxqYWpvbmVzQG52aWRpYS5j
b20+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxp
bmFyby5vcmc+Ci0tLQp2MjoKKiBNYWtlIHN1cmUgdG8gdXNlICJjb25zdCBjaGFyICoiIGFzIFJl
cG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KLS0tCiBkcml2ZXJz
L2RtYS1idWYvZG1hLWhlYXAuYyB8IDEyICsrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9kbWEt
aGVhcC5oICAgfCAgOSArKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5jIGIvZHJpdmVycy9kbWEt
YnVmL2RtYS1oZWFwLmMKaW5kZXggNmI1ZGI5NTQ1NjlmLi41NmJmNWFkMDFhZDUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
aGVhcC5jCkBAIC0yMDIsNiArMjAyLDE4IEBAIHZvaWQgKmRtYV9oZWFwX2dldF9kcnZkYXRhKHN0
cnVjdCBkbWFfaGVhcCAqaGVhcCkKIAlyZXR1cm4gaGVhcC0+cHJpdjsKIH0KIAorLyoqCisgKiBk
bWFfaGVhcF9nZXRfbmFtZSgpIC0gZ2V0IGhlYXAgbmFtZQorICogQGhlYXA6IERNQS1IZWFwIHRv
IHJldHJpZXZlIHByaXZhdGUgZGF0YSBmb3IKKyAqCisgKiBSZXR1cm5zOgorICogVGhlIGNoYXIq
IGZvciB0aGUgaGVhcCBuYW1lLgorICovCitjb25zdCBjaGFyICpkbWFfaGVhcF9nZXRfbmFtZShz
dHJ1Y3QgZG1hX2hlYXAgKmhlYXApCit7CisJcmV0dXJuIGhlYXAtPm5hbWU7Cit9CisKIHN0cnVj
dCBkbWFfaGVhcCAqZG1hX2hlYXBfYWRkKGNvbnN0IHN0cnVjdCBkbWFfaGVhcF9leHBvcnRfaW5m
byAqZXhwX2luZm8pCiB7CiAJc3RydWN0IGRtYV9oZWFwICpoZWFwLCAqaCwgKmVycl9yZXQ7CmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1oZWFwLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1o
ZWFwLmgKaW5kZXggNWJjNWM5NDZhZjU4Li4wYzA1NTYxY2FkNmUgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvZG1hLWhlYXAuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1oZWFwLmgKQEAgLTUw
LDYgKzUwLDE1IEBAIHN0cnVjdCBkbWFfaGVhcF9leHBvcnRfaW5mbyB7CiAgKi8KIHZvaWQgKmRt
YV9oZWFwX2dldF9kcnZkYXRhKHN0cnVjdCBkbWFfaGVhcCAqaGVhcCk7CiAKKy8qKgorICogZG1h
X2hlYXBfZ2V0X25hbWUoKSAtIGdldCBoZWFwIG5hbWUKKyAqIEBoZWFwOiBETUEtSGVhcCB0byBy
ZXRyaWV2ZSBwcml2YXRlIGRhdGEgZm9yCisgKgorICogUmV0dXJuczoKKyAqIFRoZSBjaGFyKiBm
b3IgdGhlIGhlYXAgbmFtZS4KKyAqLworY29uc3QgY2hhciAqZG1hX2hlYXBfZ2V0X25hbWUoc3Ry
dWN0IGRtYV9oZWFwICpoZWFwKTsKKwogLyoqCiAgKiBkbWFfaGVhcF9hZGQgLSBhZGRzIGEgaGVh
cCB0byBkbWFidWYgaGVhcHMKICAqIEBleHBfaW5mbzoJCWluZm9ybWF0aW9uIG5lZWRlZCB0byBy
ZWdpc3RlciB0aGlzIGhlYXAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
