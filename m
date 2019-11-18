Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A44100288
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22E56E079;
	Mon, 18 Nov 2019 10:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA7D89FD4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 10:35:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id u18so16813375wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 02:35:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=no+A3/1637rhIA1GMsq/rO7D/Ci6oq2RtjwdBSV1Lwg=;
 b=eHkmnLGeWfymhtXPjgcmNVHSq9NISaCCkjx/kxtssQSto9RDDG2HBZvmhTscF5W8Yt
 rrhyufOs/AS+/W9Ct2TqoNNSN6lgft3HQEQaRw57d0rYZPMh5vHSRbfYmwtFCHMIBDaa
 OywggIjaBNgadRzC9VnR3tkALqjM9IoO1y91bZJw/WfRo/zu23iCWS3Ur8LnVAVFC1f2
 sGFuLcTSxpfnKhV9CTrkFYaGkHycVsStkiTXyNngd1SQgaLEa3Nl7WlXu53fkvyT96s4
 /1fYsAY6fnvW0pQp0Oecahm67i4fr1H4r/Xt/U7FwU2kEK/zuflaTMB981FyfRH9qj5y
 zL8A==
X-Gm-Message-State: APjAAAUtK3OdguPGja5sn9By0pd7/OWj7rEMGsSOrlBo9sdZhPKQqNHG
 7KtExqYZDf6es7t71zUkJGfEPl6/x7Y=
X-Google-Smtp-Source: APXvYqzCT4S1wvNSqDsZZPdgEBM8i4msMmQU2WXyPBLq3aBy8wQsZQPt32eTaDN2q278YjYeLlc/6w==
X-Received: by 2002:a1c:e157:: with SMTP id y84mr26686981wmg.59.1574073349843; 
 Mon, 18 Nov 2019 02:35:49 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:35:48 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/15] drm/armada: Delete dma_buf->k(un)map implemenation
Date: Mon, 18 Nov 2019 11:35:26 +0100
Message-Id: <20191118103536.17675-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=no+A3/1637rhIA1GMsq/rO7D/Ci6oq2RtjwdBSV1Lwg=;
 b=b+U/C/dDYHvkhIZ8adqVd44qv1+Vk03lh8rv2pEoL7NZj2L2CDPOyx+o0fROv4Vih0
 Je+AmnTqAhB16SHI+aSLRJ1uZ2+Qx+C77DEQBTRfgMhReSqOHETghlwBOtpGjzAfltUl
 UDIBb4Zp7UBCfL+wV7y5WGQE/TMQVthW1cJkI=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBhIGR1bW15IGFueXdheS4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcu
dWs+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZ2VtLmMgfCAxMiAtLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEv
YXJtYWRhX2dlbS5jCmluZGV4IDkzY2Y4YjhiZmNmZi4uOTc2Njg1ZjI5MzllIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtYWRhL2FybWFkYV9nZW0uYwpAQCAtNDYxLDE2ICs0NjEsNiBAQCBzdGF0aWMgdm9pZCBh
cm1hZGFfZ2VtX3ByaW1lX3VubWFwX2RtYV9idWYoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAq
YXR0YWNoLAogCWtmcmVlKHNndCk7CiB9CiAKLXN0YXRpYyB2b2lkICphcm1hZGFfZ2VtX2RtYWJ1
Zl9ub19rbWFwKHN0cnVjdCBkbWFfYnVmICpidWYsIHVuc2lnbmVkIGxvbmcgbikKLXsKLQlyZXR1
cm4gTlVMTDsKLX0KLQotc3RhdGljIHZvaWQKLWFybWFkYV9nZW1fZG1hYnVmX25vX2t1bm1hcChz
dHJ1Y3QgZG1hX2J1ZiAqYnVmLCB1bnNpZ25lZCBsb25nIG4sIHZvaWQgKmFkZHIpCi17Ci19Ci0K
IHN0YXRpYyBpbnQKIGFybWFkYV9nZW1fZG1hYnVmX21tYXAoc3RydWN0IGRtYV9idWYgKmJ1Ziwg
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7CkBAIC00ODEsOCArNDcxLDYgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkbWFfYnVmX29wcyBhcm1hZGFfZ2VtX3ByaW1lX2RtYWJ1Zl9vcHMgPSB7
CiAJLm1hcF9kbWFfYnVmCT0gYXJtYWRhX2dlbV9wcmltZV9tYXBfZG1hX2J1ZiwKIAkudW5tYXBf
ZG1hX2J1Zgk9IGFybWFkYV9nZW1fcHJpbWVfdW5tYXBfZG1hX2J1ZiwKIAkucmVsZWFzZQk9IGRy
bV9nZW1fZG1hYnVmX3JlbGVhc2UsCi0JLm1hcAkJPSBhcm1hZGFfZ2VtX2RtYWJ1Zl9ub19rbWFw
LAotCS51bm1hcAkJPSBhcm1hZGFfZ2VtX2RtYWJ1Zl9ub19rdW5tYXAsCiAJLm1tYXAJCT0gYXJt
YWRhX2dlbV9kbWFidWZfbW1hcCwKIH07CiAKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
