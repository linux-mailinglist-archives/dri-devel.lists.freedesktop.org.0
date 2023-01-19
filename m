Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E4767356A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 11:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3D710E8FE;
	Thu, 19 Jan 2023 10:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B56E10E8FE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1674123859; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=MexWMAAPO1Zh1CATb6mBtlhRejxxlbRYWMErPKpphY8=;
 b=DkQu+igpCxs0VXRX9mEafilPWcM+DSVxuBvl8NPT7ih5EicJCFiAwirwUe4TI6QHERSoNL
 3+M2PPlS8gn/86fS49aGYNpX869wSOSZRqK3iq6ekraB8elCaoOLhg3CD3z11fKfB3mO4a
 DGJ7wNV8wYKvyiezgc7RBo416FmiK+k=
Message-ID: <730e5a40874c0e5bf66ddcb9fe7b2e4f28e09b1a.camel@crapouillou.net>
Subject: RFC: dma_resv_unlock() and ww_acquire_ctx scope
From: Paul Cercueil <paul@crapouillou.net>
To: Sumit Semwal <sumit.semwal@linaro.org>, Christian Koenig
 <christian.koenig@amd.com>
Date: Thu, 19 Jan 2023 10:24:17 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Just a reflexion I have after an intensive (and intense) debugging
session.

I had the following code:


int my_dma_resv_lock(struct dma_buf *dmabuf)
{
	struct ww_acquire_ctx ctx;
	int ret;

	ww_acquire_init(&ctx, &reservation_ww_class);

	ret =3D dma_resv_lock_interruptible(dmabuf->resv, &ctx);
	if (ret) {
		if (ret !=3D -EDEADLK)
			return ret;

		ret =3D dma_resv_lock_slow_interruptible(dmabuf->resv,
						       &ctx);
	}

	return ret;
}


Then I would eventually unlock the dma_resv object in the caller
function. What made me think this was okay, was that the API itself
suggests it's okay - as dma_resv_unlock() does not take the
"ww_acquire_ctx" object as argument, my assumption was that after the
dma_resv was locked, the variable could go out of scope.

I wonder if it would be possible to change the API a little bit, so
that it is less prone to errors like this. Maybe by doing a struct copy
of the initialized ctx into the dma_resv object (if at all possible),
so that the original can actually go out of scope, or maybe having
dma_resv_unlock() take the ww_acquire_ctx as argument, even if it is
not actually used in the function body - just to make it obvious that
it is needed all the way to the point where the dma_resv is unlocked.

This email doesn't have to result in anything, I just thought I'd share
one point where I feel the API could be made less error-prone.

Cheers,
-Paul
