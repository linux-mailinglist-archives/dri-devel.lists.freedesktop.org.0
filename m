Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27236671CE0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 14:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2298810E743;
	Wed, 18 Jan 2023 13:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E97310E741
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 13:03:48 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1674046580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c3JFb7ryDvxt6kfTas+EBXgdHnTgzdObc57Vw9ZeH+c=;
 b=Nodu27AXlLxNvR01o72/eGEydh9odKAZVZ5noVEBsdesLRCSYrjU9QuBSk4kb+5eWYsEyF
 3UP0c8QaOXauXXAng5bhh6wBVMrN3ZWBa7FEBkWTIyfPsj8JaElneVtJwiaWD8kCCAJdOn
 wVkIsSrWh5/8rk6bslyWNgTqlVRVTqIPaTrwIakG3YkK+KvDUVe8Z2dtsJY5gQleaN1Ezc
 GtmZieQQI7ZVo2geZNqrONG0LW3RIWrZSNTMhzR0x6Ppt5degHmZNXdbyzAZYICI2/+SeF
 qZQd2YRvsoDnAVhupx8bvXGD/T8eUaQxeoq3FYUhVsJY5SdeQtOu4KQn7sFV9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1674046580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c3JFb7ryDvxt6kfTas+EBXgdHnTgzdObc57Vw9ZeH+c=;
 b=btvVIsdUqZqOBINfPovUxKB+RcZR5WH9mtBeSgIMabnAfLl6E8+358Ha6x+uXFIfxh7GhQ
 hN8V+xeDi2kAdNBw==
To: Byungchul Park <byungchul.park@lge.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v7 06/23] dept: Add proc knobs to show stats and
 dependency graph
In-Reply-To: <1673235231-30302-7-git-send-email-byungchul.park@lge.com>
References: <1673235231-30302-1-git-send-email-byungchul.park@lge.com>
 <1673235231-30302-7-git-send-email-byungchul.park@lge.com>
Date: Wed, 18 Jan 2023 13:56:19 +0100
Message-ID: <87zgaghuh8.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kernel-team@lge.com, hamohammed.sa@gmail.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 melissa.srw@gmail.com, linux-mm@kvack.org, adilger.kernel@dilger.ca,
 chris.p.wilson@intel.com, joel@joelfernandes.org, 42.hyeyoo@gmail.com,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, mingo@redhat.com, djwong@kernel.org,
 vdavydov.dev@gmail.com, rientjes@google.com, dennis@kernel.org,
 linux-ext4@vger.kernel.org, ngupta@vflare.org, johannes.berg@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, dan.j.williams@intel.com, vbabka@suse.cz,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 linux-ide@vger.kernel.org, gregkh@linuxfoundation.org, jlayton@kernel.org,
 penberg@kernel.org, minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09 2023 at 12:33, Byungchul Park wrote:
> It'd be useful to show Dept internal stats and dependency graph on
> runtime via proc for better information. Introduced the knobs.

proc?

That's what debugfs is for.
