Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0D672D471
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 00:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07B010E066;
	Mon, 12 Jun 2023 22:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B869310E066
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 22:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686609252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJLInVJEKXNw7vCOj/1bHLr6YoEVgTokYOzOmHQKO24=;
 b=EJOWB/lN/+ovvSclVMC32dzge3Pq69aWY+i0MLLfI9xhnVztiRhybmcXah39wXqBnWDAPZ
 s3+M+LCB+AbdossqKQJcB9YITGCgWsmKZc+9xSIb8CAfIgGt7whdJ6Bf6b2PtTeBRs1XGi
 5dbaBbFTtEEPixLQg64bKPLRFzDnolQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-0J6NHH0KNHCCNqzwvoAEtg-1; Mon, 12 Jun 2023 18:34:11 -0400
X-MC-Unique: 0J6NHH0KNHCCNqzwvoAEtg-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3f9f44bba08so5796211cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686609251; x=1689201251;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AbeCENkMKx/+aAQtVAjinuSws5DYTdc2Zscj2BYBR5M=;
 b=WXu2dRmVZnjFawF2nkBc3WbWNbCOpl5M36PmHY1CM8Nj3xuL3kZ6M/BX2AO/jq2sR/
 itInbjxgQHTxdfHtjjBT+08X7y/+OwUvfmaYGdZp6563PHY38EN7Y7f1d4WQ2DD8LvfQ
 kGCudy1q7q1qy5zCGUHdVuvZyMDsgNcWvu5NEb0FnBcinpfyqkYJMfozqDHluFvxppL5
 c3rOhIKspPh1weINL+Dr0un7jssT0QDZJFrQ1gAZyNJgTc+ccqViw1espqL0dgPE3GSc
 Lt+moO5VLv4GZQ0L/dovZBBLb/9XDOOmBKpKktao7YYFOZAxU8hBrnRRUFvVsvqfqZ38
 0Bxg==
X-Gm-Message-State: AC+VfDzxGaZoUYNLxbRkvLmwcZWeAoqP1srgGeUhKL17cvyTSiT+Mros
 UXuaNGiRPIL56DQ4j+Td1TgIGKE6sheV+Fb0KFEFwdSelYCgkZ2pw/5lk89q3j2MDE0G104te4/
 XMCtLTMRPRtWXaBpHYrKUZ+2fXVjS
X-Received: by 2002:a05:622a:100c:b0:3f6:9b4e:512a with SMTP id
 d12-20020a05622a100c00b003f69b4e512amr11740516qte.54.1686609250849; 
 Mon, 12 Jun 2023 15:34:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40JOINKlTsIVmrGQ0AaM7ywK31TKcr/8Fs7KJrfRHtAxNfOfJAoa2ygQC7gloFxvmoeQOkOQ==
X-Received: by 2002:a05:622a:100c:b0:3f6:9b4e:512a with SMTP id
 d12-20020a05622a100c00b003f69b4e512amr11740486qte.54.1686609250484; 
 Mon, 12 Jun 2023 15:34:10 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 2-20020ac85642000000b003f9c2f51558sm3724441qtt.24.2023.06.12.15.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 15:34:10 -0700 (PDT)
Message-ID: <cf4bd446d5cbbd7021a44418f54c6f70958b9c4e.camel@redhat.com>
Subject: Re: [PATCH v5] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Mon, 12 Jun 2023 18:34:09 -0400
In-Reply-To: <20230609104925.3736756-1-Wayne.Lin@amd.com>
References: <20230609104925.3736756-1-Wayne.Lin@amd.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: jani.nikula@intel.com, stable@vger.kernel.org, jerry.zuo@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FWIW: Should have a response to this very soon, figured out the cause of my
MST issues so I should be able to test this very soon

On Fri, 2023-06-09 at 18:49 +0800, Wayne Lin wrote:
> [Why]
> The sequence for collecting down_reply from source perspective should
> be:
>=20
> Request_n->repeat (get partial reply of Request_n->clear message ready
> flag to ack DPRX that the message is received) till all partial
> replies for Request_n are received->new Request_n+1.
>=20
> Now there is chance that drm_dp_mst_hpd_irq() will fire new down
> request in the tx queue when the down reply is incomplete. Source is
> restricted to generate interveleaved message transactions so we should
> avoid it.
>=20
> Also, while assembling partial reply packets, reading out DPCD DOWN_REP
> Sideband MSG buffer + clearing DOWN_REP_MSG_RDY flag should be
> wrapped up as a complete operation for reading out a reply packet.
> Kicking off a new request before clearing DOWN_REP_MSG_RDY flag might
> be risky. e.g. If the reply of the new request has overwritten the
> DPRX DOWN_REP Sideband MSG buffer before source writing one to clear
> DOWN_REP_MSG_RDY flag, source then unintentionally flushes the reply
> for the new request. Should handle the up request in the same way.
>=20
> [How]
> Separete drm_dp_mst_hpd_irq() into 2 steps. After acking the MST IRQ
> event, driver calls drm_dp_mst_hpd_irq_send_new_request() and might
> trigger drm_dp_mst_kick_tx() only when there is no on going message
> transaction.
>=20
> Changes since v1:
> * Reworked on review comments received
> -> Adjust the fix to let driver explicitly kick off new down request
> when mst irq event is handled and acked
> -> Adjust the commit message
>=20
> Changes since v2:
> * Adjust the commit message
> * Adjust the naming of the divided 2 functions and add a new input
>   parameter "ack".
> * Adjust code flow as per review comments.
>=20
> Changes since v3:
> * Update the function description of drm_dp_mst_hpd_irq_handle_event
>=20
> Changes since v4:
> * Change ack of drm_dp_mst_hpd_irq_handle_event() to be an array align
>   the size of esi[]
>=20
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Cc: stable@vger.kernel.org
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 +++++------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 54 ++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp.c       |  7 +--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 12 +++--
>  include/drm/display/drm_dp_mst_helper.h       |  7 ++-
>  5 files changed, 81 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d5cec03eaa8d..ec629b4037e4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3263,6 +3263,7 @@ static void dm_handle_mst_sideband_msg(struct amdgp=
u_dm_connector *aconnector)
> =20
>  =09while (dret =3D=3D dpcd_bytes_to_read &&
>  =09=09process_count < max_process_count) {
> +=09=09u8 ack[DP_PSR_ERROR_STATUS - DP_SINK_COUNT_ESI] =3D {};
>  =09=09u8 retry;
>  =09=09dret =3D 0;
> =20
> @@ -3271,28 +3272,29 @@ static void dm_handle_mst_sideband_msg(struct amd=
gpu_dm_connector *aconnector)
>  =09=09DRM_DEBUG_DRIVER("ESI %02x %02x %02x\n", esi[0], esi[1], esi[2]);
>  =09=09/* handle HPD short pulse irq */
>  =09=09if (aconnector->mst_mgr.mst_state)
> -=09=09=09drm_dp_mst_hpd_irq(
> -=09=09=09=09&aconnector->mst_mgr,
> -=09=09=09=09esi,
> -=09=09=09=09&new_irq_handled);
> +=09=09=09drm_dp_mst_hpd_irq_handle_event(&aconnector->mst_mgr,
> +=09=09=09=09=09=09=09esi,
> +=09=09=09=09=09=09=09ack,
> +=09=09=09=09=09=09=09&new_irq_handled);
> =20
>  =09=09if (new_irq_handled) {
>  =09=09=09/* ACK at DPCD to notify down stream */
> -=09=09=09const int ack_dpcd_bytes_to_write =3D
> -=09=09=09=09dpcd_bytes_to_read - 1;
> -
>  =09=09=09for (retry =3D 0; retry < 3; retry++) {
> -=09=09=09=09u8 wret;
> -
> -=09=09=09=09wret =3D drm_dp_dpcd_write(
> -=09=09=09=09=09&aconnector->dm_dp_aux.aux,
> -=09=09=09=09=09dpcd_addr + 1,
> -=09=09=09=09=09&esi[1],
> -=09=09=09=09=09ack_dpcd_bytes_to_write);
> -=09=09=09=09if (wret =3D=3D ack_dpcd_bytes_to_write)
> +=09=09=09=09ssize_t wret;
> +
> +=09=09=09=09wret =3D drm_dp_dpcd_writeb(&aconnector->dm_dp_aux.aux,
> +=09=09=09=09=09=09=09  dpcd_addr + 1,
> +=09=09=09=09=09=09=09  ack[1]);
> +=09=09=09=09if (wret =3D=3D 1)
>  =09=09=09=09=09break;
>  =09=09=09}
> =20
> +=09=09=09if (retry =3D=3D 3) {
> +=09=09=09=09DRM_ERROR("Failed to ack MST event.\n");
> +=09=09=09=09return;
> +=09=09=09}
> +
> +=09=09=09drm_dp_mst_hpd_irq_send_new_request(&aconnector->mst_mgr);
>  =09=09=09/* check if there is new irq to be handled */
>  =09=09=09dret =3D drm_dp_dpcd_read(
>  =09=09=09=09&aconnector->dm_dp_aux.aux,
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 38dab76ae69e..487d057a9582 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4053,17 +4053,28 @@ static int drm_dp_mst_handle_up_req(struct drm_dp=
_mst_topology_mgr *mgr)
>  }
> =20
>  /**
> - * drm_dp_mst_hpd_irq() - MST hotplug IRQ notify
> + * drm_dp_mst_hpd_irq_handle_event() - MST hotplug IRQ handle MST event
>   * @mgr: manager to notify irq for.
>   * @esi: 4 bytes from SINK_COUNT_ESI
> + * @ack: 4 bytes used to ack events starting from SINK_COUNT_ESI
>   * @handled: whether the hpd interrupt was consumed or not
>   *
> - * This should be called from the driver when it detects a short IRQ,
> + * This should be called from the driver when it detects a HPD IRQ,
>   * along with the value of the DEVICE_SERVICE_IRQ_VECTOR_ESI0. The
> - * topology manager will process the sideband messages received as a res=
ult
> - * of this.
> + * topology manager will process the sideband messages received
> + * as indicated in the DEVICE_SERVICE_IRQ_VECTOR_ESI0 and set the
> + * corresponding flags that Driver has to ack the DP receiver later.
> + *
> + * Note that driver shall also call
> + * drm_dp_mst_hpd_irq_send_new_request() if the 'handled' is set
> + * after calling this function, to try to kick off a new request in
> + * the queue if the previous message transaction is completed.
> + *
> + * See also:
> + * drm_dp_mst_hpd_irq_send_new_request()
>   */
> -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, boo=
l *handled)
> +int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr,=
 const u8 *esi,
> +=09=09=09=09    u8 *ack, bool *handled)
>  {
>  =09int ret =3D 0;
>  =09int sc;
> @@ -4078,18 +4089,47 @@ int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology=
_mgr *mgr, u8 *esi, bool *handl
>  =09if (esi[1] & DP_DOWN_REP_MSG_RDY) {
>  =09=09ret =3D drm_dp_mst_handle_down_rep(mgr);
>  =09=09*handled =3D true;
> +=09=09ack[1] |=3D DP_DOWN_REP_MSG_RDY;
>  =09}
> =20
>  =09if (esi[1] & DP_UP_REQ_MSG_RDY) {
>  =09=09ret |=3D drm_dp_mst_handle_up_req(mgr);
>  =09=09*handled =3D true;
> +=09=09ack[1] |=3D DP_UP_REQ_MSG_RDY;
>  =09}
> =20
> -=09drm_dp_mst_kick_tx(mgr);
>  =09return ret;
>  }
> -EXPORT_SYMBOL(drm_dp_mst_hpd_irq);
> +EXPORT_SYMBOL(drm_dp_mst_hpd_irq_handle_event);
> =20
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
> +=09struct drm_dp_sideband_msg_tx *txmsg;
> +=09bool kick =3D true;
> +
> +=09mutex_lock(&mgr->qlock);
> +=09txmsg =3D list_first_entry_or_null(&mgr->tx_msg_downq,
> +=09=09=09=09=09 struct drm_dp_sideband_msg_tx, next);
> +=09/* If last transaction is not completed yet*/
> +=09if (!txmsg ||
> +=09    txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_START_SEND ||
> +=09    txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_SENT)
> +=09=09kick =3D false;
> +=09mutex_unlock(&mgr->qlock);
> +
> +=09if (kick)
> +=09=09drm_dp_mst_kick_tx(mgr);
> +}
> +EXPORT_SYMBOL(drm_dp_mst_hpd_irq_send_new_request);
>  /**
>   * drm_dp_mst_detect_port() - get connection status for an MST port
>   * @connector: DRM connector for this port
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 4bec8cd7979f..f4a2e72a5c20 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4062,9 +4062,7 @@ intel_dp_mst_hpd_irq(struct intel_dp *intel_dp, u8 =
*esi, u8 *ack)
>  {
>  =09bool handled =3D false;
> =20
> -=09drm_dp_mst_hpd_irq(&intel_dp->mst_mgr, esi, &handled);
> -=09if (handled)
> -=09=09ack[1] |=3D esi[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY);
> +=09drm_dp_mst_hpd_irq_handle_event(&intel_dp->mst_mgr, esi, ack, &handle=
d);
> =20
>  =09if (esi[1] & DP_CP_IRQ) {
>  =09=09intel_hdcp_handle_cp_irq(intel_dp->attached_connector);
> @@ -4139,6 +4137,9 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp=
)
> =20
>  =09=09if (!intel_dp_ack_sink_irq_esi(intel_dp, ack))
>  =09=09=09drm_dbg_kms(&i915->drm, "Failed to ack ESI\n");
> +
> +=09=09if (ack[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY))
> +=09=09=09drm_dp_mst_hpd_irq_send_new_request(&intel_dp->mst_mgr);
>  =09}
> =20
>  =09return link_ok;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index 9b6824f6b9e4..42e1665ba11a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1359,22 +1359,26 @@ nv50_mstm_service(struct nouveau_drm *drm,
>  =09u8 esi[8] =3D {};
> =20
>  =09while (handled) {
> +=09=09u8 ack[8] =3D {};
> +
>  =09=09rc =3D drm_dp_dpcd_read(aux, DP_SINK_COUNT_ESI, esi, 8);
>  =09=09if (rc !=3D 8) {
>  =09=09=09ret =3D false;
>  =09=09=09break;
>  =09=09}
> =20
> -=09=09drm_dp_mst_hpd_irq(&mstm->mgr, esi, &handled);
> +=09=09drm_dp_mst_hpd_irq_handle_event(&mstm->mgr, esi, ack, &handled);
>  =09=09if (!handled)
>  =09=09=09break;
> =20
> -=09=09rc =3D drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1, &esi[1],
> -=09=09=09=09       3);
> -=09=09if (rc !=3D 3) {
> +=09=09rc =3D drm_dp_dpcd_writeb(aux, DP_SINK_COUNT_ESI + 1, ack[1]);
> +
> +=09=09if (rc !=3D 1) {
>  =09=09=09ret =3D false;
>  =09=09=09break;
>  =09=09}
> +
> +=09=09drm_dp_mst_hpd_irq_send_new_request(&mstm->mgr);
>  =09}
> =20
>  =09if (!ret)
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
> =20
> -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, boo=
l *handled);
> -
> +int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr,
> +=09=09=09=09    const u8 *esi,
> +=09=09=09=09    u8 *ack,
> +=09=09=09=09    bool *handled);
> +void drm_dp_mst_hpd_irq_send_new_request(struct drm_dp_mst_topology_mgr =
*mgr);
> =20
>  int
>  drm_dp_mst_detect_port(struct drm_connector *connector,

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

