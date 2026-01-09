Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA002D0C767
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 23:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B966010E25D;
	Fri,  9 Jan 2026 22:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hpMuxE7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FCE10E25D;
 Fri,  9 Jan 2026 22:36:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3eNLyH/hBckQG/o5t4uIvjyRooY9WIX7u09YZFkTGy6y1gSRSy88VlitR867r7FS6wflo9GRM3/FUqno6vLHZOKlam/xJ42lIuMQCJ6O2/0zax6aGbxe+CK2jRbTkzVa8zahbk+HVtpgV+bkIUK78Xn3/GEO3N1rURYLKtmDamH7CGDFaZQeA2kozoi/8B+T9FNbShelgc+m/Mv7msJB9Gk7VHZ5H9K+pjKpkZ/z3VZqhDeYAdYpwcB33gp4XaRl2+2hSONPvNG05rdX/iBvJcgGDvi5jbqvhkkjqovtkGD+HJ9jV+FNK0m28OVpjybhQZxjp1T2/+4vPsi7JXqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBXoIkd6DKTOsG91YfR0xU7Rjd30Zg+UH1j3yg5ZvFM=;
 b=K38UyAWqM6Dwy+u0BVCy80RDiexQjsqArDNcZPyNN6Toj3ncB8/sJdRlTujsLn+zqwOZEqyBuqMh6opLGovSnNLHCvHBecAXdQTWH4rb8D5vq1eAh6WmO0nLJeayca48Ysk/P1xLpEs8WglWbQ7ragwECwa70mxemvJi7qfHR9bWzYz6Uk4FjL3TxIYGinxrnLvgnu2NPI4iyHoMr8XroMvF/+UHZjnFsbxPl7FTcI3syZEO4BEgLvAg5Xx38BGz7Lx3evcPfmosVshsxfKyqJIvLtR5tfQZ9ol/8dNCRDcjbOO4HSh3UiezYH9rADG8MFRuDxHYN4o+7MJLhFKpQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBXoIkd6DKTOsG91YfR0xU7Rjd30Zg+UH1j3yg5ZvFM=;
 b=hpMuxE7vwV8l/yHoZBDZclobO8hMsbmdwJW4GdjjfQq/aTfTsDjG3jocT/GtcuVtVp1f4yzUaBTmZ8246PoHOpg6zMX8QO5CckUpgYUa0zCtLcQlyO7ky59xBst9XXPkfkSKMM8Cxod7Q4dYAdgsYZHkiN8uZp7YPLm2e/k3jwniuJLyD0cqapV3CN5Xyl1AiG/ztUZ3YO6CSxmX1XwsxB+9c9qDw8Ww+C2CvaotQD8BeQ3+IZIHHM6+WYYc0M3a0ijmw0ALqDwcDhsB4S0EXYN2c50kffOJPnhTVqzTyWxphvwWtP6XXw58jhm+3wT1sAX2OUlehLkFRmGt314F/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA3PR12MB7998.namprd12.prod.outlook.com (2603:10b6:806:320::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 22:36:10 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9478.004; Fri, 9 Jan 2026
 22:36:09 +0000
Message-ID: <ead4661f-5162-40e8-a821-647c05745de0@nvidia.com>
Date: Sat, 10 Jan 2026 09:36:04 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] mm: Split device-private and coherent folios
 before freeing
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-4-francois.dugast@intel.com>
 <d1d80b81-678d-4d28-9ac2-95cb74824e73@redhat.com>
 <DF5A6B81-7811-4654-855F-8EAB76CCCE51@nvidia.com>
 <aWFIW6XCKXPpIinv@lstrano-desk.jf.intel.com>
 <D9ED5F01-E758-4A89-87F2-ABFF5197231D@nvidia.com>
 <aWFSGc7MIUqVsilw@lstrano-desk.jf.intel.com>
 <12A9DCBB-0B59-4D63-9BA8-9F99570AFA80@nvidia.com>
 <aWFe9S2DGwfD2smO@lstrano-desk.jf.intel.com>
 <B8B15539-F97A-4D6B-BF58-FC75397C429F@nvidia.com>
 <4485ba83-a8c7-478f-953f-78d66e84d730@nvidia.com>
 <18E78790-4996-4151-821B-8A1D784A3F7D@nvidia.com>
 <5c9f17ce-7174-4e74-92d7-8249f309f756@nvidia.com>
 <DB92CD30-1C6A-4533-83C8-BE7091F706A9@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <DB92CD30-1C6A-4533-83C8-BE7091F706A9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::7) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA3PR12MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: 83fdb810-b17f-4b7e-29d0-08de4fcf7c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVY5SEZNM21BU1JlZk5CRmUzN2ltUm05RVZDRGQ3UjdBOHVxYVhiOUZPNndP?=
 =?utf-8?B?Nk9CYTFTYkQ4cTJlL01qbmpkemQ4bUhBYlYxYnZGODRsOGxSMytFRTJjTGJS?=
 =?utf-8?B?R3QzbnlqSzMrQUtXYUw4VTVxdGVFWlh1QUU0RHZWaGVvZVJld3Y2dHYrYUFr?=
 =?utf-8?B?SnpSTzdFQ1JXVWVSYmpaQXRlbnlQYTBxeGd0Z2lZMGZkM3NDMk8vQjJOUVlF?=
 =?utf-8?B?ZTVoUkM1ZXpIY292bnNIdlpBWE0zaFVJUEp4Y0NvSG9FQzlFVnZvdFFNU2p0?=
 =?utf-8?B?Zm94bkYraXcrTjVBNkhDUWxPdm5zaXUrbUhEN2RYOVhGa0EzSnppc25xNk9R?=
 =?utf-8?B?RlJZK0h1UWo3MEg3ZVFRRmZsRnUxbm50bi9GM1M4K0tCRDBaTzRzVzZUT0dh?=
 =?utf-8?B?TXhpNUNXayt2ZlA3ZzZhNEtYek53ZzNFTkVoM2tFcWhzb04wajJ1UDhDTk5H?=
 =?utf-8?B?bXhWUFU3VzIyMGtYb2Rxdy9GcGQrREZ2MGhTVldRQTNtSForQm5iM1dCaU1y?=
 =?utf-8?B?QkpNa1pMdGZRMFBGRUYyNmhHbUw4dk4vdXdQUU5YNFdFWHRuYkhDUVQ2Vi9z?=
 =?utf-8?B?ZnZSV0dDU2hKNmlmYnJTSmxvRmcyck1XeWtodDVCVk1UMUJXY0t5THVFZEVG?=
 =?utf-8?B?QnJmOENlekJvYkQ4cjduWUQvaW5OZmN6QWEvQUNUMms4TWRUYlFrNGdhb0R4?=
 =?utf-8?B?M1g0OG9BRjFjdDBZNW5rNEY5ODNPdTJGVENwSHNoeFVmazRVd2lKbVNJWW1I?=
 =?utf-8?B?aHplNlFOQk1QMG93S01pZWJNSnNiNDJJVzlIZHdSUTFwUUZtYjBEcTdnV2gz?=
 =?utf-8?B?TFZ3OVFmemFDaDV1Q3Y5MUlLdUJSL1QvZEw0SmFXS3ovTHJrdUpDS3lpR0d4?=
 =?utf-8?B?eDRNc3FzOE1VSUpBdVorZEtrL2hmT3VYd3BPTGxTN3A0OWNzZElmQUZkdmlJ?=
 =?utf-8?B?MjhoNTZUeHJuNkJnREE2UTNZMlYvT2YzbFNQK0FreURBRElLTkhabVBvMlBn?=
 =?utf-8?B?OXlUaWtyTTR3dllPTHVWVytaRkdmaVlpQXdEaitKQ2w5YlQ0bnNkNFBoUmJP?=
 =?utf-8?B?Qi8ra3o1REJwRmtFY3RRODE3Yng2dXl3YXFxcDFIR0h1bjNmVnM3dHhNbTNm?=
 =?utf-8?B?bUFNSFhXMHN3Nld4U0dlZUkvRk9xMVJoazVycHhxSk1aQWZ1VDQ3Q2srUklz?=
 =?utf-8?B?YktRcm1tcmxZQzgzT1RHdDlhOU14NlJYRUgwb3VDRldob0RVd1ZDRzNnd1pk?=
 =?utf-8?B?aEFUbkQzUnBIdXRGcGptRFRnR1BJcWVZZDN3ZmdqVUN1TEs1d0xPQXNJblpY?=
 =?utf-8?B?LzNEcUN0MVcyVFhXZHVZSU5jKzE5SkgrVEE3VzlQbnZ0eWdHQWZrZmZKVFZN?=
 =?utf-8?B?azZsd0c3c1d5VG43MEI3a0Y2V0kreHo3RitzUkVtV2ZWWE4vdkxxUWUzbWp2?=
 =?utf-8?B?MGRDYzdSZmlnZ3o0a0JjeXNKSndwV0k5SkR0aUdIdHZ3SXYvbE14c1lLS0hN?=
 =?utf-8?B?Q3V1Y012bFNML0NlTVA5d1ByL3UwQ3hYT1pCMkFvVk1GNWVjRjFpQ1p1RHBI?=
 =?utf-8?B?OUM3bHM4RHZBSzI0MkFlYVFXcXF1L3VNUmZ1aFBpVldPenlQa3I0TjBLcTBC?=
 =?utf-8?B?dHhiS2tlL3Yzb3B2N0NpMU5tREVObGlaQ0E1bGdweWtSd2s3MVQ5NnBCdGdz?=
 =?utf-8?B?NUd6WjJQWG1mM2cwTkVCNFFhcU0zdlc0bDVRb2Z3ZUV3UVJXbmQ4ejdZUHl2?=
 =?utf-8?B?QlF5UnJ4OG1nbXlvNWxERzNwWmRrY25OOWVJN2U5YnBHN25XWDBRSXNjT0Vu?=
 =?utf-8?B?VHMyRmlLSktwWHlCcnFtaDVyeWkzUjQ2TTl1Z2hTYmVvZU44OFJ6TWtvL1Mv?=
 =?utf-8?B?ekJTSm5qZTU1d0J0UDFmTVh6ZG5FcjRWbDdoaHRSeG8zUE1Zd3NWVlc0U041?=
 =?utf-8?B?RUNrSWVxd1N4MUxPaVVaY3BMYkJXbFdmaTQveXNBVUhuNjQyd2I3cXJXN0RL?=
 =?utf-8?B?R0JPVnM3UUNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1NTR1c1RTY3UVlubndSWi9Pd0FxLzhzOGI5MXg5WDlJUXZRbUNSbkhjSzRG?=
 =?utf-8?B?UU5FMVNTVHRGMVNOc2VxaEE0ZlNHN1VUYlJGUHZpeVJMT1pKWndYeWdqQ1Js?=
 =?utf-8?B?NTB0U084Yko0NGJFek8zRTgrUVB4NEpQWkhwMVYzWTlad0dqcWlUQlpPTm5m?=
 =?utf-8?B?V3lKTGdMOHdqdEpuWURVVjVTKzZDaVE4SWRwZDl3V012UVVBSGI5UFNXQUdw?=
 =?utf-8?B?Rk9NbGQ2TlA4Z1VCb0plc05NSXVDdjBaK1FUamVVVFZFSTFDRHlXVmpoQ3JD?=
 =?utf-8?B?VTlNSkg4cVJLNHJnOWZzZzBNU3Q2ZEdvblduMXBWUHNZMHNYeVp2VjY3eUps?=
 =?utf-8?B?aytuRk5WMEJMQ0srU2lTRHQwSEtTL3QyV1pRUHdJTGpVdkpIQTQxa3Jta2hE?=
 =?utf-8?B?M3haSUdVUHJ5U051Y0YxeEZyc2hSNGZoOHlGVkZkY2pETUJrZXZUNWV6Rklo?=
 =?utf-8?B?dGRvSEV4dDA2dnlkTTF2NzgxOFF1ZDNpK0M3azUwN2tKRWFuQlI3SmNaQk1R?=
 =?utf-8?B?a3VpVTd1WDdEYkhwK00rd1BEVmY1aHhFZTZ1Y0JBTis3M05rblNzKzZVU3ND?=
 =?utf-8?B?VmU4a01EMUU4ckN3aEs3Ulc5ZzFMczVFM0luL1VUa3ZwczBibXUrN3gzR0dE?=
 =?utf-8?B?MUV0ZnQ4YURVM0NJdlhXZEdxMVovOWZYVkZkaStNUDFOVUx6NzVwRlo3enJy?=
 =?utf-8?B?UU00NEIzR082ZUk1QlJ2NDA1TlpsSXNyUDg1QlIrZ1hrbFM3cURQUlhLb25U?=
 =?utf-8?B?c1pWWTBQR2R4WHpFV0ZiemhYeWt3bmhRMThVOEd4amFWcUpxeGtEQW9wLzlC?=
 =?utf-8?B?Uy8zNkVybVBOY2RrTFk3NUg3NFhEMy8xcE9yRVlnZGJybVV5MUlQWDdJdHVo?=
 =?utf-8?B?Mi9WNXo4QkIwM2FLMnY3ZDFSTjVESHNPSzhYQ3ovK0VESFRBY2RzMVRZbzBn?=
 =?utf-8?B?elF1N3NHeGdTcU9obDhMTC9mSmc3cFVTeVlyek9DekU3Y01RUklHSSt6Zm1R?=
 =?utf-8?B?VmpUSmM4WE1wNHAybXNJNFJhTWI0bHlXYzZHM1VEa1poVnFBZFVhWGd1YXlY?=
 =?utf-8?B?dG1TTWNoeEExRzkzVUdyQnZBYmVPbG1wejU4aVZqTytCTmdXS1llTiswQWhC?=
 =?utf-8?B?SEZBWDNOb2h2YTNRMGd0Zjc1RDdQbHQxMndkY1cyb3A4YUM3N0J2N0s4T2lB?=
 =?utf-8?B?ZEkreXlBcHFDZEhVM3IrUVlGNVB3dm9lcGp0UVNsc0ZDSm5TRCtGQjZtK0RK?=
 =?utf-8?B?SU5vZm9MN1Y5NUNvanY3YTFtSm9Kb3dBbG8zdUhCY1BWSzY2SUM1ZmlraWFx?=
 =?utf-8?B?M29rdGlwQmJCZUlNNnZIYjlmOVRhTzNjdjZWUGI5MytHWXAvS1FuUXA0djZp?=
 =?utf-8?B?ZEtVUnIxTVNRNzlyamNPbWlva25pWjlac0Y2Q0xlVTdza1hhSjFpY1k0L01r?=
 =?utf-8?B?QjNsQjNjQkZWbjRPTGV2dG1aSWZ3YUV0a296dTFKREJFNElRbk5iMDZtSHVN?=
 =?utf-8?B?cFd3Y1NOdEtycnYwR2pycVNtQ0tRVndzTm5nMGJOVzRlNXpLN2JTSUFiS080?=
 =?utf-8?B?eE5iRzBkUjhSbGlMMDZrdk4yaUFVdzUxbkdSOVcxT2R1QkJNRk52eFFCNjBR?=
 =?utf-8?B?Yyt3YnBvdDY4QVJDT3pWT2p3RlFkU2FhNDZlc0ROd1RSWE5iVTc5QWNwdXlt?=
 =?utf-8?B?bklLYXByWkxuQ0lzZGNQdFdnY3p1NUpKdWtiZnQ5TWlzYzJHTDhueTIrcy9q?=
 =?utf-8?B?RTJTd2hBWG9uV0dvSmdzY0ozaDJwQVdXVUptaVZtdjdzdkNvVDdwd2VWNmxu?=
 =?utf-8?B?NFRZTE1EOWdMMWp3ZHNFK09GWlJBTmJwSEtUVUZTTzl6NXNPWnkxZ3M5VDBW?=
 =?utf-8?B?c3dRQ01LaGlmU1ZhOTR5bzZxcnBqelFvK0M5Y3lLT2cxaVByZ0Z5ak9jTmVp?=
 =?utf-8?B?U3Q4bkI5SnRGRlZZa2ZWamdBQ09oMkFIbkdoVkdYcGI3QmpZYSszRENTczhF?=
 =?utf-8?B?YjI0a2pBWnc3MFNSMWkzdEp0NVIydlQxRWFyQmpmQm42NTJaNUlUMWlLQVh0?=
 =?utf-8?B?aDVzTGttaFVOOHVSWlZQVVp1QWJkNmlrQWNwa2Nnd040emg2d1NJSk9XeGs5?=
 =?utf-8?B?d0Fva3ZGOGtUY2xCbklVcWpxcFNNSmtJWDZlYVpnTXc4V2k1Qk1kUFh2dGN0?=
 =?utf-8?B?K3hlQ2cvSGNMUUREYWtyYytXekNXQ0tvUmNEREJLb2ZnK2pFSXArNnhGVW5I?=
 =?utf-8?B?Nkk4aGg0NUxjWEJQQVZpL1BUUjg4MVp5dmxvWTZOQ3AvclpLeldUZWZGRDhq?=
 =?utf-8?B?dzlzWUJCa3hLYUFCQTBib3JOcXd5blpzZmtERjZ1by9zS0hYVjRRMHhQMTdo?=
 =?utf-8?Q?7DhYTB/VpGsB1JTpKLERrwGuHBK5ikOklQ2lhQ84DN5l1?=
X-MS-Exchange-AntiSpam-MessageData-1: feOCNd+ZktUu0w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83fdb810-b17f-4b7e-29d0-08de4fcf7c6b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 22:36:09.8443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqAJL+gcNd/RzfHzDEULQwCMRIPMJeMdoRdJPfvegExQ7+5qDYwM7bilevVMIz0yAVgZPvc5R4+8JBcJ9NBadw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7998
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

On 1/10/26 08:14, Zi Yan wrote:
> On 9 Jan 2026, at 17:11, Balbir Singh wrote:
> 
>> On 1/10/26 07:43, Zi Yan wrote:
>>> On 9 Jan 2026, at 16:34, Balbir Singh wrote:
>>>
>>>> On 1/10/26 06:15, Zi Yan wrote:
>>>>> On 9 Jan 2026, at 15:03, Matthew Brost wrote:
>>>>>
>>>>>> On Fri, Jan 09, 2026 at 02:23:49PM -0500, Zi Yan wrote:
>>>>>>> On 9 Jan 2026, at 14:08, Matthew Brost wrote:
>>>>>>>
>>>>>>>> On Fri, Jan 09, 2026 at 01:53:33PM -0500, Zi Yan wrote:
>>>>>>>>> On 9 Jan 2026, at 13:26, Matthew Brost wrote:
>>>>>>>>>
>>>>>>>>>> On Fri, Jan 09, 2026 at 12:28:22PM -0500, Zi Yan wrote:
>>>>>>>>>>> On 9 Jan 2026, at 6:09, Mika Penttilä wrote:
>>>>>>>>>>>
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> On 1/9/26 10:54, Francois Dugast wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Split device-private and coherent folios into individual pages before
>>>>>>>>>>>>> freeing so that any order folio can be formed upon the next use of the
>>>>>>>>>>>>> pages.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>>>>>>>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>>>>>>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>>>>>>>>>> Cc: David Hildenbrand <david@kernel.org>
>>>>>>>>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>>>>>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>>>>>>>>> Cc: linux-mm@kvack.org
>>>>>>>>>>>>> Cc: linux-cxl@vger.kernel.org
>>>>>>>>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>  mm/memremap.c | 2 ++
>>>>>>>>>>>>>  1 file changed, 2 insertions(+)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>>>>>>>>>> index 63c6ab4fdf08..7289cdd6862f 100644
>>>>>>>>>>>>> --- a/mm/memremap.c
>>>>>>>>>>>>> +++ b/mm/memremap.c
>>>>>>>>>>>>> @@ -453,6 +453,8 @@ void free_zone_device_folio(struct folio *folio)
>>>>>>>>>>>>>  	case MEMORY_DEVICE_COHERENT:
>>>>>>>>>>>>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
>>>>>>>>>>>>>  			break;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +		folio_split_unref(folio);
>>>>>>>>>>>>>  		pgmap->ops->folio_free(folio);
>>>>>>>>>>>>>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>>>>>>>>>>>  		break;
>>>>>>>>>>>>
>>>>>>>>>>>> This breaks folio_free implementations like nouveau_dmem_folio_free
>>>>>>>>>>>> which checks the folio order and act upon that.
>>>>>>>>>>>> Maybe add an order parameter to folio_free or let the driver handle the split?
>>>>>>>>>>
>>>>>>>>>> 'let the driver handle the split?' - I had consisder this as an option.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Passing an order parameter might be better to avoid exposing core MM internals
>>>>>>>>>>> by asking drivers to undo compound pages.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> It looks like Nouveau tracks free folios and free pages—something Xe’s
>>>>>>>>>> device memory allocator (DRM Buddy) cannot do. I guess this answers my
>>>>>>>>>> earlier question of how Nouveau avoids hitting the same bug as Xe / GPU
>>>>>>>>>> SVM with respect to reusing folios. It appears Nouveau prefers not to
>>>>>>>>>> split the folio, so I’m leaning toward moving this call into the
>>>>>>>>>> driver’s folio_free function.
>>>>>>>>>
>>>>>>>>> No, that creates asymmetric page handling and is error prone.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I agree it is asymmetric and symmetric is likely better.
>>>>>>>>
>>>>>>>>> In addition, looking at nouveau’s implementation in
>>>>>>>>> nouveau_dmem_page_alloc_locked(), it gets a folio from drm->dmem->free_folios,
>>>>>>>>> which is never split, and passes it to zone_device_folio_init(). This
>>>>>>>>> is wrong, since if the folio is large, it will go through prep_compound_page()
>>>>>>>>> again. The bug has not manifested because there is only order-9 large folios.
>>>>>>>>> Once mTHP support is added, how is nouveau going to allocate a order-4 folio
>>>>>>>>> from a free order-9 folio? Maintain a per-order free folio list and
>>>>>>>>> reimplement a buddy allocator? Nevertheless, nouveau’s implementation
>>>>>>>>
>>>>>>>> The way Nouveau handles memory allocations here looks wrong to me—it
>>>>>>>> should probably use DRM Buddy and convert a block buddy to pages rather
>>>>>>>> than tracking a free folio list and free page list. But this is not my
>>>>>>>> driver.
>>>>>>>>
>>>>>>>>> is wrong by calling prep_compound_page() on a folio (already compound page).
>>>>>>>>>
>>>>>>>>
>>>>>>>> I don’t disagree that this implementation is questionable.
>>>>>>>>
>>>>>>>> So what’s the suggestion here—add folio order to folio_free just to
>>>>>>>> accommodate Nouveau’s rather odd memory allocation algorithm? That
>>>>>>>> doesn’t seem right to me either.
>>>>>>>
>>>>>>> Splitting the folio in free_zone_device_folio() and passing folio order
>>>>>>> to folio_free() make sense to me, since after the split, the folio passed
>>>>>>
>>>>>> If this is concensous / direction - I can do this but a tree wide
>>>>>> change.
>>>>>>
>>>>>> I do have another question for everyone here - do we think this spliting
>>>>>> implementation should be considered a Fixes so this can go into 6.19?
>>>>>
>>>>> IMHO, this should be a fix, since it is wrong to call prep_compound_page()
>>>>> on a large folio. IIUC this seems to only affect nouveau now, I will let
>>>>> them to decide.
>>>>>
>>>>
>>>> Agreed, free_zone_device_folio() needs to split the folio on put.
>>>>
>>>>
>>>>>>
>>>>>>> to folio_free() contains no order information, but just the used-to-be
>>>>>>> head page and the remaining 511 pages are free. How does Intel Xe driver
>>>>>>> handle it without knowing folio order?
>>>>>>>
>>>>>>
>>>>>> It’s a bit convoluted, but folio/page->zone_device_data points to a
>>>>>> reference-counted object in GPU SVM. When the object’s reference count
>>>>>> drops to zero, we callback into the driver layer to release the memory.
>>>>>> In Xe, this is a TTM BO that resolves to a DRM Buddy allocation, which
>>>>>> is then released. If it’s not clear, our original allocation size
>>>>>> determines the granularity at which we free the backing store.
>>>>>>
>>>>>>> Do we really need the order info in ->folio_free() if the folio is split
>>>>>>> in free_zone_device_folio()? free_zone_device_folio() should just call
>>>>>>> ->folio_free() 2^order times to free individual page.
>>>>>>>
>>>>>>
>>>>>> No. If it’s a higher-order folio—let’s say a 2MB folio—we have one
>>>>>> reference to our GPU SVM object, so we can free the backing in a single
>>>>>> ->folio_free call.
>>>>>>
>>>>>> Now, if that folio gets split at some point into 4KB pages, then we’d
>>>>>> have 512 references to this object set up in the ->folio_split calls.
>>>>>> We’d then expect 512 ->folio_free() calls. Same case here: if, for
>>>>>> whatever reason, we can’t create a 2MB device page during a 2MB
>>>>>> migration and need to create 512 4KB pages so we'd have 512 references
>>>>>> to our GPU SVM object.
>>>>>
>>>>
>>>> I still don't follow why the folio_order does not capture the order of the folio.
>>>> If the folio is split, we should now have 512 split folios for THP
>>>
>>> folio_order() should return 0 after the folio is split.
>>>
>>> In terms of the number of after-split folios, it is 512 for current code base
>>> since THP is only 2MB in zone devices, but not future proof if mTHP support
>>> is added. It also causes confusion in core MM, where folio can have
>>> all kinds of orders.
>>>
>>>
>>
>> I see that folio_split_unref() to see that there is no driver
>> callback during the split. Patch 3 controls the order of
>>
>> +		folio_split_unref(folio);
>>  		pgmap->ops->folio_free(folio);
>>
>> @Matthew, is there a reason to do the split prior to free? pgmap->ops->folio_free(folio)
>> shouldn't impact the folio itself, the backing memory can be freed and then the
>> folio split?
> 
> Quote Matthew from [1]:
> 
> ... this step must be done before calling folio_free and include a barrier,
> as the page can be immediately reallocated.
> 
> [1] https://lore.kernel.org/all/aV8TuK5255NXd2PS@lstrano-desk.jf.intel.com/
> 

Thanks, I am not a TTM/BO expert

So that leaves us with

1. Pass the order to folio_free()
2. Consider calling folio_free() callback for each split folio during folio_split_unref(),
   but that means the driver needs to consolidate all the relevant information

#1 works, but the information there is stale, in the sense that we are passing in the
old order information, the order is useful for the driver to know the size of it's
backing allocation
#2 should work too, but it means PMD_ORDER frees as opposed to 1

Balbir
