Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013518D398A
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FAF10E256;
	Wed, 29 May 2024 14:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="PzWMMjZ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2110.outbound.protection.outlook.com [40.107.6.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541DC10E256
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5vzIfepgKrDnrpFIwiauRPG5WVChVV3TNrflffyR9/QeHzAauD6EalQzF0meb61Hw4A2EIGY3XB7kzoaMW5kFMLAxyj7YSntkGYJ8qvZMmjvPCLwuHvSU/Id+x3t0FJAMYvOM3t4fhH+i2IG/mKnL4SnDSxvv7PZm1eQFaNjqpFKNB1/0fh6uMXEINPdyedNQ79Uvrp8B0fHd3LZ90N6R2jTVFBbvA2bNJ3vkxyMF2dIZz2wySrAsMEtdMOuZbRCyYg8PfitOV44mLcXvKf7YWCjVuttcojjXJU/KzNIEE3yFvxW8gunBNfXVs+2xYwYirtL3ms7VbgkygT+WUouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFLN16rbMei/ARYjppmD19RVvwLkLMBzA2SSGpUdiyM=;
 b=glG+32I205Sv3s2TOB/C4I8HW3h4G+f1EPeRMawTNbGPsp2mbFPfLIfEvUAO1dlHtSdNrQpoRm4N0izbo26tVvNv5xitmP/icTdUSN1BVX556XF7bDxZdjqtjokOwZk7i1kXU7cdy/gsVPYDh5v3a3Z9PKDKIKOHFriFpIPWqA5WiMdh6jwIZ7UTU8QQv+1cWA04bmyXRYhIdJosxfRGiFA8skeOViz3U2btaXwYcUwNiPN2/fnzfwQx93+cK90QSx092dJ2I2WByOZ9PkZTHwzmwOPrkRk7Q9RY2AeAGd+FzFejAnpVik3ShbjzpvO4SK8nC/+jmBXjOF67bJcaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFLN16rbMei/ARYjppmD19RVvwLkLMBzA2SSGpUdiyM=;
 b=PzWMMjZ50HJveeKZsG9jOUE4g4VekIY9bkmoChcqMvGq/qNuoehlJhktLA8SgXHo+bnq81t9wk2RKUp4zj+WCyWL/bgg0LD2Plui52iV9+kv/OvBw0Mg6XTqGzJ7WoWzmV2NZsdKkarYodedBy50uP+DxQ+eh8cplS1nKyypVUw=
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
Date: Wed, 29 May 2024 16:42:45 +0200
Subject: [PATCH v2 1/3] drm/panel: sitronix-st7789v: fix timing for
 jt240mhqs_hwt_ek_e3 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v2-1-e4821802443d@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716993775; l=1203;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=Ni3NZZMXDiMmmTwQrRp2umE4cg4nnvgn57o04ZIw/hI=;
 b=tNT2p8Hl5PVQPrAcudC+38KcTnepDMQ82UWbPB/1QK1FnZnsTvb9r5EZ3Xq9xiuFcOUvw5STi
 LItTYgNnQDkBktjdFWS1SJbxjsloVAgiRoDasonrjxkD5dJLYix88fI
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::8) To DBBPR08MB4539.eurprd08.prod.outlook.com
 (2603:10a6:10:cf::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR08MB4539:EE_|PAWPR08MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: f57a71c1-6784-4620-2d3e-08dc7feda126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|1800799015|52116005|376005|7416005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3FPNGdTME9Jakc4SEU4VDluc1ZGeWtPaytvN1ltOTBJSUUyekJQNldUMlcv?=
 =?utf-8?B?TkRTNUVoSUVZV0J5NUdYT0xseHdRNDEvUHJUNk0yWGhOZXNldDQ4c0dnNEJw?=
 =?utf-8?B?TXBtRjlEdVNoLzJiNXBwT3dGQUVsRk0vQlUrMm1jYzBQWVpsakdaK0dZTDVV?=
 =?utf-8?B?QWE2bDhRb05yVGtNV0o4ckIzUkJsNE5OdWtkNmFSNFhkZHVqT0g3QzVsRmlF?=
 =?utf-8?B?dkpkemNoQjUxeFRUNzNDWnM3MzBpRVZJUUdTVlBwOGpXUVdqOGJ3bzhza1dT?=
 =?utf-8?B?SDNaS1JPZllrcDF2RldrOENjVjc2R01WTWIwK0RBbUdpYkhINmpvZlhpcGVh?=
 =?utf-8?B?cExJSWJXME94N21uTTlSZjViUWxRRnFVWFBZMEVIbEVHMEY4S3NGTE5oeVN5?=
 =?utf-8?B?Q0hMZFg0WmprM0xyRmcvSHRwbVhvVkN4WFFBa1NKdzVHanBlZFRqcVAzanVz?=
 =?utf-8?B?NGM4ZlRLamdxUk9malViRXQzVjZMZDA3aHJDdldxV0xTeWdydkpsVW4vUGFp?=
 =?utf-8?B?bnFZTHdITms4aXBZNHZpKzVzTktzTmJiaUg2KzRGNlVxZmhsNFh2QitQZ3BG?=
 =?utf-8?B?L1p4aHBXLzRjWmF2RVJxWjgyYWRvdDV1VEQ4UjNwSjRMU1ZUUEFmN3hBMFZk?=
 =?utf-8?B?SlQySFNyR2VEeUpwQVg2OEN4QWI1TUNxMGVGRDlxWVdaYlVUeG5mOHIvN2dk?=
 =?utf-8?B?MkFKSkt2OTQ3YTgvZjFsREhFSkFtU3YyZUJOUmR5RkxPOTM1SlVzSXpHWGly?=
 =?utf-8?B?NndpUHdKd0ljNE1NOTIyL2hOR3NhbEZCM3YxOGtpejd2TXd2elJtUmkzTitQ?=
 =?utf-8?B?M1FodXR4Ni84SEdJN2s5c3c3Rm1KaXJhYVJHMXR3WHhzc0w5K0oyQ09YUWQ2?=
 =?utf-8?B?ZXJOQlQ2YlpnazhLS05XKzRwdFBpOXNxZjZ2WFpCM1NueXlxK0F5azhldTB5?=
 =?utf-8?B?NlhBb1lMUXIxVERYV0dLeThISjd4NVJIQjNwcFY2bDJuUCt0b2d6Q0tRZmlm?=
 =?utf-8?B?VTg3eStoc0FhN21CVC9DZWFFbG9TWVJCM091N3g2M01ZSGRMSHNlU0VPc1BL?=
 =?utf-8?B?WnVCTGl6dTdBbnhROWpjOVBEUUFxUWQwdFV4Y1pTc3ZBeXhWSFgxSlJwZDZY?=
 =?utf-8?B?Z2FDdk5oMHZlNG8vNWd5cys2UEc4QjZUMVlvYXVBQ25HN2tPa0loQzhJaGZh?=
 =?utf-8?B?dFlKMDhzcjNMbk1TdlVKNTd1MUNvZ0M3TCsxV2d1ek5GQnY2OU92TFBHTUpX?=
 =?utf-8?B?NGtqb0FIems5bzBtRStjcCtBa0lkZElOQ2RwQm5PZmJqN3JCWW9PNVZXL2VW?=
 =?utf-8?B?dG1rcm1Nb1JZOHd5SU91Rk95VUV4UEp1WlY3dWIxa0Q5TGxPWWFrSlNCdVZv?=
 =?utf-8?B?SjREZVdCUU10VytKcnp6cTVLVmtDcEorTmpPY0o5TFQ5RHhUeTRyb0ZsWlhq?=
 =?utf-8?B?NnljekNKaWhNZVc4MGJpanNoc0tjUzlURkdFYmN6dEJzNVI5TU9NclAvRTdk?=
 =?utf-8?B?ei85c3RiemV2akpXa3VvK2daYk9IcHVuQjdLY0w2TE1FVmp2UWQvanN4c0tQ?=
 =?utf-8?B?RlE4b0NKRjIyOG1xVVk5bkRrTUVUSTJzSmFjVnVmQnBYQmdLOHllQTM5U05J?=
 =?utf-8?B?RmNTOS9TbFhQUERzODlDVTRCemdsSHk1NGJyQUo4T2R4aXhPSjVzVDA4R1Ex?=
 =?utf-8?B?R01YTGd6TVdVNlBTSXlocEpaK2JmUm5wM2pzbTAvWUpSRkp0cGdiQjlrZ01a?=
 =?utf-8?B?UWhoU041Rjgxak1NQXFXOHNQTVc0TnNsY3FqMUhiSEJuWFRPWVMvamRad1dH?=
 =?utf-8?B?MDIzWk1kem45MlZlOVlWdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR08MB4539.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(52116005)(376005)(7416005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cS9lN3c1MFc4L0QxcFVPYXBuaDBzd0xZTGVCMGJzdXFrSjA3NHFHa29KNzhS?=
 =?utf-8?B?WU9zcUx4U2J3QjU5bGZlRjRoUWFXb2c3cTRDdE5samJjMTNQQitUYUR3OVUz?=
 =?utf-8?B?a0YyQTJJMVpydENkMVZ6WGhNRTlrK3BnQ1YyMGxNeGlqSENBeW5FdWRqNTJT?=
 =?utf-8?B?Si83cnBiVHlrNnpRZkxLa3F5a3BYeCtFcGJlWnVaak9VT3c0SlhPYit3R0Ux?=
 =?utf-8?B?WUxRS1FsWUM0WisveFo3V3BJTUh5dGIvOXA0dk0wRnJsUzdEeE5RUTJhMVI5?=
 =?utf-8?B?K3FscGtaZHZJTTUyZkdJa0tVTFk2K0srNDdQdTYwZEtkb0pvQmFoeVlXZHlx?=
 =?utf-8?B?dnRiaEVtVTJTNGZQKzJMSkM5L3VUVERFaU5iSUs5b3JvdFU1NTdrNFhWV0ds?=
 =?utf-8?B?SEZzZDRRZGlhS1kwTk5SRHlrWWt4ZlBjMXpFcWRod0JjbWJjaU4xeUx3Zys3?=
 =?utf-8?B?MU12NUsyM3Ard2VZb3VCZjA2M0pJeXROeXVqcGFac1NhS3BqS0NmOWlXNVhw?=
 =?utf-8?B?QVNnb0plRHovU3g2bnRMWmVrLzVZalEwUnUzcWczWW8rajM1clhIODVFMGlX?=
 =?utf-8?B?UTh4TTBFWm1FMFRockVMbS9wWG5CN2ZCdXZBV2Q2eEJ3bXVwRDF1VkttSlZI?=
 =?utf-8?B?SzVDZ0x3WnJwRFRKRHVJa1RCN2V0ZEhWeDJSdFQ3d1YyOFBvSjlZekx2d0Y5?=
 =?utf-8?B?eGhCdGl1b1Q0azNxbWxxTHhYYUZWUUx1NTZpK2hRVnp0ODh2c0JZSm9aQ2p6?=
 =?utf-8?B?ZTd1RG9Cdjl1NnhoTVpaKzdjbFcxUFdyTi9hTjQxZ0hkL3BtUklIMEpuRnFQ?=
 =?utf-8?B?dWIya1Q0aktCK3ZtaVVtNDRPTnA5cStOa3NiRGx0bmgxM0V3V25kR0crOTlH?=
 =?utf-8?B?L1hGL2V2bTJTSENBZ3JCQnhYUkxMRzVlL0tMdjhnM2dJM2lhanEvdERLKzV4?=
 =?utf-8?B?RXlFaGZ3WGVqRVFtTHEvQU8zTGg2WDF2QXl1QWc2SHNTbHRCTTgrN2xLNFdY?=
 =?utf-8?B?MGdTUW1PaGlSNmxzR1ZqMDVxcllVTldzUlFQckdmWjUrbGRkNzFsL3B3T0RS?=
 =?utf-8?B?TUR3V2VHS1FDOXVlWFdoOHZaQ2Z3eWY3VS9ieEhRRnBLaGwrMFhlU1dOeEpx?=
 =?utf-8?B?UnUzUlpVWm1NaHF5T083cUhJMlBWdmwvNHN4KzllZk50Qk9DelRTUGFRV2hz?=
 =?utf-8?B?andPSGMvS01zbVpGWTFpRW9xeTBSNEZHNnpsOEFQaDJaOVVnb2lhbm5aUEdr?=
 =?utf-8?B?UzBQUzBEbVFIYzZjdU1mL095aEVLYVl5WnJSOFY0NTU3SVJWR1pYNGlIcmNX?=
 =?utf-8?B?Zi9oWkpnamdIWTA0Z2l1VU4xMnJtVE9zRWtEOTk4ME80OTVTS3orQ2k5ZDhT?=
 =?utf-8?B?aTFNakc0SVhpdWt6U2l3a2wyUmFGbnVrVXhSYjlybW9aWlByTUsxMlNpVTA2?=
 =?utf-8?B?Y3NJSkt3bmdvM3RMZGkxV3FtY0YxRDBUbnFrUWFjMjQ1Nkw2R2FWWFVhMHVW?=
 =?utf-8?B?NnFWWjdXSDdqT0xsZ3RKN2RYeit1UGlVRnFmV0U1bUhOTDNYdFI4SFlLYlBs?=
 =?utf-8?B?RjFRdTFQUTE2T001Y2NFRnFUbTJnSTFiRXRwN3FuZjJOV0Ewem85a25pajF6?=
 =?utf-8?B?ZDBUUmFpWGYrL0xNYnJXZnlsNXdyTE44TE4zNlJlVVZTK2xITlh0MTVIZXN2?=
 =?utf-8?B?TENhd0ZFeVZhSEd0THZqdXpoRzlZekVrMmw4N1FvWlFGMEFOcHNnWkVYcUQ2?=
 =?utf-8?B?Z3RZek5XbFAzQ1VuUmoxb0tobWh4TWpqb0c4d1BrN21xaTBwdzl2QlBaQVNw?=
 =?utf-8?B?ZEJpSEF6MzZiZnVDWWRUblRpd2RQMjlOT0tVdU44RTE3MERUR2REV1BpcnJB?=
 =?utf-8?B?L2xXSkJvWDlDUUUxeFJvLzlPSDE4cXRkQU9RVE1jejVYKy8waTQ4NWRrNjVS?=
 =?utf-8?B?SDhLYkRZTnM2M3FCUkMwUGxGVEI4RXdsbS9qQ3o1R0lDcnhGYk01c2pwdlAz?=
 =?utf-8?B?dlB1b3UzcGh3TE5LT09ZaE1SR3JKZjlsZXgzL0dlTFlmSVlQWElkZUNnUjhi?=
 =?utf-8?B?M1JlMi93YWxOR0NnWTcrK01SNkI2dmZ2SmRJNXVkd3RwSlcwZFlESlVJK1Rv?=
 =?utf-8?B?ZGFPS3B6RU4vZnBqUmdyTTVkdDY0UXJMMHBoWjJtT1JqSXNzZWZqWUdPMjFS?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f57a71c1-6784-4620-2d3e-08dc7feda126
X-MS-Exchange-CrossTenant-AuthSource: DBBPR08MB4539.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 14:42:56.8135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4Yx/ReX7Ur1vKGPNUJSgb1GYaK/2TqprVU13NfQimCaDm1+sYXmNQuaSAJM5MWh5HeFvirWlkpzrCa9U4oVptzu+ucgZfDQjGOOhSKHuDQ=
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

Flickering was observed when using partial mode. Moving the vsync to the
same position as used by the default sitronix-st7789v timing resolves this
issue.

Fixes: 0fbbe96bfa08 ("drm/panel: sitronix-st7789v: add jasonic jt240mhqs-hwt-ek-e3 support")
Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 88e80fe98112..32e5c0348038 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -286,9 +286,9 @@ static const struct drm_display_mode jt240mhqs_hwt_ek_e3_mode = {
 	.hsync_end = 240 + 28 + 10,
 	.htotal = 240 + 28 + 10 + 10,
 	.vdisplay = 280,
-	.vsync_start = 280 + 8,
-	.vsync_end = 280 + 8 + 4,
-	.vtotal = 280 + 8 + 4 + 4,
+	.vsync_start = 280 + 48,
+	.vsync_end = 280 + 48 + 4,
+	.vtotal = 280 + 48 + 4 + 4,
 	.width_mm = 43,
 	.height_mm = 37,
 	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,

-- 
2.37.2

