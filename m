Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924B6A8419C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 13:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8D710E0EB;
	Thu, 10 Apr 2025 11:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="QEKa7Wh1";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="odwRKPte";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0EF10E0EB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 11:22:27 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A7kAnE013951;
 Thu, 10 Apr 2025 12:22:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=jAPM5UhFtsem25o1I/xE1oOnb
 twULlHMhlJ2//z8E8Q=; b=QEKa7Wh1OXKcwBHP0QuD96CV6dihTPMtOOaEbOtU6
 gTR8f+HjvlteMVbZgqX9FgUttK00geNbZLId5btzqcd3BtWWnVq0wMSbpyyHrGGf
 FcqOk8NKkCJ8oKtBymVLwOcMXpUnCFVsC6kpCg8qJ+UjG2AW0U2UKRtDXQfCq2zD
 EDsm9dxjxwB1e2mUkMxwmCF4u1sMttS5vy6bLHEEDDOHcrS+QjyQuPbiMQCKGkSa
 RpVgE+9hwNe9iqESm8Z6+5W4f6xHXCx2QVCpRM2F7YIzg9Cbgn8azRSxatMs8r4e
 lMz9fIa5mgFBmIqEoqRrtySuTura7fYWkqoWufX8ARspw==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazlp17012052.outbound.protection.outlook.com [40.93.67.52])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45ttssbj9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Apr 2025 12:22:07 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsiyOC4SFtgkAG+41+ze3tVK8Ow3+/NuugH44ZSYmcAfz4IP0WKt+YMmFCf483/c/IR16uRNFg9iwrOXJqg+frUjQUrANEmTIGWMjSvphHcTdV4dLLxJ0XE8ptqOSYqX/mG3URYs4Ub4P1F6LIzETBquTBVVQU/Sq/qqHzFEi4wlLp16JxOWRoQpg7MXGIzjlWb9G05FLN5cmEi8BX6azAEXVW+1+EgK21kh9UnH0fobuslAG/sVS4HmHmthtMM7iEP5KWssfK961PVtj9Wfw3ApqdFIMDoaI91Jpdc/qnxIORKj+ZzVg4ZwXwi3bZ0dKixhWpJq2Cl2/8FUz8AbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAPM5UhFtsem25o1I/xE1oOnbtwULlHMhlJ2//z8E8Q=;
 b=SObxewNu0pR/DAbyqCJpqaB1si0XU3NYro9iBnUbvyV5gtPEbPDpK0M/JBksq2AYk1eCPi/qxdAkLjJeyr1Zpe/rX6byGNiLUUJI/tQc8GKcAbJ87EZGQd+3bI4GqiRwfYvPYol6UbNJkk82ZFwY9N60MxFv2xsB73PlDjPECcblK0C7LuO8hgbXXI/MmxeqSvGfMkaXfT0GRbJRErTZCis852O91tkKXPKL6dOee2Nw3LP9hiLeq+VlbqP2mL0GBX08qruj/NWKrSx9EzWNWOaEx/wdCQmGRagOt39GHSieHQycuflVv1X5K5LKvbcQXTmRWZPMfnJDYG2fEtKpPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAPM5UhFtsem25o1I/xE1oOnbtwULlHMhlJ2//z8E8Q=;
 b=odwRKPtec3xyuN6b8ItCnAgHMs9R8n1Fzye12xtIC7yqlbUb4mZ6xnlqXfTtnDgKvCk56qiKAp1em63KegDl97LLjyU5T9zXDdD3EQ3m99n9AIkCy8tDuz2ETL78wY4X5S0+8Jj0Lz984tqdSmFo0Qac1irrcKN3O4Ute1we/Gs=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB2722.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:a4::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.9; Thu, 10 Apr 2025 11:22:05 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%4]) with mapi id 15.20.8655.010; Thu, 10 Apr 2025
 11:22:05 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Jani Nikula <jani.nikula@intel.com>, Alex
 Deucher <alexander.deucher@amd.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/10] drm/imagination: avoid unused-const-variable warning
Thread-Topic: [PATCH 01/10] drm/imagination: avoid unused-const-variable
 warning
Thread-Index: AQHbqUo2T639E3x4dkeZqiAhvvg4tbOcwv4A
Date: Thu, 10 Apr 2025 11:22:05 +0000
Message-ID: <7ae4be5c-b115-405e-aa57-caeaa206775b@imgtec.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB2722:EE_
x-ms-office365-filtering-correlation-id: afade1f3-a2cd-4749-2227-08dd7821ec8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?eWhKbWZ4elZYQ29hMzBuRDZHQWE3SlpLRER5cmNsTTNzcTlQb1dKbkxaZlRC?=
 =?utf-8?B?eHhDNitvcmxVeUJWV0JGZ2FWWEhRblpUSWNBekw1emQ2N1p0RldlR1pnekdR?=
 =?utf-8?B?d2NmZWtLSUVDR1MzQUdpRm9LSjZ4TmphMzErUGNCMXlwZEdMdE1tU1lNKzF6?=
 =?utf-8?B?LzFRbkllWU5QSmRRVUJydW12a21JZnl5MlNGMm0rMTNDQmJXOVNzS2hVOHRv?=
 =?utf-8?B?emdzc3drc1QwNjFGdVlBekRzUlo1NmFoV0pqclM5V09DWDJRUHpuQjkyaW0r?=
 =?utf-8?B?STBFS00wbGNwSXRtRnBqNDVrcXpDTFNneXZPQ3N1Tk9iUFlDcVhvK0NYN21s?=
 =?utf-8?B?Y3BGNUV1MEM4WHRwc05CY21aNC9ySVVodnBUQU9XUmhrM3Q3T3F3WHVsbkxN?=
 =?utf-8?B?TlFVSndqbEQrd25EdzBxSFpoUUs1cTBVSnFjT0xZdXVHN2grRFZ3S1Brd0ll?=
 =?utf-8?B?UEVuVnEyVlh3WnZlM2VSYm12MWRaallaczA2U0VpWk5sV29jcnBua1ZrZE1J?=
 =?utf-8?B?NjcxVHVkQkZ2TERVbHB2Y3dZbWsvK3E3WTlxVkNCcHlvTzZWVXMxQTQyQmVP?=
 =?utf-8?B?ckRiajVheVp6aXdGcEYxUEYzcjk4SUNhNDcySDZGV29PUWJUNCtLNk5CTUhz?=
 =?utf-8?B?VWk2YWMzb2RGa0FHK3ZCODlycFhQeDk3cFhhc29tTzVkcHRraFFVdi9tdHpq?=
 =?utf-8?B?NEhta0U4MTJWTy9XN0lPdmhlUHo3Z3hyZ2E2YVlKelgrWERkTWtDYi9PbHVP?=
 =?utf-8?B?VG5ZWFVBK2k2UzFacDg4clZteUZRYisyUHhLa3lhNjlKaUdwb2xyeVc3MHJI?=
 =?utf-8?B?L2xUd3YwZ2UrMnpVQVRvR2lTNm1OZkVZTis0dFZ1ZjNHYmphWTJZN24xUFNC?=
 =?utf-8?B?d3p2elY2U2JCMXFYc1VwT2YzejdicTRTeVk0bURKYnpDaUNVbmduNjhMc2hz?=
 =?utf-8?B?Y2pzN3Yva1BpMzlvbGh3SkxNWFluZlVvZXJRK1FkT2hlclZTa1hQcXBpeEFt?=
 =?utf-8?B?QXpVU0pBaUlzQXhTcVQ2S2JDa2ZnZnFXd0VqWVpQV0tSSEVhM3NTVlcrLzJN?=
 =?utf-8?B?K0haa3hQaVlKZ0pFQktGcEdHY2E0TUZMTndlUk8zQzMzSG40MVdaTk9nRU01?=
 =?utf-8?B?Rndwblo2dTRoZU56RU50VVk1eHQ4ektweVFvZVdWVWFzTzIyeVZhVkpPcGsx?=
 =?utf-8?B?N1VHcXFsWlN3ZHVCVzcxODdvc3Y1TzlnTnJuUkhpUk1KQnhmVVVZZ2lGd2Jt?=
 =?utf-8?B?eUE2eTBQSnBGR3BWTmlJRFhVdkpTM2oxajdhdzk0NG0zK3JnalMzbUZwQzFt?=
 =?utf-8?B?Q3N3SUxzRXlYUTJ5amtucHhndmdiZ2FoYmtmbjhSUVVwS25TcFRoeVFqSWMr?=
 =?utf-8?B?SFlPYzdVWEZZaS9lTlZYa0JaMzdkaFU2UlRKNkVWMHBSbFhTeEZyUlZnN1Zl?=
 =?utf-8?B?QlhhSlRtT09qaXkyK1Jxc3RWdDdoemJyaCtaOFIzRkptbVJXcW8reGdvRENE?=
 =?utf-8?B?RFhjN1RqVHBTcWYrL1FFdEtsQngza0JUQkxPTDZjdlZ4Snp5RTFsV0xIZ3RC?=
 =?utf-8?B?NHFUd0dxczVhOUU4dHFPMFNyUnMxRE9PN0d6T1lvQkJDMW0reTFIUlBqSXNy?=
 =?utf-8?B?eVZkNTlqKzFscnA3M21yNUQ0QTNabjNOKzRjaThTbGNyZlh4dlgweUFJVjJ1?=
 =?utf-8?B?KzFTSjhrYmpnbFZYeGhuTHBtZVR2cTV5ZWkwOFlmZFMxT2crdWpMOTUybWpp?=
 =?utf-8?B?SzJ4MXB4OHlMOXc3QU1pNDNvNGVrankxa1NCZCtWY0Ura0FvbCt4d3RXSHJO?=
 =?utf-8?B?QjZ1VDBCK0UvdFFpK2k2Y3VpbEVzY3UvaWlqRkt4d0Q3S2FPQitTczBDRUl1?=
 =?utf-8?B?ZnRaUlE3dEdDRnlxckMzRmw4eVRpd0hjM1M2dFdLR1poa2diYVhLQXpTS2RW?=
 =?utf-8?Q?D4NQsXbjtE9ixZplFs6mykL/U/clGff0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXFlTWkxb1UyVlhQNkw1anBLMlYzdWo1dWRSQlBGTTluQmFDdEFFWHJHMjFn?=
 =?utf-8?B?a3JWRUNuQ1YyZ0M1M1lmc3hXQlVoVHFPalp6VjQzbXF2VGNZa1poSlpCdUxS?=
 =?utf-8?B?Qkd0ODZwS0ZHVWdlYjh3V2xmdzVPZkRUYXB6ZExxZVhCdkVvVEdKQlhRYmpM?=
 =?utf-8?B?bG5EYVhWZE1qZ2NmMWxyYlE0Q1FHMFVkdU9SL25lbVU3WmNNRE5wc1NnRkRJ?=
 =?utf-8?B?ckFLUlFKRjEyOG9pbFVNbkxjZWtJRVord2NLa0owelpTSG1nM3FBSWx2aE90?=
 =?utf-8?B?eFJqZ2t1cnQyOXdSay91K3FSMDVmTGxQUkVlM1VWVzZYa2JnVW1BZmM3YW54?=
 =?utf-8?B?bTR4SnRZQkZmYXo1R3lZRlBRK1JqcitSUUllZStnV04vNlpSSVp3bXA0b1V0?=
 =?utf-8?B?YUF4YlJCVVVVN0EyUys2UTdTeHBNK3RqNVNSNWRoTmcwdGRwNUhqWGZpRHpr?=
 =?utf-8?B?SE54S1VzSXJPU1l4NTV1WEdIMkF1ek0xU1FQSjFSLzlxQUMveWp0Z1I2MDJv?=
 =?utf-8?B?eHIvcTZ1bXJjMXJPdEpySHJBWFRma1VRQVovMzR2TjNMNjRaazBFaEVYU2Z2?=
 =?utf-8?B?ZHMzTjdQU0dCT2tIOENRcFVYaFRFalZKRnpscXBucVRFMDNuM2NEREZmUDZR?=
 =?utf-8?B?ZW9KUjNJdVU0d1NtOFRldkdtZUNJUkdsa3pJRDhURDlyNk11N0VnRnpZenFw?=
 =?utf-8?B?dnRtN2thRGh3VjNFa2pBSEhNUkpoc3g3NWVYMjNqdXE2TTJ6YVFLWWxTR3Vq?=
 =?utf-8?B?MXhxdHBiMUhGR05iL1QxRm5vZmV6OHBMNkJReVBwNnJ3TW9KbDIzYk9UVFhO?=
 =?utf-8?B?QWw4Y041SU9VVTV4QjdraGM1elBoMktsaC8zakVScjlXQXF2TEU5Rm1HbVlm?=
 =?utf-8?B?U0szZDZUcHQ0QVVvZmhDTjBCeVF0VmxtWS9XSTBLSHJ3RlloaEgzV0V3RzdP?=
 =?utf-8?B?ZENsdmFtcUo4L2ZBWUE4Y0NscEJZemxHYk43UWRlQjRhdmx2SVpMQmlCUjdm?=
 =?utf-8?B?c3VwTnovbU82dkRMdGpnZ2k0ZXpSNnhGV0g2aGFRV0pTUWFVR0k2VmIwREoy?=
 =?utf-8?B?dVBPNTFST2dPeWg0bGhmazhGN1VPcks5T3k5aFcxUjhxRXVGSklQbUJmWG0x?=
 =?utf-8?B?bXJndVYxZ0NsaFp0RUVLZkh1ZGw3NE03ZTFhOFJDTHZiM2dTMXN2RG96YUFj?=
 =?utf-8?B?ZlNVNmRxYzVWMlB3dzVFa0pJL3FrY015bFdJa0hBclpOaTl2citKeFU0dWdj?=
 =?utf-8?B?L01BamJDQ2xrMWd1eXVzV1VoZXNTZDlzNHFCSWlOaTVvdnNqcnRkZ0VVY3Fy?=
 =?utf-8?B?Mi80Mm8zNGlUVHBlclNzcTZnaTZCcG1CSlpIRWdPR3RLMERmU2x2NGFFbUsw?=
 =?utf-8?B?eE51dXBDcnh6SjIyMFU5WGxxTXo2aFk2cFAzN0l1eDFFbHlZY3hIMS9ybExJ?=
 =?utf-8?B?bDJsSVdsTit3SHJ1Q05SWlMyK3Q3SGJweC80OFIvY1dQQ1VzeUF2OEtWRW1z?=
 =?utf-8?B?Y3ZFY3ZTNFhRTHBrRFUvejA1YWcxdHhkQXl1VFF3U3pjVHNtZnBvZVZsbGlx?=
 =?utf-8?B?MVRUdFVHQitUSitQMGZXQVdSZVlCYW5PV0QzT2NrWmVrdnNkT0EvWXE5M2pt?=
 =?utf-8?B?dk1Oc01xQStHWFA2Yjd4YUorNDlpOUJScFpneXFHMGlLVHFzdkZvVmpuTlBF?=
 =?utf-8?B?cFVpUjRLNDRxd09LWStJazNFMDJIaXZmN1ZGWktCOHB3U3djVVoyN0VjaTg1?=
 =?utf-8?B?b1FxbXBBcGc1VWJVU1k1NmtxUHp1RSthelEwVkw0RGNORVZ3akhNbWEvSEE0?=
 =?utf-8?B?cGx3R1l1QVZodFQwZnNiMU5Bd1hkSTVsWHA0ZEF3RUUwL1Vyb2NHQ0pOTEcy?=
 =?utf-8?B?QVFEYVIvdSsvOXBRMXBlSzEvbEJRYm5WSlF0SDNEcU94bms4NitYZGFhNmZH?=
 =?utf-8?B?eXdlV3lLbWFiOU5JMk1MWE9pN0QwWWRZOUNRejJRSmZuYkljNlZYcjcxZGNX?=
 =?utf-8?B?QVRySFF4TVJxT1phNEVjRXpXVFpkNEFxY1hEMlMwS3RiRmxzMjdjRW9BdWgv?=
 =?utf-8?B?aW1QRXBOTkpDa204WnlGQ05SdEg0TzBtU090L0NTMUlHTC9vbW5LczFDeXlJ?=
 =?utf-8?B?UUdFUG9EM2FOTFU3ZW92eDlNWVl3TmkvenEwNUpuOVJnaFZPSWx1UGFxc1pF?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NgzDPtq4Yj5mWYFovEtLtMMW"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: afade1f3-a2cd-4749-2227-08dd7821ec8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 11:22:05.3937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 82jVDTzO6DDdjqKc9r8XIww8fBeTBg4/rFig6sZ6wCXimMDtMSCV1bTeL8HYeOUuv+8kH8NLftERqBk8qY52jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2722
X-Proofpoint-ORIG-GUID: i65TpXtH0PavaBo0PqoYs0tjvuvBsAcl
X-Authority-Analysis: v=2.4 cv=I7hlRMgg c=1 sm=1 tr=0 ts=67f7a9e0 cx=c_pps
 a=+8G7KV7MoNjfk4g9SO/OOg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8 a=EwWf3kosYhxdagVo86AA:9 a=QEXdDO2ut3YA:10
 a=v9SVIVwZWqaKqeZQp84A:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: i65TpXtH0PavaBo0PqoYs0tjvuvBsAcl
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

--------------NgzDPtq4Yj5mWYFovEtLtMMW
Content-Type: multipart/mixed; boundary="------------QAaQGMesRq5LYzReAO94KwQA";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Alessio Belle <alessio.belle@imgtec.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <7ae4be5c-b115-405e-aa57-caeaa206775b@imgtec.com>
Subject: Re: [PATCH 01/10] drm/imagination: avoid unused-const-variable
 warning
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>

--------------QAaQGMesRq5LYzReAO94KwQA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/04/2025 13:22, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> When CONFIG_DEBUG_FS is disabled, the stid_fmts[] array is not referenc=
ed
> anywhere, causing a W=3D1 warning with gcc:
>=20
> In file included from drivers/gpu/drm/imagination/pvr_fw_trace.c:7:
> drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h:75:39: error: 'stid_fmt=
s' defined but not used [-Werror=3Dunused-const-variable=3D]
>    75 | static const struct rogue_km_stid_fmt stid_fmts[] =3D {
>       |                                       ^~~~~~~~~

Hi Arnd,

Thanks for catching this! My dev environment permanently has DEBUG_FS
enabled, we should probably look into a wider variety of testing
configs.

>=20
> Rather than adding more #ifdef blocks, address this by changing the
> existing #ifdef into equivalent IS_ENABLED() checks so gcc can see
> where the symbol is used but still eliminate it from the object file.

Possibly a silly question, but wouldn't adding __maybe_unused to
stid_fmts be a simpler change here? Or is there a strong preference to
avoid #ifdef CONFIG_* and let the compiler figure out what to elide?

The contents of the pvr_rogue_fwif*.h headers is essentially normative
outside of company-internal documentation. With types, there's generally
no warnings emitted when they're not used, but I believe this is the
only instance of actual data being stored in these headers.

I suppose technically it should even be moved to an associated *.c file,
but that would (I assume) further confound the compiler's ability to
decide when it's needed in the final binary (or I guess the linker if
it's in a separate object).

>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/imagination/pvr_fw_trace.c | 8 ++++----
>  drivers/gpu/drm/imagination/pvr_fw_trace.h | 2 --
>  2 files changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/d=
rm/imagination/pvr_fw_trace.c
> index 5dbb636d7d4f..93269299d6a4 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> @@ -122,8 +122,6 @@ void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
>  	pvr_fw_object_unmap_and_destroy(fw_trace->tracebuf_ctrl_obj);
>  }
> =20
> -#if defined(CONFIG_DEBUG_FS)
> -
>  /**
>   * update_logtype() - Send KCCB command to trigger FW to update logtyp=
e
>   * @pvr_dev: Target PowerVR device
> @@ -447,7 +445,7 @@ static const struct file_operations pvr_fw_trace_fo=
ps =3D {
>  void
>  pvr_fw_trace_mask_update(struct pvr_device *pvr_dev, u32 old_mask, u32=
 new_mask)
>  {
> -	if (old_mask !=3D new_mask)
> +	if (IS_ENABLED(CONFIG_DEBUG_FS) && old_mask !=3D new_mask)

Logically, there's no reason to add the condition here. This function
was only gated behind CONFIG_DEBUG_FS because that was the only
mechanism provided to invoke update_logtype() but since we're relying on
the compiler to figure out when this function is required, we can skip
the IS_ENABLED() check.

>  		update_logtype(pvr_dev, new_mask);
>  }
> =20
> @@ -457,6 +455,9 @@ pvr_fw_trace_debugfs_init(struct pvr_device *pvr_de=
v, struct dentry *dir)
>  	struct pvr_fw_trace *fw_trace =3D &pvr_dev->fw_dev.fw_trace;
>  	u32 thread_nr;
> =20
> +	if (!IS_ENABLED(CONFIG_DEBUG_FS))
> +		return;
> +
>  	static_assert(ARRAY_SIZE(fw_trace->buffers) <=3D 10,
>  		      "The filename buffer is only large enough for a single-digit t=
hread count");
> =20
> @@ -469,4 +470,3 @@ pvr_fw_trace_debugfs_init(struct pvr_device *pvr_de=
v, struct dentry *dir)
>  				    &pvr_fw_trace_fops);
>  	}
>  }
> -#endif
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.h b/drivers/gpu/d=
rm/imagination/pvr_fw_trace.h
> index 0074d2b18da0..1d0ef937427a 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.h
> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.h
> @@ -65,7 +65,6 @@ struct pvr_fw_trace {
>  int pvr_fw_trace_init(struct pvr_device *pvr_dev);
>  void pvr_fw_trace_fini(struct pvr_device *pvr_dev);
> =20
> -#if defined(CONFIG_DEBUG_FS)
>  /* Forward declaration from <linux/dcache.h>. */
>  struct dentry;

With the #ifdef removed, there's no reason to keep this forward
declaration down here. Can you move it up to the top of the file with
the others?

> =20
> @@ -73,6 +72,5 @@ void pvr_fw_trace_mask_update(struct pvr_device *pvr_=
dev, u32 old_mask,
>  			      u32 new_mask);
> =20
>  void pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dent=
ry *dir);
> -#endif /* defined(CONFIG_DEBUG_FS) */

Having said that, surely it makes sense to keep at least
*_debugfs_init() gated behind CONFIG_DEBUG_FS?

> =20
>  #endif /* PVR_FW_TRACE_H */


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------QAaQGMesRq5LYzReAO94KwQA--

--------------NgzDPtq4Yj5mWYFovEtLtMMW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ/ep3AUDAAAAAAAKCRB5vBnz2d5qsEkV
AP9ECzBIMkaJSoZ5nNL8ehs4R4l/6/X5/GzlRKBdr8XpWgD+INOphwX6xt2bP8+MH28+Vpy785t+
LlR1uvZSt978igg=
=oj75
-----END PGP SIGNATURE-----

--------------NgzDPtq4Yj5mWYFovEtLtMMW--
