Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2071717F92
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 20:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A178981D;
	Wed,  8 May 2019 18:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A58C8981D;
 Wed,  8 May 2019 18:12:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 11:12:08 -0700
X-ExtLoop1: 1
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by orsmga006.jf.intel.com with ESMTP; 08 May 2019 11:12:04 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [v9 02/13] drm: Add reference counting on HDR metadata blob
Date: Thu,  9 May 2019 00:08:42 +0530
Message-Id: <1557340733-9629-3-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557340733-9629-1-git-send-email-uma.shankar@intel.com>
References: <1557340733-9629-1-git-send-email-uma.shankar@intel.com>
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, emil.l.velikov@gmail.com,
 Uma Shankar <uma.shankar@intel.com>, seanpaul@chromium.org,
 ville.syrjala@intel.com, maarten.lankhorst@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgoKVGhpcyBhZGRzIHJlZmVyZW5j
ZSBjb3VudCBmb3IgSERSIG1ldGFkYXRhIGJsb2IsCmhhbmRsZWQgYXMgcGFydCBvZiBkdXBsaWNh
dGUgYW5kIGRlc3Ryb3kgY29ubmVjdG9yCnN0YXRlIGZ1bmN0aW9ucy4KClNpZ25lZC1vZmYtYnk6
IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5r
YXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21p
Y19zdGF0ZV9oZWxwZXIuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYwppbmRleCBhYzky
OWY2Li44ZjQ5OTUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19zdGF0
ZV9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIu
YwpAQCAtMzkxLDYgKzM5MSwxMCBAQCB2b2lkIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9y
ZXNldChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCQlkcm1fY29ubmVjdG9yX2dl
dChjb25uZWN0b3IpOwogCXN0YXRlLT5jb21taXQgPSBOVUxMOwogCisJaWYgKHN0YXRlLT5oZHJf
b3V0cHV0X21ldGFkYXRhKQorCQlkcm1fcHJvcGVydHlfYmxvYl9nZXQoc3RhdGUtPmhkcl9vdXRw
dXRfbWV0YWRhdGEpOworCXN0YXRlLT5oZHJfbWV0YWRhdGFfY2hhbmdlZCA9IGZhbHNlOworCiAJ
LyogRG9uJ3QgY29weSBvdmVyIGEgd3JpdGViYWNrIGpvYiwgdGhleSBhcmUgdXNlZCBvbmx5IG9u
Y2UgKi8KIAlzdGF0ZS0+d3JpdGViYWNrX2pvYiA9IE5VTEw7CiB9CkBAIC00MzgsNiArNDQyLDgg
QEAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKgogCiAJaWYgKHN0YXRlLT53cml0ZWJhY2tf
am9iKQogCQlkcm1fd3JpdGViYWNrX2NsZWFudXBfam9iKHN0YXRlLT53cml0ZWJhY2tfam9iKTsK
KworCWRybV9wcm9wZXJ0eV9ibG9iX3B1dChzdGF0ZS0+aGRyX291dHB1dF9tZXRhZGF0YSk7CiB9
CiBFWFBPUlRfU1lNQk9MKF9fZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3Rh
dGUpOwogCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
