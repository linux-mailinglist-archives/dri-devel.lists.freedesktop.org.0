Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DC72BA6AD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 10:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC9B6E8A1;
	Fri, 20 Nov 2020 09:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034C96E89C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 09:56:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so9410708wrt.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 01:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ODWIjSITGhibxiu5sdcf8aVMrj4QUXzG8FJI3RynFGM=;
 b=abxl7E4wo7jZpAfTzuunphaH5vlt/naI7HAiWaSpvixjFnf4sVbia8Q3BJ+dVpIqSd
 rzyCZR6pVpoX67iLtk7QN881pKiYydMCbW2tIIk5Y0QHWn5wBSS/BB//JgXsoKgg8fVg
 rRtlAoYdJtnHk5e8fU/kzRg05Ih+mmmH1kzj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ODWIjSITGhibxiu5sdcf8aVMrj4QUXzG8FJI3RynFGM=;
 b=lZjnc84S+6KxhaxKrbiXzScuHCFdHdmTY0iGD4+hNOw0wFCdVTJJ5HFDrU3h+ADhiR
 WYZcQ4fMLYhFvAHZqzDqMB1oS4OaYjn4J2iKvnn0YHh0t24eSN3+I7VEMlWT71dtIVYY
 DIolnFtMa90OYJVSXtTuZoINTkS+9OYgLY7a3RHaB6Wyx05ocyrAhve/Blrcq07vatig
 pGc8dRGuWFyXg7Yx1Shx33ThxuoxSHL4rXDQXcTi2Pd4dCsffJ/gugNSSNn8c8dXGBvF
 cYgBEfZyxKYag/MYdihVcXBaDADmiYJmIABxKStaCwM/0smYe7kEYgyyneVSZmmuhoVB
 gZYw==
X-Gm-Message-State: AOAM532cN7zvB5CWRQR2r/Q8cTHAzDk5xKM7WVmX+l+5mRdRdDnpolHt
 vAJ5snhntWe19l29LthTKzMncXEDitJxmA==
X-Google-Smtp-Source: ABdhPJxJ2UyLnfvFIWnVmPKRqax6sfQkCZohfTD1sEUpZkqrYbW1bkqO7INNhAf+GB4nJI4JFKC4Ow==
X-Received: by 2002:a5d:4d87:: with SMTP id b7mr15742781wru.115.1605866174422; 
 Fri, 20 Nov 2020 01:56:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t9sm4500208wrr.49.2020.11.20.01.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 01:56:13 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] locking/selftests: Add testcases for fs_reclaim
Date: Fri, 20 Nov 2020 10:54:44 +0100
Message-Id: <20201120095445.1195585-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120095445.1195585-1-daniel.vetter@ffwll.ch>
References: <20201120095445.1195585-1-daniel.vetter@ffwll.ch>
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
Cc: Will Deacon <will@kernel.org>, linux-rdma@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Chinner <david@fromorbit.com>, LKML <linux-kernel@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Qian Cai <cai@lca.pw>, linux-fsdevel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgSSBidXRjaGVyZWQgdGhpcyBJIGZpZ3VyZWQgYmV0dGVyIHRvIG1ha2Ugc3VyZSB3ZSBo
YXZlIHRlc3RjYXNlcwpmb3IgdGhpcyBub3cuIFNpbmNlIHdlIG9ubHkgaGF2ZSBhIGxvY2tpbmcg
Y29udGV4dCBmb3IgX19HRlBfRlMgdGhhdCdzCnRoZSBvbmx5IHRoaW5nIHdlJ3JlIHRlc3Rpbmcg
cmlnaHQgbm93LgoKQ2M6IGxpbnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwub3JnCkNjOiBEYXZlIENo
aW5uZXIgPGRhdmlkQGZyb21vcmJpdC5jb20+CkNjOiBRaWFuIENhaSA8Y2FpQGxjYS5wdz4KQ2M6
IGxpbnV4LXhmc0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
PHRob21hc19vc0BzaGlwbWFpbC5vcmc+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZv
dW5kYXRpb24ub3JnPgpDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpDYzog
bGludXgtbW1Aa3ZhY2sub3JnCkNjOiBsaW51eC1yZG1hQHZnZXIua2VybmVsLm9yZwpDYzogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6ICJNYXR0aGV3IFdp
bGNveCAoT3JhY2xlKSIgPHdpbGx5QGluZnJhZGVhZC5vcmc+ClNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogUGV0ZXIgWmlqbHN0cmEgPHBl
dGVyekBpbmZyYWRlYWQub3JnPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNj
OiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPgpDYzogbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZwotLS0KIGxpYi9sb2NraW5nLXNlbGZ0ZXN0LmMgfCA0NyArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvbGliL2xvY2tpbmctc2VsZnRlc3QuYyBiL2xpYi9sb2NraW5nLXNl
bGZ0ZXN0LmMKaW5kZXggYTg5OWIzZjBlMmU1Li5hZDQ3YzMzNThlMzAgMTAwNjQ0Ci0tLSBhL2xp
Yi9sb2NraW5nLXNlbGZ0ZXN0LmMKKysrIGIvbGliL2xvY2tpbmctc2VsZnRlc3QuYwpAQCAtMTUs
NiArMTUsNyBAQAogI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+CiAjaW5jbHVkZSA8bGludXgvd3df
bXV0ZXguaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgorI2luY2x1ZGUgPGxpbnV4L3NjaGVk
L21tLmg+CiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9sb2NrZGVw
Lmg+CiAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KQEAgLTIzNTcsNiArMjM1OCw1MCBAQCBz
dGF0aWMgdm9pZCBxdWV1ZWRfcmVhZF9sb2NrX3Rlc3RzKHZvaWQpCiAJcHJfY29udCgiXG4iKTsK
IH0KIAorc3RhdGljIHZvaWQgZnNfcmVjbGFpbV9jb3JyZWN0X25lc3Rpbmcodm9pZCkKK3sKKwlm
c19yZWNsYWltX2FjcXVpcmUoR0ZQX0tFUk5FTCk7CisJbWlnaHRfYWxsb2MoR0ZQX05PRlMpOwor
CWZzX3JlY2xhaW1fcmVsZWFzZShHRlBfS0VSTkVMKTsKK30KKworc3RhdGljIHZvaWQgZnNfcmVj
bGFpbV93cm9uZ19uZXN0aW5nKHZvaWQpCit7CisJZnNfcmVjbGFpbV9hY3F1aXJlKEdGUF9LRVJO
RUwpOworCW1pZ2h0X2FsbG9jKEdGUF9LRVJORUwpOworCWZzX3JlY2xhaW1fcmVsZWFzZShHRlBf
S0VSTkVMKTsKK30KKworc3RhdGljIHZvaWQgZnNfcmVjbGFpbV9wcm90ZWN0ZWRfbmVzdGluZyh2
b2lkKQoreworCXVuc2lnbmVkIGludCBmbGFnczsKKworCWZzX3JlY2xhaW1fYWNxdWlyZShHRlBf
S0VSTkVMKTsKKwlmbGFncyA9IG1lbWFsbG9jX25vZnNfc2F2ZSgpOworCW1pZ2h0X2FsbG9jKEdG
UF9LRVJORUwpOworCW1lbWFsbG9jX25vZnNfcmVzdG9yZShmbGFncyk7CisJZnNfcmVjbGFpbV9y
ZWxlYXNlKEdGUF9LRVJORUwpOworfQorCitzdGF0aWMgdm9pZCBmc19yZWNsYWltX3Rlc3RzKHZv
aWQpCit7CisJcHJpbnRrKCIgIC0tLS0tLS0tLS0tLS0tLS0tLS0tXG4iKTsKKwlwcmludGsoIiAg
fCBmc19yZWNsYWltIHRlc3RzIHxcbiIpOworCXByaW50aygiICAtLS0tLS0tLS0tLS0tLS0tLS0t
LVxuIik7CisKKwlwcmludF90ZXN0bmFtZSgiY29ycmVjdCBuZXN0aW5nIik7CisJZG90ZXN0KGZz
X3JlY2xhaW1fY29ycmVjdF9uZXN0aW5nLCBTVUNDRVNTLCAwKTsKKwlwcl9jb250KCJcbiIpOwor
CisJcHJpbnRfdGVzdG5hbWUoIndyb25nIG5lc3RpbmciKTsKKwlkb3Rlc3QoZnNfcmVjbGFpbV93
cm9uZ19uZXN0aW5nLCBGQUlMVVJFLCAwKTsKKwlwcl9jb250KCJcbiIpOworCisJcHJpbnRfdGVz
dG5hbWUoInByb3RlY3RlZCBuZXN0aW5nIik7CisJZG90ZXN0KGZzX3JlY2xhaW1fcHJvdGVjdGVk
X25lc3RpbmcsIFNVQ0NFU1MsIDApOworCXByX2NvbnQoIlxuIik7Cit9CisKIHZvaWQgbG9ja2lu
Z19zZWxmdGVzdCh2b2lkKQogewogCS8qCkBAIC0yNDc4LDYgKzI1MjMsOCBAQCB2b2lkIGxvY2tp
bmdfc2VsZnRlc3Qodm9pZCkKIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfUVVFVUVEX1JXTE9DS1Mp
KQogCQlxdWV1ZWRfcmVhZF9sb2NrX3Rlc3RzKCk7CiAKKwlmc19yZWNsYWltX3Rlc3RzKCk7CisK
IAlpZiAodW5leHBlY3RlZF90ZXN0Y2FzZV9mYWlsdXJlcykgewogCQlwcmludGsoIi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
XG4iKTsKIAkJZGVidWdfbG9ja3MgPSAwOwotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
