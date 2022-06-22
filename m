Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D84665552F3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 20:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B951133EF;
	Wed, 22 Jun 2022 18:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CA81133EF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 18:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kT70bLwV3eerIZRZu8GNd2l3kNe+D8ldwCNPK/JSqZE=;
 b=DmNdXpI2D5gMLGiKZWeqYNjrGydutxvLmx2SPgFWSDlDMUOyF4hjJ6nYCbee0Fw2BZ0WWxlruFLLf
 SZieIna0HNbfzlazhAt0uYLERye/YQ1a6XQvJr4mZEZHmoBbaDzd4EfSyYVRZrZv8E02OseU/EVMME
 BeIFj08nsOLdLqn/vu4krnyEw8i0JN1kqzh2MGT0xQDMdjC1CsbmAmMxEUfyPKUfH1m8gcEuzdwLmp
 v+hVf7b4vWCpHPZVjWfrcveB2JbYj1aXh9ELcMh7j3xqz5/Rq6Z8mbJIlH97XrHlhYj+0D0G/n8vjS
 EjWAQog2p53uXWLXSo1zaBpC+eqHsXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kT70bLwV3eerIZRZu8GNd2l3kNe+D8ldwCNPK/JSqZE=;
 b=ro1H5sdz07lnt1oVszv9sPINX82JXU79agWASyhLQOMlNmUuKqaCbsdQk3U3eXi2YbGh5s7XxEFzb
 cQjK1lzBg==
X-HalOne-Cookie: efd099001e789d9190e6949885216096f06c3631
X-HalOne-ID: 0aae65b3-f256-11ec-a915-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 0aae65b3-f256-11ec-a915-d0431ea8a290;
 Wed, 22 Jun 2022 18:06:30 +0000 (UTC)
Date: Wed, 22 Jun 2022 20:06:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: How do I gather up new code to be converted as patches?
Message-ID: <YrNaJBiAEKaoreGw@ravnborg.org>
References: <trinity-356e941b-2ee3-4974-944b-5495ba4d00b8-1655918337996@3c-app-mailcom-bs16>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-356e941b-2ee3-4974-944b-5495ba4d00b8-1655918337996@3c-app-mailcom-bs16>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

On Wed, Jun 22, 2022 at 07:18:58PM +0200, Kevin Brace wrote:
> Hi,
> 
> How to I use git to gather up new code to be converted to patches?
> Specifically, I have 20+ new files in one location (drivers/gpu/drm/via)
> and a small change to DRM main make file (drivers/gpu/drm/Makefile).

One simple way to do this is to start with a clean tree, and then add
files step by step.
20+ files in one patch is too much to review, so decide for a
reasonable split between the files.

Maybe something like (as inspiration find your own split):
0) Documentation - or add this in you cover letter. Enough info to give
the reader a rough understanding of the HW and the driver structure.
1) Driver files
2) Util files
3) Files for the memory handling
4) Files for irq handling
5) HW specific files
6) A the final patch - the Kconfig, and Makefile adjustments.

It is important that the final patch is final as you would otherwise
break the build.

I look forward to see the patches!

	Sam
