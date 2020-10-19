Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC942930B9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 23:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52666EB34;
	Mon, 19 Oct 2020 21:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A4D6EB34
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 21:44:42 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id dg9so810082edb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 14:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=nyrn42er1Nwkl34LqpCRDyMvGc+rEtVTi6lpho4x3l0=;
 b=AWOOCzui1OCjtb2lH6I7hB6K3OjgVlGzLvVtvh8mWYNG7FkC/FEJWhjAm66gD24s0Y
 EShKT/uIweYkKUmZGKNpQg9Wla07cZKqDovfb/QH1yDrdjuAaLaBaujoI//ppuaSc5Sd
 1p0DRfpBSrIK8cKyz/+HhN1YD3B2aZccBoEjvq2aAjcVHNLSytFHnHe3bL6ERZUTP8gm
 AfBZ3huhNx6w91K3mck4poIqOJVkqS7bszZZClyy9JUfdw6Q347vrmvu26HTUS5MhwMV
 5mEgIuYl2HZ8gEKFaaHV/zch5H0sRm2mJ+HjB9sYEcfszDeOD5OjM7RnKrSn7e8PJ0jz
 8Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nyrn42er1Nwkl34LqpCRDyMvGc+rEtVTi6lpho4x3l0=;
 b=cnbsz6ChLqCRvBAD1P7Jpq8M4IsuBMYxgF4YaGosfStRHGFNFrm7sNAocHKV01vWS9
 iW07GSkTrtbRLMofjN0VFxowtuE3IvQOMV5ROVNy0E62nxRrXKdyfSG9+SHU7lODbPd6
 0ree4EIHnq8lM3T4NwZXVVTDKo2yocfFvLmUr0bbGXsp+NQkB6g1QgOFBcB6SjBAhq4c
 JfAli8bUiIqzSnTMlP8vgNMsPyVHU5Dw23Q7cerc2P/cP4OSFQvQ/V2Ek10kIoRQB+bv
 r6C3VWgqq+8hMuFhCvCLi7yslAHLCWQNQxncE+9bID1ci/ka/bTaNw1XAjXbgB4Y1+Nd
 yWtA==
X-Gm-Message-State: AOAM532951u/FNH04kTSP9EY7Ldmf8Td5y2x3ELT7sUIkCH5uFI04Wn5
 feLf+rocqbUYvuLyh8mBHF8PyCQvPRnOTqpEOqyio1MXRdc=
X-Google-Smtp-Source: ABdhPJzzcNxxPY1VsmFYOTXp5dKH/iSz5bKL2iNQI5XruX9I6TQeK4d6+r5x0W8YGDGVA2nkY7PXGN8bEecbQFAG220=
X-Received: by 2002:a50:d987:: with SMTP id w7mr1881236edj.113.1603143880685; 
 Mon, 19 Oct 2020 14:44:40 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 20 Oct 2020 07:44:29 +1000
Message-ID: <CAPM=9tzpNLTnZ0yfqaUzrbu507LX-Z1tJbdV0_PbtsJwjVUNOQ@mail.gmail.com>
Subject: ttm_bo_eviction_valuable wrong units?
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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

if (place->fpfn >= (bo->mem.start + bo->mem.size) ||
            (place->lpfn && place->lpfn <= bo->mem.start))
                return false;

Should the bo->mem.size there be bo->mem.num_pages?

I was just writing patches to get rid of size and noticed this.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
