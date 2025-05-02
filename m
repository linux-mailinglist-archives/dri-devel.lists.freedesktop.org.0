Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558C9AA6FFE
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 12:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319F310E16E;
	Fri,  2 May 2025 10:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlmcIdQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D541D10E16E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 10:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746182722; x=1777718722;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kabmlv0KkQDAyrTzn6zjy1nl1svXPwvfHYYf/932dMc=;
 b=VlmcIdQnp+DAosihl0SZHCHO0XrSyE/+vVVrQmR91INRCzG2lwsFDlhz
 0pbnHW1fNQLTmEEG/EuYspxeLJf60sxVNlQZZx5+wCzxl+5sPNOWFn/e2
 s0jCJwGjD8P16SN+XRSCRAax+kXc6dHVRctpqYuuHTb4mdnUlFwWsQ/N2
 o457cIaB3fku1jALc+aHpIK+j1i8s78NWmUlxUiF3zPoELV0738Xuwtw5
 I/UZ+H0L9KvvADH7V9u6k0DxLkxPKaxmmiwrrVtuBdFC8Xsfoi8mPd/3I
 gfe8kYwqwiqfCa9uvWqzIV4N3Js4zVNW9PfNtt1F4AbP8/0nEPwGe/Ry/ Q==;
X-CSE-ConnectionGUID: DSW4mVJUSXGrcAJ8cL57zw==
X-CSE-MsgGUID: dgPlvHQ7T1e8IwL9upg14A==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47874586"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="47874586"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 03:45:22 -0700
X-CSE-ConnectionGUID: xCwqsuJUQiCqtrX/wmzsYw==
X-CSE-MsgGUID: Dr+n9SJTRY+OMs3pDcKF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="139612566"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.151])
 ([10.245.246.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 03:45:17 -0700
Message-ID: <9c8dbbafdaf9f3f089da2cde5a772d69579b3795.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/ttm: Silence randstruct warning about casting
 struct file
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Matthew Brost <matthew.brost@intel.com>
Cc: Kees Cook <kees@kernel.org>, Somalapuram Amaranath	
 <Amaranath.Somalapuram@amd.com>, Huang Rui <ray.huang@amd.com>, Matthew
 Auld	 <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 	linux-hardening@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>
Date: Fri, 02 May 2025 12:44:26 +0200
In-Reply-To: <da694af6-1a9a-4cee-86b7-1da97e1e91de@amd.com>
References: <20250502002437.it.851-kees@kernel.org>
 <aBQqOCQZrHBBbPbL@lstrano-desk.jf.intel.com>
 <20250502023447.GV2023217@ZenIV>
 <aBRJcXfBuK29mVP+@lstrano-desk.jf.intel.com>
 <20250502043149.GW2023217@ZenIV>
 <aBRPeLVgG5J5P8SL@lstrano-desk.jf.intel.com>
 <20250502053303.GX2023217@ZenIV>
 <da694af6-1a9a-4cee-86b7-1da97e1e91de@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Fri, 2025-05-02 at 09:49 +0200, Christian K=C3=B6nig wrote:
> On 5/2/25 07:33, Al Viro wrote:
> > On Thu, May 01, 2025 at 09:52:08PM -0700, Matthew Brost wrote:
> > > On Fri, May 02, 2025 at 05:31:49AM +0100, Al Viro wrote:
> > > > On Thu, May 01, 2025 at 09:26:25PM -0700, Matthew Brost wrote:
> >=20
> > > > And what is the lifecycle of that thing?=C2=A0 E.g. what is
> > > > guaranteed about
> > > > ttm_backup_fini() vs. functions accessing the damn thing?=C2=A0 Are
> > > > they
> > > > serialized on something/tied to lifecycle stages of struct
> > > > ttm_tt?
> > >=20
> > > I believe the life cycle is when ttm_tt is destroyed or api
> > > allows
> > > overriding the old backup with a new one (currently unused).
> >=20
> > Umm...=C2=A0 So can ttm_tt_setup_backup() be called in the middle of
> > e.g. ttm_backup_drop() or ttm_backup_{copy,backup}_page(), etc.?
> >=20
> > I mean, if they had been called by ttm_backup.c internals, it would
> > be an internal business of specific implementation, with all
> > serialization, etc. warranties being its responsibility;
> > but if it's called by other code that is supposed to be isolated
> > from details of what ->backup is pointing to...
> >=20
> > Sorry for asking dumb questions, but I hadn't seen the original
> > threads.=C2=A0 Basically, what prevents the underlying shmem file
> > getting
> > torn apart while another operation is using it?=C2=A0 It might very wel=
l
> > be simple, but I had enough "it's because of... oh, bugger" moments
> > on the receiving end of such questions...
>=20
> It's the outside logic which makes sure that the backup structure
> stays around as long as the BO or the device which needs it is
> around.
>=20
> But putting that aside I was not very keen about the whole idea of
> never defining the ttm_backup structure and just casting it to a file
> in the backend either.
>=20
> So I would just completely nuke that unnecessary abstraction and just
> use a pointer to a file all around.

Hmm, yes there were early the series a number of different
implementations of the struct ttm_backup. Initially because previous
attempts of using a shmem object failed but now that we've landed on a
shmem object, We should be able to replace it with a struct file
pointer.

Let me take a look at this.=20

/Thomas

>=20
> Regards,
> Christian.

