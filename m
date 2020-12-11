Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4212D7AEF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 17:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C7C6E497;
	Fri, 11 Dec 2020 16:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956616E492
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 16:29:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r3so9662740wrt.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 08:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wRPl19UGwYF4ueTV3ctFZKeqenPxtRHiQr2+++kl6Ac=;
 b=OvOASk22oH2EJ7EQdBLPGF421aTG+wG7k4zEOGLziez4YunnvvIkahai0Balaae4KW
 s/5+kq2RXRnI+Z8Gylc9bUs7WHaHHq1gGqR9Nqze1Y439CUiwGyFJChGGOOh0UaScodV
 BJybMpQPVEYrG0DSSzaAQBzHe6EhbliGphqks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wRPl19UGwYF4ueTV3ctFZKeqenPxtRHiQr2+++kl6Ac=;
 b=tfO2q31OiXC71ZmWxNGdsjgAPNc2RlmUSWcAFtmtxmYPIPLGkL3hTUBzk7M+l2UwYe
 k96iUVi3qlHkiJmybuVD9pwttMiQgr8nMVLU7bLTAEe077F6iEzjUkaZFW8M6wu6WfQ1
 6jI6FQvPJzavB4W94+UrrCK+/k5S/RAV9mvT+aLqE3kX21MR9IzCXx4ZxLnpdqV/Y7S9
 siz2d7T+XPtVC6AooEvmzxTHR3OuOnaenimvl21iBV4qosAJiaORi1hd9Vji2A5Z+kdh
 No4WakLazoqzibAMa04Kd7BRUkMUNJnVUgVCjeEalBjv5eT7ExnAxXO1fnrW7K6zqkVQ
 Unig==
X-Gm-Message-State: AOAM5307jWgLJlv/MuD+KMVAWGDUIKuQ/E9rvJfoYCi34UTEpWQb9Pdd
 qgqRGuDT1R0CigMuB8sZpPmUFTgGTZFmtw==
X-Google-Smtp-Source: ABdhPJwg5f6/7UMZFi90je8EDCsXp7XMRVBLkSXHcTpwSyLt/aOyC15FeBXEAoMtiLRBdpxPhTLYpw==
X-Received: by 2002:a5d:4c4d:: with SMTP id n13mr14980391wrt.356.1607704191993; 
 Fri, 11 Dec 2020 08:29:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n126sm15917654wmn.21.2020.12.11.08.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 08:29:51 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/ttm: WARN_ON non-empty lru when disabling a resource
 manager
Date: Fri, 11 Dec 2020 17:29:42 +0100
Message-Id: <20201211162942.3399050-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211162942.3399050-1-daniel.vetter@ffwll.ch>
References: <20201211162942.3399050-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, sroland@vmware.com,
 Huang Rui <ray.huang@amd.com>, linux-graphics-maintainer@vmware.com,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dHRtX3Jlc291cmNlX21hbmFnZXItPnVzZV90eXBlIGlzIG9ubHkgdXNlZCBmb3IgcnVudGltZSBj
aGFuZ2VzIGJ5CnZtd2dmeC4gSSB0aGluayBpZGVhbGx5IHdlJ2QgcHVzaCB0aGlzIGZ1bmN0aW9u
YWxpdHkgaW50byBkcml2ZXJzIC0KdHRtIGl0c2VsZiBkb2VzIG5vdCBwcm92aWRlIGFueSBsb2Nr
aW5nIHRvIGd1YXJhbnRlZSB0aGlzIGlzIHNhZmUsIHNvCnRoZSBvbmx5IHdheSB0aGlzIGNhbiB3
b3JrIGF0IHJ1bnRpbWUgaXMgaWYgdGhlIGRyaXZlciBkb2VzIHByb3ZpZGUKYWRkaXRpb25hbCBn
dWFyYW50ZWVzLiB2d21nZnggZG9lcyB0aGF0IHRocm91Z2ggdGhlCnZtd19wcml2YXRlLT5yZXNl
cnZhdGlvbl9zZW0uIFRoZXJlZm9yZSBzdXBwb3J0aW5nIHRoaXMgZmVhdHVyZSBpbgpzaGFyZWQg
Y29kZSBmZWVscyBhIGJpdCBtaXNwbGFjZWQuCgpBcyBhIGZpcnN0IHN0ZXAgYWRkIGEgV0FSTl9P
TiB0byBtYWtlIHN1cmUgdGhlIHJlc291cmNlIG1hbmFnZXIgaXMKZW1wdHkuIFRoaXMgaXMganVz
dCB0byBtYWtlIHN1cmUgSSBhY3R1YWxseSB1bmRlcnN0YW5kIGNvcnJlY3RseSB3aGF0CnZtd2dm
eCBpcyBkb2luZywgYW5kIHRvIG1ha2Ugc3VyZSBhbiBldmVudHVhbCBzdWJzZXF1ZW50IHJlZmFj
dG9yCmRvZXNuJ3QgYnJlYWsgYW55dGhpbmcuCgpUaGlzIGNoZWNrIHNob3VsZCBhbHNvIGJlIHVz
ZWZ1bCBmb3Igb3RoZXIgZHJpdmVycywgdG8gbWFrZSBzdXJlIHRoZXkKaGF2ZW4ndCBsZWFrZWQg
YW55dGhpbmcuCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGlu
dGVsLmNvbT4KQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
Q2M6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vdHRtL3R0
bV9yZXNvdXJjZS5oIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9yZXNvdXJjZS5oIGIvaW5jbHVkZS9kcm0v
dHRtL3R0bV9yZXNvdXJjZS5oCmluZGV4IGY0OGE3MGQzOWFjNS4uNzg5ZWM0NzdiNjA3IDEwMDY0
NAotLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX3Jlc291cmNlLmgKKysrIGIvaW5jbHVkZS9kcm0v
dHRtL3R0bV9yZXNvdXJjZS5oCkBAIC0xOTEsNiArMTkxLDEwIEBAIHN0cnVjdCB0dG1fcmVzb3Vy
Y2Ugewogc3RhdGljIGlubGluZSB2b2lkCiB0dG1fcmVzb3VyY2VfbWFuYWdlcl9zZXRfdXNlZChz
dHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwgYm9vbCB1c2VkKQogeworCWludCBpOwor
CisJZm9yIChpID0gMDsgaSA8IFRUTV9NQVhfQk9fUFJJT1JJVFk7IGkrKykKKwkJV0FSTl9PTigh
bGlzdF9lbXB0eSgmbWFuLT5scnVbaV0pKTsKIAltYW4tPnVzZV90eXBlID0gdXNlZDsKIH0KIAot
LSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
