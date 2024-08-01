Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D56A944A10
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 13:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E3210E90C;
	Thu,  1 Aug 2024 11:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ginzinger.com header.i=@ginzinger.com header.b="duwCtA4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hz-relay01.de.seppmail.cloud (hz-relay01.de.seppmail.cloud
 [162.55.72.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D3B10E8D9
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 09:52:15 +0000 (UTC)
Received: from hz-relay01 (localhost [127.0.0.1])
 by hz-relay01.de.seppmail.cloud (Postfix) with SMTP id 4WZPQ56x3Bz1Lkx;
 Thu,  1 Aug 2024 11:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=ginzinger.com; h=from:to
 :cc:subject:date:message-id:references:in-reply-to:mime-version
 :content-type; s=default; bh=1NujYjGsv6bB5TTxit5kzkU1vEX01d9pfV5
 IK3nfBXk=; b=duwCtA4QBbco/4C35PaExnyo+Vd5fLF6FK+XdDBUm0jTVn3I+/r
 OWVODgExdUMCqEO6tzHLxGjEMnKjY1CsTLAC3T2s3l7scxlFasb0Df/0g42sKjjk
 2XoKwoLDTAjUDBE/jtsxcrDqp8DULP3ZVzJDIYOiqq3+RlxpTiqQpx0sc2VeqmCs
 qXZYByxKV46SWUiW3b/jrUseQwFNKiTAX4+wW0t8Ou4ivaOjyPMweyh1EtpoQBvR
 GGZXYxio+pIxx8LnBA/7z3UUVe7dU1gtam3JJQoQtW4FXCN41jDVg93+ByB9YyQM
 EosnhxBCuLfjyxP8GqKaQ5MveLr29J27ySg==
Received: from hz-outgate03.de.seppmail.cloud (unknown [10.11.1.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by hz-relay01.de.seppmail.cloud (Postfix) with ESMTPS;
 Thu,  1 Aug 2024 11:52:12 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (not verified))
 by hz-outgate03.de.seppmail.cloud (Postfix) with ESMTPS id 4WZPQ13QcRzGnv7;
 Thu,  1 Aug 2024 11:52:09 +0200 (CEST)
Received: from DB9PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:10:1da::29)
 by PA2PR06MB9735.eurprd06.prod.outlook.com (2603:10a6:102:413::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 09:52:06 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::e0) by DB9PR05CA0024.outlook.office365.com
 (2603:10a6:10:1da::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Thu, 1 Aug 2024 09:52:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:52:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.104)
 by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Thu, 01 Aug 2024 09:52:05 +0000
Received: from AM0PR06MB5155.eurprd06.prod.outlook.com (2603:10a6:208:f3::23)
 by GV1PR06MB9219.eurprd06.prod.outlook.com (2603:10a6:150:1a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 09:52:01 +0000
Received: from AM0PR06MB5155.eurprd06.prod.outlook.com
 ([fe80::7c6d:514b:6060:6088]) by AM0PR06MB5155.eurprd06.prod.outlook.com
 ([fe80::7c6d:514b:6060:6088%5]) with mapi id 15.20.7807.009; Thu, 1 Aug 2024
 09:52:01 +0000
From: Kepplinger-Novakovic Martin <Martin.Kepplinger-Novakovic@ginzinger.com>
To: "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>
CC: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "lee@kernel.org" <lee@kernel.org>, "linux-pwm@vger.kernel.org"
 <linux-pwm@vger.kernel.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] backlight: pwm_bl: print errno for probe errors
Thread-Index: AQHa4/MG2ey7MN3ie0Sx84j5EsF+tbISIdgAgAAHKgA=
Date: Thu, 1 Aug 2024 09:52:01 +0000
Message-ID: <00f4f77151de3c3a4964fe697a7d1841c670284b.camel@ginzinger.com>
References: <20240801091255.1410027-1-martin.kepplinger-novakovic@ginzinger.com>
 <fjke5js43aqxdxmoau2l275a26o52sq7hyjgzwxnnsrptqlcvs@mohkvblfqkhg>
In-Reply-To: <fjke5js43aqxdxmoau2l275a26o52sq7hyjgzwxnnsrptqlcvs@mohkvblfqkhg>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM0PR06MB5155:EE_|GV1PR06MB9219:EE_|DU2PEPF0001E9C2:EE_|PA2PR06MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d424207-db8c-46b8-8b4e-08dcb20f9a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?RXVnaTNUVTFoeGpVdnE4S1N1ZHVuODRNOEJsdHc0STRpUS9yYVB4QTJaeUI5?=
 =?utf-8?B?Y2dMVDhnR0VJellxeGdQaUVkZ0Q3MGtpcmM4WWwrUW1obVpYUVBPVWx4ZTRT?=
 =?utf-8?B?eU1xNkEvMXVSVVh5SVk5U0JRZ1JTdmM1NEZOMGxjdS81elRiRnR2RVM3Njlx?=
 =?utf-8?B?ZGJNTDY2UFlLbjhjVG5wczNsU08yUTFRY1kzK0VlQ1RTMnEycHNUSCtnL3ky?=
 =?utf-8?B?TTBkdFdhREp0dE5uY3orYW11SHhOUWM4RkwzbmxYaVpkNUxrNHo3ODNXUlpz?=
 =?utf-8?B?OU9jM3hReXE2Q2pwMlBvVG8yei9PZEoxVy82b0xLVVltZWplOVJWZ2dOL2NM?=
 =?utf-8?B?cEtLNVVITUo5N0ZNNmhXVXlaelVBQ0lpRzlvNnVWMlJha3lvWjdvV1R5WVhy?=
 =?utf-8?B?cEhMUXB6cEVZaE9NcE9Ta1JaQXFIQ3gydjlJMVFvaHJ3ZVdHWWdtQ3N0Z3Fu?=
 =?utf-8?B?aDZ3WWladGFCYm5VSGcrL09udElNampQWWI2ZEZtNXBDeElLdFlzRGpCazJZ?=
 =?utf-8?B?bkdpdW1nNUFodDVXUFQ2MmR6ZlVDMVVlNit3ZFNhQVNQbHZ3UkM1Ykt3eStt?=
 =?utf-8?B?OTEzTjlYaWtKOFRyWTFDV085R0F2WlZMSU5mRTExNm9HQmFSS3dKU28zYWNU?=
 =?utf-8?B?bENTNE9FRGpBMVRjRU9NWnlnVjRXQlBjMkxjNmxPVzF2cmQrVzdDNUtITEp4?=
 =?utf-8?B?RVA3MUQwUEp0Ny8zKzB6bHRCTVBiYzR2b1U2MFFIbkdQdVVnZXBOcSthTFlM?=
 =?utf-8?B?dndzUWxsZTJtQUYvcXVrc2lOaE01U3JqVmJQaTJ5MXd1NmJ5NWc2aXNzQ3Aw?=
 =?utf-8?B?UlJ0bm90UmxtS3BpYnZBYUF6cDJIaXFhZENhL0JsVFZtYXdLMG5pUFdLcFVW?=
 =?utf-8?B?K2t4U3lQbkE2UklTYzJCd3Iwc0dBTm1YUnBsR2N4TXhhRERwQkEvYUpNRUVz?=
 =?utf-8?B?NXV6WGNWTkhDRVdJbFlmeGdqQVpZQmVZS0gxdzRwUWdjZDJtVG9KbzhlKzdm?=
 =?utf-8?B?RGxVd0xURGZTODZLaXRWWGx1MmRUYW1uVGJZUWFnRjVNSVN5SHd6Yyt0dFRz?=
 =?utf-8?B?N2RRLzc2VmJKMENSQzVDZ2ZGVUJzS1ByTzQxSkFqQ1lsNDNXSkdWaWs1M1J4?=
 =?utf-8?B?R0hoNjFJSlZUQmpMejZtc2pTRFU3TDJ3MkNYWmdWVmVPOWhZTGJ1VHdUWmVl?=
 =?utf-8?B?N2lvVzl6bG9JcEtiZ1lBbVEvdnIyQTRicjZkWHI1TmpmNXRaQzN1amU5NVp4?=
 =?utf-8?B?T3pNekhlaXQ1dlBRZTVNZVRKN0V5dStHMUtoOW1Rb2U0dU1vQWU4akxSU0ZE?=
 =?utf-8?B?KzJLZ2Z4ODdtRmZjVlJpalUwSFlzNm0wTWdqOHN1MUF4MWJXWFJ6Z2dndzM1?=
 =?utf-8?B?SGNaVXlUN2MyQUtGS3loN1ppM0V4d1lNVExjS0ZxUm11YXNsNnBSSGhKRTF1?=
 =?utf-8?B?K0M0ZkhZOSttUDRyM1hneDdkZEx2d3NQczFQUzV5UXFXbkNCa2dzMFdBNWFq?=
 =?utf-8?B?blI4L0FPdUJXa3M2dVJPQWtYQUVIVnZRcU1EL1Yzb2hqbHpuNnFONldzWXJ2?=
 =?utf-8?B?V1Fvckx2Tk1pRW5LS0xlWEhGejFMczA5ajZLYnlHK3EwYmJVRy9qZWxpUFFY?=
 =?utf-8?B?ZW40STY5bzBJSG1XdHQ3QjAyNXhKK2pSbTY5LzJIZnF6ajMxaTBXN0pDbjMx?=
 =?utf-8?B?aUMvSjNrT0xPUkp1QzZ0OXNVTi9xM2plWmQvYk1Pdzg3SGEwUW5aZXdjVWpv?=
 =?utf-8?B?MmZXbzVQb1dIVmdkYVdCZm5LaDc5T1BSOUo1L0duc3lxWGZVN0YwUXlLSzZy?=
 =?utf-8?B?VTFJQjl2QmhrMVd4S3ovUko5WGVBRGdxWjhKbDhvdHpieStTZnJBb01pdXdX?=
 =?utf-8?B?S3VRVTgwNGpZUkJQY2gvU3psN0ZrM1VQUWp1NHhUMzd5cWc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR06MB5155.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(38070700018);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9219
X-CodeTwo-MessageID: d109b658-cb43-448f-8a7b-8b3e29a80ca6.20240801095205@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: daab912d-c6b5-421e-f15f-08dcb20f973f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|35042699022|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGoreU5pZWN0cmU2U216WjlwMFFkS0pOY1hrNWJlSU9iZURaOFdrREtHSmp3?=
 =?utf-8?B?R3dyOVpUaWNlZXU1UGRKSy8zR3d1amtpOFZuY3dYM2UzblpnR0Qza1Rsamda?=
 =?utf-8?B?M0JxQkx1ZnpDM2Z4dEJuZ2RYbjZwKzJ3Nm9WMWFxNEoxQ3JEb1E2RlFLelNh?=
 =?utf-8?B?KysrL2NjeCtTYnU3Z29TTUxiWmliRk16YkFUQ0VmU1ByZ1JMalI2ZFYzMHlt?=
 =?utf-8?B?QjhJQVdxVi9zMDNkeWtPQ29odlJPUVlCQ0J6ZjY1MkZOQVl0MUh0eWhOY3FH?=
 =?utf-8?B?dnRsSkdIMkhrZUxpak5zYkFna0FFaGJjMW9VU05LRDBOYnRWRW5MZVFjQlAy?=
 =?utf-8?B?bVRLTllkZVFxVWxrL1lUbE5jSzhXMzBmczZuczh2VzU1aG9LSTBocDdqQ3R3?=
 =?utf-8?B?cmlTOURqNHFlbVk3elFuSHV0ZXpiYWhUdEFGVmp5cVZBT3o5Uno4YXpxNXhn?=
 =?utf-8?B?WDlZSWFNeHpQZHA2YmFjRUVaVjFsdk15QlNZK0crQzJBYW1DbGZmd3FiZW4r?=
 =?utf-8?B?V2hKWTE4Mkk3amQ2ak9wZWxOK3FReVJpUmNTUmxzZ2VpYWdwVXg4N0xaNThx?=
 =?utf-8?B?alhRZFFQY2ZrcGdBajF5RGExamcxMnU0YnpCcXdPaUFPeG9kYS9Xblh6Tkow?=
 =?utf-8?B?NFo1M0dhVWpSRmE0UC9ka1NxdDhWWS93N0FHREUxMk9yY0F3UUtldDhBYWk5?=
 =?utf-8?B?NkJhNzNMcGZkeVZQaXEzei8rdHFEZDhsOEpnTkl3WmJFcThnNkNNd1YxNlFn?=
 =?utf-8?B?ZDIvNWc0QmZEbGdFc2phY2hPZ3VLMUxNbmNoNnBDa2dDZVBkbi9QKzlFRGVZ?=
 =?utf-8?B?SGRUZ3pzUklKYld3cmJUQ0twU0NjNjJ2cWFtT2g5eTAyMU5xSjliNU1BcnV1?=
 =?utf-8?B?ZThGQUN4VVBLUUFxT001THo3ZUZ3eExES09wNHBQL05BYzh4QlNIRWxhNU1h?=
 =?utf-8?B?VVNhWWl3RjdGajk5ZmVPVUhyTi9nK1hYVDlVMTVnS1hqN25BVGJoTmt0VGJX?=
 =?utf-8?B?VVJSZTdqem4vQnNtclUwa1BoMzhHTmJ0VGlNR283dFFaYnVOZzVjQTU2RTFt?=
 =?utf-8?B?UUJNOW1PUXI1c1BxQUtCTFpZQlBsK2ZJc1ZVVjVPRmRIbE93OWw4NlRLWWVi?=
 =?utf-8?B?UHpXSXVqRkdyOVkycm9zS21OMllCSTBYU3dpbW56VWZuWlVGVno2ZGFuRmtX?=
 =?utf-8?B?ZUpIa0xIZXlhV05ma3ViSFFCR2xOSE5uY0FuR0dpOXNyUFNHUmxaY3JTMGhV?=
 =?utf-8?B?bHhLb3B6anlqY3VQUGRNekZPWGp6UnFBTHplVzltbXFRejkrUGk2cDNhNVlL?=
 =?utf-8?B?K0NiS3pFYWpGbng3cGRCc084SUk1OVRQbzd3RHZLeW9qbkowbE45K0U4dUlM?=
 =?utf-8?B?MXBKVTdOVkpWcDlPYzY4ZXpNSXY1SitWMW1NaER0MXVqVUR4SklFN0t5MDR3?=
 =?utf-8?B?M0Y2cGVUUnR5TnNHZlZZazFPcGNMb3RXV1RVR3FlRnh1U3ZOM21XcFpqVTRR?=
 =?utf-8?B?WFV0SXdlRXVKY21IbWNzV2lRdGdnN2NvNW9jNWJRVDBKV0dJZkp5S3poeUNC?=
 =?utf-8?B?TUpkNWdJMVBodVViR05FeFFrRHIrbXNxcFZETHJYdGhGL2JiNno3UWN3S1FL?=
 =?utf-8?B?SGR0YUlkcjAveWtrWWxtbk45UlRYeTkwMDlqcjhUY2tqUlJGVTVScy91ck43?=
 =?utf-8?B?a0Q3L0VCUjZCRFhXMVc3TEpIbk5Vd3RYRXBlbm44UU93YVBJQ3hhWTZ2LzBu?=
 =?utf-8?B?MUUxQUF0N3pORFB5b0ZOWU1xVEJVWWg3VWdISWw3Yi82NGhmTm5YamRaMGlX?=
 =?utf-8?B?d0ZHTzRBMUZZVE9VUmRrbGh4bm5leFFPVHFXZEROdXdsaWJnZjRzbHhzeTV4?=
 =?utf-8?B?Mm4zNFhmdnFWWkFFNUU0ZFRma0pBWnhmL25sVFJEOEdzaHNWVDV2aVg0QXF3?=
 =?utf-8?Q?Sci04EYnsFfr09lwNtw/lHp9UsYqpLMR?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(35042699022)(1800799024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: n3rzUjH5RJPQ8lWOvZeK7U37C2QLnh6jvXtTgZgeDU8ZGckUL1YKlvCd740Cp7kaqi78X/Qih7LOvI4+dTFZQFtnFH8tmbo6NhkC9RgKZtk6zyGSG9W9Ne/5YGb8eLTi1VPhYOgWrmU2dR+RmMneYSr0XnwsZ7YWY1LNeDKDL40cWoKwNXvWfqOCaLVg/T/bVXqCbbqsG/X4it3sNJPAwA6V5AzKkdvgDvrb+zu6H9gPZ/9xC8WmvX/8YRq+yyupEmRLADuTcmH4crxgCr4Qd21ULYzMDmB5ItqD6xyhMIm0COArZtW5wQDow/sBqLePAbafqGhkC5S9ui0jjINln29z5s54JGR9CuqHtz7idhVaVcf4GkOJiVQFjpYUPEELDmspHN/EcNmQNjs8ZByQ1oUkF6NMsUlJb878m0xWt0Q2FuDZEzYo3VacaoSK+lhtgowRK0tjGrpjzYtYRDPcujPIZxxfBQU3nZgh3mDH+bQq2S/KkVL6Ay0qHOvCRx+rm6ekc+fTmsOHTII8L2soSrXbXJK7iWLBBk4/djV/uN9vNQYZDmP27+r/a6KaER/Na9om6C7TLwtSfarScc1MZQE07r34nzzduWP2y/5y+YUB6gz7tpU7mzew21GR+DZNH16SrSvo0H7rQ2zwIdxuPHZP2n8XiEarl2rovA3oiag=
X-SM-Relay: yes
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:52:06.3041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d424207-db8c-46b8-8b4e-08dcb20f9a6b
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9735
X-SEPP-enc: yes
X-SEPP-enc: yes
X-SEPP-CCCVersion: 2024-06-24T10:15:43+02:00 98369f65
X-SM-outgoing: yes
Content-Language: en-US
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg="sha-256"; boundary="----342D3E4FFC03858743CF3BA94A98FE1D"
X-Mailman-Approved-At: Thu, 01 Aug 2024 11:08:17 +0000
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

This is an S/MIME signed message

------342D3E4FFC03858743CF3BA94A98FE1D
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-version: 1.0
Content-ID: <682B8748A868544D8D16157EEC154515@eurprd06.prod.outlook.com>

QW0gRG9ubmVyc3RhZywgZGVtIDAxLjA4LjIwMjQgdW0gMTE6MjYgKzAyMDAgc2NocmllYiBVd2Ug
S2xlaW5lLUvDtm5pZzoKPiBIZWxsbyBNYXJ0aW4sCj4gCj4gT24gVGh1LCBBdWcgMDEsIDIwMjQg
YXQgMTE6MTI6NTVBTSArMDIwMCwgTWFydGluIEtlcHBsaW5nZXItTm92YWtvdmnEhwo+IHdyb3Rl
Ogo+ID4gVGhpcyBtYWtlcyBkZWJ1Z2dpbmcgb2Z0ZW4gZWFzaWVyLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBNYXJ0aW4gS2VwcGxpbmdlci1Ob3Zha292acSHCj4gPiA8bWFydGluLmtlcHBsaW5n
ZXItbm92YWtvdmljQGdpbnppbmdlci5jb20+Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvcHdtX2JsLmMgfCA5ICsrKysrKy0tLQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiA+IGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
cHdtX2JsLmMKPiA+IGluZGV4IGYxMDA1YmQwYzQxZTMuLmNjN2U3YWY3MTg5MWYgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+ID4gKysrIGIvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiA+IEBAIC01MDIsNyArNTAyLDggQEAgc3RhdGlj
IGludCBwd21fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdAo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR1BJT0RfQVNJ
Uyk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKElTX0VSUihwYi0+ZW5hYmxlX2dwaW8pKSB7Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IGRldl9lcnJfcHJvYmUoJnBk
ZXYtPmRldiwgUFRSX0VSUihwYi0KPiA+ID5lbmFibGVfZ3BpbyksCj4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ImZhaWxlZCB0byBhY3F1aXJlIGVuYWJsZQo+ID4gR1BJT1xuIik7Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ImZhaWxlZCB0byBhY3F1aXJlIGVuYWJsZSBHUElPOgo+ID4gJWxkXG4iLAo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFBUUl9FUlIocGItPmVuYWJsZV9ncGlvKSk7Cj4gCj4gQUZBSUsgZGV2X2Vycl9wcm9iZSBh
bHJlYWR5IGVtaXRzIHRoZSBlcnJvciBjb2RlIHBhc3NlZCBhcyAybmQKPiBwYXJhbWV0ZXIuIFNv
IEkgd29uZGVyIGFib3V0IHRoaXMgcGF0Y2gncyBiZW5lZml0Lgo+IAoKSXQgZG9lcy4gT3RoZXIg
bWVzc2FnZXMgb25seSB0YWtlIHRoZSBkZWZlcnJlZF9wcm9iZV9yZWFzb24gd2l0aG91dCB0aGUK
ZXJyb3IgY29kZS4gSXQncyBhY3R1YWxseSBmaW5lIGlmIHVzZXJzIHByb3Blcmx5IGVuYWJsZSBk
ZWJ1Z2dpbmcgYWZ0ZXIKc2VlaW5nIGFuIGVycm9yIGFuZCB0aGVuIHRoaXMgY2hhbmdlIGlzIG5v
dCBuZWVkZWQgOikKCnRoYW5rcywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hcnRp
bgo=

------342D3E4FFC03858743CF3BA94A98FE1D
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
9Y7oNygYkeoqiqYZfpX8Svi9iebhrIAZ6R6XbZ3SdZgMQwY+pAP41Mcs3OAFkMa8
Qja5Lw1/nrhkHnQEokfz5+xyy/g+emV0edXahk+8vH6aRpQMXbM6P5kmMk7I7rbs
XvOxUDNepnRLic+00Vv0VdX1a2eeL506mQ+2kiPBawBgW98dGdnpjC5gF3dDXSrh
yPotiOEopIgyFFNltnFJEIhD0SpoB2RG9L4UN/0n/8ezh6EbFhTYlYihb1/6+oSB
qqBObKC63QIDAQABo4IBTzCCAUswXAYIKwYBBQUHAQEEUDBOMEwGCCsGAQUFBzAC
hkBodHRwOi8vYWlhLnN3aXNzc2lnbi5jaC9haXItNGE3ZjE3ODgtMjZiNS00OGVj
LWE1NDctYzFjZDBiZjE3YzNkMBIGA1UdEwEB/wQIMAYBAf8CAQAwHwYDVR0gBBgw
FjAIBgYEAI96AQMwCgYIYIV0AVkCAQswUQYDVR0fBEowSDBGoESgQoZAaHR0cDov
L2NybC5zd2lzc3NpZ24uY2gvY2RwLTNlZTU1ZmQ0LTU5MzgtNDFlZS04MmRiLTMy
MjNhY2VmNWMyMzATBgNVHSUEDDAKBggrBgEFBQcDBDAOBgNVHQ8BAf8EBAMCAQYw
HQYDVR0OBBYEFAuD1HIghszhOu+ZtnfNUaajco9cMB8GA1UdIwQYMBaAFMwurYmM
g+NAoyVppeqSfdI3OsfGMA0GCSqGSIb3DQEBCwUAA4ICAQCn67t6kPdNeuYINCIt
IDH6NVHyMjLy4+MMR0gVwYB1GzvjebenaJJ62jX4eNiwia56a3rxXVVU08yKbwIt
FpchbfuEvkXEOQkHpp4H2B4zzfwEmOf0/xE8qt1AuejiFrfy/QHzJKxKgV/QXnye
GphAY0IRvnM45EI2MdbF3u/xz+1lPcLseAfWCeiy2LQxAzTVHFz1E+b4V2S6Yyr1
kLAOVvZ0dlGUc1tVNtanuh/dMZ+fTban7pktCQRJI90NTdT0iNfwm7YncsH5yn2K
xwYJUgGEGMzRAdJudevVVEJhnBsMF2N70l/Otj6In5yXLuXYq75YlVJMLJOZ93Bo
wKiH+nKaHPNy16mSgZrBhBKP8oT++8jUTJPFKWiVaPKnV17zNyRgXgcFBLhlndAU
uESEDy3BqfDOOB5xOFVsfBUzyphbpZo5eXiR6oCOzf0YOGZLcXp/P4Yf0ZvvU1Ey
hJ+SnSVyhM2wn/sHeNTn/EUQzN7f9RUbGrzbdczz51MsLpUzp3NX+qZL1iy/8izS
e7vD1giSk2ygbcPg2+tbAY00xZyNZA8BYifOfDBWsP/6596QYltVONxnrNGfVZlk
ydiMp+D1NeE0k9/uAqW6v4wLjAq0TLS7fTC5utcNXDmnl9aDq9aQn95+N+rP4mcD
9wVA73PTHRG6VFstM3kXzweXHjCCB2wwggVUoAMCAQICFBa3V/uiBoK31zPhseXz
/UMQogW1MA0GCSqGSIb3DQEBCwUAMFMxCzAJBgNVBAYTAkNIMRUwEwYDVQQKEwxT
d2lzc1NpZ24gQUcxLTArBgNVBAMTJFN3aXNzU2lnbiBSU0EgU01JTUUgTENQIElD
QSAyMDIyIC0gMTAeFw0yNDA2MjAwNzU0MzdaFw0yNTA2MjAwNzU0MzdaMG4xMjAw
BgNVBAMMKW1hcnRpbi5rZXBwbGluZ2VyLW5vdmFrb3ZpY0BnaW56aW5nZXIuY29t
MTgwNgYJKoZIhvcNAQkBFiltYXJ0aW4ua2VwcGxpbmdlci1ub3Zha292aWNAZ2lu
emluZ2VyLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALTH/7yL
NeeXRymXxM9YBR8E/yuPjeb7aHTCMHyPKrt+zl1aQKn4w/WLWOLRROv7uDhTupth
bRe5OVLDnieu+PnC8mIHX6AcRVCgh/mX+5btCITVwZFlmVIToGX4n9L7qRRb63VZ
0StrfHcQ4hP7K7W3if23V5a1448E00TZsINfZoJvY9Eb5t4415r2799TKBQ7dejU
XQN4UtVCGwIAVsqmOGlkZ9/zD4aCLvTCMLZNdryBRprOpdFnQzakJVD6VQKzypvr
0xz3NasdEYWfZiX5cqtE3djni/CL1spqCK1FZBen789mhnixlKsaEsQ5ftaLRKkE
cx2KR7XqMYXspK5IsEZ1kZE8H0k47XRlbSyao+rAA0CfPimgKWJB/x2ypUs0PZc2
SFlLCBi3tqVIJV86b99b3eH1KQwv442/pm4u01uIjtjZEUWi8+MS+ne4+Q1lydjd
ESy2Yp9v9ooVJJwA++dtZ3bqXT/OqQZymbKn2OX6Xei5/48QUf5RD4RN64REesjF
3UnBwoXhmuoXprQs2Mqgx42taEq8HGIADI9XYzt9UoulF7Lwlg2ERb/CzGx3VGmZ
oCAbfwL60l6IrTitLjM/PJK2fucCGNt2PoEXU4IG8UfHqL4/LWpUqTNCLb3t21ZR
3wom4EKvTkRBBafKbzKcNAcqBhdYQ6KguRYbAgMBAAGjggIbMIICFzCBsgYIKwYB
BQUHAQEEgaUwgaIwTAYIKwYBBQUHMAKGQGh0dHA6Ly9haWEuc3dpc3NzaWduLmNo
L2Fpci03OWI0NmZhYy00Y2QyLTRkNDItOWZlMC05Y2QwNzhkMTNkOGMwUgYIKwYB
BQUHMAGGRmh0dHA6Ly9vY3NwLnN3aXNzc2lnbi5jaC9zaWduL29jcy1hYWNjY2Vk
NS02NmU4LTQwNjktOWIxYi1mZDI5YWI3M2VmZWMwcgYDVR0gBGswaTAJBgdngQwB
BQEBMAgGBgQAj3oBAzBSBghghXQBWQIBCzBGMEQGCCsGAQUFBwIBFjhodHRwczov
L3JlcG9zaXRvcnkuc3dpc3NzaWduLmNvbS9Td2lzc1NpZ25fQ1BTX1NNSU1FLnBk
ZjBRBgNVHR8ESjBIMEagRKBChkBodHRwOi8vY3JsLnN3aXNzc2lnbi5jaC9jZHAt
ZDUwNTdiYTAtY2UwOS00ZDFkLThjYzktMGE2MGZhNGM0OWMwMBMGA1UdJQQMMAoG
CCsGAQUFBwMEMA4GA1UdDwEB/wQEAwIFoDA0BgNVHREELTArgSltYXJ0aW4ua2Vw
cGxpbmdlci1ub3Zha292aWNAZ2luemluZ2VyLmNvbTAdBgNVHQ4EFgQU7kSuCQze
9cYnSYrKpcxE5xmLCNkwHwYDVR0jBBgwFoAUC4PUciCGzOE675m2d81RpqNyj1ww
DQYJKoZIhvcNAQELBQADggIBANM4nto/dVNbvkxZuSluLizU7QHFhREyYKtgs/ll
lDIN5EWWFOUT3LVR30Khy6OwZGSzMLRZWCCXtS8cHn6czFRMzSKFVMjxpMXBHBPL
3OrPKg9cXdEsDV14YR7ebJqVaMj6iUM/zs6T+xLBQq6grIpYzNnDzeHrNBt2M7Ha
D4Cc2Xa+zBhzS8o/KyosAM8y96W+TYiWuWJHapOQkrKc81YhM9ZwR3RZA9ha4sfL
KRs9S8x2EfAWzk951vNM3H02eO61EbA4/Ziqwbav1QS+kL3Y3hpN+F8MDCb2EN3l
eg3XtsJ6548fKfrZXJYErTQKpxEburCY716ZbJpxaKrZjKuFTNA1q8BYp07tlNsr
5YVNQTtUGP/kMrYyI5uqJ9W/IPFxjzpCN4t4uf6y/GEzwk3a1zgEHtqBIhxGZ0oI
LVwQ7mf5Es2aRiJrsiHEBsX175k5ppTASvkzVA+qucXb6O1nZs9INyFGes5/SAgu
gGNwmf952/sNuMjwoeWa5CB0ukXkwhHI9l7K/HWKWYCYjOPevhTG+wSLP7st1wkN
04Uh4lA1G9hpenPa9RsII49WLRpwOBxYCI3LCf+jIO6Eb8nUfBbiCK3XgfKMV8iN
866P73BrePe9kQfsE231xeFNoj18l1Xa9T8JyD6Z3WX+OwXpRv+CZZ1KlR2jc46o
b6olMYIDezCCA3cCAQEwazBTMQswCQYDVQQGEwJDSDEVMBMGA1UEChMMU3dpc3NT
aWduIEFHMS0wKwYDVQQDEyRTd2lzc1NpZ24gUlNBIFNNSU1FIExDUCBJQ0EgMjAy
MiAtIDECFBa3V/uiBoK31zPhseXz/UMQogW1MAsGCWCGSAFlAwQCAaCB5DAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNDA4MDEwOTUy
MTNaMC8GCSqGSIb3DQEJBDEiBCBRbo47EnkXnDCxlDGTWzft1/ohloKjtgNX29GE
Vi0XTzB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYw
CwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG
9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASC
AgCZIvw2A91DvWchHdwvqBattxcrIqx8bqqtLxUNQqDpC6TbU2GLDkzhkF3ttMoG
TUfFRx7eqltPUBAJpMw8jV9hhbcZcBcqO9FTVaNl/l1rhmNwHxOKgreTunGjUidf
Kxbgdy5AoA5Di0Of0xdX3LQBNpa4qGWfnzWcLwkalX12rcGB1qTUrGwaRcjDWjPZ
zE/XWnkgJHuH6fTUVDvxPfgKKrphAO+9WG7WNxjAhVAm6Z7qk+CdahBPoP2+4c04
ovfxZ3dNPms2uqpdwu9yvuvJxjEDWaqljTzl4kFs7sp8sKdWoAJ7UKU/z1u10N57
rTwkZs+DIvG6Oj8waQ5rCpF2ecy60eFhULfZI58tFaVjhylQ8p5CLRGtiuonX6lC
gZy5NNsrYMcc9Jh7DM2s/6Evdw4nS0p0pM2LhfesRU2UQvVTpb6hJJiDcAZbtRrk
P2ZuALKAT6iFP372SEgASPEDptm/D8wHTuUpxkxxHQkagQR3l526NiRLgQjRtGEP
EHCSmnTfmHYmIHiAPGMHWQRJ2AF0V/0xpNYckhXJvO63d2U+ghSFsJtjI45nz8n8
sy4yw3FG+lheSkcFo+cx2OJdSH1qDz8We+SHfqcm6DpKIplbOTteJxmaBCcZiG0v
yLcaBk7PwN/v5IgMzuY4/wK1ewL48uGJe4HtEsvg177yOQ==

------342D3E4FFC03858743CF3BA94A98FE1D--

