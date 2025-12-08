Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B542CAC7F4
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 09:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAAE10E3CB;
	Mon,  8 Dec 2025 08:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z5hW5OYU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4965010E3CA;
 Mon,  8 Dec 2025 08:28:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFZfHbc9eh5dTgu9PtS7jKExocsJBQkve4onWetoHWc6l0RsWq8PuLeTBVw0gUkHHspLORRP6NJ+KH+RclSmsMpswrgYhlvx/700QcchHZHrTe0D5MDLckr7odP0HOa2IJGE3qNTLNc5yaDIUPU+r4DSqPoLyCuuZODulnOSMw6sXbXW+1H4hIu7p2H2/WcrTiQuj0vl1u4PMYH79skeSNSjRgR7u0SdfxN0MOxvUzn93FKGPkyKJK/rz2QvOS2HQ1LXIClw6HzW1wBw7wEiM3g52uOvnEeibKaX/s+Pz0X+7VD26Tl+mW0kKTwuWVEGVJK+VNHxSZvzufelWRxN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUYksIeojxTxJDd5UrvbrSLLbysGwxSz4Qn8L0rFBIs=;
 b=HCn1K6W+QXptvNFf4ItskvyqYrQ4D2osNa+GkEa60GwK6VMFUQefQ7woCNNWMPuRu1qWD8TX327qoDV9jcDQQu/AuS3p/8Qm7HDCdD+h6xOWoYDJ3X9GQBgTemQqjrPEOeKG3BLqLAboBcgMux5tla4bSfhDMKtxnoB7CqrbKKKsbrBFVBapTYNtfwT1d7FbkLe8qhG0gR5bAWWGRQS863KNkhpRhjDCtWCtAoeqF+qojxXaVIAkUUIJ7x7+BlnEP5N6X4rdlMIS7hwRrXpLxLpJIKJoBXxsaDzEfZ6RnzISKrt8ohKxLethOPGzuYk659j4/sPnKX8I16Fbi1pb8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUYksIeojxTxJDd5UrvbrSLLbysGwxSz4Qn8L0rFBIs=;
 b=z5hW5OYUa4CpA92I4Es557CUsYfsznerTmQQcj3hYzE8IyJx8cEzVCP7yIcmwzpzSPp6IxVc2UUrNmNu6rIn2ahiAHbUlyvg6xbrmeW83rEapb5N9+lXin0pyQDGmL2yOuMsi5eh0xEgpH40DjDBhQG+hqQ2tXD22R/EYJg/k/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DS0PR12MB7745.namprd12.prod.outlook.com (2603:10b6:8:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 08:28:10 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 08:28:10 +0000
Message-ID: <e8846bef-2a6b-4552-8fb6-a33a00273aab@amd.com>
Date: Mon, 8 Dec 2025 09:28:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/amd: kill the outdated "Only the pthreads
 threading model is supported" checks
To: Oleg Nesterov <oleg@redhat.com>, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org
References: <aTV1jTmYK3Bjh4k6@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aTV1jTmYK3Bjh4k6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::20) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DS0PR12MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa306b3-c8b4-46c7-c0cb-08de3633b8bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFdsN3dmYWluQTd1YnozM1dmWDYyaTd3MXdUV0pwcmU3dGRWbUVqckZ3ZEt5?=
 =?utf-8?B?MmdML0ZmcE9iWHRNN0JtU3FvalJ1N2xQVmowLzh4RUNERnVxeGNTWE91eWFC?=
 =?utf-8?B?VnVEV29JNW43eXZqVzZrRVMyMDdLS2JXVGNpaDJpSENGVlB4ekNCbkhER21L?=
 =?utf-8?B?MWJVYmQ5V2ZxaUlFU0g1TzEyYWoydUdxWndoM2pyMmxFaTdqaEJnclBFUEpx?=
 =?utf-8?B?R3dLMUdrek83UXBNSkYzTnlVSDY1Q042VDROMWNTYzFSdHJvaTZhM0tnUVR4?=
 =?utf-8?B?aWMrMS9LWU9EUm9jUkQyRk91c1o2ZzJNd0Y3aHdWMGJBVUxGdUgvajJ4S2Js?=
 =?utf-8?B?UVFzdE5Dd3VQNERRTFdCaDh4Mi9XZ2pXQS9aTURid1MveDYwQ0pwL2V2WTQr?=
 =?utf-8?B?bVZ1VnZBL0lURWt0ZDZob1VPcWhRdFcvMkIxQlZETUI3a0l3TldhMWlKbVhu?=
 =?utf-8?B?dlp4c3pkVEVDL1pkVk9yWjBkUnJnb21JcUhqaGpUd2dMaUdPWFE1MTlYQWZB?=
 =?utf-8?B?SzBNMVNmTjBCbWxwMnp4VExxZWozSk9yNUFHUk5VM3JqVjB6ZVhzb3NIMXVV?=
 =?utf-8?B?ZUxTdkdLOWNIallaL3BjK0RBRE12SHpvVmJkUjdjNWd4TjRIZ1BVbklhbURH?=
 =?utf-8?B?emx1K1EzWlJpWUdiZ2R5QkVpVWUyUzI5a2l2NnZvVy9ZaHcrZitHeEJaR2sw?=
 =?utf-8?B?L3pUMm9sNlZSZm9mWjlWTzk1eE4zT2crR1lrMDc0Wm1Fci9RT0xUbTNmWk82?=
 =?utf-8?B?ODhZb3RScUhqeVZraVFhYjI4dThsejFWWUo2NGlqZVM1aTFublFPRkZ2alZX?=
 =?utf-8?B?ZzRLYVB3VWg1cTlWOTI2bUU3VnNvVFZ3ZVVDanpjdWVnMTZ1cXZ3VHhWeEk4?=
 =?utf-8?B?SEtSa251bXltcDNwM1lsWlA5NjhRRUljY0FsSFVKMG5xZktnM09iNmdLbStJ?=
 =?utf-8?B?UGtPQ0VHTHFNZG1RRi9zRlF2N3VWL3ZaekxoK01IaUpmRnJzZU84N2owODdy?=
 =?utf-8?B?TXJsR2RlS0VBclVPL3N4bytPU2IxUDNZY2x2cGZOd29ZanNWdmh5UFR3Z3Yx?=
 =?utf-8?B?WVR0QlFRZ3AzWHpsNzExVWJDZlNhemlTd3V4b1ZUcjk3bXRjSmp5bGNHZmE0?=
 =?utf-8?B?TzF5elVaTytEZ1hnaFFGWWc1SE1XU3Z2QW4wbVlTOWVKNE04d0duOTQzdFhC?=
 =?utf-8?B?K1k5d1BHSXlkMnhkMHJtVmJiZTQ1d2FWc1RiNW5Oc2JQTFI1TzRMbjQwSkZG?=
 =?utf-8?B?YWFMSEtSNmVsWWorcUlqNVRVd0dnY2NKc1RzdmNqQ0Z0T0pkVU43T002YlFU?=
 =?utf-8?B?SHU2aXB6VENydXVUblFhWW1IZ3FCZmFoQkFPalNnbnd3M0d2L3lrSDVNa2g2?=
 =?utf-8?B?MlU2U2ZWaGFNay9hT2ZnUmc4VnFxOTVGMWxIeVJtSldPd254MWgva1pUVmZq?=
 =?utf-8?B?VnBDQ1JtYTZMcEtIZFh3NWJJdzkrSG9ZMW81MjJNWmlKYWo3dFJSMHBqaHJE?=
 =?utf-8?B?N3l0KzluNGRabnE4WEhhdDY2TURHQUVsT0NEQ1hLRDVEbjJhdlhhZ0ZOcVJ3?=
 =?utf-8?B?TkVRRlNCbXdjUGZVYjNReThjaWNINjlNTXREczBCQnQzL3ovaVo4N3E1RUVw?=
 =?utf-8?B?L0VpZU5zc0V2QVp6Q1hmN2p4bTBXMEJpYTB0Z2I3R0RQSlNydmxoWnRxenhE?=
 =?utf-8?B?eEtuMkNzckthclRKcmdqQmxyR1luQUVFTzlTcTNIbm1WT2dSSnJTakdCY01J?=
 =?utf-8?B?Mzc1NitHZ1h1YXNwMkgwNEtYdGF4L1FpSjlDUGVzNjU1ZmM3cGhBTTVzNzEw?=
 =?utf-8?B?ZDFDTG8yNlpvb01XRXRuLzVXVGVHblBOeUR5bkdDcjVkeVJKU0ZCS0NjUm5Z?=
 =?utf-8?B?eGw2c3U4VDFDQ2lsZzhkOWdwNU1rVTNTNnpJQTIvazhhVEJhdks5QUJ1UTNX?=
 =?utf-8?B?L2p4a1p4NmtRdGxzdmpMNnpkeURRZkg3S2Q1L0N6NXcyc3pPM3NZSE5BRlBZ?=
 =?utf-8?Q?DW1iB1cjnh3f32KkdG2Qo3P/LHAFDU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3UrMkRkbGhmZWpFTEExTHdtbHN2UDczR0ZlSEVjT3hXZ21OK3ZxVTZiVnN4?=
 =?utf-8?B?bWNoTEZENmZtdVRiUUJublBaWENqL0xDNFNpRjFjNHhuWXJjK3gvWG5scGZZ?=
 =?utf-8?B?Zm4wVG5RSDZVeVZGOW1yR3F1dGh5aC9iTUE5WlU3M1lpYXcxZjk3dm9LdEt1?=
 =?utf-8?B?WjFIR0NDRVpmaS92NHZCNkxNUWNQQml2dlJJZHhJaHNWVlEvdTlQQ0NaTFhP?=
 =?utf-8?B?ZS84UE1CczFyQTJrZWZSeU42MkVmNHZYbFZ0aVFhUjh4MnJOL2xxZFZ5cWI2?=
 =?utf-8?B?VU1rb2JQYi9QdTc4V0pRN2Z0Ymo5d09VYWVPUkEvaHMyNkNNeFFsTnFMVStS?=
 =?utf-8?B?aExGdnprM293RXJFaVpQRkxYbTB5OHUvbmtMa0hNQytwL2w4V081UWl1SlZy?=
 =?utf-8?B?Mi9JbjgvSGgyREFhdVA3aVpvQUlGV2hZOUZRbjNkaHBXdGoyV0c2NTQ0SUM4?=
 =?utf-8?B?aHI0bUJKeTZZMmFOOTNudndHNkxKVEtKN1JNNnJibS9KbmJRR2ptM2Rabm5I?=
 =?utf-8?B?MnJTbU9vd2g2aVBPbEtFWGhTZ3hCRzhPbDY3U3F2NXZTRGZDd2k3MlRoOWZ0?=
 =?utf-8?B?WGFYcjQwNGhwMk5JK0w5dnMvRndoMUdnMUM0S2tPU2pvUENSeUd3aWtmbVZo?=
 =?utf-8?B?NVVVV2tlYTFXakdCYU4wK2FnQno0VmNCV3Z1eVkvUVpQaVNTbnpkWEZZbmla?=
 =?utf-8?B?anpQUnRkaTNPekNvbHc3UGozQmZrQ0dQR3d6SXZWYndGcFB2ZUJlbGtTUWQ3?=
 =?utf-8?B?NC9pc3VhTHNWUUZ3aDA2WmNRa0krSXo5cXhCK0ExQVQ2SG9HQXNiZUZJTDMx?=
 =?utf-8?B?djlBWU5uTFowZHBrS2t0amxqTStDMlRGejdhREx4dkdBNGsxOWNDelNyeWhl?=
 =?utf-8?B?ZzI4c1J0Vzh4WDNtVWl4eW5pTHUxOHh5aTEvZkFWWHloMklMajlabHB4RDdn?=
 =?utf-8?B?OVIyWWVQZFRwMmFpOCtCb2NKQWwxeWw3d0ZkcG90RTUveCtnaUtlNlpBeUts?=
 =?utf-8?B?MDAybmYxdVdEbFdrK2p2WUVQTFRxY0ZGeVd2d0sxVkNwdTVBZTJVKzB4TzdQ?=
 =?utf-8?B?b2hxalFQVDY3QnR4ejl3WTRhb3NRZzFuY3U2dWU1emVURUJta1QrT0VUaUpU?=
 =?utf-8?B?cFB4THcybC9ZZHJTTVluU3VMUW1kRmVJc1RmZGpBQjRYSUQ3Y295NWNTSkJV?=
 =?utf-8?B?bG45S3BMc3B1WVN3WG5QMDUyTVlBRjJkUEhzNTFRZ0JLQTNKUEhVZlhOQzFj?=
 =?utf-8?B?M3ZKazFubDRTd1l0U1JWcjJCeFk3dU5qaWx3SUZhZEg1QWo1UVl6OGdpUStO?=
 =?utf-8?B?SjN0R2pnVDRYTjZYQk5JeTdwSVIxMkR6Qkpaa0liS1UydTEyWUhnWkl1L0Y4?=
 =?utf-8?B?K0NnZWNIVDZHZ1FRc2w5MUdRendaeGdzQjJUN3B5eGx1TlpjRklodjBpem4v?=
 =?utf-8?B?RTNRUmo2RitHSW1JTlZwMy9ZYkVobW8xRlNCWU9VZmpQMENXR2VRdzYwZngr?=
 =?utf-8?B?TXhlcStlMXlJV2pkMExBTzNPTEtSMUtIRHJpZldEN2tvdlljcXpQNUxzMWVQ?=
 =?utf-8?B?NmEvTGlmWGxoS0ZBS3EwdTRQRVVqdm5MbElhMWdlUW1SZkFyNUNKUjM3OXlU?=
 =?utf-8?B?aEgwOVp6Y2NvL0JTN3VkSTRSMW9LWDdEMWpaR3g1MWMyK05Dd2Zib25ZQk1x?=
 =?utf-8?B?MEtHTGMxOG5LTUpXNy9ybjRmcGszYk5ZZmN3bmdFUW16V3pvbTRCS0RJYkhz?=
 =?utf-8?B?dm53ZGNXZDRueGVqMDNiQW54Z2hPNlhMakpCZDlKMitNMzdHcUdlTmZldlUx?=
 =?utf-8?B?WG1ZSFFsSUo5cHZuVlY2bGM2NG1DVWhQaFR5cWtSZzZPVGRKbW1LbDREUlRS?=
 =?utf-8?B?bXNsZFZ4Z0FXcklRZEM1c2RvcXY4Z3UrampXMHFSMndUSUI4UWNjaEo2UEZD?=
 =?utf-8?B?b3A1Ylp1UnNrajdhRkt2OWxYTW01MFFMY25QYWs5eENKL0lYb1dkTmUwVGNu?=
 =?utf-8?B?dHppQXpoc1N1R1JUQnN6SkZPU2h1Nm9YRVNEVVV1WVY1UnVZdCtkazgwemZX?=
 =?utf-8?B?ZnVGVGZ1UjhXbHdEMjhNY0JJVG5Cdm95eWs0RjNobGpPNGZwVW9YcVczbkF6?=
 =?utf-8?Q?+vB4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa306b3-c8b4-46c7-c0cb-08de3633b8bb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 08:28:10.4867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWWo0fOwYes6Gxb33i+7Lg853MmQD1ynMzJCg+GI8Ttjub28UwAdv0IqprfADfV1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745
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

On 12/7/25 13:39, Oleg Nesterov wrote:
> Nowaday task->group_leader->mm != task->mm is only possible if
> a) task is not a group leader and b) task->group_leader->mm == NULL
> because task->group_leader has already exited using sys_exit().

Just for my understanding: That is because CLONE_THREAD can only be specified together with CLONE_SIGHAND and CLONE_VM, correct?

> 
> I don't think that drm/amd tries to detect/nack this case.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Seems to make sense of hand.

Reviewed-by: Christian König <christian.koenig@amd.com>

Should we pick that one up or do you want to merge it upstream somehow?

Regards,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  3 ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c | 10 ----------
>  2 files changed, 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index a0f8ba382b9e..e44f158a11f0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2551,9 +2551,6 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>  	vm->task_info->task.pid = current->pid;
>  	get_task_comm(vm->task_info->task.comm, current);
>  
> -	if (current->group_leader->mm != current->mm)
> -		return;
> -
>  	vm->task_info->tgid = current->tgid;
>  	get_task_comm(vm->task_info->process_name, current->group_leader);
>  }
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index a085faac9fe1..f8ef18a3aa71 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -833,12 +833,6 @@ struct kfd_process *kfd_create_process(struct task_struct *thread)
>  	if (!(thread->mm && mmget_not_zero(thread->mm)))
>  		return ERR_PTR(-EINVAL);
>  
> -	/* Only the pthreads threading model is supported. */
> -	if (thread->group_leader->mm != thread->mm) {
> -		mmput(thread->mm);
> -		return ERR_PTR(-EINVAL);
> -	}
> -
>  	/* If the process just called exec(3), it is possible that the
>  	 * cleanup of the kfd_process (following the release of the mm
>  	 * of the old process image) is still in the cleanup work queue.
> @@ -918,10 +912,6 @@ struct kfd_process *kfd_get_process(const struct task_struct *thread)
>  	if (!thread->mm)
>  		return ERR_PTR(-EINVAL);
>  
> -	/* Only the pthreads threading model is supported. */
> -	if (thread->group_leader->mm != thread->mm)
> -		return ERR_PTR(-EINVAL);
> -
>  	process = find_process(thread, false);
>  	if (!process)
>  		return ERR_PTR(-EINVAL);

