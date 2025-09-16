Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF222B595FB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 14:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A36510E7C3;
	Tue, 16 Sep 2025 12:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qCd3HLEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013056.outbound.protection.outlook.com
 [40.93.201.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA7110E7C3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 12:22:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFHwgwzJXpKBfgY8rPxRS//j3VLh6Tf0wijoA5omsNm5NqhNb3QZ7i2yV8L6cWcWhrDDA3dGXKBNHDKJS/cuV55E30DsjKORGXFA6/z+F3xItVIz5HcaQ7UpG/q3+Ms3fH8Y6MGdflVWNOCBU1tVtKQh6hKyIbPkmrw1nHGx3KKr1EkZ6mDLkOke/fU0bqlkuz4krTvlk6TiZdIo2YSDhQlc3UuxPlUnkc6JLD+ElefvJtm2/065UihKio3geTD4M/Pr8o6yuTbj6nQXnQDaIWylermvAspjlOSuP7lEg2CpoLO2cy0Nx5F0fDUTXowmbyE4/HUwbPU4HlULV9XgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOV4sGNmbMXcolF2eggEibbyv6drw29pAzNY13hPONM=;
 b=cLLUWU75UYzwjhnKpo/rr52XLMG7fnPsTXMkOCcmbiUaqiJIvzytvBh/sCpa1VwNNhEv5IIpQV4OtC/S9w+Pwt+cFNb0IMXEa/Vxa9iJI5tcyAd3O+8RXX1OBK6QwcjIYwrWe0RjQotX53c++wEhBn1CyFqR8a4KViEkOLVtmuVhuBk7W1G3FQWAu0vvif/Z+gNZnpE7HSdorImj0W5AyPKHj1eFBTUxKMiUPg8YQ3wbXSvGci+0FOt3mWfLUEzFuS22N2+y3DPQUgAz7cPVS2jHGwv8+oQCazYGZOw0Cqg+VB4HHEmWdgPvuoUI2YrwJpKdpFF0pkxq8uyHrYQcrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOV4sGNmbMXcolF2eggEibbyv6drw29pAzNY13hPONM=;
 b=qCd3HLEwm/4HWT2UyYlRqkBtBgHpMk/oUA5QBnm1cj+O/xlfAuz8tVUvmwFEslcFh686uFUk/YWuV7DQe9MSJmSVUpMTkY8qC9uIEB88lhMdDosd7qSdJNkEk4JiM4IlBC2f6IagyG2w/Re+YOuBBlyFq0LwPLQa5As16NJnIy0ziB3xoC+CXtQV5i81pvAimaDJYX6u6COqyL3fNvGiUzP3oxdtgaswQkKxME7xEBw9H/GqXsuFaR+Moivr/Fos4hVUCNasTT9yjnwLgOpHbsQVbSps2UZHaU915Z+QJE2zKni3ZhelgdZYnCnwRXxShY9QOoE/o/pdnTZ/sn9mlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 16 Sep
 2025 12:22:04 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 12:22:04 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v6 08/15] lib/test_hmm: add zone device private THP test
 infrastructure
Date: Tue, 16 Sep 2025 22:21:21 +1000
Message-ID: <20250916122128.2098535-9-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916122128.2098535-1-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SYBPR01CA0074.ausprd01.prod.outlook.com
 (2603:10c6:10:3::14) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 581ea409-a8ef-4682-24c0-08ddf51ba56d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkZNZEFIaXN1eis3ZXEvUG9DanBJUGJ5MFRPR0NHRyt4ZGpQeEswN2hXY3BF?=
 =?utf-8?B?QmE5S050Y0JYS0hoaXFkVDVmMi9sVnZOM0NEZTJ6V0pnQ094Vy9SSGNKSThr?=
 =?utf-8?B?ekxwbk9qZlh3NVNyWlVsOGk4NEVLZk5yTi80a21LNHdDTFIwanB0RWRMRkxv?=
 =?utf-8?B?QUdHUXZ2eS9PeVZqbGhMNHpXMjBKUUJ6QTJ2amhMRjRraTNDTkk1WWs3RHZu?=
 =?utf-8?B?WnRrazhVeU44dHhJMi9KYkt5S3JBVHUvdkQyamdZZ3NsOVllMjFYZGdDQmVh?=
 =?utf-8?B?OU9Mai9URUo5MUdudVlOczUycGRoR20wdUN5OWkrZW1GbGVpTkhhbFRZZ2Ny?=
 =?utf-8?B?dXVmWVNJZU1UbWh2b3dEU3ZxQWYyUTBZRUlwUlJOckJ6Qy9PMTRiSVBvaWZK?=
 =?utf-8?B?ZG9SR3lUbDF6bFZwUE1nRnM4ODBUMVRQTGJLaS9BL3U3aEYzb1ZYRVJsRE8w?=
 =?utf-8?B?eW1xcHA1c0RaMzM1T3IydmpIYVFWbTY1V2Rvb0ZzQklvUmRVMWxaZnNsZWNn?=
 =?utf-8?B?TGxwTkt3NDQ3NEc5UkV3M0QyK0JPMkVCSXpIQzA2Z3BiQWRIYmFZS1dZRUZV?=
 =?utf-8?B?MTM3d1pNbkprQldkdTNXOHJrNU9qWXBUaE5EQU5lR2pjQ2ZtdENtYUZZRCth?=
 =?utf-8?B?ZUpHMmJhNS8rQldaYXpXVkR1WVBJZStPVFdIU2JweWMwaTJ0dk1FMVppNmpN?=
 =?utf-8?B?NExuenNJMU5VYUIxVzJ6SHdLNndteVJDQ2NxazJMVWZVbEFMUXBIcFZQYzJt?=
 =?utf-8?B?QmlEUFhIZzNWRkVGYTB5ZFpIR044aStRMWtuQ2dNUHN1aFMvajRUeXY0R0o2?=
 =?utf-8?B?QUptTjN4VzMvdjRVVkxrc0YrYXVwU3p3L01Ra3FJOWdvNDYwNWpQWTVXcTJv?=
 =?utf-8?B?RnkydnNXSGdPYmRLUnRiQTNNdEYvOUpUcVpzSUNpZmhOWTlBR2ZaVXkvTmtz?=
 =?utf-8?B?eUV5WFJKeEtGeXVnM3FURFZNSHBYVTBNdi92RGkxWEV6Y1JyT0t0SXBSRkwv?=
 =?utf-8?B?YTE2UmlVNHFjREc1QjVzS0JOL09FZllPWVlBUk91VTl3aTBIQytGbXpvMEF6?=
 =?utf-8?B?Ly93T0FLQzhrUzVZZ3BQQmNHNU5jaFROVXZINlFLWklsc0x0NnlMdWRUdHNn?=
 =?utf-8?B?aGVTM2sxdThod1YwbHNhQWR3djUrOTA1bDhIS29yUzhjUTA5UFpXOUV3eTVU?=
 =?utf-8?B?dUhBY2NEY0tSaCt4OHZHUGV3ejRqTVg3czlIcXpYaE9yQUEzSmQraGJlSk5t?=
 =?utf-8?B?SktER011ZUUwbGoyN2ZzWkRya2RBL3Frdy9jekxhYzh5YVZqQVpnQ2Vodmwv?=
 =?utf-8?B?bnFKTC9rUjlwK1dvUFpQMTV5MmROMHdhMVY0TVUrNGVlT3ZVb0RaUmVGempQ?=
 =?utf-8?B?Qm5DUGxmenlKT041NEppOTBBMzM4ZG1vLzFJaE1WRnkrbklmMTJ5QWVHQkNt?=
 =?utf-8?B?bHRycEJGNWVWZUs3K1I2NGRzMUpmQmtFeDZMem91TTY2bTdaK2RCQ1MwaXVq?=
 =?utf-8?B?SW93SE9TcjQ5d2E2eWYxajl2S2Z1eGYxNGhuN25yL0FRNUkwRWttNmZ0Mm04?=
 =?utf-8?B?bXh0NytTZ09VMVVzbFJmQS9xRDM3Q1A2VmFtZU9HMHlFek5Pa0gycW9ic3Ri?=
 =?utf-8?B?M3pZOUVjbi9iYnVjRjNyYk5WMlg3NkllbjJKSkVDUGxvVHNQQklMdllRT3l6?=
 =?utf-8?B?N0JBVnlkRHB0bWZXNUQ5Z0lCcjJRc1VGYmpSNWZ0YlkrL3JWcEJrMHBweE9y?=
 =?utf-8?B?akl5NiswMnFkRSthQ0R1cWF6OURweW5UQkVkTkJpYWlBVzl2VGhjeU95NWFz?=
 =?utf-8?B?bG5TR0VjbkU4c0JvTGwrZktleVJ4cm8xSEZkWkoxcDBPNXpFdGpybkF4dTU3?=
 =?utf-8?B?VklyRUlYd3ZQNnpyVVNzVzQ4Sm1uVlJvcHBlaUc0NUdSZkUySzFiVTVqajBB?=
 =?utf-8?Q?sXnYRJcIRb0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nzk5cDc3N0o2WnIwN2JSMGFweEFSeDlIRmJ1blRyV01rRXcwU2dFYWZ1cFNG?=
 =?utf-8?B?ekt6KzliZjAwWFBweVlZaEhKZXUrV1NSSGR6RnpFc2htdkQxaU13bUxHMDhp?=
 =?utf-8?B?Tng2VTJWdTBhM3MwZ3ZnMTREK3QrUW9kdGE4RlJBa05SUXhKSDBVeUhrd1Jm?=
 =?utf-8?B?Znc3Y3NEOW50dzRCeE5XRFpiemwvQzFySmZ1eEpnTXo3OGRsR1prT3V1ZzJD?=
 =?utf-8?B?UjZxVDhXbXFZTS9XM0VpdS9acGdjcG5oVkcxN0hZdzBia1V5bGl1L1dRdGZo?=
 =?utf-8?B?T2VobUF5VllrMVR6MlMvcUxodUdaaHRYcjJJeGh5eFFHUndNK3RPbFhSbTNv?=
 =?utf-8?B?Kytnb1hTaWFWK2lNNGFvVDdOTURBMFVsamFLbEx3aFAva1J0RjZzS0hua0pk?=
 =?utf-8?B?ZFp3M0I0TG8vVklEaFJESjNlTHl5S0pxZC9HREdRaktNNGljMVVlcGt5dmUz?=
 =?utf-8?B?d29JaVJqSmhFOU4zV0lDdmliVmV0U20xaVN1Ymc3blZRNnRWUitSTjNpa1pF?=
 =?utf-8?B?UVRiM0gwaWh6U3RzNm90SHJZMUVCNHI2OHA1WGFsQmhOT0FHUERRaVV2MFJX?=
 =?utf-8?B?VzNCaGFIM3hlUFU0K012dWVJbmcwVFQ2MDk5WFVTM2lPUjQ3Y0gwWS9laS9w?=
 =?utf-8?B?eVVpUGdLYWJ0ZkZKbnJONGxsNUgyL0RaRDRLYW96Tk1ZUkxoWkZtUlVVanVq?=
 =?utf-8?B?RHJvdS9hd3JxQ1JndldnK1NrN09TcXE5WndvWG5yZWR0TitsTnk1TUNnQjR2?=
 =?utf-8?B?Q2dEeTR3N2tBeVNFbDk3UXVmS0NDaDUvME5lWE5Gamt4bkVraGt4NkZJWTJi?=
 =?utf-8?B?UHQwYWpLakorMFQ5OTdXWnpseE5aMDl5UjM4Ynh4Q0prMWxpOXJaU3JhOVND?=
 =?utf-8?B?Mi9IQVIzSnorZVE1a1pYYjN4RUp6OVlVSVdvcU1qN2R4QWsyaFl0WXBwOTFt?=
 =?utf-8?B?NHRvYWRiR2JRN05vNmM3M0hDUnRVbjJ1d25JSGxpV2F1VW1IUTVMbTNSOWRs?=
 =?utf-8?B?RkEzRVZCbFFOeVZSRnA0SGdxdm5RaC95RlJ1QlAzS3RDRGRNUU1SMmZoVHln?=
 =?utf-8?B?b3l0NWZKdUsrSkp6VHlSY3pkaHcxVUFZVllQU2RObVFBa0Jza1ZhZW9CZk11?=
 =?utf-8?B?ZTk0cTlONnRYS084MmdZYkZOZkVrVzU5ajdvUVhjUDM4Yy9WUnhMSXBLR2pz?=
 =?utf-8?B?Vy83d2lPSWpRV3BnSy9BZE1YWVZndWxMYjUyUUhDWlhHMFlQdmV5M2FwdUpx?=
 =?utf-8?B?UTRnNnhGNUNLS0tPK2tIQjh1OGtISVgvYXNGaU9ESHpYK1JzOFg0MndVVFh2?=
 =?utf-8?B?LzJiZWFXcVBTLythRmJYM0ZpTmovSzdINnFDM0J5YnBVWmllWWoyb00xUGpw?=
 =?utf-8?B?Nno5YXpIUzFwcTdVVHJ0WmVIVmVSNnpsRE5Bam9RcXo4RW9MZ3Erc2hlRllD?=
 =?utf-8?B?QWZ6b3JCQnFPc3BIMTJ5UjhhME1FT0NBZi9GOENzSFpzUlZWenpjYXAreHBN?=
 =?utf-8?B?ZFl4Z0lOUVVqMlJpc3NvNzFtbnRGQmQ4WEJ1R2Y1dzZQK1YxcmVpM3VGQUNu?=
 =?utf-8?B?TXpJMVJ5OVJWeUx1alpJTlY2b1ZXOXZBNUhXcXhVUzBZZzIzZWkxL1p0SStK?=
 =?utf-8?B?WlMySHBpaU00QWYzOHoxSmZEYnhOMWJzcUtpTkhBckQ3T25PamYyRnhsYkJV?=
 =?utf-8?B?Sk9WV0N1clZpcDRnTGxXNjU5UjhWcDc3R3REOTlCRTJNRmxUYmNJOEZZa2ZW?=
 =?utf-8?B?M2tORnBSOHJuUTd0WlBFcTI5eXBRYVNhT3lXZEVYOS8xMGdBVzdpcUV3NVFH?=
 =?utf-8?B?TG8vdWFDYS9VWFBsS0FNTTJVRkErN1VTNlkyczBtNmN4NjBGOWpwZnFGdWZJ?=
 =?utf-8?B?RVVXMVJXWU5rclVnQ0tIZzJHZ0xxZERZZ0V6TFhKcWMxeXVPcUxIcHV3WDRn?=
 =?utf-8?B?VU9YejJMYy9LM3dPRTg2eXlJMzh1Y0pTcHFKa3hPSUJBV04yZ2JUcDFJQmxX?=
 =?utf-8?B?MnEzMU0wNXVYamhEeWhQbzIyWUdBa0I0MjBrQVlnVHhwNUhOckpIZHhOcEJR?=
 =?utf-8?B?Y1Rpdjg0RHNWaUswWkRqWEtWdXRwVER3UXBMOUFBZFBrUmNZWmR4QURTdHlC?=
 =?utf-8?B?Z1NrTUdRelJoTmt2bWo5RWY2eE4waEJ4dERxYlRYdVhON3VmbTlkVGIxYW5o?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581ea409-a8ef-4682-24c0-08ddf51ba56d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 12:22:04.8157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9OhJlftJXyRFCto3+vS3PTZ8dbYtRhRyUoW2DfKOkcTJpjCYbJGpx3zgdW5xDpGCFCeYdVveo9tQFaHr7dZfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373
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

Enhance the hmm test driver (lib/test_hmm) with support for THP pages.

A new pool of free_folios() has now been added to the dmirror device,
which can be allocated when a request for a THP zone device private page
is made.

Add compound page awareness to the allocation function during normal
migration and fault based migration.  These routines also copy
folio_nr_pages() when moving data between system memory and device memory.

args.src and args.dst used to hold migration entries are now dynamically
allocated (as they need to hold HPAGE_PMD_NR entries or more).

Split and migrate support will be added in future patches in this series.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 include/linux/memremap.h |  12 ++
 lib/test_hmm.c           | 368 +++++++++++++++++++++++++++++++--------
 2 files changed, 304 insertions(+), 76 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 9c20327c2be5..75987a8cfc6b 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -177,6 +177,18 @@ static inline bool folio_is_pci_p2pdma(const struct folio *folio)
 		folio->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
 }
 
+static inline void *folio_zone_device_data(const struct folio *folio)
+{
+	VM_WARN_ON_FOLIO(!folio_is_device_private(folio), folio);
+	return folio->page.zone_device_data;
+}
+
+static inline void folio_set_zone_device_data(struct folio *folio, void *data)
+{
+	VM_WARN_ON_FOLIO(!folio_is_device_private(folio), folio);
+	folio->page.zone_device_data = data;
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 83e3d8208a54..50e175edc58a 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -119,6 +119,7 @@ struct dmirror_device {
 	unsigned long		calloc;
 	unsigned long		cfree;
 	struct page		*free_pages;
+	struct folio		*free_folios;
 	spinlock_t		lock;		/* protects the above */
 };
 
@@ -492,7 +493,7 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 }
 
 static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
-				   struct page **ppage)
+				  struct page **ppage, bool is_large)
 {
 	struct dmirror_chunk *devmem;
 	struct resource *res = NULL;
@@ -572,20 +573,45 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		pfn_first, pfn_last);
 
 	spin_lock(&mdevice->lock);
-	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
+	for (pfn = pfn_first; pfn < pfn_last; ) {
 		struct page *page = pfn_to_page(pfn);
 
+		if (is_large && IS_ALIGNED(pfn, HPAGE_PMD_NR)
+			&& (pfn + HPAGE_PMD_NR <= pfn_last)) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+			pfn += HPAGE_PMD_NR;
+			continue;
+		}
+
 		page->zone_device_data = mdevice->free_pages;
 		mdevice->free_pages = page;
+		pfn++;
 	}
+
+	ret = 0;
 	if (ppage) {
-		*ppage = mdevice->free_pages;
-		mdevice->free_pages = (*ppage)->zone_device_data;
-		mdevice->calloc++;
+		if (is_large) {
+			if (!mdevice->free_folios) {
+				ret = -ENOMEM;
+				goto err_unlock;
+			}
+			*ppage = folio_page(mdevice->free_folios, 0);
+			mdevice->free_folios = (*ppage)->zone_device_data;
+			mdevice->calloc += HPAGE_PMD_NR;
+		} else if (mdevice->free_pages) {
+			*ppage = mdevice->free_pages;
+			mdevice->free_pages = (*ppage)->zone_device_data;
+			mdevice->calloc++;
+		} else {
+			ret = -ENOMEM;
+			goto err_unlock;
+		}
 	}
+err_unlock:
 	spin_unlock(&mdevice->lock);
 
-	return 0;
+	return ret;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -598,10 +624,13 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	return ret;
 }
 
-static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
+static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
+					      bool is_large)
 {
 	struct page *dpage = NULL;
 	struct page *rpage = NULL;
+	unsigned int order = is_large ? HPAGE_PMD_ORDER : 0;
+	struct dmirror_device *mdevice = dmirror->mdevice;
 
 	/*
 	 * For ZONE_DEVICE private type, this is a fake device so we allocate
@@ -610,49 +639,55 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	 * data and ignore rpage.
 	 */
 	if (dmirror_is_private_zone(mdevice)) {
-		rpage = alloc_page(GFP_HIGHUSER);
+		rpage = folio_page(folio_alloc(GFP_HIGHUSER, order), 0);
 		if (!rpage)
 			return NULL;
 	}
 	spin_lock(&mdevice->lock);
 
-	if (mdevice->free_pages) {
+	if (is_large && mdevice->free_folios) {
+		dpage = folio_page(mdevice->free_folios, 0);
+		mdevice->free_folios = dpage->zone_device_data;
+		mdevice->calloc += 1 << order;
+		spin_unlock(&mdevice->lock);
+	} else if (!is_large && mdevice->free_pages) {
 		dpage = mdevice->free_pages;
 		mdevice->free_pages = dpage->zone_device_data;
 		mdevice->calloc++;
 		spin_unlock(&mdevice->lock);
 	} else {
 		spin_unlock(&mdevice->lock);
-		if (dmirror_allocate_chunk(mdevice, &dpage))
+		if (dmirror_allocate_chunk(mdevice, &dpage, is_large))
 			goto error;
 	}
 
-	zone_device_page_init(dpage);
+	zone_device_folio_init(page_folio(dpage), order);
 	dpage->zone_device_data = rpage;
 	return dpage;
 
 error:
 	if (rpage)
-		__free_page(rpage);
+		__free_pages(rpage, order);
 	return NULL;
 }
 
 static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 					   struct dmirror *dmirror)
 {
-	struct dmirror_device *mdevice = dmirror->mdevice;
 	const unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
 	unsigned long addr;
 
-	for (addr = args->start; addr < args->end; addr += PAGE_SIZE,
-						   src++, dst++) {
+	for (addr = args->start; addr < args->end; ) {
 		struct page *spage;
 		struct page *dpage;
 		struct page *rpage;
+		bool is_large = *src & MIGRATE_PFN_COMPOUND;
+		int write = (*src & MIGRATE_PFN_WRITE) ? MIGRATE_PFN_WRITE : 0;
+		unsigned long nr = 1;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+			goto next;
 
 		/*
 		 * Note that spage might be NULL which is OK since it is an
@@ -662,17 +697,45 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		if (WARN(spage && is_zone_device_page(spage),
 		     "page already in device spage pfn: 0x%lx\n",
 		     page_to_pfn(spage)))
+			goto next;
+
+		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (!dpage) {
+			struct folio *folio;
+			unsigned long i;
+			unsigned long spfn = *src >> MIGRATE_PFN_SHIFT;
+			struct page *src_page;
+
+			if (!is_large)
+				goto next;
+
+			if (!spage && is_large) {
+				nr = HPAGE_PMD_NR;
+			} else {
+				folio = page_folio(spage);
+				nr = folio_nr_pages(folio);
+			}
+
+			for (i = 0; i < nr && addr < args->end; i++) {
+				dpage = dmirror_devmem_alloc_page(dmirror, false);
+				rpage = BACKING_PAGE(dpage);
+				rpage->zone_device_data = dmirror;
+
+				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				src_page = pfn_to_page(spfn + i);
+
+				if (spage)
+					copy_highpage(rpage, src_page);
+				else
+					clear_highpage(rpage);
+				src++;
+				dst++;
+				addr += PAGE_SIZE;
+			}
 			continue;
-
-		dpage = dmirror_devmem_alloc_page(mdevice);
-		if (!dpage)
-			continue;
+		}
 
 		rpage = BACKING_PAGE(dpage);
-		if (spage)
-			copy_highpage(rpage, spage);
-		else
-			clear_highpage(rpage);
 
 		/*
 		 * Normally, a device would use the page->zone_device_data to
@@ -684,10 +747,42 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if ((*src & MIGRATE_PFN_WRITE) ||
-		    (!spage && args->vma->vm_flags & VM_WRITE))
-			*dst |= MIGRATE_PFN_WRITE;
+
+		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+
+		if (is_large) {
+			int i;
+			struct folio *folio = page_folio(dpage);
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+			if (folio_test_large(folio)) {
+				for (i = 0; i < folio_nr_pages(folio); i++) {
+					struct page *dst_page =
+						pfn_to_page(page_to_pfn(rpage) + i);
+					struct page *src_page =
+						pfn_to_page(page_to_pfn(spage) + i);
+
+					if (spage)
+						copy_highpage(dst_page, src_page);
+					else
+						clear_highpage(dst_page);
+					src++;
+					dst++;
+					addr += PAGE_SIZE;
+				}
+				continue;
+			}
+		}
+
+		if (spage)
+			copy_highpage(rpage, spage);
+		else
+			clear_highpage(rpage);
+
+next:
+		src++;
+		dst++;
+		addr += PAGE_SIZE;
 	}
 }
 
@@ -734,14 +829,17 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 	const unsigned long *src = args->src;
 	const unsigned long *dst = args->dst;
 	unsigned long pfn;
+	const unsigned long start_pfn = start >> PAGE_SHIFT;
+	const unsigned long end_pfn = end >> PAGE_SHIFT;
 
 	/* Map the migrated pages into the device's page tables. */
 	mutex_lock(&dmirror->mutex);
 
-	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++,
-								src++, dst++) {
+	for (pfn = start_pfn; pfn < end_pfn; pfn++, src++, dst++) {
 		struct page *dpage;
 		void *entry;
+		int nr, i;
+		struct page *rpage;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
 			continue;
@@ -750,13 +848,25 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		if (!dpage)
 			continue;
 
-		entry = BACKING_PAGE(dpage);
-		if (*dst & MIGRATE_PFN_WRITE)
-			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
-		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
-		if (xa_is_err(entry)) {
-			mutex_unlock(&dmirror->mutex);
-			return xa_err(entry);
+		if (*dst & MIGRATE_PFN_COMPOUND)
+			nr = folio_nr_pages(page_folio(dpage));
+		else
+			nr = 1;
+
+		WARN_ON_ONCE(end_pfn < start_pfn + nr);
+
+		rpage = BACKING_PAGE(dpage);
+		VM_WARN_ON(folio_nr_pages(page_folio(rpage)) != nr);
+
+		for (i = 0; i < nr; i++) {
+			entry = folio_page(page_folio(rpage), i);
+			if (*dst & MIGRATE_PFN_WRITE)
+				entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
+			entry = xa_store(&dmirror->pt, pfn + i, entry, GFP_ATOMIC);
+			if (xa_is_err(entry)) {
+				mutex_unlock(&dmirror->mutex);
+				return xa_err(entry);
+			}
 		}
 	}
 
@@ -829,31 +939,66 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 	unsigned long start = args->start;
 	unsigned long end = args->end;
 	unsigned long addr;
+	unsigned int order = 0;
+	int i;
 
-	for (addr = start; addr < end; addr += PAGE_SIZE,
-				       src++, dst++) {
+	for (addr = start; addr < end; ) {
 		struct page *dpage, *spage;
 
 		spage = migrate_pfn_to_page(*src);
-		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+		if (!spage || !(*src & MIGRATE_PFN_MIGRATE)) {
+			addr += PAGE_SIZE;
+			goto next;
+		}
 
 		if (WARN_ON(!is_device_private_page(spage) &&
-			    !is_device_coherent_page(spage)))
-			continue;
+			    !is_device_coherent_page(spage))) {
+			addr += PAGE_SIZE;
+			goto next;
+		}
+
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-		if (!dpage)
-			continue;
-		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
-			 page_to_pfn(spage), page_to_pfn(dpage));
+		order = folio_order(page_folio(spage));
 
+		if (order)
+			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
+						order, args->vma, addr), 0);
+		else
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+
+		/* Try with smaller pages if large allocation fails */
+		if (!dpage && order) {
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+			if (!dpage)
+				return VM_FAULT_OOM;
+			order = 0;
+		}
+
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+				page_to_pfn(spage), page_to_pfn(dpage));
 		lock_page(dpage);
 		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
 		copy_highpage(dpage, spage);
 		*dst = migrate_pfn(page_to_pfn(dpage));
 		if (*src & MIGRATE_PFN_WRITE)
 			*dst |= MIGRATE_PFN_WRITE;
+		if (order)
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+		for (i = 0; i < (1 << order); i++) {
+			struct page *src_page;
+			struct page *dst_page;
+
+			src_page = pfn_to_page(page_to_pfn(spage) + i);
+			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+
+			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			copy_highpage(dst_page, src_page);
+		}
+next:
+		addr += PAGE_SIZE << order;
+		src += 1 << order;
+		dst += 1 << order;
 	}
 	return 0;
 }
@@ -879,11 +1024,14 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[32] = { 0 };
-	unsigned long dst_pfns[32] = { 0 };
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
+	unsigned long *src_pfns;
+	unsigned long *dst_pfns;
+
+	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
+	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
 	start = cmd->addr;
 	end = start + size;
@@ -902,7 +1050,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -912,7 +1060,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = dmirror_select_device(dmirror);
+		args.flags = dmirror_select_device(dmirror) | MIGRATE_VMA_SELECT_COMPOUND;
 
 		ret = migrate_vma_setup(&args);
 		if (ret)
@@ -928,6 +1076,8 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+	kvfree(src_pfns);
+	kvfree(dst_pfns);
 
 	return ret;
 }
@@ -939,12 +1089,12 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[32] = { 0 };
-	unsigned long dst_pfns[32] = { 0 };
 	struct dmirror_bounce bounce;
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
+	unsigned long *src_pfns = NULL;
+	unsigned long *dst_pfns = NULL;
 
 	start = cmd->addr;
 	end = start + size;
@@ -955,6 +1105,18 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	if (!mmget_not_zero(mm))
 		return -EINVAL;
 
+	ret = -ENOMEM;
+	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns),
+			  GFP_KERNEL | __GFP_NOFAIL);
+	if (!src_pfns)
+		goto free_mem;
+
+	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns),
+			  GFP_KERNEL | __GFP_NOFAIL);
+	if (!dst_pfns)
+		goto free_mem;
+
+	ret = 0;
 	mmap_read_lock(mm);
 	for (addr = start; addr < end; addr = next) {
 		vma = vma_lookup(mm, addr);
@@ -962,7 +1124,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -972,7 +1134,8 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = MIGRATE_VMA_SELECT_SYSTEM;
+		args.flags = MIGRATE_VMA_SELECT_SYSTEM |
+				MIGRATE_VMA_SELECT_COMPOUND;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
@@ -992,7 +1155,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	 */
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
-		return ret;
+		goto free_mem;
 	mutex_lock(&dmirror->mutex);
 	ret = dmirror_do_read(dmirror, start, end, &bounce);
 	mutex_unlock(&dmirror->mutex);
@@ -1003,11 +1166,14 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	}
 	cmd->cpages = bounce.cpages;
 	dmirror_bounce_fini(&bounce);
-	return ret;
+	goto free_mem;
 
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+free_mem:
+	kfree(src_pfns);
+	kfree(dst_pfns);
 	return ret;
 }
 
@@ -1200,6 +1366,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	unsigned long i;
 	unsigned long *src_pfns;
 	unsigned long *dst_pfns;
+	unsigned int order = 0;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
@@ -1215,13 +1382,25 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 		if (WARN_ON(!is_device_private_page(spage) &&
 			    !is_device_coherent_page(spage)))
 			continue;
+
+		order = folio_order(page_folio(spage));
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+		if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+			dpage = folio_page(folio_alloc(GFP_HIGHUSER_MOVABLE,
+					      order), 0);
+		} else {
+			dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+			order = 0;
+		}
+
+		/* TODO Support splitting here */
 		lock_page(dpage);
-		copy_highpage(dpage, spage);
 		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
+		if (order)
+			dst_pfns[i] |= MIGRATE_PFN_COMPOUND;
+		folio_copy(page_folio(dpage), page_folio(spage));
 	}
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -1234,7 +1413,12 @@ static void dmirror_remove_free_pages(struct dmirror_chunk *devmem)
 {
 	struct dmirror_device *mdevice = devmem->mdevice;
 	struct page *page;
+	struct folio *folio;
+
 
+	for (folio = mdevice->free_folios; folio; folio = folio_zone_device_data(folio))
+		if (dmirror_page_to_chunk(folio_page(folio, 0)) == devmem)
+			mdevice->free_folios = folio_zone_device_data(folio);
 	for (page = mdevice->free_pages; page; page = page->zone_device_data)
 		if (dmirror_page_to_chunk(page) == devmem)
 			mdevice->free_pages = page->zone_device_data;
@@ -1265,6 +1449,7 @@ static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
 		mdevice->devmem_count = 0;
 		mdevice->devmem_capacity = 0;
 		mdevice->free_pages = NULL;
+		mdevice->free_folios = NULL;
 		kfree(mdevice->devmem_chunks);
 		mdevice->devmem_chunks = NULL;
 	}
@@ -1378,18 +1563,30 @@ static void dmirror_devmem_free(struct page *page)
 {
 	struct page *rpage = BACKING_PAGE(page);
 	struct dmirror_device *mdevice;
+	struct folio *folio = page_folio(rpage);
+	unsigned int order = folio_order(folio);
 
-	if (rpage != page)
-		__free_page(rpage);
+	if (rpage != page) {
+		if (order)
+			__free_pages(rpage, order);
+		else
+			__free_page(rpage);
+		rpage = NULL;
+	}
 
 	mdevice = dmirror_page_to_device(page);
 	spin_lock(&mdevice->lock);
 
 	/* Return page to our allocator if not freeing the chunk */
 	if (!dmirror_page_to_chunk(page)->remove) {
-		mdevice->cfree++;
-		page->zone_device_data = mdevice->free_pages;
-		mdevice->free_pages = page;
+		mdevice->cfree += 1 << order;
+		if (order) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+		} else {
+			page->zone_device_data = mdevice->free_pages;
+			mdevice->free_pages = page;
+		}
 	}
 	spin_unlock(&mdevice->lock);
 }
@@ -1397,36 +1594,52 @@ static void dmirror_devmem_free(struct page *page)
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args = { 0 };
-	unsigned long src_pfns = 0;
-	unsigned long dst_pfns = 0;
 	struct page *rpage;
 	struct dmirror *dmirror;
-	vm_fault_t ret;
+	vm_fault_t ret = 0;
+	unsigned int order, nr;
 
 	/*
 	 * Normally, a device would use the page->zone_device_data to point to
 	 * the mirror but here we use it to hold the page for the simulated
 	 * device memory and that page holds the pointer to the mirror.
 	 */
-	rpage = vmf->page->zone_device_data;
+	rpage = folio_zone_device_data(page_folio(vmf->page));
 	dmirror = rpage->zone_device_data;
 
 	/* FIXME demonstrate how we can adjust migrate range */
+	order = folio_order(page_folio(vmf->page));
+	nr = 1 << order;
+
+	/*
+	 * Consider a per-cpu cache of src and dst pfns, but with
+	 * large number of cpus that might not scale well.
+	 */
+	args.start = ALIGN_DOWN(vmf->address, (PAGE_SIZE << order));
 	args.vma = vmf->vma;
-	args.start = vmf->address;
-	args.end = args.start + PAGE_SIZE;
-	args.src = &src_pfns;
-	args.dst = &dst_pfns;
+	args.end = args.start + (PAGE_SIZE << order);
+
+	nr = (args.end - args.start) >> PAGE_SHIFT;
+	args.src = kcalloc(nr, sizeof(unsigned long), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(unsigned long), GFP_KERNEL);
 	args.pgmap_owner = dmirror->mdevice;
 	args.flags = dmirror_select_device(dmirror);
 	args.fault_page = vmf->page;
 
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
+
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
 
 	ret = dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
 	if (ret)
-		return ret;
+		goto err;
 	migrate_vma_pages(&args);
 	/*
 	 * No device finalize step is needed since
@@ -1434,7 +1647,10 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	 * invalidated the device page table.
 	 */
 	migrate_vma_finalize(&args);
-	return 0;
+err:
+	kfree(args.src);
+	kfree(args.dst);
+	return ret;
 }
 
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
@@ -1465,7 +1681,7 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
 		return ret;
 
 	/* Build a list of free ZONE_DEVICE struct pages */
-	return dmirror_allocate_chunk(mdevice, NULL);
+	return dmirror_allocate_chunk(mdevice, NULL, false);
 }
 
 static void dmirror_device_remove(struct dmirror_device *mdevice)
-- 
2.50.1

