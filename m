Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762FD2086B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 15:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E8B8961D;
	Thu, 16 May 2019 13:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAB889617;
 Thu, 16 May 2019 13:43:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2019 06:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,476,1549958400"; d="scan'208";a="172353982"
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by fmsmga002.fm.intel.com with ESMTP; 16 May 2019 06:43:12 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [v11 02/12] drm: Add reference counting on HDR metadata blob
Date: Thu, 16 May 2019 19:40:07 +0530
Message-Id: <1558015817-12025-3-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558015817-12025-1-git-send-email-uma.shankar@intel.com>
References: <1558015817-12025-1-git-send-email-uma.shankar@intel.com>
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
 Uma Shankar <uma.shankar@intel.com>, seanpaul@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgoKVGhpcyBhZGRzIHJlZmVyZW5j
ZSBjb3VudCBmb3IgSERSIG1ldGFkYXRhIGJsb2IsCmhhbmRsZWQgYXMgcGFydCBvZiBkdXBsaWNh
dGUgYW5kIGRlc3Ryb3kgY29ubmVjdG9yCnN0YXRlIGZ1bmN0aW9ucy4KCnYyOiBSZW1vdmVkIHRo
ZSBoZHJfbWV0YWRhdGFfY2hhbmdlZCBpbml0aWFsaXphdGlvbiBhcwp0aGUgdmFyaWFibGUgaXMg
ZHJvcHBlZCBhbmQgbm90IHJlcXVpcmVkLgoKU2lnbmVkLW9mZi1ieTogSm9uYXMgS2FybG1hbiA8
am9uYXNAa3dpYm9vLnNlPgpTaWduZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJA
aW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5j
IHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMKaW5kZXggYWM5MjlmNi4uZWMxMzgyMyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMKQEAgLTM5MSw2ICszOTEs
OSBAQCB2b2lkIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldChzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yKQogCQlkcm1fY29ubmVjdG9yX2dldChjb25uZWN0b3IpOwogCXN0
YXRlLT5jb21taXQgPSBOVUxMOwogCisJaWYgKHN0YXRlLT5oZHJfb3V0cHV0X21ldGFkYXRhKQor
CQlkcm1fcHJvcGVydHlfYmxvYl9nZXQoc3RhdGUtPmhkcl9vdXRwdXRfbWV0YWRhdGEpOworCiAJ
LyogRG9uJ3QgY29weSBvdmVyIGEgd3JpdGViYWNrIGpvYiwgdGhleSBhcmUgdXNlZCBvbmx5IG9u
Y2UgKi8KIAlzdGF0ZS0+d3JpdGViYWNrX2pvYiA9IE5VTEw7CiB9CkBAIC00MzgsNiArNDQxLDgg
QEAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKgogCiAJaWYgKHN0YXRlLT53cml0ZWJhY2tf
am9iKQogCQlkcm1fd3JpdGViYWNrX2NsZWFudXBfam9iKHN0YXRlLT53cml0ZWJhY2tfam9iKTsK
KworCWRybV9wcm9wZXJ0eV9ibG9iX3B1dChzdGF0ZS0+aGRyX291dHB1dF9tZXRhZGF0YSk7CiB9
CiBFWFBPUlRfU1lNQk9MKF9fZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3Rh
dGUpOwogCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
