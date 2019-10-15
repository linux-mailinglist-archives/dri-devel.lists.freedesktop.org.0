Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AE1D6FF3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295326E60A;
	Tue, 15 Oct 2019 07:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E856E145
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 01:16:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 184EEB276;
 Tue, 15 Oct 2019 01:16:00 +0000 (UTC)
From: Davidlohr Bueso <dave@stgolabs.net>
To: robdclark@gmail.com
Subject: [PATCH] drm/msm/a5xx: Fix barrier usage in set_preempt_state()
Date: Mon, 14 Oct 2019 18:14:38 -0700
Message-Id: <20191015011438.22184-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.16.4
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
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
Cc: dave@stgolabs.net, sean@poorly.run, dri-devel@lists.freedesktop.org,
 Davidlohr Bueso <dbueso@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVjYXVzZSBpdCBpcyBub3QgYSBSbXcgb3BlcmF0aW9uLCBhdG9taWNfc2V0KCkgaXMgbmV2ZXIg
c2VyaWFsaXplZCwKYW5kIHRoZXJlZm9yZSB0aGUgJ3VwZ3JhZGFibGUnIHNtcF9tYl9fe2JlZm9y
ZSxhZnRlcn1fYXRvbWljKCkgY2FsbHMKdGhhdCBvcmRlciB0aGUgd3JpdGUgdG8gcHJlZW1wdF9z
dGF0ZSBhcmUgY29tcGxldGVseSBib2d1cy4KClRoaXMgcGF0Y2ggcmVwbGFjZXMgdGhlc2Ugd2l0
aCBzbXBfbWIoKSwgd2hpY2ggc2VlbXMgbGlrZSB0aGUKb3JpZ2luYWwgaW50ZW50IG9mIHdoZW4g
dGhlIGNvZGUgd2FzIHdyaXR0ZW4uCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZGxvaHIgQnVlc28gPGRi
dWVzb0BzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfcHJlZW1w
dC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfcHJlZW1w
dC5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9wcmVlbXB0LmMKaW5kZXggOWNm
OTM1M2E3ZmYxLi5kMjdkOGQzMjA4YzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2E1eHhfcHJlZW1wdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1
eHhfcHJlZW1wdC5jCkBAIC0zMCwxMCArMzAsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIHNldF9w
cmVlbXB0X3N0YXRlKHN0cnVjdCBhNXh4X2dwdSAqZ3B1LAogCSAqIHByZWVtcHRpb24gb3IgaW4g
dGhlIGludGVycnVwdCBoYW5kbGVyIHNvIGJhcnJpZXJzIGFyZSBuZWVkZWQKIAkgKiBiZWZvcmUu
Li4KIAkgKi8KLQlzbXBfbWJfX2JlZm9yZV9hdG9taWMoKTsKKwlzbXBfbWIoKTsKIAlhdG9taWNf
c2V0KCZncHUtPnByZWVtcHRfc3RhdGUsIG5ldyk7CiAJLyogLi4uIGFuZCBhZnRlciovCi0Jc21w
X21iX19hZnRlcl9hdG9taWMoKTsKKwlzbXBfbWIoKTsKIH0KIAogLyogV3JpdGUgdGhlIG1vc3Qg
cmVjZW50IHdwdHIgZm9yIHRoZSBnaXZlbiByaW5nIGludG8gdGhlIGhhcmR3YXJlICovCi0tIAoy
LjE2LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
