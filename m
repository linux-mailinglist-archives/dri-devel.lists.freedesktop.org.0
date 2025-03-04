Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78491A4DFE2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC25A10E5D7;
	Tue,  4 Mar 2025 13:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ue5cOFcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54C910E5D9;
 Tue,  4 Mar 2025 13:55:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJ5btTZXpySgwlAx29aD6AeL6cX/EBv92KIeVCn1WEP2wIP7sqCYNlta3gjFM5TGHxCBW10rI/crBbXVL5+VN9rT+Fq+Ykk4/gnJIkNQyIwQq1aJmVKmr2p/+Q+CMHPE5iePpZi1SQ0mRPAQc0RN7ZmIigzOUa0tasGEvt5jOF0mZwVNpa8DG8n5ZJlU4UjIlMUVTg/b5cyPOpg7IU9MhEYkf7n58VZ4O4KbMitC+frGCiSzwCRjPgcYey1KT5aWIv/sWCtn6SrNzEpn3iZf/L0hFibmMeKxaS6X08/cpj5AZbLS8Nfq344Zhta54EasXqM5FT+p6oe3cDVONvJwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OWm3eef5vUe9pRRl4SXsEdGWAsnBzfcclzxfP+UhyY=;
 b=jBVHo3mO/LC0IZPui0IPvPrjUlWqL4aNga0PRh7w6AnCSgervhlwMbq6ppcn3JIltvdqKf9+yBJfoG37BwDWUe7bjPPhIBI9/tBCczNfKJ1tYKWqLpjRc/8Aqrz072vNbNdwAHCN95jEkheKPe3BR7U/CUG8eU/Ru+3Q8gWN84MDt2AiNcBi1phLDr0bbtwJBnXulXGDQIBumdS10qyTdMt7X74NEIqu9RvEhCDOIzyQCUP/e8Fyo1DP59W05UaMTwNYLszN/1Q1NCCHh4wK4vYjp0lp2w0RgCKIajH6JlV2r4WSn02p994fWqvBCkzLcQbmjduKzp1r0a0+06xkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OWm3eef5vUe9pRRl4SXsEdGWAsnBzfcclzxfP+UhyY=;
 b=ue5cOFcGGKMZYMDd3msfkbm/w5AQI8WTACVkvLKCkxV5d+XnOZKEbNNFcmBg5/v1vS7YSGWBUG69g/dKqZX52W5oihLkgWswkM0nWpxQ2QDpr+OLkB/R6MLNDUTJmFALdHAdYb2L3x+VMz0aWJE3OCg2+oxFgq9VxkOftlTa43KfiGK5nhhj60GyPY6Ml6cAjtJJY3pSX0HpBhEOMpzJ/5TUEXg2kxFD+4NUsjL8VWgNdfYvgwKvlhEmJsXF1KJR8OZUhi6isSmMvYtlR/aAIb+jtJA/P6EU9OOsV/1DEW1YBXZww0Jnn4EHqOgQT0H1PbMb/wojeubJn8jyWZZ45A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 13:55:09 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 13:55:09 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 04 Mar 2025 22:54:01 +0900
Subject: [PATCH RFC v2 5/5] gpu: nova-core: add falcon register definitions
 and probe code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-nova_timer-v2-5-8fb13f3f8cff@nvidia.com>
References: <20250304-nova_timer-v2-0-8fb13f3f8cff@nvidia.com>
In-Reply-To: <20250304-nova_timer-v2-0-8fb13f3f8cff@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:405:2::29) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DS0PR12MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5130d3-ae04-4072-576d-08dd5b242d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXkvUDNrcFd6V3NweHMwcWNmeXFoSlN1SXFqWldkWFJZN0hxTE1GMWo3azQx?=
 =?utf-8?B?SVlhWFQrT2s2R1BGUDFyUGRsbFJyeFN2allwQVI5WFlGeVl0STNPMStTVUtz?=
 =?utf-8?B?SDlzNCtlbzhQckIyVHRySmdUc1B5Wko0bWViTnJac0FxUEd2Z1BQcGxXZEN3?=
 =?utf-8?B?QmtUYWI1cEtiRkpHdkZkTHBNM1pDcVF1V2ZjMzhxb1Z6Vk5ubDBleGtSMUpa?=
 =?utf-8?B?RHVERmt3eS95NThHYUZPNkh5U2gweFNMNjFremFsUUdDWnZLQktMRUx3UXFX?=
 =?utf-8?B?WlVhMGU5ZE1TWmhSZ3ZFczQyTHVxc1hpelArS1RiMzJqdm1xdlkwU0ljVDB2?=
 =?utf-8?B?UUNRUGwvSlRqK014SWJqZ0YwMndIbTNKTGFaQlllU0pWUWllbmtHQi9DdGE1?=
 =?utf-8?B?MGM0Zm9qK2pWRlk3ek9jWk9YeFREZ2U2QWphclZJbHF6TjRsOHREdEpFNnlo?=
 =?utf-8?B?ZlcxZDhPWFRpRzUrWW1XL1ZkaW5SbENlQS9QT3dTdFgwR0xNUGVqazlpZXBi?=
 =?utf-8?B?ZGZETGM2dVVRdVNMKzgyVVB0TUorTjdHdmRVanNKSEZXT05XbDJLa1BxM1gy?=
 =?utf-8?B?YWM0b085bUZ3Y00zMXdBSnJSYlpiV0VYcEwvRFk3NG1nb3JrdzZpcUtnSkYx?=
 =?utf-8?B?UHZvcHluWlVxTnJqN0Zha1pUcU5Va3pFeVkzcUhVV0xrL2JZUUNzT0crL1lB?=
 =?utf-8?B?VlJLdWtucGU2WTNCR0ZhVmgxcDdOUXBSNTljeW5qRHk2bkZ4b01nK2luV21n?=
 =?utf-8?B?OHo1ekloRVZZYWpUWmhmTC80RmFQVll1QlZYaTRWd3FRaDFKVkI5K1pyTmhm?=
 =?utf-8?B?ajkxWE95eUI3bThGbklkN1N3OVNQVkJzL1IxVlBSWmxPc3IvRHhkTE5IcFF0?=
 =?utf-8?B?c0xyMFhTRlJvMnVKV0lqTGJRWWc1UUs1Q3hRYlRzR3BGYzVkR1RzdXRsVXQ3?=
 =?utf-8?B?WU5YdmNzMFNqc3pUZEh3VUJHaGVnaVVPRzNaS0NYN3Rsa00zeXlmWmlrK2Rm?=
 =?utf-8?B?SmFYdy9zWDRhTGFPVnR4RWw5bnh4VFhUSnFBbDJhdkxsNm1OQjBKamRHVEVI?=
 =?utf-8?B?a0hkZkpWTjJHTHh1a1B1OTBwbjNMajBzRlN3eGZvbzlqaW9yU1NDS2U1MTJq?=
 =?utf-8?B?Z28rcko5Qnpxb2ZVaUVmTmcxQk5CaXZ2eVBOQXUyb21kQlp0UmNWdmtYMHdQ?=
 =?utf-8?B?ZHdlOFUva0h1WjNtVmtlTGdNTnIxbjY4VDhPbHJNZ0xxa2ZTeXljdVRoTnVm?=
 =?utf-8?B?d2pUb25LaUMwRCtNdW1wVUpPeXI5Uk9wSEJRYUJqQWc2Vk9WMzQ0SFo3bjRE?=
 =?utf-8?B?RklQK3N6Yit5UkErL1QzOHo1cVNqY3BUaEJmNTVWRTdHbWcwa3B2anlnZHkr?=
 =?utf-8?B?c2QvTFg4dDgvV0h6cHNZaUN1VXloRDQxRFZWcExjSlhIdE50OWpWazFjdFNQ?=
 =?utf-8?B?a01VN05BalpEanBPRmgwT0F4Q0NIM0hIUGVYbW10UG8wbEhiRGtjb2htaGxW?=
 =?utf-8?B?SlJtN1lobjBMTjE5RFlFUTBITjdVNzB6WnpOOXdOZGNJL1BiY3E5OHN3WlZy?=
 =?utf-8?B?QkZNV3lHMzVLeldsU3VVaGZ5UTNCbWxVZ1VBT1FTUWhhTEVIcExZdTR5anNN?=
 =?utf-8?B?NE1vdXJBT2JyYUlyU2QreWxwK01vOUd0NlJIVHhENC91TytEWkJLS3pWOFN6?=
 =?utf-8?B?all1VXovUTNiNTRhWVJEU1FvK0s2T2duRUo3NXJMMEZRSUxSKzBla0FxaUVw?=
 =?utf-8?B?TStRNVZzbjZ4V29pNlkvbWpMUkNDcnFmZjR5SldMVzlMWkJrT2V5WkhoWUk5?=
 =?utf-8?B?YW4wN2NvQnpxV2MvYU83OG5NUjJJZWxUMzVBZStSZFE5WVN3clBQR21tQXpD?=
 =?utf-8?B?L0s5bE1DdjZYMUtIcGs4dTh5a0Q1WCtzdU96S0JrQ2ZVSldGWkpGRjZtTlNH?=
 =?utf-8?Q?/CpEqM30YUE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFBjZEF0N01NekdjNURwSUZydkdsa0JtVWo3MXJXL2Y5S2RveTNGNXc0TlpL?=
 =?utf-8?B?N0pJcFRLRWhFUkYwdWZiekFBd2pjdm1YTVpBWFRpSnNOUXdhOGN3aE14dlVS?=
 =?utf-8?B?a3o2bWRyU2VZZnhvQXEyWTRQQkF5VGRpc0hueE9sK0RyMTQ0MHBlblNPaEpB?=
 =?utf-8?B?Y2w5NVR3Q0QwWTZPaXZsQTZnZS9KVHZ5RW5FNDBPcTEwVDhHL0NrZS9sb1Y4?=
 =?utf-8?B?eHBJRWpEVHNnUVp4N00rMXhidXVIWnZsaFZPeU91MkZpSkg2MzdnNVgzOEhH?=
 =?utf-8?B?b3Y2MDVoOWYyVGZhRXNDdW44aUE2OUV4TkFpTUoyT0JoVy84U1JxMkZyaE9N?=
 =?utf-8?B?SzBPUTI0cVo0TXNHMXZERW9jRjNqU1VjQ1BVbjAvY01TcW1jYkN5MVpUa2VB?=
 =?utf-8?B?UjNab1FoS1pOcXNFemJFdEZnWCsvZmdyU1JRM1EvaHgwSUttTWRDdzlaL216?=
 =?utf-8?B?ZUFXU05CS2VHUjg5V0hxdmtTcURicENBM2xPdVNPNkF6RHVDeGk0c3ZoeHUy?=
 =?utf-8?B?ZlRMQ0YyZWNvZlNCTU1BR2lTSXBEdi9xTWNWenJKc3NQV3RwcWpPZ24zSXJF?=
 =?utf-8?B?Q3NOV0Q0QnBXeHU2cEJtci9GUVQzcTZkU1REWm1FL0ZqVlovcGt5YVB3RWtJ?=
 =?utf-8?B?enp6VEdMOGdQYmxhUzR1TW9TWHpQNmVKZ3Q0Q0tEQ09CR0ovTEUzNDh1cFE1?=
 =?utf-8?B?MjZhWFQxRGEyaHpUYmNwTGNJakwzWUtyWk9LZE5zMGh5alQzOEsveEl1ODZB?=
 =?utf-8?B?VXphMEQ4bjhoRnZCOHN0UXhyOHV6V3Rwbk1yUDNBOG1MMjdzZ0VoU21yc0hs?=
 =?utf-8?B?SHVDamxqK2tVWDBWQ1NxazBCcEFGbllTODhwNmlZSUIzN001SGRnUDBiRGFi?=
 =?utf-8?B?Wkxsc1pGUWxWbkVpZkVoRFVUQXpYU1pEb3V5Y0czSUR5a0pCNVhaVG5PUzl2?=
 =?utf-8?B?aFRDWkt6WXQ1UUZNYitndkFQWVJ1aFdaTVNIWThtcXNaMk9CSG5zeE9wUFBI?=
 =?utf-8?B?YkFud2pNSzFYYWg3amdibk5qMHVhaDRYTU0yY1lZS2pQSyswd3AxZ3lLNk9R?=
 =?utf-8?B?ZVRiaFYzTnV3L1U5c3pKcXhJWGdKRFVOcHpnakRYSWtvdTg0L2ttRklwWUVW?=
 =?utf-8?B?bjZzM2RtL2ZKdm5vcnlxYjZlR1dTTER2YTR4dVlwYkdkM3IzTlN4U0dTaXNv?=
 =?utf-8?B?aVN3UXplN1FEQkJ2Y3hnKzVQSTE3RHI4dzRlcFhVSFloaS96YVFRY1haaEdi?=
 =?utf-8?B?MTROWDYreU5oekhCelpkR3ZNU2QzS2NsU0xGczZETC90UHBRTkVBbHdsWWEr?=
 =?utf-8?B?d2hHUUEzcnpzOE51emZPV08ra2Y4RFI2MllyTCthdDR1Rk9DNnhOWHE4WHhh?=
 =?utf-8?B?SVdFWnRaUzZqZ3ZSWWxlNzdYM0F4WCt6SG5VK1ZxeTF2dFBHdmhtK01mbURv?=
 =?utf-8?B?UGVzNlBoUVhFUkJmZmsrYXRXMXRiMFdEREhYdjhYM1pLMmVJR0paM1M3dHdT?=
 =?utf-8?B?b3p3T3VCM21KZnpiZGtYUUpYNXArY0dKdEdadTErSkh3bTNTOVZycUpLbmoy?=
 =?utf-8?B?SGJPa2ZjR24rYlJsbElWdHowc2s5RU05M0JnY3k2Umd3QURELzlCYzN1c0Yx?=
 =?utf-8?B?L1lzMjRxRVdLQ3BhaHJJaXhSY2hYUmdYR2RjaHNYbUVmU0hRQ2k3TWdYVGhO?=
 =?utf-8?B?a3lSNmpwY0I2Vkh3UTdGZENLWUVZYnllaTQ2UjcvZEtnajNNejNoTjBYWnJa?=
 =?utf-8?B?NXFwaWxZVTk0UFRiMXBJbEt5U09VQTZ6SStjbWg5RC9ielFBWWUrTFE1K05S?=
 =?utf-8?B?bml2Tm4zR3RsV095eXZOY3dreUlPMUQ5aG45OGtkZTd1MGxVdHAxVG44MGV5?=
 =?utf-8?B?VHFJR25EQkF2bE8xbUFERExubVFpMFd1YllLU1VCNGZEWXBmQmIrOU1tK3N2?=
 =?utf-8?B?QS9FSGhXVUYrVVZ6a29weDlKUGNDbkNqaFhuUW9BeTNiQXdoOEYvYTZ6d1Vo?=
 =?utf-8?B?S3VPbVZuU29zUDlWYW5wZXBVMEJnZVdwSmhMaTlUS0llcmFMaEV2MERRQUE5?=
 =?utf-8?B?b3ZoQUdjVjRLMkJ6YXd1eFhjaDlqTEFnbkRza2M4L0ttRjlNc2Q4bDhMVmk2?=
 =?utf-8?B?Y1EvZEl3OWt1T2dNR1pYckFTUVJYcVNCWE5OT0tLbWc3aGtQQjVQYmpobWZ1?=
 =?utf-8?Q?5C1vMostG2YNUyFhZjHcz/CYJ7887FDRIh/U/zfvVXVK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5130d3-ae04-4072-576d-08dd5b242d3a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:55:09.4769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9SmvCR1e7BgBjk7puK0G90l+ag4TBrXaeNFvoiTrBXyZwqMVyaKi8j+OITn1jIYVWmp2XhzEyWv7f+sA4wyRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7874
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

This is still very preliminary work, and is mostly designed to show how
register fields can be turned into safe types that force us to handle
invalid values.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs    |   2 +-
 drivers/gpu/nova-core/falcon.rs    | 124 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs       |  10 +++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      | 108 ++++++++++++++++++++++++++++++++
 5 files changed, 244 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 0cd23aa306e4082405f480afc0530a41131485e7..dee5fd22eecb2ce1f4ea765338b0c1b68853b2d3 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
     pub(crate) gpu: Gpu,
 }
 
-const BAR0_SIZE: usize = 0x9500;
+const BAR0_SIZE: usize = 0x1000000;
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
new file mode 100644
index 0000000000000000000000000000000000000000..5f8496ed1f91ccd19c0c7716440cbc795a7a025f
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Falcon microprocessor base support
+
+use core::hint::unreachable_unchecked;
+use kernel::devres::Devres;
+use kernel::{pci, prelude::*};
+
+use crate::driver::Bar0;
+use crate::regs::{FalconCpuCtl, FalconHwCfg1};
+
+#[repr(u8)]
+#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRev {
+    Rev1 = 1,
+    Rev2 = 2,
+    Rev3 = 3,
+    Rev4 = 4,
+    Rev5 = 5,
+    Rev6 = 6,
+    Rev7 = 7,
+}
+
+impl TryFrom<u32> for FalconCoreRev {
+    type Error = Error;
+
+    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
+        use FalconCoreRev::*;
+
+        let rev = match value {
+            1 => Rev1,
+            2 => Rev2,
+            3 => Rev3,
+            4 => Rev4,
+            5 => Rev5,
+            6 => Rev6,
+            7 => Rev7,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(rev)
+    }
+}
+
+#[repr(u8)]
+#[derive(Debug, Copy, Clone)]
+pub(crate) enum FalconSecurityModel {
+    None = 0,
+    Light = 2,
+    Heavy = 3,
+}
+
+impl TryFrom<u32> for FalconSecurityModel {
+    type Error = Error;
+
+    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
+        use FalconSecurityModel::*;
+
+        let sec_model = match value {
+            0 => None,
+            2 => Light,
+            3 => Heavy,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(sec_model)
+    }
+}
+
+#[repr(u8)]
+#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRevSubversion {
+    Subversion0 = 0,
+    Subversion1 = 1,
+    Subversion2 = 2,
+    Subversion3 = 3,
+}
+
+impl From<u32> for FalconCoreRevSubversion {
+    fn from(value: u32) -> Self {
+        use FalconCoreRevSubversion::*;
+
+        match value & 0b11 {
+            0 => Subversion0,
+            1 => Subversion1,
+            2 => Subversion2,
+            3 => Subversion3,
+            // SAFETY: the `0b11` mask limits the possible values to `0..=3`.
+            4..=u32::MAX => unsafe { unreachable_unchecked() },
+        }
+    }
+}
+
+/// Contains the base parameters common to all Falcon instances.
+#[derive(Debug)]
+pub(crate) struct Falcon {
+    /// Base IO address.
+    base: usize,
+}
+
+impl Falcon {
+    pub(crate) fn new(pdev: &pci::Device, bar: &Devres<Bar0>, base: usize) -> Result<Self> {
+        let b = bar.try_access().ok_or(ENXIO)?;
+
+        let hwcfg1 = FalconHwCfg1::read(&b, base);
+        let rev = hwcfg1.core_rev()?;
+        let subver = hwcfg1.core_rev_subversion();
+        let sec_model = hwcfg1.security_model()?;
+
+        dev_info!(
+            pdev.as_ref(),
+            "new falcon: {:?} {:?} {:?}",
+            rev,
+            subver,
+            sec_model
+        );
+
+        Ok(Self { base })
+    }
+
+    pub(crate) fn cpu_ctl(&self, bar: &Bar0) -> FalconCpuCtl {
+        FalconCpuCtl::read(bar, self.base)
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8fa8616c0deccc7297b090fcbe74f3cda5cc9741..8d8b5ee5c9444c4722d1025d4008fc5a8841a247 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -7,6 +7,7 @@
 };
 
 use crate::driver::Bar0;
+use crate::falcon::Falcon;
 use crate::regs;
 use crate::timer::Timer;
 use core::fmt;
@@ -228,6 +229,15 @@ pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<
 
         let dev = pdev.as_ref().into();
         let timer = Timer::new();
+        let gsp_falcon = Falcon::new(pdev, &bar, regs::FALCON_GSP_BASE)?;
+        let sec2 = Falcon::new(pdev, &bar, regs::FALCON_SEC2_BASE)?;
+        let b = bar.try_access().ok_or(ENXIO)?;
+        dev_info!(
+            pdev.as_ref(),
+            "GSP Falcon CpuCtl: {:?}",
+            gsp_falcon.cpu_ctl(&b)
+        );
+        dev_info!(pdev.as_ref(), "SEC2 Falcon CpuCtl: {:?}", sec2.cpu_ctl(&b));
 
         Ok(pin_init!(Self {
             dev,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 891a93ba7656d2aa5e1fa4357d1d84ee3a054942..a5817bda30185d4ec7021f3d3e881cd99230ca94 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -3,6 +3,7 @@
 //! Nova Core GPU Driver
 
 mod driver;
+mod falcon;
 mod firmware;
 mod gpu;
 mod regs;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 35bbd3c0b58972de3a2478ef20f93f31c69940e7..12a889a785e0713c6041d50284c211352a39303b 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -3,6 +3,7 @@
 use core::{fmt::Debug, marker::PhantomData, ops::Deref};
 
 use crate::driver::Bar0;
+use crate::falcon::{FalconCoreRev, FalconCoreRevSubversion, FalconSecurityModel};
 use crate::gpu::Chipset;
 
 pub(crate) struct Builder<T>(T, PhantomData<T>);
@@ -180,3 +181,110 @@ impl Builder<$name> {
 nv_reg!(PtimerTime1@0x00009410;
     31:0    hi as (u32), "high 32 bits of the timer"
 );
+
+pub(crate) const FALCON_GSP_BASE: usize = 0x00110000;
+pub(crate) const FALCON_SEC2_BASE: usize = 0x00840000;
+
+nv_reg!(FalconIrqsClr@+0x00000004;
+    4:4     halt as_bit (bool);
+    6:6     swgen0 as_bit (bool);
+);
+
+nv_reg!(FalconMailbox0@+0x00000040;
+    31:0    mailbox0 as (u32)
+);
+nv_reg!(FalconMailbox1@+0x00000044;
+    31:0    mailbox1 as (u32)
+);
+
+nv_reg!(FalconCpuCtl@+0x00000100;
+    1:1     start_cpu as_bit (bool);
+    4:4     halted as_bit (bool);
+    6:6     alias_en as_bit (bool);
+);
+nv_reg!(FalconBootVec@+0x00000104;
+    31:0    boot_vec as (u32)
+);
+
+nv_reg!(FalconHwCfg@+0x00000108;
+    8:0     imem_size as (u32);
+    17:9    dmem_size as (u32);
+);
+
+nv_reg!(FalconDmaCtl@+0x0000010c;
+    0:0     require_ctx as_bit (bool);
+    1:1     dmem_scrubbing  as_bit (bool);
+    2:2     imem_scrubbing as_bit (bool);
+    6:3     dmaq_num as_bit (u8);
+    7:7     secure_stat as_bit (bool);
+);
+
+nv_reg!(FalconDmaTrfBase@+0x00000110;
+    31:0    base as (u32);
+);
+
+nv_reg!(FalconDmaTrfMOffs@+0x00000114;
+    23:0    offs as (u32);
+);
+
+nv_reg!(FalconDmaTrfCmd@+0x00000118;
+    0:0     full as_bit (bool);
+    1:1     idle as_bit (bool);
+    3:2     sec as_bit (u8);
+    4:4     imem as_bit (bool);
+    5:5     is_write as_bit (bool);
+    10:8    size as (u8);
+    14:12   ctxdma as (u8);
+    16:16   set_dmtag as (u8);
+);
+
+nv_reg!(FalconDmaTrfBOffs@+0x0000011c;
+    31:0    offs as (u32);
+);
+
+nv_reg!(FalconDmaTrfBase1@+0x00000128;
+    8:0     base as (u16);
+);
+
+nv_reg!(FalconHwCfg1@+0x0000012c;
+    3:0     core_rev try_into (FalconCoreRev), "core revision of the falcon";
+    5:4     security_model try_into (FalconSecurityModel), "security model of the falcon";
+    7:6     core_rev_subversion into (FalconCoreRevSubversion);
+    11:8    imem_ports as (u8);
+    15:12   dmem_ports as (u8);
+);
+
+// TODO: This should be able to take an index, like +0x180[16; 8]? Then the constructor or read
+// method take the port we want to address as argument.
+nv_reg!(FalconImemC@+0x00000180;
+    7:2     offs as (u8);
+    23:8    blk as (u8);
+    24:24   aincw as_bit (bool);
+    25:25   aincr as_bit (bool);
+    28:28   secure as_bit (bool);
+    29:29   sec_atomic  as_bit (bool);
+);
+
+nv_reg!(FalconImemD@+0x00000184;
+    31:0    data as (u32);
+);
+
+nv_reg!(FalconImemT@+0x00000188;
+    15:0    data as (u16);
+);
+
+nv_reg!(FalconDmemC@+0x000001c0;
+    23:0    addr as (u32);
+    7:2     offs as (u8);
+    23:8    blk as (u8);
+    24:24   aincw as_bit (bool);
+    25:25   aincr as_bit (bool);
+    26:26   settag as_bit (bool);
+    27:27   setlvl as_bit (bool);
+    28:28   va as_bit (bool);
+    29:29   miss  as_bit (bool);
+);
+
+nv_reg!(FalconDmemD@+0x000001c4;
+    31:0    data as (u32);
+);

-- 
2.48.1

