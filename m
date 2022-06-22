Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEFF554C9E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3105112B51;
	Wed, 22 Jun 2022 14:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDA5112B51
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:16:39 +0000 (UTC)
Received: from maud (206-47-13-26.static.dsl.ncf.ca [206.47.13.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D8177660159F;
 Wed, 22 Jun 2022 15:16:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655907398;
 bh=5QwPhPn+oUECZJZh74dB84ZBlE2lT7TOgl2zfhKwH3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ahWqzDnypBpjQFdGIlmFQiOZu3PDOf9jUQV+CutbzlCR/E5E3rlwLPSetl3W4WS+T
 sE+da/JL6YT7FMvhvY2ERa91/uZCxeJb+u56MnJFpp+VtKCaZNCOf//9dq6YiqZURP
 DRSB815q6m25T/ldLKgRa86rlzJRjy0tDQEuPYsjQmbGHLipQOEXRmU23OdjzwqTCA
 pG23O+N7fAwzd04b3qotdRZbWUTxDiT0y4BjTNZbkF01q3wMzW1gKWhyUdtNXveBE8
 /7bpQ7O4rJVTogqe8c2OvpTh8tQICX0U0mqNc6kpC5oCne1lKjo6/VZTFXfABUZF++
 dGRUPEv7yMHog==
Date: Wed, 22 Jun 2022 10:16:32 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Adri??n Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v3 1/1] drm/panfrost: Add support for devcoredump
Message-ID: <YrMkQMLIwoNJxlK/@maud>
References: <20220622015420.1130814-1-adrian.larumbe@collabora.com>
 <20220622015420.1130814-2-adrian.larumbe@collabora.com>
 <YrMIXvPaUz5EbT5X@maud> <20220622140058.3oykas4zfxprmv56@sobremesa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622140058.3oykas4zfxprmv56@sobremesa>
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
Cc: dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 tomeu.vizoso@collabora.com, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Sorry about this blunder.
> 
> >> +	slot = panfrost_job_get_slot(job);
> >> +	slot = slot ? slot : 0;
> >
> >`slot = slot ? slot : 0` is a no-op. Delete the line.
> 
> I think what I meant here was 'slot = (slot >= 0) ? slot : 0;' but for some
> reason I blundered again. The point of this was ensuring the slot value wouldn't
> end up wrapping about the maximum unsigned integer value when using it as an
> array offset, in the off-chance that panfrost_job_get_slot() ever returned a
> negative value.
> 
> In v4 I've instead rewritten this as a sanity check:
> 
> WARN_ON(slot < 0);

No, this doesn't make sense. There at most 3 job slots -- 0, 1, and 2.

> Although perhaps in the future panfrost_job_get_slot should return an unsigned
> integer instead?

Sure. Kernel style doesn't seem big on unsigned, if this were
mesa it would return unsigned. Returning u8 or u32 seems reasonable at
any rate.

> >As a general note, I'd appreciate breaking out the panfrost_regs.h
> >changes into a separate patch, as they are a logically separate clean
> >up to make room for this patch. Thanks.
> 
> Done in v4.

Thanks!

Alyssa
