Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDD52EBB5C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC28E89D8A;
	Wed,  6 Jan 2021 08:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEBD6E11A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 14:37:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609857425; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=4DiNJfGzzRCDF2FL02HtG0SOdr7LDb46DzlmbUJfV6s=;
 b=sggrCJfK/iVUc96w+C6fR6lc91nUyJJFHAvvXx36JRUVrjtfvoMdLE2JnwfCIay0KXECYkwp
 MBxu+axtFlCGyhnURsDI1d4exgQYGwvv+rxsCmdBOt5dkUS3Ipy4IA5NpdFH1wrruxG5u3bE
 4mLcZSBsJqdwyWnCVDq+IKejOds=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5ff47988d3eb3c36b4aa9d15 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Jan 2021 14:36:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0ED76C43461; Tue,  5 Jan 2021 14:36:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from charante-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: charante)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E3526C433CA;
 Tue,  5 Jan 2021 14:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3526C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=charante@codeaurora.org
From: Charan Teja Reddy <charante@codeaurora.org>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	arnd@arndb.de
Subject: [PATCH V2] dmabuf: fix use-after-free of dmabuf's file->f_inode
Date: Tue,  5 Jan 2021 20:06:39 +0530
Message-Id: <1609857399-31549-1-git-send-email-charante@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: linux-kernel@vger.kernel.org, "# 5 . 4+" <stable@vger.kernel.org>,
 linaro-mm-sig@lists.linaro.org, Charan Teja Reddy <charante@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgb2JzZXJ2ZWQgJ3VzZS1hZnRlci1mcmVlJyBvbiB0aGUgZG1hYnVmJ3MgZmlsZS0+Zl9p
bm9kZSB3aXRoIHRoZQpyYWNlIGJldHdlZW4gY2xvc2luZyB0aGUgZG1hYnVmIGZpbGUgYW5kIHJl
YWRpbmcgdGhlIGRtYWJ1ZidzIGRlYnVnCmluZm8uCgpDb25zaWRlciB0aGUgYmVsb3cgc2NlbmFy
aW8gd2hlcmUgUDEgaXMgY2xvc2luZyB0aGUgZG1hX2J1ZiBmaWxlCmFuZCBQMiBpcyByZWFkaW5n
IHRoZSBkbWFfYnVmJ3MgZGVidWcgaW5mbyBpbiB0aGUgc3lzdGVtOgoKUDEJCQkJCQlQMgoJCQkJ
CWRtYV9idWZfZGVidWdfc2hvdygpCmRtYV9idWZfcHV0KCkKICBfX2ZwdXQoKQogICAgZmlsZS0+
Zl9vcC0+cmVsZWFzZSgpCiAgICBkcHV0KCkKICAgIC4uLi4KICAgICAgZGVudHJ5X3VubGlua19p
bm9kZSgpCiAgICAgICAgaXB1dChkZW50cnktPmRfaW5vZGUpCiAgICAgICAgKHdoZXJlIHRoZSBp
bm9kZSBpcyBmcmVlZCkKCQkJCQltdXRleF9sb2NrKCZkYl9saXN0LmxvY2spCgkJCQkJcmVhZCAn
ZG1hX2J1Zi0+ZmlsZS0+Zl9pbm9kZScKCQkJCQkodGhlIHNhbWUgaW5vZGUgaXMgZnJlZWQgYnkg
UDEpCgkJCQkJbXV0ZXhfdW5sb2NrKCZkYl9saXN0LmxvY2spCiAgICAgIGRlbnRyeS0+ZF9vcC0+
ZF9yZWxlYXNlKCktLT4KICAgICAgICBkbWFfYnVmX3JlbGVhc2UoKQogICAgICAgICAgLi4uLi4K
ICAgICAgICAgIG11dGV4X2xvY2soJmRiX2xpc3QubG9jaykKICAgICAgICAgIHJlbW92ZXMgdGhl
IGRtYWJ1ZiBmcm9tIHRoZSBsaXN0CiAgICAgICAgICBtdXRleF91bmxvY2soJmRiX2xpc3QubG9j
aykKCkluIHRoZSBhYm92ZSBzY2VuYXJpbywgd2hlbiBkbWFfYnVmX3B1dCgpIGlzIGNhbGxlZCBv
biBhIGRtYV9idWYsIGl0CmZpcnN0IGZyZWVzIHRoZSBkbWFfYnVmJ3MgZmlsZS0+Zl9pbm9kZSg9
ZGVudHJ5LT5kX2lub2RlKSBhbmQgdGhlbgpyZW1vdmVzIHRoaXMgZG1hX2J1ZiBmcm9tIHRoZSBz
eXN0ZW0gZGJfbGlzdC4gSW4gYmV0d2VlbiBQMiB0cmF2ZXJzaW5nCnRoZSBkYl9saXN0IHRyaWVz
IHRvIGFjY2VzcyB0aGlzIGRtYV9idWYncyBmaWxlLT5mX2lub2RlIHRoYXQgd2FzIGZyZWVkCmJ5
IFAxIHdoaWNoIGlzIGEgdXNlLWFmdGVyLWZyZWUgY2FzZS4KClNpbmNlLCBfX2ZwdXQoKSBjYWxs
cyBmX29wLT5yZWxlYXNlIGZpcnN0IGFuZCB0aGVuIGxhdGVyIGNhbGxzIHRoZQpkX29wLT5kX3Jl
bGVhc2UsIG1vdmUgdGhlIGRtYV9idWYncyBkYl9saXN0IHJlbW92YWwgZnJvbSBkX3JlbGVhc2Uo
KSB0bwpmX29wLT5yZWxlYXNlKCkuIFRoaXMgZW5zdXJlcyB0aGF0IGRtYV9idWYncyBmaWxlLT5m
X2lub2RlIGlzIG5vdAphY2Nlc3NlZCBhZnRlciBpdCBpcyByZWxlYXNlZC4KCkNjOiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4gIyA1LjQrCkZpeGVzOiA0YWI1OWMzYzYzOGMgKCJkbWEtYnVmOiBN
b3ZlIGRtYV9idWZfcmVsZWFzZSgpIGZyb20gZm9wcyB0byBkZW50cnlfb3BzIikKQWNrZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQ2hhcmFuIFRlamEgUmVkZHkgPGNoYXJhbnRlQGNvZGVhdXJvcmEub3JnPgotLS0KIFYyOiBS
ZXNlbmRpbmcgd2l0aCBzdGFibGUgdGFncyBhbmQgQWNrcwoKIFYxOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTM2MDExOC8KCiBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1
Zi5jIHwgMjEgKysrKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1h
LWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwppbmRleCAwZWI4MGMxLi5hMTRkY2Ji
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCisrKyBiL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtYnVmLmMKQEAgLTc2LDEwICs3Niw2IEBAIHN0YXRpYyB2b2lkIGRtYV9idWZfcmVs
ZWFzZShzdHJ1Y3QgZGVudHJ5ICpkZW50cnkpCiAKIAlkbWFidWYtPm9wcy0+cmVsZWFzZShkbWFi
dWYpOwogCi0JbXV0ZXhfbG9jaygmZGJfbGlzdC5sb2NrKTsKLQlsaXN0X2RlbCgmZG1hYnVmLT5s
aXN0X25vZGUpOwotCW11dGV4X3VubG9jaygmZGJfbGlzdC5sb2NrKTsKLQogCWlmIChkbWFidWYt
PnJlc3YgPT0gKHN0cnVjdCBkbWFfcmVzdiAqKSZkbWFidWZbMV0pCiAJCWRtYV9yZXN2X2Zpbmko
ZG1hYnVmLT5yZXN2KTsKIApAQCAtODgsNiArODQsMjIgQEAgc3RhdGljIHZvaWQgZG1hX2J1Zl9y
ZWxlYXNlKHN0cnVjdCBkZW50cnkgKmRlbnRyeSkKIAlrZnJlZShkbWFidWYpOwogfQogCitzdGF0
aWMgaW50IGRtYV9idWZfZmlsZV9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBm
aWxlICpmaWxlKQoreworCXN0cnVjdCBkbWFfYnVmICpkbWFidWY7CisKKwlpZiAoIWlzX2RtYV9i
dWZfZmlsZShmaWxlKSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlkbWFidWYgPSBmaWxlLT5wcml2
YXRlX2RhdGE7CisKKwltdXRleF9sb2NrKCZkYl9saXN0LmxvY2spOworCWxpc3RfZGVsKCZkbWFi
dWYtPmxpc3Rfbm9kZSk7CisJbXV0ZXhfdW5sb2NrKCZkYl9saXN0LmxvY2spOworCisJcmV0dXJu
IDA7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGVudHJ5X29wZXJhdGlvbnMgZG1hX2J1Zl9k
ZW50cnlfb3BzID0gewogCS5kX2RuYW1lID0gZG1hYnVmZnNfZG5hbWUsCiAJLmRfcmVsZWFzZSA9
IGRtYV9idWZfcmVsZWFzZSwKQEAgLTQxMyw2ICs0MjUsNyBAQCBzdGF0aWMgdm9pZCBkbWFfYnVm
X3Nob3dfZmRpbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwgc3RydWN0IGZpbGUgKmZpbGUpCiB9CiAK
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGRtYV9idWZfZm9wcyA9IHsKKwku
cmVsZWFzZQk9IGRtYV9idWZfZmlsZV9yZWxlYXNlLAogCS5tbWFwCQk9IGRtYV9idWZfbW1hcF9p
bnRlcm5hbCwKIAkubGxzZWVrCQk9IGRtYV9idWZfbGxzZWVrLAogCS5wb2xsCQk9IGRtYV9idWZf
cG9sbCwKLS0gClFVQUxDT01NIElORElBLCBvbiBiZWhhbGYgb2YgUXVhbGNvbW0gSW5ub3ZhdGlv
biBDZW50ZXIsIEluYy4gaXMgYQptZW1iZXIgb2YgdGhlIENvZGUgQXVyb3JhIEZvcnVtLCBob3N0
ZWQgYnkgVGhlIExpbnV4IEZvdW5kYXRpb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
