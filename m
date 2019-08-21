Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CC797965
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 14:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17046E30B;
	Wed, 21 Aug 2019 12:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BEB6E30B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 12:31:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id m125so1956688wmm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 05:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3S5TS4XBx1mfIFrnN6gmTUYzjNlq08rA3aAzZmGTXEQ=;
 b=l75YDv6QVXD5Y0JBPYFNQFrlBd0bOijevrhbv9HQhjSnIRqzeSKBe4W/x7dSInQtyk
 BApORQhztJLltKjUUtNFSGtTJhmvOFAQSpKzMoOrsxnKJJGAHioR5PgrYo4LV8zJgd1Y
 mxLxJbXlldPQe3Flx9suzMAB0+9uk/FsBWNtDk29sREmHdlEasufauSZemGbtpiNbsg2
 ZZ6TPOQ7gS9sdxUq3Yrox9jp9VCp+prV+EzS7IA1vJ9eJcJ9ojRidVoMKE3al0A8JXEw
 6Lwkt867MvrNl4eGJlpaMvJ8dsDXWU9XiU1xwuyXJv1MyiFIyQhaoGz/Uv9A/OShnWVt
 OBHg==
X-Gm-Message-State: APjAAAVnwIScIc/oFdHCdNYx2MuMNFhDnWsAmq4gHvm23SXAvqJ9z/Cq
 od4IjfKKgrIjKQ7hjXNw7h/RgU7W
X-Google-Smtp-Source: APXvYqwi9lBmQWxnD8F63h+EmsrmrZ/1OYywUasQane7UOn3NIneCxEUK9tkCqql5egIVLWNpvtq6Q==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr5751122wmd.22.1566390709459;
 Wed, 21 Aug 2019 05:31:49 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
 by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:31:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [RFC] replacing dma_resv API
Date: Wed, 21 Aug 2019 14:31:37 +0200
Message-Id: <20190821123147.110736-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3S5TS4XBx1mfIFrnN6gmTUYzjNlq08rA3aAzZmGTXEQ=;
 b=tcsqht3pngKKEk8n1K8A0y0PcYxWSB/hYGI7R+q48OM+kK+cZthSoXERhldmFEee/b
 7yINAr2ifF3OPw+h6sAKnGjN7Zv+Zedc7JW2huPtytXMY/9j7mTFmwbmAxWjNkg5FK/j
 e50bAoyw6eRACZ4HgaEv5RKKABKIRpNYX9KfMEgQZfpfy3KtXCBnlBPRlJ3ByVuXVzq/
 Ft5khJpeZZR4+Vl0xk2YknpIQmU9uiJmfGvKNC8poQ3dMOWsONoOs8rT0T/Egqvaanyl
 toC6SlJjTLhhf3TkL79no9OaPYAAsgr6NkgA2OwOVC/mpTpnqMBABkqBxjVDhE3U0HZ6
 UtEg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgZXZlcnlvbmUsCgpJbiBwcmV2aW91cyBkaXNjdXNzaW9uIGl0IHN1cmZhY2VkIHRoYXQgZGlm
ZmVyZW50IGRyaXZlcnMgdXNlIHRoZSBzaGFyZWQgYW5kIGV4cGxpY2l0IGZlbmNlcyBpbiB0aGUg
ZG1hX3Jlc3Ygb2JqZWN0IHdpdGggZGlmZmVyZW50IG1lYW5pbmdzLgoKVGhpcyBpcyBwcm9ibGVt
YXRpYyB3aGVuIHdlIHNoYXJlIGJ1ZmZlcnMgYmV0d2VlbiB0aG9zZSBkcml2ZXJzIGFuZCByZXF1
aXJlbWVudHMgZm9yIGltcGxpY2l0IGFuZCBleHBsaWNpdCBzeW5jaHJvbml6YXRpb24gbGVhZGVk
IHRvIHF1aXRlIGEgbnVtYmVyIG9mIHdvcmthcm91bmRzIHJlbGF0ZWQgdG8gdGhpcy4KClNvIEkg
c3RhcnRlZCBhbiBlZmZvcnQgdG8gZ2V0IGFsbCBkcml2ZXJzIGJhY2sgdG8gYSBjb21tb24gdW5k
ZXJzdGFuZGluZyBvZiB3aGF0IHRoZSBmZW5jZXMgaW4gdGhlIGRtYV9yZXN2IG9iamVjdCBtZWFu
IGFuZCBiZSBhYmxlIHRvIHVzZSB0aGUgb2JqZWN0IGZvciBkaWZmZXJlbnQga2luZCBvZiB3b3Jr
bG9hZHMgaW5kZXBlbmRlbnQgb2YgdGhlIGNsYXNzaWMgRFJNIGNvbW1hbmQgc3VibWlzc2lvbiBp
bnRlcmZhY2UuCgpUaGUgcmVzdWx0IGlzIHRoaXMgcGF0Y2ggc2V0IHdoaWNoIG1vZGlmaWVzIHRo
ZSBkbWFfcmVzdiBBUEkgdG8gZ2V0IGF3YXkgZnJvbSBhIHNpbmdsZSBleHBsaWNpdCBmZW5jZSBh
bmQgbXVsdGlwbGUgc2hhcmVkIGZlbmNlcywgdG93YXJkcyBhIG5vdGF0aW9uIHdoZXJlIHdlIGhh
dmUgZXhwbGljaXQgY2F0ZWdvcmllcyBmb3Igd3JpdGVycywgcmVhZGVycyBhbmQgb3RoZXJzLgoK
VG8gZG8gdGhpcyBJIGNhbWUgdXAgd2l0aCBhIG5ldyBjb250YWluZXIgY2FsbGVkIGRtYV9yZXN2
X2ZlbmNlcyB3aGljaCBjYW4gc3RvcmUgYm90aCBhIHNpbmdsZSBmZW5jZSBhcyB3ZWxsIGFzIG11
bHRpcGxlIGZlbmNlcyBpbiBhIGRtYV9mZW5jZV9hcnJheS4KClRoaXMgdHVybmVkIG91dCB0byBh
Y3R1YWxseSBiZSBldmVuIGJlIHF1aXRlIGEgYml0IHNpbXBsZXIsIHNpbmNlIHdlIGRvbid0IG5l
ZWQgYW55IGNvbXBsaWNhdGVkIGRhbmNlIGJldHdlZW4gUkNVIGFuZCBzZXF1ZW5jZSBjb3VudCBw
cm90ZWN0ZWQgdXBkYXRlcyBhbnkgbW9yZS4KCkluc3RlYWQgd2UgY2FuIGp1c3QgZ3JhYiBhIHJl
ZmVyZW5jZSB0byB0aGUgZG1hX2ZlbmNlX2FycmF5IHVuZGVyIFJDVSBhbmQgc28ga2VlcCB0aGUg
Y3VycmVudCBzdGF0ZSBvZiBzeW5jaHJvbml6YXRpb24gYWxpdmUgdW50aWwgd2UgYXJlIGRvbmUg
d2l0aCBpdC4KClRoaXMgcmVzdWx0cyBpbiBib3RoIGEgc21hbGwgcGVyZm9ybWFuY2UgaW1wcm92
ZW1lbnQgc2luY2Ugd2UgZG9uJ3QgbmVlZCBzbyBtYW55IGJhcnJpZXJzIGFueSBtb3JlLCBhcyB3
ZWxsIGFzIGZld2VyIGxpbmVzIG9mIGNvZGUgaW4gdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbi4K
ClBsZWFzZSByZXZpZXcgYW5kL29yIGNvbW1lbnQsCkNocmlzdGlhbi4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
