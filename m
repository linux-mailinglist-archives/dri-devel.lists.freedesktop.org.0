Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5539B0DA60
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3200B10E307;
	Tue, 22 Jul 2025 13:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OyDFQNyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E6310E691
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:01:12 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso5119741f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 06:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753189271; x=1753794071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=xebaum/5BKiumSnNJGDyurMqt6WaPewfW0ldlstT91w=;
 b=OyDFQNyHScyEBTZW59MO3zXtMIH9YoNxfU0NSul1r5/hMgm95R++bbsC1bPN/yqUIP
 OdpPo+VCYm9iu7Vd3rQ2BegjgXydzqxPCZ0MqCBkPc5a7PcIUGUIwi9AME7zeRWe5nlZ
 Cy2TaqjuADSkEILrAiVxBQMSAP01Xgi43w7xuY3JD2ZZlgnCO+fZkpkQfHeLu2OIccKN
 rSguCUf4+v0b+ubbQngEVP7ehR/0VjDKbdI9Cw+yizE7f6OR5pJeC4nOh3FFISM6U/gz
 oo0nuK15hyOL06AgKn1rSa7WHN4yaGUThfafDSmltrsZsW2Dbxx9xfNkckCKqVG7P2BB
 /qMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753189271; x=1753794071;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xebaum/5BKiumSnNJGDyurMqt6WaPewfW0ldlstT91w=;
 b=bb2w4EllUPNT3fowo6UInsTo9E5d8DCLvI/ABzdZ3gdzmtDhPvAvuDQ+csAxINN6wx
 n9HX4ONHT6u09kHxiimWNn1xepZEO4FYBy9vLDQjeUN9X7EsFRc1nz1lF5ewRSUHKeOM
 1XtY7HrDvMusQvbJ++bZrBdVpFPXF/JyHxHhHARkBbNeHxKQzPN0NLkU4Zc1b6mM28S8
 Py1eC19LMIrFl8pNH6MPIgLfAy8UfmZpig1RtxnZFcvPb9s9pc+m/YmiwVovKJdCv+mB
 yFOfXQwxm21wD3wVx+PO3IS90QCAUm55UV/+74U8vR4r1RTol6Tb5FOoFd1CbsghYPp4
 O9rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhlvC405xNo22Fs/stPUqsQMlkjCMoG3H+qW0Aqqi01wPPEpZRwNrJCTMeL2PayuG82hmCw0i7nxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOnrsgJ207uOlDf9dAsakShhlYuYcKD6jtCa3n/7Lx9dwjyJEz
 hZeCdGvA2VUMEHE5fXUzjJ3vY0E+SyPr2GBILAkGm2nJr++WKCT5IqtZDGl2nR5x06g=
X-Gm-Gg: ASbGncsJ5Gnxyc3xCpd9MyMPHQIeN9grpI72yvyw7F64qnyQilWbk9l8Q+GXxUKsdR2
 LvZ/ERnzrlflIwXfpBkAy8IwPrRjRJoNUnWqm9EaPzcMn+9WLpsTpPn05MrSbrgzhAUXUT0iSup
 v4Vj3UU4Iv1nmGsTCnzMp662Xdky2bw7dqFEIa1dgEnNLBvlNAJq45v7HBDCScMfAgfKjo8Fful
 v2WHgjOh77Tq30paSaYCsksCrp24+Hm9zSKj6oLHE3ekSgaxXD6fJtcyVU41pVGZtqdXK39zElK
 gyNfbqcQD8FGvQYTzjgJlb/4M8NefQLjxbI3K9PFSLgMnA07yFNnVax5u3MB7jKJgkcjkiiyocG
 YUbQVO0wqiE6N1sk8av0xiaK8ZXgqs/TO7J9VFnkP5t9dVP1C9XqIzsTwLfwwa63hEcGP9o89yf
 C/JT9DzvAjvg==
X-Google-Smtp-Source: AGHT+IGD6Ce2cKQNzAI2CflJsoQbN+wNC/y0wZhvJpelndK3mdzmr2kZcXpr/VTsPYXTVTSs4XZjQw==
X-Received: by 2002:a5d:6f19:0:b0:3a4:fa09:d13b with SMTP id
 ffacd0b85a97d-3b60e54aa5fmr17789875f8f.59.1753189270137; 
 Tue, 22 Jul 2025 06:01:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bce4:725d:6922:d1ba?
 ([2a01:e0a:3d9:2080:bce4:725d:6922:d1ba])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca2bf99sm13404605f8f.32.2025.07.22.06.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 06:01:09 -0700 (PDT)
Message-ID: <d431435b-4ac0-44aa-922d-0bde126ca563@linaro.org>
Date: Tue, 22 Jul 2025 15:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
To: Johan Hovold <johan@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <aCw9pYehCdfXXeiR@hovoldconsulting.com>
 <aG-QyF12rGY55gcG@hovoldconsulting.com>
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
In-Reply-To: <aG-QyF12rGY55gcG@hovoldconsulting.com>
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

On 10/07/2025 12:07, Johan Hovold wrote:
> Hi Chris (and Neil),
> 
> On Tue, May 20, 2025 at 10:30:29AM +0200, Johan Hovold wrote:
> 
>> On Wed, Apr 02, 2025 at 03:36:31PM +0100, Christopher Obbard wrote:
>>> The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
>>> panels. This patch series adds support for the OLED model which has a
>>> Samsung ATNA40YK20 panel.
>>>
>>> With this patch series the backlight of the OLED eDP panel does not
>>> illuminate since the brightness is incorrectly read from the eDP panel
>>> as (to be clear this is not a regression). This is fixed in [0].
>>>
>>> [0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/
>>
>> It would be good to get OLED support for the T14s merged. Are you
>> planning on sending another revision of this series?
> 
> No reply for over a month. Do you intend to respin these or should
> someone else take over?
> 
> Neil, do you have the OLED version now?

I'm not sure, how do I determine that ? Is there something specific in the type number ?

Neil

> 
>>> Christopher Obbard (3):
>>>        arm64: dts: qcom: x1e80100: add epd hpd pinctrl
>>>        arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
>>
>>>        arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
>>
>> Strictly speaking you could have posted this last patch on it's own as
>> it doesn't depend on adding the hpd pinctrl.
> 
> Johan

