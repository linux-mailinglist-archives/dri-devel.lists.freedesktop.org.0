Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48733F41BF
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 23:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA4189CE1;
	Sun, 22 Aug 2021 21:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FC189CE1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 21:31:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D9566125F;
 Sun, 22 Aug 2021 21:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1629667886;
 bh=BIO4EtQqF82NHJ/PedKbMdeHnv3gGrG0FGYXYdwBHns=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sA3rmeQxIvOA8q5ZaXh6MBbgrvVQCgS75Y/AP0RD5h+Mpr1T+76Q8oleZgoBMUA2r
 +As9VB8kwwd702mjLZOgpN7v2zctp6lM8CSjgGagHaCgo0GaghzvwP+b8mcxJYV9Z9
 //WxXZpR6hVnpylepy5sKHWiFVLasTgGH3k7sbjk=
Date: Sun, 22 Aug 2021 14:31:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: =?ISO-8859-1?Q?"Christian_K=F6nig"?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: Re: [PATCH 1/2] mm/vmscan: add sync_shrinkers function v2
Message-Id: <20210822143125.dbd2e80dc812b0d5c81d0d49@linux-foundation.org>
In-Reply-To: <20210820120528.81114-2-christian.koenig@amd.com>
References: <20210820120528.81114-1-christian.koenig@amd.com>
 <20210820120528.81114-2-christian.koenig@amd.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

On Fri, 20 Aug 2021 14:05:27 +0200 "Christian K=F6nig" <ckoenig.leichtzumer=
ken@gmail.com> wrote:

> While unplugging a device the TTM shrinker implementation
> needs a barrier to make sure that all concurrent shrink
> operations are done and no other CPU is referring to a
> device specific pool any more.
>=20
> Taking and releasing the shrinker semaphore on the write
> side after unmapping and freeing all pages from the device
> pool should make sure that no shrinker is running in
> paralell.
>=20
> This allows us to avoid the contented mutex in the TTM pool
> implementation for every alloc/free operation.
>=20
> v2: rework the commit message to make clear why we need this

Acked-by: Andrew Morton <akpm@linux-foundation.org>
