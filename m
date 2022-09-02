Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D25ABA21
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 23:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E855510E911;
	Fri,  2 Sep 2022 21:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C9610E910
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 21:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662154504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tLM/3lJtaAYsqKeYEGRVJvBSiRQW7/b6UjPp23Gpt8=;
 b=eecIaoIdClM+KXOx0uIB/YIrNJ5+wAZ1Kles7Z2tKWklohoWWjo++g8Zq/7ThbaZ/PByuz
 QeNxCvuQWHT/EEFQ/hjjiR60QuZOCBq0qSFYB4yCTDh1Y1WOHThzvD1b8tjHS/oPs8NYlt
 VBzyWZaM9sNZwYTKP2xNlFschQ658P8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-y67rfgTPOrKYlkXCAUV9QQ-1; Fri, 02 Sep 2022 17:35:03 -0400
X-MC-Unique: y67rfgTPOrKYlkXCAUV9QQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 v13-20020a05622a188d00b00343794bd1daso2488155qtc.23
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Sep 2022 14:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8tLM/3lJtaAYsqKeYEGRVJvBSiRQW7/b6UjPp23Gpt8=;
 b=WL2clZBBFqcvmp9escWeJQ3uKYNzRdt2Ot2oLwB+6P7ih62PkW+RlBYtV0Tb7Uo/G9
 4rMidDPQ3cts6Yg1iPJXURSbuDUpzhbFz9z8rz+a2WJRaGIzHL1zcO0RHpm3zDAPR6za
 mPeT0A/o1o5ctGQ6HNxiOka7iLNIOMffCYKvcYFDwZ71BhvEtBwaIeupAW4pcQ2jvyfm
 jwARaiS8WSgsqmqTDxUfHY8kZzK0dFnoa4x7eLziDevgJ43S4AJZn/uo+/2cQX0c6aAE
 vhvxZ20tn0AutmLs0KV2hHH8OEjISW8ph0K1NmlBhLfqOcw9c/Is0yYhUKNaI2D/6syf
 a+VQ==
X-Gm-Message-State: ACgBeo2iOUkGSglIjpNoDg9XS/b/9icbEH/vJ3QyVk2jY+27dShRVFyV
 cerCov5IWoxtlzT3LzoKJ3nqmoHT7rVowxVyhy1CpuZFE08/VKD2EWilCcJl4f7mrqdTn4aCwFi
 PPxlZEimGckzkNIB1o5NndhMVciOS
X-Received: by 2002:ac8:5a55:0:b0:343:72f9:7053 with SMTP id
 o21-20020ac85a55000000b0034372f97053mr29376148qta.518.1662154502953; 
 Fri, 02 Sep 2022 14:35:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR71MqC8+ulzndg1RInO2Lgus6TlkwKGDoiDVHA9iSaBYpFk7mer7xfBbfAfM9XAI4bEWzDHfA==
X-Received: by 2002:ac8:5a55:0:b0:343:72f9:7053 with SMTP id
 o21-20020ac85a55000000b0034372f97053mr29376127qta.518.1662154502700; 
 Fri, 02 Sep 2022 14:35:02 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00:e786:1aff:4f5c:c549?
 ([2600:4040:5c48:e00:e786:1aff:4f5c:c549])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a05620a254400b006bacf4703c5sm2215158qko.111.2022.09.02.14.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 14:35:02 -0700 (PDT)
Message-ID: <cde7369a1d078249244759662989427b1f853bdd.camel@redhat.com>
Subject: Re: [PATCH] drm/dp: Avoid Reading DPCD_REV Before Native Aux Read
From: Lyude Paul <lyude@redhat.com>
To: Fangzhi Zuo <Jerry.Zuo@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Ville
 Syrjala <ville.syrjala@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Alex Deucher <alexander.deucher@amd.com>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>
Date: Fri, 02 Sep 2022 17:35:00 -0400
In-Reply-To: <20220831221321.748264-1-Jerry.Zuo@amd.com>
References: <20220831221321.748264-1-Jerry.Zuo@amd.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2022-08-31 at 18:13 -0400, Fangzhi Zuo wrote:
> The attempt to read DPCD_REV before any native aux read breaks
> majority of DP2 compliance.
> 
> The spec. requires DP_SINK_STATUS to be polled for the reset status
> DP_INTRA_HOP_AUX_REPLY_INDICATION during the clear training stage.
> 
> Polling DP_SINK_STATUS each time gets DPCD_REV read first
> that makes non link training regsiter DPCD_REV get read
> during UHBR link training. It violates DP2 compliance.
> 
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index e7c22c2ca90c..c7aa5bafa667 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -571,24 +571,6 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>  {
>  	int ret;
>  
> -	/*
> -	 * HP ZR24w corrupts the first DPCD access after entering power save
> -	 * mode. Eg. on a read, the entire buffer will be filled with the same
> -	 * byte. Do a throw away read to avoid corrupting anything we care
> -	 * about. Afterwards things will work correctly until the monitor
> -	 * gets woken up and subsequently re-enters power save mode.
> -	 *
> -	 * The user pressing any button on the monitor is enough to wake it
> -	 * up, so there is no particularly good place to do the workaround.
> -	 * We just have to do it before any DPCD access and hope that the
> -	 * monitor doesn't power down exactly after the throw away read.
> -	 */
> -	if (!aux->is_remote) {
> -		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
>  	if (aux->is_remote)
>  		ret = drm_dp_mst_dpcd_read(aux, offset, buffer, size);
>  	else

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

