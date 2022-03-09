Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA24D2D1B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 11:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1A889E59;
	Wed,  9 Mar 2022 10:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA01589E59
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 10:28:30 +0000 (UTC)
Date: Wed, 09 Mar 2022 10:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1646821708;
 bh=QCuOUbPmi+SUl45gWYVSirY2waAVv3GfCbq4CzSx/Xc=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=eyBkgAQx9XqAC+x4e5OfeD09b23nw0a2zwyjs0iTN1ZP0se2H8UifI4QyXEQNJKvj
 dSfQP4bzqRtkI/ZRArX0XiNSJBb/XHlAPoUvX6Ltvx5wsxfTg8HCmD96Y1hjEYm1DS
 wF2nxKioRIUswVSdiPllhksDd5rbOPoRve3ViT3vQvQ1nUQ3S2db5whKOr8G4odHGb
 gU+qIdzYstXPIWamAtDDbcPtqFJhaDsIDw2X+CSsedBXSC5ePtP5CIrxY6JtVaz39I
 aULaxbq32QFXbC9vKM5k3ZUzX1uUwV6ChQnnG26EE359sUo62lYnSHyaPFiZKj1/6K
 ZpT9NV+DgnmDQ==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <iZTBpyxPhm4Q7lobMcS6nj3qX3Tt2qh8bfiZWEek-lgn9S-PQcBHKN3uUEcgVwSOeVocniOKYIRNI1kvWlfMB3XZ32D4CQIX9Ob8T04SdLw=@emersion.fr>
In-Reply-To: <1e2ad919-e336-cf8f-c675-0ddd62796a0f@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <589bca3a-6f44-39bf-1eb5-1cb2628e4fee@amd.com>
 <DQGKSkEjxg-p9oBYX3hMa6fmY3Am2mAT4KBSQL_qsLGK0m85wehKp54s1IbobLSc5-FGbY67HrlWfQYO876bGgeObzY5eJF5UXJ1BktPilA=@emersion.fr>
 <1e2ad919-e336-cf8f-c675-0ddd62796a0f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, March 9th, 2022 at 11:24, Christian K=C3=B6nig <ckoenig.leich=
tzumerken@gmail.com> wrote:

> Am 09.03.22 um 11:10 schrieb Simon Ser:
> > On Wednesday, March 9th, 2022 at 10:56, Pierre-Eric Pelloux-Prayer <pie=
rre-eric.pelloux-prayer@amd.com> wrote:
> >
> >> Would it be possible to include the app parameters as well?
> > Can all processes read sysfs events?
>
> No, but application parameters are usually not secret.

It's a bad practice, yes. But people still do it.

> > There might be security implications here. The app parameters might
> > contain sensitive information, like passwords or tokens.
>
> It's a well known security vulnerably to provide password etc.. as
> application parameter since everybody can read them through procfs.

I was thinking mostly about Flatpak apps here. Flatpak apps are running
in a process namespace so they can't query the CLI parameters of PIDs
outside of the namespace. But they might still receive sysfs uevents.
