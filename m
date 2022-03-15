Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABED4D976A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 10:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E46310EA26;
	Tue, 15 Mar 2022 09:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D36C10EA19;
 Tue, 15 Mar 2022 09:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647335817; x=1678871817;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qOPa+F54O4/TfxmNFtroDQz1EVEjO7MUzBSRnv58S9w=;
 b=DnhW+SuX74IrAAI4pGcDc15jqDD2l5NfKRV598TD8tmo5nYOZ5YXcjk6
 FHtkfnpGOq/VQR/ORUwZ444JtpTOLs6H9tBN+rtiD8FMVL04BRlNQTb9p
 QHGxSKqcyDLpdJU4lUgNnyR5dic/72yveMq+GFIZXDtreSaDAQgmNgGIr
 jeuMZBxJSo2UxnvZXvj2p+XcEvhA5ibmvOPUDNIn+0OF5eKMbzbNbxxqp
 74PY8MeMKobeHj19m/RwTxvDIJCeXwgDLIYTrf6sDdii/nJYlrcv79cZx
 nhJ3FbFoif374D/V4FJhlNPb1DQ91t1RIuyIKiyqiJgpfhxDST+SfEh+L g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="243705170"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="243705170"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 02:16:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="540355567"
Received: from cgrilli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.234])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 02:16:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support
 VFIO new mdev API
In-Reply-To: <20220315084817.GA4105@lst.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
 <871r0dqtjf.fsf@intel.com> <20220209072805.GA9050@lst.de>
 <4e2faf7b-383e-58b3-8ae9-8f8d25c64420@intel.com>
 <20220315075217.GA2830@lst.de> <87a6drvc02.fsf@intel.com>
 <20220315084817.GA4105@lst.de>
Date: Tue, 15 Mar 2022 11:16:50 +0200
Message-ID: <877d8vvam5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Mar 2022, Christoph Hellwig <hch@lst.de> wrote:
> I know.  I meant the next one, not the one ending now.  And I don't
> want to miss another one.

Ok, good, thanks.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
