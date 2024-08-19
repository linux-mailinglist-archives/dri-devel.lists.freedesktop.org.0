Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E67956F1F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E102010E2E5;
	Mon, 19 Aug 2024 15:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s7Em22v5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD8810E2E5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:44:49 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-428243f928fso49491535e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724082287; x=1724687087; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=F/Xv3nsXv1q5PkoN52h1MNaEjHJHTbvi1agF5Quui2E=;
 b=s7Em22v5i8XV37oN5HL3duRBWGGswv3SaFbMrWC+rhyj+qpxWjC0mUEbdTGnDWHbnI
 4EVkdyqQv5+Dzyl8bj7UuI5lyr7tUsC/zoYdVucgiPbc5S9TDUMUFhfc1qYnjU66lhDi
 u8rPgCP6sANpo5btSKh1wEnItb3iMIp2xVYbsZCS0IbZslOrKsjCQWpZ2Y5UB9poCsQb
 qTaAG3/hfuPg7IL8xYy5cCkCuDPls2Tt1saj4YmvIJH8uRbuqu+aQVBNc3TkJ7pSEEcz
 Gsc3bjQhHKWg0VEQZT1xRmwwgVeLNtgHMhTY4H3Jplg3qymI3N8oJxbkmGyXTWrignMW
 ZBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724082287; x=1724687087;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=F/Xv3nsXv1q5PkoN52h1MNaEjHJHTbvi1agF5Quui2E=;
 b=GTNf/V94hlUl3B/Dm0O2XMNyofFmcYrxrQk4SqdPJpNNNHirrh3lxAPqob71SaskEc
 +pPZGFwahlPL0446CgHxfWuFcjEjPlCAu2SYFZSHuuyjKhOM1rUCjedcd/dmJboFD3iK
 AZ71k+MbPNr1O3OGrRN4x/RLAvlPw6rYfIUpZ8/LWzkoV6jmzlgEBRNoZnUGgQh1kzIo
 VhHO95r5xhUB1Eo+1BHN3Qz5w3qHyLmx8PNYVDTDNCCrvwYJe4/sAMnhgnQnGsjTF2TE
 t3CIc77o2xrgSUXOPTpxD+eLVuotupOFXupnPApo8Vhh2Fqd0y4WHQQiN4UhAt66wz4b
 By3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1FlFy4x5S9FVRrSMJQt7wkr2L/mfKJnWFQYlV6t4cXKqK6JJBJq2q2blHIFlebAHLEZrZMn7MhpjT8GHz7uv47XBEzmy9Mh//cc11h1by
X-Gm-Message-State: AOJu0YzuE7txIFlFW+mAGA2sTwVSTrLwgQFRids//Qn94Py8NK0iPknG
 xFzIvIGMV859PDkOUvliVmbov4dSiv7Cc4tI7ZZwOHJC3Aj2hhNuDFbXc/JaQcQ=
X-Google-Smtp-Source: AGHT+IFtqV44TIzMSE3Q3kv+DMpp1U5YgbWjzJtplQ+IL3GZrmMRvPaNOyZaUH4FhSsLRESzsHarrw==
X-Received: by 2002:a05:600c:4f12:b0:426:545b:ec00 with SMTP id
 5b1f17b1804b1-429ed7b7860mr91644775e9.19.1724082286959; 
 Mon, 19 Aug 2024 08:44:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727?
 ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718983a184sm10810121f8f.14.2024.08.19.08.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 08:44:46 -0700 (PDT)
Message-ID: <0df40f72-f1d5-4049-a6e5-04d973c7a0c7@linaro.org>
Date: Mon, 19 Aug 2024 17:44:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/2] drm/panel: jd9365da: Move "exit sleep mode" and
 "set display on" cmds
To: Doug Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 hsinyi@google.com, airlied@gmail.com, daniel@ffwll.ch, jagan@edgeble.ai,
 dmitry.baryshkov@linaro.org, jani.nikula@linux.intel.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240807100429.13260-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240807100429.13260-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <1518bded-72d8-4ed0-a63f-3dd21473b23b@quicinc.com>
 <CAD=FV=UfE99Q1aQfPk61WzqK+kbMd-htWstjWUqgCvK1fqfWPw@mail.gmail.com>
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
In-Reply-To: <CAD=FV=UfE99Q1aQfPk61WzqK+kbMd-htWstjWUqgCvK1fqfWPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/08/2024 17:45, Doug Anderson wrote:
> Jessica,
> 
> On Thu, Aug 8, 2024 at 3:56 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>
>>
>> On 8/7/2024 3:04 AM, Zhaoxiong Lv wrote:
>>> Move the "exit sleep mode" and "set display on" command from
>>> enable() to init() function.
>>>
>>> As mentioned in the patch:
>>> https://lore.kernel.org/all/20240624141926.5250-2-lvzhaoxiong@huaqin.corp-partner.google.com/
>>>
>>> The Mediatek Soc DSI host has different modes in prepare() and
>>> enable() functions, prepare() is in LP mode and enable() is in
>>> HS mode. Since the "exit sleep mode" and "set display on"
>>> command must also be sent in LP mode, so we also move "exit
>>> sleep mode" and "set display on" command to the init() function.
>>>
>>> We have no other actions in the enable() function after moves
>>> "exit sleep mode" and "set display on", and we checked the call
>>> of the enable() function during the "startup" process. It seems
>>> that only one judgment was made in drm_panel_enabel(). If the
>>> panel does not define enable(), the judgment will skip the
>>> enable() and continue execution. This does not seem to have
>>> any other effect, and we found that some drivers also seem
>>> to have no enable() function added, for example:
>>> panel-asus-z00t-tm5p5-n35596 / panel-boe-himax8279d...
>>> In addition, we briefly tested the kingdisplay_kd101ne3 panel and
>>> melfas_lmfbx101117480 panel, and it seems that there is no garbage
>>> on the panel, so we delete enable() function.
>>>
>>> After moving the "exit sleep mode" and "set display on" command
>>> to the init() function, we no longer need additional delay
>>> judgment, so we delete variables "exit_sleep_to_display_on_delay_ms"
>>> and "display_on_delay_ms".
>>>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
>>
>> Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Does this Ack mean you're confident enough about this patch that we
> should go ahead and merge it, or do you think we should wait on
> anything else (like Neil getting a chance to look at it)? As I
> mentioned in my reply to the cover letter [1] the patches look OK to
> me but I still don't consider myself to have a wonderful understanding
> of the intricacies of MIPI DSI. If you think this is OK from a MIPI
> DSI point of view then we can land it...

I don't have an advanced MIPI DSI knowledge, but they simple remove unneeded
sleeps between dcs commands, so if they are confident they can be removed I agree...

Neil

> 
> [1] https://lore.kernel.org/r/CAD=FV=WCw6pAump-PUFCW0cgbRY+5_2tPNLe=hN3-dnXD=B6MA@mail.gmail.com
> 
> Thanks!
> 
> -Doug

