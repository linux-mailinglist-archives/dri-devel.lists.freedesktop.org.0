Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712E53913F4
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 11:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3466EC26;
	Wed, 26 May 2021 09:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B176EC3D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 09:45:39 +0000 (UTC)
Date: Wed, 26 May 2021 09:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1622022336;
 bh=6bnXHXEDjmMyXGFX/sLS9rHtQDIBNsiOL6vKMf1HUII=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=nmMw+CJZh0Wv38TsXSu8KX7NPRjzVuY7esOnYESf85iDsyB4HcI4xIGNv7NjX1ATe
 OhDDaMsmPTvPsF+lt7yn6gr8fYtVJ45DU42SywN2gsHKe4P+T2KD/4oJJhO67DYpQM
 eJtWbDmuudskA52A+CL9xgIRLn74odJYj+tEZDcnBxQh+Qk4agq1ZTF+pKnHiuE9+Q
 DtYAOfBSsS0sfEWxanSclQfJPgSJyTdSkVUK88WUXD8cXnE4MiZbW44MUGe5Ct/j6z
 WoGouin0aHDR/fOKmxsUJ4fBAq+JGBZd9yN7BPKfzvNrR2YDmRsPWJMyfRJNbeguyt
 MZINJa5+5aFMQ==
To: Daniel Stone <daniel@fooishbar.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: EPOLL for drm_syncfile (was Re: [PATCH 4/4] RFC: dma-buf: Add an
 API for importing sync files (v6))
Message-ID: <oPuFlh8eznHljLyScverjUVyMZCazJlb8aH47SDFP-3KcFPzUyLGSbiwOtn2bJntvsVRLCAElpH3dCU2aDo-ENLsDjiQdaL-f-GIteA7RAQ=@emersion.fr>
In-Reply-To: <CAPj87rOdE35n4yCe6U_384u0YR4oZ=zb9wKOH4PKEC4Ti5gUSg@mail.gmail.com>
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <0a54d998-1c4b-724c-ec2d-a6c23aa35c21@amd.com>
 <CAPj87rOdE35n4yCe6U_384u0YR4oZ=zb9wKOH4PKEC4Ti5gUSg@mail.gmail.com>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sunday, May 23rd, 2021 at 11:34 PM, Daniel Stone <daniel@fooishbar.org> =
wrote:

> On the other hand, as soon as the sync point becomes available, the
> winsys will want to immediately extract a sync_file from it

With today's APIs, yes, but if we ever get drm_syncobj timeline support
in KMS/EGL(/Vulkan?) maybe this won't be necessary at some point.
