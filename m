Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE018AE67D7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 16:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AD410E5D0;
	Tue, 24 Jun 2025 14:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lqymA6bO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DAF10E5CC;
 Tue, 24 Jun 2025 14:09:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A130E43730;
 Tue, 24 Jun 2025 14:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E5FC4CEE3;
 Tue, 24 Jun 2025 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750774159;
 bh=N9FFUmIdDzVMU8XsJRCCmoPnShJDK1x8yp/Sugg6+iE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lqymA6bOfjgmSBBYC8KvTYLoY2Fq4JzsZf5a4Crbr4RuU0GSagPpMnYnTKUvUaf3A
 prkvZQ78pu948053uqmFodxfpwVFxEEUbo/0OSliobF52Eey/eTEZXEpXt5aOJt5Xo
 /ErkUreEosCfgiPfOfq08ofbBKg1oFQ/IQJeFzNIlgZi3eeoIuhUySbosmSBJ5igeh
 3VXy7Zsa+oEZbYSTDfxUThWxsfkWQOaoK6v00n0gru84oEEEuXAfhfPJqL6kYLtg6D
 ymqrj33zjM3km4Yn0ufGPthuaInGM44NXnhES3TRmMG8MekVAqgDWo0u15l8lOisWr
 k/4vbhkex8tjA==
Date: Tue, 24 Jun 2025 16:09:15 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: impl From for u32 for enums used
 from register!
Message-ID: <aFqxi7AvQiBLl528@pollux>
References: <20250624132337.2242-1-dakr@kernel.org>
 <DAUT7K6AFAXI.I6R4SBSYLRKP@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAUT7K6AFAXI.I6R4SBSYLRKP@nvidia.com>
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

On Tue, Jun 24, 2025 at 10:48:57PM +0900, Alexandre Courbot wrote:
> On Tue Jun 24, 2025 at 10:23 PM JST, Danilo Krummrich wrote:
> > Implement From for u32 for all enum types used within the register!()
> > macro.
> >
> > This avoids a conflict with [1] as reported in [2].
> >
> > Cc: Alexandre Courbot <acourbot@nvidia.com>
> > Cc: Miguel Ojeda <ojeda@kernel.org>
> > Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com [1]
> > Link: https://lore.kernel.org/all/20250624173114.3be38990@canb.auug.org.au/ [2]
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> Also confirmed that Ampere still successfully probed with this:
> 
> Tested-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> One small comment and question below.
> 
> > ---
> >  drivers/gpu/nova-core/falcon.rs | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> > index 07be1c30668c..1affffb109ec 100644
> > --- a/drivers/gpu/nova-core/falcon.rs
> > +++ b/drivers/gpu/nova-core/falcon.rs
> > @@ -20,6 +20,16 @@
> >  mod hal;
> >  pub(crate) mod sec2;
> >  
> > +macro_rules! impl_from_enum_to_u32 {
> > +    ($enum_type:ty) => {
> > +        impl From<$enum_type> for u32 {
> > +            fn from(value: $enum_type) -> Self {
> > +                value as u32
> > +            }
> > +        }
> > +    };
> > +}
> 
> We might need some equivalent in other modules as well in the future -
> do you think we should move it to the root of the driver, and explain
> its purpose with a comment?

Let's do that once we need it in other modules.

> I am also thinking that we might want to turn this into a derive macro
> in the future, similar to `FromPrimitive` - so maybe a TODO item is
> warranted for this. I haven't looked closely at the `FromPrimitive`
> patchset yet but it would be neat if we could leverage it somehow.

This sounds exactly like what IntoPrimitive does. So, yes, I can add a comment
to replace the macro with IntoPrimitive in the future.
