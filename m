Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 376959C915B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 19:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D4110E827;
	Thu, 14 Nov 2024 18:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="fjZAzTbR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A995410E827
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 18:05:51 +0000 (UTC)
Received: from fpc (unknown [10.10.165.12])
 by mail.ispras.ru (Postfix) with ESMTPSA id 6CD7440777C7;
 Thu, 14 Nov 2024 18:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 6CD7440777C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1731607547;
 bh=6Mrmh8SlJGuf6/TCn8LCJHutLgCLvW0FX6am49VxyU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fjZAzTbRsFrqqGgohMLKbaSs5pp63q2gddJJ6TBnJa1/hH1VVlqAl2Bf6bYvPK0ck
 MTtPde7CHBfeI3CgfhOAflwN5PM0wom2u4HwnKx3fGcK1KV23H0m7wZ9J6guM0XZcM
 qP3u0TeKmlld0DCps1Z3+gzDmoi/6h0EAOb+2U8Y=
Date: Thu, 14 Nov 2024 21:05:42 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Jocelyn Falempe <jfalempe@redhat.com>, Murad Masimov <m.masimov@maxima.ru>
Cc: Dave Airlie <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 lvc-project@linuxtesting.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Subject: Re: [lvc-project] [PATCH v2] drm/mgag200: Apply upper limit for
 clock variable
Message-ID: <20241114-1e41c566600f3ef18943a36f-pchelkin@ispras.ru>
References: <20241111163306.860-1-m.masimov@maxima.ru>
 <a394af10-8428-4d19-84cf-f21ec63f23f5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a394af10-8428-4d19-84cf-f21ec63f23f5@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14. Nov 17:47, Jocelyn Falempe wrote:
> On 11/11/2024 17:33, Murad Masimov wrote:
> > If the value of the clock variable is higher than 800000, the value of the
> > variable m, which is used as a divisor, will remain zero, because
> > (clock * testp) will be higher than vcomax in every loop iteration, which
> > leads to skipping every iteration and leaving variable m unmodified.
> > 
> > Clamp value of the clock variable between the lower and the upper limits.
> > It should be correct, since there is already a similar lower limit check.
> 
> I don't think it is correct.
> 
> If the clock asked is > 800000, then delta > premitteddelta, and it will
> return -EINVAL.

In many cases when clock is > 800000, the check won't be reached as the
division by "m" variable containing a zero value will have occured just
before.

> With your patch it will instead configure the clock to 800000 which is too
> low for the mode asked and will result in corrupted output.

Worth moving the check just after the loop or e.g. explicitly denying
clocks > 800000 at the beginning of the function?
