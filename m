Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A996318A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6E689BD5;
	Tue,  9 Jul 2019 07:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009BB6E02F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 18:06:09 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m14so13994115qka.10
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 11:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=I8jJ+UMX+62Iqns8V74zJotY7EecOGGtFx+XKKcbDpY=;
 b=fwPfyySlo6KNb+uwshTX+J8WFpkDWcnAJQAXXZ+nbICzuHd8qZeNsTh2rXKzzcDK5O
 Ya7eW99eRGPHBnlI5dv3SQBMj2CAEY61T3H1OqzvjtT98ZAf10pZZODvoaAZCS4ffYl/
 FE6vsN/AEkIe0U7XyG69z7/0wwGbaf2aIHDsGl8KwRjhYemtSPee1RFX6xqQpryhhAJT
 ApN2gBoPzSVJlvFLZiDteW4Pg2stKqo8S85IJNxIil4rkxAZbgTQ1Xy+sfuBngKQQ7L+
 x+RrnkhgXoSzReXLqG9eM6NWZpx9aq8dyod69QrQw9weq6ozwwazAzkcDpZzFzl5OThR
 hjHw==
X-Gm-Message-State: APjAAAWotRdP0IgHdXWGE0MWbIOfVxWYqDtZqZl3JapK2DJ0mz53ccrE
 +IJQ8dpvc12UJdnGnEMq4AcaQrUSeRAQoQ==
X-Google-Smtp-Source: APXvYqzUFZwYeyS0AHx6zXu47cd2czYyvLkLjn0iE0AaOF33sGPp7sm4eBjIM8hwSt7k6Cj+LM6jqw==
X-Received: by 2002:a37:743:: with SMTP id 64mr13812170qkh.175.1562609168824; 
 Mon, 08 Jul 2019 11:06:08 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id o5sm7812422qkf.10.2019.07.08.11.06.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 11:06:08 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: akpm@linux-foundation.org
Subject: [PATCH v2] gpu/drm_memory: fix a few warnings
Date: Mon,  8 Jul 2019 14:05:51 -0400
Message-Id: <1562609151-7283-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=I8jJ+UMX+62Iqns8V74zJotY7EecOGGtFx+XKKcbDpY=;
 b=VarsZURq90ygwxHNrjFAh6rbNnMR0TBSzeXPcIx1G6WMYl/iCVbjuCpFXSQMmalgxG
 ABuhiSwWf9p4tw6VEjz6ID7WK7tqr/ZHdYuOYifeXdBfvzpewaJgL7z7FmiGbjce6fQu
 oYb9e+HkhfkkrJFxPCiS179lh3lqa0ILLD1epaKvM7vjs9HFuFlQVpYF/bqP/LsIe2xw
 Ax4KGV/mFAyn3JLLWmqIiftYUsNmS8d8cr5LQAG6HIbeu7nCFCVIOORVOgo4ygL44y6j
 q3dnHlHfI86v/O+bZEZFuAbchGVk8nF/r5wCummh8518kvC35p0dCiebjC1Jp8cBkWvx
 e4Sg==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Qian Cai <cai@lca.pw>, joe@perches.com,
 linux-spdx@archiver.kernel.org, sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9wZW5pbmcgY29tbWVudCBtYXJrICIvKioiIGlzIHJlc2VydmVkIGZvciBrZXJuZWwtZG9j
IGNvbW1lbnRzLCBzbwppdCB3aWxsIGdlbmVyYXRlIGEgd2FybmluZyB3aXRoICJtYWtlIFc9MSIu
Cgpkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jOjI6IHdhcm5pbmc6IENhbm5vdCB1bmRlcnN0
YW5kICAqIFxmaWxlCmRybV9tZW1vcnkuYwoKQWxzbywgc2lsZW5jZSBhIGNoZWNrcGF0Y2ggd2Fy
bmluZyBieSBhZGRpbmcgYSBsaWNlbnNlIGlkZW50Zml0ZXIgd2hlcmUKaXQgaW5kaWNhdGVzIHRo
ZSBNSVQgbGljZW5zZSBmdXJ0aGVyIGRvd24gaW4gdGhlIHNvdXJjZSBmaWxlLgoKV0FSTklORzog
TWlzc2luZyBvciBtYWxmb3JtZWQgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXIgdGFnIGluIGxpbmUg
MQoKSXQgYmVjb21lcyByZWR1bmRhbnQgdG8gYWRkIGJvdGggYW4gU1BEWCBpZGVudGlmaWVyIGFu
ZCBoYXZlIGEKZGVzY3JpcHRpb24gb2YgdGhlIGxpY2Vuc2UgaW4gdGhlIGNvbW1lbnQgYmxvY2sg
YXQgdGhlIHRvcCwgc28gcmVtb3ZlCnRoZSBsYXRlci4KClNpZ25lZC1vZmYtYnk6IFFpYW4gQ2Fp
IDxjYWlAbGNhLnB3PgotLS0KCnYyOiByZW1vdmUgdGhlIHJlZHVuZGFudCBkZXNjcmlwdGlvbiBv
ZiB0aGUgbGljZW5zZS4KCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jIHwgMjIgKystLS0t
LS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjAgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMKaW5kZXggMTMyZmVmOGZmMWI2Li44NmExMWZjOGU5
NTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9tZW1vcnkuYwpAQCAtMSw0ICsxLDUgQEAKLS8qKgorLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IE1JVAorLyoKICAqIFxmaWxlIGRybV9tZW1vcnkuYwogICogTWVtb3J5
IG1hbmFnZW1lbnQgd3JhcHBlcnMgZm9yIERSTQogICoKQEAgLTEyLDI1ICsxMyw2IEBACiAgKiBD
b3B5cmlnaHQgMTk5OSBQcmVjaXNpb24gSW5zaWdodCwgSW5jLiwgQ2VkYXIgUGFyaywgVGV4YXMu
CiAgKiBDb3B5cmlnaHQgMjAwMCBWQSBMaW51eCBTeXN0ZW1zLCBJbmMuLCBTdW5ueXZhbGUsIENh
bGlmb3JuaWEuCiAgKiBBbGwgUmlnaHRzIFJlc2VydmVkLgotICoKLSAqIFBlcm1pc3Npb24gaXMg
aGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBh
Ci0gKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBm
aWxlcyAodGhlICJTb2Z0d2FyZSIpLAotICogdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91
dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbgotICogdGhlIHJpZ2h0
cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1Ymxp
Y2Vuc2UsCi0gKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVy
bWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKLSAqIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBz
bywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6Ci0gKgotICogVGhlIGFib3Zl
IGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2UgKGluY2x1ZGluZyB0
aGUgbmV4dAotICogcGFyYWdyYXBoKSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBhbGwgY29waWVzIG9y
IHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZQotICogU29mdHdhcmUuCi0gKgotICogVEhFIFNP
RlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQs
IEVYUFJFU1MgT1IKLSAqIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhF
IFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAotICogRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PIEVWRU5UIFNIQUxMCi0gKiBW
QSBMSU5VWCBTWVNURU1TIEFORC9PUiBJVFMgU1VQUExJRVJTIEJFIExJQUJMRSBGT1IgQU5ZIENM
QUlNLCBEQU1BR0VTIE9SCi0gKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9O
IE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwKLSAqIEFSSVNJTkcgRlJPTSwgT1VUIE9G
IE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUgotICogT1RI
RVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgogICovCiAKICNpbmNsdWRlIDxsaW51eC9oaWdo
bWVtLmg+Ci0tIAoxLjguMy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
