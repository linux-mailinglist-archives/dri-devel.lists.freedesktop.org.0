Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB9115EE6
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 23:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6F76E252;
	Sat,  7 Dec 2019 22:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690080.outbound.protection.outlook.com [40.107.69.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195DE6E24D;
 Sat,  7 Dec 2019 22:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpsY6NixluhktXvSB6pHrIgukrTIxyS5azKfMLu4WRKHiBOZZUdz8rmi1rXP5A6eU37JtJ6zXigQKsMQls8fz4i0cDTDMt8FISQL//foUl5/L20HJ+/JmliPbk9CsbTe19ibBw60RxWn+ArQ4JxsZoTk0kV2CPIbx+jerOaykpjHpSH31wdqkHFhCLe4/ESSnr855lgIY+NZFGteU7sYdSVchRqhLPf2BKvk1AFxAgea7FyawEnESR+DDlX4gUiJdiTCbcXLenj/Eq2iSnxUMesWbraOrc5UKnRbr/xdaIj2xApzCOHLBfpY9PUwcLyWGls1xDIR49vGjoiZD5ZF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4P4I4DrYvATtFkxvrQlJjTx9JNfNrnhGPlg7r5f5Ec=;
 b=QAw0yBIamrACwylxQG4xJuVtDDikJ39VkGt3JyzUxEvTEGRWDKUpivKORxWh6GfONqgx5RFmXKCgD5sRF5P/HmtmVL6CkCZQxqcH8Hiq28Oy6Wn08zSpiGR3SxuOT7kKGMN0DC8PuuZ6wiDzwtWOKyX0nyChwPs8D+56N/3yZKxWKH0Fi7bh5s8PN2JIIPJOKM/u24dqgatvw+g2wH+SvKQDDHz5PkjwKF5YHNN6mQMrYDsrHrlNCMGVfvz+NhiD+erqet7KoxyFKVgjPsfa8fArB7H7Zgi09Q/GymVIyZf2aAAPx0AZtbknxRMs2aA6wC3chqslhZrnXJrDr5Hxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3013.namprd12.prod.outlook.com (20.178.55.219) by
 BYAPR12MB3095.namprd12.prod.outlook.com (20.178.55.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Sat, 7 Dec 2019 22:13:40 +0000
Received: from BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::ed87:95bf:7c40:3fa5]) by BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::ed87:95bf:7c40:3fa5%7]) with mapi id 15.20.2516.003; Sat, 7 Dec 2019
 22:13:40 +0000
From: "Lipski, Mikita" <Mikita.Lipski@amd.com>
To: Lyude Paul <lyude@redhat.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v8 01/17] drm/dp_mst: Add PBN calculation for DSC modes
Thread-Topic: [PATCH v8 01/17] drm/dp_mst: Add PBN calculation for DSC modes
Thread-Index: AQHVqebx/l8RQY1ei0KCmvpbER9o6Ket05UAgAFtMkU=
Date: Sat, 7 Dec 2019 22:13:40 +0000
Message-ID: <BYAPR12MB3013097FAEB159E2470C4435E45E0@BYAPR12MB3013.namprd12.prod.outlook.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
 <20191203143530.27262-2-mikita.lipski@amd.com>,
 <591d04411b6c04450b68483c99f1e7e9494dabdf.camel@redhat.com>
In-Reply-To: <591d04411b6c04450b68483c99f1e7e9494dabdf.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:56a0:caa:744b:3c25:9e8b:cc9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b76c1d92-cad1-43ac-122b-08d77b62b6f1
x-ms-traffictypediagnostic: BYAPR12MB3095:
x-microsoft-antispam-prvs: <BYAPR12MB3095EFA9F8673735DBDA0424E45E0@BYAPR12MB3095.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0244637DEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(51914003)(189003)(199004)(54896002)(110136005)(55016002)(186003)(316002)(102836004)(9686003)(8936002)(478600001)(76176011)(33656002)(64756008)(66556008)(66946007)(76116006)(8676002)(229853002)(66476007)(4326008)(7696005)(99286004)(52536014)(9326002)(74316002)(81166006)(81156014)(53546011)(5660300002)(86362001)(2906002)(71190400001)(66446008)(71200400001)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3095;
 H:BYAPR12MB3013.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UVGNH2WfDKuiJEyB+a+KZb3Yrc+wDv9WwDm8D3BhK43HhpOM7O55Ewtwtl/sJywoawdtd56Smp8GdecFqF2RyLl+tYLamE7ufdyz7PcihBPP1WhYwM3nwHGSyRJ6iC+k+/o/SRLpUpHc8haB0JxdMeV/gObhlLAbi52Tq+Y7/hbSOqBh1uVAbd993KoCT+HeMLHnCMqmT6hlDMn0sQicUlSmWU7tsQH+kLYoC4btpG29VPWHW/wJ+tUG4ulISqGAIoBKg6mMjPTY/wRCkOkGtYvpRCqxH0sHrU+9oKKajdJwio3SjcsqpFZwYCd3J0zCh40KlqzYOFOkVY/v9UwVA1eZEeiQ5uPyTSovmI95dQvDlEUM1kaf6X1ADt+r731S3nuvwMhL0T/MeLf7TrlLqcQdm0KNlUjenXyx/g/uAwxH96HHr6swfcO8Lnp+1cnhrrjrnoPp+dtOIkFM/M5GT4efEjIdTbqF3FWTKYPC+d3jRU7q0vHo4jzOxIZUL5uF
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76c1d92-cad1-43ac-122b-08d77b62b6f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2019 22:13:40.0129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 19z8XpErCQiZtkv7bg8LcfTwqIpEbIClNnmkXVp3/JoMoRNgiD15nq4f6PxotGO1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3095
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4P4I4DrYvATtFkxvrQlJjTx9JNfNrnhGPlg7r5f5Ec=;
 b=dOs9lWS0BMkgnMxMukKRRPmcmGcwT8421KyxOpSKnWTHEIEBe0FnJFI22xVU2kBpH5sXlux+B1sIw40CTVvpRlx2jul1zqBGdqj4uGGCPrL/KQMUtsvB7PplcSOmMS+lOky3ucw5Q7wJ4hV4USSKpzXEldum4GYs2vuxtYVyrBA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1930026919=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1930026919==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_BYAPR12MB3013097FAEB159E2470C4435E45E0BYAPR12MB3013namp_"

--_000_BYAPR12MB3013097FAEB159E2470C4435E45E0BYAPR12MB3013namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Lyude,
Thanks for the review.
I=92ve updated this patch in a v9 iteration of it, I=92ve sent separately f=
rom the series this past Monday. The new version has the updated selftest.

Thanks,
Mikita

From: Lyude Paul<mailto:lyude@redhat.com>
Sent: December 6, 2019 7:17 PM
To: Lipski, Mikita<mailto:Mikita.Lipski@amd.com>; amd-gfx@lists.freedesktop=
.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>=
; David Francis<mailto:David.Francis@amd.com>
Subject: Re: [PATCH v8 01/17] drm/dp_mst: Add PBN calculation for DSC modes

This patch still needs to be rebased, and the selftests for the PBN
calculation that got added still need to be updated to reflect the changes =
for
dsc. The code for PBN calculation changed quite a bit upstream since this
series started.

On Tue, 2019-12-03 at 09:35 -0500, mikita.lipski@amd.com wrote:
> From: David Francis <David.Francis@amd.com>
>
> With DSC, bpp can be fractional in multiples of 1/16.
>
> Change drm_dp_calc_pbn_mode to reflect this, adding a new
> parameter bool dsc. When this parameter is true, treat the
> bpp parameter as having units not of bits per pixel, but
> 1/16 of a bit per pixel
>
> v2: Don't add separate function for this
>
> v3: Keep the calculation in a single equation
>
> Cc: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: David Francis <David.Francis@amd.com>
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 38 ++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        |  2 +-
>  include/drm/drm_dp_mst_helper.h               |  3 +-
>  6 files changed, 43 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 455c51c38720..9fc03fc1017d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4967,7 +4967,7 @@ static int dm_encoder_helper_atomic_check(struct
> drm_encoder *encoder,
>                                                                    is_y42=
0);
>                bpp =3D convert_dc_color_depth_into_bpc(color_depth) * 3;
>                clock =3D adjusted_mode->clock;
> -             dm_new_connector_state->pbn =3D drm_dp_calc_pbn_mode(clock,
> bpp);
> +             dm_new_connector_state->pbn =3D drm_dp_calc_pbn_mode(clock,=
 bpp,
> false);
>        }
>        dm_new_connector_state->vcpi_slots =3D
> drm_dp_atomic_find_vcpi_slots(state,
>                                                                          =
 mst
> _mgr,
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index ae5809a1f19a..261e2c1828c6 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4342,10 +4342,11 @@ EXPORT_SYMBOL(drm_dp_check_act_status);
>   * drm_dp_calc_pbn_mode() - Calculate the PBN for a mode.
>   * @clock: dot clock for the mode
>   * @bpp: bpp for the mode.
> + * @dsc: DSC mode. If true, bpp has units of 1/16 of a bit per pixel
>   *
>   * This uses the formula in the spec to calculate the PBN value for a mo=
de.
>   */
> -int drm_dp_calc_pbn_mode(int clock, int bpp)
> +int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc)
>  {
>        /*
>         * margin 5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
> @@ -4356,12 +4357,47 @@ int drm_dp_calc_pbn_mode(int clock, int bpp)
>         * peak_kbps *=3D (1006/1000)
>         * peak_kbps *=3D (64/54)
>         * peak_kbps *=3D 8    convert to bytes
> +      *
> +      * If the bpp is in units of 1/16, further divide by 16. Put this
> +      * factor in the numerator rather than the denominator to avoid
> +      * integer overflow
>         */
> +
> +     if (dsc)
> +             return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006 =
/
> 16),
> +                                     8 * 54 * 1000 * 1000);
> +
>        return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006),
>                                8 * 54 * 1000 * 1000);
> +
>  }
>  EXPORT_SYMBOL(drm_dp_calc_pbn_mode);
>
> +static int test_calc_pbn_mode(void)
> +{
> +     int ret;
> +     ret =3D drm_dp_calc_pbn_mode(154000, 30, false);
> +     if (ret !=3D 689) {
> +             DRM_ERROR("PBN calculation test failed - clock %d, bpp %d,
> expected PBN %d, actual PBN %d.\n",
> +                             154000, 30, 689, ret);
> +             return -EINVAL;
> +     }
> +     ret =3D drm_dp_calc_pbn_mode(234000, 30, false);
> +     if (ret !=3D 1047) {
> +             DRM_ERROR("PBN calculation test failed - clock %d, bpp %d,
> expected PBN %d, actual PBN %d.\n",
> +                             234000, 30, 1047, ret);
> +             return -EINVAL;
> +     }
> +     ret =3D drm_dp_calc_pbn_mode(297000, 24, false);
> +     if (ret !=3D 1063) {
> +             DRM_ERROR("PBN calculation test failed - clock %d, bpp %d,
> expected PBN %d, actual PBN %d.\n",
> +                             297000, 24, 1063, ret);
> +             return -EINVAL;
> +     }
> +     return 0;
> +}
> +
> +
>  /* we want to kick the TX after we've ack the up/down IRQs. */
>  static void drm_dp_mst_kick_tx(struct drm_dp_mst_topology_mgr *mgr)
>  {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 03d1cba0b696..92be17711287 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -61,7 +61,8 @@ static int intel_dp_mst_compute_link_config(struct
> intel_encoder *encoder,
>                crtc_state->pipe_bpp =3D bpp;
>
>                crtc_state->pbn =3D drm_dp_calc_pbn_mode(adjusted_mode-
> >crtc_clock,
> -                                                    crtc_state->pipe_bpp=
);
> +                                                    crtc_state->pipe_bpp=
,
> +                                                    false);
>
>                slots =3D drm_dp_atomic_find_vcpi_slots(state, &intel_dp-
> >mst_mgr,
>                                                      port, crtc_state->pb=
n);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 549486f1d937..1c9e23d5a6fd 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -782,7 +782,7 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
>                        const int bpp =3D connector->display_info.bpc * 3;
>                        const int clock =3D crtc_state->adjusted_mode.cloc=
k;
>
> -                     asyh->dp.pbn =3D drm_dp_calc_pbn_mode(clock, bpp);
> +                     asyh->dp.pbn =3D drm_dp_calc_pbn_mode(clock, bpp,
> false);
>                }
>
>                slots =3D drm_dp_atomic_find_vcpi_slots(state, &mstm->mgr,
> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> index ee28f5b3785e..28eef9282874 100644
> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> @@ -518,7 +518,7 @@ static bool radeon_mst_mode_fixup(struct drm_encoder
> *encoder,
>
>        mst_enc =3D radeon_encoder->enc_priv;
>
> -     mst_enc->pbn =3D drm_dp_calc_pbn_mode(adjusted_mode->clock, bpp);
> +     mst_enc->pbn =3D drm_dp_calc_pbn_mode(adjusted_mode->clock, bpp, fa=
lse);
>
>        mst_enc->primary->active_device =3D mst_enc->primary->devices & ms=
t_enc-
> >connector->devices;
>        DRM_DEBUG_KMS("setting active device to %08x from %08x %08x for
> encoder %d\n",
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h
> index d5fc90b30487..68656913cfe5 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -719,8 +719,7 @@ bool drm_dp_mst_port_has_audio(struct
> drm_dp_mst_topology_mgr *mgr,
>  struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct
> drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
>
>
> -int drm_dp_calc_pbn_mode(int clock, int bpp);
> -
> +int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc);
>
>  bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>                              struct drm_dp_mst_port *port, int pbn, int
> slots);
--
Cheers,
        Lyude Paul


--_000_BYAPR12MB3013097FAEB159E2470C4435E45E0BYAPR12MB3013namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-CA" link=3D"blue" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Lyude,</p>
<p class=3D"MsoNormal">Thanks for the review.</p>
<p class=3D"MsoNormal">I=92ve updated this patch in a v9 iteration of it, I=
=92ve sent separately from the series this past Monday. The new version has=
 the updated selftest.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,</p>
<p class=3D"MsoNormal">Mikita </p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:lyude@redhat.com">Lyude Paul</a><br>
<b>Sent: </b>December 6, 2019 7:17 PM<br>
<b>To: </b><a href=3D"mailto:Mikita.Lipski@amd.com">Lipski, Mikita</a>; <a =
href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
<b>Cc: </b><a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lis=
ts.freedesktop.org</a>;
<a href=3D"mailto:David.Francis@amd.com">David Francis</a><br>
<b>Subject: </b>Re: [PATCH v8 01/17] drm/dp_mst: Add PBN calculation for DS=
C modes</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">This patch still need=
s to be rebased, and the selftests for the PBN<br>
calculation that got added still need to be updated to reflect the changes =
for<br>
dsc. The code for PBN calculation changed quite a bit upstream since this<b=
r>
series started.<br>
<br>
On Tue, 2019-12-03 at 09:35 -0500, mikita.lipski@amd.com wrote:<br>
&gt; From: David Francis &lt;David.Francis@amd.com&gt;<br>
&gt; <br>
&gt; With DSC, bpp can be fractional in multiples of 1/16.<br>
&gt; <br>
&gt; Change drm_dp_calc_pbn_mode to reflect this, adding a new<br>
&gt; parameter bool dsc. When this parameter is true, treat the<br>
&gt; bpp parameter as having units not of bits per pixel, but<br>
&gt; 1/16 of a bit per pixel<br>
&gt; <br>
&gt; v2: Don't add separate function for this<br>
&gt; <br>
&gt; v3: Keep the calculation in a single equation<br>
&gt; <br>
&gt; Cc: Lyude Paul &lt;lyude@redhat.com&gt;<br>
&gt; Reviewed-by: Manasi Navare &lt;manasi.d.navare@intel.com&gt;<br>
&gt; Reviewed-by: Lyude Paul &lt;lyude@redhat.com&gt;<br>
&gt; Reviewed-by: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
&gt; Signed-off-by: David Francis &lt;David.Francis@amd.com&gt;<br>
&gt; Signed-off-by: Mikita Lipski &lt;mikita.lipski@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |&nbsp; 2 &#43;-<b=
r>
&gt;&nbsp; drivers/gpu/drm/drm_dp_mst_topology.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 38 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
&gt;&nbsp; drivers/gpu/drm/i915/display/intel_dp_mst.c&nbsp;&nbsp; |&nbsp; =
3 &#43;-<br>
&gt;&nbsp; drivers/gpu/drm/nouveau/dispnv50/disp.c&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 2 &#43;-<br>
&gt;&nbsp; drivers/gpu/drm/radeon/radeon_dp_mst.c&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 2 &#43;-<br>
&gt;&nbsp; include/drm/drm_dp_mst_helper.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 &#43;-<br>
&gt;&nbsp; 6 files changed, 43 insertions(&#43;), 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&gt; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&gt; index 455c51c38720..9fc03fc1017d 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br=
>
&gt; @@ -4967,7 &#43;4967,7 @@ static int dm_encoder_helper_atomic_check(st=
ruct<br>
&gt; drm_encoder *encoder,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_y420);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; bpp =3D convert_dc_color_depth_into_bpc(color_depth) * =
3;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; clock =3D adjusted_mode-&gt;clock;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; dm_new_connector_state-&gt;pbn =3D drm_dp_calc_pbn_mode(clock,<br>
&gt; bpp);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dm_new_connector_state-&gt;pbn =3D drm_dp_calc_pbn_mode(clock, bpp,=
<br>
&gt; false);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dm_new_connector_state-&gt;v=
cpi_slots =3D<br>
&gt; drm_dp_atomic_find_vcpi_slots(state,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m=
st<br>
&gt; _mgr,<br>
&gt; diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c<br>
&gt; b/drivers/gpu/drm/drm_dp_mst_topology.c<br>
&gt; index ae5809a1f19a..261e2c1828c6 100644<br>
&gt; --- a/drivers/gpu/drm/drm_dp_mst_topology.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/drm_dp_mst_topology.c<br>
&gt; @@ -4342,10 &#43;4342,11 @@ EXPORT_SYMBOL(drm_dp_check_act_status);<br=
>
&gt;&nbsp;&nbsp; * drm_dp_calc_pbn_mode() - Calculate the PBN for a mode.<b=
r>
&gt;&nbsp;&nbsp; * @clock: dot clock for the mode<br>
&gt;&nbsp;&nbsp; * @bpp: bpp for the mode.<br>
&gt; &#43; * @dsc: DSC mode. If true, bpp has units of 1/16 of a bit per pi=
xel<br>
&gt;&nbsp;&nbsp; *<br>
&gt;&nbsp;&nbsp; * This uses the formula in the spec to calculate the PBN v=
alue for a mode.<br>
&gt;&nbsp;&nbsp; */<br>
&gt; -int drm_dp_calc_pbn_mode(int clock, int bpp)<br>
&gt; &#43;int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * margin 5300ppm &#43;=
 300ppm ~ 0.6% as per spec, factor is 1.006<br>
&gt; @@ -4356,12 &#43;4357,47 @@ int drm_dp_calc_pbn_mode(int clock, int bp=
p)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * peak_kbps *=3D (1006=
/1000)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * peak_kbps *=3D (64/5=
4)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * peak_kbps *=3D 8&nbs=
p;&nbsp;&nbsp; convert to bytes<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If the bpp is in units of 1/16, =
further divide by 16. Put this<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * factor in the numerator rather t=
han the denominator to avoid<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * integer overflow<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (dsc)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006 /<br>
&gt; 16),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 8 * 54 * 1000 * 1000);<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DIV_ROUND_UP_ULL(mul_=
u32_u32(clock * bpp, 64 * 1006),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8 * 54 * 1000 * 1000);<br>
&gt; &#43;<br>
&gt;&nbsp; }<br>
&gt;&nbsp; EXPORT_SYMBOL(drm_dp_calc_pbn_mode);<br>
&gt;&nbsp; <br>
&gt; &#43;static int test_calc_pbn_mode(void)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_dp_calc_pbn_mode(154000, 30,=
 false);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret !=3D 689) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; DRM_ERROR(&quot;PBN calculation test failed - clock %d, bpp %d,<br>
&gt; expected PBN %d, actual PBN %d.\n&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 154000, 30, 689, ret);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return -EINVAL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_dp_calc_pbn_mode(234000, 30,=
 false);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret !=3D 1047) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; DRM_ERROR(&quot;PBN calculation test failed - clock %d, bpp %d,<br>
&gt; expected PBN %d, actual PBN %d.\n&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 234000, 30, 1047, ret);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return -EINVAL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_dp_calc_pbn_mode(297000, 24,=
 false);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret !=3D 1063) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; DRM_ERROR(&quot;PBN calculation test failed - clock %d, bpp %d,<br>
&gt; expected PBN %d, actual PBN %d.\n&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 297000, 24, 1063, ret);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return -EINVAL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;<br>
&gt;&nbsp; /* we want to kick the TX after we've ack the up/down IRQs. */<b=
r>
&gt;&nbsp; static void drm_dp_mst_kick_tx(struct drm_dp_mst_topology_mgr *m=
gr)<br>
&gt;&nbsp; {<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c<br>
&gt; b/drivers/gpu/drm/i915/display/intel_dp_mst.c<br>
&gt; index 03d1cba0b696..92be17711287 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/i915/display/intel_dp_mst.c<br>
&gt; @@ -61,7 &#43;61,8 @@ static int intel_dp_mst_compute_link_config(stru=
ct<br>
&gt; intel_encoder *encoder,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; crtc_state-&gt;pipe_bpp =3D bpp;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; crtc_state-&gt;pbn =3D drm_dp_calc_pbn_mode(adjusted_mo=
de-<br>
&gt; &gt;crtc_clock,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; crtc_state-&gt;pipe_bpp);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; crtc_state-&gt;pipe_bpp,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; false);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; slots =3D drm_dp_atomic_find_vcpi_slots(state, &amp;int=
el_dp-<br>
&gt; &gt;mst_mgr,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; port, crtc_state-&gt;pbn);<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c<br>
&gt; b/drivers/gpu/drm/nouveau/dispnv50/disp.c<br>
&gt; index 549486f1d937..1c9e23d5a6fd 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/nouveau/dispnv50/disp.c<br>
&gt; @@ -782,7 &#43;782,7 @@ nv50_msto_atomic_check(struct drm_encoder *enc=
oder,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const i=
nt bpp =3D connector-&gt;display_info.bpc * 3;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const i=
nt clock =3D crtc_state-&gt;adjusted_mode.clock;<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; asyh-&gt;dp.pbn =3D drm=
_dp_calc_pbn_mode(clock, bpp);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; asyh-&gt;dp.pbn =3D=
 drm_dp_calc_pbn_mode(clock, bpp,<br>
&gt; false);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; slots =3D drm_dp_atomic_find_vcpi_slots(state, &amp;mst=
m-&gt;mgr,<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c<br>
&gt; b/drivers/gpu/drm/radeon/radeon_dp_mst.c<br>
&gt; index ee28f5b3785e..28eef9282874 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/radeon/radeon_dp_mst.c<br>
&gt; @@ -518,7 &#43;518,7 @@ static bool radeon_mst_mode_fixup(struct drm_e=
ncoder<br>
&gt; *encoder,<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_enc =3D radeon_encoder-&=
gt;enc_priv;<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; mst_enc-&gt;pbn =3D drm_dp_calc_pbn_mode(adj=
usted_mode-&gt;clock, bpp);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mst_enc-&gt;pbn =3D drm_dp_calc_pbn_mode=
(adjusted_mode-&gt;clock, bpp, false);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_enc-&gt;primary-&gt;acti=
ve_device =3D mst_enc-&gt;primary-&gt;devices &amp; mst_enc-<br>
&gt; &gt;connector-&gt;devices;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG_KMS(&quot;setting =
active device to %08x from %08x %08x for<br>
&gt; encoder %d\n&quot;,<br>
&gt; diff --git a/include/drm/drm_dp_mst_helper.h<br>
&gt; b/include/drm/drm_dp_mst_helper.h<br>
&gt; index d5fc90b30487..68656913cfe5 100644<br>
&gt; --- a/include/drm/drm_dp_mst_helper.h<br>
&gt; &#43;&#43;&#43; b/include/drm/drm_dp_mst_helper.h<br>
&gt; @@ -719,8 &#43;719,7 @@ bool drm_dp_mst_port_has_audio(struct<br>
&gt; drm_dp_mst_topology_mgr *mgr,<br>
&gt;&nbsp; struct edid *drm_dp_mst_get_edid(struct drm_connector *connector=
, struct<br>
&gt; drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);<br>
&gt;&nbsp; <br>
&gt;&nbsp; <br>
&gt; -int drm_dp_calc_pbn_mode(int clock, int bpp);<br>
&gt; -<br>
&gt; &#43;int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc);<br>
&gt;&nbsp; <br>
&gt;&nbsp; bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mg=
r,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_mst_port *port, int pbn, int<br>
&gt; slots);<br>
-- <br>
Cheers,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lyude Paul<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR12MB3013097FAEB159E2470C4435E45E0BYAPR12MB3013namp_--

--===============1930026919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1930026919==--
