Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900FCAB8055
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 10:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1EE10E7C1;
	Thu, 15 May 2025 08:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l2uuupcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9121610E7C0;
 Thu, 15 May 2025 08:23:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gp1dVZLQ+Hrv0gcIxW1dSMgvXuv6yI4+XfR4cG4JpuHrs8QaQ5SfpHnJ9s1hXT62SOn2DE0cdkwmIp2Sh9xBp0gE26RngRCK4wMi8gr8sG6EL5kPN0Kk4+mSbrtER/3fIpDdbTGSReECPBGhK/1iuVUDF+rUfK5N6T7/bAL3HFhHSQE47j24ZiCHS3w85sirVW3VyRY/gX9lsru8VHdPdW9h968LgRyfnXSkYPHSpjfIYg2wmwqkwBXsZ+UHS8wEoaCCK4BLpm/BHoLrxU8LxlUHjCvyfNa3g1DO4NBbcpl2f5fuTil9e1LrpN+xbIjFs0WEM3DG7OnmoZ/+vtfRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJEhc25Md+n8d7AZvk3aqBZEePOZ8UB5/TsHkSq8cnU=;
 b=XBOaowOHBkkFzMzVX2xNna4N0NChOgOWBI4bUZyBiAfW4zGe1nOJi88plCNshl12JzSIqKvbRuPYUVC2Du3Swbis/azusHLhapswP6lVUSV6oqegA0ulba9d7qRbYIpIgxJw9vGjFIJla7ngtfL9BnGzHiKeYzSXBSv/BiLzINM1cJHxY3j2AdtY9dCkhGhlV+tcUvxuVsWNnSb1c/+szIeMg5knAg59v2xf5cuyBy+9LPVBDTqAqt40XyYtNdFYmvZeT88GEyymX0rzCKznOjvc9SEZeM4gfmFqE6o0HkgK3Z5l+aSoidHkuVrpLfzyaiCpXHXIqwrn8EWWzKA0XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJEhc25Md+n8d7AZvk3aqBZEePOZ8UB5/TsHkSq8cnU=;
 b=l2uuupcb3vM1EJR3TDAs+s5bEYF5b7EkNskPmKtK4o0YrUQm99HAJfC2ud4OT0ZpZtSM6C+lOQKwXgYOAO2RUfYyo7fpbPXNWKFRzd99UZj+hx+SIigFqFwBIf3V8aal+KkEzo78RroVIbxsk0IWNmuX1gbXtjKmqQ9LatDtFDDHfGQI9AydtuTu15ltqTsiwnUmifIhGbNN+B6Oxn51fKAd3AFlgF7YilHAeD20fparNjMV44aQPmG0E9mEOya8MJhP5TXC/mB8xkYLP1+xaLt2zrCHRwnaAtmAfziVYqpUYTRZg5Uri7bvpAepPTiv2Stke8p1ZZPFqGWe+3SYOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 08:23:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 08:23:36 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 15 May 2025 17:23:20 +0900
Subject: [PATCH v2 3/3] gpu: drm: nova: select AUXILIARY_BUS instead of
 depending on it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-aux_bus-v2-3-47c70f96ae9b@nvidia.com>
References: <20250515-aux_bus-v2-0-47c70f96ae9b@nvidia.com>
In-Reply-To: <20250515-aux_bus-v2-0-47c70f96ae9b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY4P286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 7096d271-06ea-49fd-37db-08dd9389ca17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NG9Zc3MwbzVOVk9aSnRqcTZkMmd5ekw1T2Q1YnIxRGlVQlh5UnZQZFJHUjho?=
 =?utf-8?B?OG9XVk01RHZnazVQT1hQOHpRN0lrK3I4UDNQY3pjRUo4MUdOQkgyVGlIbkdO?=
 =?utf-8?B?QUVJSDBxZ2hLcG4yQzA0eEZiR2hGTkNjYmlGd2poMWkzVkFUMEFiaHpJSHMv?=
 =?utf-8?B?ZWZPL1pwSjd5Q1dWc0pxOUk1ZmlLc2ZGcVlKMnJnbDZWUnYrOExUaGlyWVR4?=
 =?utf-8?B?THV2STkzZ01aMWdmMkQvbWloVmovKzNpT0tWVzVaOXljU2FkNjRGaGVFOHVR?=
 =?utf-8?B?eHRLRTVCUlR5bWFHOWRKTVRNY1NyR0tKb0VCTGNoSGxBUWp1NTVUdm9iNFNT?=
 =?utf-8?B?b01OWllhRTUyS0tXTitwQXJNbTlURnM4RDlOWFdMWVpIbzJmRmZjNFJGTkxs?=
 =?utf-8?B?cWZSWngyYzNPc2V2S09rem1tS3JGQjhKYldwc0lUNlpXV280ZkJTZWxHVS90?=
 =?utf-8?B?ZkRUVW1uNVRYY1padlFJMFRhK3pRekVVeDhqcy93VStCZjVSUytSc1hLQTI3?=
 =?utf-8?B?ZVV0WHBlN3dKUTBJWTlsM3dKRXkzZG4yLzBPSmUwSkdnTFZZZmtzYTcxaXhC?=
 =?utf-8?B?SS9iZU1tczhwWDdOSG1EVi9YSmRnWmxVYTFiemRucXpWdG9DWWVNMVpKbHVk?=
 =?utf-8?B?Mnp5L0RYNElzOWtpdUl6eE9Rc3VyM0pBeklmWnZsVlhKVFpzNG9CZ1NHaGcx?=
 =?utf-8?B?SGhGa1B3RGhSTUZqUjltNURVVDUvR0FuQmtvejgwU0VRcXdNblEzemtIT0Zo?=
 =?utf-8?B?ckhnOVBydFFSMmpBTVorVG9LTk5KU1IyMGtyVWQvTzZFYXg1amV3V2ZxNng1?=
 =?utf-8?B?NWdjV3g3VDFmWXd5WXR4NjliTlUycGF1VFFEZW9WSWxnUWVUQTJrYjVPWDVD?=
 =?utf-8?B?dGd6NWtBY0t5YTJRbUR4N3hxWllnbmVUSTIxYlJ6TDl2c0hDZjl4dG5ZOHFm?=
 =?utf-8?B?UVU0a0l0NTdhd2RRUTBHYStFbkkrSWw1UXhDRGtNZzJ3M3NtdlB6Y0RicnZO?=
 =?utf-8?B?Q2MyRkd2aVh4QWJjSFVlZEMvYVZnSVlzQlhlYUxjSFo2TlA2R05ZWkt2TjBl?=
 =?utf-8?B?bml2eHRGd1Q2dHpxb0tjZ0xOSVdZN3ROVi9OZWVFQkFsR0N1TGZYY2pCY0lw?=
 =?utf-8?B?bjhTSmhWM2w4V2UwbWlYbVNJRzJPbHVCeW5YL29jdzlyekJJbnFzeXN0d1NF?=
 =?utf-8?B?eTJyNWNwL2hsQjhxRHQ0V1BGTmVTazZqWHRNL3BYMDZQVE9MK3p1clBJZmU1?=
 =?utf-8?B?OUNtWldRV3owRGNkR1pQd0JDQmZkbUNhSTNqYUNNd0FnaDRkeGxjWXNiM09a?=
 =?utf-8?B?TmEwUGx6aTQydkthOTlHVnk2ZmZaQ1RHTEdUTVY2OHhlZ3krTVVZcXdRNFRu?=
 =?utf-8?B?VHZzLzdYRTlGVXo5dDhIOWMxVHlmQ1FWZEVDQjBRb0FIWXlaM2xpR0JKb2pT?=
 =?utf-8?B?d3k3cE5haHF2ZkFPQTVLWDl1ZmdpaUN0WE9odFlIaXRQc1U4eS9wZVBybk5a?=
 =?utf-8?B?aktCQ2RBaHpyUGYzNU92RWZ6R2FwVzZlWGN2TWhjV2lGUFh6Rk5OTzhEQnpr?=
 =?utf-8?B?WEVobG5aU3VYWHZqOHQ3ZWZTN1dWbTBkSm9PMzg4Y1UyOENaMmdER1lFc0hN?=
 =?utf-8?B?SmVncUQrNWpYVUxqeDVQbTRKT01XNWtxNDVpODlpYllhaW5RcjJEVWFnUm1U?=
 =?utf-8?B?QzlYWVZQblNacDUxcUVGbHhVak1GaExmVUJSVGJKWFRrVTRVUnROTGZPZFV3?=
 =?utf-8?B?U3R0c1RXblludG1BRWRaMFhwMEg3cnIxMTZJUUQ1L1BXT3JmQzB6QitxTzEw?=
 =?utf-8?B?eStSQnZrTnd5a0pza3ZoR21Wc0p5UlZHcVV2dk5zdHY5WitsOGRhYU1ycE5m?=
 =?utf-8?B?b1hiZW43V3ZvRDNpVXVOVlFhU1UwaXZESHFaWWRXUEpxbnp4cGU0UVlCVlh1?=
 =?utf-8?B?NktPZVd5ZWk5OXZCdmNpb3pZQVJ5UjZvczlFYStZU1lnampPN3ZiTEt3SThE?=
 =?utf-8?B?eHRkRUt0QzBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE1wSjNNL1k3OW11a2g0NUF4VEtBNVJBRzNHdTc0ZDdUTm9XWitXaEpLRXd6?=
 =?utf-8?B?b2Vib213SlAvTTBFY0VmK1dNRzdtT1RwVmFVRUtvekpBRWZzeGhpYVBwUEZT?=
 =?utf-8?B?bDdXL1dHbU1MUllBeFpIMHFQT2c5N0RjS0x0dTRBWU5idlZsVW43NXVLN25m?=
 =?utf-8?B?cEJ2cXNCeFhXamhVY0x6bUlsQ0ZRZ21jRzBYYVYydmdGK1FaMWtxendvMGVG?=
 =?utf-8?B?NEVWNFB3YUU5NE9UK0JUNGNkbCtSZ2ZZcUhGQnhHQnh4Mnh6eTI0eDMzOVNz?=
 =?utf-8?B?NlJrVFdNVytwQS9FaE5KQ3VhZGU0Q2I2Nk1GeUxjVlNMcnJ0VkVxQXpTMElu?=
 =?utf-8?B?TTlBU3BPN1Rrd1dwR1RtTHdBVmVkRlNBN1F0RDFFKzhJU3dHSmtYSWlZNFcy?=
 =?utf-8?B?YjBLbVp3M1Zqc2xkU0htSnJva1ZLdVVWSnJsczZsUVA5QWhSMXRlS2pKdkZW?=
 =?utf-8?B?Z0VaVGxRUEM0UWp6ZkZMUXJjM0EzS3Vza0VaWFdkQytJbHc3aVdTZnBZdjcw?=
 =?utf-8?B?ME1pRU5OVW91bjBJM21QMEgzWFF6N1A2K3prTVlFM2Evemcxam8yMXFOTmRN?=
 =?utf-8?B?T1VBWWpzd2ZkZWsyd1d1K0w1anVZZ2RoNytKN1d0L1RCK2k5V3FKb2ttQWhO?=
 =?utf-8?B?Z0RXL2F0WXJxRXlyQ2FHTEJEWnZOb3A2SGdLLzhsU0JqY2JtT3d4M1lERElx?=
 =?utf-8?B?cWhpRk5nMHN2R3JmNnYvcGFQTGFxOWVxQXhrMkFjeGdOS1VySXV2OUxaN1d1?=
 =?utf-8?B?Y1JEUHErVHl6REh2Vkx6UEx6YzhNSUl3T0dOSWVBVFVKc0FVeU5ReVB4Y0Nj?=
 =?utf-8?B?c2QyYzF6M1FldktFWk4zUCtQNDJZQUdmWHRYcEFjT3gvMTh6SHN6WmozOEVG?=
 =?utf-8?B?WmFiSmNvNG54S0JNRmhMYk1rVkNpb1N1Vjl0Z2VVVU51Z0FPcVVFVk9WYVp2?=
 =?utf-8?B?cmU3NGRmdEQ2eDRxQTR2Y0ZTeE51ajRnaDR5bmhMVC9ZNjlYQ29GUG5EZy9U?=
 =?utf-8?B?TVBiSERObTJkVFB1dGRta1c2aXdvTzd6S2hBYlJDM1Bsbnl4SjFseHErbE9F?=
 =?utf-8?B?Ums0dUtJSWc5UG5PTUNOZmJaWmRZL0hRSTJZOHdNRThEVHNaclRTTjlwSEZE?=
 =?utf-8?B?QWdzZCtjNjBGczVCSlk5K2c1bEVvcytNMTZQcVRSQ0tUTFFFM2p1UUloWU9H?=
 =?utf-8?B?NjZySnlMQjlBQ05EeGdLSUg1KzJvczRTTG5HeDBnVll1YVQvd2pQNVFsMkNK?=
 =?utf-8?B?Y0JIQWtpUjZCZmJKY25Ra0tMbThJNUdnTHZJM0NndDlpSThCLzZKcHNOQjZk?=
 =?utf-8?B?UExMTE5xMnFqRmtWeDJ2U1FDWVduNHVKRTV4K3dOdFgzSlJhcE5iZmNBQWph?=
 =?utf-8?B?Yno5SGNYWmVIeXBIa0lsd0s3dDlXdU8yUDhSU2dLTlJKTWYwUmo4eXczZVoy?=
 =?utf-8?B?STE5K2U4cVgxeXR4TmRJb0VmUzNmRWprODhxTGpCWVUwK1laRzRLZktSeUR6?=
 =?utf-8?B?TC83U2szcXFmSFFPMVVHS0xxMkZWbFpsWDlIREpuejEzaThQcFNIaW53UzVJ?=
 =?utf-8?B?Q2dkNk8vSG8xYlpFdU1kVW1QY2tOeHVMbzdYRC81KzNGeUxRcDNkSXVaZmpj?=
 =?utf-8?B?S0c0ZnFqY0tpdWdWVkJEQ2JNcjBGN0dSYU1kZzRmL09nd2l1VVNxZUtNZ0NG?=
 =?utf-8?B?QzJGNU5LS3V0RW4rMUtaUUNNOTN0clhsSzBnTVcySVA1d215bUFjSnB5Ymc0?=
 =?utf-8?B?UVRaT3lYZ28veHRaS3E3V01NKzB6elJwZk1WY2tncG1SWnE3WU5XclhSVTYr?=
 =?utf-8?B?ZjFGaVQyV3BmUis1OG44aVhEMFpOTXZmWlNJUUVBTS93dnpGUVZyUzlRR01s?=
 =?utf-8?B?OHVtK3BGYjYxc0hWOXlBckNwT0l2eUkzYlpMSWVaMXc2SlErTGJ4dHJMb3h3?=
 =?utf-8?B?ak9YVWUwZFY4dUY4UjU0RytzQnBiUGhHaWVOMjd1eEdKeCtWWXNmMVFvcEo5?=
 =?utf-8?B?T2IxUDczWGpSTVkyNklTczhtT21RU1g5L2gvSEhxYUpyYUs4MUJtZjdJZUtJ?=
 =?utf-8?B?RG1lOUNMVUhucUYyYkQySDEyME40UnhXY0orNzRyZlNBWmM3cEI3eklBdHpN?=
 =?utf-8?B?MUdwN1VYRjJ3Yk40SnU3eHVlOVk5ZmJ5MENzL3VLSUlxUFJYVUthd1Nkb1Nv?=
 =?utf-8?Q?CLNZrKgbRLVGSQLmpk0qvRoRWnDJelnLgTOCL4zYEOxk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7096d271-06ea-49fd-37db-08dd9389ca17
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 08:23:36.7965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50qBjktbx4xA4qrGLhKOJhmbUnR/iYJzJO2SXjEvU5+VeaxkP66ffWPz8xuiqKGbKc+OTkHQHo+c+3Hy2VI18Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962
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

CONFIG_AUXILIARY_BUS cannot be enabled explicitly, and unless we select
it we have no way to include it (and thus to enable NOVA_DRM) unless
another driver happens to do it for us.

Fixes: cdeaeb9dd762 ("drm: nova-drm: add initial driver skeleton")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nova/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
index 123e96788484ad05a77a5827742c0c88255b1f2f..cca6a3fea879b81c38dd7124942cf2aa09874efa 100644
--- a/drivers/gpu/drm/nova/Kconfig
+++ b/drivers/gpu/drm/nova/Kconfig
@@ -1,9 +1,9 @@
 config DRM_NOVA
 	tristate "Nova DRM driver"
-	depends on AUXILIARY_BUS
 	depends on DRM=y
 	depends on PCI
 	depends on RUST
+	select AUXILIARY_BUS
 	default n
 	help
 	  Choose this if you want to build the Nova DRM driver for Nvidia

-- 
2.49.0

