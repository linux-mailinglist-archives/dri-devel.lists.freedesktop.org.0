Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B083A5CD
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C718910A;
	Sun,  9 Jun 2019 12:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BB089E41
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 19:01:00 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id s57so3505368qte.8
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 12:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OVNp7A8pa63b39LGeGO0+BUI6zrsYRO5zNAmwKq0LBc=;
 b=dRdkMALWE54rAZbQtskzKxsOJjnyTZNPiLdbrm9EH6obeEoXIGIfktkV5qRYFhUDiK
 Exem6TWoiDqKfg2lBMOV3c0CC2LfExaW6XpiBIbpoP8JjefQKA/5Kg24bhMf3ukRIUQl
 AvAUU5BDPkCCDNafBdgoi/4sTk+aYIMnfnoWJUjXkhnYcSbZqwbOdr7yoQie6HkqiSxt
 Au8MSvUy5I1CXew83pYhi/BWMgEQWqhs0D6gPQVx418E4vZphEt1Ic2nj+TZoIn67LX3
 GarMe4T/0sGyKLQTlv2DjOiVsNIIjvcpG0HJyxXEQf/wEFuihzlu3LQ0IypwzgSStxw3
 kX9A==
X-Gm-Message-State: APjAAAXOvQd0a0cJzbkAH9tXdjdRIN5QIIvLXPtaKuwhP3WZea9lBurP
 /05pfRuykcNRHPzhve34bGrdKw==
X-Google-Smtp-Source: APXvYqxlT4Fv6qHKjsJBhlVTYAbYfaaK4ThAgs8mGMGlrUUmnDTMg4dBCsAJuivK4cI9z1dGRTwl/w==
X-Received: by 2002:ad4:43c9:: with SMTP id o9mr38403271qvs.113.1559934059944; 
 Fri, 07 Jun 2019 12:00:59 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id r39sm1388147qtc.87.2019.06.07.12.00.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 12:00:59 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: akpm@linux-foundation.org
Subject: [RESEND PATCH] gpu/drm_memory: fix a few warnings
Date: Fri,  7 Jun 2019 15:00:35 -0400
Message-Id: <1559934035-3330-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=OVNp7A8pa63b39LGeGO0+BUI6zrsYRO5zNAmwKq0LBc=;
 b=U0jHKnAOAdAWxUOGDXNsmx5Jm95O6XYUZ7a94ZUt/5xsz86pDwdhT+eiceiklkvv5P
 yipQfcAbQOcAmLgsS5zLM7Es8pJ6apk9uY3gc04yOg4O60xQrvwYFpUz1VHkLabmN8bM
 6leFR6L964sQCVjVUHq2OmG+J49sbtkgeCtc2ncWJE1L2WzEhorDMfnqvXq1xRomEoX2
 0ZNb0OP5Qm/P8b+Vf3nCFi2K6lA1X9WVeAEoF0Y61tRg1umrXIM5sq7MMGmhwWAk+qt2
 6BLDs97on83MP6j8RYITQRD3/j/VTPOtMgDwc7JC1DdzFDRxPHa1SIPQLRR+vjuBNDxN
 f08A==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Qian Cai <cai@lca.pw>, sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9wZW5pbmcgY29tbWVudCBtYXJrICIvKioiIGlzIHJlc2VydmVkIGZvciBrZXJuZWwtZG9j
IGNvbW1lbnRzLCBzbwppdCB3aWxsIGdlbmVyYXRlIGEgd2FybmluZyB3aXRoICJtYWtlIFc9MSIu
Cgpkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jOjI6IHdhcm5pbmc6IENhbm5vdCB1bmRlcnN0
YW5kICAqIFxmaWxlCmRybV9tZW1vcnkuYwoKQWxzbywgc2lsZW5jZSBhIGNoZWNrcGF0Y2ggd2Fy
bmluZyBieSBhZGRpbmcgYSBsaWNlbnNlIGlkZW50Zml0ZXIgd2hlcmUKaXQgaW5kaWNhdGVzIHRo
ZSBNSVQgbGljZW5zZSBmdXJ0aGVyIGRvd24gaW4gdGhlIHNvdXJjZSBmaWxlLgoKV0FSTklORzog
TWlzc2luZyBvciBtYWxmb3JtZWQgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXIgdGFnIGluIGxpbmUg
MQoKU2lnbmVkLW9mZi1ieTogUWlhbiBDYWkgPGNhaUBsY2EucHc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9tZW1vcnkuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tZW1vcnku
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMKaW5kZXggMTMyZmVmOGZmMWI2Li42ODMw
NDJjOGVlMmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYwpAQCAtMSw0ICsxLDUgQEAKLS8qKgorLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVAorLyoKICAqIFxmaWxlIGRybV9tZW1vcnkuYwogICog
TWVtb3J5IG1hbmFnZW1lbnQgd3JhcHBlcnMgZm9yIERSTQogICoKLS0gCjEuOC4zLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
