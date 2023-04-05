Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DFE6D8834
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 22:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD4610E22E;
	Wed,  5 Apr 2023 20:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F70B10E22E;
 Wed,  5 Apr 2023 20:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680726406; x=1712262406;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=qaKusVN7CdjCGVJHkao8zVo8wm1oK87hwBXuCZ3VQSg=;
 b=QA+mYkwjhTgxIPEf4sAM8NsujNPySVfIaZp060V6dNZzwx+WEAkCVFb4
 bzfCetx9Yn7u9B1iURp9XHBJsh1okejt47lddzcQSa2b5D/o4SCS4zNSp
 PsPU2QZRTVfUnnddER6w0iMbJwsKrfh3R4mNiYO8pCZ+6H96ep08+pxw7
 H7/SKY9YcOkdNnWO8D6cpbVo0wWGejMGlCFBU2flp/9e5r4ewdQQpblgE
 saR1nwoiWs6BMfjwz3WIG3L17azAHlWBwWwmSsXPNgXx9tCuBfkg48Bmx
 C+2WqYXdEkNCJtEeNwBPTWBHw5mxGZY0MuqgzwXku9VrjCIqMBTyim6Ed A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="326595288"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="326595288"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 13:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="1016609461"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="1016609461"
Received: from srismrit-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.209.18.251])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 13:26:44 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7fd9424a-678a-0d90-715c-f63179552093@intel.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-8-fei.yang@intel.com>
 <7aa541f8-55e3-a182-5390-6ca161edb70b@intel.com>
 <BYAPR11MB256790AC5BDC891F186E000E9A939@BYAPR11MB2567.namprd11.prod.outlook.com>
 <7fd9424a-678a-0d90-715c-f63179552093@intel.com>
Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache at BO
 creation
From: Jordan Justen <jordan.l.justen@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Wed, 05 Apr 2023 13:26:43 -0700
Message-ID: <168072640394.392286.10003850953246720395@jljusten-skl>
User-Agent: alot/0.10
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-05 00:45:24, Lionel Landwerlin wrote:
> On 04/04/2023 19:04, Yang, Fei wrote:
> >> Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache=
 at BO creation
> >>
> >> Just like the protected content uAPI, there is no way for userspace to=
 tell
> >> this feature is available other than trying using it.
> >>
> >> Given the issues with protected content, is it not thing we could want=
 to add?
> > Sorry I'm not aware of the issues with protected content, could you ela=
borate?
> > There was a long discussion on teams uAPI channel, could you comment th=
ere if
> > any concerns?
> >
>=20
> We wanted to have a getparam to detect protected support and were told=20
> to detect it by trying to create a context with it.
>=20

An extensions system where the detection mechanism is "just try it",
and assume it's not supported if it fails. ??

This seem likely to get more and more problematic as a detection
mechanism as more extensions are added.

>=20
> Now it appears trying to create a protected context can block for=20
> several seconds.
>=20
> Since we have to report capabilities to the user even before it creates=20
> protected contexts, any app is at risk of blocking.
>=20

This failure path is not causing any re-thinking about using this as
the extension detection mechanism?

Doesn't the ioctl# + input-struct-size + u64-extension# identify the
extension such that the kernel could indicate if it is supported or
not. (Or, perhaps return an array of the supported extensions so the
umd doesn't have to potentially make many ioctls for each extension of
interest.)

-Jordan
