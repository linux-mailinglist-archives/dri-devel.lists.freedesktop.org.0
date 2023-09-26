Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7457AF02C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 18:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C517B10E3F9;
	Tue, 26 Sep 2023 16:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5333910E3EA;
 Tue, 26 Sep 2023 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695744121; x=1727280121;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LQ60yoTebnvkUYWkiseliZmd8NtqYh7nY9eX61FUScc=;
 b=PpusmKJ8dLwYjbu6pfEvsvp7fTDhUoqG5sha7FbS47Gh9Y9g19iz3fWO
 zQv7FsJSM7vKgFIu+xBbu0xx4jliqNfIuAiHWfDzDiaMDzoCFbDco504I
 iaD79tkVhfuILXy8pOpiEMeOP7cxX4Crbzgl3N2Rvmp5eJa2/W2FKGPkS
 UOa87fyQiiBklOsIXWvUZwNW9KcuBtZyiAkcjZtz+EJjgiSB4Xiz5yh8X
 eLfheSa5BOzNAviDhNAKbmCMhaDCSUiHgLrlx4kxNfTqZ38leZxqh1DHo
 /HwqpYwUrc0XbKFlRLCx3wufaoPwFIcBYYBfO4yKOjQ41CHIPZ+E9S6Lm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378878860"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="378878860"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 09:02:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="995848129"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="995848129"
Received: from clow-mobl1.gar.corp.intel.com (HELO intel.com) ([10.215.242.58])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 09:01:50 -0700
Date: Tue, 26 Sep 2023 18:01:42 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval
Message-ID: <ZRMAZgM+0Gg6Sbk6@ashyti-mobl2.lan>
References: <20230926142401.25687-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926142401.25687-1-nirmoy.das@intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Mark Janes <mark.janes@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Tue, Sep 26, 2023 at 04:24:01PM +0200, Nirmoy Das wrote:
> PIPE_CONTROL_FLUSH_L3 is not needed for aux invalidation
> so don't set that.
> 
> Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before invalidation")
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: Tapani Pälli <tapani.palli@intel.com>
> Cc: Mark Janes <mark.janes@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

looks better :)

Tapani, you mind giving this a test?

Andi
