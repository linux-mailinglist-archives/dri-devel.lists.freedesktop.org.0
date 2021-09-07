Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F66402C2E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 17:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32DC6E02D;
	Tue,  7 Sep 2021 15:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from h1954565.stratoserver.net (sebastianwick.net [85.214.192.246])
 by gabe.freedesktop.org (Postfix) with ESMTP id C0E1E6E02D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 15:52:42 +0000 (UTC)
Received: from mail.sebastianwick.net (sebastianwick.net
 [IPv6:2a01:238:4226:4f00:79f5:2d39:beca:3cf1])
 by h1954565.stratoserver.net (Postfix) with ESMTPSA id B974F16406F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 17:52:41 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 07 Sep 2021 17:52:41 +0200
From: Sebastian Wick <sebastian@sebastianwick.net>
To: dri-devel@lists.freedesktop.org
Subject: Re: Handling DRM master transitions cooperatively
In-Reply-To: <20210907155214.285b3561@eldfell>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0e9edc155c2621e607543316a0220312@sebastianwick.net>
X-Sender: sebastian@sebastianwick.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On Tue, 07 Sep 2021 10:19:03 +0000
> Simon Ser <contact at emersion.fr> wrote:
> 
> > FWIW, I've just hit a case where a compositor leaves a "rotation" KMS
> > prop set behind, then Xorg tries to startup and fails because it doesn't
> > reset this prop. So none of this is theoretical.
> >
> > I still think a "reset all KMS props to an arbitrary default value" flag
> > in drmModeAtomicCommit is the best way forward. I'm not sure a user-space
> > protocol would help too much.
> 
> Hi Simon,
> 
> for the "reset KMS state" problem, sure. Thanks for confirming the
> problem, too.
> 
> The hand-off problem does need userspace protocol though, so that the
> two parties can negotiate what part of KMS state can be inherited by
> the receiver and who will do the animation from the first to the second
> state in case you want to avoid abrupt changes. It would also be useful
> for a cross-fade as a perhaps more flexible way than the current "leak
> an FB, let the next KMS client scrape it via ioctls and copy it so it
> can be textured from".

The state reset already is an implicit protocol. Another IPC mechanism
however could extend it to work the other way around: instead of
inheriting all the state and trying to transition from that to the
second client's desired state the second client would send its own
desired state back to the first (instead of applying it immediately)
which would then try to transition from its own state to the second
state (and if it can't you fall back to the implicit inherited state
protocol). However, this is only an improvement if the first client
knows how to do the transition and the second does not. All in all I
doubt that you can convince most people to add this kind of complexity
just for slightly higher chances of a good transition.

The reset state protocol on the other hand solves real problems and
gives you a good transition as long as the second client knows about the
same properties as the previous one which usually is the case for the
typical bootsplash->login manager->compositor chain.

Maybe I'm completely missing how such a protocol would work though.

> Userspace protocol is also useful for starting the next KMS client
> first and handing off only later once it's actually running. I'm not
> sure if that is already possible with the session switching stuff, but
> I have a feeling it might be fragile or miss pieces like the next KMS
> client signalling ready before actually switching to it.
> 
> 
> Thanks,
> pq
