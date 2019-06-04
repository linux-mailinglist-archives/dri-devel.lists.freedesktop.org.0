Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7352434C79
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 17:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F5289A5D;
	Tue,  4 Jun 2019 15:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75C089A56
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 15:42:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6316AEC7;
 Tue,  4 Jun 2019 15:42:05 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, christian.koenig@amd.com
Subject: [PATCH 1/8] drm/ast: Unpin cursor BO during cleanup
Date: Tue,  4 Jun 2019 17:41:54 +0200
Message-Id: <20190604154201.14460-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604154201.14460-1-tzimmermann@suse.de>
References: <20190604154201.14460-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHVucGluIG9wZXJhdGlvbiB3YXMgbWlzc2luZyBmcm9tIGFzdF9jdXJzb3JfZmluaSgpLiBG
aXhlZCBub3cuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYwppbmRleCBmYjcw
MGQ2MjBiNjQuLjQxNzQxY2Q2Y2QxNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfbW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYwpAQCAtOTU5LDYg
Kzk1OSw3IEBAIHN0YXRpYyB2b2lkIGFzdF9jdXJzb3JfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2KQogCXN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm8gPQogCQlkcm1fZ2VtX3ZyYW1f
b2ZfZ2VtKGFzdC0+Y3Vyc29yX2NhY2hlKTsKIAlkcm1fZ2VtX3ZyYW1fa3VubWFwX2F0KGdibywg
JmFzdC0+Y2FjaGVfa21hcCk7CisJZHJtX2dlbV92cmFtX3VucGluKGdibyk7CiAJZHJtX2dlbV9v
YmplY3RfcHV0X3VubG9ja2VkKGFzdC0+Y3Vyc29yX2NhY2hlKTsKIH0KIAotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
