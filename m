Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4CEF69D7
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 16:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC966E63B;
	Sun, 10 Nov 2019 15:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE9F6E6A5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 15:41:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-IUmXelCRNtC-NTqxXZAnXg-1; Sun, 10 Nov 2019 10:41:25 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7F891005500;
 Sun, 10 Nov 2019 15:41:23 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-82.ams2.redhat.com
 [10.36.116.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60CFA608BB;
 Sun, 10 Nov 2019 15:41:22 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 10/12] drm/modes: parse_cmdline: Remove some unnecessary code
Date: Sun, 10 Nov 2019 16:40:59 +0100
Message-Id: <20191110154101.26486-11-hdegoede@redhat.com>
In-Reply-To: <20191110154101.26486-1-hdegoede@redhat.com>
References: <20191110154101.26486-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: IUmXelCRNtC-NTqxXZAnXg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573400486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBTMQKP3NWodK9Sf05MGLDe40vBGXiI5o+PVp4R9iak=;
 b=flsmckxYHSkb+bQyhRSWM1T/7Oo2obJm+hVdHp9HxQRay3DX7RlI/+ZdbtZtaOb8wZ5jy1
 /zyUiAKDtHf1un0qXdQ5DDco8rn8hDnbIwMhUVn+VDM2yNvJAI/iVyOONpUK0AT/wUcsBG
 idqfQgqhGq8fZjoJMhxoXthIe7c+Wmw=
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
 =?UTF-8?q?Mathieu=20Alexandre-T=C3=A9treault?= <alexandretm@amotus.ca>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIDIgYml0cyBvZiBkZWFkLWNvZGU6CgoxKSBkcm1fbW9kZV9wYXJzZV9jb21tYW5kX2xp
bmVfZm9yX2Nvbm5lY3RvcigpIGFsd2F5cyBnZXRzIGNhbGxlZCB3aXRoIGEKemVyby1lZCBkcm1f
Y21kbGluZV9tb2RlIHN0cnVjdCBhbmQgYXNzdW1lcyBzbyBpbiBtb3N0IHBsYWNlcywgc28gdGhl
cmUgaXMKbm8gcmVhc29uIHRvIHNldCBtb2RlLT5zcGVjaWZpZWQgdG8gZmFsc2UgaWYgbm8gbW9k
ZV9vcHRpb24gaXMgcHJlc2VudC4KCjIpIGZiX2dldF9vcHRpb25zKCkgd2lsbCByZXR1cm4gZmJf
bW9kZV9vcHRpb24gaWYgbm8gdmlkZW89PGNvbm5lY3Rvci1uYW1lPgphcmd1bWVudCBpcyBwcmVz
ZW50IG9uIHRoZSBrZXJuZWwgY29tbWFuZGxpbmUsIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gYWxz
bwpkbyB0aGlzIGluIGRybV9tb2RlX3BhcnNlX2NvbW1hbmRfbGluZV9mb3JfY29ubmVjdG9yKCkg
YXMgb3VyIG9ubHkgY2FsbGVyCnVzZXMgZmJfZ2V0X29wdGlvbnMoKSB0byBnZXQgdGhlIG1vZGVf
b3B0aW9uIGFyZ3VtZW50LgoKU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVA
cmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgfCA3IC0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwppbmRleCAxMTlm
ZWQ3YWI4MTUuLjBiZjNjYjhjMDhmZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9t
b2Rlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwpAQCAtMTc0NywxNSArMTc0
Nyw4IEBAIGJvb2wgZHJtX21vZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoY29u
c3QgY2hhciAqbW9kZV9vcHRpb24sCiAKIAltb2RlLT5wYW5lbF9vcmllbnRhdGlvbiA9IERSTV9N
T0RFX1BBTkVMX09SSUVOVEFUSU9OX1VOS05PV047CiAKLSNpZmRlZiBDT05GSUdfRkIKIAlpZiAo
IW1vZGVfb3B0aW9uKQotCQltb2RlX29wdGlvbiA9IGZiX21vZGVfb3B0aW9uOwotI2VuZGlmCi0K
LQlpZiAoIW1vZGVfb3B0aW9uKSB7Ci0JCW1vZGUtPnNwZWNpZmllZCA9IGZhbHNlOwogCQlyZXR1
cm4gZmFsc2U7Ci0JfQogCiAJbmFtZSA9IG1vZGVfb3B0aW9uOwogCi0tIAoyLjIzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
