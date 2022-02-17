Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AC54BA04F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 13:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C61510ECAA;
	Thu, 17 Feb 2022 12:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200F210ECAA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 12:46:06 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DA3225B;
 Thu, 17 Feb 2022 13:46:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645101963;
 bh=nhhWEcMkMbDxADxYj1RgUC6I3/acetFo25XZBSPdrPE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oZ/GpToytbAjcw3RLuZE5OIQ/+i4mlgrLvXUyzeNY8rf0ExbBpwe8/N3XglPrQcI9
 6p+tM1IHb/E72I3YAptgdVYsXUw0ZYAgpb4MyI8SbGtHcitDyjWGEGkhCycktuT2vG
 fmm/+L2OmNutcFeyI5bUiLWAI8cmb9NS+htergCM=
Message-ID: <5b6d3e7f-c638-fdc7-5080-44d34abed610@ideasonboard.com>
Date: Thu, 17 Feb 2022 14:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
Content-Language: en-US
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, tomba@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: tony@atomide.com, merlijn@wizzup.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
> On devices with DMM, all allocations are done through either DMM or TILER.
> DMM/TILER being a limited resource means that such allocations will start
> to fail before actual free memory is exhausted. What is even worse is that
> with time DMM/TILER space gets fragmented to the point that even if we have
> enough free DMM/TILER space and free memory, allocation fails because there
> is no big enough free block in DMM/TILER space.
> 
> Such failures can be easily observed with OMAP xorg DDX, for example -
> starting few GUI applications (so buffers for their windows are allocated)
> and then rotating landscape<->portrait while closing and opening new
> windows soon results in allocation failures.
> 
> Fix that by mapping buffers through DMM/TILER only when really needed,
> like, for scanout buffers.

Doesn't this break users that get a buffer from omapdrm and expect it to 
be contiguous?

  Tomi
