Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD75C2747EB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 20:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE9F6E85C;
	Tue, 22 Sep 2020 18:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9796E85C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 18:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600797711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2aaSAULK36kdpoACQDdwALZmwQc4G3xRYKl1sR2GSU=;
 b=isvyS9vSmUmN9kF23zvsaL4DtLBJx3pDCpEAIPQv8pOt3J4y052MeGgN2HnE7j6j5SzhCH
 bHT2SW27y3xnrCE2W2szPeIV9/FehzrGgdq5Z1ii59W6L9GWXbzm3fCEvSOlUjiefLOFj+
 z8qxb6DqqCVcBOtIsqWT2hFImJrMM20=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-f6vJ4097MKunUn4fb-TxCQ-1; Tue, 22 Sep 2020 14:01:48 -0400
X-MC-Unique: f6vJ4097MKunUn4fb-TxCQ-1
Received: by mail-qv1-f72.google.com with SMTP id a13so12240709qvl.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 11:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=C2aaSAULK36kdpoACQDdwALZmwQc4G3xRYKl1sR2GSU=;
 b=q1xdkGSacuOKFzJqVMEoO2VWvMo1JEwHS7w7tPZVX7LFCicBTCoWO6Pc6v/Bg9cPqw
 gtqV8EZin9zujRaf9K1mOadrkDsk7Nf4/lby2x/XEDGxd6A1wFZuTSgWVsN/8ix76/7t
 Oc7RezRbdozsItSd2g675fHEd5D0+qwvS7tH+2a6ZOaWfPbiX+gxuRw/eeel2O+X+MCm
 fmCgg64Hzj4qM/PmLvLLFiIebpdk0upG/uhgFCnFRTocg9RJb2/CHAatDaH9YsaNO8x9
 AFc6TQ9rkLiSF6SkDQqw+xctKNmSzQXehle/XLGnLGLkXN34idUNVrVGKQYl7h0HoWVJ
 pylA==
X-Gm-Message-State: AOAM530CmkPY3XHJb+H1vLTxFIRbSqcRA/GaBKZPaKwgXe2v4dJOrrfb
 kSZrRbX2gYHaGJZEqlCNLO3Byq8reQjdR9/dD8RTHnfplbpMSms1pFmqhuDPLsOaOVmNtPI/SdO
 fKjkgRCjJcdBelvzQUVli4U+TjQOa
X-Received: by 2002:a37:3c8:: with SMTP id 191mr5909470qkd.393.1600797708464; 
 Tue, 22 Sep 2020 11:01:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9TQNX37EETLlze/qf7+p/fibX9UNEpK4JViHSjRbPhqkGDdiiKwZ+YCb6FbsuWgwyay63NQ==
X-Received: by 2002:a37:3c8:: with SMTP id 191mr5909431qkd.393.1600797708144; 
 Tue, 22 Sep 2020 11:01:48 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id p68sm12340991qka.78.2020.09.22.11.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 11:01:47 -0700 (PDT)
Message-ID: <7231e2199a19aa6c8ecbecf5e80725e2a1aded73.camel@redhat.com>
Subject: Re: [PATCH V4] drm/dp_mst: Retrieve extended DPCD caps for topology
 manager
From: Lyude Paul <lyude@redhat.com>
To: Koba Ko <koba.ko@canonical.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 22 Sep 2020 14:01:46 -0400
In-Reply-To: <20200922065313.4794-1-koba.ko@canonical.com>
References: <20200922065313.4794-1-koba.ko@canonical.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: anthony.wong@canonical.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One last change I realized we should do is print the name of the AUX adapter
in question. I don't mind just adding that myself before I push it though so
you don't need to send a respin.

Going to go push this to drm-misc-next, thanks!

On Tue, 2020-09-22 at 14:53 +0800, Koba Ko wrote:
> As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
> If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1,read the DP_DP13_DPCD_REV to
> get the faster capability.
> If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0,read DP_DPCD_REV.
> 
> Signed-off-by: Koba Ko <koba.ko@canonical.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index e87542533640..63f8809b9aa4 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3686,9 +3686,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> drm_dp_mst_topology_mgr *mgr, bool ms
>  		WARN_ON(mgr->mst_primary);
>  
>  		/* get dpcd info */
> -		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd,
> DP_RECEIVER_CAP_SIZE);
> -		if (ret != DP_RECEIVER_CAP_SIZE) {
> -			DRM_DEBUG_KMS("failed to read DPCD\n");
> +		ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
> +		if (ret < 0) {
> +			drm_dbg_kms(mgr->dev, "failed to read DPCD, ret %d\n",
> ret);
>  			goto out_unlock;
>  		}
>  
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
