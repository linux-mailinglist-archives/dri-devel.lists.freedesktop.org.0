Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC91E4C7A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 15:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D706EA32;
	Fri, 25 Oct 2019 13:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (unknown [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9163A6EA32
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 13:42:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37AFF28;
 Fri, 25 Oct 2019 06:41:53 -0700 (PDT)
Received: from e112269-lin.cambridge.arm.com (e112269-lin.cambridge.arm.com
 [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F15533F71A;
 Fri, 25 Oct 2019 06:41:51 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 0/2] drm/panfrost: Tidy up the devfreq implementation
Date: Fri, 25 Oct 2019 14:41:41 +0100
Message-Id: <20191025134143.14324-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRldmZyZXEgaW1wbGVtZW50YXRpb24gaW4gcGFuZnJvc3QgaXMgdW5uZWNlc3NhcmlseSBv
cGVuIGNvZGVkLiBJdAphbHNvIHRyYWNrcyB1dGlsaXNhdGlvbiBtZXRyaWNzIHBlciBzbG90IHdo
aWNoIGlzbid0IHZlcnkgdXNlZnVsLiBMZXQncwp0aWR5IGl0IHVwIQoKQ2hhbmdlcyBzaW5jZSB2
MToKIGh0dHA6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDE5MDkxMjExMjgwNC4xMDEwNC0xLXN0ZXZl
bi5wcmljZSU0MGFybS5jb20KICogUmViYXNlZCBvbnRvIGxhdGVzdCBkcm0tbWlzYy1uZXh0LCBz
cGVjaWZpY2FsbHkgYWZ0ZXIKICAgZDE4YTk2NjIwNDExICgiZHJtL3BhbmZyb3N0OiBSZW1vdmUg
TlVMTCBjaGVja3MgZm9yIHJlZ3VsYXRvciIpCiAqIEFkZGVkIHRhZ3MKClN0ZXZlbiBQcmljZSAo
Mik6CiAgZHJtL3BhbmZyb3N0OiBVc2UgZ2VuZXJpYyBjb2RlIGZvciBkZXZmcmVxCiAgZHJtL3Bh
bmZyb3N0OiBTaW1wbGlmeSBkZXZmcmVxIHV0aWxpc2F0aW9uIHRyYWNraW5nCgogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDEyNCArKysrKystLS0tLS0tLS0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaCB8ICAgMyAr
LQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oICB8ICAxNCArLS0K
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyAgICAgfCAgMTUgKystCiA0
IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDEwOCBkZWxldGlvbnMoLSkKCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
