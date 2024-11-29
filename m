Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1B89DBEF8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 05:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E714910ED92;
	Fri, 29 Nov 2024 04:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="f3ErCGcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta40.uswest2.a.cloudfilter.net
 (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39F910ED92
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 04:14:12 +0000 (UTC)
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
 by cmsmtp with ESMTPS
 id GnXZtdcjEvH7lGsORtF2q7; Fri, 29 Nov 2024 04:14:11 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id GsOMtGgmmfkSoGsOPtRr67; Fri, 29 Nov 2024 04:14:10 +0000
X-Authority-Analysis: v=2.4 cv=dtLdCUg4 c=1 sm=1 tr=0 ts=67493f92
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10
 a=a9eFdPKkdgbxhWDV1dEA:9 a=QEXdDO2ut3YA:10 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Q5uoccyOFHjDwzni9s1pvqhXs3JznPJtn8MoISASRU=; b=f3ErCGcGBfb1iyOQo+fcBv1t7e
 6gIj1pftIjig6fL7tveuQjbhA03eV/QcD+R5rWTQe8Kn9b8yRm0dBILPJMeIAtcfUfaokPCf8bEQi
 VnM7TkIpwvFLSw3xj9BQhyi6Gh69ZUuRR9boclxSbWyPKx5IifgE+g3dfVaP856rdqNtazS6Wz5YF
 JpmSzV9RSZH3SLtqW7qKwH+Fxg2hykOB0b/Lml5yUanGNm9nRgIDBLwLO7zu4QpPtTIwTZsg6evED
 zsR5Vc7+gG5Tkk1K8TlzyM6VmhDxfJBgYFDuuJLK0ncSsuEditRyf0gLS4IJzvUb11IMcRspqyPew
 2Zwa/xSA==;
Received: from [122.165.245.213] (port=53154 helo=[192.168.1.5])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tGsOG-002aNG-2V;
 Fri, 29 Nov 2024 09:44:00 +0530
Message-ID: <fa7dbac4-592e-44f9-b468-834779fdbbc2@linumiz.com>
Date: Fri, 29 Nov 2024 09:43:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
To: John Watts <contact@jookia.org>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan> <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
 <Zy4c9BFcrz2JVU6k@titan> <ZzNCsFiAiACFrQhE@titan>
 <f0d5b314-cfcc-4856-8d6e-09e437c075ec@linumiz.com> <ZzPluoI7xSTwhNcm@titan>
 <2ef6afa0-2756-493b-83a4-62e73a8e2af9@linumiz.com> <ZzRgP7-hHWE8JH8K@titan>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <ZzRgP7-hHWE8JH8K@titan>
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
X-Exim-ID: 1tGsOG-002aNG-2V
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:53154
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 4
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDyP6yIerlkyu0d7xc43UsG5zvuxH2ErYO/4u9GQkZVMn3dqmygN81ZWnznGzuC9UUcTYfTD3GpPfHKeW1+RsO++eIsW28Jw4I321G3cahh7h3+act13
 wy5bWfoTsdJX17KIs0Or117AM/SosAPe5hCJI8XZaVuMJFLtB1Tf/OpE8citY6rMohc3U0thvxI38pSNenJYV0YZOHV8XD4B5GoAEmXGpKX6IqW9/4b83BZX
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

On 11/13/24 1:45 PM, John Watts wrote:
> It really seems like the code means mixers here.
True, I was wrong about my statement. But with A133, the case of independent DE
is unique, which I couldn't test yet.

> If my thoughts are correct, this would break use of mixer0 and mixer1 at the
> same time.
Agreed. But back to the original discussion about setting 0x20 to the port
register, it work fine in my end without that changes for A133 display pipeline
with LVDS. Not sure if the reason is independent DE.

Thanks,
Parthiban
