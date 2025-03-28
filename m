Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54EA748FA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF7710E0D0;
	Fri, 28 Mar 2025 11:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hBPDLDfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F2A10E0D0;
 Fri, 28 Mar 2025 11:09:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 88525A41823;
 Fri, 28 Mar 2025 11:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803BCC4CEE4;
 Fri, 28 Mar 2025 11:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743160158;
 bh=jpAvNwxAGa4avnNQMP1myH7Occ8e2O5ooHf8+rmEEYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hBPDLDfWH9ZBkNmyNPvmhHLWMFEsznSTNfsn9ddSbUHu3K43yB9/zEdWvQCpccBVH
 HJaw1deWiYcGUWei1w4gT6ca6gyvwFV6v2wCcsaMqdgh2dQUeDdlyOt0g3p+r10XdO
 ET7WTCpcHnuvh3vi9Z+fQb09OiZ1dz1v1ZmfiQN2miPsRHnqOhTe9KYsTY6TVvtxvJ
 fFiLw2MUxe/CBmqQpndJiMW/9LH68vH+bcsq6mmy8MjpqwaQeSYfPLov0a7qungrE2
 em7n5UD0IxmKIbxzoDvpdfpyz0Q3riDhRwHn1Mnz7WvWY6a91ajc7kD89zPzmagDy5
 TzqFBq5SkN8ZA==
Date: Fri, 28 Mar 2025 12:09:13 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: M Henning <mhenning@darkrefraction.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 bskeggs@nvidia.com, jhubbard@nvidia.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
Message-ID: <Z-aDWWUTN1MBI_wl@pollux>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <CAAgWFh2dHZs2D7R4ejY9sNQ+QCtLQeGGS2PNtcsm_MPeV3edLw@mail.gmail.com>
 <Z-VX3TJPI6Tgin2G@cassiopeiae>
 <CAAgWFh3c=qE+c8Q04W2NXpBLBeXC12qTKLNmZeJA65m+dTMG8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAgWFh3c=qE+c8Q04W2NXpBLBeXC12qTKLNmZeJA65m+dTMG8Q@mail.gmail.com>
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

(CC: Ben, John)

On Thu, Mar 27, 2025 at 02:03:21PM -0400, M Henning wrote:
> On Thu, Mar 27, 2025 at 9:51 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Fri, Mar 21, 2025 at 06:06:34PM -0400, M Henning wrote:
> > > On Thu, Mar 20, 2025 at 2:18 PM Danilo Krummrich <dakr@kernel.org> wrote:
> > > > On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
> > > > > +     __u32 width_align_pixels;
> > > > > +     __u32 height_align_pixels;
> > > > > +     __u32 pixel_squares_by_aliquots;
> > > > > +     __u32 aliquot_total;
> > > > > +     __u32 zcull_region_byte_multiplier;
> > > > > +     __u32 zcull_region_header_size;
> > > > > +     __u32 zcull_subregion_header_size;
> > > > > +     __u32 subregion_count;
> > > > > +     __u32 subregion_width_align_pixels;
> > > > > +     __u32 subregion_height_align_pixels;
> > > > > +
> > > > > +     __u32 ctxsw_size;
> > > > > +     __u32 ctxsw_align;
> > > > > +};
> > > >
> > > > What if this ever changes between hardware revisions or firmware versions?
> > >
> > > There was some previous discussion of that here:
> > > https://gitlab.freedesktop.org/mesa/mesa/-/issues/12596#note_2796853
> > >
> > > From what I can tell, this structure hasn't really changed since
> > > FERMI_C (circa 2011), so I'm not too worried about it changing on us
> > > too quickly. When it does change, we have the option of appending more
> > > members to this struct in the usual way, or if the change is more
> > > fundamental we can return an error from this ioctl and add a new
> > > interface. Userspace needs to handle an error from this ioctl
> > > gracefully anyway since whether it works or not depends on the gpu
> > > generation and what firmware is loaded right now.
> >
> > We could also define it as
> >
> >         struct drm_nouveau_get_zcull_info {
> >                 __u32 version;
> >                 __u32 _pad;
> >
> >                 union {
> >                         struct drm_nouveau_get_zcull_info_v1 info;
> >                 }
> >         }
> >
> > just to be safe.
> 
> We can do that, although I don't see any other drm drivers using a
> similar pattern anywhere.

I think it's a bit cleaner than adding new members, leave existing ones unset or
add a new IOCTL in the worst case.

Maybe the NVIDIA folks can give us some hint on whether this is expected to
change at some point?
