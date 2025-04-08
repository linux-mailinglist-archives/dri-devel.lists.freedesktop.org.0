Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D2A81980
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 01:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8483D10E046;
	Tue,  8 Apr 2025 23:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CzzrHhUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2B610E046;
 Tue,  8 Apr 2025 23:40:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0EAB3A48971;
 Tue,  8 Apr 2025 23:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED22BC4CEE5;
 Tue,  8 Apr 2025 23:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744155650;
 bh=w8WNLSYZmb9/xLHbug4cdRQyjCqIMSm1ZBujwdhR15g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CzzrHhUSVDtNrOk4VgK7MkDntTVN7+6KnW38r50qRtJV/OTMLA+Nza24pRY+5L7/w
 86cfH65IT4wUWicYMmVlsN/CXi3edQIW9ygXWJfUCPeEFCT6KM3rBhL2zxmy7o+H3k
 uHfzvxxs/p0g0NoWV0AiJ0UOrsQoeCz0Zcj1rwOfrxv4RF15YxkEkBXAJBbhvLRyUv
 NjsLJRX+GaXr1xR1gnB0dQkmQyttwLJC8wMv2WqcvaGiQ7dRVFJyqNqfZmgMMTwltj
 prpO/NXMo9nvj9zwV6Z3LSqn1ujjR/AHcz+MhUZx/EQQkCAM4umj09K2nlHgaGX9Dz
 mbEmDLIz6ZWuw==
Date: Tue, 8 Apr 2025 16:40:46 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] drm/nouveau: chan: Avoid
 -Wflex-array-member-not-at-end warnings
Message-ID: <202504081637.D17F824CE@keescook>
References: <Z-67Hm9uHEJs0RGw@kspp> <202504071227.E8484EB@keescook>
 <d8e63b8a-7a2c-46dc-a15c-9399044a23ee@embeddedor.com>
 <202504071336.0C708FCAB8@keescook>
 <a6dccb66-3f97-443f-85e5-fe089cd93a5e@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6dccb66-3f97-443f-85e5-fe089cd93a5e@embeddedor.com>
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

On Mon, Apr 07, 2025 at 05:35:47PM -0600, Gustavo A. R. Silva wrote:
> [..]
> 
> > > > > -	struct {
> > > > > -		struct nvif_chan_v0 chan;
> > > > > -		char name[TASK_COMM_LEN+16];
> > > > > -	} args;
> > > > > +	DEFINE_RAW_FLEX(struct nvif_chan_v0, args, name, TASK_COMM_LEN + 16);
> > > > >    	struct nvif_device *device = &cli->device;
> > > > >    	struct nouveau_channel *chan;
> > > > >    	const u64 plength = 0x10000;
> > > > > @@ -298,28 +295,28 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
> > > > >    		return ret;
> > > > >    	/* create channel object */
> > > > > -	args.chan.version = 0;
> > > > > -	args.chan.namelen = sizeof(args.name);
> > > > > -	args.chan.runlist = __ffs64(runm);
> > > > > -	args.chan.runq = 0;
> > > > > -	args.chan.priv = priv;
> > > > > -	args.chan.devm = BIT(0);
> > > > > +	args->version = 0;
> > > > > +	args->namelen = __struct_size(args) - sizeof(*args);
> > > > 
> > > > Does __struct_size(args->name) work here (and later)?
> > > 
> > > Why not?
> > 
> > Uhm, I'm genuinely curious. I *think* it will work, but because it's
> > within the struct, not outside of it, I'm unclear if it'll DTRT for
> > finding the size (since __builtin_object_size() can be touchy).
> > 
> > > I mean, this should be equivalent to `TASK_COMM_LEN+16`, I could
> > > use the latter if people prefer it (see my comments below).
> > 
> > Right, it should be the same. I think __struct_size(args->name) would be
> > much more readable ... if it works. :)
> 
> OK, I'll double check this.

Ah-ha, yes, I'm already testing this with KUnit:

struct bar {
        int a;
        u32 counter;
        s16 array[];
};
...
        DEFINE_RAW_FLEX(struct bar, two, array, 2);
	...
        KUNIT_EXPECT_EQ(test, sizeof(*two), sizeof(struct bar));
        KUNIT_EXPECT_EQ(test, __struct_size(two), sizeof(struct bar) + 2 * sizeof(s16));
        KUNIT_EXPECT_EQ(test, __member_size(two), sizeof(struct bar) + 2 * sizeof(s16));
        KUNIT_EXPECT_EQ(test, __struct_size(two->array), 2 * sizeof(s16));
        KUNIT_EXPECT_EQ(test, __member_size(two->array), 2 * sizeof(s16));


> I really don't want to condition -Wflex-array-member-not-at-end patches
> on counted_by patches, for now.

Fair enough. :) One thing at a time is wise!

-- 
Kees Cook
