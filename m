Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7837718004
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 14:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1130E10E4B6;
	Wed, 31 May 2023 12:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EE410E4B6;
 Wed, 31 May 2023 12:35:35 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-19f454bd2c8so3652339fac.3; 
 Wed, 31 May 2023 05:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685536533; x=1688128533;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b9AZS1ktoaapK3siunD9B+KchBJr9BGmfUOzDQLbyvQ=;
 b=RrV7MO8JqFliQBxnrmxbLuAX7c4pkU2dHXPSaVYEsaNwg0UH4sQlQmzcSU2ABJdpVD
 anwrx77vW2i27nuJX15NY1T5BUHLAdbDobHlhJgO8a1cSfT5c33tTZKWECaEaE06WGl/
 RfW2Lxei5x6gLJae60uuLVZ3GTsb9uuemLb2EoWYeV+V5zw0bCx27B2x5aXu9x0xEDTa
 c64JiT6xQApQ4u9jvlU4yKzCkHec4+oY6Ouu1hXuIC9sByw/+g8XuxpVhhCQ2c6Xwe/t
 LU26TmgrYHeUjDUtK6BDrPXx6CH+HGDJaBtY9198CHK7KWDaqq67N9CJdQU65jsl2H3y
 OY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685536533; x=1688128533;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b9AZS1ktoaapK3siunD9B+KchBJr9BGmfUOzDQLbyvQ=;
 b=SnrezQz1+X8sEq4PePn2+jXN2+bamLtUmLK2eUfT/mdwSetENjPBduV1M9/iTLR1zs
 iXgvSKih6XZB/5HHKvC84U5B7uaZxC2DZfN7wP3EZl17Ta9X5gqOm+AkhJJSc1zQrGJD
 UFYeiofOP9jZ0+ZBdp34ZpxlC1rX8tIG3c/QJJFWBH2eeHi3Ldu7myDLmd+BfMecDxhr
 u/fxfMy3y+r19+sTyWZ+dqOzKsF1NBe7nmd6QvJqqcgvZlP4PGOOlI3V3+UosCe8eBwM
 SmB1rtocqYkRAxjgn/MMyvyN0FgPGlg5ae6UIYZQyD/Aeb1dY+fF07N8mv84RXo53gld
 n50g==
X-Gm-Message-State: AC+VfDyzzAOfg3ykHgB/JgeKBDIzWszOl/R/2/ut9JufylRAC1c1sigy
 ANSzZWYKUO8izGfsp7XuE7PrRZs1lPDwRiugwNQ=
X-Google-Smtp-Source: ACHHUZ7K+P0pTYT3+q+g4HClQK0jyg+unRvzSajPbfsJwnUbTgBiM0kJlRhtEqv8Bk7yNGnYvUC4Wy6DDwe3xEdFrOw=
X-Received: by 2002:a05:6871:4d18:b0:180:b716:9825 with SMTP id
 ug24-20020a0568714d1800b00180b7169825mr2940941oab.57.1685536533603; Wed, 31
 May 2023 05:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230531040027.3457841-1-Wayne.Lin@amd.com>
In-Reply-To: <20230531040027.3457841-1-Wayne.Lin@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 31 May 2023 08:35:22 -0400
Message-ID: <CADnq5_MWQigGzi4oynP=wq3FF-NgisBr5Rjz61rx=u80sONtUQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Clear MSG_RDY flag before sending new message
To: Wayne Lin <Wayne.Lin@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: jani.nikula@intel.com, stable@vger.kernel.org, jerry.zuo@amd.com,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ dri-devel

On Wed, May 31, 2023 at 12:01=E2=80=AFAM Wayne Lin <Wayne.Lin@amd.com> wrot=
e:
>
> [Why]
> The sequence for collecting down_reply from source perspective should
> be:
>
> Request_n->repeat (get partial reply of Request_n->clear message ready
> flag to ack DPRX that the message is received) till all partial
> replies for Request_n are received->new Request_n+1.
>
> Now there is chance that drm_dp_mst_hpd_irq() will fire new down
> request in the tx queue when the down reply is incomplete. Source is
> restricted to generate interveleaved message transactions so we should
> avoid it.
>
> Also, while assembling partial reply packets, reading out DPCD DOWN_REP
> Sideband MSG buffer + clearing DOWN_REP_MSG_RDY flag should be
> wrapped up as a complete operation for reading out a reply packet.
> Kicking off a new request before clearing DOWN_REP_MSG_RDY flag might
> be risky. e.g. If the reply of the new request has overwritten the
> DPRX DOWN_REP Sideband MSG buffer before source writing one to clear
> DOWN_REP_MSG_RDY flag, source then unintentionally flushes the reply
> for the new request. Should handle the up request in the same way.
>
> [How]
> Separete drm_dp_mst_hpd_irq() into 2 steps. After acking the MST IRQ
> event, driver calls drm_dp_mst_hpd_irq_send_new_request() and might
> trigger drm_dp_mst_kick_tx() only when there is no on going message
> transaction.
>
> Changes since v1:
> * Reworked on review comments received
> -> Adjust the fix to let driver explicitly kick off new down request
> when mst irq event is handled and acked
> -> Adjust the commit message
>
> Changes since v2:
> * Adjust the commit message
> * Adjust the naming of the divided 2 functions and add a new input
>   parameter "ack".
> * Adjust code flow as per review comments.
>
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Cc: stable@vger.kernel.org
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 33 +++++++++-------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 +++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_dp.c       |  7 ++--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 12 ++++--
>  include/drm/display/drm_dp_mst_helper.h       |  7 +++-
>  5 files changed, 70 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d5cec03eaa8d..597c3368bcfb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3236,6 +3236,7 @@ static void dm_handle_mst_sideband_msg(struct amdgp=
u_dm_connector *aconnector)
>  {
>         u8 esi[DP_PSR_ERROR_STATUS - DP_SINK_COUNT_ESI] =3D { 0 };
>         u8 dret;
> +       u8 ack;
>         bool new_irq_handled =3D false;
>         int dpcd_addr;
>         int dpcd_bytes_to_read;
> @@ -3265,34 +3266,36 @@ static void dm_handle_mst_sideband_msg(struct amd=
gpu_dm_connector *aconnector)
>                 process_count < max_process_count) {
>                 u8 retry;
>                 dret =3D 0;
> +               ack =3D 0;
>
>                 process_count++;
>
>                 DRM_DEBUG_DRIVER("ESI %02x %02x %02x\n", esi[0], esi[1], =
esi[2]);
>                 /* handle HPD short pulse irq */
>                 if (aconnector->mst_mgr.mst_state)
> -                       drm_dp_mst_hpd_irq(
> -                               &aconnector->mst_mgr,
> -                               esi,
> -                               &new_irq_handled);
> +                       drm_dp_mst_hpd_irq_handle_event(&aconnector->mst_=
mgr,
> +                                                       esi,
> +                                                       &ack,
> +                                                       &new_irq_handled)=
;
>
>                 if (new_irq_handled) {
>                         /* ACK at DPCD to notify down stream */
> -                       const int ack_dpcd_bytes_to_write =3D
> -                               dpcd_bytes_to_read - 1;
> -
>                         for (retry =3D 0; retry < 3; retry++) {
> -                               u8 wret;
> -
> -                               wret =3D drm_dp_dpcd_write(
> -                                       &aconnector->dm_dp_aux.aux,
> -                                       dpcd_addr + 1,
> -                                       &esi[1],
> -                                       ack_dpcd_bytes_to_write);
> -                               if (wret =3D=3D ack_dpcd_bytes_to_write)
> +                               ssize_t wret;
> +
> +                               wret =3D drm_dp_dpcd_writeb(&aconnector->=
dm_dp_aux.aux,
> +                                                         dpcd_addr + 1,
> +                                                         ack);
> +                               if (wret =3D=3D 1)
>                                         break;
>                         }
>
> +                       if (retry =3D=3D 3) {
> +                               DRM_ERROR("Failed to ack MST event.\n");
> +                               return;
> +                       }
> +
> +                       drm_dp_mst_hpd_irq_send_new_request(&aconnector->=
mst_mgr);
>                         /* check if there is new irq to be handled */
>                         dret =3D drm_dp_dpcd_read(
>                                 &aconnector->dm_dp_aux.aux,
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 38dab76ae69e..13165e764709 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4053,9 +4053,10 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_=
mst_topology_mgr *mgr)
>  }
>
>  /**
> - * drm_dp_mst_hpd_irq() - MST hotplug IRQ notify
> + * drm_dp_mst_hpd_irq_handle_event() - MST hotplug IRQ handle MST event
>   * @mgr: manager to notify irq for.
>   * @esi: 4 bytes from SINK_COUNT_ESI
> + * @ack: flags of events to ack
>   * @handled: whether the hpd interrupt was consumed or not
>   *
>   * This should be called from the driver when it detects a short IRQ,
> @@ -4063,7 +4064,8 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_m=
st_topology_mgr *mgr)
>   * topology manager will process the sideband messages received as a res=
ult
>   * of this.
>   */
> -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, boo=
l *handled)
> +int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr,=
 const u8 *esi,
> +                                   u8 *ack, bool *handled)
>  {
>         int ret =3D 0;
>         int sc;
> @@ -4078,18 +4080,47 @@ int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology=
_mgr *mgr, u8 *esi, bool *handl
>         if (esi[1] & DP_DOWN_REP_MSG_RDY) {
>                 ret =3D drm_dp_mst_handle_down_rep(mgr);
>                 *handled =3D true;
> +               *ack |=3D DP_DOWN_REP_MSG_RDY;
>         }
>
>         if (esi[1] & DP_UP_REQ_MSG_RDY) {
>                 ret |=3D drm_dp_mst_handle_up_req(mgr);
>                 *handled =3D true;
> +               *ack |=3D DP_UP_REQ_MSG_RDY;
>         }
>
> -       drm_dp_mst_kick_tx(mgr);
>         return ret;
>  }
> -EXPORT_SYMBOL(drm_dp_mst_hpd_irq);
> +EXPORT_SYMBOL(drm_dp_mst_hpd_irq_handle_event);
> +
> +/**
> + * drm_dp_mst_hpd_irq_send_new_request() - MST hotplug IRQ kick off new =
request
> + * @mgr: manager to notify irq for.
> + *
> + * This should be called from the driver when mst irq event is handled
> + * and acked. Note that new down request should only be sent when
> + * previous message transaction is completed. Source is not supposed to =
generate
> + * interleaved message transactions.
> + */
> +void drm_dp_mst_hpd_irq_send_new_request(struct drm_dp_mst_topology_mgr =
*mgr)
> +{
> +       struct drm_dp_sideband_msg_tx *txmsg;
> +       bool kick =3D true;
>
> +       mutex_lock(&mgr->qlock);
> +       txmsg =3D list_first_entry_or_null(&mgr->tx_msg_downq,
> +                                        struct drm_dp_sideband_msg_tx, n=
ext);
> +       /* If last transaction is not completed yet*/
> +       if (!txmsg ||
> +           txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_START_SEND ||
> +           txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_SENT)
> +               kick =3D false;
> +       mutex_unlock(&mgr->qlock);
> +
> +       if (kick)
> +               drm_dp_mst_kick_tx(mgr);
> +}
> +EXPORT_SYMBOL(drm_dp_mst_hpd_irq_send_new_request);
>  /**
>   * drm_dp_mst_detect_port() - get connection status for an MST port
>   * @connector: DRM connector for this port
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 4bec8cd7979f..f24602887015 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4062,9 +4062,7 @@ intel_dp_mst_hpd_irq(struct intel_dp *intel_dp, u8 =
*esi, u8 *ack)
>  {
>         bool handled =3D false;
>
> -       drm_dp_mst_hpd_irq(&intel_dp->mst_mgr, esi, &handled);
> -       if (handled)
> -               ack[1] |=3D esi[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG=
_RDY);
> +       drm_dp_mst_hpd_irq_handle_event(&intel_dp->mst_mgr, esi, &ack[1],=
 &handled);
>
>         if (esi[1] & DP_CP_IRQ) {
>                 intel_hdcp_handle_cp_irq(intel_dp->attached_connector);
> @@ -4139,6 +4137,9 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp=
)
>
>                 if (!intel_dp_ack_sink_irq_esi(intel_dp, ack))
>                         drm_dbg_kms(&i915->drm, "Failed to ack ESI\n");
> +
> +               if (ack[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY))
> +                       drm_dp_mst_hpd_irq_send_new_request(&intel_dp->ms=
t_mgr);
>         }
>
>         return link_ok;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index 9b6824f6b9e4..b2d9978e88a8 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1357,6 +1357,7 @@ nv50_mstm_service(struct nouveau_drm *drm,
>         bool handled =3D true, ret =3D true;
>         int rc;
>         u8 esi[8] =3D {};
> +       u8 ack;
>
>         while (handled) {
>                 rc =3D drm_dp_dpcd_read(aux, DP_SINK_COUNT_ESI, esi, 8);
> @@ -1365,16 +1366,19 @@ nv50_mstm_service(struct nouveau_drm *drm,
>                         break;
>                 }
>
> -               drm_dp_mst_hpd_irq(&mstm->mgr, esi, &handled);
> +               ack =3D 0;
> +               drm_dp_mst_hpd_irq_handle_event(&mstm->mgr, esi, &ack, &h=
andled);
>                 if (!handled)
>                         break;
>
> -               rc =3D drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1, &esi=
[1],
> -                                      3);
> -               if (rc !=3D 3) {
> +               rc =3D drm_dp_dpcd_writeb(aux, DP_SINK_COUNT_ESI + 1, ack=
);
> +
> +               if (rc !=3D 1) {
>                         ret =3D false;
>                         break;
>                 }
> +
> +               drm_dp_mst_hpd_irq_send_new_request(&mstm->mgr);
>         }
>
>         if (!ret)
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/displa=
y/drm_dp_mst_helper.h
> index 32c764fb9cb5..40e855c8407c 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -815,8 +815,11 @@ void drm_dp_mst_topology_mgr_destroy(struct drm_dp_m=
st_topology_mgr *mgr);
>  bool drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIV=
ER_CAP_SIZE]);
>  int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr,=
 bool mst_state);
>
> -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, boo=
l *handled);
> -
> +int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr,
> +                                   const u8 *esi,
> +                                   u8 *ack,
> +                                   bool *handled);
> +void drm_dp_mst_hpd_irq_send_new_request(struct drm_dp_mst_topology_mgr =
*mgr);
>
>  int
>  drm_dp_mst_detect_port(struct drm_connector *connector,
> --
> 2.37.3
>
