Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483E539CE80
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jun 2021 12:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17ED96E03C;
	Sun,  6 Jun 2021 10:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8396E02D
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jun 2021 10:03:17 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id my49so4880747ejc.7
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jun 2021 03:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DsJI8yqEV7DwOIAcudUWj6vuI6gMTqjf8/AMXt/kRWc=;
 b=obqON6uDwyS9irTA4zj0CrSdSwatjZZYGGSJjSLGp/vMZJssx6EtRPEJ7p9A7v6/0L
 8KDTkHx+wfOkDSTqtmGrn1FcZVqE2t12Ge5Q3F3dst6QaYU/BewuLnxQPprkBrLytqlD
 geNsy+oFg+GuDXTiFAnfLTK/I0zelGyf4QQtIcQ1ekP+h8fEqom9uLw65IKUfWp9XlsO
 vnNJzWnk57P2nv7pFAJvnr/layJDddq8kT9HCDW+pYGW9cdRlbmBHdyjoeSexgAcM8Sj
 6NGr4V5tyOwcPY6tR2LluA5zhsyCv8YYXmT/v6ReZDPGRbOsLXlRRzsiYvBcgSp5CyMp
 b0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DsJI8yqEV7DwOIAcudUWj6vuI6gMTqjf8/AMXt/kRWc=;
 b=bbQUgUt2id/aOOt6HyXlosLFebLaMFHzEjTJQIsmNgOQx/GNn4uATzPN/lPsfE7X8N
 fpEE7daaSpdjCSDJX6x1XbzbV1vqCfnUSuiVZ17WgFLxim/gBH06u2UXvpVJk0pBUZuM
 KFjUPzNqkUmolhImZA+kYSfNJupTati9sGnu57Jbhyvpkf+vXHX7f4llOdw+277Lvrql
 OxSCHnL2ZKjcFLJg1d+d0tocw3sbeUXgD7QwbgtqMqrr0Xw7U3p7JYIWfZbJVBBcVwnt
 3FNlVs0Sqogm4ilXYlWLU1Yp7/VOjzmm7Nz3vEccXuyDWafK5J6/yrsOCp735qxd+d4X
 PwRA==
X-Gm-Message-State: AOAM531oBG+4WqwFaS61SfOXfXnNU12o2drFJtjqg6buOm0VJoSdTF0k
 5epX1FS7f6o2jzmMsTL+EMKNK8VpDmE=
X-Google-Smtp-Source: ABdhPJzi1p3Ssd731XLHX+JLaabfIAhjPpHcxxnZWfTBJgUPAlE9hWJfquU06zfZ1akl9C+3j6xWtw==
X-Received: by 2002:a17:906:1f90:: with SMTP id
 t16mr12654124ejr.297.1622973796125; 
 Sun, 06 Jun 2021 03:03:16 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:78a4:bc57:b741:16b2])
 by smtp.gmail.com with ESMTPSA id r12sm6077531edv.82.2021.06.06.03.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 03:03:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: handle exclusive fence similar to shared ones
Date: Sun,  6 Jun 2021 12:03:09 +0200
Message-Id: <20210606100312.119176-1-christian.koenig@amd.com>
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

Hi Daniel,

as discussed here are the patches which change the handle around exclusive fence handling.

The main problem seems to have been the dma_resv_test_signaled() function which ignored the exclusive fence when shared fences where present. This was already rather inconsistent since dma_fence_wait_timeout() takes the exclusive one into account even if shared ones are present.

The second patch then fixes nouveu to also always take the exclusive fence into account.

The third then removes the workaround in amdgpu around the VM page table clearing handling. Since I'm not sure if there are no other places which relies on the existing behavior I will hold this one back for a while.

Is that what you had in mind as well?

Regards,
Christian.


