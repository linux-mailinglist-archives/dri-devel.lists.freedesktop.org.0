Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20A48D3989
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A9810E484;
	Wed, 29 May 2024 14:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="EjSjJYCu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2110.outbound.protection.outlook.com [40.107.6.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C0910E256
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:43:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bjk8lKKpYYSqxW5xJYdddCN6SrFr8PFecgLDho3xEs3rW/+uFdQSdv7nJ4gDxSQvgNeWGKg0ZGQrQVKYbYwcj7J7f/ZbDKfjFUhU9y0Pmv3Ogjtk24kVJrw5PW8RG6e7+xVFHMujqbCr7x4BLNRZud6a6Nra9Hz9h6vChmD2yXPzba4isAIQiPaypBrYBNHRl37Ovk15SCvEYmVdj4biXSNOhxIlf9/i4sAF9bLGD0LnhtZK7w/WJWDds2sMHBxbfs3snG7vIGxa0abptyDLd2PdjXFK8r4gUz7EvIub7tqKb74SgJ+ST9Pbn3RZN3xdVOF4ngs6gMmW+eMzOl2BWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYRpFQOn/htXhY8dY3RSsWGVQU9zMYIUhKEOtFkj8us=;
 b=SjBWrlFlSBMV7DPg/HRn9ODeROUY5kLr4IKghKFvxhwc0YmOSjvzAVuWycQSAMipVW6xNiom85QwmAe3oJlYZuVKu3ehE3pU5DkbpBnRj4dykQm+Hv7fBStH7kFCairKeC3VYA+IYjxh2tHlR52XUbufCvilG5gz1yK20Gc5P1S3kyUQLkY8e2Jk/qilVijlD9fxzoag5PBGLAUn5kW8XvH7tu1HEowwJdmd0iYqyBbEXbI+IxJ7bpvzrokOIMwUAEqFZn2LEbqqKWSeXrl+ulX0fXs9wTg3ez78e8fvVZ5yIslI0wnn8zx/CIICyiTE/UdfHsoc5Dp8p0gQU6UQgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYRpFQOn/htXhY8dY3RSsWGVQU9zMYIUhKEOtFkj8us=;
 b=EjSjJYCulE9ciqXKsyelLlg0k/QB8ovvY3MG1RhgfTwvS91A0xhWgILYM8HGYBKFkLWd/Z+BHdRUaqo7XMICTL5P/sirmzXNp7hAqTwfMunlN2hOe2ZcJArt1PNZwd6XjHD6q4u0/g3+qIxV1+FK3dGbz/GhlSsHcRi2QCPre9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DBBPR08MB4539.eurprd08.prod.outlook.com (2603:10a6:10:cf::22)
 by PAWPR08MB9032.eurprd08.prod.outlook.com (2603:10a6:102:335::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 29 May
 2024 14:43:01 +0000
Received: from DBBPR08MB4539.eurprd08.prod.outlook.com
 ([fe80::87a9:a8d0:96fa:19e1]) by DBBPR08MB4539.eurprd08.prod.outlook.com
 ([fe80::87a9:a8d0:96fa:19e1%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 14:43:01 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Wed, 29 May 2024 16:42:47 +0200
Subject: [PATCH v2 3/3] drm/panel: sitronix-st7789v: fix display size for
 jt240mhqs_hwt_ek_e3 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v2-3-e4821802443d@wolfvision.net>
References: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v2-0-e4821802443d@wolfvision.net>
In-Reply-To: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v2-0-e4821802443d@wolfvision.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716993775; l=936;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=+vp7jYPOn419f5sX4IyKhrUsXHxL0vAwwU3qvL3RJTI=;
 b=oG2HVBAvIUfU+jdpqN0tQhRQx9/J9A+OHD4bj9NYJ396Kw3tMAG+wBJtfYloGcvRL2BVYm0xf
 GnTpp7nWyhdCACoDFl45DqH/fTEkknfzIC4WOEzhuDa+2mHxj28SX6S
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::8) To DBBPR08MB4539.eurprd08.prod.outlook.com
 (2603:10a6:10:cf::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR08MB4539:EE_|PAWPR08MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe7d029-0b81-4b4b-a9c7-08dc7feda207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|1800799015|52116005|376005|7416005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUY3SkFVWTF3dXVQOTVsMHZFcjlxc0t4SVpkeDNrSUd3MXBtclhzWGJmRkJY?=
 =?utf-8?B?Z0Nyb2NSV2o3ejdxckhJNUlvSXNuVnpzcW1EZUV2NW1BTllKVEk4RUZ0djhG?=
 =?utf-8?B?UHFMUzcramhNdllNYVA3c2I1bHJIR1g2MVVEUExKOW1OUEkveWlPQy9uMURu?=
 =?utf-8?B?dEpHVUpRdnNWT3RUUFhIOVVMR0NDK1lYckFGMnlkSTFZaW42bXRGaGlpVHBz?=
 =?utf-8?B?NnFacnlkUk9ZaThYZC9rV0VZR0JtaFpWVTE3YTVtejFEanJrREd0dHRQLzF3?=
 =?utf-8?B?Z0F3NmN6cW5GYjdYb3pMdTVSeC9BMUVKRjJRNGRYRC91ancyejE4QzRkYk83?=
 =?utf-8?B?MFEwaGRkOGhZNGZVdy9nUWplMGw1RGVVbmhWNUVBQW9jcDhRY1NDOUNkRUFk?=
 =?utf-8?B?VXd1VkRYUG95UGpMZG5OeEJldmVlKzdOMlovZnFlaEVHUG40d0liWGZiakI1?=
 =?utf-8?B?d3VPS1pQTmdEZTdkYnJtci82RlRnYjFkMTJxV3hlc0FhM0FBdFV6em9uU3lW?=
 =?utf-8?B?YXNxNjJQRGRtNlgwMnhKT3M1NVJzdStPOE9VeW03M2xzM3RJTkpHU2owY1lB?=
 =?utf-8?B?Vzl2UStnWTdmMEZmcHJheGJsdEJnM2tsUEZlT0VqSXZpcllnTTYwVXdYMjl6?=
 =?utf-8?B?NGZCbkJtWndEc3dqamM3NHg0UWZwNWdCZHc5ZlVQMWtnV0VucEhRMDEwMTlI?=
 =?utf-8?B?R29ySGd0dWlLZFFSSDUrWENsblpGL2R1WHZqRGF0UlVrQ1ppTFVVS0JnV3BI?=
 =?utf-8?B?bnE3bGpiekRPNU4yVHpYc2xhTGJ4YWtVUDlYMS85Z0kzR1dock9VMnMyVUFV?=
 =?utf-8?B?N1dVTHo0SStNd1pRUThqWjRuM2dmWEJnWFlnUHcrb0JvbGdXTjNydVZVN2ox?=
 =?utf-8?B?cEpPNTRva1ZMaXpVTTRkZllCaDRvMCtacFlYVHdrdjBZaFExK240dnkyaGI4?=
 =?utf-8?B?V2IwZ0VjdTA4dmhqSlVVM0NuUmxySXBKeDZha0VsaEM5NmFJSmRiczRjSGZC?=
 =?utf-8?B?dlZnUWU5ZmVXQUFhYjBGZVMzM0JaWW5lTDR0a3RRRC9iNDRiMGNvTjRlTlVz?=
 =?utf-8?B?MnZDNWxtb3I0MkNBZEJtTE9pWGlEQjVzSzVIOGtwcVBTcWl6b0VvRFhlR05C?=
 =?utf-8?B?WCtZTkJyVmJBdTF1Rnc3WllLT2s4eWcwUzdtQ0NEMUhEMnlUTzU1UGJiT0d6?=
 =?utf-8?B?R1F3R1dkMm5pOXZqbGJkQktzbjdJLzhJOEMwNWZHQ09LRlNXbGZ3U1dyYkcw?=
 =?utf-8?B?R1FUZ0ZEcUxBemVkQzlmcWM5UzlKT0Q2dUlhSWpuNmNBL3UxeWJvc21LaFV2?=
 =?utf-8?B?WllSZTBLc2x3K1FhakV5MDZsay9pWUNGTjlkRTE1MG9sdkVSSTFtSlR2Y0NW?=
 =?utf-8?B?dS9XVSttSUkrUkFmbzNSbkhoN0pPSkw1SWU5L0JXSEhqZ0w5aENqdUVyL1lB?=
 =?utf-8?B?bi9pU1JISnVHcExZTFhodGl0d3MvV1REQ1BZRVBkemhGbnJ4bXFOMW5ta1ow?=
 =?utf-8?B?eURFaUpxVGZKZ01oVWxqS0NKalNIbGsxRnVWUFZUNk1ocEFJNEdEVnNDTDFv?=
 =?utf-8?B?dHQxVlZrM2hBOFFrdFhaQ1cyREUyeXZIMEJ6NjNkMjlVN0tFdWtHcXRBU29W?=
 =?utf-8?B?U2QrYXJQbHlLYm4wT2pwSHAyUXE3WDMrbmRLYUo4YkJ6ZjhqcWpieUpiNGhO?=
 =?utf-8?B?bDlGY0dCdC9hQ0R6Y1ZVYXNoazh0VUxYRG9VNGpKYXR5Vk1nWTh6OTVvMDE4?=
 =?utf-8?B?czJlUGhGOWYxc3hqWWpZdjJvN3RnOFI2N1pZd2FSS01VTlFaR1pYS1hZbS9r?=
 =?utf-8?B?VElrRmhzOC9pYnl2akt6UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR08MB4539.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(52116005)(376005)(7416005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REc5Yy84b0wzTUVGOFMwWW10aEMvd2Via1BJQWJNOEJvZ0VWUVJpR0NnRkRL?=
 =?utf-8?B?T0g1d0EwWitJcUEzUi9Kcm9qYW9rR3lBOWtNUit6RmhzbFgrekdydXZneXVG?=
 =?utf-8?B?dFhYa0RVMVBkMS9oY2lRUzM3ZGNOa1EzcFA0ZHcwMlM3eHpYbEhSSDk3WmJm?=
 =?utf-8?B?SWNTenkwRHNuN3NmamdqT0kxTDl2QlZzSldxeU5Sajl3M0VWdjZDcm1CRGVs?=
 =?utf-8?B?cnMwWlFXT2xNdVlNcGJOcGpNakhneEtRMGJVOUlKeVhPNGRuRU54OGhFZFJO?=
 =?utf-8?B?VEtESjVRaDRLVTdlcnZteis2dlBNWG1IUm5sREZmT2pFbWQvZDQzU0t4Z3RP?=
 =?utf-8?B?Vzc4OWNucFVOTjdnMWMveTNveHRuc3k2ckFnMXI4N3RRZWw1RUJZRXRSTEQ5?=
 =?utf-8?B?djRYTnVwZlZnMGs5am1tZzVjajZQTHpSczl2cGxTazg0cERoRW1PM3BodW1E?=
 =?utf-8?B?T3VrZXdLUFloV3VMVnBSK2ZOQUlrN0xWaUtkanNGYTNpcEJFcGd6bTZabldF?=
 =?utf-8?B?aDdHRjdRekhxWHc2bnpmbEFMYVRIWEZQcGp5Wk1IaGNVWU0vb2x5YmFKNk00?=
 =?utf-8?B?L21jYTE5NWZBR04xSHBTZFhhd3BteDVvSVBxWWlBOFRORjgvZlo3L0ZYdUV3?=
 =?utf-8?B?VzRBZVk3VE1lMUhjU1NHWjdZNTBtQ0tRWlNPTE1hdmNKZjdmbjR0eW9aK1E3?=
 =?utf-8?B?QmNPSUhhc1o0emRlWDhMMG14aUt6Ky9vaVZYa0xvU0JGdGdOaWkrY3VzMk04?=
 =?utf-8?B?OGcyRVhWT3Yvb25GSVFpNU9zMWYvQ1FYUll5WGZqQldRMVBQSXpKZGNqeHhq?=
 =?utf-8?B?cEoyWm0xejAwWldUZDZ2MXRPbFhiTmlxNzhtckYzVWp4bnlxWWN6d3ZzR3Aw?=
 =?utf-8?B?NCs1c3h4ZjJjZFVLL0ZzSGhVQll3Ri91eWtYMjZXVnJUUVFtbkt5cmppODJq?=
 =?utf-8?B?UXBsQ2xOTHRyZFlOVlRVQjdxL0FGN0c3QWp6QUV0Mm54cUUvU1BISUZPSlpJ?=
 =?utf-8?B?UllKL2pzb0hXTGVLMllrdVl2MjBKQk55RzRuQTJBTGdoOTdXT3pyeXd1bU5m?=
 =?utf-8?B?N1M2a28rREFXNFhhL1labjhOYnVNYjRIbzZUajBkMzR4bmZMQkRSVG5CZ2xQ?=
 =?utf-8?B?ejNaczZjTDNWRThMTjJSblowVDR2b2ZZZEZZeUhneitReHVmaE4yaUF2SEhl?=
 =?utf-8?B?Z1kweWxJT0xRMWJadWhZWHNNK2JFRjFpMVZxa2wrelRFQmtSRktmSis4TWNQ?=
 =?utf-8?B?MW1qSkNmS3VQMFhvVkdWWVk2dndtalAxUGhNNkhSeHVDejVWSml2cmhGalp0?=
 =?utf-8?B?RW5FeHVEQlJONTJNRXh3YmxFcFhWUU92a00wc3ZydENoU0pBcDRaYkdpQndn?=
 =?utf-8?B?Z3Z3enhPL3RuS0xwWWh4TGN1M3VMbCtEYlhFZmt0eldDd0ExUHVLaDJ0dUpD?=
 =?utf-8?B?Y01zb2ltTDd3SFFSeVpBV09IY0ZrNmdTMzR2WndqWXlYdS9GN2ZPdWJCNThm?=
 =?utf-8?B?a1pMWG14QkxBZklHVGsrVU0xdXB4SDVrQWJsRiswNUxuV0hndjExT1NqUTN2?=
 =?utf-8?B?bGQ5cUlkbXZraFRkbkhjVUlYaGxZTDFiL0I5TG1DQkFDVVVxMVV1NnVaT3Vn?=
 =?utf-8?B?K2NyY0wwZUlRb0kyQlpDaGRGYmwvdy94WmsxM0VkdzlCVVF1SUVkeW9Cbno4?=
 =?utf-8?B?QkxxbXR1OFdLS1FtRjNtU3NCbmV4MkFDSzMvK2ZpOFRxb0R4Nkp2Q2FoN3dP?=
 =?utf-8?B?dlVGVjIyRmxzVXUyTEFpNzdtVmdNVEFTL2d5NTROTkkzdUl1RDU0UkpGUVJX?=
 =?utf-8?B?Qlp6eHVVNHdBUnQ0WWtSTXgyK3NxOHhRZVNtSGZ4dWhxVFp1N05GUUVacmp2?=
 =?utf-8?B?dXlTcEx1UDR1alpzcU85SGwvUlI1REE0bjE0aVFMQ01oTjY4eVpucE5ZWGF6?=
 =?utf-8?B?WC8zc3lLSDc4YThWMHRiVytWWDVVRHBuakNRUnhydkg1VWcvNnF1ck1QeVFY?=
 =?utf-8?B?NnV5em1mMmxpa1ZmUmdBTEhiM3J3REh0ZjdyQ2tONHdkTi9EeDFvU0phZ0dt?=
 =?utf-8?B?QlViVCt1dFhxT0ZsVDQ4NnpvSFpLVkNEczZuTWFDRkVHRGhhbGRZajZLTHRJ?=
 =?utf-8?B?ZWVLTmZmcEVINlMzZWlodTV0K09xRzYzLzZqaE9aK3pJSGxFOHJ4R2UwMUM2?=
 =?utf-8?B?RWc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe7d029-0b81-4b4b-a9c7-08dc7feda207
X-MS-Exchange-CrossTenant-AuthSource: DBBPR08MB4539.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 14:42:58.2999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrcSL8xS1nLPBBdR1DPj2jZgPJKaG+l90p2CrWJ1xOtxXaVhR2yne1yWbYi9y+gKW27i4UZQz/rtkPgNvyn3JeFCUV1e/dmYk5hRJApW91s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9032
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

This is a portrait mode display. Change the dimensions accordingly.

Fixes: 0fbbe96bfa08 ("drm/panel: sitronix-st7789v: add jasonic jt240mhqs-hwt-ek-e3 support")
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index c7e3f1280404..e8f385b9c618 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -289,8 +289,8 @@ static const struct drm_display_mode jt240mhqs_hwt_ek_e3_mode = {
 	.vsync_start = 280 + 48,
 	.vsync_end = 280 + 48 + 4,
 	.vtotal = 280 + 48 + 4 + 4,
-	.width_mm = 43,
-	.height_mm = 37,
+	.width_mm = 37,
+	.height_mm = 43,
 	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
 };
 

-- 
2.37.2

