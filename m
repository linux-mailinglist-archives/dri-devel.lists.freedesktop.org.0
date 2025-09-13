Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B62B56171
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E0510E212;
	Sat, 13 Sep 2025 14:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fe1587nO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E8110E212;
 Sat, 13 Sep 2025 14:12:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5DwxM2YmM3iSwzodMq+mMOmDQ6YeaCjAJLtC7woRDH8ABPw1DVGDCXekPZqU7K4qgiXgo5Pfg9JsNd65a7c1tE0G9l5UIx2imkWdCC8tT7qL1pZAyZhgJZcY/8AxTlAOqZQJpOAlkJ6FkRxvK6TX7zuxslwOjoBgSovCb7i1kPkgXnJj/YsTyAGlAO5GYaaoTDzRkV1dh+eGyEKHeKGy4TvZwWTYj0slQGQAQ0r10Z+f8o4P2lpAyMibQBETd9MnHuCCwy36hPowlwcp5OWPnWsAwy065Zu/mk/+6IclC5zjN33oYai1cA58fqnRBLVEqtWE0u0Jfn1trNVtSpbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8l8BAod807px6u9UViJcKR3PMu/XHQVwRa3C0oT2XLI=;
 b=AHB4umTPGtCELDjBDN/5p/8SBsYoec0AkWYkO6iYM4j20Mh3lUbTZzirWTf+OwnrE7IXB1M9Kb2snddtc7Y6eM52r+1vIwww6Cl58etM7DW2sDtjbd+84b9yK3UJf31t+xHF916UOAngvO4dwZDQmQgBE+kx5PV/SpUh/cbQJ49KnOYnT/8zwWpfsYeRtKxZ7Yhv+Zeh5T4LVoF9mv4sqFFq4J2EKYJruJm8PblZAo9tFT8Pir/UQxA31mlwgkqRJyoFjgr82K8AHAlhQMJGUKPMqw6uzoWi1vrVxKYI0nJ3+4/kEJ0NatrYMeIO5CudeWAICm4nkMIl1QCCoVTE2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8l8BAod807px6u9UViJcKR3PMu/XHQVwRa3C0oT2XLI=;
 b=Fe1587nOXX6UjzV8t2pi3MVnObgWqTPBDIBiiuhAvZJcLdkZkXl6fgVzQT11IKyKMrACcHU+7j50dzrilbDKbCdQrv3pLJ8Sg3Ujs7h04I/IRAL/VnW9hQFP1+hf5KQ3NsI2MURCfQCrSextOYJwE6j1TVIygJceo++q1+b0epkFdR/cTf+ccECTrgHeoTOx25RSpxSHmpkrGV0T2tc3xUIXplTuHCGH41vjbZmuV+olJ2G7T2jOgShbXIxBX/sN6SPyMI7rLVodMlbzZlBoYAGqy+3a7HQCnXzRI2gLtiyh4Q6qRyxFCg68r3Y51DDiLjcDnMb/JOUWQFEWG6gIUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 14:12:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:12:52 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 13 Sep 2025 23:12:22 +0900
Subject: [PATCH v6 09/11] gpu: nova-core: firmware: use 570.144 firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nova_firmware-v6-9-9007079548b0@nvidia.com>
References: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
In-Reply-To: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: e83bab36-0290-4b96-0159-08ddf2cfa0d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ukd5WjNOVzg3V3hxYVVPY3p3ZUgrQ21SdVFLU28rZlkwUTJHL3ZUdlhzZm56?=
 =?utf-8?B?eHhUSmVTYThybzhvK241V2owNFUzV3YyRGxuZzJrbmZXakcxcGdTUTNLbXds?=
 =?utf-8?B?cndwWHBPdXVUN2EzQ0pyVGJQWTRvVnEzNDl3Qk03SVdNUEgxWGlPVEZaTWh6?=
 =?utf-8?B?V202QlJVZ2RKL1pIWGRLSHR0UXoxM3N4Y0NGcTc0MytCQWg0YXFlb205Tlg3?=
 =?utf-8?B?Uy9hY3c0RmhwM2ZZRWZFaFJYditkNnNNVzVVQVoxdHVYT1JvcEJLTEFVVkQw?=
 =?utf-8?B?VTZMbTdnUXE4SGJYeHUzdjgwcVJWcjRyRmx4R1hKKzVDTGVESDdBSjVlMVdh?=
 =?utf-8?B?MDlOZVhjMjZsaW9qbXEwRkhJTnAyN2o0MTZQLzN2bXFqd1lXSU5NWENKNith?=
 =?utf-8?B?VXljRmE3bE1GYkVkMTAyT0Qrcm5LK2N6WldJc2RWbUNIcXlqVjhDVE5mYUV3?=
 =?utf-8?B?ckJBY2U3WHh2NU4xV2MyQitjTUdOUzlaT3JxMUo0TEtKTkliZklSc0NVMUtR?=
 =?utf-8?B?Ri8yRUM4YVp3R3FpYXg2L0xEb1dRN0tkaVhsWEhkTTNlMmRzdER3L1FyU2d6?=
 =?utf-8?B?M3p5SkZzbmpnUUc5UG9QU1hmRFVQVm8xWkN6YlZYN3FKSFQrdkdRSmUyZlJK?=
 =?utf-8?B?aXNkOXZTRXovaGY3TzM1RXl5Rlpad3JwUm8rT0pRWkxFUFZUY0U0YXZBblJ1?=
 =?utf-8?B?cm1BTCt5Z1V3akVZNW1wQUd3WkNpVDVraE4yUDMxTVlabkhsYXVjQlBKYWZ3?=
 =?utf-8?B?S3NkeFlJRkl4c2I0YTBDSTNlR2hwRjlwRHNrT3A0U1VwYy9nS0dsTmErNUdl?=
 =?utf-8?B?RThPMS9tNXBOUGlLeG1jV2VTaDdqOXFORlIxODc0ZG5UdXFWRTVBMkJoQXov?=
 =?utf-8?B?TngwV3Mrc1pXOHFQelF6SEtwblJjQWQ2TzJXd3VWN0tYM244R0xOZXpJRGJG?=
 =?utf-8?B?dm9Zc3haK01nei84OFpuYksxUUsrR0JLWFU1Qm51TTQ0ZWZWd1VKMGw1L3VY?=
 =?utf-8?B?dU5ZQldyMDYrOW16RG9kNXRGVXdMdkVTM0h3Nks2Q3NrS1U1eEFCRFNnMXlv?=
 =?utf-8?B?NWNUcXFENlRBcTNkS2ZaekJtaHZNSmxoYVJTUjg4WEowRTl5SjYybmtFZEUx?=
 =?utf-8?B?Ui9peDU3c1UvSm9MaC90SUZWR29FK3lYZm5QeE1nWTdSUlc2YVRNNFVlYnF4?=
 =?utf-8?B?MWs0SkxCSXEzaDdCSFl0amw0OG8rUXd3L1M0bzRWQWxacVNTU1ZnNEp4MXNK?=
 =?utf-8?B?WC9TZURidDEvMldacUNtQTUzN0pqRk96dlhNcjdYc0ZhejlxVDdtQzJlUjgy?=
 =?utf-8?B?WE1WWER1OEpaWU4vejJUUDR1YTlBZzFpK2o2Uk1mV1Vib3NlTWJadVdFa3Z2?=
 =?utf-8?B?WjBTanR2UlpsVUtTYVBYdStvbXBhTUpoVXcySjR0ZStOdGxXd3UxWDFDMVRV?=
 =?utf-8?B?ME1zQ3FQaGRIT0ZXektiNEhQaXVFbE1sMllNRy9vNXNGcGgwNnRwRkFIeWVE?=
 =?utf-8?B?RVJ3bGo5eFFYczQ3cmNycTNOdHlra0wvcHY4UURjZ0cyQUhrT1ZyZ0F4QlBK?=
 =?utf-8?B?dkpzQWREQXdzcnpESStoWVllS0g2em5UTW4zSzNFV3lIMngxWC8zZHVWMnR3?=
 =?utf-8?B?SDUwNGd1Z0R6c2hiQUU0eHBBeGxVaHVGYVpRMVY5VFJHcVBYRk4yK21yUStq?=
 =?utf-8?B?RlJIaGEzNkF4NzM1Q1BsMmJQNGJUWmJOTFNxYUluU05QZ2EzRWVMWHh4bGRL?=
 =?utf-8?B?Z3pWNEJtMktlZWhzWTd2WlVDL3oxazlUMDNUeFQ2dEFJN2lTZ010MEpZc3A3?=
 =?utf-8?B?Wmhrd0l5cElaN1RtL3Vqb1pJZmV2aHU0UE5hbVd2MVNVMzRuRGlNLzM5SWFx?=
 =?utf-8?B?OVM4aENHM0J2SkpuVFpSL3lpWnhpMnFaTnB1VzJWZFViM0pOMGhFYklRS3Bo?=
 =?utf-8?B?QnNpZE81ZWkxSUgvcURIRFdmdDJ2T21HcEROc3RSTEFLVTYwRzBNVHBMLzJC?=
 =?utf-8?B?QkYrWlhpL2l3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHJaa09TZDZ2UGhWRlhNMDdkdUtCbm5WRTFMakRqTDl3ZHJJa2p6RjRybVBz?=
 =?utf-8?B?aVFLV2IzSXhqd29sTXFIR2dPRHBMSjB4RDZ3enBwNGFPVTh3c2lXUHNxaVZs?=
 =?utf-8?B?WXdBQjNaaFBKYXBpNkg2U0xMKzROWk9TTWZLbXp0MU11SDAyY1BiUVltR29r?=
 =?utf-8?B?OXFseHBUT2pWVzB2ZHJVWVV4NkNOb25HNkEvZER2WGVDNXlBdkhuKzI0Zis3?=
 =?utf-8?B?czFjVERBVHAxTjBKcGp5dW1jRDNHd1hVNHhOc1hMU2w3VWZMQTEvSUt3Z2li?=
 =?utf-8?B?SjRjQlZiUHg1ZTZIY1FIa1cvNUtGMVhObjYyYWVDck8weVdKREIxeHBXd0pW?=
 =?utf-8?B?SEhaN3RBY25KWXozL1JscHJqcU94UkVQVy8rUnQvZ01uMzFxalhtL1JjdUtt?=
 =?utf-8?B?VnE1SVd4eDhGS1gzbVpxZVV6RGxtWjB5NU9acUhtTEdYWUtveUEzdmNCQnVX?=
 =?utf-8?B?eDIvYitma2haTEF1dEVpWWc1b0I3UTRveTZOQzNoRXlUM2FCNWM1dWtuMTZu?=
 =?utf-8?B?NzJ6cmtCOHV2UXNudXlabjBHL20xaHZvRWlrUEFVdWQ0OU45NzJYVmxYa2g1?=
 =?utf-8?B?azNURE0ybkg4bm9ORUJyeGp6ejFwMU85dzdIV2pDMVdYem9BZ2V3WXdrM3R3?=
 =?utf-8?B?L09VbjQ2M2QzZ1NGYUJHVVJvWTZTZXpUTDkrQVpGRi92THp5K2ZjcitWMk9p?=
 =?utf-8?B?NStuN1M4M0lTT2xyQ21YSSswNXFFZURXZnFic0NnL0piVDU2NzdkZW5JMmFr?=
 =?utf-8?B?UllidXU4Uk02bldjb1BldGF3M2ZUTFpNMnZuem1SbTRHZHdLZ2J6T3R2TkxN?=
 =?utf-8?B?cit3RUF5aUEwNWt2VjNjbUJ2WEVJYUNUMTJhNUpxOE84dEhPMGM3QVB2UVE4?=
 =?utf-8?B?RXZIRlg1ZFpaRGo3aEpnMURFaEdISkZPOE95QzFZbFZtZXBaSnFUMGs4RjZr?=
 =?utf-8?B?aUxoUEVmSktqQzV3N0Evem4xRVY3ZVJ0bHFVWFBNanZnVFZxa1oyWGppR0FT?=
 =?utf-8?B?cmhUb3NlT2pLVWh2OGFjbUZsVFE0TFNVMzgvRVhlZmVvc2JHckM5SFlnTFdX?=
 =?utf-8?B?bEVGdGQ1dUpUNDB2czRPem90TXlEeVNUb1pELzE2NHorL0NpT2lDWWVBZGln?=
 =?utf-8?B?K01wMEhZeVBKVzZCcmh1dXlxODJyTWJNekZBdnpUT3VEbUJUaC9sNHVyOGhD?=
 =?utf-8?B?OGJFNzBFK0c5WHlJZU5mRFV0TklIU0VrNjFpK0FCM1ozdGRIL05ROCtDSTRs?=
 =?utf-8?B?ZkRmbTBXSU4rdXFyWjFWU3pXTlRvaTN2UTJKN2Y0bmFaSlFLYmE0NUlLQnl3?=
 =?utf-8?B?Z1M4K3ZKd1pyTEV6YldVU2U1SkVLaEZTc2FhSmhVWUk2U2Q1ejZ6cklMT1Fs?=
 =?utf-8?B?dENzY3BHVzFxSzFLdi9tWGliZ21kZ0FRWmh3QksvNlJxWmJPMEk0Mi9HbW5h?=
 =?utf-8?B?WjBwcDRHZEZJdmtyMWNjZTdGUGtXZ0xBUnBhZUNHQWFCRlQ3RHFOV2IrVXNI?=
 =?utf-8?B?bzQ1eXVSdHRKQUN1RWRYTC9renBmYVhJMzZQREhUQ2gza0VxNUZkakpHNlBo?=
 =?utf-8?B?cXVRTHM0bDRNVXpGMHlHM0E0V0VSRFRUS0ZmWjFaQklHOWpnOHh5SG5EdU5y?=
 =?utf-8?B?SFFDSm5uWmhKNFFtN0pWUHF1RWgxcjV6dlY5enViRGhTTjlhOE54UzcrMmh5?=
 =?utf-8?B?OGVVMXFSMWhIUHRCdGFiN1MzNkVDVzMrZ2swWTFKWlZVc1RRQWZCR2ZxUG5N?=
 =?utf-8?B?SDRoOFVvZ2hiU285bU1iRzZsdThjQWRodWhLVUFFK3JSNnFjeXdKTEhQZXc5?=
 =?utf-8?B?aVZHMmN2c0FTTDRIck9zUUg3b3h1bkJ6Um5RRW1uMWZSekVMZFdmakVQQVR5?=
 =?utf-8?B?M3laMGhhMytGUHVqekpTRTJBQ3FvVmM0SFhRVzdwVDJtSlllL3R2YkhkKzJ0?=
 =?utf-8?B?bmZsQ3pBaUViSXRKN1Q0NENZUmxvMlFSRjY0K29taXZYUHYzTk1yajF4amM3?=
 =?utf-8?B?bFoyZ0RXV25ocE4wbGhNS1NNblZQS1VQVlJSbGVLcUc0a2FXdlgrNGtqbWcx?=
 =?utf-8?B?Tk9jeWZrSXVtR0xBWEJnVUlkbmhnZ0d3ZFhTcmNFQXY4T0NYaDY1c2VFU09P?=
 =?utf-8?B?cmRWTXVBMERENnZBbWdLVElKTEdnNUsyalhSdDNnalA4cmE1dlBFeUxsWGhN?=
 =?utf-8?Q?YSdRsscYhx3d9hj/GmEk4oqwjG1uVcJWAPmvtOPV9eoN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83bab36-0290-4b96-0159-08ddf2cfa0d7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:12:52.8300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEMLEJzafQcZQeuGX8D/5lKYhZC9cGb9yd/1T7sNjorB5RjIyzK4gQp+/an5GnYEB6PDqcipTfhJnicHJb3PYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9583
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
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index dc9645a789b0b542ebd1adb4a8c19ba089bbc931..4179a74a234215350b9f218770a93e9c549a3889 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -21,7 +21,7 @@
 pub(crate) mod gsp;
 pub(crate) mod riscv;
 
-pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
+pub(crate) const FIRMWARE_VERSION: &str = "570.144";
 
 /// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
 fn request_firmware(

-- 
2.51.0

