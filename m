Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AD5E569E
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 00:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0680D6EBBA;
	Fri, 25 Oct 2019 22:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BC46EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 22:50:16 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id q21so2037445plr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 15:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WK3SlUf5Gs26MRGfMYO+sZq/r8if+NvP4msj/EMhnDI=;
 b=X130BkybS+oavJ1d6Q1n4J+K6/ySjk3SoLuOurcZ5XKCp/XQRNmtiM5UKB0Vz7rrqG
 NdeHtz6biD3Q9GpZV8AeJEEJVfsXJZrjROpjAzlMunypKNXktxdPqQmNP0HDErxTs/IW
 mR3qiKUaJN8OvAzRuVANwmGX9g/f3kibc2Z9+1oVpSCewsnxERxs46Q2QjFxDikSBVDj
 T0loAqjgBnnvvS7V9JpA50L++xx+qbWshyUnFTnfXIAUc2iDpzjF7qNLUGJBM9oSAOFs
 6Q3wmUWMb9WCJJ4KcCyj5e7VEkGPPZGMp0XXUTJezsruc/ACISDy5bn5nqjj8Srr2gf6
 musw==
X-Gm-Message-State: APjAAAXe2E5mCUJuKOMWF3jTKKZidWzUb7g0mSf7dlzDbmARogoRRZ75
 6AymGIgo6j4Ylfgysa7TvknB5w==
X-Google-Smtp-Source: APXvYqwQLQqa6cIVroIB0jGdxbexLrpc2SfRdat8vKLK45RzjXk9xs4WDP+k4gpJHIg7f7PX43Yojw==
X-Received: by 2002:a17:902:d913:: with SMTP id
 c19mr6398645plz.48.1572043816005; 
 Fri, 25 Oct 2019 15:50:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 o15sm2758018pjs.14.2019.10.25.15.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 15:50:15 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 0/3] Support non-default CMA regions to the dmabuf heaps
 interface
Date: Fri, 25 Oct 2019 22:50:06 +0000
Message-Id: <20191025225009.50305-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=WK3SlUf5Gs26MRGfMYO+sZq/r8if+NvP4msj/EMhnDI=;
 b=W06oXB6IMpWhM8dtYxX4fJ2EYFzVUD5CG6VL1kdGUPIGPjDdJOvFUBgYM3ETY3MfKK
 IGw50t96VojqD+FT/EO1EVcSuM2ummWiEQqaHrpkfnQKdLdjWpXhJPCoDfuncYeLu7yR
 S/dND9LH65leNIe3NixQsxPxXFhbVLUDu7zLJ2/R8HjgnPgQhadWewKuo7gGRIcEY+jq
 qd+N/q5dVs390J3XqSeJcYZue+xNm061VT5uIFLhDjYYJPS/W6XuVG89a3yHNM8afRuw
 gVMVCjzQ/OJ6MmZmisewh8Ds3g1fUbpntD6qrNjczAA+0j4/t78L45JkiT3Nk0mLNoe+
 qcKw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sandeep Patil <sspatil@google.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 "Andrew F . Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Pratik Patel <pratikp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIGRtYWJ1ZiBoZWFwcyBjb3JlIGNvZGUgaGFzIGJlZW4gcXVldWVkLCBJIHdh
bnRlZCB0bwpzdWJtaXQgZm9yIGluaXRpYWwgcmV2aWV3IHNvbWUgb2YgdGhlIGNoYW5nZXMgSSBo
YXZlIHBlbmRpbmcuCgpJbiBwcmV2aW91cyB2ZXJzaW9ucywgdGhlIGRtYWJ1ZiBDTUEgaGVhcCBh
ZGRlZCBhbGwgQ01BIGFyZWFzIHRvCnRoZSBkbWFidWYgaGVhcHMgaW50ZXJmYWNlLiBIb3dldmVy
LCBBbmRyZXcgbm90ZWQgdGhpcyBtYXkgbm90CmJlIGRlc2lyYWJsZSwgc28gSSd2ZSBjb21lIHVw
IHdpdGggYSBEVCBiaW5kaW5nIGFuZCBjb2RlIHRvCmFsbG93IHNwZWNpZmllZCBDTUEgcmVnaW9u
cyB0byBiZSBhZGRlZCB0byB0aGUgZG1hYnVmIGhlYXBzCmludGVyZmFjZS4KClRoaXMgYWxsb3dz
IGFkZGl0aW9uYWwgQ01BIHJlZ2lvbnMgZm9yIHRoaW5ncyBsaWtlIGNhbWVyYXMsIGV0Ywp0byBi
ZSBhbGxvY2F0ZWQgZnJvbSBzZXBhcmF0ZWx5IGZyb20gdGhlIGRlZmF1bHQgcmVnaW9uLgoKUmV2
aWV3IGFuZCBmZWVkYmFjayB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkIQoKdGhhbmtzCi1q
b2huCgpDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KQ2M6IE1hcmsgUnV0bGFu
ZCA8bWFyay5ydXRsYW5kQGFybS5jb20+CkNjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0
LmNvbT4KQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3Jn
PgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IExpYW0gTWFy
ayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+CkNjOiBQcmF0aWsgUGF0ZWwgPHByYXRpa3BAY29kZWF1
cm9yYS5vcmc+CkNjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+CkNjOiBB
bmRyZXcgRi4gRGF2aXMgPGFmZEB0aS5jb20+CkNjOiBDaGVuYm8gRmVuZyA8ZmVuZ2NAZ29vZ2xl
LmNvbT4KQ2M6IEFsaXN0YWlyIFN0cmFjaGFuIDxhc3RyYWNoYW5AZ29vZ2xlLmNvbT4KQ2M6IFNh
bmRlZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xlLmNvbT4KQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhy
aWR5YUBnb29nbGUuY29tPgpDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKCkpvaG4gU3R1bHR6ICgzKToKICBkdC1iaW5kaW5n
czogZG1hLWJ1ZjogaGVhcHM6IERlc2NyaWJlIENNQSByZWdpb25zIHRvIGJlIGFkZGVkIHRvCiAg
ICBkbWFidWYgaGVhcHMgaW50ZXJmYWNlLgogIGRtYS1idWY6IGhlYXBzOiBBbGxvdyBhZGRpbmcg
c3BlY2lmaWVkIG5vbi1kZWZhdWx0IENNQSBoZWFwcwogIGV4YW1wbGU6IGR0czogaGkzNjYwLWhp
a2V5OTYwOiBBZGQgZHRzIGVudHJpZXMgdG8gdGVzdCBjbWEgaGVhcAogICAgYmluZGluZwoKIC4u
Li9iaW5kaW5ncy9kbWEvZG1hYnVmLWhlYXAtY21hLnR4dCAgICAgICAgICB8IDMxICsrKysrKysr
KysrKysrKwogLi4uL2Jvb3QvZHRzL2hpc2lsaWNvbi9oaTM2NjAtaGlrZXk5NjAuZHRzICAgIHwg
MTMgKysrKysrLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMgICAgICAgICAgICAg
IHwgMzggKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2RtYS9kbWFidWYtaGVhcC1jbWEudHh0CgotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
