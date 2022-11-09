Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BB962320D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 19:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17E710E613;
	Wed,  9 Nov 2022 18:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33ECC10E613;
 Wed,  9 Nov 2022 18:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668017282; x=1699553282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YEfAUY3YOQK6mZCTiAjyc7h0pxn9/Q55gGTfX9fZ7hU=;
 b=cN2Pp0P9XSH5DXvWAyrQGsNQUHQvoUPHVieP93/EHmWJDAE8vS8YiRDM
 hL1DxL51sf3ro0mkpH1jgyg+fP6tFmQYykZJLe8siq6dDZKTdEO80ctS3
 KnZtY88vj/JbXkB0PGKq9DO1sl7hQIpC78ZumNMXwzjYjY+KqJXr9TxP8
 o1Ri5zcnfl3mIO6YqdzTl8TkPQnTUUlDLNsycElVvj1Bki8FNWRgyOAX+
 vc4uunpFx0LJ2xhe81LhM7/r4F4QF4fiynBd9Mli6hDhgyEqDqxpzFSqF
 c/1D3zokA7LvIr5mt25q0qzquG3eCRKIfTHcWNdtCMdmhuhv3UYJHodxc A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="397352391"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="397352391"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 10:08:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="587859416"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="587859416"
Received: from dvorobye-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.32.169])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 10:07:57 -0800
Date: Wed, 9 Nov 2022 19:07:52 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 0/3] add guard padding around i915_vma
Message-ID: <Y2vseBoG7PajfZ6D@ashyti-mobl2.lan>
References: <20221109174058.912720-1-andi.shyti@linux.intel.com>
 <f1f4123c3705c6883acdff4770e404704d54dc6e.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1f4123c3705c6883acdff4770e404704d54dc6e.camel@linux.intel.com>
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
Cc: Andi Shyti <andi@etezian.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Nov 09, 2022 at 07:03:03PM +0100, Thomas Hellström wrote:
> Hi, Andi,
> 
> This has been on the list before (three times I think) and at that
> point it (the guard pages) was NAK'd by Daniel as yet another
> complication, and a VT-d
> scanout workaround was implemented and pushed using a different
> approach, initially outlined by Daniel.
> 
> Patch is 2ef6efa79fecd. Those suspend/resumes should now be fast.
> 
> I then also discussed patch 1 separately with Dave Airlie and Daniel
> and since both me and Dave liked it, Daniel OK'd it, but it never made
> it upstream.
> 
> Just a short heads up on the history.

Thanks for letting me know, I missed this part of the history.
Will check what happened in the previous mails and your
improvement on the vt-d suspend/resume.

Thanks,
Andi
