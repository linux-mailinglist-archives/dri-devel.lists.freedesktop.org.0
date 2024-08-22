Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B2095AEA3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 09:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F40B10E795;
	Thu, 22 Aug 2024 07:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="KEgcYMsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2087.outbound.protection.outlook.com [40.107.255.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402FC10E6DE;
 Thu, 22 Aug 2024 04:01:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsnhwEfEwxKJ0oOi/Hpo4W3UO5hFhNV6tSGJxwB5ljTGZ7kGMBqnzS52JujPIE7W3+g7dLJnLVrVlRMBvgjWAO1scE0ioFB0aKJibzhpEOGpXBaY26aPCd0uinxB/8x18R0JzW7x3YHXGM3cQlkh84O9q9yxtEtnURF/4pMuR4NFCCNU8tuTzmS82ggnTV/hh+kWtKeQxGQXDfjdGSRBeF8rLWaWOilu1xnuXlXt8Zw5kHrQWJwL0xPYIjywJCzsUZVkcBqEuWBDuaz+pjhh3ZuT4e4gtxR10jJh+joeUPu0ubMm2VA7USFnZ95Bd69K91U7YcrFMrrU6j637eJh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ9VBdxKOLV5D42EXGGoUggFk0CNqWVOq4j4gWyqK3k=;
 b=T6rTozuiyETTfXgr7zqb5loo5oOL6kR/U3evzE9lMRGdXUyihomMkszPLkIVbaFl6eguAJgXCJM4lgIZy8iqiGIMdYIKX/Hkn7zngkdaWoDefTwocT7gHpuxSllKNyOeGuqdqMXBoASXYbmyPhcImmopNr4BKdFQuidSLlClLD57kyYEIlHwbYWtoawExPvNZl6lVrkG9inCmGFqLo1D3bkuEZpsO7J9Cd2o5MNo0/v85JSESU/+6uRgy5j2d4lu9I21XidTYK27z1OFT7fA/E67b56a4ooev3oUE0E2SzQa8UzuVpk1tHuVMoFpwcLAraQpjIoHnCTGltylXHAL7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ9VBdxKOLV5D42EXGGoUggFk0CNqWVOq4j4gWyqK3k=;
 b=KEgcYMslvCXfeMrPP5soMqEBVWIwwkZ67QjQWXKptyH4wBG7KH5FAwY3uonRUf3CLOjCzm4znNi1jv7SRb0DAFYYIrKqboHiggtIv9ZN1W3D9lMnCJbuaUp35IUdL4TdZq3zPbzmEKoqiUGcBMZsthdXYLMnGnWD3fNWza9yWqabB6Gnt4/WA6666Pi3wjQGwB7zL6asV6iRZCA6ICrPPrIpF0MOteXvkY36xMjxXT6TN1EBMy7gy9j3oRfvRxCjkR7T9W2gW2APTC1HVWQQlsYQKp/TGTIuDZyhJ/pb8leIqVkFU0FqXsDsHW8umGsu2F0827dFpZ425+28H5Gs3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5724.apcprd06.prod.outlook.com (2603:1096:301:f4::9)
 by SEZPR06MB7237.apcprd06.prod.outlook.com (2603:1096:101:238::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Thu, 22 Aug
 2024 04:01:12 +0000
Received: from PUZPR06MB5724.apcprd06.prod.outlook.com
 ([fe80::459b:70d3:1f01:e1d6]) by PUZPR06MB5724.apcprd06.prod.outlook.com
 ([fe80::459b:70d3:1f01:e1d6%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 04:01:12 +0000
From: Yuesong Li <liyuesong@vivo.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com, Yuesong Li <liyuesong@vivo.com>
Subject: [PATCH v1] drm/amd/display: Fix wrong assignment in
 dce100_resource_construct()
Date: Thu, 22 Aug 2024 12:01:00 +0800
Message-Id: <20240822040100.1249714-1-liyuesong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:404:f6::28) To PUZPR06MB5724.apcprd06.prod.outlook.com
 (2603:1096:301:f4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5724:EE_|SEZPR06MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: 82eedaa0-02cd-4695-be4f-08dcc25f0f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Em6R1+8OxommzdZI2brcGewo5HR+8gyvKDcSNKRvPqUyJOjRXC/T1Tb0hW5h?=
 =?us-ascii?Q?6T+BQYrShyMENeYdcpojcgxUO2+e9IwJ97Gkj6b3hsWDFTTjWeOCiutHPtAE?=
 =?us-ascii?Q?DviO2sX+8S0AOh3aPgPGX5IXwEDyJ94XxU2OE9Xn8fajZ4muFQNzrrhYJQNs?=
 =?us-ascii?Q?3RO6u2I6y3+k+rDHzYWiRrZdNw/btnalVapby4d/GaB5/i+x32IZENqtQlrx?=
 =?us-ascii?Q?Svb/6vQJP2JaVYGjYEXBZDl7Y929DxSKyjGiaAwCrMqPn4ELB8kw1iJt0v9f?=
 =?us-ascii?Q?ZCfS4bU+KRuM7yjr0Vqfk7tIVHrjglJHslh677+CsAWXoj8hj2HL/5zsfYj0?=
 =?us-ascii?Q?g9TdfNIuGK5nX/cjAk4zitmsnEg/TCCvhEoP+P56Bpnf5xHUdlcIgJrcuJvE?=
 =?us-ascii?Q?DDSDR0tLN/NdvWpor/Fh7iH6QOKS50wUrgjEtcaU8qbIa/t1VtFEIO8Ab2Rl?=
 =?us-ascii?Q?VDYxAJmPiQFveORwdmfEEquJDYY71Fjj9HgZdNS/jaH8DhmKPj6NnKeeSLVv?=
 =?us-ascii?Q?KVpwDTmfl47pwQCYapX6DJIzSJdMTAW6vI2o3PizmL67n481s3XMkuHr1Ohr?=
 =?us-ascii?Q?UvGBS+1Ve4Odso3k+1TeNshNLwubnLbna8KFSRLxY47j8pzaSzz/eI9Rwsk8?=
 =?us-ascii?Q?5NDbH93aaqb2IxtX3w9eVbU4Get5kEG9D/664ahz94pboUI3yvHcy19IIrs2?=
 =?us-ascii?Q?b5a9O/U6TPTziHh2/nFePrEjZR77lG96DuHSBFiGUNDK1sC9Ytx8riX1weOZ?=
 =?us-ascii?Q?/7d4UaZoTz2gu8mS3EiRzKcz1TywZJkITak14zPoEwlJKYbBwUEK22of1iSV?=
 =?us-ascii?Q?bNbf3WujOGVLSNl/ZEo+IVqaxpn0sPzuRS053kdNGSel9oF0M43Ijex53f3V?=
 =?us-ascii?Q?jTmYbv1kYAhH0IJZMSdulJp/Gjq5/1qkiY8+8ybYv3P7Ek7tDCZXsjXcuu6G?=
 =?us-ascii?Q?rtefvkucvCz6ivozjs8EVjxRZ6PbG7T5ZYltyHs8zYbuhrrervuW9cpoL6M5?=
 =?us-ascii?Q?/WmBVz4kz9FtVdkgamyq4aixB6a5awA+CbEoxqcmG5Cwrda4plNy09Ep04Gb?=
 =?us-ascii?Q?NZQsX52ZznKOmGw0MmM6Ww7y/IUf3W+MqlZ+0OUL+6H9clYN8DvWiNVtTuqn?=
 =?us-ascii?Q?gW86Xc3NphFYT5TkT5lVYqc8H8znbqFNRopayu4Yom7VCLYPTyxtKds6CvGI?=
 =?us-ascii?Q?MqqwXeLlGdKprju8+07Iys2ZV3fcaF/o/Gb17JZMjRbTlpaQjTOVRMUzW1+G?=
 =?us-ascii?Q?qUJILzP4ce+Lqmyr2oXfTfxbMUetK4ryCcsdc19NW43yRemBxCuBFpRVXdra?=
 =?us-ascii?Q?8BIUCR5qa6+znvhIHvQiOYtpsrAc988O1JqnOAkX53rHWBxZmSuEKYbUq7AO?=
 =?us-ascii?Q?AkKsHHZ0/SqPmhM2nKiz81igC5YTayKjk/i/+xwlGYqrLFE4lg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5724.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YR50vwTqpn8wdjIrkUF/SChsaEQXHsnuKEgwEAwv0rpnj1P5+UXQ0ZaxY9Gx?=
 =?us-ascii?Q?vyIb2YpkNI1S7noF+aEzhp5vtKJIMYCpJayYBcO22MKOZyi1V4dPWy/s5Zxd?=
 =?us-ascii?Q?RtPCXRiPsxq7sITsbEp6cOX3ED6iu6oZsIKHPakkolj1/PyJd4DQVA9HKh+M?=
 =?us-ascii?Q?gUMsB0MknxLFKEBxYX42feIJbNBtbJXla+i5HT6n8J8B54yKEr3QnC6d6JkM?=
 =?us-ascii?Q?dClnI4/Q8pvsBtvmXFAE0/z7slWO90eRP+jDp5B828Hoy/QpCdj0Sl8nZQ5A?=
 =?us-ascii?Q?C0hD7XriWamOP3tDx1Wr8bYSWfmtrPwCQeZzK5GvYiBDa0D+oZzMvQkX9wdS?=
 =?us-ascii?Q?d5Pg3XT9syDYqDBJMQeMwyIJ5eFoqs8XUwydNmZvMHNaj6TCmMWSUDzq8u50?=
 =?us-ascii?Q?UVtlGOJulNm65hOx/yw2GbmvpfFL8fnF5O/9hECHSuUoCnZLBlPj8KjfnDxC?=
 =?us-ascii?Q?C2NDMMy79hdT02iFwIBRqFpA4ZFP667hidDLOOvU8LZzCLLHqw0gPj9hHiS0?=
 =?us-ascii?Q?WtHWpLah3yje0k4u6Y8G2ckJLw1QYLBIBSnrvwx2AIqR2cj+JX+ycAgPOtSw?=
 =?us-ascii?Q?ZEqS8/48Om+vQoHKn22l15UHIMwJTNJviepPiYv/Y3IpQ89YXyMEgPEmFzpN?=
 =?us-ascii?Q?poBhJ4UXKQnNHRGhw0z7U4a/jDZO1NNvn8qm9LUfXZHNnyANglGfI3ga12tP?=
 =?us-ascii?Q?Z3+bPhkDOlxqF8qdi+l3deRKFVB9vr4J/cd/yDUgt9vBBhBT3jPy+Bp7Nhhi?=
 =?us-ascii?Q?1EV3QUJTXFE0DO9B3j7EAlH675dSvnCHXtiZlTHDZvcc+55K5ODe55+xeknj?=
 =?us-ascii?Q?f8Dphyv775jaDe+bGWh07UE3HCz/rmFCghPI6P9TOr/tWRb7bYwjsP8ynr7H?=
 =?us-ascii?Q?3zgQZ1KfCOA+R2g0QwOUAgaqaHVltmbt8lAByFvyZhO91e+cZExnt89Q1+sP?=
 =?us-ascii?Q?nDln0YXQo+JrMkY02d0X4w3a4hjyrGRdP8AYT/cxVqRxx6jYYTN4n/PWdk0R?=
 =?us-ascii?Q?KBaEVGfbZbqgT044wQUgKX1yTec5wkt83xDAJqbMprn7Ey8lTIAEj1rwCvJ6?=
 =?us-ascii?Q?uGlrwpAnriFZuBAKuITgvwuayS7gWLMdYtTE0f6xG0yDKB6jR6T45T8F8Ya8?=
 =?us-ascii?Q?zu9L60Pti/8m0xDNeWJ8tQYOmoB10Yt9BvlzYp01ssZ+ZG9weE50vYkR87hN?=
 =?us-ascii?Q?6HjzatslpNgC9988j67vYxAwUrWKtgDUtoqFLyH4WPmFvMfUC+AAVlrItMth?=
 =?us-ascii?Q?0dWeJrLgcdwidpwIPC1xKafaW4AmK7i9+DQTw0AgWxGhxv2Lztx6FWc87jXx?=
 =?us-ascii?Q?viuwt+ieDHc8iUNRZZg+p87JmlPl+aROJc4Lp04B3WF5njd6sB+kBSJbs2XL?=
 =?us-ascii?Q?x86WIEoPP88C9HVHOCkt5gk6MIl4SudQb2dGBQONi+QvR7SP8qF02DdQCi+t?=
 =?us-ascii?Q?Lca+o/aPuc566gSDj42KPQGIdxoqfiT50DTxl5Mt5wq8LMHGS4DR5MjT69R8?=
 =?us-ascii?Q?XhytYqqOHFk+nEikxCZNQGap1ZlspK/Af6216W4D8Lpi2gAL1YOENfMYgGXR?=
 =?us-ascii?Q?WO1YJDR61BA9mlH69JcJ1cQzipZSuqgcdCYPOY5w?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82eedaa0-02cd-4695-be4f-08dcc25f0f78
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5724.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 04:01:11.9277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1ZufoXMYNoMCSM09Gx1vWAKTxkeiMV4Pv5GDCEfYduLMSfqsLa4Ci48DiMSrLct86KV0NFtBTttcFpfUMeo/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7237
X-Mailman-Approved-At: Thu, 22 Aug 2024 07:15:39 +0000
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

Fix the assignment for i2c_speed_in_khz_hdcp.

Fixex: commit b15cde19c32d ("drm/amd/display:
 Add i2c speed arbitration for dc_i2c and hdcp_i2c")
Signed-off-by: Yuesong Li <liyuesong@vivo.com>
---
 .../gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
index 53a5f4cb648c..ea69cd36f714 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
@@ -1069,7 +1069,7 @@ static bool dce100_resource_construct(
 	pool->base.timing_generator_count = pool->base.res_cap->num_timing_generator;
 	dc->caps.max_downscale_ratio = 200;
 	dc->caps.i2c_speed_in_khz = 40;
-	dc->caps.i2c_speed_in_khz = 40;
+	dc->caps.i2c_speed_in_khz_hdcp = 40;
 	dc->caps.max_cursor_size = 128;
 	dc->caps.min_horizontal_blanking_period = 80;
 	dc->caps.dual_link_dvi = true;
-- 
2.34.1

