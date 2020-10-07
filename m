Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB347286300
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D804B6E94B;
	Wed,  7 Oct 2020 16:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D223D6E947;
 Wed,  7 Oct 2020 16:02:08 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79BDF216C4;
 Wed,  7 Oct 2020 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602086528;
 bh=kOWMKdamMcHW4Au2qrv3BhwsErtH4o8/QHcKuDMMRZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mmGuJcVPJl3uga+8gAEvy+A4ZKDXXdQ1NcKMQBBi5AlUWLanqoW8qlXaryD82NEW4
 GoHt/F/tvWyIsctqQoCyH9T9Z5JlH4PeAgiNDx3M7SWbmbHIv3udv5fnnIBt2vPFcy
 KswO3N14vLrZHi7XvcFESAd5CWm3c3Mw3kLOfJ5M=
Date: Wed, 7 Oct 2020 11:08:08 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/14] drm/amd/pm: Replace one-element array with
 flexible-array in struct phm_samu_clock_voltage_dependency_table
Message-ID: <7aa857a6242477b90da3643678d2798c7037b30f.1602020074.git.gustavoars@kernel.org>
References: <cover.1602020074.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1602020074.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4gdGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRv
IGRlY2xhcmUgaGF2aW5nCmEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1l
bnRzIGluIGEgc3RydWN0dXJlLiBLZXJuZWwgY29kZQpzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4
aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZSBjYXNlcy4gVGhlIG9sZGVyCnN0eWxl
IG9mIG9uZS1lbGVtZW50IG9yIHplcm8tbGVuZ3RoIGFycmF5cyBzaG91bGQgbm8gbG9uZ2VyIGJl
IHVzZWRbMl0uCgpSZWZhY3RvciB0aGUgY29kZSBhY2NvcmRpbmcgdG8gdGhlIHVzZSBvZiBhIGZs
ZXhpYmxlLWFycmF5IG1lbWJlciBpbgpzdHJ1Y3QgcGhtX3NhbXVfY2xvY2tfdm9sdGFnZV9kZXBl
bmRlbmN5X3RhYmxlLCBpbnN0ZWFkIG9mIGEgb25lLWVsZW1lbnQgYXJyYXksCmFuZCB1c2UgdGhl
IHN0cnVjdF9zaXplKCkgaGVscGVyIHRvIGNhbGN1bGF0ZSB0aGUgc2l6ZSBmb3IgdGhlIGFsbG9j
YXRpb24uCgpBbHNvLCBzYXZlIHNvbWUgaGVhcCBzcGFjZSBhcyB0aGUgb3JpZ2luYWwgY29kZSBp
cyBtdWx0aXBseWluZwp0YWJsZS0+bnVtRW50cmllcyBieSBzaXplb2Yoc3RydWN0IHBobV9zYW11
X2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV90YWJsZSkKd2hlbiBpdCBzaG91bGQgaGF2ZSBiZWVu
IG11bHRpcGxpZWQgaXQgYnkKc2l6ZW9mKHN0cnVjdCBwaG1fc2FtdV9jbG9ja192b2x0YWdlX2Rl
cGVuZGVuY3lfcmVjb3JkKSBpbnN0ZWFkLgoKWzFdIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93
aWtpL0ZsZXhpYmxlX2FycmF5X21lbWJlcgpbMl0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
aHRtbC92NS45LXJjMS9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCN6ZXJvLWxlbmd0aC1hbmQtb25l
LWVsZW1lbnQtYXJyYXlzCgpCdWlsZC10ZXN0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzVmN2M1ZDNhLnJ5
TTRHbVpyM2UwSmVaeSslMjVsa3BAaW50ZWwuY29tLwpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEu
IFIuIFNpbHZhIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9pbmMvaHdtZ3IuaCAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogLi4uL2dwdS9kcm0v
YW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzcHB0YWJsZXMuYyAgfCAxMSArKysrLS0tLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvaHdtZ3IuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vaW5jL2h3bWdyLmgKaW5kZXggN2UwYzk0OGE3MDk3Li5kYWQ3MDNiYTA1MjIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2h3bWdyLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvaHdtZ3IuaApAQCAtNDA0LDcgKzQwNCw3IEBAIHN0cnVj
dCBwaG1fc2FtdV9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3JkIHsKIAogc3RydWN0IHBo
bV9zYW11X2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV90YWJsZSB7CiAJdWludDhfdCBjb3VudDsK
LQlzdHJ1Y3QgcGhtX3NhbXVfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3JlY29yZCBlbnRyaWVz
WzFdOworCXN0cnVjdCBwaG1fc2FtdV9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3JkIGVu
dHJpZXNbXTsKIH07CiAKIHN0cnVjdCBwaG1fY2FjX3RkcF90YWJsZSB7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzcHB0YWJsZXMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NwcHRhYmxlcy5j
CmluZGV4IGUwNTk4MDJkMWUyNS4uNDhkNTUwZDI2YzZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzcHB0YWJsZXMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzcHB0YWJsZXMuYwpAQCAt
MTE2MywxNSArMTE2MywxMiBAQCBzdGF0aWMgaW50IGdldF9zYW11X2Nsb2NrX3ZvbHRhZ2VfbGlt
aXRfdGFibGUoc3RydWN0IHBwX2h3bWdyICpod21nciwKIAkJIHN0cnVjdCBwaG1fc2FtdV9jbG9j
a192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUgKipwdGFibGUsCiAJCSBjb25zdCBBVE9NX1BQTElC
X1NBTUNsa19Wb2x0YWdlX0xpbWl0X1RhYmxlICp0YWJsZSkKIHsKLQl1bnNpZ25lZCBsb25nIHRh
YmxlX3NpemUsIGk7CisJdW5zaWduZWQgbG9uZyBpOwogCXN0cnVjdCBwaG1fc2FtdV9jbG9ja192
b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUgKnNhbXVfdGFibGU7CiAKLQl0YWJsZV9zaXplID0gc2l6
ZW9mKHVuc2lnbmVkIGxvbmcpICsKLQkJc2l6ZW9mKHN0cnVjdCBwaG1fc2FtdV9jbG9ja192b2x0
YWdlX2RlcGVuZGVuY3lfdGFibGUpICoKLQkJdGFibGUtPm51bUVudHJpZXM7Ci0KLQlzYW11X3Rh
YmxlID0ga3phbGxvYyh0YWJsZV9zaXplLCBHRlBfS0VSTkVMKTsKLQlpZiAoTlVMTCA9PSBzYW11
X3RhYmxlKQorCXNhbXVfdGFibGUgPSBremFsbG9jKHN0cnVjdF9zaXplKHNhbXVfdGFibGUsIGVu
dHJpZXMsIHRhYmxlLT5udW1FbnRyaWVzKSwKKwkJCSAgICAgR0ZQX0tFUk5FTCk7CisJaWYgKCFz
YW11X3RhYmxlKQogCQlyZXR1cm4gLUVOT01FTTsKIAogCXNhbXVfdGFibGUtPmNvdW50ID0gdGFi
bGUtPm51bUVudHJpZXM7Ci0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
