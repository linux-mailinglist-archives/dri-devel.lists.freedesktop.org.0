Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F94FA217C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 18:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA076E13D;
	Thu, 29 Aug 2019 16:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3C16E13D;
 Thu, 29 Aug 2019 16:53:41 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id w2so2463062pfi.3;
 Thu, 29 Aug 2019 09:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ROI1h6BX8pjgc4LOx6piYuvxJZlEcDiZCUSCssETQu4=;
 b=Sp8CSP1TfE3qMJFreT0QieE07n+J6p8I4C5XMci3oYu3Im7Aodug7pY20teevuo9U9
 jkac5UN+oP8yNbPOizhLYjcMIMAhggO/RLVi8p/8NuSqfQvIYgUNCnn6CrCKVOTOTYHS
 zPiUHQnmgSvDMeJp50zjQIMGZwlh6aWTuB+InEKXhihoU/uCB78JSfH2oW27CL1tM2Vi
 Ut7w3jmSInTRM2sMibxaPO5Kkn94VL6N+0mXM6KL2FmS3ZZqLbxphatr3iEmqcIF8CRk
 1aNF23yRLH5H4zOh5UODLDTbG1iFb2GDi8jWwGQtvfR+Sj5p2wZv+IW4PBO5EdMqE/dS
 /dAg==
X-Gm-Message-State: APjAAAVYLxWWnXOXti/m0nxHtFo87yRlzbVyxlToPAPFjI5mWuaSGF+i
 dXXEGRthydU2YXN5MAS0a8HuWzC1lNI=
X-Google-Smtp-Source: APXvYqzs2mYLo/bTNzZZh5PG+LuBi+qAUwwV5VKV77PeHu8CnzLx7ZZPeu0/rN7i/RfGRdaixrXBhw==
X-Received: by 2002:a65:64c6:: with SMTP id t6mr9421160pgv.323.1567097620246; 
 Thu, 29 Aug 2019 09:53:40 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id w2sm3023576pjr.27.2019.08.29.09.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:53:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/10] drm/msm/dpu: add real wait_for_commit_done()
Date: Thu, 29 Aug 2019 09:45:10 -0700
Message-Id: <20190829164601.11615-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829164601.11615-1-robdclark@gmail.com>
References: <20190829164601.11615-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROI1h6BX8pjgc4LOx6piYuvxJZlEcDiZCUSCssETQu4=;
 b=umYgseE/IeMY4l4arKqAwbmSODhJ/VeVn3EFJswXmJNpSbkJchJgfXvHIH83VVwJwQ
 yCYvK9ytBhP3BHxuqQXyy64qEhljg2MbEZqVhv7m3uTWL0rIYAbCQU7cB3vajV6YMyIz
 f0wsG2c3x1lA+FuGW7YqfjYH48X5zEum+NEeUWe+n2JssQoyWaiLWOx/CpnYNr4IsApP
 UJwvlIpYGojqAitsRIASDdMQQLpsodbzAn8qLnH0+MKRNFOtpH3dq0xz6GHXv5xR/d04
 AejDSYGqxUmobdlfF2OSWPGeCZbcsH6oHZam0QtDtHfL/sph99u5kUEFnv0/3vALqX7Q
 9RtA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, Bruce Wang <bzwang@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKSnVzdCB3YWl0aW5nIGZv
ciBuZXh0IHZibGFuayBpc24ndCBpZGVhbC4uIHdlIHNob3VsZCByZWFsbHkgYmUgbG9va2luZwph
dCB0aGUgaHcgRkxVU0ggcmVnaXN0ZXIgdmFsdWUgdG8ga25vdyBpZiB0aGVyZSBpcyBzdGlsbCBh
biBpbi1wcm9ncmVzcwpmbHVzaCB3aXRob3V0IHN0YWxsaW5nIHVubmVjZXNzYXJpbHkgd2hlbiB0
aGVyZSBpcyBubyBwZW5kaW5nIGZsdXNoLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAY2hyb21pdW0ub3JnPgpSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+Ci0tLQogLi4uL2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfdmlkLmMgIHwg
MjIgKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfZW5jb2Rlcl9waHlzX3ZpZC5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2VuY29kZXJfcGh5c192aWQuYwppbmRleCA3MzdmZTk2M2E0OTAuLjdjNzNiMDk4OTRmMCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5
c192aWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9w
aHlzX3ZpZC5jCkBAIC01MjYsNiArNTI2LDI2IEBAIHN0YXRpYyBpbnQgZHB1X2VuY29kZXJfcGh5
c192aWRfd2FpdF9mb3JfdmJsYW5rKAogCXJldHVybiBfZHB1X2VuY29kZXJfcGh5c192aWRfd2Fp
dF9mb3JfdmJsYW5rKHBoeXNfZW5jLCB0cnVlKTsKIH0KIAorc3RhdGljIGludCBkcHVfZW5jb2Rl
cl9waHlzX3ZpZF93YWl0X2Zvcl9jb21taXRfZG9uZSgKKwkJc3RydWN0IGRwdV9lbmNvZGVyX3Bo
eXMgKnBoeXNfZW5jKQoreworCXN0cnVjdCBkcHVfaHdfY3RsICpod19jdGwgPSBwaHlzX2VuYy0+
aHdfY3RsOworCWludCByZXQ7CisKKwlpZiAoIWh3X2N0bCkKKwkJcmV0dXJuIDA7CisKKwlyZXQg
PSB3YWl0X2V2ZW50X3RpbWVvdXQocGh5c19lbmMtPnBlbmRpbmdfa2lja29mZl93cSwKKwkJKGh3
X2N0bC0+b3BzLmdldF9mbHVzaF9yZWdpc3Rlcihod19jdGwpID09IDApLAorCQltc2Vjc190b19q
aWZmaWVzKDUwKSk7CisJaWYgKHJldCA8PSAwKSB7CisJCURQVV9FUlJPUigidmJsYW5rIHRpbWVv
dXRcbiIpOworCQlyZXR1cm4gLUVUSU1FRE9VVDsKKwl9CisKKwlyZXR1cm4gMDsKK30KKwogc3Rh
dGljIHZvaWQgZHB1X2VuY29kZXJfcGh5c192aWRfcHJlcGFyZV9mb3Jfa2lja29mZigKIAkJc3Ry
dWN0IGRwdV9lbmNvZGVyX3BoeXMgKnBoeXNfZW5jKQogewpAQCAtNjc2LDcgKzY5Niw3IEBAIHN0
YXRpYyB2b2lkIGRwdV9lbmNvZGVyX3BoeXNfdmlkX2luaXRfb3BzKHN0cnVjdCBkcHVfZW5jb2Rl
cl9waHlzX29wcyAqb3BzKQogCW9wcy0+ZGVzdHJveSA9IGRwdV9lbmNvZGVyX3BoeXNfdmlkX2Rl
c3Ryb3k7CiAJb3BzLT5nZXRfaHdfcmVzb3VyY2VzID0gZHB1X2VuY29kZXJfcGh5c192aWRfZ2V0
X2h3X3Jlc291cmNlczsKIAlvcHMtPmNvbnRyb2xfdmJsYW5rX2lycSA9IGRwdV9lbmNvZGVyX3Bo
eXNfdmlkX2NvbnRyb2xfdmJsYW5rX2lycTsKLQlvcHMtPndhaXRfZm9yX2NvbW1pdF9kb25lID0g
ZHB1X2VuY29kZXJfcGh5c192aWRfd2FpdF9mb3JfdmJsYW5rOworCW9wcy0+d2FpdF9mb3JfY29t
bWl0X2RvbmUgPSBkcHVfZW5jb2Rlcl9waHlzX3ZpZF93YWl0X2Zvcl9jb21taXRfZG9uZTsKIAlv
cHMtPndhaXRfZm9yX3ZibGFuayA9IGRwdV9lbmNvZGVyX3BoeXNfdmlkX3dhaXRfZm9yX3ZibGFu
azsKIAlvcHMtPndhaXRfZm9yX3R4X2NvbXBsZXRlID0gZHB1X2VuY29kZXJfcGh5c192aWRfd2Fp
dF9mb3JfdmJsYW5rOwogCW9wcy0+aXJxX2NvbnRyb2wgPSBkcHVfZW5jb2Rlcl9waHlzX3ZpZF9p
cnFfY29udHJvbDsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
