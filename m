Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8C2BACFFB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3151610E2BF;
	Tue, 30 Sep 2025 13:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DRGIsfFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013069.outbound.protection.outlook.com
 [40.107.201.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63FF10E2BF;
 Tue, 30 Sep 2025 13:17:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tygjl/5dmyUm9lav0umrxfkCTdcyxxa29iIQNBX8XmMQQ4AVbDHyD1ebO/brKaBavzKFfkMfasSo+XJJFjhyrRtsIVS9x+BnenHQMVKCUMQyxHNPVuFjhpLrPwCPNH1XIuincPamiyym19PGOdgq2Ooc/SJbQSMfpwReJ35NIz8WZFFKFKHBpxlW7+NqQtYojlAZfgSIM7YBPSa16GH26kWGBe45wWBWSaZ3ZFlY9CjD+rhxZwV/DL1UVsBE20NvNRvZUDr/W4NuenaQr272gT0lUwTN2zcJBh2VsWegc8gBETMZuo3EtnO2e4jXL3hgJVjbg24U5a9ikHLF9ar8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y3tsjl5t7X/eRnb5dygDhjIYoxXkrUQBxEmUydAL6c=;
 b=E+DQD7H1ydubSrIKJ9wxNclAcSwFeGfRSyK8XFln9tJG8mrSB5RfbRBY2N2/+XhT4Y5Rnlx20LjOzpc4eeawhFg6J3kaAdxlXlWMkEafANYCSJiCtEDs9AfCKGo9ePIU71baKh+bSQJo1HpRrgkLPEXDjBJYuLyAryWwWp5jNp7rVea8zW9oB16jswM3TKPk9+rUw8Sq4vjt0D9s1qvSYv5fCB3TZqYzpkDgN8CgYotKR7eBHmxOWFDfkiDJ+4xfi/I38qjJDD8YDjaYJnYybz00i5afQhDhqUX6JrEU5e7gpHJeoM3M/HeE5vmLMmNHB6MbTgLvNSscu1ri/DqsZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Y3tsjl5t7X/eRnb5dygDhjIYoxXkrUQBxEmUydAL6c=;
 b=DRGIsfFeamW9ngmOQQ+MYwPlWA1xiztYqT3nah77zDmQd5itgZ5cB0eFEz3GE9I2HDaCX29T82Rr6LUQb14CabmavBa79nRfZo4gziARtiCALZxBMlv/MJWuHd4qsCzv7j/NgNH/oFitbrPnZom/AjzJ3bMpUR7IX5h73Yv7uxu4ft7aMwfeZVWV3B0fB4z+0/X0GLe4HM4Txc3/aTVSOI90OJtvspr8L3Jqzzf4UqEPavQaRCPFME5uVDrxJhOw4+Fv/JCO41BBBA/NDaaMR50F0AxMQ+SHmO7ygQLq1e2HT/ECIxOaOum/vhCBRfPVRqaUbeMu4fX5OO287B28jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 13:16:56 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:16:56 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 00/13] gpu: nova-core: Boot GSP to RISC-V active
Date: Tue, 30 Sep 2025 23:16:33 +1000
Message-ID: <20250930131648.411720-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SYBPR01CA0104.ausprd01.prod.outlook.com
 (2603:10c6:10:1::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 3388454b-6c1d-4d35-cca0-08de0023a0f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDdxa0p0WW5MR2tZcUdCcCt2K2RCSEZKTlIyTndZYkI0bSs0L2krSW5DSjJT?=
 =?utf-8?B?SUs5YU5MUU1JL3VmY0JiQ3YzWjY1amg2Rm1BN1VzTDF2OFMxZ0d6OW1WU3Bk?=
 =?utf-8?B?WHh5WHJIbnFEcFZWMWQ4ZnhJUUgzcTdhNVA4aEplSGNtY2dKNFlzaDVSR1N2?=
 =?utf-8?B?RkdmTFAwRmFJVkdJNjlra0tNVjR0SDcvcDdRRndmMWIvcHdGTXhNRnB4MEM4?=
 =?utf-8?B?a21jMFBjcHR5RkR3UHNBZ3E3bFZmaDFwR2Z1UC9IM1k5enhZQURKc0RhMk5L?=
 =?utf-8?B?UU1pSFRlRDJYOGEyU25PWlZFZ2YrOUY5MEJFd0FOL1c0UkZkdytjbTREeWl4?=
 =?utf-8?B?cndtYTl3bkJ3USthTnlsR0twZ3pGWmVwQzN0T2dzOTN3OWs3UTQ2SU1ReUhD?=
 =?utf-8?B?QTkvaFdqUG9UYUlDVEJjUHNPT2c2c1VGSVQycG1jVVE1REdvVFhiOFpidDhL?=
 =?utf-8?B?bjdYYisvQURUcXM0LzNoTTJKSEY0cGxESVNVL0lZRkhnVlZHQVJwYytXRVIz?=
 =?utf-8?B?S1IxNGNtSkJhZE1yYWt3MnRUUGplaDhoaXF4bEp4ZTN0a3Q3QlY4QUl5dDY4?=
 =?utf-8?B?SXRDMHVZdGZYOTVkMm95WEFSMmJOUTkwbUdCUzgwU3VBeXZKWFo3S1o0TGlz?=
 =?utf-8?B?aFJ4cU05NHVzKzc5THBGY2RzTDRGYks3T0tOd0FVbEUwOGJiZGhraVhwWEFK?=
 =?utf-8?B?bDNvbEcvR3VkVHlIVS9vMGh2L0V4TlRmMUdOME5DcmlvWExLZWZWc25iUUhk?=
 =?utf-8?B?NnVvaGVoRVM4SDZnNTBUWHJRRm5RTktnRzBCL2dFL2NPcDFiK200aXNjN21y?=
 =?utf-8?B?M0xvenM0L093S3c3MWJOa29waUNZTXNLZ0ZQdlRzcmlYa1FPWDczczkwQ0Yz?=
 =?utf-8?B?STJoN01ZQkhYMS9BNjRGbS9EMVNhdDRnTkVCd1kvOHNGZXlCMjkzVzJ6MzlJ?=
 =?utf-8?B?by90REdpT3ZlaEV3aS9pdU52a0puUjRmbklPalVLa3NtRGs3R0syclJaSlZm?=
 =?utf-8?B?cVlzN2xqMTFtblgzaGpGOHdhdWozMFk5OFp3eHQ4UTl1MUdDcjB0VWlwVEtZ?=
 =?utf-8?B?cUJlNWkySVNmb3NUSkFCU2lBUmpIY0U2TXhvaHVndUJScjVzUE5tbERjYzZy?=
 =?utf-8?B?eVNhelNWKzBvS2xCdTg2cTJMUnpvcUJUeWV2YmtKTVBRZkZsVzVjbEpPVHdn?=
 =?utf-8?B?aCtiR1lCalNJeVAzV2NDWm1kK09FOU9TK0x0UHl4OVpwUG91QXpEQlp4b2pM?=
 =?utf-8?B?dVlZUmI4UDBUbFZZdmRvYTkrb1llR1czUS9oQUxod2FJMnUxYVltV3pFSVV3?=
 =?utf-8?B?U1R2Tk84NG1sT1FicFNHZ2YxNDBQNHR1YjNaSTZFaDRLY0FYdWZ4MXZTUE5a?=
 =?utf-8?B?MGtSZ1VvQW1QV25LUndsVzBmN2dkNGw5MUhKcHpycnlmdlJEZnNSTHpUQ2hK?=
 =?utf-8?B?QW1WQkxhbFdmUTJUQlBqTFNMRDY5S1NnVUpxRDlqeXZIK0Mrd0JEU2hISGFR?=
 =?utf-8?B?d1pRUzllVUN5cE1BTnVIOEYyWXQxZ0xYendZZFFOS25WTmdQbTRtOEt3NFlK?=
 =?utf-8?B?MzVMS0hEd0RQL2pTVlVPei9hODg5b3RKc2VXd3k5K1cyMVF4OTUraE11WFdT?=
 =?utf-8?B?bUdyUk9oaEViZENWK2RPdytvczFGSnVzK2kzb2FKVlFuaHVtOWc2anFlQW03?=
 =?utf-8?B?Tkl5dTJFd1FRZC9Qa1Y2RkdpL0FDNTN3SVVDNWtaYjR0bE5nR3VwT0dNQUZM?=
 =?utf-8?B?SVorQ3BDSm1ibDRGUzE4dFJXTW9TWEtIc0RWeTJ4Y2hpdm1JSjNlQVVTd1dR?=
 =?utf-8?B?UnhiWE5mQTduOEJadWNQbmtUeUc5SE03U2J0VFVxbzRPMlkzQWJQSWpUaDVv?=
 =?utf-8?B?ajBkTjJVMWVORjBLMmI2SkMyV2tuZGdVV1k5RFk5RVFZamh1clg0ZThXcUZH?=
 =?utf-8?B?ZUwzTWdHYWZ4YTE4L0tIMVZ2d3hNYnh2Z2s1dEZIdGhFcmlSTkpIam1NM0Fp?=
 =?utf-8?B?bjVCeXNVTDVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXE0WG8xVVFXdHdqOEtIbkdxMURkMVRKT0MySHptUHdyZEFIUHVlbTMrWGti?=
 =?utf-8?B?aENGQzZJU3JwZzlIRjdzc09yTUpxWTlKT0VETG1KTVhCZXh1c3A3OHF4eFYv?=
 =?utf-8?B?TnN0bnBWUHlqQzlFVER2R3g0akZ6aklpK3BDMDVzZXhvTTdWdkVTUzRDM2VM?=
 =?utf-8?B?Vlhqb1JPNDhhN2JKMTQzMWQ3WHhNQnB5NlNWbWwwbVVueW9TeXpJQWlHdk95?=
 =?utf-8?B?ZmxPUVpadGFNWUVndGdmWHpoekNyLzlrVVdkNmZRcE1WKzJ3cXh3cDhacVM3?=
 =?utf-8?B?dzRXVHB6Ukd6alorbkhHUHpwRXhlUTB0VHdPbjV0bCtVeTZTVkNPWXNYL3RG?=
 =?utf-8?B?K2FNbXRmcVdvN2s3M3BRZG9Wc0lSNGJTOEhUUXFTR3I4K2lwdk5wbmNHMXhL?=
 =?utf-8?B?aUFnTDY4UU9QLzZXUkFaRWVaZW94cmlPQVhIdjhMY3VFUzdiYkExeTU0R1Y2?=
 =?utf-8?B?VGJhd0lIK0xHV1VPek0rWTVQN0M4b3hoa3hlazMrQ3VsdTRLenBrMnF1eHNl?=
 =?utf-8?B?Y3BjaWhVOUhFUGJEdlVzc2huWUlnWGxkQll5Z1dYdTNUMTl4R09oaWswdUE0?=
 =?utf-8?B?aHV6eWxuN2xjQ01RNUhkc1ArZW1xSnU5MVFITGRrK3pidFBxMXdsL2ZheU0w?=
 =?utf-8?B?NDdJZTltN0ZEM0loN25ManR3Q2Z1ZW9UclNzVWJKaTcrN2Y1aXo4MTZ1WEk3?=
 =?utf-8?B?WmNmTDc1RnlyZFdUa2l0aXB3S05nMW9jSFBJUStZOE5NeGhJY292UW8zQnpK?=
 =?utf-8?B?dEU4MTU4WkFCaDZnOHJjOW44UXdiKzhzN0oxZGRTdFd5WEpaUWhENWQ1TTBw?=
 =?utf-8?B?ZHJlRURNU1hrbmNXV2o1NTZjM25CUmJlZ1RuSFVlaTFMOEl2bUdMZzFUeDNm?=
 =?utf-8?B?eWVITk1iOVAwZC9DU1BDUkFLNG5CemlNMXNXLy9IZkdsRlNKTDNoeDNqUWFr?=
 =?utf-8?B?ZDYrSFlIa205YlorbUsxZTg5c1NmZHJHWlJnRmpsUkhXekI4L3ljcmdkYXNW?=
 =?utf-8?B?ZnR4cU42dnMwL3I1MGJIc0ROVUU0MVNhYVFibnlGell4Z0NnKzd1WUpiSzlr?=
 =?utf-8?B?aFQ2T3BKYWhOZlhWdEEyMDllbFBZSzY3QUVQTnhjb3lMQ2hBcEFjdmQwYTA0?=
 =?utf-8?B?SnBhZEhja2FjanFoS2Rxa1R2YjZSMlRaeGlsMnVaclc2OHdaSklLRWU5c0h3?=
 =?utf-8?B?c2YweTBWdERvRkxNSkZPVmRrNExSSmFOTTF2NnAxUDF2TkVpMThUaEp5bVdi?=
 =?utf-8?B?aVk2MUJvTXhxLzRTeVgxSVhlWTl2WkMydXdnUmtFN3k1bTNWOGkyaU1UaUNr?=
 =?utf-8?B?TmduZFFyL2RsVWxYb09IMlArVUlIOVJacGZ3L0liRUNoWWc0MmtQSnlWQ3N4?=
 =?utf-8?B?ZlJRQzVVaFNkb0tuT0Y1cDNmYVNWYlRMU01PMlpKTG82SW53Rm8reXA0Q2JQ?=
 =?utf-8?B?VzJGMFNsY2k1YWJOZjNqT0toTTlJMmtDWDZQektQWXlGdXF0NTNLTmlldFU3?=
 =?utf-8?B?MUtkWncwUm4rQnI5Nk5raEN6ZVNsUkdrdWpGT1IybGdzV2xCaGZjaXhqazNM?=
 =?utf-8?B?UkNSUVNkM1drSVpOR3VVZjYrQ1hnL0cvK1hGSTlCTlNEZmxqalViV3h3MHZ4?=
 =?utf-8?B?R0RzU3JjTkMrTmF0Y3pwSFZvVndRSlFpVXRMeTBKQ29yWklMcDJNcmI2SEJ5?=
 =?utf-8?B?aTVENS9SeTBjb2U2Z3hjSU53L3VLTVI0cHJrdmx1N1JySExmWG03a2xFcy9p?=
 =?utf-8?B?b2NwY3kzVW9LNzRQem9WWHVIcnhqSllBMnIreTNGMzZEWk84eUFyeEIzWVNN?=
 =?utf-8?B?NCt3eVN2cTJBMXYzZWRSdVdYV0pJRWhuTW1heHBwN0tEYnVhbmNaeER2SXRD?=
 =?utf-8?B?SnV2UVpKRFl6d1EzYm5DUlJ5SXhlb0w4QktMM1lOMmVSTkVuSEgyQytPcnox?=
 =?utf-8?B?QkVDREQ0OHhSeDZxMDcvZ2IyTXFPelo2bUZ6VnphKzBVV0oyN0hUNzA1WWN0?=
 =?utf-8?B?WU1vMFhWZEpkWjZHVjNiRTFSQnpaS2tjT2lVbTE3bnhqbUNESlhYaWx3T0dJ?=
 =?utf-8?B?ZERSb0VUTXNSdFRuZW84THZkSlZ0RFZDdkg0NmdyVVBQcHNjRk5LUTc5VGZZ?=
 =?utf-8?Q?CzPEbXUerss1fZSjbxGq55NOZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3388454b-6c1d-4d35-cca0-08de0023a0f3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:16:55.9948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6kLyydO1WzCuT7HQS0FQWIrtL/i2/xJ0iSovfdoS64MEQ5Z7/DKZkbcYXYJhNfliJFVFFLWVgHEOQLvUxthhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
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

Changes since v2:

The main change since v2 has been to make all firmware bindings
completely opaque. It has been made clear this is a pre-requisite for
this series to progress upstream as it should make supporting
different firmware versions easier in future.

Overall the extra constructors and accessors add a couple of hundred
lines of code and a few extra unsafe statements.

Other changes include addressing a bunch of other comments - see the
individual patches for further details. There are also still some
outstanding comments and TODO's to address which I have not gotten to
yet - these will be done in the next version of this series.

Changes since v1:

 - Based on feed back from Alex the GSP command queue logic was reworked
   extensively. This involved creating a new data struct (DmaGspMem) to
   manage the shared memory areas between CPU and GSP.

 - This data structure helps ensure the safety constraints are meet when
   the CPU is reading/writing the shared memory queues.

 - Several other minor comments were addressed, as noted in the individual
   patches.

This series builds on top of Alex's series[1], most of which has been
merged into drm-rust-next, to continue initialising the GSP into a state
where it becomes active and it starts communicating with the host. A tree
including these patches with the prerequisite patches is available at [2].

It includes patches to initialise several important data structures
required to boot the GSP. The biggest change is the implementation of the
command/message circular queue used to establish communication between GSP
and host in patch 6. Admittedly this patch is rather large - if necessary
it could be split into send and receive patches if people prefer.

This is required to configure and boot the GSP. However this series does
not get the GSP to a fully active state. Instead it gets it to a state
where the GSP sends a message to the host with a sequence of instructions
which need running to get to the active state. A subsequent series will
implement processing of this message and allow the GSP to get to the fully
active state.

A full tree including the prerequisites for this patch series is available
at https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream.

[1] - https://lore.kernel.org/rust-for-linux/20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com/
[2] - https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream-v2

To: rust-for-linux@vger.kernel.org
To: dri-devel@lists.freedesktop.org
To: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>
Cc: Björn Roy Baron <bjorn3_gh@protonmail.com>
Cc: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Trevor Gross <tmgross@umich.edu>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org
Cc: nouveau@lists.freedesktop.org

Alistair Popple (10):
  gpu: nova-core: Set correct DMA mask
  gpu: nova-core: Create initial Gsp
  gpu: nova-core: gsp: Create wpr metadata
  gpu: nova-core: Add GSP command queue bindings
  gpu: nova-core: gsp: Add GSP command queue handling
  gpu: nova-core: gsp: Create rmargs
  gpu: nova-core: Add bindings and accessors for GspSystemInfo
  gpu: nova-core: Add bindings for the GSP RM registry tables
  gpu: nova-core: gsp: Create RM registry and sysinfo commands
  nova-core: gsp: Boot GSP

Joel Fernandes (3):
  gpu: nova-core: Add a slice-buffer (sbuffer) datastructure
  nova-core: falcon: Add support to check if RISC-V is active
  nova-core: falcon: Add support to write firmware version

 drivers/gpu/nova-core/driver.rs               |   8 +-
 drivers/gpu/nova-core/falcon.rs               |  16 +
 drivers/gpu/nova-core/fb.rs                   |   1 -
 drivers/gpu/nova-core/firmware/gsp.rs         |   3 +-
 drivers/gpu/nova-core/firmware/riscv.rs       |   9 +-
 drivers/gpu/nova-core/gpu.rs                  |   2 +-
 drivers/gpu/nova-core/gsp.rs                  | 111 +++-
 drivers/gpu/nova-core/gsp/boot.rs             |  77 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 419 +++++++++++++
 drivers/gpu/nova-core/gsp/commands.rs         | 101 +++
 drivers/gpu/nova-core/gsp/fw.rs               | 419 ++++++++++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs      |  80 +++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 577 ++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/regs.rs                 |  15 +
 drivers/gpu/nova-core/sbuffer.rs              | 188 ++++++
 scripts/Makefile.build                        |   2 +-
 17 files changed, 2006 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs
 create mode 100644 drivers/gpu/nova-core/gsp/commands.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw/commands.rs
 create mode 100644 drivers/gpu/nova-core/sbuffer.rs

-- 
2.50.1

