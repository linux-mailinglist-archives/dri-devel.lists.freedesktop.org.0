Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C4B7D3DF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9B46E352;
	Thu,  1 Aug 2019 03:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615386E354
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:45:14 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id r7so33154155pfl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dQGpl/nhmhJMZKv4Vo2Ohuy0f7yCwYFz4OhCfH7eIeY=;
 b=W6l1Ill2x0GX8qjMrz8UemJBsnBQVaj/xfGN6NRPcuwFIm4O8sNDgjvCPqgaz7QTyT
 Yti4DoA/xE+MhpQUFuSALQgu+eCQCY6cFa3ct44yGCcsnA3qpFf9yUCd2BnmRKUUFPUH
 nxUAvo57bccMjduo1YrhS5e+OkpfKV2xQcy5WJO2s+kTCbdxstTGx2CkwtODpP6GSYvB
 CNrCp5qmqdHe/77Z7zAdY8PeeXFWgOt975qfi//0R8/+MOqRTXYMaVw4rDxJmvECudCm
 TVL80Jk3tPqpfNjvwlmKrE8ACSEz9+DXSuWfx3HvLJrJHZ1r95Db7OhrpiTXfgM2q9yH
 MC4g==
X-Gm-Message-State: APjAAAW/sJ4CMZD1CRbW/Qqvppheb2WqgvihAfKdAdTR+DF4hp4yxINg
 Hg5KejOZjKLj+tOn+ph2O6dG6w==
X-Google-Smtp-Source: APXvYqyE9OksfN4t4uiO+wXMjLvxL1N0wCPPp8i87h6D2b8CP8sDMRKmHanTkkY//Kt3QIQTtMyLOw==
X-Received: by 2002:aa7:93bb:: with SMTP id x27mr52443201pff.10.1564631113669; 
 Wed, 31 Jul 2019 20:45:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.45.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:45:12 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 18/26] drm: kirin: Move config max_width and max_height to
 driver data
Date: Thu,  1 Aug 2019 03:44:31 +0000
Message-Id: <20190801034439.98227-19-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dQGpl/nhmhJMZKv4Vo2Ohuy0f7yCwYFz4OhCfH7eIeY=;
 b=Ml5jZwzgL9rml4OFZjIub8zA/hmbDsOyOb5pgnwxP8CMB7+tMg38nXgrLV9QItM0En
 qKnXPeARSc4hO5vYz3U72ZS+AbG/jki8te5+3Pa36+Hi5RXUTdXBYD+4DT3Lht1i1d9I
 IgweV9STmp3PcjCZXgsTo+4sQj/B5CBB6+Ke8iqJqTokeJMdeN633a0emO7H0aLkXTGr
 Rs1GxKc91yTpK7K8rqrAOot9Lc9/qJal+/7iafr7L03c2VHcbKHxv5l8+Q+byqBX7JXK
 S1l68eVlYRWBEQAMu3OLAuLVld+I8FgFipQTXxzEL7CloNqZ0dbQ9uTV3RX1C/NH6qq2
 CLBg==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggbW92ZXMgdGhlIG1heF93aWR0aAphbmQgbWF4X2hl
aWdodCB2YWx1ZXMgdXNlZCBpbiBraXJpbl9kcm1fbW9kZV9jb25maWdfaW5pdGEgdG8KaGFyZHdh
cmUgc3BlY2lmaWMgZHJpdmVyIGRhdGEuCgpUaGlzIHdpbGwgbWFrZSBpdCBlYXNpZXIgdG8gYWRk
IHN1cHBvcnQgZm9yIG5ldyBkZXZpY2VzCnZpYSBhIG5ldyBraXJpbl9kcm1fZGF0YSBzdHJ1Y3R1
cmUuCgpDYzogUm9uZ3JvbmcgWm91IDx6b3Vyb25ncm9uZ0BnbWFpbC5jb20+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+CkNjOiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYtYnk6IFh1IFlpUGluZyA8eHV5aXBpbmdAaGlz
aWxpY29uLmNvbT4KW2pzdHVsdHo6IHJld29yZGVkIGNvbW1pdCBtZXNzYWdlXQpTaWduZWQtb2Zm
LWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYyB8ICAyICsrCiBkcml2ZXJzL2dw
dS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYyB8IDE3ICsrKysrLS0tLS0tLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuaCB8ICAy
ICsrCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYwppbmRl
eCBmYzBmNGMwNGQxYzkuLjY4ZWZkNTA4ZDg2YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hp
c2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKQEAgLTEwNTQsNiArMTA1NCw4IEBAIHN0cnVj
dCBraXJpbl9kcm1fZGF0YSBhZGVfZHJpdmVyX2RhdGEgPSB7CiAJLnByaW1fcGxhbmUgPSBBREVf
Q0gxLAogCS5jaGFubmVsX2Zvcm1hdHMgPSBjaGFubmVsX2Zvcm1hdHMsCiAJLmNoYW5uZWxfZm9y
bWF0c19jbnQgPSBBUlJBWV9TSVpFKGNoYW5uZWxfZm9ybWF0cyksCisJLmNvbmZpZ19tYXhfd2lk
dGggPSAyMDQ4LAorCS5jb25maWdfbWF4X2hlaWdodCA9IDIwNDgsCiAJLmNydGNfaGVscGVyX2Z1
bmNzID0gJmFkZV9jcnRjX2hlbHBlcl9mdW5jcywKIAkuY3J0Y19mdW5jcyA9ICZhZGVfY3J0Y19m
dW5jcywKIAkucGxhbmVfaGVscGVyX2Z1bmNzID0gJmFkZV9wbGFuZV9oZWxwZXJfZnVuY3MsCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jCmluZGV4
IGJmMWU2MDFmYjM2Ny4uNzk1NmQ2OThkMzY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlz
aWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYwpAQCAtMzksMTcgKzM5LDYgQEAgc3RhdGljIGlu
dCBraXJpbl9kcm1fa21zX2NsZWFudXAoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlyZXR1cm4g
MDsKIH0KIAotc3RhdGljIHZvaWQga2lyaW5fZHJtX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGRy
bV9kZXZpY2UgKmRldikKLXsKLQlkZXYtPm1vZGVfY29uZmlnLm1pbl93aWR0aCA9IDA7Ci0JZGV2
LT5tb2RlX2NvbmZpZy5taW5faGVpZ2h0ID0gMDsKLQotCWRldi0+bW9kZV9jb25maWcubWF4X3dp
ZHRoID0gMjA0ODsKLQlkZXYtPm1vZGVfY29uZmlnLm1heF9oZWlnaHQgPSAyMDQ4OwotCi0JZGV2
LT5tb2RlX2NvbmZpZy5mdW5jcyA9IGRyaXZlcl9kYXRhLT5tb2RlX2NvbmZpZ19mdW5jczsKLX0K
LQogc3RhdGljIGludCBraXJpbl9kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikK
IHsKIAlpbnQgcmV0OwpAQCAtNTgsNyArNDcsMTEgQEAgc3RhdGljIGludCBraXJpbl9kcm1fa21z
X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAogCS8qIGRldi0+bW9kZV9jb25maWcgaW5p
dGlhbGl6YXRpb24gKi8KIAlkcm1fbW9kZV9jb25maWdfaW5pdChkZXYpOwotCWtpcmluX2RybV9t
b2RlX2NvbmZpZ19pbml0KGRldik7CisJZGV2LT5tb2RlX2NvbmZpZy5taW5fd2lkdGggPSAwOwor
CWRldi0+bW9kZV9jb25maWcubWluX2hlaWdodCA9IDA7CisJZGV2LT5tb2RlX2NvbmZpZy5tYXhf
d2lkdGggPSBkcml2ZXJfZGF0YS0+Y29uZmlnX21heF93aWR0aDsKKwlkZXYtPm1vZGVfY29uZmln
Lm1heF9oZWlnaHQgPSBkcml2ZXJfZGF0YS0+Y29uZmlnX21heF93aWR0aDsKKwlkZXYtPm1vZGVf
Y29uZmlnLmZ1bmNzID0gZHJpdmVyX2RhdGEtPm1vZGVfY29uZmlnX2Z1bmNzOwogCiAJLyogZGlz
cGxheSBjb250cm9sbGVyIGluaXQgKi8KIAlyZXQgPSBkcml2ZXJfZGF0YS0+aW5pdCh0b19wbGF0
Zm9ybV9kZXZpY2UoZGV2LT5kZXYpKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNp
bGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9r
aXJpbi9raXJpbl9kcm1fZHJ2LmgKaW5kZXggMmI2NjBkZjYwMjkzLi40M2JlNjVmODJhMDMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5oCkBA
IC0zNyw2ICszNyw4IEBAIHN0cnVjdCBraXJpbl9wbGFuZSB7CiBzdHJ1Y3Qga2lyaW5fZHJtX2Rh
dGEgewogCWNvbnN0IHUzMiAqY2hhbm5lbF9mb3JtYXRzOwogCXUzMiBjaGFubmVsX2Zvcm1hdHNf
Y250OworCWludCBjb25maWdfbWF4X3dpZHRoOworCWludCBjb25maWdfbWF4X2hlaWdodDsKIAl1
MzIgbnVtX3BsYW5lczsKIAl1MzIgcHJpbV9wbGFuZTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
