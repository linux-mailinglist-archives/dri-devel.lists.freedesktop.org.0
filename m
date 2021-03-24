Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D54347B41
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315B16EA1D;
	Wed, 24 Mar 2021 15:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD2F6EA1D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:30 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id o126so22937108lfa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=weTz6m5LXcFdcbmDULQSn+jsUrGC4/6OEmDiA/doP4o=;
 b=A6DZRaZ1ty5zT2tsq2EEmG7FYfPgiPI1yD48orj2sYeEunnaZ7My7QsOfr6BadnkfM
 xIzkJXosNHm6qtUS9jTnKI/8VKgRfv8qqNFDJGClJ6ZrKqhsnM/pUPuLSCpcHypNsYq0
 wf4j3574QjNCVMZ+ieGEgd3W5dc1lNmCDW3iq938TM/oNoECos14PllGZlEx6ZSMwPvt
 3/XPuCxY55Qyc1XaqhZOeqaC0F3oq5BeGk0pqQ86cfCJthl3r5+RbbEFp/JFA7Xl9u/Y
 pe1oZwnChyYZYHi2O95bJ8vXk3mh2ws8Szm0TDyT5SuXQeSQtNMQDF/7CHTqH4Xz8tY9
 9gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=weTz6m5LXcFdcbmDULQSn+jsUrGC4/6OEmDiA/doP4o=;
 b=GaS15axT70poiSgnEx6fECbf4zCX4VBobf/Q+sgimj0VtibBM7LXhTLSkwSP+Fw8SS
 +sn7amaDT+ncU0WdZjhzPGQyc/uNjSznODDefQCbkt3WZYuxazJVai0ITDkbRdaaDwS7
 JenILXvgIkLps6jSSUfdY1LKf47WViBm8DDIaKvpqPWujEhJJDvOOSlNGu3TD+H/2rx5
 Fx9c31jT5HHeBZGXkIIuGjh8SSFjFxmeGdneYsQHFvL0tcmF+mkHjJ4XkYiDmRh0yh1h
 TBdVKtk82tGEuANpikm+gd17V2Xi68RPFQkbibXIRuJO37d5GCG+cFX9NLGDzhBojDCY
 +JPg==
X-Gm-Message-State: AOAM533rkWQxeoSofEajkf4z44Hr2sP9vpa0DZZLon3u4tSuNz81N+Ka
 WPHdw4w9Fbmyff7vWMkgJ7+GQA==
X-Google-Smtp-Source: ABdhPJywe7fz0NdqJIhVR+ybPgPme6B0QGjRA/oJ+ovNC/XP5+ZAIFQ2GaulTgOfpXcWvBGNImTVMw==
X-Received: by 2002:ac2:454d:: with SMTP id j13mr2259398lfm.129.1616598028459; 
 Wed, 24 Mar 2021 08:00:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 00/21] drm/msm/dpu: cleanup callbacks, resource manager
Date: Wed, 24 Mar 2021 18:00:03 +0300
Message-Id: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the DPU driver each and every component would provide callbacks,
which are mostly static. Other components would use callbacks to receive
functionality instead of calling functions directly. Drop (most) of this
indirection, replacing with direct function calls. CTL and SSPP blocks
are left unconverted for now.

As we are at it, significant part of RM (resource manager) work is
dedicated to allocating statically linked components. Each LM is tied to
the single PP. Each MERGE_3D can be used by the specified pair of PPs.
Each DSPP is also tied to single LM. So instead of allocating them
through the RM, get them via static configuration.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
