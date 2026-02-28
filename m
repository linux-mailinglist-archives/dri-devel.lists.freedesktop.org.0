Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFdMDSj1ommG8QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:01:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B221C3685
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E50E10E2A2;
	Sat, 28 Feb 2026 14:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="RyAe4A65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CD510E2A2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:01:06 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-439ac15f35fso255570f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1772287265; x=1772892065; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z8ilFU5WuG18swnOUDhw7CL76xSB1EetAmw090m1DI4=;
 b=RyAe4A65g6OXkrz3c+KufEVl/InMZ32w3jFkNAWiCGQXFRfPR8M79fbPyZ3ydLvFul
 DmuZls3vFaPzrw0AukE2RK5x44+G3m8+VtdFdVF+wLznd6PR86JHcW0HrL0PQSCBu7T1
 8wWJ6/7NhloA9B169GX9oNuhVt3JIUuAgq6dOGp/jxDc3LyV04s+uVBo29crYR47GdhZ
 gC8R/zhxl05OFkpmJDqikzrQ9DUI0vemFVjlWR0kB++Na8uH81+r7QqzG1sdBqo8X+uP
 lofDA0ezAqM+XJf8KiL8/uHjPIrAcVeUoo/tIszTW/hIOEXrdapBVy1QBRVvRMDongW6
 2ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772287265; x=1772892065;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z8ilFU5WuG18swnOUDhw7CL76xSB1EetAmw090m1DI4=;
 b=i9sems1Y0MATyLnHNRm9b3hfAnLYsHXyiS3ktI7qIJnB6E+l5ix/C1hr9Bt/UcZeab
 CR3Co2vB3335qysgAdjz5HzRpaGkKNMphOv1f/3r99uJgX0DGPbDM8O37qoZaL7Wq02E
 ar4lqwyPFT98C9ZM/g4MHUUHdgMk+S/efh0HCJns38Zav4tu17ZdphNfvvQZ+uguH/RS
 RNkA4sgdKeVADTPLVWPWj1kxsdnw5rffhb4CvW3ysduKCUWe34k+syFUSiTcbwMluz0a
 Cq3VTl4y4UHVVu0itLhG2ES3OlbNW2EuGuz5j+888R8qxZoSn2Y3j9f7P0/VpkItitvB
 BtWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkh4b+HCELEqaflRyoY6C8SpnI/BQ7l1JSbIWwrCYYnfpEwJi/Wc85ZkBElzP3te0o73WPwK84zno=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsUqsAuWxxaD1LpwhlU2Xct+t0+NPgKbnsCm+0LUyOzRCQGpoh
 yfpzZUEqdKf3XnAcqDkVLuF0C5G7hkDzKC3d5bfD7Ml9MtsBHISsFKdqd/0zkQ5VsQE=
X-Gm-Gg: ATEYQzzcSdXEgkkW7+bs2Y6MCm2tV8oOloayKhM06QC957kKZ0xhk8+NCvtLJiZoEeA
 x6OL51yS+5fX+FAaNxsKeBM8+mM9Vn6D8sh5c0vb58tlT6kf+RKZPvkLJ1Z0aOUScHTXqx28qgn
 3oJucypeAsCb1BRmgp1bistqenwS9Z5yJ+KDMs7b23DRPMuPOuJp1jSJprfU8IKevaBOKiRh5YR
 abG2ZXLick9T2l18MqlSt56kX1DuqE9W4rzSBl1sY15/obJgUrb+Jq4p5FxyMZQ3+nwPl+ONfg5
 OJwOkoTD6lAEzjwllbqv3btsNdPGeuYPp/Pkx0ISSMZqvVTra+OkXUBtGAMoOingDDkgXUmnSkQ
 E6PEfLU6Q6EkT1BC41oqyPkpiNRmPsoo61dUr/VnthJ0vxRRPJAs8eWM2EUt3252s8WZ52f+GRb
 AzR2o/6Bd6ETYlfivjXSI/AjRUuIvD1A==
X-Received: by 2002:a05:600c:83c8:b0:47f:f952:d207 with SMTP id
 5b1f17b1804b1-483c9bde71amr115364265e9.19.1772287264671; 
 Sat, 28 Feb 2026 06:01:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7507adsm310079535e9.9.2026.02.28.06.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Feb 2026 06:01:04 -0800 (PST)
Message-ID: <b76b271d-5249-4e84-b10c-f9b364b08b3a@tuxon.dev>
Date: Sat, 28 Feb 2026 16:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ARM: dts: microchip: sama7d65: add LVDS controller
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
Cc: Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
 <20260225085430.480052-4-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260225085430.480052-4-manikandan.m@microchip.com>
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
	FORGED_RECIPIENTS(0.00)[m:manikandan.m@microchip.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:linux@armlinux.org.uk,m:ebiggers@google.com,m:martin.petersen@oracle.com,m:ardb@kernel.org,m:tytso@mit.edu,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:Ryan.Wanner@microchip.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,tuxon.dev:mid,tuxon.dev:dkim,tuxon.dev:email]
X-Rspamd-Queue-Id: 88B221C3685
X-Rspamd-Action: no action



On 2/25/26 10:54, Manikandan Muralidharan wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add support for LVDS controller node
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

