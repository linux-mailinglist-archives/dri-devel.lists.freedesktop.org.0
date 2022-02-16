Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F244B81AE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 08:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496A410E763;
	Wed, 16 Feb 2022 07:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBDA10E764
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 07:40:49 +0000 (UTC)
Date: Wed, 16 Feb 2022 08:40:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1644997246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uOiuPHiQmy5b8Qczc4D0Y+cV4Dyd9l37rqefvPeQyok=;
 b=y54hTjD3laosXu6abNeyuj9xM7XS/ixeG4dSr7/uctB5IbmWYV680ueR2/wrBFo76BQqeq
 e/3qxH7PKjdkreYb0GUpJF7c4kVVa4JRU7DxyDIOyrdCeihXFNNp8VVWdZq/REl5wOQbvw
 1OLBgQUnUZ2dNtlze9GrWbv3YNM3WrC/hTIxyL9LbtNTEIDxi17mpMlqxyXnttPjn2kLoC
 w240d/HUEcB0L9SLNC5dV3NsoWhXfm+fr3kiPkYuU6fGGfprgxdbi0lWFRYAw4hLzlyxyq
 EtFUiotS8TVFTFJHGVrGOkjAFXrRl7lzwHSiP8ZQiIShT+Ca9Fc3BdiVFvByiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1644997246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uOiuPHiQmy5b8Qczc4D0Y+cV4Dyd9l37rqefvPeQyok=;
 b=IKADsweeCveWUCuSN4KuISDViGfqpDJ95GXtfVROgz4KKgFd7wwQraQ0KHw3u9Tlkvrv9P
 9hAzJrvl7nXNufAg==
From: Sebastian Siewior <bigeasy@linutronix.de>
To: Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH] drm: fb-helper: Avoid nesting spinlock_t into
 raw_spinlock_t
Message-ID: <YgyqfQkz+/Xs7VWR@linutronix.de>
References: <nycvar.YFH.7.76.2202151640200.11721@cbobk.fhfr.pm>
 <YgvLdvPihuQ9KZ6/@linutronix.de>
 <87o8382j5s.fsf@jogness.linutronix.de>
 <nycvar.YFH.7.76.2202152058300.11721@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2202152058300.11721@cbobk.fhfr.pm>
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
Cc: John Ogness <john.ogness@linutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-15 20:59:24 [+0100], Jiri Kosina wrote:
> Thanks for confirmation, seems like this problem is indeed cured by your 
> series.

Oki.

> I still believe though that we shouldn't let 5.17 released with this 
> warning being emitted into dmesg, so I'd suggest going with my patch for 
> mainline, and revert it in your series on top of it.

No. That warning is only visible with CONFIG_PROVE_RAW_LOCK_NESTING with
the following paragraph in its help:
|   NOTE: There are known nesting problems. So if you enable this
|   option expect lockdep splats until these problems have been fully
|   addressed which is work in progress. This config switch allows to
|   identify and analyze these problems. It will be removed and the
|   check permanently enabled once the main issues have been fixed.

This warning in this call chain should affect every console driver which
acquires a lock.

> Thanks,

Sebastian
