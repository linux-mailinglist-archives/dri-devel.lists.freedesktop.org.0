Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490ED1860A
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FF989BB3;
	Thu,  9 May 2019 07:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DB989994
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 04:34:34 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x494XFBm003700; Thu, 9 May 2019 05:34:28 +0100
Received: from hhmail02.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com with ESMTP id 2scb9h03fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 09 May 2019 05:34:28 +0100
Received: from michael-imgtec.tp.imgtec.org (10.80.17.22) by
 hhmail02.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 9 May 2019 05:34:26 +0100
From: Michael Yang <michael.yang@imgtec.com>
To: <sumit.semwal@linaro.org>
Subject: [PATCH] sync_file: Return reasonable timestamp when merging signaled
 fences
Date: Thu, 9 May 2019 12:34:11 +0800
Message-ID: <1557376451-20164-1-git-send-email-michael.yang@imgtec.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554710495-6646-1-git-send-email-michael.yang@imgtec.com>
References: <1554710495-6646-1-git-send-email-michael.yang@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.17.22]
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=imgtec.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=dk201812; bh=TUGJ2U0A2v399my7K+20ZfwrAtvVzXgUK8GFLa6dde4=;
 b=L96NZE2espTAXuQoSBjx6LHFL6m+wMKsIOpCTvYicbx9oKxHqxl9GRbtKux7Zto3fA8P
 g0+w8MKUIT7kdqCK2NAB1m9WeH/XpLlCk0W5vKgohHQYF2Yr42zdWs5jI0Tu481bm7OO
 hLKqQEQAWoM4UXG0pNxG+KNZPL+xKhhj6bKkXmfn58qqhKhLJ68mB818uNMSOFgyf88Q
 yv8cxuMywhwTG2i3cJ3w99z8dNFrXPhBMFigePXPHG1gc+jCjJHZ7I1qM1TH3jFjEhCO
 bbrZmEJY98hdOYxKB6Zsxdfa1XCL/Le73loxywaGPRaCTqBkPJZCxk2u65FBc1A94RFK CA== 
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, gregkh@linuxfoundation.org,
 michael.yang@imgtec.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYWxsIHRoZSBzeW5jIHBvaW50cyB3ZXJlIHNpZ25hbGVkIGluIGJvdGggZmVuY2VzIGEgYW5k
IGIsCnRoZXJlIHdhcyBvbmx5IG9uZSBzeW5jIHBvaW50IGluIG1lcmdlZCBmZW5jZSB3aGljaCBp
cyBhX2ZlbmNlWzBdLgpUaGUgRmVuY2Ugc3RydWN0dXJlIGluIGFuZHJvaWQgZnJhbWV3b3JrIG1p
Z2h0IGJlIGNvbmZ1c2VkIGFib3V0CnRpbWVzdGFtcCBpZiB0aGVyZSB3ZXJlIGFueSBzeW5jIHBv
aW50cyB3aGljaCB3ZXJlIHNpZ25hbGVkIGFmdGVyCmFfZmVuY2VbMF0uIEl0IG1pZ2h0IGJlIG1v
cmUgcmVhc29uYWJsZSB0byB1c2UgdGltZXN0YW1wIG9mIGxhc3Qgc2lnbmFsZWQKc3luYyBwb2lu
dCB0byByZXByZXNlbnQgdGhlIG1lcmdlZCBmZW5jZS4KVGhlIGlzc3VlIGNhbiBiZSBmb3VuZCBm
cm9tIEVHTCBleHRlbnNpb24gQU5EUk9JRF9nZXRfZnJhbWVfdGltZXN0YW1wcy4KU29tZXRpbWVz
IHRoZSByZXR1cm4gdmFsdWUgb2YgRUdMX1JFQURTX0RPTkVfVElNRV9BTkRST0lEIGlzIGhlYWQg
b2YKdGhlIHJldHVybiB2YWx1ZSBvZiBFR0xfUkVOREVSSU5HX0NPTVBMRVRFX1RJTUVfQU5EUk9J
RC4KVGhhdCBtZWFucyBkaXNwbGF5L2NvbXBvc2l0aW9uIGhhZCBiZWVuIGNvbXBsZXRlZCBiZWZv
cmUgcmVuZGVyaW5nCndhcyBjb21wbGV0ZWQgdGhhdCBpcyBpbmNvcnJlY3QuCgpTb21lIGRpc2N1
c3Npb24gY2FuIGJlIGZvdW5kIGF0OgpodHRwczovL2FuZHJvaWQtcmV2aWV3Lmdvb2dsZXNvdXJj
ZS5jb20vYy9rZXJuZWwvY29tbW9uLysvOTA3MDA5CgpTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFlh
bmcgPG1pY2hhZWwueWFuZ0BpbWd0ZWMuY29tPgotLS0KSGksCkkgZGlkbid0IGdldCByZXNwb25z
ZSBzaW5jZSBJIHByZXZpb3VzbHkgc2VudCB0aGlzIGEgbW9udGggYWdvLgpDb3VsZCBzb21lb25l
IGhhdmUgYSBjaGFuY2UgdG8gbG9vayBhdCBpdCBwbGVhc2U/ClRoYW5rcy4KIGRyaXZlcnMvZG1h
LWJ1Zi9zeW5jX2ZpbGUuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZG1hLWJ1Zi9zeW5jX2ZpbGUuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9zeW5jX2ZpbGUuYwpp
bmRleCA0ZjYzMDVjLi5kNDZiZmUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvc3luY19m
aWxlLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL3N5bmNfZmlsZS5jCkBAIC0yNzQsOCArMjc0LDI5
IEBAIHN0YXRpYyBzdHJ1Y3Qgc3luY19maWxlICpzeW5jX2ZpbGVfbWVyZ2UoY29uc3QgY2hhciAq
bmFtZSwgc3RydWN0IHN5bmNfZmlsZSAqYSwKIAlmb3IgKDsgaV9iIDwgYl9udW1fZmVuY2VzOyBp
X2IrKykKIAkJYWRkX2ZlbmNlKGZlbmNlcywgJmksIGJfZmVuY2VzW2lfYl0pOwogCi0JaWYgKGkg
PT0gMCkKLQkJZmVuY2VzW2krK10gPSBkbWFfZmVuY2VfZ2V0KGFfZmVuY2VzWzBdKTsKKwkvKiBJ
ZiBhbGwgdGhlIHN5bmMgcHRzIHdlcmUgc2lnbmFsZWQsIHRoZW4gYWRkaW5nIHRoZSBzeW5jX3B0
IHdobworCSAqIHdhcyB0aGUgbGFzdCBzaWduYWxlZCB0byB0aGUgZmVuY2UuCisJICovCisJaWYg
KGkgPT0gMCkgeworCQlzdHJ1Y3QgZG1hX2ZlbmNlICpsYXN0X3NpZ25hbGVkX3N5bmNfcHQgPSBh
X2ZlbmNlc1swXTsKKwkJaW50IGl0ZXI7CisKKwkJZm9yIChpdGVyID0gMTsgaXRlciA8IGFfbnVt
X2ZlbmNlczsgaXRlcisrKSB7CisJCQlpZiAoa3RpbWVfY29tcGFyZShsYXN0X3NpZ25hbGVkX3N5
bmNfcHQtPnRpbWVzdGFtcCwKKwkJCQlhX2ZlbmNlc1tpdGVyXS0+dGltZXN0YW1wKSA8IDApIHsK
KwkJCQlsYXN0X3NpZ25hbGVkX3N5bmNfcHQgPSBhX2ZlbmNlc1tpdGVyXTsKKwkJCX0KKwkJfQor
CisJCWZvciAoaXRlciA9IDA7IGl0ZXIgPCBiX251bV9mZW5jZXM7IGl0ZXIrKykgeworCQkJaWYg
KGt0aW1lX2NvbXBhcmUobGFzdF9zaWduYWxlZF9zeW5jX3B0LT50aW1lc3RhbXAsCisJCQkJYl9m
ZW5jZXNbaXRlcl0tPnRpbWVzdGFtcCkgPCAwKSB7CisJCQkJbGFzdF9zaWduYWxlZF9zeW5jX3B0
ID0gYl9mZW5jZXNbaXRlcl07CisJCQl9CisJCX0KKworCQlmZW5jZXNbaSsrXSA9IGRtYV9mZW5j
ZV9nZXQobGFzdF9zaWduYWxlZF9zeW5jX3B0KTsKKwl9CiAKIAlpZiAobnVtX2ZlbmNlcyA+IGkp
IHsKIAkJbmZlbmNlcyA9IGtyZWFsbG9jKGZlbmNlcywgaSAqIHNpemVvZigqZmVuY2VzKSwKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
