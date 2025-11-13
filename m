Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7D6C58AE2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82EC10E8A9;
	Thu, 13 Nov 2025 16:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="u4iY0wfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F6210E8A9;
 Thu, 13 Nov 2025 16:23:25 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d6lty4yJVz9sp0;
 Thu, 13 Nov 2025 17:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1763051002; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EpvkBNKd/xPBaK17iPRIIBTgOGDAPant06qZh/pNZ7A=;
 b=u4iY0wfvZpuFW3vnC1wLS28SwWjVe6pgdXg/IQqlc57JmztDcLMZUWEQGnfSARvXBDIdJk
 XYXl4exYgRHnmYe0FhQqrsHNap1edltyNnnCGfjc4J4iyyJ3bubOaeImI8e7K9ypy/X+Y9
 v0Klsx+yv2kvdCFwRNCnJmngiORUhCCDmjPV5Nec/8EjeHiuTNcQj1mwZ03kUqumTTBKBI
 2aqgnMiIXb+YUBY8nDjrOHuytahnJ+xNNYKKuA0Ob5St9X+ddqKxGsB0l/Dttg4CgSGn7Z
 iWgJnRfmxqgDbaKMTDFYMGLk2mJMdFIij5uLN7IfncJd/M+XRJhrLepV+06lzw==
Message-ID: <cfa60e2d9902602c41b277fd8bd254576b2f4187.camel@mailbox.org>
Subject: Re: [PATCH 08/18] drm/sched: use inline locks for the drm-sched-fence
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 sumit.semwal@linaro.org
Date: Thu, 13 Nov 2025 17:23:19 +0100
In-Reply-To: <20251113145332.16805-9-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-9-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 5b9c762a8f61f71ad61
X-MBO-RS-META: b6kyy13na4iho37yxz1xt9n58cppo6yw
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2025-11-13 at 15:51 +0100, Christian K=C3=B6nig wrote:
> Using the inline lock is now the recommended way for dma_fence implementa=
tions.
>=20
> So use this approach for the scheduler fences as well just in case if
> anybody uses this as blueprint for its own implementation.
>=20
> Also saves about 4 bytes for the external spinlock.

So you changed your mind and want to keep this patch?

P.

