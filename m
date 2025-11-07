Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57452C4201F
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF0F10EB93;
	Fri,  7 Nov 2025 23:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gV8KaNls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013060.outbound.protection.outlook.com
 [40.93.201.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5EAA10EB93;
 Fri,  7 Nov 2025 23:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBOdmZtX9utEW+qCGV+kV52gLdj1YtC1rKJE4grq8wm3nG9jcLmJKi2HxJ/NzDxEfv3o7GxhWdtaau+MyE3/DoqmpP8DxE2u7p8z/wDc/tlZ04ggKs7MWYc79uYf4Pbe0I2yjedvwLrS0hJzPvCWpHtwu8GHWo0ajPZsavb9xG/lpDq0CsDeHHiWYNVg/yU8fNhvdQmFTqlgOoxDS696tuEooD/fWnYnAtWNzhLFujmHVTQ93fz456onjVWMi+7C1N0Rxqa3fwRR42XKxzHWEm06L2bIH+frhtPbDM9eGWC1IiRgqucKhu8jn0qC7VoBTnCrcP9oVkdiLtVipvbsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hve+JVyRU2dBgjaexQyhRVxwp9XC3ir7ElAItjNKL8I=;
 b=PXE8E2r0+ymnGmSzgifeB5p6JUWGllkWXICOJb076SAjy0qeN7xnwF8F9kA4nXFesfOTz8+nKrqeIAbYEwxp/aD4sjOyMW/pv8qpMeQ26+8h+Wef3c513LgvNi4ELWvV0H180LW300LjXLhZ0uyawqKP/eoM+KQGn5xx3AWZYDup7ziHrdi0t1IFs8OzBLnRVT/SACPuffN6Vmh059qJFqiWvQ2i1a6fDdrAF1mmv2RKqyy8A2mqNPuVAU2Aq2yGEmRgHz6864MuZcgeB4UrYNny7Jdt5gJsMFsR523mlqKRMVpXRxYzgd+3jl7iZqnxHOM4foLuMa+vMuW4ltMBqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hve+JVyRU2dBgjaexQyhRVxwp9XC3ir7ElAItjNKL8I=;
 b=gV8KaNls12J2zAkmU0iBILbnfq3ORm9H2nCstsI3iB4wVDh7c00qr6yL3cN53VRK0rPdvALn+zvrxccZvrev8/+7tmZjEGmIsHY50xRI9Jg9g+UOpY8nBeHL6izwwHVV1Ky/g1v65J9LE+diNynihBsd0EO1qLaDIy+PYaa2OBGSCV2wgcXWbNgxJf2n0uIZJVRAdQOf0eKSujKn/WT8mgq0Gm5vHq833OH4XzBr7b75nii0DVbbaNebmWzqNxRn89lk/e7ZwSIyL19B4O7l001GiQk46mhRXhuLnTBLVbp/cs284uDrZe2Yb3nETZiwRI16k/MECHH94oTYTw7v3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:43:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:43:53 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:11 +0900
Subject: [PATCH v8 10/16] gpu: nova-core: gsp: Create rmargs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-10-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0147.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a20b51-747f-4681-bf82-08de1e57828c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEJ5Wkp4Wnp5NkpFWFZVRlFjMHJ4RnpMRjkxaW9FbWZkaEZvMzFnQWltalV3?=
 =?utf-8?B?eVo1b05yeGVld09uRWlITTNOa2RYYXdQTXNVYjdJSVZERGpGaWx5NkhwY3BI?=
 =?utf-8?B?N0VOMWVPTHE1TCtBK3JCVXYzK3JmMUdmVmk3WHZ2djUyeWZYL2JMOTBtbnFx?=
 =?utf-8?B?RWVxZUswZUJobHh2WEhYVlV2b3JnZExXSS93U0lHaTJxVFczU20zMjNyQitG?=
 =?utf-8?B?OHg2c2xQS0g4K1NHRXQ1RUNRekVSZFE2MlpCa210ZGJ0ZkVLZzRyajVJOHBP?=
 =?utf-8?B?c29ad1lhT3MraFJPY0JLUTIrRnY5SzFWUTVzeFh1RzFvQ1k3R0p0d0lhR2Y3?=
 =?utf-8?B?cUNXL2d0dkdXd1FFNy9JQWkyYTJsOTRYQTJzZi9hRS9ZV1FHb1IyeC9yWWtw?=
 =?utf-8?B?QkpHYjdCZFV3dFlaOG5kTUJOZmNlSnJOblZ6RTQxblAyTzVCUnEvTmd2eW94?=
 =?utf-8?B?SFJUbFBpZjl3YXRQUG0xdzlIT1JWa0lUTTVtU21nNks0QkMxK2p5YXpRaEZx?=
 =?utf-8?B?VE1kSzVyN1VpbmR6Rk1PTHUrd1MyUHU5YnB2c28wSUVBK1NEVHFlOWVRZzBB?=
 =?utf-8?B?WXRGUGxJQjlQWE1JdWo4WkNPWEVDTWxDWFlMRXhkb0N4cjhrSXU2d3E5eXFw?=
 =?utf-8?B?UmZKQmI0SFRWU0syN2dXdWt5NnYySE9nZURrQmhEcmlWZFNkOXlyVTNGUkNl?=
 =?utf-8?B?bm10d3Y3bjR0eG5qWWcxaDBrU256VXJtanNJamRYN2xVb3gydGgzR3Bpbncz?=
 =?utf-8?B?UEhaeEFNbWxScjhGc0R2S0krVFRYQ2pqTWFOSm5zb1BnSkVmaExkSk5JVHVL?=
 =?utf-8?B?NU5mNFNTWnIyT1RIMzNYeWllaVJYczE3Y1JBeG5QQS9xNTFvYjRRN21NT1Mr?=
 =?utf-8?B?OXdsUE41VTRUdVl6SExySE1UT1ZxSTZWK1hsWXNpSWpmTnZSaTByNVdLZ1d1?=
 =?utf-8?B?RTRjL0thSytHdi9jcHBlakFUSldGZ1h2MnNCVmlrZTJnWHNvR3RGWWU2K0hZ?=
 =?utf-8?B?WStpY1B2aWhoelp3ekxaVW5DNVQ3WkJQZzExZ3hPMHZ6RlpPR1p0K2xDbmwx?=
 =?utf-8?B?c1FFMlllTnIrSnZlVXZpa0I1WVJsblJ6b1cvQnlGZ3RKN2c2QzlCekRaWnBS?=
 =?utf-8?B?eVNxd1ZoL1dpUTFTVFdxM1VQbndBVi9EbHowT0tmMjk2SVlzL29wMXEyV2Y4?=
 =?utf-8?B?dDNRZzVEejJtTzA1amViMXhqYXlDdWJWc1JMREE5djdHL3BxUVhkeWpKZ05a?=
 =?utf-8?B?SmVNbUk3QWp1TldrMUprZFAzdkRZVnFNelhGcFJ6eTVFYzRoOU03Vkgxbkdz?=
 =?utf-8?B?Zkt0VkpENFRsY3ZMTVF1NUxjeTR3dXlvM0o1VStFamJYZWVBNnVWaDczdmpR?=
 =?utf-8?B?bzNFVzdUS0xLZWJHMWk1Z3RtL0pvZEdOTUFiK2Z3Y1FpWXptaWgxVmZ2Um1s?=
 =?utf-8?B?UzBBMEtyMWIyL05wZjdXTzFUVjFtSDFBQ2JnY0xBT2RrOFQ0QVRYOTQwc0d2?=
 =?utf-8?B?clg3ZlZ5dEpieHk0MHR5bEZEYVRpSmJ6M2VUdDlrYURJcWVrUHJpYzZ2bEdH?=
 =?utf-8?B?RTlxOUdVcDd6UUlMM2Zwd3k3aG1yQy83d0FWRkNkWWtVcUtFbDRiVnlyRk9K?=
 =?utf-8?B?dmdTWnlYMnc1NkZEbVBvT3F3RmlwMjRocmtuaUxLNlZhTTNobnhqWTFaa2Zj?=
 =?utf-8?B?eGErSDZuNmJPWUsyUUtxbVNaTzRoN3dnNERpREJFTkdqeDZ0TmViVXlDOUln?=
 =?utf-8?B?bVo0cGl3SEcya0xVeXVUZzhoUjZqeGtMRVFSOUlqbFVIeWdHNDAzeFlTc3JL?=
 =?utf-8?B?SWRRWCtXYjQ4ejdQd0w0YjRTRkxjWlQvQmJqc2tkR0NSY1MySXozSmw1SGpj?=
 =?utf-8?B?R284UzM3WUJxZHlmVVhHN3NQT1Yxd2NnMDBHQVVCYlVUM2pnYjl3MGxRNjVS?=
 =?utf-8?B?QTRTblJYZy9EMmlETGZuSHRSMTQ1SHBvd2tiUUNNd1RzUm9mSG5WUjhWNVUz?=
 =?utf-8?Q?C3CtboOSli6SAW0m9s4A3GnmiYK/qE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2ZoaXUzSXlVWmNyZmVuWENHYkFYZUhMTTdmQnNiMnV1bitsTm5GNlMxK09Z?=
 =?utf-8?B?eWdxOHlabUlndW5LS1ppQlBtTHJHazJVM01ESzhHLzZIcWVCUVoveUxHc3M3?=
 =?utf-8?B?d2JXNnRqVVIrUmZJbHRUdlg1TEdKdTdMWXYreE1paUVlNUZHVU5HTjM5bDhV?=
 =?utf-8?B?ck5uME1EdndzQVlQdVl0UFhvSVBEdW1hRzF1VU1hanNueTRBN0cxTExOck5V?=
 =?utf-8?B?RWdrNEI0dWN4eDJYVlJSOWorbDdvZFhRZUgxdVRrUWpYeG5XRkFGU3VtcUNi?=
 =?utf-8?B?cnpSOGhkbkVsVDR1OXp2K2R2K3F0SnNOdFc0dnphTmFSMVhTMUZJazgrSHBB?=
 =?utf-8?B?M1MxSkphZHd3c3pMNGtLd0dQWUg2WVJtZDJYR0Z2UzQ5RE9ud2dqeTJZeTNT?=
 =?utf-8?B?VVR0RzJHL3RIV1FEVWUwSENyOU1kSGEwazZtMkp0d3MzQzd5NXhtUnBiUWhG?=
 =?utf-8?B?ZGpPbjJNVHVUUlBmYzFFQjVWNmVKekFhZHo5RzFxSVlnUU1lZjAwWVdFSkNj?=
 =?utf-8?B?a3dPdnp6M2R2YTFDdUE0MERmS2ovT1JmYkd2dk9waTVWdERHcU1VRm56ZlJN?=
 =?utf-8?B?QzBML05BTGpEL1V0OHJuRWtvL1FEbGFsYlMvOEJzVjNlYThHb0xFS3h1d01a?=
 =?utf-8?B?QWNYNnFmT0ovM21aZmF5VG41MGhMYjRyTC90R2p6dnU2RXkwenZOUDhwd21N?=
 =?utf-8?B?SW5ZYjZqcVNXOUZqb2RqUGtaRDgxYVp4MXhkRnh6RzAySlFJdEo0dExsVlQ1?=
 =?utf-8?B?S0hRTU5vdG9PaXUxQXVhOExnZE1tYThIcU1wTWcrWlVmZjFZOWovd1BHUnV5?=
 =?utf-8?B?TjgrZFBUVnBtRmdLV3dVcmRtTTYvNjR2cnpKRG1qWEsxa0xHYWVrbk0xaTlU?=
 =?utf-8?B?L01CSnpxaVdLTDJYUzV2WkllZU1UL3kvQm9nQXZkSytqdHNOZmNjcXJOakxl?=
 =?utf-8?B?TFNYTTJTeGJqd0VIUTM2a1dxNjVzRFV5RktVb0NRcVdEYTVQeUdPL25hYWtr?=
 =?utf-8?B?WlpTTi9pMVh0eHV0WEdqU0tVTUVmMXR4YXRiUHZJV2FKeWtSZzRiUGNsN1d1?=
 =?utf-8?B?bUN5Y01FZlpoK2xtUnpnVEtsR1lzalBUVnBnVUJhTFBZMHpseU1aRGFiWnZx?=
 =?utf-8?B?dzJiUGswQVZFSlJUMDlMUVpXRkt1ZFlBT1I1MWdKaExvOCt3R0ozeFJqbVAr?=
 =?utf-8?B?WEI3cEZ3akRpdHBodGRoVEtoYU5GM1ovdkxzcUxYYTZjWFByWTJxY3dON1pq?=
 =?utf-8?B?cXRDdER2WUllSnd1STB1YVQzRkFZT1hMTzRXT0JLUExYTnJYRWdLbUk0eVB2?=
 =?utf-8?B?YzVIdWdiQzlyOSttT0tMRkhXRFpoenpvSFVYcjlWUjFXbmYyY0JaNjhzUitJ?=
 =?utf-8?B?VFl2TWpxRGs2dUlTOWRtVUd1R0ZpcW5RRUxld3dwU1NDbDVidjNWWUg4RWU3?=
 =?utf-8?B?dm1WQ1hxbDJnTUlRcjJOL0VSeHozYUtlNGQ0bVRSVGZjNUdiYnZTNlBzajdm?=
 =?utf-8?B?YnQrQm5rdU9jNlVSeE0zMVByYyt3cHZoYVhSTTFsRlVoaC9sMWtqNDBsSGJU?=
 =?utf-8?B?V2RtSWJvVW11dERrczZwd1JPUGxUMlFLNVpxdnNadVljaUNjV2wvNEV0UjFa?=
 =?utf-8?B?L1JSOGRNeW52UVArS1dSQjRaa3NWcGxCb096dHBDVE1XbmJDTkova3hTZFJ1?=
 =?utf-8?B?cVlabzBKMnhPbE9GWWJYdk8wS2M1aEJYanhyMXNGdTA4dFpsN0ZFcklwL0tz?=
 =?utf-8?B?MG9obkFtajZGdjFEb291N1BwMGRzRE5ucWdpTzZEb3d6VUhOdlQwa2JlZmJW?=
 =?utf-8?B?OFZ4VWI5TWJiRHVuWFBITTFiUkNtQmJKaityZlFDRzVRSU9ZcDlhdkZhemdT?=
 =?utf-8?B?NG43a1hTaWdwQ2tPVzBSZFNQWGsrZ21lL3VIcFM5eldqVnBjaHNFb3BrUGZv?=
 =?utf-8?B?NnFjaDN6L0M3ekZwZ1Z3MldZeXV5UE5oTzhmQXJJSkh2cVdzOFhYY2d2S0hD?=
 =?utf-8?B?RHdiUTBmM0F0b3krT2VBeWJhUS9zYkNnalpwS29GTHAyMXQ1VS9PRWJManhI?=
 =?utf-8?B?TFRKakxRVVVYL1pxV2lqM0tKMzVqc2tZUHVFYzVPNDBIRE93aGtWeGVZTnhY?=
 =?utf-8?B?WnFlMGlFM3VERTFHck5ySno2OWRrVVVWek9kZ0U0NCt5TGJzWkhTR096Ny82?=
 =?utf-8?Q?+M08v9zhEH8ldmeQ/mvoisul5W6mKNknFLuxaGpqXScm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a20b51-747f-4681-bf82-08de1e57828c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:43:53.5592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEIeSSphJOYF/s5L0hTmhJNq+E+RMV7xV3uLlbEEwgArMkJuJQ+QskkJ6eImhrYPDsK+pFaGAGwo8oV/iJQDSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

From: Alistair Popple <apopple@nvidia.com>

Initialise the GSP resource manager arguments (rmargs) which provides
initialisation parameters to the GSP firmware during boot. The rmargs
structure contains arguments to configure the GSP message/command queue
location.

These are mapped for coherent DMA and added to the libos data structure
for access when booting GSP.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs      | 12 +++++++++++
 drivers/gpu/nova-core/gsp/cmdq.rs | 26 ++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs   | 44 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 46b3e4819473..bc897e57f396 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -15,6 +15,7 @@
 pub(crate) mod cmdq;
 mod fw;
 
+use fw::GspArgumentsCached;
 use fw::LibosMemoryRegionInitArgument;
 
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
@@ -101,6 +102,8 @@ pub(crate) struct Gsp {
     logrm: LogBuffer,
     /// Command queue.
     pub(crate) cmdq: Cmdq,
+    /// RM arguments.
+    rmargs: CoherentAllocation<GspArgumentsCached>,
 }
 
 impl Gsp {
@@ -127,11 +130,20 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
 
         let cmdq = Cmdq::new(dev)?;
 
+        let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+        dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
+        dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
+
         Ok(try_pin_init!(Self {
             libos,
             loginit,
             logintr,
             logrm,
+            rmargs,
             cmdq,
         }))
     }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 8461738b1110..4a6c0e14ed53 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -11,7 +11,10 @@
 
 use kernel::{
     device,
-    dma::CoherentAllocation,
+    dma::{
+        CoherentAllocation,
+        DmaAddress, //
+    },
     dma_write,
     io::poll::read_poll_timeout,
     prelude::*,
@@ -33,6 +36,7 @@
             MsgqTxHeader, //
         },
         PteArray,
+        GSP_PAGE_SHIFT,
         GSP_PAGE_SIZE, //
     },
     num,
@@ -378,6 +382,22 @@ pub(crate) struct Cmdq {
 }
 
 impl Cmdq {
+    /// Offset of the data after the PTEs.
+    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
+
+    /// Offset of command queue ring buffer.
+    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Offset of message queue ring buffer.
+    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Number of page table entries for the GSP shared region.
+    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+
     /// Creates a new command queue for `dev`.
     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
         let gsp_mem = DmaGspMem::new(dev)?;
@@ -581,4 +601,8 @@ pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
 
         result
     }
+
+    pub(crate) fn dma_handle(&self) -> DmaAddress {
+        self.gsp_mem.0.dma_handle()
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index ceda61c99b92..b083a6a5754c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -31,7 +31,10 @@
     fb::FbLayout,
     firmware::gsp::GspFirmware,
     gpu::Chipset,
-    gsp::GSP_PAGE_SIZE,
+    gsp::{
+        cmdq::Cmdq, //
+        GSP_PAGE_SIZE,
+    },
     num::{
         self,
         FromSafeCast, //
@@ -568,3 +571,42 @@ unsafe impl AsBytes for GspMsgElement {}
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
 unsafe impl FromBytes for GspMsgElement {}
+
+/// Arguments for GSP startup.
+#[repr(transparent)]
+pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
+
+impl GspArgumentsCached {
+    /// Creates the arguments for starting the GSP up using `cmdq` as its command queue.
+    pub(crate) fn new(cmdq: &Cmdq) -> Self {
+        Self(bindings::GSP_ARGUMENTS_CACHED {
+            messageQueueInitArguments: MessageQueueInitArguments::new(cmdq).0,
+            bDmemStack: 1,
+            ..Default::default()
+        })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspArgumentsCached {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspArgumentsCached {}
+
+/// Init arguments for the message queue.
+#[repr(transparent)]
+struct MessageQueueInitArguments(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS);
+
+impl MessageQueueInitArguments {
+    /// Creates a new init arguments structure for `cmdq`.
+    fn new(cmdq: &Cmdq) -> Self {
+        Self(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS {
+            sharedMemPhysAddr: cmdq.dma_handle(),
+            pageTableEntryCount: num::usize_into_u32::<{ Cmdq::NUM_PTES }>(),
+            cmdQueueOffset: num::usize_as_u64(Cmdq::CMDQ_OFFSET),
+            statQueueOffset: num::usize_as_u64(Cmdq::STATQ_OFFSET),
+            ..Default::default()
+        })
+    }
+}

-- 
2.51.2

