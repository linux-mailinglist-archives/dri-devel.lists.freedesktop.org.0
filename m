Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD6821B095
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDD86EB82;
	Fri, 10 Jul 2020 07:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483FE6EA70
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:03:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l2so1941833wmf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UkW9l8coJNpZK7uX8c6xzFbB2l+pGmfP62kLElQGlUY=;
 b=W+v8x9+FNPWAzpyi5MQPB137c+NQkkyrDsBman9ISVngwRPnGJzp0t8AEW0o+7nM+F
 Y00ECIFPX8z+r8390mu7JtnC+/G2lNt/VpETuByq9w66musgFxqBf0G3AFYSx7WAuYpc
 pol244/MK4olowGHH2GjWw3dMA9gbFkkswKYKkCGNtgNNKS6eyCA06El6ujw7BDlWi6Z
 jiuplLH27xfXHm5o0Vn/B19yq7/+Y8gdWpWQos668zhdX9d2PevOtHIxvyybq5fRGFRF
 dZ3YsugPsbm1W7okkJXJ0EADWXPZ4XkRxZ5rAhjCOl/MtP/sGn1sALP/KGND+8h9BxT6
 F6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UkW9l8coJNpZK7uX8c6xzFbB2l+pGmfP62kLElQGlUY=;
 b=S+WUHlTff60iTcBaiiFCZu/n0fTQ+honUicsUAp7+LWsT3I9I7glvN+og1DbFZpIwx
 qgNF1dzTxfwnalxWmcxC8FcWgB/2OtbT+xm6rWN5iP7r7T3e7llZyWNzGWovVLTvdqnd
 zQUQvafaEQrF2+xdacU9L5/29UGd2UX1Bolq/9ABkYUpcUlGeopOuFwOEidZTEKNEZNm
 fzdHMquSLxWuHlir7PrQMP8JucFPfTySEIFcNv1lqjcrpsu8XlfjUcwPcXt+oiJ8Sycd
 REBZVnL5axPoOXIKfaJE4Qbu+avQTg4OXOS2x1KdBgLCufI2QnYwebpsOxx7fdPZKxpT
 LuGw==
X-Gm-Message-State: AOAM533oUmhsmSLyWz2Jx+/YUYkSIsNOEbHL5ZhPeT9oTkAm5aLkX3F2
 +ipHGU8vqdGcuMX4VTfvWsY=
X-Google-Smtp-Source: ABdhPJwbsZeBCrJpIlgXGSJrKOqiQ7CzbHa36MSGND6Bj1J3HOXltsXkbGpTDH2sVn5b4QQN7SbBjQ==
X-Received: by 2002:a1c:7413:: with SMTP id p19mr189941wmc.60.1594303409857;
 Thu, 09 Jul 2020 07:03:29 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s8sm5545256wru.38.2020.07.09.07.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 07:03:29 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 03/14] drm/panfrost: don't use pfdevfreq.busy_count to know
 if hw is idle
Date: Thu,  9 Jul 2020 16:03:11 +0200
Message-Id: <20200709140322.131320-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709140322.131320-1-peron.clem@gmail.com>
References: <20200709140322.131320-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB1c2UgZGV2ZnJlcSB2YXJpYWJsZSB0aGF0IHdpbGwgYmUgbG9jayB3aXRoIHNwaW5sb2Nr
IGluIGZ1dHVyZQpwYXRjaGVzLiBXZSBzaG91bGQgZWl0aGVyIGludHJvZHVjZSBhIGZ1bmN0aW9u
IHRvIGFjY2VzcyB0aGlzIG9uZQpidXQgYXMgZGV2ZnJlcSBpcyBvcHRpb25hbCBsZXQncyBqdXN0
IHJlbW92ZSBpdC4KClJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0u
Y29tPgpSZXZpZXdlZC1ieTogQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNv
bGxhYm9yYS5jb20+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBn
bWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jIHwg
NCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3Rfam9iLmMKaW5kZXggNzkxNGIxNTcwODQxLi42M2UzMmE5ZjI3NDkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKQEAgLTU4MSwxMCArNTgxLDYg
QEAgaW50IHBhbmZyb3N0X2pvYl9pc19pZGxlKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2
KQogCXN0cnVjdCBwYW5mcm9zdF9qb2Jfc2xvdCAqanMgPSBwZmRldi0+anM7CiAJaW50IGk7CiAK
LQkvKiBDaGVjayB3aGV0aGVyIHRoZSBoYXJkd2FyZSBpcyBpZGxlICovCi0JaWYgKGF0b21pY19y
ZWFkKCZwZmRldi0+ZGV2ZnJlcS5idXN5X2NvdW50KSkKLQkJcmV0dXJuIGZhbHNlOwotCiAJZm9y
IChpID0gMDsgaSA8IE5VTV9KT0JfU0xPVFM7IGkrKykgewogCQkvKiBJZiB0aGVyZSBhcmUgYW55
IGpvYnMgaW4gdGhlIEhXIHF1ZXVlLCB3ZSdyZSBub3QgaWRsZSAqLwogCQlpZiAoYXRvbWljX3Jl
YWQoJmpzLT5xdWV1ZVtpXS5zY2hlZC5od19ycV9jb3VudCkpCi0tIAoyLjI1LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
