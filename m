Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBbRKyldqGmZtgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:26:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF7F20435D
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D98010EA59;
	Wed,  4 Mar 2026 16:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OCqvpdDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD02810EA59
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:26:13 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso62467615e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772641572; x=1773246372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=IycgstOp8AUBvQFItrqTS+kIWrn5vpM6y/uf2FdllGI=;
 b=OCqvpdDy0sx3Cp8heHzHiODh1RDHU/c5inop7nnH7AQdXaTS7YuWgzhrtihPhBnuQD
 Z2xUHmlRQ32i644uV/cw60TMorTjkYpA7LOGCoT/YRT3ol7PJsVJmr06QmorRdJCjsUu
 5PPG/rIRIAnTuVCOEmMfI5rpcA1nfHcPP+nncT0CYo6HTKyBLoHGPfVAF1etwYuEebWT
 VFvjgU+k72tb2RNrYFWlMOij3g08IVLDehsFO/xwE3BhzNnUoWpbVZKrUZUm1VM+22qh
 nmb5syCyZvhrv+EMB+l2apkfzT1Cw4UFp0NaL8TQ0U1MPWoDQzAzTVEQMpXb7gLIMAJF
 LVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772641572; x=1773246372;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IycgstOp8AUBvQFItrqTS+kIWrn5vpM6y/uf2FdllGI=;
 b=nYePfsAccp8MbEuZMuOmR97M7o5ogB09lfpidORmN9hoZGELth6ykF7vDy/ck2MWVQ
 tAQYmauBRTjuVSkL5OuibQ7ly2wuBbeNzABFnxKHvEmcGFCEFoQIhpXZJoXcoj9LW/Ze
 bUoH4tH3xqEdAS3sWMLYOYmDMqSnoFJlZlAhn9o/hrRz/Do6wsFAZ2eNXgxeRu9sx0Ck
 dLidRa6RkiWeDN+Ip2snqBUbCQ3SJi7cVCqSeKWLt7Y11W0dmzoAkMDfD6l5RFZJBEk9
 jEpF1nf5V03SO8NgK0F9giqYKz6gE3zbF2r89Nmeyi9uqrvTfGG1PorWYoyNepcl85X+
 nisQ==
X-Gm-Message-State: AOJu0YypV10LftqLIPBvNfTReEzlH3mJbyQR9/0ur9lIyNOFg9nHkSmB
 Lwi2yHWkb9N0x6bkt4khTXE+O++z/BG4C6wmuhQO4kzzC2Le75jIEhpXNH1ATtQJ2yM=
X-Gm-Gg: ATEYQzwugEst6mKihYGU17rjnLPOIkcX8mm+uLaMCdXkXG+QTmVynQ6+QyXiZjenXr8
 0jpqFCxTmgh0n7wwX/aKMphbdhpKH/NpM2uteC0aHPuCQ1XY8LMkuR+ijqSK9/3t+fl2M8ydYVG
 yZ8Em1RKtLYWRveRuhYuEvwXRLPvdexPer73fbpHzZAXXGSPzCjoqokPNzH1eeM1J1cJu7Jcsp7
 cY9rIKw+/Y8voCVnq8/5hohuk3QOl+sSzIsj0Q1SPM/RpXuUOg+L872StOfNCN6v1XR29hpd9jS
 43WBoyyAHvbYFgAmyECthdhHicf/Pf17cjAQA9NEmI360A178Q2103ekMfI0wEuTKnGe1aqRx8l
 MmfubBqQdRPazBkzvf4meDeEVfIRu/Mo6l4J4lD8VVyCj9MnVHSbWvePRVbR5+z7bjbGQLg2Cvx
 oDbtt/xiVaOx4FhEtDT14eexdSYwUafa/sQGURurpE5j7/Z9gHhp4v65KGBR5FobQJpFfzGX4bm
 MmW
X-Received: by 2002:a05:600c:a4b:b0:480:1c10:5633 with SMTP id
 5b1f17b1804b1-48519896e83mr39034405e9.26.1772641572014; 
 Wed, 04 Mar 2026 08:26:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:da6:dde3:e477:94d2?
 ([2a01:e0a:106d:1080:da6:dde3:e477:94d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851884224fsm62369745e9.4.2026.03.04.08.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:26:11 -0800 (PST)
Message-ID: <bd2bb9c1-70e2-4914-afe2-c172501c25bc@linaro.org>
Date: Wed, 4 Mar 2026 17:26:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] drm/panel: himax-hx83102: Add support for Holitech
 HTF065H045
To: Val Packett <val@packett.cool>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
References: <20260217070121.190108-1-val@packett.cool>
 <20260217070121.190108-4-val@packett.cool>
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
In-Reply-To: <20260217070121.190108-4-val@packett.cool>
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
X-Rspamd-Queue-Id: 1AF7F20435D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[packett.cool,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:phone-devel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 2/17/26 08:00, Val Packett wrote:
> This 720x1600 panel is found in several Motorola/Lenovo smartphones like
> the Moto G9 Play (guamp). The initialization sequence is based on the
> datasheet. Add it to the existing HX83102 panel driver.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 86 +++++++++++++++++++++
>   1 file changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> index 1d3bb5dca559..34e0e956db48 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -701,6 +701,67 @@ static int starry_2082109qfh040022_50e_init(struct hx83102 *ctx)
>   	return dsi_ctx.accum_err;
>   }
>   
> +static int holitech_htf065h045_init(struct hx83102 *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	msleep(50);
> +
> +	hx83102_enable_extended_cmds(&dsi_ctx, true);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x22, 0x44, 0x27, 0x27, 0x32,
> +				     0x52, 0x57, 0x39, 0x08, 0x08, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x00, 0x06, 0x40, 0x00,
> +				     0x0e, 0xae, 0x38, 0x00, 0x00, 0x00, 0x00, 0xf4, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x01, 0x58, 0x01, 0x58, 0x01,
> +				     0x58, 0x03, 0x58, 0x03, 0xff, 0x01, 0x20, 0x00, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x10, 0x00, 0x17, 0x00, 0x63, 0x37, 0x0e, 0x0e, 0x00, 0x00,
> +				     0x32, 0x10, 0x08, 0x00, 0x08, 0x32, 0x16, 0x4e, 0x06, 0x4e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x04, 0x0c, 0xb2, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x24, 0x25, 0x18, 0x18, 0x19,
> +				     0x19, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +				     0x18, 0x18, 0x18, 0x06, 0x07, 0x04, 0x05, 0x18, 0x18, 0x18,
> +				     0x18, 0x02, 0x03, 0x00, 0x01, 0x20, 0x21, 0x18, 0x18, 0x18,
> +				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP2, 0x00, 0x09, 0x16, 0x1f, 0x28,
> +				     0x4b, 0x65, 0x6d, 0x74, 0x70, 0x89, 0x8d, 0x91, 0xa0, 0x9e,
> +				     0xa8, 0xb2, 0xc8, 0xc9, 0x65, 0x6d, 0x78, 0x7f, 0x00, 0x09,
> +				     0x16, 0x1f, 0x28, 0x4b, 0x65, 0x6d, 0x74, 0x70, 0x89, 0x8d,
> +				     0x91, 0xa0, 0x9e, 0xa8, 0xb2, 0xc8, 0xc9, 0x65, 0x6d, 0x78,
> +				     0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xff, 0x14, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xff, 0xff, 0xff, 0xff, 0xff,
> +				     0xf0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
> +				     0xa0, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0xaa, 0xaa, 0xaa,
> +				     0xaa, 0xaa, 0xa0, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x70, 0x23, 0xa8, 0x93, 0xb2,
> +				     0xc0, 0xc0, 0x01, 0x10, 0x00, 0x00, 0x00, 0x0d, 0x3d, 0x82,
> +				     0x77, 0x04, 0x01, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x00, 0x53, 0x00, 0x02, 0x59);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0x00, 0x04, 0x9e, 0xf6,
> +				     0x00, 0x5d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x42, 0x00, 0x33, 0x00, 0x33,
> +				     0x88, 0xb3, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x20, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x7f, 0x03, 0xf5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
>   static const struct drm_display_mode starry_mode = {
>   	.clock = 162680,
>   	.hdisplay = 1200,
> @@ -833,6 +894,28 @@ static const struct hx83102_panel_desc starry_2082109qfh040022_50e_desc = {
>   	.init = starry_2082109qfh040022_50e_init,
>   };
>   
> +static const struct drm_display_mode holitech_htf065h045_default_mode = {
> +	.clock = 90720,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 40,
> +	.hsync_end = 720 + 40 + 40,
> +	.htotal = 720 + 40 + 40 + 40,
> +	.vdisplay = 1600,
> +	.vsync_start = 1600 + 186,
> +	.vsync_end = 1600 + 186 + 2,
> +	.vtotal = 1600 + 186 + 2 + 12,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct hx83102_panel_desc holitech_htf065h045_desc = {
> +	.modes = &holitech_htf065h045_default_mode,
> +	.size = {
> +		.width_mm = 68,
> +		.height_mm = 151,
> +	},
> +	.init = holitech_htf065h045_init,
> +};
> +
>   static int hx83102_enable(struct drm_panel *panel)
>   {
>   	msleep(130);
> @@ -1069,6 +1152,9 @@ static const struct of_device_id hx83102_of_match[] = {
>   	{ .compatible = "starry,himax83102-j02",
>   	  .data = &starry_desc
>   	},
> +	{ .compatible = "holitech,htf065h045",
> +	  .data = &holitech_htf065h045_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, hx83102_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
