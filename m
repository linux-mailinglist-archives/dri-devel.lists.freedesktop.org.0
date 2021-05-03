Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFF3371ACD
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274986E9B6;
	Mon,  3 May 2021 16:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692CA6E9B2;
 Mon,  3 May 2021 16:40:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA05B61244;
 Mon,  3 May 2021 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620060058;
 bh=RuguGrEi2naplWY6aytjF5jxaCLPOSg2TBV/f+Jxa3c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GtevQr2UOQSGms6BbkWIucvn8J3WPMQvcEbdqCwLKG7FlcUIEpPWSXizEvf/RvmJ3
 HzKtTY89Rnr8NtMtNDhAzl+w//7bKK7ZwSFwZXeXhjqRtBlmsjMNrFEyPI3po1JmNU
 VFC4nZNT0wUXSZyqEGrSEVXeBZEmqxiCWwvlitdEfypbGx1AsWAVQVGSpZDGTiASpY
 Q1FGQ+JghjHbwaaCI4nLeN+66FvuxMj9wKJlkoyY4bqQmjxafujrxAmxcWn9HLZGKV
 fuU3brjDOH+CmYa5pbF1ADjNRs9kKrRa6zkLVOhkNVCDtKaN6BXfqTVOO9+6/SdhgE
 Ncu0P4RuvFZMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 50/57] amdgpu: avoid incorrect %hu format string
Date: Mon,  3 May 2021 12:39:34 -0400
Message-Id: <20210503163941.2853291-50-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163941.2853291-1-sashal@kernel.org>
References: <20210503163941.2853291-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Tom Rix <trix@redhat.com>, amd-gfx@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClsgVXBzdHJlYW0gY29tbWl0IDdk
OThkNDE2YzJjYzFjMWY3ZDk1MDhlODg3ZGU0NjMwZTUyMWQ3OTcgXQoKY2xhbmcgcG9pbnRzIG91
dCB0aGF0IHRoZSAlaHUgZm9ybWF0IHN0cmluZyBkb2VzIG5vdCBtYXRjaCB0aGUgdHlwZQpvZiB0
aGUgdmFyaWFibGVzIGhlcmU6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZk
LmM6MjYzOjc6IHdhcm5pbmc6IGZvcm1hdCBzcGVjaWZpZXMgdHlwZSAndW5zaWduZWQgc2hvcnQn
IGJ1dCB0aGUgYXJndW1lbnQgaGFzIHR5cGUgJ3Vuc2lnbmVkIGludCcgWy1XZm9ybWF0XQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmVyc2lvbl9tYWpvciwgdmVyc2lvbl9taW5v
cik7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+CmluY2x1
ZGUvZHJtL2RybV9wcmludC5oOjQ5ODoxOTogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAnRFJN
X0VSUk9SJwogICAgICAgIF9fZHJtX2VycihmbXQsICMjX19WQV9BUkdTX18pCiAgICAgICAgICAg
ICAgICAgIH5+fiAgICBefn5+fn5+fn5+fgoKQ2hhbmdlIGl0IHRvIGEgcmVndWxhciAldSwgdGhl
IHNhbWUgd2F5IGEgcHJldmlvdXMgcGF0Y2ggZGlkIGZvcgphbm90aGVyIGluc3RhbmNlIG9mIHRo
ZSBzYW1lIHdhcm5pbmcuCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdXZkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdXZkLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMK
aW5kZXggYjJjMzY0Yjg2OTVmLi5jZmE4MzI0YjlmNTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdXZkLmMKQEAgLTIzMSw3ICsyMzEsNyBAQCBpbnQgYW1kZ3B1X3V2ZF9zd19p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlpZiAoKGFkZXYtPmFzaWNfdHlwZSA9
PSBDSElQX1BPTEFSSVMxMCB8fAogCQkgICAgIGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1BPTEFS
SVMxMSkgJiYKIAkJICAgIChhZGV2LT51dmQuZndfdmVyc2lvbiA8IEZXXzFfNjZfMTYpKQotCQkJ
RFJNX0VSUk9SKCJQT0xBUklTMTAvMTEgVVZEIGZpcm13YXJlIHZlcnNpb24gJWh1LiVodSBpcyB0
b28gb2xkLlxuIiwKKwkJCURSTV9FUlJPUigiUE9MQVJJUzEwLzExIFVWRCBmaXJtd2FyZSB2ZXJz
aW9uICV1LiV1IGlzIHRvbyBvbGQuXG4iLAogCQkJCSAgdmVyc2lvbl9tYWpvciwgdmVyc2lvbl9t
aW5vcik7CiAJfSBlbHNlIHsKIAkJdW5zaWduZWQgaW50IGVuY19tYWpvciwgZW5jX21pbm9yLCBk
ZWNfbWlub3I7Ci0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
