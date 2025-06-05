Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E817CACF011
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586FE10EA01;
	Thu,  5 Jun 2025 13:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="phH/wl0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2394010E9A6;
 Thu,  5 Jun 2025 13:14:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hN07mCYcLUz0ui+DEaxbuuFimcI7qgIgyNrnxnp8czVEAzCrWdjL+JFUrf3tBEJapWtlAxr73lsJ6UytBkxUQ8vbIAMRDfEFUV4RZ/OwhCvCO0BR24tt6A0hCKXgp7wtJSP/yHMgPOh1sLWqbWNw1wlUvoeplNngRq0jCBGxzWW59EHqSG0b+rIX2mUBr5nHkAHVY6WjPMSd4/pdp8NSvmdWMzmVvQgKddDuPaa7YtvJPXNOHz1jYmiLfnaeuA1te1VuGrcmGHJfZLDf27Tzw4EFuLkOYLaymruzxd0X/9cDuUv22x/qU8MJevyhyaJzT50+jKlLDnFPCJOJWwXsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+4ar+O0J1EbyJpjO8W4mSY7xvUa6/oDmMQYuemv/Z4=;
 b=RVBsSyzGy+hs6zvo0Ga7ZO+KOLDF1JKaJ2AKn1126l4ve+VHCRxkzwJR7YcJcK07/rObNyWQzWex6yzC9Q9tNv6plkHh1niexOPqYqXanr7GtP4JmBr6C3mnmOkVtBMGieDFimfPFdZJbkVCxqv5LJuqJnm0LVikGEc9O0+SoyqaPUN4IIE9aZ7YlG5w1d1vlcUsDSiJIAPKlvwKGzOk4pvcsmOx3c3P1cIoG3gXEqHTornA8Wl8JrD65xs0fpnNB+FvilPiZPAy1Zjw0WqYR8AiXjUHte8LSchEVhhfPNSi3js+D3H91NcBiJcBmJILq8ER7U0uMTLOFKGj4I+Jag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+4ar+O0J1EbyJpjO8W4mSY7xvUa6/oDmMQYuemv/Z4=;
 b=phH/wl0RuRbK3f9JhqQB6V73jSEjLQOjg/xNUPhXkzi6DE31c76Nxg/sXp6rN4MRnRSnUUogt+98Gt55dPYT7aZva1BUvj+anWFpI9qUBTcjiZRNnNfSaRKOX2q2L5I7BPBUHShdmcY+IU4IE00I8WkyrFoLt3QPzghWohWMM8KDVSCPj4ZlmAbhWkTPBg4AL9foeG7tJw74ICrap4t6qbd/MpHFlnDhzjTGblCkIXU0UEbTaLo45Yeo8uKUiyjbvFeM9Zv2URlnmx+KzV+OB58LWsBP+iH3BoLpx0pnh+sNUM6gkqPBI6+O48SgKeSI9Wj1p+bTpoNt8AFS79//FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYXPR12MB9385.namprd12.prod.outlook.com (2603:10b6:930:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 13:14:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 13:14:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 22:14:39 +0900
Message-Id: <DAEMKY67UZ5J.2OK3SDS80CYYS@nvidia.com>
Cc: "Lyude Paul" <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 17/20] gpu: nova-core: compute layout of the FRTS region
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-17-05dfd4f39479@nvidia.com>
 <632966ba8231e8f3c20350b217b225301280cdd3.camel@redhat.com>
 <DADGJZGG5PXE.170H96D26HIN6@nvidia.com> <aEAew5aBnfSqXFdT@cassiopeiae>
In-Reply-To: <aEAew5aBnfSqXFdT@cassiopeiae>
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYXPR12MB9385:EE_
X-MS-Office365-Filtering-Correlation-Id: 7174a0f0-b31a-45a3-8c39-08dda432ef99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVBRcXNMUFhKN2RlZ2owMnFJT1B4cWhMZThKei9OYVpIQlYxNjRPbkZjbFM0?=
 =?utf-8?B?Z3htZHFHUnVUOVhOSGEyVWtuOVBrb2NCSldxVW9rTTNObHB1S0tUSDFVSnRP?=
 =?utf-8?B?dFp5MHlGZElHYVNjbkRtOEVJbFhUNHAzL29QOTAveFdGTVF4RXVWbU4vWHVQ?=
 =?utf-8?B?UVRJN0RPYlljUDgxcjRGcm1ZZURmM1JGUmpkNW1FR01uRng5czZrMzMxSm00?=
 =?utf-8?B?eW1lL1R3SC9oMThyenhPV2hxSHRmcDhjeUNrMVBaVFk0eVZmZ1IxTlhwaDJ2?=
 =?utf-8?B?NGdGUjRwbXBSelJHZkdiUGg5NVMxeHIzV2pzUFU1OWtIKzNTclJlcE5jekhi?=
 =?utf-8?B?Uko3VlI1T3Z2cjZLTWt5Nlo0SmhvZURjWGF3UjR0Rnl0VzNXQkc5MnlpMWox?=
 =?utf-8?B?RzdPOUtpbFlFRVpJaS9HZkQvMTRXSHVSUTlESFBEbVo2NHVteGE3WFpEN25J?=
 =?utf-8?B?dGgwNnBDNnNPK1IrdXh6Y01icXlEY2xJYVZML1UvZXdvSE9oRFVzWWxMa1lo?=
 =?utf-8?B?ejhzNGxKV29yYS9XTjRBSm80aTl2dnJDNnJYR0JQZjNUcmU5YU1oaW5ZVGRV?=
 =?utf-8?B?aStmZWp4RitZeUtkVWpXUkhZdktqZlR6WnA1WVU0Z3RoalBZeVF5bzA3VmN0?=
 =?utf-8?B?bWh1aWFlNkVUbCtpZkNDSWJzb0trWHZWUG1qMXVSNVlQclRhaGhVSzRQbkIz?=
 =?utf-8?B?TWpLQkdPRXV1ckc4alVxcDFKMzJWS2MvRS9WdU9pc3N0NGp4WDhmWVFBdzVo?=
 =?utf-8?B?TzNna0NlM0JpbENoVzJSUHdoMzBlb3NXdGUwZGhNMGZiZ3ZUZ2M1MHJtQ2ov?=
 =?utf-8?B?TkR1aEIzSytDSkJZcXgvUFNrYmRYZFZ4RUc0T09IUUx0d2dpZnN0WEdjZU91?=
 =?utf-8?B?aC9pUjE1aVVtZmQ3WXhxVkRUZjFES0REeFFORFYxL1NSRFlnMHZzZ1FrSVhv?=
 =?utf-8?B?bU81bHczT252Rk9HSUZpem43UjdCUEdFbkxOK04xRUNIZW1kaXhKUlUwSnA1?=
 =?utf-8?B?T3QrYktDL3pJeThHbklxQUg4ZjVnY2E2MzJ6RWhOT2xEc2haRUxoTGtHOXE3?=
 =?utf-8?B?bnR1TFVPUlFsTkc3aVBJR0lOVWhJaHoySERDNEo0YythYmdRK0dHSExGUlB6?=
 =?utf-8?B?eGtLWldQMUt5dVR5Yll4QjhldkhCNDNJYlloOUJvOHo4MlZIY1JOQmRydXJh?=
 =?utf-8?B?TEJLeit2L1ExVGNxN0RYWk1xRVBoanVnb1ZKQi90Z3RrRVRacUp1SHM3TFE2?=
 =?utf-8?B?RzZTQjdQSEhjWGlKOEVqRmFEa1lXYkRTWmxKNTExTnk2M0dld0JDbVNDUVJZ?=
 =?utf-8?B?bnhzWFRFTDQyd3N0Qy85cEhvaWRNNnVwejBJUmsrSW5FbDd2TCtRNmEyWW04?=
 =?utf-8?B?Y3VEZzB4MGlEU3VsQlNveEtmZXJHajZubUQwNllVSC9CZ3pUK0lhRlRJOVZS?=
 =?utf-8?B?ZVdaN0JDR1RCMWZaNHBLNkJsVFIzQnVTNVBhQWYxcEpCaGZwdlRsZGQ4TzZi?=
 =?utf-8?B?RE1uMmxSUGJMQXhiYnp0N0hDUS95N0dyV1RyTW5oTW12cGp6QVREOGR1TFhU?=
 =?utf-8?B?M2N4cUFvUmZIeXlKR01mOElmbzZmR1c0MS9hR2IzYU8vTlVOMzBHUWtWR1k2?=
 =?utf-8?B?UmNkOXZwV3krWGFMd1pxcG92eEFrQWxJRGlhTmJtVEpYcTZUWVJxaER6Q3lD?=
 =?utf-8?B?WjZEdjczWGdoQzVDOGFqdjREeUJ4SjJENjVFdGZ5RjF4NnNtazh2VXVRa3RK?=
 =?utf-8?B?cmg2MWNYQklHbmlUaFM4UTgwM1hWVXJtZzZCWERJZCtkK3dyOWxySE9iaVE0?=
 =?utf-8?B?WDR5VzBxaUlnMFpxbFZITHpGTU9YWVhmV0NnVGpSVFJUUUgxOEJLSVEyNUt3?=
 =?utf-8?B?MGk0aHQ0eGtPektVRWRMbHFMSEZyWkF0QTN3dytnTFh3UytpUEFKc3ZKclI0?=
 =?utf-8?Q?+MLh7G+9SZk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SC9ldlR5ZlFZam9NcTBGbG9FK2o2S05VTzNmSGlCUzFPb1VIMUtiRjhNRHpo?=
 =?utf-8?B?Z0JnTmxsRlFLZDNGV3NacDg2SnhFSVBpWFpUSVcrdGV5WTZDTkJERzlrdndI?=
 =?utf-8?B?Z1FyeEZsdXd0eDdFZ1VLdm16UTV6VGJXdFZaNC9Zd2dLR3FqL1FuTnlmb3or?=
 =?utf-8?B?MnhhR2Z0NmhzbHBrS1hLNmxlM2JvaWsyYXFveDBUZmZoTkhUYTlVdHF0U1Ar?=
 =?utf-8?B?VnNmSE92VStqTEJ5aUJ0Q050cUFCeHNGNjJSYWNFTHVuN2o4TVErRDlUM2xN?=
 =?utf-8?B?MVRRRkZ0bW1UeUdpbnoxMEV0UFFmeGx0YUtBaTh4WEhyUEJENUxDQmt4VDRs?=
 =?utf-8?B?VGtEVkVnWjdWOFJYZ1RHSnhLQ2dOMmg4VDZZcUt4UVozWEdaRWVoam53RlJj?=
 =?utf-8?B?Sys1K1V3NVJCem1vazU0SEJzNEMxazFkRElUcmUrR2dqak1UckZWejVPRUlM?=
 =?utf-8?B?aC9LNDJTUXhsZlFZRjdlRGc2STNQcHczZkkvSmZhblNLZFRZMm4wUitvYk5i?=
 =?utf-8?B?eEpZVERBNmJybzJGQ0hNd2lSdmFyUTI2N25zbGdtQ0czbFdxc3U0VTFVNTI0?=
 =?utf-8?B?Y1daVS84VHI3MHZpQzFDMlNtVHFBd0g0MHJsenNEMW8yTkpLd1FoeEFMWEg0?=
 =?utf-8?B?NS9yNVVYK2dZRnYzbG1IczVramFlLzErV2d1ZWtYVWE3Y2FWRENMTVo0VWpG?=
 =?utf-8?B?ZUFjMGY4MkprTHVWcnNQQjc2MWFMMUM3M25JZkZXRCthcXQwZ1JKTVIwMCtr?=
 =?utf-8?B?OTVaMkVRR1Y5MjlBL1lGM3ZyVEJncTBjc1V3V3FsTFphR3dqc1orZ0g3OGpC?=
 =?utf-8?B?OUxYWjBHKzE5bU1lODNpMm9OQWNOOWk5bDhmNDlXV0VlSi9uM1UwWkppWUxp?=
 =?utf-8?B?MXdLT3JCTmtEZklBOUJHQVZyd0IwR05nRkJ6cUNUdzBrN3laeSsrWmNtRHBq?=
 =?utf-8?B?Q1FGNGlhcVY3eFo0TWd3WVdxdFJLYTNhc0VIVXdab0JpZ2VDTUNWaSs1ZCty?=
 =?utf-8?B?MzFPZE5ROStGb2xwU3FudnpNUzkvb3Q2MlN5MXBUQkFyVEFva1ZFVW4xRmlE?=
 =?utf-8?B?YkVxazVKeTd2QXNtRnhPV2pyVDVtSm9RV3FHSE1leC92dk10WXQ0WDBuaGxU?=
 =?utf-8?B?UEVSRWg5ODVwLzBOWktIeTNNdG41d3RLVSs5R2Nabk5GVTJkWE1uV2d6K0dD?=
 =?utf-8?B?bVRjNDBKSzJnM1FqNnBFMUllaE44QjhYVXk1blo4TWhwc3lET3ljT2gyWG9h?=
 =?utf-8?B?TllWUzN2d3ViZFFZTXFrNW9QTmNSYzl4MFhpN1ZGYVhoS0hQTTFrVVVvK09V?=
 =?utf-8?B?YTdoSmlza2ZFMnNIdjY3ZWtmM0ZYQTN3MGdiVmE0cnZ4WVkraUpVQUd5ZTB2?=
 =?utf-8?B?d0pTK0R0RG5vY2pZZSt0OGhKR1RqWHRBdWxGbzZvRit4NlQyQmsrWDMrcmk1?=
 =?utf-8?B?aHBUejBXMDJ0bG1NRDFHaDBVcEJHcTV5UytJRjFGNFp4RVF3cGFFUXByQkpx?=
 =?utf-8?B?c3k3N1UxSzV3WDZjNUg0bDBqSDBhYURuWStlYUg1KzBweFRSYlV6bUlXdUlJ?=
 =?utf-8?B?di81N2dqZWw5V2xGaFlEc2k1R2hZSmV1RGg2K2ZFdmZlUGl1Mzhkc1JnNldt?=
 =?utf-8?B?MUEwTE9VQi9zSytMMlRtZUJBZjQza29pVUU5ZjM3b00yZmNtZmZZekdvSmg0?=
 =?utf-8?B?cjRwV043Vi9WdDQ0dGdId1hWQ1V0NVB1UWpXTStsT1h0V0ltQ3A4dXNDR0E1?=
 =?utf-8?B?b29Hd3Q3aVlUTjVMdmxncEorQUpid016d1Q4VjR5M0hVKzBNcTJFell2K0lv?=
 =?utf-8?B?QVppZU5JUndrc3p5SDk5WSsxaitwSVJUTTFsZ0EwaTJXNjNlWTN0MFdBY0ZT?=
 =?utf-8?B?aDRKRkF4bldmUFljMVpxVVVBeFFTeVo2ZnNmQWo0bEtQN2VSdHdPa3IvSVZt?=
 =?utf-8?B?MmlmOVkzQXM5WXNnNk12WjRLZm82b25PcVZCT2d4V3hFVkxMUkRTNVUvNjMw?=
 =?utf-8?B?V1V2c2tvY1loTE1mUXR3Y1lhOGV2TEd3Q3JiZk54Wm43cVp4di90ak9iaERE?=
 =?utf-8?B?ZXVmbzNWUXROVkJHMGl6WHRFQ0IrUlB4a2NRN2VGOGp6dkVzYTQrdTJGNkJy?=
 =?utf-8?B?VlllbUE2YWY5RjRLa0NvWHphdXkzMTNMS1RsNngxb296UFQ4bjllRkc3NndT?=
 =?utf-8?Q?zKOeaSErR5HakZbs9WogZGKkcF7fsqkzyenJEBle8z+d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7174a0f0-b31a-45a3-8c39-08dda432ef99
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:14:43.3687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRTid4Uc8mEs75du/DSMYBXkKsS83LshEMP7XxEHTMXgJQyQvMoWQP3Dg1lTxboyRpP+GlYX4kreWmJa2bz57A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9385
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

On Wed Jun 4, 2025 at 7:24 PM JST, Danilo Krummrich wrote:
> On Wed, Jun 04, 2025 at 01:18:37PM +0900, Alexandre Courbot wrote:
>> On Wed Jun 4, 2025 at 6:14 AM JST, Lyude Paul wrote:
>> > On Wed, 2025-05-21 at 15:45 +0900, Alexandre Courbot wrote:
>> >> +                const NV_PRAMIN_SIZE: u64 =3D 0x100000;
>> >
>> > Don't leave those size constants out, they're getting lonely :C
>>=20
>> Not quite sure where I should put these; they are not used (for now)
>> anywhere else, so the relevant scope is not obvious to me. Any
>> suggestion?
>
> I assume Lyude means that you should use SZ_1M here. :)

Ahhhhh *thunderclap of Enlightenment*

Of course. Done. :)
