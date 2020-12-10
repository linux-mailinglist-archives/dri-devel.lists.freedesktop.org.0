Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FBC2D603E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF876EABB;
	Thu, 10 Dec 2020 15:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A616EABB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:45:28 +0000 (UTC)
Date: Thu, 10 Dec 2020 15:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607615126;
 bh=V4wiblAC/RLDIgZUbJZgTYIWzS4QfV/UUVHYK9XV8fQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Ah4iYPzvgL2E7PkVNcL2YVsjcd+dfCi4K4+WwvoHFJD0HWcI5lFpSTC89ByxBCE+F
 d3VS1mh5b8pDvQUeFsIPAmzyOnYeOpko5svFzlcsgGnRcjdsKz+09q+6oV4UR73jYc
 TZs8JXC+l0ZvDUdxPkRp9pZErNcpAgRLJVbbRErAuG2rHYTzw2Mu5R2FMLe8fxVul3
 pVK4vKfv7+wdpx1jhIpNPA7oL6pwFYUf1v8yAUxG56rhmrd63y3C8F/no2T0YZb8/0
 gr2mRznaWUnOZ9r8+v4Tci0wSqxiLl9Lu4mlVkLta5x+f0ok83p9qar3KCSmWCBTvW
 nAvvD+eTvIVQQ==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: rework description of primary and cursor planes
Message-ID: <iId0AQqxwalIhTMk-efVSEskNIuLA_pP5h4loD4Mbu17dJF83zbUXu5HZnSekjM73tghP2kE5MNXdMT3D5lus2e-s66PX4V0a_mDka695FY=@emersion.fr>
In-Reply-To: <20201209194030.GV401619@phenom.ffwll.local>
References: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
 <20201209004223.GL401619@phenom.ffwll.local>
 <0zedd9O9Bp0DfEH26xBTGvZtqA5bdE2EJDN3z5TXiDIyiwfTnRapgDy69MjAlhMWrzqKTzoYwovpGANNhp1PmneSCrm-xzw9DIeauv1SkgM=@emersion.fr>
 <20201209160223.GT401619@phenom.ffwll.local>
 <W7ZhvStaUaGjlhYSldWxC93V0-tjSEwm-ldyPBpmvkJ9xRw1krfB1TNd5X4hEjkamaEhH1ASD0yiFzMCh72oG8vCeg-HeOt5dRN5U5v_q34=@emersion.fr>
 <20201209194030.GV401619@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, December 9th, 2020 at 8:40 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> > But it's not enough, can't have two CRTCs with the same primary plane. Well,
> > I give up, it's just simpler to use Daniel's criteria.
>
> Yeah, also with the validation check we'll now real quick if any driver
> gets it wrong. Then I think we can have a useful discussion about why, and
> what to do with that case. As-is we're kinda drafting specs in the void,
> which is always a bit tough ...
>
> That's kinda another reason for doing the stricter check I proposed, it's
> easier to check and guarantee (on both the driver and compositor side
> hopefully).

Hmm, actually, I'm already hitting a driver which doesn't guarantee that.
amdgpu with my hardware [1] has the first primary plane linked to the the last
CRTC, the second primary plane linked to the second-to-last CRTC, and so on.

[1]: https://drmdb.emersion.fr/devices/129e158a4d9f
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
