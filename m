Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAB2A4B82E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 08:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9319489FF7;
	Mon,  3 Mar 2025 07:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xl+o/m8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B0A89FF7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 07:14:12 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5e4c0c12bccso7240304a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 23:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740986050; x=1741590850; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8RROaO6yARYWUmuYiLttBRg0vezrYJsF0zsoMASJ+Y0=;
 b=xl+o/m8WCJAyEuY0WHQm4wXgcuYwlObsf2Nh+yFplSyPMvswnCYtjtL/hrbhy5UMDd
 Rghg0kG7oZT8aEFO3jUcUUE9H0nqkf95ihLreXKvJpj8zngHEyVylSOo/h8r5vPPXNzf
 /PryuFGxxLv9RQam5zkuZ1Cl1k0C1iDnxmA3h30AVxYfr+Zu0nX58kUtkOSKca5BWpq+
 Ju3W6qts6rS5BO+KAJYXfKXqjJpxmr3AMLBxeuz7buBf/TVmfk9Z9TesUQdnPbQ3Ut1z
 zbO/LDAgZ8rzL8Ab5k+E5LA8bTRmvDHg6/mL2+mdw4awxBwdqe97k5edgluiz74bjMwS
 D86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740986050; x=1741590850;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8RROaO6yARYWUmuYiLttBRg0vezrYJsF0zsoMASJ+Y0=;
 b=CndF7YTB5Mkc9rDoG7sQBvNB1odvdIkkKvxAU+GS5H1LF9PS5ZprAjwkatMW61wYSg
 /78eYp/n4tMM5kwT+jAbAtjhETZowNl5ydgGvHtznBcdn64H7H7BVYGfh0MnuZfMjvmB
 oJ9b1IDMpqNo66oEeynm57o7Ye4at12141bJaHWRETDWYlsRGgmLF72WevyXdCRedm6A
 IJIx7Mv49/3Bduyb12Y0NLzJrVk8Ep9RILRZsdKOCkuDbvDncKmTDGiQvazqBI81zqYc
 AHM2cDVXQLS4Ve+HwmnWVEF730cMP0O24LLimMvfP0DY4fgckSXrG6bD3kT1Y+LF9fut
 0O0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGcgLFtzEYnolRFM0wNBbJLFAuezqrkXMB2VfF1auvoj3h9hhoN4zDXcaoJI1X+HpiDjkJHjHv+Jw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqtS3OIKKaEM+HyRrNteSfk3iCvBeFBHhVwIn0ide6J3ts5X7p
 KkoxJGolf9kPhoGUQu2f0GouVuzUzm6zhwAY4JvG2vqPpCAf2DcRGfPcpwpUn+E=
X-Gm-Gg: ASbGnctjd8wa8xcuXOPbNvwZ9D87+Oc7IviySlPGP4wmNCBDz48cPCQ09Iy/8ejCwQf
 CH0o0+XnWdDZsafjJYt0YuY3h3pM2XcAjO5GFeQTjDii6osIwwrVDORBgiKF9I9S0mGQLc6CiD3
 cbvVzs52HrPvnlIWaMZplZO0FQCOArO74fplNlFIxP8NUZFRn47dwV2Mpc8sDVO58oat1dBj+fN
 /biHHvmiSUuQzY9p3mRHpAvjnVWTNELNMyKOUW4Mv9Ngn8zABCLZTLH8GPSXSdV9OP/VER6p4t/
 WBq6z8mRYmvvwS2OpC5QrUqZTWSGXRj8oxFTHVP/iaGiBgCXLQ==
X-Google-Smtp-Source: AGHT+IEny668UimPZ3R6dx4axvviTs297S1IJ5VK/kkx2SxfpDGI4c5Rl/7By42IdqNYV74cMm4sFA==
X-Received: by 2002:a17:907:980e:b0:ab7:b250:aaa with SMTP id
 a640c23a62f3a-abf2682f996mr1554838466b.54.1740986050266; 
 Sun, 02 Mar 2025 23:14:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac1dd6fd870sm60633966b.70.2025.03.02.23.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 23:14:09 -0800 (PST)
Date: Mon, 3 Mar 2025 10:14:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Delete a variable initialisation
 before a null pointer check in two functions
Message-ID: <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
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

On Mon, Mar 03, 2025 at 01:01:40AM +0200, Dmitry Baryshkov wrote:
> On Sun, Mar 02, 2025 at 09:56:00PM +0100, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 11 Apr 2023 18:24:24 +0200
> > 
> > The address of a data structure member was determined before
> > a corresponding null pointer check in the implementation of
> > the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> > 
> > Thus avoid the risk for undefined behaviour by removing extra
> > initialisations for the variable “c” (also because it was already
> > reassigned with the same value behind this pointer check).

There is no undefined behavior here.

> > 
> > This issue was detected by using the Coccinelle software.
> 
> Please don't send resends and/or new iterations in response to your
> previous patchsets. Otherwise they have a pretty high chance to be
> ignored by the maintainers. Use a fresh git-send-email command to send
> new patchset.
> 
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

Remove the Fixes tag.  This patch is fine as a clean up.

> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

regards,
dan carpenter

