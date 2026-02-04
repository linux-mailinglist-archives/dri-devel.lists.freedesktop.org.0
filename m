Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hT+fB+/Qg2m5ugMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 00:06:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA75ED29B
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 00:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974F510E370;
	Wed,  4 Feb 2026 23:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OVoI0iwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D3E10E370
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 23:06:18 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-658ce852fbaso49681a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 15:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770246377; x=1770851177; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=f2or16IdPuBH+Us6KDsCVjpzjuTdT1iZplBGe8rzmqE=;
 b=OVoI0iwyCFb2gJpy6sagI7JfnRcdmDBQJR0aux6ewUDLu0WNcnRW/L0vZX9d/DdD0D
 lgPOOtAMmgIzs+pqqbbS5MvBkF6wbE8fZxMOJudZ+8nmHvfhg6S3HvCBHDHK9r1LBrR4
 lKommaM0fOD/OcMAJrRFwe4dfPMpzZbE0tlxWqE9RfOqaGDPYCKIYU6kgPJ0mStYZbfz
 zJrajzH2IPPZIdhAtQhuGAlF2drN7ir3GV48o2K4GLNVrT0PCvTalh+x9+v7+i3oIotr
 yQv1JdOJd2MbarGK5bSwBnLA33AERYAcWo6f6mKmpHZzI+0P/jxGmWofDh3lE/LudLcU
 u0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770246377; x=1770851177;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=f2or16IdPuBH+Us6KDsCVjpzjuTdT1iZplBGe8rzmqE=;
 b=GMYNmj6W4bU6Hh4+OHe60B/d51c7eJ+sE2QBiCa69f3bq2BFN0tURe5ZfWz5QzZFQn
 CxWnCHdLaart4r76Kmhoa2cJM3LF/Cd/phQZJg6yrcDKS62SBcMdUCEYHurdtqJTugsb
 dYbRwqcpXNxKwVEzBDiAf0/vZ+E3uZ1zeTa5VCrlVwqJAIxTWpeuTbEv5uWHwzrwdmoD
 t/Bzf6YCnQj7zH2qOSQHkbxq6uiB+YLt6v3o1U1v3tofJvTbbH23B5B1Uoyr7pVexmtE
 OD52tIX3LAqYYMZZaOcyYHTjaEnjNLQSy1uITFRAxmSgKxRbRycD/esnG8x4Fs5YnbC2
 LI7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRPE1xeIv0yjK7AFCaBoqRqCLN6wNZNHXQyToaYXr/YykO3fpUG5t+TxIveivNjOR//k0hfhumjRc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf/GfmlCwShV0mwF+Dt3aeZVh2NdQKX3+F3oMrYxnWasSO2RNH
 UiVXUoqjNWCvUKDCWCAG1GbKtMLmumjbEjyCA3CAYkW0IIl+qYOW4Kp9
X-Gm-Gg: AZuq6aK4tFUMZakMUbLQ98+SVqvGaDuJFxR+YFCdhwvESSc0PI84rOA1urzrrK2V4wZ
 Xxcz6RIypePplZtTw7G24F1o/VrP5Wd6gARdGOqHR0YT4iimenIAt8r52FNOPJlEvPADldPNAQb
 fLXDONbWlVuFkUN0AxrkoshANX5nQjkJrFucDEJd9RzSyOkSB5axpWuO9Sw55RVDxFxFb8TnHve
 TlX3Iu7hVdMnCTq674tDuvZu8fkspIw6o0B0OJwDOxrpxuOcPwokGlmQkNYa9uHZq0ADa5FxLXo
 4p3IvnAHRljBBdhSKYoJ5MOjj9kwcKEKvL/xHqWoPEHVVnh40/JPJSg7Bw4+0Yv1+6HRjfhqzvk
 hCnpB9VbxyXu4nl7Tp6fCSvRnShoepg2zJjySc0FGEPwIaE4RbDMpZLbJpDpSM8EWWGVCwibLKK
 ApakQf4R37yt8bJrARNCIChrCQlhIR8exSaH2ZmS3Gcrnv3Y1cdbFDdOksLyFpo+IhT3geXVg=
X-Received: by 2002:a05:6402:2684:b0:64d:46f:331 with SMTP id
 4fb4d7f45d1cf-65949fd5dddmr1744777a12.8.1770246376640; 
 Wed, 04 Feb 2026 15:06:16 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl.
 [87.205.5.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65949ed6b7esm1664299a12.11.2026.02.04.15.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 15:06:16 -0800 (PST)
Message-ID: <85ae9f0a13e33eae0be857753c4dc9037e9fa91b.camel@gmail.com>
Subject: Re: [Intel-gfx] [RFC 00/15] Add support for HDMI2.1 FRL
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Thu, 05 Feb 2026 00:06:15 +0100
In-Reply-To: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
References: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ankit.k.nautiyal@intel.com,m:intel-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,patchwork.freedesktop.org:url]
X-Rspamd-Queue-Id: 6CA75ED29B
X-Rspamd-Action: no action

On Mon, 2022-11-07 at 12:50 +0530, Ankit Nautiyal wrote:
> This set is RFC for adding support for HDMI2.1 FRL Link training.
> FRL or Fixed Rate Link is defined by HDMI2.1 spec for supporting higher
> bit-rate. As per HDMI2.1 specification, a new data-channel or lane is
> added in FRL mode, by repurposing the TMDS clock Channel. This enables
> HDMI to support 48 Gbps bandwidth (i.e. bit rate of 12 Gbps/lane for 4
> lanes).
>=20
> This series is a step for Native HDMI2.1 support for MTL and to begin
> discussion on the Fixed Rate Link Training part. It adds new structures,
> registers and functions for facilitating FRL training for HDMI2.1.
> Basically it provides the support for starting the Link training for a
> given bit rate and lane count.
>=20
> The appropriate bit rate and lanes need to be computed in the compute
> config phase for HDMI, for a given video-mode, which is not part of this
> series, but can be built on the basic structures and new members added
> in this series. The FRL Training will take place only when we take a
> decision to go for FRL mode and set the crtc_state parameters
> appropriately during compute config phase.
>=20
> The first 2 patches are prep work to have helper for getting MAX
> FRL rate for existing DP-to HDMI2.1 PCON and Native HDMI2.1 from an
> older series: https://patchwork.freedesktop.org/series/99311/
>=20
> As HDMI2.1 needs C20 PHY, there is dependency on patch series from
> Mika: https://patchwork.freedesktop.org/series/109714/
> Therefore Patch 3 which adds the C10/C20 registers, is taken from the
> above series for completeness, and FRL bits are added on top of that.
>=20
> Ankit Nautiyal (13):
>   drm/edid: Add helper to get max FRL rate for an HDMI sink
>   drm/i915/dp: Use the drm helpers for getting max FRL rate
>   drm/i915/hdmi21/mtl: Add new data members for FRL configuration
>   drm/drm_scdc_helper: Add SCDC helper funcs for HDMI2.1
>   drm/i915/mtl: Add registers for FRL Link Training
>   drm/i915/mtl: Add HDMI2.1 bits in PORT_BUF_CTL_1
>   drm/i915/mtl: Add port_data/data width for TRANS_DDI_FUNC and
>     DDI_BUF_CTL
>   drm/i915/display/mtl: Add new members in crtc_state for FRL
>     configuration
>   drm/i915/display/mtl: Update Transcoder/DDI registers with the frl
>     bits
>   drm/i915/display/mtl: Reset FRL Transcoder config while disabling HDMI
>   drm/i915/hdmi21/mtl: Enable Scrambling only for FRL mode
>   drm/i915/hdmi21/mtl: Add support for sending uevent to user for FRL
>     training failure
>   drm/i915/display/mtl: Add functions for FRL trainining state machine
>=20
> Mika Kahola (1):
>   drm/i915/mtl: Create separate reg file for PICA registers
>=20
> Vandita Kulkarni (1):
>   drm/i915/hdmi21/mtl: Parse frl max link rate from vbt
>=20
>  drivers/gpu/drm/display/drm_scdc_helper.c     | 196 ++++++++
>  drivers/gpu/drm/drm_edid.c                    |  38 ++
>  drivers/gpu/drm/i915/display/intel_bios.c     |  51 ++
>  drivers/gpu/drm/i915/display/intel_bios.h     |   1 +
>  .../gpu/drm/i915/display/intel_cx0_reg_defs.h | 144 ++++++
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  63 ++-
>  .../drm/i915/display/intel_display_types.h    |  32 ++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  17 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     | 443 +++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_hdmi.h     |   2 +
>  drivers/gpu/drm/i915/display/intel_vbt_defs.h |   7 +
>  drivers/gpu/drm/i915/i915_reg.h               |  33 +-
>  include/drm/display/drm_scdc.h                |  23 +
>  include/drm/display/drm_scdc_helper.h         |  21 +
>  include/drm/drm_edid.h                        |   2 +
>  15 files changed, 1052 insertions(+), 21 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_cx0_reg_defs.h

Does anybody know why this wasn't pursued further? I can't find anything
about FRL support in i915 as far as 6.18. Is it HDMI forum again? Is
there even anything left to hide at this point?
