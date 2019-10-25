Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416E0E5740
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 01:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1086EBD4;
	Fri, 25 Oct 2019 23:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1896EBD0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 23:48:41 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 23so2595829pgk.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 16:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=akimG7mgtSazW0Xv9weq5WdYsXvPJgD82qEofxZDZEo=;
 b=U20h8YxOk9LD3/jO+vM7PeM3WuGDqsKF9gSvgahp/paKWd31IvjwM0hjOI/6oGu9bP
 C9XW2S647S7YdOxsWAELVJvq5/twli3HsWiyK5y5mg+Bt5OY6wjQKCDftMZhB9cb44A4
 xhthz4uId8liovW6OCh8GnLl5MJ7E3OflVMyntMsQikahQJDJFlV//r+ZbmaElaE2cdE
 7y2+BjCKnaxFlQT0mwA6re9YuIsK4IUo56+V+cJGTU3M9yJ5ya805mdTj+ACkf3JH3js
 pIyXMIKECIn0Ve5mswwRAxqpmRWSmCE5iAgCF/N0XKtjtSqgjjqzn6Sc3IP7nvRLpwKn
 uKwg==
X-Gm-Message-State: APjAAAX7oXKi3GmD6dTcyDoY2yeb353ukxyIfiEeytgxl9SMwZv8/Zj9
 D+FvqdmWfk9SV/esX/cGIFfmAg==
X-Google-Smtp-Source: APXvYqzFVpzIpCxoPgDb9KejO5rMTuJfOB/3/u6olhx9SqL/mVxNlO6qlClo1U0EarnNOG8lvUvjkg==
X-Received: by 2002:a17:90a:d58f:: with SMTP id
 v15mr7476798pju.17.1572047320896; 
 Fri, 25 Oct 2019 16:48:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 cx22sm2817179pjb.19.2019.10.25.16.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 16:48:40 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 2/2] dma-buf: heaps: Allow system & cma heaps to be
 configured as a modules
Date: Fri, 25 Oct 2019 23:48:34 +0000
Message-Id: <20191025234834.28214-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191025234834.28214-1-john.stultz@linaro.org>
References: <20191025234834.28214-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=akimG7mgtSazW0Xv9weq5WdYsXvPJgD82qEofxZDZEo=;
 b=kYbg0nUp/PxzkjVrb1KGOJVPc1ih+UCUGjDKAgLLtvpaZ9Pp+/Q3cv4t0dB71G44aS
 1wF3g90STc7JgIzQVNFd2OT47TMuSNGhWq6p3nERUIVHd5+QBDoi779pCYC6SDgp24GO
 WPFPM2iiqEYEZem9oWs2cJTf8hNVxEWG4h3ruJZzab15rfukexYiWFkNqjiorjlihRVj
 VcKekKIMo2nCLNOYMa8cqJA9lIn7e/RWWLtB65doGIXpH4JFEeeqg+ua2yA7dmZatZzj
 xh4go74AhdfigrguMdEtk2DgBS+XrR+zbHEJPdNUFIuJft1as404b2m+OKIUe0iRozLD
 UMew==
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
Cc: Sandeep Patil <sspatil@google.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Chenbo Feng <fengc@google.com>, Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pratik Patel <pratikp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3cgbG9hZGluZyBzeXN0ZW0gYW5kIGNtYSBoZWFwIGFzIGEgbW9kdWxlIGluc3RlYWQgb2Yg
anVzdCBhcwphIHN0YXRpY2FsbHkgYnVpbHQgaW4gaGVhcC4KClNpbmNlIHRoZXJlIGlzbid0IGEg
Z29vZCBtZWNoYW5pc20gZm9yIGRtYWJ1ZiBsaWZldGltZSB0cmFja2luZwppdCBpc24ndCBzYWZl
IHRvIGFsbG93IHRoZSBoZWFwIGRyaXZlcnMgdG8gYmUgdW5sb2FkZWQsIHNvIHRoZXNlCmRyaXZl
cnMgZG8gbm90IGltcGxlbWVudCBhbnkgbW9kdWxlIHVubG9hZGluZyBmdW5jdGlvbmFsaXR5IGFu
ZAp3aWxsIHNob3cgdXAgaW4gbHNtb2QgYXMgIltwZXJtYW5lbnRdIi4KClRoaXMgcGF0Y2ggYWxz
byBleHBvcnRzIGtleSBmdW5jdGlvbnMgZnJvbSBkbWFidWYgaGVhcHMgY29yZSBhbmQKdGhlIGhl
YXAgaGVscGVyIGZ1bmN0aW9ucyBzbyB0aGV5IGNhbiBiZSBhY2Nlc3NlZCBieSB0aGUgbW9kdWxl
LgoKQ2M6IExhdXJhIEFiYm90dCA8bGFiYm90dEByZWRoYXQuY29tPgpDYzogQmVuamFtaW4gR2Fp
Z25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+CkNjOiBTdW1pdCBTZW13YWwgPHN1
bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2RlYXVyb3JhLm9y
Zz4KQ2M6IFByYXRpayBQYXRlbCA8cHJhdGlrcEBjb2RlYXVyb3JhLm9yZz4KQ2M6IEJyaWFuIFN0
YXJrZXkgPEJyaWFuLlN0YXJrZXlAYXJtLmNvbT4KQ2M6IEFuZHJldyBGLiBEYXZpcyA8YWZkQHRp
LmNvbT4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBZ
dWUgSHUgPGh1eXVlMkB5dWxvbmcuY29tPgpDYzogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5p
Ym0uY29tPgpDYzogQ2hlbmJvIEZlbmcgPGZlbmdjQGdvb2dsZS5jb20+CkNjOiBBbGlzdGFpciBT
dHJhY2hhbiA8YXN0cmFjaGFuQGdvb2dsZS5jb20+CkNjOiBTYW5kZWVwIFBhdGlsIDxzc3BhdGls
QGdvb2dsZS5jb20+CkNjOiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBTdHVs
dHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFw
LmMgICAgICAgICAgIHwgMiArKwogZHJpdmVycy9kbWEtYnVmL2hlYXBzL0tjb25maWcgICAgICAg
IHwgNCArKy0tCiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMgfCAyICsrCiAz
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVh
cC5jCmluZGV4IDlhNDFiNzNlNTRiNC4uMmM0YWM3MWE3MTViIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2RtYS1idWYvZG1hLWhlYXAuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYwpAQCAt
MTYxLDYgKzE2MSw3IEBAIHZvaWQgKmRtYV9oZWFwX2dldF9kcnZkYXRhKHN0cnVjdCBkbWFfaGVh
cCAqaGVhcCkKIHsKIAlyZXR1cm4gaGVhcC0+cHJpdjsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKGRt
YV9oZWFwX2dldF9kcnZkYXRhKTsKIAogc3RydWN0IGRtYV9oZWFwICpkbWFfaGVhcF9hZGQoY29u
c3Qgc3RydWN0IGRtYV9oZWFwX2V4cG9ydF9pbmZvICpleHBfaW5mbykKIHsKQEAgLTI0Myw2ICsy
NDQsNyBAQCBzdHJ1Y3QgZG1hX2hlYXAgKmRtYV9oZWFwX2FkZChjb25zdCBzdHJ1Y3QgZG1hX2hl
YXBfZXhwb3J0X2luZm8gKmV4cF9pbmZvKQogCWtmcmVlKGhlYXApOwogCXJldHVybiBlcnJfcmV0
OwogfQorRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2hlYXBfYWRkKTsKIAogc3RhdGljIGNoYXIgKmRt
YV9oZWFwX2Rldm5vZGUoc3RydWN0IGRldmljZSAqZGV2LCB1bW9kZV90ICptb2RlKQogewpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL0tjb25maWcgYi9kcml2ZXJzL2RtYS1idWYv
aGVhcHMvS2NvbmZpZwppbmRleCBhNWVlZjA2YzQyMjYuLmUyNzNmYjE4ZmVjYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL0tjb25maWcKKysrIGIvZHJpdmVycy9kbWEtYnVmL2hl
YXBzL0tjb25maWcKQEAgLTEsMTIgKzEsMTIgQEAKIGNvbmZpZyBETUFCVUZfSEVBUFNfU1lTVEVN
Ci0JYm9vbCAiRE1BLUJVRiBTeXN0ZW0gSGVhcCIKKwl0cmlzdGF0ZSAiRE1BLUJVRiBTeXN0ZW0g
SGVhcCIKIAlkZXBlbmRzIG9uIERNQUJVRl9IRUFQUwogCWhlbHAKIAkgIENob29zZSB0aGlzIG9w
dGlvbiB0byBlbmFibGUgdGhlIHN5c3RlbSBkbWFidWYgaGVhcC4gVGhlIHN5c3RlbSBoZWFwCiAJ
ICBpcyBiYWNrZWQgYnkgcGFnZXMgZnJvbSB0aGUgYnVkZHkgYWxsb2NhdG9yLiBJZiBpbiBkb3Vi
dCwgc2F5IFkuCiAKIGNvbmZpZyBETUFCVUZfSEVBUFNfQ01BCi0JYm9vbCAiRE1BLUJVRiBDTUEg
SGVhcCIKKwl0cmlzdGF0ZSAiRE1BLUJVRiBDTUEgSGVhcCIKIAlkZXBlbmRzIG9uIERNQUJVRl9I
RUFQUyAmJiBETUFfQ01BCiAJaGVscAogCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIHRvIGVuYWJsZSBk
bWEtYnVmIENNQSBoZWFwLiBUaGlzIGhlYXAgaXMgYmFja2VkCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVh
cC1oZWxwZXJzLmMKaW5kZXggNzUwYmVmNGU5MDJkLi5mYjk4MzUxMjY4OTMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuYworKysgYi9kcml2ZXJzL2RtYS1i
dWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMKQEAgLTI0LDYgKzI0LDcgQEAgdm9pZCBpbml0X2hlYXBf
aGVscGVyX2J1ZmZlcihzdHJ1Y3QgaGVhcF9oZWxwZXJfYnVmZmVyICpidWZmZXIsCiAJSU5JVF9M
SVNUX0hFQUQoJmJ1ZmZlci0+YXR0YWNobWVudHMpOwogCWJ1ZmZlci0+ZnJlZSA9IGZyZWU7CiB9
CitFWFBPUlRfU1lNQk9MX0dQTChpbml0X2hlYXBfaGVscGVyX2J1ZmZlcik7CiAKIHN0cnVjdCBk
bWFfYnVmICpoZWFwX2hlbHBlcl9leHBvcnRfZG1hYnVmKHN0cnVjdCBoZWFwX2hlbHBlcl9idWZm
ZXIgKmJ1ZmZlciwKIAkJCQkJICBpbnQgZmRfZmxhZ3MpCkBAIC0zNyw2ICszOCw3IEBAIHN0cnVj
dCBkbWFfYnVmICpoZWFwX2hlbHBlcl9leHBvcnRfZG1hYnVmKHN0cnVjdCBoZWFwX2hlbHBlcl9i
dWZmZXIgKmJ1ZmZlciwKIAogCXJldHVybiBkbWFfYnVmX2V4cG9ydCgmZXhwX2luZm8pOwogfQor
RVhQT1JUX1NZTUJPTF9HUEwoaGVhcF9oZWxwZXJfZXhwb3J0X2RtYWJ1Zik7CiAKIHN0YXRpYyB2
b2lkICpkbWFfaGVhcF9tYXBfa2VybmVsKHN0cnVjdCBoZWFwX2hlbHBlcl9idWZmZXIgKmJ1ZmZl
cikKIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
