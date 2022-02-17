Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1724BA08A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 14:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C84110ED98;
	Thu, 17 Feb 2022 13:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24B910ED98
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 13:03:06 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6E7647F;
 Thu, 17 Feb 2022 14:03:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645102985;
 bh=fmGNkvDxKEzYBZ9w2iowuzgmO/punzJ1e+W/3pqe3jg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nK5c9d3dofyn8/Qg3gDKxx5OzAQ4ieOLTGemE3Nb6XEFyY9sytttgDyCj9WYgo+2m
 jmojucO1qbz+0wMWmlkilyqmVhzKhikVyFw5tSX8nGD9eitiRQAULW31c12WxcEbPP
 MzFtZjpQnT3TdVsqN2b+MesAHgZuDWySXzDmnrRk=
Message-ID: <be4e1cd8-a994-303d-9424-14439ce1f7d4@ideasonboard.com>
Date: Thu, 17 Feb 2022 15:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] drm: omapdrm: Fix excessive GEM buffers DMM/CMA usage
Content-Language: en-US
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, tomba@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
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

Hi Ivaylo,

On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
> This patch series fixes excessive DMM or CMA usage of GEM buffers leading to
> various runtime allocation failures. The series enables daily usage of devices
> without exausting limited resources like CMA or DMM space if GPU rendering is
> needed.
> 
> The first patch doesn't bring any functional changes, it just moves some
> TILER/DMM related code to a separate function, to simplify the review of the
> next two patches.
> 
> The second patch allows off-CPU rendering to non-scanout buffers. Without that
> patch, it is basically impossible to use the driver allocated GEM buffers on
> OMAP3 for anything else but a basic CPU rendered examples as if we want GPU
> rendering, we must allocate buffers as scanout buffers, which are CMA allocated.
> CMA soon gets fragmented and we start seeing allocation failures. Such failres
> in Xorg cannot be handeled gracefully, so the system is basically unusable.
> 
> Third patch fixes similar issue on OMAP4/5, where DMM/TILER spaces get
> fragmented with time, leading to allocation failures.

I think this is just hacking around the problem. The problem is that 
omapdrm is being used by some as a generic buffer allocator. Those users 
should be changed to use a their own allocator or a generic allocator. 
And we could then drop the OMAP_BO_SCANOUT flag, as all buffers would be 
scanout buffers.

Or do we have a regression in the driver? My understanding is that this 
has never really worked.

  Tomi
