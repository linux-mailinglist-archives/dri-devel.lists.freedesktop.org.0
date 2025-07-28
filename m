Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88883B133D5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 06:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6898210E0D6;
	Mon, 28 Jul 2025 04:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uaD5iaB+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE6F10E033;
 Mon, 28 Jul 2025 04:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJDKlwrndpr4frf/vtNk0CTm2oU+cJDsYaCyzn8aeNBVtqttouwOaukbk9lPY334wlVIwDPGXVvVit6FntmqCxERGDHN1Wyk5c/0GqrzHll/g284hUp8WtA+l0xf09KuBW4PAhDPL0xwLrKJr/3/CitL5W7O1wHyGdmfWGyXXwuc3QjL7y8VVDBdZCdfrGTzE7EHqGofE7cWypMXtqY87sDmh0V3kzsUh2Pv0qFl7/BJtWiiadczvdAjjis6rssl5BsPVgqY8rbyRsXURv0jJYHBdGnJi3TY8aGVdDwK4OJr2BUAqK7B9ybCJSeHpgRQ8qC0RQ6M/PPAnFai4jtJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XKYL4UAvXUpCeNNnv5pNxlr0OgpK53CJwIFrFEKUYc=;
 b=rNJlO16yxadRgbO5Cx/IM3JlTTolllRSIUQjijJmj+aDasXI8hDy1SntZsBA9Gf2EbnU+hDfpySSKdO0m/AKPtvo/SNCgMING50vfKbhpOf7xRswYl+UHQ77IruPU7B9ZAO/hhawOJPOkxV2SEZZz2WebFjafXZ0smuArgWg3wfGgyRvK1L8MjbTOdo0iEt3wtCvc+wZFlnYkrKfNKXXswF5u+9lUfq0nlDCGfIdpyDqAxMamdBszVXU8RTTDlW9MAPPrt4R7oJYIRdZQtChgtzdy2WBo5Q4vSXZ1pB8ZSsBRmZhnLFnM18t/Np9NlXqLzepCdTL3ndFbYA2m/DrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XKYL4UAvXUpCeNNnv5pNxlr0OgpK53CJwIFrFEKUYc=;
 b=uaD5iaB+ccPjoj4hNxy8A8gYxWgt5HJpJN+e4eWlu/Taxr4j+/7BQNSg042vybaoOnziTbD5XK1PCkOPB7nA8gNegnQSEaBGQYHp84mcmF2Ne2U4+ou6agSAyybje7v1nmo75Vl2PWeXRjeiHsHAQ3f8QeJw40xo310EjyjI4apy/z3euQP4iaP6TMSWAi2FXnH6rSgkIUgtoW4r1q9kZuyF58mK/nL2E3v9aUMBsT/dRBu1qZXxBhnCKhkIibHtfGoWRU9ztwqs6h3qmXyUcbWSfgWEXWGbQZ+SfOLv+JM2bcaVx4OKeNaE7wxu8CEq8LOJ6P6nYPbQzHWYLJIg+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB9733.namprd12.prod.outlook.com (2603:10b6:8:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 04:59:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 04:59:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Jul 2025 13:59:38 +0900
Message-Id: <DBNF8SZWLI79.1NRX9AMW5QW45@nvidia.com>
Subject: Re: [PATCH v2 01/19] gpu: nova-core: register: minor grammar and
 spelling fixes
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Beata Michalska"
 <beata.michalska@arm.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "John Hubbard" <jhubbard@nvidia.com>,
 <steven.price@arm.com>, "Nouveau" <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-1-7b6a762aa1cd@nvidia.com>
 <B1AA6359-7854-4284-B533-F5CA3C18AF34@collabora.com>
In-Reply-To: <B1AA6359-7854-4284-B533-F5CA3C18AF34@collabora.com>
X-ClientProxiedBy: TYCP286CA0242.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: efcf3bf2-b9b9-4f62-6a45-08ddcd939001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VCtNT0UrN2E3b1B0TW51amlmc2NHRUtHTUpaaGhMeC93WkFGUlBCTkZ5dzVh?=
 =?utf-8?B?Z2wxVWR3bjFUVXdOR2NIWGNqYUtodkl3SERWV1dWWmRrTnpuMmpXOTEwaXJi?=
 =?utf-8?B?eFZPQUtuNE1lcEVNRjFHbkI1WU5TQlBpL1JFRmgrS3M4TEVIOFQ5QlYvcVZj?=
 =?utf-8?B?YkxlQVBzeUEwMUJMaFpnZVhwbFIrL0lUOHVuOWNUYlZlVnZtZUlMMzBWeTR0?=
 =?utf-8?B?dTMwY2Q4TTEzT0RsYVYxdHRoS3VmdS9VdmpuT0JZZkRoWjZubW1xQnFWazJn?=
 =?utf-8?B?NTFMdFVqcXJmbWtxNzFHczRvdnBMcEFpOEdqdGFRR1ZaODgyRWFlOEpIeExq?=
 =?utf-8?B?M0dyc3krWGUvL3hTRjR4SHF0NU11Y2VGWlJEZFY0dWkzTlRDQ0hqK09odDNy?=
 =?utf-8?B?SU8rVHYrZWNsbmhmbVhNKzQvNElVMlFCZVRLU0E5YkowYytYYXdBZUxaZGtM?=
 =?utf-8?B?YUprSi9uMGc5amoyK2p3THpuTU5DT1p1clVBZmhFM0NpUlFzZlFGT3lrbEU3?=
 =?utf-8?B?WjNocThNd1dyODNYa1dvMzVCRjhuczIxbHRsZE9yN3hJSjFMbnhwbWxaRVZK?=
 =?utf-8?B?QkdZR3lTdnFQc0NxdDM2ZEtQMkg5S1dZZG9FZlljYWtFU2xsdDd5cEVmVUFT?=
 =?utf-8?B?cXJHb1ByV01LRmNjWnV5RGFkMkk0MXIzeE9HMlN2S1MxUXd3S1JiTUJXRjZs?=
 =?utf-8?B?bk0wUTduTTlwSGlPL2hPZXduUHI1U0dkazY4aFViTHlURmVJdGtaN1pjaHlj?=
 =?utf-8?B?TkhJWnl5Z3ZWM0RFMW4yNmM2R1h6WHY1NDBaRUc5aTBFNzNRTXlGc3hTSk1E?=
 =?utf-8?B?TlFUbkFOZ2lMSVFkaHlFVWsxdG5FMERHYXZYdnVYbVV3SXYyaWV2R1VxWFRz?=
 =?utf-8?B?NmRST0xLckx6eC9YM1pMOUl4SlhVNVhaNkh1UnlsZnc0VmxCcWtkRVQ2amNN?=
 =?utf-8?B?RnllNkNheHNWSVAzNXhvSXBlZCtXZ2JCZEZjbU5XK3FnRUtnMTZBZVNnTlFW?=
 =?utf-8?B?NktBME5haXl3eXppcGdOdXBjSTJJWGF0d01pR0R1a1dySWxyTW1Pak5FWE1U?=
 =?utf-8?B?dFU0YUptaVRQazhIa2t4cVVVYUMzSFFUY21SNFFsTkE3azFvNnVlYVBtMXAy?=
 =?utf-8?B?V2VHT3Z0bmdoVUpHSVZjWWRQODA0S0JCcUF4cnVXSVhuZEhDQWQrRmNJZW1a?=
 =?utf-8?B?ZW1zMHZiMUNXVW4rYmc1a1E0NFJNdWFJQkVEWjhZWi8vcUlBMnE1SWpDd3p2?=
 =?utf-8?B?b0s1QTZHSTVSRWpObEwxNGo4MlJVc2pwbmZKejBXU3k4Q1dwOTNEd0o0TkND?=
 =?utf-8?B?Vzl4aytVT0dpbVJKMFVjNjNiU3A2bXdCbjd5bk95SWdzN3FwaEdabHhPR3Z1?=
 =?utf-8?B?Y2NzaUNmYjBmbk9Fb3NPOUlDaVNpMU51eWh2UTdoSHFiMmFxVDF1R0lCZFZW?=
 =?utf-8?B?aFR3Z2ZhT1pVZGlhb0ZNdWNUZG5reEx1N0VxM29wSENDdzdlT3VIbmhrQzM5?=
 =?utf-8?B?TlNwTTY3bDdFdEJIVGdzdENvMzNnWVhYN2FLYXd4L0xoOVhOVGVKV0xzSjR3?=
 =?utf-8?B?RmV2czM3L0tZS0RXWDhjMEVUNFFHSk9pWkpuYjRCanhrbzRQdzBuOTg0VGM5?=
 =?utf-8?B?cnZlNUQyZkc0dDNpaHIzK2laOFRVTlpCQnRoTU85NjFZVmtibDlhRDkwMXZz?=
 =?utf-8?B?ZFhhS1NIZlV2UEdGR1YwSTVsakRHa3RoWGUrM1Qvcm8zTG93elQxR3FmYjlE?=
 =?utf-8?B?MXhHZUhlNHR0ekFhaUdLSkJJY3Zta2dZRjkyVjFKR0x6ajJRckg5SEtTOVBB?=
 =?utf-8?B?ZUVsYjF3em1DU0V5SkcyVnpwMFhHNmFhbU1nckZsSW9YMk5ZZ1lEV3pScUNW?=
 =?utf-8?B?MHh6SUt6VWF1aWdSOVVldmhXdVAzMmlwT2psQnFMbHFvd0w2THpmeU5kZlN4?=
 =?utf-8?Q?5KgeW0LU/uE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWRTRFZ6OENNTVVXU3NXYU04Vms0YnVLNzRWdG1PbzdiWkliYjlvYkVQVHA5?=
 =?utf-8?B?ZDBNa0NBcmJaTGhCVnZ1RWxGSWlzN1ZKcDUveFdzYWxUanFsbXZJOVZ2dmx1?=
 =?utf-8?B?YkhVS2dXVFNvdnE0aGczNkNCNndKeUlvYzZhVmYxUVd1MXdEcjlueFhPNk9L?=
 =?utf-8?B?NFNuc1NqUDJJdHZ4cE1jMTNiTXNyRXpKZVJOLyt0eXdFbU0zb3B0NTF0cFZn?=
 =?utf-8?B?QUcwNk9nMGFldEdtTWgzRkVhc1plVFoyMWxLd1hPUTJ6azFiMlFrTjliRTdw?=
 =?utf-8?B?MUpWaFg3SGllWFloRytZSGl2MjZscENMcDR0YVhkdzcwekN4KytQMVYxdm4r?=
 =?utf-8?B?QTJlRmduVW1xTWYzVW1jUitnZll5Z3djRmhtWk1rVmcvRzVENmRTSlBOaDNs?=
 =?utf-8?B?UmVyZVRGZUZRRjA2N3dHc1BRbHVuUndEaFVFSEtsYlNLYUNSLzN5b2Z5dUNG?=
 =?utf-8?B?WUtvNEJ3eFB6Y3EvS3d5Yk1TRnNwNnk2Y3NkNkZtZEVvUjBXS0R3MC90Q2xU?=
 =?utf-8?B?VHZLeFRqN2pya2FvM1dnOXVrZWU0RkZiQnd6VFVPOWVBOU96c2pxNHhjUDBB?=
 =?utf-8?B?dnB4RGVSZks1N1Z0emp4clIra1RGNDIyYWZUeEgxZklKelVRMHZIUTJMT1Zz?=
 =?utf-8?B?Q3FiUWFPMDdCWXZvaEgvdWR5cUJqK01tdW0rYTZjdnBXVmJrcHRTc2d5OFhT?=
 =?utf-8?B?U0drMFJMTENsMno5NWVsYW5qUmE4QlBrWSttdlpYQ2k2azJWZ2x1Z2lQaFVj?=
 =?utf-8?B?eG1CUG5rZklrN2YvaGQ0b3RwaDJKc0tweXVQbVBGNW9Yb1VhSmtwYVIzVUFE?=
 =?utf-8?B?S3JKZ28zZnA2WjZCRy93QkhOaFZ6QmN2TW1CK2FJMWZyMGY3dGtjN0UrNzFB?=
 =?utf-8?B?U2RFS05rbmhKS0VXcHRJMGZ1TENNWnZJdHlTNmNPeGV6bCtNV0NBNWpQKzcz?=
 =?utf-8?B?ZHl0Zzhjb2dqQUYvWHVQdWFTUFlnQWRoYm9VWW1RN0dxTWk3WXdyempDc21w?=
 =?utf-8?B?VmtpYmM3MGE2ZkpROGFTZ0FYR0VsV0lxR0U3Sm0xRExGNXlkdTJUU3NEVkZy?=
 =?utf-8?B?alMxWGl4QVJGbXFTRThJQktmTFJHU1lwU3R4cUZHZm1HVEVuSFFNTzh4ZC9P?=
 =?utf-8?B?WkZYTTE0a002ZXFLakM1MWJyU3ZkTGNxeTFjUU94VkJmU0lDdHBEV3BvUm5L?=
 =?utf-8?B?UEZsOXhiTVpTTCtoajBBWjhTK0tWaWE2QUlJVnBWRlRCSlN4TFoxZnVNM2VI?=
 =?utf-8?B?YmRpNGVrYlpKSGJ0UUlsVE5wUkJWVU1SQzhydGFPZm9vU2dCT2JEUmFWYnJr?=
 =?utf-8?B?YWVOazBOUHRld3FhczF2SVNYWkNqN3l0bmVVZWVMOXZZQlNhdVFhWGY1azRH?=
 =?utf-8?B?ZGNpQlJGY0tJcmZTay8zMkt0NE1xQkZHWjZqNWVWQ0Y0MW5wZ2VnRGpscUhr?=
 =?utf-8?B?UWpXWGdMeFB0YUVTcWZCc2FnZ3owd1Q5NklJMHd2L1NuSTZxUWw2Q1VnbW9l?=
 =?utf-8?B?aHI1dGRFMkFZOUJkSVhBZ2IyNUhGYnErODh5eUZwQU9SaWp6REl5MjZ2MUYz?=
 =?utf-8?B?cVhQcWVIOG9pMnlGY0QzTGhGTWJaZVA1ZGROYUI0SjV0d2V5bUVLaHNXYkxs?=
 =?utf-8?B?TFg1dWtKak1wNFM2U0wydEFkQ0o4SXpESk5QUEs4bktneWpVK0JNcG5xT0x5?=
 =?utf-8?B?eTJ2elY2M1VJVTRrb0Z4RlhiNWpqb3N0WG90b21VZGR5cnl0Z2VEVmxYKzZN?=
 =?utf-8?B?WTd5cysrNFBRNTlMTUFnR1huL01jZElhTXpYaHZFTjhlNWVtOVdCMkMyZ1Zs?=
 =?utf-8?B?czJQUnVtcmgwc2ZVS0xsRHYwSnhScjl4OUxERzBjVjNlVFJISWx3ZXExcUdw?=
 =?utf-8?B?MU5FZjB6VjIrd3h5d21EeEh0MUl4bFhBK3RKOUFJRHptNjVVREYzMFZvYXdF?=
 =?utf-8?B?QmI5b3lQeEhpd1doVHR1MkpobDdUZm5MZ1g3UFNpR1NNbGo4MU9KQlFKbnFt?=
 =?utf-8?B?QnowVnJiZ29rTXFoWkpqU29BelZqUExPZUlqVEJVSWg2VE5lekpSaUcrZGtq?=
 =?utf-8?B?Z3UvM1pKUkU0TzdtdnM0bE9ZQ01DRTFNWTFxZ3ltaXdwcHlUR1ZIYnhCN1RK?=
 =?utf-8?B?OXZ3ZzBHQ2t4REpadWZRcVBKbmM1akNnYjZ2VDRibFcyUzEzb0k1QTNVYW9j?=
 =?utf-8?Q?ufknSETB84XY+AhlnyTM0Q5gQEgjb+S6VIgiO2eYmFxt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efcf3bf2-b9b9-4f62-6a45-08ddcd939001
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 04:59:41.9508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+JuXC+Pvi9Ptefp3M+m2j0jj9Vnk/HzdkkXRAVMZo1ChPhNGIGyhRfoUvVeuAuzqNDg47u2I8lP74UZ6v9wBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9733
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

Hi Daniel, thanks for the review!

On Sat Jul 26, 2025 at 1:14 AM JST, Daniel Almeida wrote:
> Hi Alex. Thank you and John for working on this in general. It will be us=
eful
> for the whole ecosystem! :)=20
>
>> On 18 Jul 2025, at 04:26, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>=20
>> From: John Hubbard <jhubbard@nvidia.com>
>>=20
>> There is only one top-level macro in this file at the moment, but the
>> "macros.rs" file name allows for more. Change the wording so that it
>> will remain valid even if additional macros are added to the file.
>>=20
>> Fix a couple of spelling errors and grammatical errors, and break up a
>> run-on sentence, for clarity.
>>=20
>> Cc: Alexandre Courbot <acourbot@nvidia.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> drivers/gpu/nova-core/regs/macros.rs | 14 +++++++-------
>> 1 file changed, 7 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-cor=
e/regs/macros.rs
>> index cdf668073480ed703c89ffa8628f5c9de6494687..864d1e83bed2979f5661e038=
f4c9fd87d33f69a7 100644
>> --- a/drivers/gpu/nova-core/regs/macros.rs
>> +++ b/drivers/gpu/nova-core/regs/macros.rs
>> @@ -1,17 +1,17 @@
>> // SPDX-License-Identifier: GPL-2.0
>>=20
>> -//! Macro to define register layout and accessors.
>> +//! `register!` macro to define register layout and accessors.
>
> I would have kept this line as-is. Users will most likely know the name o=
f the
> macro already. At this point, they will be looking for what it does, so
> mentioning "register" here is a bit redundant IMHO.
>
>> //!
>> //! A single register typically includes several fields, which are acces=
sed through a combination
>> //! of bit-shift and mask operations that introduce a class of potential=
 mistakes, notably because
>> //! not all possible field values are necessarily valid.
>> //!
>> -//! The macro in this module allow to define, using an intruitive and r=
eadable syntax, a dedicated
>> -//! type for each register with its own field accessors that can return=
 an error is a field's value
>> -//! is invalid.
>> +//! The `register!` macro in this module provides an intuitive and read=
able syntax for defining a
>> +//! dedicated type for each register. Each such type comes with its own=
 field accessors that can
>> +//! return an error if a field's value is invalid.
>>=20
>> -/// Defines a dedicated type for a register with an absolute offset, al=
ongside with getter and
>> -/// setter methods for its fields and methods to read and write it from=
 an `Io` region.
>> +/// Defines a dedicated type for a register with an absolute offset, in=
cluding getter and setter
>> +/// methods for its fields and methods to read and write it from an `Io=
` region.
>
> +cc Steven Price,
>
> Sorry for hijacking this patch, but I think that we should be more flexib=
le and
> allow for non-literal offsets in the macro.
>
> In Tyr, for example, some of the offsets need to be computed at runtime, =
i.e.:
>
> +pub(crate) struct AsRegister(usize);
> +
> +impl AsRegister {
> +    fn new(as_nr: usize, offset: usize) -> Result<Self> {
> +        if as_nr >=3D 32 {
> +            Err(EINVAL)
> +        } else {
> +            Ok(AsRegister(mmu_as(as_nr) + offset))
> +        }
> +    }
>
> Or:
>
> +pub(crate) struct Doorbell(usize);
> +
> +impl Doorbell {
> +    pub(crate) fn new(doorbell_id: usize) -> Self {
> +        Doorbell(0x80000 + (doorbell_id * 0x10000))
> +    }
>
> I don't think this will work with the current macro, JFYI.

IIUC from the comments on the next patches, your need is covered with
the relative and array registers definitions, is that correct?
