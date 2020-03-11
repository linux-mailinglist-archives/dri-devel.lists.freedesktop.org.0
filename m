Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4545F1815F3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 11:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A8B6E96F;
	Wed, 11 Mar 2020 10:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AA96E97F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 10:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583922974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gf7kTyGOygOhxC0qSg8pDlevcgH2JZuB/eu5yxfSA/g=;
 b=XNhgdW/bZeshdPLF1SqbMLlVeJiHgyyCTg55Md1ph9Fjqcz4yi8cxVlHmegHDf6bPBEMlA
 eUGZJ1d2qYY/WHJMbUVps93AZSUdDaFWKV0WZ33GrLeJOEiZz69c/qnskoGH5bwp7QHL1y
 vM3cGOOun7ig3G44ajzsBYYTqBLiYIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-y6g8OhTMNRWClKrTLEwsxw-1; Wed, 11 Mar 2020 06:36:12 -0400
X-MC-Unique: y6g8OhTMNRWClKrTLEwsxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9065B1005509;
 Wed, 11 Mar 2020 10:36:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F3ED5D9C9;
 Wed, 11 Mar 2020 10:36:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 505D89D43; Wed, 11 Mar 2020 11:36:09 +0100 (CET)
Date: Wed, 11 Mar 2020 11:36:09 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [RFC PATCH 0/8] *** Per context fencing ***
Message-ID: <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
 <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: Chad Versace <chadversary@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 John Bates <jbates@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> I should've been more clear -- this is an internal cleanup/preparation and
> the per-context changes are invisible to host userspace.

Ok, it wasn't clear that you don't flip the switch yet.  In general the
commit messages could be a bit more verbose ...

I'm wondering though why we need the new fence_id in the first place.
Isn't it enough to have per-context (instead of global) last_seq?

> Multi-queue sounds very interesting indeed, especially with VK
> multi-threaded command submission.  That to me is V3 rather than V2.. let's
> start easy!

Having v2 if we plan to obsolete it with v3 soon doesn't look like a
good plan to me.  It'll make backward compatibility more complex for
no good reason ...

Also: Does virglrenderer render different contexts in parallel today?
Only in case it does we'll actually get benefits from per-context
fences.  But I think it doesn't, so there is no need to rush.

I think we should better have a rough plan for parallel rendering first,
then go start implementing the pieces needed.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
