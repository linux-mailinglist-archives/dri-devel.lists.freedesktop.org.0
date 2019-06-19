Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A34C0C7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 20:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494A16E44D;
	Wed, 19 Jun 2019 18:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9863B6E44D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 18:30:37 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so199293qtk.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 11:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4gzJvScYbe1M/+8mCDOtHR+/SWJRr+XOZ/AYj1I9+l4=;
 b=cIIOFyYI6+zkng8NNd1aq8evhJ1B+A1MhzIAaxgdiDuuklDtjhKbyW4uJMIcgripxc
 IF+10W00WxmmlGt1O/zNKz55DkkRg2a48ErBHguzY9esvJNf9kjVRbomZpGpK8g692BM
 983447C3OwlGsC++idPMHZmooDftSFlTycA20eUiHtR23W9ev2ThvYT4+i4iKfPgzBvz
 uSe6BZJO4mqxSekX8GKxcr6qY15b70PEl3RAvKfq/ODpNpI2KSlkzcwNSwcApTZHMrId
 pDwZIUNwi9WmhJ4SSoxOhM4Fxl8o6spB27a8pfvtSxf+x1P5B+DDnGUUTxyIYUEGXWWX
 PQHg==
X-Gm-Message-State: APjAAAXGkTDrS62iGdPculsCJ6Pk37Javu0QKD4QtInd++/RDpnqklSe
 uOADB13RlfqvgMVBG1hZg5zIRAte/40=
X-Google-Smtp-Source: APXvYqwaz1xjNB0IYlL5cDTrUcW0FHYiU9CsRfRI0grksCGV6T2EmWhVga4Edqj4GvOI+HXKA8lKXg==
X-Received: by 2002:a0c:d11c:: with SMTP id a28mr16711165qvh.180.1560969036388; 
 Wed, 19 Jun 2019 11:30:36 -0700 (PDT)
Received: from andres-vr.valvesoftware.com (135-23-65-40.cpe.pppoe.ca.
 [135.23.65.40])
 by smtp.gmail.com with ESMTPSA id g10sm9674378qkk.91.2019.06.19.11.30.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 11:30:35 -0700 (PDT)
From: Andres Rodriguez <andresx7@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: use for_each_displayid_db where applicable
Date: Wed, 19 Jun 2019 14:30:33 -0400
Message-Id: <20190619183033.6922-1-andresx7@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4gzJvScYbe1M/+8mCDOtHR+/SWJRr+XOZ/AYj1I9+l4=;
 b=vEJ5n6D2nKkadJeGNuy1on1CaflFH0Ij9ihU1rwiipiLv3n5dq6PC6uOFTzxZp0u+0
 ycsdyZC7MjAUqN6sFoF2/hKHwcDBtCmw1ltnSmkG6cl5oIMtv7eESG/fxaY7rneDt5QY
 ydFgEfkpud2+AHeHABp733EHRxnNLJtGsc9SeMjQGFUz+yBccO611pxMPUDEtcYngdin
 w8soARtfMV5ZRR2Oevc1Oro4GBDdUMlbVmWce5EvXYDQpZ/NeOwwPs97WF87+AOO8y+A
 BkUN2emXyJoDgWJk6kxq1kCFnoL80GQ689ytmuI93Xlk8jZgm61HW2DyBJtck4k0+YGc
 5koA==
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
Cc: Dave Airlie <airlied@redhat.com>, Andres Rodriguez <andresx7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSB0aGUgZHVwbGljYXRlZCB2ZXJzaW9ucyBvZiB0aGUgd2hpbGUgbG9vcCB3aXRoIHRo
ZSBuZXcgbWFjcm8uCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXMgUm9kcmlndWV6IDxhbmRyZXN4N0Bn
bWFpbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgotLS0KClRoaXMg
cGF0Y2ggZGVwZW5kcyBvbiAiZHJtL2VkaWQ6IHBhcnNlIENFQSBibG9ja3MgZW1iZWRkZWQgaW4g
RGlzcGxheUlEIgoKSSBkaWRuJ3Qgc2VuZCB0aGVtIHRvZ2V0aGVyIHRvIGF2b2lkIGdyb3VwaW5n
IHRoZSBwb3J0aW9uIHRoYXQKd2FzIGNjOnN0YWJsZSBhbmQgdGhlICJ0b3VjaCB1cHMiIGludG8g
dGhlIHNhbWUgc2VyaWVzLgoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgMTIgKystLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jCmluZGV4IGE0ZTNmNmIyMmRiYi4uNWZmMDQ2MTc1NDc4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYwpAQCAtNDczMCwxMSArNDczMCw3IEBAIHN0YXRpYyBpbnQgYWRkX2Rpc3BsYXlpZF9kZXRh
aWxlZF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCQlyZXR1cm4gMDsK
IAogCWlkeCArPSBzaXplb2Yoc3RydWN0IGRpc3BsYXlpZF9oZHIpOwotCXdoaWxlIChibG9jayA9
IChzdHJ1Y3QgZGlzcGxheWlkX2Jsb2NrICopJmRpc3BsYXlpZFtpZHhdLAotCSAgICAgICBpZHgg
KyBzaXplb2Yoc3RydWN0IGRpc3BsYXlpZF9ibG9jaykgPD0gbGVuZ3RoICYmCi0JICAgICAgIGlk
eCArIHNpemVvZihzdHJ1Y3QgZGlzcGxheWlkX2Jsb2NrKSArIGJsb2NrLT5udW1fYnl0ZXMgPD0g
bGVuZ3RoICYmCi0JICAgICAgIGJsb2NrLT5udW1fYnl0ZXMgPiAwKSB7Ci0JCWlkeCArPSBibG9j
ay0+bnVtX2J5dGVzICsgc2l6ZW9mKHN0cnVjdCBkaXNwbGF5aWRfYmxvY2spOworCWZvcl9lYWNo
X2Rpc3BsYXlpZF9kYihkaXNwbGF5aWQsIGJsb2NrLCBpZHgsIGxlbmd0aCkgewogCQlzd2l0Y2gg
KGJsb2NrLT50YWcpIHsKIAkJY2FzZSBEQVRBX0JMT0NLX1RZUEVfMV9ERVRBSUxFRF9USU1JTkc6
CiAJCQludW1fbW9kZXMgKz0gYWRkX2Rpc3BsYXlpZF9kZXRhaWxlZF8xX21vZGVzKGNvbm5lY3Rv
ciwgYmxvY2spOwpAQCAtNTI3OSwxMSArNTI3NSw3IEBAIHN0YXRpYyBpbnQgZHJtX3BhcnNlX2Rp
c3BsYXlfaWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAkJcmV0dXJuIHJldDsK
IAogCWlkeCArPSBzaXplb2Yoc3RydWN0IGRpc3BsYXlpZF9oZHIpOwotCXdoaWxlIChibG9jayA9
IChzdHJ1Y3QgZGlzcGxheWlkX2Jsb2NrICopJmRpc3BsYXlpZFtpZHhdLAotCSAgICAgICBpZHgg
KyBzaXplb2Yoc3RydWN0IGRpc3BsYXlpZF9ibG9jaykgPD0gbGVuZ3RoICYmCi0JICAgICAgIGlk
eCArIHNpemVvZihzdHJ1Y3QgZGlzcGxheWlkX2Jsb2NrKSArIGJsb2NrLT5udW1fYnl0ZXMgPD0g
bGVuZ3RoICYmCi0JICAgICAgIGJsb2NrLT5udW1fYnl0ZXMgPiAwKSB7Ci0JCWlkeCArPSBibG9j
ay0+bnVtX2J5dGVzICsgc2l6ZW9mKHN0cnVjdCBkaXNwbGF5aWRfYmxvY2spOworCWZvcl9lYWNo
X2Rpc3BsYXlpZF9kYihkaXNwbGF5aWQsIGJsb2NrLCBpZHgsIGxlbmd0aCkgewogCQlEUk1fREVC
VUdfS01TKCJibG9jayBpZCAweCV4LCByZXYgJWQsIGxlbiAlZFxuIiwKIAkJCSAgICAgIGJsb2Nr
LT50YWcsIGJsb2NrLT5yZXYsIGJsb2NrLT5udW1fYnl0ZXMpOwogCi0tIAoyLjE5LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
