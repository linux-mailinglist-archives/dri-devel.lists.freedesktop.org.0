Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84128A6AEE8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 21:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDEC10E6AC;
	Thu, 20 Mar 2025 20:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aje9PgHv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D138410E6AC;
 Thu, 20 Mar 2025 20:02:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3EAD261141;
 Thu, 20 Mar 2025 20:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13F9C4CEDD;
 Thu, 20 Mar 2025 20:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742500921;
 bh=i3WfG5c6IPfcSy7odP9dZ3iHn8TTdku8T3gtbJZmXWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aje9PgHvC7Dg4DAcMApuD2h8Kxkphbgn7rVejMQrtY+UmnxI1pjXSREyjf0M7TpgB
 qTTKsUH48PJH1ExOmEXnPHPEuT5xCF22ysL+g3ByWoE09vHRzAvCu/lY7AYUB+ljnu
 2a6BSgriDiCX2ShzXphB2eLkRaI6MiCc/IMgmoczCKbQaITckwsOlIFIMQC3GxeqqW
 WH8WLeWcDkzY/kDA86OinJNtSro4qLqT88VMe9389fdmX/LOIoXkpFG/t1tYQzNc9w
 sjSgNnxLLoByCaJnMTnyYOv2x/YtNPesDHfpnrWRgYmXFwzjpu8TkZJaSlM2+4joOX
 b6I77cdF2Xfpw==
Date: Thu, 20 Mar 2025 21:01:56 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: Mel Henning <mhenning@darkrefraction.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
Message-ID: <Z9x0NLY6HHsvxOFD@pollux>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <abcc6ddc-47d5-4970-8fc1-e82c150fbfd9@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abcc6ddc-47d5-4970-8fc1-e82c150fbfd9@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 21, 2025 at 05:57:55AM +1000, Ben Skeggs wrote:
> On 21/3/25 04:18, Danilo Krummrich wrote:
> 
> > Hi Mel,
> > 
> > On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
> 
> > > @@ -72,6 +75,9 @@ struct nvkm_device {
> > >   		bool armed;
> > >   		bool legacy_done;
> > >   	} intr;
> > > +
> > > +	bool has_zcull_info;
> > > +	struct drm_nouveau_get_zcull_info zcull_info;
> > This is bypassing the nvif layer entirely. I think you should store the contents
> > of struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS in struct r535_gr and have an
> > nvif interface to access the data.
> 
> I agree here, though nvkm_gr would be a better choice for a couple of
> reasons, not least that it's possible (and should be reasonably trivial) to
> support this on earlier GPUs - should someone desire to at a later point.

I agree, if the interface is stable enough -- I don't know whether this is prone
to change or not.
