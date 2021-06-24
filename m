Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737D3B34BA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 19:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2EA6EB3A;
	Thu, 24 Jun 2021 17:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8016EB3A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 17:24:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso4161717wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 10:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8q/UNZOxS+S0vgMY57F7pbpMdzm6D1KZ+ZGovtNUC3c=;
 b=bHjf+vsgsn1nlJf1Xl451UNz+Uz/Ty6yTZ1wxmdWDIVKCZAlX3lNwJWbxsorqPvn+G
 WTbXcbj8gij6h5czjeqMwIHm7EBUS31E7KNj4ONYuzsmxnTUBfFjYKEPIMcRB8lc/37w
 OjasO8NEHeJj3BWfrPKGrs0oZeAcaw32aX7oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8q/UNZOxS+S0vgMY57F7pbpMdzm6D1KZ+ZGovtNUC3c=;
 b=N8PIl2X5WbtCBD0xZQ36WYG57PtDSVfOUI+wYYoVo68XScnlkV781hH5lae03QYX72
 95n5HcVaG5NWf6tMryz0ZW2Eun3qRSMGmz1QNkOIIAZMwI2i+q2zmotToGTOr+s49a18
 hXD97suKCUF8TpTG1ftSGab6x882iBgoN9Eceu7sEGw6nZjuU1kgtiAh44LQcNGrCEF+
 d2MoCH3VzqHG1Bl6VwjuM3v96lI0EGcZRxU4VKBDS/jEu8nGnVmMDnI/Ib7D+4D4TDv/
 +3ArbpTHy7xbE4ZHkVCbsSwrjFRCqfJlg/zXktCp0jRWm6ZjMwX9YrNE6s/dr7xQe4tS
 W+5A==
X-Gm-Message-State: AOAM5335ZBzhta2iGmthNDquCQNZOAURva3hfVHEx8oH9qBpSgutg9gn
 Ve4uOGuKrqc4BRNica8cmxtxzQ==
X-Google-Smtp-Source: ABdhPJzZvpZnYm7EIFBtiDOTurNAJdzKaAgW9v0/De3WcO+tltOlZTpFwt5T2ypKpINsJlFEenTKhQ==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr5487156wmc.163.1624555475964; 
 Thu, 24 Jun 2021 10:24:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x1sm3594170wmc.31.2021.06.24.10.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 10:24:35 -0700 (PDT)
Date: Thu, 24 Jun 2021 19:24:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 06/11] drm/v3d: Move drm_sched_job_init to v3d_job_init
Message-ID: <YNS/0Wjct+FcB7bi@phenom.ffwll.local>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-7-daniel.vetter@ffwll.ch>
 <CADaigPXRP8RSAk6V=rH9Le9oBKpyQtxjjOSD=rRHQoGMobKVSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADaigPXRP8RSAk6V=rH9Le9oBKpyQtxjjOSD=rRHQoGMobKVSA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 09:59:08AM -0700, Emma Anholt wrote:
> On Thu, Jun 24, 2021 at 7:00 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Prep work for using the scheduler dependency handling.

I'll add "We need to call drm_sched_job_init earlier so we can use the new
drm_sched_job_await* functions for dependency handling here. That gives a
bit more context on what's going on here.

> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Emma Anholt <emma@anholt.net>
> 
> Back when I wrote this, I think there were rules that there had to be
> no failure paths between a job_init and a push.  Has that changed?
> 
> I really don't have the context to evaluate this, I'm not sure what
> new "scheduler dependency handling" is given that there was already
> something that I considered to be dependency handling!

Full patch series link:

https://lore.kernel.org/dri-devel/20210624140025.438303-1-daniel.vetter@ffwll.ch/T/#t


The job_init vs push_job is addressed here:

https://lore.kernel.org/dri-devel/20210624140025.438303-1-daniel.vetter@ffwll.ch/T/#mb6c4d75e1c57a5056d7b2ec8fbb9839fc5be41a7

I split job_init into job_init (which can fail, and be done earlier) and
job_arm (which can't fail, and must be atomic with the push_job).

The entire goal of this is to lift the dependency handling from "everyone
copypastes v3d" to "drm_sched has it for you already", which is this patch
here:

https://lore.kernel.org/dri-devel/20210624140025.438303-1-daniel.vetter@ffwll.ch/T/#m9f64aaf840cbf8815cd2ea9a68f99a51da9baa5f

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
