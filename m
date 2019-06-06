Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0C3809A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 00:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1323C899DB;
	Thu,  6 Jun 2019 22:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC39A899DB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 22:28:01 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id c26so5581265edt.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 15:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2jYTwmO+POOJhTxQ1RaidZH+aZqgLhTZnC2sZyUydQc=;
 b=rgl1yY8hnNO2rbprWishAnEogkSZGtziLrIU3NAzN2wdmmLOYSwblTO59YTTwmP/nP
 gSTRNrSgTll4bSjxfcM3A9DQQLMnwKm49M8httCVqMR4pLeb1dVL+vgGSA3ZRElfk9TQ
 h4TeSDnJ9yDZ55l5CYzjPATMMzyUuvTayt5JMzRaCiL/XeOWkpZXYIaylRgdGllj6m9r
 bXWlC/8z//PzmjcytGAQ1OWU1/cusYfTX9/c3r/G+gbqlbV4KNCiMS+uR5FYmh8Zlftt
 BljDuombBolgp4PBjUzjMhMPBnBPXFGLXp+ERFqXuLUs5kYi+k/ZLLiyfe/tGfuelaGE
 IjCQ==
X-Gm-Message-State: APjAAAV7FmC9KWHMHsyU66ho3H9l/OzbIssVDxOxwWsv9JBEJHkqn7XS
 PqRv2ytFiTMrFnIRu8bTsJmkUVezejc=
X-Google-Smtp-Source: APXvYqwM1/qj7mYhHTCrO2Ta3iedpRlq1/zIefMu4FpDiu5lT4LlhRt8cv2j2hfbmuG3fiYJJV1RWA==
X-Received: by 2002:a50:e612:: with SMTP id y18mr52576253edm.143.1559860079964; 
 Thu, 06 Jun 2019 15:27:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z10sm54228edl.35.2019.06.06.15.27.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:27:59 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/10] drm/vkms: rework crc worker
Date: Fri,  7 Jun 2019 00:27:41 +0200
Message-Id: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2jYTwmO+POOJhTxQ1RaidZH+aZqgLhTZnC2sZyUydQc=;
 b=Seg676epj0Ntn6V+ieat08HJl92LXuNQ0VKDdRjIjTifR1zrLNIrs6iKuZtOEgaeK5
 4600K+yf9gd5ZdSIWXkn+twnbOGzgGnNSg/x6vIWCgvdg8kBxt1SbI97rpLTfcRV4m+N
 KClw7K5R5KMJC8yjW77VKMburlb1Z/7EQTYSQ=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKVGhpcyBoZXJlIGlzIHRoZSBmaXJzdCBwYXJ0IG9mIGEgcmV3b3JrIGZvciB0aGUg
dmttcyBjcmMgd29ya2VyLiBJIHRoaW5rCnRoaXMgc2hvdWxkIGZpeCBhbGwgdGhlIGxvY2tpbmcv
cmFjZXMvdXNlLWFmdGVyLWZyZWUgaXNzdWVzIEkgc3BvdHRlZCBpbgp0aGUgY29kZS4gVGhlcmUn
cyBtb3JlIHdvcmsgd2UgY2FuIGRvIGluIHRoZSBmdXR1cmUgYXMgYSBmb2xsb3ctdXA6CgotIGRp
cmVjdGx5IGFjY2VzcyB2a21zX3BsYW5lX3N0YXRlLT5iYXNlIGluIHRoZSBjcmMgd29ya2VyLCB3
aXRoIHRoaXMKICBhcHByb2FjaCBpbiB0aGlzIHNlcmllcyBoZXJlIHRoYXQgc2hvdWxkIGJlIHNh
ZmUgbm93LiBGb2xsb3ctdXAgcGF0Y2hlcwogIGNvdWxkIHN3aXRjaCBhbmQgcmVtb3ZlIGFsbCB0
aGUgc2VwYXJhdGUgY3JjX2RhdGEgaW5mcmFzdHJ1Y3R1cmUuCgotIEkgdGhpbmsgc29tZSBrZXJu
ZWxkb2MgZm9yIHZrbXMgc3RydWN0dXJlcyB3b3VsZCBiZSBuaWNlLiBEb2N1bWVudGF0aW9uCiAg
dGhlIHZhcmlvdXMgZnVuY3Rpb25zIGlzIHByb2JhYmx5IG92ZXJraWxsLgoKLSBJbXBsZW1lbnRp
bmcgYSBtb3JlIGdlbmVyaWMgYmxlbmRpbmcgZW5naW5lLCBhcyBwcmVwIGZvciBhZGRpbmcgbW9y
ZQogIHBpeGVsIGZvcm1hdHMsIG1vcmUgcGxhbmVzLCBhbmQgbW9yZSBmZWF0dXJlcyBpbiBnZW5l
cmFsLgoKVGVzdGVkIHdpdGgga21zX3BpcGVfY3JjLCBrbXNfZmxpcCBhbmQga21zX2N1cnNvcl9j
cmMuIFNlZW1zIHRvIG5vdCBtYWtlCnRoaW5ncyB3b3JzZSwgYnV0IEkgZGlkbid0IGRvIGEgZnVs
bCBydW4uCgpDaGVlcnMsIERhbmllbAoKRGFuaWVsIFZldHRlciAoMTApOgogIGRybS92a21zOiBG
aXggY3JjIHdvcmtlciByYWNlcwogIGRybS92a21zOiBVc2Ugc3Bpbl9sb2NrX2lycSBpbiBwcm9j
ZXNzIGNvbnRleHQKICBkcm0vdmttczogUmVuYW1lIHZrbXNfb3V0cHV0LnN0YXRlX2xvY2sgdG8g
Y3JjX2xvY2sKICBkcm0vdmttczogTW92ZSBmb3JtYXQgYXJyYXlzIHRvIHZrbXNfcGxhbmUuYwog
IGRybS92a21zOiBBZGQgb3VyIG93biBjb21taXRfdGFpbAogIGRybS92a21zOiBmbHVzaCBjcmMg
d29ya2VycyBlYXJsaWVyIGluIGNvbW1pdCBmbG93CiAgZHJtL3ZrbXM6IERvbnQgZmx1c2ggY3Jj
IHdvcmtlciB3aGVuIHdlIGNoYW5nZSBjcmMgc3RhdHVzCiAgZHJtL3ZrbXM6IE5vIF9pcnFzYXZl
IHdpdGhpbiBzcGluX2xvY2tfaXJxIG5lZWRlZAogIGRybS92a21zOiB0b3RhbGx5IHJld29ya2Vk
IGNyYyBkYXRhIHRyYWNraW5nCiAgZHJtL3ZrbXM6IE5vIG5lZWQgZm9yIC0+cGFnZXNfbG9jayBp
biBjcmMgd29yayBhbnltb3JlCgogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYyAgIHwg
NzQgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmtt
c19jcnRjLmMgIHwgODAgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogZHJpdmVycy9n
cHUvZHJtL3ZrbXMvdmttc19kcnYuYyAgIHwgMzUgKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1
L2RybS92a21zL3ZrbXNfZHJ2LmggICB8IDI0ICsrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92
a21zL3ZrbXNfcGxhbmUuYyB8ICA4ICsrKysKIDUgZmlsZXMgY2hhbmdlZCwgMTQ2IGluc2VydGlv
bnMoKyksIDc1IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
