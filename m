Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72523298257
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 16:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51E96E9DF;
	Sun, 25 Oct 2020 15:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED6A6E9CE
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:41:12 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id dg9so6831730edb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JMGDOiAr07/HW/60oq9OmUoIMTyjwadQfEApJiO0kFQ=;
 b=AkzmlATgU7P4q63qe17IAMb6sTdh7BYPkLuPzt429XBtNNB44l56yHszd+L8iNesUF
 qNxDDpEQ557TAFpFey5PPI/LCBbec9kMxcYCTC1e6euYShyPgCmPEvZLu5KXVAgeNFSq
 j8j48YQ2oFkjcltrO0roD9nnZCgpsJ2DWNTFq3j67L3tBWjm+hFxS8xaqTqJ+5j/3S+r
 21TyB/Pe+XGvUXCKbvqczcDfjfiG7OUHrgzbE+sqt89h+JYufcoHR15A2xmQSyoPtHCx
 jAN7PBQihIMWRk/+Ir92FHqY/c0VuFs3vFDiMtg+Pct58ubBel6mMreGjTPXh80EE2/d
 zWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMGDOiAr07/HW/60oq9OmUoIMTyjwadQfEApJiO0kFQ=;
 b=nPoajNjJw3oawBmws/dCcHGOuc3nVmjiyMBJKl44x5YmfiTX2YSgvSClh4/BqT5fzH
 yYiMKHWQJCbEl//4jdHrQ2YwUIQOzDfzsRh0U7/+QMPhvnYJ2mqkQ9C9z8DKWwGJl/RW
 RO8WCJa6K40wIZDpAzScNMZ4ylY1vhxQNDJaSUyWHq5t9n6psjodviQcGmaBqe26Fb/c
 LP7IvQKpQ9DGADUOwsXU8rflCSZiWajmNYoOPtERhp3HT9tuXU8Y7tdKjKBSCfwl4dOi
 djROiMpK0lvaiyBM05ARXbDrLSkFZoC4PE0+L/JJraN52Kmgj2JBau8V5VxcwfSAXEfu
 qPfw==
X-Gm-Message-State: AOAM532e8/H1ZKVywe4/xt3G6JlKSQuJx0kPLMBkdsPh/84HnCd6dLYW
 WDkz9/40SNE9wrVfsddYeeg=
X-Google-Smtp-Source: ABdhPJw7OEFXdNNBZV3yWFWDisiQgX7S+Kf/qawhDus/IzI8JZ/uNH/98N5AqOuOnY5bnM9IRI1qsw==
X-Received: by 2002:a50:a267:: with SMTP id 94mr11733992edl.30.1603640470974; 
 Sun, 25 Oct 2020 08:41:10 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d13a:1a76:8d61:cf5c])
 by smtp.gmail.com with ESMTPSA id g8sm4141931ejp.73.2020.10.25.08.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 08:41:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Madhav.Chauhan@amd.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/13] drm/nouveau: switch to new allocator
Date: Sun, 25 Oct 2020 16:40:56 +0100
Message-Id: <20201025154100.16400-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201025154100.16400-1-christian.koenig@amd.com>
References: <20201025154100.16400-1-christian.koenig@amd.com>
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
Cc: Ray.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIGFsbCBjYXNlcyBub3cuCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jICB8IDMwICsrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaCB8ICAxIC0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggNzVmZGRiY2Q3ODMyLi43NDZjMDZlZDE5NWIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKQEAgLTEzMjcsMjUgKzEzMjcsMTMg
QEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJ
ZHJtID0gbm91dmVhdV9iZGV2KGJkZXYpOwogCWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKLSNpZiBJ
U19FTkFCTEVEKENPTkZJR19BR1ApCi0JaWYgKGRybS0+YWdwLmJyaWRnZSkgewotCQlyZXR1cm4g
dHRtX3Bvb2xfcG9wdWxhdGUodHRtLCBjdHgpOwotCX0KLSNlbmRpZgotCi0jaWYgSVNfRU5BQkxF
RChDT05GSUdfU1dJT1RMQikgJiYgSVNfRU5BQkxFRChDT05GSUdfWDg2KQotCWlmIChzd2lvdGxi
X25yX3RibCgpKSB7Ci0JCXJldHVybiB0dG1fZG1hX3BvcHVsYXRlKCh2b2lkICopdHRtLCBkZXYs
IGN0eCk7Ci0JfQotI2VuZGlmCi0JcmV0dXJuIHR0bV9wb3B1bGF0ZV9hbmRfbWFwX3BhZ2VzKGRl
diwgdHRtX2RtYSwgY3R4KTsKKwlyZXR1cm4gdHRtX3Bvb2xfYWxsb2MoJmRybS0+dHRtLmJkZXYu
cG9vbCwgdHRtLCBjdHgpOwogfQogCiBzdGF0aWMgdm9pZAogbm91dmVhdV90dG1fdHRfdW5wb3B1
bGF0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAkJCSAgc3RydWN0IHR0bV90dCAqdHRt
KQogewotCXN0cnVjdCB0dG1fdHQgKnR0bV9kbWEgPSAodm9pZCAqKXR0bTsKIAlzdHJ1Y3Qgbm91
dmVhdV9kcm0gKmRybTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXY7CiAJYm9vbCBzbGF2ZSA9ICEhKHR0
bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpOwpAQCAtMTM1NiwyMSArMTM0NCw3IEBA
IG5vdXZlYXVfdHRtX3R0X3VucG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJ
ZHJtID0gbm91dmVhdV9iZGV2KGJkZXYpOwogCWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKLSNpZiBJ
U19FTkFCTEVEKENPTkZJR19BR1ApCi0JaWYgKGRybS0+YWdwLmJyaWRnZSkgewotCQl0dG1fcG9v
bF91bnBvcHVsYXRlKHR0bSk7Ci0JCXJldHVybjsKLQl9Ci0jZW5kaWYKLQotI2lmIElTX0VOQUJM
RUQoQ09ORklHX1NXSU9UTEIpICYmIElTX0VOQUJMRUQoQ09ORklHX1g4NikKLQlpZiAoc3dpb3Rs
Yl9ucl90YmwoKSkgewotCQl0dG1fZG1hX3VucG9wdWxhdGUoKHZvaWQgKil0dG0sIGRldik7Ci0J
CXJldHVybjsKLQl9Ci0jZW5kaWYKLQotCXR0bV91bm1hcF9hbmRfdW5wb3B1bGF0ZV9wYWdlcyhk
ZXYsIHR0bV9kbWEpOworCXJldHVybiB0dG1fcG9vbF9mcmVlKCZkcm0tPnR0bS5iZGV2LnBvb2ws
IHR0bSk7CiB9CiAKIHN0YXRpYyB2b2lkCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYu
aAppbmRleCBiODAyNTUwN2E5ZTQuLjlkMDRkMWIzNjQzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2Rydi5oCkBAIC01Niw3ICs1Niw2IEBACiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1f
cGxhY2VtZW50Lmg+CiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fbWVtb3J5Lmg+CiAjaW5jbHVkZSA8
ZHJtL3R0bS90dG1fbW9kdWxlLmg+Ci0jaW5jbHVkZSA8ZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5o
PgogCiAjaW5jbHVkZSA8ZHJtL2RybV9hdWRpb19jb21wb25lbnQuaD4KIAotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
