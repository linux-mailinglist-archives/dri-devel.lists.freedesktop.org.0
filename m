Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BCCB07AA3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 18:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855E310E2C8;
	Wed, 16 Jul 2025 16:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jqaRN7Nw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC48810E66B;
 Wed, 16 Jul 2025 16:06:00 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so29835e9.2; 
 Wed, 16 Jul 2025 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752681959; x=1753286759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=epYdQQbPY05DOCosTJYdnFxoVsolyJsGACnw8JctJvk=;
 b=jqaRN7NwL6C34SFcZQtUaHzOrcik2SLtohIAsxf+51bJrsXqNRSVXY51NC0mFGD0p8
 YnJS13bTDxHBQBfgeuO4Fx1x2YwoPyt2GY7bcFg8DuQWtR/CNdbberD0PrHzzspXOr3S
 9pW2KOi5AUmP1w9BFGSWsGVA1c7IIlbZh0NMa4rkGJW9grosj4Lswp95M5xsd8ag02G3
 ISVhCeqmhGKSWuimVFYtaX1aGSSCOoEmk4o2UBC68hISh25ZB93cF3G3cYFuV+nKJ+rF
 sEiqfsPsbWCOP0jjulKdu2sX9Tg8RMpGFK9X8a9u8nnVhaMPbaA1HyyUmvAIk1s2r3QZ
 YZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752681959; x=1753286759;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=epYdQQbPY05DOCosTJYdnFxoVsolyJsGACnw8JctJvk=;
 b=Wy7c7ujBSeodUPjRB3th80zEviT3O4smbdXwQKtDx9rWvgCxLQ6J7BOTZsW+9Vd1Qf
 2E483xAWd7Y9SHTEuV4dvL0fflRo0CUTLt5aLnQqvwhb4tRtcR41bVcRj8971J4WjFYK
 0ms1CU9ayV57knSbQKqeTE0k6kazEHF0xE/RtwBLYpDfXVoOX9lMQwsmgZ5JD+8YkIxW
 cqRfgWep9Yi3hZQGMPqTLK8nEt2d7YipBeIymCCwXms1Fh98UPDN4fwxDUiyHPgwI2Zq
 0EGHydWTUzQNQoYXHnrrMNzpyK8//06jJa84QrvzjXZuhN8kDjdIIOrQpJ/xeWIkBnJ+
 dbQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULm3q5+S/q4sSevlkcE5x47/9oB8hgoibHdj0/BNnMgN3aYxgv6YO7Ch/N98uPMPTEzaftP/BFP+E=@lists.freedesktop.org,
 AJvYcCUMm3OuMEse9vkqIi/OAEy5/QUpclbnf1QWP06VJBTBey6Rwkra8LMquJWwV93wkefUHMOzq/3cKEA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgB1Ax/W2j8qVvsoLi/NA2TaLYFn8w+zO+NXAHyAQpoiv2hkFF
 w2+FetNpWSk0miUJzEqi1afe/6bfKsWNcWhA9tHhr3zopP3YshMiTha0
X-Gm-Gg: ASbGnct+aroKgJOlqvzvZFA3EjWQZB3OAw/Wa74t8kUhScUTbEnq980FKSJ8Y2q/slv
 6IY3qtL6A+0f5KoAa7kv3g9w1tO56ZXlCTsIbHS/tdXB8hLQ1gbqlCyino8LYVJsRk0PKKeFELc
 a0HGkbFviFdzVIZyBhQSHD5S+4OJHZnSyITiGb9Owt0YXrbPAzuy5WvU8vYVyOb0svFB+8Y327M
 8R5u0wQBsSiWDYJTHp88NU4DmwM6Bmel5Esw2XJssPLW0DjO54OG+cBFsg8kPM4C8ClmrXARmCo
 n0ri+DI+g2QqLJ7aEIX9QTXnZzHursqtxNhH0APl50Tv0phAs1nz5hJIrDq1myPPJMVOQWt5xmo
 FTESSmutnQivt9kQp2DkeVNrFyN/4XqHtQN8=
X-Google-Smtp-Source: AGHT+IEwbRiACOI8I+Xa/iAreU1MyaeunstLiNPD/5/hCuYa1lt9bDXOOEd9y2YAtBUuckqCE+CP1A==
X-Received: by 2002:a05:600c:a115:b0:456:1c7c:73df with SMTP id
 5b1f17b1804b1-4562e25817fmr28992915e9.27.1752681958936; 
 Wed, 16 Jul 2025 09:05:58 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15ac:3200:9bfa:f68e:168b:a67a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e884779sm25296185e9.19.2025.07.16.09.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 09:05:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Switching over to GEM refcounts and a bunch of cleanups
Date: Wed, 16 Jul 2025 18:04:19 +0200
Message-ID: <20250716160555.20217-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi guys,

so I hope Thomas is back from vacation while I will be on vacation for
the next two weeks.

Here is the patch set which cleans up TTM and XE in preperation of
switching to drm_exec.

Please take a look and let me know what you think about it.

Regards,
Christian.

