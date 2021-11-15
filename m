Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA645083E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 16:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56DC6E14B;
	Mon, 15 Nov 2021 15:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A766E14B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 15:26:27 +0000 (UTC)
Date: Mon, 15 Nov 2021 15:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1636989984;
 bh=lsmQrRXaqaWUGz6Se0Lfcr8ja+M+BdoBVat0qymgHMU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=SpuMsbf2MGnkLvXFCvKuMfObFJ4PW+2DYi8jRr9Qc4WgaHv4XjGBK5bYcpbPX72w/
 q02FGJqz41WE6MU7CM7Pa8U9ERWhlHRAhc3gizKOy7j4dMeusrh2cGV8nseyXrXRTt
 XntCEHI5wV4egyd81dyJbPHUoU6TUCQnpohwz1B4YeBfZNF/XlGc5LqptJwpPvhJSS
 v9trss2CLmsJ1Zdf/QBWEsT9vBOPBSfycdACBWWdBNtdsx/+shH3kICKS/0uOxzovR
 8+XKbz0Gwl3uEeLtEHtoTL4LW6/2enb4mb71YT0/sx7KM5KfmSCxDyzfuXvCY6tOyg
 lJF/sw3V52TaQ==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: pre-fill getfb2 modifier array with INVALID
Message-ID: <jdA7DqM4EItfjw2BJt66_bk2GTK1Wv7-NmaaaG0e_KxJQDHx36noFuR1zQwnjaXuaLxPWnAatPVk6bDXut9oPaXaRX_7PLz0kKZCFUtBO_I=@emersion.fr>
In-Reply-To: <YZJ7UcXdNIvk918E@intel.com>
References: <20211111101049.269349-1-contact@emersion.fr>
 <YY0RjSE7mI4kkKNJ@intel.com>
 <D-6FSEcdyTRAZxrnW6mcb0iOVY3NfKMbT8WS7-f9Wn4i9jQ0YbmInyMwZRwb_aLzPvUSWz_KPs34RQ1tkCb3xuISVkTyjkmV5aMfGcdkQl8=@emersion.fr>
 <YZJ7UcXdNIvk918E@intel.com>
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
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hm indeed, RIP. I got confused by this one:

=09=09/* Pre-FB_MODIFIERS userspace didn't clear the structs properly. */
=09=09if (!(r->flags & DRM_MODE_FB_MODIFIERS))
=09=09=09continue;

But it's only run for unused planes.
