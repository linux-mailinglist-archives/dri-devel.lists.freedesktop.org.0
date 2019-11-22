Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D95A1089D0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5920089FDE;
	Mon, 25 Nov 2019 08:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D19F6E119
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 22:10:06 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id s75so8445489ilc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 14:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bBifFU+n+ullPalYVdHCIouKPhTwiN8vd2nuMuI0EP4=;
 b=BfmTSnPl1A7f4vdwwazHb5Kho9e3xI63Mxqih8X61RdQZCqWnNypHOPpDgJou4LN23
 Ap3UdzChsHAJ0hUjgCHc8XdhoZfcBBrCyB7DnyrckR0SwRMmJv6vn8UL/J3Dl6ZH4Lk8
 JamoS4aSNX2K4eNmhcxgVnTDQIJYNxNSw3ET3P6tbeSMKGzxWxzwBSLMY/wsGbtuX0dm
 B3aSSraeSEUOOerOuF630hk4LSom0QWuUcg/p7VHkAWqAmXL87Ml4k6PV8HCGzBNWOJd
 mJEwih4AKgjSZ08rmJMQMadjNiHiMeuMvUBPQS/Y0dQCQdUNA2j10ilGUoA6t2VxNIXN
 jH2Q==
X-Gm-Message-State: APjAAAVg33aBZ0gS0M1PmHhL6AT7YZpBGtvsJeNzFdaBG3WRVm38J1fL
 JB0pfAcuuJSUBPUE52x9NJg=
X-Google-Smtp-Source: APXvYqzYxev0mehw5aRdi6YyMlpR/8LUw3GUw9sxPjIdE6W/F2xPhVpIyLMPatJ4Vp8FiB6YoHO2yw==
X-Received: by 2002:a92:8605:: with SMTP id g5mr19067812ild.172.1574460605747; 
 Fri, 22 Nov 2019 14:10:05 -0800 (PST)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id x62sm398741ill.86.2019.11.22.14.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 14:10:05 -0800 (PST)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: Fix memory leak in sync_file_merge()
Date: Fri, 22 Nov 2019 16:09:55 -0600
Message-Id: <20191122220957.30427-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bBifFU+n+ullPalYVdHCIouKPhTwiN8vd2nuMuI0EP4=;
 b=N7Owfb0ymE4k55Cz4Tylc3lGqajuxdOLCaNNOL3y3YMqPUW3gcx8W6yj+Dpbm0wi1Y
 9DY8gf1IHSaJjwBIxHM9apHriu6PKCVWVyYNrK++aBHkQFO9JfB+ytCOwfLOYhZUqlKG
 JRtLyAL0FaN4vVtBMhgeAMmyTPm8AhrVAyIQm0foeg1A/UFKM3MgetBxBsNo2En9mCxM
 +8va9/9q+3jKh8fifbJLgo/lXfFEdQFEHN7aHwuL30xIygancJoCqz13j6Ij9dHgb2/I
 W5K4QaLAe34D7CngLE5MALsc0iuXyeqfX8nR0+B7okTbb68K227iK0fzCuiqvX12wmhT
 66wA==
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
Cc: emamd001@umn.edu, Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIHN5bmNfZmlsZV9tZXJnZSgpIHRoZSBhbGxvY2F0ZWQg
c3luY19maWxlIGlzCmxlYWtlZCBpZiBudW1iZXIgb2YgZmVuY2VzIG92ZXJmbG93cy4gUmVsZWFz
ZSBzeW5jX2ZpbGUgYnkgZ290byBlcnIuCgpGaXhlczogYTAyYjlkYzkwZDg0ICgiZG1hLWJ1Zi9z
eW5jX2ZpbGU6IHJlZmFjdG9yIGZlbmNlIHN0b3JhZ2UgaW4gc3RydWN0IHN5bmNfZmlsZSIpClNp
Z25lZC1vZmYtYnk6IE5hdmlkIEVtYW1kb29zdCA8bmF2aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4K
LS0tCiBkcml2ZXJzL2RtYS1idWYvc3luY19maWxlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1i
dWYvc3luY19maWxlLmMgYi9kcml2ZXJzL2RtYS1idWYvc3luY19maWxlLmMKaW5kZXggMjVjNWMw
NzE2NDViLi45MTE4NWRiOWE5NTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9zeW5jX2Zp
bGUuYworKysgYi9kcml2ZXJzL2RtYS1idWYvc3luY19maWxlLmMKQEAgLTIyMSw3ICsyMjEsNyBA
QCBzdGF0aWMgc3RydWN0IHN5bmNfZmlsZSAqc3luY19maWxlX21lcmdlKGNvbnN0IGNoYXIgKm5h
bWUsIHN0cnVjdCBzeW5jX2ZpbGUgKmEsCiAJYV9mZW5jZXMgPSBnZXRfZmVuY2VzKGEsICZhX251
bV9mZW5jZXMpOwogCWJfZmVuY2VzID0gZ2V0X2ZlbmNlcyhiLCAmYl9udW1fZmVuY2VzKTsKIAlp
ZiAoYV9udW1fZmVuY2VzID4gSU5UX01BWCAtIGJfbnVtX2ZlbmNlcykKLQkJcmV0dXJuIE5VTEw7
CisJCWdvdG8gZXJyOwogCiAJbnVtX2ZlbmNlcyA9IGFfbnVtX2ZlbmNlcyArIGJfbnVtX2ZlbmNl
czsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
