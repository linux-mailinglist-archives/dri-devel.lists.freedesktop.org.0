Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4615033FBEE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 00:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72016E864;
	Wed, 17 Mar 2021 23:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE5A6E862
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 23:40:26 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so2187482pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 16:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KwHaB2Vk2IogMgE0yx2ZDvsbIco4uAI0/LKAdZRr7m8=;
 b=OU/m0gcNl8J4J5q4CaU2tVNYcN0HFsM0x7PmxWzJbVzwefLnwAY0PZMDS04c+IQxnY
 akSOLR7J67zKTdLEq0CHhMyYKD5OOpwiYw8UoSf7jRoMQ0SKYRKNFmRaMAdAoq5xv2WA
 kcua2dToaOXtfy+o+RIZ96mN5ZEO1f2IkZzu6UQdx924cKqFL2khOxWOEQUxuBttE3JM
 kRi/p9mLHWt6VIq/SNrbKa+yCx5dlDiBwpVFIHbJ60UOH6ilgCG+UHw6RuRd4Vkfq3OU
 ewIP2AmOd/ZLpMjvbrnUYwwM8dq9tcQiywciVgnVLQ53Rarf7sGQEVVmetOH4gueCCqY
 fY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KwHaB2Vk2IogMgE0yx2ZDvsbIco4uAI0/LKAdZRr7m8=;
 b=BsLjbwpqo5wrlsD4nKfY8oDlGz8ld9AEE/dWF3wztUoG1c6ZwdS1aDl6xwdpiN7Bgh
 j/10DjLS2V3VE+C4Os6S89ZEYygosGRTBf6kLdFya2HiiWKt9aDsjngSUHdodc8zCKVn
 qCDpznDqoW2QU1Ur9M2oJ7X/Lhp8NTfvtAR6x+R1oBm8Lw/FjXJ3IZGQzK3w8vMfPS4s
 0d7OKUgbEwvwf/j5Kli+CSupo9Wohefw8K6FV7dbLlln12MHXpC/uYTd8qreYjtU+S5I
 JLmm/+qn97BV5kNMyHQJV+Iqz3zm7zbC4dlZzHhsSjyzusQzQVvQ4/rkc6vmEJMd3SUC
 dqvw==
X-Gm-Message-State: AOAM530QCaBdc/bCNmSNCQlK1AEHPKgbFQZ5U7nn9sowyX6jLslsPovw
 moQ/m9F+T0SP/2wg2Hr6XtPpa7ydHehMcQ==
X-Google-Smtp-Source: ABdhPJzqmOSby3sSiRcQ6SSkASJHbop94vgFfq9RELp7TeXFre0G1vx1I5D7HsyafqNcV+U6upL74w==
X-Received: by 2002:a17:902:6a87:b029:e6:6a3d:29e8 with SMTP id
 n7-20020a1709026a87b02900e66a3d29e8mr6511318plk.10.1616024425119; 
 Wed, 17 Mar 2021 16:40:25 -0700 (PDT)
Received: from omlet.lan (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id p3sm148399pgi.24.2021.03.17.16.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 16:40:24 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915/gem: Drop relocation support on all new hardware
 (v6)
Date: Wed, 17 Mar 2021 18:40:11 -0500
Message-Id: <20210317234014.2271006-3-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317234014.2271006-1-jason@jlekstrand.net>
References: <20210315143428.1471489-1-jason@jlekstrand.net>
 <20210317234014.2271006-1-jason@jlekstrand.net>
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
