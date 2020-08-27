Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79899254326
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 12:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B02F89CB8;
	Thu, 27 Aug 2020 10:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3635289CB8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 10:05:42 +0000 (UTC)
Date: Thu, 27 Aug 2020 10:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1598522740;
 bh=ffaA9NalJMVU2UKTLg6pea1mHRIiZpIck6JIPScJId8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=RcAqdKVv3q+qKz9Zmjvc1aUeVstIboOQdGAIQVSt5ZYpvOol6MOTjKvq95Pr2mRVW
 QMMSrTnnfqkfwVqX2xtBElrvUP2P0tDaujD67vQSVIgoAJKqIO3qaelRNfdVu8esZG
 Bdt/Q1xqdl7WSxU8fCdZdWzCZtsG6ww7QyHFJxtyeAUM6YjMlQs00tBRTRbar1wo+t
 ZEA8lr406GbeQvMiVBWXaJ25ssbVis07WhMA36yG6AHlCEFrlVov0gT/yAYxvHg8cr
 kPjStzWn3h6Ofo1lB1eGAwFjdiSfoLpS93D/G8t0sMaAOteQ/NIHJciLIw0RXyEQu0
 EnyCx8Qu8Ha3A==
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
Message-ID: <HLs4Vl86o7Bizqo_-jyz_sHLhvnePm1DoLc9c_96NjYt-GeGwjX1NLz_lScgmmDBMvulyYsgzqiIXhs9yhYxsbompEotRDwtz9uNDAp7ZWs=@emersion.fr>
In-Reply-To: <a1663f6e74eca50f19b44416cdeb346a7b836108.camel@collabora.com>
References: <20200816172246.69146-1-ezequiel@collabora.com>
 <CALAqxLV2kOXUjATTn5Xg6-Rj-U7SVUO0t89MzpRzKFU4v8h5Lg@mail.gmail.com>
 <621cd69bdd4af3e5bd5f2c96450c87651620381a.camel@collabora.com>
 <20200820155427.GV6593@pendragon.ideasonboard.com>
 <a1663f6e74eca50f19b44416cdeb346a7b836108.camel@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 James Jones <jajones@nvidia.com>, linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Liam Mark <lmark@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Stone <daniels@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Laura Abbott <labbott@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, August 25, 2020 10:26 PM, Nicolas Dufresne <nicolas.dufresne@collabora.com> wrote:

> > I don't think we can do this in a system-agnostic way. What I'd like to
> > see is an API for the kernel to expose opaque constraints for each
>
> Please, take into consideration that constraints can also come from
> userspace. These days, there exist things we may want to do using the
> CPU, but the SIMD instructions and the associated algorithm will
> introduce constraints too. If these constraints comes too opaque, but
> you will also potentially limit some valid CPU interaction with HW in
> term of buffer access. CPU constraints todays are fairly small and one
> should be able to express them I believe. Of course, these are not
> media agnostic, some constraints may depends on the media (like an
> image buffer, a matrix buffer or audio buffer) and the associated
> algorithm to be used.
>
> An example would be an image buffers produced or modified on CPU but
> encoded with HW.

Actually, in the proposal we're working on, constraints may come from
user-space too. Rendering APIs (ie. mesa) will need to expose
constraints for buffers they can render on or texture from.

Constraints would be opaque for users like compositors (ie. programs
that merely pass constraints around and merge them don't need to
understand them), but not for user-space drivers.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
