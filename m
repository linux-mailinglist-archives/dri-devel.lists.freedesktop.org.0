Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E49929824C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 16:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444B46E9CB;
	Sun, 25 Oct 2020 15:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647596E9CB
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:41:05 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id s15so5344343ejf.8
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 08:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KiyLF0QbD681WrTw9VnHMerw9h4CM18haN/cFSTjymI=;
 b=nO7YkMfDRGJITk92fEA2qrE4tKYBEY9HeL8go2lRrqrFOLWMOu6BPwVUfhuXX0FTNw
 abJrM4szrOO7Y+zvM7ewNelK1VD9mCe1AtF2WRjbpV/wIUyjkvhvyhYDWKM2v9TC9H84
 VRqoQMZx+PBrk5zFckqVfkMEmMGodrYpY41dN8I29dRDsSX8t8m7wNHn+QuAn8kE5lRw
 NJuSTrbonvT6v9mtad4ARovKQcyxcQBW0Pv/hw65I1OGSCvWXUDh6OTOxEH2tIoQnxz8
 16bJwR4gvGha5n2VHYwiQ0aLVSQkRBbES/6ptiVs0Rpdc2F3SlXu3GXddADUQIUNb3Ej
 TtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KiyLF0QbD681WrTw9VnHMerw9h4CM18haN/cFSTjymI=;
 b=bXJoBEjOWxQINQQo7gpd76O0tAwQ3/dIsV29vwIRbsLGtyRqXZ50Tpn/GpBoJx+vD8
 DfovRf2+DXBuN06C//NppHLBUGES9jMsnzKcMpZ8heMtOet0x9DfgcqVK2Odq6WSlSnv
 YLMlkWtx8o7sWGONuSKxIRxdW/vh/+zgyExBaXyEVvK/fca+Z81thOEzmYw4q6MrtXmi
 /IiB9MpMJWed2VMo4S0Mmh/D5p0YQEOZB1laaYeBYvVsMnVUkVa5/i7ZMKdUEMJBgKM9
 OTWyVXY89M7rHPg4nqQ4tJ1PpOQrl3O7R5EgpFiQjxyGt2EJE4pLqRw2oBlCOgNl/2kY
 /SDA==
X-Gm-Message-State: AOAM5321XeIHvfqP6qrXAKs1xwd/pAv/YSs8mN9jAoySrNvwlORAZDSH
 6kwPOA/CGS+/Mc9jiZY1AR4=
X-Google-Smtp-Source: ABdhPJx1iuHr370GXzz19R0YXjrCdyZHhbeZeUNERm9M7DzDfqDF0RQt6hOxFsQhxcLXjPYxmWcjow==
X-Received: by 2002:a17:906:400b:: with SMTP id
 v11mr11404507ejj.421.1603640463649; 
 Sun, 25 Oct 2020 08:41:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d13a:1a76:8d61:cf5c])
 by smtp.gmail.com with ESMTPSA id g8sm4141931ejp.73.2020.10.25.08.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 08:41:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Madhav.Chauhan@amd.com,
	dri-devel@lists.freedesktop.org
Subject: drm/ttm: new TT backend allocation pool
Date: Sun, 25 Oct 2020 16:40:47 +0100
Message-Id: <20201025154100.16400-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Ray.Huang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This replaces the spaghetti code in the two existing page pools.
    
First of all depending on the allocation size it is between 3 (1GiB) and
5 (1MiB) times faster than the old implementation.
    
It makes better use of buddy pages to allow for larger physical contiguous
allocations which should result in better TLB utilization at least for amdgpu.
    
Instead of a completely braindead approach of filling the pool with one CPU
while another one is trying to shrink it we only give back freed pages.
    
This also results in much less locking contention and a trylock free MM
shrinker callback, so we can guarantee that pages are given back to the system
when needed.
    
Downside of this is that it takes longer for many small allocations until the
pool is filled up. We could address this, but I couldn't find an use case
where this actually matters. And we don't bother freeing large chunks of pages
any more.
    
The sysfs files are replaced with a single module parameter, allowing users to
override how many pages should be globally pooled in TTM. This unfortunately
breaks the UAPI slightly, but as far as we know nobody ever depended on this.
   
Zeroing memory coming from the pool was handled inconsistently. The
alloc_pages() based pool was zeroing it, the dma_alloc_attr() based one wasn't.
The new implementation isn't zeroing pages from the pool either and only sets
the __GFP_ZERO flag when necessary.
    
The implementation has only 753 lines of code compared to the over 2600 of the
old one, and also allows for saving quite a bunch of code in the drivers since
we don't need specialized handling there any more based on kernel config.
  
Additional to all of that there was a neat bug with IOMMU, coherent DMA
mappings and huge pages which is now fixed in the new code as well.

Please review and comment,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
