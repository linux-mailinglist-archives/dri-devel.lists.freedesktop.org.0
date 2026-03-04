Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPJGEDNfqGmZtgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:34:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C072045DD
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DEC10EA54;
	Wed,  4 Mar 2026 16:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qh6EiRFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFB110EA54
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:34:55 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48378136adcso42205905e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772642094; x=1773246894; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=w5TxOSXNVjcAs46qQW0+vaF3ONKIhZ2ZaRuNPH28ksc=;
 b=qh6EiRFysUheEicp6NS/cxMgmXmlDKkPSEbUlA+p4RQrRfMfHPGFdrEmgNH9SSKKRi
 gdyKdoBtmpAXhc72Kk9WkGlVxe/LpEfpyEuETUC/o0mjEDsXDvhtvLu6OwT32bIwX6Tr
 J25yQJC81xEO8+RgcGGXuDf97tnDYFpUPoaCBO0UpKhgiYyZ+07xM5BhEiTIKC9dha5Q
 PtZ6/5PbgHD0/H2MqUPalt1FxZf6VSyDPWSDKZcjXSrd+x0/sJNP/nmBuU1PoDQYNgG4
 5xMIhkPQnLC8Gzr1mSRXEOjgpdx8BPvNqI/DThfiJNqz+nQ52dMQosLCgxxDP06nHWLg
 QQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772642094; x=1773246894;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w5TxOSXNVjcAs46qQW0+vaF3ONKIhZ2ZaRuNPH28ksc=;
 b=P67tZ7KEB7u8tRSltT6G+RTQab5oDRkuZzZt11OcpK92aR3/pz0+qu9t4ercOC1IHn
 6wPSFnmhe3iXKRbNPuw8fJFum5sHhGYd3u9HLygtkGBLZL2bNKlm6y5ajBZEPgN+6Cra
 q8yaQDQ1+vZHlA72vgVS9hswUU2O3FzKKDgpD3SeeXaqsOmF+UrD1tfn9+oeGd2MhTWf
 iGWKt+VPonAhhk2kDKrVaMjHf/jw+fkwqsgaIdFxZId2j5dTry4OIUJTbe4rV2VkSoYJ
 UVy9sQ99/M8q3Ph7rUM98UWzVCv1DqMWZGgKH+1iCn4IuHdF6DWDhLPDBvmmdXiFbgcx
 Z8wg==
X-Gm-Message-State: AOJu0YzZ1WvrMtpxnY41giCrjHkRwgO7F/9ET8QnqMHnzmRpYU3MzTx+
 wu/IF72H6jc0k6GGN8uWe3Prw6GgKPE1PycBHbVg/AuuZjlbK3kKr6l9Pejho6jTBTk=
X-Gm-Gg: ATEYQzyhRLXeEq2X3v5Ac83o+clYpJrlrp+z6WNUVlmCJtE8JeQfmPZErM+d2MQedGh
 hiyeuX/Hwi96H6xkVGbUcqCSgEpbgjsI3raXDew8Dr0CtffTbmlraP0Z72ZfBOSpohwpmHMePg/
 pMb+PsMDpt1syv2agLaTfnajquxmIPP7Zjmc44bdDoDGBJXWq9kITv21wT4Ie5kz41tYhPZOPRj
 IId2oETvsyFe/2NT6SOQ+GYQ8bRTJ3uQKznsAXtTgVFLMrei9Zzy3w4JnDq8FdRpPGZarrN5n+R
 ZMlY6u/+l+wY5GeKO4WadX4I/Wor8/AKsJOIcR+Ah/nnl8g8kkMz0Uxhyo/7rYLBDQaoVLYp/iy
 C4Lx1Cum2yoKWHxrRCFpA810YQqCl/2iqw+/fc1z0WobfV3FRNEq5CbfMyX8Fb782TiaZnrZ0BO
 nw/wC/rW7ZaHxTp8ZyC6W7j9NY7glDAjOVzj3gISD4yDztA67QrQlODWqDc43N4D1WnXs/lH2Ov
 CEA
X-Received: by 2002:a05:600c:8b0d:b0:459:db7b:988e with SMTP id
 5b1f17b1804b1-4851984d944mr51667315e9.13.1772642094169; 
 Wed, 04 Mar 2026 08:34:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:da6:dde3:e477:94d2?
 ([2a01:e0a:106d:1080:da6:dde3:e477:94d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187ced3bsm58232815e9.8.2026.03.04.08.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:34:53 -0800 (PST)
Message-ID: <8e88addc-c3a8-4f06-936e-eea059a33b8d@linaro.org>
Date: Wed, 4 Mar 2026 17:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 3/3] drm/panel: panel-jadard-jd9365da-h3: support for
 taiguan-xti05101-01a MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 mani@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io,
 kever.yang@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org
References: <20260214085409.3489057-1-yelangyan@huaqin.corp-partner.google.com>
 <20260214085409.3489057-4-yelangyan@huaqin.corp-partner.google.com>
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
In-Reply-To: <20260214085409.3489057-4-yelangyan@huaqin.corp-partner.google.com>
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
X-Rspamd-Queue-Id: A2C072045DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:yelangyan@huaqin.corp-partner.google.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 2/14/26 09:54, Langyan Ye wrote:
> The taiguan-xti05101-01a is a 10.1" TFT panel. The MIPI controller on this
> panel is the same as the other panels here, so add this panel to this
> driver.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>   .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 244 ++++++++++++++++++
>   1 file changed, 244 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 5386a06fcd08..c33c611e03c0 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -1366,6 +1366,246 @@ static const struct jadard_panel_desc anbernic_rgds_display_desc = {
>   		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
>   };
>   
> +static int taiguan_xti05101_01a_init_cmds(struct jadard *jadard)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x00);
> +	jadard_enable_standard_cmds(&dsi_ctx);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xd7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xd7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x19);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x12);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x6a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x2e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x1a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x15);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x58);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x39);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x35);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x27);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x2b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x16);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x2e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x2f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x4d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x3c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x36);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x58);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x39);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x35);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x27);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x16);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x2e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x2f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x4d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x3c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x36);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x02);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x52);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x4e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x4c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x4a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x53);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x51);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x4f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x4d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x0d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x12);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x0e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x6c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x6c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x75);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0xb4);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x6c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x6c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xbb);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2a);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x61);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x58);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x00);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +	return dsi_ctx.accum_err;
> +};
> +
> +static const struct jadard_panel_desc taiguan_xti05101_01a_desc = {
> +	.mode = {
> +		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
> +
> +		.hdisplay	= 800,
> +		.hsync_start	= 800 + 24,
> +		.hsync_end	= 800 + 24 + 24,
> +		.htotal		= 800 + 24 + 24 + 24,
> +
> +		.vdisplay	= 1280,
> +		.vsync_start	= 1280 + 30,
> +		.vsync_end	= 1280 + 30 + 4,
> +		.vtotal		= 1280 + 30 + 4 + 8,
> +
> +		.width_mm	= 135,
> +		.height_mm	= 216,
> +		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init = taiguan_xti05101_01a_init_cmds,
> +	.lp11_before_reset = true,
> +	.reset_before_power_off_vcioo = true,
> +	.vcioo_to_lp11_delay_ms = 5,
> +	.lp11_to_reset_delay_ms = 10,
> +	.backlight_off_to_display_off_delay_ms = 3,
> +	.display_off_to_enter_sleep_delay_ms = 50,
> +	.enter_sleep_to_reset_down_delay_ms = 100,
> +};
> +
>   static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   {
>   	struct device *dev = &dsi->dev;
> @@ -1463,6 +1703,10 @@ static const struct of_device_id jadard_of_match[] = {
>   		.compatible = "radxa,display-8hd-ad002",
>   		.data = &radxa_display_8hd_ad002_desc
>   	},
> +	{
> +		.compatible = "taiguanck,xti05101-01a",
> +		.data = &taiguan_xti05101_01a_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, jadard_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
