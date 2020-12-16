Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA402DB7E7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 01:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AA28997A;
	Wed, 16 Dec 2020 00:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3F68997A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 00:49:36 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id m6so5794694pfm.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 16:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MKR4bPj+0an3d7yDezFmd6g6UgR/obAMB14Y7RLspck=;
 b=yq7gvFhVfsWJo+zmY4hoB9pnJ8uv4hOMEUXxPxzDyY6PT5gUiJ1INcEprFl4kAo2Pv
 QhBL52aN6JVteOJoWFo5AIGwb3EH7uM9OOnOVIFbLzfMjbk3txQg8ZCuyB4F8aQ1baYl
 002JC8jXKFq/zM4bR4nYghem24cu8Ux8/0kEU6Dwr79aEO83WV1+fIxhdJrBDX5FzJUT
 1ysRfgre6Vicnrou/JmjzMxM3JvKjZVNMUml9bk143Q775RStdJR5C61EcabGmOwIyRs
 skmq+rf145/CPRY3iAvBpzDZ2FzbnlE+h2FLn+SbPYxR3hhMrOAPtGQiohr0BcZl+sN7
 Uj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MKR4bPj+0an3d7yDezFmd6g6UgR/obAMB14Y7RLspck=;
 b=E/ghAtXJcjvrxeHRyZ4ZQiQrpRF+ZVoHk+wZiTxxYG9hSGjS3GiacjN8vQob5SIt4K
 BH6d7hKCBl6dlBxT7Vbx+sHA1ltHHXylKqNHqrM8aPNtmSUaeuqxsGrNTTa65U3TqRhI
 d395i5mCkO/7t6CdEcd9TaLYfwjY4ggrbI+gKaR/oCjjUN4VctFYeizXNTkTEUgeITr/
 beEndcE9utFa0Y6paBYRQIbiv5LgrcmWLuy3c7zs5Y1a78tY/0VJPpJYfpf9J4vMMow/
 wbt3vqawTlJvoNpOA9t099N+s5q07TlGbqilS3H68MWIDVcxgW5vYJyXbVLK4gCM+T8S
 93Mg==
X-Gm-Message-State: AOAM5309xKSvq5oOWtNiLNMc5ngtW4cEd8aht1ZS9J5Y5m34mGnV//Dz
 eb0oVILJ31uyGmk/6pljiXTE8A==
X-Google-Smtp-Source: ABdhPJyVbSdm2BRxuBQ11smLi/qlMz2NC4iswF5AXPde4Afv1/cEnbAlgSBqJzdKLY1agZLuKV0iLg==
X-Received: by 2002:a62:e519:0:b029:197:bcec:7c0c with SMTP id
 n25-20020a62e5190000b0290197bcec7c0cmr30530762pff.63.1608079776360; 
 Tue, 15 Dec 2020 16:49:36 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 k14sm166322pfp.132.2020.12.15.16.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 16:49:35 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] dma-buf: cma_heap: Include linux/vmalloc.h to fix build
 failures on MIPS
Date: Wed, 16 Dec 2020 00:49:31 +0000
Message-Id: <20201216004931.113505-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215235334.GA227480@roeck-us.net>
References: <20201215235334.GA227480@roeck-us.net>
MIME-Version: 1.0
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
Cc: Sandeep Patil <sspatil@google.com>, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byBpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+IGluIG9yZGVyIGZvciBNSVBTIHRv
IGZpbmQKdm1hcCgpLCBhcyBpdCBkb2Vzbid0IG90aGVyd2lzZSBnZXQgaW5jbHVkZWQgdGhlcmUu
CgpXaXRob3V0IHRoaXMgcGF0Y2gsIG9uZSBjYW4gaGl0IHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJy
b3I6CiAgZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmM6IEluIGZ1bmN0aW9uICdjbWFf
aGVhcF9kb192bWFwJzoKICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hlYXAuYzoxOTU6MTA6
IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAndm1hcCcKCkNjOiBTdW1p
dCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogTGlhbSBNYXJrIDxsbWFya0Bj
b2RlYXVyb3JhLm9yZz4KQ2M6IExhdXJhIEFiYm90dCA8bGFiYm90dEBrZXJuZWwub3JnPgpDYzog
QnJpYW4gU3RhcmtleSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPgpDYzogSHJpZHlhIFZhbHNhcmFq
dSA8aHJpZHlhQGdvb2dsZS5jb20+CkNjOiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29n
bGUuY29tPgpDYzogU2FuZGVlcCBQYXRpbCA8c3NwYXRpbEBnb29nbGUuY29tPgpDYzogRGFuaWVs
IE1lbnR6IDxkYW5pZWxtZW50ekBnb29nbGUuY29tPgpDYzogQ2hyaXMgR29sZHN3b3J0aHkgPGNn
b2xkc3dvQGNvZGVhdXJvcmEub3JnPgpDYzogw5hyamFuIEVpZGUgPG9yamFuLmVpZGVAYXJtLmNv
bT4KQ2M6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+CkNjOiBFemVxdWllbCBH
YXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+CkNjOiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1l
cnNpb24uZnI+CkNjOiBKYW1lcyBKb25lcyA8amFqb25lc0BudmlkaWEuY29tPgpDYzogbGludXgt
bWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkZpeGVzOiBhNWQyZDI5ZTI0YmUgKCJkbWEtYnVmOiBoZWFwczogTW92ZSBoZWFwLWhlbHBlciBs
b2dpYyBpbnRvIHRoZSBjbWFfaGVhcCBpbXBsZW1lbnRhdGlvbiIpClJlcG9ydGVkLWJ5OiBHdWVu
dGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+ClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6
IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFf
aGVhcC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9jbWFfaGVhcC5jCmluZGV4IDVlN2MzNDM2MzEwYy4uM2M0ZTM0MzAxMTcyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hlYXAuYworKysgYi9kcml2ZXJzL2RtYS1idWYv
aGVhcHMvY21hX2hlYXAuYwpAQCAtMjAsNiArMjAsNyBAQAogI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPgogI2luY2x1ZGUgPGxpbnV4L3NjYXR0ZXJsaXN0Lmg+CiAjaW5jbHVkZSA8bGludXgvc2xh
Yi5oPgorI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KIAogCiBzdHJ1Y3QgY21hX2hlYXAgewot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
