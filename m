Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A071BC171A2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5254F10E677;
	Tue, 28 Oct 2025 21:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vilc4gID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010061.outbound.protection.outlook.com
 [52.101.193.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4692110E676;
 Tue, 28 Oct 2025 21:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8gaJT0eN4/b/I6QzA4RbVuJcvWtNDfkLtL8mCP+e2/CD1BKorTjsiilcuFlNKXjY5gVPAMRhZ7Yi3zH7k+PtE/V3vhidlK9AfMZKo9u6woTFouPmKR8wyRty27St1FfQ86Y1e+2vwhsVrvjvCYUyI7mjkejeqS2aJq/Fb/n1/mYgheXdmHm9iNen7wPhBMz2LlZVByj3t19mBmdrjbPM6Son8v7Gdp4cNyO2w76eeQCa92KkWV69jqg1ajdelR0sfzFnT2OILt8mN6leHGB66zhcj8u+fnt9nCkDECIxHQk3Xpt3KGmGT7Qil5tIM+9/Mgl5MsVxOlkl7XrjkoZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKc186RzwAYChm0Wafs9WIX35+i5b186WHw2cC8jMnU=;
 b=tlliaCLsqQFZBrDx6kJlXbBQPYR7oKVB1a5Q7sHmM5Ky+8EHQh161AfukXP+K/71nRyE6o58CSULTaRFDJAjWh81frI7XpBzJaVDzk0RbG0szVkdfFBlPgLYjudS922xoKN/1MryENxDEvV9ZVFVUDry1TItODZzGK0afkS9mbrkxp5IhEsWl5yNueHgqqaWc7NjZ61oiPsNwLnaOQSqGflrbuU0cBOteFKqKGCr2ke2UiDkvGKLnqeeYhXDbcOo92hImPQQOD8s4qhHLjvNKGzu25XTlNVSfplPnBenwIRd68XSVeaPQbb2wFH3vSt52998KKmM4xF55RUV8ij8bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKc186RzwAYChm0Wafs9WIX35+i5b186WHw2cC8jMnU=;
 b=Vilc4gIDyFcZCU0Gna06cdOxQPjq2AiATxBuFUgmbULe2d0wcTAddpb003A26Q1sGo04YKShE9gEfbnbUtdjqepq5N5To4AqoMeNU+HZHRmA/8EXxiLqurA/N10L9n4a0rwHnXKkf2rF2JZTrrtxc41D0yq53h5qmzSsl9soZOcYthh6EI+iCunGPQPTeFdomTz2AHCvml1TwFwljzYrUElIiWu+U61M2It7pxSRaGvlH0qThSXubXyPOc5NQSeGL/3D6dZYerXzB3dvVwgORDz7284NjkaobNPcqH4pwbo8zDZK6RAKgR4GNRlN1i2OjCORYNHbWbJxYi966cphZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SJ2PR12MB8183.namprd12.prod.outlook.com (2603:10b6:a03:4f4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 21:56:54 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 21:56:54 +0000
Message-ID: <e9949c65-2f4d-4c49-af79-272cee4925c7@nvidia.com>
Date: Tue, 28 Oct 2025 14:56:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] gpu: nova-core: leverage FromBytes for VBIOS
 structures
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
 <b1657e5c-5679-4e5a-a1b4-c8559bc7d891@nvidia.com>
 <DDUAC0IWH700.27TKNFBEOQ7KT@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDUAC0IWH700.27TKNFBEOQ7KT@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR22CA0004.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::19) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SJ2PR12MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: 01b00399-2856-42e0-8a5f-08de166ce82f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDRpNkF3bkhDVHV3UlRBUzlHbDZxd1lQQ2Z2MjZFY2tDdkJMaG5ya2htM0Na?=
 =?utf-8?B?RnpZeU5FVHlIMHFDdUlQYW8vUmJWNElhMExjSGx0SzlBTzhDTXl2SXBtYWQ5?=
 =?utf-8?B?Wms1SnlMOTZacExCRjJaczBOcjZydlFteWRHWXNML09DUWp5LzhMUFpBeElx?=
 =?utf-8?B?a3lCZTlkMkQyeEN5WFo1MXEveDNNL2FIbHFvRC9SZENYMEJ4YXZiYXdWeEgx?=
 =?utf-8?B?cm1ja3RVcTZrcFZvcExoUWp5cjVjcEhQajJ1ajZYYVVoM3NpZlBuQTAvZ2Jz?=
 =?utf-8?B?RkFYTmZVeUttdmc0RDV1Q0VFUjlPYURMVVgyelFOakVWVWNPVTUzb3k5QnRy?=
 =?utf-8?B?MTdrVjNrcURLc1JFeitNcEJVaXhVRkZvS1NLTWt2MWJtdi9PL1Nyd1JmMjVV?=
 =?utf-8?B?c1VnVWpXUUJuNU40K1lmUDl6Z08vQkRSY0dvOW9vZWdNZlhIYXBMeklFT01D?=
 =?utf-8?B?T2FYZGRIclZNODhsVTVVd0F6T29hSVlqY2w2MXhvcVpreXdqQnYxZXYvWFRs?=
 =?utf-8?B?K2J3Z0sxNG4zUWNUSGVSL0dlZFkzZm4vbDFVSVNKM2lsM3R2Mk5aQUE2QU9w?=
 =?utf-8?B?YXBmWU1acjFNNzR3QkdKNzZJQnRCUUs4MU55YzhkQXVxNWpFZnBBMU9GVEli?=
 =?utf-8?B?R08wc2pFbzlkRUdpYnoyNjZPdFhxU1FuRVJXaXFqR2U2allPWlRNelkwaU84?=
 =?utf-8?B?ajhXMEpLdWd5TDNpclE5WGhkaGpwWnRiV0ZEY2JrdFlzbmNGdlBCb25SczlJ?=
 =?utf-8?B?ZlBpUXJ5cnBEUC9odWRybWNvcUQ0ME1TSFVVaUtCY0hyOVVCaGp3UHA2RkNu?=
 =?utf-8?B?TnFTaDFMV1VKZllkbnNRRmRhWHMwQ0xLZHI4WTMxVDQ5TGZrdXBCaGFhOWtW?=
 =?utf-8?B?ZGl6YStCQndvd3RLNUhKMnd3c0tqZ3ZYVDM2V0lHUklMKy95MDJZY29NWkl1?=
 =?utf-8?B?aTJkTEtPc2loTEFGdDBTZklQQlY2dVFWWVJ1bFdMaDZlMTZ5QnJoUjhoT2VL?=
 =?utf-8?B?dzZlWlg2SFBsZ2VZZ2pZS3Nucm8xbzJIb0pkUndmd0p2V01VNWlGTy90R2Rk?=
 =?utf-8?B?VVNCdVRmNGN2ZkFjc3NEWFhLR2NJTzUvdUFxZkVycVMxbmlPWjIxZjJpQXZI?=
 =?utf-8?B?NTBJTXFhZHJBNEQ1bURSRVZrM1VXYysxY2hCRWxpeWNjejVEMEU2RU11UzlT?=
 =?utf-8?B?WE8wMUFRNFVMVEM0cjdkMm5PTE5uSExOTHdwMjJkYko4Rk53aFA5VnIyODNG?=
 =?utf-8?B?T3U0aVZyZ2xPVHlrN3hiK3J2LzdpWGJ5di9KcncxYTBTZUM4K1lHalA0WDdT?=
 =?utf-8?B?ckdaL0NxcEVQd2tHK0NPcnp0bXcxMHpMSjFoUk8zbkd5NjRDb1VteWJUdCs1?=
 =?utf-8?B?cFJranREOG9KcUpkcTJDRUJ4TFByMklzaDc0ZUMwcFQra0VJUnVoRlNTY0g1?=
 =?utf-8?B?MitsRDFiMTA3WmdWR2RzMnJxR1NBMWpKZ2NKMitxUDg2eVk0MG56TGZWQkNp?=
 =?utf-8?B?Skd1ejl2WjVtbGVzZFdaWjdJUDNDS1lSWjdueWdTdGRNRVNGbi9DUGdHWTFa?=
 =?utf-8?B?WmF2WlRsSGNtWWRYQVFyZ25rVFg5eUJMWEZrNFVjS1RmbHFxd05CQ2I3clp6?=
 =?utf-8?B?NVZXcFJCOE1URUo5M1JnSy9YVVBoQk1NYVNFZmdkQ29qTWM1SklNTmZrREdt?=
 =?utf-8?B?cEp3RGhZdFU1WktqRTlzM28yU3NxK20xREp5ZHhUcEpYckRqY0xsN1MrM2JU?=
 =?utf-8?B?MTNtTk5Vak9BMEdkbk9jS3hUKzl2cVMrQkJ0QU5QazdadDBFTFdTWXVKZnhR?=
 =?utf-8?B?andzaGM2TjFSSjJpYUNTVmtpZnI5c25FNUl3N2d1blZBc0d2TWZJb3NCVmgr?=
 =?utf-8?B?SnNUUTZsb0NrVEMrYkR6ZkhMbnhiZFk5ODQ2Ukt4aU1lUjNuUjFIN09CSit6?=
 =?utf-8?B?UGVXbnlRMkFRRVlVOXZESHJEeS8yMldwZjZrZjFsM21xNHRGYkZCSEtlb2lr?=
 =?utf-8?B?ejhlSlh3d2o1eU5yN0VnZFNlRXdqeVlyZXZrUTNPVFBOSFowSjNlUEZURUpF?=
 =?utf-8?Q?ZfQjjL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWxjdkxyeDVqdGcrLzdMYWJqTXY0Ykw2ckFEWjFkVzFtd1pNQTc4MFRVcXNi?=
 =?utf-8?B?UmwzZktsUzRFTEdkRHFBclFUVlpuL3RSMy85dkY1YzFwR1pJMWJmZU54RXl6?=
 =?utf-8?B?R0poTXB5OVlCTUZIbWR1SGl4NVhHbWxmR3NXajdVMUZwQ2hpY201blpLbll6?=
 =?utf-8?B?Mjd2bkM4RFVUbit0OEYrSFFDay92R3Z0U1B3T2dJVDM1Y2lwRmFwR0lad0ox?=
 =?utf-8?B?OTZqTlo0Qml3bnBVUmdnMFhTTzIvdlFtTEoyNGlxTEY5VXZhN0cxTHpNdkYy?=
 =?utf-8?B?Si9uL0g2b0pxRmZ5QUNGRHdzZ0ZVaTBRRzIxQTRiU3I0SGNnekowS2l1b1Vs?=
 =?utf-8?B?QTVrUUhHT0ZRTHRlT0VDUytISEZnV29Ic1ZZUUVWK3Y5SGcyb2lwTU9FUkFi?=
 =?utf-8?B?VGdqbDVIWmY3UmxRWERrSU9adklmK0F0L1IvRFJ3MkNjOXliVXc5RmoxckNz?=
 =?utf-8?B?V2FybEVZVERIVW1Xc1VldUNhckxsVWZsN1QyVHF6Y0piSzJUdThuUnBsbUlX?=
 =?utf-8?B?UFlhTmZyclBITGJSQllzUmNGNVVMYXg1RVpvSDBMVGdlaXVKaWRxQW1hY0xn?=
 =?utf-8?B?SW5UTGVTSGZlZUViNHMrNExHajhJVGpnMUI1OENXbjRSUUhJVGUzc1BKSTJu?=
 =?utf-8?B?RU41YVdmZkhzNWRCQjNNRDRoekZ4Qk8zS1BJb0NtejA2S0x3UXMyK3VoSERC?=
 =?utf-8?B?K1F5S0V5eTA0YzFRa1h4czd4ZW02NTZYRDVWNnh4WUw3c29zeExPMVg0Qkw2?=
 =?utf-8?B?Ull6QUlCWk12UGg2dXFHL0xTREQ3WkJ6NHp4RlJlUkR1MlVHV2M2QTEwbm03?=
 =?utf-8?B?aEZ3c1RPbXVGRURxWE9PZHdyalRzTmt0UDVIaEk5QWdLK3QxS3JEM1NYczY4?=
 =?utf-8?B?TGZ1YTBlMDg5aEtwczZNUjlLVTc0U0E5MEdpMjVjaHhPWEk0cldmSjFrNnRt?=
 =?utf-8?B?ZEF0V2NSbjFwc1VqSmU4bTJ2WnhjcUFuS0tyRDVBVUxuZkNVQUx6UWNpMVFK?=
 =?utf-8?B?bkdSVzdHeGtrSTYyandJMGZYMmhQYlVvL1QrYW9MYTZhMTVhb2F2TmZDOGg4?=
 =?utf-8?B?M1ZLT3YzMlJldE9abFNNcTNrT0ZNWU9kLy9nc3NSZXRubWYvUzN0cDc4UWJO?=
 =?utf-8?B?UWpuTHhJNnU4SFJpTWtrSWVRczZtNGxBc29DWEdiajhPNktoSjRUVWNVRVVj?=
 =?utf-8?B?TVQ1b1ZaMk5EaU85VkZ3aUZUZ2RBM0FoN0RYZ1RPdW5PVFBsclhoN1M3VnB4?=
 =?utf-8?B?c3R4MGN4bVRSZHpiS1V5NU14WUU2czlYOXBMVkZRVE01dE1lZjIxZ1RwdnEw?=
 =?utf-8?B?NUxaMjdWQStvNWtML2VUR3FVYU5qdTA2UVVjaHZtS0U2cWdtOGQzWkhZdVVG?=
 =?utf-8?B?V3A3dGhNYVYxMUJLbGRnbDVUcjhrMGtDVDRvNDE2U3pRZ1RkRGlNTzhFdkhJ?=
 =?utf-8?B?QitBb2JEZCs0dXcxNEdZV0Z1NVdrRmtrSzkrWWF2ZUxXWU12cGxWSXNOSEEr?=
 =?utf-8?B?TmVLR2crVW5wL0pqTWxNWVJpaEk1QVRSKzhkOVRmNG9SWmdpdXJSWU1NVEtq?=
 =?utf-8?B?TWhWYUtGZzFyaFRIbDdwUlVPSG56d0lLTi9HZU4rRDMwT01WOGd4WjRIOCtY?=
 =?utf-8?B?TXdJejhQL281bmtqM0VFazE0Tlk3Y2wxd3BLN1pmaVY0VkRqdmRRN3FyMG1T?=
 =?utf-8?B?c3N6Y3pOeDdVWEdVREpPK0ZUalR5Tzdqc0F1dExZN0xhMnBSa011bU80QWw0?=
 =?utf-8?B?aG5DMnQyWEMybTZDclJpRHlYNVhiNFdVWjFPUFBDZEhEeG1CWkhqZXh1ZW42?=
 =?utf-8?B?QXpmanQ4dDhwODRqL05jYmRzK1dRVDEzM091UVIrc0V1UkwxVDFDbzNtYm13?=
 =?utf-8?B?ZWNiYmYzUHVlR2NNaFdKb3lJVWxIS0dBRnl1NU41VVVKNXZxWFJwVitZWWta?=
 =?utf-8?B?VW1qMkFRWXNxZGYwOWhrcDVJcTgyanhPTm9PejVlaHZkbWlKekRDazNJRVRr?=
 =?utf-8?B?VlViS2ZxZThrYnJzQVVQUUFrdjlUVDVPVk5hS3B3RFZpMXZTNkR4Q3R0cGFC?=
 =?utf-8?B?MzJYV0loUGlIbDZTVDcvNTlTdHBmMlROVE05U3Nzak9kcGZTQTZKZTlYbnF2?=
 =?utf-8?Q?2ubNOC7TP8PHbNLgR4ooyU5nq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b00399-2856-42e0-8a5f-08de166ce82f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 21:56:54.2159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9VO4435tAzCskOkON4dfT2afwDNkXf+x3hOec+lOaCpsXIaAbx5/AAIVHtgIYlZyyUOGmDl2asHl+RXDgFNFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8183
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

On 10/28/25 2:49 PM, Alexandre Courbot wrote:
> On Wed Oct 29, 2025 at 5:24 AM JST, John Hubbard wrote:
>> On 10/28/25 8:07 AM, Alexandre Courbot wrote:
>> ... 
> I tried checking out `drm-rust-next`, applying [2] (single patch, not
> the whole series), then this series, and it applied for me - with the

Ah, that's the problem: I (and b4) thought that that reference meant
"apply the series". Mystery solved.

> caveat that the posted version of said patch does not build. :/
> 
> Yet more evidence that we should maintain the good habit of publishing
> trees for our patch series, which I unexcusably omitted here, so here it
> is:
> 
> https://github.com/Gnurou/linux/tree/nova-vbios-frombytes
> 

Yes, for things that have dependencies, a tree is a real lifeline, just
in case.

thanks,
-- 
John Hubbard

