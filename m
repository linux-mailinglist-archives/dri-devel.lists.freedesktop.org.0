Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066A2862D7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED346E942;
	Wed,  7 Oct 2020 15:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBBC6E93E;
 Wed,  7 Oct 2020 15:58:49 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C865F215A4;
 Wed,  7 Oct 2020 15:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602086329;
 bh=ZIXfWwTPMtSWQtAsNNmnq/E01PDvR4T4ANy6nPbnjXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bJ4tbuvTG2Dnh8B4NerafV1cgJFZNQ51eEMIbGMHt+FOj1DYU6eJIyzvm3eOtFivn
 LcQVnQuFvlRSdOWS4cNmlukjGvO6Sm2mDkXJBOoeStjuSrKPVehuoMgzei9cHHhiVq
 9pMkvXquCgnaKigjPZ8mNL6rluFf/leTg69TF5Ek=
Date: Wed, 7 Oct 2020 11:04:49 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 04/14] drm/amd/pm: Replace one-element array with
 flexible-array in struct phm_uvd_clock_voltage_dependency_table
Message-ID: <737f08bfa48ba706952bba91e823129f0dba1389.1602020074.git.gustavoars@kernel.org>
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
ZXhpYmxlLWFycmF5IG1lbWJlciBpbgpzdHJ1Y3QgcGhtX3V2ZF9jbG9ja192b2x0YWdlX2RlcGVu
ZGVuY3lfdGFibGUsIGluc3RlYWQgb2YgYSBvbmUtZWxlbWVudAphcnJheSwgYW5kIHVzZSB0aGUg
c3RydWN0X3NpemUoKSBoZWxwZXIgdG8gY2FsY3VsYXRlIHRoZSBzaXplIGZvciB0aGUKYWxsb2Nh
dGlvbi4KCkFsc28sIHNhdmUgc29tZSBoZWFwIHNwYWNlIGFzIHRoZSBvcmlnaW5hbCBjb2RlIGlz
IG11bHRpcGx5aW5nCnRhYmxlLT5udW1FbnRyaWVzIGJ5IHNpemVvZihzdHJ1Y3QgcGhtX3V2ZF9j
bG9ja192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUpCndoZW4gaXQgc2hvdWxkIGhhdmUgbXVsdGlw
bGllZCBpdCBieSBzaXplb2YocGhtX3V2ZF9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3Jk
KQppbnN0ZWFkLgoKWzFdIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0ZsZXhpYmxlX2Fy
cmF5X21lbWJlcgpbMl0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS45LXJjMS9w
cm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCN6ZXJvLWxlbmd0aC1hbmQtb25lLWVsZW1lbnQtYXJyYXlz
CgpCdWlsZC10ZXN0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzVmN2M0MzNlLnBYa0M2S3NONkhOJTJGTGRo
aiUyNWxrcEBpbnRlbC5jb20vClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1
c3Rhdm9hcnNAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9od21n
ci5oICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAuLi4vZ3B1L2RybS9hbWQvcG0vcG93ZXJw
bGF5L2h3bWdyL3Byb2Nlc3NwcHRhYmxlcy5jICB8IDExICsrKystLS0tLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9od21nci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9p
bmMvaHdtZ3IuaAppbmRleCBlODRjZmYwOWFmMmQuLjJmMTg4NmJjNTUzNSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvaHdtZ3IuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3BtL2luYy9od21nci5oCkBAIC0xNDAsNyArMTQwLDcgQEAgc3RydWN0IHBobV91dmRfY2xv
Y2tfdm9sdGFnZV9kZXBlbmRlbmN5X3JlY29yZCB7CiAKIHN0cnVjdCBwaG1fdXZkX2Nsb2NrX3Zv
bHRhZ2VfZGVwZW5kZW5jeV90YWJsZSB7CiAJdWludDhfdCBjb3VudDsKLQlzdHJ1Y3QgcGhtX3V2
ZF9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3JkIGVudHJpZXNbMV07CisJc3RydWN0IHBo
bV91dmRfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3JlY29yZCBlbnRyaWVzW107CiB9OwogCiBz
dHJ1Y3QgcGhtX2FjcF9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3JkIHsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NwcHRhYmxl
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc3BwdGFi
bGVzLmMKaW5kZXggZDliZWQ0ZGY2ZjY1Li4zMDVkOTVjNDE2MmQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NwcHRhYmxlcy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NwcHRhYmxlcy5j
CkBAIC0xMTA1LDE1ICsxMTA1LDEyIEBAIHN0YXRpYyBpbnQgZ2V0X3V2ZF9jbG9ja192b2x0YWdl
X2xpbWl0X3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJCWNvbnN0IEFUT01fUFBMSUJf
VVZEX0Nsb2NrX1ZvbHRhZ2VfTGltaXRfVGFibGUgKnRhYmxlLAogCQljb25zdCBVVkRDbG9ja0lu
Zm9BcnJheSAqYXJyYXkpCiB7Ci0JdW5zaWduZWQgbG9uZyB0YWJsZV9zaXplLCBpOworCXVuc2ln
bmVkIGxvbmcgaTsKIAlzdHJ1Y3QgcGhtX3V2ZF9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfdGFi
bGUgKnV2ZF90YWJsZTsKIAotCXRhYmxlX3NpemUgPSBzaXplb2YodW5zaWduZWQgbG9uZykgKwot
CQkgc2l6ZW9mKHN0cnVjdCBwaG1fdXZkX2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV90YWJsZSkg
KgotCQkgdGFibGUtPm51bUVudHJpZXM7Ci0KLQl1dmRfdGFibGUgPSBremFsbG9jKHRhYmxlX3Np
emUsIEdGUF9LRVJORUwpOwotCWlmIChOVUxMID09IHV2ZF90YWJsZSkKKwl1dmRfdGFibGUgPSBr
emFsbG9jKHN0cnVjdF9zaXplKHV2ZF90YWJsZSwgZW50cmllcywgdGFibGUtPm51bUVudHJpZXMp
LAorCQkJICAgIEdGUF9LRVJORUwpOworCWlmICghdXZkX3RhYmxlKQogCQlyZXR1cm4gLUVOT01F
TTsKIAogCXV2ZF90YWJsZS0+Y291bnQgPSB0YWJsZS0+bnVtRW50cmllczsKLS0gCjIuMjcuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
