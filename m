Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CAA100276
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1774C89D7D;
	Mon, 18 Nov 2019 10:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B80989D99
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 10:35:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f3so18130583wmc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 02:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AhkaPsj0AZc4cxpsw66OHA8x4RM2P7D88XhUXbMcXWI=;
 b=jPCrvr3Pg62eYarq6Ux26Io+uVnjhfsdlYzWd78/oSq0To/2jKV3MVvZ9mR96hHnni
 GFLHpwAucdRb1Y/OaITIJkCBHxs+9q7/tNHCDJKtDJJifyk1cw8ETIqoJ1989jL7/+gn
 FD6R2c3yPSe12jjfiAxsMAnqGeGqguv4a1Z/Fk7m/8jL52J1x2T+qbydTYhtK0DZIPOX
 D1o8FFT7FGrUlHln3XiBVBGiUMC9LEI3IRbFkKVZT2imMzJX5GMKRRbeQT1eLYnKb+8N
 y/7TH1Ma3iSPMq15XSQGA7uEfLAGUP6x9XdBsV+VTB72AL1Q4q+c9tc+Tfn8SaZuqsVO
 82xw==
X-Gm-Message-State: APjAAAVd8cqWCBKCnIrGcItyTV4zu9i/m6IKr6rV0axtL7NYX56IF20P
 gvXOHLwKnIAD8B6nl88sWC/CNSvdz9M=
X-Google-Smtp-Source: APXvYqwzV5VySiX029oawDVvlHw3cbcAr7+B1TD7kwT/trf+P1BYaeeaWQXA+bbLnPiQXGorBtT9Og==
X-Received: by 2002:a1c:113:: with SMTP id 19mr29871798wmb.42.1574073343669;
 Mon, 18 Nov 2019 02:35:43 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:35:42 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/15] Retire dma_buf_k(un)map
Date: Mon, 18 Nov 2019 11:35:21 +0100
Message-Id: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AhkaPsj0AZc4cxpsw66OHA8x4RM2P7D88XhUXbMcXWI=;
 b=UbXvkbeHskhGcJ/kgHIXh+cemzHXgnnAWQKSQfeTLnfVhm5CAO7YjVV6yRJ3yc9ECA
 XK+M3G1Zj0eWhjra5xEnnShxR+ny0FKvOcJwzTm8c78YJ7Sn9s+DEd7403/jNXpuqeXd
 K4UTLf0e/fgrduIdvdrgPl+I2owvlB7O4GA3o=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKV2F5IGJhY2sgd2hlbiB3ZSBjcmVhdGVkIHRoZSBkbWEtYnVmIHNwZWMgaXQgbWFk
ZSBzZW5zZSB0byBoYXZlIGttYXAvdW5tYXAKaW50ZXJmYWNlcywgc2luY2UgMzJiaXQga2VybmVs
cyB3aXRoIGxpbWl0ZWQgdm1hbGxvYyBzcGFjZSB3ZXJlIHN0aWxsCnJhdGhlciB1YmlxdWl0b3Vz
LiBCdXQgdGhhdCBpZGVhIChsaWtlIG1hbnkgb3RoZXJzKSBuZXZlciBjYXVnaHQgb24sIHdhcwpx
dWlja2x5IHJlcGxhY2VkIGJ5IHZtYXBzIGNvdmVyaW5nIHRoZSBlbnRpcmUgYnVmZmVyIGZvciBh
bGwgcmVhbCB1c2VzLAphbmQgbm93YWRheXMgNjRiaXQga2VybmVscyBydWxlIHRoZSB3b3JsZC4g
Q3VycmVudGx5IG1lcmdlZCB1cHN0cmVhbQpkcml2ZXJzIChhbmQgd2UgaGF2ZSBhIHBpbGUgbm93
KSBkb24ndCBldmVuIGJvdGhlciB0byBrbWFwIGZvciB0aGVpcgpwcml2YXRlIGJ1ZmZlcnMsIG11
Y2ggbGVzcyBmb3IgYW55dGhpbmcgc2hhcmVkLgoKU28gc2luY2UgaXQgd2FzIG5ldmVyIHVzZWQs
IGFuZCB0aGlzIGlkZWEncyB0aW1lIGlzIGNsZWFybHkgb3ZlciwgbGV0J3MKcmVtb3ZlIGl0IGFs
bC4KCk9ubHkgcmVhbCBjaGFuZ2UgSSBoYWQgdG8gZG8gKGFzaWRlIGZyb20gZGVsZXRpbmcgbG90
cyBvZiBkZWFkIGNvZGUpIHdhcwppbiB0aGUgdGVncmEgZHJpdmVyLiBCdXQgZXZlbiB0aGVyZSBJ
IHN1c3BlY3QgdGhlIGRtYS1idWYga21hcCBwYXRoIGhhcwpuZXZlciBiZWVuIHJ1biBpbiBhbmdl
ciBhbnl3aGVyZSwgaXQganVzdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gcHV0IHJlbG9jcwppbnRv
IGEgZG1hLWJ1ZiAoYXMgb3Bwb3NlZCB0byB1c2luZyBhIGRtYS1idWYgZm9yIHRoZSB0YXJnZXQg
YWRkcmVzcyBvZiBhCnJlbG9jKS4KCkNvbW1lbnRzLCByZXZpZXdzIGFuZCB0ZXN0aW5nIHZlcnkg
bXVjaCBhcHByZWNpYXRlZC4KCkNoZWVycywgRGFuaWVsCgpEYW5pZWwgVmV0dGVyICgxNSk6CiAg
ZHJtL3RlZ3JhOiBNYXAgY21kYnVmIG9uY2UgZm9yIHJlbG9jIHByb2Nlc3NpbmcKICBkcm0vdGVn
cmE6IERlbGV0ZSBob3N0MXhfYm9fb3BzLT5rKHVuKW1hcAogIGRybS9pOTE1OiBSZW1vdmUgZG1h
X2J1Zl9rbWFwIHNlbGZ0ZXN0CiAgc3RhZ2luZy9hbmRyb2lkL2lvbjogZGVsZXRlIGRtYV9idWYt
PmttYXAvdW5tYXAgaW1wbGVtZW5hdGlvbgogIGRybS9hcm1hZGE6IERlbGV0ZSBkbWFfYnVmLT5r
KHVuKW1hcCBpbXBsZW1lbmF0aW9uCiAgZHJtL2k5MTU6IERyb3AgZG1hX2J1Zi0+ayh1biltYXAK
ICBkcm0vb21hcGRybTogRHJvcCBkbWFfYnVmLT5rKHVuKW1hcAogIGRybS90ZWdyYTogUmVtb3Zl
IGRtYV9idWYtPmsodW4pbWFwCiAgZG1hLWJ1ZjogRHJvcCBkbWFfYnVmX2sodW4pbWFwCiAgZHJt
L3Ztd2dmeDogRGVsZXRlIG1tYXBpbmcgZnVuY3Rpb25zCiAgbWVkaWEvdmlkZW9idWYyOiBEcm9w
IGRtYV9idWYtPmsodW4pbWFwIHN1cHBvcnQKICBkcm0vdGVlX3NobTogRHJvcCBkbWFfYnVmX2so
dW5tYXApIHN1cHBvcnQKICB4ZW4vZ250ZGV2LWRtYWJ1ZjogRGl0Y2ggZHVtbXkgbWFwIGZ1bmN0
aW9ucwogIHNhbXBsZS92ZmlvLW1kZXYvbWJvY3M6IFJlbW92ZSBkbWFfYnVmX2sodW4pbWFwIHN1
cHBvcnQKICBkbWEtYnVmOiBSZW1vdmUga2VybmVsIG1hcC91bm1hcCBob29rcwoKIGRyaXZlcnMv
ZG1hLWJ1Zi9kbWEtYnVmLmMgICAgICAgICAgICAgICAgICAgICB8ICA2MyArLS0tLS0tLS0tLQog
ZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZ2VtLmMgICAgICAgICAgIHwgIDEyIC0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jICAgIHwgIDM2IC0tLS0t
LS0KIC4uLi9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX2RtYWJ1Zi5jICB8IDEwMSAt
LS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9tb2NrX2Rt
YWJ1Zi5jICB8ICAxNiAtLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtX2RtYWJ1
Zi5jICAgICB8ICAyMSAtLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMgICAgICAgICAg
ICAgICAgICAgfCAgNDAgLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfcHJp
bWUuYyAgICAgICAgIHwgIDMzIC0tLS0tLQogZHJpdmVycy9ncHUvaG9zdDF4L2pvYi5jICAgICAg
ICAgICAgICAgICAgICAgIHwgIDIxICsrLS0KIC4uLi9jb21tb24vdmlkZW9idWYyL3ZpZGVvYnVm
Mi1kbWEtY29udGlnLmMgICB8ICAgOCAtLQogLi4uL21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvdmlk
ZW9idWYyLWRtYS1zZy5jIHwgICA4IC0tCiAuLi4vY29tbW9uL3ZpZGVvYnVmMi92aWRlb2J1ZjIt
dm1hbGxvYy5jICAgICAgfCAgIDggLS0KIGRyaXZlcnMvbWlzYy9mYXN0cnBjLmMgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgOCAtLQogZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbi5j
ICAgICAgICAgICAgIHwgIDE0IC0tLQogZHJpdmVycy90ZWUvdGVlX3NobS5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA2IC0tCiBkcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmMgICAgICAg
ICAgICAgICAgICAgfCAgMjMgLS0tLQogaW5jbHVkZS9saW51eC9kbWEtYnVmLmggICAgICAgICAg
ICAgICAgICAgICAgIHwgIDI3IC0tLS0tCiBpbmNsdWRlL2xpbnV4L2hvc3QxeC5oICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMTMgLS0tCiBzYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuYyAgICAg
ICAgICAgICAgICAgICAgfCAgMTYgLS0tCiAxOSBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCA0NjQgZGVsZXRpb25zKC0pCgotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
