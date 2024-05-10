Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BCE8C28CA
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 18:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B8B10EE67;
	Fri, 10 May 2024 16:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Q+a+yv2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4717E10EE67
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 16:34:53 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-de60a51fe21so2226926276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715358892; x=1715963692;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IHHqDtiCkatsKgdj63sf7SQ+2VzGUBrJ2mrjyUwXVOM=;
 b=Q+a+yv2U4RLbZ7zC85BzQPnpmk5fILDkQ0mQgRcixrUkVM+Rj+T0krHdoOw1U10Opu
 A66tibk0uIb0CLYJtmZkreOCg5ybX98hvxkk0tt85ZTwaKpAty2nbZW7uQ3mMyxq4Rjx
 oKf/ynG7aGZ/Rxf5CEeKqqhn0aO6QSxvf/hck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715358892; x=1715963692;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IHHqDtiCkatsKgdj63sf7SQ+2VzGUBrJ2mrjyUwXVOM=;
 b=tZYHL7vK49PfKuDI62yL2mOteiADmSLmhEwA+qdKEoYpi6iDZCb6E6Rdg7lJaFab/4
 Vmhwrpl519UFt4hY9uhz+/70vsosuhsnIMXWVb5F2hlhTUzWOCQ+3gMMEHHOwa93aXT9
 23o5bLjpS6Kh4RwCcx9p7jfxhoeSeEUeLEphhRNwLZjBz80dmsNayL12Bucf4JbgY6Pf
 qVB/5vqoedu1li7IR5aw2lorPD5T3bunv8zWZxZj+raZpJ6uml3Qa+q+d07CaL+dcOBj
 i9Xra1Ksps6tXgnpJnBC2mzlcU0UQkX7R1CK2CpGGraIi1fyq1fCB0O33iglVQrqzUmT
 xIuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUszucU+rrWLHTArvuq9g4GoGWxFAQ6Ry/cV284KRTMAy4e7BOGv3gnIHrX0KBcwcVDLTUdO+35r8XkDIc9bhLXSMIjTo2bB1BFHC+mIloP
X-Gm-Message-State: AOJu0Yy6Iaf6pxmK3q1vFg0WcR4Pry/4fQcZ6xBvABoP5hrfwOFx9YxL
 0LbBb+LUWdeGH9yl8W9d3yz/VpBwPD4cxeC0Vxn95J5lFZTijer5Sq2fA0J3swHfrhXPVFamnin
 AYX/gHU6VNBk09tUI5fCsFZydyQYg1kqgT9fH
X-Google-Smtp-Source: AGHT+IE+ig33kbujI/J4u7mgcfaXMuH0tHAYXDJzhzua/KJnGVDMyCiDpyiJuEkubu6IUwOYwAhCaoYJUC6sDBPT754=
X-Received: by 2002:a05:6902:1ac7:b0:dca:a3e8:a25a with SMTP id
 3f1490d57ef6-dee4f50c1f2mr3777009276.62.1715358892079; Fri, 10 May 2024
 09:34:52 -0700 (PDT)
MIME-Version: 1.0
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 10 May 2024 12:34:41 -0400
Message-ID: <CABQX2QMVfsZZrHLktZ=MhJ5gG1ATRuSGa+E-CKfXATgU5BwMwQ@mail.gmail.com>
Subject: dma-buf sg mangling
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

so this is a bit of a silly problem but I'd still like to solve it
properly. The tldr is that virtualized drivers abuse
drm_driver::gem_prime_import_sg_table (at least vmwgfx and xen do,
virtgpu and xen punt on it) because there doesn't seem to be a
universally supported way of converting the sg_table back to a list of
pages without some form of gart to do it.

drm_prime_sg_to_page_array is deprecated (for all the right reasons on
actual hardware) but in our cooky virtualized world we don't have
gart's so what are we supposed to do with the dma_addr_t from the
imported sg_table? What makes it worse (and definitely breaks xen) is
that with CONFIG_DMABUF_DEBUG the sg page_link is mangled via
mangle_sg_table so drm_prime_sg_to_page_array won't even work.

The reason why I'm saying it's a bit of a silly problem is that afaik
currently it only affects IGT testing with vgem (because the rest of
external gem objects will be from the virtualized gpu itself which is
different). But do you have any ideas on what we'd like to do with
this long term? i.e. we have a virtualized gpus without iommu, we have
sg_table with some memory and we'd like to import it. Do we just
assume that the sg_table on those configs will always reference cpu
accessible memory (i.e. if it's external it only comes through
drm_gem_shmem_object) and just do some horrific abomination like:
for (i = 0; i < bo->ttm->num_pages; ++i) {
    phys_addr_t pa = dma_to_phys(vmw->drm.dev, bo->ttm->dma_address[i]);
    pages[i] = pfn_to_page(PHYS_PFN(pa));
}
or add a "i know this is cpu accessible, please demangle" flag to
drm_prime_sg_to_page_array or try to have some kind of more permanent
solution?

z
