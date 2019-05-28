Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9272C9FB
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 17:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC2189EBB;
	Tue, 28 May 2019 15:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858A989EBB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 15:13:43 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id w18so8020381ywa.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w3he60PeRSDt9ElFd+He/Tvuudq445P3hVqGQ2V87lo=;
 b=clKhAXAUxxYHV8ikHPFsQmNSmd6Ua7Tw5uImelTn9tGGnKwfocPxw4SZtzi3NmSAJm
 DXVFLDLsHmNl/u8hY7r7tXllXZuCsRv1BXxCSHsmL06bEhODZkTBOAwQhSmLi3rJp507
 xciMDmvQr5RQSlG1YxlU4/wnrXwyw4wMBaJDbKEW9fPVVOC3tRpj2BYRRADZnlnQEjWp
 Nq+G5rKVdWFigSeffjdITalM/OppdgiLmDRE6ETlR/lgAup4307e7IFt6l6Q3YaBZ8V4
 ZpGCUc/ie1wEuphuWtmznIJ7N9De1rxDZ+mtiWlKdRX1YJDdlxe0Qn5xFAx2qocaEO3w
 7nfQ==
X-Gm-Message-State: APjAAAU03hJLwq6yrNB4UZ53i3tJTHNK6AU9aVpyFhTMAJ8wO5Mor/ol
 QZVkQ4pnlVkAuN+GNnnzhWnFG7bHEmI=
X-Google-Smtp-Source: APXvYqyiOA+7OXMVX0rtwnER0dJIf62nXkL2sShVfKOobvZy4nFsmF2XFSTY1dhu8wS5LztzFf4R6A==
X-Received: by 2002:a81:2fca:: with SMTP id
 v193mr10170562ywv.296.1559056422487; 
 Tue, 28 May 2019 08:13:42 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 136sm869596ywu.53.2019.05.28.08.13.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 08:13:41 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/dpu: Use provided drm_minor to initialize debugfs
Date: Tue, 28 May 2019 11:13:39 -0400
Message-Id: <20190528151339.207978-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
References: <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w3he60PeRSDt9ElFd+He/Tvuudq445P3hVqGQ2V87lo=;
 b=IhmRmU/8g5t6Ek/54QV0E5Gqj0o27WWZHFRm8mzsa1t0nGlHH6z4mrZGWzMdJjiRjb
 Q5GATtw5zORXMA+dFR+g2T8invO1zejFOEkYm6ouJxw4SGrILidp6QCtjNUcJ/ZrCkDp
 I4ztmHcIBunUbVPyIujsCTLqFCzM3ybHhHgildrTDObkIGOvdQlX8dpjwghC6NfeU/sc
 H7+zZwQxh68pq30R/M9uCgNPbk1ajEcaYGxp9axUH2Jit/xkItXlyShGIYArflg4MZ9U
 e5gtFZXPb0q3HMJxkFhZfjc9XU7C+iKQBaO0Tm9dA2p8OReDUppjp4y0UaOZuK+7Tn2+
 ahgg==
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
Cc: Rob Clark <robdclark@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpJbnN0ZWFkIG9mIHJlYWNo
aW5nIGludG8gZGV2LT5wcmltYXJ5IGZvciBkZWJ1Z2ZzX3Jvb3QsIHVzZSB0aGUgbWlub3IKcGFz
c2VkIGludG8gZGVidWdmc19pbml0LgoKVGhpcyBhdm9pZHMgY3JlYXRpbmcgYSBkZWJ1ZyBkaXJl
Y3RvcnkgdW5kZXIgL3N5cy9rZXJuZWwvZGVidWcvZGVidWcKYW5kIGluc3RlYWQgdXNlcyAvc3lz
L2tlcm5lbC9kZWJ1Zy9kcmkvPG5vZGU+LwoKU2luY2Ugd2UncmUgbm93IHB1dHRpbmcgZXZlcnl0
aGluZyB1bmRlciAqL2RyaS88bm9kZT4sIHRoZXJlJ3Mgbm8KbmVlZCB0byBjcmVhdGUgYSBkdXBs
aWNhdGUgImRlYnVnIiBkaXJlY3RvcnkuIEp1c3QgcHV0IGV2ZXJ5dGhpbmcgaW4KdGhlIHJvb3Qu
CgpDaGFuZ2VzIGluIHYyOgotIFJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgImRlYnVnIiBkaXJlY3Rv
cnkgKFN0ZXBoZW4pCgpMaW5rIHRvIHYxOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvbXNnaWQvMjAxOTA1MjQxNzMyMzEuNTA0MC0xLXNlYW5AcG9vcmx5LnJ1bgoKQ2M6
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KUmVwb3J0ZWQtYnk6IFN0ZXBoZW4g
Qm95ZCA8c3dib3lkQGNocm9taXVtLm9yZz4KUmV2aWV3ZWQtYnk6IEFiaGluYXYgS3VtYXIgPGFi
aGluYXZrQGNvZGVhdXJvcmEub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVs
QGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21z
LmMgfCAxMCArKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwppbmRleCA4
ODViZjg4YWZhM2VjLi5hZDA5NDcwNDYxMGY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2ttcy5jCkBAIC0yMzEsMTggKzIzMSwxNCBAQCB2b2lkICpkcHVfZGVidWdmc19jcmVh
dGVfcmVnc2V0MzIoY29uc3QgY2hhciAqbmFtZSwgdW1vZGVfdCBtb2RlLAogCQkJcmVnc2V0LCAm
ZHB1X2ZvcHNfcmVnc2V0MzIpOwogfQogCi1zdGF0aWMgaW50IF9kcHVfZGVidWdmc19pbml0KHN0
cnVjdCBkcHVfa21zICpkcHVfa21zKQorc3RhdGljIGludCBfZHB1X2RlYnVnZnNfaW5pdChzdHJ1
Y3QgZHB1X2ttcyAqZHB1X2ttcywgc3RydWN0IGRybV9taW5vciAqbWlub3IpCiB7CiAJdm9pZCAq
cCA9IGRwdV9od191dGlsX2dldF9sb2dfbWFza19wdHIoKTsKLQlzdHJ1Y3QgZGVudHJ5ICplbnRy
eTsKKwlzdHJ1Y3QgZGVudHJ5ICplbnRyeSA9IG1pbm9yLT5kZWJ1Z2ZzX3Jvb3Q7CiAKIAlpZiAo
IXApCiAJCXJldHVybiAtRUlOVkFMOwogCi0JZW50cnkgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoImRl
YnVnIiwgZHB1X2ttcy0+ZGV2LT5wcmltYXJ5LT5kZWJ1Z2ZzX3Jvb3QpOwotCWlmIChJU19FUlJf
T1JfTlVMTChlbnRyeSkpCi0JCXJldHVybiAtRU5PREVWOwotCiAJLyogYWxsb3cgcm9vdCB0byBi
ZSBOVUxMICovCiAJZGVidWdmc19jcmVhdGVfeDMyKERQVV9ERUJVR0ZTX0hXTUFTS05BTUUsIDA2
MDAsIGVudHJ5LCBwKTsKIApAQCAtNTgxLDcgKzU3Nyw3IEBAIHN0YXRpYyBpbnQgX2RwdV9rbXNf
ZHJtX29ial9pbml0KHN0cnVjdCBkcHVfa21zICpkcHVfa21zKQogI2lmZGVmIENPTkZJR19ERUJV
R19GUwogc3RhdGljIGludCBkcHVfa21zX2RlYnVnZnNfaW5pdChzdHJ1Y3QgbXNtX2ttcyAqa21z
LCBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikKIHsKLQlyZXR1cm4gX2RwdV9kZWJ1Z2ZzX2luaXQo
dG9fZHB1X2ttcyhrbXMpKTsKKwlyZXR1cm4gX2RwdV9kZWJ1Z2ZzX2luaXQodG9fZHB1X2ttcyhr
bXMpLCBtaW5vcik7CiB9CiAjZW5kaWYKIAotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVl
ciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
