Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0BB7E2C1F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 19:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4EA10E3AC;
	Mon,  6 Nov 2023 18:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F95110E3A9;
 Mon,  6 Nov 2023 18:35:50 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1e9c42fc0c9so1946569fac.1; 
 Mon, 06 Nov 2023 10:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699295749; x=1699900549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4FyxgsqyDTTsJmSPOBc9fyUquINbkS3ed/Fwy5DuS5A=;
 b=gl4vbfWa36i9A9ldwL9EbuiZKfkLjEcZpauphv4RljdWiejwzHawwxfPUpL0RK889k
 HyDml9e6ikX+181+r23mYYryRmV8CT6Z0GFPC13xek+Rmsqlqpf9s6MrQBDKPmHWjpjl
 8Fkg5lLG1GLFDhp/+Cf7PcGwdWKtdL7yvBAiGsuZRCrBJLWkCWIQifuuNThZwCRSSLIX
 N8Yawvfrs5SR381ysFvVeIrYDijCWCsI3dd/6qfi6Co3Q3zCRsQH/49QblqPLtqrXa5E
 CMxeyee00n7XvamggX81mZRpmxTF7GGhdQ57RLvn6M0G/Gtx+DjnW8H2fbbWQOWy7vXX
 jGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699295749; x=1699900549;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4FyxgsqyDTTsJmSPOBc9fyUquINbkS3ed/Fwy5DuS5A=;
 b=xHPutqyp6ejEhEX7NsAutGvNaDJsacZ500eJSu9vvqglSWEq/Ahfexpildh+xCtTFq
 b80ePrl9QZORC5Fm2U9EN8p2LNtqCIvCa1A4gVNRfkBeDx42omAa40/TKuWY49RXVjda
 r8Y9hW2ukouopiHFxUW+xQqKPX/frtIp++SPyAciwBiyNbbNCnEFTwCwrtev5cJt532q
 hT8EYNOietCj42B+96d37mK3Dy4ALHpkFWQnRa4iteOHuhpB22C/7XLcwMgqRNyQFU0J
 n9x/sg4tnip0Malh17VTZ6Y1xBdyYHEE2WCkMn9R5uBrMLIiiVvQk3QPbEdEWb4LQQ8B
 ikpQ==
X-Gm-Message-State: AOJu0Yx9x0XcIFliT7ju90nkiBhxTOkPa48m5r4Y/OXvHB8lFreNCZSC
 dYJ4otm0QWqwejqlz2Bsh3dfzxlo3a7wr7CIVc0In+Iu
X-Google-Smtp-Source: AGHT+IHyNL5Y+NlJaXyaf72PDsyLKHnkDv/n1KFwzrC23GcvbcqxrMtSr+TtQ1Bx4YzC0Pa2/GTEedzxkelIazWbdrA=
X-Received: by 2002:a05:6871:7293:b0:1e9:b0fa:de4c with SMTP id
 mm19-20020a056871729300b001e9b0fade4cmr718153oac.33.1699295749256; Mon, 06
 Nov 2023 10:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20231024181134.48066-1-bragathemanick0908@gmail.com>
In-Reply-To: <20231024181134.48066-1-bragathemanick0908@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Nov 2023 13:35:37 -0500
Message-ID: <CADnq5_OS+15+u-4w3Ca9Q+ivm8U1P=6r-pOrC9fCbZSAUR=5hA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: avoid variable reinitialization
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sunpeng.li@amd.com, Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org, Samson.Tam@amd.com,
 wenjing.liu@amd.com, alvin.lee2@amd.com, alexander.deucher@amd.com,
 jun.lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Oct 24, 2023 at 2:11=E2=80=AFPM Bragatheswaran Manickavel
<bragathemanick0908@gmail.com> wrote:
>
> The member variable enable_hpo_pg_support is already initialized
> and hence the reinitialization instruction can be removed. Issue
> identified using the doubleinit.cocci Coccinelle semantic patch script.
>
> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c b/driv=
ers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
> index 99d55b958977..1fd9df8da09c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
> @@ -739,7 +739,6 @@ static const struct dc_debug_options debug_defaults_d=
rv =3D {
>         .disable_boot_optimizations =3D false,
>         .disable_unbounded_requesting =3D false,
>         .disable_mem_low_power =3D false,
> -       .enable_hpo_pg_support =3D false,
>         //must match enable_single_display_2to1_odm_policy to support dyn=
amic ODM transitions
>         .enable_double_buffered_dsc_pg_support =3D true,
>         .enable_dp_dig_pixel_rate_div_policy =3D 1,
> --
> 2.34.1
>
