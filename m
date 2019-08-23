Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 291039A839
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8846E570;
	Fri, 23 Aug 2019 07:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31C96E570
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 07:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id D781A3F60D;
 Fri, 23 Aug 2019 09:08:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r27BhqONBZdx; Fri, 23 Aug 2019 09:08:51 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 4DCB33F2D9;
 Fri, 23 Aug 2019 09:08:49 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 5F355360327;
 Fri, 23 Aug 2019 09:08:47 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: Cache dma pool decrypted pages when AMD SEV is
 active
Date: Fri, 23 Aug 2019 09:08:28 +0200
Message-Id: <20190823070828.18112-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823070828.18112-1-thomas_os@shipmail.org>
References: <20190823070828.18112-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566544128; bh=NgwaCwD3IjgHExCxdWfv6pPSC30qoGNRXc+pfxEfy78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n90vc4grYnWnUY0QI6sxCwAW4tdWgrKZN5gHqGD0A4uN/6Z7ANxgrI66AEhAsksp8
 GwvQUGS8iNZPG5UP69IH5lOrAD89GihsKpftGz8UZtJ97jcSi45fG5UOYo+jclHZgg
 538fzqsdvWlK8KeGGQsRZ2gyWWULgauShS1k8BJ4=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="n90vc4gr";
 dkim-atps=neutral
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
Cc: pv-drivers@vmware.com, Thomas Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, linux-graphics-maintainer@vmware.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIFRUTSBk
bWEgcG9vbCBhbGxvY2F0ZXMgY29oZXJlbnQgcGFnZXMgZm9yIHVzZSB3aXRoIFRUTS4gV2hlbiBT
RVYgaXMKYWN0aXZlLCBzdWNoIGFsbG9jYXRpb25zIGJlY29tZSB2ZXJ5IGV4cGVuc2l2ZSBzaW5j
ZSB0aGUgbGluZWFyIGtlcm5lbAptYXAgaGFzIHRvIGJlIGNoYW5nZWQgdG8gbWFyayB0aGUgcGFn
ZXMgZGVjcnlwdGVkLiBTbyB0byBhdm9pZCB0b28gbWFueQpzdWNoIGFsbG9jYXRpb25zIGFuZCBm
cmVlcywgY2FjaGUgdGhlIGRlY3J5cHRlZCBwYWdlcyBldmVuIGlmIHRoZXkKYXJlIGluIHRoZSBu
b3JtYWwgY3B1IGNhY2hpbmcgc3RhdGUsIHdoZXJlIG90aGVyd2lzZSB0aGUgcG9vbCBmcmVlcyB0
aGVtCmltbWVkaWF0ZWx5IHdoZW4gdW51c2VkLgoKVGVzdGVkIHdpdGggdm13Z2Z4IG9uIFNFVi1F
Uy4KCkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBU
aG9tYXMgTGVuZGFja3kgPHRob21hcy5sZW5kYWNreUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fcGFnZV9hbGxvY19kbWEuYyB8IDE5ICsrKysrKysrKysrKysrLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jCmluZGV4IGM3ZTIyM2M0ZjI2Yy4uYTQ0NDVh
ODNiYzk2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2Rt
YS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMKQEAgLTk5
OSw3ICs5OTksNyBAQCB2b2lkIHR0bV9kbWFfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RtYV90dCAq
dHRtX2RtYSwgc3RydWN0IGRldmljZSAqZGV2KQogCXN0cnVjdCBkbWFfcG9vbCAqcG9vbDsKIAlz
dHJ1Y3QgZG1hX3BhZ2UgKmRfcGFnZSwgKm5leHQ7CiAJZW51bSBwb29sX3R5cGUgdHlwZTsKLQli
b29sIGlzX2NhY2hlZCA9IGZhbHNlOworCWJvb2wgaW1tZWRpYXRlX2ZyZWUgPSBmYWxzZTsKIAl1
bnNpZ25lZCBjb3VudCwgaSwgbnBhZ2VzID0gMDsKIAl1bnNpZ25lZCBsb25nIGlycV9mbGFnczsK
IApAQCAtMTAzNCw4ICsxMDM0LDE3IEBAIHZvaWQgdHRtX2RtYV91bnBvcHVsYXRlKHN0cnVjdCB0
dG1fZG1hX3R0ICp0dG1fZG1hLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJaWYgKCFwb29sKQogCQly
ZXR1cm47CiAKLQlpc19jYWNoZWQgPSAodHRtX2RtYV9maW5kX3Bvb2wocG9vbC0+ZGV2LAotCQkg
ICAgIHR0bV90b190eXBlKHR0bS0+cGFnZV9mbGFncywgdHRfY2FjaGVkKSkgPT0gcG9vbCk7CisJ
LyoKKwkgKiBJZiBtZW1vcnkgaXMgY2FjaGVkIGFuZCBzZXYgZW5jcnlwdGlvbiBpcyBub3QgYWN0
aXZlLCBhbGxvY2F0aW5nCisJICogYW5kIGZyZWVpbmcgY29oZXJlbnQgbWVtb3J5IGlzIHJlbGF0
aXZlbHkgY2hlYXAsIHNvIHdlIGNhbiBmcmVlCisJICogaXQgaW1tZWRpYXRlbHkuIElmIHNldiBl
bmNyeXB0aW9uIGlzIGFjdGl2ZSwgYWxsb2NhdGluZyBjb2hlcmVudAorCSAqIG1lbW9yeSBpbnZv
bHZlcyBhIGNhbGwgdG8gc2V0X21lbW9yeV9kZWNyeXB0ZWQoKSB3aGljaCBpcyB2ZXJ5CisJICog
ZXhwZW5zaXZlLCBzbyBjYWNoZSBjb2hlcmVudCBwYWdlcyBpcyBzZXYgaXMgYWN0aXZlLgorCSAq
LworCWltbWVkaWF0ZV9mcmVlID0gKHR0bV9kbWFfZmluZF9wb29sCisJCQkgIChwb29sLT5kZXYs
CisJCQkgICB0dG1fdG9fdHlwZSh0dG0tPnBhZ2VfZmxhZ3MsIHR0X2NhY2hlZCkpID09IHBvb2wg
JiYKKwkJCSAgIXNldl9hY3RpdmUoKSk7CiAKIAkvKiBtYWtlIHN1cmUgcGFnZXMgYXJyYXkgbWF0
Y2ggbGlzdCBhbmQgY291bnQgbnVtYmVyIG9mIHBhZ2VzICovCiAJY291bnQgPSAwOwpAQCAtMTA1
MCwxMyArMTA1OSwxMyBAQCB2b2lkIHR0bV9kbWFfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RtYV90
dCAqdHRtX2RtYSwgc3RydWN0IGRldmljZSAqZGV2KQogCQkJZF9wYWdlLT52YWRkciAmPSB+VkFE
RFJfRkxBR19VUERBVEVEX0NPVU5UOwogCQl9CiAKLQkJaWYgKGlzX2NhY2hlZCkKKwkJaWYgKGlt
bWVkaWF0ZV9mcmVlKQogCQkJdHRtX2RtYV9wYWdlX3B1dChwb29sLCBkX3BhZ2UpOwogCX0KIAog
CXNwaW5fbG9ja19pcnFzYXZlKCZwb29sLT5sb2NrLCBpcnFfZmxhZ3MpOwogCXBvb2wtPm5wYWdl
c19pbl91c2UgLT0gY291bnQ7Ci0JaWYgKGlzX2NhY2hlZCkgeworCWlmIChpbW1lZGlhdGVfZnJl
ZSkgewogCQlwb29sLT5uZnJlZXMgKz0gY291bnQ7CiAJfSBlbHNlIHsKIAkJcG9vbC0+bnBhZ2Vz
X2ZyZWUgKz0gY291bnQ7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
