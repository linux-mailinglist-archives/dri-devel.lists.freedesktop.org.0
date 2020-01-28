Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D914F14BD79
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 17:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF596EEA1;
	Tue, 28 Jan 2020 16:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336506EEA1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 16:09:59 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t23so3155948wmi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 08:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyjEpj4q9W+PsAYqjdC8Nb/iSu+yWDGmjZlqJ+4WTrc=;
 b=gVQuMEV5jYZ1PGX0Rj/xvFOZ3TnSNtcpPgJqCcKpQYAMPbf+HoVgv23ZAEOh/yJWx5
 Pb3S8a9D440jELNhheJLtlCi10g+lfV6gN4N92vsSArn8WnqJ/+Ddvlq0PK8NA4NRNDE
 zhHlkregqZKt1/5bjvGwwmAujgU+awqKYGUec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyjEpj4q9W+PsAYqjdC8Nb/iSu+yWDGmjZlqJ+4WTrc=;
 b=hwbQKXhskXjb0r0jwKMQngyAQKOnlMvopnqndJTAVsXPGxOMnHD8OM4PHDII0nUEhu
 vaL7lhdB80cYU0RtDBFhYrym//XxjydVEvMVy9cgkYVNXoIA9g62zKpstGyxtkOAflmu
 u/ZANIALX+QXQHo3nViQO9GX9K4Z3zMHk6NdNEHQ2lHu5ECkEs/DiHEsinTVYC8RpPkZ
 2pTzsVgC8qc8/IxVr29qsmXBkLBjLwe8LFlYPSj5u0l8Cy+kdgxdDtZn5A1h2/Oinyut
 FXkMs6MWONBu5P6tfx1amDnId+UdJ7B8cSSxIbkEpq481rfuA0DqHo879cDIvHYW6WC6
 yugA==
X-Gm-Message-State: APjAAAU1nwhmnZwssBibqbgKMqM7Z4OFFFRuf6NNdQCKa5IzZ1vDvBS8
 kzq9kmzsN2971FmfFLmLHkfccByyAPBGsQ==
X-Google-Smtp-Source: APXvYqxrNOZppv2i1y9+6oi7zG1bX+h4Kom+KwBhawXyo7AvjdNB9Ym9pDeW+pd4X/pt0ApwbQxSDA==
X-Received: by 2002:a1c:f001:: with SMTP id a1mr5676258wmb.76.1580227798417;
 Tue, 28 Jan 2020 08:09:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 21sm3600738wmo.8.2020.01.28.08.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 08:09:57 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] radeon: insert 10ms sleep in dce5_crtc_load_lut
Date: Tue, 28 Jan 2020 17:09:52 +0100
Message-Id: <20200128160952.1628146-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGVyIGF0IGxlYXN0IG9uZSB0ZXN0ZXIgdGhpcyBpcyBlbm91Z2ggbWFnaWMgdG8gcmVjb3ZlciB0
aGUgcmVncmVzc2lvbgppbnRyb2R1Y2VkIGZvciBzb21lIHBlb3BsZSAoYnV0IG5vdCBhbGwpIGlu
Cgpjb21taXQgYjhlMmIwMTk5Y2MzNzc2MTdkYzIzOGY1MTA2MzUyYzA2ZGNkM2ZhMgpBdXRob3I6
IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+CkRhdGU6ICAgVHVlIEp1bCA0IDEyOjM2OjU3
IDIwMTcgKzAyMDAKCiAgICBkcm0vZmItaGVscGVyOiBmYWN0b3Igb3V0IHBzZXVkby1wYWxldHRl
Cgp3aGljaCBmb3IgcmFkZW9uIGhhZCB0aGUgc2lkZS1lZmZlY3Qgb2YgcmVmYWN0b3Jpbmcgb3V0
IGEgc2VlbWluZ2x5CnJlZHVkYW50IHdyaXRpbmcgb2YgdGhlIGNvbG9yIHBhbGV0dGUuCgoxMG1z
IGluIGEgZmFpcmx5IHNsb3cgbW9kZXNldCBwYXRoIGZlZWxzIGxpa2UgYW4gYWNjZXB0YWJsZSBm
b3JtIG9mCmR1Y3QtdGFwZSwgc28gbWF5YmUgd29ydGggYSBzaG90IGFuZCBzZWUgd2hhdCBzdGlj
a3MuCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogTWlj
aGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+ClJlZmVyZW5jZXM6IGh0dHBzOi8v
YnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTk4MTIzClNpZ25lZC1vZmYtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9k
aXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMKaW5kZXgg
MzU0NzU2ZTAwZmUxLi5kMDdjN2RiMGM4MTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9kaXNwbGF5LmMKQEAgLTEyNyw2ICsxMjcsOCBAQCBzdGF0aWMgdm9pZCBkY2U1X2NydGNfbG9h
ZF9sdXQoc3RydWN0IGRybV9jcnRjICpjcnRjKQogCiAJRFJNX0RFQlVHX0tNUygiJWRcbiIsIHJh
ZGVvbl9jcnRjLT5jcnRjX2lkKTsKIAorCW1zbGVlcCgxMCk7CisKIAlXUkVHMzIoTklfSU5QVVRf
Q1NDX0NPTlRST0wgKyByYWRlb25fY3J0Yy0+Y3J0Y19vZmZzZXQsCiAJICAgICAgIChOSV9JTlBV
VF9DU0NfR1JQSF9NT0RFKE5JX0lOUFVUX0NTQ19CWVBBU1MpIHwKIAkJTklfSU5QVVRfQ1NDX09W
TF9NT0RFKE5JX0lOUFVUX0NTQ19CWVBBU1MpKSk7Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
