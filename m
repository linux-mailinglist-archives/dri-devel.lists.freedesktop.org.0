Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6928D164E
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 10:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2175810E9A1;
	Tue, 28 May 2024 08:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="SEXon7Bo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2090.outbound.protection.outlook.com [40.107.21.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0663110E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 08:33:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nszr/HByaee+mOWP+w78gJlcVwFuXIxtlELU1Ts2mjbJxCgsQgFtd0aAuhLngkBk9LXxv4/LFPjJSoxKvkg8p8nPYph9dqWuy1uPxM0nfK/aWk8OZ1nykk+0dzc74bck0Kex4wmq5hRfQlSXSpLS9sVddoEp/XP0l+lf0uUHI0rt9StAmyUXvfEn/kt5hskw26roPAvKvVAcU9sp0URZ2aOLFh1s+GswdALDYgyawMQASAjtVBLuIzN86++2oGa1DRSBmBKms3hBWEMc+uI68rwHnAjYVMBNt7PtzNPj7qN42OmIH4GkaZYz2yDSXo5yjApVZEBltObPsOoJAgnYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxAKihY49H3Kks6+DXRKr+2SGOCPjqQwuEUbKZZuLAw=;
 b=XEsDmUfkYP16t96XCuhQadwudZRKDDInetYTsHvMXSjXs6RS6xKxB9nGk8+ay/wNdip1WCLKIpYzQ7zim+IFQpTHyla+NIaTtHRsFLD/bUWNpXO7/N6Kgz6zlDHNrEHt6pTASH/bDMDsm3Zp5Mpw/EAv6IJl8ijhRKj5hElGInuIirZoeiiS+sQsUHK80ZsQbtBLOyV8E4fzNZEnqg9+d6sbj4OvCysD+LnFsGnwLsVOcG2E41WCZsYVF4BdRKVTENvGp9jd2wwXME3R9rwbFThW914q4hu7SDVIIbiA3xyP3Znrv6zWeUX+FjEO5yLGs55GqW9JD8wiB/fJdHGeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxAKihY49H3Kks6+DXRKr+2SGOCPjqQwuEUbKZZuLAw=;
 b=SEXon7Bo5Fesc4JBua8WHBWZlhoyLNg5IRYLoOxHZaRdc9NDt8xP8wMOcN098JLryI514DXCtf8WWAG5bPuR6ZfEqe8igeCvOeK2HY+Qx7bS5velx6mjw5nk2/aZE/0pC/sFECOCYABzQfCuo4h7t+x79tWxx6x/gUT80xD17PI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by PAVPR08MB9745.eurprd08.prod.outlook.com (2603:10a6:102:31c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 08:33:39 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::1f7f:ed46:6440:8b38]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::1f7f:ed46:6440:8b38%4]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 08:33:39 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Tue, 28 May 2024 10:32:56 +0200
Subject: [PATCH RESEND 3/3] drm/panel: sitronix-st7789v: fix display size
 for jt240mhqs_hwt_ek_e3 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-3-f8351d4a8d4b@wolfvision.net>
References: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-0-f8351d4a8d4b@wolfvision.net>
In-Reply-To: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-0-f8351d4a8d4b@wolfvision.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716885217; l=842;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=bdIWmQucm8z4VwgndE/yc9OVYLz1IUf332wwrfsmXR0=;
 b=sz3cX9xv/S6qM4sx0LQ2VbLRRVE4CSlNW5IRaufJdMdKS6gKrCncn3uzxTuZvLpeS/0xM2zvw
 ZLl+pKCV2u4DKJpZX+bTQDq5ktz3m+gFyRA1wSMIgR2vHVavnJP/0tW
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1PR08CA0251.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::24) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|PAVPR08MB9745:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a42871-4c6a-4e94-6397-08dc7ef0dfb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|376005|366007|1800799015|52116005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3g4OGcyMmxUM2RSd2JwcTFWZVlENE9pT0tOc3E1K21iVmdtTmtFbFJsSjRs?=
 =?utf-8?B?cHlNYUlYQS8yR2ZEZTFiSXF4Y3Q5MDhUbG9EU0tHNlBlbENUSnF3THdna3hB?=
 =?utf-8?B?R1FnRHpSRkRQc1ZVS2dLMitIWnRGb2pYQmE1Rk90d3p0Uk1EYnd4bUljZmVF?=
 =?utf-8?B?MkoxN3BISUNjK0NKT0x3YnJHZHpYZjlCRDZwUjJzcjZIemVJbi9tTjdNV3dZ?=
 =?utf-8?B?MXN5MTlzTUFvRDlPL2wrZ29ERHU0T0x3eDZ3THNHcHUxYWd3anFwR2x2c2FS?=
 =?utf-8?B?ZkFTREpHSkxjb00rTkpOMTZjdHFPKzZkVzF6cWZkbzdGVTQzYUp2clRuUjBu?=
 =?utf-8?B?N0w0Q21QVDVucnN6Wk9neE9ZQXFLNFdxbEx1NDR1T2JHbjkyYkR1RzhQa2dh?=
 =?utf-8?B?RFpFSjgxQUpjNnNQWlB2T1BDVXN6OVVCT3NTOUZnNEI5Wlh2V3hncFNRTGVm?=
 =?utf-8?B?QWdVUVhpMkpSRmNGTThMT3RUNkdQbERDQVlBQVdSQW5JcjhXKzBhbG9JOUlo?=
 =?utf-8?B?eVdGa1VJbWo4UnZ4YWNJU0ZHQmNsRmJaTzdEN2tJUUZNUkJnQ2hoZm5DdWRn?=
 =?utf-8?B?TXVuWHFGNWxLaUhHVi94cTQ1bWFRVExFOWluWlUrVDBPWVVSazlTMjNoQ0dt?=
 =?utf-8?B?U2s4b3VCSnBNVXhjUitBZFpEaXkybkJPRDl4SldrdWREY1owZDUvVjBjNDZt?=
 =?utf-8?B?MmpqMGhFN3FPTmFnTE00RGhTb290YzZ0WDlzMDlDdW5VQzVYS2FJL3JpV0JU?=
 =?utf-8?B?Nnk2TjVPRDM2NHFSaklUd2pXcGsyQlNaVWVubDBHOHFnZVlha3dETVFWaEJt?=
 =?utf-8?B?cVJMTWxVK2hLY3VkM1dPaEY2OE5KVGZoTUR5ZmNBbS9qdnAwZlNHQThtRmkr?=
 =?utf-8?B?SEJUUGIzbjQxR1hrV2xBRVBKUVh0UGFmM2JSYlg0UmFoWmhJRHpYQ2RET2tr?=
 =?utf-8?B?SmJnQjhJa0RSY013WG1WSFZhVXpzOW1aMjB4UFFxTkFXZjFEWGJGdm4zZHk3?=
 =?utf-8?B?YVNiNXpPRXNiVENsT0J4QUsvVHZMQ3BkbTZ4d3JwYUg0d2xBY29TZUNOM1Vj?=
 =?utf-8?B?VGZmVXdHQlVPbXZycGw4bGlWa0ZzdGpNdml4UWNoV0xJSGE0TUJ6ajlPOW5N?=
 =?utf-8?B?a0wrSkh4THlpRXp5eVpyVE9MelZ3UG5NaUtvNUdTSVdDVkVoaUVaL0V0Tzlu?=
 =?utf-8?B?ZTdPMG1wMExobGFoZCtITEhtdlE2N1RacC9QazdFMm9wakR5QmFBWUFFN2lV?=
 =?utf-8?B?NXoxeThuaDlWUmFSelRxQncybkJaVkRzdXVDMHVCTSszVkVvOVkvRlNBdkFB?=
 =?utf-8?B?cWQ0VGhaT2huN2g0a2luVm1tSzFFRG1PYjNFemhhd3ZvUzFFc2NYbmp0YzJp?=
 =?utf-8?B?SldQWDdSSU5OUDFWREo3SnlHekNIUHhXcG1GRjlvRlpKNFcwZWRiWklYK1Nw?=
 =?utf-8?B?K0tVRVU1K0VpNmNUb0N0WGpjcVNMdXloaEpSQnE1eERYaDg5K1VyUjI0RURP?=
 =?utf-8?B?dEwxR040b2pXM2prNUt2VHBuL0lRVWJsQkdnck8rU3pEZHRjUzYrVjR3U3Qr?=
 =?utf-8?B?eXNuQUI0S2dhbzZNdkNtRkFweFMreXhlRDh4ckNGeEVYWVkvT25HbHVDbzNX?=
 =?utf-8?B?TUtIcVdjSmRSUjVmc0xsK2FFbStHVVRiOE82WmlBRWQ5TlZvc2tacUJ0NjE3?=
 =?utf-8?B?L0Uza1dtUDcvcjlzUU5OOUl1VnNlalJxc2psS250cFlJa29mWlkyMVF3bHpH?=
 =?utf-8?B?RnowQkdOMTdvSlUzODlZY3NvV3J2ckpDajZlVk9kSUZFby9ISVFaTnpsSUpJ?=
 =?utf-8?B?Y2l5NDRlUmVJdjVDN0oxQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(366007)(1800799015)(52116005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFJxQ3gvTnRMNVBtWk9ES1ZZUVFseUlHbk95ZTFrQkJvejFucFFHQk5BZm80?=
 =?utf-8?B?bjhRcUFxOEN6Wno2OWgrbWIxQ2hsWUwzajlGT1ZlOFlNdnUxMjNsZXY4ZC96?=
 =?utf-8?B?UnZJb3h5WVZlYlo0bitOQm9TUzIyY0hiZ3JnSGNBUkt5bExnTmIyUlVwbnRR?=
 =?utf-8?B?Z1VCeWY3aXZDVENIMFBOK3d1QXdnSmZHRGhNZmE4VUo0VWJpUTdLWXB3OXk2?=
 =?utf-8?B?Y2NoYkRyUS9Ta3Bvd3ZpQnFDZU1NbS9EUmNSaWFVWmgxVzRtWk9yaERCNGNV?=
 =?utf-8?B?VUJBNHJMWmtzbDVFdStScWtzTEV2bGh1WWdwRDIwTThmbE5xTkZhWnMvazJH?=
 =?utf-8?B?b0NzVVNLUGpXb1l5bmIxSysvZll1MmdIZ0dYTms1aGxMK1g5SUovTHdLdHFi?=
 =?utf-8?B?SDRyYlRQYTBpSUQzSkh4b2Rwb2RNNE56blpSM29mU3Z4cWlodm56dERYSHQz?=
 =?utf-8?B?NnlnaytYRDdIYnZIRERYM3Z0ME9OdUhaa2Y5TE54bUJ0R1RyOFRsWUlZR3Fh?=
 =?utf-8?B?cFZ3aGRoOVdqMzhNOFdKWGhsaVd5ZGdTclZoVmFkKzFndXFYK2h4YVZiRjZR?=
 =?utf-8?B?Y0ljSVZCS1lReGo0MndGS2JjN2JLYjJtUTlnd3Fld2pvaG16Y1AyeHRGSGgx?=
 =?utf-8?B?YzBCTkRteS9yd0RJT0hDRnFaZ0llTHppWFc5SUZoSHNHemtkSGVMbndocFhC?=
 =?utf-8?B?QXUyQjlxM1hQOXBGTHJCTFlua0JuMjlZdllURzBWZHJMNmE5SStoVGY3YS93?=
 =?utf-8?B?SWl2UFhJUnJaczF5NUxuN2VvcHE0bU1qRm5LTVcrMFR6S1NNbzAzd0hVYWJF?=
 =?utf-8?B?MGIzd1VSZ1FJeEEzdnJ0c2RZZ3N1cjZVRlpucVY2bzdmakxSSi9GTGRUTzly?=
 =?utf-8?B?cS9Sc2xGOUs5UWtGZ2YzM25wT3JBVnZqVnpWNSt6blk0RTJZZWtjMG5SaXl6?=
 =?utf-8?B?OWhiMGk0WkE0YjU1WktmQnJlNk8yWFBDK0dldHdZSktyV3pIYXlWK2RkM1dG?=
 =?utf-8?B?bXR0b2s1QkNOM3J3TXhQdWtycm1OVnZRSGwyL3VXKzQvV3F3aFBYOEovZFJS?=
 =?utf-8?B?VlhHOGI1UktOTGc1TXdOcWNKUi96VGxaVTdnbDhRSmtOR2FzVTlOMnpiOEFp?=
 =?utf-8?B?U0FMNG9NbU9SS0dmZmtSVmQrR1N0RU43ZVpIZFoxVk9IOUpERGFwYm10MmpJ?=
 =?utf-8?B?SzRTZ3BmQ1Brd3p1eDg1Rm16UXgybHB0dldjYUlkbnRNL2NtLzluN2hkY0sz?=
 =?utf-8?B?VzZHQkRaYlRENlhTRTVPdXExSFhJcmVJYVlKckZXN05QZWhqTnY3M3ZhcFJR?=
 =?utf-8?B?b2tGb3RKeHZtYi9KbWduTU51T1V5OUJYSlZhRms0bk02YVF1MmxqQis3Wkg5?=
 =?utf-8?B?RWVWU1UyamQyMms3RG5BRlY2VkozZWhsbkd3Ni9mVXFsbk42OEl2SDVtclBT?=
 =?utf-8?B?aU1MVGZuamFWQXRGUlpTd1VTTWlVQVYxaHRtU1lyZmxGSnZTR1ZxaXd6TmJS?=
 =?utf-8?B?emNXMHAyb3hmeFBvZVNHc1lsTjVIVXo4SUUyRHhnbVh2L2VvRGdBenZpOEZu?=
 =?utf-8?B?L2QxSmQ1MTExbW5GczRGWnVsViswdjNFVHlzamZWSjg5NmhNODNuTi9VT0RP?=
 =?utf-8?B?YVZqdXhLMGE4ei9jWGthUHI4OTBONnZKY1RZMjVrY1VoY3h0Skp6OGszU0dZ?=
 =?utf-8?B?amZVT0pEOGd6NUxaMDRvU2VKbFpqaGtYUVpwQURCTEtjYlhuRFd0bEFsc3FW?=
 =?utf-8?B?VUswVksrNFVrVWdLLysweEtuc3FwdGp0Q0FRS3Bta0I2VGQvcXUrdEVNVnEv?=
 =?utf-8?B?eG9zcXVkdDllUkE5bUx6UTZHYk1BQnh0OUNBVVNnYkRTQ1J3M0JGaE1zTG5a?=
 =?utf-8?B?OW5GOFZ0LzMyMlFqc0h3V2plWFlFYUlENnIrcEVOK3V2aHluNURNVkR1eWZj?=
 =?utf-8?B?UkV6RDh3aklZb0I0VG9xbWFRUGVCdUd6MHhxbVZocjlMdnl4aEZyamJxaGNx?=
 =?utf-8?B?T2ovaUx2TC9tcU02RkR0bzk0bzZUUFRiRG02QzVyRXY0ZXd4OWpmc3poRkxD?=
 =?utf-8?B?cTNNV2JvR3ZKcXdUMnplTGxpbWxuNlVFRG41alV3QVhEcFRUYmpZL0R6R2N5?=
 =?utf-8?B?Uk5sSnVESU1rNHdaUy93dlBSTnRiL0lSNExrTnF2NWo0YTljbWdDbGR5bnk3?=
 =?utf-8?B?blE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a42871-4c6a-4e94-6397-08dc7ef0dfb2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 08:33:39.0820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6H02aoGaT71k66QyYqOe9GBlEG1Dr3/LozMeS6AABpJc/fhQg4XAvqxNQIBNyB3qzUcfzasPzF5q+414TgjoaCbcloeJJw4bJrD84uw+s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9745
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

