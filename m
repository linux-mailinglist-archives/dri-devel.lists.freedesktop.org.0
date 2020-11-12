Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDA42B0D37
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFCC6E3B7;
	Thu, 12 Nov 2020 19:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AB36E3B7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a3so6420818wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wySX8cNvv9NUCsmEXsR0JBc7XJM0MHUH49ItqBshbVE=;
 b=TYYnc+JTtX+7g5eq1yvtLhuta3frJKaGjJnmhpp9ssLYcLhSlYVMBIOWVkhID5dXhy
 s0fOBHL3PKNm6fWy6QXiAIvJgwepaT9f6/pLhP1CntWD8Qpb1yak3htNpVOHksCcu2C9
 t4Qtnlq8kSQMdGxnccItE49u5fTKpnXDivlcqvMyqj8OHuw5Y3paAtOYRb36Kmbrev9o
 Ys/VjaGC/LobEWcR+ODlkmq67ao4FjFVmrEWhiWfRf5fIaJWwSc7GZLiSkb+Bf+hM1lp
 1T2eUHPmvgHaMIcY1zz6E/B0c96U35SHIq7MT4ptq4uwr0uYFsiChoj6PBePbph19uqo
 uASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wySX8cNvv9NUCsmEXsR0JBc7XJM0MHUH49ItqBshbVE=;
 b=eDmGdDKgA1ZbNV2YavpnpGPKcfGggaSH5M37uWQpFjsepyK7TkhOotHVKgVF836Rh2
 PTwsFemgYhStN62s00HL1NPt3fmK4KAmzL7YFZKzUCqfpzRonEvb/gSEQ/RvEi+eAC7H
 KQPswa9W9JlHw8Y4y3XQ2HzzwcmWGtFiWEhyNUstvYu65izPuJJM6P4+DvAX6IFKZZO6
 9w9eEw3iS1O7MfLWycBoGHP5hV72+hx3YnARM5WQQkW9xTWYsQeyGSgGquCY9Otx0Lcr
 FQstfcGb5s5PmPomLzY2+vdeLzidyOmEwZoZS8TAqt9hBaAFwi+Rr70WT4xKun6n+tg7
 NYcA==
X-Gm-Message-State: AOAM533yv9ht/ihhmIzEBL3qrtV9dUJ//mq7WPxGxbbnnhIhC1kF+ZeF
 LVtRDr/baM/JNZKXyILgQKH2Zw==
X-Google-Smtp-Source: ABdhPJxxev4s6ztnVeA+0oHxTPfVxqcUuFCI3sPqtBHdpGw4gIT6p7WtbJE0l4F6u2036vpndLL48Q==
X-Received: by 2002:a05:600c:4147:: with SMTP id
 h7mr1060841wmm.186.1605207696742; 
 Thu, 12 Nov 2020 11:01:36 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 20/30] drm/armada/armada_overlay: Staticify local function
 'armada_overlay_duplicate_state'
Date: Thu, 12 Nov 2020 19:00:29 +0000
Message-Id: <20201112190039.2785914-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfb3ZlcmxheS5jOjMyOToxOiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmGFybWFkYV9vdmVybGF5X2R1cGxpY2F0ZV9zdGF0ZeKAmSBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5v
cmcudWs+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
ClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfb3ZlcmxheS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybWFkYS9hcm1hZGFfb3ZlcmxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9h
cm1hZGFfb3ZlcmxheS5jCmluZGV4IDMwZTAxMTAxZjU5ZWQuLjYzNDZiODkwMjc5YTAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX292ZXJsYXkuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9vdmVybGF5LmMKQEAgLTMyNSw3ICszMjUsNyBAQCBz
dGF0aWMgdm9pZCBhcm1hZGFfb3ZlcmxheV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkK
IAl9CiB9CiAKLXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKgorc3RhdGljIHN0cnVjdCBkcm1fcGxh
bmVfc3RhdGUgKgogYXJtYWRhX292ZXJsYXlfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lKQogewogCXN0cnVjdCBhcm1hZGFfb3ZlcmxheV9zdGF0ZSAqc3RhdGU7Ci0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
