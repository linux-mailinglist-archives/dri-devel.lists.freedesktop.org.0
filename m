Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLQ4Mpq8lmkylQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A69015CB43
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E60610E6A5;
	Thu, 19 Feb 2026 07:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ipzPuyxr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051BC10E6AB;
 Thu, 19 Feb 2026 07:32:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/BAOyesNVeILsnL8CzylEXZBBTd1X0CnaM80xSndyvkQsbRtLKuysCYgNuxm+8WesTgSpXkaGSjwZ4z3t+fy4B+ihpShKFPGuhn8iGdas4kgMg6I7qmO1ZwUKjYZHxvUYPhTdB5Jb8Nro9le1lB2xhgdUvsdApb+jhOde/JTnJP6/oeLe0KlCrylFz/jLRAfo23D3wrYbMyHSzl9LvmJCYRHpOnR1U4MEWcTcffVjk794fpw7jkXCmS5P8FgnqRimezB2LSGSmHkaDqoUIc3m4r25i0MKu5aI5lFhkF846PaWzlbhXObIC79iCvEKpJ9aD3zCwv/80/n+LNyDVF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDajBE6E1o/O3/Tulrpylpgf/4vh17owMUjfNUyXWN0=;
 b=Aqgwdb/HHAWsHGHgQaa3l76716LnY2A0AiElcJkx4yedvsUv37ufrOTDfq/H4LwwHIMbwSL4nFlBpkWGYa2o2oOKPH7JDfW1F6BQi6n3+WXgcav089gXvE3PdoQDVbRYXUJvYe67a+vu2rdMUUcr/8tXUjv7NxaykUR4YbA58bW6ofpyFi4tUyiMiTyGKkUgALxJapP4Fa9ZR07BlkwayjiahkGj7we8+MPQPXDzpLtslzRH5xYSALyJlkrxVhpzUefRp5JWwbdsMdi5z/ZnBFLq2J2bRMmwXg9m7wxx0N1Xv/N76TN3JrPAfuEOWNZ1I9kuvozvYzX113Yy60vakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDajBE6E1o/O3/Tulrpylpgf/4vh17owMUjfNUyXWN0=;
 b=ipzPuyxr9QCoXmQz1xd22hSg4xzlqqfO4Unc3OtsSgBGZXjS7lUlgjCzB9cUzi3h8/kp19EfQzHe2Hsg0M70xlmPsF89S4AOkDOtQvDCpjgkKS0UexdPYIhKUUL7d/DE8wsIvmccA91vm7I6tGxqpIURbci6rGsHTKtdHHFKcmLN+D2R82BXJ6YEwMo2IZs8iH5yKYuRNb8ZdTL8wzHUJDCxHNPvM5GoD5SR8LnQqVhv1FyKIwqKbX5qaokNhweBlHSM73XcxmvzcE0To4may01VCL6/QGya/EB7N0wIfdCm8RDHwtmwHL0ePR2QAO6TWx7Fw2BXa2wwUS5sP2edbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 07:32:36 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 07:32:36 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 19 Feb 2026 16:30:55 +0900
Subject: [PATCH v2 6/9] gpu: nova-core: gsp: unconditionally call variable
 payload handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-cmdq-continuation-v2-6-2e8b7615536f@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0162.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd1e5e0-20b4-4f8e-d4f9-08de6f890d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzVYVWJmOFM0WXB3K3dUUFJROENzVHZmaTdOTkNZTVF1MVNxYXZSRThGREVK?=
 =?utf-8?B?Nm9zYVk0SXpBZHBYSjFlZWJpV0NPZXFsVkZUdHdmWXVyOUNIVGtUSmh1Ukhu?=
 =?utf-8?B?b2taVWcrNituRGpNNmw3ay82UzMxRzJGbjgzZ2VFWnh0Vi9pbStKMGNSSW9X?=
 =?utf-8?B?K3doNzNTL3RsNmZWRW9EYUtBSGxNRUNrRHJ3OFVLSE00RzQxcWY1a1h1MGU3?=
 =?utf-8?B?SFZ0akt5SkYyODhSUEZiYU5wRTYrZlpKVG91T1JwYnViajZOR1BrOHRMOHZx?=
 =?utf-8?B?K1g1dnl6ODBEWVlmYi96QVJjRGErTjMrRFFoaXhpWm1iUFVNWit6VlkrcnJ1?=
 =?utf-8?B?UzNtMHR5UHVPSG1iZ0lJSHU2blF5dTlxWHNHbzNuK1F5dk52VFhvUUJGejVN?=
 =?utf-8?B?dUZSQXRDaG5PZ2JGYVN2VWlERnRBMUZNV0d4ZExtYXJIdFhuekVXS05QZDlB?=
 =?utf-8?B?RVcvSVg4RC9zV0pQY2hMUSs4SEVmVCtwWlErcFpTaUlmeVM1MnVhd2IvY3Yw?=
 =?utf-8?B?ckVMN1lxZFNKdEVuUVllNDRJMDJBVU1Ma0xKYm9xdnZJUkdhTEtzdnhKTTIr?=
 =?utf-8?B?V0pxaG1tZmVac3JpYWJhenI1dmhjYzdlMWdYUUdUYW9yeEpHbERvYWdNYXJW?=
 =?utf-8?B?NFgrM015Z0hFb2tWSzF0b3dJNWFxZ3pVWmJaQW1QNDFsSFhlOXYzMSszbDVM?=
 =?utf-8?B?b2E5c3lQYW9FQytyV2ljSXFrMnRQbm5GZ1pnY0ticVIyV09kUnNCUGwyVHlD?=
 =?utf-8?B?TmVNUnhrSThWNzhkMkc5SmN5b3RncEFIWlZ2TG9oTEE5RGJrUmdrYWZKVGFh?=
 =?utf-8?B?dkxqTnBXMkNwLzZ1eVhTRFZoMzU4T1J4azBlL2JnNGErZ0M1VlhvaWZSMmdJ?=
 =?utf-8?B?WUpiY2QwRk5PRWF1clordVVvWTlCdHdXSmtlMlB1M1RtQkVwbTVNbEJPbTND?=
 =?utf-8?B?RmtmTlJraUZxbnczdXdRUjRwR2JBNVZCRnB5SzBCTjh1RlhPTVAxMVo1Z3JO?=
 =?utf-8?B?OGUrc0U5RFZXSWhEdTlhSXh4aXMyQXY1bzZPQ0RyaVZRZHNRc3dDRHFDZEEy?=
 =?utf-8?B?U1IzSGpKUFRwSGZjSk1MSG5PUEljbm1ET0g5ait1dzhKVDEvdVdDR0UzWFBY?=
 =?utf-8?B?Nm9NY0VLcGhXN0pHT1UzSm9SYjRKR2xZT2NITXduNHhzd0FuaTdtYnhjSmZy?=
 =?utf-8?B?VzdxVStyUlQ1ZjFuaERtZzdNZ1J4Mk9tbFcyeVlCVDRRSUtRb1BIdHphL2o5?=
 =?utf-8?B?SFpWME5DcGswb1FVK0pjU1hTMjA2UmdTMXFVdWE5RGsyMFU5bFBmTHFEWTdE?=
 =?utf-8?B?aTVHeXVaelFiWWRQQ2x3NEMzMWlzRm16YWpKcDlsdHAwdnlxUlpDN2h2VWEv?=
 =?utf-8?B?dGYrci8rN28vcHE5V1ZlMGhmb2xGdnFMNzRHZGY2TnNoMGdrbUM3Zy92UGYr?=
 =?utf-8?B?WFRMVEhpdm9zbE16QXFkazhPS2NnNXFHRXZiTFZPRktoeU9kQURKVzdQQ2hT?=
 =?utf-8?B?YmZMSWRYVERJWnQyNjdYYk5kRlozWTN1TDg0WGdSS0NjNFA2WUtTaG16OVB6?=
 =?utf-8?B?TnZ0RzRvc3QyenhYcnlDaXRLUTNBVU9pdDBqTEozOGFmTmhZTjhLUGdGTnY2?=
 =?utf-8?B?UzNlREdsNWFYSDFWUDUwNjloeHBJRmhBOEJQWnN0WVNld1BtbVUxL1BUK0FQ?=
 =?utf-8?B?alJaNnl4ak5DbGR6M05LSjNvSndmOENqa0pFaHFhbEZWNnpSRDRiSk5OZjNI?=
 =?utf-8?B?b0lWZWo0VzVyc0RjT3lyeHZoNzZxTS9zSG9xZnBQTGo4QzRBY1pKK245WU5J?=
 =?utf-8?B?TndmdXJaejljUEljdWp1OEZ3NG1DOHFpc2JKNE5jWTdCYzlicVcrdzQ0VGph?=
 =?utf-8?B?QmZpV3k0OGdHeTBpRXpacmZaUVZ4dmsxVy8yT1p1dmF0VlhIWUdTb3dTVEhI?=
 =?utf-8?B?azNrRWgrVTRQVEhWSUdpaERCckdBWUVNQ29oWWt1TVZKSVVMWXgweW5nWHN3?=
 =?utf-8?B?cmIyNGNqd1VnWCsxL3I4dkduQ1lwWmk2Uzh1OXJTWUlXMXh1OEljVCtncnBN?=
 =?utf-8?B?aU5DV2s2dHl6WW9heEpGSGdOQVB1cm9DTE9hMjFldlZ0eVFxY3RaZ1NsaWJF?=
 =?utf-8?B?M091SlZWOUZGRlNhTktBUysxdVhwV0JnMWQ0Yi84eEFNL3FjUU9hRXFYem41?=
 =?utf-8?B?aWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVhkR1Q5Vk5qUy9aU1BUY2lDaWRZWXFOTXdlR2FqWVlHN0FRWk9PWkJXU2w3?=
 =?utf-8?B?eEtVOFZHUFNTb1BVZFlLTGxrUGxXTFkvYkVRK1Q3K3NmSGZoUTQwY2tHR0xM?=
 =?utf-8?B?eU4xd1lwZU40aW91R2pSZndhSlRUT000YUpTTUJJRXNGaVBPVzY1anI0NWwy?=
 =?utf-8?B?YjA0MmtoQ3FBQjFLUDY0YVRTUTl3NWR5R0NLTytLdEJ2c0tWNUZTY2p0OTdQ?=
 =?utf-8?B?dnp5UlI4NS9sV2tvdzdFa1UvR3A4bElJU0I4eVVsYXhReWtsTHd6SmN6NnRk?=
 =?utf-8?B?eUpQMzNTNDNGQlZ3TjJMVHM1SzhTdjFGSnduekpMNmpIcCsvdE5oaGpsRit1?=
 =?utf-8?B?cmZ0SjBtOEFLaXRsYitETWJtd201b3JtNkdSbTdJWkl3aDkxMVJNb3l1aVNm?=
 =?utf-8?B?Y201NjhXbDNrZGpZTGJ2S2lpc0cwM21GMXFOeFdYY2h2TTd2U1pKdXpaK0Iw?=
 =?utf-8?B?a1d1RTFFYlJmL25ESFRzdGxsS2tidDVDS20ySDZoaUpQQlVNangxTzVvd0Nk?=
 =?utf-8?B?MFJGdFpHaEpVQWh1eS85eU4vZlcyOGdJT3FBNDVtV3hkM3Vqc0ZXU2xrSlN0?=
 =?utf-8?B?WWZCRVg0ZGZwT0pIcWs4NHBIbEY5N2ZoYkY4Tm41S3hKU1d1OURKbVJyalJT?=
 =?utf-8?B?S2dlelN3R2pHNEZucGEwTjFleHF3T0cxZXZIOFBPc2ZKNHBaZk9wZWxUbkkr?=
 =?utf-8?B?SG1iZDZDbTNKTFB5NVFyTGtyVWIxclNJZWJJU09UWVN0cTZEMU9sMjErd0Uv?=
 =?utf-8?B?RzlRL0Ywb1RlU0hkVnpyQ2xhNWhOQVJuR0FpZTNTakVTalpJS3d2U21RMnZ5?=
 =?utf-8?B?ZjExL0RYRTByTFlydW94NUZVZW5RQUNEUWxCRHA1WXVCUVc1Q2w1Z3U3MVVz?=
 =?utf-8?B?Mmt5V0xBdElXQTkxdWdPWWNudlZ1TkpyVHZnSStjV3E4c2pvakVnY2ZjQ3Zh?=
 =?utf-8?B?Vm1OVjRmcDZWWUViVk1zWlhzTWtHd2drVmJVZHk4Mm9oZEw0Zlh1eThSSlRz?=
 =?utf-8?B?R2MwOHVQTHBJNENOYzEwMit4Q1FwSXBlUVJxdUJtdDk2NkZrV3huSitUazdX?=
 =?utf-8?B?bHJ3emViVHpBMWNITUJQZWw4dlYzazY5M3cwMTh1RUFCZHBjcEtCMXNkQThW?=
 =?utf-8?B?YWpiVVArcllrQXJIaUUzeXJmYjlSczBpUm9jTE9DSXNrU1Y1SjYrSDBlRDVJ?=
 =?utf-8?B?OVpsMHJPdFZrTS82MTN0NmJIdTdBUjZPaEZnYjdheXA1SUpoQnN1VzhoWmRu?=
 =?utf-8?B?ZHBCVUs0WEhIaU0yVDNxVDcxeXJrM2ZTUG5HR2pHUG84UDRvbzZQUDhvSzh6?=
 =?utf-8?B?bWlCdUtvQ0JCZCtydmdCeVg0aUt5bUhGai95em1lQ2ZlYkZLUkYvaDZmQ1Rw?=
 =?utf-8?B?a2l2R3lCOVl6OUdGRGl4b2E3YUhzMWhOQ01leGlQK281ejhQLzk4SHBvKzht?=
 =?utf-8?B?N2Q2Uld6blR1ZkNKQ1IvSFlETmtwUXd5K09iemdBdlNXOXZUVG1pQ2NnRG92?=
 =?utf-8?B?c1A3WFBzL2pCT2lla2lCbFJvSENDdmgxSFhvRGtEUmJ4dGRrelZMVjNjRmIz?=
 =?utf-8?B?QS9pTDIwKzlDaENocFUyQkV5K0gvVFQwR0o3dmV1WVRPOEUyWWtNRlVSaFhs?=
 =?utf-8?B?YlhQYlJ0NTE4RFg1WjNJUFdpOWloUmdDWWJKZ1VBOTdGNG05TklJUUlFdmhu?=
 =?utf-8?B?VWNFUStnRmtKRFA0TEdXckNhUzVod1l6ZHpLTDdKUVhOSlEwa2F5NDVVV1o5?=
 =?utf-8?B?ZTRPMWErVXFOeGdjdzZpd2dBZkxVS2wvTXZGNHNOeWJBOXZRa0VNT0t4dngy?=
 =?utf-8?B?YlhMWU9KV3NEMlU1RE04TUo0TWRpaTY2Z1M0VkhSbHNaS2lNSHUxVDE1amkw?=
 =?utf-8?B?NlRoUngrRDZuOEN3S3NDU1Rmek1ZdjYzSlptekVZd1d1b255MTBkdVlIdEtD?=
 =?utf-8?B?UFg3R2lHUElZU1NRK3YrQmtPbjI0ZEt1dWNBaFBKQ3JvbjFQWHlJaE42aWZV?=
 =?utf-8?B?blovNGt2a2FqVnRuQTJndGFIQjFLSGZnTU9GdUxabWRrQmk0T1NCNUtCTkg0?=
 =?utf-8?B?WVdBYjRwVW5pRU10Wnk4bEhJY2d0OGNrdlhVSm83a2Y0S3hMaEpkeEFYZHFt?=
 =?utf-8?B?TXNsQVRiN1h4QkFwanpCN0ZpYTZaM3F6clNKeGJpbkN1RGFRVVU2YVkzM2tN?=
 =?utf-8?B?Wm9DalFoSHJOMDhYUjJuWDFWazBtM0hiQjBpNXZBQnBIdldESWorajh6aUVE?=
 =?utf-8?B?aVRMc09EYlNWSjJaTjR3em92c2c1ZXRZNUdPWmxFOEROa2ZTLzVCSFNPTWhU?=
 =?utf-8?B?dXhTUzZzd2NwaE1RYkZNUmVMTVJ6SDFCNjZsTmplektpZnFQWnk0UlNybS85?=
 =?utf-8?Q?URWxzLfQkqAMM590rEJUQ20bZvg2kth9tooPQ3UPZRA/s?=
X-MS-Exchange-AntiSpam-MessageData-1: Fq+s4PBdT3/8FQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd1e5e0-20b4-4f8e-d4f9-08de6f890d43
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:32:35.9405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qj8pNARK3NfLwM9cdtrKrPRbCKgYMe+poQs8HtVa4ulNKysmMg5F7uriDpZNLcGI6SxND3LIqsvlNnh39h+WBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3A69015CB43
X-Rspamd-Action: no action

Unconditionally call the variable length payload code, which is a no-op
if there is no such payload but could defensively catch some coding
errors by e.g. checking that the allocated size is completely filled.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 08b8c04909a6..1547687834f8 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -532,16 +532,14 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             command.init().__init(core::ptr::from_mut(cmd))?;
         }
 
-        // Fill the variable-length payload.
-        if command_size > size_of::<M::Command>() {
-            let mut sbuffer =
-                SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
-            command.init_variable_payload(&mut sbuffer)?;
-
-            if !sbuffer.is_empty() {
-                return Err(EIO);
-            }
+        // Fill the variable-length payload, which may be empty.
+        let mut sbuffer = SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
+        command.init_variable_payload(&mut sbuffer)?;
+
+        if !sbuffer.is_empty() {
+            return Err(EIO);
         }
+        drop(sbuffer);
 
         // Compute checksum now that the whole message is ready.
         dst.header

-- 
2.53.0

