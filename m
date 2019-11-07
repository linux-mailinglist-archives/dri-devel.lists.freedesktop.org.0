Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B2AF2960
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176C06EF14;
	Thu,  7 Nov 2019 08:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE596EF16
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id B5E953F528
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:41:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e2YIFsqZXT3R for <dri-devel@lists.freedesktop.org>;
 Thu,  7 Nov 2019 09:41:26 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D93BF3F4A5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:41:24 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 4842036018B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:41:24 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 2/8] mm: pagewalk: Take the pagetable lock in
 walk_pte_range()
Date: Thu,  7 Nov 2019 09:41:10 +0100
Message-Id: <20191107084116.33032-3-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107084116.33032-1-thomas_os@shipmail.org>
References: <20191107084116.33032-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1573116084; bh=MLTPxtmk8SNu7SqpZRtwqOhnHm70c4ID2d03exwGJCU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Aj8w/Y2pX9tGIH6uBixyJ3bejU3scpJZe6ZWCyF05fdDrpYdkwualbpIV4ROwJxq6
 6JNiUTKorXH/dd2NIh3pcSQSde6kDJC9HqrfyDEnvT8VK2V6lqrFAEJ1r+Q958AX1R
 luEz1PyHT9AT89Hv/kJEgn8YIqM9dD/nhnky26bg=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Aj8w/Y2p; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKV2l0aG91dCB0
aGUgbG9jaywgYW55Ym9keSBtb2RpZnlpbmcgYSBwdGUgZnJvbSB3aXRoaW4gdGhpcyBmdW5jdGlv
biBtaWdodApoYXZlIGl0IGNvbmN1cnJlbnRseSBtb2RpZmllZCBieSBzb21lb25lIGVsc2UuCgpD
YzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBXaWxsIERlYWNvbiA8
d2lsbC5kZWFjb25AYXJtLmNvbT4KQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFk
Lm9yZz4KQ2M6IFJpayB2YW4gUmllbCA8cmllbEBzdXJyaWVsLmNvbT4KQ2M6IE1pbmNoYW4gS2lt
IDxtaW5jaGFuQGtlcm5lbC5vcmc+CkNjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4K
Q2M6IEh1YW5nIFlpbmcgPHlpbmcuaHVhbmdAaW50ZWwuY29tPgpDYzogSsOpcsO0bWUgR2xpc3Nl
IDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNjOiBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmlsbEBzaHV0
ZW1vdi5uYW1lPgpTdWdnZXN0ZWQtYnk6IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1m
b3VuZGF0aW9uLm9yZz4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJv
bUB2bXdhcmUuY29tPgpBY2tlZC1ieTogS2lyaWxsIEEuIFNodXRlbW92IDxraXJpbGwuc2h1dGVt
b3ZAbGludXguaW50ZWwuY29tPgotLS0KIG1tL3BhZ2V3YWxrLmMgfCA1ICsrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21t
L3BhZ2V3YWxrLmMgYi9tbS9wYWdld2Fsay5jCmluZGV4IGQ0OGMyYTk4NmVhMy4uYzVmYTQyY2Fi
MTRmIDEwMDY0NAotLS0gYS9tbS9wYWdld2Fsay5jCisrKyBiL21tL3BhZ2V3YWxrLmMKQEAgLTEw
LDggKzEwLDkgQEAgc3RhdGljIGludCB3YWxrX3B0ZV9yYW5nZShwbWRfdCAqcG1kLCB1bnNpZ25l
ZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgZW5kLAogCXB0ZV90ICpwdGU7CiAJaW50IGVyciA9
IDA7CiAJY29uc3Qgc3RydWN0IG1tX3dhbGtfb3BzICpvcHMgPSB3YWxrLT5vcHM7CisJc3Bpbmxv
Y2tfdCAqcHRsOwogCi0JcHRlID0gcHRlX29mZnNldF9tYXAocG1kLCBhZGRyKTsKKwlwdGUgPSBw
dGVfb2Zmc2V0X21hcF9sb2NrKHdhbGstPm1tLCBwbWQsIGFkZHIsICZwdGwpOwogCWZvciAoOzsp
IHsKIAkJZXJyID0gb3BzLT5wdGVfZW50cnkocHRlLCBhZGRyLCBhZGRyICsgUEFHRV9TSVpFLCB3
YWxrKTsKIAkJaWYgKGVycikKQEAgLTIyLDcgKzIzLDcgQEAgc3RhdGljIGludCB3YWxrX3B0ZV9y
YW5nZShwbWRfdCAqcG1kLCB1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgZW5kLAog
CQlwdGUrKzsKIAl9CiAKLQlwdGVfdW5tYXAocHRlKTsKKwlwdGVfdW5tYXBfdW5sb2NrKHB0ZSwg
cHRsKTsKIAlyZXR1cm4gZXJyOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
