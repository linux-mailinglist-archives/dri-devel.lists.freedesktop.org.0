Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847B13A89BC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 21:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCFD6E18E;
	Tue, 15 Jun 2021 19:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E9B6E18E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 19:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623786270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INx68flUxBLUAdiqOwom2ZJUnIa8B0mN2YNzQrk/FqU=;
 b=dwQzg7V5zeKF3TY4ev1ot9/XYcKXqLyzKB2Gu9TerDbfqcxGIyRCpWDDfllCkgVlCw27Sd
 LfEOltUQ99pQhZVl+YSXom1Vx1GlYoZZHPCarRUH86azgg9hkOATnO4rxDMflVKy9yIGqK
 gnz4BPrFLO8S6omluk/gP3E4ANZWK8M=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-khUT2O_rODOBR2g245eEbw-1; Tue, 15 Jun 2021 15:44:27 -0400
X-MC-Unique: khUT2O_rODOBR2g245eEbw-1
Received: by mail-qt1-f198.google.com with SMTP id
 t6-20020ac80dc60000b029024e988e8277so861599qti.23
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 12:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=INx68flUxBLUAdiqOwom2ZJUnIa8B0mN2YNzQrk/FqU=;
 b=ktwdOGMv91FvEUGlN0poiwVBSOrVvq7GW3oIjVY03jKwtGXDiHfLuhRdZDODCCTzDL
 YqpIRXKmkoPyXW3wq/C7zIpQ/zB9g5OAZtuYwN1EjsvF9Sk3qfQ6/XZqe34da01ysJA9
 M3jIQNX7RKuZZd74K1sfX5nX+okMQWhvXGSdV9rkrkutDmKdVHO8srulTKLqrHdOKmVp
 w8djZQlAfBQPAbHaBAYaKa1AKqjQfwe+bEEWxlma+9gKT2jni4Bzxhv/7ly8vwd0L0Pn
 E8gPMB6L7lolHkjs8Gg+kR3dWZZ11oaHA/8BpXchvwkpSJiy3wd+2IukuuU4a1u5tKVe
 XkDg==
X-Gm-Message-State: AOAM5311kdSFb/SLb8+awTL4jWhFtP+bnHD4Qf8MdULedF7TeCHfaYUx
 HnBUK870bYpW3z6nccWW1YhMcozG0DyH6W4zqJ6EfqbI1kOGq9hl2vTw2jjH7Drml6/lnjwtBQj
 jCvLD6ENQS2AEs8SR8YXVgPmdoydW
X-Received: by 2002:a37:a6c8:: with SMTP id p191mr1270409qke.343.1623786266806; 
 Tue, 15 Jun 2021 12:44:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7yuCw5qyiPUE5aseFD2p1DYL/5Z9flt29lCcYeu9yHEWJfScag3XIhdTpj9z1iUgXexKINg==
X-Received: by 2002:a37:a6c8:: with SMTP id p191mr1270388qke.343.1623786266572; 
 Tue, 15 Jun 2021 12:44:26 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id n16sm12130754qtk.40.2021.06.15.12.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 12:44:26 -0700 (PDT)
Message-ID: <6865def1e959a42b41a9661c7037fd0118482671.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/dp_mst: Avoid to mess up payload table by ports
 in stale topology
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Date: Tue, 15 Jun 2021 15:44:25 -0400
In-Reply-To: <20210528135557.23248-3-Wayne.Lin@amd.com>
References: <20210528135557.23248-1-Wayne.Lin@amd.com>
 <20210528135557.23248-3-Wayne.Lin@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
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
Cc: jerry.zuo@amd.com, aurabindo.pillai@amd.com, Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2021-05-28 at 21:55 +0800, Wayne Lin wrote:
> [Why]
> After unplug/hotplug hub from the system, userspace might start to
> clear stale payloads gradually. If we call drm_dp_mst_deallocate_vcpi()
> to release stale VCPI of those ports which are not relating to current
> topology, we have chane to wrongly clear active payload table entry for
> current topology.
> 
> E.g.
> We have allocated VCPI 1 in current payload table and we call
> drm_dp_mst_deallocate_vcpi() to clean VCPI 1 in stale topology. In
> drm_dp_mst_deallocate_vcpi(), it will call drm_dp_mst_put_payload_id()
> tp put VCPI 1 and which means ID 1 is available again. Thereafter, if we
> want to allocate a new payload stream, it will find ID 1 is available by
> drm_dp_mst_assign_payload_id(). However, ID 1 is being used
> 
> [How]
> Check target sink is relating to current topology or not before doing
> any payload table update.
> Searching upward to find the target sink's relevant root branch device.
> If the found root branch device is not the same root of current
> topology, don't update payload table.
> 
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 29 +++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 5fc261014a20..3d988d54df89 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -94,6 +94,9 @@ static int drm_dp_mst_register_i2c_bus(struct
> drm_dp_mst_port *port);
>  static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port);
>  static void drm_dp_mst_kick_tx(struct drm_dp_mst_topology_mgr *mgr);
>  
> +static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port
> *port,
> +                                                struct drm_dp_mst_branch
> *branch);
> +
>  #define DBG_PREFIX "[dp_mst]"
>  
>  #define DP_STR(x) [DP_ ## x] = #x
> @@ -3360,6 +3363,7 @@ int drm_dp_update_payload_part1(struct
> drm_dp_mst_topology_mgr *mgr)
>         struct drm_dp_mst_port *port;
>         int i, j;
>         int cur_slots = 1;
> +       bool skip;
>  
>         mutex_lock(&mgr->payload_lock);
>         for (i = 0; i < mgr->max_payloads; i++) {
> @@ -3374,6 +3378,14 @@ int drm_dp_update_payload_part1(struct
> drm_dp_mst_topology_mgr *mgr)
>                         port = container_of(vcpi, struct drm_dp_mst_port,
>                                             vcpi);
>  
> +                       mutex_lock(&mgr->lock);
> +                       skip = !drm_dp_mst_port_downstream_of_branch(port,
> mgr->mst_primary);
> +                       mutex_unlock(&mgr->lock);
> +
> +                       if (skip) {
> +                               DRM_DEBUG_KMS("Virtual channel %d is not in
> current topology\n", i);

sorry I totally missed this on my first look - but this is the wrong debugging
macro (drm_dbg_kms() should be used) and as well, this patch doesn't actually
apply because it needs to be rebased against drm-tip. Could you fix this,
rebase the patches, and send a new version along with the fixes tags I
mentioned earlier? You can generate them using the dim tool here:

https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-intel.html#labeling-fixes-before-pushing

> +                               continue;
> +                       }
>                         /* Validated ports don't matter if we're releasing
>                          * VCPI
>                          */
> @@ -3473,6 +3485,7 @@ int drm_dp_update_payload_part2(struct
> drm_dp_mst_topology_mgr *mgr)
>         struct drm_dp_mst_port *port;
>         int i;
>         int ret = 0;
> +       bool skip;
>  
>         mutex_lock(&mgr->payload_lock);
>         for (i = 0; i < mgr->max_payloads; i++) {
> @@ -3482,6 +3495,13 @@ int drm_dp_update_payload_part2(struct
> drm_dp_mst_topology_mgr *mgr)
>  
>                 port = container_of(mgr->proposed_vcpis[i], struct
> drm_dp_mst_port, vcpi);
>  
> +               mutex_lock(&mgr->lock);
> +               skip = !drm_dp_mst_port_downstream_of_branch(port, mgr-
> >mst_primary);
> +               mutex_unlock(&mgr->lock);
> +
> +               if (skip)
> +                       continue;
> +
>                 DRM_DEBUG_KMS("payload %d %d\n", i, mgr-
> >payloads[i].payload_state);
>                 if (mgr->payloads[i].payload_state == DP_PAYLOAD_LOCAL) {
>                         ret = drm_dp_create_payload_step2(mgr, port, mgr-
> >proposed_vcpis[i]->vcpi, &mgr->payloads[i]);
> @@ -4562,9 +4582,18 @@ EXPORT_SYMBOL(drm_dp_mst_reset_vcpi_slots);
>  void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>                                 struct drm_dp_mst_port *port)
>  {
> +       bool skip;
> +
>         if (!port->vcpi.vcpi)
>                 return;
>  
> +       mutex_lock(&mgr->lock);
> +       skip = !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_primary);
> +       mutex_unlock(&mgr->lock);
> +
> +       if (skip)
> +               return;
> +
>         drm_dp_mst_put_payload_id(mgr, port->vcpi.vcpi);
>         port->vcpi.num_slots = 0;
>         port->vcpi.pbn = 0;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

