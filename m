Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C8C7B9CE7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 14:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D917E10E01F;
	Thu,  5 Oct 2023 12:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E878710E01F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 12:11:16 +0000 (UTC)
Date: Thu, 5 Oct 2023 14:11:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1696507873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=625Y/cDD2OHsrHgGAr7LgMBsCYyGRwESn4t6SD2TUr8=;
 b=c5tyit0XY9d+Ob7RWpT04OokBuFlA5Yx/B9v/v1C9Jv4iP74QnAOwf6DbwdAYG4EI0YrYs
 hQW7mcj6u78cVzgoWsUt6HITqwrLdTNzOKgp2Id4cDEFjOhpMgkzBy9+x3/BrUj9d86jJ+
 A8kz0MsZrqAkSlRTQ4iz++/QU6td4x9EU9fz9rmp3KMUnyY3GhS/mREpfjSjXRSU+3iaST
 tmCiEUhhmU7vt5KztFY9Lsh36ySGIJ15b3Hmr0Gq4tdcc7/txvT6Mg82uCPrVC74O2uFeC
 HmPhFGQOmkBzlOCITC2vPrgBepcgpH+djOvjxLHdGgrUIhG+4IMSWHQBt/nyog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1696507873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=625Y/cDD2OHsrHgGAr7LgMBsCYyGRwESn4t6SD2TUr8=;
 b=12poWRT3BlYVzO23axk1QXNubOeHawYD5RG/G0nnDu1l6bdKHkZlqyWNNORdGNmOG4ysOe
 0Su/lAXYp37GT3CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 0/5] drm/amd/display: Remove migrate-disable and move
 memory allocation.
Message-ID: <20231005121112.g8n1wB8S@linutronix.de>
References: <20230921141516.520471-1-bigeasy@linutronix.de>
 <8be685cb-f44a-1143-60ec-d1073fda8e16@gmail.com>
 <20231002105813.NrEGqSCY@linutronix.de>
 <7a3875f6-122f-426e-95c9-06ed8123249b@amd.com>
 <afad1d4a-6572-43bd-98cb-8f326ad02061@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afad1d4a-6572-43bd-98cb-8f326ad02061@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-04 08:44:58 [-0400], Harry Wentland wrote:
> CI passed.
> 
> Series is
> Acked-by: Harry Wentland <harry.wentland@amd.com>

Thank you.

> Harry

Sebastian
