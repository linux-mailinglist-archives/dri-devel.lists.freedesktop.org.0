Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B24D714C862
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 10:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012F76E223;
	Wed, 29 Jan 2020 09:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EC06E223
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 09:53:17 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 01:53:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,377,1574150400"; d="scan'208";a="247010492"
Received: from jasonmor-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.21.40])
 by orsmga002.jf.intel.com with ESMTP; 29 Jan 2020 01:53:14 -0800
Date: Wed, 29 Jan 2020 09:53:13 +0000
From: Eric Engestrom <eric.engestrom@intel.com>
To: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH libdrm] meson.build: Don't detect <sys/sysctl.h> header
 for linux
Message-ID: <20200129095313.3uhaqa6ada2jpaie@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
References: <1578562330-25594-1-git-send-email-sw0312.kim@samsung.com>
 <1578630641-5301-1-git-send-email-sw0312.kim@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578630641-5301-1-git-send-email-sw0312.kim@samsung.com>
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
Cc: zeising@daemonic.se, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, 2020-01-10 13:30:41 +0900, Seung-Woo Kim wrote:
> The <sys/sysctl.h> header is not required for Linux and GNU libc
> 2.30 starts to warn about Linux specific <sys/sysctl.h> header
> deprecation. Don't detect <sys/sysctl.h> header for linux.
> 
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> ---
> Fix meson.build script instead of code itself as commented below:
> https://patchwork.kernel.org/patch/11325345/
> ---
>  meson.build |   15 +++++++++++----
>  1 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 782b1a3..b1c557a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -183,10 +183,17 @@ else
>    dep_rt = []
>  endif
>  dep_m = cc.find_library('m', required : false)
> -# From Niclas Zeising:
> -# FreeBSD requires sys/types.h for sys/sysctl.h, add it as part of the
> -# includes when checking for headers.
> -foreach header : ['sys/sysctl.h', 'sys/select.h', 'alloca.h']
> +if not ['linux'].contains(host_machine.system())
> +  # From Niclas Zeising:
> +  # FreeBSD requires sys/types.h for sys/sysctl.h, add it as part of the
> +  # includes when checking for headers.
> +  foreach header : ['sys/sysctl.h']
> +    config.set('HAVE_' + header.underscorify().to_upper(),
> +      cc.compiles('#include <sys/types.h>\n#include <@0@>'.format(header), name : '@0@ works'.format(header)))
> +  endforeach
> +endif
> +endforeach

Stray `endforeach`.

Could you post your patch as a Merge Request [1] instead of on the mailing list?
The automatic testing there means it would instantly catch mistakes like these :)

[1] https://gitlab.freedesktop.org/mesa/drm/merge_requests

> +foreach header : ['sys/select.h', 'alloca.h']
>    config.set('HAVE_' + header.underscorify().to_upper(),
>      cc.compiles('#include <sys/types.h>\n#include <@0@>'.format(header), name : '@0@ works'.format(header)))

Can you drop the `#include <sys/types.h>\n` now that sys/sysctl.h is
being split out?

Note that since https://gitlab.freedesktop.org/mesa/drm/merge_requests/8
we now use config.set10(), which means you'll need to refactor a tiny
bit (move the !linux condition inside the config.set10() call).

The new code block should look like this:

  # From Niclas Zeising:
  # FreeBSD requires sys/types.h for sys/sysctl.h, add it as part of the
  # includes when checking for headers.
  foreach header : ['sys/sysctl.h']
    config.set10('HAVE_' + header.underscorify().to_upper(),
       not ['linux'].contains(host_machine.system()) and
       cc.compiles('#include <sys/types.h>\n#include <@0@>'.format(header), name : '@0@ works'.format(header)))
  endforeach

With that:
Reviewed-by: Eric Engestrom <eric@engestrom.ch>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
