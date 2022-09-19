Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E7A5BD7EE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 01:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EACF10E1C1;
	Mon, 19 Sep 2022 23:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F25D10E1B7;
 Mon, 19 Sep 2022 23:12:20 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MWgS30pcdz9sxL;
 Mon, 19 Sep 2022 23:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1663629139; bh=DkQmle7xAKgqaESS7YDG2RtCoM4nsxWLLzIMz/A+uxY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EZolbE5VRNlZbaerDP24iNRkHSP4jyVQn5PQNLlgSFBB6KypAch1berozoV2/14bM
 oiQ7TQj9a8ELXbMs4cxY2fVvv+xojPZ+xeQWm7FA3kAuzH1WUCQto4zaR/uvplDFrp
 wP3ZRzyRAXxgKd0wCwC3nbZBrnlBJ0pChwyy1peU=
X-Riseup-User-ID: 606E763E2668B4D71697192CEAF374585F765B2ECD3DCA0E71DB8D89095DAB43
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MWgRy2wXnz1yPb;
 Mon, 19 Sep 2022 23:12:14 +0000 (UTC)
Message-ID: <cd90693c-7324-5a74-9a5b-794032b9717f@riseup.net>
Date: Mon, 19 Sep 2022 20:12:12 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amd/display: remove redundant
 CalculateRemoteSurfaceFlipDelay's
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Nevenko.Stupar@amd.com, Pavle.Kotarac@amd.com,
 aric.cyr@amd.com
References: <20220919172720.3496405-1-trix@redhat.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220919172720.3496405-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tom

On 9/19/22 14:27, Tom Rix wrote:
> There are several copies of CalculateRemoteSurfaceFlipDelay.
> Reduce to one instance.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Just a minor comment below.

> ---
>  .../dc/dml/dcn20/display_mode_vba_20.c        |  4 +-
>  .../dc/dml/dcn20/display_mode_vba_20v2.c      | 40 +------------------
>  .../dc/dml/dcn21/display_mode_vba_21.c        | 40 +------------------
>  3 files changed, 4 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> index 4ca080950924..8e5d58336bc5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> @@ -158,7 +158,7 @@ double CalculateTWait(
>  		double DRAMClockChangeLatency,
>  		double UrgentLatency,
>  		double SREnterPlusExitTime);
> -static double CalculateRemoteSurfaceFlipDelay(
> +double CalculateRemoteSurfaceFlipDelay(
>  		struct display_mode_lib *mode_lib,
>  		double VRatio,
>  		double SwathWidth,
> @@ -2909,7 +2909,7 @@ double CalculateTWait(
>  	}
>  }
>  
> -static double CalculateRemoteSurfaceFlipDelay(
> +double CalculateRemoteSurfaceFlipDelay(

I guess it would be more clear if this function was placed on the
display_mode_vba20.h and named dml20_CalculateRemoteSurfaceFlipDelay.
Then, it would be clearer that this function is shared over the DCN20s.

Best Regards,
- Maíra Canal

>  		struct display_mode_lib *mode_lib,
>  		double VRatio,
>  		double SwathWidth,
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> index 2b4dcae4e432..e9ebc81adc71 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> @@ -182,7 +182,7 @@ double CalculateTWait(
>  		double DRAMClockChangeLatency,
>  		double UrgentLatency,
>  		double SREnterPlusExitTime);
> -static double CalculateRemoteSurfaceFlipDelay(
> +double CalculateRemoteSurfaceFlipDelay(
>  		struct display_mode_lib *mode_lib,
>  		double VRatio,
>  		double SwathWidth,
> @@ -2967,44 +2967,6 @@ static void dml20v2_DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
>  	}
>  }
>  
> -static double CalculateRemoteSurfaceFlipDelay(
> -		struct display_mode_lib *mode_lib,
> -		double VRatio,
> -		double SwathWidth,
> -		double Bpp,
> -		double LineTime,
> -		double XFCTSlvVupdateOffset,
> -		double XFCTSlvVupdateWidth,
> -		double XFCTSlvVreadyOffset,
> -		double XFCXBUFLatencyTolerance,
> -		double XFCFillBWOverhead,
> -		double XFCSlvChunkSize,
> -		double XFCBusTransportTime,
> -		double TCalc,
> -		double TWait,
> -		double *SrcActiveDrainRate,
> -		double *TInitXFill,
> -		double *TslvChk)
> -{
> -	double TSlvSetup, AvgfillRate, result;
> -
> -	*SrcActiveDrainRate = VRatio * SwathWidth * Bpp / LineTime;
> -	TSlvSetup = XFCTSlvVupdateOffset + XFCTSlvVupdateWidth + XFCTSlvVreadyOffset;
> -	*TInitXFill = XFCXBUFLatencyTolerance / (1 + XFCFillBWOverhead / 100);
> -	AvgfillRate = *SrcActiveDrainRate * (1 + XFCFillBWOverhead / 100);
> -	*TslvChk = XFCSlvChunkSize / AvgfillRate;
> -	dml_print(
> -			"DML::CalculateRemoteSurfaceFlipDelay: SrcActiveDrainRate: %f\n",
> -			*SrcActiveDrainRate);
> -	dml_print("DML::CalculateRemoteSurfaceFlipDelay: TSlvSetup: %f\n", TSlvSetup);
> -	dml_print("DML::CalculateRemoteSurfaceFlipDelay: TInitXFill: %f\n", *TInitXFill);
> -	dml_print("DML::CalculateRemoteSurfaceFlipDelay: AvgfillRate: %f\n", AvgfillRate);
> -	dml_print("DML::CalculateRemoteSurfaceFlipDelay: TslvChk: %f\n", *TslvChk);
> -	result = 2 * XFCBusTransportTime + TSlvSetup + TCalc + TWait + *TslvChk + *TInitXFill; // TODO: This doesn't seem to match programming guide
> -	dml_print("DML::CalculateRemoteSurfaceFlipDelay: RemoteSurfaceFlipDelay: %f\n", result);
> -	return result;
> -}
> -
>  static void CalculateActiveRowBandwidth(
>  		bool GPUVMEnable,
>  		enum source_format_class SourcePixelFormat,
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> index a3ef3638d979..d94aaf899f9b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> @@ -210,7 +210,7 @@ double CalculateTWait(
>  		double DRAMClockChangeLatency,
>  		double UrgentLatency,
>  		double SREnterPlusExitTime);
> -static double CalculateRemoteSurfaceFlipDelay(
> +double CalculateRemoteSurfaceFlipDelay(
>  		struct display_mode_lib *mode_lib,
>  		double VRatio,
>  		double SwathWidth,
> @@ -2980,44 +2980,6 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
>  	}
>  }
>  
> -static double CalculateRemoteSurfaceFlipDelay(
> -		struct display_mode_lib *mode_lib,
> -		double VRatio,
> -		double SwathWidth,
> -		double Bpp,
> -		double LineTime,
> -		double XFCTSlvVupdateOffset,
> -		double XFCTSlvVupdateWidth,
> -		double XFCTSlvVreadyOffset,
> -		double XFCXBUFLatencyTolerance,
> -		double XFCFillBWOverhead,
> -		double XFCSlvChunkSize,
> -		double XFCBusTransportTime,
> -		double TCalc,
> -		double TWait,
> -		double *SrcActiveDrainRate,
> -		double *TInitXFill,
> -		double *TslvChk)
> -{
> -	double TSlvSetup, AvgfillRate, result;
> -
> -	*SrcActiveDrainRate = VRatio * SwathWidth * Bpp / LineTime;
> -	TSlvSetup = XFCTSlvVupdateOffset + XFCTSlvVupdateWidth + XFCTSlvVreadyOffset;
> -	*TInitXFill = XFCXBUFLatencyTolerance / (1 + XFCFillBWOverhead / 100);
> -	AvgfillRate = *SrcActiveDrainRate * (1 + XFCFillBWOverhead / 100);
> -	*TslvChk = XFCSlvChunkSize / AvgfillRate;
> -	dml_print(
> -			"DML::CalculateRemoteSurfaceFlipDelay: SrcActiveDrainRate: %f\n",
> -			*SrcActiveDrainRate);
> -	dml_print("DML::CalculateRemoteSurfaceFlipDelay: TSlvSetup: %f\n", TSlvSetup);
> -	dml_print("DML::CalculateRemoteSurfaceFlipDelay: TInitXFill: %f\n", *TInitXFill);
> -	dml_print("DML::CalculateRemoteSurfaceFlipDelay: AvgfillRate: %f\n", AvgfillRate);
> -	dml_print("DML::CalculateRemoteSurfaceFlipDelay: TslvChk: %f\n", *TslvChk);
> -	result = 2 * XFCBusTransportTime + TSlvSetup + TCalc + TWait + *TslvChk + *TInitXFill; // TODO: This doesn't seem to match programming guide
> -	dml_print("DML::CalculateRemoteSurfaceFlipDelay: RemoteSurfaceFlipDelay: %f\n", result);
> -	return result;
> -}
> -
>  static void CalculateActiveRowBandwidth(
>  		bool GPUVMEnable,
>  		enum source_format_class SourcePixelFormat,
