Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80D33F2F7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 15:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6C66E5A3;
	Wed, 17 Mar 2021 14:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289056E59D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 14:39:42 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so3353542pjq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KwHaB2Vk2IogMgE0yx2ZDvsbIco4uAI0/LKAdZRr7m8=;
 b=c+iKxoVYQ47ih++ylt0hyDgkOBIz9FmY/S3KjzssjWSOxjE7hxBwHRoPZRD1po9ns+
 n1ujLuGiq0vztU4jkVkQaqqT+Fce7X8Q8u65RSh8pzH9qdtunULcjnqJ4e8iNgfidR2h
 4tcGlrSV+3Ixw7/hGV+eRVPZa/hJzdMbRB1Zjy6wI5zK/fua4O18EC8oVcTKtR2ju+4U
 YzV+s7qaaR33bB+2cPpQA1icVT8iMBhJUtZqg+1sT/PQfJfqJkb+tjJPsW9fNoK6P78f
 sVHpJCu7FJwm3fljiGpidY3eG7JdPluZEUk5QsWhJVFWMW6/HbPE+PB73ZOTGKS5SbnQ
 kiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KwHaB2Vk2IogMgE0yx2ZDvsbIco4uAI0/LKAdZRr7m8=;
 b=i/IOfpUKFiN+rWFR6VMn8lIwZGrHvBgr8S4DsGoVpKTDU5D5k9aFjbZ5JcWEA9T3tK
 c93FdWdSfVDfw+jwfVvKqWGiTuRPgBfu8MR3M6IF1rN30NuHB3gSP1dOE9h3dMO7othG
 VpkwlK/mNoxjlx/2HGgeKW1LwWqldcmMJfPK0KLU81ZvVZz8UMi9F1kZLvAwf2fzfY2/
 gjP2SDd1vXUasqlG50Nrd0SRL1JYO/ZbhWgK4ea7nrJ709M7Y9/7o365twfRpk9cUbxX
 VcgdfUEH1U0XCzfa+ftvEG3hBR6kXDppdcLZ2F2eEimLHMjBCSvXABQvtZ/WQvpC7H0k
 zDJg==
X-Gm-Message-State: AOAM531KRDtYL1vSrSP7/vhcH+yQ/xmG2o10Lvu8eZj8M9S7jY8yadlV
 3pCVzJnEyRUtA6j/VDWPvN0wKasoVjmubw==
X-Google-Smtp-Source: ABdhPJwJu6h/B9LrVeoFsCG+tYza638TDFeLT2HNTca1uTegCsdDlUZpx60ItIDcigmGWnxPmN6v+g==
X-Received: by 2002:a17:90a:6be4:: with SMTP id
 w91mr5363460pjj.68.1615991981215; 
 Wed, 17 Mar 2021 07:39:41 -0700 (PDT)
Received: from omlet.lan (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id i17sm21779296pfq.135.2021.03.17.07.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:39:40 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: Drop relocation support on all new hardware (v6)
Date: Wed, 17 Mar 2021 09:39:35 -0500
Message-Id: <20210317143935.2094831-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315143428.1471489-3-jason@jlekstrand.net>
References: <20210315143428.1471489-3-jason@jlekstrand.net>
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFZ1bGthbiBkcml2ZXIgaW4gTWVzYSBmb3IgSW50ZWwgaGFyZHdhcmUgbmV2ZXIgdXNlcyBy
ZWxvY2F0aW9ucyBpZgppdCdzIHJ1bm5pbmcgb24gYSB2ZXJzaW9uIG9mIGk5MTUgdGhhdCBzdXBw
b3J0cyBhdCBsZWFzdCBzb2Z0cGluIHdoaWNoCmFsbCB2ZXJzaW9ucyBvZiBpOTE1IHN1cHBvcnRp
bmcgR2VuMTIgZG8uICBPbiB0aGUgT3BlbkdMIHNpZGUsIEdlbjEyKyBpcwpvbmx5IHN1cHBvcnRl
ZCBieSBpcmlzIHdoaWNoIG5ldmVyIHVzZXMgcmVsb2NhdGlvbnMuICBUaGUgb2xkZXIgaTk2NQpk
cml2ZXIgaW4gTWVzYSBkb2VzIHVzZSByZWxvY2F0aW9ucyBidXQgaXQgb25seSBzdXBwb3J0cyBJ
bnRlbCBoYXJkd2FyZQp0aHJvdWdoIEdlbjExIGFuZCBoYXMgYmVlbiBkZXByZWNhdGVkIGZvciBh
bGwgaGFyZHdhcmUgR2VuOSsuICBUaGUKY29tcHV0ZSBkcml2ZXIgYWxzbyBuZXZlciB1c2VzIHJl
bG9jYXRpb25zLiAgVGhpcyBvbmx5IGxlYXZlcyB0aGUgbWVkaWEKZHJpdmVyIHdoaWNoIGlzIHN1
cHBvc2VkIHRvIGJlIHN3aXRjaGluZyB0byBzb2Z0cGluIGdvaW5nIGZvcndhcmQuCk1ha2luZyBz
b2Z0cGluIGEgcmVxdWlyZW1lbnQgZm9yIGFsbCBmdXR1cmUgaGFyZHdhcmUgc2VlbXMgcmVhc29u
YWJsZS4KClRoZXJlIGlzIG9uZSBwaWVjZSBvZiBoYXJkd2FyZSBlbmFibGVkIGJ5IGRlZmF1bHQg
aW4gaTkxNTogUktMIHdoaWNoIHdhcwplbmFibGVkIGJ5IGUyMmZhNmYwYTk3NiB3aGljaCBoYXMg
bm90IHlldCBsYW5kZWQgaW4gZHJtLW5leHQgc28gdGhpcwphbG1vc3QgYnV0IG5vdCByZWFsbHkg
YSB1c2Vyc3BhY2UgQVBJIGNoYW5nZSBmb3IgUktMLiAgSWYgaXQgYmVjb21lcyBhCnByb2JsZW0s
IHdlIGNhbiBhbHdheXMgYWRkICFJU19ST0NLRVRMQUtFKGViLT5pOTE1KSB0byB0aGUgY29uZGl0
aW9uLgoKUmVqZWN0aW5nIHJlbG9jYXRpb25zIHN0YXJ0aW5nIHdpdGggbmV3ZXIgR2VuMTIgcGxh
dGZvcm1zIGhhcyB0aGUKYmVuZWZpdCB0aGF0IHdlIGRvbid0IGhhdmUgdG8gYm90aGVyIHN1cHBv
cnRpbmcgaXQgb24gcGxhdGZvcm1zIHdpdGgKbG9jYWwgbWVtb3J5LiAgR2l2ZW4gaG93IG11Y2gg
Q1BVIHRvdWNoaW5nIG9mIG1lbW9yeSBpcyByZXF1aXJlZCBmb3IKcmVsb2NhdGlvbnMsIG5vdCBo
YXZpbmcgdG8gZG8gc28gb24gcGxhdGZvcm1zIHdoZXJlIG5vdCBhbGwgbWVtb3J5IGlzCmRpcmVj
dGx5IENQVS1hY2Nlc3NpYmxlIGNhcnJpZXMgc2lnbmlmaWNhbnQgYWR2YW50YWdlcy4KCnYyIChK
YXNvbiBFa3N0cmFuZCk6CiAtIEFsbG93IFRHTC1MUCBwbGF0Zm9ybXMgYXMgdGhleSd2ZSBhbHJl
YWR5IHNoaXBwZWQKCnYzIChKYXNvbiBFa3N0cmFuZCk6CiAtIFdBUk5fT04gcGxhdGZvcm1zIHdp
dGggTE1FTSBzdXBwb3J0IGluIGNhc2UgdGhlIGNoZWNrIGlzIHdyb25nCgp2NCAoSmFzb24gRWtz
dHJhbmQpOgogLSBDYWxsIG91dCBSb2NrZXQgTGFrZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UKCnY1
IChKYXNvbiBFa3N0cmFuZCk6CiAtIERyb3AgdGhlIEhBU19MTUVNIGNoZWNrIGFzIGl0J3MgYWxy
ZWFkeSBjb3ZlcmVkIGJ5IHRoZSB2ZXJzaW9uIGNoZWNrCgp2NiAoSmFzb24gRWtzdHJhbmQpOgog
LSBNb3ZlIHRoZSBjaGVjayB0byBlYl92YWxpZGF0ZV92bWEoKSB3aXRoIGFsbCB0aGUgb3RoZXIg
ZXhlY19vYmplY3QKICAgdmFsaWRhdGlvbiBjaGVja3MuCgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBF
a3N0cmFuZCA8amFzb25Aamxla3N0cmFuZC5uZXQ+ClJldmlld2VkLWJ5OiBaYmlnbmlldyBLZW1w
Y3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYyB8IDcgKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jCmluZGV4IDk5NzcyZjM3YmZmNjAuLmMwODJm
YjBiZWYzMzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9l
eGVjYnVmZmVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNi
dWZmZXIuYwpAQCAtNDgzLDYgKzQ4MywxMyBAQCBlYl92YWxpZGF0ZV92bWEoc3RydWN0IGk5MTVf
ZXhlY2J1ZmZlciAqZWIsCiAJCXN0cnVjdCBkcm1faTkxNV9nZW1fZXhlY19vYmplY3QyICplbnRy
eSwKIAkJc3RydWN0IGk5MTVfdm1hICp2bWEpCiB7CisJLyogUmVsb2NhdGlvbnMgYXJlIGRpc2Fs
bG93ZWQgZm9yIGFsbCBwbGF0Zm9ybXMgYWZ0ZXIgVEdMLUxQLiAgVGhpcworCSAqIGFsc28gY292
ZXJzIGFsbCBwbGF0Zm9ybXMgd2l0aCBsb2NhbCBtZW1vcnkuCisJICovCisJaWYgKGVudHJ5LT5y
ZWxvY2F0aW9uX2NvdW50ICYmCisJICAgIElOVEVMX0dFTihlYi0+aTkxNSkgPj0gMTIgJiYgIUlT
X1RJR0VSTEFLRShlYi0+aTkxNSkpCisJCXJldHVybiAtRUlOVkFMOworCiAJaWYgKHVubGlrZWx5
KGVudHJ5LT5mbGFncyAmIGViLT5pbnZhbGlkX2ZsYWdzKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAK
LS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
