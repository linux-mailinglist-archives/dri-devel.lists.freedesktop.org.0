Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FB0AD859B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 10:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A5D10E202;
	Fri, 13 Jun 2025 08:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="v8gfinIX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ADE10E202;
 Fri, 13 Jun 2025 08:29:41 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bJXcx3YVtz9v10;
 Fri, 13 Jun 2025 10:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1749803377; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tNpSDNdMO+AR7AGKxlxT5hD4CHTTY7xIcpDZwJEt8dc=;
 b=v8gfinIX2Rzitbded0n7JKwEI/NpWg13y6RsTqtEddGvANJCEIJXK1Y9Xgq/7rUTSBWKCW
 d5wpPjSLy5gqIjTqW5LuAJkv9EzO4GjakMAzlph2hIIEArmwM+DPLbzDLYdQ4gOIa40SpC
 oPc5MClt0oQQ+0nYiKIfy2vN4rVJIadJCsTIqMsxEe5c54K4j4a+ChuiFtuVPSq8BLwo3/
 WQPuUTBLiAWfIoXsYWe0HT/V3dgjd+t/pNRqjXWc3r7J8Lzdticw4U7l+Y/IGuiyPwe1Im
 RpgSTw4xNwwmal7pYmrRIAujUIYzfI4YbR6I/2re+xcG2rmSHaOTzoSnXvDhew==
Message-ID: <a495f31526f19457f44d502cf2de98ab0de33383.camel@mailbox.org>
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org, Philipp Stanner
 <phasta@kernel.org>, dri-devel@lists.freedesktop.org
Date: Fri, 13 Jun 2025 10:29:35 +0200
In-Reply-To: <099816b4-0b7b-4ac7-9bb5-22f23b1db7b7@amd.com>
References: <aEmR9420vj-ISz-W@cassiopeiae>
 <dc661205-1e5b-4697-863b-36a299365219@amd.com>
 <aEmcpsXwS8dLNGUg@cassiopeiae>
 <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com>
 <aEtnS6kvh1mssFTb@cassiopeiae>
 <099816b4-0b7b-4ac7-9bb5-22f23b1db7b7@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: fjsea1z6obwr5iqg6dy18tz7q8adyj98
X-MBO-RS-ID: 8aa27cae7fe50eeb8a3
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2025-06-13 at 10:23 +0200, Christian K=C3=B6nig wrote:
> On 6/13/25 01:48, Danilo Krummrich wrote:
> > On Thu, Jun 12, 2025 at 09:00:34AM +0200, Christian K=C3=B6nig wrote:
> > > On 6/11/25 17:11, Danilo Krummrich wrote:
> > > > > > > Mhm, reiterating our internal discussion on the mailing
> > > > > > > list.
> > > > > > >=20
> > > > > > > I think it would be nicer if we could use negative values
> > > > > > > for the kernel submissions and positive for userspace.
> > > > > > > But as discussed internally we would need to adjust the
> > > > > > > scheduler trace points for that once more.
> > > > > > >=20
> > > > > > > @Philip and @Danilo any opinion on that?
> > > > > >=20
> > > > > > Both, the U64_MAX and the positive-negative approach, are a
> > > > > > bit hacky. I wonder
> > > > > > why we need client_id to be a u64, wouldn't a u32 not be
> > > > > > enough?
> > > > >=20
> > > > > That can trivially overflow on long running boxes.
> > > >=20
> > > > I don't know if "trivially" is the word of choice given that
> > > > the number is
> > > > 4,294,967,295.
> > > >=20
> > > > But I did indeed miss that this is a for ever increasing
> > > > atomic. Why is it an
> > > > atomic? Why is it not an IDA?
> > >=20
> > > Well IDA has some extra overhead compared to an ever increasing
> > > atomic, additional to that it might not be the best choice to re-
> > > use numbers for clients in a trace log.
> >=20
> > I think the overhead is not relevant at all, this is called from
> > drm_file_alloc(). The only path I can see where this is called is
> > drm_client_init(), which isn't high frequent stuff at all, is it?
>=20
> I don't think so. But we should really use ida_alloc_cyclic to make
> sure that numbers are not re-used so quickly.

Shouldn't the xarray be used nowadays for ID allocation? I think
idr_alloc_cyclic() (ida_alloc_cyclic() doesn't exist) is just a wrapper
around the xarray anyways.

P.


>=20
> >=20
> > It seems to me that we should probably use IDA here.
> >=20
> > > On the other hand using smaller numbers is usually nicer for
> > > manual inspection.
> >=20
> > Another option is to just add an interface to get a kernel
> > client_id from the
> > same atomic / IDA.
>=20
> That won't give us fixed numbers for in kernel clients.
>=20
> Regards,
> Christian.

