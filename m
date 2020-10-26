Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F5E298AEF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 11:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE796E9B9;
	Mon, 26 Oct 2020 10:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB226E96E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 10:58:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e17so11866564wru.12
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 03:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fFEiUvLl06c3j38++d5NzLL6L7leWWZ4E8u91rYq/3A=;
 b=BE6oxOGm6LpmFehTBcLW4JPuAVn0ztXRRhPFdKmp1PBfZHMfOH6ZZMUim7N+RidGFG
 0CE8UiBULFscc13H0ar8GrDLO4yJ1P0bnnkFlnldicZz6vS1PSOwsA2+DLJdMtAv2h85
 Tg25hld8e9Oy330GCD/SQEbTeh0mowIk6eEfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fFEiUvLl06c3j38++d5NzLL6L7leWWZ4E8u91rYq/3A=;
 b=cjmxciQRlPj1di65a0pVk3E2vWSzAmetSIacQbYYZ/GCd7TqHUki+RDxTbrlbLlFHY
 fdysnCA38VXN/rJloXJWK2FflRdDvjRRAio1kYrxjrZFfl1bjk7Oa/c9/uVHdGNMA8bh
 HsJ/DWbJt3l/KFukOd2278IqWscwFyfibdET3x4seKJU76aTj1E/N+rrlHqp3B7+9BSH
 ZlcUAglfJuU2JqkCL3NWwqWpIvhZDh2HrP2BfrlRS3gAtLIUFVfWjil4sKscx964XJf6
 I4APnIOfTsw2LhgpuIMzgD0Bz5F3PcI8UXBurzqO/xXWYMbkRmKy8IDPhYzfvOE8nkJs
 WdyA==
X-Gm-Message-State: AOAM53011ac8ydFsWe7IJcy5+H+ydgXKmasz3N9QP7O/jDqDf/J7SdqB
 gy5QIXdbQRV3ulqsHZzJ0f8c0WAf3+65t077
X-Google-Smtp-Source: ABdhPJyJPBqr4xzE4feUIHJFFKeriugShRo0uGRtLd+TVzcLzKKWgkZaYccYEU5/Oo10Zk0lMDMkEw==
X-Received: by 2002:a05:6000:12c9:: with SMTP id
 l9mr16792055wrx.309.1603709918272; 
 Mon, 26 Oct 2020 03:58:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w83sm21165156wmg.48.2020.10.26.03.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 03:58:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 09/15] media/videbuf1|2: Mark follow_pfn usage as unsafe
Date: Mon, 26 Oct 2020 11:58:12 +0100
Message-Id: <20201026105818.2585306-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
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
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
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
eSIpLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KQ2M6IEtlZXMgQ29vayA8a2Vl
c2Nvb2tAY2hyb21pdW0ub3JnPgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRl
bC5jb20+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgpDYzogSsOpcsO0bWUgR2xpc3NlIDxq
Z2xpc3NlQHJlZGhhdC5jb20+CkNjOiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgpDYzogRGFuIFdp
bGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBsaW51eC1tbUBrdmFjay5vcmcK
Q2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtc2Ftc3Vu
Zy1zb2NAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6
IFBhd2VsIE9zY2lhayA8cGF3ZWxAb3NjaWFrLmNvbT4KQ2M6IE1hcmVrIFN6eXByb3dza2kgPG0u
c3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtA
c2Ftc3VuZy5jb20+CkNjOiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPgpDYzogTGF1
cmVudCBEdWZvdXIgPGxkdWZvdXJAbGludXguaWJtLmNvbT4KQ2M6IFZsYXN0aW1pbCBCYWJrYSA8
dmJhYmthQHN1c2UuY3o+CkNjOiBEYW5pZWwgSm9yZGFuIDxkYW5pZWwubS5qb3JkYW5Ab3JhY2xl
LmNvbT4KQ2M6IE1pY2hlbCBMZXNwaW5hc3NlIDx3YWxrZW5AZ29vZ2xlLmNvbT4KU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0KdjM6Ci0gUmVm
ZXJlbmNlIHRoZSBjb21taXQgdGhhdCBlbmFibGVkIHRoZSB6ZXJvY29weSB1c2VycHRyIHVzZSBj
YXNlIHRvCiAgbWFrZSBpdCBhYnVuZGFuZHRseSBjbGVhciB0aGF0IHRoaXMgcGF0Y2ggb25seSBh
ZmZlY3RzIHRoYXQsIGFuZCBub3QKICBub3JtYWwgbWVtb3J5IHVzZXJwdHIuIFRoZSBvbGQgY29t
bWl0IG1lc3NhZ2UgYWxyZWFkeSBleHBsYWluZWQgdGhhdAogIG5vcm1hbCBtZW1vcnkgdXNlcnB0
ciBpcyB1bmFmZmVjdGVkLCBidXQgSSBndWVzcyB0aGF0IHdhcyBub3QgY2xlYXIKICBlbm91Z2gu
Ci0tLQogZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL2ZyYW1lX3ZlY3Rvci5jIHwgMiAr
LQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL2ZyYW1lX3ZlY3Rvci5jIGIvZHJp
dmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL2ZyYW1lX3ZlY3Rvci5jCmluZGV4IDY1OTA5ODdj
MTRiZC4uZTYzMDQ5NGRhNjVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL2NvbW1vbi92aWRl
b2J1ZjIvZnJhbWVfdmVjdG9yLmMKKysrIGIvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYy
L2ZyYW1lX3ZlY3Rvci5jCkBAIC02OSw3ICs2OSw3IEBAIGludCBnZXRfdmFkZHJfZnJhbWVzKHVu
c2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGludCBucl9mcmFtZXMsCiAJCQlicmVhazsKIAog
CQl3aGlsZSAocmV0IDwgbnJfZnJhbWVzICYmIHN0YXJ0ICsgUEFHRV9TSVpFIDw9IHZtYS0+dm1f
ZW5kKSB7Ci0JCQllcnIgPSBmb2xsb3dfcGZuKHZtYSwgc3RhcnQsICZudW1zW3JldF0pOworCQkJ
ZXJyID0gdW5zYWZlX2ZvbGxvd19wZm4odm1hLCBzdGFydCwgJm51bXNbcmV0XSk7CiAJCQlpZiAo
ZXJyKSB7CiAJCQkJaWYgKHJldCA9PSAwKQogCQkJCQlyZXQgPSBlcnI7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMgYi9kcml2ZXJzL21l
ZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKaW5kZXggNTIzMTJjZTJiYTA1Li44
MjFjNGE3NmFiOTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVm
LWRtYS1jb250aWcuYworKysgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEt
Y29udGlnLmMKQEAgLTE4Myw3ICsxODMsNyBAQCBzdGF0aWMgaW50IHZpZGVvYnVmX2RtYV9jb250
aWdfdXNlcl9nZXQoc3RydWN0IHZpZGVvYnVmX2RtYV9jb250aWdfbWVtb3J5ICptZW0sCiAJdXNl
cl9hZGRyZXNzID0gdW50YWdnZWRfYmFkZHI7CiAKIAl3aGlsZSAocGFnZXNfZG9uZSA8IChtZW0t
PnNpemUgPj4gUEFHRV9TSElGVCkpIHsKLQkJcmV0ID0gZm9sbG93X3Bmbih2bWEsIHVzZXJfYWRk
cmVzcywgJnRoaXNfcGZuKTsKKwkJcmV0ID0gdW5zYWZlX2ZvbGxvd19wZm4odm1hLCB1c2VyX2Fk
ZHJlc3MsICZ0aGlzX3Bmbik7CiAJCWlmIChyZXQpCiAJCQlicmVhazsKIAotLSAKMi4yOC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
