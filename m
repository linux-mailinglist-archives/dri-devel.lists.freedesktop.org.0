Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE32F115E8F
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 21:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F116E235;
	Sat,  7 Dec 2019 20:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB2E6E235
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 20:36:17 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y14so5131398pfm.13
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 12:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVm3fTMGs3Ke7LE9pcHFJZXCh+yS4/KCWiEc/FuKj34=;
 b=VNo8TS1mGGYL+miUl5rN/IxKrIg5hWNyFj9vFG6SFSRc80sw8bQsVFNA1IoYPZMgdA
 kcq8sehBzL7vgBfnyshZS+pF/ZH/DX+GyKs6nsEALN0QL85k6rQLP8l13a4u9u00h+rC
 VykG8KmBPkdO2QPjvs8ETF7XEMTED5SMIvkzyLxqK52xamD6JVMjtKs8ffZFmCKimeqa
 DXYunrhxxiWtu9ij9ZxVXF0T4pnEg8tmny8M69UqYqEFqYRTavlF2EKTa239iZwoE1Cp
 4ppmfnMHof0N06517diou91uX50zMqAOTA0B4/LpFwPRxq1WsqmW6Qh72FPL3XkQ2yN6
 l8GA==
X-Gm-Message-State: APjAAAXRtTi3pMIHWWfkyu6wt01WCLnyabPNiEXup8vk8SHjSntxQCz2
 eLWGJnkqmd3dM0w+799zc8j82uZh
X-Google-Smtp-Source: APXvYqyXkQWGRk0eUOkq9bFetsRJZzyqR9S1EFwc18YoOwHz+LAS2LVd0p0QBem+UVSKxeVb7hixvw==
X-Received: by 2002:a62:5202:: with SMTP id g2mr21373195pfb.43.1575750976236; 
 Sat, 07 Dec 2019 12:36:16 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j3sm20479085pfi.8.2019.12.07.12.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 12:36:15 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 aarch64-laptops@lists.linaro.org
Subject: [PATCH 3/4] drm/bridge: ti-sn65dsi86: find any enabled endpoint
Date: Sat,  7 Dec 2019 12:35:52 -0800
Message-Id: <20191207203553.286017-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191207203553.286017-1-robdclark@gmail.com>
References: <20191207203553.286017-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cVm3fTMGs3Ke7LE9pcHFJZXCh+yS4/KCWiEc/FuKj34=;
 b=OEECddpvOrRkOHKphVcLzjAo5l1LyjDSbYArI7pl794LpAjUmWUCJD5PxVBb/q7Rlw
 Iky1w3tt3+AQH2X/oeWERBrmkT0PiAk1+PuEwMswhVguy0+wReG2xEJ9hqJKMQwMb52r
 tzIfsIeV68azc1QXvzZWhGLG2pv8aD4jX6D5Y84xIfKPNiSkmMgF/VfD53hai+qNQpaj
 9fCpljuMnNZl+sQFx2myqDUk1/fe0GwoM1JlzQBgxLuap2GENkT2BHBDb7KKmGLFmv20
 8xXjGq86IFO8cp2RVkUWlPX/bFS/F7QQJPpP8OBXgOuWGUrEiGe7Rq1lUmNHZqjXr++U
 a+DA==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jeffrey Hugo <jhugo@codeaurora.org>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhpcyBicmlkZ2UgaXMg
dXNlZCBvbiBhIG51bWJlciBvZiBkZXZpY2VzIHRoYXQgY2FuIGhhdmUgb25lIG9mIG11bHRpcGxl
CmRpZmZlcmVudCBwYW5lbHMgaW5zdGFsbGVkLiAgVGhlIGZpcm13YXJlIHdpbGwgZW5hYmxlIHRo
ZSBwYW5lbCBkcml2ZXIKbm9kZSBmb3IgdGhlIHBhbmVsIHRoYXQgaXMgYWN0dWFsbHkgaW5zdGFs
bGVkLiAgU28gdGhlIGJyaWRnZSBzaG91bGQgYXNrCmRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRn
ZSgpIHRvIGZpbmQgdGhlIGVuZHBvaW50IGZvciB0aGUgZW5hYmxlZApwYW5lbC4KClNpZ25lZC1v
ZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS1zbjY1ZHNpODYuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2
LmMKaW5kZXggNDNhYmYwMWViZDRjLi42MmJjOThkOWQxNTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90aS1zbjY1ZHNpODYuYwpAQCAtNzIwLDcgKzcyMCw3IEBAIHN0YXRpYyBpbnQgdGlfc25fYnJp
ZGdlX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAKIAlwZGF0YS0+ZGV2ID0gJmNs
aWVudC0+ZGV2OwogCi0JcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKHBkYXRhLT5k
ZXYtPm9mX25vZGUsIDEsIDAsCisJcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKHBk
YXRhLT5kZXYtPm9mX25vZGUsIDEsIC0xLAogCQkJCQkgICZwZGF0YS0+cGFuZWwsIE5VTEwpOwog
CWlmIChyZXQpIHsKIAkJRFJNX0VSUk9SKCJjb3VsZCBub3QgZmluZCBhbnkgcGFuZWwgbm9kZVxu
Iik7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
