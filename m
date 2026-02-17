Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K79KIXWk2l79AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514DC1488C9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4709C10E422;
	Tue, 17 Feb 2026 02:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FZ3rlKrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC0B10E425;
 Tue, 17 Feb 2026 02:46:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iobk9paxE6OcMvLFwXfpK6U9nYfdP+QZexek1iG0Vrut3HrdFlPWKXRfkR3g+xSZw8qOlZqKMUw/hHh+JSgcFzaHTMS9W85Nw3PW6ZHJNtjZbivnJHCp84ReBDgtdi83WHDNP8+A8Vf0N9fnABJ4S5lI+hd7/XjcMaBysz2DnjcNuVFifH2ADi4pQgaO8FGFHwj90QsspyQflUV9KiMc72QmDeXo6KJO0R1aFNBd6yBkIEm3l319TQ698kH89m8e018+jwlI0OA7DVYyENVesABolkfK2xWmUWBmgdSqOfcVqipRoLcw05HaTilrQfyvYUK+/PIIgpH6o9E6/j2SSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AT4ua54c4eHlA6EnhNiXD5hqnbyPq30/M/XxAjXtnM0=;
 b=TjQzsDW8pMairkSdSqW2OmkV91U88+mVLAThtIxO/9qoskhIY/jSbMjZ9upa6+RbRtNkA8xY7FuO502COmiuYwZFzGAnV7PODuhpCoKvXCEp6mHEK1eFU2tZrYU5AMR7jDYwLspm0Aj65W2nOJ/BeV7c9tsCkHVJpTN3i2mQ9n45h7tjfr0gG0INi2ZSbruxrrT4ArxpIn6pnQWJ7gfl7bIPbuBdlADZaLj9lGAx6UkUoVpuYvl6u3ly9YLH5YT1MKQIXvSJ3psXindKoTOlfgw2Y9KSKIYeWoYiCRi0deFBr5Kv8MKZG13smDSuKL7MULwKWBJ/jjJB/qwgfPqytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AT4ua54c4eHlA6EnhNiXD5hqnbyPq30/M/XxAjXtnM0=;
 b=FZ3rlKrR8JFqwESCEmLuRbihjOqMTqudYf5FKok4O0SK76iD2YzJXcI+ClgPBvVYovhMExfDqVZXKR1l5ouukZAfCiANlrToNyuYgT/+mkaXd34OClu51gbJdfysRhAdrS2aig2VtCvd7jpl2iAkkFa3CJ3mhSdibuXp+15FW/IMy+kgVrKwjnTemCgOreh2P7uXZ6dLX0qnPCN740omKrRZClGkOmOhhiGLF6OvIQdf9PFpbwr4qjQC5sCDwh6augQnxxm/M/VZs4hai+JcYEznhA9alKuzosQ+8V2CJcC4T0yxGeYOLqq/VNvYUjMvaQLd6PQVAnS/B6bicktVig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 02:46:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 02:46:21 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 17 Feb 2026 11:45:55 +0900
Subject: [PATCH v3 7/8] gpu: nova-core: use core library's CStr instead of
 kernel one
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-nova-misc-v3-7-b4e2d45eafbc@nvidia.com>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: 55fa1a32-54c0-4cf0-fcd7-08de6dcebbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGI5cDlxY3RubVhzcGVGdGFrOGlKOUVBYTIyTzhDckdCeVdXeThLbXZpM2ts?=
 =?utf-8?B?Y0FOaDhQTmQ2dEpqRmhWbGZialhLRTROQmlzRThtck9IL1lQK044enZjckhI?=
 =?utf-8?B?M1JZcG8yUWEvRkxJYWVrUzViZ1k2NVhFTURHMGp3ZytMY3VPVWZDUGlIY3dk?=
 =?utf-8?B?N0RQdXdvOTE4MUYzWGZpTHpnNVNja280YkxPOHVoTStLN0dBeFIvbGs2c3pO?=
 =?utf-8?B?SmxmaVRxQitYUFVLdjh4RmkyTExiNkR6Wkg5SkxtL1d4SlR6QVlUT2E4QXRP?=
 =?utf-8?B?eHQ0QisvUXMzQjlnVlVCdXRsU2NQUklsTXBiRURqMVFhODg2eS94a0RBM055?=
 =?utf-8?B?L3MrSU1QNnZQdjR2bjc5Q2c3ZmRyci9uTkRjZ0RrbzM5S3JIY1VEZ1MvZGM4?=
 =?utf-8?B?dVdyV1FqVmFMMFhrUSt1Tnhhb25MdGNsZWNyQTRibWs3a0Jtajl6eGlGazU2?=
 =?utf-8?B?U3hxWnZIUlU1OFRiRDJCamlkcjBPRU1ORlk4a2puVUgrUGVtaTRoMGRrOWZR?=
 =?utf-8?B?NnQ3eHg0QzlwQjlQek1IQXQ0Q29GdnkyUWRJcDBQOGdMR2czS3dTSC9GZUEz?=
 =?utf-8?B?U3VzZzVyaVhLdTF0YnEwVkcwZDFHZ3lUb25qbkFITkMvMC8wc1JMdDNtSGVW?=
 =?utf-8?B?Nk9ON1dKRWlyVUlhZkdHeGxhMFczR1RmSHRVTGZJU2U0WUxYbUNpMm52b3Bm?=
 =?utf-8?B?NTk5TE1IQnRjRzdiek5xYkJKSUN2Y2lyZ2lCWmJkMHBBUzRqRWxqcXordlZv?=
 =?utf-8?B?RUdqV0ZONjEyMUxmMDE3YnN3MFdMR2J4eDlYNmZBMGdjanZ1eXNnOTFRZXgx?=
 =?utf-8?B?OU9oRW9JTTFUVzlnTmkwNktPVG9VdUg0M1R4Skl1SjNVZkJFL25tcDJSRGwx?=
 =?utf-8?B?RVZ3Q05TSUtCVFIrbzd0eElLTU1BRTdMc3lYbDZWUTI2VmRlaEExYnh6bDQw?=
 =?utf-8?B?MEMra09ra1dvU0hzbkVSb0xxZ2NPdVhmbk9sRXIrV3l5Q1ZNb1RCaTBwaVNX?=
 =?utf-8?B?eGlGOGEwRmc1Tk5JTmFZdVBaN3FWOWxEZXdISFFNS1A4dnUwNXJZWjVNOWtV?=
 =?utf-8?B?YWMxdVBITGYxaGYyZ3hiSFpxcFZITDRJMkVqcUpFSHdxWEZRZlJ4cjNObVFB?=
 =?utf-8?B?bnBIOUk2aEI5T1ptU0xGVUdzQ0lsRG14eWN2RkdNdm11UEhIcDhHT1dJV3Vh?=
 =?utf-8?B?SHdRODl5K2dXalBSR2hrT1lHdzhac0VKVEFkZlVyQlhGdmpkTEkrOHNUQTFj?=
 =?utf-8?B?bnE2RGVoMG5ORWpDdkZrMFNkZkgwVXd1Nzk4WnJ4cnlVdk5ucmRVOTBVY01C?=
 =?utf-8?B?a3lrY0gvdnMrVGFaMmdqb0hSN0VycEpPQlRyaC9ueE9UZmU0YzdaakYwaGtG?=
 =?utf-8?B?VHFJTjBQRXV2WVliYWZuSDgrSHdjRlgrUkhiZ3BScFovZkg5a1pUUG1TT1RM?=
 =?utf-8?B?d1pCWDZXaDl5bUozSlUxYnVBdzZSU3ZIek0zOHFRWnFXMHFsVS9FN3lybEww?=
 =?utf-8?B?WHhyUERPbDBJdFk0UC9qMzdRNDZBY09vbUZSSmtKVXBDSjJCd2FtSDBkb1lz?=
 =?utf-8?B?TDJYOE8xZ0MyMlNXQXQyZCs0eE9LUytlQXpuaThjOXpibHFLbFliNUJqU1NG?=
 =?utf-8?B?d3l4QlE0MjNIeGlnSnhXRGdBNDVTQW9mWE02YTByZ3puSUdnZGt0SzhwcFFw?=
 =?utf-8?B?ejhZOXhROGFnQjloQWhNem1FcFNHL1p0bGVzcjdiUDRvY3dKamc1Y2x4RHhI?=
 =?utf-8?B?bDZFNjJDdFI3cjM5c0NreER6VndnMUtvU2wvS2lid0R4OUtXbndvZ1BOT2Fn?=
 =?utf-8?B?VUtiZldmdWl1WnFra1BqMzduVTZvTzNLd1dSSnNPVHZES2xxekZaeFFyb3Zn?=
 =?utf-8?B?eHlremxPOGJGZWtlL200c3pzbFVMUW1UQnB3bkEzOU92RURiVWVvUzg4S1Qx?=
 =?utf-8?B?S01vUGVyWFpKWjFFRFFmaURDZFc0eERuaEZkRDBiNUV3TFk2cVMvSFhKWG03?=
 =?utf-8?B?anBrbkp0OHNreTVNL2V6TllEMkRRYUZwYUVJRG40eFE5MGtaaXM3YUcxVDdT?=
 =?utf-8?B?ektIbzZpOWtVR3hnZ25GR0t0N2Jxd3IrMm5SOHU4L0tIRERzS1NDa2dZRXpq?=
 =?utf-8?Q?oERg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVlwTjNubmg0cnBobVBwR2EyK09aSHFVT3VyZWtTUVZWc2lxYlVmOWx5em94?=
 =?utf-8?B?dFJZTTN0QURqdUhucDI2MW94M0xpV3UraC9DbEpRR3JkQWZpeHFqMXN0Vmlx?=
 =?utf-8?B?ZFowQm4zdXJrd0RsZFRqZ200dWZ1WEYrRzhrVjYwREl3ekpVUnZIK0lkeDBV?=
 =?utf-8?B?RHhSNGg4bW43b2dTUnlPK0FPUTU2VGFMQ0UrUHp3Yy9icjdsTjI5RmdjY1Zk?=
 =?utf-8?B?MDRBRk8zaEVSRDJ1bzdjK3VxUGZ1Q1NTSFRzRmZOcURoRzgyOWF6SmZRcFlz?=
 =?utf-8?B?L1BMTGhmdkdpNFhKdnJ5eU1YaDZNZUFWMjVENEF4Q3FKQnZNUHJzZWROVDJL?=
 =?utf-8?B?TTJMOVdsTDhRSFVpSXFva0tVenFaSldVa0xmdTc4c3JtUlZpaXBBTFFnN0gx?=
 =?utf-8?B?WmNSRGxBTi80bWxIUVkxNGwxalNWby9seW9sZThHSFpkd0R5eWlTekdNYzl6?=
 =?utf-8?B?UmlHQkY2RnU3RWVJYTRSZmJmMEpFR3IzN2JVWmFNbXpTUWJwU0oyU3c0NHdR?=
 =?utf-8?B?aWdDcDlBVE5nL3l1MjhDb3p3RHNjSHFNM1lCeTlCN1F3L29WQ3hUWVA1Rldr?=
 =?utf-8?B?MWRkQW1BWGc5czU2L1ZaU3A5T2YyTnBibXNBeFJRTTA5dHA5bmtqN1c4VVF2?=
 =?utf-8?B?WE4zaHEwbGRObzdEbWUyVytVZCsvcVhBK2JKay9KMmRXZWVicTV3dlpvS3NO?=
 =?utf-8?B?QVhmdUtBdlRPWW5FUE00LzEyRGZPQytnTklMTUY4S3pVK0ZndXZDQTFBQnRE?=
 =?utf-8?B?MGtHZGFES01hdXl2aGxrbk43WW13cVJaUEtxOUg5c3JubVkrRFlORGF5dXhO?=
 =?utf-8?B?YUM5TFIvMGpUbGFRVHJKNllHUHBXODYyV1JzWjlOTFRYc2JZM2VZb2ZPNkZs?=
 =?utf-8?B?MzE2WnJlSU4wV25HdDJ1WG5tbjFJa01uU1RwMDVzNmh5d0NndnpJSTM5VGFw?=
 =?utf-8?B?MUhIQllVUmFwdEg1VlV3OU9RV2xEMHFOMGt4MXAzVERCdEpFbG9JWFM5RWZp?=
 =?utf-8?B?T2licW1yVXU0bEJlODkrb0xyRDMzM0RhV2s1WjZ2cDhWanlYVHBGTXRqMkFE?=
 =?utf-8?B?U1VJb0dTcWUxNnFoUXkrdUxPT2lhdjNzMkZTMGJMZTZGajY3NFh3RzJoVHpT?=
 =?utf-8?B?YlVudkVBaVNnbFE0WHRReVFOSmZnTk5nUnh5a1REQkdPZ1BjQXZLb251ZUNK?=
 =?utf-8?B?anZ2MEFwNDhyeFphWEUweEY3OUZSVmY1WG1CdGpuTWRHL3N5aytYTlB2UG1S?=
 =?utf-8?B?aCtXUEVpNVJaK3VnblBOcStDMW5qTDJEelBidkNuMEtoY0p1QVV0RWRLS3hT?=
 =?utf-8?B?OStzMlJ2WXJKSk9NODR2S21xNnFFeDdVcXBvejdIcUFNaGxwdW9OTzMvb0xT?=
 =?utf-8?B?MkRQa1FzbTEyOVFxbnN6L2FIZFZJdGdjZjJ1RWtGWnlpQ2NnQXcrelJ3dXJK?=
 =?utf-8?B?NHRaNVJCaWEwUGF3WXJSc05VckZVZFZLVk55TmtSWlZRUVV2OVMyVzBLenZU?=
 =?utf-8?B?VXZ0eEs1UGxKeWtvdy9YVFgyM21ZTUhVY0RtRUxKVVY2ZURvczJ1RFdqZXBR?=
 =?utf-8?B?anN4TCtyc0g2dUlGdVorOVp4cGZPVGVoTG0rTzY1VjJBbWljK3ZwUDJld0xr?=
 =?utf-8?B?ZkNGUDViQmRBdDYwT1lXNlU2d3JYR2lJajZNR2RNOE8rL0RPcyt4TElLU1Z4?=
 =?utf-8?B?QzhsVm5JVXRiK0N1SUVJd2NQYjdieCtTalRFZm50V3JIMUVrTWhyMUFmaUha?=
 =?utf-8?B?OFpMUTRqdUtyRS83em5ZREdaTDlWZ0FCeVJrcUU2dytIR1kvamc5bVVqS3da?=
 =?utf-8?B?aExYQkR5dnNzSmZVZXJNS2lkdG5OZjg2VUpBOGNlc2pQWWNFcVJYZkpvNnJE?=
 =?utf-8?B?dmdOd1kxbjlhbXFXZkJVQUw5QXF3eTJsK2xOSnQwTFRuWE5UWGZFa284Q0lz?=
 =?utf-8?B?NklwTXpEdVp0RExZdFl5QlgwcENOSXVvOTREdS9vTkVuUFVkVjl2NTJVdm9I?=
 =?utf-8?B?NlpyMVY1RGVBUm0yekZLNVMxbzZpVU5Ua1lNZHlBM3M0bi9qejFqZkhmOHVJ?=
 =?utf-8?B?QThNelJUSXFxUDNyYVNNMzhQSGh0dlVoUGRuQ1VQa05LdEFoaWg1ZG9WWVBH?=
 =?utf-8?B?SGVsRk10TlFGWG9ML0dZUzF1YmpNeHp0b29JT2ZhSDlsVmNvWE56ekIxMzht?=
 =?utf-8?B?NkhnZ2lzTWtzU0c1MnVsWkN6b0dUR2JrVHZrOW1Jd1JZRVFXSC9MZnBZWGtw?=
 =?utf-8?B?cnFWWFBVT2pFTE96WVJiUVlkaW9HaGtIODd5VTlLeC9NaE1pd0drZ08rTzZj?=
 =?utf-8?B?OStWcVlsVjlWc01Dcm51RXV0bi9ObmdoZldCNlBXbnIrc2lBL0hrYUR1TU85?=
 =?utf-8?Q?3L9yZzKUD9n5O3hEpcbvu4Kws4hMgCl3q+CDPRlV3lEFE?=
X-MS-Exchange-AntiSpam-MessageData-1: 1G9fDSZPk/uStA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fa1a32-54c0-4cf0-fcd7-08de6dcebbb4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 02:46:21.4456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqYEoehZvwmC23j0hyakYohp4ntmrESwZD46NWkbuGKxYbYuqWOD3u/fwlbyccF527mqFE4EC05EYLfY79N69w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9476
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 514DC1488C9
X-Rspamd-Action: no action

The kernel's own CStr type has been replaced by the one in the core
library, and is now an alias to the latter. Change our imports to
directly reference the actual type.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 2 +-
 drivers/gpu/nova-core/firmware/gsp.rs | 6 +++++-
 drivers/gpu/nova-core/nova_core.rs    | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 68779540aa28..2f7249383e51 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -424,7 +424,7 @@ const fn make_entry_chipset(self, chipset: &str) -> Self {
     }
 
     pub(crate) const fn create(
-        module_name: &'static kernel::str::CStr,
+        module_name: &'static core::ffi::CStr,
     ) -> firmware::ModInfoBuilder<N> {
         let mut this = Self(firmware::ModInfoBuilder::new(module_name));
         let mut i = 0;
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9488a626352f..ae3f6581c5b6 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -32,9 +32,13 @@
 /// that scheme before nova-core becomes stable, which means this module will eventually be
 /// removed.
 mod elf {
+    use core::{
+        ffi::CStr,
+        mem::size_of, //
+    };
+
     use kernel::{
         bindings,
-        prelude::*,
         transmute::FromBytes, //
     };
 
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..b5caf1044697 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -18,7 +18,7 @@
 mod sbuffer;
 mod vbios;
 
-pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
+pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
 kernel::module_pci_driver! {
     type: driver::NovaCore,

-- 
2.53.0

