Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4F57B7AC5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 10:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0F810E348;
	Wed,  4 Oct 2023 08:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE2D10E348;
 Wed,  4 Oct 2023 08:53:28 +0000 (UTC)
Date: Wed, 4 Oct 2023 10:53:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1696409607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rgf8GRivj4qTsOt2d3XGukyfDCF2xbBG1R3w7WzCNvo=;
 b=hX/rO9iom5L8UkraYSKmVK/Rh2VGAwKpYbh6N8iWKusVg4rlobvQe1FgpsZtS0Qd0F6bWy
 EjihWD6jajPbtws1i55RhLLMh2SYTQxAM6NYtibIqrruG/z2LSkSDGJpJhYJFskpDIClIU
 Q1LTks99YbavJru9/G2Detk6ph7ghCt29+FoJBEeftQdVhS6fu77kYAmODhNFejF+7eM2g
 WBp26546c2t9HkuFz5y7ruJhx7l8bxCF/mcEUAVE4IIo8RXRkAYQ4Qnbh6ZXZ/5Thz2pRH
 lKsn1kE3AZ66IT++Al2wtMKaMuNMOtXC/mGyFsKYHKtz5e6Eo78lcsWaFPYzYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1696409607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rgf8GRivj4qTsOt2d3XGukyfDCF2xbBG1R3w7WzCNvo=;
 b=VkA+R1ryLwSNaqdBtS0ALyRYsEc9TwdCz3bamM7HFUu0WvYO8CcdLI2rLyuRkeSGhnUbOA
 NI4/wWCe4ec/nQAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 1/5] drm/amd/display: Remove migrate_en/dis from
 dc_fpu_begin().
Message-ID: <20231004085325.PandDs8m@linutronix.de>
References: <20230921141516.520471-1-bigeasy@linutronix.de>
 <20230921141516.520471-2-bigeasy@linutronix.de>
 <ad5179f7-d2f6-4306-b70e-f0ae5cefcff6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad5179f7-d2f6-4306-b70e-f0ae5cefcff6@amd.com>
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
Cc: Tianci Yin <tianci.yin@amd.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-03 15:53:41 [-0400], Harry Wentland wrote:
> On 2023-09-21 10:15, Sebastian Andrzej Siewior wrote:
> > This is a revert of the commit mentioned below while it is not wrong, as
> > in the kernel will explode, having migrate_disable() here it is
> > complete waste of resources.
> > 
> > Additionally commit message is plain wrong the review tag does not make
> 
> Not sure I follow what's unhelpful about the review tag with
> 0c316556d1249 ("drm/amd/display: Disable migration to ensure consistency of per-CPU variable")

I explained it below with two points what the reviewer should have
noticed why reading the commit message even if he does not know what
migrate_disable() itself does.

> I do wish the original patch showed the splat it's attempting
> to fix. It apparently made a difference for something, whether
> inadvertently or not. I wish I knew what that "something" was.

As far as I can tell the patch does make a difference.

> Harry

Sebastian
