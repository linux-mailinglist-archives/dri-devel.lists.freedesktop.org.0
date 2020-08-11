Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 443F22420D4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 22:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34DF6E7FE;
	Tue, 11 Aug 2020 20:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FD26E7DA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 20:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597176347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+wo54Fztl+nW8iXS4XGGsRse4eb/aZW2O/0PU/MC/eQ=;
 b=Q3WLGv3Ym7JQmvs4/rECNtMbRzLnb+cfWgS6WjYMlo5Sqb3dL/kkNHWWMrG2psAM1lnLZd
 TUNMz83vCBWPQpSr5vz3gSqGSsnuPtH4gmtb+Kkwl4eylphITHAuitaZ88Z4gWykAxfkqo
 d04Oo5ZhPSsTtsBkK10XSNpkPOLmquo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-1k1xoX02P1K--Fza3wyMEQ-1; Tue, 11 Aug 2020 16:05:43 -0400
X-MC-Unique: 1k1xoX02P1K--Fza3wyMEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 887831DE5;
 Tue, 11 Aug 2020 20:05:42 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-184.rdu2.redhat.com [10.10.119.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 931645D9DD;
 Tue, 11 Aug 2020 20:05:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [RFC 03/20] drm/nouveau/kms/nv50-: Just use drm_dp_dpcd_read() in
 nouveau_dp.c
Date: Tue, 11 Aug 2020 16:04:40 -0400
Message-Id: <20200811200457.134743-4-lyude@redhat.com>
In-Reply-To: <20200811200457.134743-1-lyude@redhat.com>
References: <20200811200457.134743-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgdGhpcyBhY3R1YWxseSBsb2dzIGFjY2Vzc2VzLCB3ZSBzaG91bGQgcHJvYmFibHkgYWx3
YXlzIGJlIHVzaW5nCnRoaXMgaW1ob+KApgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1
ZGVAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMgfCAxMiArKysrLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jCmluZGV4IGM0ZTljMjFkNGRkMmIuLjhkYjky
MTZkNTJjNjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMKQEAgLTQyLDE2ICs0
MiwxMiBAQCBub3V2ZWF1X2RwX2RldGVjdChzdHJ1Y3Qgbm91dmVhdV9jb25uZWN0b3IgKm52X2Nv
bm5lY3RvciwKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gbnZfZW5jb2Rlci0+YmFzZS5i
YXNlLmRldjsKIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKGRldik7Ci0J
c3RydWN0IG52a21faTJjX2F1eCAqYXV4OwotCXU4IGRwY2RbOF07CisJc3RydWN0IGRybV9kcF9h
dXggKmF1eCA9ICZudl9jb25uZWN0b3ItPmF1eDsKKwl1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9T
SVpFXTsKIAlpbnQgcmV0OwogCi0JYXV4ID0gbnZfZW5jb2Rlci0+YXV4OwotCWlmICghYXV4KQot
CQlyZXR1cm4gLUVOT0RFVjsKLQotCXJldCA9IG52a21fcmRhdXgoYXV4LCBEUF9EUENEX1JFViwg
ZHBjZCwgc2l6ZW9mKGRwY2QpKTsKLQlpZiAocmV0KQorCXJldCA9IGRybV9kcF9kcGNkX3JlYWQo
YXV4LCBEUF9EUENEX1JFViwgZHBjZCwgRFBfUkVDRUlWRVJfQ0FQX1NJWkUpOworCWlmIChyZXQg
IT0gc2l6ZW9mKGRwY2QpKQogCQlyZXR1cm4gcmV0OwogCiAJbnZfZW5jb2Rlci0+ZHAubGlua19i
dyA9IDI3MDAwICogZHBjZFsxXTsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
