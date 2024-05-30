Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D39F8D45E3
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 09:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9179E11B66E;
	Thu, 30 May 2024 07:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="FoBpPJ11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2058.outbound.protection.outlook.com [40.107.15.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B87C11B66E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 07:17:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2GlYAJ+hMFjJIbioHc6eh52All6QCu7ou3WGAFypMyRPcR3RK5euMxZDJFT4Kms6ifHFwBz6Xb6aNTIQj1xVC7oHIH+7i9K8gvkNt7b3vq5rktIiK8jk/98wGEeQDpHWQZR70eVrIyDJkcRfekCCPDxbceHz+jz651A1kLM6vLu+kc/AnBdgfjSQt90r7tcBVm+BnNcd6wrUKPL4sFNb5EHp4XVI8zMTJhyzRlabKpCOFv6ygSW/RU7h5dXURMB2xp57YqS6K0ohRgrhUZWHuMgGh2kc9wDVOSvGNc5HaKdOW5QTVtdiPM4ajLmp/fGLQuCzg/NfDWO9f7JWpF7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLgOmX7dGiC2KERJME6nWyR/AKM9lCKwVPeZ647zWn4=;
 b=Uh5DCy7DyvWVkUoDvaG45otZpG44TZpOHEjIZGZHfjZNLuIpkMFN4CFGgk5f3/TmsjEhc35/SsaB3vHFmBTSrePwmWC7qUMUFe0npKwIfiuzLYVROQGAwqzsYI2542uXYScODVTEJcBhG7Sy9PctrMdiHA5ezKIpaqItfz2jRHHd8ptUVuHVrQTovm0R01wDMF3LG6wt1+EIfnZlwoY94t9pACciIUTr1ajnZOEK7CRXxxdkgvMBLwuoDeMt/M+jemuKcmnkrUiSKpxzoaP5RIk0vpq36DyOb/Yn3+GcRgL6A1ywKhNiFQvK9Md9SfmU9MyJjhfT8uwgXdgngjAC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLgOmX7dGiC2KERJME6nWyR/AKM9lCKwVPeZ647zWn4=;
 b=FoBpPJ11Y2nFJH8oM0rH7kEiLON0tphTuGd2HNIe9hgDUZ6/I4fuusY63gP2rkFwZW7TljPi3BuLpLS0p7m1DiuiUYJ7oI8uiA5UfAnVB1gCt8YrRiDv0Pw3qSOQ6hZTCaxrS2BEBmZXPXkv1GwlttA9Jus2LQrk0uYTl/EF0Ew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from VI1PR02MB3229.eurprd02.prod.outlook.com (2603:10a6:802:24::28)
 by PAWPR02MB8957.eurprd02.prod.outlook.com (2603:10a6:102:331::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Thu, 30 May
 2024 07:17:05 +0000
Received: from VI1PR02MB3229.eurprd02.prod.outlook.com
 ([fe80::658d:49ce:8a32:69ca]) by VI1PR02MB3229.eurprd02.prod.outlook.com
 ([fe80::658d:49ce:8a32:69ca%4]) with mapi id 15.20.7611.025; Thu, 30 May 2024
 07:17:04 +0000
Date: Thu, 30 May 2024 09:17:03 +0200 (CEST)
From: Ricard Wanderlof <ricardw@axis.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH] drm: bridge: adv7511: Accept audio sample widths of 32
 bits via I2S
In-Reply-To: <m7sghjgqtm45yjkpzrekeab7doojagxjts7vmw23a3tqtjltdj@v2oencka3uer>
Message-ID: <adac6043-19f1-e965-e9eb-f3f1eaa6e067@axis.com>
References: <91472c14-3aeb-766a-1716-8219af6e8782@axis.com>
 <m7sghjgqtm45yjkpzrekeab7doojagxjts7vmw23a3tqtjltdj@v2oencka3uer>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: MM0P280CA0032.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:b::6)
 To VI1PR02MB3229.eurprd02.prod.outlook.com
 (2603:10a6:802:24::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR02MB3229:EE_|PAWPR02MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: a274d18f-90a3-4af3-dadb-08dc807881fa
X-LD-Processed: 78703d3c-b907-432f-b066-88f7af9ca3af,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JYAdev0ZnpdV6QW7lZM26Cm5FDuF1lLcIX49RT8M/lAHqewkOBfyAl0ddWd7?=
 =?us-ascii?Q?YcAI6O3NinWxFrZm/dZcClnSoG6hfeJmt56SjiADFxwnEIVhxA4vg0urZqp9?=
 =?us-ascii?Q?7sSw7iouo/zajkxUtPJUMTWyVrLcIciFMNGILLiUlCjzzM8zjJmprbrwp++3?=
 =?us-ascii?Q?vZitfGLhl2UOLfxnHKb3RB5ze0NmfBnytTiq3dTvtewP1ACzDmwFFFkxTkqe?=
 =?us-ascii?Q?qVG60hIPITDH+ABU82QvODNIP32EwehY3HNRR3+K9IPu0LC/ZFl2ZQ6P4IGY?=
 =?us-ascii?Q?mMTTZQMszB4YuMFy/TEnjHEGuLvjKC42I8Q7dNv+90oVIbVgJMTuKKMUqX17?=
 =?us-ascii?Q?ifppa7H90h6zD5PULpVIZ5syl2BcQAJO+3GC6hkrn23BHsaMb657v/CdHZ/C?=
 =?us-ascii?Q?oPeqQty2735hdr+kHvHZpSNuh7wUAtfMPsFdcCovhTYZqZKk61LdMuPvGG25?=
 =?us-ascii?Q?HNul5oVDxc4wvl89DOYUekQFjgdt3QEqpsSWrffuuUPkphJbDJlL4jr/mNU+?=
 =?us-ascii?Q?5F5B4jJadU2ma+zphrE0JJVEZiXQLilpHCjS4qJaQCM6uZnFSpIJ/SJukOAw?=
 =?us-ascii?Q?CqMUHEM/H6phmj9HYrHyyakM4N3lTeiEQE855/aV1nQbciVzVkjW2B8CUDvZ?=
 =?us-ascii?Q?4TPG8eN6/ju7LaQa3CzKmX7+1NMBfh7vJxVPJruGy0fzZLrTFsOpa40gJewv?=
 =?us-ascii?Q?ckyJxofHddiJTCV5fYsEOZTa/5IaOeAbWuX9XK+DPRmItWAs2hoZcunQj/HY?=
 =?us-ascii?Q?KHvA3vgyfMKcvXyoxwKdQtAoUhW83iGENHkj7HSM7LxEJ5pt09NCBxsole4z?=
 =?us-ascii?Q?SOfoFX+KK9cNa4l536v3kkoXE6WT0TnVLpw+IyHUKQIoF5JeyLp8mrSR03ig?=
 =?us-ascii?Q?vUY4zM4623J83l6unmkhm3pH6Pti87ujsYf6L1MpcZLcW1O+TO8RSNg1Twok?=
 =?us-ascii?Q?KoJqF7dKHDZI/25YFZO4Af8WSXL2Jr1yuHdibNxnO58KdOIK+5dbtnihsCil?=
 =?us-ascii?Q?jN8y0nYOOSyeyrPS4tOBPNnvh4k0Z47z8dS/+hvGOMpMkUcXCtx9Eucp40J5?=
 =?us-ascii?Q?6GmMOrhKVAJixnLl1F1MTCZvMgUM37C2DLOvnfM+VYP8jpHaZPKjedsRGuTR?=
 =?us-ascii?Q?OxNKGzib/NAxHXHGDALWx1snY28IylobV8k0+myHKdzxu1WaTzkCE4sapA8u?=
 =?us-ascii?Q?1LitUg0nVNZxsWPz+yfQqcxPPEDS/m1/6DbicLMLPGkYRYedAupO/4QOa9M?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR02MB3229.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pd2wnZYR87Y9R89I7S3khWKH3oqnUvNtIkKGkGDnFAYRIcxTNlAAZb0jziOs?=
 =?us-ascii?Q?BWhP7CEUVTeW+7s503Acrs7vA5fgfb5R0l5hwFHKPacH4tRQYyELlzqST5Fr?=
 =?us-ascii?Q?bL1G2Ex8+WwPjuKzQvwcwmqt6+Uv7VndOHFRx7OGKZ1sS2uGfMiXrcX916Wx?=
 =?us-ascii?Q?lQbhVKLE6gq/9jplZ2SLk7UR+xfrkOHwQU/7RqCIV3yJk3oF31kIW172+u2R?=
 =?us-ascii?Q?c8ML7OanC3oVoVxR7jOZnqz2HfSom7x55KwQWXadZC0rTaRvT/vbAA1uDAVh?=
 =?us-ascii?Q?2cv4fmialXrwPbTGrBBCwSRHhg7Q88gaEfOSsy2xG8kvL96JjAc1jsufbiM9?=
 =?us-ascii?Q?6B1uceTr9O0RJBdkoYvc8ibV0USJe44L51QlkL31aVbQKJbZVhRd2Oae1HJW?=
 =?us-ascii?Q?xYTKK+93ZTqL7yZlpPSwSEQ8i/UsV/relFtry+1c4U6XKmlvLHS7cNyC/AOS?=
 =?us-ascii?Q?Rbd7MkAAi9UwPYz6FSYZ3+hyoJb+ulACIrS7OrCAkGtVEzA0keRXg1wxhvy/?=
 =?us-ascii?Q?yvIblDY+dzRDCxbrd0aLmyP/5+GuKOLvg87/GO1Ba8U4NnMqs32sxaZEAmVW?=
 =?us-ascii?Q?slTsFsGmf7Ot6gJPJmsrYLugU+NeOPMoVcrgiNsZoKd8FtcVerXN3QxXHiVx?=
 =?us-ascii?Q?QxivWNIAljnYJACAsHkZlxiaVz5LoR1dqk9DQ8R4Sc88sITxK0BLXMq5gu18?=
 =?us-ascii?Q?Mm0n5RekL4Vwhn8PchVQw7TUHpO1M5Kv/OAbX4Wp05NMCWgCk36/cMVrNKST?=
 =?us-ascii?Q?hcvf32iGB79POdvCNngMFJcpTC6TVkgAVW0Su2s93wrCTmIoC79HHW7gSosu?=
 =?us-ascii?Q?Q0NcdJCHQdnLiyjsI7UA2sQWxf6HV58oyWowNrxj1L/GLFDqgtuH2OJy88Kx?=
 =?us-ascii?Q?ELRMzMqMxZBhuJqOTZs5jlg7IQOOrNtetzpR3xKQ/z8AXEj5XQLRaQYYXOrH?=
 =?us-ascii?Q?p0RuzayLUxeQ7SgiaWRDw6+GiwJ0C2fsCdqYXTT0fJ+9fUmU2XZ2unon1ePD?=
 =?us-ascii?Q?TaRrESim5UUgRwQdRi8AQXyYUIya2hwv6o8DGN0ehomZqc2EF+XgTmE/zJ4U?=
 =?us-ascii?Q?kKf48v7snIfaBpbJi/oD2iy0EPg9CDTEBEp0C5El3M4MB7o1kqiLwcxwF7eV?=
 =?us-ascii?Q?wB2dgbGsiAOSs9QolaRvOuVGcw57HrdrN98vE4QO+r9YfFBg5+4VYgIQKthG?=
 =?us-ascii?Q?Xde07QiWKheZXlh3u/bcFTj/jbEciMydz0a+BkauAM5Lb6MGyRqnNaSgy2Ib?=
 =?us-ascii?Q?59vBQ8zfrR3xwKVBcZttWknUtjBOrS+JA/PmOxAwVD9qDXvSh+17TQUm4loB?=
 =?us-ascii?Q?exq73jqOb0h5wZufCmVbe5rTBQ61Y+iypmrPGIbYBDmVXpvW6j1q3Mmt7l/p?=
 =?us-ascii?Q?RMwKDI3hNXccQk4inIlssGRyFbcWVRlvqJH66Z5pKY6hoVJdEGBsvXsmnjFQ?=
 =?us-ascii?Q?iNSTNu7bMEkZaG4E1Ki2Z5fK/SYsMpEUqZ1Ni7/sDF9P6Uo5k6u3w8BZcJOq?=
 =?us-ascii?Q?G0voxH7l7F8X3Uq+hGV9EA2AtA0D/+yal29KbZQ7t2Gf+lJdEz+Rc6V1ujl/?=
 =?us-ascii?Q?sCpAejthLhIKwTmpVXY=3D?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a274d18f-90a3-4af3-dadb-08dc807881fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR02MB3229.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 07:17:04.7181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZJo5UJTbi8OP/V7enbELs2iacML/kIPrn34ZCxAP8ajXPTA5aPWMY5gvErzF7U22kyxEeoi8qOf9YQPXrp+RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB8957
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


On Tue, 28 May 2024, Dmitry Baryshkov wrote:

> On Tue, May 28, 2024 at 12:04:49PM +0200, Ricard Wanderlof wrote:
> > 
> > Even though data is truncated to 24 bits, the I2S interface does
> > accept 32 bit data (the slot widths according to the data sheet
> > can be 16 or 32 bits) so let the hw_params callback reflect this,
> > even if the lowest 8 bits are not used when 32 bits are specified.
> ...
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> What about:
> 
> Fixes: ae053fa234f4 ("drm: bridge: adv7511: Support I2S IEC958 encoded PCM format")
> 
> ?

IMHO, commit ae053fa234f4 doesn't break anything, so there's nothing to be 
fixed. It adds S/PDIF support, which uses a 32 bit format, but the 32 bit 
format was not supported at all prior to that commit.

I don't really have a problem adding the Fixes tag if you think it's 
useful, but it doesn't seem quite right to me.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
