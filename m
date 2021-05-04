Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D22B372AF4
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BF46E442;
	Tue,  4 May 2021 13:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8896E442
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:33 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id c22so10429955edn.7
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wf1i16SGpYpHFr3sau5az1hq2guIhKZO5enw/D8idKk=;
 b=Zz44CrFWBlNudGUqzv3zRk7AAHHOFbx7oLQompmEJ4vfhRHgyZ81rECURLFUvirb6k
 ax6gvLE4aX/MyL0zYswQi0gZuNTJ++bR54HWP3WSnnQGcGYfJBB30ZZ3dJAa1eU0sk2e
 f47Tsa6m1yThNslOy9SIaIy9q5HudcfaVS/8bA4eSaaP34hZ+0Q8fjZHCZxBuN7cN9rm
 bkVecqN76RTWPsSVSANA4pOL+ukBND4cfA4kZxixB17Kn1qafdtb2iYu7N48mROP8xqt
 RwRZWJ0hljDnAE3M6d3W1HqGCKvJpG9v4DinhCLQ0vllTFkzPTeVhacddLgjuPl5Elbn
 oh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wf1i16SGpYpHFr3sau5az1hq2guIhKZO5enw/D8idKk=;
 b=Of6YD9U9cOyLKeUGQEc5Mk6hB/XVunGimSzJ7U9RFfrl3SvaPWKSBOMtwQbd9ySVr4
 nCta1GRKanLWeKabdGJ5O5LTIBpIIq5HumFXCBahwVOzx3rCYqrhJ/z4avCJBT67nwdw
 pgTaakiT8kzS/h0E+FoWTApW2sBZaV9j/JsHSmkqcc8R3sE/ue7SrZIZ7IhKvWyCxzQ4
 F3Mg5VgEwy/eQegg4HTlpSH6kAEehzyPBNiEjSEfrdjmPSa7JVcnMUmCxdYQ6n3G5GXM
 Qz6A1GIHzPN725L0Bv2XkuMdEG4zj1Dq6YRlOzuIZH55g8x58Kf81DOQy5Kj8RqKofhb
 WA/g==
X-Gm-Message-State: AOAM533ZayTHn4cCTnL3VFL27fe80jgcFY3bRLGZl1G1vUxW06SpyYZi
 PRzohXZkNvLZyd7mirxkEs3SO5vQjhU=
X-Google-Smtp-Source: ABdhPJzrTnmMD3gS7stD45YkSpD/m6dRMcy8Z36hDUB69p2QKbTpSa7RyvvZHqvC3SpfIuWaI5Mk0A==
X-Received: by 2002:a05:6402:34cd:: with SMTP id
 w13mr25979198edc.73.1620134852179; 
 Tue, 04 May 2021 06:27:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] Implicit vs explicit user fence sync
Date: Tue,  4 May 2021 15:27:17 +0200
Message-Id: <20210504132729.2046-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

with this patch set I want to look into how much more additional work it would be to support implicit sync compared to only explicit sync.

Turned out that this is much simpler than expected since the only addition is that before a command submission or flip the kernel and classic drivers would need to wait for the user fence to signal before taking any locks.

For this prototype this patch set doesn't implement any user fence synchronization at all, but just assumes that faulting user pages is sufficient to make sure that we can wait for user space to finish submitting the work. If necessary this can be made even more strict, the only use case I could find which blocks this is the radeon driver and that should be handle able.

This of course doesn't give you the same semantic as the classic implicit sync to guarantee that you have exclusive access to a buffers, but this is also not necessary.

So I think the conclusion should be that we don't need to concentrate on implicit vs. explicit sync, but rather how to get the synchronization and timeout signalling figured out in general.

Regards,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
