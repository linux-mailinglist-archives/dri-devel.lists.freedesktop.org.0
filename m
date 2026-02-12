Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMwOAVpzjWn42gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 07:29:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BA112AB21
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 07:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C9110E6DE;
	Thu, 12 Feb 2026 06:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a85gKUk0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013063.outbound.protection.outlook.com
 [40.93.196.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCC910E6DE;
 Thu, 12 Feb 2026 06:29:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKaUgtgoLjar5AzEofeDH3l+2jDZJp9zCDtoTy7xLoA6enn2noIQP8E93mlmVGnZFody2LcjHbTULxMP+PHwFTaeVmp3nJVDPpaE7EYM1NXzvWZar9uUxDOnd8UMT76anwHZHMBe/aYhVVF5BW8JOwFK0nMydmZpfBJNjD4fpvXxkhWD/Yx67Rfl9PGgfDyPFOxPqD960kn2TOo8LdtX3jW9LXgnKsqab99HrSEMvA7j7HXZFHTEsJudS8VZ22yfy1ZNYjQBVZnF75ZaqmMqIa8tLWCd4S5efZbyJaXKM7+jfx3GKwsvANTS8dsPbsYK5fA9ntu4H58SLoSJqQBedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2r9mfsQkvEOZSm9B6UApD4RQcJZeFBme2wIUp3EktFs=;
 b=ZeR/wrBGkoSeUgojo3y2S60y/Rx6pRnSxVBGwbLa+VNQ+Qz5GIw2jNtbxtshvhjwnouoUwrj6eJmE4WD4tGpe2MKo8DMrvttcr5Ky496QHdL3s7Rifae/vIZ5V5Hs/dgG3RgTFDhYI2AotNeZXVttI1E3o4Qn1e4bQfOshMtoF3sMghMU7+rqhNkwH2YXb0UeBOWeXsvlCH2d1H2RLuukqKFWL8vgAymOX4/UaCoNOknyUpkBY2054bH4fnjlxei40ChIIus/DQDEtOHxauBr7RV0tvk44o+/O5ls325Nz9LiKF5pDAPEmsMIyZaMJtHicHkTGMedLCqGrA1vtJlQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2r9mfsQkvEOZSm9B6UApD4RQcJZeFBme2wIUp3EktFs=;
 b=a85gKUk0EK9kLnmdBwJ2WUvRRTGQALMUX+fobvtI0pchWlTxdPuGWAFmi7EA7uDTzfTQVMr4BQ+HFnohqlQ88SX8iEWZpSueCu7NVAQE+1glP4U3qwjpaQAnFiJIIWve1jtr1Ky3evlhfRbBKquicYf2NCQso/SEA6WbJQ6boxIscVmgoL2GyjXibOmOdeB5RJUSgFo1KOJdce92o0/UzJLNezrR4QT7V4/GCuUjN03Hejh+pV28AtSkzfY88oEfLq4w8L4V4DStMNjlMUCfQFqXCqweKPujwCeTgFgEZ7e8gyZkGdSORNY4BCPSTuJpEdbrkEKzvQbZ10IRWXMGSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 06:29:38 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9587.016; Thu, 12 Feb 2026
 06:29:38 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 12 Feb 2026 15:28:03 +0900
Subject: [PATCH 1/7] gpu: nova-core: gsp: sort MsgFunction variants
 alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-cmdq-continuation-v1-1-73079ded55e6@nvidia.com>
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
In-Reply-To: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e58ed78-b9aa-4c5d-bdd7-08de6a0018a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkRSWFpOcmFxb2EvNk0xWXdWVGJnUjRtSVBpMm4vam12aFdIVE14b2JiK3Fu?=
 =?utf-8?B?eDJLOSs1NUNSaEs3ZFFvTm5TYW9uRjhNZC9rbHFsQnRqYmZadU5lZkhJWEE3?=
 =?utf-8?B?am9OM2FxSUlFUWhvbUxWYXRidlRhenRXVzUxbWRKNmt1VlEzNS9HSWJFc2NB?=
 =?utf-8?B?NDNDcy9MZjBYUlZaM0txTnZpMGxzcklHWnZaakNhWmtHZ2ZlRzc3MWQ5QzRM?=
 =?utf-8?B?MGh5WmNkQ3hYV2JscWxpTlZWWTNDVzFWaUdRaWtoLzdlc1pXamwzR0JaWUVi?=
 =?utf-8?B?ZkxMZ1p1ZTRMdXZLQjAyUXNOWnhHOFFaa1NXbjVxcmxuQU4vazlJWmUrbFNx?=
 =?utf-8?B?akVtZnIrWEEwdWV6ci9uYnVMck5mSlVXakRYSVlsNDhUaDdOMXozUlNsU25R?=
 =?utf-8?B?Y0tMcEpONUNzQXVMZUZRZU9meVVPUjRiM3REL2JheGNFNFI2eStnUVBGWkJm?=
 =?utf-8?B?WHRIOFMzNmxhSnB3aExwVU9qRVZleFB0Qm11bXVVNkxtd1RhYjB5d3VSQU5J?=
 =?utf-8?B?OUEzY2lTUTA0Rk5zUXZVMUlJSUdydDRTMnQyejN2WE9NUStzQkc5cmpHeFJ0?=
 =?utf-8?B?ZS9uNGJvSDF6TWhnYnB0dUMrZkJxQ3ZqZklCaTY5ZVEvOEV4YWlFQUV4K2Fo?=
 =?utf-8?B?cWNZS3Zrc2psdDZXS3Q3NDhnWFhSTDlXeWkwdFFmSk8yaEFkOVJBVjRuK25H?=
 =?utf-8?B?TTRNSmlNM0syTmxEWElBQXA0Y2JPWnMrVVdvNEgzUDNUbjc3YVBNYnJmTENN?=
 =?utf-8?B?YmwvTWZuRkJuelhTT2lpK3FUVzdIMXk2Vi85MjE2cUVSUVc2QzZBYXcvWDVJ?=
 =?utf-8?B?OTZQUzU1MklDV2Z6WjM5RE1CUEVHUVFGcUpzSUI5UEpCeDVlWFVvcUNVSFdV?=
 =?utf-8?B?SXJHZVp1R2ZTWmllRjgvS1l3UE1vcEdLRHZNZEFqQlQ2KzRUMlUySEdHRGJL?=
 =?utf-8?B?MmVtcVg2bmFSRmFvcDlhaHFDREY3V0xqbWFQRjh0NVJ1ait0dEJRUFNpUnMr?=
 =?utf-8?B?cEVNL1hXdWtwbjErRUEzZDZuLzUySW4wRG5iRTlocWowVUg0WHpMUHJYbXBU?=
 =?utf-8?B?bDAydzhWYVlqOHJKQUNWbjF5ZGt2bzkrM3VwazRyNG1HcHQ5bzdUVHZPV3Ny?=
 =?utf-8?B?dkFGY2NZU3lWajJ3NWordEhNYnk0VlpZNnl4Y3RYdkVzNGQ0MTBnQTQ5NHk1?=
 =?utf-8?B?M2Nucm91ZEpXSFkwYUhtZCsvNnptVlR6dkxCSmwwekFRNFYrazhYMkVST0ps?=
 =?utf-8?B?SHpCRGlSVkJWZGNYNEtXOFE5cmswR2tmNW1OT1o5eThjYWUvUWQ2Y3FFbE5v?=
 =?utf-8?B?QTI5a29IRHVUY3FQRzJRY3M3OTNsNVF3U2JqeE53OGxTNHRKN2dOTFZtcUZB?=
 =?utf-8?B?S3R0N2FNcXU5Y25iUitxOHJtSHROcWhaOStHRjh4N0tXWVJHQ0tQK3R4Y2du?=
 =?utf-8?B?M1l6N05rWnNGTkQvK2FCaThFRjVlSlAzK1B6VlQ0L2tyN01ncFc0MlMwQk9B?=
 =?utf-8?B?MXF1KzdNOEx3TWZvV2pTSVAzcTl5NE1UcTM5S0NPblBaQmVEZWpEOHRNOVRR?=
 =?utf-8?B?akwvUGtuM29ncW8xTGhJWFloV1hvM2U2TExuSHNHYTA2YjdFODFMelpiRWk4?=
 =?utf-8?B?bFJsYnBTZVVFckpkU3c4THpVWndIUkQySnA0LzJtdStSUDNnQ1ZmQzZBeXRo?=
 =?utf-8?B?M2pQczRnUFM0ZHVRRDdwOEYzbXFaQzBSUVgwR3cyMytnOWlSelVUT3B3b0pD?=
 =?utf-8?B?M2dvaWp2YURHNFRUc0xQMnhOZG1GTmVqejFhYlB1aFVpWDFGTWVSRHNzZmhN?=
 =?utf-8?B?VkM0a2pIUGRFRGNhZXJrRzIxMXlHd1VNS2lPVHkrck1Pc2QvTktsVkdBOXVl?=
 =?utf-8?B?VmR2cjNFMjUvZWt4bk5MbC9OZXgwL2RPcjNha3k0UjFMbG1Rd0pWaE1VT3Nl?=
 =?utf-8?B?Z2liTXYzUjI0U3NlbjJ5VmNqYTNjd0FxU05FVG5acjBacnV2RWI5YkRHMjZK?=
 =?utf-8?B?OExadExlMEJxQmY0RzhLWHBXUi9mT0ZXTFV0Mkp1c01kTklwZnkvaWY5Y0lN?=
 =?utf-8?B?OHQ3TEVCVlJpZmMydkN4RFBDNkR6aUJURHR5NnFXbnZmbHZCTFc2SzE5VlVR?=
 =?utf-8?Q?uOsA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFNTZlhka3hhRnZKbitOVjlpRTV4ZGhRTmVmaFd0UDkzc1EyNGsrU1VBNk1N?=
 =?utf-8?B?eTJoaVUxcno2eTRZR0dtYlhzaFd2dURRdVI4S2xsMVdWbHNXQ3NyUWxMdnR5?=
 =?utf-8?B?TzRVVlVQMEVhaFluaUVtVER4RzRkWkRsbVhNcGdGU1lhL3FZeHBnVVVrNjF4?=
 =?utf-8?B?dzdXRE9rQi9MQXFGMnd3RnZyZ0EzVmJBSFRRVGlPNkZrdmpmU0RqOTlhcmdy?=
 =?utf-8?B?Z1ZKQ3FMOUp1TzR1ME5VeWlSK0F0aXF0SitnRk4zMmw5Q3h5MmZoc2JpaUxn?=
 =?utf-8?B?alhBRlVkeUZ5WEJiM3NhQUtMZ0FoZTN1RS9LV3g3SU0rRk1yTTlIT2dWY3VP?=
 =?utf-8?B?NlAzOW94UE9WbFVYWVA4VnhkLzRhY2UxUlFhRDRJL3ZrRHIvMktqdlptUUhJ?=
 =?utf-8?B?bHk1TDlCQllEclYwdlgvZGl6WmZLVElVZFBUK1dkWWZTNTR5TE1mUFBrSk1Q?=
 =?utf-8?B?UExEdWFOUWtXbGpyaTJhSzRIOUlPeXFvanlOZE9YMFBTK3JsS29yVTBaNkVY?=
 =?utf-8?B?cFdHd0k0R09qSUF5eVRNWWxmVXVvVU9Ka2tOYlZGbStBNml2T1JPYjdldzVF?=
 =?utf-8?B?VW5Ga2xUK3NzcXRrN0sxYVhvejJFQm90aEFYRlNBblpRVE4yTXVXOGlwVlhB?=
 =?utf-8?B?RTd0RC9EQ2tuaEFXQ1dtSWUvRExFdjloOHJoVHg2L1cybEVxN0dvaFlXckpZ?=
 =?utf-8?B?OE5VT3N3cUl5aFBkUE9KcnBzOUQxdjhwa2VTSVBOOWZUTWxCWWlBams1c2Ez?=
 =?utf-8?B?NlZqVUw1aUJlL0FrVnlWMVpXRjVRZFpOTGxiZy8yZXZ0eTlIb2E1RW1vRTZa?=
 =?utf-8?B?eUxXUFBhWnRqUkxKYVp6ZWVPOFI5ZFlpOXZqUnJsQmpsOTdIbzkxaUVwSjFy?=
 =?utf-8?B?cm43SzZDb2prOGNqQWtwT2FQUnoxTGZLOTRpZ2ZYK1pjK3JjanZNY3k1MTVr?=
 =?utf-8?B?MXVVRkVLemNLa3h2YXF5WFFaS1ZrdHd4YVJXRTVEb09DcktibW5uY2RpMzNu?=
 =?utf-8?B?aXNOZE9SREVGREpvYlN3QmdVT0JzMktxbkVDVGczdVdKRWhxMHJWeHVTNzFX?=
 =?utf-8?B?WVZDUWtZVThYcithUVhSemtNQTZJSEd5bklRb1JINjdtN1hYS0xUY0p3Yy95?=
 =?utf-8?B?MWVFNy9UMncvYVZEVC9PaXVVbUlVaWpqOERlUy9ZNlAvT3JtazhZVzZKbWZF?=
 =?utf-8?B?SVNKaTdTS0F1dWYrQUh6NkRhQWsyN1JFcVc5Ymt5OXlKUmV1ZDZBRkYrYWpw?=
 =?utf-8?B?WWpZWjZlR2x5ODV3TnBYMnRGajIwMmRnQnVORFpibjlJSTdiVERVdWw4MEtX?=
 =?utf-8?B?YkdPL2Fkb2pRdXZEUXVpZ3E3QkhpZUNQYkhSOGpHMGtOR2FWaGJKZXU3Mm1B?=
 =?utf-8?B?MVRHOCtyWlErMGFjdWg4ZnhSbEUzeHJrVkJ2cEdvZFVxTDdDRlNURHRKYVg2?=
 =?utf-8?B?Qy9yYmR4QnRnS1VueFRKRytYK1NZM0hIMTZpSW1YZ1k2QitjWDhvbTNzdVoz?=
 =?utf-8?B?S2NKKzF1Y0w3L1JjN2RvZzdTOHpIY1VqUHhMWGNUQlFuZVhFYzlQVXR1dmN5?=
 =?utf-8?B?K2lRYU5xSWJjc1JqQklxdk5uOGNxVWZHcldMNzc4MVNDUENWa1BaUmxFZ1dS?=
 =?utf-8?B?TXBBNDEwZjNMUTIyVzFwY3VHODJjbU1CdG9nMEltSTc2OEY4dWlmeWVVblRm?=
 =?utf-8?B?enJINnBxWWIyMkNBdE1QMjVaNWtDUmxrenRMTElFRSsrNnNmVGFEKythVURK?=
 =?utf-8?B?SFBNalB3dVlNMXRxaktINHIwRGNpOFRyblV3U2lINk5QZW1mSXFaZmF0TFpB?=
 =?utf-8?B?WllJOWF6WEVEd2t6bWVNeVl2cStRazArT2Rid0JwSDNlQWNlK1YyazN0em02?=
 =?utf-8?B?dFcrQ2VYdEtKOGtOTXJWU0ltUjdUTTJBSE1lWExRVmRPZWVEV3BQQXUxcThF?=
 =?utf-8?B?Y0g0STRSTENBRTRrUzVFenlNWTU1cVUvTVpacXpOK2RMNVFiZ3g0NUI4ckhv?=
 =?utf-8?B?WDZlQzRLMXZnVmJHRThyT0xMaUt1MWFiK3ZqdnU4SHB3RWdmTlFmYjhLczc2?=
 =?utf-8?B?Q0tiMjJyNkRwdXNNWElybUhLaC9oUnVrc3FvL3FyRkV3V3FNVTFZd24rd1hE?=
 =?utf-8?B?enJyL3dEOUZGR3ZmMy8vRnM4cllMRHc1ZTAwaG5iTE5sVS9UUG9ZSTRyb2Fz?=
 =?utf-8?B?SEFzQitGVm5jRGJoemJzbVhuYTRpQ3A1S0crMlVmVFFnZGYvZTAwZU5GSkNj?=
 =?utf-8?B?T2RHamd5NHRhdm9ETlF5dTYxQjNQNk84Q05BMUV3cmdnaWgrbDdXVGw4RDVJ?=
 =?utf-8?B?ODJHTWs3UXZOUUh3KythYXVwS29iWnJhOEY1aFREU3A4YWs2aVRheElXUDhD?=
 =?utf-8?Q?bmHOBmncoPKhGbD85zxdvDilpqP7vl1DuiXc0aDHAIdXd?=
X-MS-Exchange-AntiSpam-MessageData-1: IEABgHF8BI1j+g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e58ed78-b9aa-4c5d-bdd7-08de6a0018a3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 06:29:38.0085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lp9QMZp2Am2uu/a8DH2aNV5bhZNise4sTR8x8ttfT0qZ5GrvDAuyCG8UN2tN59lMV5ji17YqBbyTTR+/PHqJnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: A5BA112AB21
X-Rspamd-Action: no action

There is no particular order required here and keeping them alphabetical
will help preventing future mistakes.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 97 +++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 83ff91614e36..5b96f5e622a4 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -192,34 +192,34 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
 #[repr(u32)]
 pub(crate) enum MsgFunction {
     // Common function codes
-    Nop = bindings::NV_VGPU_MSG_FUNCTION_NOP,
-    SetGuestSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
-    AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
+    AllocChannelDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
+    AllocCtxDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
     AllocDevice = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
     AllocMemory = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY,
-    AllocCtxDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
-    AllocChannelDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
-    MapMemory = bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
-    BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
     AllocObject = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
+    AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
+    BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
     Free = bindings::NV_VGPU_MSG_FUNCTION_FREE,
-    Log = bindings::NV_VGPU_MSG_FUNCTION_LOG,
     GetGspStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
-    SetRegistry = bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
-    GspSetSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
+    GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
     GspInitPostObjGpu = bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU,
     GspRmControl = bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
-    GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
+    GspSetSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
+    Log = bindings::NV_VGPU_MSG_FUNCTION_LOG,
+    MapMemory = bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
+    Nop = bindings::NV_VGPU_MSG_FUNCTION_NOP,
+    SetGuestSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
+    SetRegistry = bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
 
     // Event codes
     GspInitDone = bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
+    GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
+    GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
     GspRunCpuSequencer = bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
-    PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
-    RcTriggered = bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
     MmuFaultQueued = bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
     OsErrorLog = bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
-    GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
-    GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
+    PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
+    RcTriggered = bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
     UcodeLibOsPrint = bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
 }
 
@@ -227,34 +227,34 @@ impl fmt::Display for MsgFunction {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self {
             // Common function codes
-            MsgFunction::Nop => write!(f, "NOP"),
-            MsgFunction::SetGuestSystemInfo => write!(f, "SET_GUEST_SYSTEM_INFO"),
-            MsgFunction::AllocRoot => write!(f, "ALLOC_ROOT"),
+            MsgFunction::AllocChannelDma => write!(f, "ALLOC_CHANNEL_DMA"),
+            MsgFunction::AllocCtxDma => write!(f, "ALLOC_CTX_DMA"),
             MsgFunction::AllocDevice => write!(f, "ALLOC_DEVICE"),
             MsgFunction::AllocMemory => write!(f, "ALLOC_MEMORY"),
-            MsgFunction::AllocCtxDma => write!(f, "ALLOC_CTX_DMA"),
-            MsgFunction::AllocChannelDma => write!(f, "ALLOC_CHANNEL_DMA"),
-            MsgFunction::MapMemory => write!(f, "MAP_MEMORY"),
-            MsgFunction::BindCtxDma => write!(f, "BIND_CTX_DMA"),
             MsgFunction::AllocObject => write!(f, "ALLOC_OBJECT"),
+            MsgFunction::AllocRoot => write!(f, "ALLOC_ROOT"),
+            MsgFunction::BindCtxDma => write!(f, "BIND_CTX_DMA"),
             MsgFunction::Free => write!(f, "FREE"),
-            MsgFunction::Log => write!(f, "LOG"),
             MsgFunction::GetGspStaticInfo => write!(f, "GET_GSP_STATIC_INFO"),
-            MsgFunction::SetRegistry => write!(f, "SET_REGISTRY"),
-            MsgFunction::GspSetSystemInfo => write!(f, "GSP_SET_SYSTEM_INFO"),
+            MsgFunction::GetStaticInfo => write!(f, "GET_STATIC_INFO"),
             MsgFunction::GspInitPostObjGpu => write!(f, "GSP_INIT_POST_OBJGPU"),
             MsgFunction::GspRmControl => write!(f, "GSP_RM_CONTROL"),
-            MsgFunction::GetStaticInfo => write!(f, "GET_STATIC_INFO"),
+            MsgFunction::GspSetSystemInfo => write!(f, "GSP_SET_SYSTEM_INFO"),
+            MsgFunction::Log => write!(f, "LOG"),
+            MsgFunction::MapMemory => write!(f, "MAP_MEMORY"),
+            MsgFunction::Nop => write!(f, "NOP"),
+            MsgFunction::SetGuestSystemInfo => write!(f, "SET_GUEST_SYSTEM_INFO"),
+            MsgFunction::SetRegistry => write!(f, "SET_REGISTRY"),
 
             // Event codes
             MsgFunction::GspInitDone => write!(f, "INIT_DONE"),
+            MsgFunction::GspLockdownNotice => write!(f, "LOCKDOWN_NOTICE"),
+            MsgFunction::GspPostNoCat => write!(f, "NOCAT"),
             MsgFunction::GspRunCpuSequencer => write!(f, "RUN_CPU_SEQUENCER"),
-            MsgFunction::PostEvent => write!(f, "POST_EVENT"),
-            MsgFunction::RcTriggered => write!(f, "RC_TRIGGERED"),
             MsgFunction::MmuFaultQueued => write!(f, "MMU_FAULT_QUEUED"),
             MsgFunction::OsErrorLog => write!(f, "OS_ERROR_LOG"),
-            MsgFunction::GspPostNoCat => write!(f, "NOCAT"),
-            MsgFunction::GspLockdownNotice => write!(f, "LOCKDOWN_NOTICE"),
+            MsgFunction::PostEvent => write!(f, "POST_EVENT"),
+            MsgFunction::RcTriggered => write!(f, "RC_TRIGGERED"),
             MsgFunction::UcodeLibOsPrint => write!(f, "LIBOS_PRINT"),
         }
     }
@@ -265,38 +265,41 @@ impl TryFrom<u32> for MsgFunction {
 
     fn try_from(value: u32) -> Result<MsgFunction> {
         match value {
-            bindings::NV_VGPU_MSG_FUNCTION_NOP => Ok(MsgFunction::Nop),
-            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => {
-                Ok(MsgFunction::SetGuestSystemInfo)
-            }
-            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
+            // Common function codes
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => Ok(MsgFunction::AllocChannelDma),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => Ok(MsgFunction::AllocCtxDma),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE => Ok(MsgFunction::AllocDevice),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY => Ok(MsgFunction::AllocMemory),
-            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => Ok(MsgFunction::AllocCtxDma),
-            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => Ok(MsgFunction::AllocChannelDma),
-            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY => Ok(MsgFunction::MapMemory),
-            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => Ok(MsgFunction::AllocObject),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
+            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
             bindings::NV_VGPU_MSG_FUNCTION_FREE => Ok(MsgFunction::Free),
-            bindings::NV_VGPU_MSG_FUNCTION_LOG => Ok(MsgFunction::Log),
             bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => Ok(MsgFunction::GetGspStaticInfo),
-            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY => Ok(MsgFunction::SetRegistry),
-            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => Ok(MsgFunction::GspSetSystemInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),
             bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU => {
                 Ok(MsgFunction::GspInitPostObjGpu)
             }
             bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL => Ok(MsgFunction::GspRmControl),
-            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => Ok(MsgFunction::GspSetSystemInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_LOG => Ok(MsgFunction::Log),
+            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY => Ok(MsgFunction::MapMemory),
+            bindings::NV_VGPU_MSG_FUNCTION_NOP => Ok(MsgFunction::Nop),
+            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => {
+                Ok(MsgFunction::SetGuestSystemInfo)
+            }
+            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY => Ok(MsgFunction::SetRegistry),
+
+            // Event codes
             bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE => Ok(MsgFunction::GspInitDone),
+            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => Ok(MsgFunction::GspLockdownNotice),
+            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => Ok(MsgFunction::GspPostNoCat),
             bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
                 Ok(MsgFunction::GspRunCpuSequencer)
             }
-            bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
-            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED => Ok(MsgFunction::RcTriggered),
             bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED => Ok(MsgFunction::MmuFaultQueued),
             bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG => Ok(MsgFunction::OsErrorLog),
-            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => Ok(MsgFunction::GspPostNoCat),
-            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => Ok(MsgFunction::GspLockdownNotice),
+            bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
+            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED => Ok(MsgFunction::RcTriggered),
             bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT => Ok(MsgFunction::UcodeLibOsPrint),
             _ => Err(EINVAL),
         }

-- 
2.53.0

