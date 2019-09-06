Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA519AC224
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 23:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8CA6E144;
	Fri,  6 Sep 2019 21:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B74D6E144;
 Fri,  6 Sep 2019 21:46:34 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id r12so5471621pfh.1;
 Fri, 06 Sep 2019 14:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+UKEokhysiEjhebMkmydc3Xut+rkxm/820z0jqk+pw=;
 b=ixKDv+/KlO0YS8k0dsnIzDKg+8sMmzL6C26nnElP3FDETd75j2+sZayKBEusdUsbYT
 XsFpbkB7+6ax1GL3J8PrlGI3OshDiJKdD7e/Wu76zhIznlA+FQsUJUQxX4PXTXwBUY8d
 lQEW5r9KgkcP0YLejOUL4I02KwIIqBohZmRYXDJMVbSALxh1pT4Byudltxc83sVZGqca
 04md0trajdXtPYcdS3MupgF/gBTgKMdyBUOUbbLSBbHPZB1nBo/52tvtiNOg4LDkXo4d
 mIOSBhE7tGpvYo34mc2sHIM1TTZ8NNHQrCKhOImO5wT18TahBsvSdunoXrWB56h8wEWl
 nwQw==
X-Gm-Message-State: APjAAAU1dw+0vMtBhvKldYZGbOJZAcPmFCsuJkiSBzW6O8n10s1WSHjg
 04i8TeC+8W7caW8Ac00jyho=
X-Google-Smtp-Source: APXvYqxAQm+A/TufbfRwRtbAOXBB+uXmA4OqTTf7BWWv93xs12KzKxBrIOgomoXlI9U4Nb+Q86U1eg==
X-Received: by 2002:a17:90a:bf0a:: with SMTP id
 c10mr11992578pjs.78.1567806393371; 
 Fri, 06 Sep 2019 14:46:33 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id 74sm13108243pfy.78.2019.09.06.14.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 14:46:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v3 0/2] iommu: handle drivers that manage iommu directly
Date: Fri,  6 Sep 2019 14:44:00 -0700
Message-Id: <20190906214409.26677-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+UKEokhysiEjhebMkmydc3Xut+rkxm/820z0jqk+pw=;
 b=bB+2a2042/w5fLDKgGxSCU63OZJdemRj5lstmeKzyz2kKsymPU9qKVPAWAO5XqEpoX
 NQjWZboO1Xqc9cYWPK+zS0a3/dsBVhTx70hSi7CyLwAMb2LXE/egWyxML/yi+G4vilyP
 nAL/lrr66lcMxFh/V1lf0zajAvVc9b7txxr2NelsFwTbWER/5mfQ/zuuL5HzZO9fMRnn
 jGNd8gO46slJn5TOTEht06yzy1gkw82s82dF+024ICCWEH7H3wPEZO1EkRhjI8sD8ae+
 z38HpfgWvwwlmJc+rBx98Ea9ZmRte4k86rNSkO4ohCvZ0gLKR42divMBeZ74wTyoYj5y
 FgEw==
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-msm@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bruce Wang <bzwang@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Allison Randal <allison@lohutok.net>,
 Boris Brezillon <bbrezillon@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKT25lIG9mIHRoZSBjaGFs
bGVuZ2VzIHdlIGhhdmUgdG8gZW5hYmxlIHRoZSBhYXJjaDY0IGxhcHRvcHMgdXBzdHJlYW0KaXMg
ZGVhbGluZyB3aXRoIHRoZSBmYWN0IHRoYXQgdGhlIGJvb3Rsb2FkZXIgZW5hYmxlcyB0aGUgZGlz
cGxheSBhbmQKdGFrZXMgdGhlIGNvcnJlc3BvbmRpbmcgU01NVSBjb250ZXh0LWJhbmsgb3V0IG9m
IEJZUEFTUy4gIFVuZm9ydHVuYXRlbHksCmN1cnJlbnRseSwgdGhlIElPTU1VIGZyYW1ld29yayBh
dHRhY2hlcyBhIERNQSAob3IgcG90ZW50aWFsbHkgYW4KSURFTlRJVFkpIGRvbWFpbiBiZWZvcmUg
dGhlIGRyaXZlciBpcyBwcm9iZWQgYW5kIGhhcyBhIGNoYW5jZSB0bwppbnRlcnZlbmUgYW5kIHNo
dXRkb3duIHNjYW5vdXQuICBXaGljaCBtYWtlcyB0aGluZ3MgZ28gaG9ycmlibHkgd3JvbmcuCgpC
dXQgaW4gdGhpcyBjYXNlLCBkcm0vbXNtIGlzIGFscmVhZHkgZGlyZWN0bHkgbWFuYWdpbmcgaXQn
cyBJT01NVXMKZGlyZWN0bHksIHRoZSBETUEgQVBJIGF0dGFjaGVkIGlvbW11X2RvbWFpbiBzaW1w
bHkgZ2V0cyBpbiB0aGUgd2F5LgpUaGlzIHNlcmllcyBhZGRzIGEgd2F5IHRoYXQgYSBkcml2ZXIg
Y2FuIGluZGljYXRlIHRvIGRyaXZlcnMvaW9tbXUKdGhhdCBpdCBkb2VzIG5vdCB3aXNoIHRvIGhh
dmUgYW4gRE1BIG1hbmFnZWQgaW9tbXVfZG9tYWluIGF0dGFjaGVkLgpUaGlzIHdheSwgZHJtL21z
bSBjYW4gc2h1dCBkb3duIHNjYW5vdXQgY2xlYW5seSBiZWZvcmUgYXR0YWNoaW5nIGl0J3MKb3du
IGlvbW11X2RvbWFpbi4KCk5PVEUgdGhhdCB0byBnZXQgdGhpbmdzIHdvcmtpbmcgd2l0aCBhcm0t
c21tdSBvbiB0aGUgYWFyY2g2NCBsYXB0b3BzLAp5b3UgYWxzbyBuZWVkIGEgcGF0Y2hzZXRbMV0g
ZnJvbSBCam9ybiBBbmRlcnNzb24gdG8gaW5oZXJpdCBTTU1VIGNvbmZpZwphdCBib290LCB3aGVu
IGl0IGlzIGFscmVhZHkgZW5hYmxlZC4KClsxXSBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0
cy9hcm0ta2VybmVsL21zZzczMjI0Ni5odG1sCgpOT1RFIHRoYXQgaW4gZGlzY3Vzc2lvbiBvZiBw
cmV2aW91cyByZXZpc2lvbnMsIFJNUlIgY2FtZSB1cC4gIFRoaXMgaXMKbm90IHJlYWxseSBhIHJl
cGxhY2VtZW50IGZvciBSTVJSIChub3IgZG9lcyBSTVJSIHJlYWxseSBwcm92aWRlIGFueQptb3Jl
IGluZm9ybWF0aW9uIHRoYW4gd2UgYWxyZWFkeSBnZXQgZnJvbSBFRkkgR09QLCBvciBEVCBpbiB0
aGUKc2ltcGxlZmIgY2FzZSkuICBJIGFsc28gZG9uJ3Qgc2VlIGhvdyBSTVJSIGNvdWxkIGhlbHAg
dy8gU01NVSBoYW5kb3ZlcgpvZiBDQi9TTVIgY29uZmlnIChCam9ybidzIHBhdGNoc2V0WzFdKSB3
aXRob3V0IGRlZmluaW5nIG5ldyB0YWJsZXMuCgpUaGlzIHBlcmhhcHMgZG9lc24ndCBzb2x2ZSB0
aGUgbW9yZSBnZW5lcmFsIGNhc2Ugb2YgYm9vdGxvYWRlciBlbmFibGVkCmRpc3BsYXkgZm9yIGRy
aXZlcnMgdGhhdCBhY3R1YWxseSB3YW50IHRvIHVzZSBETUEgQVBJIG1hbmFnZWQgSU9NTVUuCkJ1
dCBpdCBkb2VzIGFsc28gaGFwcGVuIHRvIGF2b2lkIGEgcmVsYXRlZCBwcm9ibGVtIHdpdGggR1BV
LCBjYXVzZWQgYnkKdGhlIERNQSBkb21haW4gY2xhaW1pbmcgdGhlIGNvbnRleHQgYmFuayB0aGF0
IHRoZSBHUFUgZmlybXdhcmUgZXhwZWN0cwp0byB1c2UuICBBbmQgaXQgYXZvaWRzIHNwdXJpb3Vz
IFRMQiBpbnZhbGlkYXRpb24gY29taW5nIGZyb20gdGhlIHVudXNlZApETUEgZG9tYWluLiAgU28g
SU1ITyB0aGlzIGlzIGEgdXNlZnVsIGFuZCBuZWNlc3NhcnkgY2hhbmdlLgoKUm9iIENsYXJrICgy
KToKICBpb21tdTogYWRkIHN1cHBvcnQgZm9yIGRyaXZlcnMgdGhhdCBtYW5hZ2UgaW9tbXUgZXhw
bGljaXRseQogIGRybS9tc206IG1hcmsgZGV2aWNlcyB3aGVyZSBpb21tdSBpcyBtYW5hZ2VkIGJ5
IGRyaXZlcgoKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19kZXZpY2UuYyB8IDEg
KwogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jICAgIHwgMSArCiBkcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jICAgfCAxICsKIGRyaXZlcnMvZ3B1
L2RybS9tc20vbXNtX2Rydi5jICAgICAgICAgICAgICB8IDEgKwogZHJpdmVycy9pb21tdS9pb21t
dS5jICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9pb21tdS9vZl9pb21tdS5j
ICAgICAgICAgICAgICAgICAgIHwgMyArKysKIGluY2x1ZGUvbGludXgvZGV2aWNlLmggICAgICAg
ICAgICAgICAgICAgICB8IDMgKystCiA3IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
