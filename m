Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE68BD94FD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009D610E5D7;
	Tue, 14 Oct 2025 12:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kX2yJMRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20F610E5D7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:22:28 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-639102bba31so1959991a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760444547; x=1761049347; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ad+Act/vyc65p5SZBMOE8fQZgfdis66PnpmCEaRCJyk=;
 b=kX2yJMRxzi2LXs8JkSdD5TraTjEYVWKKCFmW0nNqJGIURzwaTJXxcAnfbeyRL6nodx
 RlxRVX77Cg+NyW8sdgShEftvHsxAZo831zyx2qNaCkK1LoMqrJ9QAqCRBlAEwnSlsugC
 YqEXVEtiY7yR36J6PWWtj8lyWLACatDGGynXxGpdLrd6i8e/Ua1X/PeDQTwwSAlWiYi1
 zD5fKCz1UnGy8dDBmoBWgt7ZjFzjuVKoP2iqxUf/kIAoZI4kutrOxPqUSAT3BjPgClqF
 RmxHBYc4OnHH50+g9VknPZ97uTCj5c0FzZccNP79U4Dos9pbPX0KkOYmJDxVdZOd5yIy
 hzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760444547; x=1761049347;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ad+Act/vyc65p5SZBMOE8fQZgfdis66PnpmCEaRCJyk=;
 b=sTO53EJLy9uVrTCc5Xs5TizZIvAtoGeOfWpMWEgQDH2LqLGVD23jV96qJ3axlOzrV5
 TukkeYkUDKunKEoA1WpW7izucAcaWezl8cC57wAynkLOrmB9JHLxR4+2XnXMyCjsDmB0
 PGeIxDGvyFVjMrkyYIuwKIHxZGFQecxEYN19E4xNBhLcDFMY9HukHyQk858kwrDvclTS
 p0SIwt3J2W7bh6oA8FkEjrqD32SsWoVAldHJH5yi2RK/v7W8f2FrUS4eCDFvyX35+AzY
 pFqEV0E2ONod35181ojVr09Y3/hK2PlH27isaBvC1aw+z1sOFuq/Gko2hbYHE+11u6i6
 II7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9Ez/RHlT+z0zkzpp8boA8ygdPlDfWG39q0qYbDSncgvj+eKSxLwSjJgRwtbyyjNLOqYvra0holwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCQtjH19wdjZ5KH1jSkOTrOkqL80z6oLQ9lUIPWuygv0WxYwyp
 mo7MU8Zy8+MqnvpdqZQqYRTI/k9+j8PBwVdW2oEtTUUgeJ/NDr/zq9gq
X-Gm-Gg: ASbGncspBEp8urNb9QO5r5WCAYjQzM1EPDsPDMBrcyYzuppYyBpVKXwb3Vl9wZV0kO5
 Ti5CTKZK8rZTqO0yxR/8KWmGtk5lL0wOrFT2xxQbUqq6yq0Y4BgQgG9L9c+FBJPd2UlPA7Kqyui
 TWuyHpaveQ//TeOTK1HaxNH3NCB+3h74NymPJ/iZIFGBc+g5CC5QvpXLR+u/Crj2Y1gNtma5K/J
 0g9lwMk7iJdXmzf4nNFPT0H5G7Wuw144efshPqOxdOadq5NV5eFgIFEFUWmcLp3KyFVPxez6V5l
 WIvT9W0eY1YX3FJqFhtSonbghkg4Wk8oWogKEFWTqsBn5kzO1xjeMdMYWHZPKhiU8rWhIY1dTuj
 040uJj5KUmrizZJvv0bngq18OjU1/nt52OiylTZI7WEQo4TIPqE2FS6Wh+e4q49q3mB3RjYlNOI
 nIxjFkjj2waZelqHdrFr+V0QmdzX5Qsosb16cua0crQlACeJN6mHs=
X-Google-Smtp-Source: AGHT+IEj2JtS1ykV7+4SnCPxXcV5s4F2p8zZ4Ybts8U4kG/OqGnxgxiwp/Y8Fv2A2MsHbr+lECLEwQ==
X-Received: by 2002:a05:6402:d0e:b0:634:5381:530b with SMTP id
 4fb4d7f45d1cf-639d5b8956cmr22376195a12.13.1760444547186; 
 Tue, 14 Oct 2025 05:22:27 -0700 (PDT)
Received: from ernest.hoecke-nb
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a52b0f358sm10963835a12.10.2025.10.14.05.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 05:22:26 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:22:25 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, regressions@lists.linux.dev
Subject: Re: [REGRESSION] drm/panel/panel-simple v6.17 WARNING regression
Message-ID: <tguubjlh7ta7rvaq5pzzksamnc2kxy6yunsk3jeiiqz55on4yo@outv5vc3b2vl>
References: <hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh>
 <DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com>
 <kcunz2b2usmvadgrnnu65op5oi5ttblrc463twgxp5gqhnufav@eze53y23avel>
 <DDI0OEMAGBI3.2WFIP0O7M73LB@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDI0OEMAGBI3.2WFIP0O7M73LB@bootlin.com>
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

On Tue, Oct 14, 2025 at 01:43:21PM +0200, Luca Ceresoli wrote:
> Alright. Let me know whether the series I've sent fixes 0, 1 or both
> warnings.

Hi Luca,

Just replying to have the info in this thread as well, the series fixed
all warnings I saw, thanks!

Kind regards,
Ernest
