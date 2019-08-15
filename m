Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03AE91151
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167906E527;
	Sat, 17 Aug 2019 15:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF2956E2A8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:05:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,388,1559487600"; d="scan'208";a="24088309"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2019 20:05:15 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id F1625417763E;
 Thu, 15 Aug 2019 20:05:09 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
Date: Thu, 15 Aug 2019 12:04:29 +0100
Message-Id: <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byBrbm93IGlmIHRoZSBwYW5lbCBzdXBwb3J0cyBkdWFsLWxpbmssIHNpbWlsYXJs
eQp0byBicmlkZ2VzLCB0aGVyZWZvcmUgYWRkIGEgcmVmZXJlbmNlIHRvIGRybV90aW1pbmdzIGlu
CmRybV9wYW5lbC4KClNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2Fz
dHJvQGJwLnJlbmVzYXMuY29tPgoKLS0tCnYxLT52MjoKKiBuZXcgcGF0Y2gKCiBpbmNsdWRlL2Ry
bS9kcm1fcGFuZWwuaCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggYi9pbmNsdWRlL2RybS9kcm1fcGFu
ZWwuaAppbmRleCA4YzczOGMwLi5jZDZmZjA3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1f
cGFuZWwuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaApAQCAtMjYsNiArMjYsNyBAQAog
CiAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4KICNpbmNsdWRlIDxsaW51eC9saXN0Lmg+CisjaW5j
bHVkZSA8ZHJtL2RybV90aW1pbmdzLmg+CiAKIHN0cnVjdCBkZXZpY2Vfbm9kZTsKIHN0cnVjdCBk
cm1fY29ubmVjdG9yOwpAQCAtODEsNiArODIsNyBAQCBzdHJ1Y3QgZHJtX3BhbmVsX2Z1bmNzIHsK
ICAqIHN0cnVjdCBkcm1fcGFuZWwgLSBEUk0gcGFuZWwgb2JqZWN0CiAgKiBAZHJtOiBEUk0gZGV2
aWNlIG93bmluZyB0aGUgcGFuZWwKICAqIEBjb25uZWN0b3I6IERSTSBjb25uZWN0b3IgdGhhdCB0
aGUgcGFuZWwgaXMgYXR0YWNoZWQgdG8KKyAqIEB0aW1pbmdzOiB0aW1pbmcgaW5mb3JtYXRpb24K
ICAqIEBkZXY6IHBhcmVudCBkZXZpY2Ugb2YgdGhlIHBhbmVsCiAgKiBAbGluazogbGluayBmcm9t
IHBhbmVsIGRldmljZSAoc3VwcGxpZXIpIHRvIERSTSBkZXZpY2UgKGNvbnN1bWVyKQogICogQGZ1
bmNzOiBvcGVyYXRpb25zIHRoYXQgY2FuIGJlIHBlcmZvcm1lZCBvbiB0aGUgcGFuZWwKQEAgLTg5
LDYgKzkxLDcgQEAgc3RydWN0IGRybV9wYW5lbF9mdW5jcyB7CiBzdHJ1Y3QgZHJtX3BhbmVsIHsK
IAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtOwogCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3I7CisJY29uc3Qgc3RydWN0IGRybV90aW1pbmdzICp0aW1pbmdzOwogCXN0cnVjdCBkZXZpY2Ug
KmRldjsKIAogCWNvbnN0IHN0cnVjdCBkcm1fcGFuZWxfZnVuY3MgKmZ1bmNzOwotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
