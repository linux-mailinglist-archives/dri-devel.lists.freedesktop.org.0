Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OiDGBe4emkr9gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 02:29:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C92AAC4D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 02:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAFF10E2FB;
	Thu, 29 Jan 2026 01:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="neCo575Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BE910E2FB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 01:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769650194;
 bh=h0ecRNsfJ1Ube1J+JZXHXMdInIH2cgiRidIImkm0O+k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=neCo575Z4Za2yqJAuvx89d1Q/6/2VLrejV3axS35SX0sKtOAqMqdtBPPXzeEmgLIu
 4CuXicCb/i5U7tRW3TxuhZvT6uTqJ/LlIFw5TylHXLAnNjj2OwHw+Old4hE3bXcvUt
 bKewde9m2KWTnFeWqVrI0b1OJdnMkllmby7/7s8YYXe+4+6hUJ8/2nskFYGY28uF8w
 F+ITG/7Cn6tql80E6DtFE+2bZ/h5N6sjJConXoAjjiJtS882mwFAWU+MGtVWQPwXCz
 Z6C3JUa4CSS5V8mE8Tff3WXtHdGHYuPh3qQpLVi0p/4+E59BZAG5HKBgSeVvg2346h
 lxbAKgCygUjtw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 274FB17E0699;
 Thu, 29 Jan 2026 02:29:54 +0100 (CET)
Message-ID: <64633be5-4be9-469c-9164-c1d584ea4c7b@collabora.com>
Date: Thu, 29 Jan 2026 03:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/rockchip: vop2: Support setting custom
 background color
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
 <20260127-rk3588-bgcolor-v5-4-b25aa8613211@collabora.com>
 <aXjPjNWl3oVOVYxV@black.igk.intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <aXjPjNWl3oVOVYxV@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:diederik@cknow-tech.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,cknow-tech.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: C6C92AAC4D
X-Rspamd-Action: no action

On 1/27/26 4:45 PM, Andy Shevchenko wrote:
> On Tue, Jan 27, 2026 at 10:45:36AM +0200, Cristian Ciocaltea wrote:
>> The Rockchip VOP2 display controller allows configuring the background
>> color of each video output port.
>>
>> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
>> which defaults to solid black, make use of it when programming the
>> hardware.
>>
>> Note the maximum precision allowed by the display controller is 10bpc,
>> while the alpha component is not supported, hence ignored.
> 
> ...
> 
>> +	/*
>> +	 * Background color is programmed with 10 bits of precision.
>> +	 * Since performance is more important than accuracy here,
>> +	 * do *not* make use of the DRM_ARGB64_GET*_BPC() helpers.
>> +	 */
>> +	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_GETR(bgcolor) >> 6);
>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN, DRM_ARGB64_GETG(bgcolor) >> 6);
>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE, DRM_ARGB64_GETB(bgcolor) >> 6);
> 
> There is FIELD_MODIFY() for a few cycles already.

I've been aware, but found it more appropriate when modifying an existing value
(e.g. previously read from a register) rather than when computing one from
scratch. 

> But here it probably makes no much difference.

Thinking again about this, it is actually handy when keeping the first
FIELD_PREP (for initialization), and using it just for the subsequent
operations.  Hence considered this approach in v6.

> ...
> 
>> +	seq_printf(s, "\tbackground color (10bpc): r=0x%x g=0x%x b=0x%x\n",
>> +		   DRM_ARGB64_GETR(cstate->background_color) >> 6,
>> +		   DRM_ARGB64_GETG(cstate->background_color) >> 6,
>> +		   DRM_ARGB64_GETB(cstate->background_color) >> 6);
> 
> Probably you want to have the alternative to the DRM_ARGB64_GETx() macros which
> incorporates a right-shift. But it all in regard to DRM style and preferences.

I tried to keep the API as simple as possible, but you're right, it's better to
have those macros rather than open-coding the bit-shift all over.  Also handled
in v6.

Thanks again,
Cristian
