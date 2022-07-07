Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0722569FAE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A6511ABFF;
	Thu,  7 Jul 2022 10:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F26612A8D0;
 Thu,  7 Jul 2022 10:24:57 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a5so10955250wrx.12;
 Thu, 07 Jul 2022 03:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+17x9GYvT3pd9/ATngrsV2cBRwBAFl6gWnnvgjr9Jgc=;
 b=q0xWSselqUTAszv5Fjhd1sgQxm2BOyhXbts2wnDyGbCO9fdLIR0tP1P/V1GBlhUG26
 hJe3LvWjnAIK3bIxF77yXCdpyRjmsrGEFOo6HePWqXNMCQoSWftZLvYkiuwgnnNHYpmv
 lR4WMLJ21Epnl5IGDPUSDhr2uQpRkie5VVo1Frpkgrhbx1NSFOO5bh6qEf9BLx8anCNR
 bRzI6NSvxJH3iwtE7Dfra/iYKTC6S/3TIVeqESevXjCv/aF+U3+LDbG/vIPUxa3BCx5Y
 49ooFZ/+e5zZeZgWBGWzYQfFY2gBZsaEQm86CD9TjJZJ4JUpD5uQ4IvTqWImeMeJHJOe
 IB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+17x9GYvT3pd9/ATngrsV2cBRwBAFl6gWnnvgjr9Jgc=;
 b=e9h/5wRbTCPMbCkLgx8RCrq4CiXx8Jlq/03iJaHUjb0z1snoButLiS5ZNdbiG2g8N/
 RMavmGbWqovfIaghoCgKNpD2ttaYanAd/kCzDhwfJgS73P9yVPbU99ebqatzb3zsDtil
 9oExr6b+CZ7k7MWcRgbqH8Hqn06rAFY6ImQBfY/6r5LgHD8uZWOCg9F17ynzDP2Zz+2Q
 ZcG7vB/+rab22ue2+QM3ZMoGABDqdCFQ1J0myMF+igb1gEW5whaAIsGSyMPta4HOeW+V
 kIO2eSMnXHqscCG7ywMRaGqWUj0cMeniVGHP0dzRz87Yp7cjiMb4bJPsny1pbOsHczWa
 2v7A==
X-Gm-Message-State: AJIora/w532PhAM7dj/7tmbzpOL9B5gcQ5+8WfLx//+PLZ3/KCCUuX6Z
 a0MUd8bqzogBUSRxh0hXgfPn2NAPd3A=
X-Google-Smtp-Source: AGRyM1u3uiC4gejsISt5duc0tTJPcI2Iuq8dU4sJKmgdgBX4+gRhKQ186jRzofobbgI6kTra138VrA==
X-Received: by 2002:adf:fbc6:0:b0:21d:3fc3:99e with SMTP id
 d6-20020adffbc6000000b0021d3fc3099emr35974711wrs.550.1657189495618; 
 Thu, 07 Jul 2022 03:24:55 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b00397402ae674sm20091950wmq.11.2022.07.07.03.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 03:24:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Cleanup of TTM NULL resources
Date: Thu,  7 Jul 2022 12:24:47 +0200
Message-Id: <20220707102453.3633-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

sending this out once more since it was requested that the Intel CI
systems can take a run of this as well.

The last version had a couple of merge/rebase leftovers which are now
fixed as well.

Please review and/or comment,
Christian.


