Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2903E134005
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 12:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB9A6E1B9;
	Wed,  8 Jan 2020 11:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9033E6E1B9;
 Wed,  8 Jan 2020 11:13:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 03:13:59 -0800
X-IronPort-AV: E=Sophos;i="5.69,409,1571727600"; d="scan'208";a="215921842"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 03:13:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 rodrigo.vivi@intel.com, irlied@linux.ie, daniel@ffwll.ch,
 sudeep.dutt@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [RFC 1/7] treewide: device: add condition support to
 dev_WARN
In-Reply-To: <20200106172326.32592-2-pankaj.laxminarayan.bharadiya@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200106172326.32592-2-pankaj.laxminarayan.bharadiya@intel.com>
Date: Wed, 08 Jan 2020 13:13:53 +0200
Message-ID: <87lfqiqjym.fsf@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Jan 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> dev_WARN does not support conditional warning unlike WARN.
>
> Add condition support to dev_WARN (file: include/linux/device.h)
> to make it work like WARN and modify all existing callers to use it.
>
> This is quite useful where we want to replace existing WARN with
> dev_WARN.
>
> Following cocci script is used to replace all the caller
>
>    @@
>    expression T;
>    @@
>    -dev_WARN(T,
>    +dev_WARN(T, 1,
>    ...)
>
> command: spatch --sp-file <.cocci> --dir ./ --in-place --include-headers
>
> Fix "drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h" manually as
> coccinelle is unable to parse this file.

Regardless of whether this patch itself makes sense or not, basing the
rest of your series on a treewide change subject to massive amounts of
bikeshedding is probably a bad idea. You'll potentially delay the
merging of the series by several kernel releases.

You'll probably want to handle this in i915 or drm level.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
