Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 038CA65E0F8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 00:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C379E10E0EE;
	Wed,  4 Jan 2023 23:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9118C10E0EE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 23:34:31 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id z7so18400108pfq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 15:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZsTGtNUYgjtDy48ii9SWpqUX/tn7xRyFy1abYeOzEeM=;
 b=gzrFYlIgEOBZmzABvW5FxnlGlhD0307Tz8sifpNHwNLQi6QnDBdwqr9z6ZSsGtpjhM
 JQDryPxao4vLwwdUgKj80bfYVoZfE+LhuXbgl2n2RP0ZR97b7sWp4PQ4C9U+CBbrHb+o
 rx5NnpxxWJPBKoaJ/BaNTeJXa/GDcm2tPTs9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZsTGtNUYgjtDy48ii9SWpqUX/tn7xRyFy1abYeOzEeM=;
 b=X0AgphvT9MZtIuz/0TS8lE8t2l8aDjIz4XwQrlMZXKnzNkxgvo4UOpZF/88FQa5RQ9
 HL9oMNAsPyrfj7bN1Le4yJQrH1AS38NcfD7UT0pTtOvzI9JHYgA5FeYQqWam8gFBSKLJ
 NQI9Yi2stalEVFOo8GvBWPrWo1ll+F0XqTS6nYqz6sNeE9/Tt+/bHq+KVs3kzFtuaKPm
 D0nw7XiFUNs88hE0weLdWIzvXe/WUa+FBE1IaDTvHJOwKKdFglnEsPNnvnbTP0xGMqrz
 p8jmk2EqtXBvFEqoeoexY/Uw+lNna3AU8dfAzwAnPLSGo4/3sdesN5amISsZZqHcm2S1
 fzsg==
X-Gm-Message-State: AFqh2koFrwPZXDqXnbK7MBwIOU/m2VDpfgtP1xZcw2x4PRwPiuOCdeLg
 okcCr8MKpPjEsdD+9KPmykniLQ==
X-Google-Smtp-Source: AMrXdXuHSrx7lumgdyTyyXJ+jyhjixl13lLXCg4/PFeav0k/B1D/5ie3vttZHx6wN88Z0vLH75xzsg==
X-Received: by 2002:a62:18d6:0:b0:581:710e:56ad with SMTP id
 205-20020a6218d6000000b00581710e56admr30057260pfy.23.1672875271074; 
 Wed, 04 Jan 2023 15:34:31 -0800 (PST)
Received: from ?IPv6:2620:15c:90:200:f5c2:37ee:dcb2:8ca8?
 ([2620:15c:90:200:f5c2:37ee:dcb2:8ca8])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a056a00000100b0058124f92399sm18104314pfk.219.2023.01.04.15.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 15:34:30 -0800 (PST)
Message-ID: <03746298ad5a7996c5eba2efba185650beae1ce6.camel@chromium.org>
Subject: Re: [PATCH v3 4/7] drm/i915/pxp: Invalidate all PXP fw sessions
 during teardown
From: Juston Li <justonli@chromium.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>, 
 intel-gfx@lists.freedesktop.org
Date: Wed, 04 Jan 2023 15:34:29 -0800
In-Reply-To: <20221221230628.2715916-5-alan.previn.teres.alexis@intel.com>
References: <20221221230628.2715916-1-alan.previn.teres.alexis@intel.com>
 <20221221230628.2715916-5-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0-2 
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-12-21 at 15:06 -0800, Alan Previn wrote:
> A gap was recently discovered where if an application did not
> invalidate all of the stream keys (intentionally or not), and the
> driver did a full PXP global teardown on the GT subsystem, we
> find that future session creation would fail on the security
> firmware's side of the equation. i915 is the entity that needs
> ensure the sessions' state across both iGT and security firmware
> are at a known clean point when performing a full global teardown.
>=20
> Architecturally speaking, i915 should inspect all active sessions
> and submit the invalidate-stream-key PXP command to the security
> firmware for each of them. However, for the upstream i915 driver
> we only support the arbitration session that can be created
> so that will be the only session we will cleanup.
>=20
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Reviewed-by: Juston Li <justonli@chromium.org>

> ---
> =C2=A0drivers/gpu/drm/i915/pxp/intel_pxp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../drm/i915/pxp/intel_pxp_cmd_interface_42.h | 15 ++++++++
> =C2=A0.../i915/pxp/intel_pxp_cmd_interface_cmn.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 ++
> =C2=A0drivers/gpu/drm/i915/pxp/intel_pxp_session.c=C2=A0 |=C2=A0 2 ++
> =C2=A0drivers/gpu/drm/i915/pxp/intel_pxp_tee.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 35
> +++++++++++++++++++
> =C2=A05 files changed, 56 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> index 04440fada711..9658d3005222 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -24,6 +24,7 @@ void intel_pxp_init_hw(struct intel_pxp *pxp);
> =C2=A0void intel_pxp_fini_hw(struct intel_pxp *pxp);
> =C2=A0
> =C2=A0void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
> +void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32
> arb_session_id);
> =C2=A0
> =C2=A0int intel_pxp_start(struct intel_pxp *pxp);
> =C2=A0
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h
> b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h
> index 739f9072fa5f..26f7d9f01bf3 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h
> @@ -12,6 +12,9 @@
> =C2=A0/* PXP-Opcode for Init Session */
> =C2=A0#define PXP42_CMDID_INIT_SESSION 0x1e
> =C2=A0
> +/* PXP-Opcode for Invalidate Stream Key */
> +#define PXP42_CMDID_INVALIDATE_STREAM_KEY 0x00000007
> +
> =C2=A0/* PXP-Input-Packet: Init Session (Arb-Session) */
> =C2=A0struct pxp42_create_arb_in {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pxp_cmd_header hea=
der;
> @@ -25,4 +28,16 @@ struct pxp42_create_arb_out {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pxp_cmd_header hea=
der;
> =C2=A0} __packed;
> =C2=A0
> +/* PXP-Input-Packet: Invalidate Stream Key */
> +struct pxp42_inv_stream_key_in {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pxp_cmd_header header;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 rsvd[3];
> +} __packed;
> +
> +/* PXP-Output-Packet: Invalidate Stream Key */
> +struct pxp42_inv_stream_key_out {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pxp_cmd_header header;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 rsvd;
> +} __packed;
> +
> =C2=A0#endif /* __INTEL_PXP_FW_INTERFACE_42_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> index c2f23394f9b8..69e34ec49e78 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> @@ -27,6 +27,9 @@ struct pxp_cmd_header {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0union {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0u32 status; /* out */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0u32 stream_id; /* in */
> +#define PXP_CMDHDR_EXTDATA_SESSION_VALID GENMASK(0, 0)
> +#define PXP_CMDHDR_EXTDATA_APP_TYPE GENMASK(1, 1)
> +#define PXP_CMDHDR_EXTDATA_SESSION_ID GENMASK(17, 2)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Length of the message =
(excluding the header) */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 buffer_len;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index ae413580b81a..74ed7e16e481 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -110,6 +110,8 @@ static int
> pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_uncore_write(gt->un=
core, PXP_GLOBAL_TERMINATE, 1);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_pxp_tee_end_arb_fw_sessi=
on(pxp, ARB_SESSION);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index bef6d7f8ac55..9e247f38f3bd 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -311,3 +311,38 @@ int intel_pxp_tee_cmd_create_arb_session(struct
> intel_pxp *pxp,
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> =C2=A0}
> +
> +void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32
> session_id)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_i915_private *i915 =
=3D pxp->ctrl_gt->i915;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pxp42_inv_stream_key_in=
 msg_in =3D {0};
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pxp42_inv_stream_key_ou=
t msg_out =3D {0};
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret, trials =3D 0;
> +
> +try_again:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memset(&msg_in, 0, sizeof(msg_=
in));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memset(&msg_out, 0, sizeof(msg=
_out));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0msg_in.header.api_version =3D =
PXP_APIVER(4, 2);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0msg_in.header.command_id =3D P=
XP42_CMDID_INVALIDATE_STREAM_KEY;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0msg_in.header.buffer_len =3D s=
izeof(msg_in) -
> sizeof(msg_in.header);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0msg_in.header.stream_id =3D
> FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_VALID, 1);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0msg_in.header.stream_id |=3D
> FIELD_PREP(PXP_CMDHDR_EXTDATA_APP_TYPE, 0);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0msg_in.header.stream_id |=3D
> FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_ID, session_id);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D intel_pxp_tee_io_messa=
ge(pxp,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &msg_in, sizeof(msg_in),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &msg_out, sizeof(msg_out),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 NULL);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Cleanup coherency between G=
T and Firmware is critical, so
> try again if it fails */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((ret || msg_out.header.sta=
tus !=3D 0x0) && ++trials < 3)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0goto try_again;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0drm_err(&i915->drm, "Failed to send tee msg for inv-
> stream-key-%d, ret=3D[%d]\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0session_i=
d, ret);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else if (msg_out.header.status=
 !=3D 0x0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0drm_warn(&i915->drm, "PXP firmware failed inv-stream-
> key-%d with status 0x%08x\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 session_=
id, msg_out.header.status);
> +}

