Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 263804A3059
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 16:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BCB10E2B6;
	Sat, 29 Jan 2022 15:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F7310E154;
 Sat, 29 Jan 2022 15:54:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 800F760EA9;
 Sat, 29 Jan 2022 15:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7871AC340E5;
 Sat, 29 Jan 2022 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643471685;
 bh=MUJUxdkPGfv/or2YLQ6Mah4UNtbPJ+YJLCFJgLzFZ08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=od1g9pszTmK+WNud2Fyz8MEVlm+QNXXS/Jwoa9e/4Ti/oK3fPT6AZKjRUMkftn3WX
 qnyYgGzZJ3gJTiUhC35f9yOrv271fWe1S1f8spb4eUiBDwDY9PU4/gcyrGVw/PF8OJ
 VCLej+GUFjfWn2TjLA0DzXddJ9LfLIek0kgWWiW4=
Date: Sat, 29 Jan 2022 16:54:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kangjie Lu <kjlu@umn.edu>
Subject: Re: [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
Message-ID: <YfVjQw1i9AYVz9e3@kroah.com>
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
 <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
 <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
 <CACO55tt4P+beifvS=jcDsfwybFynngc8DHLR0n3BseeDJNrHyw@mail.gmail.com>
 <CAK8Kejr6E76u2kf_OKxC1RT_qsCWXDf7q4WcTC13-OJz5CseWg@mail.gmail.com>
 <YfVTcUA4MKknEawL@kroah.com>
 <CAK8Kejo6p57u8tz1rnV5bhQVO_vz-p1nCsc_G=EvEr1u3FUP9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8Kejo6p57u8tz1rnV5bhQVO_vz-p1nCsc_G=EvEr1u3FUP9g@mail.gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Zhou Qingyang <zhou1615@umn.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 29, 2022 at 09:19:18AM -0600, Kangjie Lu wrote:
> > So to be explicit, so you do not misunderstand me somehow:
> >
> >         No more patches from umn.edu should be accepted into the Linux
> >         kernel until further public notice.
> 
> This is clear to me.
> 
> > They should be considered a
> >         "bad actor" given their prior history of submissions and lack of
> >         complying with the kernel community's prior requirements to
> >         them.
> 
> I am sorry for the delay of the last process which is unfortunately
> not under the control of the researchers. According to our
> administration, the process has started and is moving forward. I hope
> that can be done soon.

Given that our previously agreed-upon requirements were not met, I do
not think that finally meeting these requirements when caught that you
were not following them is going to be acceptable to allow your
organization to return to the kernel community.

Your people have shown bad-faith toward us too many times, and we have
wasted too much of our own time and energy on this for absolutely no
benefit at all, except as an example to point others at and say "do not
be like them."

greg k-h
