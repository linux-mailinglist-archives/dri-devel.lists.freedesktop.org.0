Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91E678C9BF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BC710E444;
	Tue, 29 Aug 2023 16:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FFA10E448
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 16:36:36 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 835026607236;
 Tue, 29 Aug 2023 17:36:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693326994;
 bh=F4ZqAYGLNJogf/dbshNcIb+6++tCCCel6+3jMqzXMPA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BsmSPscmuru8gAwp4BI8hm5X8Cr8dz7CRIiTjfkbo9nGpPpLrMY1VMppeDxMiTpxK
 03jMfnbNiqXP/CZisOyM00exlduFGE8seWsSNQ8QZYqnsZFbTT8mJtMmKcseM0hq2T
 h0H/oz96LeI8gneMKcwcLStRn0RiT0KHD/UJ1d6s40IhaE5GtXd4pHVM3AUOM4aPBm
 t4ASjhboFmWmo4VACYplR+FtwFJ+nPj7pQ26A+gvUoba5WSsIaKWktZiqP0ILYemB0
 bk+ellXcj0DFp391CEyt88P04omsrQ02Say1zyxYZ8C+TU5X1wYb7tgt4E76RWnj7J
 SaRUR8JsbLymw==
Date: Tue, 29 Aug 2023 18:36:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 11/15] drm/panthor: Add the scheduler logical block
Message-ID: <20230829183631.2e786c75@collabora.com>
In-Reply-To: <241e70ba-625f-10b6-1c83-451bcf679c77@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-12-boris.brezillon@collabora.com>
 <241e70ba-625f-10b6-1c83-451bcf679c77@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Aug 2023 16:38:57 +0100
Steven Price <steven.price@arm.com> wrote:

> > +/**
> > + * sched_queue_work() - Queue a scheduler work.
> > + * @sched: Scheduler object.
> > + * @wname: Work name.
> > + *
> > + * Conditionally queues a scheduler work if no reset is pending/in-progress.
> > + */
> > +#define sched_queue_work(sched, wname) \
> > +	do { \
> > +		if (sched->reset.in_progress || \  
> 
> Is this missing a '!'? This executes if a reset is in progress.

What?! I wonder how this went unnoticed. I guess the fact I only use
scheduler-level works for user sync object signaling (which are not
used yet) and ping (I'm sure I tested it, but it must have been before I
extended the reset logic...) could explain that, but still...

> 
> > +		    !panthor_device_reset_is_pending((sched)->ptdev)) \
> > +			queue_work((sched)->wq, &(sched)->wname ## _work); \
> > +	} while (0)
