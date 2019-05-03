Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5396B13132
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 17:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED736E7F6;
	Fri,  3 May 2019 15:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 16D356E7F6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 15:32:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4613EBD;
 Fri,  3 May 2019 08:32:00 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9AEE13F557;
 Fri,  3 May 2019 08:31:59 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com
Subject: [PATCH 2/4] drm/panfrost: Disable PM on probe failure
Date: Fri,  3 May 2019 16:31:43 +0100
Message-Id: <2487391e7646cabbc52e9b4c20182e39d3f61859.1556195258.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1556195258.git.robin.murphy@arm.com>
References: <cover.1556195258.git.robin.murphy@arm.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZSBzdXJlIHRvIGRpc2FibGUgcnVudGltZSBQTSBhZ2FpbiBpZiBwcm9iZSBmYWlscyBhZnRl
ciB3ZSd2ZSBlbmFibGVkCml0LiBPdGhlcndpc2UsIGFueSBzdWJzZXF1ZW50IGF0dGVtcHQgdG8g
cmUtcHJvYmUgc3RhcnRzIHRyaWdnZXJpbmcKIlVuYmFsYW5jZWQgcG1fcnVudGltZV9lbmFibGUh
IiBhc3NlcnRpb25zIGZyb20gdGhlIGRyaXZlciBjb3JlLgoKU2lnbmVkLW9mZi1ieTogUm9iaW4g
TXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZHJ2LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwppbmRleCBhZjAwNThmZmMxZTQu
LmE4ODFlMjM0NmI1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwpA
QCAtNDA1LDYgKzQwNSw3IEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIGVycl9vdXQxOgogCXBhbmZyb3N0X2RldmljZV9maW5pKHBmZGV2
KTsKIGVycl9vdXQwOgorCXBtX3J1bnRpbWVfZGlzYWJsZShwZmRldi0+ZGV2KTsKIAlkcm1fZGV2
X3B1dChkZGV2KTsKIAlyZXR1cm4gZXJyOwogfQotLSAKMi4yMS4wLmRpcnR5CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
