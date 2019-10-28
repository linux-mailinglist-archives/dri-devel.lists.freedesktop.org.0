Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 104B6E72A1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 14:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725AF6E3C7;
	Mon, 28 Oct 2019 13:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30BA6E3C7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 13:32:07 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-jviSYXKaP9qh_CZPB1i5VQ-1; Mon, 28 Oct 2019 09:32:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 398131005509;
 Mon, 28 Oct 2019 13:32:02 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-64.ams2.redhat.com
 [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 174685DA32;
 Mon, 28 Oct 2019 13:32:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/vboxvideo: Use drm_gem_fb_create_with_dirty instead of
 drm_gem_fb_create
Date: Mon, 28 Oct 2019 14:31:59 +0100
Message-Id: <20191028133159.236550-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: jviSYXKaP9qh_CZPB1i5VQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572269526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PBDulDj5qYJ3de1zoNqpIxSwJhdNJ3G1OyvBjbQyFnE=;
 b=A7458d9onfC4wmP78QOjjGTv3kp1MggtFceEyqT7uiU7ZIGK5qSHiaDJnwVrXeH2srW60O
 6oZYcS3fgNEloifpx3DUPXmXTKQU7roxh0D2mU7Z06BXvf+gIDkfKCBwSxjZMvr4HnWjeW
 qGQiUx2ssGu+UCoM/wCP5oZ5E97flpo=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IDdkNzlhYTg2MjhmZSAoImRybS92Ym94dmlkZW86IFJlcGxhY2Ugc3RydWN0IHZyYW1f
ZnJhbWVidWZmZXIKd2l0aCBnZW5lcmljIGltcGxlbWVuYXRpb24iKSByZW1vdmVkIHRoZSBkaXkg
ZnJhbWVidWZmZXIgY29kZSBmcm9tCnRoZSB2Ym94dmlkZW8gZHJpdmVyLCByZXN1bHRpbmcgaW4g
YSBuaWNlIGNsZWFudXAuCgpCdXQgc2luY2UgdGhlIHZib3h2aWRlbyBkcml2ZXIgbmVlZHMgdGhl
IGdlbmVyaWMgZGlydHkgdHJhY2tpbmcgY29kZSwKaXQncyBkcm1fbW9kZV9jb25maWdfZnVuY3Mu
ZmJfY3JlYXRlIHNob3VsZCBiZSBzZXQgdG8KZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9kaXJ0eSBu
b3QgZHJtX2dlbV9mYl9jcmVhdGUuCgpUaGlzIGNvbW1pdCBmaXhlcyB0aGlzLCBmaXhpbmcgdGhl
IGZyYW1lYnVmZmVyIG5vdCBhbHdheXMgdXBkYXRpbmcuCgpDYzogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+CkZpeGVzOiBDb21taXQgN2Q3OWFhODYyOGZlICgiZHJtL3Zi
b3h2aWRlbzogUmVwbGFjZSBzdHJ1Y3QgdnJhbV9mcmFtZWJ1ZmZlciB3aXRoIGdlbmVyaWMgaW1w
bGVtZW5hdGlvbiIpClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhh
dC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X21vZGUuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdmJveHZpZGVvL3Zib3hfbW9kZS5jCmluZGV4IGQ5ODE4YThhMzJmYS4uZjE1ZWQyMjcyMjA1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfbW9kZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9tb2RlLmMKQEAgLTgzOCw3ICs4MzgsNyBA
QCBzdGF0aWMgaW50IHZib3hfY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwK
IH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgdmJveF9tb2Rl
X2Z1bmNzID0gewotCS5mYl9jcmVhdGUgPSBkcm1fZ2VtX2ZiX2NyZWF0ZSwKKwkuZmJfY3JlYXRl
ID0gZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9kaXJ0eSwKIAkuYXRvbWljX2NoZWNrID0gZHJtX2F0
b21pY19oZWxwZXJfY2hlY2ssCiAJLmF0b21pY19jb21taXQgPSBkcm1fYXRvbWljX2hlbHBlcl9j
b21taXQsCiB9OwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
