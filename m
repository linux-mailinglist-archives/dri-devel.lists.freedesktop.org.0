Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110629AC11
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 11:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB36A6EC61;
	Fri, 23 Aug 2019 09:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C686EC59
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 09:55:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5E7B781DE7;
 Fri, 23 Aug 2019 09:55:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 893455D704;
 Fri, 23 Aug 2019 09:55:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8BED231E87; Fri, 23 Aug 2019 11:55:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 04/18] drm/virtio: remove virtio_gpu_object_wait
Date: Fri, 23 Aug 2019 11:54:49 +0200
Message-Id: <20190823095503.2261-5-kraxel@redhat.com>
In-Reply-To: <20190823095503.2261-1-kraxel@redhat.com>
References: <20190823095503.2261-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 23 Aug 2019 09:55:07 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gdXNlcnMgbGVmdC4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggICAgfCAgMSAtCiBk
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgfCAxMyAtLS0tLS0tLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9kcnYuaAppbmRleCBlMjg4Mjk2NjE3MjQuLjNlMGE1MzMwOWM1YiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV9kcnYuaApAQCAtMzY0LDcgKzM2NCw2IEBAIGludCB2aXJ0aW9fZ3B1
X29iamVjdF9rbWFwKHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pOwogaW50IHZpcnRpb19n
cHVfb2JqZWN0X2dldF9zZ190YWJsZShzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnFkZXYsCiAJ
CQkJICAgc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibyk7CiB2b2lkIHZpcnRpb19ncHVfb2Jq
ZWN0X2ZyZWVfc2dfdGFibGUoc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibyk7Ci1pbnQgdmly
dGlvX2dwdV9vYmplY3Rfd2FpdChzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvLCBib29sIG5v
X3dhaXQpOwogCiAvKiB2aXJ0Z3B1X3ByaW1lLmMgKi8KIHN0cnVjdCBzZ190YWJsZSAqdmlydGdw
dV9nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYyBiL2RyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYwppbmRleCAyNDI3NjZkNjQ0YTcuLjgy
YmZiZjk4M2ZkMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29i
amVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYwpAQCAt
MjMzLDE2ICsyMzMsMyBAQCB2b2lkIHZpcnRpb19ncHVfb2JqZWN0X2ZyZWVfc2dfdGFibGUoc3Ry
dWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibykKIAlrZnJlZShiby0+cGFnZXMpOwogCWJvLT5wYWdl
cyA9IE5VTEw7CiB9Ci0KLWludCB2aXJ0aW9fZ3B1X29iamVjdF93YWl0KHN0cnVjdCB2aXJ0aW9f
Z3B1X29iamVjdCAqYm8sIGJvb2wgbm9fd2FpdCkKLXsKLQlpbnQgcjsKLQotCXIgPSB0dG1fYm9f
cmVzZXJ2ZSgmYm8tPnRibywgdHJ1ZSwgbm9fd2FpdCwgTlVMTCk7Ci0JaWYgKHVubGlrZWx5KHIg
IT0gMCkpCi0JCXJldHVybiByOwotCXIgPSB0dG1fYm9fd2FpdCgmYm8tPnRibywgdHJ1ZSwgbm9f
d2FpdCk7Ci0JdHRtX2JvX3VucmVzZXJ2ZSgmYm8tPnRibyk7Ci0JcmV0dXJuIHI7Ci19Ci0KLS0g
CjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
