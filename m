Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF666C0D278
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 12:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468FE10E43E;
	Mon, 27 Oct 2025 11:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aiZpBWl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B3E10E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761564708;
 bh=JaOev6RH5sKDkCyOnhMzD01pkFcy+37y3Uaf6kblozw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aiZpBWl8iKR0t8FCiqI+2BWJK86Rbc0FvAjzovQyGgXA2B7Fvhz+UiyYNEagTcSkR
 F7D0FPOfvGcLG4ppUXrEFmICHUrZ8Hw7KTuM+ySXt/o/IeF/assHegqLXJEdURA4Bp
 y5C1pCsdylTwXOQM7S3iGUuEcULqCZHM7BE0GxAOJXPxxmN4FzoPKEX/ABlmNQAEsK
 Mu3tsEEV6XgyGqtntPgUw9LGVf2RZOTxK04DhwFcShZDSdMvzLPK/xF0k/vqNgYmo2
 scf7hAtu3a4vE1hxGlBhINBrJDoRVGDkfQGfRrDkrk7tjYkHbELBcMQtIN0F4sQC8z
 jX5EG9J9Q8oKQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id ECAD817E10F4;
 Mon, 27 Oct 2025 12:31:47 +0100 (CET)
Date: Mon, 27 Oct 2025 12:31:41 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] drm/panthor: Support GLB_REQ.STATE field for
 Mali-G1 GPUs
Message-ID: <20251027123141.089c5a97@fedora>
In-Reply-To: <6c301d19-7f80-471d-a431-8b936d7eb362@arm.com>
References: <20251024202117.3241292-1-karunika.choo@arm.com>
 <20251024202117.3241292-7-karunika.choo@arm.com>
 <20251026092717.3aae3679@fedora>
 <6c301d19-7f80-471d-a431-8b936d7eb362@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Oct 2025 10:43:42 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> On 26/10/2025 08:27, Boris Brezillon wrote:
> > On Fri, 24 Oct 2025 21:21:15 +0100
> > Karunika Choo <karunika.choo@arm.com> wrote:
> >   
> >> +static bool panthor_fw_has_glb_state(struct panthor_device *ptdev)
> >> +{
> >> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> >> +
> >> +	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0);
> >> +}  
> > 
> > It's okay for now, but if we start having more of these, we probably
> > want to automate the generation of those has_<featurex>() helpers with
> > something like:
> > 
> > #define FW_FEATURE(feat_name, major, minor)						\
> > static bool panthor_fw_has_ ## feat_name(struct panthor_device *ptdev) 			\
> > {											\
> > 	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev); 	\
> > 											\
> > 	return glb_iface->control->version >= CSF_IFACE_VERSION(major, minor, 0);	\
> > }
> > 
> > Same goes for the HW features BTW.
> >   
> 
> I wonder if at that point, would a bitmask as previously proposed be a
> cleaner solution? I have a minor bone to pick with MACROs that generate
> functions as they make finding its definition unnecessarily complicated
> and obtuse. Not to mention if the conditions for a feature changes and
> is disjoint from all the others, updating the macro to handle these
> would cause additional churn that I would really hope to avoid.

Let's do without the macros for now.
