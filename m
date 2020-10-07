Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5C92864D6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9466E8AD;
	Wed,  7 Oct 2020 16:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12866E956
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 16:44:41 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v12so3137770wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tumapzZxvtArZNF04352kaumd5zWdbY4K/o9+R8ZPiU=;
 b=ZCR6epNGq4y9pMu5KQprul9p0e5pbHRNVWh8gfzFX5t78d6KExLodPu0cge87TbHQ7
 IFCUDLlXaw9OhMaO8M6ZionCebVY74YdmCbAxhY4ZzIXmKSQNldnw8FEWkuV3IgYHDwi
 4BgN7dseD1BVSXWfbIbpwPFDfQHHYpunWAI44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tumapzZxvtArZNF04352kaumd5zWdbY4K/o9+R8ZPiU=;
 b=PEybcDBmmf7i1BI3yf/4iyReLanBtHsDhutbKMU+hX05ilEIyVBKc5fftMZtHqReVs
 jntIegaXfJfy8fxu+CHOV7Nt8+bOBkrRco+z9qYzX8+qsDkpOclBKrfanVwL0z/7tZyP
 G9d90yD1JQLA+2V3s/8XduCgmmnR4jCUoV+PZ5jeHB4yMWXhr97v0dMzBqHWVQ10VC0C
 qmCvWGFLMfHHU3SltRyJo0D2eUBZCy3tbhCGzzd/Y1wV2ZBOtBuVmsvtK+ki7PL5e8Az
 G0dLh2FCmvyMk/WstmgCbNkyOol0nf7ChlPns3WhhTh/TZaU3EAmd+IcwF913NTp+qqj
 jh1A==
X-Gm-Message-State: AOAM530hfdfZoDzsbdj1zK+s9FpsJl4W5QUgWfQ+0Dv/QBvQj51lpoxH
 dEsZQeCTzUguIVaWu/bvcXbOdSUscXjFNRVs
X-Google-Smtp-Source: ABdhPJzV4N2gLoUB2iCJL2idqYl1jr0gD0FniH6eb95jw+Xbq6j8k/dKxJZkk3IRomSCwD32oRnJ8Q==
X-Received: by 2002:a1c:a7cc:: with SMTP id q195mr4218149wme.8.1602089080062; 
 Wed, 07 Oct 2020 09:44:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z191sm3332280wme.40.2020.10.07.09.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:44:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/13] mm/frame-vector: Use FOLL_LONGTERM
Date: Wed,  7 Oct 2020 18:44:18 +0200
Message-Id: <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org,
 Kyungmin Park <kyungmin.park@samsung.com>, John Hubbard <jhubbard@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB1c2VkIGJ5IG1lZGlhL3ZpZGVidWYyIGZvciBwZXJzaXN0ZW50IGRtYSBtYXBwaW5n
cywgbm90IGp1c3QKZm9yIGEgc2luZ2xlIGRtYSBvcGVyYXRpb24gYW5kIHRoZW4gZnJlZWQgYWdh
aW4sIHNvIG5lZWRzCkZPTExfTE9OR1RFUk0uCgpVbmZvcnR1bmF0ZWx5IGN1cnJlbnQgcHVwX2xv
Y2tlZCBkb2Vzbid0IHN1cHBvcnQgRk9MTF9MT05HVEVSTSBkdWUgdG8KbG9ja2luZyBpc3N1ZXMu
IFJld29yayB0aGUgY29kZSB0byBwdWxsIHRoZSBwdXAgcGF0aCBvdXQgZnJvbSB0aGUKbW1hcF9z
ZW0gY3JpdGljYWwgc2VjdGlvbiBhcyBzdWdnZXN0ZWQgYnkgSmFzb24uCgpTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEphc29uIEd1bnRo
b3JwZSA8amdnQHppZXBlLmNhPgpDYzogUGF3ZWwgT3NjaWFrIDxwYXdlbEBvc2NpYWsuY29tPgpD
YzogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgpDYzogS3l1bmdt
aW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4KQ2M6IFRvbWFzeiBGaWdhIDx0Zmln
YUBjaHJvbWl1bS5vcmc+CkNjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVs
Lm9yZz4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2UgPGpn
bGlzc2VAcmVkaGF0LmNvbT4KQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2ls
bGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpD
YzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5n
LXNvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwotLS0K
IG1tL2ZyYW1lX3ZlY3Rvci5jIHwgMzYgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvbW0vZnJhbWVfdmVjdG9yLmMgYi9tbS9mcmFtZV92ZWN0b3IuYwppbmRleCAx
MGY4MmQ1NjQzYjYuLjM5ZGI1MjBhNTFkYyAxMDA2NDQKLS0tIGEvbW0vZnJhbWVfdmVjdG9yLmMK
KysrIGIvbW0vZnJhbWVfdmVjdG9yLmMKQEAgLTM4LDcgKzM4LDYgQEAgaW50IGdldF92YWRkcl9m
cmFtZXModW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgaW50IG5yX2ZyYW1lcywKIAlzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKIAlpbnQgcmV0ID0gMDsKIAlpbnQgZXJyOwotCWludCBs
b2NrZWQ7CiAKIAlpZiAobnJfZnJhbWVzID09IDApCiAJCXJldHVybiAwOwpAQCAtNDgsMzUgKzQ3
LDIyIEBAIGludCBnZXRfdmFkZHJfZnJhbWVzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVk
IGludCBucl9mcmFtZXMsCiAKIAlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOwogCisJcmV0
ID0gcGluX3VzZXJfcGFnZXNfZmFzdChzdGFydCwgbnJfZnJhbWVzLAorCQkJCSAgRk9MTF9GT1JD
RSB8IEZPTExfV1JJVEUgfCBGT0xMX0xPTkdURVJNLAorCQkJCSAgKHN0cnVjdCBwYWdlICoqKSh2
ZWMtPnB0cnMpKTsKKwlpZiAocmV0ID4gMCkgeworCQl2ZWMtPmdvdF9yZWYgPSB0cnVlOworCQl2
ZWMtPmlzX3BmbnMgPSBmYWxzZTsKKwkJZ290byBvdXRfdW5sb2NrZWQ7CisJfQorCiAJbW1hcF9y
ZWFkX2xvY2sobW0pOwotCWxvY2tlZCA9IDE7CiAJdm1hID0gZmluZF92bWFfaW50ZXJzZWN0aW9u
KG1tLCBzdGFydCwgc3RhcnQgKyAxKTsKIAlpZiAoIXZtYSkgewogCQlyZXQgPSAtRUZBVUxUOwog
CQlnb3RvIG91dDsKIAl9CiAKLQkvKgotCSAqIFdoaWxlIGdldF92YWRkcl9mcmFtZXMoKSBjb3Vs
ZCBiZSB1c2VkIGZvciB0cmFuc2llbnQgKGtlcm5lbAotCSAqIGNvbnRyb2xsZWQgbGlmZXRpbWUp
IHBpbm5pbmcgb2YgbWVtb3J5IHBhZ2VzIGFsbCBjdXJyZW50Ci0JICogdXNlcnMgZXN0YWJsaXNo
IGxvbmcgdGVybSAodXNlcnNwYWNlIGNvbnRyb2xsZWQgbGlmZXRpbWUpCi0JICogcGFnZSBwaW5u
aW5nLiBUcmVhdCBnZXRfdmFkZHJfZnJhbWVzKCkgbGlrZQotCSAqIGdldF91c2VyX3BhZ2VzX2xv
bmd0ZXJtKCkgYW5kIGRpc2FsbG93IGl0IGZvciBmaWxlc3lzdGVtLWRheAotCSAqIG1hcHBpbmdz
LgotCSAqLwotCWlmICh2bWFfaXNfZnNkYXgodm1hKSkgewotCQlyZXQgPSAtRU9QTk9UU1VQUDsK
LQkJZ290byBvdXQ7Ci0JfQotCi0JaWYgKCEodm1hLT52bV9mbGFncyAmIChWTV9JTyB8IFZNX1BG
Tk1BUCkpKSB7Ci0JCXZlYy0+Z290X3JlZiA9IHRydWU7Ci0JCXZlYy0+aXNfcGZucyA9IGZhbHNl
OwotCQlyZXQgPSBwaW5fdXNlcl9wYWdlc19sb2NrZWQoc3RhcnQsIG5yX2ZyYW1lcywKLQkJCWd1
cF9mbGFncywgKHN0cnVjdCBwYWdlICoqKSh2ZWMtPnB0cnMpLCAmbG9ja2VkKTsKLQkJZ290byBv
dXQ7Ci0JfQotCiAJdmVjLT5nb3RfcmVmID0gZmFsc2U7CiAJdmVjLT5pc19wZm5zID0gdHJ1ZTsK
IAlkbyB7CkBAIC0xMDEsOCArODcsOCBAQCBpbnQgZ2V0X3ZhZGRyX2ZyYW1lcyh1bnNpZ25lZCBs
b25nIHN0YXJ0LCB1bnNpZ25lZCBpbnQgbnJfZnJhbWVzLAogCQl2bWEgPSBmaW5kX3ZtYV9pbnRl
cnNlY3Rpb24obW0sIHN0YXJ0LCBzdGFydCArIDEpOwogCX0gd2hpbGUgKHZtYSAmJiB2bWEtPnZt
X2ZsYWdzICYgKFZNX0lPIHwgVk1fUEZOTUFQKSk7CiBvdXQ6Ci0JaWYgKGxvY2tlZCkKLQkJbW1h
cF9yZWFkX3VubG9jayhtbSk7CisJbW1hcF9yZWFkX3VubG9jayhtbSk7CitvdXRfdW5sb2NrZWQ6
CiAJaWYgKCFyZXQpCiAJCXJldCA9IC1FRkFVTFQ7CiAJaWYgKHJldCA+IDApCi0tIAoyLjI4LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
