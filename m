Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA3B2862C4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1BE6E93B;
	Wed,  7 Oct 2020 15:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB796E936;
 Wed,  7 Oct 2020 15:57:27 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02FE520789;
 Wed,  7 Oct 2020 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602086247;
 bh=G0lgH6he/DahzFqP5FRpqz/WY6rYK4qxxqp6/q4ygxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vLK1rIEQ31Dxq3kj3L07dUw6bF7o4F6aLSLq8v7grzY4RqA2P9ZAZZaGETC41vSRC
 /IUbAntDwdlho+44fbct2gXqcEyfaPFy+g8H5qjYqB5eUp+JxZKyjIvJ1dLPiLPkDP
 aL1TkMNAYUDAmqTujHdh9EGn/mt87necPjCVlJRY=
Date: Wed, 7 Oct 2020 11:03:27 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 02/14] drm/amd/pm: Replace one-element array with
 flexible-array member in struct vi_dpm_table
Message-ID: <d8308a38b7ea35db027f7e2099360d06baa85bbb.1602020074.git.gustavoars@kernel.org>
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
IHVzZWRbMl0uCgpVc2UgYSBmbGV4aWJsZS1hcnJheSBtZW1iZXIgaW4gc3RydWN0IHZpX2RwbV90
YWJsZSBpbnN0ZWFkIG9mIGEKb25lLWVsZW1lbnQgYXJyYXkuCgpbMV0gaHR0cHM6Ly9lbi53aWtp
cGVkaWEub3JnL3dpa2kvRmxleGlibGVfYXJyYXlfbWVtYmVyClsyXSBodHRwczovL3d3dy5rZXJu
ZWwub3JnL2RvYy9odG1sL3Y1LjktcmMxL3Byb2Nlc3MvZGVwcmVjYXRlZC5odG1sI3plcm8tbGVu
Z3RoLWFuZC1vbmUtZWxlbWVudC1hcnJheXMKCkJ1aWxkLXRlc3RlZC1ieToga2VybmVsIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
NWY3YzQzM2MuVFRrOXJuQStGNThreURVeSUyNWxrcEBpbnRlbC5jb20vClNpZ25lZC1vZmYtYnk6
IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL2luYy9od21nci5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9pbmMvaHdtZ3IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2h3bWdyLmgKaW5k
ZXggYTFkYmZkNTYzNmU2Li5kNjhiNTQ3NzQzZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG0vaW5jL2h3bWdyLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvaHdt
Z3IuaApAQCAtNjAsNyArNjAsNyBAQCBzdHJ1Y3QgdmlfZHBtX2xldmVsIHsKIAogc3RydWN0IHZp
X2RwbV90YWJsZSB7CiAJdWludDMyX3QgY291bnQ7Ci0Jc3RydWN0IHZpX2RwbV9sZXZlbCBkcG1f
bGV2ZWxbMV07CisJc3RydWN0IHZpX2RwbV9sZXZlbCBkcG1fbGV2ZWxbXTsKIH07CiAKICNkZWZp
bmUgUENJRV9QRVJGX1JFUV9SRU1PVkVfUkVHSVNUUlkgICAwCi0tIAoyLjI3LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
