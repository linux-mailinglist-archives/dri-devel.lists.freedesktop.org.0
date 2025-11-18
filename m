Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E26C67D8A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 08:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D7410E04A;
	Tue, 18 Nov 2025 07:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="owxjWkN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6414010E04A;
 Tue, 18 Nov 2025 07:10:57 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d9bPB24ZPz9t1S;
 Tue, 18 Nov 2025 08:10:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1763449854; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3Svf89VpHT2wQGwonxJQfHJCvpIpi34OCtA1IiIzKU=;
 b=owxjWkN5pULlF64dau2zdaypb2ZTg4jacy54mZzptXHJjvB8Cchj4Wd0i86nkjDF20Qd+e
 NQT25A6f8G4Rfm5gA3d1ba3Z296wZhRCpM9Lsw8TF0SXFksuss2yIcMNCFJO0BSEvY5l3E
 L8niiWscyhnyPxvIG4J90BdXQGqCjOfX/OA8/kRJfV6V3khbr30oYk2MS6qG4wKvpDlUUx
 N7r5Av2evV1mTEiXzem7Pck7SFouEcAvNKfY5AJVhVqYDMNcBVKhvOI8h1KGMhSfryyLmr
 4XTKD5KRcOrtC82HLqIY+QKlKEza7O6vRPzIyQDa/nhfV8gXWiwew4S7oSdvFg==
Message-ID: <5ada5c442d391173cd723270c3c1b15f375bf2f7.camel@mailbox.org>
Subject: Re: [PATCH 08/18] drm/sched: use inline locks for the drm-sched-fence
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org,  amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,  sumit.semwal@linaro.org
Date: Tue, 18 Nov 2025 08:10:49 +0100
In-Reply-To: <6862f4a8-a23f-4930-aef7-802bc65a4d36@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-9-christian.koenig@amd.com>
 <cfa60e2d9902602c41b277fd8bd254576b2f4187.camel@mailbox.org>
 <6862f4a8-a23f-4930-aef7-802bc65a4d36@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 7f302530e54e8814219
X-MBO-RS-META: koouwgisxzeuzkg53pikqhcz1kf8i4hm
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

On Mon, 2025-11-17 at 16:32 +0100, Christian K=C3=B6nig wrote:
> On 11/13/25 17:23, Philipp Stanner wrote:
> > On Thu, 2025-11-13 at 15:51 +0100, Christian K=C3=B6nig wrote:
> > > Using the inline lock is now the recommended way for dma_fence
> > > implementations.
> > >=20
> > > So use this approach for the scheduler fences as well just in
> > > case if
> > > anybody uses this as blueprint for its own implementation.
> > >=20
> > > Also saves about 4 bytes for the external spinlock.
> >=20
> > So you changed your mind and want to keep this patch?
>=20
> Actually it was you who changed my mind.
>=20
> When we want to document that using the internal lock is now the norm
> and all implementations should switch to that if possible we should
> push as much as possible for using this in the driver common code as
> well.

Mentioning that in a changelog would be neat. How is anyone else
supposed to know whether you forgot or changed your mind?


And have you tested this? Kernel build bot is firing warnings. And
touching the scheduler's spinlocks makes me nervous in general <.<


P.
