Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CFB6C471
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 03:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE836E2D0;
	Thu, 18 Jul 2019 01:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BD66E2D0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 01:44:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1F990C06511B;
 Thu, 18 Jul 2019 01:44:31 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A77C719C67;
 Thu, 18 Jul 2019 01:44:27 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/26] drm/dp_mst: Refactor drm_dp_send_enum_path_resources
Date: Wed, 17 Jul 2019 21:42:31 -0400
Message-Id: <20190718014329.8107-9-lyude@redhat.com>
In-Reply-To: <20190718014329.8107-1-lyude@redhat.com>
References: <20190718014329.8107-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 18 Jul 2019 01:44:31 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Juston Li <juston.li@intel.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIG1vcmUgcG9pbnRlcnMgc28gd2UgZG9uJ3QgaGF2ZSB0byB3cml0ZSBvdXQKdHhtc2ctPnJl
cGx5LnUucGF0aF9yZXNvdXJjZXMgZWFjaCB0aW1lLiBBbHNvLCBmaXggbGluZSB3cmFwcGluZyAr
CnJlYXJyYW5nZSBsb2NhbCB2YXJpYWJsZXMuCgpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50
ZWwuY29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5k
IDxod2VudGxhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAyNCAr
KysrKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4
IGVjNjg2NWUxYWY3NS4uNTdjOWM2MDVlZTE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMKQEAgLTIzNTAsMTIgKzIzNTAsMTQgQEAgc3RhdGljIHZvaWQgZHJtX2RwX3NlbmRf
bGlua19hZGRyZXNzKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCWtmcmVl
KHR4bXNnKTsKIH0KIAotc3RhdGljIGludCBkcm1fZHBfc2VuZF9lbnVtX3BhdGhfcmVzb3VyY2Vz
KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAotCQkJCQkgICBzdHJ1Y3QgZHJt
X2RwX21zdF9icmFuY2ggKm1zdGIsCi0JCQkJCSAgIHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBv
cnQpCitzdGF0aWMgaW50Citkcm1fZHBfc2VuZF9lbnVtX3BhdGhfcmVzb3VyY2VzKHN0cnVjdCBk
cm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAorCQkJCXN0cnVjdCBkcm1fZHBfbXN0X2JyYW5j
aCAqbXN0YiwKKwkJCQlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KQogewotCWludCBsZW47
CisJc3RydWN0IGRybV9kcF9lbnVtX3BhdGhfcmVzb3VyY2VzX2Fja19yZXBseSAqcGF0aF9yZXM7
CiAJc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfdHggKnR4bXNnOworCWludCBsZW47CiAJaW50
IHJldDsKIAogCXR4bXNnID0ga3phbGxvYyhzaXplb2YoKnR4bXNnKSwgR0ZQX0tFUk5FTCk7CkBA
IC0yMzY5LDE0ICsyMzcxLDIwIEBAIHN0YXRpYyBpbnQgZHJtX2RwX3NlbmRfZW51bV9wYXRoX3Jl
c291cmNlcyhzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIAogCXJldCA9IGRy
bV9kcF9tc3Rfd2FpdF90eF9yZXBseShtc3RiLCB0eG1zZyk7CiAJaWYgKHJldCA+IDApIHsKKwkJ
cGF0aF9yZXMgPSAmdHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXM7CisKIAkJaWYgKHR4bXNn
LT5yZXBseS5yZXBseV90eXBlID09IERQX1NJREVCQU5EX1JFUExZX05BSykgewogCQkJRFJNX0RF
QlVHX0tNUygiZW51bSBwYXRoIHJlc291cmNlcyBuYWsgcmVjZWl2ZWRcbiIpOwogCQl9IGVsc2Ug
ewotCQkJaWYgKHBvcnQtPnBvcnRfbnVtICE9IHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2Vz
LnBvcnRfbnVtYmVyKQorCQkJaWYgKHBvcnQtPnBvcnRfbnVtICE9IHBhdGhfcmVzLT5wb3J0X251
bWJlcikKIAkJCQlEUk1fRVJST1IoImdvdCBpbmNvcnJlY3QgcG9ydCBpbiByZXNwb25zZVxuIik7
Ci0JCQlEUk1fREVCVUdfS01TKCJlbnVtIHBhdGggcmVzb3VyY2VzICVkOiAlZCAlZFxuIiwgdHht
c2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXMucG9ydF9udW1iZXIsIHR4bXNnLT5yZXBseS51LnBh
dGhfcmVzb3VyY2VzLmZ1bGxfcGF5bG9hZF9id19udW1iZXIsCi0JCQkgICAgICAgdHhtc2ctPnJl
cGx5LnUucGF0aF9yZXNvdXJjZXMuYXZhaWxfcGF5bG9hZF9id19udW1iZXIpOwotCQkJcG9ydC0+
YXZhaWxhYmxlX3BibiA9IHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLmF2YWlsX3BheWxv
YWRfYndfbnVtYmVyOworCisJCQlEUk1fREVCVUdfS01TKCJlbnVtIHBhdGggcmVzb3VyY2VzICVk
OiAlZCAlZFxuIiwKKwkJCQkgICAgICBwYXRoX3Jlcy0+cG9ydF9udW1iZXIsCisJCQkJICAgICAg
cGF0aF9yZXMtPmZ1bGxfcGF5bG9hZF9id19udW1iZXIsCisJCQkJICAgICAgcGF0aF9yZXMtPmF2
YWlsX3BheWxvYWRfYndfbnVtYmVyKTsKKwkJCXBvcnQtPmF2YWlsYWJsZV9wYm4gPQorCQkJCXBh
dGhfcmVzLT5hdmFpbF9wYXlsb2FkX2J3X251bWJlcjsKIAkJfQogCX0KIAotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
