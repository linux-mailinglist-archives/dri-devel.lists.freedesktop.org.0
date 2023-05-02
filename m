Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5276F4289
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 13:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78D410E51C;
	Tue,  2 May 2023 11:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B98410E51C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 11:19:47 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BAE4F6601F25;
 Tue,  2 May 2023 12:19:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683026385;
 bh=8hea1QbFXdBcBcKypNwYvForurBNghJuopO7nhG2U7I=;
 h=Date:From:To:Cc:Subject:From;
 b=StplQOQsJnJz1V0kcpdDF7lgyC+nDH3a/7ZJssUz4f+Sfs0if8ghvpaCxPWZVZgyN
 rBF0U1Pz4muOP1Qn4u8BDO4A0uKPS7WcJCKJo43FMa8YDTlXXfbt3E8EuIX2XibXSb
 nfzJWDsVwmFIrzAm+DdbehO6fV/xTcqewnXkQyy31ThHBbDaNQNZ4B3ZV/J4phYUFf
 wntqmI3JlOkSUnNZaj3xyc3EAtVjqjgqdNLIFPS2/+xKIQDEUQms9fzunyWOZdY1dq
 KbcO/b37bTQDMzPHZR4YK0k7xTMtZllGCEuohJksaLW/xBEjYroiOhQdI/8NkInshA
 yAZWQg1y9+y1Q==
Date: Tue, 2 May 2023 13:19:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
Message-ID: <20230502131941.5fe5b79f@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Christian, Alex,

As part of our transition to drm_sched for the powervr GPU driver, we
realized drm_sched_resubmit_jobs(), which is used by all drivers
relying on drm_sched right except amdgpu, has been deprecated.
Unfortunately, commit 5efbe6aa7a0e ("drm/scheduler: deprecate
drm_sched_resubmit_jobs") doesn't describe what drivers should do or use
as an alternative.

At the very least, for our implementation, we need to restore the
drm_sched_job::parent pointers that were set to NULL in
drm_sched_stop(), such that jobs submitted before the GPU recovery are
considered active when drm_sched_start() is called. That could be done
with a custom pending_list iteration restoring drm_sched_job::parent's
pointer, but that seems odd to let the scheduler backend manipulate
this list directly, and I suspect we need to do other checks, like the
karma vs hang-limit thing, so we can flag the entity dirty and cancel
all jobs being queued there if the entity has caused too many hangs.

Now that drm_sched_resubmit_jobs() has been deprecated, that would be
great if you could help us write a piece of documentation describing
what should be done between drm_sched_stop() and drm_sched_start(), so
new drivers don't come up with their own slightly different/broken
version of the same thing.

Thanks in advance for your help.

Regards,

Boris
