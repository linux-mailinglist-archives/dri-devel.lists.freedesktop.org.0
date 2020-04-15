Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3030B1A999D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 11:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B5F6E933;
	Wed, 15 Apr 2020 09:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBC06E933
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 09:53:28 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 2CE808046E;
 Wed, 15 Apr 2020 11:53:26 +0200 (CEST)
Date: Wed, 15 Apr 2020 11:53:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Osipenko <digetx@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] Support DRM bridges on NVIDIA Tegra
Message-ID: <20200415095324.GB30444@ravnborg.org>
References: <20200414222007.31306-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414222007.31306-1-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=f6-GpgHWSS8o9bTNT1UA:9 a=CjuIK1q_8ugA:10
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dimitry.

Added Laurent that is the arthitecht behind the new bridge model
briefly explained below.

On Wed, Apr 15, 2020 at 01:20:05AM +0300, Dmitry Osipenko wrote:
> Hello,
> 
> This small series adds initial support for the DRM bridges to NVIDIA Tegra
> DRM driver. This is required by newer device-trees where we model the LVDS
> encoder bridge properly.
> 
> Please note that the first "Support DRM bridges" patch was previously sent
> out as a standalone v1 change.
> 
> Changelog:
> 
> v2: - Added the new "rgb: Don't register connector if bridge is used"
>       patch, which hides the unused connector provided by the Tegra DRM
>       driver when bridge is used, since bridge provides its own connector
>       to us.

We are moving to a model where the display driver have the
responsibility to create the connector - not the bridge.

The flags argument to:

    drm_bridge_attach(encoder, bridge, previous, flags);

is used to tell if the brigde shall create the connector or the display
driver does it - DRM_BRIDGE_ATTACH_NO_CONNECTOR.

It would be preferred that we moved the relevant bridge drivers to the
new model no so you did not need to support the old model in the driver.

If you help identify the bridge drivers we could migrate them to the new
model and you could help testing?

What bridge drivers will be used for tegra?

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
