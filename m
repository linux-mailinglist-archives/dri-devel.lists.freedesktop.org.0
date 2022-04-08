Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199E4F9A0D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E852210E470;
	Fri,  8 Apr 2022 16:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3158210E470
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:01:55 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id bk12so5148528qkb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vM3pW4RjVj4tewcoS/tlob/DKx7LKasCdOIAq5bhU/I=;
 b=ol+MbjxYhSIB899MVOJ1joiOHNJZYQBUwvqHggRb2IcjteWbug5+/xKeJ4KA4P4eWX
 kIqVf6mrHyHMCuMIszIrTG+ulSgyOLZkAYKEYAgqoJXUfJsKwQVOJUlNDbUj/XDrxRf4
 sQUHNH/dyh4USijYIFnEa0sET9TzttaA0nL2z9iXZDmIsDoQg8mL1TNcKR2IuRO46hH2
 QD3fkqCWvxZP2pzeXOycoErxumD/VNIgoa/+j332FJI/vvX7cT2ey8PWV6wEQyIrsJJ6
 ASrIvqib3HIrGIp7wAemsDdNemAREGFGIBmEM9rkzo3smggqmm+hCuwBBvyee2HtP4A9
 h/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vM3pW4RjVj4tewcoS/tlob/DKx7LKasCdOIAq5bhU/I=;
 b=bJcmZA/0fpNNbnhK4RXbATl8zyTW24d1eetYgncvcW+AgjEjmxYmEFWIv44u46NyY3
 W8fB8fUMLEZKNSMcuFD1fF2N6W8zzzQwdTuBeSZuuh/yKibCTZOSPFUYkBoWT+bThAj2
 DSqD6SZv50yhd72mOy/83o7J1xMod+jQO731IOY2vtDtNcHC3qy/ctsbY1tLUsvVWDsH
 yOKhKVb2kBKqexpiwsIUxJP2tOkxTGBFQUoXKVFNlKC7WGJVirxm/H5hsIJF+YJVc0td
 8E1OHMdaFj6Y7nz6+QnOBwN2/ZEpI8I+v6DxocNgXzBtGC9Uu4PEqIWl2YQlwJ19uzrf
 1Cxg==
X-Gm-Message-State: AOAM530U4mDDM+I+bCI7i+728rgQAH6IV7fO0L84IkC2ihkZNkVuEzm7
 o5iJ3rFD5zslHuGdxU2IO2RB1ME3kzjYTNCJvZQ=
X-Google-Smtp-Source: ABdhPJx6jwy91U/sinFALqgM4OXIfG1OUvYEqd44ZljTNpTjC4QiGkl6syaASlrcX6pArPVl/F/IIOdd+JUuZuR7Ljg=
X-Received: by 2002:a05:620a:a84:b0:69a:8c1:56e with SMTP id
 v4-20020a05620a0a8400b0069a08c1056emr5423283qkg.7.1649433714180; Fri, 08 Apr
 2022 09:01:54 -0700 (PDT)
MIME-Version: 1.0
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 8 Apr 2022 17:01:27 +0100
Message-ID: <CAM0jSHO0NF-U-vxAHUnxp_JERQrywdD713n+G3bVuCBVqax3kQ@mail.gmail.com>
Subject: ttm_bo_move_sync_cleanup() issue
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

We seem to be hitting a new issue in ttm_bo_move_sync_cleanup(), due
to passing a NULL fence, and I guess with some recent changes this is
now blowing up in at least dma_resv_add_fence(). Question is how
should we handle this? Should we add a special case in
ttm_bo_move_accel_cleanup() in case of NULL fence, and then maybe just
always call ttm_bo_wait_free_node() and also skip the add_fence? Or
maybe this case should rather be moved into the driver, and handled
with something along the lines of ttm_bo_move_null()? Any thoughts
here?
