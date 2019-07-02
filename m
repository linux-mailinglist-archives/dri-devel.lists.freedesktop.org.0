Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D865D74C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 22:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551DE6E03C;
	Tue,  2 Jul 2019 20:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8340A6E03C;
 Tue,  2 Jul 2019 20:26:45 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d23so32836qto.2;
 Tue, 02 Jul 2019 13:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aM7TEuKumvUMe3SbB3+XmY4I8aQKFrST7xx8ZApBOcM=;
 b=XGJCnd0ItpW8nDIdR9QD8yijl4gGok0AF5szaPs0viC+i9KFmK8whrjCU04Qzlk11V
 Xy3OZlgl+NuT+GE/z5WRx32wqOXoij3R0VIbGx7woF1uHDL+a6F5hCCQLv50K0FWJ5sg
 y9IysTtvlNYpQeXpjpfX0ABXXqMxRXeLEcb18eUmJJW7J/c7OR2Tn2ck7tFSyUxB2x0y
 D+fyVEKZDDuuTjAUnAZpQnr3M2xlRen0H41NSZek2/BTJ6vOrsLnVmH9/JYf5QD/FURR
 5xRpaprTjX3OraAFwoXFGkug2ctTQPdBRsajfyy8vyd1w0g9RZNOouteEZnZjFjW6Hb2
 xYoQ==
X-Gm-Message-State: APjAAAU7sHbx2DGGpdTQNQOXWrkZJKwGgRw830q8q7s1/rkJ5Sjo2z0r
 voArr+TBxp04s3f4GjlQMtw=
X-Google-Smtp-Source: APXvYqxHJBmk2g0xpgV4VUHGsLMtAzHIfVL3nv7QBsGBAXs8stUf9sYJU+dbtd2Yxf85Z4tgzUX1Cw==
X-Received: by 2002:a0c:b755:: with SMTP id q21mr27605171qve.92.1562099204529; 
 Tue, 02 Jul 2019 13:26:44 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id f6sm6267017qkk.79.2019.07.02.13.26.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:26:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] iommu: handle drivers that manage iommu directly
Date: Tue,  2 Jul 2019 13:26:17 -0700
Message-Id: <20190702202631.32148-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aM7TEuKumvUMe3SbB3+XmY4I8aQKFrST7xx8ZApBOcM=;
 b=Y0c3Zbx/HklkB3ZQUMPUnd3cuD2+CXBd/qv6pY0OkEJTg/+z03wi0oF1CvFJYsaUkZ
 4zHdADC6xI/bjao5kJDJAheklnpxnkP641vjkWWAD6dXp83EK+bgIBqRrhp5R+e9GhCz
 zCGy7sAlE3XsPTlqcBMQPxFhUYqm5Yg2JhxtQejc7AlhxkxL1xSYYXRVk6l4V/OzXbVr
 F2N4nVUleb2SyZc8sgC2poSaaQ+CgHZiuCRWIi+78YgA4bpPN5KzS8h7SHnC0qrpdgs/
 YZxrEttZo98QKBCnwb20wNLc3UgkTsaMpeRea2ivIhOm1ixPyotAxAUbQecsF1pxUnqv
 E1Mg==
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Rob Clark <robdclark@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, Bartosz Golaszewski <brgl@bgdev.pl>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Bruce Wang <bzwang@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, aarch64-laptops@lists.linaro.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Joe Perches <joe@perches.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKT25lIG9mIHRoZSBjaGFs
bGVuZ2VzIHdlIG5lZWQgdG8gaGFuZGxlIHRvIGVuYWJsZSB0aGUgYWFyY2g2NCBsYXB0b3BzCnVw
c3RyZWFtIGlzIGRlYWxpbmcgd2l0aCB0aGUgZmFjdCB0aGF0IHRoZSBib290bG9hZGVyIGVuYWJs
ZXMgdGhlCmRpc3BsYXkgYW5kIHRha2VzIHRoZSBjb3JyZXNwb25kaW5nIFNNTVUgY29udGV4dC1i
YW5rIG91dCBvZiBCWVBBU1MuClVuZm9ydHVuYXRlbHksIGN1cnJlbnRseSwgdGhlIElPTU1VIGZy
YW1ld29yayBhdHRhY2hlcyBhIERNQSAob3IKcG90ZW50aWFsbHkgYW4gSURFTlRJVFkpIGRvbWFp
biBiZWZvcmUgdGhlIGRyaXZlciBpcyBwcm9iZWQgYW5kIGhhcwphIGNoYW5jZSB0byBpbnRlcnZl
bmUgYW5kIHNodXRkb3duWzFdIHNjYW5vdXQuICBXaGljaCBtYWtlcyB0aGluZ3MgZ28KaG9ycmli
bHkgd3JvbmcuCgpUaGlzIGFsc28gaGFwcGVucyB0byBzb2x2ZSBhIHByb2JsZW0gdGhhdCBpcyBi
bG9ja2luZyB1cyBmcm9tIHN1cHBvcnRpbmcKcGVyLWNvbnRleHQgcGFnZXRhYmxlcyBvbiB0aGUg
R1BVLCBkdWUgdG8gZG9tYWluIHRoYXQgaXMgYXR0YWNoZWQgYmVmb3JlCmRyaXZlciBoYXMgYSBj
aGFuY2UgdG8gYXR0YWNoIGl0J3Mgb3duIGRvbWFpbiBmb3IgdGhlIEdQVS4KCkJ1dCBzaW5jZSB0
aGUgZHJpdmVyIGlzIG1hbmFnaW5nIGl0J3Mgb3duIGlvbW11IGRvbWFpbnMgZGlyZWN0bHksIGFu
ZApkb2VzIG5vdCB1c2UgZGV2LT5pb21tdV9ncm91cC0+ZGVmYXVsdF9kb21haW4gYXQgYWxsLCB0
aGUgc2ltcGxlCnNvbHV0aW9uIHRvIGJvdGggcHJvYmxlbXMgaXMgdG8ganVzdCBhdm9pZCBhdHRh
Y2hpbmcgdGhhdCBkb21haW4gaW4gdGhlCmZpcnN0IHBsYWNlLgoKWzFdIEV2ZW50dWFsbHkgd2Ug
d2FudCB0byBiZSBhYmxlIHRvIGRvIGEgc2VlbWxlc3MgdHJhbnNpdGlvbiBmcm9tCiAgICBlZmlm
YiB0byBkcm0vbXNtLi4uIGJ1dCBmaXJzdCBzdGVwIGlzIHRvIGdldCB0aGUgY29yZSAoaW9tbXUs
CiAgICBjbGssIGdlbnBkKSBwaWVjZXMgaW4gcGxhY2UsIHNvIGEgZmlyc3Qgc3RlcCBvZiBkaXNh
YmxpbmcgdGhlCiAgICBkaXNwbGF5IGJlZm9yZSBmaXJzdCBtb2Rlc2V0IGVuYWJsZXMgdXMgdG8g
Z2V0IGFsbCBvZiB0aGUKICAgIGRlcGVuZGVuY2llcyBvdXRzaWRlIG9mIGRybS9tc20gaW4gcGxh
Y2UuICBBbmQgdGhpcyBhdCBsZWFzdAogICAgZ2V0cyB1cyBwYXJpdHkgd2l0aCB3aW5kb3dzICh3
aGljaCBhbHNvIGFwcGVhcnMgdG8gZG8gYSBtb2Rlc2V0CiAgICBiZXR3ZWVuIGJvb3Rsb2FkZXIg
YW5kIEhMU08pLiAgQWZ0ZXIgdGhhdCB0aGVyZSBpcyBhIGJ1bmNoIG9mCiAgICBkcm0vbXNtIHdv
cmsgdGhhdCBpcyBwcm9iYWJseSBub3QgaW50ZXJlc3RpbmcgdG8gZm9sa3Mgb3V0c2lkZQogICAg
b2YgZHJpLWRldmVsLgoKUm9iIENsYXJrICgyKToKICBpb21tdTogYWRkIHN1cHBvcnQgZm9yIGRy
aXZlcnMgdGhhdCBtYW5hZ2UgaW9tbXUgZXhwbGljaXRseQogIGRybS9tc206IG1hcmsgZGV2aWNl
cyB3aGVyZSBpb21tdSBpcyBtYW5hZ2VkIGJ5IGRyaXZlcgoKIGRyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2FkcmVub19kZXZpY2UuYyB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9rbXMuYyAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21k
cDVfa21zLmMgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jICAgICAgICAg
ICAgICB8ICAxICsKIGRyaXZlcnMvaW9tbXUvaW9tbXUuYyAgICAgICAgICAgICAgICAgICAgICB8
IDExICsrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L2RldmljZS5oICAgICAgICAgICAgICAgICAg
ICAgfCAgMyArKy0KIDYgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
