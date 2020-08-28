Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901C4255809
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 11:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F446E463;
	Fri, 28 Aug 2020 09:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00FA6E463
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 09:53:38 +0000 (UTC)
IronPort-SDR: FWOpJdnMK5FmJkqOboJeehnUqI1143lM2ZAWg+RiN1HpyHrOP4YEQrxBX1bH6B4uAENEwvYeOv
 A1Km3/Y8dp+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="174689629"
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; d="scan'208";a="174689629"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 02:53:37 -0700
IronPort-SDR: 4k6ijHHaBPEq0prFkQCkFP3qZerS0iQb7KjjZfzI/YTtyEkWgwFOFdK0usdb2l8PEuwbEskMcs
 WeVg6ucdBTuw==
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; d="scan'208";a="475618716"
Received: from junhoson-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.35.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 02:53:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, malat@debian.org
Subject: Re: [bug report] drm/dp: annotate implicit fall throughs
In-Reply-To: <20200825112759.GA287100@mwanda>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200825112759.GA287100@mwanda>
Date: Fri, 28 Aug 2020 12:53:32 +0300
Message-ID: <87v9h33xlv.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Aug 2020, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Hello Mathieu Malaterre,
>
> The patch e9c0c874711b: "drm/dp: annotate implicit fall throughs"
> from Jan 14, 2019, leads to the following static checker warning:
>
> 	drivers/gpu/drm/drm_dp_helper.c:495 drm_dp_downstream_max_bpc()
> 	warn: ignoring unreachable code.
>
> drivers/gpu/drm/drm_dp_helper.c
>    467  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>    468                                const u8 port_cap[4])
>    469  {
>    470          int type = port_cap[0] & DP_DS_PORT_TYPE_MASK;
>    471          bool detailed_cap_info = dpcd[DP_DOWNSTREAMPORT_PRESENT] &
>    472                  DP_DETAILED_CAP_INFO_AVAILABLE;
>    473          int bpc;
>    474  
>    475          if (!detailed_cap_info)
>    476                  return 0;
>    477  
>    478          switch (type) {
>    479          case DP_DS_PORT_TYPE_VGA:
>    480          case DP_DS_PORT_TYPE_DVI:
>    481          case DP_DS_PORT_TYPE_HDMI:
>    482          case DP_DS_PORT_TYPE_DP_DUALMODE:
>    483                  bpc = port_cap[2] & DP_DS_MAX_BPC_MASK;
>                                             ^^^^^^^^^^^^^^^^^^
> This is 0x3.
>
>    484  
>    485                  switch (bpc) {
>    486                  case DP_DS_8BPC:
>    487                          return 8;
>    488                  case DP_DS_10BPC:
>    489                          return 10;
>    490                  case DP_DS_12BPC:
>    491                          return 12;
>    492                  case DP_DS_16BPC:
>    493                          return 16;
>    494                  }
>    495                  fallthrough;
>
> This fallthrough is impossible.  Probably the way to work around the
> bogus warning is the change the fallthough to "return 0; /* impossible */"
> otherwise the fallthrough is sort of misleading...

Won't that be unreachable as well?

Maybe just add the default label to switch (bpc)?

BR,
Jani.


>
>    496          default:
>    497                  return 0;
>    498          }
>    499  }
>
> regards,
> dan carpenter
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
