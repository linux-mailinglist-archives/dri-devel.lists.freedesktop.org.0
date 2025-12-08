Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDE1CACA78
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC4C10E3DC;
	Mon,  8 Dec 2025 09:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EA3bcYlE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E792F10E3E4;
 Mon,  8 Dec 2025 09:27:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDHJR26GVmbWIuRULGShhTsX6wVC8tNfmEvrk9PjeT0GT1yPx3MAxcte1Ou4DeikN593XYpWabg1aoJVkS/8jRVoZSI2uTKCC8velnOiM03/mF0BKcNe2vo7qnLNt9PHcuLr3S5CL/4EVyHuVE1fKvymrclbzhhKg5840VQdXn8ZYeh0SU9eXh+HWFjGvasrl19OthnG90neO47FDgeDH91EnJoZWRvPXUOlmyVv3sK04av/z2DXstVDY0s+tFk+eCg8rSAZwLkT15TcqdQaHV8peVLR+CpcbaLFVG+cOBXeFo0B3YsUlGKjXuO/fFGZsLHkj22fr1pj6WMTdwmKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBbTzqYrd2ma1N7g9SDM+9tCQAITe5Uo9eZmsVW0o08=;
 b=N3wlXrleFQP3rqQj3PtwLJEQNkGNLnPmn/aDgvn08CiovB5elzAimyJo3WoMfqTCRDuypm/R06mFdbCl0QciH+Ngv1DEWGS8+FSpETzXJV9sqkczRjfw2RMEIv71It0KW9yxm/1u6jZokiyUkCdjK4onVeqcSqjgnoYrpP2srYCXJOq/UI4foWkFbABvfQePC5QslehVrwqhF5Z5gKbQreaqPqVd/c2qIi9n+qK4QXSn2/nxFNuIw7nzyz7J0DBbdoRzCVtHf1cVfJCYQoh9exfIntlXCt4s5kL99jpIrhPH4pC5WiSxKD4dZIw/YDWV/fz1OFWIOnPuD40jgWkSfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBbTzqYrd2ma1N7g9SDM+9tCQAITe5Uo9eZmsVW0o08=;
 b=EA3bcYlEZHaBZwyXaWGUvZNJ5vye43Qs6ZnqQ2l0nlkph88m5O4Sod5k6Sn1CqLF2wSpoNkDAUosn9+Ni2S2U+VdQm8bvhSmMl0tlHwD2pIoJXePU3r1CA+EclhTbSALlQcYOL2fZTD4m9ZdNkBEhKTR5HUsHcfoUSb73R11Eh5ew91dZDVNSB0bv68CHbz4A11e1UCX6L6vwy6wpsDTgUCDtZDTUv9nNWjwNjBQxb6IM7TIdVhh6SsJluPZT0auAYqO4p/b0X+CW4n+yPuzDtq4nu6mvDxAIjScVhe02RpGvzj/Q81iUJMO+7wLmWIjWwDT13BQPWX5reNHubPneQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:27:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:27:10 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Dec 2025 18:26:53 +0900
Subject: [PATCH 1/9] gpu: nova-core: gsp: warn if data remains after
 processing a message
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-nova-misc-v1-1-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
In-Reply-To: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS7PR01CA0208.jpnprd01.prod.outlook.com
 (2603:1096:604:24a::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8672b0-757b-4ea2-6045-08de363bf60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmVUNWtRR2pndnh6dm04R0l2VFdhMkdFbElud1Q4VkI0QlNlMVltY1U4NVVL?=
 =?utf-8?B?TlBkdGlOTkI5L05yNktsOXE1NldpUHl2bXhTNjU2dHltVVR0dWQwQ290QzJh?=
 =?utf-8?B?OW1PMTVRenp5Zmh4dCt1NENHaVZSL0t2ZGdaQ0VEOHA1SHYyMlhDZU1IeGds?=
 =?utf-8?B?b1NQbks4SFcrQzI2K1RUcjV5TG5xVnBNNnhLbGdGb2F2dVBwejdtRTBMWFVT?=
 =?utf-8?B?blJ4VVVZRTZIVnJsdTBkeC9Fdy9wTVlkQnh6OGlKRjQ4elBXMU93NEliT2ZX?=
 =?utf-8?B?NmtNbWNoR256cUpNQWVBOVd0NEFIU0ZPaXZHS2pLY2FtcVdQRUNiZ1oyK2tY?=
 =?utf-8?B?UDBEbllLeDh5dlpoM1MrMEQ5NHFmTGV1Y2s2em94bTN3Sk9iQ09TMWp2TFJ3?=
 =?utf-8?B?TExFSmUrZUdRZVZ1QkpndUNpYXpGRE9ZNk1yNk53YVIvVTRDRUh2MzBlTTNI?=
 =?utf-8?B?eDVwY2FHNFUwM1ZFWWQzMGdTQUdLRVY2QzVGeGZTUWdtVlQ2czhiVlU2Y04x?=
 =?utf-8?B?S1A4ZzVhT3h1SXhlUlF4WDZ1NXlqU0hHcnRQMWFKUEo1WEEwbWsxemszMnAv?=
 =?utf-8?B?VTh6WHhaMmVpWVpQVFFLeVFsdTA2NHpyWGYzRm1PR0VTZFN6Wk9IMS9mYXk1?=
 =?utf-8?B?MFQzejBGZm55eUJZaXBibVA5MTN6RnY3RHg5VXRxWjNyQXVFQ3ZueGV2UTdW?=
 =?utf-8?B?S1ZEbXdSNDFoVFEwRVVNSWR2L1hwVk1jTjFSRmgxVmZ0VEdvQkEwVzVEd0RR?=
 =?utf-8?B?UytSM0ZwcGJwYTE2OE9qMlAzWUF3L3hRZTgvVDdOZGVhNnIwcVBXL2xDU21E?=
 =?utf-8?B?bklZeE50eEppNU9pYXluS0RnRHZmRklrME9iUkFBUFc1YTFTZWJ4U1B0d1R4?=
 =?utf-8?B?NnRtTkNodHpQdm5MeU9MQ1ZpZFZia0VJVy9vWldCcW1iYVFERmRGaDRQZ1Jq?=
 =?utf-8?B?M1kxemg5MGF4WnFuUUw2dWpOMFVLL0o5cnc4eG0rMEQyU1pKOWQxQU5YdXFo?=
 =?utf-8?B?YVVSTEI4cU5rd3pjUnVHVCtMQ04zT3R4RmdTNGQwYWZDOU5mSnVWcnhxb3Ni?=
 =?utf-8?B?Q3pNemt6MVprVXB1Y3NobkRteDFIUitWZTdjWGQ2OSs1c0RWVDVVUEc0L2Nz?=
 =?utf-8?B?bW5NOTA2VGdDRWdKVkQxU1c0V201eFNFYm5vVUFlb2NvK25TSjUzak9JZ2Vt?=
 =?utf-8?B?UldiSG02L0JRbEd5UFNOLyt1ejQrTElBYjVtcUk5aWVUREFYRUt3WDVxekxq?=
 =?utf-8?B?UTVpZ2x4UWVmZmozSGVOai8vOWdLMUptMXczSWFqYWFCa3RVS0ZtdExKNjcr?=
 =?utf-8?B?ZzZleGltNzN6SGwxMy9SYjlJYVB5RmVXY1h6THBsWjJ1QnZYbHYxblBMbnZT?=
 =?utf-8?B?NCtjSzd4R24yYy8rTzBYUEhKby9DYjFvd0hJcmthZWEwOXhHR1dYMUhiMVJE?=
 =?utf-8?B?NUtmWE9zRmp3ZWhYd1JVdU5yUWx4TkpIdGtvMHVESkJ4ZTBtelFxS0pZeXlp?=
 =?utf-8?B?N2E5R0JKQjhoSUcvMDdrSzJ6cUNHeko0WkUvSDNnckVxeWpnWFJmTnE3UTlm?=
 =?utf-8?B?WWNyMGpuWHcwOXFUMXJNekpmUDZPb1JmSUYyS2hLckd1cnVPVEZuNEtHSVJj?=
 =?utf-8?B?VzAzNEtNU0taeW1mSzFSZ0RPWmNOc0wxUjhzMTA3VXh4bDNvTEtNK3pVU1JN?=
 =?utf-8?B?UzIrNnU2Y0MxNTdpaGdGbUJaRnpQSTVCd1NTRFo4UUtaOE1ja3BYSS9Hckx3?=
 =?utf-8?B?akJBazJSUnBWVk5ESExGK1pHSWNQV3hZT0p5cEc1NG56b05GaklHeHY5b09t?=
 =?utf-8?B?T1ZpU09VSC9tK0J5RlB4OWtON3FDYzdEN0JXa1lEVE1IaWdiNWMzUDBxTkhS?=
 =?utf-8?B?RGMxcDlHMzZGNk5uZHJVVTFpNitITFRHYTdGUGV1ODh5YWlac2dwelpqaEU0?=
 =?utf-8?Q?tFo43QTSN3eqBfQfsnDf3sNlcC8I4c1f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3FHUFBVcDlQRitSVzVFcndsc0xHUWdzeE5rQzVDMlBxQ0o0N2tDS1hwZTdK?=
 =?utf-8?B?OVBLSUpHbVB0d3ptb1ZBL0dVbEdIYU1md01PSjZmWFkzVnBZbG4wclpuV05Q?=
 =?utf-8?B?eWpLd2hNeEFuYUhkcEJKdW1kNWdLZW8vUEJWMkxpN2NtK3ZiVEZoclVtWjlD?=
 =?utf-8?B?QnBxeUtTN3RYK1I2aVBVdk9uSWNJSlRBSmxTaEJuYWpxTFJuN21nSEFTaDZj?=
 =?utf-8?B?MHp6cHRQSG9qVUJ1aFl1b01oOVBqVXoxaEVzUTBIeGFWalF0UGlJY1RCeFJP?=
 =?utf-8?B?bkVrSWFGam5pSHE0WHpoRzF5N2xFN0RHMkp2em1VZzRZeXBYamJlOWl2VVg0?=
 =?utf-8?B?NzFQbjFqVGp5U1RSZU16OVQzcDBGMGdVTFJHczFSeE0rWHpDdUJqNGdUQWZq?=
 =?utf-8?B?OVNYTmllbjNMOHovSTluaS9oMEs0Nkw5VVo2Q0lTY2hxZkFwOWZDQ3JSdGk1?=
 =?utf-8?B?cXNYWTQ4YzE4Z2FlMzZYTEc2Q0QzaVErd0VFcE15RXVvTC9IV2NvT2JnUHRO?=
 =?utf-8?B?T0dzUy9CQndJcjJDNE9ZNjY0RlNxYytuekhsOGtHWDhxSENSQkwrakUvaXNk?=
 =?utf-8?B?OEZsWDBvaXh5L3JycTdOaVhDU05XcStpcGpDcnh5R1FaUGtRVlJTRVpSRS81?=
 =?utf-8?B?eFIrZkg0UlhLcW80Y3lCWk0yN2JpQXU1eURwZTlzSjViVk1WQjc3cm5jNC9p?=
 =?utf-8?B?andNcFFCTjRuWkFvcnUrVVVhZWtXYjhZZmVrSnAzZmVObml3NzIyL1N5Vll3?=
 =?utf-8?B?cmVZcDJPQ1JPNWFWUG8yWlcrZUwvTXBGRnV2eUl4NTlJQUR1b1hFbzIzbDFa?=
 =?utf-8?B?U2h3RnFLd05sWElOWEVIMXU3WjJOMUJIaEpIaXRiNC9FaC82QzFZSldXNk5y?=
 =?utf-8?B?TTd0TjJSRFA0ZkdGYk1IV3J1VkRNZVJnc2FrejMybTh3Ni8zYmhLZ3NNS2Nz?=
 =?utf-8?B?alBsOTl3RkVDS3l6LzNHSGhSMGZ4azJrK1NINWRocTJ0M004SDJrNW82WEor?=
 =?utf-8?B?a2JBcTZ6SmUxTWpFNS8xWTlBUXhpcjdBeWhqT1Q0dFJpOG5aK01ZeldjMGtB?=
 =?utf-8?B?SjlEeDMyNTI5UUtyekpVbjE4cERZRWxvT2hIZXAzQ2xUczhYR0l1R0hKYmFP?=
 =?utf-8?B?TUFsWTkxWWNueXJSMjgyTEEyR3R3V3NBdXArUFVpT1VyWVBBK3U0eUtxeEkz?=
 =?utf-8?B?S2VqelRLU2lLZzBzdi9JTFVVamdkWVZzSTU1MEl5bmQzeXNLbktLQUVyYnl1?=
 =?utf-8?B?Z2tTRzEyTVVjK3lJSXJWazBZMGVRaDdGQXBDZS9MSHF3Z0ZYWHYvTUZTaVdC?=
 =?utf-8?B?RzE3OUtNMHYrK3lMOHdxQzNjVzRadGZmTWUwRTFFQ3NKL3Bybm5EcXlrQWgz?=
 =?utf-8?B?MmpGeDYzZGdvZmpZa0dNZFpobGlROWRoM3FwQTI5SzA4SlVWVU5OcjM2T1No?=
 =?utf-8?B?TGsvQTdhVnRhTlhwU0s0QUcyMjl1U2NWRFFqNjF2aUtwRkMxbzhnRkh2V0R0?=
 =?utf-8?B?L2U2VTUwNEx6WEpJVWlSQ1FzVXlBQ2hQVWVaOS93N3BLRWtpcmFhZHo0WW9w?=
 =?utf-8?B?aUdSQnM5V3ZRNEtKTkJJdnEwdlZHYU83K1g5Sll5TDhXVlNpbVRZWGJBRjc5?=
 =?utf-8?B?TDJ1d3lLcjV3OE9ZbFU1WlBvL09aZDNNdjZhRGJBR25wQmovbUpwdjBORmRG?=
 =?utf-8?B?NVpjSVBzQ0s3NFNyQm5YOFlRZXBVTC9wN2ozVUpMQlBWdEZJV0xvbmtkc0lp?=
 =?utf-8?B?UjloRjFDVnVsWFloRWwvVFFtMEx2ZU5VVGJsS1hGOXIwOVU4L0NTbWJPTVR3?=
 =?utf-8?B?dHc0OGxmdnhEb3hRQXpSZ3VQUWUwWWhoNFIycWk0eU4vNEp3U0VhOWtRM0di?=
 =?utf-8?B?SnJzV21PWVA2VzhneEp6eUNTam51N0NaMXVqb1dVb0gxU0hBajJhTitCSFhW?=
 =?utf-8?B?a2UxeVJINnQvK3BsMWhHZU1JaWxGQmdhRml0ZUU1TEZEUkQ5V1pLTzdaUyts?=
 =?utf-8?B?MHNWOEU5NEFTeU5IVE5hYjNFYVkvTTlFcTF1S3FpY2pZRFpzYjhEdW5LZ2Fl?=
 =?utf-8?B?QTlCU2V2cXB4eklPU0NreEdrZWRlRm9Iazc4dGIxMmdtS1RWdUx2NGlJQzlt?=
 =?utf-8?B?YW9KU2tpVTNvazhBS01jdjdDUHNFOUlKa2Y1Sml1YTZ3NnFtazJYNnp5Y0hF?=
 =?utf-8?Q?mv+U0XXqbNsceIyC2OD7guyTE4bAPIE6FMTJP6yCyCzW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8672b0-757b-4ea2-6045-08de363bf60b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:27:10.0978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYbrQDaD5lWO9uUmaJ97/+HSOtoZ3lpL3u9EW4eZQ1LYyfyN3ArhPS+57hmR5zGqZCjQdv2fvSgCeed/ZNKd+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
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

Not processing the whole data from a received message is a strong
indicator of a bug - emit a warning when such cases are detected.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index dab73377c526..5ce85ee1ffce 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -662,7 +662,17 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resul
             let (cmd, contents_1) = M::Message::from_bytes_prefix(message.contents.0).ok_or(EIO)?;
             let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
 
-            M::read(cmd, &mut sbuffer).map_err(|e| e.into())
+            let res = M::read(cmd, &mut sbuffer).map_err(|e| e.into());
+
+            if res.is_ok() && !sbuffer.is_empty() {
+                dev_warn!(
+                    &self.dev,
+                    "GSP message {:?} has unprocessed data\n",
+                    function
+                );
+            }
+
+            res
         } else {
             Err(ERANGE)
         };

-- 
2.52.0

