Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BA8A9B0D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D591E894DC;
	Thu,  5 Sep 2019 07:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF155894DC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 07:05:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8448330044CE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 07:05:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99860194B2;
 Thu,  5 Sep 2019 07:05:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D13B531E76; Thu,  5 Sep 2019 09:05:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] drm/ttm: remove embedded vma_manager from ttm_bo_device
Date: Thu,  5 Sep 2019 09:05:01 +0200
Message-Id: <20190905070509.22407-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 05 Sep 2019 07:05:13 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpHZXJkIEhvZmZtYW5uICg4KToKICBkcm0vdHRtOiB0dXJuIHR0bV9ib19kZXZpY2Uudm1hX21h
bmFnZXIgaW50byBhIHBvaW50ZXIKICBkcm0vbm91dmVhdTogc3dpdGNoIHRvIGdlbSB2bWEgb2Zm
c2V0IG1hbmFnZXIKICBkcm0vdnJhbTogc3dpdGNoIHRvIGdlbSB2bWEgb2Zmc2V0IG1hbmFnZXIK
ICBkcm0vcmFkZW9uOiBzd2l0Y2ggdG8gZ2VtIHZtYSBvZmZzZXQgbWFuYWdlcgogIGRybS9hbWRn
cHU6IHN3aXRjaCB0byBnZW0gdm1hIG9mZnNldCBtYW5hZ2VyCiAgZHJtL3F4bDogc3dpdGNoIHRv
IGdlbSB2bWEgb2Zmc2V0IG1hbmFnZXIKICBkcm0vdm13Z2Z4OiBzd2l0Y2ggdG8gb3duIHZtYSBt
YW5hZ2VyCiAgZHJtL3R0bTogcmVtb3ZlIGVtYmVkZGVkIHZtYV9vZmZzZXRfbWFuYWdlcgoKIGRy
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oICAgICB8ICAxICsKIGluY2x1ZGUvZHJt
L3R0bS90dG1fYm9fZHJpdmVyLmggICAgICAgICB8ICA2ICsrKystLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2RybV92cmFt
X21tX2hlbHBlci5jICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90
dG0uYyAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMgICAgICAgICAgIHwg
IDEgKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgICAgIHwgIDEgKwogZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICAgICAgICAgIHwgMTQgKysrKysrKy0tLS0tLS0K
IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgICAgICAgICB8ICA2ICsrKy0tLQogZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgICAgIHwgIDUgKysrKysKIDEwIGZpbGVz
IGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTguMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
