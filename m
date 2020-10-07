Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 141382862F2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EB96E945;
	Wed,  7 Oct 2020 16:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765746E945;
 Wed,  7 Oct 2020 16:00:48 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21EA420789;
 Wed,  7 Oct 2020 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602086448;
 bh=LwJT5MJ6duYm0ro1g4xBkPdvn9lQkfO3tdHBOo/wF0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PG4mxITCIs1TjqWOoIZ5d0N/0hxF7UdYsR8GKDpfuebKt3H84WGGruRliq/Y4zvJr
 buEwsX/nhSxlGBV52WvaZ3fU9u9Edkjwen1+mYPoUyxt4jAVT7/7dCib9V1ZjhClkq
 gRcBN9CWhQlMpuW5kYN1bBDduqorQOIxpXMEVW4g=
Date: Wed, 7 Oct 2020 11:06:48 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] drm/amd/pm: Replace one-element array with
 flexible-array in struct phm_vce_clock_voltage_dependency_table
Message-ID: <7226be8f69e24e8084844c3e6fc0423c64a83d53.1602020074.git.gustavoars@kernel.org>
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
ZXhpYmxlLWFycmF5IG1lbWJlciBpbgpzdHJ1Y3QgcGhtX3ZjZV9jbG9ja192b2x0YWdlX2RlcGVu
ZGVuY3lfdGFibGUsIGluc3RlYWQgb2YgYSBvbmUtZWxlbWVudCBhcnJheSwKYW5kIHVzZSB0aGUg
c3RydWN0X3NpemUoKSBoZWxwZXIgdG8gY2FsY3VsYXRlIHRoZSBzaXplIGZvciB0aGUgYWxsb2Nh
dGlvbi4KCkFsc28sIHNhdmUgc29tZSBoZWFwIHNwYWNlIGFzIHRoZSBvcmlnaW5hbCBjb2RlIGlz
IG11bHRpcGx5aW5nCnRhYmxlLT5udW1FbnRyaWVzIGJ5IHNpemVvZihzdHJ1Y3QgcGhtX3ZjZV9j
bG9ja192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUpCndoZW4gaXQgc2hvdWxkIGhhdmUgbXVsdGlw
bGllZCBpdCBieSBzaXplb2Yoc3RydWN0IHBobV92Y2VfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5
X3JlY29yZCkKaW5zdGVhZC4KClsxXSBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9GbGV4
aWJsZV9hcnJheV9tZW1iZXIKWzJdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjUu
OS1yYzEvcHJvY2Vzcy9kZXByZWNhdGVkLmh0bWwjemVyby1sZW5ndGgtYW5kLW9uZS1lbGVtZW50
LWFycmF5cwoKQnVpbGQtdGVzdGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC81ZjdjNWQzNS5wSlRvR3MzSDlr
aFpLNndzJTI1bGtwQGludGVsLmNvbS8KU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2
YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5j
L2h3bWdyLmggICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIC4uLi9ncHUvZHJtL2FtZC9wbS9w
b3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc3BwdGFibGVzLmMgIHwgMTEgKysrKy0tLS0tLS0KIDIgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2h3bWdyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL2luYy9od21nci5oCmluZGV4IGFkNjE0ZTMyMDc5ZS4uYjhlMzMzMjVmYWM2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9od21nci5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vaW5jL2h3bWdyLmgKQEAgLTE4Niw3ICsxODYsNyBAQCBzdHJ1Y3QgcGhtX2Fj
cGNsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV90YWJsZSB7CiAKIHN0cnVjdCBwaG1fdmNlX2Nsb2Nr
X3ZvbHRhZ2VfZGVwZW5kZW5jeV90YWJsZSB7CiAJdWludDhfdCBjb3VudDsKLQlzdHJ1Y3QgcGht
X3ZjZV9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3JkIGVudHJpZXNbMV07CisJc3RydWN0
IHBobV92Y2VfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3JlY29yZCBlbnRyaWVzW107CiB9Owog
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3By
b2Nlc3NwcHRhYmxlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3Iv
cHJvY2Vzc3BwdGFibGVzLmMKaW5kZXggYjJlZjc2NTgwYzZhLi43NzE5ZjUyZTZkNTIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NwcHRh
Ymxlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nl
c3NwcHRhYmxlcy5jCkBAIC0xMTM1LDE1ICsxMTM1LDEyIEBAIHN0YXRpYyBpbnQgZ2V0X3ZjZV9j
bG9ja192b2x0YWdlX2xpbWl0X3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJCWNvbnN0
IEFUT01fUFBMSUJfVkNFX0Nsb2NrX1ZvbHRhZ2VfTGltaXRfVGFibGUgKnRhYmxlLAogCQljb25z
dCBWQ0VDbG9ja0luZm9BcnJheSAgICAqYXJyYXkpCiB7Ci0JdW5zaWduZWQgbG9uZyB0YWJsZV9z
aXplLCBpOworCXVuc2lnbmVkIGxvbmcgaTsKIAlzdHJ1Y3QgcGhtX3ZjZV9jbG9ja192b2x0YWdl
X2RlcGVuZGVuY3lfdGFibGUgKnZjZV90YWJsZSA9IE5VTEw7CiAKLQl0YWJsZV9zaXplID0gc2l6
ZW9mKHVuc2lnbmVkIGxvbmcpICsKLQkJCXNpemVvZihzdHJ1Y3QgcGhtX3ZjZV9jbG9ja192b2x0
YWdlX2RlcGVuZGVuY3lfdGFibGUpCi0JCQkqIHRhYmxlLT5udW1FbnRyaWVzOwotCi0JdmNlX3Rh
YmxlID0ga3phbGxvYyh0YWJsZV9zaXplLCBHRlBfS0VSTkVMKTsKLQlpZiAoTlVMTCA9PSB2Y2Vf
dGFibGUpCisJdmNlX3RhYmxlID0ga3phbGxvYyhzdHJ1Y3Rfc2l6ZSh2Y2VfdGFibGUsIGVudHJp
ZXMsIHRhYmxlLT5udW1FbnRyaWVzKSwKKwkJCSAgICBHRlBfS0VSTkVMKTsKKwlpZiAoIXZjZV90
YWJsZSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAl2Y2VfdGFibGUtPmNvdW50ID0gdGFibGUtPm51
bUVudHJpZXM7Ci0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
