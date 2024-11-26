Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F2B9D950B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 11:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA99410E809;
	Tue, 26 Nov 2024 10:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="bvJ39ELG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta038.useast.a.cloudfilter.net
 (omta038.useast.a.cloudfilter.net [44.202.169.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EFC10E038
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 09:48:36 +0000 (UTC)
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
 by cmsmtp with ESMTPS
 id FlBXtQ6t5g2lzFsBPtoolp; Tue, 26 Nov 2024 09:48:35 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id FsBMtYuLGbs9MFsBOtJjpv; Tue, 26 Nov 2024 09:48:34 +0000
X-Authority-Analysis: v=2.4 cv=FY0xxo+6 c=1 sm=1 tr=0 ts=67459972
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=93K1lgOoaU1w4VZerC0A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a8ueHubk6mmYB6WMiM5LtQ8T6xCsiCxFTTYrybUvEGE=; b=bvJ39ELGwy2D61eaKv8luPf6Xy
 YMjW/Cf8o9tvzappwisFYClHzW2/qZuoIX7ZEpDhgrfdrOqiyQYkcGGuk1CsXtqxd/QKDy8GAAKrp
 UKv4+IJmOc/6WL/6Cs7WTdgCIyXqsV7XE/kQBRuh04YPZQHDjxheSrQJNG/+xjo/QMx154CTOy7Ll
 8hBWdvpeMPLoid1PoxYhSUx8R5Y1wHTVjCtyB/AHNczmDvi+4Hp+lNXeqIqD3HR+zpzHoO2eVIMYt
 dC8kgGDdey4f/u32IT98n+Cwds9eoHxsP54E476rRqHIE9rfQ1ygZPcKWxn3gTepi7oivmaQd5AxZ
 pQh9ky0g==;
Received: from [122.165.245.213] (port=50212 helo=[192.168.1.5])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tFsBE-0048HR-2M;
 Tue, 26 Nov 2024 15:18:24 +0530
Message-ID: <b4839cdf-b07e-47c4-ad6e-fc148c1f045e@linumiz.com>
Date: Tue, 26 Nov 2024 15:18:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/imagination: add reset control support
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20241125-pvr-reset-v1-0-b437b8052948@linumiz.com>
 <20241125-pvr-reset-v1-2-b437b8052948@linumiz.com>
 <74d4fc4c6f08fde2d6759633cb2280ecb18cbd91.camel@pengutronix.de>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <74d4fc4c6f08fde2d6759633cb2280ecb18cbd91.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tFsBE-0048HR-2M
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:50212
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 20
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfN5gA3Wz15EOH0T+u0+5Fnt/S4wpoqDHUatOX0L8BtIAbRp8oq/8tgU7PrR1JmI8Aj5ONaXfcl9RQd3GmUrB9HlO1J4Ohi61MGdRMXbUhINF2h6sZvwl
 vAgUK4HPTksnvguT7X0cd0UdnK6e3gctorj64mHDYHu5tYcAtR+iOHpYEDpQ3DIgOdkm1GqFoO4/YHSXz4tqLpWBpZsk68QVWRZQSrEsqdobillmlLktq38C
X-Mailman-Approved-At: Tue, 26 Nov 2024 10:02:25 +0000
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

On 11/26/24 2:59 PM, Philipp Zabel wrote:
> On Mo, 2024-11-25 at 22:07 +0530, Parthiban Nallathambi wrote:
>> On some platforms like Allwinner A133 with GE8300 includes
>> reset control from reset control unit. Add reset control
>> optionally from the devicetree.
>>
>> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
>> ---
>>  drivers/gpu/drm/imagination/pvr_device.h |  8 ++++++++
>>  drivers/gpu/drm/imagination/pvr_drv.c    |  5 +++++
>>  drivers/gpu/drm/imagination/pvr_power.c  | 16 +++++++++++++++-
>>  3 files changed, 28 insertions(+), 1 deletion(-)
Thanks for the reviews. As with the binding patch comments, reset control
needs to be added together with the consumer i.e in this case GE8300 GPU
in Allwinner A133 SoC.

I will address the comments when sending patch with support for GE8300.

Thanks,
Parthiban

