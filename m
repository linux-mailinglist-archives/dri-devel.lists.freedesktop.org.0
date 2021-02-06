Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94961311BA7
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 06:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35FC6E3F4;
	Sat,  6 Feb 2021 05:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE386E3F4
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Feb 2021 05:47:52 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id g3so4663665plp.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 21:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BAE/HnEoeH/I6AsDCMIiIUVtpfPBxI4oEAjjMlMZGXc=;
 b=ZfBYm49eLFIQVfzYokXITH5vfeUno9/jvuNet9pJQuW3syR/+XH3/YZk7qYsGlaarI
 Av8bjd9ybfZ2NrBbkKoH6TkHKgDOozMgh5AfXNz2vBQO/CjBCUCqnALvXpYGfT4saEch
 /9wCs2JEHatTpiiTbSS0/jeDneToQGX/UbC/riRDR9KDRuze2GzoJovxK+sDxxU3D58G
 e6dBr1bcw9JY0uhHo7cPlIcQKBZT5TBvifUlt8hsQ+C5nQX5APkE6jPwT6fKeY5Wkcw1
 Cy44UKqKF6aOMe5F/BWJyDL454r9LYEwH4Vtz9CEhfiKHMks6kN+2bQt3ndo/gu0Myi9
 yXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BAE/HnEoeH/I6AsDCMIiIUVtpfPBxI4oEAjjMlMZGXc=;
 b=hQ5dUWMp2FiEpSs6retQorFZgzGAR+426UXn7J4AqDkKgK3zprtIcPwP7AKADOZpcp
 NUmCX8o79CLSY8S8u10nCeK+HHi4OS8eLbzkAPOgyhlGWvT0ZzNCwAD1kXAzzstMTw4L
 asEl/HNSUMWT79Pdzcrdy3y1E9AvZ5lyoFj/6Br4d2WRJFw9nRgirsmJUDbe4uaTsp5U
 OtQhDJrSAUc5tXZEsLO2x441wFMJ/bXW5sU+2VHzl7aa44yUiSJaGHc6dxRuBjZ+Tqbk
 UDBGoq4bdf0rCdyrm5qOlgMceyLIPRX3gjviSfzhkkmYLocGK1AJIeoQwC0D+rqeUOyW
 XPmQ==
X-Gm-Message-State: AOAM531e97J4TK6bbKKO4M9BuSqQk5Z+c21pGmYzt6RFASjHj+lmDPb8
 uOBYv5JQY0oDA7FNJ/Ti0R8KDg==
X-Google-Smtp-Source: ABdhPJy2np2futESbWx4VSlBPWGsf9xnPAKiXfTrc46U4XfKehlJZOZJ93yJOyYV7fxA8/jLvmM9vw==
X-Received: by 2002:a17:90b:4d09:: with SMTP id
 mw9mr7553358pjb.199.1612590472244; 
 Fri, 05 Feb 2021 21:47:52 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 ob6sm9200211pjb.30.2021.02.05.21.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 21:47:51 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 1/2] dma-buf: dma-heap: Provide accessor to get heap name
Date: Sat,  6 Feb 2021 05:47:47 +0000
Message-Id: <20210206054748.378300-1-john.stultz@linaro.org>
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
bmFyby5vcmc+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFwLmMgfCAxMyArKysrKysrKysr
KysrCiBpbmNsdWRlL2xpbnV4L2RtYS1oZWFwLmggICB8ICA5ICsrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2Rt
YS1oZWFwLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYwppbmRleCBhZmQyMmM5ZGJkY2Yu
LjZjNzQ2ZWE2NzY3NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFwLmMKKysr
IGIvZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFwLmMKQEAgLTE5MCw2ICsxOTAsMTkgQEAgdm9pZCAq
ZG1hX2hlYXBfZ2V0X2RydmRhdGEoc3RydWN0IGRtYV9oZWFwICpoZWFwKQogCXJldHVybiBoZWFw
LT5wcml2OwogfQogCisKKy8qKgorICogZG1hX2hlYXBfZ2V0X25hbWUoKSAtIGdldCBoZWFwIG5h
bWUKKyAqIEBoZWFwOiBETUEtSGVhcCB0byByZXRyaWV2ZSBwcml2YXRlIGRhdGEgZm9yCisgKgor
ICogUmV0dXJuczoKKyAqIFRoZSBjaGFyKiBmb3IgdGhlIGhlYXAgbmFtZS4KKyAqLworY2hhciAq
ZG1hX2hlYXBfZ2V0X25hbWUoc3RydWN0IGRtYV9oZWFwICpoZWFwKQoreworCXJldHVybiBoZWFw
LT5uYW1lOworfQorCiBzdHJ1Y3QgZG1hX2hlYXAgKmRtYV9oZWFwX2FkZChjb25zdCBzdHJ1Y3Qg
ZG1hX2hlYXBfZXhwb3J0X2luZm8gKmV4cF9pbmZvKQogewogCXN0cnVjdCBkbWFfaGVhcCAqaGVh
cCwgKmgsICplcnJfcmV0OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kbWEtaGVhcC5oIGIv
aW5jbHVkZS9saW51eC9kbWEtaGVhcC5oCmluZGV4IDQ1NGUzNTRkMWZmYi4uYjkxNzc4MjkxZmIx
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1oZWFwLmgKKysrIGIvaW5jbHVkZS9saW51
eC9kbWEtaGVhcC5oCkBAIC01MCw2ICs1MCwxNSBAQCBzdHJ1Y3QgZG1hX2hlYXBfZXhwb3J0X2lu
Zm8gewogICovCiB2b2lkICpkbWFfaGVhcF9nZXRfZHJ2ZGF0YShzdHJ1Y3QgZG1hX2hlYXAgKmhl
YXApOwogCisvKioKKyAqIGRtYV9oZWFwX2dldF9uYW1lKCkgLSBnZXQgaGVhcCBuYW1lCisgKiBA
aGVhcDogRE1BLUhlYXAgdG8gcmV0cmlldmUgcHJpdmF0ZSBkYXRhIGZvcgorICoKKyAqIFJldHVy
bnM6CisgKiBUaGUgY2hhciogZm9yIHRoZSBoZWFwIG5hbWUuCisgKi8KK2NoYXIgKmRtYV9oZWFw
X2dldF9uYW1lKHN0cnVjdCBkbWFfaGVhcCAqaGVhcCk7CisKIC8qKgogICogZG1hX2hlYXBfYWRk
IC0gYWRkcyBhIGhlYXAgdG8gZG1hYnVmIGhlYXBzCiAgKiBAZXhwX2luZm86CQlpbmZvcm1hdGlv
biBuZWVkZWQgdG8gcmVnaXN0ZXIgdGhpcyBoZWFwCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
