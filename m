Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D32EF2DC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 14:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CA36E32A;
	Fri,  8 Jan 2021 13:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCCD6E32A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 13:07:49 +0000 (UTC)
IronPort-SDR: n56u1FNfeKnJulBqMu9Ddj87/vAm+ZcUkOOF3tuzmi0IvGJwru4Fr8XEZnD2J+QMC4Fg0nmb2D
 rB+0eqLHjsoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="165279994"
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; d="scan'208";a="165279994"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 05:07:48 -0800
IronPort-SDR: XwuvPVa/RMQZzUEEBUjTkYGnzBKJkI1/KXJBjEc/NCkmVlarl3HHEBYmYmZr1/CSiDmVqeumbl
 3z4LRDqZnraQ==
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; d="scan'208";a="351672981"
Received: from rgwhiteh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.205.160])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 05:07:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de, dri-devel@lists.freedesktop.org,
 xinliang.liu@linaro.org
Subject: Re: [RFC] drm/connector: Set the default callback function for
 drm_connector_funcs
In-Reply-To: <d8e3cdca-79dd-2c41-27c1-b09a45670976@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1610092442-36168-1-git-send-email-tiantao6@hisilicon.com>
 <d8e3cdca-79dd-2c41-27c1-b09a45670976@suse.de>
Date: Fri, 08 Jan 2021 15:07:41 +0200
Message-ID: <871revziea.fsf@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 08 Jan 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Drivers cannot legally declare the funcs instance as static const. 
> Having static const allows for write protected pages.

This. I've done quite a bit of refactoring all over the place to be
ablet to move to the complete opposite direction. We want to keep all
callback structs static const.

If the idea here was good (on which I'm inclined to side with Thomas and
Daniel that it isn't), the way to go would be to add a small wrapper for
calling ->fill_modes(), with a different path for when it's NULL.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
