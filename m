Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A2B58C55
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 05:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A47110E065;
	Tue, 16 Sep 2025 03:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F0z43rKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176E610E065
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:28:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdS/gnPG1biWB6/8ZaOBCz6gEpQ+IkMNDS02FtYnmJMlC7YTzW/xkOH6Zzp24E/dy731SlcMM8h6pKzPJgZsiiBKwA9Yj7ohBYhXHQaUm0R+QiQtlgBzSP7VTGJugGQPpay8IW+AgHUUbOF8ZgnHZYNpytGQ17ojot9+t/VLlQox8rthsR9NhteyWe29yRPcQiZrVzgwog2FWcU6c7i4RGB04V0R6W9frO3vEWN0BjqPPAnUEohAjWNDb53APRG60F2EiVUX78euGXc5YudTItJVHXeglMD1UxGhCiKfXZvNYnmKYh7jXRPRDfn/aNNvqTz7xIuPPWB6WZyX4JOSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Al5M5VeE0PAyYl9c38zXqXAIw2Fm0hrGybMBZbWTtIc=;
 b=KpzVxWyk4uAWuLDTqKy/IfCkTsCWkA91mRHwWVJbC4knyOT/jG7Z4qtlMen0UUmsaaKKfQBvoG0orOrfVeSkiH1WvESjwZURkU7lznEvr8gwRLhGVa207XXxt/MHMAWRMPcgkr58UvcuHPtRi5hr2TPDcT11g9xfchaarv12EyWCT2AE6W/147ujDq14zTU7H4wQX0Q/tCGZ2n/s+TeV+Hkb96pyoc9T6CF7DL4KVGTYXgQIQcnyka6kW6waM14IVM4fW60cS+DFjXvUaYnkc3Fgbos3Ycltf2oikxMyAXf6Iadp2GZsaewXcA2z/DglfSTbzf5TUtzdCpl/cMelGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Al5M5VeE0PAyYl9c38zXqXAIw2Fm0hrGybMBZbWTtIc=;
 b=F0z43rKn/52Eva25Ax0OtLpLxRqAuYEigj8X/OU4TIcnprOKj9FGaaFyUeT6biztajBzGjq4iPWM2zElZV8CJQOErglnojpMFmEqb6q7P7GXd9WBZ3Hk/MTziK0Xk6+8Iy6K+aZoS0a1S5scyxe2r2b8wEjrSBz/PpWKnD9anec5MJQ7fLk+VrFVLA2moV1SX6oSqul7paUrjeFGP6ytCwlIts3zPVZZCSJmKvoHML5ul47Cw3+9C6/RNGOuZMeE3v751HBHZnjk5VYoyZTt432pHGEfahiwBPsdneZuuXCHEPmUGNHa0LE6ydW61DHSSG9DXVGobFPcF23fWj4biw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.30; Tue, 16 Sep
 2025 03:27:59 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 03:27:59 +0000
Message-ID: <8a2c4803-d613-4592-9114-d68b97bf3fb0@nvidia.com>
Date: Tue, 16 Sep 2025 13:27:51 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 02/15] mm/huge_memory: add device-private THP support to PMD
 operations
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-3-balbirs@nvidia.com>
 <17e3c19e-0719-4643-8db8-cf8c5b5aa022@redhat.com>
 <49776f0a-d891-40be-bce3-c2b1f16bd825@nvidia.com>
 <4de00290-7c29-42f5-b8aa-58a77b17c1d5@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <4de00290-7c29-42f5-b8aa-58a77b17c1d5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:a03:54::20) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN0PR12MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: 35cdd70e-1b82-4682-6ed8-08ddf4d10905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnpDVmx2T09Pb3R5eFA4OWlhTHpibHFwZzdMeU5CMWFXWGJPZjl6TGhBdjA1?=
 =?utf-8?B?bTZSczM0QmpLNTFYTVMvYlZVQitmQXZlMWYwVm16dDJhOUtoYzlxSG9kSlZR?=
 =?utf-8?B?TEVUdkxtQnRTTkZSUGNCQU0rcXlQbFhjMldTZER5Ym8rOG43cnF0TWpBdXVR?=
 =?utf-8?B?bXFMU0U1ZWs5M3dCZkM4MEs2dWFUcndOUldRSzQ1cjJrWkxjdmRvUzlMcElI?=
 =?utf-8?B?QTM0RGJBLzJBMWQxM3hxNWc2NHUrVHNHRGFLWHN1d1ZZcmphb0lwRHp5ZUZx?=
 =?utf-8?B?dTNwa0k5aTdMTDFqRHdHUGlrZmhkRmV5c2diVWFDZzBmSzNjOWp4RG5JeHZh?=
 =?utf-8?B?OTJXRm5scDRjSFhpaURBN2FBWXlnaEpkNmFEWUJTR2crc0psMjNBS2d2Wkxt?=
 =?utf-8?B?NDZ1RVpYSHdjd2tCRWE3dXdDNUlFems2OFZLd2JXMjBRMnZUOHpxZDdmTlJ0?=
 =?utf-8?B?aXlWcEhtc0RTeUtZYXJFT3hET0cvdy9KNzV6MzNQdmxYQ0ZTUGtiUE9adEtk?=
 =?utf-8?B?ZzdRYmx6Uk42QXdMNjZVUkhpekFwc2FTeVVaY1Rpc2NXUnU5bzF5cktqM1da?=
 =?utf-8?B?V3p5SitQeVlnL3ZxUFJzT3pOU2JzbTlVY0J0dTB4eVFiZVgrMDZSMlY4OGYw?=
 =?utf-8?B?ZGxhbFoxR0NQYjVneHNha1N3M3NwNncxU3JVK05UZlBmTGREZnhUYTd5SWlI?=
 =?utf-8?B?TkRzb0JMNGhIdUhITHdQUFNOMm9tdlVvUGsyL0pRbkZod21tZG1aNnR3Rk5q?=
 =?utf-8?B?eklQNVdRSFArcnR0UGk3WXZ5OXZuQ0ptSE81WEdEc1JmRUh1ZXJVbmllMzR4?=
 =?utf-8?B?OEJSbkJOZnJoTUhlam11aCtSU3ovS2lNR3FqNDhTM1FIa2VhaERXbXN3blBM?=
 =?utf-8?B?YlIyYTZDTHZ1RE5oYkhBWWxwYXFQdnFMcXoxWG82Y0taTTFyNU9HQkFkR1h4?=
 =?utf-8?B?aFYva2Q3cGplcmdlT29laTQvT3lDSzRDUnhnZVduNmFRcXU3dFc2UEgxa0ZH?=
 =?utf-8?B?R3JmdVE4QVRKbTZ2VXdVOTJ5SC80MS8rNU9xcnZDMmlISEQxVHJybGplOUpt?=
 =?utf-8?B?RzcraCtDOGZ6VjBmaFA0b2RrLzFRYWpxT0VSdFc5Q2wxYlRWcUtiVGsza2ZR?=
 =?utf-8?B?TVE4bnQ0c0JzcXY3WlhldFFsbUhORXBDc2dUZ3JuWDI2cm5QM1dXY2ZwNU1a?=
 =?utf-8?B?SWJRUldiaVNUR1B0bW94SmZzUXpZWHNiaWZ0ZnVkQkhtVXQwUkUrNUlNNVZn?=
 =?utf-8?B?R0IrUWhVVENFcUZOUW1xTUVwcFFmRXVHODBCVW1tWHVhR25xb1ZEWmk5VVdX?=
 =?utf-8?B?M1JaTUxNYXZyRDhMN242RUNNNFdwcGE5Q21lK25CZGVzNkZvR0xMRi9ZRkx6?=
 =?utf-8?B?WUw1dmZ2WGFzbkZ3M1hjRC9qTjAxYlhtbHB4eGpNUjlNY2J5VmxFcThVMlJq?=
 =?utf-8?B?ejlTNnVMdWdpMDNuejhucmJ1N0hVb2x6cnBLUWQvWUpobERnZkowM1RSa05B?=
 =?utf-8?B?eGhMR2VOcTZYNW9uUDBpK0RDK085d2l4ckphclc3cnpySnpBRDJkbUd4V3dB?=
 =?utf-8?B?Znoyd25ESnlHTkErdzMzQ3ZDY1QwamF0cllydkVBdG5pWEc4MnhYSGlqLzZ2?=
 =?utf-8?B?YkgzMGM5dTJrbWN1aGJKbTlJRTZZMThUSTFMMXdhazNSN2t2ZE5oOEI5bUN6?=
 =?utf-8?B?cExPZjdEZ3NVeStRWklnN3Qzc3laTFdaaEZwcHR6QUllMHR3TFJnT2VkYVVy?=
 =?utf-8?B?RXVaa2dnQVQxSHNxdTJWSHdoU2xUTFZlRTU4eE5FVTZ6N1FoUEtUem9JNXBB?=
 =?utf-8?B?MXFMci8wYnNSSXJnNm1aMjRCdkZiSEVtbEZJdkI5T01heXV4akN0bXJZdzFD?=
 =?utf-8?B?Z2ZERER4WVFKb3g4d2Z0WEJ4YVVYOGYza2ZxUW9MZUxRQXo0NFZwRHN3WHpN?=
 =?utf-8?Q?s+ZP/F8brHA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnoyeDlOdlpLM01wbWQ1SWlWQWtXZHc4Nkd2bllYSHlRKzZ1SFk4clg1cVFX?=
 =?utf-8?B?WXBzWnlRZkhabHJnc3NpeFVJU2hTSThiVzgvRmN4NHRSS2dKMlNSRGE5WDFX?=
 =?utf-8?B?ajNUY21TdUI4NTFOamx4NzEyVk40VUUwalVmd085YVhnOEdDb2NQRDIzZlEw?=
 =?utf-8?B?bkdlWFlxSEdHVmN6UWRDeTh3VjJVUmZzS0UwOVhVMUJ5RTlaVVRQWUh2b1B0?=
 =?utf-8?B?YlNBb1lHQytmamNZSTJoTnJWZ2x1M0lRR1dlbWRoTDhxTGs5Z2diaStHbVB6?=
 =?utf-8?B?K25mWEJPZzFMQTlnNDNUM3pQN3hOa1hEZGJSZzF4czQzdk5DNU1nbGZwY1hp?=
 =?utf-8?B?NFVjTVpWSzBQRldPMU1QUmg1MFAvUlRXM1Qra3dNRkpWN2xYWEtxTEYxZnAr?=
 =?utf-8?B?VXQxYzk4eXQ1eURWU3ZxM0ZmM0tyc0lPNHMwTkI2NzNVUVRiRmE5YzMvZGZ2?=
 =?utf-8?B?VjFvaWg4bUo3eWdTTWkvNGhSL2xaTXdEaFNENzFuQnc2L1ZUVGVhOGcxOVh1?=
 =?utf-8?B?Y0l6dEtTRWxjbUJ4VWo4RllDRDFHaVM2OUlpejNidjRtdXg4YTBQNTlHdlZv?=
 =?utf-8?B?d2NWV09HTkVzV3N3a3dHRDhuTEZuR1plNmRNY3Q1SFRuMzhhdlY4RGtuQ2dD?=
 =?utf-8?B?bDBxV1lwNTJkc21WNE1mOUxaYVVSR1dNMll2c0tveGlqUDg2Zk14TVNMQWJy?=
 =?utf-8?B?TkNBc1N0K2ZFb3BBYk40ZDNVS2taOTlyUzgvaS9KZTVuNFVuTmltN2JHUEhN?=
 =?utf-8?B?RWVrMVZVNXExRlh0NVlLUXhTMm54YzhiZm1lT3hoYk10bTBVZ1FqTWJOenhE?=
 =?utf-8?B?YzNZZEpkVk40VGt6WFZNSVkxRUpEQXdnYTVlakpqRlRBSWx6OFppQVkvZDR1?=
 =?utf-8?B?U1pVam1qLzlSMFVuSkZPV1c5dlRjcEpWaC9GWndmRWtLelQ4eFp5N1FWVHdz?=
 =?utf-8?B?SEd1NkhBbkxSOE5uSm5HVW5ueXhkeVoxSmp3c0pjNUx5TDd5V0lRQmMyL1JH?=
 =?utf-8?B?VjYzbDZnTExLU2xiQnJiZm5CbVVocyt0b1hEaEtKVE5COUJNTElRdVRsWnR1?=
 =?utf-8?B?MzMxMGJOQVJOWllGb1dqVGhwdXBsSmEvcWY0TUpkSm1XZDR6bEZRd1ludTU1?=
 =?utf-8?B?OTRGemFabjdEU29CdVBhSVJ1RjQzZUhQMmtpN2ZqKzdKYU5nV1p5aHE1ZDky?=
 =?utf-8?B?cEM5WWRJNjdqeGJ0WGlQY0RLU2tLMDY2K3RVTS9NNkdpNUczTExGQzNlTnI0?=
 =?utf-8?B?OTM4TUN6SndzenhydjRCU0dRRmhwN1Z6U0NCTElBZ1NBeFZqRXg4c0NaS2pS?=
 =?utf-8?B?b1N1WVRjTldIQjNKY1RhMEZ4M3hlL3FpemwxanIxVW5hM3VYYnBobHg1bTQv?=
 =?utf-8?B?MG83VDZ0M0xVdUFWT1kycFZUTmJ4MEFBMUpET1Y1V3VHTXFYdzhKNC92ZkJC?=
 =?utf-8?B?T3B0RjZmYVU5UktET3BNcXhuNnRNRFcwZjBTV2o0MFpSbXVvZDdlTkNUSjBS?=
 =?utf-8?B?dmNxdk8xVzFkSXQ0bE53QWtwcXVJM1Y1YndkK3hleDY1aGlWcDBsdlZoTFkx?=
 =?utf-8?B?cTFkNGg4dzhoODc2aThWRTRKSHVnbFdPNWhiSDYzMVB0RktKMDRxdGVKOHpa?=
 =?utf-8?B?WUlOa0tmSFdsbWFEVVpJbVlCUWlyd0RRcC8vZzBTaVlGZUE3cHp3eitCbWFZ?=
 =?utf-8?B?SGxxUVJOTHVyY1VtMU5WSW91QnQ5Z3dNMHJCNEl0UnhmMXYrTlRMZ2pjaTZ4?=
 =?utf-8?B?aWczNTBCZG12Qk5tU2hsSVp6b0UrMGJaU2dQRHI2S0UyTWRsT3RudEI2dGRD?=
 =?utf-8?B?N2FzUzM1NmZnSHhDc2pSckFsMjZDR0htMms1bjVhRUNtbVFDUnFEajNzYkdH?=
 =?utf-8?B?REpwTXZFSGtYVlFhbjBVTEJxYUhOTkZKSjUwdjl0VkJWRXRlWUFnRWpSWlZB?=
 =?utf-8?B?UFZadk9RUEdoWGNxQ3RYcmJVSjJua1Awc3huMHJ5VXJVTDlrV3lidzRxdDVw?=
 =?utf-8?B?bFJ3NWUwQ2VYSzFWWTVIQUxiZmhQbU9ib1hncXlGQllydGUrUVRvWTBKR0dP?=
 =?utf-8?B?czU4MDI0TG1vU1VRVTEyM3pCZ2pJQW9hRFJwMHdDZnRUUklCc0RMc1ZZczhD?=
 =?utf-8?B?L05jTHFTTG1idnVZUy9xZEFESGI5c1ovRzk5Mjdwb2ZBajZuYk1nOVNXSEoy?=
 =?utf-8?Q?VQW0+NcnrHBwefNDU/3Kygu5jU81vZzb6S1KLRbMc7c0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cdd70e-1b82-4682-6ed8-08ddf4d10905
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 03:27:59.4874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZD1xHn4QWDZcJhzT2Kfs6r7CGM8aRf5o1oJKpV/z26PcmIvcbuBmfA9kkUDFxt0iTYE7pKYrN0MOm01sT7v+6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6293
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

On 9/15/25 18:10, David Hildenbrand wrote:
>>>> +
>>>
>>> Wrong indentation.
>>
>> checkpatch.pl did not complain, what I see is
>>
>> +        VM_WARN_ON(!is_pmd_migration_entry(pmd) &&
>> +                !is_pmd_device_private_entry(pmd));
>>
> 
> David complains :)
> 
>> It looks different in your reply (is your email converting tabs to space?
>> did you want me to align the conditions?
> 
> Indeed, looks wrong, not sure why. Likely I messed it up.
> 

Ack

>>
>> +        VM_WARN_ON(!is_pmd_migration_entry(pmd) &&
>> +               !is_pmd_device_private_entry(pmd));
>>
>>
> 
> Exactly.
> 
>>
>>>
>>>> +        if (is_migration_entry(entry) &&
>>>> +            !is_readable_migration_entry(entry)) {
>>>
>>> Dito.
>>>
>>
>> Same as above :)
>>
>>
>>> Wonder if we want to be more explicit.
>>>
>>> if (is_readable_migration_entry(enrty) ||
>>>      is_readable_exclusive_migration_entry)) {
>>>
>>
>> !is_readable_migration_entry => writable entry or read exclusive, did you mean is_writable_migration_entry()
>> above?
> 
> Yes, sorry, my brain was dizzy after all the review lately.
> 
> if (is_writable_migration_entry(enrty) ||
>     is_readable_exclusive_migration_entry))
> 
> [...]
> 

Ack

>>>
>>> Couldn't we do here
>>>
>>> if (!pmd_present(pmdval))
>>>      goto nomap;
>>>
>>> To replace the original pmd_none() .. check.
>>>
>>> A page table must always be present IIRC.
>>>
>>
>> I am not sure about the pmd_none(), a page table may not be present, I've not audited
>> the callers. But I think we can do
> 
> IIRC page tables must always have the present bit set. So we can just simplify to the single pmd_present() check.
> 

Not sure about that one, are you happy if we follow it up later with a separate fix

Balbir
