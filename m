Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF1671F22
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A256E388;
	Tue, 23 Jul 2019 18:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2970 seconds by postgrey-1.36 at gabe;
 Tue, 23 Jul 2019 14:19:14 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45376E2CD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 14:19:14 +0000 (UTC)
Received: from fsav104.sakura.ne.jp (fsav104.sakura.ne.jp [27.133.134.231])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x6NDTPem029483;
 Tue, 23 Jul 2019 22:29:25 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav104.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav104.sakura.ne.jp);
 Tue, 23 Jul 2019 22:29:25 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav104.sakura.ne.jp)
Received: from ccsecurity.localdomain (softbank126012062002.bbtec.net
 [126.12.62.2]) (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x6NDTCBn029406
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 23 Jul 2019 22:29:24 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] staging: android: ion: Bail out upon SIGKILL when allocating
 memory.
Date: Tue, 23 Jul 2019 22:28:59 +0900
Message-Id: <1563888539-3330-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
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
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 syzbot <syzbot+8ab2d0f39fb79fe6ca40@syzkaller.appspotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c3l6Ym90IGZvdW5kIHRoYXQgYSB0aHJlYWQgY2FuIHN0YWxsIGZvciBtaW51dGVzIGluc2lkZQpp
b25fc3lzdGVtX2hlYXBfYWxsb2NhdGUoKSBhZnRlciB0aGF0IHRocmVhZCB3YXMga2lsbGVkIGJ5
IFNJR0tJTEwgWzFdLgpMZXQncyBjaGVjayBmb3IgU0lHS0lMTCBiZWZvcmUgZG9pbmcgbWVtb3J5
IGFsbG9jYXRpb24uCgpbMV0gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2lkPWEw
ZTM0MzY4Mjk2OThkNTgyNDIzMTI1MWZhZDlkOGU5OThmOTRmNWUKClNpZ25lZC1vZmYtYnk6IFRl
dHN1byBIYW5kYSA8cGVuZ3Vpbi1rZXJuZWxASS1sb3ZlLlNBS1VSQS5uZS5qcD4KUmVwb3J0ZWQt
Ynk6IHN5emJvdCA8c3l6Ym90KzhhYjJkMGYzOWZiNzlmZTZjYTQwQHN5emthbGxlci5hcHBzcG90
bWFpbC5jb20+CkFja2VkLWJ5OiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KQWNr
ZWQtYnk6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVy
cy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbl9wYWdlX3Bvb2wuYyB8IDMgKysrCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2FuZHJv
aWQvaW9uL2lvbl9wYWdlX3Bvb2wuYyBiL2RyaXZlcnMvc3RhZ2luZy9hbmRyb2lkL2lvbi9pb25f
cGFnZV9wb29sLmMKaW5kZXggZmQ0OTk1Zi4uZjg1ZWM1YjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
c3RhZ2luZy9hbmRyb2lkL2lvbi9pb25fcGFnZV9wb29sLmMKKysrIGIvZHJpdmVycy9zdGFnaW5n
L2FuZHJvaWQvaW9uL2lvbl9wYWdlX3Bvb2wuYwpAQCAtOCwxMSArOCwxNCBAQAogI2luY2x1ZGUg
PGxpbnV4L2xpc3QuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgv
c3dhcC5oPgorI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3NpZ25hbC5oPgogCiAjaW5jbHVkZSAiaW9u
LmgiCiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0IHBhZ2UgKmlvbl9wYWdlX3Bvb2xfYWxsb2NfcGFn
ZXMoc3RydWN0IGlvbl9wYWdlX3Bvb2wgKnBvb2wpCiB7CisJaWYgKGZhdGFsX3NpZ25hbF9wZW5k
aW5nKGN1cnJlbnQpKQorCQlyZXR1cm4gTlVMTDsKIAlyZXR1cm4gYWxsb2NfcGFnZXMocG9vbC0+
Z2ZwX21hc2ssIHBvb2wtPm9yZGVyKTsKIH0KIAotLSAKMS44LjMuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
