Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 696C17BBB2C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 17:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225E710E512;
	Fri,  6 Oct 2023 15:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 352 seconds by postgrey-1.36 at gabe;
 Fri, 06 Oct 2023 15:04:38 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5C610E512
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 15:04:38 +0000 (UTC)
Received: from localhost (unknown [176.59.162.175])
 by mail.ispras.ru (Postfix) with ESMTPSA id F2AEF40AC4FC;
 Fri,  6 Oct 2023 14:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru F2AEF40AC4FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1696604323;
 bh=zZyzh/Wh062f7c3Pw72ZP1LjORx/TUbNNL9pBnx3IHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dGwvyiTcJ+S7nXsfw+yGpzN82Io1YNvYzzMhEJvDFESLdGo1JnCxBS5Ow+rnAVJHA
 Y17S495KNJrSmdRFRauK6uANBHgq1wX5el2eAzEaEqDxP05eKRQAZRZ7+wyc9g7ySH
 v2075D6sZr8eINFOwb0AgzoPzBZ3hcdkU6HLDWjw=
Date: Fri, 6 Oct 2023 17:58:35 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH] drm/crtc: do not release uninitialized connector reference
Message-ID: <3rrycldn3ssrqqyiowv3ariqigfonddps6d34zjquzar6fahtc@ozy6jqnaiq3c>
References: <20230721101600.4392-1-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721101600.4392-1-pchelkin@ispras.ru>
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
Cc: Daniel Stone <daniels@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/07/21 01:15PM, Fedor Pchelkin wrote:
> Inside drm_mode_setcrtc() connector_set is allocated using kmalloc_array()
> so its values are uninitialized. When filling this array with actual
> pointers to drm connector objects, an error caused with invalid ioctl
> request data may occur leading us to put references to already taken
> objects. However, the last elements of the array are left uninitialized
> which makes drm_connector_put() to be called with an invalid argument.
> 
> We can obviously just initialize the array with kcalloc() but the current
> fix chose a slightly different way.
> 
> The index of failing array element is known so just put references to the
> array members with lower indices.
> 
> The temporary 'connector' pointer seems to be redundant as we can directly
> fill the connector_set elements and thus avoid unnecessary NULL
> assignments and checks.
> 
> Found by Linux Verification Center (linuxtesting.org) with Syzkaller.
> 
> Fixes: b164d31f50b2 ("drm/modes: add connector reference counting. (v2)")
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>

I'm sorry for bothering everyone with this issue, but status of the patch
here [1] is still 'New', and I have no means to deduce whether the
subsystem maintainers didn't have time to review (it is totally
understandable as the amount of patches is enormous) or the patch was
missed somehow.

[1]: https://patchwork.kernel.org/project/dri-devel/patch/20230721101600.4392-1-pchelkin@ispras.ru/
