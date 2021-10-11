Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE094294B3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 18:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108DE6E520;
	Mon, 11 Oct 2021 16:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B126E520
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 16:44:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="313112472"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="313112472"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 09:38:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="479931903"
Received: from veckl-mobl.ger.corp.intel.com (HELO localhost) ([10.249.41.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 09:38:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, Christian =?utf-8?Q?K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>
Cc: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, "Das\,
 Nirmoy" <Nirmoy.Das@amd.com>, "dri-devel\@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: Fw: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error handling
In-Reply-To: <YWRP1AbaRyfKKCiv@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211008091704.27094-1-nirmoy.das@amd.com>
 <87a6jjyhuo.fsf@intel.com> <YWAmZdRwnAt6wh9B@kroah.com>
 <02fc9da3-ebac-2df1-3a54-d764b273f91b@amd.com>
 <DM4PR12MB51368C12F6338C6F245D54B28BB29@DM4PR12MB5136.namprd12.prod.outlook.com>
 <c4f1464d-19b6-04a3-e2d8-a153bfbb050a@amd.com> <YWBfvILqkBQ8VSYc@kroah.com>
 <936fed94-e56b-e4a6-6d1d-9830e8907d6c@gmail.com> <YWRP1AbaRyfKKCiv@kroah.com>
Date: Mon, 11 Oct 2021 19:38:22 +0300
Message-ID: <878ryz1pq9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 11 Oct 2021, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Mon, Oct 11, 2021 at 04:19:58PM +0200, Christian K=C3=B6nig wrote:
>> > > > > And then throw it away, later, when you want to remove the direc=
tory,
>> > > > > look it up with a call to debugfs_lookup() and pass that to
>> > > > > debugfs_remove() (which does so recursively).
>> > > > >=20
>> > > > > There should never be a need to save, or check, the result of any
>> > > > > debugfs call.=C2=A0 If so, odds are it is being used incorrectly.
>> > > Yeah, exactly that's the problem I see here.
>> > >=20
>> > > We save the return value because the DRM subsystem is creating a deb=
ugfs
>> > > directory for the drivers to use.
>> > That's fine for now, not a big deal.  And even if there is an error,
>> > again, you can always feed that error back into the debugfs subsystem =
on
>> > another call and it will handle it correctly.
>>=20
>> Problem is it isn't, we have a crash because the member isn't a pointer =
but
>> an ERR_PTR instead.
>
> Again, that is fine, you can feed that into debugfs and it will "just
> work".  Treat it as an opaque pointer, not a *dentry and you will be
> fine.

Hmm, some of the patches add things like:

+
+	if (!root)
+		goto error;
+
	minor->debugfs_root =3D debugfs_create_dir(name, root);

Superficially this seems okay, as it looks like debugfs_create_dir()
doesn't actually cope with NULL values. However, since ->debugfs_root
comes from debugfs_create_dir() I presume it'll never be NULL on errors
anyway but rather an error pointer!

So I think we probably need to go through the drm subsystem and look for
existing similar patterns in fix them.

BR,
Jani.



>
> thanks,
>
> greg k-h

--=20
Jani Nikula, Intel Open Source Graphics Center
