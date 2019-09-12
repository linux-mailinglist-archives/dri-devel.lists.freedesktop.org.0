Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50EB0DC1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 13:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C187F6ECCB;
	Thu, 12 Sep 2019 11:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A1C86ECCA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 11:28:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3FEC28;
 Thu, 12 Sep 2019 04:28:11 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99A573F67D;
 Thu, 12 Sep 2019 04:28:10 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH 0/2] drm/panfrost: Tidy up the devfreq implementation
Date: Thu, 12 Sep 2019 12:28:02 +0100
Message-Id: <20190912112804.10104-1-steven.price@arm.com>
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
aWNoIGlzbid0IHZlcnkgdXNlZnVsLiBMZXQncwp0aWR5IGl0IHVwIQoKVGhpcyBzaG91bGQgYmUg
cGlja2VkIHVwIGFsb25nIHdpdGggTWFyaydzIGNoYW5nZVsxXSB0byBmaXgKcmVndWxhdG9yX2dl
dF9vcHRpb25hbCgpIG1pc3VzZS4gVGhpcyBhbHNvIGRlbGV0ZXMgdGhlIGNvZGUgY2hhbmdlcyBm
cm9tCjUyMjgyMTYzZGZhNiBhbmQgZTIxZGQyOTA4ODFiIHdoaWNoIHdvdWxkIG90aGVyd2lzZSBu
ZWVkIHJldmVydGluZywgc2VlCnRoZSBwcmV2aW91cyBkaXNjdXNzaW9uWzJdLgoKWzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA5MDQxMjMwMzIuMjMyNjMtMS1icm9vbmllQGtl
cm5lbC5vcmcvClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2NjZDgxNTMwLTJkYmQt
M2MwMi1jYTBhLTEwODViMDA2NjNiNUBhcm0uY29tLwoKU3RldmVuIFByaWNlICgyKToKICBkcm0v
cGFuZnJvc3Q6IFVzZSBnZW5lcmljIGNvZGUgZm9yIGRldmZyZXEKICBkcm0vcGFuZnJvc3Q6IFNp
bXBsaWZ5IGRldmZyZXEgdXRpbGlzYXRpb24gdHJhY2tpbmcKCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgMTI2ICsrKysrKy0tLS0tLS0tLS0tLS0tCiBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oIHwgICAzICstCiBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmggIHwgIDE0ICstLQogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jICAgICB8ICAxNCArLS0KIDQgZmlsZXMgY2hh
bmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMTA5IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
