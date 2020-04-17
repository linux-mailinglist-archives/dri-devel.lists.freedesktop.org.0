Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E29081AE819
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 00:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57B56EC4C;
	Fri, 17 Apr 2020 22:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CE06EC4C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 22:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587162051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzRc/v3Xx0E1ZKVi1/Mf8j0Wa0CDdC/8BTT/hHrxfaw=;
 b=N24e1nGtNEk1vYjhaOSy66c3URp0reZUYNrm5tcwUr10EMA4EuUV9R24GOtezcW+hLxEi1
 es8tcKn1dHjRz3hHeGJEuRmNZhU3JJgoxplco848EAGFkZ4VO4MJzpDVYwfL9UMEthokad
 QMP/syxMEPVFDe+vFvXo1A5uU555tMM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-L2-SuP8YPX-BmISfC5J8Iw-1; Fri, 17 Apr 2020 18:20:49 -0400
X-MC-Unique: L2-SuP8YPX-BmISfC5J8Iw-1
Received: by mail-qt1-f200.google.com with SMTP id x56so3777784qtc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ZzRc/v3Xx0E1ZKVi1/Mf8j0Wa0CDdC/8BTT/hHrxfaw=;
 b=KihynpZG9WavOghSvXNMfnte4+Ci9QyT+zGcNc2FRfshQVZLQ1Umi/rP216NMcEmcQ
 +sUI/fRc9f+VhsfiUK65ZNxMfGT0V7bB4C/HuYg6p+qax42iDFTL2SSF+NooODXliQ7f
 7Ikvtxf/AzBsm/O99VQv1ss1OPqIDNiR8YAOCeslPwKvu3EebaGQNKkXsnYQJrqEu0p6
 urxHMtTAPO+Dru+ePKv4VDRRfeRpTLdcnz0BcHls2KadrE+rE7uhfvRDPK0B/2RjSS1H
 kUQVrhsnpcUdh2vLs5Rxf1BGSiFgqyupbp3kOgaQM+yVF6hz9IIcHQf+xDjII4ULKwG5
 1MXA==
X-Gm-Message-State: AGi0PuaJD3x+vsuzluAihZ6mc4Agx7GQUu4O0clVlBnu/gwjhioH4a81
 t7SMW+atwsgVxdTsdo3IKQ0YYgQe81mnzqR1AUB53RIQtrFQykRGeGpU1HD4hjU1LY2bhZaTCJv
 IrwTzxQd50+6fIV1k+SSNr+f18qXb
X-Received: by 2002:a37:b181:: with SMTP id a123mr5681835qkf.10.1587162048852; 
 Fri, 17 Apr 2020 15:20:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypLGE7m+KFsYr0B6VUVs0qc6m23Gdy+O7+lN47GrvI/DVrguYiDNGukMP1hgUKZVeeSIRbjN2g==
X-Received: by 2002:a37:b181:: with SMTP id a123mr5681814qkf.10.1587162048590; 
 Fri, 17 Apr 2020 15:20:48 -0700 (PDT)
Received: from Ruby.lyude.net (static-173-76-190-23.bstnma.ftas.verizon.net.
 [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id m83sm12620232qke.117.2020.04.17.15.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 15:20:47 -0700 (PDT)
Message-ID: <ec314b1e4255c32c9bc0880f72f3bcf36e384526.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Zero assigned PBN when releasing VCPI slots
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Fri, 17 Apr 2020 18:20:46 -0400
In-Reply-To: <20200407160717.27976-1-mikita.lipski@amd.com>
References: <20200407160717.27976-1-mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
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
Cc: Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

In the future btw, you should use the DRM maintainer tools to add a Fixed-by
tag, since this:

Fixes: cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST
atomic check")

Also so it gets cc'd to stable, I'll fixup the patch and push it. Thanks!

On Tue, 2020-04-07 at 12:07 -0400, mikita.lipski@amd.com wrote:
> From: Mikita Lipski <mikita.lipski@amd.com>
> 
> Zero Port's PBN together with VCPI slots when releasing
> allocated VCPI slots. That way when disabling the connector
> it will not cause issues in drm_dp_mst_atomic_check verifying
> branch bw limit.
> 
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 38bf111e5f9b..ed109dd15df6 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4276,6 +4276,7 @@ int drm_dp_atomic_release_vcpi_slots(struct
> drm_atomic_state *state,
>  	if (pos->vcpi) {
>  		drm_dp_mst_put_port_malloc(port);
>  		pos->vcpi = 0;
> +		pos->pbn = 0;
>  	}
>  
>  	return 0;
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
