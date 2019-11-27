Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E989B10AC90
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 10:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407D36E4D4;
	Wed, 27 Nov 2019 09:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC356E4D4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 09:25:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-B8oKUA2_OSqQjw55-tRY-Q-1; Wed, 27 Nov 2019 04:25:28 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3D30593D3;
 Wed, 27 Nov 2019 09:25:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 964045D9E1;
 Wed, 27 Nov 2019 09:25:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A27D316E18; Wed, 27 Nov 2019 10:25:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm: mmap fixups
Date: Wed, 27 Nov 2019 10:25:21 +0100
Message-Id: <20191127092523.5620-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: B8oKUA2_OSqQjw55-tRY-Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574846732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lIg1OEt0qGRJcJNkiZO/8zkWXfHKYi+jfuFZPxrHesI=;
 b=QYUBeOY1EG7QvAoOeq9VhZybuReDILI6rwKkJgavka/R0yhtv+6dJ/oZKebg5IK5tgr+GD
 sjnCqqM4c2brrH68tNPklE4tKtlvjy+xnmK/oYi0RYqODDMIH3YcvD0s8bxNb4FZIlR71+
 Ag6L4aIFK56SuAJwCu5qFKmymat3jd4=
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
Cc: intel-gfx@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGVzdGVkIG9uIHFlbXUsIHdpdGggYm9jaHMgKHZyYW0gaGVscGVycykgYW5kIGNpcnJ1cyAoc2ht
ZW0gaGVscGVycykuCkNjJ2luZyBpbnRlbC1nZnggZm9yIENJIGNvdmVyYWdlLgoKdjM6IGJldHRl
ciBmYWtlLW9mZnNldCBoYW5kbGluZyBpbiBkcm1fZ2VtX3ByaW1lX21tYXAoKSAoUm9iKQoKR2Vy
ZCBIb2ZmbWFubiAoMik6CiAgZHJtOiBjYWxsIGRybV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAgd2l0
aCBmYWtlIG9mZnNldAogIGRybTogc2hhcmUgYWRkcmVzcyBzcGFjZSBmb3IgZG1hIGJ1ZnMKCiBp
bmNsdWRlL2RybS9kcm1fZ2VtLmggICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIHwgNCArLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAgICAgICAgIHwgMyAtLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jICAgICAgfCAzICsrKwogZHJpdmVycy9ncHUvZHJt
L2RybV9wcmltZS5jICAgICAgICAgICAgICAgICB8IDkgKysrKysrLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9ib192bS5jICAgICAgICAgICAgIHwgNyAtLS0tLS0tCiA2IGZpbGVzIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTguMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
