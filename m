Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD834E85DE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 11:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFDE6E1F5;
	Tue, 29 Oct 2019 10:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBBE6E1E9;
 Tue, 29 Oct 2019 10:40:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v9so13050745wrq.5;
 Tue, 29 Oct 2019 03:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jkDL1mtk4AzQ+y5CLhyVn2npxrNGHq369wM8ybzjVW4=;
 b=ZRD/IrvK7pMCtbu9GbDK+Ixk25WkWeAuI3SpSooDW6taFsPZmPpfusGYaEHhiGRWyX
 zm1YhmCfJBH9iZgilOakdt31fumAvSjnIh/SX7Bl1HCknNvWU2gXjFU1wbDWqGZITFZZ
 dGCn9J1fextBeJXbFU4PqfXiyHJ4Gvqf1x0aU0mTOBDQ5YHV1UNqTlEo7AOYx2HXKEcL
 VDw6Rg6XQHpCkxSO1U7szrpBWqEYRN/vUiw9mb2z3nK5Rsnwtyc4RvxtCNXYKnowzFUc
 PBN+Yf+4dq3yQ9Ibd2D6GCuisrRPxILfcGqxyXpiddz+rocVFrvboDZ9yyx1FFLafwYe
 gxFg==
X-Gm-Message-State: APjAAAUCtexWgojEI3W/qldfiB0usfSOE6GyDMgDjKJXzPIvhVtVh7Zu
 zicONz9fvK/ld5xy65WIhrh2xcu4
X-Google-Smtp-Source: APXvYqz5USGXW7Wb6yhaSC619zuxZ40exSexmq0GOfkI0n/uqv8LBxSolD8SLPQ4t+DYgMeAXtuxfg==
X-Received: by 2002:adf:f60a:: with SMTP id t10mr20243394wrp.35.1572345652192; 
 Tue, 29 Oct 2019 03:40:52 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c5d9:7998:9ca6:452])
 by smtp.gmail.com with ESMTPSA id v10sm2910210wmg.48.2019.10.29.03.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 03:40:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: RFC: Unpinned DMA-buf handling
Date: Tue, 29 Oct 2019 11:40:44 +0100
Message-Id: <20191029104049.9011-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jkDL1mtk4AzQ+y5CLhyVn2npxrNGHq369wM8ybzjVW4=;
 b=J5DkpFkoXbTOoUyYyDCKrmmXTbfAZTW/9kDa3UqAKxhWVzQ9cTGO6kFABCVGMEvEAb
 uPjQdqx/A1w8XLLI5AkLAGK3+Im4k3UqPbfT56KhYMTqNAuhCvfZjsoxK+i87sSx7Bz0
 voI+A6lyQiwB2Ag6BmTQLHeRIRSUBM0q1JWih3mDStUl4Jlm+0MyhO8Uo9+05hZI9X9Q
 dvClU4CMH4MGGobq3aLKV8K933oQ37B65RCCyf9FIyYqqRVRGRxobjdQO2QwbZDK1wWi
 MD6IwG0afvIqLwreMx3XTUWlt9W4Z7GfdrLC6BE9dLmsjFivnlWEK2uKDw0G1DnQue2f
 6Q/A==
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

VGhlIGJhc2ljIGlkZWEgc3RheWVkIHRoZSBzYW1lIHNpbmNlIHRoZSBsYXN0IHZlcnNpb24gb2Yg
dGhvc2UgcGF0Y2hlcy4gVGhlIGV4cG9ydGVyIGNhbiBwcm92aWRlIGV4cGxpY2l0IHBpbi91bnBp
biBmdW5jdGlvbnMgYW5kIHRoZSBpbXBvcnRlciBhIG1vdmVfbm90aWZ5IGNhbGxiYWNrLiBUaGlz
IGFsbG93cyB1cyB0byBhdm9pZCBwaW5uaW5nIGJ1ZmZlcnMgd2hpbGUgaW1wb3J0ZXJzIGhhdmUg
YSBtYXBwaW5nIGZvciB0aGVtLgoKSW4gZGlmZmVyZW5jZSB0byB0aGUgbGFzdCB2ZXJzaW9uIHRo
ZSBsb2NraW5nIGNoYW5nZXMgd2VyZSBzZXBhcmF0ZWQgZnJvbSB0aGlzIHBhdGNoc2V0IGFuZCBj
b21taXR0ZWQgdG8gZHJtLW1pc2MtbmV4dC4KClRoaXMgYWxsb3dzIGRyaXZlcnMgdG8gaW1wbGVt
ZW50IHRoZSBuZXcgbG9ja2luZyBzZW1hbnRpY3Mgd2l0aG91dCB0aGUgZXh0cmEgdW5waW5uZWQg
aGFuZGxpbmcsIGJ1dCBvZiBjb3Vyc2UgdGhlIGNoYW5nZWQgbG9ja2luZyBzZW1hbnRpY3MgaXMg
c3RpbGwgYSBwcmVyZXF1aXNpdGUgdG8gdGhlIHVucGlubmVkIGhhbmRsaW5nLgoKVGhlIGxhc3Qg
dGltZSB0aGlzIHNldCB3YXMgc2VuZCBvdXQgdGhlIGRpc2N1c3Npb24gZW5kZWQgYnkgcXVlc3Rp
b25pbmcgaWYgdGhlIG1vdmVfbm90aWZ5IGNhbGxiYWNrIHdhcyByZWFsbHkgdGhlIHJpZ2h0IGFw
cHJvYWNoIG9mIG5vdGlmeWluZyB0aGUgaW1wb3J0ZXJzIHRoYXQgYSBidWZmZXIgaXMgYWJvdXQg
dG8gY2hhbmdlIGl0cyBwbGFjZW1lbnQuIEEgcG9zc2libGUgYWx0ZXJuYXRpdmUgd291bGQgYmUg
dG8gYWRkIGEgc3BlY2lhbCBjcmFmdGVkIGZlbmNlIG9iamVjdCBpbnN0ZWFkLgoKTGV0J3MgZGlz
Y3VzcyBvbiB0aGUgZGlmZmVyZW50IGFwcHJvYWNoZXMgb25jZSBtb3JlLApDaHJpc3RpYW4uCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
