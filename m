Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6280C78C321
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCE310E00F;
	Tue, 29 Aug 2023 11:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A086910E00F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693307528; x=1724843528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BvjqJRNSmLOaCS6UFBcQwyAoOaj+fEYzlEPpqoYIPCU=;
 b=f0azsoKvgCEBUE8hm6P716s9/9Uzq9r064qgvTkaFfF8BGXrYxbJLB6x
 OAw2O5KB3HssdVFIH8oiOvZwALoQxOjFU+AG0I8OY0/fVsUVc1HsprWbV
 gDR68f5EmXuxqaOw7nK4gHpanck4FKj+om0eHvUNxmFsWzbFiYP7tsMZm
 Sdzq6XAvnqXGe68IlqVKhp11Tax81An1CmQHMX+VU/jgUjQD04LjL4qLj
 qy407o3Tbm5QxMGK/Hg2PzN/dD2tJ3kTvX8v7XTyW4D0L1MY/VCGcsJfF
 MqPn6GDYu0Jip/kNYR37QcBSJL1zGKEn0R3c9mxjA6DKN9rO4loZ4RBXc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="439291387"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="439291387"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="732179178"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="732179178"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:12:06 -0700
Date: Tue, 29 Aug 2023 13:12:04 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 5/9] accel/ivpu: Move ivpu_fw_load() to ivpu_fw_init()
Message-ID: <20230829111204.GB4086697@linux.intel.com>
References: <20230828094736.4137092-1-stanislaw.gruszka@linux.intel.com>
 <20230828094736.4137092-6-stanislaw.gruszka@linux.intel.com>
 <c1dcb25e-5a8a-9d25-deb5-81a81af16726@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1dcb25e-5a8a-9d25-deb5-81a81af16726@quicinc.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Mon, Aug 28, 2023 at 02:49:34PM -0600, Jeffrey Hugo wrote:
> On 8/28/2023 3:47 AM, Stanislaw Gruszka wrote:
> > diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
> > index 8567fdf925fe..10ae2847f0ef 100644
> > --- a/drivers/accel/ivpu/ivpu_fw.h
> > +++ b/drivers/accel/ivpu/ivpu_fw.h
> > @@ -31,7 +31,7 @@ struct ivpu_fw_info {
> >   int ivpu_fw_init(struct ivpu_device *vdev);
> >   void ivpu_fw_fini(struct ivpu_device *vdev);
> > -int ivpu_fw_load(struct ivpu_device *vdev);
> > +void ivpu_fw_load(struct ivpu_device *vdev);
> 
> If ivpu_fw_load() is defined in ivpu_fw.c and only used in ivpu_fw.c, do you
> need it in this header file anymore?  Seems like you could remove this, and
> also make the function static.

The function is also used in ivpu_pm_prepare_cold_boot() from ivpu_pm.c 

Regards
Stanislaw
