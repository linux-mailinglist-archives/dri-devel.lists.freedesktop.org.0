Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A34B406DB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2647610E13B;
	Tue,  2 Sep 2025 14:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D06nafsk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6D610E768;
 Tue,  2 Sep 2025 14:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgTFLgNDFxfAH+fjJYEN1FCPb3oDNX8+Ibxo1Aj9SkpomiXYjzx8OysRJESGpNEEr7WNzmG0cXNN+0mSjGj74Ve9B298R8eSkzlXe7hBt9chCmqin1MpqOmdCxP8/F/W6N16PDfZWfFEvKfh+9xfb4dr/9qDfdxqXZwsglrQI8mJBxzBUYfFHK+fpopwsitrDkZ2RzL3CPiPmHV4U2nYZhwGIpveNr3FVtfPWrFhV+cM4kH0Ja6PppOBRntHNXgfg7Dvk4kvrC4K3X6RR+E1UeelPvGIxehUhgTqgNfdThnQu2I50LYwtYM+Tl49gV+AVzZHkU/FQCBG+rZweetLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gsI7eU4oYzLEASlqrDJw38BaAytuK8PAPEutgmy3ak=;
 b=vju9WpfyzV+w9/bE1keInstUXhMGOrbJOOMrcjG7UsEfscDUsQZgk3aHIvrGNjf/jJAT3dK1+I/sydnIzwKrk6tFq5b0fXKQ93XWBzbX0An8TJzTGBCIvHvaxgLcbjSXHQTqsSxxB1U5xD/xQZF2tEbVDY2EdLY9L4W2655mQC66ej+rrqXxuUag9dW43bP+gcR8vCZgODfEtxthJoU7q+rTHIS94yUOuQ9+cX2mWfUPR5iCRo5OhKKFr9LlBFg+IkMLHlcODZrIBsaXLF5Hm0pszstDLCgtlXYTO8lELIhkhSn73+MSZgXhRzajFVycoyAFOQPKuCmwg1Pe08DZxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gsI7eU4oYzLEASlqrDJw38BaAytuK8PAPEutgmy3ak=;
 b=D06nafsk4alBtQMeLpHT8IKd2HfrNhLm6vjjqZOJbAbNclpPITpmL6T0qno8lfZOCk/ns+4shS1/OxNusmbLneltTZjltdeSGxjBgelwqYZVKH2xBwDE+g+8qHpb5v7hvtN6jmY1URCvUueEmj6tbB8JIi4FhtzsgA1R62ybwXPYexamSc+ls7zCSpSMLpkUbz5ftJo6tJu1cauxunmRTCiwGmyVZ7ETLkBZi6hITgixB9gPM/Z2pJ5LmN23IxCjJobfX2LzxL9WeWvOdXBNXlqyJYlrOHLfoBVfcI86tdlw62HXUyXDK+dAGg1UiFzOYC9f+hO4IffQFyUtO60k7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 14:32:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 14:32:13 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 02 Sep 2025 23:31:57 +0900
Subject: [PATCH v3 03/11] gpu: nova-core: add Chipset::name() method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-nova_firmware-v3-3-56854d9c5398@nvidia.com>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
In-Reply-To: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0063.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: cc37d4cc-bca1-4358-654e-08ddea2d8235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFJGQ3Uvb1kveTZoRUlYSTRXZkZKWGFyRSt1MDBUT1BlU0czNGhKcTlFS280?=
 =?utf-8?B?QkgyRktkS3dXMnM4ZC8rR1E3Qys0RFNWOXNaQU01UVR4ZTkxeUlGbXhrdjVG?=
 =?utf-8?B?U3RieU5Na2UrdHNkaXo1UU1HdGNLRDRTZGJua2NGbC9pUEJyS2ZjYlVTeE42?=
 =?utf-8?B?alNSQnllQ3JVMlZsOWwyQnZXRXJabTdaNVhWbkdvNFRtWEZ0cGR3OGR6R2tv?=
 =?utf-8?B?aTN2RmJmN2U5Qkxmc0Eva2dFMStya3o0ZHdxaHlDQVlVUi9ZNVJzV0JkWmdo?=
 =?utf-8?B?VENYK0xwNVU3bnVjd1d2SnhCQmg2MENFaHhORzZtZUlnOTJtbVFlTzljdjhZ?=
 =?utf-8?B?T3A5L3BBeFpTN3J2Nm1OOEF3dzBOV2pzNXQrOUU1Zm0yZkQraFNGb3RnTEJV?=
 =?utf-8?B?b2Jjdnc1ZFYrdFJrUkJuRVl6dDZ5eGFjMFkwVlRDMkRudFNYNTNRZHZEaE5C?=
 =?utf-8?B?ODhNbWtMSGV6Q2N1UVB5QlZmRU9Pc1h0cDBxblprbktFMVN0dm8xeG95dDcr?=
 =?utf-8?B?OEdFQlNyYjJ0U2sxR1ZQT1AvMWYxK1ZLU1VSMElXQWFKN3RkSmtWYjVlQy9a?=
 =?utf-8?B?d1p6MzBMenRyWHd1U1Zrb09HQWRjQ242K0F2bnZSQXpUS1I4OWhwaGQwUEZ6?=
 =?utf-8?B?SFI2MWhHYkFCMTN6SVRPUjhSNE9peUc2VjRURzZnS2VxQlZxVXlBYU5qT1FP?=
 =?utf-8?B?cjVMblZ1dzh4MGZOS2hrUk1mQ2hzNm8wbUxYTHZVSWY4cDNsaU9VUTZQUksx?=
 =?utf-8?B?Zm5ScFA4V3NMOTcxTUdTbEZBK1hNeUNLSHExM0U1VVZRZkhGMVUydzBIdFhH?=
 =?utf-8?B?Ym9GMnNma1FhZlJYY3ZCM1hxRHgxVkVRbk5kMHdiUFF1MW5JWXNiS2hFLytt?=
 =?utf-8?B?TkptdlBvUnYwaUZjWmU3K3ZxVlpneXFiNVNXQkR5WUVlQnR5WTkxS1dtRGR5?=
 =?utf-8?B?dUZLbmdCeUZDSUF6aWhtSzEyZGgza3pGM3YyZFplYzF6ZG1vWnlHUE15YmhO?=
 =?utf-8?B?cmNaYVpDNldVK0RiRXh0Z1FmV0hsRlBiUGFRa3IrZVlkcVZhWkY0eTAzTk1n?=
 =?utf-8?B?aFpuK0hBWEF2b2FDNDlMWkpUMzIwUEpJZm1ibnRqZ09QcWwvOGliN21ueEE0?=
 =?utf-8?B?YXJDVm43K1ZaODFEK3RCa3h5dng2UnNPRW5HdEZzRmRWRkFQSkk3UTBaaGp2?=
 =?utf-8?B?MGFuWUlkZGoyWDlIejVLdFA0bElUZms2S1ZoODF2emx2cUZQTVhZcHZkNUc5?=
 =?utf-8?B?QURyV2RiQjFONkluRkdtUlU2ZmREcUswWFczQzhSb1JzeTVHUG42REZOR0pM?=
 =?utf-8?B?T2FWQTN5RncrUnZRWHhQMnIzVjQvRTlZOSsxRU1OVnFUMkJ5Mjdpald6QjhE?=
 =?utf-8?B?aWMyTTd6OUtOSEpRTjY2WHNUVmRnTVlTK3dJNytMVW5IeHdHQjJxWTRFMjNK?=
 =?utf-8?B?cXNsTHluNExYYzkrb3M0a1BSWUpRb0dSMEt4VG8rZzBZSWV6UlpxR1RRRm9V?=
 =?utf-8?B?cUNOcWRhQTJQVkNaeTNkeSt5ZzRlb21yM012UDNTU3IydHpnYkZEVWVSblYy?=
 =?utf-8?B?L0tKNHQreDlNajkyVzFDS0JBZ1IzcmFGTDZCVmJlTTc2UWdPRnFtZEtqU0FU?=
 =?utf-8?B?empYdGJXZk1ZaTZUSFo5SXNTT0RtNVRwc040YklIY25Nd2ZtTWwzWDNFc1lU?=
 =?utf-8?B?NjZsVVFsOVJqazVVWEhrWElMbnFtS2toSWh5UmNJNmFaaW5nS2lDNXNNdnZD?=
 =?utf-8?B?WTFUb1RRN0xHVFlveklNZEJUYTdaRFE0K2NWTTY0WGROV0xtZThMTWhPVnJK?=
 =?utf-8?B?ZnM4ZFkzL05YQVhiRllmQkdYczV5RWkyUS90RlhGSVlnazJNOGZ2WW4zZUZO?=
 =?utf-8?B?RkVIRFlMK09zWjEvaURPZytkYlVYTi83WXQwUEJZbHd3cm4wNmcyVFd6ZWRq?=
 =?utf-8?B?L3ZKTklVbHYvL2QzeEQrSU1aNXUybThmTnpHVmIrN21uVGJERXYxRnBrMGpZ?=
 =?utf-8?B?Y2dEdWxSTDRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkN5SWxqcjVVTVYyTTZtWWJMcTU0azJzSjRvSjZTV0NwUDZvZW9PdkxsUURM?=
 =?utf-8?B?b3UwdGFTVUxVNXdkcjZUZVJKVENOU3RibVF5Vkx4bnFoNzN3U0krYkxHQzNm?=
 =?utf-8?B?d1UzSkl1ejVqajhZSUtKbTNTRERYVUlVRWFKS1J2THJyRGsvaVYrRFZUVVJ2?=
 =?utf-8?B?RjZSSWJLaXRmQ3NXb3Y4VHY3eTY4SzR2ZjFIQmg4Rit0cmZDNHQ4RWJDa1Br?=
 =?utf-8?B?M05kdUFnSllncFd6amFZM2tGU2ptUUF1dllqY1c5RUZ5YXNjSnI1WER5a0Ny?=
 =?utf-8?B?SVZ6YW1zM3E2K2FMQTJaN1Y3eXFVZU5DTDJ4Y0ZWOHB6TGNpREZnVWJjMnVv?=
 =?utf-8?B?MFQxWEJJN3VZUk94T0QzeTVySGFlNnFaaFIweHh4VkFDNWR2eXVMNzRNQy94?=
 =?utf-8?B?UWExY3IySEJTN2JsYzQ5R05vRnJmSGtHdmR5OHMxSDREcFRSckZCTkRJMkFw?=
 =?utf-8?B?NlRNTm9DT2dmTlVBWTBPYmdYcnJWMDA5N3h0TDIwRGlReElNSDZSdDVaT3ZG?=
 =?utf-8?B?d2h1T0xNZFJJVDlySThDWjdEOW4yTkZmUlg1R2VUMXR5bDFYOU41L1ZaVGFS?=
 =?utf-8?B?SlE1eXBXdi92bUhUc1VYb2szKzJ5enpuTkpWRW0rV20xQ0k2enRidmdwSjU4?=
 =?utf-8?B?QkwvbDU2MEM1ZlVqbzVDUjB5NForcE1CWnFNMzRhYklRcWZybGtRVFNDZStG?=
 =?utf-8?B?K3hsaHJ4NGV3UVhSRlNPRkNrSFJLWWF3YTJQY3dTUFlYT3RUVlRBbXVKaTVV?=
 =?utf-8?B?N1phQ3NWTzIvV0Znd3VqV0xGUmFjSHBlQ2ppQm9RYnFZL3pTYVFrN1J1Sy85?=
 =?utf-8?B?cU5sdGFnN3M4LzlpZCt2SjB6MHliZ24veUZWaDRMMGpiLzE0cTBKck53Z0FB?=
 =?utf-8?B?OWpvbUhlV09DT1oyeDNPeThQVmVRMGVSQWlQck94QkNlSlkvbTVVZ1Q2QkV0?=
 =?utf-8?B?am5CZTBaWjQ2ZTNKNWlvMGtoQ1FZOG5UWDMzTWkvTmFaSjVPQnBnZy94WkJy?=
 =?utf-8?B?YVVUUEx6VUVWOHRQRDBITWZ5dXc3bXBBWEo4dmVIdTNKcmdqU1ErT2EvdFFR?=
 =?utf-8?B?SEQvSlVMdlNQSlJYOXk2R3pXRjRCeS96YW12b3pTdWl0T0R2V3h3UllhMkZK?=
 =?utf-8?B?YlRaOWpxNEtPelJ3aU90M0UrcjdqVEF6Y3duSkNmR3ZLTTVlMHBGWHlLaDJ0?=
 =?utf-8?B?RW9aNUJCNjhMa1NWVTJabXNOM3hMdENZUEo3OWVNNVdWcXdXYWlEZ2ZpMlZL?=
 =?utf-8?B?OXlFUG1NVldYdm1MZ1I2M29oaGNqSzVNVFZWd0NqUnoxUlI2V0RSVEFlTUxs?=
 =?utf-8?B?WldYd0hMTjR3a3dRdHBLUGdETVNnK2FocWM0ekU2UXhWV1IzQm9GcWloa2Jx?=
 =?utf-8?B?cTl5MlVHWitOUTJxRnpGSkFTTzBrRmNzbDFYZXJhelRaS2hpODRwQWVFU3ND?=
 =?utf-8?B?OW1Zemg5VjZ4NnZmTkdpNWIwRS9oWmJJT3RYMEN5MG5BUHZsOVlTbDVWbjFl?=
 =?utf-8?B?ZFdIWlBISWpiNmFjTjRBR1c5RmVEV3pTRFpJMUxNbS93NnlHR3M0dUU4eVM1?=
 =?utf-8?B?alhKZnFEekNuUkF0SHFDTVVyS2NKeFZsU29lQ0FIN0xhVlJJT2UvUEYrZnRz?=
 =?utf-8?B?ZGF5U1NSTndQVXVqM1FYQ0JoQ2lUTFEzYXRuMEE3d3ZSaHhLUkZMUHhxalRO?=
 =?utf-8?B?WVh0elpycC9yNm5aLy9JY1NRUWt3VTlsUFBidzFudEwwblI4bEVKaXh4TGgz?=
 =?utf-8?B?SlFLOHlnMGV6WU03RFVpRzNwRDZFL05uODZUNm1LOE96MDBSamQvU3VpRURu?=
 =?utf-8?B?ZzRZYzQ0dkJZOTZNT3hkdGUrWEFRU2duMWZvYnRxcEhDT0tYcGY0MzhGKy91?=
 =?utf-8?B?SXp5WXNqVnVDTWFFSUpCUUYyU0dnK2R2eWpSRzNVQlA5V3N2RVQ3ekt5aGJy?=
 =?utf-8?B?b1dpU2ZmdDJCVXFFMWRDNkxKc3ZWK1NkZDlXUjVwMW9jS1V1eUp5TU1OcSt6?=
 =?utf-8?B?TGcvMFVzcHJtNFUvdnJjanpBQ1VFTDBielhySkwwTHJWTDVNZkVoUnZ4NVdP?=
 =?utf-8?B?WStRYzFqRGh5cHBwWmZzQlBJc3hybEcrU1ZObk5NaEZCcjByN3V4ZVNLdmJS?=
 =?utf-8?B?emQ2VytKUGx5TG8zeE50QlBaUEI5eVJNOG50bVFsRXlOck5CcnpCZzlyUVI5?=
 =?utf-8?Q?fCaA39OU30/jChUNXGnquoZ4Ibs+jJwIoFi74AtFHYfK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc37d4cc-bca1-4358-654e-08ddea2d8235
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:32:13.7773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrDzXkB4gOlQ6pgD8/1Rd1JPbZGgRMPu1EE1s3YHxjRxixAbCY7Km2Lu4I9rIhIcM3u7qbTtToYU0vwdiX7+gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

There are a few cases where we need the lowercase name of a given
chipset, notably to resolve firmware files paths for dynamic loading or
to build the module information.

So far, we relied on a static `NAMES` array for the latter, and some
CString hackery for the former.

Replace both with a new `name` const method that returns the lowercase
name of a chipset instance. We can generate it using the `paste!` macro.

Using this method removes the need to create a `CString` when loading
firmware, and lets us remove a couple of utility functions that now have
no user.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  8 +++-----
 drivers/gpu/nova-core/gpu.rs      | 25 +++++++++++++++++--------
 drivers/gpu/nova-core/util.rs     | 20 --------------------
 3 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2931912ddba0ea1fe6d027ccec70b39cdb40344a..213d4506a53f83e7474861f6f81f033a9760fb61 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -30,9 +30,7 @@ pub(crate) struct Firmware {
 
 impl Firmware {
     pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
-        let mut chip_name = CString::try_from_fmt(fmt!("{chipset}"))?;
-        chip_name.make_ascii_lowercase();
-        let chip_name = &*chip_name;
+        let chip_name = chipset.name();
 
         let request = |name_| {
             CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name_}-{ver}.bin"))
@@ -180,8 +178,8 @@ pub(crate) const fn create(
         let mut this = Self(firmware::ModInfoBuilder::new(module_name));
         let mut i = 0;
 
-        while i < gpu::Chipset::NAMES.len() {
-            this = this.make_entry_chipset(gpu::Chipset::NAMES[i]);
+        while i < gpu::Chipset::ALL.len() {
+            this = this.make_entry_chipset(gpu::Chipset::ALL[i].name());
             i += 1;
         }
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8343276e52e6a87a8ff1aff9fc484e00d4b57417..709afbe56c7f3b713bb249a022d68d81783d36f5 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -10,7 +10,6 @@
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::regs;
-use crate::util;
 use crate::vbios::Vbios;
 use core::fmt;
 
@@ -28,13 +27,23 @@ impl Chipset {
                 $( Chipset::$variant, )*
             ];
 
-            pub(crate) const NAMES: [&'static str; Self::ALL.len()] = [
-                $( util::const_bytes_to_str(
-                        util::to_lowercase_bytes::<{ stringify!($variant).len() }>(
-                            stringify!($variant)
-                        ).as_slice()
-                ), )*
-            ];
+            ::kernel::macros::paste!(
+            /// Returns the name of this chipset, in lowercase.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            /// let chipset = Chipset::GA102;
+            /// assert_eq!(chipset.name(), "ga102");
+            /// ```
+            pub(crate) const fn name(&self) -> &'static str {
+                match *self {
+                $(
+                    Chipset::$variant => stringify!([<$variant:lower>]),
+                )*
+                }
+            }
+            );
         }
 
         // TODO[FPRI]: replace with something like derive(FromPrimitive)
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 76cedf3710d7bb248f62ed50381a70f8ffb3f19a..bf35f00cb732ee4fa6644854718a0ad99051666a 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -3,26 +3,6 @@
 use kernel::prelude::*;
 use kernel::time::{Delta, Instant, Monotonic};
 
-pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
-    let src = s.as_bytes();
-    let mut dst = [0; N];
-    let mut i = 0;
-
-    while i < src.len() && i < N {
-        dst[i] = (src[i] as char).to_ascii_lowercase() as u8;
-        i += 1;
-    }
-
-    dst
-}
-
-pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
-    match core::str::from_utf8(bytes) {
-        Ok(string) => string,
-        Err(_) => kernel::build_error!("Bytes are not valid UTF-8."),
-    }
-}
-
 /// Wait until `cond` is true or `timeout` elapsed.
 ///
 /// When `cond` evaluates to `Some`, its return value is returned.

-- 
2.51.0

