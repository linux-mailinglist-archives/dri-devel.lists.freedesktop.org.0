Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A25A284AC
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 19:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB636E046;
	Thu, 23 May 2019 17:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04E26E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 17:17:02 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id j1so4254025qkk.12
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 10:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCPOgKXDLNcR6sFL6yT6feeZpVf/aYG9QLic+JdxubM=;
 b=VzewyZvLAdn0x8DY3n8mK97OXU9zCS0L1MK0ee9YYpC8wTdLzQa1IVbDXCkbn7mdY4
 D9RmSh0uzfi7PSHooOome2nNTnJO6mD0HTVKLk36suw3rItrz2L7w4MGtXwHb7LKmbwX
 F2Ub5HqSntgh6S6yl3L6vVwzKyLY9QuYZTaFpoZK0jo+3A2cgrBnbNvy5ZhdlysoXueA
 Xma+E1PyczBgh46AnkoRBDJILiP/2L29YiJHbWtNtj9w/nFx05e9fd82kECFhbndbQmk
 IBxqY0Y+h2X92sF+da7G9u2MAdrDWXx/54RQ8D8p56F1ceVYdTvTes1B0IaVCYXIl080
 H5xA==
X-Gm-Message-State: APjAAAVrZX+c+XPDOHTVPRYOQBQjFjjFPfNO9+EZe+kUDzqqH75VXZok
 XbPIkZbM0j2R4bXSdWng0TNtzOFKm8g=
X-Google-Smtp-Source: APXvYqzQK71cctzLw03xT3jdNw0SD9PtL3nBDxCQtUeUy9B9Z9lczPE6z44Z2LgpEKo1y0LKyhEpiQ==
X-Received: by 2002:a37:bd42:: with SMTP id n63mr32955087qkf.262.1558631821916; 
 Thu, 23 May 2019 10:17:01 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id v25sm662660qtv.2.2019.05.23.10.17.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 10:17:01 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/msm/a6xx: Remove duplicate irq disable from remove
Date: Thu, 23 May 2019 13:16:41 -0400
Message-Id: <20190523171653.138678-2-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190523171653.138678-1-sean@poorly.run>
References: <20190523171653.138678-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCPOgKXDLNcR6sFL6yT6feeZpVf/aYG9QLic+JdxubM=;
 b=Z1BBTBNQGFwi1a6YCUrwlBkcg4d0qRPyeFFxcIpPo4kL342FYfzrTCrsCkzAKJSa8D
 kCvCZ4JJX1m+FaxkU6hE15FHkcAFiT2zElk/si/zSkchoOAdiwBxiOLRU0lML2gbFAFs
 Rg5cE0bbhO58zclxCiqYroZnyhw2gnIFuJ6HBh83XRG1VtMiuf65JIJdSxWZtfJvw94P
 Qq5yMfEY+W/7B2yQ1pB1dzV/MwFKp6QkShaRF+MFs/e2FgyMUxrZNt9lQ4K8MjDBNhVv
 +R1ZRdQv5bv4yai7m51LsnP6d0vgTkdl+odwD3o3xD/PGRz88NrIgiGzuFCZchP1VT9m
 rdAA==
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgphNnh4X2dtdV9zdG9wKCkg
YWxyZWFkeSBjYWxscyB0aGlzIGZ1bmN0aW9uIHZpYSBzaHV0ZG93biBvciBmb3JjZV9zdG9wLApz
byBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gY2FsbCBpdCB0d2ljZS4gUHJldmlvdXNseSB0aGlzIHdv
dWxkIGhhdmUKa25vY2tlZCB0aGUgaXJxIHJlZmNvdW50IG91dCBvZiBzeW5jLCBidXQgbm93IHdp
dGggdGhlIGlycXNfZW5hYmxlZCBmbGFnCml0J3MganVzdCBob3VzZWtlZXBpbmcuCgpDaGFuZ2Vz
IGluIHYyOgotIE5vbmUKCkNjOiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5v
L2E2eHhfZ211LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCmluZGV4
IGFhODRlZGIyNWQ5MS4uNzQyYzhmZjlhNjFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2FkcmVuby9hNnh4X2dtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2
eHhfZ211LmMKQEAgLTEyMzksNyArMTIzOSw2IEBAIHZvaWQgYTZ4eF9nbXVfcmVtb3ZlKHN0cnVj
dCBhNnh4X2dwdSAqYTZ4eF9ncHUpCiAJCWRldl9wbV9kb21haW5fZGV0YWNoKGdtdS0+Z3hwZCwg
ZmFsc2UpOwogCX0KIAotCWE2eHhfZ211X2lycV9kaXNhYmxlKGdtdSk7CiAJYTZ4eF9nbXVfbWVt
b3J5X2ZyZWUoZ211LCBnbXUtPmhmaSk7CiAKIAlpb21tdV9kZXRhY2hfZGV2aWNlKGdtdS0+ZG9t
YWluLCBnbXUtPmRldik7Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUg
LyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
