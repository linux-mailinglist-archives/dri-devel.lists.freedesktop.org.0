Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD075DCBAE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 18:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC79C6E153;
	Fri, 18 Oct 2019 16:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176F76E153
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 16:39:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 620483086213;
 Fri, 18 Oct 2019 16:39:27 +0000 (UTC)
Received: from datura.bss.redhat.com (dhcp-10-20-1-78.bss.redhat.com
 [10.20.1.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1697F60A97;
 Fri, 18 Oct 2019 16:39:27 +0000 (UTC)
From: Adam Jackson <ajax@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/fourcc: Fix undefined left shift in DRM_FORMAT_BIG_ENDIAN
 macros
Date: Fri, 18 Oct 2019 12:39:26 -0400
Message-Id: <20191018163926.598570-1-ajax@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 18 Oct 2019 16:39:27 +0000 (UTC)
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
Cc: Eric Engestrom <eric.engestrom@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTw8MzEgaXMgdW5kZWZpbmVkIGJlY2F1c2UgaXQncyBhIHNpZ25lZCBpbnQgYW5kIEMgaXMgdGVy
cmlibGUuCgpSZXZpZXdlZC1ieTogRXJpYyBFbmdlc3Ryb20gPGVyaWMuZW5nZXN0cm9tQGludGVs
LmNvbT4KLS0tCiBpbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgK
aW5kZXggM2ZlZWFhM2Y5ODdhLi5jMDZkMzQ1NTlmYWIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFw
aS9kcm0vZHJtX2ZvdXJjYy5oCisrKyBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCkBA
IC02OSw3ICs2OSw3IEBAIGV4dGVybiAiQyIgewogI2RlZmluZSBmb3VyY2NfY29kZShhLCBiLCBj
LCBkKSAoKF9fdTMyKShhKSB8ICgoX191MzIpKGIpIDw8IDgpIHwgXAogCQkJCSAoKF9fdTMyKShj
KSA8PCAxNikgfCAoKF9fdTMyKShkKSA8PCAyNCkpCiAKLSNkZWZpbmUgRFJNX0ZPUk1BVF9CSUdf
RU5ESUFOICgxPDwzMSkgLyogZm9ybWF0IGlzIGJpZyBlbmRpYW4gaW5zdGVhZCBvZiBsaXR0bGUg
ZW5kaWFuICovCisjZGVmaW5lIERSTV9GT1JNQVRfQklHX0VORElBTiAoMVU8PDMxKSAvKiBmb3Jt
YXQgaXMgYmlnIGVuZGlhbiBpbnN0ZWFkIG9mIGxpdHRsZSBlbmRpYW4gKi8KIAogLyogUmVzZXJ2
ZSAwIGZvciB0aGUgaW52YWxpZCBmb3JtYXQgc3BlY2lmaWVyICovCiAjZGVmaW5lIERSTV9GT1JN
QVRfSU5WQUxJRAkwCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
