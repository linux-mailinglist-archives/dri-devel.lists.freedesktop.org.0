Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81990839262
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 16:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B8210EE12;
	Tue, 23 Jan 2024 15:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A201610EE9D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 15:15:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 971F51B9A;
 Tue, 23 Jan 2024 16:13:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1706022838;
 bh=KH0LvkdbK92DKVq5Xs21pvP2sw0RoJdUkpHOytWRwAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TCd0pyWC9KqbqCI5zJb9AcehuYWsPviIQ8dVRw9+8vhPizbH1jRsgimEWeZwSEkIx
 Yo9P7jjIu/RQ1gb7JFZZs3yKMP8sY/IG2W6SJU8gcUorMxJLJLhXB6C+LOVLUKhGf8
 /Hne88ti6bYq09pwpFMqJLe4kl/FqEZ96PiiD5q8=
Date: Tue, 23 Jan 2024 17:15:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH 1/5] drm/bridge: Add drm_bridge_find_by_fwnode() helper
Message-ID: <20240123151510.GM10679@pendragon.ideasonboard.com>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
 <20240122163220.110788-2-sui.jingfeng@linux.dev>
 <20240123011710.GA22880@pendragon.ideasonboard.com>
 <c999fed3-b6bd-4499-b508-cf524372fbdb@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c999fed3-b6bd-4499-b508-cf524372fbdb@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

On Tue, Jan 23, 2024 at 04:01:28PM +0800, Sui Jingfeng wrote:
> On 2024/1/23 09:17, Laurent Pinchart wrote:
> > On Tue, Jan 23, 2024 at 12:32:16AM +0800, Sui Jingfeng wrote:
> >> Because ACPI based systems only has the fwnode associated, the of_node
> >> member of struct device is NULL. To order to move things forward, we add
> >> drm_bridge_find_by_fwnode() to extend the support.
> >>
> >> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> >
> > Could we switch completely to fwnode, instead of maintaining the fwnode
> > and OF options side-by-side ?
> 
> The side-by-side approach allow us to migrate smoothly,

But it increases the maintenance burden for the duration of the
migration. I fear the migration would span years, with nobody really
taking active care of it, and the OF and non-OF API will have a risk to
diverge.

> the main consideration is that the OF approach has been
> works very well, it is flexible and very successful in
> the embedded world.

fwnode is a superset of OF, so I don't expect issues switching from OF
to fwnode. For the non-OF, non-fwnode users, that's possibly a different
question.

> It seems that the fwnode API could NOT replace the OF
> options completely. For example, the'of_device_id' and 'of_match_table' related things are always there, there

Yes, and that's not a problem. OF drivers still use of_device_id and
of_match_table, even if they use the fwnode API. No issue there.

> are large well-established helpers and subroutines and
> already formed as a standard. Some part of it may suffer
> from backward compatibility problems.

fwnode has been designed to offer the same API as OF for drivers. If
something is missing, it can be raised with the maintainers.

> So I want to leave some space to other programmers.
> Maybe there are other programmers who feel that using
> OF alone is enough for a specific problem(domain).

-- 
Regards,

Laurent Pinchart
