Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71371AE0720
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED3A10EA61;
	Thu, 19 Jun 2025 13:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RdoLaoVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786F010EA5C;
 Thu, 19 Jun 2025 13:25:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWlKp6XjfMng0t2z5suPQt0wFKBEOZgGwz4MEHfn3EL2eSYnG5Di4Ow70c/aa82eqTpw0suBYkKQvcwpQClS2/H/FL0st6sdKok5tBIA7RD2CqrEPfMgGRnnCfu/I3dbh7yADJ2k27j3s8WdDEjjzzmoxnTgE+XWMdWpYA6Hh0mKBn3tmbKQHDPBVHEuwqoe95LizLuO86okODH2st8SCd7x/Da70x1M8ltTbWY2BGF4v8xXZNcnf8Gguy5X7yTS9RHPDfpAzws13K+E8OL5RYg1JHUmKpUJw+LFp/ERUdp60ruYab9NNTPnEZiXENk3mVERM3ibGuUPovPb/P1/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lm8Bo5uH0Lt7QPHMaRATGM+ipVKc0qJ0sxKPW0bFH+4=;
 b=jI8t/qr8nP8+E+olaMHlgW7VEJV0MOKH8/N+taUXuFLGnvbZ7v1lpvYRSKhiBUeWD2ZSFXALiRNihntypgGm9DxI3o26FySs+jopq9LVDs/t8Fj5kLnUrrwv45qo4ED2rnDyP07SjQkcKIO0gTjlxmwjXxxJhq2irK4nGpeS6rxwEFQ9rlUFT+q1m2UjznDbdHVXssJjVkbA6eoM6bvqmwQ0wpBqS6DS08jB/HK9Ft02JUxzt29nxhdDHmfL4FS14OS8aE8o1logprYDrGfdFLOQLCer4Tup0HdUdpvLAKi90pBF73dmdlBbOUwXyE+RZmwXNsXYkfUmYVSiPT1h0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lm8Bo5uH0Lt7QPHMaRATGM+ipVKc0qJ0sxKPW0bFH+4=;
 b=RdoLaoVjJJTStBKmwdj+614mckaezWYCWELEV2Mu+vxVyJvslIbF+/fm/9bJaMFILOlz4GPnRBWiyqqTlL15dQv80N875FlWkczJsZuD6tHytbiq8esvwTRZYZBX/BrnjwVXiu+AXiVz17yZEGgWeQrQvlTR/wi5lpYwSzRgx/r7a1iB7r5yOgbTOkUHOFRQgxeqAxXu95RH/TPmv9Gl1L9i81eZQ139BrrOFs2D+6Xtzvo1WhlXeUt1oPmN/6cKAigEHfVMu822U/kDOUo6FwOQkO9DCewY/bHmQnWgvfUmIfBRpIWiDoZuGlQv2+yI+CDObFM1CMajyRXNaykVXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 13:25:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:24:06 +0900
Subject: [PATCH v6 22/24] gpu: nova-core: extract FWSEC from BIOS and patch
 it to run FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-22-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0222.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: 292e8960-d55c-49a6-1981-08ddaf34c947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDk1bkZpY0JBcnQyZDBsV3FLRGZaYXZDelNQUjdaVFpOREhqMVRSWHR2c0Vl?=
 =?utf-8?B?NzRxejEwbngvaHcwQUNUcWswL0VkRFk4MUk4bnB6a0FPUGpEUEVBWE4wVkZN?=
 =?utf-8?B?SnVrcjEzR2ZuWXdyRjVscU90S3R4QzBGdWpkV1B0YjlnU2RHRWoxTk0xRS9z?=
 =?utf-8?B?UWcvbG1ZdFViNVYvY2llZERHRzhZNWUvbThTamx6MzhhcCtlYVBCRUZURDJo?=
 =?utf-8?B?MjJySXVjdlVBeE5WTkFFcDE0a3dXV3IyZjc5dHFXRzBPcDkydUx4SVBHMk1z?=
 =?utf-8?B?b1FqRWZyV0QwNnhSVWhicDI4RzNFSGNrVUQxcEtlSm9oNWpIUG95V0FVL1px?=
 =?utf-8?B?RjZ6WVFmdEVkWnd2WmNyanVPcFdHUjM2Y0p2NGFxdHZpUERXa3NWM1FVajZy?=
 =?utf-8?B?NmYydnJwbzZDT2d4Q1pmRUNHTDJRQURINitYL25TcS8xMlpVODNGdDdPNVZj?=
 =?utf-8?B?OUFjblZKUGx5Z3ZnYzZPQ3dkL2ZONnM1M2dMUDZXcEc3SHBURXZEdTFpUHlD?=
 =?utf-8?B?OVFQZU53aFFpOFZNQlM5ckpCV1ltTms2VlJKeDhQeHhDeS9SUWdSYUw2MVNI?=
 =?utf-8?B?YmNzZEMzU1QxUVYwZnFZTjljTS9mUkhadmZ1SXRJb1J5MmdSbVZmVDJ5L1Jt?=
 =?utf-8?B?aHNQQ04wMzVqdmdnenZNTGZiaFZWNExqTWExVitaanh5dVdXZ0JGZyt3cHRL?=
 =?utf-8?B?djhteDU0ZlN4UG1iaWNLelV2R2RPMXZwUkVYQnpNNFUvNk80T3I3alMya2xO?=
 =?utf-8?B?UjAzYWw2RnJQVFZrQTRVbWtYamI0WWVqYlhrMGkwUXM5eHVGc2ZmMnpBaVZB?=
 =?utf-8?B?Q3U5YVExR0grZUZaekF5YUVCYjlxWW9xekVGdENrNlhpbGMrWENNQ0FiZlpT?=
 =?utf-8?B?VGtQclRRQ1Q5TUlxR0tVNVhoYjNZUVQvZHh4a3dkV1dxVlFSc3dtd2xiTkh2?=
 =?utf-8?B?ek02ajlaVjVhRStqLzhnbThDYkxjOWt6eW5LQlVLTFVLeW9XcDFuNGdoRXZ2?=
 =?utf-8?B?M0pzTGl5Yzc3UTBabytTQWhzMVp4dTMrRldYQXN1Q3ZmVE80N05aN0NDYk1i?=
 =?utf-8?B?VlRoUUNYSWsyUkRlRjFrTXBHbUcwajVGTmo5Uy9RWENhT0wzeGVEb2tibkxj?=
 =?utf-8?B?SXo1bU80eC9adUtFSkZ6VzVoZ2JFYmZ2K3NqOFZ4V3JZc2JVNkdrd002QXpj?=
 =?utf-8?B?eFJvbGhVVjVGNk9nelg4UGJwMlg3YnZGaG5DWVlTQ0p4OGt5WjdVWWdIcEYx?=
 =?utf-8?B?ZXc3ZTVIUVBGbmtCOEVHeXFpcHdmNlpQK0sxZUI3ZVU5NUFLR1Z4ZDF1eGxk?=
 =?utf-8?B?ejBudDlid3VNNWNUdkJFenExaUlxWWVIQ0pHMHZEZ0FDSVJpZFIzQUtJUU1Y?=
 =?utf-8?B?MVJ1Rk1FYktzRk0zMSs3d29zNTRwZlZMcHN3UWJjeGNzQmdBTGdBVlZqeTBI?=
 =?utf-8?B?MDZQazg2emdDMHlTTVh4Zzc1cklreXJKbFdraDBGTjlJdmhkM3d6SEFBZUph?=
 =?utf-8?B?MDhlZ3hPdjBhUng3djB0L0U4Y1dpeDRFem5NckhHSUZRdU8zN1dCNTY4Mktw?=
 =?utf-8?B?REdHLzh4ckpWOGtEdm54cytnZktOL0k2VFA2MGx2Q2JPSE9TdUJTWlYyU3NV?=
 =?utf-8?B?bkw3T3JjeklFUG8wRHdzSkJiUFJ3TERPTjlzdjU5SjZPOVVMM1RRYXRWUEo1?=
 =?utf-8?B?TjVUSmFFaDJDQWQxK2U2TGFjUHRMcHBxaVM3ZG1zeDBjdE5TcDllUTVVUUIv?=
 =?utf-8?B?Ri9LUkdzenlIZU1yYnpPTFk4ZEZDcjdKcHFtdEZtNDJweXdQSGljNXdrRXhH?=
 =?utf-8?B?NFlxUkRpV200ZmcrOWVvcmNZc0NucElwL0M2bHNNVFhnNTdDVms2RzJKa1RK?=
 =?utf-8?B?aUJqODVGQkJwZGFkVVdseDhDNkMzUHJET1dIYkhOdkZkVUd0aHREVnVldS9Y?=
 =?utf-8?B?Z0FwbVNlV0VYdnp4QlJLbXhoTklNR2tNMG43dFNIVUpNWXpTOFhRTGxYK2pR?=
 =?utf-8?B?RXhMWHNOZ3d3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UCtPdnlDNjNRcnlJUDg1MDFMUmtzUnlQSUlWYzJ3RGsxalJ5c1JGeHo2SEdT?=
 =?utf-8?B?UW9iVUNDTkJYSktZUWx0aGNyMXZUQXFtSklad2s3MDJkNjY3WU1OWk1xSlNw?=
 =?utf-8?B?T3BXY2JXZ25Cd0NFZlE5dEF6eGo0YllvNUk3bmtvQ0lEWExZRDIxVmtLQzdJ?=
 =?utf-8?B?VmQzUFJsNU5HZ3NFVWF4MHRYSStoWDBaT05QZVYzSGRKM3lrYStQQlVja2Y0?=
 =?utf-8?B?ZmxZUHdwWGlyeDNNZHBSVW42UGtmMk10UHlnVUJvTEp6Y1dqZHZVVEZkMDNR?=
 =?utf-8?B?aUMraENXYk5nNW56UFNoY1pkTGZNUTFRRDBicEp2cFNXY1RhK3hzRysvWkVN?=
 =?utf-8?B?b0xOTVpGZzNHM0VHa2R1UkI5ZW5wWDc1QzBHRHpqMjdhTVY3MG5yV2lZTjBw?=
 =?utf-8?B?N1owSGYzS2czM1JFYk5ZcDEyLzJtRXdhdTZpUksyY0VYcXQ2ekJ3eEZhSnky?=
 =?utf-8?B?S3pUaWR2NmVWdUZ1MWg5MlQ4bW1XZjBLczdpMHJVcHc2dUdYQTgzLzRCNlBD?=
 =?utf-8?B?bGZXTWdHUEJvSTJRYmtyMnF3ckcvNzM4R1lRQWMvd0FQUVk3Mk9nV2J0RnF4?=
 =?utf-8?B?V0k3K2VQa011eFhHczJGMHBMbFl2TTFRNkF6Z0FlTytFTWdYQVJyNzhHK3dQ?=
 =?utf-8?B?bjZSWHFsZHNyTjFQMWQrWGpGV2xnYXNJQUExenBmNElKSDZRaWlrcXRMWGov?=
 =?utf-8?B?cE4zemhmNTF0Qkt6QzNuZnM3UDBvZ3Vob2FsWU9KWXMvRjlHMFZyZkE5Tjgv?=
 =?utf-8?B?dXVmUDhUbjJoK3JvbkYxcWVWSGM4ZENkbVF1OHlqdVIwR3BCSXE3dElRYUQz?=
 =?utf-8?B?VFdKQis3R1lXOXp3a1dnd3N3cXlhL3Q2RWlCMEV6K0VPWkJQTWVESE44UVZJ?=
 =?utf-8?B?RFZmZHhVRGJkMTZ5andpYVF0Ky9DQWlPRHBUME00OEFUV21xcDZKK0llUFJs?=
 =?utf-8?B?UHlFcUd4RHZLUHIwM2NDc3ZMaXFqdjcwWGVOcmdLMjlTbzVVOWhyaDVjQjFD?=
 =?utf-8?B?K0NSbjlVeklUK3BwZ1JpcDZPQytnU2ppMDVDRWZFdUplMVJvbUdweGR3Mmx2?=
 =?utf-8?B?T1hpb0V3dTJKdno1UDlXU0kxRWJ0U1BrUEl4Y0RKRlFEWDRFR0lKby9zS01l?=
 =?utf-8?B?Q0NuNW12YTVPWlFEOFNkNjhVRURyWExZbnNpbFdyREZPZnNVVUxoWVZBNFhU?=
 =?utf-8?B?ZnBWL3FOd2JEeDNuYnA5VWJ3MlFVdVlmS2hBRVZleDl1ekJreno2S1RrV1dU?=
 =?utf-8?B?bzFXZFA4NktOZ3ZTZGZ6akRZYTBNaVpCMWpXaksrazV3SmdXR3h2WmVwR3BD?=
 =?utf-8?B?cmFEYUJrOXZVaHVTZFdibVp1aTZWZkhORGRiYmhxUWRZQUVLeHZTbk9FQUlB?=
 =?utf-8?B?cVZObVlEeEwzNFJKdlByTXZRV2hXWEV5WXVNeFk3NDRsRktobUtLS3l0UERG?=
 =?utf-8?B?U2RndjJUTEF5U25UVGhlSW9xS1YwaHhRVlpYRVdGVFdIZ25XZDl5OFo0d1lv?=
 =?utf-8?B?REhNdlE2TVozR1VTa21rN1pUd0l1MlhDc3RCRkpvbHlobnVaRkVVbVpyVFdv?=
 =?utf-8?B?cEZmbGxueTJSR1daclIwT1NBaWNNSXZQaXFsa3phK2xSSkFYT0dYN1RZOWJa?=
 =?utf-8?B?T1pyd1VwSjlRc2Y1Q3dBMUJTaVZ5TDBOcTloT0wrUjlZUnl3blJVbnhiMTI0?=
 =?utf-8?B?bHhNUVl5dnJBWkVlaTRTMmM3TmlMN3FzR09vTVFnaGZaUXhBRnluT3dEMjZM?=
 =?utf-8?B?QTVUZ0IxK09FV2FockFJTDBYc3hOMXVadkxmOVRhT1hONWRIZTF0WUhhcDFE?=
 =?utf-8?B?dXMxWjJyRHNXU1VWRllvd2l5SDRYYmJSdm05ZFV6YnEzY05FOUVjaWpnaU1X?=
 =?utf-8?B?bk5sR3J6OWF3NnpqT3NBU20zVG41WHgrYXc1bzMwbDFLZWhhZU0rcHhDUHVu?=
 =?utf-8?B?UWJWWVpuQXErMVJ5NUF3Wm4wT3FzMU1ia0Y2OHV4VzM5VnJoKzFCN0JDbWM1?=
 =?utf-8?B?SVI5bU1tM0lXTFVGQk5xdzI1VVdidjlYdU80eTBKT3poN3lIN1QxTDgwZ25X?=
 =?utf-8?B?ZjJROFY0MzRsLzhLOXBxamhrc2tRUEFMZGZHSXJPazdZcHQvZWQ1VGkrdldD?=
 =?utf-8?B?a2R1QkFVWHFvMFRuRGRFVUoybkxLYXlVdFhCUU5uMG9JWEN2OVgzMFJhS2FV?=
 =?utf-8?Q?L1WWDwX9WOw1tkTklAb62irajNsA7Ya7ZmVTJSNYk+Qw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292e8960-d55c-49a6-1981-08ddaf34c947
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:40.8108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFeR82/u3xG/FqFyJxDR8fwQCI7a2Zm3NXaBBYPvObo6Pj1LsXs78MaPaD7/IE4wllN+uj/v018xAGinoqvusQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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

The FWSEC firmware needs to be extracted from the VBIOS and patched with
the desired command, as well as the right signature. Do this so we are
ready to load and run this firmware into the GSP falcon and create the
FRTS region.

[joelagnelf@nvidia.com: give better names to FalconAppifHdrV1's fields]

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs            |   3 -
 drivers/gpu/nova-core/firmware.rs       |   3 +-
 drivers/gpu/nova-core/firmware/fwsec.rs | 398 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs            |  15 +-
 drivers/gpu/nova-core/vbios.rs          |  30 ++-
 5 files changed, 434 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 4b063aaef65ec4e2f476fc5ce9dc25341b6660ca..1f1f8c378d8e2cf51edc772e7afe392e9c9c8831 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -2,9 +2,6 @@
 
 //! Simple DMA object wrapper.
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use core::ops::{Deref, DerefMut};
 
 use kernel::device;
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 32553b5142d6623bdaaa9d480fbff11069198606..ae449a98dffb51e400db058c7368f0632b62f147 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -15,6 +15,8 @@
 use crate::gpu;
 use crate::gpu::Chipset;
 
+pub(crate) mod fwsec;
+
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
@@ -114,7 +116,6 @@ impl SignedState for Signed {}
 /// This is module-local and meant for sub-modules to use internally.
 trait FirmwareSignature<F: FalconFirmware>: AsRef<[u8]> {}
 
-#[expect(unused)]
 impl<F: FalconFirmware> FirmwareDmaObject<F, Unsigned> {
     /// Patches the firmware at offset `sig_base_img` with `signature`.
     fn patch_signature<S: FirmwareSignature<F>>(
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
new file mode 100644
index 0000000000000000000000000000000000000000..de179c2011396fa789e868ec564b09eb48aa07ff
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -0,0 +1,398 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FWSEC is a High Secure firmware that is extracted from the BIOS and performs the first step of
+//! the GSP startup by creating the WPR2 memory region and copying critical areas of the VBIOS into
+//! it after authenticating them, ensuring they haven't been tampered with. It runs on the GSP
+//! falcon.
+//!
+//! Before being run, it needs to be patched in two areas:
+//!
+//! - The command to be run, as this firmware can perform several tasks ;
+//! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
+
+use core::marker::PhantomData;
+use core::mem::{align_of, size_of};
+use core::ops::Deref;
+
+use kernel::device::{self, Device};
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::falcon::gsp::Gsp;
+use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
+use crate::firmware::{FalconUCodeDescV3, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
+use crate::vbios::Vbios;
+
+const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
+
+#[repr(C)]
+#[derive(Debug)]
+struct FalconAppifHdrV1 {
+    version: u8,
+    header_size: u8,
+    entry_size: u8,
+    entry_count: u8,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifHdrV1 {}
+
+#[repr(C, packed)]
+#[derive(Debug)]
+struct FalconAppifV1 {
+    id: u32,
+    dmem_base: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifV1 {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct FalconAppifDmemmapperV3 {
+    signature: u32,
+    version: u16,
+    size: u16,
+    cmd_in_buffer_offset: u32,
+    cmd_in_buffer_size: u32,
+    cmd_out_buffer_offset: u32,
+    cmd_out_buffer_size: u32,
+    nvf_img_data_buffer_offset: u32,
+    nvf_img_data_buffer_size: u32,
+    printf_buffer_hdr: u32,
+    ucode_build_time_stamp: u32,
+    ucode_signature: u32,
+    init_cmd: u32,
+    ucode_feature: u32,
+    ucode_cmd_mask0: u32,
+    ucode_cmd_mask1: u32,
+    multi_tgt_tbl: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct ReadVbios {
+    ver: u32,
+    hdr: u32,
+    addr: u64,
+    size: u32,
+    flags: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for ReadVbios {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct FrtsRegion {
+    ver: u32,
+    hdr: u32,
+    addr: u32,
+    size: u32,
+    ftype: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FrtsRegion {}
+
+const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
+
+#[repr(C, packed)]
+struct FrtsCmd {
+    read_vbios: ReadVbios,
+    frts_region: FrtsRegion,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FrtsCmd {}
+
+const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
+const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
+
+/// Command for the [`FwsecFirmware`] to execute.
+pub(crate) enum FwsecCommand {
+    /// Asks [`FwsecFirmware`] to carve out the WPR2 area and place a verified copy of the VBIOS
+    /// image into it.
+    Frts { frts_addr: u64, frts_size: u64 },
+    /// Asks [`FwsecFirmware`] to load pre-OS apps on the PMU.
+    #[expect(dead_code)]
+    Sb,
+}
+
+/// Size of the signatures used in FWSEC.
+const BCRT30_RSA3K_SIG_SIZE: usize = 384;
+
+/// A single signature that can be patched into a FWSEC image.
+#[repr(transparent)]
+pub(crate) struct Bcrt30Rsa3kSignature([u8; BCRT30_RSA3K_SIG_SIZE]);
+
+/// SAFETY: A signature is just an array of bytes.
+unsafe impl FromBytes for Bcrt30Rsa3kSignature {}
+
+impl From<[u8; BCRT30_RSA3K_SIG_SIZE]> for Bcrt30Rsa3kSignature {
+    fn from(sig: [u8; BCRT30_RSA3K_SIG_SIZE]) -> Self {
+        Self(sig)
+    }
+}
+
+impl AsRef<[u8]> for Bcrt30Rsa3kSignature {
+    fn as_ref(&self) -> &[u8] {
+        &self.0
+    }
+}
+
+impl FirmwareSignature<FwsecFirmware> for Bcrt30Rsa3kSignature {}
+
+/// Reinterpret the area starting from `offset` in `fw` as an instance of `T` (which must implement
+/// [`FromBytes`]) and return a reference to it.
+///
+/// # Safety
+///
+/// Callers must ensure that the region of memory returned is not written for as long as the
+/// returned reference is alive.
+///
+/// TODO: Remove this and `transmute_mut` once `CoherentAllocation::as_slice` is available and we
+/// have a way to transmute objects implementing FromBytes, e.g.:
+/// https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantoslima21@gmail.com/
+unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
+    fw: &'a DmaObject,
+    offset: usize,
+) -> Result<&'b T> {
+    if offset + size_of::<T>() > fw.size() {
+        return Err(EINVAL);
+    }
+    if (fw.start_ptr() as usize + offset) % align_of::<T>() != 0 {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
+    // large enough the contains an instance of `T`, which implements `FromBytes`.
+    Ok(unsafe { &*(fw.start_ptr().add(offset).cast::<T>()) })
+}
+
+/// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
+/// implement [`FromBytes`]) and return a reference to it.
+///
+/// # Safety
+///
+/// Callers must ensure that the region of memory returned is not read or written for as long as
+/// the returned reference is alive.
+unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
+    fw: &'a mut DmaObject,
+    offset: usize,
+) -> Result<&'b mut T> {
+    if offset + size_of::<T>() > fw.size() {
+        return Err(EINVAL);
+    }
+    if (fw.start_ptr_mut() as usize + offset) % align_of::<T>() != 0 {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
+    // large enough the contains an instance of `T`, which implements `FromBytes`.
+    Ok(unsafe { &mut *(fw.start_ptr_mut().add(offset).cast::<T>()) })
+}
+
+/// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
+///
+/// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
+pub(crate) struct FwsecFirmware {
+    /// Descriptor of the firmware.
+    desc: FalconUCodeDescV3,
+    /// GPU-accessible DMA object containing the firmware.
+    ucode: FirmwareDmaObject<Self, Signed>,
+}
+
+// We need to load full DMEM pages.
+const DMEM_LOAD_SIZE_ALIGN: u32 = 256;
+
+impl FalconLoadParams for FwsecFirmware {
+    fn imem_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: 0,
+            dst_start: self.desc.imem_phys_base,
+            len: self.desc.imem_load_size,
+        }
+    }
+
+    fn dmem_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: self.desc.imem_load_size,
+            dst_start: self.desc.dmem_phys_base,
+            // TODO: replace with `align_up` once it lands.
+            len: self
+                .desc
+                .dmem_load_size
+                .next_multiple_of(DMEM_LOAD_SIZE_ALIGN),
+        }
+    }
+
+    fn brom_params(&self) -> FalconBromParams {
+        FalconBromParams {
+            pkc_data_offset: self.desc.pkc_data_offset,
+            engine_id_mask: self.desc.engine_id_mask,
+            ucode_id: self.desc.ucode_id,
+        }
+    }
+
+    fn boot_addr(&self) -> u32 {
+        0
+    }
+}
+
+impl Deref for FwsecFirmware {
+    type Target = DmaObject;
+
+    fn deref(&self) -> &Self::Target {
+        &self.ucode.0
+    }
+}
+
+impl FalconFirmware for FwsecFirmware {
+    type Target = Gsp;
+}
+
+impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
+    fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
+        let desc = bios.fwsec_image().header(dev)?;
+        let ucode = bios.fwsec_image().ucode(dev, desc)?;
+        let mut dma_object = DmaObject::from_data(dev, ucode)?;
+
+        let hdr_offset = (desc.imem_load_size + desc.interface_offset) as usize;
+        // SAFETY: we have exclusive access to `dma_object`.
+        let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
+
+        if hdr.version != 1 {
+            return Err(EINVAL);
+        }
+
+        // Find the DMEM mapper section in the firmware.
+        for i in 0..hdr.entry_count as usize {
+            let app: &FalconAppifV1 =
+            // SAFETY: we have exclusive access to `dma_object`.
+            unsafe {
+                transmute(
+                    &dma_object,
+                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
+                )
+            }?;
+
+            if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
+                continue;
+            }
+
+            // SAFETY: we have exclusive access to `dma_object`.
+            let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
+                transmute_mut(
+                    &mut dma_object,
+                    (desc.imem_load_size + app.dmem_base) as usize,
+                )
+            }?;
+
+            // SAFETY: we have exclusive access to `dma_object`.
+            let frts_cmd: &mut FrtsCmd = unsafe {
+                transmute_mut(
+                    &mut dma_object,
+                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
+                )
+            }?;
+
+            frts_cmd.read_vbios = ReadVbios {
+                ver: 1,
+                hdr: size_of::<ReadVbios>() as u32,
+                addr: 0,
+                size: 0,
+                flags: 2,
+            };
+
+            dmem_mapper.init_cmd = match cmd {
+                FwsecCommand::Frts {
+                    frts_addr,
+                    frts_size,
+                } => {
+                    frts_cmd.frts_region = FrtsRegion {
+                        ver: 1,
+                        hdr: size_of::<FrtsRegion>() as u32,
+                        addr: (frts_addr >> 12) as u32,
+                        size: (frts_size >> 12) as u32,
+                        ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
+                    };
+
+                    NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
+                }
+                FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
+            };
+
+            // Return early as we found and patched the DMEMMAPPER region.
+            return Ok(Self(dma_object, PhantomData));
+        }
+
+        Err(ENOTSUPP)
+    }
+}
+
+impl FwsecFirmware {
+    /// Extract the Fwsec firmware from `bios` and patch it to run on `falcon` with the `cmd`
+    /// command.
+    pub(crate) fn new(
+        dev: &Device<device::Bound>,
+        falcon: &Falcon<Gsp>,
+        bar: &Bar0,
+        bios: &Vbios,
+        cmd: FwsecCommand,
+    ) -> Result<Self> {
+        let ucode_dma = FirmwareDmaObject::<Self, _>::new_fwsec(dev, bios, cmd)?;
+
+        // Patch signature if needed.
+        let desc = bios.fwsec_image().header(dev)?;
+        let ucode_signed = if desc.signature_count != 0 {
+            let sig_base_img = (desc.imem_load_size + desc.pkc_data_offset) as usize;
+            let desc_sig_versions = desc.signature_versions as u32;
+            let reg_fuse_version =
+                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask, desc.ucode_id)?;
+            dev_dbg!(
+                dev,
+                "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
+                desc_sig_versions,
+                reg_fuse_version
+            );
+            let signature_idx = {
+                let reg_fuse_version_bit = 1 << reg_fuse_version;
+
+                // Check if the fuse version is supported by the firmware.
+                if desc_sig_versions & reg_fuse_version_bit == 0 {
+                    dev_err!(
+                        dev,
+                        "no matching signature: {:#x} {:#x}\n",
+                        reg_fuse_version_bit,
+                        desc_sig_versions,
+                    );
+                    return Err(EINVAL);
+                }
+
+                // `desc_sig_versions` has one bit set per included signature. Thus, the index of
+                // the signature to patch is the number of bits in `desc_sig_versions` set to `1`
+                // before `reg_fuse_version_bit`.
+
+                // Mask of the bits of `desc_sig_versions` to preserve.
+                let reg_fuse_version_mask = reg_fuse_version_bit.wrapping_sub(1);
+
+                (desc_sig_versions & reg_fuse_version_mask).count_ones() as usize
+            };
+
+            dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
+            let signature = bios
+                .fwsec_image()
+                .sigs(dev, desc)
+                .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;
+
+            ucode_dma.patch_signature(signature, sig_base_img)?
+        } else {
+            ucode_dma.no_patch_signature()
+        };
+
+        Ok(FwsecFirmware {
+            desc: desc.clone(),
+            ucode: ucode_signed,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 413f1ab85b37926cdfd9a9c76167816b21d89adc..ba926162c1a016f7e1c88da50308fb0a8686924a 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -6,6 +6,7 @@
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 use crate::fb::FbLayout;
 use crate::fb::SysmemFlush;
+use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::regs;
@@ -223,8 +224,18 @@ pub(crate) fn new(
         let fb_layout = FbLayout::new(spec.chipset, bar)?;
         dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
 
-        // Will be used in a later patch when fwsec firmware is needed.
-        let _bios = Vbios::new(pdev, bar)?;
+        let bios = Vbios::new(pdev, bar)?;
+
+        let _fwsec_frts = FwsecFirmware::new(
+            pdev.as_ref(),
+            &gsp_falcon,
+            bar,
+            &bios,
+            FwsecCommand::Frts {
+                frts_addr: fb_layout.frts.start,
+                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+            },
+        )?;
 
         Ok(pin_init!(Self {
             spec,
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 0149621dca1aaea5b342ff32e4701de49e988839..c029c600b9b3081ad1e1dd4112acd4ed914e9d8d 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -2,10 +2,8 @@
 
 //! VBIOS extraction and parsing.
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use crate::driver::Bar0;
+use crate::firmware::fwsec::Bcrt30Rsa3kSignature;
 use crate::firmware::FalconUCodeDescV3;
 use core::convert::TryFrom;
 use kernel::device;
@@ -1124,15 +1122,18 @@ pub(crate) fn ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Re
     }
 
     /// Get the signatures as a byte slice
-    pub(crate) fn sigs(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
-        const SIG_SIZE: usize = 96 * 4;
-
+    pub(crate) fn sigs(
+        &self,
+        dev: &device::Device,
+        desc: &FalconUCodeDescV3,
+    ) -> Result<&[Bcrt30Rsa3kSignature]> {
         // The signatures data follows the descriptor
         let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
-        let size = desc.signature_count as usize * SIG_SIZE;
+        let sigs_size =
+            desc.signature_count as usize * core::mem::size_of::<Bcrt30Rsa3kSignature>();
 
         // Make sure the data is within bounds
-        if sigs_data_offset + size > self.base.data.len() {
+        if sigs_data_offset + sigs_size > self.base.data.len() {
             dev_err!(
                 dev,
                 "fwsec signatures data not contained within BIOS bounds\n"
@@ -1140,6 +1141,17 @@ pub(crate) fn sigs(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Res
             return Err(ERANGE);
         }
 
-        Ok(&self.base.data[sigs_data_offset..sigs_data_offset + size])
+        // SAFETY: we checked that `data + sigs_data_offset + (signature_count *
+        // sizeof::<Bcrt30Rsa3kSignature>()` is within the bounds of `data`.
+        Ok(unsafe {
+            core::slice::from_raw_parts(
+                self.base
+                    .data
+                    .as_ptr()
+                    .add(sigs_data_offset)
+                    .cast::<Bcrt30Rsa3kSignature>(),
+                desc.signature_count as usize,
+            )
+        })
     }
 }

-- 
2.49.0

