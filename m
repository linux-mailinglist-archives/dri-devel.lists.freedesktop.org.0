Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD83E52465
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971EC89F97;
	Tue, 25 Jun 2019 07:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2848A89D3E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 07:07:49 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.252.75])
 by smtp-cloud7.xs4all.net with ESMTPA
 id ffYOhO6AvF85OffYRhchmM; Tue, 25 Jun 2019 09:07:47 +0200
Subject: [PATCHv8.1 01/13] cec-notifier: rename variables, check kstrdup and
 n->conn_name
To: linux-media@vger.kernel.org
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
 <20190624160330.38048-2-hverkuil-cisco@xs4all.nl>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <bb646980-1370-305f-4713-de3ce9a66f11@xs4all.nl>
Date: Tue, 25 Jun 2019 09:07:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190624160330.38048-2-hverkuil-cisco@xs4all.nl>
Content-Language: en-US
X-CMAE-Envelope: MS4wfA1P0iasV3W6n3T4DHGY+SoAt8ggAAuDAuGnrH1xR4BJh/OIid1tz3Q+Ub7MdLY/3eaPrZtaunghFYQMSWw0+uzpxAcGt6d3zryKNUVpqIO9msWihqjy
 0giwO0Q1HI0LSu9q4/A+28l+jjcs+jfwVctambJGemvIbt7UNiFMpOj8NrIl8AxPHSHmTBAhig7oA+32nAlbrdPvBZBc+5BepKFvTxWWdVcpvt1dpiROuR69
 xtWalsBOk1u0tBuYVJugf6Aex3rKnbVosteRzRLI8ekzLswOJ9mZRx0SRbd6URhG
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
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
Cc: Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org,
 Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGV2IC0+IGhkbWlfZGV2CmNvbm4gLT4gY29ubl9uYW1lCgpDaGVjayBpZiBuLT5jb25uX25hbWUg
aXMgbm90IE5VTEwgYmVmb3JlIGNhbGxpbmcgc3RyY21wLgpDaGVjayB0aGUgcmVzdWx0IG9mIGtz
dHJkdXAsIGFuZCBjbGVhbiB1cCBvbiBlcnJvci4KClNpZ25lZC1vZmYtYnk6IEhhbnMgVmVya3Vp
bCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgotLS0KQ2hhbmdlcyBzaW5jZSB2ODoKCi0gY2hl
Y2sgbi0+Y29ubl9uYW1lIGJlZm9yZSBjYWxsaW5nIHN0cmNtcCB0byBtYWtlIHRoZSBjb2RlIG1v
cmUgcm9idXN0Ci0tLQogZHJpdmVycy9tZWRpYS9jZWMvY2VjLW5vdGlmaWVyLmMgfCAyNyArKysr
KysrKysrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvY2VjL2NlYy1ub3Rp
Zmllci5jIGIvZHJpdmVycy9tZWRpYS9jZWMvY2VjLW5vdGlmaWVyLmMKaW5kZXggOTU5OGM3Nzc4
ODcxLi5mNzJiMTljMzUxZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvY2VjL2NlYy1ub3Rp
Zmllci5jCisrKyBiL2RyaXZlcnMvbWVkaWEvY2VjL2NlYy1ub3RpZmllci5jCkBAIC0yMSw4ICsy
MSw4IEBAIHN0cnVjdCBjZWNfbm90aWZpZXIgewogCXN0cnVjdCBtdXRleCBsb2NrOwogCXN0cnVj
dCBsaXN0X2hlYWQgaGVhZDsKIAlzdHJ1Y3Qga3JlZiBrcmVmOwotCXN0cnVjdCBkZXZpY2UgKmRl
djsKLQljb25zdCBjaGFyICpjb25uOworCXN0cnVjdCBkZXZpY2UgKmhkbWlfZGV2OworCWNvbnN0
IGNoYXIgKmNvbm5fbmFtZTsKIAlzdHJ1Y3QgY2VjX2FkYXB0ZXIgKmNlY19hZGFwOwogCXZvaWQg
KCpjYWxsYmFjaykoc3RydWN0IGNlY19hZGFwdGVyICphZGFwLCB1MTYgcGEpOwoKQEAgLTMyLDE0
ICszMiwxNiBAQCBzdHJ1Y3QgY2VjX25vdGlmaWVyIHsKIHN0YXRpYyBMSVNUX0hFQUQoY2VjX25v
dGlmaWVycyk7CiBzdGF0aWMgREVGSU5FX01VVEVYKGNlY19ub3RpZmllcnNfbG9jayk7Cgotc3Ry
dWN0IGNlY19ub3RpZmllciAqY2VjX25vdGlmaWVyX2dldF9jb25uKHN0cnVjdCBkZXZpY2UgKmRl
diwgY29uc3QgY2hhciAqY29ubikKK3N0cnVjdCBjZWNfbm90aWZpZXIgKgorY2VjX25vdGlmaWVy
X2dldF9jb25uKHN0cnVjdCBkZXZpY2UgKmhkbWlfZGV2LCBjb25zdCBjaGFyICpjb25uX25hbWUp
CiB7CiAJc3RydWN0IGNlY19ub3RpZmllciAqbjsKCiAJbXV0ZXhfbG9jaygmY2VjX25vdGlmaWVy
c19sb2NrKTsKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KG4sICZjZWNfbm90aWZpZXJzLCBoZWFkKSB7
Ci0JCWlmIChuLT5kZXYgPT0gZGV2ICYmCi0JCSAgICAoIWNvbm4gfHwgIXN0cmNtcChuLT5jb25u
LCBjb25uKSkpIHsKKwkJaWYgKG4tPmhkbWlfZGV2ID09IGhkbWlfZGV2ICYmCisJCSAgICAoIWNv
bm5fbmFtZSB8fAorCQkgICAgIChuLT5jb25uX25hbWUgJiYgIXN0cmNtcChuLT5jb25uX25hbWUs
IGNvbm5fbmFtZSkpKSkgewogCQkJa3JlZl9nZXQoJm4tPmtyZWYpOwogCQkJbXV0ZXhfdW5sb2Nr
KCZjZWNfbm90aWZpZXJzX2xvY2spOwogCQkJcmV0dXJuIG47CkBAIC00OCwxMCArNTAsMTcgQEAg
c3RydWN0IGNlY19ub3RpZmllciAqY2VjX25vdGlmaWVyX2dldF9jb25uKHN0cnVjdCBkZXZpY2Ug
KmRldiwgY29uc3QgY2hhciAqY29ubikKIAluID0ga3phbGxvYyhzaXplb2YoKm4pLCBHRlBfS0VS
TkVMKTsKIAlpZiAoIW4pCiAJCWdvdG8gdW5sb2NrOwotCW4tPmRldiA9IGRldjsKLQlpZiAoY29u
bikKLQkJbi0+Y29ubiA9IGtzdHJkdXAoY29ubiwgR0ZQX0tFUk5FTCk7CisJbi0+aGRtaV9kZXYg
PSBoZG1pX2RldjsKKwlpZiAoY29ubl9uYW1lKSB7CisJCW4tPmNvbm5fbmFtZSA9IGtzdHJkdXAo
Y29ubl9uYW1lLCBHRlBfS0VSTkVMKTsKKwkJaWYgKCFuLT5jb25uX25hbWUpIHsKKwkJCWtmcmVl
KG4pOworCQkJbiA9IE5VTEw7CisJCQlnb3RvIHVubG9jazsKKwkJfQorCX0KIAluLT5waHlzX2Fk
ZHIgPSBDRUNfUEhZU19BRERSX0lOVkFMSUQ7CisKIAltdXRleF9pbml0KCZuLT5sb2NrKTsKIAlr
cmVmX2luaXQoJm4tPmtyZWYpOwogCWxpc3RfYWRkX3RhaWwoJm4tPmhlYWQsICZjZWNfbm90aWZp
ZXJzKTsKQEAgLTY3LDcgKzc2LDcgQEAgc3RhdGljIHZvaWQgY2VjX25vdGlmaWVyX3JlbGVhc2Uo
c3RydWN0IGtyZWYgKmtyZWYpCiAJCWNvbnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3QgY2VjX25vdGlm
aWVyLCBrcmVmKTsKCiAJbGlzdF9kZWwoJm4tPmhlYWQpOwotCWtmcmVlKG4tPmNvbm4pOworCWtm
cmVlKG4tPmNvbm5fbmFtZSk7CiAJa2ZyZWUobik7CiB9CgotLSAKMi4yMC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
