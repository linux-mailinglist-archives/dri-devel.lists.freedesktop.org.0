Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE19CBD8477
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 10:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C0310E1F2;
	Tue, 14 Oct 2025 08:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="TTrpZYZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0735510E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:51:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tc3D2cS/dYKcRdboQo2SnUKaAEsmhehhxiCzXPouuOv2ZliD/8UfErg3SDlMPJAweP3CB4TJvmFPKEnYI7xtHvDER25Bra+YLTpLQXzmI2MPjCmaKTfLPhfaSDd3Psyv/3fuSR9IMIOM8vWlZgQps+txc7DQeFYul4V4Tn/jF6KsUDNWV2bLOPE0eXZVExDjMnYwjZY9799TMWu4m8pgCIbvXIhOI7YF+dwBxH7xPbmIq2zy/vihYmvZPbF1NjcoHQblWnzEfgiKAunZQSG/GOvMRlCuCqumsKpibv2so/HTntxLdNZzTTE0Uh0CwpJ5lRmlgcDPSWPvh94L37ZLqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLK3ZIdgkP1ud/vwouJOCPjeYwUEXQbD3a2WgsEMes8=;
 b=Xrvd1DBbC8BKdHrZDEMtEhH2eTVOi4NvHWjawRJFPHoOYRGCa0wS0PpK9ZxMwD/860XkeP3LDN5HW9kTuMRPsYv7DxH9rYawsa4BaJOj+csyUDVZv+uo4FGnHBfB1kUffPh3tw3U0BF+8l7nMIGnww2R7fhMEc7M3xLeYHS2SKSuhIhbDIOcrh7StA6H8Uv9W1hdXDMiSrUMSHk9rdBUbQRTiQ14Zk+BK8hptsJW93AJ3ZYhwrYy4nHuua+AGFPzFHlJVfBqQ1h3PVuPZ/fS+Tk9saroeGxZIp5/qyE3LtuHvGGK5cVngF+ATkUCiTWAy6X6IZHPAkslwW8vGDi61w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLK3ZIdgkP1ud/vwouJOCPjeYwUEXQbD3a2WgsEMes8=;
 b=TTrpZYZyhv51sPGq876QHYHH+6GpwbS+P6kK3i3Qx/Yo+RBX6ekgF7JduTaFN78UyTjefrL7/55u5dXUDeQLLlPoMO8hKsJpRw+HzVG59Mq6ZwkWAuoxYH61GEgdlCpQGQ1sbpX0Uo7UKXhM2IxE1J2LHDEVpqWstGNxjtRcEIJuFgSLXtRK6IrJUSVGa3aG8jDf27WrcBLv2g1NhEQXMZ0+0gxwFb4Lr5bmdAW5PZK5xItXXcIoZ0tEpGZHq7bg+YZt+bRv5vpY5dGKtHEmSQ3sGdy9aGwV3ZmP60ESJ/EdjAM0gKSC5wRsNKXyWYMs/lqWc0un33jln8EZpwVaqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6794.eurprd04.prod.outlook.com (2603:10a6:10:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Tue, 14 Oct
 2025 08:51:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 08:51:25 +0000
Message-ID: <174ec43e-4cac-4452-a77b-e2e3b8413d05@nxp.com>
Date: Tue, 14 Oct 2025 16:51:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0101.apcprd03.prod.outlook.com
 (2603:1096:4:7c::29) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 1386ce75-5dab-4e3d-7d13-08de0afedb46
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFpiTHZoK3FrbFN6a1dQcG0zSjRnU3FSZ1NlWjRBU2EvUEpKK3JFTkhSY3BC?=
 =?utf-8?B?SzNEUTl2YWZuOWlOajJ6azFGOER1NlkyeWlTemcrNldJSlBLSXgrVGo1Qlpm?=
 =?utf-8?B?QmJJa0JSN29LdlpkL1lQaDIzWTNDRlo4Vzk4T0x0K1h2eDlOWnFKU1JOa3ZY?=
 =?utf-8?B?c1liM3hUc29nUDMzVGhtWm1tVld5aHdkSkhtRVFVNFB6U0FrYnlOeml1QXVw?=
 =?utf-8?B?QWhEeWFHV3podXJSTWFSTVI0Vm50VlRWd25tQ0tBWmtjNWsvNXRIY1laSVV3?=
 =?utf-8?B?ZzRQTm5sMXZXY2s3aFJTNFZSRjBTUDRSclZGKy8yYXRDdkNJZktrQndrYzFN?=
 =?utf-8?B?K2FjREJUekQ2eEdiRkw3YmRIUlVYT3ZTMnV3N0NzOUwrc1ovdjlpWitrcHVH?=
 =?utf-8?B?MUgwRE0vNFUyVjhLMGRmc296d1h3b3ExUDFjcnhmT1RKMi81RmdmL2FUQUFr?=
 =?utf-8?B?UWJTbUFESVZ3VjlKbHRlSlFacU9CVnZJR1NFQzE1WDVpUFBvTkhIa1l6bktw?=
 =?utf-8?B?UnpkZkFoNmFwQ2k4dzZYQS9lNXE3RE1UMC9Nay8zQXhneXVRaDdEMnNIMEdp?=
 =?utf-8?B?dEJEVTVhMmRRMjdvKy96Y2dwNmFlVkJ5UkxGTmY1cm1NOFVKR3ltYWdta2hC?=
 =?utf-8?B?Rm5wcXpQb3NyRncxdkEzRE5CT0RTZnc1QkRyS3hpelVRdXU3U3JBbytCVGFm?=
 =?utf-8?B?djV6Zmg3ZTF6QzdaN2FkcldONGpWckR4eldSVXFGU2MwdEgvWEpzb0tVVGxF?=
 =?utf-8?B?VTVHTGgvazl4ZUkwQmU4MmM0bW1QNExGL0FpWGlHZmQ5Qy9tU1cwcDRXK1Uw?=
 =?utf-8?B?YzhScWRkVkc5Q01WRmIrbUpySkIzekZ5em9mUEhwMjM0TTZXaGJJek94NEg4?=
 =?utf-8?B?Z2I5bWlxcS9GSU1SNG83NzdrdmRVSGpsVmdmeit1MFBUMW0vN0d2MkY1NVYx?=
 =?utf-8?B?WUl0bVo2dXZyNC9hbzF5OGdPNnR6NVZ0aUJuVSt6OG1mRXovMVBTM3l5NFBE?=
 =?utf-8?B?UC9NVCszL1lES3FzaDFadzdpSnhXRkJLdUwrL1hZQ0hXUzdIVGs2T0lDdzZa?=
 =?utf-8?B?MVY4dW1VaFJIY3lSSDhqSllwMG5SYlVwTGE3RlpORkxvNjRhQXdlanhYM1pV?=
 =?utf-8?B?US9BcXNXMFNlNytScDZSZUdhRmVqVjlFUjJlZFBzdVNjQ082dVByNU1YTkdR?=
 =?utf-8?B?YW9kUzlHUXVUNnIyZXYzR3pJSENTRHZFMzNnS1dzS2Vsa05jbDlhck55ZVN2?=
 =?utf-8?B?U08zYVBYeUtRZk5IQ29HMkxmd2ZsVTJpbDl4cnpBUjhnUVNnZVdRZkNDb3Q3?=
 =?utf-8?B?ZkFhMExWbkhVMDloaEpjY0xuMVZLTmR6OVgwa2c1Wm5jRklRcW96dUplOW5a?=
 =?utf-8?B?TjNYaFA5Mm5SRkV3bmgzMDgwT0xoOEVJdDB4YzZwbDF4TU9iaStKZzZpY0FR?=
 =?utf-8?B?L3ZBRGFvN0UzdCthRVVoMlpCZGJTenh5ZzZNNFBtOEYyNWN0aVgxQm4xRnpZ?=
 =?utf-8?B?ZnFYVGJjMlZlTWhDSnpnUi9JZUJMcEpMQXl0RVRoa3RNYjA3S1FkemFWNUVu?=
 =?utf-8?B?V0Y1UFREUmhEdnAyQm92bUtjTjF3UXdYSVFSSzhFZ2ZBVmpWM1VvcndZamQ0?=
 =?utf-8?B?c2d5NGs1azRmWHBtNnVHa1M2U0h6Tzl4NVlhYTl3K1VtUHo0dldManh2aXZx?=
 =?utf-8?B?YlFTdmlyaVJoY1JIQUNrUjAxYWo5SVZxQWFReGFVK2FtU3lUWWVtUEZ1eXVM?=
 =?utf-8?B?RHBWZ0N0TkhOdURvUHVPSUJ6UWY4dWg2ampvQUpFdmhHdHVRUHE2Z0tEQk1J?=
 =?utf-8?B?R011WlQyNWQxZUxzekQxa1hHNjgxVFZyVno2My95dnVqdjhXazJTT0M3N0pv?=
 =?utf-8?B?dVZ4TmVsZjEyMWhEeTY4VGZmWHFacGN5TnpFeVhDVFd2UUZXRldscGNQUSs5?=
 =?utf-8?Q?5Z0XTezhIHGQEh8OgOJlTmuJ7X5RlZ6U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXkvb0ZPdVVlektKcUZzNTBEZ3JMbU1LWEU2c2V1MngyQm15TFVpY1k1V2hh?=
 =?utf-8?B?U0orWDJXQzRqVytmUkgxQXBtaWxPUytQT0Vuak5mM0Y2eDQxMHlvOHN2alZk?=
 =?utf-8?B?cFJocjQ0ellTa0pnU0pMN2VzMnhuSkp3OGRqNy9UcGZjQnNsR2ZvbENEYmkr?=
 =?utf-8?B?QTY1OFQrUytReUdYUTRQdHZGMWYzdXdqN1R4YXQ0bUE0bllaOEJIMXBXKzF6?=
 =?utf-8?B?YTltQmYxeVBGdGc3UEFXcFcxOXpRR0VlQ1puWFR5bzR1U2NUY0VkQkxiSzZC?=
 =?utf-8?B?aGEwQ1VhTmg1UGpxL2NsWmtMenpYbnJQK0VjU0RGQVhPMWtkT1NEeHdrNlM1?=
 =?utf-8?B?MDg2am9kelduOXd0bDc3SW84WFBIbGNuOEwydno0dVZnRkVCQm9qbkJyMm42?=
 =?utf-8?B?MFRWZUV0bDQyU2dxc3JNWVZzdEpaS2d5Tm95eEZJR0M3Z1lMVTMyUTVkMWxN?=
 =?utf-8?B?NnZvWVladWh3WlBGZy9EdlNIL0o5elFMSnRkQUZaUlAycnJJU3dNMFVjVWJ6?=
 =?utf-8?B?M2ZyWUhEK2w5a1l4RDZ1WG5aa0FFd2xRQmkwSjhTWm5XNFRFMnFyQ1h3VXho?=
 =?utf-8?B?K3EvbjVYYzg2bFZEQXZVUDQ3RGxNMjVXS00xS1paaE9yUzI4Z2lNOWxwOTYy?=
 =?utf-8?B?Y242SjhLM2RUWnNQTnZEOHBNTFNSMGt0bUQ5c2xJUkNFeUhLYnZlOEpMYUdK?=
 =?utf-8?B?S2F4Zk8rZmxjUm0vSFJkU1cwdWRCVlhaRzgzMlE5RUpLTkN0TFNPQjRoS2Zx?=
 =?utf-8?B?bGNwY0xQazFpSWdQK1RaL05tZ3BKMFRFRUxTRkZlMGNhaDkyZVROZU1JRWJR?=
 =?utf-8?B?UmN0cmlCVE5UYzFxcDAxc2pmbWo4UTdQd1VRWlF1cDJTdzYvN1NTb3ZQOE5Z?=
 =?utf-8?B?VnRHNk0xYXIrcDFBQndUNFgxaUY1SSsxVCtNM0RvZlFwZ1NHbFZxUTVJMEhD?=
 =?utf-8?B?bmJoYnc3eUkwb3hFUGlWdnNGc1ZycWE5N2VibWtGaDU4d3p4emE5bHlvcWJ1?=
 =?utf-8?B?MkQzL0tmWm5pbmNTOXZQdThuTXRHcXVqc2ZVUWZXSkpvRDBIN1FBVXFmWnl5?=
 =?utf-8?B?VVVzQ2QrUGxZUlZnOTNDdThtc2ttdVc2T0xPV1pUOFUrMzVQMjBjMndlcGdI?=
 =?utf-8?B?NUM3Z2J0eVNaS3NZM0FJMjVialUxc3JBenhhb2FudmVIanl0emNYemw1QjdD?=
 =?utf-8?B?b09OQmNTQ0dGNGdOZmhxakIxbitzcHJQVUtQeUdBeTk0TUdXSzk2aThhTzMz?=
 =?utf-8?B?Y29kVHpPeXZTR29FTE0yVTVQRWtINC92ZFgrbHFTWWtQWm9PdDhvOXlhVUtD?=
 =?utf-8?B?MXZqZEMxS1h2U0k2UWhvaTZuMSt0bDNpSU9ZaXl4MklUL2VuYWNYZjhoT1h3?=
 =?utf-8?B?WHY4NE9QNjdpRmgrcEhEWkhSVGhLRDB1VGdRb1ZhSlNsakx6QVNVVUFnNVVM?=
 =?utf-8?B?U3NTOS9ldWpsMTdxaDljaUdyWVlJT0JtZWNNaDVFcnFVTmpycTNKalAxb09J?=
 =?utf-8?B?dWptZWtzUktJenpFcXZOVGJqOVBXVW0xN0h1d3QxSzQwT1hCdWZGUXNRamdo?=
 =?utf-8?B?azRKRU5QVG9oeW02V2puQ0xjTHV1QUh6VU41Z2NKenQ3bXdyU3lITTc4VkR1?=
 =?utf-8?B?dTlpOHNhWUpNaWkrclgzdTZ6Q1B3QVQvVkJ6V2R1c2h4WTVYOHZuUlc5ejlT?=
 =?utf-8?B?UnkrYzhlcXZEOGhqU25sVkZjMWx3UnNVZVp0OFNtQnl1bVM0a2FCeURmMDNy?=
 =?utf-8?B?MWh2Z3p2SmFHSnhneGVEdGhnZjA4dGpORmdwZVQwSkhBdGlVdmgxTnlTcUl1?=
 =?utf-8?B?WWw0UVpzWFdGa3g3QVNqa0V6eVhKY2dlYVpnNmxrd05oVGVSVTY3M05ldmJk?=
 =?utf-8?B?WEQ1dkxFK1lKVllMcGtOVkdrRmJPUGhKYWRQTCtwZmFTdTlGK2VmWkhIVk5s?=
 =?utf-8?B?aFlndUpMSnZ4ZnZaRXpHd2FPUUlvSUwySmNwVkNra244ZW93VmJRdEtTMXQ0?=
 =?utf-8?B?MU5YNFVvY0JoN1hsOW9yOXRIZEsyT3N5a0J3aENGekcvYmN0cThKNXlBS1Bk?=
 =?utf-8?B?UDVaN1pDTGMrS0txR0ZLTlN6QWs2ZFQyczlaZUVTcXZvNkZxNGJPUFpheS9X?=
 =?utf-8?Q?cx42TkJBs6OsJRR3L4D4dzr70?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1386ce75-5dab-4e3d-7d13-08de0afedb46
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 08:51:25.2652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3EmJoGMoMf88arTFd2IUxprdNcQOTNCEJE2qiJrTP0i5uBN/lnwVDxqjK89UYB0K+sNiXA2Ba1A1cTZ4uVg+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6794
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

Hi Marek,

On 10/11/2025, Marek Vasut wrote:
> This large series adds support for the i.MX95 display pipeline, including
> DPU, DSI and LVDS support. Most of the components extend existin drivers,
> DPU is added into DC driver, DSI into iMX93 DSI driver, LVDS into iMX8MP
> LDB. Pixel link and pixel interleaver drivers are reworked to work as two
> independent channels, since there seems to be no dependency between their
> two channels. The i.MX95 DTSI changes are also included.
> 
> Since the DPU chapter is missing from the i.MX95 RM, this is based on the
> NXP downstream kernel fork code and there might be issues.
> 
> Majority of this series are DPU patches on top of the DC driver, I tried
> to keep them separate and easy to review. Later part adds LVDS and DSI
> support, this can be split into separate series.

Like you said that this patch series is large, please split it.
Also, make sure proper maintainers are in TO or CC lists for each patch(b4
tool should do that automatically for you), e.g., patch 37 should be sent
to Thomas Gleixner <tglx@linutronix.de> according to MAINTAINERS.

> 
> Both DSI-to-HDMI path using LT8912 bridge and LVDS single-lane with Logic
> Techno LT170410-2WHC panel were tested on Toradex i.MX95 Verdin EVK v1.2 .
> 
> Liu Ying (2):
>   drm/bridge: imx: Add NXP i.MX95 pixel interleaver support
>   drm/bridge: imx: Add NXP i.MX95 pixel link support
> 
> Marek Vasut (36):
>   dt-bindings: display: imx: Document i.MX95 Display Controller
>     DomainBlend
>   drm/imx: Add i.MX95 Display Controller DomainBlend
>   dt-bindings: display: imx: Document i.MX95 Display Controller
>     processing units
>   drm/imx: dc: Use bulk clock
>   drm/imx: dc: Rework dc_subdev_get_id() to drop ARRAY_SIZE() use
>   drm/imx: dc: Rename i.MX8QXP specific Link IDs
>   drm/imx: dc: cf: Pass struct dc_subdev_info via OF match data
>   drm/imx: dc: de: Pass struct dc_de_subdev_match_data via OF match data
>   drm/imx: dc: ed: Rework dc_ed_pec_src_sel() to drop ARRAY_SIZE() use
>   drm/imx: dc: ed: Pass struct dc_ed_subdev_match_data via OF match data
>   drm/imx: dc: fg: Parametrize register access
>   drm/imx: dc: ed: Pass struct dc_fg_subdev_match_data via OF match data
>   drm/imx: dc: fu: Describe remaining register offsets
>   drm/imx: dc: fu: Inline FRAC_OFFSET into FetchLayer and FetchWrap
>   drm/imx: dc: fu: Pass struct dc_fu_subdev_match_data via OF match data
>   drm/imx: dc: lb: Pass struct dc_lb_subdev_match_data via OF match data
>   drm/imx: dc: tc: Pass struct dc_tc_subdev_match_data via OF match data
>   drm/imx: dc: ic: Pass struct dc_ic_subdev_match_data via OF match data
>   drm/imx: dc: ic: Use DT node as interrupt controller name
>   drm/imx: dc: Configure display CSR clock feed select
>   drm/imx: dc: crtc: Do not check disabled CRTCs
>   drm/imx: dc: Keep FU unit running on i.MX95
>   drm/imx: dc: Add OF match data for i.MX95
>   drm/imx: Add more RGB swizzling options
>   dt-bindings: display: bridge: Document NXP i.MX95 pixel interleaver
>     support
>   dt-bindings: display: bridge: Document NXP i.MX95 pixel link support
>   dt-bindings: display: bridge: Document Freescale i.MX95 MIPI DSI
>   drm/bridge: imx93-mipi-dsi: Add i.MX95 PLL initialization
>   dt-bindings: clock: Split support for i.MX95 LVDS CSR
>   dt-bindings: display: bridge: Document i.MX95 LVDS display bridge
>     binding
>   dt-bindings: display: bridge: ldb: Add an i.MX95 entry
>   drm/bridge: fsl-ldb: Parse register offsets from DT
>   drm/bridge: fsl-ldb: Add i.MX95 support
>   dt-bindings: interrupt-controller: fsl,irqsteer: Add i.MX95 support
>   dt-bindings: clock: support i.MX95 Display Stream CSR module
>   arm64: dts: imx95: Describe display pipeline
> 
> Sandor Yu (1):
>   drm: bridge: imx: Add i.MX95 LVDS Display Bridge (LDB) driver
> 
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml     |   1 -
>  .../clock/nxp,imx95-lvds-blk-ctl.yaml         |  80 ++
>  .../display/bridge/fsl,imx93-mipi-dsi.yaml    |  48 +-
>  .../display/bridge/fsl,imx95-lvds.yaml        | 140 ++++
>  .../bridge/fsl,imx95-pixel-interleaver.yaml   |  85 +++
>  .../display/bridge/fsl,imx95-pixel-link.yaml  | 101 +++
>  .../bindings/display/bridge/fsl,ldb.yaml      |   2 +
>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |   4 +-
>  .../imx/fsl,imx8qxp-dc-display-engine.yaml    |  45 +-
>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |   4 +-
>  .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml |   1 +
>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  13 +-
>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |   4 +-
>  .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      |  52 +-
>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |   5 +-
>  .../bindings/display/imx/fsl,imx8qxp-dc.yaml  |  53 +-
>  .../display/imx/fsl,imx95-dc-domainblend.yaml |  32 +
>  .../imx/nxp,imx95-display-stream-csr.yaml     |  41 +
>  .../interrupt-controller/fsl,irqsteer.yaml    |   2 +
>  arch/arm64/boot/dts/freescale/imx95.dtsi      | 710 ++++++++++++++++++
>  drivers/gpu/drm/bridge/fsl-ldb.c              |  65 +-
>  drivers/gpu/drm/bridge/imx/Kconfig            |  28 +
>  drivers/gpu/drm/bridge/imx/Makefile           |   3 +
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.h   |   2 +
>  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c   | 612 ++++++++++++++-
>  drivers/gpu/drm/bridge/imx/imx95-ldb.c        | 470 ++++++++++++
>  .../drm/bridge/imx/imx95-pixel-interleaver.c  | 217 ++++++
>  drivers/gpu/drm/bridge/imx/imx95-pixel-link.c | 184 +++++
>  drivers/gpu/drm/imx/dc/Kconfig                |   4 +-
>  drivers/gpu/drm/imx/dc/Makefile               |   2 +-
>  drivers/gpu/drm/imx/dc/dc-cf.c                |  41 +-
>  drivers/gpu/drm/imx/dc/dc-crtc.c              |   6 +
>  drivers/gpu/drm/imx/dc/dc-db.c                | 227 ++++++
>  drivers/gpu/drm/imx/dc/dc-de.c                |  83 +-
>  drivers/gpu/drm/imx/dc/dc-de.h                |  14 +
>  drivers/gpu/drm/imx/dc/dc-drv.c               |  45 +-
>  drivers/gpu/drm/imx/dc/dc-drv.h               |  11 +-
>  drivers/gpu/drm/imx/dc/dc-ed.c                |  67 +-
>  drivers/gpu/drm/imx/dc/dc-fg.c                | 157 ++--
>  drivers/gpu/drm/imx/dc/dc-fl.c                | 145 +++-
>  drivers/gpu/drm/imx/dc/dc-fu.c                |  46 +-
>  drivers/gpu/drm/imx/dc/dc-fu.h                |   7 +-
>  drivers/gpu/drm/imx/dc/dc-fw.c                |  54 +-
>  drivers/gpu/drm/imx/dc/dc-ic.c                | 192 +++--
>  drivers/gpu/drm/imx/dc/dc-kms.h               |   6 +
>  drivers/gpu/drm/imx/dc/dc-lb.c                | 109 ++-
>  drivers/gpu/drm/imx/dc/dc-pe.c                |  12 +-
>  drivers/gpu/drm/imx/dc/dc-pe.h                |  41 +-
>  drivers/gpu/drm/imx/dc/dc-plane.c             |  18 +-
>  drivers/gpu/drm/imx/dc/dc-tc.c                |  55 +-
>  50 files changed, 4000 insertions(+), 346 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/nxp,imx95-lvds-blk-ctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-interleaver.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-link.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx95-ldb.c
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx95-pixel-interleaver.c
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx95-pixel-link.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-db.c
> 
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> 


-- 
Regards,
Liu Ying
	
