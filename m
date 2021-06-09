Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A87693A18B4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 17:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD476E434;
	Wed,  9 Jun 2021 15:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4706E434
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 15:10:35 +0000 (UTC)
Date: Wed, 09 Jun 2021 15:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623251432;
 bh=SK05/RaCJIRL7kESXt22JkXqnsssWOAx/rnSr68ztg4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=g3r1DwNcvjb2nM0ILnB3H02ckrnBLLEswUJomzMf2Og1kU74icNZ8JJpmOIM4GblJ
 6uZnM3QYO2lDM+vEgyfV0XOGul86EixKMotawZGP5ofB/3rujRbtRvkVbNcVK+RQbf
 O+8VFI4QNVeeqsYvIWMYmDTFRMftDhu/Jlt9eydGj/GTU/8kqec7i9oqMgmhsNNyOG
 bX7jF8w7HCEuLIoOY5NrlrGuU8OYadMuQEvQqghbEeUJjuHhqhMhUKH0OTBobY0/9x
 vYsQ4We7lmrQ0+tR5MTHLYS4cTgi7+AB4B2H0WSJPBclWnNkHOtmz+1iqzmBIgGkDH
 zWnq7qH1flw6Q==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/4] drm: add per-connector hotplug events
Message-ID: <MLdSwFOKUjr2xJ_Yfsj_t0YRVmM--eSxDLrMBj3snhGWOsIfMLtRRp3P__IHYXTMuHxHh1G4cElhYZ8hwlSfP9-_KAl_5dNQz-yFT2zGfPg=@emersion.fr>
In-Reply-To: <YMDYTNXAE+EeB/TI@phenom.ffwll.local>
References: <H6LOTVFhdBPSi5N5zQIYRvkif2VhbZgfDIyWTvdSrY@cp3-web-051.plabs.ch>
 <YMDYTNXAE+EeB/TI@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: pekka.paalanen@collabora.com, michel@daenzer.net,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, June 9th, 2021 at 17:03, Daniel Vetter <daniel@ffwll.ch> wrot=
e:

> On Wed, Jun 09, 2021 at 10:39:03AM +0000, Simon Ser wrote:
> > When a uevent only updates a single connector, add a CONNECTOR property
> > to the uevent. This allows user-space to ignore other connectors when
> > handling the uevent. This is purely an optimization, drivers can still
> > send a uevent without the CONNECTOR property.
> >
> > The CONNECTOR property is already set when sending HDCP property update
> > uevents, see drm_sysfs_connector_status_event.
> >
> > This has been tested with a wlroots patch [1].
> >
> > amdgpu has been updated to use these new fine-grained uevents.
>
> That's a bit thin for motivating roll-out ...

My intention was to add a few other drivers as well if the idea is good.
amdgpu just happens to be a codebase I know and can work with hardware I
own.

> Also my idea was that with the per-connector epoch counter we could make
> this happen for anyone using the probe helpers.

Yeah, I remember something about this, but then nothing materialized.

> I also thought that the dp hotplug code was a bit more unified by now to
> not need the duplication across all drivers. But there's only three for
> that.
>
> Ofc drivers that hand-roll their hpd code need to be adjusted, but I've
> hoped that with the epoch counter we could just make the current hotplug
> event code dtrt thing here automatically maybe?

Sorry, not signing up for that. It looked easy enough to adjust existing
calls, but anything more complicated and I'm out of time.

If anything, this patch is mostly a signal that user-space would like to
receive CONNECTOR properties. User-space is typed up and ready if any
kernel dev wants to implement this. I'm completely fine with abandonning
this patch.
