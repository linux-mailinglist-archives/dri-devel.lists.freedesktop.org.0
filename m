Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB5948E75
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A579410E098;
	Tue,  6 Aug 2024 12:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Po++H5LH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2825210E098;
 Tue,  6 Aug 2024 12:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722946130; x=1754482130;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=S1V02nqUaoyjNuEdgxsvZ5kH8wutgTCmsLH6Pey5JAQ=;
 b=Po++H5LH8Ra2cWmojpxy7dOAx5zhOP1yedMIB2kxMZW/M44GbDFhp0y8
 yw7XwjN2E4ho2WcdHpSRQjAgMwUFdIoMwrRjZzIkeIemmv0yfVIdbguzI
 oD5bhzbu4pR/5U1co6g3HeboigZPErX7jQHnFNS8yDwAkcl2ThlOvNalw
 5s7KrncsMXIAXcMQqW05LmXvSAMwP3Waj/+VLxjqh+TB727ZaBPvUIXS9
 3RuVw3W8FOmTlsQmSffCeC9RSgE09E4y3BmK2x5UH7b7Mm56pVBt4BMvs
 0iZ0qCcdhKn4tM+Td9muDCLNS9Cu4KLnUJi/QDU1wIeXCYim7KrkEukg7 w==;
X-CSE-ConnectionGUID: VKlakmOZTHG1A8VYe4S5Kw==
X-CSE-MsgGUID: JsPD7OCRTcKfyDZ+DQsHfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21105904"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="21105904"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 05:08:49 -0700
X-CSE-ConnectionGUID: jgCaWL5QTJGw+S2JbgoURQ==
X-CSE-MsgGUID: qCoQW7X2S4ilZiifII0lhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="61120786"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 05:08:45 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZrHw3y8QKPT87LxP@ashyti-mobl2.lan>
References: <20240805102554.154464-1-andi.shyti@linux.intel.com>
 <ZrFMopcHlT6G7p3V@ashyti-mobl2.lan> <2024080640-landfall-doozy-e0d2@gregkh>
 <ZrHw3y8QKPT87LxP@ashyti-mobl2.lan>
Subject: Re: [PATCH v2 0/2] Fix mmap memory boundary calculation
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Jann Horn <jannh@google.com>, Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 06 Aug 2024 15:08:40 +0300
Message-ID: <172294612086.38654.15621922821489001205@jlahtine-mobl.ger.corp.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Andi Shyti (2024-08-06 12:46:07)
> Hi Greg,
>=20
> same question without the stable mailing list not to trigger the
> automatic reply.
>=20
> > Andi Shyti (2):
> >   drm/i915/gem: Adjust vma offset for framebuffer mmap offset
> >   drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
>=20
> I have forgotten to actually Cc the stable mailing list here.
> These two patches need to be merged together even if only the
> second patch has the "Fixes:" tag.
>=20
> I could have used the "Requires:" tag, but the commit id would
> change in between merges and rebases.

The patches were the top two in drm-intel-gt-next and committed
only few hours ago so I fixed up the patches adding Cc: stable
and Requires:

Regards, Joonas

>=20
> Is there anything I should still do here? Do you want me to
> take care and send the backports for kernels starting from 4.19?
>=20
> Thanks,
> Andi
