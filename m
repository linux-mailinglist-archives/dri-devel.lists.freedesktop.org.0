Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC9E124A1
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 00:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB562893D0;
	Thu,  2 May 2019 22:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA691893D0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 22:38:32 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id d31so1708628pgl.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 15:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBFW9ct9L9kxaMD7soK1MmMiGB02h+kun9/xHdLdz90=;
 b=kw9IfkQyMmmN25cwMNpBAyAPC5lc8HKPkRCXeyVPww+EHlbXYr67S7Zm+IDyJGtKmb
 O2xb8NRAdIvz9y+X4tMSJp6EvLEQ/ydAq2mNAKTZ6lnCytbzxidQf90P8Uf1kaYAnckD
 +EkVcRpWsW1gub1nu9uyyi3SkGP5HRhQPcSno1OgY6T2Ikx056FhyD/t0mx3NvOxcIeJ
 /hBjEO2pABaCCBJcOy9Y3rjH9V3vEKDCOJTEnn9SFPGe45MRqgS/liGz417YX1WiK/P0
 36WmBWdbrljZxI7ygyHCMuxnA1UifhvTU0Tc0r7X/xcKoh+hazdDrP8FKJdY8SjTr6yx
 gYLg==
X-Gm-Message-State: APjAAAWNyn+vlYaAM34Q9OunGixAYm08iniWxWelk4OyiNoZmOdr02u5
 GsV0/tqDCbwbvtL8+ZTc5Dnp3zVeEhs=
X-Google-Smtp-Source: APXvYqzq5JvWDWnU2WBxay5i7m7nGGZ4xrgcUbqlp6Nq6J2U3j8kQ26AAp/Vh8DDfS/M+iUafD66nQ==
X-Received: by 2002:a63:9dc8:: with SMTP id i191mr6416756pgd.91.1556836712382; 
 Thu, 02 May 2019 15:38:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id k186sm244151pfc.137.2019.05.02.15.38.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 15:38:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/2] drm/rockchip: dw_hdmi: Handle suspend/resume
Date: Thu,  2 May 2019 15:38:08 -0700
Message-Id: <20190502223808.185180-2-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190502223808.185180-1-dianders@chromium.org>
References: <20190502223808.185180-1-dianders@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBFW9ct9L9kxaMD7soK1MmMiGB02h+kun9/xHdLdz90=;
 b=T2KhVqVdwh/tHXA/wuJoYTbXZFKGkASbAuQ7K5ZNHDkBqe7WFxueRi4ZQzm45gLf4R
 Eprg1hoU+uGGZPCaZsQ10mK8879RYaj1HzX7E6Gkx+D50IZ2JbFyfHeg0wUOiVob+Vuq
 GJ/ylfxE9UI2yU1NYWDMzrpIvzCZQxrMahzGM=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 mka@chromium.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gUm9ja2NoaXAgcmszMjg4LWJhc2VkIENocm9tZWJvb2tzIHdoZW4geW91IGRvIGEgc3VzcGVu
ZC9yZXN1bWUKY3ljbGU6CgoxLiBZb3UgbG9zZSB0aGUgYWJpbGl0eSB0byBkZXRlY3QgYW4gSERN
SSBkZXZpY2UgYmVpbmcgcGx1Z2dlZCBpbi4KCjIuIElmIHlvdSdyZSB1c2luZyB0aGUgaTJjIGJ1
cyBidWlsdCBpbiB0byBkd19oZG1pIHRoZW4gaXQgc3RvcHMKd29ya2luZy4KCkxldCdzIGNhbGwg
dGhlIGNvcmUgZHctaGRtaSdzIHN1c3BlbmQvcmVzdW1lIGZ1bmN0aW9ucyB0byByZXN0b3JlCnRo
aW5ncy4KCk5PVEU6IGluIGRvd25zdHJlYW0gQ2hyb21lIE9TIChiYXNlZCBvbiBrZXJuZWwgMy4x
NCkgd2UgdXNlZCB0aGUKImxhdGUvZWFybHkiIHZlcnNpb25zIG9mIHN1c3BlbmQvcmVzdW1lIGJl
Y2F1c2Ugd2UgZm91bmQgdGhhdCB0aGUgVk9QCndhcyBzb21ldGltZXMgcmVzdW1pbmcgYmVmb3Jl
IGR3X2hkbWkgYW5kIHRoZW4gY2FsbGluZyBpbnRvIHVzIGJlZm9yZQp3ZSB3ZXJlIGZ1bGx5IHJl
c3VtZWQuICBGb3Igbm93IEkgaGF2ZSBnb25lIGJhY2sgdG8gdGhlIG5vcm1hbApzdXNwZW5kL3Jl
c3VtZSBiZWNhdXNlIEkgY2FuJ3QgcmVwcm9kdWNlIHRoZSBwcm9ibGVtcy4KClNpZ25lZC1vZmYt
Ynk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KLS0tCgogZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYyB8IDIwICsrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jCmluZGV4IDRjZGM5Zjg2YzJlNS4uZGViMGU4
YzMwYzAzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2Nr
Y2hpcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMK
QEAgLTU0MiwxMSArNTQyLDMxIEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9yb2NrY2hpcF9yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGlu
dCBfX21heWJlX3VudXNlZCBkd19oZG1pX3JvY2tjaGlwX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KQoreworCXN0cnVjdCByb2NrY2hpcF9oZG1pICpoZG1pID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7CisKKwlyZXR1cm4gZHdfaGRtaV9zdXNwZW5kKGhkbWktPmhkbWkpOworfQorCitzdGF0aWMg
aW50IF9fbWF5YmVfdW51c2VkIGR3X2hkbWlfcm9ja2NoaXBfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikKK3sKKwlzdHJ1Y3Qgcm9ja2NoaXBfaGRtaSAqaGRtaSA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOworCisJcmV0dXJuIGR3X2hkbWlfcmVzdW1lKGhkbWktPmhkbWkpOworfQorCitjb25zdCBz
dHJ1Y3QgZGV2X3BtX29wcyBkd19oZG1pX3JvY2tjaGlwX3BtID0geworCVNFVF9TWVNURU1fU0xF
RVBfUE1fT1BTKGR3X2hkbWlfcm9ja2NoaXBfc3VzcGVuZCwKKwkJCQlkd19oZG1pX3JvY2tjaGlw
X3Jlc3VtZSkKK307CisKIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZHdfaGRtaV9yb2NrY2hpcF9w
bHRmbV9kcml2ZXIgPSB7CiAJLnByb2JlICA9IGR3X2hkbWlfcm9ja2NoaXBfcHJvYmUsCiAJLnJl
bW92ZSA9IGR3X2hkbWlfcm9ja2NoaXBfcmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lID0g
ImR3aGRtaS1yb2NrY2hpcCIsCisJCS5wbSA9ICZkd19oZG1pX3JvY2tjaGlwX3BtLAogCQkub2Zf
bWF0Y2hfdGFibGUgPSBkd19oZG1pX3JvY2tjaGlwX2R0X2lkcywKIAl9LAogfTsKLS0gCjIuMjEu
MC4xMDIwLmdmMjgyMGNmMDFhLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
