Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB684B3F1D5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 03:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D78C10E02D;
	Tue,  2 Sep 2025 01:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fmoIuUXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1FD10E02D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 01:16:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJHdC2tP9BHQu66AwuE2hF+cOz787p2GO21WZx6Djp2U4ybOGQtfzKdW7glAPFHFM+uMMQwcphaTgmmti/hZxflQ3TpsHtotvpg0prBgPDNPjBGxuFHfMF22u6bpffZaOO6y+XvvJT4MW4FqBgym9gnVP+2uKKqGr4JutjyVlb3Yk0lyOu2saDXgPuuOm4qLf3b/xolm0szdS2kuCnJcP+DPya9XRXwy1l6fCtGAJCjEpYAL2D5AgzLQyOuUl0DNYHRdZQc4mNd8advzssHDV7AbzOUeeScbi6dca0dCq0zEHTaRgyQzDKAVyW4dW+EHGiUFfRzKIns3MPl2tSGYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPXaueUGk5FpcdPLO+5MaMuebtm39OE0tteskcsE3BI=;
 b=nTxRkhNFlaiUQi0+W0OhHhi/akouX5m8UcapGiSchhqXqDyj4Cu1DORhYER3BugZ9ImTQI7053QFbCMPdAagb2QYeWMH1X3hVrC/3LJABJyv/EinKWRkbSUyud+ennfCcA9csdlRQyVtgOw8GwgDjNAF+9U9aN2ukXMn700aL8mJPZhQEo9cmu/qmgLEJASrDBAqSIDqdSsCZkrII6e4+MWIQc6bxpvaHPIu+Q968k3I6b76mxLPC4rS5Q0cZELUPS6/OpSPNnOo5MkbIB1swcjM0IsEVmTcCvftzBZ4F6KqF95ZOqXowBcZufv6FPZhafFwfDwOmNR45x+ra3Najw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPXaueUGk5FpcdPLO+5MaMuebtm39OE0tteskcsE3BI=;
 b=fmoIuUXaN/m3gFsFu0qCc9ZIemsK1Udk3KwVDRHr46CD2ULVnRvbfzxMQAUJv0H7xFgavUqaIHHlH7jIdo48M7kIZ04hwZfJahwbYKag+1XamsoR2tg3C6Ad386W5a8FMdjOku2I0UKVbyK6VquyQCXZP4r5mj4mNmsITnZwC3UqR0vtSuMq6T/JKhB7fwhug7rihark8rV+JCXD+28hha8lD7pp6A4DFoqJj/YM0b5ix5lAa6Ga8SLG6Mce3anjs2/iZM3gZiBkXhKvW+yNFkQlGIRgTUjwH3uRWxZEoPur50kPrkJlctyrHYIhN//ZzJPR2sS2veZJ7ykaQltrUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SN7PR12MB8819.namprd12.prod.outlook.com (2603:10b6:806:32a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 01:16:15 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 01:16:15 +0000
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
Subject: Re: [PATCH v1 16/19] staging: media: tegra-video: tegra20: adjust
 luma buffer stride
Date: Tue, 02 Sep 2025 10:16:12 +0900
Message-ID: <4134482.44csPzL39Z@senjougahara>
In-Reply-To: <20250819121631.84280-17-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-17-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0336.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::7) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SN7PR12MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7ebd82-e5d7-4eca-9c2b-08dde9be5019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnpjYjdMRWhPaUVNd2FuRXZOTUErUDJIa2RBUlljOWJUQ0xobW4rTEM2UVYx?=
 =?utf-8?B?MXRla0dlSi83a3ZreXRYQ3RnUTA2ejJleUFDTVBOem1FQXpxOTJpOFZ6b25R?=
 =?utf-8?B?NWtidUNjMG9HejFZaHhiTDBvb0E2VlhudU1XbVRuRktORkRDKzZQOUdCSXBZ?=
 =?utf-8?B?bGVlck56NGUvYW1zbDkrbWtSRkRFWXBTRUJleTJUVXptYmI5WUw5bmR1UzRl?=
 =?utf-8?B?c0xERlJ2U0EyY1ZDVlRnMWZQSS90MWYzU1JvTjdFU21scEE5dmZ4UXhrclQ0?=
 =?utf-8?B?K3lGdThGRTlkbUo0UEg5N2VsYlIwRWduZWdRV3NEM1JmSVd6YkN1bnlrSmhp?=
 =?utf-8?B?bWpOdTlad2M0S1RpejEzbEZyblNqMkhMSGZ3bkNzL3cvMGRsVFFxbWRTTmpZ?=
 =?utf-8?B?eXZIdTJUdzlBNG5LY2dxOEdIeGtjYXliTHF6RGJjTTNUd2ZwM0R1RXZpelM1?=
 =?utf-8?B?OXVoOC83VlhSdm5hdldNZWNmbHBzck0wbThqZVkyZDJUejdWNFp2MXZCdmY5?=
 =?utf-8?B?KzAwMzJ6WjQ4QTM0ZW1WdEtnUi90TVUwNDdiR3NwVm1GVFgvZ09QaDhjdWh6?=
 =?utf-8?B?Nmt3OU0raGQrVHlrcE12bTlQSjF2YUVuNmN0R2tmYkFCMTJwU3d3OTNEbE1R?=
 =?utf-8?B?RTJ4S1B0elY1VzhUaXYwaE4zMUlodmdsN2xOKzFjZ01SVHg0ZTkwcyt5NTRB?=
 =?utf-8?B?V3pPU3dqSnZRS0d6ajUwZDd3dVYzdUcvZjJkU0dTdnNwRHFZMUVPWU54V3hq?=
 =?utf-8?B?aFVzTFM3eEN1enNoeFRlMTFCSDYxT00veGlCajNVZkVqaFlvQU9SY1QvZmM4?=
 =?utf-8?B?L2RrRVQrY3dQb2wvQnVRdHhNV1A4Zjd6cDB6cmF4cE5jMFlCL3FNZXc1Z0Zm?=
 =?utf-8?B?RXFTRHZ6Y1c1L2VhZ1hHc2h4eXBUTHgrTng1a2labWU1TTZaSnBXeXdtNXRE?=
 =?utf-8?B?bVk4RTNaSTFZM0FvNGpxdlBRR251UlNVMWdvRVZYbmIxZnZhdnA1MDZZMjhm?=
 =?utf-8?B?OFF2N3VHRnZQZ1lHeXZxbmtSQXdFUmd0SFhxaS9ZWmFud01qV0w5dDRMSkF0?=
 =?utf-8?B?cExZak03eTJzengyVUFMWGJOQnZUWFQ1RGp1dlpsc3JTSjNmS2RsSmlqY2d5?=
 =?utf-8?B?UFFVSVNVK2s0Y29XR0w5M1BEd3Z0RzRHbElLOGkwYnpxYjBDZGx3Z2VySmZx?=
 =?utf-8?B?bXVpWEp1VmdEZ0FLL2k0ZHFtQmdhbUlZbnZKZ2VmZ1FVZ0lRVnhDUXdXTG1T?=
 =?utf-8?B?MCtvbG1hNEZsMDhaZisxMEl1ZTJhdnZGNEhKSFdVSHZCSWVVTThFMDJTa1Ru?=
 =?utf-8?B?dzN5bzlhUXhzVTBaVlJ2Y1ByNVdhdkZnODJyaGRIK3lsN0FHRUZMMzhHeWtw?=
 =?utf-8?B?d3dyRmJRL3hjWXpNcnNhL09zOUdHNEI0cjRteDZJUEV1b3J4MGVBbyt1SWFn?=
 =?utf-8?B?aEhFaSs2ZkVCT0xmancwOThZc01BN3NEM0VzRUk4V1lVY0x0U09xY2hmcWtH?=
 =?utf-8?B?TTZhZTBYQkxTK2RvcVlYZml1VnVCTUIvcVVqdEdORGlabmdlYytPWWpOSUZU?=
 =?utf-8?B?bnk0alZnSmJBQzVsQjBleDRCZDRPa0NaNFp3dTZGUW1IajBqRzF2enF6TlVJ?=
 =?utf-8?B?dUhrT1NSYS94YTlNVVFDSEpUckdONzhmSHNHTWNQZUw1M0RqWGZQb01rZHRG?=
 =?utf-8?B?NjJCTnhub01BNXAzS0pYTHdudTNORXpQTGZWTm9DQ1ZIaC9jQkV0V1JFb0tu?=
 =?utf-8?B?a3dyaDExMVcxN0lWTEFudlpHVWpkZkFQQ2I2UkRsZ3VSQXBabzJTYmpLM2s5?=
 =?utf-8?B?NUpGcWUwOWRtUG1lQTVXbGx6WjZ0bjRsL2plcTY3OVZkWmcyR3Eyam9aaGpL?=
 =?utf-8?B?Uzl0cVoyeDNPSWxveXdPSFA4RXB4eUtYUy9XVnVCYklPVVhxenJQckRMTmhL?=
 =?utf-8?B?UytPaU5nOXpoUElSZjVlSUx6ak5FSTZlNHMzNEZWK0NnQ3RKcjZmYWhTYkkr?=
 =?utf-8?B?UEZFSDB1dzRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1Vqd2RCNktQaURuQUsyOGViVG5DekdjMXlXMkNKSWhMNWg3UlNDZFBrcG1z?=
 =?utf-8?B?aXgzUENmUVV6T0hDbExFeHV5VkNkTXdNVEQ0RTc1MWQ2V1pBRUU2Nk1wSGV6?=
 =?utf-8?B?bzFCc3EzRmFBTlVpakw5d21US1hTdWhZbUVwdTFDSythTEZOQlZwZ3JMTjl6?=
 =?utf-8?B?dlh3TWVBcHlpaGpRNHh6anBRV3Y1eUZlbDRVYXZNYU5WQnp3NzdFQjZ2T1pk?=
 =?utf-8?B?bE1qaE00NFBpK0p5dEtIOC9jdWJERjlFZ0pWWEtQbFlpU01OQUJnVUYxRjJr?=
 =?utf-8?B?VFdBSGcycVhOek5PYWdSdUFCOHpMRUxCZnl3b1JQOFBZNXNvQlF0QWg5ejln?=
 =?utf-8?B?Y0FJbzlDVXN2YTFROXVlUTdXQWpzRDdXbERvWUlBTkZkdTJzMVpiMnI4eUxW?=
 =?utf-8?B?d3dyZ01CUjdaejkwUlJVZDhGU21kRUlNT3RFVkZhZnBFSFJ1VjNqbmVzQ29k?=
 =?utf-8?B?MzVGYVBHYTh5eC9zaE93NlJXak5qV2FSeUthZnZ5TmZDMDdOSVg2WkJQQWV4?=
 =?utf-8?B?ay95K2tGQmNKR3RYQ2JEK2dyYWc3b1RvQVc5M3I0UGdiUlBMTFl1Mk50bWM2?=
 =?utf-8?B?M3FIcndQN0FTL1JJeFowNmhuSWdpLy9VYlFHTXhnZDlhRW9PMVR1NHNpWHhH?=
 =?utf-8?B?eDN3Rk8zYitUU25ZUVZyTE44c1lUcENaUjI3KzZxOEluVUNNQjhDVWxYcEly?=
 =?utf-8?B?NTBNYkY5ZTgrZ0JIVXZvdXlZdTlNWVJCbEtkN1k1Z01RRWNyaU0xWmJ6Wlgw?=
 =?utf-8?B?aEw1cXdzQUdZWVluQm9MU2JTdVZDTGUrY1B0U3V1SzFpN2FqYU51Z3BkV3da?=
 =?utf-8?B?U2RmQ1E3dmRUeWY3YTR4cExRc1NUWnpRRVFyOWNsL1R2QzlaazFpWStLM09a?=
 =?utf-8?B?ZXZLdU44alhGVGdYYXM1MFNVaER1dFp6QlVKWDNGVlhDMVhvNTdRak5qY0dH?=
 =?utf-8?B?WTNtNzRNamljaFdnUXdLMGJwQUlHV2xIdnhSUEFyRVNabjZhSXEzdSsyOWY2?=
 =?utf-8?B?akpYSTdyY1BCeFJwTDhPZXNVOE00SlRCMUFPQzdFZWJkY24xdWlBQXdUQUl5?=
 =?utf-8?B?T2NVMUNIV3JqbFJpQmExNjB3S1ZqRVc2dVVORGtuUk9Wa1NmVWc4RTIxZ1lJ?=
 =?utf-8?B?S09ndzc4YWNBTHZXSVludTRxbUJiNEhCU2RiZnBLc3ZuekdnM1dOeVM2djNY?=
 =?utf-8?B?YURqOHJnQzE2aHRudkJvTFoyRWptT3BWQzF1aWg0NVZITk5BK25GU0pTZytl?=
 =?utf-8?B?V0ZlMDJwY0hVM01TZ3lubDlqTTBzYVFXazcrWE5SWWtKWFEwU0dXa0ltNXFJ?=
 =?utf-8?B?aW1DMVA4RjNBNHlzaWlUaG5VUFB5dUE4V0ErVkxaS3YzK2RpVW11MDZnK2sw?=
 =?utf-8?B?dHpzemFEQWpxODVBMG1zRnlTZDd2K3pNOGJ6RjFpb1M1UmlUNlJtYTBTbENm?=
 =?utf-8?B?MnlVZXJxbi9zR0o4L1A3cVdiY3Jnd1M1elpYVUhCcUY0QnBRM25FSXl1bURq?=
 =?utf-8?B?dy9Bd1lCd21CZzB3MzM2WXVibjhPTWJmUzVQZnY3Q2FZd1RWRXlsM01mZkpX?=
 =?utf-8?B?dDVyOW9GSDRaYU1kOU5pTUlUZ0NSTGxVOCtDRk9XcGFrMkYvTGE3WlhuTStm?=
 =?utf-8?B?QjJRRGc2NDNrRDA1Y2UvOGFZQm9KV2JLdHJsTjFLcStwV3BXbTFXRDhtSVJh?=
 =?utf-8?B?MUQwVktERmVXZ01tWXVhQnRkN21paVE1M1ZqRmhKRGRuSDl5WmMrTGxCWWFB?=
 =?utf-8?B?citqaFJscUdwbytGUHRtaHBBaENoK3FOekRmVkdEL0R2NmpHNExUaEhiY2dM?=
 =?utf-8?B?NjVtdUtRajU3ajRkcVVOd0hOejBpenRzQVdCK3k4OFJHSFVPRGNxZm5iR2Uw?=
 =?utf-8?B?dm1nbUFxOGxLL1V0NlVZVDU5SmNROS91cnd6ZzRtUmdOTGFyV212Vk0valBC?=
 =?utf-8?B?c2lTT0VYU0UraE5lZWZjMW9JYStJNUN1aSsrYUg4SHdDdUphM3IvVThUUXUx?=
 =?utf-8?B?Qkk3Zkt0MkZvbGpEVXRrMlFOMG14N1hvNXlET2RGdTFWVFJkRDRadzJtWkRh?=
 =?utf-8?B?LzdyNjVzMHphSmx6bjhWTmRxQm9QRTZFMzdjZStORWdFWExyMmlNZ0lmd0R5?=
 =?utf-8?B?TVRVQlRaYkpIYmVZd3BqUTY2VEViSy91ZjZTSnZ1ZFcwekdTU0VyMDdWQW9z?=
 =?utf-8?B?YjNKTzhSbmxDYU5xOVNSNW1NSHIwQmFBYlZsTkx2RXdlTVBLTFVEZ2pwc2tB?=
 =?utf-8?B?SGovWlVZNHZYZERXR0ZhdEhRL3VBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7ebd82-e5d7-4eca-9c2b-08dde9be5019
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 01:16:15.5425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fiq5hWYfWlcYOygpmQa6GxrQuuXPTsh0OEbCu6Hl0ud82Kmcnr/RH5y5h7FnQ8EweXxOQwK0Aby5lk9E/D/R1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8819
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
> Luma buffer stride is calculated by multiplying height in pixels of image
> by bytes per line. Adjust that value accordingly.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c
> b/drivers/staging/media/tegra-video/tegra20.c index
> b466fe7f4504..a06afe91d2de 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -496,7 +496,7 @@ static void tegra20_camera_capture_setup(struct
> tegra_vi_channel *chan) u32 data_type =3D chan->fmtinfo->img_dt;
>  	int width  =3D chan->format.width;
>  	int height =3D chan->format.height;
> -	int stride_l =3D chan->format.bytesperline;
> +	int stride_l =3D chan->format.bytesperline * height;
>  	int stride_c =3D (output_fourcc =3D=3D V4L2_PIX_FMT_YUV420 ||
>  			output_fourcc =3D=3D V4L2_PIX_FMT_YVU420) ? 1 : 0;
>  	int output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_RAW8 ||

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



