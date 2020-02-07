Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0737155ED6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 20:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DCB6FD76;
	Fri,  7 Feb 2020 19:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28F16FD75;
 Fri,  7 Feb 2020 19:51:12 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w15so276212qkf.6;
 Fri, 07 Feb 2020 11:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RTgGxHJYBOc/AOgPlCZnYLG4WwQuIWgZuky2QefgHXM=;
 b=fIgBncpd/OPPojmADp1OV754fLf7jJ0s1QanZbRmAuu/0VvFTvanKG5qb2ceIkfYZU
 FIMudKzzqe0Kz+U8BTId8uk+5jUUS7ifM2rsIIWjGpxMdLg+8uucgDc6SgOyt46q1O7a
 q5bnfUyxcm6DDbIzhif/YtN1sk1XRcBoGZkvYb2Wl9FeTmHbBaJff0QKOQWPGIsaavmc
 v/hcGeaqPV/M5ZRoZuNlASZlevoo+ZXe4XKaxOL9I23BxEW5Pt28SJoaUH/q+hFmEYAC
 s0jWEUBh6v1n020pscoAYjK6zxyghILV4GREFBERgj4EWbcyHVvRZyboof//mM1erCZT
 VeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RTgGxHJYBOc/AOgPlCZnYLG4WwQuIWgZuky2QefgHXM=;
 b=kc1bKR8a5jdPClVgAXUhd9D8n9pXcL+D4c/WO2OPFPxbrma8Hb2Q9e/bpGFNTfkVwN
 f7qbjuHEzyi47UwVZDre3F0gldO1VPAuACOUoYDrbwOaU1E8emRVvAX6N7z0nhn3ZbWu
 fsbYM1xRHtYWUqftWtv0PHDwsxvUTKUdlpl5APJnyIXOhDUNPqHhIc2v1Z1EWJhBp7m/
 l9dX8sJtEGg/+G7GPknm6+VhPnkUzo0cxXMwL/wu0PMKNk8N4nqalU3s2QkfySYk3aBO
 FNu/Z8wnD6sE3wVBrsB/uY0eUN++TrXoAqHUhVSETpAhSeQicqjiNSYesq5yDgQVdSAx
 M00A==
X-Gm-Message-State: APjAAAV1+Bj5CQlyEEl1IohkvfJSuFC7opC6y7rcJcbG25qeqKx3BxAR
 FEDIAoCEG0q5bM9rAbIHTTT4e7nr
X-Google-Smtp-Source: APXvYqxVcMCN91YjzTL599Ra8FC+0E/iX7x6BghuNsshK2pDul9koX12PWb11wAsavWyq/1zHoiFKg==
X-Received: by 2002:ae9:f302:: with SMTP id p2mr530563qkg.382.1581105071662;
 Fri, 07 Feb 2020 11:51:11 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id w16sm1752226qkj.135.2020.02.07.11.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 11:51:11 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/15] drm/amdgpu/gem: move debugfs init into core amdgpu
 debugfs
Date: Fri,  7 Feb 2020 14:50:49 -0500
Message-Id: <20200207195058.2354-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207195058.2354-1-alexander.deucher@amd.com>
References: <20200207195058.2354-1-alexander.deucher@amd.com>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgdG8gcmVtb3ZlIHRoZSBsb2FkIGFuZCB1bmxvYWQgZHJtIGNhbGxiYWNrcywKd2Ug
bmVlZCB0byByZW9yZGVyIHRoZSBpbml0IHNlcXVlbmNlIHRvIG1vdmUgYWxsIHRoZSBkcm0KZGVi
dWdmcyBmaWxlIGhhbmRsaW5nLiAgRG8gdGhpcyBmb3IgZ2VtLgoKQWNrZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgfCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAgfCA0IC0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGVidWdmcy5jCmluZGV4IGJjZDEwZGFhNmUzOS4uY2I3ZGI3ZWRmYzNmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKQEAgLTEyNDgsNiArMTI0
OCwxMCBAQCBpbnQgYW1kZ3B1X2RlYnVnZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIAlpZiAoYW1kZ3B1X2RlYnVnZnNfZmVuY2VfaW5pdChhZGV2KSkKIAkJZGV2X2VycihhZGV2
LT5kZXYsICJmZW5jZSBkZWJ1Z2ZzIGZpbGUgY3JlYXRpb24gZmFpbGVkXG4iKTsKIAorCXIgPSBh
bWRncHVfZGVidWdmc19nZW1faW5pdChhZGV2KTsKKwlpZiAocikKKwkJRFJNX0VSUk9SKCJyZWdp
c3RlcmluZyBnZW0gZGVidWdmcyBmYWlsZWQgKCVkKS5cbiIsIHIpOworCiAJcmV0dXJuIGFtZGdw
dV9kZWJ1Z2ZzX2FkZF9maWxlcyhhZGV2LCBhbWRncHVfZGVidWdmc19saXN0LAogCQkJCQlBUlJB
WV9TSVpFKGFtZGdwdV9kZWJ1Z2ZzX2xpc3QpKTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCA0Y2YxYzJkMjYxY2EuLmM3ODdhZWJjMjQwYiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMzEyMywxMCAr
MzEyMyw2IEBAIGludCBhbWRncHVfZGV2aWNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCiAJfSBlbHNlCiAJCWFkZXYtPnVjb2RlX3N5c2ZzX2VuID0gdHJ1ZTsKIAotCXIgPSBhbWRn
cHVfZGVidWdmc19nZW1faW5pdChhZGV2KTsKLQlpZiAocikKLQkJRFJNX0VSUk9SKCJyZWdpc3Rl
cmluZyBnZW0gZGVidWdmcyBmYWlsZWQgKCVkKS5cbiIsIHIpOwotCiAJciA9IGFtZGdwdV9kZWJ1
Z2ZzX3JlZ3NfaW5pdChhZGV2KTsKIAlpZiAocikKIAkJRFJNX0VSUk9SKCJyZWdpc3RlcmluZyBy
ZWdpc3RlciBkZWJ1Z2ZzIGZhaWxlZCAoJWQpLlxuIiwgcik7Ci0tIAoyLjI0LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
