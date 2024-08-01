Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026BF944A0F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 13:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EBA10E90F;
	Thu,  1 Aug 2024 11:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ginzinger.com header.i=@ginzinger.com header.b="gDA/A7KB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hz-relay01.de.seppmail.cloud (hz-relay01.de.seppmail.cloud
 [162.55.72.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C41310E054
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:12:52 +0000 (UTC)
Received: from hz-relay01 (localhost [127.0.0.1])
 by hz-relay01.de.seppmail.cloud (Postfix) with SMTP id 4WZPsv0173z1Ll3;
 Thu,  1 Aug 2024 12:12:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=ginzinger.com; h=from:to
 :cc:subject:date:message-id:references:in-reply-to:mime-version
 :content-type; s=default; bh=ed9I/YjgATx0TLC0ggmac2C6M5WTwf2/YpZ
 kzGIqnQs=; b=gDA/A7KB5i8izV1n2LFWrko0olE0oTih8xgo6c6JGah+IAFHRI1
 nBZ3u3/JpO8e9AHF62KOT96CWHj7l+AELVjb1ReTmIhp3k3x0dTNQZdXoGNYlNQ1
 5IOzYATvdl3TNhcQwpqHCKKuYRhn3Md05JIJFfV6N/pRyo2vAtCIHOhsmnZf8Zo8
 V5IVs/mP8juaR6W28VV76JfyS9Vj+hO87XBmydbMcgGqkDa7b3g26IeT4FhNDdbr
 CO5Nwl/Lc7DpPvpfiYQ2hBgoFyZ5QZ9YIltx8Sw0qHZI9IBhhyOA1V4eeam1QbKA
 2yxuxfWljiaOcxHyJ+mlNclCluoYueK2d1A==
Received: from hz-outgate03.de.seppmail.cloud (unknown [10.11.1.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by hz-relay01.de.seppmail.cloud (Postfix) with ESMTPS;
 Thu,  1 Aug 2024 12:12:49 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (not verified))
 by hz-outgate03.de.seppmail.cloud (Postfix) with ESMTPS id 4WZPsn1lRZzGntt;
 Thu,  1 Aug 2024 12:12:44 +0200 (CEST)
Received: from AM9P250CA0030.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::35)
 by PA1PR06MB9114.eurprd06.prod.outlook.com (2603:10a6:102:454::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Thu, 1 Aug
 2024 10:12:42 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:20b:21c:cafe::fe) by AM9P250CA0030.outlook.office365.com
 (2603:10a6:20b:21c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Thu, 1 Aug 2024 10:12:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 10:12:41 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (104.47.51.169)
 by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Thu, 01 Aug 2024 10:12:40 +0000
Received: from AM0PR06MB5155.eurprd06.prod.outlook.com (2603:10a6:208:f3::23)
 by VI2PR06MB9449.eurprd06.prod.outlook.com (2603:10a6:800:224::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Thu, 1 Aug
 2024 10:12:37 +0000
Received: from AM0PR06MB5155.eurprd06.prod.outlook.com
 ([fe80::7c6d:514b:6060:6088]) by AM0PR06MB5155.eurprd06.prod.outlook.com
 ([fe80::7c6d:514b:6060:6088%5]) with mapi id 15.20.7807.009; Thu, 1 Aug 2024
 10:12:37 +0000
From: Kepplinger-Novakovic Martin <Martin.Kepplinger-Novakovic@ginzinger.com>
To: "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>
CC: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "lee@kernel.org" <lee@kernel.org>, "linux-pwm@vger.kernel.org"
 <linux-pwm@vger.kernel.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] backlight: pwm_bl: print errno for probe errors
Thread-Index: AQHa4/MG2ey7MN3ie0Sx84j5EsF+tbISIdgAgAAHKgCAAATOAIAAAPMA
Date: Thu, 1 Aug 2024 10:12:37 +0000
Message-ID: <27b41b77ec4071b29402592f2084b30c17ca1d6a.camel@ginzinger.com>
References: <20240801091255.1410027-1-martin.kepplinger-novakovic@ginzinger.com>
 <fjke5js43aqxdxmoau2l275a26o52sq7hyjgzwxnnsrptqlcvs@mohkvblfqkhg>
 <00f4f77151de3c3a4964fe697a7d1841c670284b.camel@ginzinger.com>
 <3ghsuulqhfqvktfqbo7hfewpgu2nbyxahjxmoqfkvpceepmqih@axneh72aegog>
In-Reply-To: <3ghsuulqhfqvktfqbo7hfewpgu2nbyxahjxmoqfkvpceepmqih@axneh72aegog>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM0PR06MB5155:EE_|VI2PR06MB9449:EE_|AM2PEPF0001C70F:EE_|PA1PR06MB9114:EE_
X-MS-Office365-Filtering-Correlation-Id: 3022cff1-acb0-4edd-1570-08dcb2127ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?bzFzRkpVZENRZW5SMzl5WDlWZ2U2N2hCK045a1RJQVZ1aU9GSXQzSm1scjFT?=
 =?utf-8?B?OXgxYkhYdkk4MktVWHNRaG00Sm4vczBDdnVSdnd4SEF6aGtRSHkxb3diRUp4?=
 =?utf-8?B?MzhOdXZlSDBrL3dtZHRsY3RPbE4vUEMySERHNFBpbW9jdFZla1hLVnFaZTdm?=
 =?utf-8?B?NWpXT1RYdUtjSWU4YTdLMmg2dHVyKzdBVWMySm4yOUNKOXBJNjkzdVJzTTlR?=
 =?utf-8?B?QWx4a0h4dVRhQWdTdmV2RVVFRkFmNjg1bVBZT2NGS3pHL25yQWc3OER3bjJn?=
 =?utf-8?B?MmFJNzkvSU00RG9tTlYwcFF6U2tET0VBZElSTno3Sms2Z0hiMnJxSUhMTTNq?=
 =?utf-8?B?QTlxSC9yTnU4cENCOStXNUxmZHVJMmM4YzFNblRVV1Q4d0p4cEEwZm9JM1ow?=
 =?utf-8?B?YzJCdnlSN3NldTZaT2xaaCtua1d3eFZjeThKT3JoenhxNitZRGpWTUlLZnlB?=
 =?utf-8?B?RXJyM2hOTVUxTGl5eVR1NC83QlA5RW5OTFVMSkI3dzlmNDFYazNuRm1CeGI5?=
 =?utf-8?B?WXdvU3JEQm1peWt6NXVQOXYzeXZPb1c3T21yejZSVXRWRXdaVzJaMzVsOWcw?=
 =?utf-8?B?NWFjN2Z2UGhZV3RRK29vN0RKcWNXMFVBaTR1cGFXK245cFEwSEFIaURUT0d6?=
 =?utf-8?B?RmF4NE5hN1d4ZzJvdVExQ1lXSWIvdElIR1NkWUY0QldQNmphODI5SnUrT0Ez?=
 =?utf-8?B?aXVJZmt0azE1TWp4cmlIUVhvNUdid0Z2Zll5SEtQc3RwOEJ4MGZHMHdBbSsr?=
 =?utf-8?B?QmRYbzB6RnhtN0k3M2diYzhTNkNSbTd0aXdjZFRzbFBHSzdkTncyNjFNNUFZ?=
 =?utf-8?B?R3FTc25PMk1WUFNlbndIZGhaNDErY1Y4UCtyMHk5SGVjRnFLK0hpcGJSKy9J?=
 =?utf-8?B?K2xaL1pwblVFS2ZmVTk2K1VzVWNldlROeHFMUEQzbWRyeGcxdkFLWHZBdFUy?=
 =?utf-8?B?SHhPSEU4bno2VmxwS2VvYzZZR21zN3E1V0dCMGQ4TUpUOXpvMzloRDJIeVdD?=
 =?utf-8?B?V0pBZHZhb1lhK2tRSHlWRkpiT2YxOUplR2RVUHZJdVJ1SnR4M053Y0RlZ1Jx?=
 =?utf-8?B?MExjcWU5SDRkQTBoSy9jV3o1Zk95TlV1b08wekh0OGtRUm5jQzRFaEtPbjVh?=
 =?utf-8?B?d0pycWVwWVdLK3d5TnFYaGJKSi9RRmYwK1dnc3pmWHIzaU1SSlB2TDFOS1lv?=
 =?utf-8?B?ZkVGeHhDM1hEL2ZYUGR4SllkQWpvc0s3d3lwVERaWFF6WFpLemxOOC9qb3B2?=
 =?utf-8?B?ZmJJMWxheUhsa2NLTXB1ZU91Q29uRHBJK1d2bmZGeVNjOExJbFE5bDZ2SUZy?=
 =?utf-8?B?RWhqSW8zTkIraTVLcCtWWm9KUmp6YzdRYVpxVlVFMDg4a1AwWndqSXJQcEJv?=
 =?utf-8?B?SGtBMGhJZ3ZNVWhvZ3lhMjhreUs1RnFiZnljSUN2VERldTRPRU12aHdudU5U?=
 =?utf-8?B?b2tZRU5tR3U5Ymp1clc5K2JQR3JJYSszY3E1ZVN2dHdnRzRsQUR2a3EyNzIy?=
 =?utf-8?B?Q1JIRkRNTStnS1loQTF5S3AyUWhjd01yeU8rTUZ6M0NNc1c3OWo0QnlSSkZD?=
 =?utf-8?B?SGRvVjg3TCs2U3luUC9wNVRJdkhWOTM5MlorWVNMYVRtOU9uWk9rbklxNllE?=
 =?utf-8?B?Z3JsbFJZVHF6VEhTQUdOaG55Zzh4dTdGRTVYY05TOGJjZG1aQ1ZMdE8wUGpn?=
 =?utf-8?B?OUVDRWNUUFNreG1LZUN6cU4vMm1nYWV1bkc1eUZCdFQ4Q2UxbmRiY3VBMjdp?=
 =?utf-8?B?bjUxSXhHSjIwUWRmNUdkVGNJdVI0Zk9uQmp1ZDI3eE5MV0I1MjVKRG1OL0dn?=
 =?utf-8?B?aEwzdDJORzVrTnBIUTIvMm12YWdDajZZbU1MZWFpZ3BuVDdPR2lMbmlkL2o3?=
 =?utf-8?B?OGhGa2Vob1RDcTBjZFRGNjVmZGN0dGxsamRod3FnWHkxVVE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR06MB5155.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024)(38070700018);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9449
X-CodeTwo-MessageID: 2e36bf29-c215-497e-8623-f91d9ec28eb2.20240801101240@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: acdd616e-0746-44c7-2078-08dcb2127821
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2xzRVdVeFlIM3dSWm9MRk0vQnAvcklnSVN6VDhhVHQ2bys0UlVLMkNabE1n?=
 =?utf-8?B?SENCc01XYjV2bkV6czdpNThVbjQvZ0E1S3kwQktQSE1MRG1OVi9CeU9Ec3dv?=
 =?utf-8?B?M0JWUEFqN25CUWZodlVYM0RNSGZ2eVVnRzR3ejZGVXh5YW9RWmN4blJKSVJa?=
 =?utf-8?B?TmF3ckhoc0VoalFwRlJHbGl2NStLaWVLdE1FWTJBMFNEdFpPa1A0a0lyTW5F?=
 =?utf-8?B?UUZVZFhSaFNOcElPVk5EdFA1R1d4Vkpnay92ZUF4VEFCWEU5djhuZjRkaVhw?=
 =?utf-8?B?K0dxVTA0ZHhaeTFGSlFld0VHYk5Fd2VreWw1a1Q5MjRtUENUZDM1OXFqd01Q?=
 =?utf-8?B?UDhNMTRkaWhWY2QrTmpORFNYM2VnbExUNmdEY01mamthenNrNElwMC9Sam9z?=
 =?utf-8?B?TnlUY2FpNG1DL0hWWnVqcDdBZFpGWXBhOVQ5OTRzK3UvZGx5ZWJLT3psN0xz?=
 =?utf-8?B?RUkzWnpCWUNORWhjRHJnejl1UUNlYWliUWNDUE85RTVhQUFKUkpURThDQzh0?=
 =?utf-8?B?YkcvL3I2T09IdG9VbHNkZzZCYUNUT0N5WitlU29VUERxb2R5SmFwdC92d3Jr?=
 =?utf-8?B?amNNSERBNXZMdHhYNC9vMmhqT2N4SVV3WG1DODFHaE5yZjhTM0JBN3RKa0Jj?=
 =?utf-8?B?bE1mTmgwTEtIa0xjcFM5OGNuaGZUQjNlY0tkcWRrTElZNmo5a3AyWnVxZFVK?=
 =?utf-8?B?MHV6WGVlb2ZzRFB5dkxIQkNvQzk1TWsvTTZOYStPNXNZeGllc1BGanFzTFJt?=
 =?utf-8?B?cTFWT1g2cTZDa0tZaC9MWUJUbnVua01uRk4vUmhqVlJ2eHZZWkIreThQSVZL?=
 =?utf-8?B?enltTVFjUlV6LzR0cWZ3cVFMNUdPSE9XY2RsbHN3ckhGclpkLzRHOHFQb1U2?=
 =?utf-8?B?Y041WjZVcVdONExyYndqeVB3OEUxTStUUktUK1BWZ0M3MFBZb2xTd0R1Tmxi?=
 =?utf-8?B?ZTFiL204YXVxTTZTT1U1YTM0SERyL2h1U2ZCRnMzM1lVNlEwZ0IzbXdaRXdN?=
 =?utf-8?B?c2V5a0hjNVJnY3RCV2szSU9HZStvZ0hqWWFoNW01MW9EYmVRYnRHWHM0NlNL?=
 =?utf-8?B?QUdJMS9VbXlYaTZ1dUFlWVhTMldpNURZSkJGM1p5bi9tK1h4eEg3UjlQeTZK?=
 =?utf-8?B?SThhazF4VUpHU29ZK2ZNWktVU3o4eWNMeHEvZS80NngrK1daSVNZdW9DSzBE?=
 =?utf-8?B?WStERXBWci9RczZ5MG81cVNzM3MrTmYzSm5qWGVOU0ZML2lmaWYrTUZxZjRS?=
 =?utf-8?B?K3ZBRExGNVlmcFlDbkNnUlNobldMd2cvWklnemdqZ0JGVVFaTGxZd2s2SzA4?=
 =?utf-8?B?YUxSSllkNHV0V2NQNGZnd1pIVW90ZnppakhJUHRvVTUyYjREcjZxTzJKUnZs?=
 =?utf-8?B?bEZ1dkFrWEFUQlV2cXNUanhvVWxCaXV5bnBVM2d1M0x5Yi9NSTh0Rzg4eDRl?=
 =?utf-8?B?c0tEV2pld3ZFa1NSWUlkYjVnVTZVSlVFZEFGVVpoblp5MVFudE5UeGVSTHhC?=
 =?utf-8?B?K3kyU0duVVRFc1IxSlM5bHdpZStBMzhZVk45S2VUVzZKb1dvY0JOd3doY2ZH?=
 =?utf-8?B?MDErbCtPUGZLRFhUWDNWeUdUMUNzdGV3L0tqUGpCM1c4cEV4NlVFaC9zMGRp?=
 =?utf-8?B?UkFhZFRpYTVqcFRBZ2VzOHdwMmFQZGJYTUZzNitPRkV2YWw0eFNubm1tWTJz?=
 =?utf-8?B?Z3ZSWnB2eGtCbGIzOVVydDlTVEJNUlpwdmJvOXlQcGpvRUNaMTJPNlZGYWo3?=
 =?utf-8?B?V1JOVk5zNytsOGtha1A4YnpsK1BvODY3UkE4eVJ6SEV6SVBnL3d3c1c1dUVa?=
 =?utf-8?B?VlYzaDNxUzhqbzlEVkp4VzMyaWw1OVZnREo0d3ZPUXNPd2lFZ3pJNGw3MEtC?=
 =?utf-8?B?eC81VEhkZVUwNUJxYWYxaEhNLzU2T1VBY0VPT293am9qTzNyR0t0cHNZL0pj?=
 =?utf-8?Q?FiCJmsjeJFX0eKAKLREAr7GHT7JutwPx?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(36860700013)(82310400026)(1800799024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: uIR1StiwOJEkygt0C5P3lGEffWBD8iSjqVEnzVQWBG6C4q4gwOPkU5hyb7SXAB6dYr/ILAaijfnsh14QNsYmIdxAEay4OpjlO0fDDJ2dNqpkBpbCNzZCBdYfPx5vnHHC6KWf7XlCeiv6PM6M/3j440/nTa96WLfvMLPSYtOx7WN640OXxNP1X6Aco/G6LByP6zMfSdq0D0rZ3fMsoJp+DnxIP0SpYbcNE8XvKZLna1pkpvu/0zRs2zsnpvjYLWqKgGM2Ul0uv7K5byPw2rp6PoMj06cAXZIC9qWVzcJ2P9/oyzimN7LMwnziTVXP1bvXd1MFX4R35RwIZ/qjpO+dolCL2c73JxICW4zEcgWXEVlFIjG3xvFGgzNWvMhW12/xkHL4u1SWJeYlJcThWP/IATJthSiNqhQOuQsWFyPUoJ7R5O3SJjItbSUqNRe8fYE206AxwfNTnWzwAyARvTOcCn/aGiiCN+XyYn5VnbzWm4MZvs7do4doGRgIaF8G44X+E9tZVltFgTxkYp9FswW+bgOVW6DLwKkt5sNGGDajR6/lYaMLH1rUBzUkdHmTlftoNkb9XGLZIu12h6LXAswmOMLnJR1L5dsyhD6Mxc7SX8dBrtQRrdx+RXWgv1CbLVdNOmNg2aDeHFaFHunVhkeKImbn31DpczmExUhDsv8pFE4=
X-SM-Relay: yes
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:12:41.8125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3022cff1-acb0-4edd-1570-08dcb2127ac4
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9114
X-SEPP-enc: yes
X-SEPP-enc: yes
X-SEPP-CCCVersion: 2024-06-24T10:15:43+02:00 98369f65
X-SM-outgoing: yes
Content-Language: en-US
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg="sha-256"; boundary="----CF9FA5942347830C18C053548FD37DB4"
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

------CF9FA5942347830C18C053548FD37DB4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-version: 1.0
Content-ID: <710E11B82D8A434BAB356DFA2515B582@eurprd06.prod.outlook.com>

QW0gRG9ubmVyc3RhZywgZGVtIDAxLjA4LjIwMjQgdW0gMTI6MDkgKzAyMDAgc2NocmllYiBVd2Ug
S2xlaW5lLUvDtm5pZzoNCj4gSGVsbG8gTWFydGluLA0KPiANCj4gT24gVGh1LCBBdWcgMDEsIDIw
MjQgYXQgMDk6NTI6MDFBTSArMDAwMCwgS2VwcGxpbmdlci1Ob3Zha292aWMgTWFydGluDQo+IHdy
b3RlOg0KPiA+IEFtIERvbm5lcnN0YWcsIGRlbSAwMS4wOC4yMDI0IHVtIDExOjI2ICswMjAwIHNj
aHJpZWIgVXdlIEtsZWluZS0NCj4gPiBLw7ZuaWc6DQo+ID4gPiBPbiBUaHUsIEF1ZyAwMSwgMjAy
NCBhdCAxMToxMjo1NUFNICswMjAwLCBNYXJ0aW4gS2VwcGxpbmdlci0NCj4gPiA+IE5vdmFrb3Zp
xIcNCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcHdtX2JsLmMNCj4gPiA+ID4gYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwu
Yw0KPiA+ID4gPiBpbmRleCBmMTAwNWJkMGM0MWUzLi5jYzdlN2FmNzE4OTFmIDEwMDY0NA0KPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYw0KPiA+ID4gPiArKysg
Yi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYw0KPiA+ID4gPiBAQCAtNTAyLDcgKzUw
Miw4IEBAIHN0YXRpYyBpbnQgcHdtX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QNCj4gPiA+ID4gcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBHUElPRF9BU0lTKTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChJ
U19FUlIocGItPmVuYWJsZV9ncGlvKSkgew0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldCA9IGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUihwYi0NCj4g
PiA+ID4gPiBlbmFibGVfZ3BpbyksDQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiZmFpbGVkIHRvIGFj
cXVpcmUgZW5hYmxlDQo+ID4gPiA+IEdQSU9cbiIpOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImZh
aWxlZCB0byBhY3F1aXJlIGVuYWJsZQ0KPiA+ID4gPiBHUElPOg0KPiA+ID4gPiAlbGRcbiIsDQo+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBQVFJfRVJSKHBiLT5lbmFibGVfZ3BpbykpOw0KPiA+ID4gDQo+
ID4gPiBBRkFJSyBkZXZfZXJyX3Byb2JlIGFscmVhZHkgZW1pdHMgdGhlIGVycm9yIGNvZGUgcGFz
c2VkIGFzIDJuZA0KPiA+ID4gcGFyYW1ldGVyLiBTbyBJIHdvbmRlciBhYm91dCB0aGlzIHBhdGNo
J3MgYmVuZWZpdC4NCj4gPiA+IA0KPiA+IA0KPiA+IEl0IGRvZXMuIE90aGVyIG1lc3NhZ2VzIG9u
bHkgdGFrZSB0aGUgZGVmZXJyZWRfcHJvYmVfcmVhc29uIHdpdGhvdXQNCj4gPiB0aGUNCj4gPiBl
cnJvciBjb2RlLiBJdCdzIGFjdHVhbGx5IGZpbmUgaWYgdXNlcnMgcHJvcGVybHkgZW5hYmxlIGRl
YnVnZ2luZw0KPiA+IGFmdGVyDQo+ID4gc2VlaW5nIGFuIGVycm9yIGFuZCB0aGVuIHRoaXMgY2hh
bmdlIGlzIG5vdCBuZWVkZWQgOikNCj4gDQo+IEknbSB1bnN1cmUgd2hhdCB5b3UgaW50ZW5kIHRv
IHNheSBoZXJlLiBEbyB5b3UgYWdyZWUgdGhhdCB0aGlzIHBhdGNoDQo+IGRvZXNuJ3QgbmVlZCB0
byBiZSBhcHBsaWVkIGFzIGl0IGRvZXNuJ3QgYWRkIGFueSBpbmZvcm1hdGlvbiB0byB0aGUNCj4g
ZW1pdHRlZCBtZXNzYWdlcz8gT3IgZG8geW91IHRoaW5rIHRoZXJlIGlzIGEgdmFsdWUgYmVjYXVz
ZSAidXNlcnMNCj4gZG9uJ3QNCj4gbmVlZCB0byBlbmFibGUgZGVidWdnaW5nIiB0aGVuLiBJbiB0
aGUgbGF0dGVyIGNhc2UgSSBkb24ndCBzZWUgd2hlcmUNCj4gdXNlcnMgd291bGQgc2VlICJmYWls
ZWQgdG8gYWNxdWlyZSBlbmFibGUgR1BJTyIgYmVmb3JlLCBidXQgbm90IHRoZQ0KPiB2YWx1ZSBv
ZiB0aGUgZXJyb3IgY29kZS4NCj4gDQoNCmhpIFV3ZSwgc29ycnksIEkgYWdyZWUgdGhhdCB0aGlz
IHBhdGNoIGRvZXNuJ3QgYWRkIGFueSBpbmZvcm1hdGlvbi4gSQ0KdGhpbmsgaXQgY2FuIGJlIGV4
cGVjdGVkIHRvIGxvb2sgYXQgZGVidWcgd2hlbiBkcml2ZXJzIGRvbid0IHByb2JlLg0KDQp0aGFu
a3MsDQogICAgICAgICAgICAgICAgICAgICAgICAgbWFydGluDQo=

------CF9FA5942347830C18C053548FD37DB4
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
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNDA4MDExMDEy
NTBaMC8GCSqGSIb3DQEJBDEiBCARATKAZVrbaMHJgrGx4Dg+Ar9pljwT0DfGOU10
09eV+zB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYw
CwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG
9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASC
AgCimL9DHoKdfJRDgS2ZOkmXf+FqXOZlr+NL9LfJLrHf3lsFbMTbHaSmEiC1hxif
P7h3c7uNKWPnU4i5RHkZxnT8R5S4Pb9t/AHOFHKrsoH6GW1mM9dqgZ+nDXkC+6lR
IilT0REf9nxSeuUnuGKmMKdJCsFrI5eu4G7ppQr1UiaAOe78qdJ0T9v0pSHZeeTk
ZcTGuWh++8z8YuZJb5VB2hbsN5rNXxgsWhn/DzFTP517GUtBe1a02Ii+crheBblo
SvjJBXGouR59bSi82HVGT/7nlCngAyzSMrMPitP38WtJLA1/D6SVITtgyELKmSfJ
aclO40GJdatqkZj1Q2vNaHooLNuuvlm6q/aMZ5Iukclbfft9ssqGNZedoenFS9a8
OuIjM7HppL74EI0hURZ+3156Wf7v3PD13KofLaiHhZpAzfoNVn1Mfg592fQCaBnh
3fDnt0jnPusTIpUg64pfAmwqHntJeWkf+hLTvga8GZJ6u5kwADwA7xTui11r01Gw
93LvnyUETyaTUSw9C+1G8wUlyhlthzP87f6KeHy3eUkC64jIWodl8/AChbHvHqv0
+O/rXzekZESeDUXxjZ8EfMzGsFLuDS4uijceCgj/6HH1vn7lTjZcnvCcn6qEqthv
35qSiht/TAuvr6WhW1xMv+6Mwj7mzDmN3htNSgHkymsrZg==

------CF9FA5942347830C18C053548FD37DB4--

