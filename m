Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA666C48E0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 12:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B9010E91C;
	Wed, 22 Mar 2023 11:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFFC10E91C;
 Wed, 22 Mar 2023 11:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679483844; x=1711019844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=q68J+MDaPByG+mcBJ1l0TszGxrB4T860tUhC7J/+pkM=;
 b=XjlaTGYnJvoRVP9sIUdaW1bCqSnLChjNQ7lh3cnTNOao17qclejr2mX/
 CNrOmtnNj62dKfXtESrOQrDCnlcD6EMNjRKzZjRcQrvqBfvA/Z1JGtn3w
 6FkozSsWRccm0mwvLrbZi9GkaYrPJMsBtaWpixQxs2AX+nHKBtUGbA3Wz
 K4wdmss008DU0aU+qFW2IiwVSmUAF7O7d6Olpk1Fk2zqQkHXbr/SlApWQ
 jilBTcg2EfvTX7bwu6B9sw0ukjjptuZ76J/Zfdp5AvKwf/dia6xcp9raJ
 +uIcaoV4XRF62My7SvTLFwjjiycikY9J5UAIQnqQ13WLnLlAr1GGvnOr3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="337908693"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="337908693"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 04:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="675227070"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="675227070"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 04:17:20 -0700
Date: Wed, 22 Mar 2023 12:17:19 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/7] drm/debugfs: rework debugfs directory creation v2
Message-ID: <20230322111719.GA2066233@linux.intel.com>
References: <20230316082035.567520-1-christian.koenig@amd.com>
 <20230316082035.567520-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230316082035.567520-5-christian.koenig@amd.com>
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
Cc: quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org, ogabbay@kernel.org,
 mcanal@igalia.com, mwen@igalia.com, maxime@cerno.tech,
 intel-gfx@lists.freedesktop.org, wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 09:20:32AM +0100, Christian König wrote:
> Instead of the per minor directories only create a single debugfs
> directory for the whole device directly when the device is initialized.
> 
> For DRM devices each minor gets a symlink to the per device directory
> for now until we can be sure that this isn't useful any more in any way.
> 
> Accel devices create only the per device directory and also drops the mid
> layer callback to create driver specific files.
> 
> v2: cleanup accel component as well
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/accel/drm_accel.c           | 30 ++++++++-------

Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

