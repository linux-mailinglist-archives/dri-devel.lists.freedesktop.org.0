Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70450B50D83
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 07:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002CE10E2BC;
	Wed, 10 Sep 2025 05:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mkBsePaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF6610E2BC;
 Wed, 10 Sep 2025 05:45:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOnTa5RZKiTeH31e0iFqLUJ2gr17Bagv3dc0Ie7e0j0V3/zKkWil0f5Pu4iZ+3BnGmO7Y0xxd7uaPjE1JOM0JB2HHQJSYNLkrf2ysXLbMDIB6JLSUuugEnPGijMelOAYtLR8tqS78m32HC4T4igL7l2hBQ71hlLzf7r6h9rGv+rjEf7c6UCNM2X2gPLLtmEMTlwVDpxc7tKn5rI7vdailBdN8y4qjfr/z351LdM/CelaJ8dRxiqQgwrJpiidvi1dxqRt+aeIbzIfv1SFMp4FPlbQUG6ayUI+g4J2wZoW4Vnr2nFoQwIVrMO+AfTdsEHcS6dBlXMS3thk9hISTkqBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nr89AkKLcXDcz515tOq1oH0IFs4i/h/J0FFf5d8mQ78=;
 b=GMpWhqSKaPOcOM9WxvQmEDBOHGkbCQr1hHLP7kJO8tk37kiuzTXKUVt/9mxAEx4LZz8wQnvjU4Wc38XvANFTLDM5VxgPTznlH3/uk5VblzYOLxNWYh74fWvJBFV8gwVIQ2ewfPbSultxdZqrJdvkv3Cfd0z4XNty1sMlXHMnFEKOmhe5CqEljgnOxrqM/i/8UybeXlvNwZjo+zUX1Jw88xVzMFfrxeUBCzfIdoljjsW4hqpsDUJO5hIOSmCuJaT9Mktxd0W/di3AqocRUo8Li2PCaD51CUP+ssJdqCz254B4lgiQtwKmG6aEz7AkBNOFNCSEGgKW4AyLkupwAmI5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr89AkKLcXDcz515tOq1oH0IFs4i/h/J0FFf5d8mQ78=;
 b=mkBsePaELxbTrKjfBLk5lKdKyPeRWE9XmLrRen4ibUWMiVXTMF917GO93yqtm/HUAO0XvRYswksstkYmjBwfdRwkQ0Ku+32XXrkoY89h5tXY26cSn8O5QoYmmOJxdI5vJcvtOaMeII9Vps/XH+Uknh1HvAYfTQ7XBbSP03yQ1zQoK4Sg8pJnp+9KsrrUmGapkLbJVp4NNtI1q8RuHuDNXG7j7JBhvsAtq9+6RWGy7qvuP+5GFga9aEUo6N8ixnYH9oHcH8J70AZAxZTifKKCmcJtEXz3BZr/TDr2+nOVi+7NcmB3dqLLXtIXbXbnynTgHlCZEvBnqfRinisIwNUM1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 05:45:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 05:45:03 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 14:44:59 +0900
Message-Id: <DCOVRI3TVJBN.3OGDSK8HW74LL@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: Implicit panics (was: [PATCH v2 2/8] gpu: nova-core: firmware:
 add support for common firmware header)
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
 <9adb92d4-6063-4032-bf76-f98dcfe2c824@nvidia.com>
 <DCD2VJ1WJW2O.VM7E4PD3DFYO@nvidia.com>
 <CANiq72=nGbziZCKt=AneE_vXw76i=+td0dSVfbOJ8kJ9eYHw9w@mail.gmail.com>
In-Reply-To: <CANiq72=nGbziZCKt=AneE_vXw76i=+td0dSVfbOJ8kJ9eYHw9w@mail.gmail.com>
X-ClientProxiedBy: OSTP286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:224::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: fee47e78-6e39-44db-1531-08ddf02d3043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUhWdEhDYzJSamMreEttZVN4QTNFcXRtVEVOSlJRWm1mUHl3b2Z4YTUxV1JZ?=
 =?utf-8?B?Q0YxN3dwZmtoTXkvYWJOdjVJOE94amg5bXdkMktiSFJLeU1ndGtwc2lUeVlu?=
 =?utf-8?B?RElCNjc4aDBKRkxnV2NKNSs2M2FjS2NZSmN0eERiM0djdFUwRDdNQzdIZU9I?=
 =?utf-8?B?dU9yUXJJckhqbjcwblduMmI5ZzJYMTF1SmJjNUNXM1pyRDc0QXo5V2piZlZw?=
 =?utf-8?B?T3VjZmR5UE0wQ2hiZ0lkM3NsVDduaXlLM3ZjSkVzK0EvUXNrV1Q3aWVGR05u?=
 =?utf-8?B?VmtqVDdmQXJVaENpVWVoOC9JNUxZK3RKeXZnblFvMGNaREE2WnJDdnlSZE1H?=
 =?utf-8?B?WDNkdlhWYWJyY082cS8xWEhlbGRYVCtpK1Ivd05QZFZ4STRtRXlZYXpwZ01p?=
 =?utf-8?B?TnNwbzFQbEtRc0ZPWGxDQnJPZTljSGk3QTdiekdoemd3U29ha2pLYkkvTU5O?=
 =?utf-8?B?bSswSXBtU2tlYmdIc2pzVkJaQ3hoYWZVMGhtWXdWa1UwTDNlREZ1WHNNdTBT?=
 =?utf-8?B?Y3Z2cjYvdGxwMngwQkhiSDZqbUdmalpWMldkZU1ZSTJPcS9rQWUxVlE1Tjhy?=
 =?utf-8?B?MTYvUVBqbXJLZi9XRVVVckE5cTE4Rmt1RUF0dUtCNXp4SEowcTgyU01GLzdq?=
 =?utf-8?B?ZmJ1V1RHNWVDaC9Qc1E3WlpPVEpZTWdVMis1THY1SWhpeERNbHFsVEVPS3RO?=
 =?utf-8?B?b3ZtcmNiSDQ1ZHJaOTl1andmS05iMkVuT013d0V6UXBESXQvZlZ0VXFmT3dI?=
 =?utf-8?B?UjNLc1ovWnRRdWR1dDdWN0p1NXBnRm1Kb2IvenAwOTNzczdldmU1ZnBnRkU0?=
 =?utf-8?B?a3VZT0VRUWM1WE1xYWxuK2d6STd3cXRvR2NUQ1JvY2ZjNDUxSWN1dk1weFRR?=
 =?utf-8?B?c3dlbDdFWEZKZ3JyWktzQncvUjhPRHFDUjFZQ2toTjZaaWhDR0NkTXM1RFZV?=
 =?utf-8?B?dWZUOVQxVGVLTTliWHhUenBVRmFMZXpEVzJWL21mbWFSZlU3MmdaQllrYUVF?=
 =?utf-8?B?RVgrZTUvV2YzcW5YNU1WTWdpbWdHTkFhU2k3emxCSjZ5UVlSa2gza29BdFVD?=
 =?utf-8?B?ak96Y1ExTmc2Qk9xampxd21zc1owQUNadlNKWmwveFZrTXlVeENUM284SVRF?=
 =?utf-8?B?b1RWaXJ5bkhHNTVoSHhMaWVyZ0dlVStVNUZ0MTY5MUwxRFlxbVZqbWlqQU5q?=
 =?utf-8?B?VlYydEJnSnU2T1pFVzN1eHgrWlQrazhubzBpaHRoUU5JOVFISEtlaHNSZ1Bi?=
 =?utf-8?B?T2NnTkh5dG1RSllRVGM3bFpCNWQweGNwM1ZUenN5Z2h1SHo5SjBiRm1aRXcw?=
 =?utf-8?B?RmdGS0xxSld3dVhIMURLM2dDZEt3NExUcFRwT0M0SHFCWHV5T04zekJ1eDVz?=
 =?utf-8?B?cFFQWktjZUl2ZWM3R1h0L1JGRXFZN2dRbC8xVHpmMy9DckJWR2dHRk9GbWQ3?=
 =?utf-8?B?N25qKy9TNFJjcDJPK3d0OUpnMldxeXo2Y2xlTDJhSllVZUlKeE10bUYvcEtk?=
 =?utf-8?B?cUxra0hDSUttS2V5N0JVTE5xTnVuTFg4dFRIbUd4L2lVSGYwcGJac2JUVU1N?=
 =?utf-8?B?dUlZQTJUYW92eVU1MUtBNTllMmRhcW1iOU9pN3pHSDE5TUQwempDVkt5a1hF?=
 =?utf-8?B?U0xURmJGSnBLZ0JpNFM1NWxpZm8vZitnbFZQL3NjZ0czMXhVcVllMHF0UlRF?=
 =?utf-8?B?d01KeGhMYlJyT2ZnZ3lFcnY3SXFGMWdINnlDVXR1YkZsQ0tTdEhKSXoyd2dE?=
 =?utf-8?B?a2MrRDQ2T3ZrMGRWZVdkbWZzRGp1NGZYbFRHelNKd0grUXZlRENQcEp6ejZ6?=
 =?utf-8?B?dXVtSUJoRjNtMndzK2VzWEtUbnhiQnRGVm41M053RTNjU21LMFpTWW1jSUVE?=
 =?utf-8?B?a2dpUUEybTBkTEhOdGREM3FXVmV3ZEl2ZFlBWEdXWC9mNUY2a25iaUErWnRr?=
 =?utf-8?Q?kD5BmhU11kA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDhyTm90aUh4ekYwWnN1UFpKaER6Rmw0bVJVTndmR1h0YnJpRFFzVmVrcjJP?=
 =?utf-8?B?QVJ2b2xvL0hlMjZoLzJjN04yaHlsUEJkNE13UFpEdHJ6Z0JYajl5T1VhRFhi?=
 =?utf-8?B?UFlteEJKQ1NtRzZxM1RnMWg5UWZBSmFUcjZFYlVKSnA4MytNTGpJd3gvdjFX?=
 =?utf-8?B?R2ZyUndsZjlpSVIya1VvV0dHQTlmb1ExREkvbEJsNWJEV1p3L3B2NklHdHRa?=
 =?utf-8?B?QUE3cFhPOGhmbVZEelo2QjFqY3luWTN5ZGpTTzR0bUxjbjlxY1RwdHBIWXpE?=
 =?utf-8?B?TWdYMytuNFByZ21qd0g3NGdJWWEvTGltZjJjYjBhQkZ5NVJNbTNySVEwN0FN?=
 =?utf-8?B?NTRlNkwrU3dVRHZDaUNOVWxDdkh1UUtTb0xtSTdyTmVpeHc5R04rQjdFR3k3?=
 =?utf-8?B?TWRiYUNSSWx3bTAxektwWUxMWVAzUi9GOUwxWWdiYm9ZV2tDTDFpOEg3UkFw?=
 =?utf-8?B?cnRtd1A1T09OS3h0SG5QRjFVbnZ2YU4vSmhlc3dPSVFYd0Nuc1VCMHpqYlVB?=
 =?utf-8?B?aXplYXNTQmUxcElVaHA5Nm9CVW9TVHk2TmtGakxiek0yYTQ5RGk2dk1ObGQy?=
 =?utf-8?B?b09IUkJzeVJWM0pQVzlMcU5XbmpyeXZQTVpjYXZUQWFvRWI4cFcrQ1JEbzd3?=
 =?utf-8?B?UnZ6QTlpN2EySSt5aXhrOGZtN1gvY3lEcFlwb0VRWlhOU2tVU0kwdUhUUHc4?=
 =?utf-8?B?SFUwY2hsSWNmRUdLOXNjOHZFMHlDb09aSjNXOU9EM2NBYU5XZDRsalg1dy9r?=
 =?utf-8?B?ckQ2d0tuNEFCT1NPSWVUdDJBWU5RaEZGbUxKWXptQ2lDZmlqOFV2QWpYcXQv?=
 =?utf-8?B?T0RYcjkvNUpCV0RwUkhnNjQ1dzhUb2IzZ2xtVFppSjlxNkpqR2dXajlBN3c1?=
 =?utf-8?B?cVdIZG1ocEIzaVBHVmIvZUMvL01MQUwxTEw3MmxHWnpZbGtnTUF2TXZwVERv?=
 =?utf-8?B?R3ZxTkJKVi83aVJsblQxTGVjYVBRcE5VTHNEQ0JxVkd6dWtya1pJSitoRWFk?=
 =?utf-8?B?Q3ZzSTdaMVkrbWJTT0lwYmZOaGNPY01wUTBQeFd3SjRHeHdRV3dGaGQ5VTVH?=
 =?utf-8?B?YVQxVW53ZFpXZmpSMjVyUHMyeFJQK1ZFTmo4RWJPL3lzTFVFb3doRFpHS1ZV?=
 =?utf-8?B?dGwrYW9xWEU5bUZNcHVMZ3lXWUovNGcvbGNLK3FyT0tEbDN2aGptYjRoVW84?=
 =?utf-8?B?OWFqZDJOTVJmcTZmaXYwNTNseC9saVY1LzhtTjNZMEVDUHRBallrVkpFNXpC?=
 =?utf-8?B?SDdRSjArblEzZmFrc01tR2N0TGdqTXg0UVpoeU5MY1B0TFk5VDNLUkZUbjhk?=
 =?utf-8?B?UWdkdXRndGNweVFIczV1MXo1NVlhWm9ZWnNsQ0p5cDVmZVluVDUvZGpoeXRL?=
 =?utf-8?B?L1ZyN2ZlSDRnYXNaemZWU1g1anVXZFpKdkZQY2J6Z2FNbHJwZHZuNDZZSDBJ?=
 =?utf-8?B?dWUyUjhpbHNxbUFWb3JJYjE2d2d6LzMxZG1hUXhVTzN5d1VWblZHMGJkTjdD?=
 =?utf-8?B?bUtPSGZsTU5BRytHZG1vQ3FldXRDdUZhYTBDTHplTzREdkxsSENIYml2U3Ex?=
 =?utf-8?B?NXVxQWUzYmovYUp5UzVBZE9iSFpadmJkU00zTUQvYWY1MVpzNEczaHVtNXFJ?=
 =?utf-8?B?SGxqQ2wwMEVMa3RLM0doSThhZ1ZHcHBWNE51NXNlcFlyUDJod3REaXlIL25E?=
 =?utf-8?B?U0l2ZnNXWUZNckFMb0FkYzV4OXoyVTJQY21uUVQwK2dhNTlRdkFmaXF4Z3hi?=
 =?utf-8?B?S3JWVythZ2JMdmpaaXpZSms5dExNMkZRM0tlK1QzYWx1a2ZETHJ5cnRrT3Yr?=
 =?utf-8?B?QXU0ek5DQzQ5eWdlZGZOM0xhNG9wZUhhMlBMY1U5d3BCWmFuY1EzTXNRM0o4?=
 =?utf-8?B?bjBHdTZlSXBlSWIvOHUwbVRXZEFvU3o1bDc5b0EwS2kzY0xxUUxFMDFzZjRU?=
 =?utf-8?B?Z0I0YWpDeElVNGxqd09SYTE4bnNacncraU9hZ0krTi9wZVlJS2dTRXo3TUY5?=
 =?utf-8?B?L29BYk9KeHh5cmI3TWxlWGpIN3BLclBqcFFwNkNIQld4dDBVekp5YnpDZUc2?=
 =?utf-8?B?MGxsYjdnRmlQcU5TZnRiU1NDUzRndjJ0L01URHA4MHczQ2U2Yy85N0RTWG1O?=
 =?utf-8?B?NWlRTXZ0U0h4UHNoQkVsdHQ0Tm1XS056eVRBeVB3S1pEMFRSMkoyb2dJSSs2?=
 =?utf-8?Q?xPXZFEW9lcAlNtki6TI2X9EnOUFC3W5cU6VGB0xijmdM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee47e78-6e39-44db-1531-08ddf02d3043
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 05:45:03.2809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T39hrCSSaE+524OI8mFXuPbWbDhMLGa+zCHDwbbDBi0wCX7HC+6prn4XVj9/l3fENtAXYGPz2V5PMB3Snb77xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6962
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

Hi Miguel, sorry for the delay in replying!

On Thu Aug 28, 2025 at 8:26 PM JST, Miguel Ojeda wrote:
> On Wed, Aug 27, 2025 at 10:47=E2=80=AFAM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>>
>> However, `fw_start + fw_size` can panic in debug configuration if it
>> overflows. In a release build I believe it will just happily wrap, and
>
> In the kernel, it is a panic in the default configuration, not just a deb=
ug one.
>
> We have debug assertions too -- and those are disabled by default, but
> they are separate from the overflow checking, which is the one enabled
> by default.
>
> So, any use of those operators is limited to cases where one knows,
> somehow, that it will not overflow. And e.g. user-controlled inputs
> cannot use them at all.
>
> So, conceptually, something like this:
>
>   - Static assert if the compiler knows it cannot fail.
>   - Build assert if the optimizer knows it cannot fail.
>   - Unfallible (like the possibly panicking operators) if the
> developer knows it cannot fail.
>   - Fallible/wrapping/saturating/... if the developer isn't sure or it
> simply cannot be known until runtime. User-derived inputs must use
> this option (or rarely the unsafe one).
>   - Unsafe if the developer knows it cannot fail and the other options
> are not acceptable for some reason. Ideally paired with a debug
> assertion (the compiler adds these already for many unsafe
> preconditions).
>
> In the past I requested upstream Rust a way to have a "third mode"
> ("report and continue") for the operators so that it would wrap (like
> the non-panicking mode) but allowing us to add a customization point
> so that we can e.g. `WARN_ON_ONCE`.

That would be nice, but also wouldn't cover all the cases where implicit
panics can happen, like out-of-bounds slice accesses - we can't have a
"report-and-continue" mode for these.

And that's really the elephant in the room IMHO: such panic sites can be
introduced implicitly, without the programmer realizing it, potentially
resulting in more runtime panics for Rust modules than one might expect
from a language whose main selling point is safety. I understand that
the previous sentence is a bit fallacious, since such panics indicate
bugs in the code that would likely go unnoticed in C (which is arguably
worse). But perception matters, and such crashes can be damaging to the
reputation of the project.

In user-space, crates like `no_panic` can provide a compile-time
guarantee that a given function cannot panic. I don't know how that
would translate to the kernel, but ideally we could have some support
from tooling (compiler and/or LSP?) to warn us of sites introduced in
the code. After all, since the compiler inserts these panic sites, it
should also be able to tell us where they are, allowing us to evaluate
(and hopefully remove) them before the code ships to users. Most of them
could then be eliminated by constraining inputs or using checked
variants.

I am not suggesting we should mandate that ALL Rust kernel code be
proven panic-free at compile time, however since I started writing
kernel code in Rust, I've often wished I had a simple way to check
whether my carefully-crafted function processing user-space data really
*is* panic-free.

> As for discussing no-panic, sure!

Writing a uC topic proposal for Plumbers right now. :)
