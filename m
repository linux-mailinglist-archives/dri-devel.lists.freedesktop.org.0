Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFC4F69D3
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 16:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F226E0A6;
	Sun, 10 Nov 2019 15:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D426E0A6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 15:41:19 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-27aK-se5OSez27ZsDG2oNA-1; Sun, 10 Nov 2019 10:41:17 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81F121005500;
 Sun, 10 Nov 2019 15:41:16 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-82.ams2.redhat.com
 [10.36.116.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0968608BB;
 Sun, 10 Nov 2019 15:41:14 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 06/12] drm/modes: parse_cmdline: Add freestanding argument to
 drm_mode_parse_cmdline_options()
Date: Sun, 10 Nov 2019 16:40:55 +0100
Message-Id: <20191110154101.26486-7-hdegoede@redhat.com>
In-Reply-To: <20191110154101.26486-1-hdegoede@redhat.com>
References: <20191110154101.26486-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 27aK-se5OSez27ZsDG2oNA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573400478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJYt5V1wXsdHTSaC5cJB/t2HZ0WmFyT15ClNo0daVEI=;
 b=hBX+F8jNhmt3uJqVlrb2L2D4/qLKhTUY/AWGASMR8dvXPHiYDhbTI/GXBdrM3k6uGXHF8j
 wX6I8RaVAR0pderckncw5rjUVYpnUXSSL7qzf7oUk9dmtmLv5S5x5ZweviEIpXX5BfD0it
 xccDIxe1i6/kv4jKuCIO/0Zeo8tQUmo=
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

QWRkIGEgZnJlZXN0YW5kaW5nIGZ1bmN0aW9uIGFyZ3VtZW50IHRvIGRybV9tb2RlX3BhcnNlX2Nt
ZGxpbmVfb3B0aW9ucygpCnNpbWlsYXIgdG8gaG93IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfZXh0
cmEoKSBhbHJlYWR5IGhhcyB0aGlzLgoKVGhpcyBpcyBhIHByZXBhcmF0aW9uIHBhdGNoIGZvciBh
bGxvd2luZyBwYXJzaW5nIG9mIHN0YW5kLWFsb25lIG9wdGlvbnMKd2l0aG91dCBhIG1vZGUgYmVm
b3JlIHRoZW0sIGUuZy46IHZpZGVvPUhETUktMTptYXJnaW5fcmlnaHQ9MTQsLi4uCgpTaWduZWQt
b2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fbW9kZXMuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX21vZGVzLmMKaW5kZXggMjVlOGVkZjRjZmI4Li44MGNiMjQ3YzgzYzcgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX21vZGVzLmMKQEAgLTE1OTIsNiArMTU5Miw3IEBAIHN0YXRpYyBpbnQgZHJtX21vZGVf
cGFyc2VfY21kbGluZV9pbnQoY29uc3QgY2hhciAqZGVsaW0sIHVuc2lnbmVkIGludCAqaW50X3Jl
dCkKIH0KIAogc3RhdGljIGludCBkcm1fbW9kZV9wYXJzZV9jbWRsaW5lX29wdGlvbnMoY29uc3Qg
Y2hhciAqc3RyLAorCQkJCQkgIGJvb2wgZnJlZXN0YW5kaW5nLAogCQkJCQkgIGNvbnN0IHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJCQkJCSAgc3RydWN0IGRybV9jbWRsaW5lX21v
ZGUgKm1vZGUpCiB7CkBAIC0xNjYzLDYgKzE2NjQsOSBAQCBzdGF0aWMgaW50IGRybV9tb2RlX3Bh
cnNlX2NtZGxpbmVfb3B0aW9ucyhjb25zdCBjaGFyICpzdHIsCiAJCW9wdGlvbiA9IHNlcCArIDE7
CiAJfSB3aGlsZSAoc2VwKTsKIAorCWlmIChyb3RhdGlvbiAmJiBmcmVlc3RhbmRpbmcpCisJCXJl
dHVybiAtRUlOVkFMOworCiAJbW9kZS0+cm90YXRpb25fcmVmbGVjdGlvbiA9IHJvdGF0aW9uOwog
CiAJcmV0dXJuIDA7CkBAIC0xODU1LDYgKzE4NTksNyBAQCBib29sIGRybV9tb2RlX3BhcnNlX2Nv
bW1hbmRfbGluZV9mb3JfY29ubmVjdG9yKGNvbnN0IGNoYXIgKm1vZGVfb3B0aW9uLAogCiAJaWYg
KG9wdGlvbnNfcHRyKSB7CiAJCXJldCA9IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfb3B0aW9ucyhv
cHRpb25zX3B0ciArIDEsCisJCQkJCQkgICAgIGZhbHNlLAogCQkJCQkJICAgICBjb25uZWN0b3Is
IG1vZGUpOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIGZhbHNlOwotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
