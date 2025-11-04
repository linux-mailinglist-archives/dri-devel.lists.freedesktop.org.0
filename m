Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED53DC31032
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 13:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A2710E5CE;
	Tue,  4 Nov 2025 12:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="DFbSp2c+";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Hn2v5y4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB7810E5CD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 12:36:31 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A46oeH83711965; Tue, 4 Nov 2025 12:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=r8fDM6twPBAFYkvMTMucfd6h0
 i64ojJ/1Toe737aowc=; b=DFbSp2c+2kJK2YrF3fWVWkmzhdxrdHZ2Lv/G+KedJ
 viVNsoYSx8Q3vMb6MAbjQcvT0GDhRtMfdVVbVM5M1tv2v5d1jw7Rc/9AiWps9xlf
 EQWIc1/Am8JnATxd6AKoiWFH7+mJ8LMn9VQKhtXQcxjZHmy5TLJSpFltKvOsr4Gh
 p88RYRI1Klb5n8wn1LbRwpsC0DgGG7iwth/Ipgl/iLihe+LgRB7gewauxW5vFRRp
 V1AnmnqqqTEgmxs4FPOUn3HfMpR6C236aV738aRpMwtxjsKaecuxJlZYJ4DX0Mwc
 tujDJw8aYsJSNE++Nq9O1BYOLSIgfKUOpWa2hhPI38ZTQ==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020134.outbound.protection.outlook.com [52.101.196.134])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4a5b5wa9ju-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 04 Nov 2025 12:36:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9dOzxYdJK8vZ0AtcGtzEWUmXQh+3KAt/OTyf6NoWZRW9oGp9h2jS3OZv/TddvLOCJnxveMF4F5lPdNXJv/FpN0V6X/FPA35+X95qqH6GkD3zrmfqIgJ/9snlUKV7GwUM8tc2OdXTosKtR2/VqVrGbbFOmeSnRm5DMzSf7c9BfOhk6WagsSBWcWeWYRhysj6wEwvx85B03C1ebXblthPsUpJEJHQz+7R3IUYmryCbyX4kHjLTqxPUQdeJ83O1Eq8JxVhQRTzKZDl0m9kbAgtmhkRMW5h+kROLlmVao9dHIHV05eSCk3xSJrDz9XmSRK+B+H4ejqDFg55vjRFRoJneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8fDM6twPBAFYkvMTMucfd6h0i64ojJ/1Toe737aowc=;
 b=Xj3X3kac7T9Vd30dT7s/Dbwklvtg4px5YoLKRfELSQa3d62Nn1sch2obzNfm6JEccjPpDSYlwJV6NqbSCaWLGt4GrpKK+9+Vf4AfyfjfKOkTFkrOkimN8KcLe7+KMk4fKocQepwfSx/44EtCPhX+3eIOUDbmkP4GAUY013n8X8W/hx8AH+3xIIdlhJXy+JLNnH4tX0rcg9qW6RhZoo8QpuVm/1CDiPa4HQKPIOC0Q0GBUmRtIq/YDpMz9G0rJiE8v0P3VhVpTxpBJ/6/LY1NJhwawfnR1/FV/NzWhKZtLSfY9a5lzX7FdIKQsS6Eefe7EFBc8tyAwkGHWYcJoLyDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8fDM6twPBAFYkvMTMucfd6h0i64ojJ/1Toe737aowc=;
 b=Hn2v5y4AOVL+KyJ9gGMEPjDAiYOiuaQ6z/izUZurOluWiWkINHqT5pMEWsMqa9dlAMFzOvQLTs/iBKEizq5iAPMLhJZU2VlYEPXTFAMOgcSW2+waqf/GWgyHQg9vgkeC/eh+HSu1UJdqzFbgnARRhls+moJoMn60S6eQN9svzgo=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO4P265MB6981.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:34e::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Tue, 4 Nov 2025 12:36:14 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 12:36:14 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut@mailbox.org>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>
CC: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund@ragnatech.se>, Rob
 Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
Thread-Topic: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
Thread-Index: AQHcTYebHUZTUMeisUKawBe3LdwcMg==
Date: Tue, 4 Nov 2025 12:36:14 +0000
Message-ID: <32d2db33-8477-45ea-ba41-5150ed750a59@imgtec.com>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
 <10e39887-02b2-41bd-9ed1-f54481a3578c@imgtec.com>
 <1353f904-aa15-4e24-9e43-7b91185bba17@mailbox.org>
In-Reply-To: <1353f904-aa15-4e24-9e43-7b91185bba17@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO4P265MB6981:EE_
x-ms-office365-filtering-correlation-id: c200db6d-bcb5-4730-791c-08de1b9ebe17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?SEpsb1N3ZEI0aGt3YURrcmJpMU5ycUxRU2VMVldRMHJDVXJNNll5UWt5NE5F?=
 =?utf-8?B?dzV2UXRad295S2tRMmMvQkErVDFSNjZZVXUyWVl2UXVOWi8yV0V4Q3ZvSXYz?=
 =?utf-8?B?S1pBaHlLeG04ZkNHTFdVUWZ2OTFYMHFod1poeTgzNEdQSTZSMjRxNE9ubklG?=
 =?utf-8?B?UHpFWldodjlYNUU4cDUrMjdWaTJSbStxOXQ4bXIvbndkdEtBdnBzcnd1dVd0?=
 =?utf-8?B?YVJ3WWUvc3d6Mzl5VEttOGJIQkt2WWVUbGdhMGhNZHNiK04wbzllcVJvOS8y?=
 =?utf-8?B?QlNsVzZCZFpEVm1zZlM3SW81ZnJFZy82QldmQUd0V3BaQjRoejc2UWdNMHJv?=
 =?utf-8?B?YSsxZkE2aldVaFpjbko4MVNkYlRzQytZOGQzeU5KMVAxSTRHNUlNQkw3eTZM?=
 =?utf-8?B?c2krd3lrdG0yRU13YVUyclRNTE8yMVgyVnBSeExpWmRGMGR6UWptTUxkNlY3?=
 =?utf-8?B?NUpFVWlsMTZVa3RvcHhYTUNMZ2tNV3lWNTJqVW4vbVVqV0ExSFVIUjdHa0dM?=
 =?utf-8?B?R01jUXpjN1NBYU90L0d1SWhRMGlVTnhrUWdKZWV1VDd4L21TM3NTYTJ5WDZu?=
 =?utf-8?B?VnNqSVlBQ1phR0RPK2daNW9pMU15cUw4QUtkN1pkNFhtSUhzNnVDVWhOeU1r?=
 =?utf-8?B?TzZhQ1h1SmNVbEVsMjRFVWN0ZEdxR2xBVVhma1Fpa0UzRVoreVhjUkNESTZ3?=
 =?utf-8?B?U3ZMQzFpZ3d5cjB3eC9OdVBiOEZ5V1c5UzFIazVxMUpvZ3VHaDZzL21zajhn?=
 =?utf-8?B?akEvS1FvV3luZisrWmNDaHQvdHU4ZkdvSWpPZ0ZYa1MrdkVkSWNEL1lqcW5S?=
 =?utf-8?B?VHJQRmxUMjZHaHpOQjBMUDEwNjlsc210Q2p2VFViZXMveTREZUZIbGxZWWZw?=
 =?utf-8?B?ZTRBNDRSWldSN3VGSno5NGpoMC9qYXBUamhXMitqVTN4ZFdPOXg4Kzh6QW9J?=
 =?utf-8?B?WTZrRyt5ZFRDWlRvUHZMY3BDeWowaFlJNGxHSUxGa1lUWk90VWtSVVJCZWZt?=
 =?utf-8?B?N2tOeU11V3Q5bTNYZWtpUjFtUGlyWVozQTdIY3ErcWxRUEx4Vnh2SnlDV1hU?=
 =?utf-8?B?RmFhYXVUT3FUQWdOY3RoU1hsWjBvbEJVaTN2VFVxazJLS1Z4cDd4azNHK1Zv?=
 =?utf-8?B?U3NkSHcvOWlpcFRVeEFGK1dESmRoZ1h2N2JJUTVFcmFSK1pjeWZTRklMdHV6?=
 =?utf-8?B?ZnpPQTd6akFOalBpTWVOVVhRdDFCRUgzZ084QTNheGx2VjU4cVBqelJ5ZHNa?=
 =?utf-8?B?SUd1cjBOK2FCaVVLSmFSYlBhL1hNV25nNFpRTndwakthLy9PTGtzUHF1Z1JE?=
 =?utf-8?B?a1ZwWmtWd3FQQm83cFN2MHlrZXkrUjJoYVRtMDQxNm0rUm1HU016eHREMUY3?=
 =?utf-8?B?ejl5N1ZOKzBWUUZGd2JpSUhPa2QvdGs1S0gzN2ZpM1pSeWozai9XTWtqYmgy?=
 =?utf-8?B?Z3FHQXNaK0FyK3VHM09aQlZERnNua2dnb3pUWjBRRm5ocU9Namt0RGJTY3NY?=
 =?utf-8?B?b0VUQmtaT3M0U3pnd2tYT3BSdytNbUtCRGs4S0N4Uk9KT1Z5REZpTmMrNlJ1?=
 =?utf-8?B?SDdMbEZ3UTRiRDNycXdENHEyQ1ByaEZPUzhaQWI0R1VSYVpWa0liQzQyVS9M?=
 =?utf-8?B?bnFlQjRjR3QwTFlqV1BzWms1SXNIKzNZa1QvbjhUNW9YY3JxZmk0OEJjZlZK?=
 =?utf-8?B?TmhER2VhZ2xVL0dMVGN3aVZVYURJUndqdnVhYmVndHlpYXN0enc2ZjB5alVu?=
 =?utf-8?B?RURwK0Ryd1BncnVpUDZDd0Eyd0VkdXlYMnVaeVlhQkt3NmlTTDc0am1MSGlo?=
 =?utf-8?B?aVBTV0xwMUFFTTlZdGVCb3JwcHdVSlVmUEFNYkJIQ3RicS9YMEtobFhzY1Vy?=
 =?utf-8?B?ZGFyRVlyZjN1cW1xSW9sRDlPVjBiWW9uOTJ4UFNtMmhqclI0NmxQRjdYTk03?=
 =?utf-8?B?R1hHclVseEFvNC9oYzRQemJyTWlIZTI2OXA0aXptTEtuMW5qOGJVZmpSbTV5?=
 =?utf-8?B?K2p5VTJUZ2lSVXhPWDRkazZlMThFVkhuTE5FTDFNemtXMVhFa0wxUUIvWGZj?=
 =?utf-8?Q?6BBa3d?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkwzdThVcDMxTy9CQS8yLzBaWDY5YnRJZjVHcmFFanBWOE9xWFEwNWhpWHZ3?=
 =?utf-8?B?MTBGU0Vpd1loQ3p0aW1DaEYzdVZkZkxNR296RzJGRHh3MHB3T0FUcnNqdjdN?=
 =?utf-8?B?KzRXV2xtSnpSUkVZdXdQT002dk9VZXNZTzNkTDlDREZkYkw2NmJEUVorOFR3?=
 =?utf-8?B?Z091YVYxcEI0VGRWeFRCK3NJcmJPWFY4MnN6bXozWlo4RnNNZmtvbzRLRTMz?=
 =?utf-8?B?YlpBKytIYlFZNmxnT3lHbHJSN0c3NVhjemNRUWFiZ2pEV1N0ZHNSQmtOdzZr?=
 =?utf-8?B?S2xCVi9QQ09MU013ZHZ2YjJLbk5OdTN0dzRQaTdqTWFOalBZbDl0ZnFncGVL?=
 =?utf-8?B?T0x3L0ZPZW5mR3VnWS94WG1hSTQxWGxJU2VNSzd5aEE3WDNvS3JxQzlJRmlw?=
 =?utf-8?B?N0xkMlVrR1UwWWZhN1AzYTNYd2hEZlVsbGtrenQzT2dtcmE5RFBYVnhRUk52?=
 =?utf-8?B?RUMycWt6VkJTdWFTNUlsUWRKSnpnNWhaandxK21tSHN6VU1SSVlXWk9GWVBw?=
 =?utf-8?B?TFd5SXdnNzNpbG91NnZiYTVNNkdVQTFIT0thcmlLYTNmY0NaRzBUWkUvNldx?=
 =?utf-8?B?RXlsd3Q2V2RMZEhOamZ6SllZejdxNzVhL3RWNXNVY2lCa2ROU01OWW9sN0lR?=
 =?utf-8?B?TVFjK0VscVlWbG9wNXNGWFZkcExpTmx5WUxIUm1jdUJlY3E3ZGNGMjFuNUlP?=
 =?utf-8?B?ZnFwbFJRVTYrVEYwa1VlSkRQSUU1OS9tL3hpN3p5UC9NRlQzTHhmblRwTlE1?=
 =?utf-8?B?Vk9Fa1liOFU2Q1dQOTNNZEdUS0NlSTVjbTFKZHpLckJpZkV0ZVhDWmkra1Vi?=
 =?utf-8?B?UEZBbTgwL0ZJaFNwK0VXRjBpNU5keVI2WXB5RmM0RUk5Z2dabjczcHlIWURw?=
 =?utf-8?B?TzFYYmFJYSs3NUVQdXEyU2p6cytaN0NCeVZMSEV3YzBKczZUSGRQbHVPRHFC?=
 =?utf-8?B?dldjbkRHS0VUbjh6K2h0cFRRK0hzeWp3WTU3b3JiWDFGejlPNWNvQzlqYlBG?=
 =?utf-8?B?VzRuMUpzUGxjcHppZ2N6WnFHUlgzeWhoNGEzNk5IcHZZSjk3TUxiMFNvN09h?=
 =?utf-8?B?Q3N2QXVPRjZjdzhCczFoZU10amlrYmEvak96cW16TFpKRGl5S0plR1VPWm9V?=
 =?utf-8?B?b3JnWGo4eHVtVk80UkZ3WFc0UzRCU25tWVdIclhNSXk3bjFYT2dBbm9iZ25E?=
 =?utf-8?B?YkpUdExOR0x6bDlRSXQ3QkRaYldqWWVvVERPMVFqelBjbDJPRlkwZWdSTjZu?=
 =?utf-8?B?Y0NJUGNzTDk0azlwdXJqTUVzTG9ZZVUxMnA4NFdXei81KzlxMzVQVERmNXJ6?=
 =?utf-8?B?UWMvWk5mMkt6OVIxbmtDT2Q4U1VOb2J3VVdTZEZDSEFZb3J4VUJrdFlrV1ow?=
 =?utf-8?B?VldyNlJBRC9ydStXcGZZYndUZVJ3WlJQdHlGRHVXY05HeUZkK0xlWmVOdnZ5?=
 =?utf-8?B?WmpxTjdPRkphQVZKQkNzN1VUTnFmNzJzTm1TcnhZaWsvd3ZlbmFacTJjREJZ?=
 =?utf-8?B?Y0ZFSk4yQjdoNEJ6T0NRTUhsRDV6SjR0eE81RVQyTzZMREMzZHY4S2VSdzht?=
 =?utf-8?B?eHU5d3M5SUhDQ21oTTgxdE1PSEhkOFd1TEp3RTA4ajRzdEErN1hjN0FFcG1Z?=
 =?utf-8?B?SWg4cUcvb1F4VzNzUHB6REVCbFp4T0tzSmEzeGFjWFV2YWZ5NUlYR2xMN2dZ?=
 =?utf-8?B?WTkxcTJlT1ZXSmFvb2RJZFpmNkM0bHJDYWdZblBXWmxHSXAxaUlLZkE2bnI5?=
 =?utf-8?B?aXIrWGhhN2syYmk2WHlCeUJSNDRjYnJRQXA4VWRLVENiTk5GcUF6L1FvMjU4?=
 =?utf-8?B?elMvRXZUNEwvVWU4elQwcGFFRGplUUNBRXhvYU16U1NkbVJOb0VNMUVITWNM?=
 =?utf-8?B?RCtoUGdzTjdzWXBRaEh1WExUQ244K3dpek50b1hhNVlQYS9VYnVlVk9QV3Fm?=
 =?utf-8?B?NjRMbHBLVGVld3FHRGJ1OVJpSklyVGZKdndYdDVsOSt6WXZNZXN4STlXT04x?=
 =?utf-8?B?dEVocmRmVVF6TWtxNDYzU0dJVkhOVkF2N09BYXBxcXI5RnQ1L0wwWVNOSUlP?=
 =?utf-8?B?S3JaR1lGRmFON0VpVVc3T29PSzFBazMyNnIrdWpQQnJqcExaUDJPaEJYWnUr?=
 =?utf-8?B?dTlrVVRxMlc1Yk1JZmEvSHdZQldGbUF2UlptcWd1eXhFTkxCdm9YU2ExT3kz?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------orgI50vDoGOrLAI0vqbwX7SO"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c200db6d-bcb5-4730-791c-08de1b9ebe17
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 12:36:14.0989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YFO/6TODS/o745tQ5tnyEllu5gGOd5M7tc8jkCOqag404uggGouW+tzcobEw33N62WaXPplvTNhQ+F6E/ANb9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6981
X-Authority-Analysis: v=2.4 cv=KrdAGGWN c=1 sm=1 tr=0 ts=6909f342 cx=c_pps
 a=83NFOtSeSOHNL73d852tpg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8
 a=Ct62Evn3Hnx50g1DvLYA:9 a=QEXdDO2ut3YA:10 a=XzDYU-sNYe-QOXP1fiEA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: xVUJENK9wKKkF_EKcLWb4dloyRIN3R6G
X-Proofpoint-ORIG-GUID: xVUJENK9wKKkF_EKcLWb4dloyRIN3R6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEwNCBTYWx0ZWRfX9Ffc639vu7ub
 yuaFhlix76lNA2sWJqaGi4VAcVeyKxERvtHsmsDvAD4erF1ncJhhoIJqVmHi+Dg6TPzvXjYVCrK
 R6EV1jLDx5vKA6P7FH18d58ynAgx2EbtVDleGVRYAv9VN1wFdD5en3B69mVFiP04QyG+YUCFU6q
 n8qP78cM+qHOspDA93OIilZ4/5VgeJmcA2QeBV03HgLegFPXhwKw1+HsjYW7FKIfL5yfvpR7Yxy
 5YJkLn7hvqX7I+fDcsGc8HQAQLQ8j+pM3Q0xJ6sCJSaMexGmfKAEpPdyWAbQzwrGepM46Uf40I4
 6YDQ4BiAJ87u5Pywo8qqwCkfsCfifra9XwD/O58bfEvoYr+WTW1vDuZn+XrpWgYhiC/w57r3zKC
 c1boTgyOP3NNMmrMdX3YEyCDByVttA==
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

--------------orgI50vDoGOrLAI0vqbwX7SO
Content-Type: multipart/mixed; boundary="------------KVbTP3LcPkkaBBCT80qIPs8c";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-ID: <32d2db33-8477-45ea-ba41-5150ed750a59@imgtec.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
 <10e39887-02b2-41bd-9ed1-f54481a3578c@imgtec.com>
 <1353f904-aa15-4e24-9e43-7b91185bba17@mailbox.org>
In-Reply-To: <1353f904-aa15-4e24-9e43-7b91185bba17@mailbox.org>

--------------KVbTP3LcPkkaBBCT80qIPs8c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On 04/11/2025 12:00, Marek Vasut wrote:
> On 11/4/25 12:52 PM, Matt Coster wrote:
>=20
> Hello Matt,
>=20
>>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>> @@ -19,6 +19,10 @@ properties:
>>>                 - renesas,r8a77961-gpu
>>>             - const: img,img-gx6250
>>>             - const: img,img-rogue
>>> +      - items:
>>> +          - const: renesas,r8a77965-gpu
>>> +          - const: img,img-ge7800
>>> +          - const: img,img-rogue
>>>         - items:
>>>             - enum:
>>>                 - ti,am62-gpu
>>> @@ -105,6 +109,7 @@ allOf:
>>>           compatible:
>>>             contains:
>>>               enum:
>>> +              - img,img-ge7800
>>>                 - img,img-gx6250
>>
>> Can you put these in the same order they're declared above? The way I
>> read it, the order is img,xxx in generational order followed by
>> soc-specific entries in alphabetical order (which is why we have
>> img,img-gx6250 before img,img-bxs-4-64 below).
>=20
> In this enum, the entries are (should be) sorted alphabetically .
>=20
> Do you want to sort them generationally instead ?

If we have it wrong and the correct way is that these should always be
alphabetical, can you please fix up the existing enum below (with gx6250
before bxs-4-64) to match the constraint too?

Cheers,
Matt

>=20
>>>                 - thead,th1520-gpu
>>>       then:
>>> @@ -134,6 +139,7 @@ allOf:
>>>           compatible:
>>>             contains:
>>>               enum:
>>> +              - img,img-ge7800
>>>                 - img,img-gx6250
>>
>> Same again, otherwise lgtm.
> Please see above.

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------KVbTP3LcPkkaBBCT80qIPs8c--

--------------orgI50vDoGOrLAI0vqbwX7SO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQnzPQUDAAAAAAAKCRB5vBnz2d5qsDp3
AP4vxtNnGToCyDLP5sTSeFeDLtD2zye47DleW18JoTulVwEAjIMU8c3ybso6SNdDK0/a06pW7RHq
9IVv2jCGod+97gc=
=XSow
-----END PGP SIGNATURE-----

--------------orgI50vDoGOrLAI0vqbwX7SO--
