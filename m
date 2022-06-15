Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B892E54D280
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 22:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED719112CD6;
	Wed, 15 Jun 2022 20:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FD7112CD6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 20:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655324780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39qDr0lg6PwcbSbD7GVVUlGZ8d9yMQMoj4VB9lhwi8A=;
 b=FSIFYEJ/S0r9xRl05aAbFYBO5BuGm2hXKpBTmP43o/jCZI+gat6SrRl9AhGiFswV7kBMzB
 tVpWl6w4v+sIDEcbUGgs+KIvNUjHEO0KjZY07ubvMN1+wCGm4PfvetJx+j7EqkTwx25nmo
 H3ev51Gv6as9PGz6lyHoKg126k5X6AE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-gEUp3BGSNbW_6mV8xHx0ow-1; Wed, 15 Jun 2022 16:26:20 -0400
X-MC-Unique: gEUp3BGSNbW_6mV8xHx0ow-1
Received: by mail-qv1-f72.google.com with SMTP id
 d2-20020a0cf0c2000000b0046e5de39f7fso3888934qvl.21
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=39qDr0lg6PwcbSbD7GVVUlGZ8d9yMQMoj4VB9lhwi8A=;
 b=cnr5bZHsgc/td/pEcKEcvDOGLZWO3B5eMHdH8k3Pu3biTCYFRs+O/pKYUXJx7HByna
 2khrWLRoc8NKK8JpGhcBbK6zAXeRb8H7pxxRhrAfkSxp48K7fYzbEBGqoRkEB5LZlphw
 SlA8tESn6V+VCvPkzQ6wfmHTF79Dhq3acS/3IuB+iI7e2zWoqWKv2K4ar7dHqtz5Dxtc
 ZTpu9LWOuRaraTXy/GewXDRrhdkSOTz4e3jqefP7iWgTwDWevPL50hdAB4pBAZiC+apV
 eI+Mj8uPmG7nFmei6htpZFBPqzDu7yT55ls+5NmIpLrbYS5TTp718ynHr0YXg9itPCyL
 /tTw==
X-Gm-Message-State: AJIora+9lQ5hvxu+zjvmHs7ZAbIomBmfagYFXN0FryfJ2qKQNIjIAkmF
 QF5cR126wCAtiwX53Mm1HcV2gn7OZVh+TsDEijq6mDWgci5WBMsiiYJJzDoEcWXaF57zENx2w/i
 lMc23uvY8vWsUZbbzpVEZH5E+GzS3
X-Received: by 2002:ae9:e011:0:b0:6a6:a5c6:cafe with SMTP id
 m17-20020ae9e011000000b006a6a5c6cafemr1208080qkk.717.1655324779371; 
 Wed, 15 Jun 2022 13:26:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u+67HCjvIcprrQcOUGJCUBW5R2J3f7knBB3E0n7AKLI135jKppbeAzrxSf+yru3pue0lGqdg==
X-Received: by 2002:ae9:e011:0:b0:6a6:a5c6:cafe with SMTP id
 m17-20020ae9e011000000b006a6a5c6cafemr1208070qkk.717.1655324779161; 
 Wed, 15 Jun 2022 13:26:19 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 g2-20020ac80702000000b00304f79b2bcfsm112024qth.49.2022.06.15.13.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 13:26:18 -0700 (PDT)
Message-ID: <fc2412480357b6bafdc4aff91109c40cf9f15fed.camel@redhat.com>
Subject: Re: [PATCH] drm/dp/mst: Read the extended DPCD capabilities during
 system resume
From: Lyude Paul <lyude@redhat.com>
To: Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org
Date: Wed, 15 Jun 2022 16:26:17 -0400
In-Reply-To: <20220614094537.885472-1-imre.deak@intel.com>
References: <20220614094537.885472-1-imre.deak@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If you add a Cc: to stable@vger.kernel.org then this is:

Reviewed-by: Lyude Paul <lyude@redhat.com>

I assume you have the privileges to push this to drm-misc-next

On Tue, 2022-06-14 at 12:45 +0300, Imre Deak wrote:
> The WD22TB4 Thunderbolt dock at least will revert its DP_MAX_LINK_RATE
> from HBR3 to HBR2 after system suspend/resume if the DP_DP13_DPCD_REV
> registers are not read subsequently also as required.
> 
> Fix this by reading DP_DP13_DPCD_REV registers as well, matching what is
> done during connector detection. While at it also fix up the same call
> in drm_dp_mst_dump_topology().
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5292
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 67b3b9697da7f..18f2b6075b780 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3860,9 +3860,7 @@ int drm_dp_mst_topology_mgr_resume(struct
> drm_dp_mst_topology_mgr *mgr,
>         if (!mgr->mst_primary)
>                 goto out_fail;
>  
> -       ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd,
> -                              DP_RECEIVER_CAP_SIZE);
> -       if (ret != DP_RECEIVER_CAP_SIZE) {
> +       if (drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd) < 0) {
>                 drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during
> suspend?\n");
>                 goto out_fail;
>         }
> @@ -4911,8 +4909,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>                 u8 buf[DP_PAYLOAD_TABLE_SIZE];
>                 int ret;
>  
> -               ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf,
> DP_RECEIVER_CAP_SIZE);
> -               if (ret) {
> +               if (drm_dp_read_dpcd_caps(mgr->aux, buf) < 0) {
>                         seq_printf(m, "dpcd read failed\n");
>                         goto out;
>                 }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

