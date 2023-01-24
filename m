Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D8679516
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9948E10E658;
	Tue, 24 Jan 2023 10:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9412D10E658
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 10:23:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7ACF68A9;
 Tue, 24 Jan 2023 11:23:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674555780;
 bh=wAoE3nL9AXo/c/8eTHbj0rkOa/JnlAv7+Quf8d5/1Pg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JtmtRW9dq1U0pn5SIGvA19HivHIn3yuGmvEtsYosUuVJT3ZKDK8fR4Tb2Llw8yvUf
 bu2EKQIXs0kznRsJKYyDbfsBCxJ3i1tT3DvrmHNxNo4Co3+cmXzqe/xrvAwUs9kY4H
 s46klWqBwFsk95Cc8lEuxjULMNNnTjKOFmzbGCHs=
Date: Tue, 24 Jan 2023 12:22:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Vaghela, Sunil" <sunil.vaghela@amd.com>
Subject: Re: Kernel v6.1: Plane IDs values incremented by 2, why ?
Message-ID: <Y8+xgKouIzRwLX+/@pendragon.ideasonboard.com>
References: <MN2PR12MB3168B62D85C081C330D22F8BEEC49@MN2PR12MB3168.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN2PR12MB3168B62D85C081C330D22F8BEEC49@MN2PR12MB3168.namprd12.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sunil,

On Thu, Jan 19, 2023 at 12:08:42PM +0000, Vaghela, Sunil wrote:
> [AMD Official Use Only - General]

This kind of header may deter some people from replying on mailing
lists. You may want to check if there's an outgoing mail server that you
can use for public discussions that wouldn't add this.

> Hi,
> 
> With Kernel v5.15 -> v6.1 upgradation, I have noticed that, now consecutive
> Plane IDs values are incremented by 2 each time. i.e. 34,36,38. In kernel
> v5.15, it was incremented by 1. i.e. 34,35,36…
> 
> I attached modetest log with kernel v6.1.
> 
> Is this change expected with new Kernel v6.1 ? If Yes, can you please elaborate
> the requirement/change.

As far as I understand, DRM object IDs are not part of the DRM ABI and
can thus change at any time, between releases or even between boots.
Userspace should not rely on any object having a specific ID.

As for why the IDs are not contiguous anymore, I believe that because of
the blob create by the call to create_in_format_blob() at the end of the
__drm_universal_plane_init() function. Blobs are DRM objects, so they're
assigned an ID.

-- 
Regards,

Laurent Pinchart
