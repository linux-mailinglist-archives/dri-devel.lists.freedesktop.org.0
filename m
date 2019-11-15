Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB26FE6DA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 22:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939F06EB1B;
	Fri, 15 Nov 2019 21:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669FE6EB1B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 21:08:05 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-wo2lr6imNyCH6r2nGOEJpQ-1; Fri, 15 Nov 2019 16:08:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0279B800686;
 Fri, 15 Nov 2019 21:08:01 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-11.bss.redhat.com
 [10.20.1.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32C1B69193;
 Fri, 15 Nov 2019 21:07:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 3/3] drm/nouveau/kms/nv50-: Limit MST BPC to 8
Date: Fri, 15 Nov 2019 16:07:20 -0500
Message-Id: <20191115210728.3467-4-lyude@redhat.com>
In-Reply-To: <20191115210728.3467-1-lyude@redhat.com>
References: <20191115210728.3467-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: wo2lr6imNyCH6r2nGOEJpQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573852084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ubEKyq0NDvgrMzhHxKyHULtH/hM1Pm9HAnCe7lcD+A=;
 b=WriJZDaAcFUP0KaMdZLUXI5dQZ682cQ9g27ad+XTfPKVsQLOvB0m7hCXQyJk/jz32H2P9G
 uCd7xWxTfnCKBdGYZaI4Nd/nW+0tA445IbrcJQxQ+i2E4Ersax2DRkSPHb5og7gbu8aW3L
 iEX73wmp4lqBP1qvuS9oPz0XOqBiaoM=
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
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jerry Zuo <Jerry.Zuo@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@redhat.com>,
 Juston Li <juston.li@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90aWNlZCB0aGlzIHdoaWxlIHdvcmtpbmcgb24gc29tZSB1bnJlbGF0ZWQgQ1JDIHN0dWZmLiBD
dXJyZW50bHksCnVzZXJzcGFjZSBoYXMgdmVyeSBsaXR0bGUgc3VwcG9ydCBmb3IgQlBDcyBoaWdo
ZXIgdGhhbiA4LiBXaGlsZSB0aGlzCmRvZXNuJ3QgbWF0dGVyIGZvciBtb3N0IHRoaW5ncywgb24g
TVNUIHRvcG9sb2dpZXMgd2UgbmVlZCB0byBiZSBjYXJlZnVsCmFib3V0IGVuc3VyaW5nIHRoYXQg
d2UgZG8gb3VyIGJlc3QgdG8gbWFrZSBhbnkgZ2l2ZW4gZGlzcGxheQpjb25maWd1cmF0aW9uIGZp
dCB3aXRoaW4gdGhlIGJhbmR3aWR0aCByZXN0cmFpbnRzIG9mIHRoZSB0b3BvbG9neSwgc2luY2UK
b3RoZXJ3aXNlIGxlc3MgcGVvcGxlJ3MgbW9uaXRvciBjb25maWd1cmF0aW9ucyB3aWxsIHdvcmsu
CgpBbGxvd2luZyBmb3IgQlBDIHNldHRpbmdzIGhpZ2hlciB0aGFuIDggZHJhbWF0aWNhbGx5IGlu
Y3JlYXNlcyB0aGUKcmVxdWlyZWQgYmFuZHdpZHRoIGZvciBkaXNwbGF5cyBpbiBtb3N0IGNvbmZp
Z3VyYXRpb25zLCBhbmQgY29uc2VxdWVudGx5Cm1ha2VzIGl0IGEgbG90IGxlc3MgbGlrZWx5IHRo
YXQgc2FpZCBkaXNwbGF5IGNvbmZpZ3VyYXRpb25zIHdpbGwgcGFzcwp0aGUgYXRvbWljIGNoZWNr
LgoKSW4gdGhlIGZ1dHVyZSB3ZSB3YW50IHRvIGZpeCB0aGlzIGNvcnJlY3RseSBieSBtYWtpbmcg
aXQgc28gdGhhdCB3ZQphZGp1c3QgdGhlIGJwcCBmb3IgZWFjaCBkaXNwbGF5IGluIGEgdG9wb2xv
Z3kgdG8gYmUgYXMgaGlnaCBhcyBwb3NzaWJsZSwKd2hpbGUgbWFraW5nIHN1cmUgdG8gbG93ZXIg
dGhlIGJwcCBvZiBlYWNoIGRpc3BsYXkgaW4gdGhlIGV2ZW50IHRoYXQgd2UKcnVuIG91dCBvZiBi
YW5kd2lkdGggYW5kIG5lZWQgdG8gcmVydW4gb3VyIGF0b21pYyBjaGVjay4gQnV0IGZvciBub3cs
CmZvbGxvdyB0aGUgYmVoYXZpb3IgdGhhdCBib3RoIGk5MTUgYW5kIGFtZGdwdSBhcmUgc3RpY2tp
bmcgdG8uCgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpGaXhl
czogMjMyYzllZWM0MTdhICgiZHJtL25vdXZlYXU6IFVzZSBhdG9taWMgVkNQSSBoZWxwZXJzIGZv
ciBNU1QiKQpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBy
ZWRoYXQuY29tPgpDYzogSmVycnkgWnVvIDxKZXJyeS5adW9AYW1kLmNvbT4KQ2M6IEhhcnJ5IFdl
bnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlA
aW50ZWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogU2VhbiBQ
YXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4g
IyB2NS4xKwotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8IDkg
KysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCmluZGV4IDkzNjY1YWVjY2U1
Ny4uOWFjNDdmZTUxOWY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNw
bnY1MC9kaXNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5j
CkBAIC03OTgsNyArNzk4LDE0IEBAIG52NTBfbXN0b19hdG9taWNfY2hlY2soc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyLAogCWlmICghc3RhdGUtPmR1cGxpY2F0ZWQpIHsKIAkJY29uc3QgaW50
IGNsb2NrID0gY3J0Y19zdGF0ZS0+YWRqdXN0ZWRfbW9kZS5jbG9jazsKIAotCQlhc3loLT5vci5i
cGMgPSBjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5icGM7CisJCS8qCisJCSAqIFhYWDogU2luY2Ug
d2UgZG9uJ3QgdXNlIEhEUiBpbiB1c2Vyc3BhY2UgcXVpdGUgeWV0LCBsaW1pdAorCQkgKiB0aGUg
YnBjIHRvIDggdG8gc2F2ZSBiYW5kd2lkdGggb24gdGhlIHRvcG9sb2d5LiBJbiB0aGUKKwkJICog
ZnV0dXJlLCB3ZSdsbCB3YW50IHRvIHByb3Blcmx5IGZpeCB0aGlzIGJ5IGR5bmFtaWNhbGx5CisJ
CSAqIHNlbGVjdGluZyB0aGUgaGlnaGVzdCBwb3NzaWJsZSBicGMgdGhhdCB3b3VsZCBmaXQgaW4g
dGhlCisJCSAqIHRvcG9sb2d5CisJCSAqLworCQlhc3loLT5vci5icGMgPSBtaW4oY29ubmVjdG9y
LT5kaXNwbGF5X2luZm8uYnBjLCA4VSk7CiAJCWFzeWgtPmRwLnBibiA9IGRybV9kcF9jYWxjX3Bi
bl9tb2RlKGNsb2NrLCBhc3loLT5vci5icGMgKiAzKTsKIAl9CiAKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
