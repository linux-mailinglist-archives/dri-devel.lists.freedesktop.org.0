Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKjSC2H1ommG8QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:02:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920EC1C36C2
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A118410E2B1;
	Sat, 28 Feb 2026 14:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="TkKKLTlO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B8810E2B1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:02:04 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-483a233819aso29091255e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1772287323; x=1772892123; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WlFw9E7/7safVoQdTcstXfBKsD2ksjVuQBYYKWaTUKU=;
 b=TkKKLTlOQRJx/mctBnjU+AfnyjdvCujQUN82rEwW59l1EXlXt/nOBuIvXD4KTmrc1d
 QKZAaq+tmZLj4ijPy1Fq9x/ILtAiEOZ1dfoidhuSvr0p+stOsvKMXjrme0/TQPAZBUb7
 f3YKVBsvGFmudrbzS4GIprdIHeCTlucHTODOyo1DhcnZccXabRyXsWZ9GwV6RzA+b9G3
 cicdtzcuSDwRVjuSauqOsVpoCParm/AVrhcZkTDa8bSfr9ZW5SoDoVOvhrfcaGuJjEvJ
 Sb9bf0JF7t7uDRoC/wZjJoPFj3njn3Tb5n8IR9xluONw9IfMHWPJgObpeMvIxNLQEdhX
 zm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772287323; x=1772892123;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WlFw9E7/7safVoQdTcstXfBKsD2ksjVuQBYYKWaTUKU=;
 b=seaeuMsXXDsTlc9EfonSrpUWLH7Bdkgma2Lrv0Wt/GBOSkeKnM8dTQrWQwj3vd3Nwo
 zPMyy0RxrfNPitFHCAf4yGo83BxiZa8ZY4yPv62j8zzGcZ2wqFVzPS1E4WMALUync8hv
 IMJgnFKCtF8YpsLol39/ib2phL6BK50eQaY7PUxJeoT/URaNofJWIuUpqCc5WQaTcOFg
 2jrEsXuYF4RAKloN8305F9ZRp7gAp15qGnvowXOm9zTMioNjpMSSD03XPAqe10Sp8oeh
 VeN9bMUzIB9jUdgYEKuXw8N146keDd3KsyawEh4z1bQYezop816vcTFwq8iMGG+GfDze
 wu+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJQw0yh4ZI3zqYwHzDsCiHn8pbuxWhyhZMViuSm/V+Fg4ErggVqymUCl425UW/SLnYiWBMY6UF0CY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVUWFEAk/crP8tdaNN45y1u/CQfLySZqIkZI+3ZWhRycUO164U
 nwWEmFSG8yo7iKq8lC6HjB4Tuk6cVHzc/yMSYXNrGtDaxo7LrTdO4wR9yV9gFXxWd6Y=
X-Gm-Gg: ATEYQzykHwOa+GUZsA79blu3QDXInJIwSknwsoKo1acbUjl22VMpOR9yQOH2DFsvzN2
 ip8L+a/SS4Dm4rgkNtjBpQ4LUU43Y7T8vRKJyBV7yYpA2JxvQ2D9MaVwZL/JaPVsoPhyDHTTGLl
 XSOUkv7aiWL7OW9A6f3IqLdNLJCUvQu2FhHPJe8cRhqo8Sm5WmBCFaLamcFiMlUHmTTV3trtY6K
 HV6rPs7UtgZk/hhMUyH7thm3YnGvLBWdcLyxYDiQGhekzPUgOBnNtpfD6YhGkfe5t/kSm3UeyOH
 iFhMCIp1Sifp/NVpX7OC3vuVoX1QTEjFU7jN01J6Glf9qGS59DqsY2gZlagMPCRRTlV70SMd1/x
 lKRGkRY+zO0nUXGBEbBM2PpJrVWgls9hQmHKFZ1hiA0+uRI74x+ChPAvj+wUIgIZyn4Nv0rXu8g
 KwsTglk/mVbcYelNUgowNZHc5POgMctg==
X-Received: by 2002:a05:600c:4748:b0:483:c35d:367f with SMTP id
 5b1f17b1804b1-483c9c0ba58mr107075855e9.21.1772287323090; 
 Sat, 28 Feb 2026 06:02:03 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcb318fsm133468375e9.6.2026.02.28.06.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Feb 2026 06:02:02 -0800 (PST)
Message-ID: <26f0d6e3-f62c-4a4e-8e35-37f2e5317087@tuxon.dev>
Date: Sat, 28 Feb 2026 16:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ARM: configs: at91: sama7: enable config for atmel
 maxtouch
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 linux@armlinux.org.uk, ebiggers@google.com, martin.petersen@oracle.com,
 ardb@kernel.org, tytso@mit.edu, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Romain Sioen <romain.sioen@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
 <20260225085430.480052-6-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260225085430.480052-6-manikandan.m@microchip.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:manikandan.m@microchip.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:linux@armlinux.org.uk,m:ebiggers@google.com,m:martin.petersen@oracle.com,m:ardb@kernel.org,m:tytso@mit.edu,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:romain.sioen@microchip.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[microchip.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,bootlin.com,armlinux.org.uk,google.com,oracle.com,mit.edu,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,microchip.com:email,tuxon.dev:mid,tuxon.dev:dkim,tuxon.dev:email]
X-Rspamd-Queue-Id: 920EC1C36C2
X-Rspamd-Action: no action



On 2/25/26 10:54, Manikandan Muralidharan wrote:
> From: Romain Sioen <romain.sioen@microchip.com>
> 
> Add config support to enable maxtouch capacitive touchscreen
> 
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

