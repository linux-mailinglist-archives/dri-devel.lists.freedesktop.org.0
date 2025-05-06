Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F087AAC43E
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 14:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADE510E682;
	Tue,  6 May 2025 12:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fKNm2Zh4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A2110E681
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 12:33:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso48977775e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746534791; x=1747139591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=tINjIjjqhDEFfQ/0pvAG/DtTHkRARd9gjmCmeJxg65o=;
 b=fKNm2Zh4ofVPpkRzytvCnrSpRH79/mUwcGfj7tY3hjy7raJcK+f6ZGKlEnkersVOI7
 dcy3G1xKKL0d0i3kJU1FnkyMMCqkWmIXg/d4z1VX99ycwDZCu+SAdxgqMNenpBFwgQVY
 PKo+42HhpTwhUKT6QSYOW3E1omEVnjb/KWzw544MT/YDHCzqox33ZQ1pNoC38Pn8/WAt
 s4qK/vT1aaXU5clZRs3fsanLohxSg5IyhRRjhX3X3FG6gJH6KrjIOdR3zIcj2OdN0RTW
 XmjVuz+chI5lGSiKGF5fXyIPwZPSJMQydvqP/SxpL7deTK9GUUYRoZFNdbWJc1AYkpnz
 l0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746534791; x=1747139591;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tINjIjjqhDEFfQ/0pvAG/DtTHkRARd9gjmCmeJxg65o=;
 b=vLzHMITuhNNr4I7BOivofRH7V+iO1HjdcrQuqgLuexjT2NoQHhllBdLMTHEIq2BQg2
 3K/pY408Ad3hw6EQbE4E1ohI3gsrnYimex8M7X3Kd/VRCSFg+364NGcvyhwSmaheLv80
 bwbxawliC9jWs8VX24odCTWQEl7JvuEn8T7Rgh/0rhKZRvHfXTrviUGfaKzW5wDB/ukm
 MEkQuxjZ/fdD4oTdN/t//hOCdU0BoPtC2FT+Paj8uOc/n4CvXk7/AY8ncfJKhax4/inR
 zkTps/4dR0nBDCbfvNM54hjqcM2P6hTQyqq1V7nQiLZzV/iZnXvr3/d4nzKSWlHbr4Jh
 enfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMuq4V5KrcLl3JyrAfX5ZyeHbmb7IW1f3IDX6FB1eOe5QE7WWCCk5o3Hd/urIenWkhYNrtk1fFHIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypPwZncu5JhpoVI3ZOaMgyn1pYBPCTCdP9l/CYfgAK54a2bp/A
 J/pQm6V2+qJDkRBgTZrHmvHgFr+tlndZsc41+IhBDiMZls/n13y5nrbqIsowTO4=
X-Gm-Gg: ASbGnctQ8wOnPmT1TlZX4ybYLDhO/FFfiXIxiKg1fLQlu7+PbzzcuYqllmkOxPuZgYo
 Pfi7XPgUlblh+u0eP7PLqghL1xSm+ItSPXIOE0mosj7OYw7/mjehy/tspsDp0PjMnmfOTFH4urq
 Z1mZnUigtDVtYCiq63fF5i9MdDpiPmM0DBuktSIRmhnN1XTyZbVsOUiwFx1iOYd4N3V/TOckxYm
 gaZ59i5uu6Sli90UHm67iABp3j/TIOa21iklS9gvJDZRz+mH8bogArMdoDXA56C6SGZ16PSQ/b0
 nqEr7RHx1OLaobK3fIgVsFF3VPFsrcUm16AyNi+bMzVilBE6EPwP4IlOLGcAad952BIdjl6/uE5
 fturlNQjXqR6ew33ZHQ==
X-Google-Smtp-Source: AGHT+IFLUzofA3vDK/kszQJLZSyj4bajkP+IkCV5UVmoE3eaxq2yBD91w5LJoJ1Tfb0QNKkwp9cU/w==
X-Received: by 2002:a05:600c:46c9:b0:43d:160:cd9e with SMTP id
 5b1f17b1804b1-441c48cf5dcmr113339485e9.17.1746534791552; 
 Tue, 06 May 2025 05:33:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:127a:7a9e:6ba7:152f?
 ([2a01:e0a:3d9:2080:127a:7a9e:6ba7:152f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b8a31695sm169854865e9.40.2025.05.06.05.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 05:33:11 -0700 (PDT)
Message-ID: <27d2deda-3a18-41fc-a6d7-1c18cba2c1e8@linaro.org>
Date: Tue, 6 May 2025 14:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/panel: simple: Update timings for AUO G101EVN010
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Kevin Baker <kevinb@ventureresearch.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gonzalez <alex.gonzalez@digi.com>, Thierry Reding <treding@nvidia.com>,
 Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <dbd8e1bc-bc23-4240-b6b1-321ac6f5ed68@linaro.org>
 <20250505170256.1385113-1-kevinb@ventureresearch.com>
 <174653278110.2517250.15843200835087426912.b4-ty@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <174653278110.2517250.15843200835087426912.b4-ty@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/05/2025 13:59, Dmitry Baryshkov wrote:
> On Mon, 05 May 2025 12:02:56 -0500, Kevin Baker wrote:
>> Switch to panel timings based on datasheet for the AUO G101EVN01.0
>> LVDS panel. Default timings were tested on the panel.
>>
>> Previous mode-based timings resulted in horizontal display shift.
>>
>>
> 
> Applied to drm-misc-next, thanks!

Hmm, I applied to -fixes how it should be

> 
> [1/1] drm/panel: simple: Update timings for AUO G101EVN010
>        commit: d5d283d45c85e774b64100137f34e7d55bfbe45e
> 
> Best regards,

