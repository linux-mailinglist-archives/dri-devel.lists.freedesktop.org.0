Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F9C2AA084
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 23:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AB76EB3F;
	Fri,  6 Nov 2020 22:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFA16EB3F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 22:48:13 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9578E2087E;
 Fri,  6 Nov 2020 22:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604702893;
 bh=Oj1ydksyNqQ3ZwyWkWH+O74qkDDreoYI/9+2rwNutow=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GgJzvJbYnUHZVh/KVjPbUkpsfTIS+ixIdR5hDbc8e6O11e3cdgusrJ+SXHU1mNK02
 T1pf6Ysk+sGbT7IeHtbS79IjEOVb10BsqWj7Z/BpfjH8Hjsl5L51bZ3setY8WJNtnr
 JcdIhGHQmomXcxD8lLvJYy+d8B/elDLs+I2TO9iQ=
Date: Fri, 6 Nov 2020 14:48:11 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: =?ISO-8859-1?Q?"Christian_K=F6nig"?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] mm: mmap: fix fput in error path v2
Message-Id: <20201106144811.cf228ca9278ec78887d42960@linux-foundation.org>
In-Reply-To: <20201106114806.46015-2-christian.koenig@amd.com>
References: <20201106114806.46015-1-christian.koenig@amd.com>
 <20201106114806.46015-2-christian.koenig@amd.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  6 Nov 2020 12:48:05 +0100 "Christian K=F6nig" <ckoenig.leichtzumer=
ken@gmail.com> wrote:

> Patch "495c10cc1c0c CHROMIUM: dma-buf: restore args..."
> adds a workaround for a bug in mmap_region.
> =

> As the comment states ->mmap() callback can change
> vma->vm_file and so we might call fput() on the wrong file.
> =

> Revert the workaround and proper fix this in mmap_region.
> =


Seems correct, best I can tell.  Presumably all ->mmap() instances will
correctly fput() to original file* if they're rewriting vma->vm_file.



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
