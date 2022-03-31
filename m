Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792424EDF3F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 18:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B3710F40E;
	Thu, 31 Mar 2022 16:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2732510E781;
 Thu, 31 Mar 2022 16:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648745930; x=1680281930;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wjt6iTgPQfcltJKVFjTsJLxsw2Cl60NbIFp9s2rb+I4=;
 b=XwajfJL60lJyEi1qCPaPzx8I86RdELGCy1sj/QXlgmVGmxqJiI7A0NQU
 gPNv3dV6e0PeE3Sp4oovKEAPNyD/3gf6M4zxwYBcaX8y+o6qBdweaeV6R
 LX9g7bR+6hNRCdQEyIPasBwaZbap1tbUq+TDwB7DLpjArzI0FajiwTcQG
 TAqG5s1cDrgwI5Ppc1oevzeI5/c37OzD+J/jMRdKurdrluNXp9iQIjo7e
 JJFeNqiXguoAkdoheEFFT2nM9p85Rl0O+tN7/k+xcWtJ+oc03Yu6PTBfv
 5QXtu2YkgqcUeDO72NLR6BXEPjhAZttEfgXGbUdrgrJNBf8GMp8Qt+rwp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="257476525"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="257476525"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 09:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="547415122"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga007.jf.intel.com with SMTP; 31 Mar 2022 09:58:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 31 Mar 2022 19:58:46 +0300
Date: Thu, 31 Mar 2022 19:58:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 07/12] drm/edid: split drm_edid_block_valid() to check
 and act parts
Message-ID: <YkXdxgy7Ic9M9iwx@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
 <296443a99ce907b11d08ddc88407aa35d9bdc5a3.1648578814.git.jani.nikula@intel.com>
 <YkXAo2NceBUlGbE1@intel.com> <87k0ca83uh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k0ca83uh.fsf@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 07:49:10PM +0300, Jani Nikula wrote:
> On Thu, 31 Mar 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> >> -
> >> -		if (edid->revision > 4)
> >> -			DRM_DEBUG("EDID minor > 4, assuming backward compatibility\n");
> >
> > This debug message seems to disappear. Intentional?
> 
> Intentional, but failed to mention it in the commit message.
> 
> Do we want to keep it? With my new approach, it basically means another
> valid return value that's distinct from just ok.

Seems pretty pointless to me. Especially with DisplayID on the
scene it seems rather unlikely that there would ever be EDID 1.5+.

-- 
Ville Syrjälä
Intel
