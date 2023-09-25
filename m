Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3408B7AD522
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 11:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5174C10E225;
	Mon, 25 Sep 2023 09:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336A610E225
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 09:59:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A6D6660FCE;
 Mon, 25 Sep 2023 09:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0882FC433C8;
 Mon, 25 Sep 2023 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695635945;
 bh=iJrTtczHiEmaVCzPFKPPb4YRyBiOSAFyoPe4Ilwhn+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qinEol59UJwv04peJb2qYSlLfco2Il7Pxt1qR73otlu7Qa+JN9xGjpW9W8uCB6Ezi
 FZVEgVPJoOOalo+nEiDzcB2zxVZhkcEM7rJokrYjF7OH0VjNAXxrF8SlZWn9Lv7tMe
 azQZMJWQSAb/NqedwgXhdO8Nlb9gdWax1MSNtEaTkPsZZ65rmhj7uLfYudA5gwa6jz
 J/5Rlx8hy6kjQwUWf2gIHMzezoVeyMrvNFwu1iVS+ipPs2IVPU2kpCGdjJwU62fMvZ
 40+RUP6KjoBYMnm/Fq1mffHYlZYqJLFfTzP6agT9I48z9Hc9aFq2SCH41mmOZTsZf4
 kyc4SvuID3G9Q==
Date: Mon, 25 Sep 2023 11:59:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH 2/3] kunit: Add kunit_move_action_to_top_or_reset() to
 reorder actions
Message-ID: <ct6ydugpx3c5uklimg2w5irwtezxmcdikqn64p3hds5tjrb3y2@hvomhcxsbl34>
References: <20230920-kunit-kasan-fixes-v1-0-1a0fc261832d@riseup.net>
 <20230920-kunit-kasan-fixes-v1-2-1a0fc261832d@riseup.net>
 <CABVgOSk6cvPHs3CsoG0FgHz9Y1OT31ZCk=eu5cCOXyg03uNpBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CABVgOSk6cvPHs3CsoG0FgHz9Y1OT31ZCk=eu5cCOXyg03uNpBA@mail.gmail.com>
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
Cc: mairacanal@riseup.net, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David,

On Fri, Sep 22, 2023 at 04:00:21PM +0800, David Gow wrote:
> On Wed, 20 Sept 2023 at 14:12, Arthur Grillo <arthurgrillo@riseup.net> wr=
ote:
> >
> > On Kunit, if we allocate a resource A and B on this order, with its
> > deferred actions to free them. The resource stack would be something
> > like this:
> >
> >          +---------+
> >          | free(B) |
> >          +---------+
> >          |   ...   |
> >          +---------+
> >          | free(A) |
> >          +---------+
> >
> > If the deferred action of A accesses B, this would cause a
> > use-after-free bug. To solve that, we need a way to change the order
> > of actions.
> >
> > Create a function to move an action to the top of the resource stack,
> > as shown in the diagram below.
> >
> >          +---------+    +---------+
> >          | free(B) |    | free(A) |
> >          +---------+    +---------+
> >          |   ...   | -> | free(B) |
> >          +---------+    +---------+
> >          | free(A) |    |   ...   |
> >          +---------+    +---------+
> >
> > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > ---
>=20
> Thanks. This is a really interesting patch: my hope was that something
> like this wouldn't be necessary, as in most cases freeing things in
> the reverse order to which they were created is the right thing to do.
>=20
> It looks like, from the comments on patch 3, this may no longer be
> necessary? Is that so?

Yeah, it's no longer necessary

Maxime
