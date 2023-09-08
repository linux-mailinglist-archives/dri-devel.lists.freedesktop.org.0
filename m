Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6A37988E1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F52010E8D0;
	Fri,  8 Sep 2023 14:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32C810E8CF;
 Fri,  8 Sep 2023 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sm5cLPPVnG35jNFyBxl/t+oSTz+wIWhzfnyLq38aQvs=; b=Bnc9BuYin8EAbj4eKmI80pe/ao
 /JISTSOQ8OQ9Y0hgfcI7dzk6ztA+3k6ffIewZXCOYCHW6+tyg09tVyGz5X+IOMJOUGJF8RGOveGEm
 5FNp+KGqcmd1VR4q//XmQtVfh4dcSPBN+oMqpzid5HX6Vw4Pg7SDmGx81NUFHI8DB2bmK7TrtB8le
 jSmtpHKGiJFAjQOeV7KhlJS75zgqN3D3NNK1938a7c7gT8OqJAZwLV2xFY+69ylrTGgJlostruEmW
 v0xTBiCQXzd5sMYeuWp+MDBk6KYwG8wI59n0pKhUWgG8O8uyKWUHG9+jv9xNKpQr0XfPNfZ7WUJ1q
 jym+Z0ZA==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qecFw-001Ot2-7P; Fri, 08 Sep 2023 16:14:43 +0200
Date: Fri, 8 Sep 2023 13:14:38 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v2 07/34] drm/amd/display: explicitly define EOTF and
 inverse EOTF
Message-ID: <20230908141429.j5qaukyjo4n5na7d@mail.igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-8-mwen@igalia.com>
 <20230822140242.162a843a.pekka.paalanen@collabora.com>
 <20230825141639.vurga52ysal37n2m@mail.igalia.com>
 <40f1fabe-69ce-4b23-aed8-9f0837fe9988@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40f1fabe-69ce-4b23-aed8-9f0837fe9988@amd.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06, Harry Wentland wrote:
> 
> 
> On 2023-08-25 10:18, Melissa Wen wrote:
> > On 08/22, Pekka Paalanen wrote:
> >> On Thu, 10 Aug 2023 15:02:47 -0100
> >> Melissa Wen <mwen@igalia.com> wrote:
> >>
> >>> Instead of relying on color block names to get the transfer function
> >>> intention regarding encoding pixel's luminance, define supported
> >>> Electro-Optical Transfer Functions (EOTFs) and inverse EOTFs, that
> >>> includes pure gamma or standardized transfer functions.
> >>>
> >>> Suggested-by: Harry Wentland <harry.wentland@amd.com>
> >>> Signed-off-by: Melissa Wen <mwen@igalia.com>
> >>> ---
> >>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 19 +++--
> >>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 69 +++++++++++++++----
> >>>  2 files changed, 67 insertions(+), 21 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>> index c749c9cb3d94..f6251ed89684 100644
> >>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>> @@ -718,14 +718,21 @@ extern const struct amdgpu_ip_block_version dm_ip_block;
> >>>  
> >>>  enum amdgpu_transfer_function {
> >>>  	AMDGPU_TRANSFER_FUNCTION_DEFAULT,
> >>> -	AMDGPU_TRANSFER_FUNCTION_SRGB,
> >>> -	AMDGPU_TRANSFER_FUNCTION_BT709,
> >>> -	AMDGPU_TRANSFER_FUNCTION_PQ,
> >>> +	AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_BT709_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_PQ_EOTF,
> >>>  	AMDGPU_TRANSFER_FUNCTION_LINEAR,
> >>>  	AMDGPU_TRANSFER_FUNCTION_UNITY,
> >>> -	AMDGPU_TRANSFER_FUNCTION_GAMMA22,
> >>> -	AMDGPU_TRANSFER_FUNCTION_GAMMA24,
> >>> -	AMDGPU_TRANSFER_FUNCTION_GAMMA26,
> >>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF,
> >>> +        AMDGPU_TRANSFER_FUNCTION_COUNT
> >>>  };
> >>>  
> >>>  struct dm_plane_state {
> >>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >>> index 56ce008b9095..cc2187c0879a 100644
> >>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >>> @@ -85,18 +85,59 @@ void amdgpu_dm_init_color_mod(void)
> >>>  }
> >>>  
> >>>  #ifdef AMD_PRIVATE_COLOR
> >>> -static const struct drm_prop_enum_list amdgpu_transfer_function_enum_list[] = {
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_DEFAULT, "Default" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_SRGB, "sRGB" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_BT709, "BT.709" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_LINEAR, "Linear" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_UNITY, "Unity" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
> >>> +static const char * const
> >>> +amdgpu_transfer_function_names[] = {
> >>> +	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		= "Default",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_LINEAR]		= "Linear",
> >>
> >> Hi,
> >>
> >> if the below is identity, then what is linear? Is there a coefficient
> >> (multiplier) somewhere? Offset?
> >>
> >>> +	[AMDGPU_TRANSFER_FUNCTION_UNITY]		= "Unity",
> >>
> >> Should "Unity" be called "Identity"?
> > 
> > AFAIU, AMD treats Linear and Unity as the same: Identity. So, IIUC,
> > indeed merging both as identity sounds the best approach.   
> 
> Agreed.
> 
> >>
> >> Doesn't unity mean that the output is always 1.0 regardless of input?
> >>
> >>> +	[AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF]		= "sRGB EOTF",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_BT709_EOTF]		= "BT.709 EOTF",
> >>
> >> BT.709 says about "Overall opto-electronic transfer characteristics at
> >> source":
> >>
> >> 	In typical production practice the encoding function of image
> >> 	sources is adjusted so that the final picture has the desired
> >> 	look, as viewed on a reference monitor having the reference
> >> 	decoding function of Recommendation ITU-R BT.1886, in the
> >> 	reference viewing environment defined in Recommendation ITU-R
> >> 	BT.2035.
> >>
> >> IOW, typically people tweak the encoding function instead of using
> >> BT.709 OETF as is, which means that inverting the BT.709 OETF produces
> >> something slightly unknown. The note about BT.1886 means that that
> >> something is also not quite how it's supposed to be turned into light.
> >>
> >> Should this enum item be "BT.709 inverse OETF" and respectively below a
> >> "BT.709 OETF"?
> >>
> >> What curve does the hardware actually implement?
> > 
> > Hmmmm.. I think I got confused in using OETF here since it's done within
> > a camera. Looking at the coefficients used by AMD color module when not
> > using ROM but build encoding and decoding curves[1] on pre-defined TF
> > setup, I understand it's using OETF parameters for building both sRGB
> > and BT 709:
> > 
> > ```
> > /*sRGB     709     2.2 2.4 P3*/
> > static const int32_t numerator01[] = { 31308,   180000, 0,  0,  0};
> > static const int32_t numerator02[] = { 12920,   4500,   0,  0,  0};
> > static const int32_t numerator03[] = { 55,      99,     0,  0,  0};
> > static const int32_t numerator04[] = { 55,      99,     0,  0,  0};
> > static const int32_t numerator05[] = { 2400,    2222,   2200, 2400, 2600};
> > ```
> > 
> 
> The first column here looks like the sRGB coefficients in Skia:
> https://skia.googlesource.com/skia/+/19936eb1b23fef5187b07fb2e0e67dcf605c0672/include/core/SkColorSpace.h#46
> 
> The color module uses the same coefficients to calculate the transform
> to linear space and from linear space. So it would support a TF and its
> inverse.
> 
> From what I understand for sRGB and PQ its the EOTF and its inverse.
> 
> For BT.709 we should probably call it BT.709 inverse OETF (instead of
> EOTF) and BT.709 OETF (instead of inverse EOTF).

I see. I'll update the transfer function list and docs accordingly.

Thanks

Melissa

> 
> While I'm okay to move ahead with these AMD driver-specific properties
> without IGT tests (since they're not enabled and not UABI) we really
> need IGT tests once they become UABI with the Color Pipeline API. And we
> need more than just CRC testing. We'll need to do pixel-by-pixel comparison
> so we can verify that the KMS driver behaves exactly how we expect for a
> large range of values.
> 
> Harry
> 
> > Then EOTF and inverse EOTF for PQ [2], and OETF and it seems an inverse
> > OETF but called EOTF for HLG[3]. But I'm an external dev, better if
> > Harry can confirm.
> > 
> > Thank you for pointing it out.
> > 
> > [1] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/display/modules/color/color_gamma.c#n55
> > [2] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/display/modules/color/color_gamma.c#n106
> > [3] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/display/modules/color/color_gamma.c#n174
> > 
> >>
> >> The others seem fine to me.
> >>
> >>
> >> Thanks,
> >> pq
> >>
> >>> +	[AMDGPU_TRANSFER_FUNCTION_PQ_EOTF]		= "PQ EOTF",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF]		= "Gamma 2.2 EOTF",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF]		= "Gamma 2.4 EOTF",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF]		= "Gamma 2.6 EOTF",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF]	= "sRGB inv_EOTF",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF]	= "BT.709 inv_EOTF",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF]		= "PQ inv_EOTF",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF]	= "Gamma 2.2 inv_EOTF",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF]	= "Gamma 2.4 inv_EOTF",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF]	= "Gamma 2.6 inv_EOTF",
> >>>  };
> >>>  
> >>> +static const u32 amdgpu_eotf =
> >>> +	BIT(AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF) |
> >>> +	BIT(AMDGPU_TRANSFER_FUNCTION_BT709_EOTF) |
> >>> +	BIT(AMDGPU_TRANSFER_FUNCTION_PQ_EOTF) |
> >>> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF) |
> >>> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF) |
> >>> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF);
> >>> +
> >>> +static struct drm_property *
> >>> +amdgpu_create_tf_property(struct drm_device *dev,
> >>> +			  const char *name,
> >>> +			  u32 supported_tf)
> >>> +{
> >>> +	u32 transfer_functions = supported_tf |
> >>> +				 BIT(AMDGPU_TRANSFER_FUNCTION_DEFAULT) |
> >>> +				 BIT(AMDGPU_TRANSFER_FUNCTION_LINEAR) |
> >>> +				 BIT(AMDGPU_TRANSFER_FUNCTION_UNITY);
> >>> +	struct drm_prop_enum_list enum_list[AMDGPU_TRANSFER_FUNCTION_COUNT];
> >>> +	int i, len;
> >>> +
> >>> +	len = 0;
> >>> +	for (i = 0; i < AMDGPU_TRANSFER_FUNCTION_COUNT; i++) {
> >>> +		if ((transfer_functions & BIT(i)) == 0)
> >>> +			continue;
> >>> +
> >>> +		enum_list[len].type = i;
> >>> +		enum_list[len].name = amdgpu_transfer_function_names[i];
> >>> +		len++;
> >>> +	}
> >>> +
> >>> +	return drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
> >>> +					name, enum_list, len);
> >>> +}
> >>> +
> >>>  int
> >>>  amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
> >>>  {
> >>> @@ -116,11 +157,9 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
> >>>  		return -ENOMEM;
> >>>  	adev->mode_info.plane_degamma_lut_size_property = prop;
> >>>  
> >>> -	prop = drm_property_create_enum(adev_to_drm(adev),
> >>> -					DRM_MODE_PROP_ENUM,
> >>> -					"AMD_PLANE_DEGAMMA_TF",
> >>> -					amdgpu_transfer_function_enum_list,
> >>> -					ARRAY_SIZE(amdgpu_transfer_function_enum_list));
> >>> +	prop = amdgpu_create_tf_property(adev_to_drm(adev),
> >>> +					 "AMD_PLANE_DEGAMMA_TF",
> >>> +					 amdgpu_eotf);
> >>>  	if (!prop)
> >>>  		return -ENOMEM;
> >>>  	adev->mode_info.plane_degamma_tf_property = prop;
> >>
> > 
> > 
> 
