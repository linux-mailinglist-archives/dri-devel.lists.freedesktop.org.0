Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640611C6DA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AA96EC7D;
	Thu, 12 Dec 2019 08:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382E56EC7C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 08:14:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 00:14:29 -0800
X-IronPort-AV: E=Sophos;i="5.69,305,1571727600"; d="scan'208";a="207991813"
Received: from lenovo-x280.ger.corp.intel.com (HELO localhost) ([10.252.35.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 00:14:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chuhong Yuan <hslester96@gmail.com>
Subject: Re: [PATCH] drm/dp_mst: add missed nv50_outp_release in
 nv50_msto_disable
In-Reply-To: <20191206075321.18239-1-hslester96@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191206075321.18239-1-hslester96@gmail.com>
Date: Thu, 12 Dec 2019 10:14:25 +0200
Message-ID: <8736dq2c66.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 06 Dec 2019, Chuhong Yuan <hslester96@gmail.com> wrote:
> nv50_msto_disable() does not call nv50_outp_release() to match
> nv50_outp_acquire() like other disable().
> Add the missed call to fix it.

The subject prefix "drm/dp_mst" implies drm core change, but this is
about nouveau. Please fix.

BR,
Jani.

>
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 549486f1d937..84e1417355cc 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -862,8 +862,10 @@ nv50_msto_disable(struct drm_encoder *encoder)
>  
>  	mstm->outp->update(mstm->outp, msto->head->base.index, NULL, 0, 0);
>  	mstm->modified = true;
> -	if (!--mstm->links)
> +	if (!--mstm->links) {
>  		mstm->disabled = true;
> +		nv50_outp_release(mstm->outp);
> +	}
>  	msto->disabled = true;
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
