Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111112862DF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DFB6E936;
	Wed,  7 Oct 2020 15:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9791F6E936;
 Wed,  7 Oct 2020 15:59:22 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62B7120789;
 Wed,  7 Oct 2020 15:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602086362;
 bh=hJslUfi5rxFoAmtR6R3uKnAvE+gdWHluNs09jV3jZg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KrtFOIzP21KalR8ZHk3BCgbUZNnv2AH75XI7f5mpgy7Oifo8EVpV8Bbj2UJwxiSG7
 Oo8WcS2SOOOMdTGIbXW5qE4svUn34BrVGGxE+Ihl+yC/aLg9GKQGUovRuuGkrycs+R
 sT/x+XmuuRS10wBy64mQ0OAEfF3lPFpDOzSAOGbs=
Date: Wed, 7 Oct 2020 11:05:22 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/14] drm/amd/pm: Replace one-element array with
 flexible-array in struct phm_acp_clock_voltage_dependency_table
Message-ID: <92351e6a3328d31e61927462edac3b8dcbcd41b9.1602020074.git.gustavoars@kernel.org>
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
ZXhpYmxlLWFycmF5IG1lbWJlciBpbgpzdHJ1Y3QgcGhtX2FjcF9jbG9ja192b2x0YWdlX2RlcGVu
ZGVuY3lfdGFibGUsIGluc3RlYWQgb2YgYSBvbmUtZWxlbWVudAphcnJheSwgYW5kIHVzZSB0aGUg
c3RydWN0X3NpemUoKSBoZWxwZXIgdG8gY2FsY3VsYXRlIHRoZSBzaXplIGZvciB0aGUKYWxsb2Nh
dGlvbi4KCkFsc28sIHNhdmUgc29tZSBoZWFwIHNwYWNlIGFzIHRoZSBvcmlnaW5hbCBjb2RlIGlz
IG11bHRpcGx5aW5nCnRhYmxlLT5udW1FbnRyaWVzIGJ5IHNpemVvZihzdHJ1Y3QgcGhtX2FjcF9j
bG9ja192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUpCndoZW4gaXQgc2hvdWxkIGhhdmUgbXVsdGlw
bGllZCBpdCBieSBzaXplb2YocGhtX2FjcF9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3Jk
KQppbnN0ZWFkLgoKWzFdIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0ZsZXhpYmxlX2Fy
cmF5X21lbWJlcgpbMl0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS45LXJjMS9w
cm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCN6ZXJvLWxlbmd0aC1hbmQtb25lLWVsZW1lbnQtYXJyYXlz
CgpCdWlsZC10ZXN0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzVmN2M1ZDNjLlR5Zk9oZyUyRkE2SnljTDZa
TiUyNWxrcEBpbnRlbC5jb20vClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1
c3Rhdm9hcnNAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9od21n
ci5oICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAuLi4vZ3B1L2RybS9hbWQvcG0vcG93ZXJw
bGF5L2h3bWdyL3Byb2Nlc3NwcHRhYmxlcy5jICB8IDExICsrKystLS0tLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9od21nci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9p
bmMvaHdtZ3IuaAppbmRleCAyZjE4ODZiYzU1MzUuLjM2MWNiMTEyNTM1MSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvaHdtZ3IuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3BtL2luYy9od21nci5oCkBAIC0xNTAsNyArMTUwLDcgQEAgc3RydWN0IHBobV9hY3BfY2xv
Y2tfdm9sdGFnZV9kZXBlbmRlbmN5X3JlY29yZCB7CiAKIHN0cnVjdCBwaG1fYWNwX2Nsb2NrX3Zv
bHRhZ2VfZGVwZW5kZW5jeV90YWJsZSB7CiAJdWludDMyX3QgY291bnQ7Ci0Jc3RydWN0IHBobV9h
Y3BfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3JlY29yZCBlbnRyaWVzWzFdOworCXN0cnVjdCBw
aG1fYWNwX2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV9yZWNvcmQgZW50cmllc1tdOwogfTsKIAog
c3RydWN0IHBobV92Y2VfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3JlY29yZCB7CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzcHB0YWJs
ZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NwcHRh
Ymxlcy5jCmluZGV4IDMwNWQ5NWM0MTYyZC4uYTFiMTk4MDQ1OTc4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzcHB0YWJsZXMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzcHB0YWJsZXMu
YwpAQCAtMTE5NCwxNSArMTE5NCwxMiBAQCBzdGF0aWMgaW50IGdldF9hY3BfY2xvY2tfdm9sdGFn
ZV9saW1pdF90YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCQlzdHJ1Y3QgcGhtX2FjcF9j
bG9ja192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUgKipwdGFibGUsCiAJCWNvbnN0IEFUT01fUFBM
SUJfQUNQQ2xrX1ZvbHRhZ2VfTGltaXRfVGFibGUgKnRhYmxlKQogewotCXVuc2lnbmVkIHRhYmxl
X3NpemUsIGk7CisJdW5zaWduZWQgbG9uZyBpOwogCXN0cnVjdCBwaG1fYWNwX2Nsb2NrX3ZvbHRh
Z2VfZGVwZW5kZW5jeV90YWJsZSAqYWNwX3RhYmxlOwogCi0JdGFibGVfc2l6ZSA9IHNpemVvZih1
bnNpZ25lZCBsb25nKSArCi0JCXNpemVvZihzdHJ1Y3QgcGhtX2FjcF9jbG9ja192b2x0YWdlX2Rl
cGVuZGVuY3lfdGFibGUpICoKLQkJdGFibGUtPm51bUVudHJpZXM7Ci0KLQlhY3BfdGFibGUgPSBr
emFsbG9jKHRhYmxlX3NpemUsIEdGUF9LRVJORUwpOwotCWlmIChOVUxMID09IGFjcF90YWJsZSkK
KwlhY3BfdGFibGUgPSBremFsbG9jKHN0cnVjdF9zaXplKGFjcF90YWJsZSwgZW50cmllcywgdGFi
bGUtPm51bUVudHJpZXMpLAorCQkJICAgIEdGUF9LRVJORUwpOworCWlmICghYWNwX3RhYmxlKQog
CQlyZXR1cm4gLUVOT01FTTsKIAogCWFjcF90YWJsZS0+Y291bnQgPSAodW5zaWduZWQgbG9uZyl0
YWJsZS0+bnVtRW50cmllczsKLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
