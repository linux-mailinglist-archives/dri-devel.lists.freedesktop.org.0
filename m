Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0B8B38535
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 16:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A2010E82F;
	Wed, 27 Aug 2025 14:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="xJ/+++/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021100.outbound.protection.outlook.com
 [52.101.65.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0A310E11C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 14:42:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWRn05t8AqIG0mEF/dotnA9L+8+/O34H/DxGh9NuZjqFwJE3pt+WOr7Ag2mj4RQuEsjK5Eta10q/Mk6B2OQHXvBkDXfBkbjA7EFyCBl+0lhsVXu1IfrfbnR0fyCXp8k02S5nSL3qGn20bPcNkHcTYWxqVDiWbKYHx2uA4kPo/QN9AB57vbDR7uHFJ1aZguUTluyfRq8ggAyFBoNlU0iF8yEMOJfdF25djORPMl/gW6vH+aNwb/+qNCIFV/L9xQ4M8WoeAqD9KCk5jg+UJR7o7jht8oLAcoxHPLWTBcxn1UDUuvic9tXBl9vrsUDyef4eznmL/oy2BeLpg3AJ++YsqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5m7h4bypQol3oPz6YA1ohOQVn9oyvANPEl5p5U1EUeU=;
 b=n5u7qw42iIlRHB/YD7/iPcFAOnUuozrNEYQGLD0HuSM5kvh4bP32fr+wxgJoYXUtnxplcX6rYerPR6DWZnDBoQSg/Koxbt8leyvZkW77ZOuxgn2mLtig/VEf4AkH2ur1j775Cp4DsS8epEKdQBIZ71puBwN1kRL4TtiC031AayTAUNed8FG5Rs0ScTeSn5dlejRXJgRAN0D4q574GKl8smM5wVKFD1RhixzlsC7b9Jh/vk0gw5rrw7HCd3P/2jq5hLbX1vTQQ+pWLuf47FGyxbq2gBxIPdT6zX/EQzt1nCU8XQ1Tu8D5wyCNpT5KGT0NFP9ZustR8SIMVTxSlB1b8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5m7h4bypQol3oPz6YA1ohOQVn9oyvANPEl5p5U1EUeU=;
 b=xJ/+++/DjvViPCYQFfoQ8lyjgaU++2FX8EoGoqPaGcsTksfaM5rssHj7iOhOBk7Xefe9co7qr76zgjAM4mRoUqkW/Qmfv7IwRXv4/WTzUcz4lD/Cx52x16FMABeYdxqcqQ3j8F+qRqcRXUBa8gWzo9eJ7gjcYwNuJ8SB+nDoGc8+doDWTbI91T+gJAAPyeB9CNo+OusL2RXd3mN24oXvoJOQgBwwMDrMrKwjwSV4i/wVvVeoCDyIjq6PEaja6kJ1UQLc1dRZh4LmKFACkplWaiHZtRxI0jlTQOce54NZEH9SI5Liq8blPw7KILEXFO61HitNylT9yme8I6gwzm+0VQ==
Received: from AM0PR01CA0171.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::40) by AS8PR04MB8387.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 14:42:02 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:208:aa:cafe::8b) by AM0PR01CA0171.outlook.office365.com
 (2603:10a6:208:aa::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Wed,
 27 Aug 2025 14:42:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 14:42:02 +0000
Received: from DB3PR08CU002.outbound.protection.outlook.com (40.93.64.80) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Wed, 27 Aug 2025 14:42:01 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DUZPR04MB9981.eurprd04.prod.outlook.com (2603:10a6:10:4d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Wed, 27 Aug
 2025 14:41:59 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 14:41:59 +0000
Message-ID: <24a5e0b1-592f-4e74-a938-c261c8ce8536@topic.nl>
Date: Wed, 27 Aug 2025 16:41:57 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v2 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
To: Maxime Ripard <mripard@kernel.org>
CC: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20250819053205.9976-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.9365be0b-205e-4d59-ad18-c1924bf45277@emailsignatures365.codetwo.com>
 <20250819053205.9976-3-mike.looijmans@topic.nl>
 <5dc6mmx26aa6qoig5wkei2uozdjmx5r2uduhc5wtja7dhjdypj@fincrfpg5u3s>
 <7d57e55a-223f-4c3a-8806-1ea616b56d02@topic.nl>
 <20250825-red-bear-of-infinity-054eb7@houat>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20250825-red-bear-of-infinity-054eb7@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR06CA0103.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::44) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DUZPR04MB9981:EE_|AM2PEPF0001C713:EE_|AS8PR04MB8387:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2ffb72-f7b7-4368-8595-08dde577e2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|376014|366016|7416014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Zjl1TUJiQkMxNlVUcllXQ1NEQjh6ZVMvU1NUaFNVcWNRa1VmQXJ0U2xxZ2l4?=
 =?utf-8?B?UzBlUUFhYXJsT1lFb3Rvb3Fnd0lFTy93Syt3eGJuY3FKQjBOK1FHK1hOTU00?=
 =?utf-8?B?ejMwcmVTVllsa2gwdDZ0ZExST1FwSTZQc01xSXhuQ0NSREZ0Y0dFZG5sQmY4?=
 =?utf-8?B?QTFuTmJmTUpJZU91bHJ5ZHdBTjFyK2p1aXhxMU5MSVhtcGlvY0pDSGhzSnhv?=
 =?utf-8?B?Nno1TVhtRUJxbDcra0h4ZXlaVTRaZjFsTFZHM1ZDSFpQRW1mMVVUaWtpL3Ni?=
 =?utf-8?B?RWg3eFYwZUYzaHRHSUpMZXBVU1ByTDhqMkhzM1owRmRYWmVIZXdTQk1wM25U?=
 =?utf-8?B?WXhiVmxWYjZrMS9kVmNkZUdEcTBaTlhVVTEvT01VbFBsYW1hdmVSbzZQMmZm?=
 =?utf-8?B?QUhvUGdZbzJtNVZwMlI0VGQyajl0Z2Y3aGxNcVRlcy9ubGVSY1REZ0o3VlF0?=
 =?utf-8?B?R1BnMkw3NjZ1UFpaa1pjTGozbnhJMk9Dc3hnZ2xGUzVvT1lkZW1xWTNDaGpX?=
 =?utf-8?B?eGFxc0hIbDVNeTVCdjRRTGZWUnhKNVV4ZTNkWnlQdDFYUkRFaW1vOVBFWW5Z?=
 =?utf-8?B?TDhNOGR4ZG84bDJMVUZ6alJQNnRpUkgwQ09hUE5Pd0lPaXlkVkZSNDBkZTdn?=
 =?utf-8?B?aGh5MUVYL0psME9YdmRzdm9qUE1rSTROVEVGQUxqWjA3dVFuSko3ektiR2JK?=
 =?utf-8?B?UjNiMitpblNYOVFRTStRRWNYMnpBQUpERmhPUDZmeXBiNlFTNmhYSHRkYTlq?=
 =?utf-8?B?dUR4UTRSUEFWWHhwU25ZWnh0UXBPYW14b1lCUy9zWFo4OHdXLzhXc1JRNXZk?=
 =?utf-8?B?S3NpTURnSVl1NjdUbHJaVmo5TlpTNVZxRm5YU1daTHhTbFRSN0Y1MFJ4czgw?=
 =?utf-8?B?MnNxZzk2aWVoUjRYOUpVOUZENVRnUHhxdmtobWQ4RXUwb3Z2UEtqYWJ3aTNG?=
 =?utf-8?B?T0NEWGdBWDFaWEdqR2xFQ2ZDbVRNSEt5N3BKSE9FZlhpWmFvTmZCMXIvczFp?=
 =?utf-8?B?cCsyalliZkpuQVJGM0d2QStMbEtTMklXU3Q4QzdVTGllRlRRTVVWWTNEbFVY?=
 =?utf-8?B?UFJvKzFqZFBnM0M1d2ZkNjJETjlZMGNreXRKRXJHRFJEbWdvdnVWZlZvbHdu?=
 =?utf-8?B?Tm1Nd05VNkZxZ0UzN0Q3WnRwSjFZQXJQNFg2QXRtM1ZPZXFETVBEZXdSM0pr?=
 =?utf-8?B?UDdXNk9ldmVobXQ5SUZQbTNKWmVnamh2R0xVNDY0b1NlRXFqaFY5bWEwWDJX?=
 =?utf-8?B?eHNGbnd6bWdPWXpsd3M5NDIvNXpZNU1yK0ZHKzc1TjZscUNTUnF0d3g2OEdD?=
 =?utf-8?B?YzVQN292WFlBVms3V1hpbk1FNGpEOFFmUExtYUpFQm1QdmFCaE0wYTAvV0lI?=
 =?utf-8?B?eDFBVzBva0NkQkZZZ20rRlplZ1M1OXJpUjFJOW5XRVJ6TmRtdWp4ZHN2UTM3?=
 =?utf-8?B?R09vQXRhY0Rudk9SZTZEVjNaRVlXR1NqNlVWL3R0MjNLaGxIcG9GYzVSUVUx?=
 =?utf-8?B?aEVwckZ0ZFlacS85alFzdHlEZDZ6RWU5U1RTTm5XSHl5THl5djBZdUs4Y21R?=
 =?utf-8?B?V216dTZHT1VZZkFtUHlFcEVWd0VORFU4dmRyaDJpYnpJSkFCVlRFQVBSUVUw?=
 =?utf-8?B?eW1CVHNzTnhSaW5OWndvdC9XVnZJRVA5Ui9jRG8rMTEydWtGMzBDN2tHRW9K?=
 =?utf-8?B?RnVsY3JZOE05U0F2cElxcVJHczBQbWFPMWUvQTdSUnNlb21BNHQxYnduNHJq?=
 =?utf-8?B?ZVVtMlNWUFIwb1FnbjJRZzBZeXpMR2gwOFhIUWRRNG1NS2JseStxZnFaUDR4?=
 =?utf-8?B?dmpQQ0pXS3hXQ2tPdmIvQTIyR05IdVZvQ3BHNVRCTFNYWDQ4cG04ZEhDaWRP?=
 =?utf-8?B?Z0tVRnJoMVg5SmhWU3hIcUZkVGlEMUhoTUVUZWluNk1JOEE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(13003099007)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9981
X-CodeTwo-MessageID: 74b0261b-68f7-47a5-89f5-5448e36bc4e9.20250827144201@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d26daaf1-72c4-43c3-8df0-08dde577e096
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|35042699022|376014|7416014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFN6Rytsejk0d2Yra1FRZ0ZCanFIOWk0cC9wZjNWQVBSMlkrWGZPeHhzSVcr?=
 =?utf-8?B?NXQ3bHlvT0V5RnU1VU90dWVSREdQVlgvM1EyMU0xdGdSbzdsNkJya3JpV1FG?=
 =?utf-8?B?Z1hoem0yc20zbVg2b1ltSms5WHRaSUhaWVU3TlhTbnR6bGxhYUw0SUdqcmh6?=
 =?utf-8?B?TWZydkcyb0RVZnc5OWFpemliREN3Y2EvRExsNmRzcjZ1MnhHMVJST3diMXFS?=
 =?utf-8?B?OHZFNmsrd01hR1Jrd1B5OFRpRTNzd25IdHlMMk9XQXBCS2pvdDRWT2JtQUxw?=
 =?utf-8?B?QjBCUXZMVFFrQVFyK0hISnpqVHNpbUNqaGFOTFE2akFIb3c0T3Zia052T1l2?=
 =?utf-8?B?RGN1UmtxMjMrY2tQWnBCWmRzRlR3bitKVXFYMUUzTHg5YTR2NCtEdWo5NW84?=
 =?utf-8?B?MlovcWlGaUtWaWFwWXFLQm1UdkNwT20vM3p2OXBjdnpnYmp3cUM4Szg3Mk96?=
 =?utf-8?B?a3BzZlhHWDBVQ1NId1BrdXIxSmNZWU9CdHFlWm9rTXV4Z3FSdDhaUHRSY1pu?=
 =?utf-8?B?RDVUL05uc2NWUkMvTFdmTnVGRGRPandhcGNDanlxODF3MVhSYzdjRTNONUJ2?=
 =?utf-8?B?SHpmbHFHMy85NFBSdjFlZjd6SUU3ZUhnYU5kZE1hTklqYXNUZnhOdXBiUlZO?=
 =?utf-8?B?djkvbVVSbTVqaFJxOXRHWndwMUlEL1lwUFV5TG9zM0JiZTJ4a3h0UldlN2tG?=
 =?utf-8?B?RUZNQTRkanZ5UHZ0UGN5YzNwMHg2K0RvSDlpVVJwaHFGZUNzWDhiTS9xT2lU?=
 =?utf-8?B?WU1SMUF4R1M0akRtaDk5T2ZTTE9pSmxjd2lHMWJZVUVWOG9NdzRXSE9NQTNh?=
 =?utf-8?B?RzBIQkd4bnROYk5oTnAxYjJQQytjTmV4WFJodnlqMzNDcGMxZytjczA3RVZz?=
 =?utf-8?B?ejRDN0dyL1NKZnJ1K2ZSRzgydmdZR0xCbmJLK05lVmNYUkZaMGxxTEJRbzQ4?=
 =?utf-8?B?RGZGSDlOaVRFTkE2LzJidk9nMzg0RGU4SGYzQnZVTE5UVWtuaWU4bWJxaEFl?=
 =?utf-8?B?Y1FQaUw0TmlkY1RDNmU2cWdiWVV6NnVtRzBJU2NhQStENEhBaWhTdnoxUm93?=
 =?utf-8?B?RlRVN0JNOFNjYzZaMTNDMVlKckk2OTRqdm5YV2dwMnhuWHZNQlZmbnkrRHkw?=
 =?utf-8?B?MmFLUmZ6TWM0MEZxOVVLTk9hb1VDL2ZraGJMZjdWZ0JIazM2RENFZkw0K000?=
 =?utf-8?B?OEdzcjZiWjF4NHp1aFJnOFVEQUhMSXg0SS9ZQ25oWHZ3VnBEN3I0aXozMkg0?=
 =?utf-8?B?YXBHdWZvTU0ycE5pYzY2T0VldGxEZjh4NDFRZEIzeklhMjhwOGlTOWJab3FJ?=
 =?utf-8?B?MHl6ZWplTEJ0VGxzbmo4KzlBYjZzUmlSeTJJQnplVHpVdWQrcCtUY1lXNWhw?=
 =?utf-8?B?S3BTNi9aMEM2WjBpQUtaR1M2VGxRZ1AyMzZGTFFHNENYWWdPRVl2eC82Y0FM?=
 =?utf-8?B?OFJhb2tRSFdMdjBTeitvbVIveVVMRXlTdWQ3RmN3MmhETnBQd2FPbGhhWmV2?=
 =?utf-8?B?K0tTTjNSY09yZGJqTHdYSEtscWlnQVpCNk9WOXpBNFphV3k3clFtbTdsYXBk?=
 =?utf-8?B?MllSdlg5eWRzbzFFcXhneXEwVFJiNEtxN2ZSQ1JUdlFpTi9iS2dib25JKzBh?=
 =?utf-8?B?aERRdFlxMTNUSjdSSnJpN3RKQlNIdXVUclpWVi9hb0pMZmN4ZjArN2R4VVZB?=
 =?utf-8?B?OWc1ZFpBejV6MFJybUlxVktJdXlHdU5sRnYvVlJCWVUvRWJRK2FBNTBGTlJ0?=
 =?utf-8?B?Mk45QXlEbUozTXZLM0lCd0tYZS9qdE9HS3FIanFUS21CUnVTaXcvOWo4dXRo?=
 =?utf-8?B?QlpHZXJNMURkTHpYSXNvNm11RmVBNUVySzhsckxXRVJPbTUvck1td2NHVmNN?=
 =?utf-8?B?RE5Dd3M4VmFKdmk1SkNpVnowQTB6VmNSR0toVUNBMm9mMExYV0p3NXpPb1lR?=
 =?utf-8?Q?bQfQC/ZqIFueFDDMzJBsrez3Zi8e8Dkc?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(35042699022)(376014)(7416014)(1800799024)(82310400026)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:42:02.3135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2ffb72-f7b7-4368-8595-08dde577e2b1
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8387
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

On 25-08-2025 16:14, Maxime Ripard wrote:
> On Tue, Aug 19, 2025 at 04:25:29PM +0200, Mike Looijmans wrote:
>> On 19-08-2025 15:22, Maxime Ripard wrote:
>>> On Tue, Aug 19, 2025 at 07:31:15AM +0200, Mike Looijmans wrote:
>>>> The tmds181 and sn65dp159 are "retimers" and hence can be considered
>>>> HDMI-to-HDMI bridges. Typical usage is to convert the output of an
>>>> FPGA into a valid HDMI signal, and it will typically be inserted
>>>> between an encoder and hdmi-connector.
>>>>
>>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> Use atomic_enable/disable
>>>> Use #defines for bit fields in registers
>>>> Allow HDMI 2 compliance
>>>> Filter modes on clock range
>>>> Use cross-over pixel frequency instead of manual overides
>>>> Devicetree bindings according to standards
>>>>
>>>>    drivers/gpu/drm/bridge/Kconfig      |  11 +
>>>>    drivers/gpu/drm/bridge/Makefile     |   1 +
>>>>    drivers/gpu/drm/bridge/ti-tmds181.c | 561 +++++++++++++++++++++++++=
+++
>>>>    3 files changed, 573 insertions(+)
>>>>    create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/K=
config
>>>> index b9e0ca85226a..753177fc9b50 100644
>>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>>> @@ -430,6 +430,17 @@ config DRM_TI_SN65DSI86
>>>>    	help
>>>>    	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>>>> +config DRM_TI_TMDS181
>>>> +        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge driver=
"
>>>> +	depends on OF
>>>> +	select DRM_KMS_HELPER
>>>> +	select REGMAP_I2C
>>>> +	help
>>>> +	  Enable this to support the TI TMDS181 and SN65DP159 HDMI retimers.
>>>> +	  The SN65DP159 provides output into a cable (source) whereas the
>>>> +	  TMDS181 is meant to forward a cable signal into a PCB (sink). Eith=
er
>>>> +	  can be set up as source or sink though.
>>>> +
>>>>    config DRM_TI_TPD12S015
>>>>    	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
>>>>    	depends on OF
>>>> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/=
Makefile
>>>> index 245e8a27e3fc..f4b5089e903c 100644
>>>> --- a/drivers/gpu/drm/bridge/Makefile
>>>> +++ b/drivers/gpu/drm/bridge/Makefile
>>>> @@ -39,6 +39,7 @@ obj-$(CONFIG_DRM_TI_SN65DSI83) +=3D ti-sn65dsi83.o
>>>>    obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
>>>>    obj-$(CONFIG_DRM_TI_TDP158) +=3D ti-tdp158.o
>>>>    obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
>>>> +obj-$(CONFIG_DRM_TI_TMDS181) +=3D ti-tmds181.o
>>>>    obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
>>>>    obj-$(CONFIG_DRM_NWL_MIPI_DSI) +=3D nwl-dsi.o
>>>>    obj-$(CONFIG_DRM_ITE_IT66121) +=3D ite-it66121.o
>>>> diff --git a/drivers/gpu/drm/bridge/ti-tmds181.c b/drivers/gpu/drm/bri=
dge/ti-tmds181.c
>>>> new file mode 100644
>>>> index 000000000000..34cbdb066820
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/bridge/ti-tmds181.c
>>>> @@ -0,0 +1,561 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * TI tmds181 and sn65dp159 HDMI redriver and retimer chips
>>>> + *
>>>> + * Copyright (C) 2018 - 2025 Topic Embedded Products <www.topic.nl>
>>>> + *
>>>> + * based on code
>>>> + * Copyright (C) 2007 Hans Verkuil
>>>> + * Copyright (C) 2016, 2017 Leon Woestenberg <leon@sidebranch.com>
>>>> + */
>>>> +
>>>> +#include <linux/module.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/regmap.h>
>>>> +#include <linux/gpio/consumer.h>
>>>> +#include <linux/delay.h>
>>>> +
>>>> +#include <drm/drm_atomic_helper.h>
>>>> +#include <drm/drm_bridge.h>
>>>> +#include <drm/drm_crtc.h>
>>>> +#include <drm/drm_print.h>
>>>> +#include <drm/drm_probe_helper.h>
>>>> +
>>>> +MODULE_DESCRIPTION("I2C device driver for DP159 and TMDS181 redriver/=
retimer");
>>>> +MODULE_AUTHOR("Mike Looijmans");
>>>> +MODULE_LICENSE("GPL");
>>>> +
>>>> +#define TMDS181_REG_ID		0
>>>> +#define TMDS181_REG_REV		0x8
>>>> +#define TMDS181_REG_CTRL9	0x9
>>>> +/* Registers A and B have a volatile bit, but we don't use it, so cac=
he is ok */
>>>> +#define TMDS181_REG_CTRLA	0xA
>>>> +#define TMDS181_REG_CTRLB	0xB
>>>> +#define TMDS181_REG_CTRLC	0xC
>>>> +#define TMDS181_REG_EQUALIZER	0xD
>>>> +#define TMDS181_REG_EYESCAN	0xE
>>>> +
>>>> +#define TMDS181_CTRL9_SIG_EN			BIT(4)
>>>> +#define TMDS181_CTRL9_PD_EN			BIT(3)
>>>> +#define TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE	BIT(2)
>>>> +#define TMDS181_CTRL9_I2C_DR_CTL		GENMASK(1, 0)
>>>> +
>>>> +#define TMDS181_CTRLA_MODE_SINK			BIT(7)
>>>> +#define TMDS181_CTRLA_HPDSNK_GATE_EN		BIT(6)
>>>> +#define TMDS181_CTRLA_EQ_ADA_EN			BIT(5)
>>>> +#define TMDS181_CTRLA_EQ_EN			BIT(4)
>>>> +#define TMDS181_CTRLA_AUX_BRG_EN		BIT(3)
>>>> +#define TMDS181_CTRLA_APPLY			BIT(2)
>>>> +#define TMDS181_CTRLA_DEV_FUNC_MODE		GENMASK(1, 0)
>>>> +
>>>> +#define TMDS181_CTRLB_SLEW_CTL			GENMASK(7, 6)
>>>> +#define TMDS181_CTRLB_HDMI_SEL_DVI		BIT(5)
>>>> +#define TMDS181_CTRLB_TX_TERM_CTL		GENMASK(4, 3)
>>>> +#define TMDS181_CTRLB_DDC_DR_SEL		BIT(2)
>>>> +#define TMDS181_CTRLB_TMDS_CLOCK_RATIO_STATUS	BIT(1)
>>>> +#define TMDS181_CTRLB_DDC_TRAIN_SET		BIT(0)
>>>> +
>>>> +#define TMDS181_CTRLB_TX_TERM_150_300_OHMS	1
>>>> +#define TMDS181_CTRLB_TX_TERM_75_150_OHMS	3
>>>> +
>>>> +#define TMDS181_CTRLC_VSWING_DATA		GENMASK(7, 5)
>>>> +#define TMDS181_CTRLC_VSWING_CLK		GENMASK(4, 2)
>>>> +#define TMDS181_CTRLC_HDMI_TWPST1		GENMASK(1, 0)
>>>> +
>>>> +#define TMDS181_EQ_DATA_LANE			GENMASK(5, 3)
>>>> +#define TMDS181_EQ_CLOCK_LANE			GENMASK(2, 1)
>>>> +#define TMDS181_EQ_DIS_HDMI2_SWG		BIT(0)
>>>> +
>>>> +/* Above this data rate HDMI2 standards apply (TX termination) */
>>>> +#define HDMI2_PIXEL_RATE_KHZ	340000
>>>> +
>>>> +enum tmds181_chip {
>>>> +	tmds181,
>>>> +	dp159,
>>>> +};
>>>> +
>>>> +struct tmds181_data {
>>>> +	struct i2c_client *client;
>>>> +	struct regmap *regmap;
>>>> +	struct drm_bridge *next_bridge;
>>>> +	struct drm_bridge bridge;
>>>> +	u32 retimer_threshold_khz;
>>>> +	enum tmds181_chip chip;
>>>> +};
>>>> +
>>>> +static inline struct tmds181_data *
>>>> +drm_bridge_to_tmds181_data(struct drm_bridge *bridge)
>>>> +{
>>>> +	return container_of(bridge, struct tmds181_data, bridge);
>>>> +}
>>>> +
>>>> +/* Set "apply" bit in control register after making changes */
>>>> +static int tmds181_apply_changes(struct tmds181_data *data)
>>>> +{
>>>> +	return regmap_write_bits(data->regmap, TMDS181_REG_CTRLA,
>>>> +				 TMDS181_CTRLA_APPLY, TMDS181_CTRLA_APPLY);
>>>> +}
>>>> +
>>>> +static int tmds181_attach(struct drm_bridge *bridge,
>>>> +			  enum drm_bridge_attach_flags flags)
>>>> +{
>>>> +	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
>>>> +
>>>> +	return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
>>>> +				 flags);
>>>> +}
>>>> +
>>>> +static enum drm_mode_status
>>>> +tmds181_mode_valid(struct drm_bridge *bridge, const struct drm_displa=
y_info *info,
>>>> +		   const struct drm_display_mode *mode)
>>>> +{
>>>> +	/* Clock limits: clk between 25 and 350 MHz, clk is 1/10 of bit cloc=
k */
>>>> +	if (mode->clock < 25000)
>>>> +		return MODE_CLOCK_LOW;
>>> I'm a bit confused by your comment here. Why do we care about the bit c=
lock here?
>> Purpose here is to filter out modes that certainly won't work. For examp=
le,
>> a standard 640x480 mode would have a 24MHz clock, which this chip doesn'=
t
>> support according to the datasheet.
> Sure, but you're talking about the pixel clock here, not the bit clock.
> So I'm still not sure why you need to mention it in the comment.
>
>>>> +	/* The actual HDMI clock (if provided) cannot exceed 350MHz */
>>>> +	if (mode->crtc_clock > 350000)
>>>> +		return MODE_CLOCK_HIGH;
>>> And what do you call the "actual HDMI clock" and why wouldn't it be pro=
vided?
>> The clock signal on the HDMI cable.
> That's not mode->clock or mode->crtc_clock then. The datasheets mention
> that it can go from 0.25 to 6 Gbps. That's the TMDS char rate, which is
> calculated using drm_hdmi_compute_mode_clock().

Added that, but it requires me to provide the bit depth and format,=20
which this bridge doesn't know. I can at least assume 8 bit and=20
HDMI_COLORSPACE_RGB as a "worst case" check for the upper limit, as=20
those are certain to fail.

Fortunately the chip doesn't really care what's being transmitted, so=20
not knowing the HDMI format is no big issue. Users can always lower the=20
retimer threshold if their hardware does need it, which in the worst=20
case would lead to the chip consuming more power than needed (but likely=20
still less than without this driver).


>
>> Again, aim is to block modes that certainly won't work.
>>
>> While developing the driver (and logging lots) the crtc_clock was
>> often just "0".
>>
>> This is still tricky though. What if we'd have a DSI-to-HDMI bridge in
>> between this and the crtc, and outputting a 4k display mode? The
>> DSI-to-HDMI bridge output clock (to the retimer) won't match the CRTC
>> clock, nor would it match the pixel clock (using 1/40 clock rate).
> It's not tricky, really. DRM internals only ever talks in pixel clock
> rates, ie assuming a pixel gets sent out for each clock cycle.
>
> It will not be the case if the buses are somewhat-serial for example,
> but it allows each bus driver to derive its own internal clock from the
> pixel clock rate and its parameters.
>
> So your example works just fine, because on the DSI bus and on the HDMI
> bus, you'd still get the same pixel clock rate.

Indeed.

>
> Maxime


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl



