Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD158F1FE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 19:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04108A9AC;
	Wed, 10 Aug 2022 17:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Wed, 10 Aug 2022 17:56:16 UTC
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BD32AF98
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 17:56:15 +0000 (UTC)
Received: from [192.168.1.103] (31.173.82.128) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Wed, 10 Aug
 2022 20:41:02 +0300
Subject: Re: [PATCH v2 1/3] media: vsp1: add premultiplied alpha support
To: Takanari Hayama <taki@igel.co.jp>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <20220810083711.219642-1-taki@igel.co.jp>
 <20220810083711.219642-2-taki@igel.co.jp>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <0a9fd415-a4e8-2f87-3cbd-8e31b758cede@omp.ru>
Date: Wed, 10 Aug 2022 20:41:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220810083711.219642-2-taki@igel.co.jp>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.82.128]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 08/10/2022 17:26:28
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 172165 [Aug 10 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 495 495 bb4e71e2e9e23696ab912b286436360a94c9b107
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.82.128 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.82.128
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/10/2022 17:30:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 8/10/2022 2:00:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
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
Cc: airlied@linux.ie, mchehab@kernel.org,
 kieran.bingham+renesas@ideasonboard.com, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

On 8/10/22 11:37 AM, Takanari Hayama wrote:

> To support DRM blend mode in R-Car DU driver, we must be able to pass
> a plane with the premultiplied alpha. Adding a new property to
> vsp1_du_atomic_config allows the R-Car DU driver to pass the
> premultiplied alpha plane.
> 
> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 2 ++
>  include/media/vsp1.h                           | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index 0c2507dc03d6..019e18976bd8 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -856,6 +856,8 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
>  	rpf->mem.addr[1] = cfg->mem[1];
>  	rpf->mem.addr[2] = cfg->mem[2];
>  
> +	rpf->format.flags = (cfg->premult) ? V4L2_PIX_FMT_FLAG_PREMUL_ALPHA : 0;
> +

  Parens are hardly needed here... :-)

[...]

MBR, Sergey
