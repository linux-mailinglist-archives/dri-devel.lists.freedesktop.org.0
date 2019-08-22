Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1FE98F7A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 11:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A496EAEA;
	Thu, 22 Aug 2019 09:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D006EAD3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 09:36:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BFA71C08C33E;
 Thu, 22 Aug 2019 09:36:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B1BD5D712;
 Thu, 22 Aug 2019 09:36:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6A16297A1; Thu, 22 Aug 2019 11:36:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] udmabuf: check that flags has no unsupported bits set
Date: Thu, 22 Aug 2019 11:36:54 +0200
Message-Id: <20190822093654.23752-4-kraxel@redhat.com>
In-Reply-To: <20190822093654.23752-1-kraxel@redhat.com>
References: <20190822093654.23752-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 22 Aug 2019 09:36:57 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, laurent.pinchart@ideasonboard.com,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+ClJlcG9ydGVk
LWJ5OiBZYW5uIERyb25lYXVkIDx5ZHJvbmVhdWRAb3B0ZXlhLmNvbT4KLS0tCiBkcml2ZXJzL2Rt
YS1idWYvdWRtYWJ1Zi5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVm
L3VkbWFidWYuYwppbmRleCA2YzNlYzhmY2VmMDEuLmNhMTM2NDEwMmIxOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYworKysgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5j
CkBAIC0xMzEsNiArMTMxLDkgQEAgc3RhdGljIGxvbmcgdWRtYWJ1Zl9jcmVhdGUoY29uc3Qgc3Ry
dWN0IHVkbWFidWZfY3JlYXRlX2xpc3QgKmhlYWQsCiAJaW50IHNlYWxzLCByZXQgPSAtRUlOVkFM
OwogCXUzMiBpLCBmbGFnczsKIAorCWlmIChoZWFkLT5mbGFncyAmIH5VRE1BQlVGX0ZMQUdTX0NM
T0VYRUMpCisJCXJldHVybiAtRUlOVkFMOworCiAJdWJ1ZiA9IGt6YWxsb2Moc2l6ZW9mKCp1YnVm
KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCF1YnVmKQogCQlyZXR1cm4gLUVOT01FTTsKLS0gCjIuMTgu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
