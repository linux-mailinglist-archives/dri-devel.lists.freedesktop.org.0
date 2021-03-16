Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7133D78A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 16:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DF189D4A;
	Tue, 16 Mar 2021 15:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F9789C99
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 15:33:15 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso1692204wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tAmsDn5BdzFpIsfSDcu5mIHmvLYc/wJQn0BecfxLgl0=;
 b=ME4sGumFgKYUCqwSU9ZCBXBRBDOTgxTwFtahv+NVAVJHr+fD8AUrznH+V7FRtA8gOj
 B+CFMjnx7WbKUqyhiMCsTbXLvmFggAn1SQaPCFAka4KTPpVgwdX/WNFBVl3rpTLAziJj
 STDnUtNyyxJvOuElf8oAxewCR7SdYgUMXzeAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tAmsDn5BdzFpIsfSDcu5mIHmvLYc/wJQn0BecfxLgl0=;
 b=ir/ilf0+cewjtSm4PtPmn3/Rimkjzif9KnU8V/lEQcs3NlEOFbOB1FM9DJobOjNqxJ
 BtKgitmSuD924rChLFrpG5fhoIotli+oPFVJGEpmswOlx1maYtIX1Oj0Eclihc3WG9aj
 +N6F+NNgpwBpuuPXo6vQKcBSJ5uE6llgPXFvv3g4uYKpl2HELwobPoK2ElDKOJZYWswK
 1RJ7OkGLmucAG/9os03UFU46UOmNkvx00R+Ndr+ONjULnFl67G8YtKKasPc6X61reBA+
 QwyB1BPJhOH+SDgBppmIeXpJTvSwHMHEiaFIqvzS6B7hlJwcYqFtrm63hPC8jvsF/nHn
 1Cmw==
X-Gm-Message-State: AOAM533EXmiEW0To7freK8NViReGQsuNi+u+HTGAUFfDUOLdd632nEIw
 3O0nLQdIhqJv46Ep8qmbEpjhjrInFC/PHdjd
X-Google-Smtp-Source: ABdhPJxdFzaSGBW2sfC8QBc+tMQBXV96M89NWylJdwfCrwV7xrFzVSLG4KZ9deIsLAWFmFnloMhjFw==
X-Received: by 2002:a05:600c:4a06:: with SMTP id
 c6mr209965wmp.35.1615908794565; 
 Tue, 16 Mar 2021 08:33:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h22sm3985078wmb.36.2021.03.16.08.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 08:33:14 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] media/videobuf1|2: Mark follow_pfn usage as unsafe
Date: Tue, 16 Mar 2021 16:33:02 +0100
Message-Id: <20210316153303.3216674-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
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
Cc: Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>, Michel Lespinasse <walken@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Pawel Osciak <pawel@osciak.com>,
 John Hubbard <jhubbard@nvidia.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG1lZGlhIG1vZGVsIGFzc3VtZXMgdGhhdCBidWZmZXJzIGFyZSBhbGwgcHJlYWxsb2NhdGVk
LCBzbyB0aGF0CndoZW4gYSBtZWRpYSBwaXBlbGluZSBpcyBydW5uaW5nIHdlIG5ldmVyIG1pc3Mg
YSBkZWFkbGluZSBiZWNhdXNlIHRoZQpidWZmZXJzIGFyZW4ndCBhbGxvY2F0ZWQgb3IgYXZhaWxh
YmxlLgoKVGhpcyBtZWFucyB3ZSBjYW5ub3QgZml4IHRoZSB2NGwgZm9sbG93X3BmbiB1c2FnZSB0
aHJvdWdoCm1tdV9ub3RpZmllciwgd2l0aG91dCBicmVha2luZyBob3cgdGhpcyBhbGwgd29ya3Mu
IFRoZSBvbmx5IHJlYWwgZml4CmlzIHRvIGRlcHJlY2F0ZSB1c2VycHRyIHN1cHBvcnQgZm9yIFZN
X0lPIHwgVk1fUEZOTUFQIG1hcHBpbmdzIGFuZAp0ZWxsIGV2ZXJ5b25lIHRvIGN1dCBvdmVyIHRv
IGRtYS1idWYgbWVtb3J5IHNoYXJpbmcgZm9yIHplcm9jb3B5LgoKdXNlcnB0ciBmb3Igbm9ybWFs
IG1lbW9yeSB3aWxsIGtlZXAgd29ya2luZyBhcy1pcywgdGhpcyBvbmx5IGFmZmVjdHMKdGhlIHpl
cm9jb3B5IHVzZXJwdHIgdXNhZ2UgZW5hYmxlZCBpbiA1MGFjOTUyZDIyNjMgKCJbbWVkaWFdCnZp
ZGVvYnVmMi1kbWEtc2c6IFN1cHBvcnQgaW8gdXNlcnB0ciBvcGVyYXRpb25zIG9uIGlvIG1lbW9y
eSIpLgoKQWNrZWQtYnk6IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+CkFja2VkLWJ5
OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4KU2lnbmVkLW9mZi1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0B6aWVwZS5jYT4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpD
YzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBBbmRyZXcgTW9y
dG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogSm9obiBIdWJiYXJkIDxqaHViYmFy
ZEBudmlkaWEuY29tPgpDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNj
OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFt
c0BpbnRlbC5jb20+CkNjOiBsaW51eC1tbUBrdmFjay5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3Jn
CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IFBhd2VsIE9zY2lhayA8cGF3ZWxA
b3NjaWFrLmNvbT4KQ2M6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNv
bT4KQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+CkNjOiBUb21h
c3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPgpDYzogTGF1cmVudCBEdWZvdXIgPGxkdWZvdXJA
bGludXguaWJtLmNvbT4KQ2M6IFZsYXN0aW1pbCBCYWJrYSA8dmJhYmthQHN1c2UuY3o+CkNjOiBE
YW5pZWwgSm9yZGFuIDxkYW5pZWwubS5qb3JkYW5Ab3JhY2xlLmNvbT4KQ2M6IE1pY2hlbCBMZXNw
aW5hc3NlIDx3YWxrZW5AZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0KdjM6Ci0gUmVmZXJlbmNlIHRoZSBjb21taXQgdGhh
dCBlbmFibGVkIHRoZSB6ZXJvY29weSB1c2VycHRyIHVzZSBjYXNlIHRvCiAgbWFrZSBpdCBhYnVu
ZGFuZHRseSBjbGVhciB0aGF0IHRoaXMgcGF0Y2ggb25seSBhZmZlY3RzIHRoYXQsIGFuZCBub3QK
ICBub3JtYWwgbWVtb3J5IHVzZXJwdHIuIFRoZSBvbGQgY29tbWl0IG1lc3NhZ2UgYWxyZWFkeSBl
eHBsYWluZWQgdGhhdAogIG5vcm1hbCBtZW1vcnkgdXNlcnB0ciBpcyB1bmFmZmVjdGVkLCBidXQg
SSBndWVzcyB0aGF0IHdhcyBub3QgY2xlYXIKICBlbm91Z2guCi0tLQogZHJpdmVycy9tZWRpYS9j
b21tb24vdmlkZW9idWYyL2ZyYW1lX3ZlY3Rvci5jIHwgMiArLQogZHJpdmVycy9tZWRpYS92NGwy
LWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9j
b21tb24vdmlkZW9idWYyL2ZyYW1lX3ZlY3Rvci5jIGIvZHJpdmVycy9tZWRpYS9jb21tb24vdmlk
ZW9idWYyL2ZyYW1lX3ZlY3Rvci5jCmluZGV4IGEwZTY1NDgxYTIwMS4uMWE4MmVjMTNlYTAwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvZnJhbWVfdmVjdG9yLmMK
KysrIGIvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL2ZyYW1lX3ZlY3Rvci5jCkBAIC03
MCw3ICs3MCw3IEBAIGludCBnZXRfdmFkZHJfZnJhbWVzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVu
c2lnbmVkIGludCBucl9mcmFtZXMsCiAJCQlicmVhazsKIAogCQl3aGlsZSAocmV0IDwgbnJfZnJh
bWVzICYmIHN0YXJ0ICsgUEFHRV9TSVpFIDw9IHZtYS0+dm1fZW5kKSB7Ci0JCQllcnIgPSBmb2xs
b3dfcGZuKHZtYSwgc3RhcnQsICZudW1zW3JldF0pOworCQkJZXJyID0gdW5zYWZlX2ZvbGxvd19w
Zm4odm1hLCBzdGFydCwgJm51bXNbcmV0XSk7CiAJCQlpZiAoZXJyKSB7CiAJCQkJaWYgKHJldCA9
PSAwKQogCQkJCQlyZXQgPSBlcnI7CmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Y0bDItY29y
ZS92aWRlb2J1Zi1kbWEtY29udGlnLmMgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1
Zi1kbWEtY29udGlnLmMKaW5kZXggNTIzMTJjZTJiYTA1Li44MjFjNGE3NmFiOTYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1jb250aWcuYworKysgYi9k
cml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKQEAgLTE4Myw3ICsx
ODMsNyBAQCBzdGF0aWMgaW50IHZpZGVvYnVmX2RtYV9jb250aWdfdXNlcl9nZXQoc3RydWN0IHZp
ZGVvYnVmX2RtYV9jb250aWdfbWVtb3J5ICptZW0sCiAJdXNlcl9hZGRyZXNzID0gdW50YWdnZWRf
YmFkZHI7CiAKIAl3aGlsZSAocGFnZXNfZG9uZSA8IChtZW0tPnNpemUgPj4gUEFHRV9TSElGVCkp
IHsKLQkJcmV0ID0gZm9sbG93X3Bmbih2bWEsIHVzZXJfYWRkcmVzcywgJnRoaXNfcGZuKTsKKwkJ
cmV0ID0gdW5zYWZlX2ZvbGxvd19wZm4odm1hLCB1c2VyX2FkZHJlc3MsICZ0aGlzX3Bmbik7CiAJ
CWlmIChyZXQpCiAJCQlicmVhazsKIAotLSAKMi4zMC4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
