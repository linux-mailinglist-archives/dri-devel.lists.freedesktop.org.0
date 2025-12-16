Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F54ECC689A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 09:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095B310E361;
	Wed, 17 Dec 2025 08:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lxbdZSZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA2F10E7F8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 14:31:58 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so30217805e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 06:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765895516; x=1766500316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vrvW6xI1XkjYJ7Zx47OyO1gNTKJ3KALebK0l5/GjGy0=;
 b=lxbdZSZ3GQNsi2tFSAOl+JirX90JHzsvUYxBy3gJus7o5W8Z2WdSaak1cj9IlB09TU
 iwXa1ZAYMz692yBD7u4fciJHvQdMT7i8gmU5Y/2Gq00ijN/bV6Xyq8OktdNZC1Vm58Yw
 OJGMzA+XdHidfaqT1Coh6hdFQbYj6Yy6B21ws4YhU6lx35GAmP8xI4kquI++nlzO+CGf
 VNxrB3TijjHLCShTtaJJPq9F8na5vDaEyEuP40yhNicwbx5qJ5fGjpuiBq+WweD+hJXd
 RxXOHOGehJL8Jkg6IQSfh/x9qj6ZjHZm/0ipVqQQksq10WuW4dMfAgVCpzeKgwInEm9X
 OcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765895516; x=1766500316;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vrvW6xI1XkjYJ7Zx47OyO1gNTKJ3KALebK0l5/GjGy0=;
 b=OV9SMcyfJGlJ5APIlSH3Z50lkDnBnNjHdqQDknkw+ZZ/orvfWkiWQVOTu9zMWTKOrY
 kUIk2Q4uG2umoaVBVq5TjCmhPAdEhgC7Bo8kOnwQ8YVc5H2F5CxnEp5hZhGptfXphW9S
 adumhViqcN9smOfoUaXefsnYEMj2E8M3+fFRx4hhlbBIH1/DdqymidlhitwB/8SJbz5n
 5oQ/68khshV9rU3kS03RITmupIqdcK96LvWGz4BfczwynKcjkmKKLEaEdx4nC/aPXPHh
 8tZYuqqruILq31vW8FrHS7w7JmuMTm9pCYweztoeSWtlBcVjHvLtY768ak0OFDDQ/rRA
 89fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs0ygH2Pk/LAvOzBbWBoZ5V47T1fomWeQY0T8MCmo5ePrvJY6ST2rQLO84G8LYSlaQstMA6BNeZZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzejHMKJP3Gx/Z5bPdchjlbwS6wyf/ZhFwVtUMazfAtP7ytwN9v
 AaRSxk+FZvtkIUdDgUsVkEQqJZhCN1oS/sm4BNkd305yYydtcs0h0F7I
X-Gm-Gg: AY/fxX6n1zQ5WuNeNwiLSlWESVMQBgOv0Ulb26ulj9Tj1myLsd6zG7bxxHW6kIy1FN8
 hFNG6uLVh5AVVi8kiJZN4aFjr3CyHMi/WjTTYxTkzmeFVDFf9rUCIUJuuFD/GuHLazWGN+au74W
 llNM2g3XwKSkZxXUApbMrarV+UQW6ZbDrGOVo69wthq1bFy0AG0Md5IsdGQwcUmhjs6KFTe6bC8
 vjQvgOXEu46LXceEOlIDF4t0pNxR8yB/BnJI5lB5dPXO7a+ZWtSnqUI5+V8a9PCEHye1elvUDmU
 RC2VtLSZKagmZuFy7XZTlAWYbzAMdEFx+yhu1X91fD5pJTwVpopacMM+wt3Xw5Nsq9URfLxlczO
 1+unNJW6FDDh+E+U6RN+BJYDiTYJESBuQbT95IPnkfxgb2Chi8gbWcNPnTP418prlFarRjef8+T
 eyhEnVSTGu90rox41dwNdTjDiI3niG12R6dCqZhUP0GkcRk2JCnUJosNL4rYj0MsEOtVNPocQie
 h1hO3Xm6WtsGnXwGYU=
X-Google-Smtp-Source: AGHT+IGzep9ECZOwaPNpiBb0/p/BCg7/qLnqLf0vDlNHlWftA8GOgxq/kseyAt169pupxPA5dddF1A==
X-Received: by 2002:a05:600c:35d4:b0:477:7b16:5fa6 with SMTP id
 5b1f17b1804b1-47a8f89c85dmr179474045e9.3.1765895516300; 
 Tue, 16 Dec 2025 06:31:56 -0800 (PST)
Received: from [192.168.1.3] (92.40.200.39.threembb.co.uk. [92.40.200.39])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4ef38bsm259154525e9.0.2025.12.16.06.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 06:31:55 -0800 (PST)
Message-ID: <2c1656ff-cba9-4122-a414-d22958f5857b@gmail.com>
Date: Tue, 16 Dec 2025 14:31:52 +0000
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] drm/msm/dp: Enable support for eDP v1.4+ link rates table
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Steev Klimaszewski <threeway@gmail.com>
References: <20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com>
 <s43zm7ljm5cipjgkjllvplk6jcxrjo445rboirikivtr3n2alh@fvu66mkwkb5q>
Content-Language: en-US
From: Dale Whinham <daleyo@gmail.com>
In-Reply-To: <s43zm7ljm5cipjgkjllvplk6jcxrjo445rboirikivtr3n2alh@fvu66mkwkb5q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 17 Dec 2025 08:23:16 +0000
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

On 15/12/2025 22:15, Dmitry Baryshkov wrote:
> I'd suggest following i915 and writing DP_LANE_COUNT_SET before
> DP_LINK_BW_SET.

Thank you - made this change for v2.

>> +	/* For eDP v1.4+, parse the SUPPORTED_LINK_RATES table */
>> +	if (link_info->revision >= DP_DPCD_REV_14) {
> 
> No, eDP has separate versioning register. DP revision != eDP revision.

You're absolutely right, this was a mistake.
Does something like this seem reasonable for v2?

	if (msm_dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
		u8 edp_rev;

		rc = drm_dp_dpcd_read_byte(panel->aux, DP_EDP_DPCD_REV, &edp_rev);
		if (rc)
			return rc;

		if (edp_rev >= DP_EDP_14) {
			// parse the rates
			// ...
		}
	}
-- 
Best regards,
Dale

