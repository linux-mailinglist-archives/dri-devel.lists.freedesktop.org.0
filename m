Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B5F8D398B
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3C110E6D6;
	Wed, 29 May 2024 14:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="D2Tq/dpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2110.outbound.protection.outlook.com [40.107.6.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A62310E6D6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pq7zdX+twPPtFTIhIQHdJNEskGFK5MYWSs4bahRWRUiGvbz/0aepZbBiujFVCESgfQG7D9/7ls63PWEDVm3/iIs4tfE+PyofPlTnl0s8VMg+e4V09wsJ//yG6E7eKr+GuP2MPmbX3GTl/2vankbcf7QuqJTljbHgylqXv61eZPCR2U70Cg/e6/gezVAW9/4X7xA7Fyipo5nsRqKRyyX39NoDurrDOedcZJ7VOLReJPLR1/jNieGWvhS7QrsTBpfN/TDSpIuqYYHIk1CmctWXSdT9n4s0v9jGhV3/sylyPsTCmVFpo1HuSQ4u15WjhZR5DcgbBI34FsRvPpKryvOCfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rz96EoX3AtRpsKGrGsztEfVQHGHCJDm1xT1qRaefvVU=;
 b=D94bJiqPkqzBzutsNIOzMDmecf6IBPLy1DfeIYNjgjHvMGnkYOBVQFY4cbqklWNiLt2m0TIIlLSnl8zXVW/YVabZXwJcEJPo8MN4k3v6XEONknYUyHH4rk9EhCx3RO1kKMNLW/zgaS57m9hbFO8GDmibYyATF4OQP/zo4nfO1hL3sUHFzmPZbOxOWCrRLtR7V6lCu1bSXOXktIS+F1ZjqOFrAjhq4mUIovYB0QsEynCJ9eWmZUXHT/9yWRYf7RR8XqSkU3DRDaMk5w/yHd7rPgOWOJl89P5twmKHrtvJbXXVV2TrZikCDoHSQhHo6H73BubKRAwAdijF303Wrvp+Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rz96EoX3AtRpsKGrGsztEfVQHGHCJDm1xT1qRaefvVU=;
 b=D2Tq/dpj1kDfh5oZSM4pSpxZXEvU9xnkwlls5q+OHFX4YBMuZGuOULFd7v8I5PzUz1FZ85edeVHZY4uQrnGqCIDyDJ8RjKOxMrqulha+IYGHNn8IO9Tvse8DfeCxBXIMhYCsAM/frLH6uT9hjnatumdT1lX7SblRwL6DyKWPErY=
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
Date: Wed, 29 May 2024 16:42:46 +0200
Subject: [PATCH v2 2/3] drm/panel: sitronix-st7789v: tweak timing for
 jt240mhqs_hwt_ek_e3 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v2-2-e4821802443d@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716993775; l=1092;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=SgQKKk8DdC1+p6jCLboYf/sQyhl/ChKYXh4hBSZ9y1o=;
 b=/8bLHVR8252DmgbPFg+iU43MDibu9RDFfzZ04uGHySktBuXsKvMjt8SqlSttpZHiciJKkuJdl
 +LUIJDt7jCnAsNb4gXmPeVXtLClofgzMN+xOaAROPiQghls494/oFXP
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::8) To DBBPR08MB4539.eurprd08.prod.outlook.com
 (2603:10a6:10:cf::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR08MB4539:EE_|PAWPR08MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: feb0da7e-66d7-4625-54b2-08dc7feda196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|1800799015|52116005|376005|7416005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkM4S3hIM1NBOHpac0dNUWxTTFMxQXYzYVg3ZkhMSzBpRmpFaFJnQ1JUZllW?=
 =?utf-8?B?bWQ0VjQyK0dyekx4WFRFak55ZDJjdVFoWGUyMmZFSGpubG1jTFNTRzFkbVdK?=
 =?utf-8?B?Mm5UZVVsL1hhc09nMGc1ODdCeUxMaVBUWGZia0JIRjhJc3Fwc21ZN05rWnhI?=
 =?utf-8?B?SXhmeHVoMWxzNDQ4ZnVmRWVTUjVXbjFPekIzR3lOYmd4QzN0MURuMzE0VkRU?=
 =?utf-8?B?MXVxMHpvWXRZM0gwZ2FnMlloenlqWW80VThmcXpsR25Oa3FOUTV0NktYazNV?=
 =?utf-8?B?YlQ1bit2QisrWm04VUo2R0tBUjNGQm85TlVQdEVBcDV0ajNCeENYV1FXN0Fl?=
 =?utf-8?B?MDAyYnIySnYxKzErTTFjOUNDU2IwOW5JNHdvN3NSRWpOUEdjcVdlaFhQc1JP?=
 =?utf-8?B?UnpmM0VNcWxWY2pVcmlFSXo5SGNEQlc5OUkwbU1iWk9xMWg1UUVoczBtY1Iy?=
 =?utf-8?B?c216RlRoVDFOV1A4Uk9XaHNvTWJUTk1CNnBTaGRra05YT1RnRjhYT2JOeWhB?=
 =?utf-8?B?UG00V3NXVi9HQk9md0VTL3F6K3g4UVd4UytaWFhPWEZxU0MzMGg1bGhhaVR2?=
 =?utf-8?B?ZkhuaDljUjdxVHR1dDExYUFOQUZ2YUlXSzg1QisxZERJTVNmdDNESGNXalJB?=
 =?utf-8?B?LzEzbllKRGdZenFzVUJHajJvak10dXJrNTlad0ZoaW9ZTWpyQUtVRnJuVkFt?=
 =?utf-8?B?cXkrNjNxUVVPYnFKQ05VTHdwMWFscVVhbURMUVRlQWZ1aWpsdXhzMjMvMFh3?=
 =?utf-8?B?VXlOYSs5QlJRYkFrK0dUck5FRWM0RHRyWlJ0WFlId2IrVEdFSFJGQ3JaZGY1?=
 =?utf-8?B?MThycG9xbVI5QlcwenBpSTlYbi9ON0xndG4rcjk3WXBITnRPN1NFRFFQbVRG?=
 =?utf-8?B?a0pYM2RaWlI3TUhOdDZnbWgybUd6WC9ENkw4citZVWd3ck8rUTFzeXNMemV4?=
 =?utf-8?B?czF2Rll3SXlnQ1Bnc3QzSXFHWlNBaWVGcVJobmFabHM1N2JRcDc2Q00yQWZL?=
 =?utf-8?B?bTRzVGw0OHR2S2VORTYxY28wcHdsUnEyRkJkTTBUdHM1ZmMwUktoVjJ5V3Ro?=
 =?utf-8?B?Ylh2SFJkT09HY1J1OTM0L0V4RkEzQ055NFNWZmJkQmM4ME81MnY1dkcwMWVX?=
 =?utf-8?B?a05TYTM3cHVMWE1GdkJyS1k1Ym9XWGQwbFNQbUlnWnk1K0I1bGpQY2hkK3Mx?=
 =?utf-8?B?TFo2ckNkLzZ6WGtqaDhiU1RvUjhaSkJsQ2dVRFczOXJrR3I3WDEvK0R0SUtC?=
 =?utf-8?B?bllpZDVpeFRZQkxUMG8xMko0THZHRWZCdXBCN0p2QnZMVXdJNzRsUG1qdXln?=
 =?utf-8?B?NmpXTHJ6bWFMcmxtUjA3VElCeE5KK2U1cm0veldIazFsaDJhcFBuYWc1R2px?=
 =?utf-8?B?UVRDYjBiMmpacHVQcXRmbUJNaUFhTkJ3L0dFSkswOEJNNlFjZ1o3eGRpUjBm?=
 =?utf-8?B?dTNBeXlTU1FDM2FaSFEzWUJWUE9HbkdUUDd0TmJodjVSK0FJWW5GYVJVNU52?=
 =?utf-8?B?VWU2VjlDS2xNeFloazdkNURzK1dWNlYvN3dkT2xSaTM5YzNQRGpET1ZrS05p?=
 =?utf-8?B?Mm8zK01pU1FmVzVEeEYrZU0vWnhLZ0dPdllRWGI0Vmk4UkhkTThGVnh4dmhR?=
 =?utf-8?B?OWx6eEowcWtweWZSalRRTEVTQitqQk1lUjg2OEFBeDB4eUpleTFhNXowWll1?=
 =?utf-8?B?cnFOcVJnZ3EwL1ZTcWV5amI3bFYyVFkvRnZzanlUSk5EVnlidGRYNG1aVjZx?=
 =?utf-8?B?ODNMYzZycnRyREM4MkdtZm9vR25FL1VWcjZISUxsakxrOUJTNjFUN25zTE54?=
 =?utf-8?B?SFJySVMvS0N0cTQxcndsZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR08MB4539.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(52116005)(376005)(7416005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0pya3ZwYVEwZ1VVNzRvSnIrWUdUN01TcmJKWG9ycUcyNTh5ZnI3ODlxYTBQ?=
 =?utf-8?B?OEVValp1UGw0N09DT2Uyajc0RDVFT3I5SUNJOVN0RlQxeDhDb1p2ZThGWHpa?=
 =?utf-8?B?RDlMM0pDYm1XT29BckZnc3hrY3llRTZFcXd6anBoNWZSU0E5TFgzMVNZUzFW?=
 =?utf-8?B?UEFkeGhiT0doUGxmd1ZuSXllRjFqQ1dyTEhKa0FHVFkvckJGTjBpT2JrZXc0?=
 =?utf-8?B?dU1EVDZ4eC93UFdiNFFYYTh6N3FnVlBuOTFSUXU4QmR3WEYzTnVDbE1HY1d4?=
 =?utf-8?B?TXlWMXNCemtEeGp5UCtyNzA4bVF3R2ZRaGxtT3ZIWUdTMmJaLzFRN0U1c0hC?=
 =?utf-8?B?eFJkYmhFMnNGalc5MWFpUEo5R1BaRURmbmxtME9yY3E5eEJZZ2dkN0RaM1hj?=
 =?utf-8?B?M0YzaFlwT2YxZlMwdXAxYVkydXF0WjI1UHMyLzBLZXRreGlwTDFXN1pOWjZQ?=
 =?utf-8?B?WURQbVNOM2hkaktrUUZBSmNDNkhVV2J0a0h6QmNiTldMMm50dWFFR1lDcVlx?=
 =?utf-8?B?bTJpY1pFYUhRZ0g3YnF3b1Z4ajRuU3kzZzBkMk5MVHJmNmNXTDdidHM2akNN?=
 =?utf-8?B?OU1FSFcwQ2g5SXNSNFFMVkF1U1VOaUNKdHBKanJ3emdPY29WOGlKaFA2RFJX?=
 =?utf-8?B?cVd5aGNuazdCenR6K0d3eWRqdmVYRWF1VHhjelRxMGZLS1UzcUZvVGdtUHd0?=
 =?utf-8?B?amdYNnBwdGx4MmxkWXNWRFpEQTJTWStIQ2paSHhUTDJsNHppWnBaR2JmUG03?=
 =?utf-8?B?NlQ1U1E3YkJHRnJGbnBwNWpQbnIxV1lFcCtkZTk4MVBlOFgwZG01OEZaKzRa?=
 =?utf-8?B?WXFVVVMyL3UzMzB2dXFKYjczTFdlVW95VDAySXBodjA2V2xnV255WWlxNkpP?=
 =?utf-8?B?TVE0eHB4eUUzSE5Bc3YxT2t2ZHpRZEtOZ3RpbVppaG5DTHhEN3NHOHhzUENV?=
 =?utf-8?B?OWRYUFRNaXBPZlVRN1QvUGdKaTN4OG4rMG1QdjhDY21PVms0WndsRVdoU3Vh?=
 =?utf-8?B?ekxqVDRMU0p3MjV6bldHdDBqZWZCc2tXV29SdzBxZzZGMWlLK0lZWEFrcFkx?=
 =?utf-8?B?V3AxRCsyNk5IdDF3d0dNakp1MHNiS3ZxUC9zQ05QT3N0VnA4eUdRcEtEZVVM?=
 =?utf-8?B?ZHI0ZG1LMWxMSitRTjhGdkQyUzZLQmUzeGpiTmY1cDFpd3QycW5yanY1U082?=
 =?utf-8?B?Sm1CQ1lDMlU0eUJaM0hJWERXbUtlZlYxYkcxY0RVUHdZUFhzbGIzZGVIMkph?=
 =?utf-8?B?ZG00QU9oendjbzZEaHVTMkkxcmorMm0wVTI3NTJuTmJzdkJlbVg0dzFHdFJr?=
 =?utf-8?B?QVVxUnpwdXF3R283RC9PQW1yU0JZTUNEcTduZFlCRnVrY055MlVWOVhBRXFC?=
 =?utf-8?B?ZCsvU2thcnpzckY3TjBEWmoxYzladk9PWFVvVDdhdThpWE5KQkRMZnFRR2FE?=
 =?utf-8?B?YUdCcldDTzV3SVJTV0U0ckk1VjN2aUVmaU9uNDZQTFkrRXI0bm5wcm9lMHVp?=
 =?utf-8?B?WDBDS1JIQy84TlZ2ejhaNStjb25lOCtOM0JwVDRXbEwzN0lCZTFwcWgrOHFW?=
 =?utf-8?B?RVZzd29NNjhxdFVvRUxyRC96djJiS3pFWGlQbUtHaWp3Yi9TVktsUjgvUzlN?=
 =?utf-8?B?U1FVeGpvZmdSWXczVmMwYnlMQk95dVQ1elJwYnJnUW0wbXRKdWltTnc4VTFF?=
 =?utf-8?B?bU5vNm5JZGV6V2FLcXRwYTZkSlhuQzdBMDlzajRIR0srejFnM09mM211blpG?=
 =?utf-8?B?bWVRbW15YTlDMFlJdC85cWFxdVFPV1VWQXRMdXcwWStlZ08xQmw5ZzlGUGJB?=
 =?utf-8?B?Y0NvaFY1b29qL3FxMUxsMFNnbDdOSnlDMXJTNmVQcWJuWExIdGczaUxNT2V6?=
 =?utf-8?B?ZGhjcWZiU0FyazQyWUNyKzRBZlcrbXpMdzhvZFU1WUVDS3p4cllsZlB0OFdN?=
 =?utf-8?B?QzJ1TlF3TC9scFhQbG9tbDRSZXRsSlBHWC9LTlhEeDczdnRRTWNLRGQ2T1NU?=
 =?utf-8?B?K2FlaWpRWGhUeGhvYlFhOW01SlEwQWpjYlpsUm01aTY4aW53UTlMSDRyU0s3?=
 =?utf-8?B?Q3dTdmZEdDllS0tJWk1WN29ZTjdzSE9ZRTVxZGZEWFpyb3N3OS9TZmNqOTBU?=
 =?utf-8?B?cGhLWCtIc2hLdExTa1cwVHcraU15OWdBb2dIZUZSZHYwRlhZc1dVaEludVpW?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: feb0da7e-66d7-4625-54b2-08dc7feda196
X-MS-Exchange-CrossTenant-AuthSource: DBBPR08MB4539.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 14:42:57.5566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qeLc3tqj/63rLraYtDFlf1fjhhahTX+VLh3lZFcNCaGyDjm8JFI8rl1SjUi/EQhlohuGf6CE1DzFcNW5+7i5MT9y1kCM/CTJA/B1wHt4Cc=
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

Use the default timing parameters to get a refresh rate of about 60 Hz for
a clock of 6 MHz.

Fixes: 0fbbe96bfa08 ("drm/panel: sitronix-st7789v: add jasonic jt240mhqs-hwt-ek-e3 support")
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 32e5c0348038..c7e3f1280404 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -282,9 +282,9 @@ static const struct drm_display_mode et028013dma_mode = {
 static const struct drm_display_mode jt240mhqs_hwt_ek_e3_mode = {
 	.clock = 6000,
 	.hdisplay = 240,
-	.hsync_start = 240 + 28,
-	.hsync_end = 240 + 28 + 10,
-	.htotal = 240 + 28 + 10 + 10,
+	.hsync_start = 240 + 38,
+	.hsync_end = 240 + 38 + 10,
+	.htotal = 240 + 38 + 10 + 10,
 	.vdisplay = 280,
 	.vsync_start = 280 + 48,
 	.vsync_end = 280 + 48 + 4,

-- 
2.37.2

