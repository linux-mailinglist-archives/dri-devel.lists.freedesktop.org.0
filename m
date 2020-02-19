Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 923E5165010
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 21:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86636ECAA;
	Wed, 19 Feb 2020 20:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58CF6ECA7;
 Wed, 19 Feb 2020 20:36:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 12:36:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="315506286"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 19 Feb 2020 12:36:10 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Feb 2020 22:36:10 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/12] drm: Shrink {width,height}_mm to u16
Date: Wed, 19 Feb 2020 22:35:38 +0200
Message-Id: <20200219203544.31013-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCklu
c3RlYWQgb2Ygc3VwcG9ydGluZyB+MjAwMGttIHdpZGUgZGlzcGxheWVzIGxldCdzIGxpbWl0IG91
cnNlbHZlcwp0byB+NjVtLiBUaGF0IHNlZW1zIHBsZW50eSBiaWcgZW5vdWdoIHRvIG1lLgoKRXZl
biB3aXRoIEVESURfUVVJUktfREVUQUlMRURfSU5fQ00gRURJRHMgc2VlbSB0byBiZSBsaW1pdGVk
IHRvCjEwKjB4ZmZmIHdoaWNoIGZpdHMgaW50byB0aGUgMTYgYml0cy4KClNpZ25lZC1vZmYtYnk6
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogaW5j
bHVkZS9kcm0vZHJtX21vZGVzLmggfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVz
LmggYi9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaAppbmRleCA1MmU4Y2E2MTNlNGIuLjJiYjJiMWE4
NTkyYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgKKysrIGIvaW5jbHVkZS9k
cm0vZHJtX21vZGVzLmgKQEAgLTMzMCw3ICszMzAsNyBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9k
ZSB7CiAJICogQWRkcmVzc2FibGUgc2l6ZSBvZiB0aGUgb3V0cHV0IGluIG1tLCBwcm9qZWN0b3Jz
IHNob3VsZCBzZXQgdGhpcyB0bwogCSAqIDAuCiAJICovCi0JaW50IHdpZHRoX21tOworCXUxNiB3
aWR0aF9tbTsKIAogCS8qKgogCSAqIEBoZWlnaHRfbW06CkBAIC0zMzgsNyArMzM4LDcgQEAgc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUgewogCSAqIEFkZHJlc3NhYmxlIHNpemUgb2YgdGhlIG91dHB1
dCBpbiBtbSwgcHJvamVjdG9ycyBzaG91bGQgc2V0IHRoaXMgdG8KIAkgKiAwLgogCSAqLwotCWlu
dCBoZWlnaHRfbW07CisJdTE2IGhlaWdodF9tbTsKIAogCS8qKgogCSAqIEBjcnRjX2Nsb2NrOgot
LSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
