Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C4BB3791F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 06:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C77C10E08A;
	Wed, 27 Aug 2025 04:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h55SENVw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2074.outbound.protection.outlook.com [40.107.100.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DEF10E08A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kV4aDDb2ne3n0XvAQbwkiWZXca0L2JLIhdtVGpyjfeUF6IwF/gRfwzdsKdK51czzUb+EI2cZR3TwFN6bgiZLYfpiGc0RMS0RhNfa5EGfNRGlVkNXo2Jv+eBaIIGrpPUImywH1AT/4gRAt7NhgsXv/NLlbb1AZFpNZzx2MCluM39now9Hmg/+Qdx6hVg31yC6ltwAgLhdTNxGEQtkzZu5i/Uc2VrJkr8+myCEK/UdMChjYkf1dvhbZGOp/2r+2iNlYMd7O840fwAHIhH3uT69aokk2piiT1THNweOZC/pyuI2CddByfO7KMTjeVc5BuLJ8AQJTtdvCO86sI39TP57iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dr0a9/9s+mCG+7f0CCXH7Ytv6kJ6Rou6lYV7ZFoJdVg=;
 b=AxSMRSuOdBIvZaaHCU7yvnb5DUPEXv47hUTAvxynJqTfp8hOw1cPs49h2gSBCyvVGi33X6pEmWTg4mOKCrgcQMQnQRFH+CYJaiKev/K95/U2vMajLEHSXPZBtJwiQ5CkGvEABGQC8plus0P0MRGBJwleRNWK5obbhhPx8/7jXrvQ3/hjhELYwmdojscYArPKkx9ULOidPOIosrzG1zLuAfnWTrzFUJGQQ7iCk1QqmIQew+tR/StuH6AwoOgxFxWinqSeHRLYOVcUJoFjbxuF/++Sb7AgTxCUY460p9hNbboK3nLf4ON5LEyxHY8vgeOIaxq5SpiYuTvPftT+Qq25BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr0a9/9s+mCG+7f0CCXH7Ytv6kJ6Rou6lYV7ZFoJdVg=;
 b=h55SENVwJ31YLKowbxv0sRVRlTQ1b9wkOhZGBzBUYpa1qhPbwGNvsI5a6WOnuKJi7Rgrjc6qumhFqOllo/A8GGipPr+KjlI+/gPu+0sdKGxcm8YLV5VFFsyqtkoL4a6G/lBKJnI2IBJwTNeV9IC3oA0t0nfGoWX2QzJeEYeUr3v14Ekr39W5Tf9PxJMQIt0/Ifz8cUuC3ZkSc4eCMSjf//wVahYXxLuqiq0oyhxsSaNFT3lcrfvsFEjij9SFwXCH5FTzKlS4HADEXKOK6ias28REA/eESdwKA/9eX/tsCZ9Lw5mqkrOxIveOwaWz46NW5qhDZvK8nTpgq8LPlJjbwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SA1PR12MB8947.namprd12.prod.outlook.com (2603:10b6:806:386::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Wed, 27 Aug 2025 04:29:43 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 04:29:43 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 05/19] staging: media: tegra-video: expand VI and VIP
 support to Tegra30
Date: Wed, 27 Aug 2025 13:29:40 +0900
Message-ID: <2271797.NgBsaNRSFp@senjougahara>
In-Reply-To: <20250819121631.84280-6-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-6-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SA1PR12MB8947:EE_
X-MS-Office365-Filtering-Correlation-Id: 747b617d-9d24-4a3f-43c7-08dde522584c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGFwM0dWRjFZQ2c1dVpFazV2cW9FZWx2MklSZ2svTkRqOWdCOFJCUVBoMHlI?=
 =?utf-8?B?L0RFNExrRXRKSTZ5dHYva0ZiYWcwQXNSc1pETUJDR2VyZ2J4TFRMQUhjdXg2?=
 =?utf-8?B?VStoRmo2c3I2NVFRaW1VS1FGMEVGTnZXL3d1cDJva3BCdzRUdGM2YlMwZWxu?=
 =?utf-8?B?Tm5SV2Y5aTRxUFd1N3k5V3ZLNUdUak1Rem5mUUticnZZWGVRZHM5ZDBFZTNF?=
 =?utf-8?B?UlBGNVNOZngrTWJ5eVRHU2RnM0hpbXVIT0E4UFQvSnFwT0lqZHI3bWxCRzRq?=
 =?utf-8?B?VkdKYWRhOXdJa0RzQ2xJZ21qOFBtZlEvS2MwdjNpeExlTnMyaC9FcEJXSXor?=
 =?utf-8?B?YmxnelZZZjM0VmMrRko0ZDZzOUJEeXdJVVNONnExS2NpQmoySFNtNGxwWmRT?=
 =?utf-8?B?TVMrKzgzb2JXWGRKWXJrb1BjUTFUNW1meGpvZnZSalM5VWFDK2VWZWVhUDRh?=
 =?utf-8?B?bURJUkV1a0lyV0czYXc0UFdvamxMZkZnSHJpMTkxdzduK21DbFhWeTErQXJV?=
 =?utf-8?B?S1Z6dERvTWNOT05vSVRXWmtKRmp1ZDhWSWhWMy9Hc3lmSXY3TTFXSHppQzla?=
 =?utf-8?B?cFljTDNiQi9vZFg5cGxPTkZJaHJSL2RVMXkrb2ZpYVloU0tXQ00vTCs3anRT?=
 =?utf-8?B?N1pmMncwa0VzSkdvNm9SdmNVbTRWd1VZU2hHVFhVTHJLMHFSQ2l3VmNGWEUr?=
 =?utf-8?B?c0h2ZDNLb1F0L0RJbW9JN282VlMxQnpWb2oyMC8zRlNYT0x3Y05wZkoxbmgv?=
 =?utf-8?B?NFNmMUllVDdmdVN3ZjBVMXhCUnF0NnlBNFl3enYyc21jbW0xU21xek9UQVh5?=
 =?utf-8?B?a1QvRlJpYS9sMkdSTVNMYzBiUVpiRDU4cWUwQ1FsazJiNEk3WmFndEx6VWhy?=
 =?utf-8?B?eFE2b1lrZlp0RWtxNVVtMGZnUE9VTFlsTXovd21OK3lyNlQrY2djQXh5dTdo?=
 =?utf-8?B?SXVZZmttRHRRSnU4MCtDbEF3RVRpSExZZmFhUDh5dVBpbDlXYUt0TWpNUDZr?=
 =?utf-8?B?R0VIaVpxSWgzSmNLTWhvbkVSaXM3bEdRZXlzNUdXek1Ob3BOQ2pGdUtoTnpU?=
 =?utf-8?B?QWo4V21LQlhkWWlMT2pzNzBnVXpyQmF3cTB1MmVBeHFhakhaNUFTZjRuSlFv?=
 =?utf-8?B?d0JDODVnZEROUTRVWDVYT3Jjais1YjRVM05vYzU2SW1NOThGbFZmRlpNcS9F?=
 =?utf-8?B?czBvOUlra2UxTkNFNTV5MHhGVS9LcWVLM2ZCM0RUcndlRnY0VGFsaThDcGph?=
 =?utf-8?B?ODVXNkRSc09xb2N0VFFHM3lXZEc5MG00enE5cjZJaVhPTnlYcVVNSVN4eU51?=
 =?utf-8?B?eGpOSS9nQ2o5RzU1KzdVUnRPVEorRkFKQ1JOL2xRY2VNSlhSaHk5ZS9yT2g4?=
 =?utf-8?B?ZHNPa0JoYlgzbUlIRWQxZTU3TWVra3lHWndNTjNQQmc1L2hHUkxqWFI4OEpi?=
 =?utf-8?B?YVhCR0VSdmZiMmdzVTZodzVtek41c3g2ZGErSXV6TE9DcjRTQ0w5Yml1Qkp6?=
 =?utf-8?B?ZlNscGZ4L2NwMFUvaENHd0MrMThyMUV1QmtOa1hsYzYzcjhGMUJ5S0NkKzYr?=
 =?utf-8?B?ZWkwamExZTNaYVJmS3B1aytXVUE0QnpZYjQraWFIVkNNWmhIMzBSek02bXlh?=
 =?utf-8?B?c0hCTkJ4QktOSy84MGo4Q1VkbTJsVEttVVdjUUpNR0l3TnpiTlNkQ2tHcjdq?=
 =?utf-8?B?RVRUc01oUzJNamEzb0pkZW9jWFo5VnJQMmxtb3RYdWZhU2NxMEZyK2xpVk55?=
 =?utf-8?B?RVg0bzFoMk5JbVd3cGNRaHNUM05Rc0J6WVUwVnR6Y2xLUHVaZ0NFRFpoN25L?=
 =?utf-8?B?YW9hQVpmMmZ5NHJONzNyTjFCYXRzb3A0K1dTRkQ5RUN5S1pxeUFFMzZiL3RK?=
 =?utf-8?B?cVoxNVI2Tzh2SmN3NGpGQzdEd1NSZVg3MkZhMEJJcElLT21KYUZoME43NXpB?=
 =?utf-8?B?VENwck1QejlpYVplL3A4TU1Qc3V6L1JvU2VBTnV0aHkya0RWeko1cStzM3Vt?=
 =?utf-8?B?OGd6UEZZUEd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(1800799024)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0JQSmdTSjhQL3ppOG1ZR2xqcWlYbm9tM0xOVFg5VTJoWEFvZ1BrL3Z5Tkps?=
 =?utf-8?B?VHRBcWhNTmNzQzdpNG4wN2RETk9XOEYvZUp5VkpjZjY1elhvNm5LUVYzVHBE?=
 =?utf-8?B?SWFmRyt4M1YvdDdtRGJFTUZWcjJPMlFYTTEzSUdoaWIvTGJQMXoxSyszSkpU?=
 =?utf-8?B?aml5NVQ3eUNQcUhKK3V3YkFidnlkaVpzTzgvVWN2UVJxQzZmWFZuL1NrTTNR?=
 =?utf-8?B?V1c0YWVaYkVlK3pvS3pBTVBwSmFkeXN0OVF1YXJjZ21qKys5N0RtWVFTTDBr?=
 =?utf-8?B?ckdsMUJiTzhZVnd0QlR0MTRzZERPUUlpRnhhTlRMU1U4T3ZXejZWMmUrSkxK?=
 =?utf-8?B?RFJZWCszQmR3aUswelkyaDgwUXNKUEtDaWJtbm5GcnlOaXZmQjFDTUVtVmIw?=
 =?utf-8?B?Y2V0WlJZYjFHbTBDdk9pZ0ZVays2TzNVZVFJMktZSFVSbTFJaW1WUExZb0Iw?=
 =?utf-8?B?MDQvdGU0NUEwdklQK0tMUGRnM0tTNmJDLzZKMTU3TDRsVW1uVU1zekVObHZT?=
 =?utf-8?B?VUhLelc2ZGlnYy81UWJtVnpnZ1psdFlldzVJMGVWUHV4WGZxemM3NzNWUTRl?=
 =?utf-8?B?cFp0NmRMQ0xkSXUwQnEzdTlrVWY4dUI2N0h0bG5YL1pyUVRFZmlYNldvYjl0?=
 =?utf-8?B?K0ZqUFd6VEtMdDdOT2Q1RTlGemVreEpGSE1PM0tKY1ExUjBmamJHanNXSWh1?=
 =?utf-8?B?UStueFhEWVg5MGdOckNWSjBWOGIvb05Fb05oR0h1dDRXYkhIdXJEOFpqL3FO?=
 =?utf-8?B?QkxjT2w2ZFBmVnJxY1lidjB6V1k4dWs5c003Rkdrd0FQTWVPSkdzOVlaR2Yv?=
 =?utf-8?B?ajVLQWl3V3poU1ZQb2Q2b1g2RmZXZEVIK1RvTEcrU0VmSUhsaEZFa3crbU9R?=
 =?utf-8?B?Zng2VmVVSDcvU3FwM0VjRld4OVk4cVBOUm9hSlZLUUJYT2lBWWxSVy9zaUto?=
 =?utf-8?B?eWJtT3h5dlpBV05zQ2NOWTZyaVJFQThDS0kxRGtRVDRnNm9OYkFYZ0RHVjBr?=
 =?utf-8?B?dGhhY0Rza0JTMnZObmY3RGZQellVYmMxUWIxWEo4Ly9teFVZVTNZQmRsTkxo?=
 =?utf-8?B?UGlvQnJQYm9vT0YvTENoMTgwbTVLbVIwSFlvMkV0Q2I5eUJackR3V0JLMlB1?=
 =?utf-8?B?bmV4SXZsdGRpUEtNTzZPWk1KKzlIbjlkRkQzVi9vS0l6VUcwSDRza2J5c3gx?=
 =?utf-8?B?VzM2Qy8yUFVGOFJuVE1jRVJxK1JMSUhHTW5sZFdUekk1SC9SeUZRampCdFFj?=
 =?utf-8?B?QlY0YjF3MnpUbzljYUxXeUJYWTBhdnNPeVB4UWt2T3o3TWZ0UVIzQnJiSCt5?=
 =?utf-8?B?eTExMDdzZkc5czBrSlVGOC9QZUt4cnpkSjlaRkowam4vM2lUaFpWYWk1S3pZ?=
 =?utf-8?B?ajZjM1F0RENqa3BDYkNZR1VNRnBwMUFScjdrMDRpWVNYNTdnNXo1QU96V2Zk?=
 =?utf-8?B?MkdHSHdzUHlEb0lueklUNFJvMzU3RzlQZnRYYTZ0UnN3VGx0Mk9FeFB0dUU0?=
 =?utf-8?B?L0prZmo4S2cwdVdUb29zazdIeGtrc0V1ckxYUHRxeXJiYkdyWEZEemdsMUFl?=
 =?utf-8?B?bkcvTUEwYWlyZkswUlNCbFo2RHAwaWJzQXdlV29wUVA3N1BQL012SG1PYTh4?=
 =?utf-8?B?eHB0YjNmd05obm0rLzYxdENza3dlZEtsekpkMGdkWmtDaVRvbEJRaHl3LzNv?=
 =?utf-8?B?d3hxV3krT09WOWEvSmtlMERGRmE0ZnFSZm0wR0xmTWlib3JYZmh1YzZPa1FH?=
 =?utf-8?B?bnB2MVp6VFFYYzQ5VWlEbE1RL3dsWitIS2RHMldjY1YxNWVvMXQ1b2Jva0tv?=
 =?utf-8?B?ZjFsdDhFSW9VMFJhNmxFVW5PNEJGOWxQRmhvcXBzTWc4L2J3MVNtbm90Y3Rs?=
 =?utf-8?B?bUN1aVY3dGlwWmlwR090eUxtYzlrY004NGplUW5HTm03bXY5d0RXNmlnN0xQ?=
 =?utf-8?B?aVAwRit6UXlmY1YyMWdCcmMyK2dmM1lHNTd4dkpvTlRnNTlYUlEwOThlTzli?=
 =?utf-8?B?SElQbnI3bkdoT0hJdUxNYW1YaWpCYk5jSzk5bnVxSXRQZ0UvU2dwRmhtdmxR?=
 =?utf-8?B?SWFnakZPRENOdzc4RGUrb1h0OVZHZUhldTFZeEdWMzBpOEU0UzNEUktsY2FI?=
 =?utf-8?B?RjNETmM0SnkrR3VrWW45b2VCakJ3Z1AzWVE1TllwaXJKcnF3ckw2dWxMOVlR?=
 =?utf-8?B?ZHpWV1hmbnRNaFNzdDZsd25DeDBRQTVJc3ZCeFUzNm82L3NxVjhJNmFaUThX?=
 =?utf-8?B?VlBPelBWRGtSQzJEWXd0RnZVL2RnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 747b617d-9d24-4a3f-43c7-08dde522584c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 04:29:43.1951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0mYsIgF9oxcoh15pDwEBvoq/8TbIw9U2eWIle+d9+1MDe/hteDDwWlegB+uZj25b2hPrq9e8YWivMzFPNxgoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8947
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

On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> Exisitng VI and VIP implementation for Tegra20 is fully compatible with
> Tegra30.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/Makefile | 1 +
>  drivers/staging/media/tegra-video/vi.c     | 3 +++
>  drivers/staging/media/tegra-video/vi.h     | 2 +-
>  drivers/staging/media/tegra-video/video.c  | 4 ++++
>  drivers/staging/media/tegra-video/vip.c    | 5 ++++-
>  5 files changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/Makefile
> b/drivers/staging/media/tegra-video/Makefile index
> 6c7552e05109..96380b5dbd8b 100644
> --- a/drivers/staging/media/tegra-video/Makefile
> +++ b/drivers/staging/media/tegra-video/Makefile
> @@ -6,5 +6,6 @@ tegra-video-objs :=3D \
>  		csi.o
>=20
>  tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  +=3D tegra20.o
> +tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  +=3D tegra20.o
>  tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210.o
>  obj-$(CONFIG_VIDEO_TEGRA) +=3D tegra-video.o
> diff --git a/drivers/staging/media/tegra-video/vi.c
> b/drivers/staging/media/tegra-video/vi.c index c9276ff76157..71be205cacb5
> 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1959,6 +1959,9 @@ static const struct of_device_id
> tegra_vi_of_id_table[] =3D { #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
>  	{ .compatible =3D "nvidia,tegra20-vi",  .data =3D &tegra20_vi_soc },
>  #endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-vi",  .data =3D &tegra20_vi_soc },
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-vi", .data =3D &tegra210_vi_soc },
>  #endif
> diff --git a/drivers/staging/media/tegra-video/vi.h
> b/drivers/staging/media/tegra-video/vi.h index 1e6a5caa7082..cac0c0d0e225
> 100644
> --- a/drivers/staging/media/tegra-video/vi.h
> +++ b/drivers/staging/media/tegra-video/vi.h
> @@ -296,7 +296,7 @@ struct tegra_video_format {
>  	u32 fourcc;
>  };
>=20
> -#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SO=
C)
>  extern const struct tegra_vi_soc tegra20_vi_soc;
>  #endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> diff --git a/drivers/staging/media/tegra-video/video.c
> b/drivers/staging/media/tegra-video/video.c index
> 074ad0dc56ca..a25885f93cd7 100644
> --- a/drivers/staging/media/tegra-video/video.c
> +++ b/drivers/staging/media/tegra-video/video.c
> @@ -127,6 +127,10 @@ static const struct of_device_id host1x_video_subdev=
s[]
> =3D { { .compatible =3D "nvidia,tegra20-vip", },
>  	{ .compatible =3D "nvidia,tegra20-vi", },
>  #endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-vip", },
> +	{ .compatible =3D "nvidia,tegra30-vi", },
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-csi", },
>  	{ .compatible =3D "nvidia,tegra210-vi", },
> diff --git a/drivers/staging/media/tegra-video/vip.c
> b/drivers/staging/media/tegra-video/vip.c index 5ec717f3afd5..00e08a9971d=
5
> 100644
> --- a/drivers/staging/media/tegra-video/vip.c
> +++ b/drivers/staging/media/tegra-video/vip.c
> @@ -263,13 +263,16 @@ static void tegra_vip_remove(struct platform_device
> *pdev) pm_runtime_disable(&pdev->dev);
>  }
>=20
> -#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SO=
C)
>  extern const struct tegra_vip_soc tegra20_vip_soc;
>  #endif
>=20
>  static const struct of_device_id tegra_vip_of_id_table[] =3D {
>  #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
>  	{ .compatible =3D "nvidia,tegra20-vip", .data =3D &tegra20_vip_soc },
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-vip", .data =3D &tegra20_vip_soc },
>  #endif
>  	{ }
>  };

If tegra30-vip is compatible with tegra20-vip, we don't need to add the=20
compatible string into the driver. Just mark it as 'compatible =3D=20
"nvidia,tegra30-vip", "nvidia,tegra20-vip";' in the device tree (and as Rob=
=20
alluded, have this compat string pair as an option in the device tree schem=
a).

Cheers,
Mikko



