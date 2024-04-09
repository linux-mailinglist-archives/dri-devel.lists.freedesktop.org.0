Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2FB89D726
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938F4112CA7;
	Tue,  9 Apr 2024 10:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="CiR/MquU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2093.outbound.protection.outlook.com [40.107.7.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06AC112CA8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:40:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHkB8s6MwkgbPnmG1YtoFUd1uy5OaI0W0ZgMkulWyZZvx4JdPUjIoRgUV4TlCl4uJzYJANSdBj2AKIqxxFY7zrG+Pz0TsyMCV/p7kKhVtoeurQQrDITWIDUKTE8s0M1sbz/CexbrzqWqlT5BuvijKEYyh3bYi5DSCXzMkH4AI7lw11cRUDzwbkUu8lIT5HKR0lK/BuSqAIYfuTB2vtXtNZ6HxhZ22R4wB9zswD/i+taNCDUY7oenh56IdbFxpz054uBMrvnjIfIe9GCRA7LLXtE+d4X8J+1aVbpxI7yj7hd9FlXGbQmhN6YKHdZLllzD3e6NdQLUjauclvOmZlk55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnWdPUJfSNVt9nl7/jD+/UMrJAzarK7hJZi+TS1ehDI=;
 b=JQd7j5ZRfW87A0C9ylNkxz28Et93vhjQ5wbdMG1B1qVbv5caYQ6K51bPsVwReUp67NFBg0WjoXnjWP8+ElpSMBa44Yfoqn3zceqX8Hbg+/5dt9DfIyMxmr9MwqhPAJvOn1JWDp/e1akYsFNyZ+gsACvuUgbOJg80LbZDUd75T2tXzZ19T+TXu2rCT+dh3A1wYZ1uZBjpWYWiWLef49cKKftLFsqVx0EMRpp1wJt8uskTRPofDuUao+4N5T5RBZyVrvvgjCRzsFCJO4vuNyEx/KzvYUKxpj3lLGVYXPyzthtMX39W3Zv29raltZV9eoPQVzu3vUyTbTGt2s1gXCwdmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnWdPUJfSNVt9nl7/jD+/UMrJAzarK7hJZi+TS1ehDI=;
 b=CiR/MquUCWMb4eJtWLRnwyrwdKVoe1m0BPtuj2fFhvnvX4vTYfmTdnCwj0ewKQR5+IdCOLlRofVpsCLkb8XFLf2LUGB6x86jFcMspwbkYos4z4kFgCTyaQsqpgH2WMVFsK+cNf4Q6dR0h6WTtT+EOX6auwEuJJOhHaLekqCg8Js=
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by AS8PR08MB10316.eurprd08.prod.outlook.com (2603:10a6:20b:5b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 10:40:51 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b205:5d9c:7c5e:21f5]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b205:5d9c:7c5e:21f5%5]) with mapi id 15.20.7409.053; Tue, 9 Apr 2024
 10:40:51 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: [PATCH 0/3] drm/panel: sitronix-st7789v: fixes for
 jt240mhqs_hwt_ek_e3 panel
Date: Tue, 09 Apr 2024 12:40:38 +0200
Message-Id: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-0-f9ccf6e7a881@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACYbFWYC/x3NQQ7CIBCF4as0s3YShMZar2IMgXaE0RYVqJo0v
 bsTl99b/G+FQpmpwKlZIdObCz+SYL9rYIguBUIexaCVblWrevRLuPIXb1U8x1ex8VMt3S0ZrDx
 zCjjqQ380nTJedyAd7wqhzy4NUUppmSYZn5kk8z8+X7btB0QTvFyIAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712659250; l=848;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=89NU/HOUVxRsB9hO7/oyFknA7930S9CGc8u97ipy/Bw=;
 b=ytBy7AwEWIDhsdFbe1YpLD/rE0Q7ubJjqsLHb+IUI9Hl217XtsWndpexT06DU+MzIsMxJGaAT
 6EkERxH4gBgCBPV4uHExqmRuXf1bAyl6+CgXoeM8GqIJkIIHLxAYlxL
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VE1PR03CA0002.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::14) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|AS8PR08MB10316:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gHrvTn4fbw/38hdA+AuDbh/kRQEWzF1ogROJmiqGkBgC6Oqs7gKy7fOHoCNwiFAX2IizbkxTYPIn6/bmnKaQs39Dr5HnDc+0AoJRu6pFJtpE30PVWfAiUQy04G74vwiWMWedCLmX7coEC4YOyiSKQaBoxLqVmVzgG1vFXlfRZfQI/LFAL9ETWL/X5TVynFwe/CYPcWfVoOy8/mPKKNrCxyO3kCW4UZtj7fw1W6dzyEyy6657X3vjGVVrgxu3zf/yCc8xgA/vJdg2bJd0H6KbybhUi0oKbdfmYESYyygbgM7s7j7HDeKGTu+vtCq9WMNN2rSefZGF6ZoJ/Sf2WkUK9PpgVLaMZsqQKu+5NVxFgFxG1xr/0zZgc8rwaJ6hd+/GScf3kcsPnCFvVvT6CiA4XLizTmCV4UbtJsj98T7TpXRxvXJekq2o3ixRUKbBVokd/Nla6kwhKCvSLB8n1Xewu4AY0uwT+0z0A1YVZX5BAngvEXCG5H4wDf6eXHZfhnXsqE/FUh43Z6IbhGR9ssl9E9wolMUS5kxfnb2BGfbM2x5CzGmRorz38uLiW7XHY9R9CaCFq8Evd2lYH0E2sTtNdYBZrNhtuBXVQN4WeblCRKTo0LaGEUdu35bXlWuXW6cguYQ89lYagYlU0nTOMptn16Kha0fZbB+chJPJXpoRplk9/QXkXXAx+Efzid5lgY9KxLHIBzOzaXdmeED4NFmLTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(52116005)(376005)(1800799015)(7416005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzBEaGN1Rk9hUDRJNU1lZjF5NWlydUswRnZaaTlwQTh1R3dYTDNYRnlSTXN5?=
 =?utf-8?B?NFRyMVY4a3BNR0lvVXlGenlTYU91VFUxWFMzZW9ESC9TQVBUOENnQWF3UEhw?=
 =?utf-8?B?emdWZ085RXdFNTlEV1psMVFGbnBrdDl3WlpQSW9TcEoyT0RNcE9CVU5pUlFw?=
 =?utf-8?B?MUpRV3V5cGtlYmNpZnhneU5kTU9TQlhWUE5nS0dSZ1Y5UXRoSkQ4WjJEcHIz?=
 =?utf-8?B?cnNsbFBUZUt3YmJqVUlhMXhYS0kyT1JOK0tDc1VyOFY3bDczN3hvcUJydjRM?=
 =?utf-8?B?V2JuNjh5YmNuSGhoQSt6VXJ2MXM4SnBtaTBPb2NNV2NkZDBtNERpUllFVytQ?=
 =?utf-8?B?SkwwbEdadmhuRUJybmJDc294ZGhUMjgrR3lTMXZ0anllTHUwTFVkbDZ6aEhD?=
 =?utf-8?B?T0w2NmdsemhyTzhDcElkaTBvcjcrWWdWLytIc3FMdjVXdG5hL2ora2h6dDBl?=
 =?utf-8?B?VUdhWjB1cEtzT0hCQjhQYjZidkFuVjZqK3c0azY1MUZNSEFVRFJhK0M5ZDNR?=
 =?utf-8?B?RmlSNE8xaUdCQkdsdkdjZmRWVGFXRnVyL2hBUGVSdWNFdEwrRldUZlBLZXJh?=
 =?utf-8?B?d1ZwYVEyTGNJdFIwR0RjMTRHRmxjTUdsODZ1S1hjYmgza1BLT3o5UTltNVp2?=
 =?utf-8?B?ZndYT24wZWlXbitZUEt2S1EwNktyYkUvR0s5ejdpWkprMHVGb1h2ZVZKYyt5?=
 =?utf-8?B?Vlo2Z21Jbk5vRTFjRi9hYm94VnpBQ2x1RjFTUHZzUDFPRjFhekQ0UTdOTWo2?=
 =?utf-8?B?bi9RR3NLY0gyaUladFF2b3hPU0IwT2s1Y0RBMjRtZDAvU3dHZXAxNTE1YjI5?=
 =?utf-8?B?WkJaNXk5OHZCZ093TW5kT2pjQWNZZ0QwMHpFcFVndWRENTdqcjZBSko1akF6?=
 =?utf-8?B?S25ZbmFZSWxZRmF0RUhzYjQ4VXVpZmpEUWRBeTNWMmxPYkpUaWp2VkZMYTA1?=
 =?utf-8?B?clg3bXF0RFlNVzU1ekR3TzhHRTBFMkZaTUpEK1hYTjNEQWI1YlorMlZrRU8v?=
 =?utf-8?B?WUZKOEpDWEFkOEJ4T1NIYkdrUmxUcklYTjI4aEtjQy9oUDgySDdkd0dZZTIw?=
 =?utf-8?B?cUFGVTdqNWhxUG5lQmRrL3JFbG5Kbi9pSnNwYnczdjRhakZBRExTQks5b1RH?=
 =?utf-8?B?YVNiaW9yejd4M1UrVjVETFpUWWNSMW9WVjU3V2FKd1Q3ZUpzWXo0ZkZRaTV1?=
 =?utf-8?B?ZUFqZnVvQVc3cnRCSkdzM2JFODc5MFVlUmxBc3Iza3ZRaWZwaVZ2dXdQZG5P?=
 =?utf-8?B?TTU3a3J3ZkxNT1BiNitHY2g5Yk91ZlhiUHpzcWtGb0JPakd2a0R2UmpCeFYz?=
 =?utf-8?B?aUNmUWNObkRzZ1NsNVVZNndiWGJPaWdJd3lhZ2VTTkdQckptS0xvM2hoWGx0?=
 =?utf-8?B?cVlENVg3bVdnOFlZMVZReFAwS2Z6cGJWWE1WaWN6TWtvN2V0QWtTU2ZCWE9u?=
 =?utf-8?B?VExqc2xMLzEvQUZwOHY1TjRoanBYTnIzWjRhdkU2aitBNkNtUnpHdXFDbEF6?=
 =?utf-8?B?aHJ0WnlQU0lJVVZ6NFJxb0pVS3lBb2lhbFdXcHFEOVRZVkZ6ZWk0aW45a1lG?=
 =?utf-8?B?QTQwVnNBeGRGOHl1VGpTdFMxVE5KamVnd3g4c2dzU0pscXlaemNZaWtFSUxT?=
 =?utf-8?B?ZGRsRWNkdWdTSHRCOVZIZ2FJLzZZS1pjb1BwMzd3VnBBNUdkWTNRQWxnWEUx?=
 =?utf-8?B?NEtXWVB5MXRaenJLUDBXbUFZSnYxZnY4S2ZiRFlzUGR2clVycEZPTmRRcUxR?=
 =?utf-8?B?eVV6eFUrVjBVbUUyU0FjMFdiUFB0eHVLcC9hZ1pVMmxya3kvMEtpY3FyTjFp?=
 =?utf-8?B?aVZkMlY4Mzc4MTFoYmpvNUFQNEFMeSsrSFZpUVRMekJrWVlST1FLWFE2YjhB?=
 =?utf-8?B?ck1qVEsvcFRlOTN6dlJrYTExZW5VV3IzaENtRmNWT0hDVGt4LzAwaU5IZjIx?=
 =?utf-8?B?L1dnSEVWVUt5UkVsdUk4ZEVSRlAvSFZJZzh5emMxRlZXRHdNZzZoanJ1Ym5s?=
 =?utf-8?B?andqZ3l4OWQxOXlYSkExellMemtURWx5OGtQWkJpN3hqV09PWjBOdytUWEFN?=
 =?utf-8?B?ZnEyWXY0QTF5NlFjbkdmNEFDSGs5NGd5a2tNblFSUExCbzVmUWpqazNpaTNQ?=
 =?utf-8?B?ZTVLbkxwR2VKMGw5cVRreWVuQW9oTzBXbm1lSzF5Q3JlQTRmTHYvaUFTaFhz?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f55c36-b530-4190-40a1-08dc58818679
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 10:40:51.1076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNE6V3zWbewnkT02WuFIHc5Pv626AfvkGzA1wjhSCkroXvqJNeIPeBctugqttRyYUdBzO5ybey3xWpP8eYamOU904TqRPU2ALqNoY0QvfM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10316
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

At the jt240mhqs_hwt_ek_e3 panel, noticeable flickering occurs. This is
addressed by patch 1, which adjusts the vertical timing. Patch 2 and 3 are
two more minor fixes for timing and dimension.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
Gerald Loacker (3):
      drm/panel: sitronix-st7789v: fix timing for jt240mhqs_hwt_ek_e3 panel
      drm/panel: sitronix-st7789v: tweak timing for jt240mhqs_hwt_ek_e3 panel
      drm/panel: sitronix-st7789v: fix display size for jt240mhqs_hwt_ek_e3 panel

 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
---
base-commit: fec50db7033ea478773b159e0e2efb135270e3b7
change-id: 20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-d26983703b27

Best regards,
-- 
Gerald Loacker <gerald.loacker@wolfvision.net>

