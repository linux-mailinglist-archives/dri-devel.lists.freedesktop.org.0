Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E13463FC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036776EC0C;
	Tue, 23 Mar 2021 15:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD486EC19
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:44 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 27/70] drm/i915: Make __engine_unpark() compatible with ww
 locking.
Date: Tue, 23 Mar 2021 16:50:16 +0100
Message-Id: <20210323155059.628690-28-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGFrZSB0aGUgd3cgbG9jayBhcm91bmQgZW5naW5lX3VucGFyay4gQmVjYXVzZSBvZiB0aGUKbWFu
eSBtYW55IHBsYWNlcyB3aGVyZSBycG0gaXMgdXNlZCwgSSBjaG9zZSB0aGUgc2FmZXN0IG9wdGlv
bgphbmQgdXNlZCBhIHRyeWxvY2sgdG8gb3Bwb3J0dW5pc3RpY2FsbHkgdGFrZSB0aGlzIGxvY2sg
Zm9yCl9fZW5naW5lX3VucGFyay4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBUaG9tYXMgSGVs
bHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5naW5lX3BtLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9lbmdpbmVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9w
bS5jCmluZGV4IDI3ZDlkMTdiMzVjYi4uYmRkYzVjOThmYjA0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfcG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9pbnRlbF9lbmdpbmVfcG0uYwpAQCAtMjcsMTIgKzI3LDE2IEBAIHN0YXRpYyB2b2lk
IGRiZ19wb2lzb25fY2Uoc3RydWN0IGludGVsX2NvbnRleHQgKmNlKQogCQlpbnQgdHlwZSA9IGk5
MTVfY29oZXJlbnRfbWFwX3R5cGUoY2UtPmVuZ2luZS0+aTkxNSk7CiAJCXZvaWQgKm1hcDsKIAor
CQlpZiAoIWk5MTVfZ2VtX29iamVjdF90cnlsb2NrKG9iaikpCisJCQlyZXR1cm47CisKIAkJbWFw
ID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAob2JqLCB0eXBlKTsKIAkJaWYgKCFJU19FUlIobWFw
KSkgewogCQkJbWVtc2V0KG1hcCwgQ09OVEVYVF9SRURaT05FLCBvYmotPmJhc2Uuc2l6ZSk7CiAJ
CQlpOTE1X2dlbV9vYmplY3RfZmx1c2hfbWFwKG9iaik7CiAJCQlpOTE1X2dlbV9vYmplY3RfdW5w
aW5fbWFwKG9iaik7CiAJCX0KKwkJaTkxNV9nZW1fb2JqZWN0X3VubG9jayhvYmopOwogCX0KIH0K
IAotLSAKMi4zMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
