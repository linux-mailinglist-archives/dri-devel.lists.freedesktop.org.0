Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB5C323A5
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2019 17:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E267789415;
	Sun,  2 Jun 2019 15:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAC7897F0
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 23:37:21 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45Gd5W6wVpz1r9Vs;
 Sun,  2 Jun 2019 01:37:19 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45Gd5W6bxWz1qqkW;
 Sun,  2 Jun 2019 01:37:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Z3-t-zNEiUM7; Sun,  2 Jun 2019 01:37:18 +0200 (CEST)
X-Auth-Info: isvgpZLnw2UI4eRtX19CWaTzNqbyZ7gwDWGrddvFH74=
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz
 [86.49.110.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun,  2 Jun 2019 01:37:18 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] etnaviv: Fix double-free in etna_bo_cache_free()
Date: Sun,  2 Jun 2019 01:36:27 +0200
Message-Id: <20190601233627.5092-1-marex@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 02 Jun 2019 15:00:55 +0000
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
Cc: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZvbGxvd2luZyBzaXR1YXRpb24gY2FuIGhhcHBlbiBpbiBhIG11bHRpdGhyZWFkZWQgT3Bl
bkdMIGFwcGxpY2F0aW9uLgpBIEJPIGlzIHN1Ym1pdHRlZCBmcm9tIGV0bmFfY21kX3N0cmVhbSAj
MSB3aXRoIGZsYWdzIHNldCBmb3IgcmVhZC4KQSBCTyBpcyBzdWJtaXR0ZWQgZnJvbSBldG5hX2Nt
ZF9zdHJlYW0gIzIgd2l0aCBmbGFncyBzZXQgZm9yIHdyaXRlLgpUaGlzIHRyaWdnZXJzIGEgZmx1
c2ggb24gc3RyZWFtICMxIGFuZCBjbGVhcnMgdGhlIEJPJ3MgY3VycmVudF9zdHJlYW0KcG9pbnRl
ci4gSWYgYXQgdGhpcyBwb2ludCwgc3RyZWFtICMyIGF0dGVtcHRzIHRvIHF1ZXVlIEJPIGFnYWlu
LCB3aGljaApkb2VzIGhhcHBlbiwgdGhlIEJPIHdpbGwgYmUgYWRkZWQgdG8gdGhlIHN1Ym1pdCBs
aXN0IHR3aWNlLiBUaGUgTGludXgKa2VybmVsIGRyaXZlciBjb3JyZWN0bHkgZGV0ZWN0cyB0aGlz
IGFuZCB3YXJucyBhYm91dCBpdCB3aXRoICJCTyBhdAppbmRleCAldSBhbHJlYWR5IG9uIHN1Ym1p
dCBsaXN0IiBrZXJuZWwgbWVzc2FnZS4KCkhvd2V2ZXIsIHdoZW4gY2xlYW5pbmcgdGhlIEJPIGNh
Y2hlIGluIGV0bmFfYm9fY2FjaGVfZnJlZSgpLCB0aGUgQk8Kd2hpY2ggd2FzIHN1Ym1pdHRlZCB0
d2ljZSB3aWxsIGFsc28gYmUgZnJlZSgpZCB0d2ljZSwgdGhpcyB0cmlnZ2VyaW5nCmEgZ2xpYmMg
ZG91YmxlIGZyZWUgZGV0ZWN0b3IuCgpUaGUgZml4IGlzIGVhc3ksIGV2ZW4gaWYgdGhlIEJPIGRv
ZXMgbm90IGhhdmUgY3VycmVudF9zdHJlYW0gc2V0LAppdGVyYXRlIG92ZXIgY3VycmVudCBzdHJl
YW1zJyBsaXN0IG9mIEJPcyBiZWZvcmUgYWRkaW5nIHRoZSBCTyB0byBpdAphbmQgdmVyaWZ5IHRo
YXQgdGhlIEJPIGlzIG5vdCB5ZXQgdGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8
bWFyZXhAZGVueC5kZT4KQ2M6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBn
bWFpbC5jb20+CkNjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KLS0tCiBl
dG5hdml2L2V0bmF2aXZfY21kX3N0cmVhbS5jIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ldG5hdml2L2V0
bmF2aXZfY21kX3N0cmVhbS5jIGIvZXRuYXZpdi9ldG5hdml2X2NtZF9zdHJlYW0uYwppbmRleCA3
MTM5YzMyNC4uMjYxNzc3YjAgMTAwNjQ0Ci0tLSBhL2V0bmF2aXYvZXRuYXZpdl9jbWRfc3RyZWFt
LmMKKysrIGIvZXRuYXZpdi9ldG5hdml2X2NtZF9zdHJlYW0uYwpAQCAtMTUwLDExICsxNTAsNyBA
QCBzdGF0aWMgdWludDMyX3QgYm8yaWR4KHN0cnVjdCBldG5hX2NtZF9zdHJlYW0gKnN0cmVhbSwg
c3RydWN0IGV0bmFfYm8gKmJvLAogCiAJcHRocmVhZF9tdXRleF9sb2NrKCZpZHhfbG9jayk7CiAK
LQlpZiAoIWJvLT5jdXJyZW50X3N0cmVhbSkgewotCQlpZHggPSBhcHBlbmRfYm8oc3RyZWFtLCBi
byk7Ci0JCWJvLT5jdXJyZW50X3N0cmVhbSA9IHN0cmVhbTsKLQkJYm8tPmlkeCA9IGlkeDsKLQl9
IGVsc2UgaWYgKGJvLT5jdXJyZW50X3N0cmVhbSA9PSBzdHJlYW0pIHsKKwlpZiAoYm8tPmN1cnJl
bnRfc3RyZWFtID09IHN0cmVhbSkgewogCQlpZHggPSBiby0+aWR4OwogCX0gZWxzZSB7CiAJCS8q
IHNsb3ctcGF0aDogKi8KQEAgLTE2NSw2ICsxNjEsOCBAQCBzdGF0aWMgdWludDMyX3QgYm8yaWR4
KHN0cnVjdCBldG5hX2NtZF9zdHJlYW0gKnN0cmVhbSwgc3RydWN0IGV0bmFfYm8gKmJvLAogCQkJ
Lyogbm90IGZvdW5kICovCiAJCQlpZHggPSBhcHBlbmRfYm8oc3RyZWFtLCBibyk7CiAJCX0KKwkJ
Ym8tPmN1cnJlbnRfc3RyZWFtID0gc3RyZWFtOworCQliby0+aWR4ID0gaWR4OwogCX0KIAlwdGhy
ZWFkX211dGV4X3VubG9jaygmaWR4X2xvY2spOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
