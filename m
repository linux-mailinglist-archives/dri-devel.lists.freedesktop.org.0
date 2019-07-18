Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AB86C47A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 03:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2182F6E2D3;
	Thu, 18 Jul 2019 01:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459746E2D3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 01:44:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C8F53369AC;
 Thu, 18 Jul 2019 01:44:38 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 904AE19C67;
 Thu, 18 Jul 2019 01:44:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/26] drm/dp_mst: Destroy topology_mgr mutexes
Date: Wed, 17 Jul 2019 21:42:36 -0400
Message-Id: <20190718014329.8107-14-lyude@redhat.com>
In-Reply-To: <20190718014329.8107-1-lyude@redhat.com>
References: <20190718014329.8107-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 18 Jul 2019 01:44:38 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Juston Li <juston.li@intel.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHVybnMgb3V0IHdlJ3ZlIGJlZW4gZm9yZ2V0dGluZyBmb3IgYSB3aGlsZSBub3cgdG8gYWN0dWFs
bHkgZGVzdHJveSBhbnkKb2YgdGhlIG11dGV4ZXMgdGhhdCB3ZSBjcmVhdGUgaW4gZHJtX2RwX21z
dF90b3BvbG9neV9tZ3IuIFNvLCBsZXQncyBkbwp0aGF0LgoKQ2M6IEp1c3RvbiBMaSA8anVzdG9u
LmxpQGludGVsLmNvbT4KQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KQ2M6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBIYXJyeSBX
ZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1
ZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
IHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDllN2ZjNmE5NjA4MC4uMjY1NDFhZjQ3ZDkxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTQyMDUsNiArNDIwNSwxMSBA
QCB2b2lkIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2Rlc3Ryb3koc3RydWN0IGRybV9kcF9tc3Rf
dG9wb2xvZ3lfbWdyICptZ3IpCiAJbWdyLT5hdXggPSBOVUxMOwogCWRybV9hdG9taWNfcHJpdmF0
ZV9vYmpfZmluaSgmbWdyLT5iYXNlKTsKIAltZ3ItPmZ1bmNzID0gTlVMTDsKKworCW11dGV4X2Rl
c3Ryb3koJm1nci0+ZGVzdHJveV9jb25uZWN0b3JfbG9jayk7CisJbXV0ZXhfZGVzdHJveSgmbWdy
LT5wYXlsb2FkX2xvY2spOworCW11dGV4X2Rlc3Ryb3koJm1nci0+cWxvY2spOworCW11dGV4X2Rl
c3Ryb3koJm1nci0+bG9jayk7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9kcF9tc3RfdG9wb2xvZ3lf
bWdyX2Rlc3Ryb3kpOwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
