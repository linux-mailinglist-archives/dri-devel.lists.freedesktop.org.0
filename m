Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5656B4FED0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B0F10E78C;
	Tue,  9 Sep 2025 14:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a52xiB3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2079.outbound.protection.outlook.com [40.107.95.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1323210E790;
 Tue,  9 Sep 2025 14:07:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luVgxXuNtlJOgVKiSgYxpoUzaYsj0sDo7mzYESgJr3PX8WZFaMk3bhUePjir4luNJ+j/dTcTyMDpWBOqbnK6AmUD3yTHbXfv0ZX/F3Fuet/WlBmrHMcaOZ5Kh+IopEJJaP7yIAB22SCbbfl/qYg9752m5uGF0xFyx6ILGF9E5KahhPW7jS66G0iR46NY2R/VoRBMNtwne2dPceOGOUYCXhEENY5i/Ebpl6B8eMce/pZU0pkkvdZjij6u905ZTg0+Au/PluWGMTeUOtu1Ko/rfCXhiQOEn54GTdtfOJXbo6PNM/Tum6nPQSr5Z+bb2te63+XhB/Rvr3Vbs/pncluT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11fdBdw5kdQOOY7SiWW2SIjX5WEG0dPVkVlfG3IE5nM=;
 b=SkqDOhqUwpGFjL2xsDUHxrCpr5/hg6QfLM6Hr5VRybwqOjmbC8d0/UMapWsUXv+blUaM1nE1hvRZFKxoNldFuQft25nV9Vth/LvAWRL++HwzHarkbK+lslGjwYiEag9cINgOobD6kAMUojj84f5tOS6OjZUWLbN2Uq6A9g5q740TInjVG06DczsQH8h9h7Z3r00m883vaOdiBVp6yf1DK2lbnP/NC+Y8GFZhJayLM4ThFfTX7ALFhP44Xs2uHFzbnqXcAiBy7H0Fe8fPyOJKktK9P2O3KrWpHgPmVpZn3YSafscqcgT/cMn7X4pUcAz+GCeCfaqtTx9Ac6Rul/l1vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11fdBdw5kdQOOY7SiWW2SIjX5WEG0dPVkVlfG3IE5nM=;
 b=a52xiB3Nywyty53g+a8ggxVH6dRpdcrs1rdXcQ8LdHCyecTR4BDDSbWAiXt6gFSkH7brnLIwyHCNokinXOKUbeWABVP+iJDY/aIgcsuA8Mw+dwX7Bzt4dlk/IcTO0Zy85li3iHjou4ojxat/F7mo3nxAwpl1EwRcRmzuIKxtjKp3JdM5muaWeZf5jM5UYwaUdgL+vWU3oMDRjmMxiWx5uDDwG/5uhvwerQS7wBoV7t6eymhCS/BIiBsP3DT5rfbnueE6lT7xUD6qhmYV9+eHZvTpWFV48YNiKfxdTI/L36bOLBsvaLQspdTS6KH6MC1XvgLAa3I3GBUHk4+NAkbJoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8653.namprd12.prod.outlook.com (2603:10b6:930:c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:07:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:07:19 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Sep 2025 23:06:45 +0900
Subject: [PATCH v4 09/11] gpu: nova-core: firmware: use 570.144 firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-nova_firmware-v4-9-4dcb433d5fee@nvidia.com>
References: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
In-Reply-To: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0180.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: 279ee3dd-0b1d-4a79-5a4c-08ddefaa3070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHZjMGJ1cXhPTmZxcHAvejlmcGh3YlhzT1o2b2YxYkVkaElqUDFEenhoSnpZ?=
 =?utf-8?B?RG5hL2UzQXlFdGlYa0h0cm5Ia0pUdTNHWmFrWHRxSkJHUVFYVTRGMSt6OVhB?=
 =?utf-8?B?OXIxWng1MTg2enFxNE9LbUhpazlyOThxOXZJckJjQUVmTU5WdWxPK3lYMjB4?=
 =?utf-8?B?bWJ5L1VEaGxRYUw1ZTVPdHFRMlpEeUZtN2xPbTVxbDJmbXpvbG9LZ0JiWSsx?=
 =?utf-8?B?bk9odDBjb28raHJ0ekFYcXdyeVowSkpmSVgwNVR5UFZtdXhjODhXQkpON3lS?=
 =?utf-8?B?L3NwTXdMRWNqUEV5UFRYa21Ic1huaGh0UmdXWlVKU3hmcTB2Q0t0Z29sb0hN?=
 =?utf-8?B?bGN4amJ6NXNYOGt2dkhVbUJxUUNSQkpHYlJKc1RUdWliVHl0YTJQVTVLOWpG?=
 =?utf-8?B?ejRNNzI2NG1TVkFHUGZ1c1A3RVoyMmM3R2dBdlpsZWU3eHdRZTdzdFk1aU9T?=
 =?utf-8?B?SWZCWW5DSk5lMDZnN1hNTlQrVllvYnIvMUl4WEdWUE9lV3pqUDlnQlNiMm1t?=
 =?utf-8?B?TXYxcVBUcEtSTEZNRW82cXg3dmxRUE9Qcnl1U0tJVXdlOWNxMVdaZXF1bUpJ?=
 =?utf-8?B?RnJRR3NXZ0JodU00Znl2Y0tYTkFHSUZvenRQazVkL3IxQWlBamcxQ3hZanRL?=
 =?utf-8?B?d3JEMGNTOC9XaEVIaUlKK0pYd3hZOW9CbzBreHVNWUE4WWt1SUhsengxbFBN?=
 =?utf-8?B?T2w1a1F6NXgvSjc3RzFPb2ZpS0JTclZQeUswakpPM1pDVGx6OVM2bUwzQll1?=
 =?utf-8?B?SVdQakRxL21HTWpTRWg4UnRKeTBmQjYzQzIwS0lLdzFOaFUrVitKMmN3VjhW?=
 =?utf-8?B?UFMvanZUZEVOUUw3TUt0ZFhVY3NtVHFrd3VwQlNsTzkweVpiampyZGRSMi80?=
 =?utf-8?B?SnMvN2hqSDEvTWVQVnNOMk5sSmxld1FGVklsYmZINGVodXNJVjBmK1I3SGg0?=
 =?utf-8?B?WkQwMEIyUG9GbTl3SHBiRTE0U0JlUnlWeldBdk52VFp4R29lZ1BjTjUzZTlz?=
 =?utf-8?B?VEgzWmttaFdQcTkrODR2cjFsdDg1NWlRSndoWWUreHYxQlJocGQ3UDJEUlZW?=
 =?utf-8?B?NTJmM2QyY2ltQzNCNUp5bDZudnJjQmhpN2cvdDhlNnZvQ2YyY2FrN094Mnlz?=
 =?utf-8?B?akt6UnY2UEh0aDZNc2tvQnlWbkJTTmxyM3JKLzYzWDlJZFh3OTQrcVRXYmVX?=
 =?utf-8?B?alh2eUpGdG5CZXFJb21WdC9Dbi8zQmJvVW1OMXZTUDZ4U2g1RDc5Znl1Y1lM?=
 =?utf-8?B?cTI3TWUzNG1hRmdUZitVemxKTUJWV3hkcVJkSUhaUytLbkloWVp6MytvOE96?=
 =?utf-8?B?Tmx0UTBuRVNENTNpeWRnaFZMWXZGRXZkVEU0TGl6YWZJd0lYOVBBU0lUMDJK?=
 =?utf-8?B?RDkrRTNHUEo1YnlCNHFUWDdTYlpDS0NLMjhVSVB1dU9QNzhWbS9xb2xKU0tw?=
 =?utf-8?B?UGRFck9kWExBWFZGRlp3WVBkSWtuYUozbm9QWUFFeklPR08vUXhPZFNwd1Ri?=
 =?utf-8?B?dm94RXlQS3BKVVJybjBqOFI2NGUxdU95WjZjUloxM28vK1g0dklPSEY4ZVBQ?=
 =?utf-8?B?U1pWTzVGRnlkeUIxeG85YlZ5c0NuSWFuMUg0cHc4Njljb1dwZ2RhODg3ZXdT?=
 =?utf-8?B?UHlkd3Z6RFpicFZWemJsT3JQVTZIc3Nsem5ScXorSk5HRlVZWFlOUGQrREhR?=
 =?utf-8?B?L3pGeEF2dDlicm1kZXhORXlFL3Q5cEpLMkt1eHc0RWMvNm1kb3hadXlwUlpo?=
 =?utf-8?B?ZitrQkVybUJrVnpGM01USFhSOSswWEo2NkYrSGxON29XR0J5eWxuZG9lWElW?=
 =?utf-8?B?Z0ZTbG5zWkcvVWR4MjM1K25XUjNteWpaNmJ6SmVkUlBsNzlySThpdVJKd2lF?=
 =?utf-8?B?c0ZwSE5zcmVSbk9xdmI2Q0V6M3VEYmxJN3JOSEtKSWd3bGY1Q2JQRUI0cjRR?=
 =?utf-8?B?MkVWT0tWeWY4SlIyODhSZ3ZudWxjUXZJanlUV1JzcUx5cVkrMjNMaHNBVVBS?=
 =?utf-8?B?aXYwM1FwajRnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE5KWHlHY1lHL3JMMHppQ0ZJcURnNDBNdmFjSVFDRjZzQlloQm1CNTFmY1hN?=
 =?utf-8?B?Z3J5OGFVaStRbW91a21BV2FNM0dUQ2lwalE1cUxyYkU4aU9YSGMycWNZc1l5?=
 =?utf-8?B?SC9GM1Y4YlFyaDJTbGxoRXVieWkwcTRwZUxHaGNtcSs0cXBoZm5hcjZLeGJD?=
 =?utf-8?B?TTRyNkpRelM5MUY5dEZCVFlqazFKUUVaNXNxMHNidThSeVQzaVdpUVdzSzFH?=
 =?utf-8?B?Nk1ESHc3TmZxSkJsb1NyOXpvUllkbFBGbGJOaDJ5U0xSajBIQWhDWnlYRXRU?=
 =?utf-8?B?WFh2RDNDVjVUQzR1V3BrcE0ydVc4eEhiYzcrRkNKa0Zsb0swZWhlcElIYVlH?=
 =?utf-8?B?ano3WGpwcDVsR1VJcEdTUW9raXBRVzZzYjhIdTA0MENvU1RSanl3bC94K0M3?=
 =?utf-8?B?YlR1ZWhEUmpLV3QrcWw5NEpVeGRCZWxuRFB1ZU5qMXJ2T2p5MENNTW9sKzFx?=
 =?utf-8?B?RWE1TDdMd3cvQ1Z4RGJKam50akdYakRYekNONzU3bXI4bUl6ZTdOREI2Rksv?=
 =?utf-8?B?NE81WUVhaDdIZERsejJtbm1YTDBEaXFpdGRac1NzWldqRVUvbUwvREdLNnpZ?=
 =?utf-8?B?WkRmUW9DK2ZsYW1tV3JlOWh4b21zNm1qYmovU2orRC91VGc2WEdKWUhOWVhz?=
 =?utf-8?B?SDBoSzhLdXladUVGRklLaGR4SmJhbW00cTBkWUR4c3dlVElnLzY0M1BKMGtu?=
 =?utf-8?B?SlR6YmhyVXFoRG9TNDJlbzc5UjROQzdDaVB3OVFIU1I2SkxaQzdLbWxrNVRP?=
 =?utf-8?B?R2l3TFJmM04zWi8vdmZDcUpwQUdrbk50OTZRUkdtZ3VkSzlueWQwVzN2TWZQ?=
 =?utf-8?B?TGVYd3p0QTM5UWptQWh6dkU3T3J2ZmxHejdHU2dHWUVIMU1rZVVwZ3ZQaXFn?=
 =?utf-8?B?SmErZVVTaXlWTUhmQlBOWGJVcHhTSGtOcXRQUVhrZVljc2ZWdTQ4eVVTTzZQ?=
 =?utf-8?B?YVkwMUhtQWZZOGh5QlU2cUdVNEw4b3paWnh0bU9sYUdVc0lGUEN4K0diU3dI?=
 =?utf-8?B?eloxRFcvMVBTTTlibFAxM3hZZXZOL2xxdDgxQnBwVjNvYy9Kd1VQNWcxMnUv?=
 =?utf-8?B?UTVodVA2SjF1VTh2bFpFRFRIYjRPVzBhZjJpcFhSRG9nTVpKbzZPYVlGTW8w?=
 =?utf-8?B?eFU0My9jQVhIalF5UHBSZzhKaEhmemZyeG5kVHVCdGZwODZzd25hZThYOWJa?=
 =?utf-8?B?ZWc1YWhLdUVIeFIrclRpUkZkMHhDNVlQNmpRMm9aaEIwOWpadmE1eUk5SUdt?=
 =?utf-8?B?VWUzRlJJVmh0YmhUQ0o3LzVkSU1LVXBJMnZNREZBK1RvM3pwdFFRL3ZJRFBw?=
 =?utf-8?B?MnJkanZvc293T2VwOGRSd25IYWlTODdwbysrNTBDS2xqemRIeU9mS21nbTgx?=
 =?utf-8?B?ZytrMGNseGVSQVplK2wwSUhXNE5DRVQ5ODV6Mmd4OW9ndExLZEZubWVJa1VP?=
 =?utf-8?B?R09HeUNkRDZzeGdzSGtFcytHN1gxRE1abEpWNnFrSG91VXBlU1NETGdJU2o0?=
 =?utf-8?B?b1prWkdJREZQaC9nMm03MzJlOENObVJ1b21tZmMxZUJOdzJsQXFKNDZMYjFH?=
 =?utf-8?B?VHh1WEFBK2NkeWkwQ0RlMjlNdktqU0NGeHZiYk1kMFJzMkd3NGxtWlg4UHRt?=
 =?utf-8?B?Y2VZUHR2LzlndllicFFxRHVjazNkZWF1OXpZNHczL3c1bjU1NUJvZndvZzZG?=
 =?utf-8?B?aS9QZVMyd25qNy9Pb0xKTTJQajFnK2kvWWU2YmxhNHB5dCt6SHNzWFZRNmdV?=
 =?utf-8?B?YXJEaEkwdEJkMFd2THZBcVNCVVNnYVMvZlZYWlJJd0JQdVlGOFdkRXZIOGNC?=
 =?utf-8?B?QmVGYlpwV21nSkcyM0N6TDlpNEk1Wmd5WTNSVEZNSjNrSjlieWwvZ29uMTdw?=
 =?utf-8?B?Z2VZNUMyNDZKMEkxdzdjVWpqdDNTUU5vNmZyRHVpUjJsaEtESDQ5alg1aDhi?=
 =?utf-8?B?Tm55cXNicXltZGFlemhHMUZQaDJMV1RSay9LWUpxWTZDQzJGYmpxSlVjS3dT?=
 =?utf-8?B?L0ZXVk5kZ3plQTkzODhlN1g1S3pyMjNiZkRhaEovb245VXo4ZEdVbEN6Ylg0?=
 =?utf-8?B?eWkvTGRMQWt4d2ljK2ttOVJBbjVncFBxUlZ4S3lLMy9VR3duZFFsOGhIZ1BU?=
 =?utf-8?B?RzBwaDZGQzg2dmJ4cG1YMWxOa2VSTllFM0ZpZm9XTHduaXRxa2Z5UW9iaU42?=
 =?utf-8?Q?+ETKjegK3FeKGeKQdDI16u7GbS2QwDmSDH+QsUh2jutM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279ee3dd-0b1d-4a79-5a4c-08ddefaa3070
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:07:19.4267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zng5sQyFEMyvTG9k56wKa7yaBq9iMhoe0AxdoLZRnE0bk2iPr+9DkNhswn3QMtO5SPVcAGRyh0JPmRolmfaWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8653
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

570.144 is the latest available into linux-firmware as of this commit,
and the one we will use to start development of nova-core. It should
eventually be dropped for a newer version before the driver becomes able
to do anything useful. The newer firmware is expected to iron out some
of the inelegances of 570.144, notably related to packaging.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index af7356a14def2ee92c3285878ea4de64eb48d344..9a97e97a3c7b4ac65b66e4e5f092839720ded82d 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -21,7 +21,7 @@
 pub(crate) mod gsp;
 pub(crate) mod riscv;
 
-pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
+pub(crate) const FIRMWARE_VERSION: &str = "570.144";
 
 /// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
 fn request_nv_firmware(

-- 
2.51.0

