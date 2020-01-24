Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AAF148F05
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 21:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CC172BA0;
	Fri, 24 Jan 2020 20:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE5272BA2;
 Fri, 24 Jan 2020 20:02:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 12:02:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="230435163"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 24 Jan 2020 12:02:44 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 Jan 2020 22:02:44 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/edid: Document why we don't bounds check the DispID
 CEA block start/end
Date: Fri, 24 Jan 2020 22:02:28 +0200
Message-Id: <20200124200231.10517-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, Andres Rodriguez <andresx7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFm
dGVyIG11Y2ggaGVhZCBzY3JhdGNoaW5nIEkgbWFuYWdlZCB0byBjb252aW5jZSBteXNlbGYgdGhh
dApmb3JfZWFjaF9kaXNwbGF5aWRfZGIoKSBoYXMgYWxyZWFkeSBkb25lIHRoZSBib3VuZHMgY2hl
Y2tzIGZvcgp0aGUgRGlzcElEIENFQSBkYXRhIGJsb2NrLiBXaGljaCBpcyB3aHkgd2UgZG9uJ3Qg
bmVlZCB0byByZXBlYXQKdGhlbSBpbiBjZWFfZGJfb2Zmc2V0cygpLiBUbyBhdm9pZCBoYXZpbmcg
dG8gZ28gdGhyb3VnaCB0aGF0CnBhaW4gYWdhaW4gaW4gdGhlIGZ1dHVyZSBhZGQgYSBjb21tZW50
IHdoaWNoIGV4cGxhaW5zIHRoaXMgZmFjdC4KCkNjOiBBbmRyZXMgUm9kcmlndWV6IDxhbmRyZXN4
N0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCA0ICsr
KysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCmluZGV4IDNk
ZjU3NDQwMjZiMC4uMDM2OWE1NGUzZDMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2VkaWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwpAQCAtNDAwMSw2ICs0MDAx
LDEwIEBAIGNlYV9kYl9vZmZzZXRzKGNvbnN0IHU4ICpjZWEsIGludCAqc3RhcnQsIGludCAqZW5k
KQogCSAqICAgbm8gbm9uLURURCBkYXRhLgogCSAqLwogCWlmIChjZWFbMF0gPT0gREFUQV9CTE9D
S19DVEEpIHsKKwkJLyoKKwkJICogZm9yX2VhY2hfZGlzcGxheWlkX2RiKCkgaGFzIGFscmVhZHkg
dmVyaWZpZWQKKwkJICogdGhhdCB0aGVzZSBzdGF5IHdpdGhpbiBleHBlY3RlZCBib3VuZHMuCisJ
CSAqLwogCQkqc3RhcnQgPSAzOwogCQkqZW5kID0gKnN0YXJ0ICsgY2VhWzJdOwogCX0gZWxzZSBp
ZiAoY2VhWzBdID09IENFQV9FWFQpIHsKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
