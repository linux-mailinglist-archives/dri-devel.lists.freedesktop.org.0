Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455E9C3FD79
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 13:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBA710E0BB;
	Fri,  7 Nov 2025 12:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="jF5qyFkW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B8310E0BB;
 Fri,  7 Nov 2025 12:04:54 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d2yRQ6BH8z9tRW;
 Fri,  7 Nov 2025 13:04:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762517090; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzgmRtIykzq3KpMrl5mnxc3xDZ0GBrO5Qqa/yj2D31g=;
 b=jF5qyFkWoQSOtRa2n913ov2d8laT7+FUavQ6WfiUvsVurKLzIhb20Eqfx1Srl5xoYM2tPt
 3CArltByS+2ZbAtJyoqBmxWkpxBm6roa0hHfT5GBIzGhDT5osbmjPbsDc0UTHPWfojNvzb
 8u5uiYspVETgpjpJBygOikcXBsCO0CNDoLK2YzLq+1ih5wu0DiUrKWS/zx6WlJ8qjEFBrM
 MdrMPTYoxLcHLJVnSw1c+XerQq9lF8Pw/XEcShlHSPb+2/vCxrx9kBjiz5Tdwy5PWcuX/W
 g8EJKkk5z7nzg4QmI1YmYVf/o8PmxDbjjDva48KbaNCESsNMIw/KPXCN+nFeDQ==
Message-ID: <54bdf125bec4dd612d45fc96bb81f03e5a432b02.camel@mailbox.org>
Subject: Re: [PATCH 07/20] dma-buf: use inline lock for the dma-fence-array
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Fri, 07 Nov 2025 13:04:47 +0100
In-Reply-To: <20251031134442.113648-8-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-8-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: c20944f2a8278cd0b13
X-MBO-RS-META: nzzcc74ijd9egcs7aeu8qkqdjehnqmec
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

On Fri, 2025-10-31 at 14:16 +0100, Christian K=C3=B6nig wrote:
> Just as proof of concept and minor cleanup.

I maintain that even relatively simple commits should give a new reader
ore one who's browsing through the log in 3 years a rough idea what's
going on.

That is: quickly describe what the situation (motivation) is and what
the commit does.

At the very least "proof of concept" is nothing anyone would expect in
a non-RFC patch. To me as a non-expert in dma-buf it's not clear at all
whether this patch here is actually necessary, i.e., solves a problem.=C2=
=A0

I also don't see how replacing one lock position with another is a
"cleanup". Sharing spinlocks is perfectly legal and will remain so, no?

P.


