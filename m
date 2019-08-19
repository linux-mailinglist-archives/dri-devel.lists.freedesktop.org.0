Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F83E95156
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD036E48D;
	Mon, 19 Aug 2019 23:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626D06E48B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:04:02 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id p3so2031154pgb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ffOhLSrwkZ0FoYckf3kTJH2dZNi42NmCSonPnEyy2Hc=;
 b=DlM4xTdPfNw1vIfzBjVhuhask3i3LVSE+losQLK6kc6hsUn6i+oXk31ZlpptMzlde2
 07AJ3dgDSz2kzv5TryR/g9PFxpkHC6ZXH6Fn412P0qsz6y3bCLfw8I2kizrxJ2FLEeIU
 PWD5GQF5NL1Ie8PDXonQX4qQzYaF+3MEGZzUdv2GQjY6W3tNPZ66J3FHMxJD459bKb8r
 XLJVQdziKV0RHrMdS5oQG1d9/nogRvYFxpPCSlNkZLARMNmX1AgRViHbtoz7oafIfeQA
 CroUEfLAE1KtubowtomZen6LH0/FlyQRF/+xjQjhwMmDkap5k40jAAKnDEwQSx5W1bZF
 AY1w==
X-Gm-Message-State: APjAAAUzhkNCPluax4UXAWH3z9oKvvT0w0YtZspGy6zBL6DjL5OB3kUy
 Ks96GywmprwZGcl3Ji5IrCgq0A==
X-Google-Smtp-Source: APXvYqxoxiFV08/B/uo/2/sQJgEIGK7Iy84PjzPkwa/66GDBThzwEXIfxiZD56GFZFTRHw7CIvuc6w==
X-Received: by 2002:a63:89c2:: with SMTP id
 v185mr21987280pgd.241.1566255840875; 
 Mon, 19 Aug 2019 16:04:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 j15sm17256509pfr.146.2019.08.19.16.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 16:04:00 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 23/25] drm: kirin: Add alloc_hw_ctx/clean_hw_ctx ops in
 driver data
Date: Mon, 19 Aug 2019 23:03:19 +0000
Message-Id: <20190819230321.56480-24-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819230321.56480-1-john.stultz@linaro.org>
References: <20190819230321.56480-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ffOhLSrwkZ0FoYckf3kTJH2dZNi42NmCSonPnEyy2Hc=;
 b=u3ZHOgJd502s/aInsx0EzPcO26A1FA+uOEiIkhJKCiZ5hAcXzU0zAQA5eqfrge34yi
 HAgWlvz/zeQt8miwKSyTesRUl1qArKIpHtaIH+G98V0fKGHBkGDCIBoP4QyLv+B7zHbq
 37bE3GwOVky5lEbBJqQSMAo1roqIKmn2AWPjyso7Tas2OIQ9zPgSffUeorOIz5D4N/iM
 ZpXMH1NNPT9hmJNqSvjyRqLzMG8OC+SlIUZBUSe2Xb7YctyFGwY04qyxJNFIuOnIX3QH
 HEt/eAuQu2E5dQ9B+3n1qJIurFSg7Rp4/Uy8Qk7EuLxvU/vssVWSA90jn9ry/YwoNGeI
 xr/A==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUKYWxsb2MvY2xlYW5faHdfY3R4
IGZ1bmN0aW9ucyB0byBiZSBjYWxsZWQgdmlhIGRyaXZlcl9kYXRhCnNwZWNpZmljIGZ1bmNpdG9u
IHBvaW50ZXJzLgoKVGhpcyB3aWxsIGFsbG93IHRoZSBhZGVfZHJtX2luaXQgdG8gbGF0ZXIgYmUg
bWFkZSBnZW5lcmljIGFuZAptb3ZlZCB0byBraXJpbl9kcm1fZHJ2LmMKCkNjOiBSb25ncm9uZyBa
b3UgPHpvdXJvbmdyb25nQGdtYWlsLmNvbT4KQ2M6IFhpbmxpYW5nIExpdSA8ei5saXV4aW5saWFu
Z0BoaXNpbGljb24uY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsIDxkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
PgpBY2tlZC1ieTogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+ClJl
dmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYtYnk6
IFh1IFlpUGluZyA8eHV5aXBpbmdAaGlzaWxpY29uLmNvbT4KW2pzdHVsdHo6IFJld29yZGVkIGNv
bW1pdCBtZXNzYWdlXQpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGlu
YXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9h
ZGUuYyB8IDkgKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmlu
X2RybV9kcnYuaCB8IDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2ly
aW4va2lyaW5fZHJtX2FkZS5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJp
bl9kcm1fYWRlLmMKaW5kZXggYTdmZTJmYzU3YmY3Li41Y2FmMDkyMWMyNmMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCkBAIC05OTksNyAr
OTk5LDcgQEAgc3RhdGljIGludCBhZGVfZHJtX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAkJcmV0dXJuIC1FTk9NRU07CiAJfQogCi0JY3R4ID0gYWRlX2h3X2N0eF9hbGxvYyhw
ZGV2LCAmYWRlLT5jcnRjLmJhc2UpOworCWN0eCA9IGFkZV9kcml2ZXJfZGF0YS5hbGxvY19od19j
dHgocGRldiwgJmFkZS0+Y3J0Yy5iYXNlKTsKIAlpZiAoSVNfRVJSKGN0eCkpIHsKIAkJRFJNX0VS
Uk9SKCJmYWlsZWQgdG8gaW5pdGlhbGl6ZSBraXJpbl9wcml2IGh3IGN0eFxuIik7CiAJCXJldHVy
biAtRUlOVkFMOwpAQCAtMTAzOCw2ICsxMDM4LDEwIEBAIHN0YXRpYyBpbnQgYWRlX2RybV9pbml0
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyB2
b2lkIGFkZV9od19jdHhfY2xlYW51cCh2b2lkICpod19jdHgpCit7Cit9CisKIHN0YXRpYyB2b2lk
IGFkZV9kcm1fY2xlYW51cChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogfQpAQCAt
MTA4Nyw2ICsxMDkxLDkgQEAgc3RydWN0IGtpcmluX2RybV9kYXRhIGFkZV9kcml2ZXJfZGF0YSA9
IHsKIAkucGxhbmVfZnVuY3MgPSAmYWRlX3BsYW5lX2Z1bmNzLAogCS5tb2RlX2NvbmZpZ19mdW5j
cyA9ICZhZGVfbW9kZV9jb25maWdfZnVuY3MsCiAKKwkuYWxsb2NfaHdfY3R4ID0gYWRlX2h3X2N0
eF9hbGxvYywKKwkuY2xlYW51cF9od19jdHggPSBhZGVfaHdfY3R4X2NsZWFudXAsCisKIAkuaW5p
dCA9IGFkZV9kcm1faW5pdCwKIAkuY2xlYW51cCA9IGFkZV9kcm1fY2xlYW51cAogfTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5oIGIv
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmgKaW5kZXggOTVm
NTZjOTk2MGQ1Li4xNjYzNjEwZDJjZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNp
bGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24va2lyaW4va2lyaW5fZHJtX2Rydi5oCkBAIC00OSw2ICs0OSwxMSBAQCBzdHJ1Y3Qga2lyaW5f
ZHJtX2RhdGEgewogCWNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfaGVscGVyX2Z1bmNzICpwbGFuZV9o
ZWxwZXJfZnVuY3M7CiAJY29uc3Qgc3RydWN0IGRybV9wbGFuZV9mdW5jcyAgKnBsYW5lX2Z1bmNz
OwogCWNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgKm1vZGVfY29uZmlnX2Z1bmNz
OworCisJdm9pZCAqKCphbGxvY19od19jdHgpKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYs
CisJCQkgICAgICBzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOworCXZvaWQgKCpjbGVhbnVwX2h3X2N0
eCkodm9pZCAqaHdfY3R4KTsKKwogCWludCAoKmluaXQpKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpOwogCXZvaWQgKCpjbGVhbnVwKShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTsK
IH07Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
