Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57979128414
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 22:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAFA6ECBA;
	Fri, 20 Dec 2019 21:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC056ECBA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 21:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576878364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5YX782Zv+g3uFQMicLe3D/pBuqpdZXdmdHZhVTJP8U=;
 b=d+WHLEfUK6RHt9mqQKZXJwWmPp0E3n/zGFjDYAjToWraZDpY7Z3vyQeUWJQKlX92z8Zw79
 C6Q7JL2G+t/nERGu9PDtXHC1HaKmwK0fVtkJhvbpKKPjRarLLPDBG3gfPQ8Tj/ZGVxnuY7
 9SYS5Z8rn1K5/lIf5zvh1m3zQsrFFbg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-AGi1a6sIO6eojflmw44BWQ-1; Fri, 20 Dec 2019 16:46:00 -0500
Received: by mail-qt1-f197.google.com with SMTP id t4so6882820qtd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 13:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=C5YX782Zv+g3uFQMicLe3D/pBuqpdZXdmdHZhVTJP8U=;
 b=ulMAcYnCbIUOr97ZIiPkhSw3Eex4gSed3BDdc5n/wWg/QjF5shXffg1l3bIt/rodE7
 RJ0pLqu27EqwVuUKQI1jX5dyypFzNBjarG8wfYnnemebrHtqrTwrhQo0ExV5+6JYN0f1
 OUyrNg5psYXrkyvEoFK69bq9g9hdulwzifczenahJCjynH3kqZ6UDr5ogv7Ru94rpLFw
 +UheJ+kQ0L7pseT3RCwKL3f/EcVDHcC/sGHVY7aOLy6/h9yFXEy9Q/0aOR2Y1d0hMj1E
 Yvb7o3HU3VDsfSvqOcd4tvFn8xgBYKMBHnCrelr45JS0BU1HEReYvTR7B0b/4BINtfmF
 46Zw==
X-Gm-Message-State: APjAAAV/Lp43q7GighWw/plwe3gb7OdtYFiDkVazg4wwcstEGTbkbtiM
 kDAZjcrocW9TPyg4cGKNik1aWmzI/6G31T//J2sUMPOUeLguC0ikAqLxALQssIYNQwo0xwLDwlr
 GKwvsRYkw/ovQl0eAitSyuHTYy2Sn
X-Received: by 2002:ac8:a8b:: with SMTP id d11mr13214628qti.94.1576878360442; 
 Fri, 20 Dec 2019 13:46:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqy3UgmjigMay5mNjhXatasnf6IA6DO5rs8e0SOVqhr4oXw3nWP8czosu+fzS8HQoYVRzdBDQw==
X-Received: by 2002:ac8:a8b:: with SMTP id d11mr13214614qti.94.1576878360247; 
 Fri, 20 Dec 2019 13:46:00 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id r80sm3249491qke.134.2019.12.20.13.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 13:45:59 -0800 (PST)
Message-ID: <dbdf8fff79f00aba7e5d54c8faf75af7fddca401.camel@redhat.com>
Subject: Re: [PATCH v9 10/18] drm/dp_mst: Manually overwrite PBN divider for
 calculating timeslots
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Date: Fri, 20 Dec 2019 16:45:58 -0500
In-Reply-To: <20191213200854.31545-11-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
 <20191213200854.31545-11-mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: AGi1a6sIO6eojflmw44BWQ-1
X-Mimecast-Spam-Score: 0
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
Cc: Manasi Navare <manasi.d.navare@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2019-12-13 at 15:08 -0500, mikita.lipski@amd.com wrote:
> From: Mikita Lipski <mikita.lipski@amd.com>
> 
> [why]
> For DSC case we cannot use topology manager's PBN divider
> variable. The default divider does not take FEC into account.
> Therefore the driver has to calculate its own divider based
> on the link rate and lane count its handling, as it is hw specific.
> 
> [how]
> Pass pbn_div as an argument, which is used if its more than
> zero, otherwise default topology manager's pbn_div will be used.
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
>  drivers/gpu/drm/drm_dp_mst_topology.c             | 9 +++++++--
>  drivers/gpu/drm/i915/display/intel_dp_mst.c       | 2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c           | 3 ++-
>  include/drm/drm_dp_mst_helper.h                   | 3 ++-
>  5 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 9fc03fc1017d..753a79734817 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4972,7 +4972,8 @@ static int dm_encoder_helper_atomic_check(struct
> drm_encoder *encoder,
>  	dm_new_connector_state->vcpi_slots =
> drm_dp_atomic_find_vcpi_slots(state,
>  									   mst
> _mgr,
>  									   mst
> _port,
> -									   dm_
> new_connector_state->pbn);
> +									   dm_
> new_connector_state->pbn,
> +									   0);
>  	if (dm_new_connector_state->vcpi_slots < 0) {
>  		DRM_DEBUG_ATOMIC("failed finding vcpi slots: %d\n",
> (int)dm_new_connector_state->vcpi_slots);
>  		return dm_new_connector_state->vcpi_slots;
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 74bed71f7315..bb0844dfb3d2 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4020,6 +4020,7 @@ static int drm_dp_init_vcpi(struct
> drm_dp_mst_topology_mgr *mgr,
>   * @mgr: MST topology manager for the port
>   * @port: port to find vcpi slots for
>   * @pbn: bandwidth required for the mode in PBN
> + * @pbn_div: divider for DSC mode that takes FEC into account
>   *
>   * Allocates VCPI slots to @port, replacing any previous VCPI allocations
> it
>   * may have had. Any atomic drivers which support MST must call this
> function
> @@ -4046,7 +4047,8 @@ static int drm_dp_init_vcpi(struct
> drm_dp_mst_topology_mgr *mgr,
>   */
>  int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
>  				  struct drm_dp_mst_topology_mgr *mgr,
> -				  struct drm_dp_mst_port *port, int pbn)
> +				  struct drm_dp_mst_port *port, int pbn,
> +				  int pbn_div)
>  {
>  	struct drm_dp_mst_topology_state *topology_state;
>  	struct drm_dp_vcpi_allocation *pos, *vcpi = NULL;
> @@ -4079,7 +4081,10 @@ int drm_dp_atomic_find_vcpi_slots(struct
> drm_atomic_state *state,
>  	if (!vcpi)
>  		prev_slots = 0;
>  
> -	req_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
> +	if (pbn_div <= 0)
> +		pbn_div = mgr->pbn_div;
> +
> +	req_slots = DIV_ROUND_UP(pbn, pbn_div);
>  
>  	DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] [MST PORT:%p] VCPI %d -> %d\n",
>  			 port->connector->base.id, port->connector->name,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 92be17711287..a068f54a6793 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -65,7 +65,7 @@ static int intel_dp_mst_compute_link_config(struct
> intel_encoder *encoder,
>  						       false);
>  
>  		slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp-
> >mst_mgr,
> -						      port, crtc_state->pbn);
> +						      port, crtc_state->pbn,
> 0);
>  		if (slots == -EDEADLK)
>  			return slots;
>  		if (slots >= 0)
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 1c9e23d5a6fd..edb78966c5b6 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -787,7 +787,8 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
>  
>  		slots = drm_dp_atomic_find_vcpi_slots(state, &mstm->mgr,
>  						      mstc->port,
> -						      asyh->dp.pbn);
> +						      asyh->dp.pbn,
> +						      0);
>  		if (slots < 0)
>  			return slots;
>  
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h
> index 32e60b9d7098..0f813d6346aa 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -771,7 +771,8 @@ struct drm_dp_mst_topology_state
> *drm_atomic_get_mst_topology_state(struct drm_a
>  int __must_check
>  drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
>  			      struct drm_dp_mst_topology_mgr *mgr,
> -			      struct drm_dp_mst_port *port, int pbn);
> +			      struct drm_dp_mst_port *port, int pbn,
> +			      int pbn_div);
>  int __must_check
>  drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
>  				 struct drm_dp_mst_topology_mgr *mgr,
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
