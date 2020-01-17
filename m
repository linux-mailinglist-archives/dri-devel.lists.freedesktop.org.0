Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5351411B7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901BD6F8DB;
	Fri, 17 Jan 2020 19:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EAE6F8D7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:31:09 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id v126so14828981ywc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 11:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vw0YZIzYilg4if3Ue4FJsV410z1mun8IqIxc6oGE2sI=;
 b=YknXv6CmaGJlLUkmJKe5oTsWYP5Id1i6aH7rpUWrV84LPkyuAfPKQiBFtNXGonUgzP
 NWDEdpFo1aBlBwrLIhwOAU7HBD7TwlQS86/ose80wQcGLBK7tjmzjRtnOKUIwZ3ebuwU
 coIxHDzV9MkrzdppMc1Uq1QTfO/3kNeOl14r9cKxrUbNRzTSM+69aMnaNo5kkJU9HUnO
 NP/+dsm7Pw3m94FubNMnuvWcLYleRgFB5awSmbp2S572iNiK83+eQjnxsrN7t0Y6mtjY
 7L/+YMsbJKbLZmzSo80GuNu2B3+HgWDa1zwHcwpvfUU7Jr7a7lYapwyXyxKF0eewT3pL
 C48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vw0YZIzYilg4if3Ue4FJsV410z1mun8IqIxc6oGE2sI=;
 b=Pz7/n6ny6rvvSaP5494HE6r1B8Q2VdupfQSFQElWh1VI24tO/WxEm4ZXCRT7ic8U8q
 rtJXs0ZIZwR4gHB+4Nv0zV6n+R7Yi4qcx5OQdbgiGDdLodUUHpDjm57tpL6fOJ+lOdb5
 dEoZYzY1FO93lKF3ImqYQ+SKTJ24v9xTos/AzGSW/RlmbcLj+f1m16k6MraIRzbFTCbd
 vcCWlk552ZMdtl6xu5ySKJ0hXNDF1Ims9yHhVLqVuanwYwuRA2Z4HUIN7LwnvbaLq2sH
 +Z7jnNjkemwfsVIcVPw1HTtXMZDVHaTXsEMYO6OaLCvSRUHiJMDLcvUopgdBp098BFrf
 2LLA==
X-Gm-Message-State: APjAAAVxG0fqZ2TeaMtWSYBdH3SaNekZd+QmFv0+/XeiVOJwIPCHpMDt
 mjucDlBJf1XF55zhhwzRbS2/oyiTrAmtNg==
X-Google-Smtp-Source: APXvYqxUFFMmX7Sk67neg7EQaixXOc9A/7Ol/EjOgbpqQiC3UynFaBufPQN+Ojysm8p3m41C5MXX7Q==
X-Received: by 2002:a81:1d09:: with SMTP id d9mr31029497ywd.146.1579289469007; 
 Fri, 17 Jan 2020 11:31:09 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id s3sm11710343ywf.22.2020.01.17.11.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 11:31:08 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 03/12] drm/i915: WARN if HDCP signalling is enabled upon
 disable
Date: Fri, 17 Jan 2020 14:30:54 -0500
Message-Id: <20200117193103.156821-4-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200117193103.156821-1-sean@poorly.run>
References: <20200117193103.156821-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, rodrigo.vivi@intel.com,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpIRENQIHNpZ25hbGxpbmcg
c2hvdWxkIG5vdCBiZSBsZWZ0IG9uLCBXQVJOIGlmIGl0IGlzCgpDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+ClJldmlld2VkLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0u
Y0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0u
b3JnPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQv
MjAxOTEyMTIxOTAyMzAuMTg4NTA1LTQtc2VhbkBwb29ybHkucnVuICN2MgoKQ2hhbmdlcyBpbiB2
MjoKLSBBZGRlZCB0byB0aGUgc2V0IGluIGxpZXUgb2YganVzdCBjbGVhcmluZyB0aGUgYml0CkNo
YW5nZXMgaW4gdjM6Ci0gTm9uZQotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGRpLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKaW5kZXggMzJlYTNjN2U4YjYyLi44N2I4
YjM0N2Y2ODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGRpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwpAQCAt
MTk5OCw2ICsxOTk4LDggQEAgdm9pZCBpbnRlbF9kZGlfZGlzYWJsZV90cmFuc2NvZGVyX2Z1bmMo
Y29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUKIAl2YWwgPSBJOTE1X1JF
QUQoVFJBTlNfRERJX0ZVTkNfQ1RMKGNwdV90cmFuc2NvZGVyKSk7CiAJdmFsICY9IH5UUkFOU19E
RElfRlVOQ19FTkFCTEU7CiAKKwlXQVJOX09OKHZhbCAmIFRSQU5TX0RESV9IRENQX1NJR05BTExJ
TkcpOworCiAJaWYgKElOVEVMX0dFTihkZXZfcHJpdikgPj0gMTIpIHsKIAkJaWYgKCFpbnRlbF9k
cF9tc3RfaXNfbWFzdGVyX3RyYW5zKGNydGNfc3RhdGUpKQogCQkJdmFsICY9IH5UR0xfVFJBTlNf
RERJX1BPUlRfTUFTSzsKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAv
IENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
