Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA583261E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 10:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3DC10E962;
	Fri, 19 Jan 2024 09:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B78C10E147
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 19:28:48 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-78333ad3a17so1548785a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 11:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dionne-riel-com.20230601.gappssmtp.com; s=20230601; t=1705606068;
 x=1706210868; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
 :reply-to; bh=cl86MxNlP9JU8mn4QxWW8Z1SEI1toh78ROznChJ2Mp8=;
 b=2L919SUdLyuwZwFcAwWNdbphbYwW5GA21v605nUCUFhQBClvry7i6TdpXZ9i7WLalM
 KFMwRgrQ5VwDehXCsQDQT+X4Dn7SkDmWFe+1htCuLi8jh/1bfbYhZzLMB5DJaEf7k3mO
 7FxXsVuthj8h7tM4ZRGzDGwhnCY8u6CjpM4Zjf/96X8QA74TfBHhHxXh2sJ8d1EsgyFF
 ObVIo11bZfFazzdOy/hf9xS25rMnvNAoaMcIaEIjY3Kgy1wHkGtwPv3hbFSRZIr3sBc/
 1HkCYVcz9I/vTngR3YZpsInJjdUoumDMIXEFWizCZPv/nx3X4SNpjQrIz4AkiEMRB1xA
 7SmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705606068; x=1706210868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cl86MxNlP9JU8mn4QxWW8Z1SEI1toh78ROznChJ2Mp8=;
 b=GskE3AIYbmiCXBuK/FsnP9QxMc0n9ctDS/2j6SGxi0li8FR8qxhUKbmflLggj7toAu
 s6dnSnfuMN2M1Sxys+G+U9Sz+RnHX4ZsdjNtbe5KmV+dpr751LC1IOPG2Pctvn7eF6uy
 /J+9ixV4nzbtacJgLq25tvqyOtSUfjNiT/X2zeZ90Cfy0gJZRkLjMxMsyGH42KCQDP2t
 ImMG/L7JrZ06UIkl2+gPcvsSZEC8RI2WFLmeTmzVRh9pe/aWnv1IJoqyvBvoJ0c5rPXc
 TPlyuJYQqhlmICDHFKS5LRdnaiXbUZKW8oFMufu9KFazfFaScgD+uK8ufrEPZind34x5
 b6rQ==
X-Gm-Message-State: AOJu0YyKuqRJnmCjAvGacofQjyOAhQb9kbUovYqsQ6axfyacBiFQunav
 Rhm8/d4Ees9GDwlHgArSGDOrQgfl5uu4VlEE6ASwT1mQhsj2FynW8+H0l9mQdA==
X-Google-Smtp-Source: AGHT+IHSOe1LtWuDt9eb1xAJjqjUVCk+Ml5NMxnoOGGVWM65IW19VJdnN3QsYNsy62zdIQZtdfVgAw==
X-Received: by 2002:ae9:e105:0:b0:783:47e2:41ff with SMTP id
 g5-20020ae9e105000000b0078347e241ffmr144690qkm.43.1705606067572; 
 Thu, 18 Jan 2024 11:27:47 -0800 (PST)
Received: from frankgrimes (135-23-195-66.cpe.pppoe.ca. [135.23.195.66])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05620a10a700b007836647671fsm2631952qkk.89.2024.01.18.11.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 11:27:47 -0800 (PST)
Date: Thu, 18 Jan 2024 14:27:45 -0500
From: Samuel Dionne-Riel <samuel@dionne-riel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: panel-orientation-quirks: Add quirk for GPD Win
 Mini
Message-ID: <20240118142745.1b52585a.samuel@dionne-riel.com>
In-Reply-To: <20231222030149.3740815-2-samuel@dionne-riel.com>
References: <20231222030149.3740815-2-samuel@dionne-riel.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 19 Jan 2024 09:03:38 +0000
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

On Thu, 21 Dec 2023 22:01:50 -0500
Samuel Dionne-Riel <samuel@dionne-riel.com> wrote:

Hi,

Can I request a small share of your attention to review, and apply this patch?

Thank you all,

> Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
> ---
> 
> Changes since v1:
> 
>  - Add 1080p right-side up panel data
>  - Use the correct panel orientation
> 
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 3d92f66e550c3..aa93129c3397e 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -117,6 +117,12 @@ static const struct drm_dmi_panel_orientation_data lcd1080x1920_leftside_up = {
>  	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
>  };
>  
> +static const struct drm_dmi_panel_orientation_data lcd1080x1920_rightside_up = {
> +	.width = 1080,
> +	.height = 1920,
> +	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
> +};
> +
>  static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
>  	.width = 1200,
>  	.height = 1920,
> @@ -279,6 +285,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1618-03")
>  		},
>  		.driver_data = (void *)&lcd720x1280_rightside_up,
> +	}, {	/* GPD Win Mini */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1617-01")
> +		},
> +		.driver_data = (void *)&lcd1080x1920_rightside_up,
>  	}, {	/* I.T.Works TW891 */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),

