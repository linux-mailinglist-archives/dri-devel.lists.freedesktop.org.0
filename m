Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E39346416
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A1A6EC1C;
	Tue, 23 Mar 2021 15:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC58A6EC0C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:43 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 55/70] drm/i915/selftests: Prepare ring submission for
 obj->mm.lock removal
Date: Tue, 23 Mar 2021 16:50:44 +0100
Message-Id: <20210323155059.628690-56-maarten.lankhorst@linux.intel.com>
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

VXNlIHVubG9ja2VkIHZlcnNpb25zIHdoZW4gdGhlIHd3IGxvY2sgaXMgbm90IGhlbGQuCgpTaWdu
ZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21A
bGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X3Jp
bmdfc3VibWlzc2lvbi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3Nl
bGZ0ZXN0X3Jpbmdfc3VibWlzc2lvbi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRl
c3RfcmluZ19zdWJtaXNzaW9uLmMKaW5kZXggNmNkOWY2YmMyNDBjLi5jMTJlNzQxNzFiNjMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X3Jpbmdfc3VibWlzc2lv
bi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X3Jpbmdfc3VibWlzc2lv
bi5jCkBAIC0zNSw3ICszNSw3IEBAIHN0YXRpYyBzdHJ1Y3QgaTkxNV92bWEgKmNyZWF0ZV93YWxs
eShzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUpCiAJCXJldHVybiBFUlJfUFRSKGVycik7
CiAJfQogCi0JY3MgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcChvYmosIEk5MTVfTUFQX1dDKTsK
KwljcyA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKG9iaiwgSTkxNV9NQVBfV0Mp
OwogCWlmIChJU19FUlIoY3MpKSB7CiAJCWk5MTVfZ2VtX29iamVjdF9wdXQob2JqKTsKIAkJcmV0
dXJuIEVSUl9DQVNUKGNzKTsKQEAgLTIxMiw3ICsyMTIsNyBAQCBzdGF0aWMgaW50IF9fbGl2ZV9j
dHhfc3dpdGNoX3dhKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSkKIAlpZiAoSVNfRVJS
KGJiKSkKIAkJcmV0dXJuIFBUUl9FUlIoYmIpOwogCi0JcmVzdWx0ID0gaTkxNV9nZW1fb2JqZWN0
X3Bpbl9tYXAoYmItPm9iaiwgSTkxNV9NQVBfV0MpOworCXJlc3VsdCA9IGk5MTVfZ2VtX29iamVj
dF9waW5fbWFwX3VubG9ja2VkKGJiLT5vYmosIEk5MTVfTUFQX1dDKTsKIAlpZiAoSVNfRVJSKHJl
c3VsdCkpIHsKIAkJaW50ZWxfY29udGV4dF9wdXQoYmItPnByaXZhdGUpOwogCQlpOTE1X3ZtYV91
bnBpbl9hbmRfcmVsZWFzZSgmYmIsIDApOwotLSAKMi4zMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
