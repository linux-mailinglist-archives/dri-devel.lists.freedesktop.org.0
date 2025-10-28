Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1337BC13C6C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 10:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4853710E02F;
	Tue, 28 Oct 2025 09:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U6liwPNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7BB10E07D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 09:24:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLOxsYbnoQ3jJ0s/iTlBMPW639LTnFkz2Y0GjUxD//flC3yojs9AoVd0NObsVwkgjIy/rBvJxmIfGset1sL9APH5Zq3tkzRW1NcZYZm3rhBh+qUPmY/q7S4GW6aOmKFeRH20e6F6FfEnQqbIeNZG63Ftr/aUFU+iNIewJ752bM98cI/Fq0H67rKZzVgnceJ+aNSw9OIrt+miAZIGH4awmOkSrIwLV4XYrJpyTnTpGLrOSVOIh4/wb3Vn7+Ofhna+nMESZhvoUoT/MHgvOt+bS7O43j/rTRgcR8IiTjJXCR9UAfG+t5Ntuv65wUr0a07KEN3ZyS2tQV8FSlbgawkrZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZLw6x4j6lQCb7UfuzYnJ9ANN5vNykeYj7TuVN4S01k=;
 b=JbYupypextD0hE+k5DU9Z3Rk6wt3qo2cuMcmNK14WnZNQImlZpg0/ZPphpSvUUt5iir2eLhfGrB25buXg5wM21+JUiy18ZkNBxXtG9a8U9qMXs2w9q79NgKzjCIAFVu/Zt8fDRcE4giH2Y8Ctdmyg6E3jxEiXSsRkVCemlacQwc22inpY/KIFFs7Ay0/BsJ9j0LlacbeknlcWDmmMOyZhTHeCDQTnThgY7saD1JUXZKRh7ihxx9a96sNboD3NvVpkTmEOX5UvR+OL5j6ouWC/b0ZESjlT9lApMjCMVlpRqyVV0sOToSxSsyDcaquWurnbpAURAUdhvm6xX0EgodNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZLw6x4j6lQCb7UfuzYnJ9ANN5vNykeYj7TuVN4S01k=;
 b=U6liwPNtsFj1F0gvMaw2U74/BiWbRLVghCQSm0AMfKzwBbV30Q28GKLQyX8jW2jZyX51AcMK09u5Ln34Pnt6q6MTvO+yb25fXihTuFOyyWNlXu58++2rOao3lxSyICUuvYaYv5Tdgw4c5XgVMbCIz/CYlcoVPbg7Rd84CLtLrE2ysZh2T/7BzWhTEWI4/VcX8LA4OMAIRwvwcP9PY05xCUIu84h43N6h7a9/N5+5fEn3FNqV0VqtoAnF8gvtpUQDXcZuWIC7JCUcl7nkC1NeY5CGpla4eA3aw81kIrV7aBRuIB44zo/Ki4nC9qWU9Ad6HlwiEPkvrfe4FInV4/eVyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by LV3PR12MB9186.namprd12.prod.outlook.com (2603:10b6:408:197::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 09:24:17 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 09:24:17 +0000
Message-ID: <0e38a555-b7dc-4e5c-b0d9-ab3b447dd460@nvidia.com>
Date: Tue, 28 Oct 2025 20:24:07 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: KVM/s390x regression
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>
Cc: Liam.Howlett@oracle.com, airlied@gmail.com, akpm@linux-foundation.org,
 apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com,
 byungchul@sk.com, dakr@kernel.org, dev.jain@arm.com,
 dri-devel@lists.freedesktop.org, francois.dugast@intel.com,
 gourry@gourry.net, joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 matthew.brost@intel.com, mpenttil@redhat.com, npache@redhat.com,
 osalvador@suse.de, rakie.kim@sk.com, rcampbell@nvidia.com,
 ryan.roberts@arm.com, simona@ffwll.ch, ying.huang@linux.alibaba.com,
 ziy@nvidia.com, kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-next@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>
References: <20251001065707.920170-4-balbirs@nvidia.com>
 <20251017144924.10034-1-borntraeger@linux.ibm.com>
 <9beff9d6-47c7-4a65-b320-43efd1e12687@redhat.com>
 <c67386be-5278-411d-97e7-43fc34bf7c98@linux.ibm.com>
 <8c778cd0-5608-4852-9840-4d98828d7b33@redhat.com>
 <74272098-cfb7-424b-a55e-55e94f04524e@linux.ibm.com>
 <84349344-b127-41f6-99f1-10f907c2bd07@redhat.com>
 <c9f28d0c-6b06-47a2-884d-7533f7b49c45@nvidia.com>
 <f5debf87-0477-4d6a-8280-0cd95cd09412@linux.ibm.com>
 <748cdc18-e32d-41bd-90d1-a102b1c51e06@redhat.com>
 <20251027174726.5d8fcce7@p-imbrenda>
 <d4a09cc8-84b2-42a8-bd03-7fa3adee4a99@linux.ibm.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <d4a09cc8-84b2-42a8-bd03-7fa3adee4a99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|LV3PR12MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: dad75d08-fabc-403d-3b07-08de1603c46e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnAxbXdFRUxYc0xuTE5nbDdEdG56bUNDWU9DT0xDRHJycmVpeVdabWhTUXVP?=
 =?utf-8?B?UEZUWlZGUjJBajY1M2V6aEhGcDZVZGRhUDAyTDk4Wk9YaXpuMW4xQXZldlFW?=
 =?utf-8?B?eUV2RGR6OXZTczBYMnBFZGx0UHYwSWNrWUM1U0tLdXE2ZlpSOVhmOS9FOER5?=
 =?utf-8?B?ekhvRjJ6R29SNkpIYWtmYWo0Unk5ckFZV25CVjJvYUhNc3FOcHNhdzZ5Mlcy?=
 =?utf-8?B?Lzh4Zmk0NnR6ejBjNGYyWHo4cXN6aktSaGpyZGtVVDlYL0ZBR2UydHFtQjE2?=
 =?utf-8?B?bnpaZTQvSnRGeXBYdjJLSjhLWGIwYXhuYlk3SHVNaW1iOTNYRFVHZHZiZW1Q?=
 =?utf-8?B?bGRQQitZeW15Z2QrcHhIRWZJYnc5eVZRaDl2ZXd4bFdlVm9VRHRpd2FSL3p1?=
 =?utf-8?B?V2JLb3lrd21LSm5FREVBK2ZGNW9oc2xYRlNjZjlrNlRPMnFTaythdWhDR3pV?=
 =?utf-8?B?WTlJRG1iMEZZOGdjaER0UGdjYmVFbDJRNVhmTkIwZE9jOVZXcU5RYUluMitW?=
 =?utf-8?B?WUxhcWd1SXVGbDhyQUtGaWdzU1RsdVlMTGsvWE1sWkdmM3lEZFhRUmxkYk94?=
 =?utf-8?B?dGVPQXFjYWVvUW5HNmlhRWtJMDdtNnlWOFVKNmJrUUcvREJaRk9JejlETnNQ?=
 =?utf-8?B?R0VGVU5jTnkxMm1iMWE1bkJOYTFGL0pFcDhJNjdxclp0RXFiTFU4WEVJcDdU?=
 =?utf-8?B?YVgxMUQ4ZEk2Z0VjbFQrRmVEQ1VkUHZrNHl5bHN2MzNyMHFGV2tuQ0JqVzRR?=
 =?utf-8?B?TmFsMWpkcDJDdjkwTUNnOFJPNE5JbDBINHBlZXlYb09uTGhoZTNtYjlSMExB?=
 =?utf-8?B?YTJVTmNLK3hyQkhvN1ZLVjhkb2oyc0s3YUZLSG9LeWdna0ExU2d1cG9BT0JK?=
 =?utf-8?B?V1RxTXhySnpxcm1sTlE5VHhFYldzUDhwck1zbm92N3NFY1lVd05nZTZGbVlD?=
 =?utf-8?B?cWNDbmNSYTBlZ1NaR1hCeE1mL1ovODc1SEtuaFpCSjgvYlVKaU5ockpHcDhV?=
 =?utf-8?B?ZTh5S2RjdkVBM0ZmOW16VTV4QnFiVUp0bEpUMGc1Mkt3cnZSa0UzTGpOT01X?=
 =?utf-8?B?cXBaZHlsdW1GcS92TFlMa1JsczBmdVpPRlZEbC9wSnJUK01PTjZXMnFYK01K?=
 =?utf-8?B?NGRDSTRiRng0T3dRdEJMeTZxZFYrUlFTSlpVdHF5SlZvTU13SE8vTXYvKzR0?=
 =?utf-8?B?bVNFb3k0MjFNSDUyOEphSU82QXZyOFBFTkc2R3g0WWFLQVcyVlllMVUvREpT?=
 =?utf-8?B?U016ZkdCMm1sVTNINTBqK0ZRUXo4UENETEpIWjBEcXhUeXRqcDdSUEZ5NUlQ?=
 =?utf-8?B?SjNFMlpBaUc4N2JNYTlzQ251ZU5GRkdaOVhvOTdQRWdSNDdMRHlZeTRGVjVy?=
 =?utf-8?B?TTNBbUU1R3dRRG81M3dCQ0x3K1NMd0hBY1pLSHZvQ3hHN2JqQ1hpN0RRWlFQ?=
 =?utf-8?B?NmU2TWJJa0ZMZENqMmRXRTlUT0tkRkdEYUpMWjN5ZlBZQ2xYWTdHejA5YndJ?=
 =?utf-8?B?Umd2SEF5MFJkYnZaMVFHUG1EK3pyRzBydUM5b0FQYjJCaTA3U29hMS8xOTB5?=
 =?utf-8?B?L0t0RjYxOE53RStqaGRET1phaWk3T2ZUS1RZYUlzSkpqL2FFZkhBbi9xYlhr?=
 =?utf-8?B?YTgzRkY4L1ZIcWlxMm1vc1E0NGJrZ0Q1Zis2VmxHMXZ6czN2SE10VmhPTVpj?=
 =?utf-8?B?N3AxU2FaVmlJVDkzOVg0TGs2ZW9lVmlBdTNITDBEOTJLQ0ZudmFMOUpCemcy?=
 =?utf-8?B?dEw3RW02am1DM3BBWjd5Q2dLM09acmhZeHh6UmVLK0x5cGozL0pRb3lLMWQw?=
 =?utf-8?B?SzQzYW02S0hQN2FqenpWdGkxNzY3VkpUNW9EdDIyNFYreGd3SmFQRktJS0Jv?=
 =?utf-8?B?d0JrL011dEFFTnpONzZNaitTNFc1WHlBU0plYkZjMnJucC9CN1NKN1BtNGtq?=
 =?utf-8?Q?GsMXL0fwucQdBZVGBZZV86qXMht7kKYj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0pVVjl1LzBEOXlMU2l2VmRiemxNdW40WU9UU0FJWkhvSEovTk5vUlh5WUpM?=
 =?utf-8?B?YlZEelZ1UzY4NjU1a2RoL0NSRGREM3hCODloSloraEJGZDhLQTZRNkZkUmRG?=
 =?utf-8?B?dm52YlBUVzNTakYvQVUvMUFwR01ZQmUyWDB3VXJXcW5RZTAxOHdCaVhmYzJZ?=
 =?utf-8?B?WjAzWGxTTUV3VUwrbTV6MlQ2enNkMEQwVTJ6TVhCR2dWY3l6VlpMZ0ZGRXlh?=
 =?utf-8?B?MS9jbG05eGlJS2g1cFhhaHdsNmdhUUw2MnEvSGlLTW1SUXRqTEIrRkdzeWR5?=
 =?utf-8?B?OHpmR3Vwd21iZ0pLMkZpQnU3WmxwK2FwT1l2Q2lqVEpZaE1QdENqVWx6SUo2?=
 =?utf-8?B?UHNQWCs2WGZwK2wxbDhJcjdtN0hVV0FTOC9HTmw3SlJmT0w2Nlc2L0ZKaGVD?=
 =?utf-8?B?R1FGYm1Jc2puRTVWbEZrU3h0aU53L3NDR3Z2SEM0SVlKekppeUN0Rko0dWpi?=
 =?utf-8?B?eHQreEcyR2ovemdHQ0djT3krekF6REgxRjAvcW9XY1hMN1VnODFnNkszdFRj?=
 =?utf-8?B?QmJDNVNiUHhiMWhScmg4WUNESDhWWjAzc25TdlE1RkdqQlFoSXBTQm55aVhB?=
 =?utf-8?B?bVA3VkZKY29uNkRuVkFuSkYxYzBIQ040WmtWYTBLUmNSTmo0cjZlQVBMV1Ry?=
 =?utf-8?B?amI0dkdZUHRCeGVoc2xBdDRwRVhkbUVGUlJrWFhYOE5ud0dHanA2Tm9rQ1FX?=
 =?utf-8?B?LzlCR3NPZXM5QmJYYVVrZ05XQVlYWTAyWnR0TDB4QW1HNjAzekIzNFI5bTEy?=
 =?utf-8?B?d0pDNTI2c1ZDdHNBaDF2ald2eWFuTTZ2WDBrd2taTXBwM0ZHdzZJUktDeDcz?=
 =?utf-8?B?REdudWt3RWxEc0tDNzZjcHFDY29RWUJ6dCt3Qm0rUHRhRTkxcERwMVJFdkNq?=
 =?utf-8?B?Mm9mU2pLT3Z4MkNlUVNENEtiOERLZkxPTjJPbHZyUkhMUEluQTZKT2cvdWdH?=
 =?utf-8?B?VEdZeFM2d0xDenpJSHdCYUo0Q2tmR2pIQUs4V3M5OGM3QkdHbVNOMG5FcWly?=
 =?utf-8?B?Z0lhb3JWaERycXpSZ2YvN1JMeEpYaE5IMXo5SkEwaGJlS3ZmWW4vTTZJWGEz?=
 =?utf-8?B?ZWI3U0cwbjNOTmh1UEpIY1FWUXJYaUdySEVTRnNwdUdZL20vTWpuajFSMEV6?=
 =?utf-8?B?UHFOK0ZoSnNnam9PeXhrbjFKbEIrTlpGamdSdjZYMytVa3pVSy9TL0VVaDdj?=
 =?utf-8?B?Z2ZuQUdFZ3lHd2QyVmZ3ZitJL3A3R29xUHFqaHhnOXF2OG41MjBHMWFxT09N?=
 =?utf-8?B?R2k4UXRhd1lCa1N0V3dUTC9hVHUxUHhjRjI2MWdJYXB4Uk1rc01GY2FIZVho?=
 =?utf-8?B?aG1LcS9ETWpPQmZvUGZLTnhHeGtjdS9CTzJ2cndoakd6UWp4MkFDNXVONWN6?=
 =?utf-8?B?N1NjU3ViTGEzOEVsK2lmeEM3WHE3eXVtTXFKdFRyR0k4QlJiMVRENHJscWFW?=
 =?utf-8?B?NmZEdVlIUytsOVVxWktZRDJRcEtjbzNheWRsbVd6MEEzRUR6aTNMSzN1aTQv?=
 =?utf-8?B?Z1FsT2psUHJaaEVyUVBKVll0ZXpaR2N3NWU4Y0Q0WlltQmJTYUk1M3JnRXNj?=
 =?utf-8?B?Ty8zZkE5S29xVnQ3SXZka3dXaTg3bTZEZXkvU1hWSFM3cnNRaEpBbitCU1Nr?=
 =?utf-8?B?dWtIb0prcHBCaTlza0RCb0RocmVGN3lLYlMxeldZNGxMZGRWcy9WMjFGWmhV?=
 =?utf-8?B?QUF1bzIxRm9EUjZMbDFkUDRYaEUvcVlvYmJWVzJwUTBGZEo0dVlyeituTFNM?=
 =?utf-8?B?cGlvUURmUkpYWXZ3VzN4R3dxSTNCZk5nTlkvSEs0YlV5akpKaFB3OWtmZEdE?=
 =?utf-8?B?bUZPb2VOTXV2ZkpWU3hPZmZtS0N4UWl3V2Y5MGlEaEdYbkFBS2tTWGt4UldW?=
 =?utf-8?B?YS95NmhRTVVxZDNLcVJiOHZaSndhVVJNY3ROeU54YkxqR05XUi9wVk9BdEJJ?=
 =?utf-8?B?NGZKeERYcDY0S1ZCZ05TcFQxaGw3LzBBZzJtZXB3SjQwZDBKSS9EMHBTQnVL?=
 =?utf-8?B?cXRiTFJ3T3hoaHNqUjBMcVNreXBNOEp4Um1yaUJVQnphTmd4MFdKVEpPSjFE?=
 =?utf-8?B?c3lRWGRDUjJPKzhwMUh1bGFhb2QrVC9vajcxOUZjWmNlK3hVUU8yTDh1K1I0?=
 =?utf-8?B?YUhIOE93TktRL0xrc3JpZmluc0xCSDg1OHpieWlPcUtJditURWhkTkg1OG92?=
 =?utf-8?Q?wxo0ftIUP0PXtSczCvrqwBHRpikfEKgiSI/yNjyxAdTv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dad75d08-fabc-403d-3b07-08de1603c46e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:24:17.1674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtGJchnuFQRv956PDHVZAP3JFUEYJVRfmpQxK75dz+jSlsE1K64W+7WP0U8G/ubf6zHvfWRlhtRL12AbhywVQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9186
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

On 10/28/25 04:06, Christian Borntraeger wrote:
> Am 27.10.25 um 17:47 schrieb Claudio Imbrenda:
>> On Mon, 20 Oct 2025 10:41:28 +0200
>> David Hildenbrand <david@redhat.com> wrote:
>>
>>> On 20.10.25 09:00, Christian Borntraeger wrote:
>>>> Am 17.10.25 um 23:56 schrieb Balbir Singh:
>>>>   
>>>>> In the meanwhile, does this fix/workaround work?
>>>>>
>>>>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>>>>> index 0c847cdf4fd3..31c1754d5bd4 100644
>>>>> --- a/mm/pgtable-generic.c
>>>>> +++ b/mm/pgtable-generic.c
>>>>> @@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>>>>>             if (pmdvalp)
>>>>>             *pmdvalp = pmdval;
>>>>> -    if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
>>>>> +    if (unlikely(pmd_none(pmdval) || is_pmd_non_present_folio_entry(pmdval)))
>>>>>             goto nomap;
>>>>>         if (unlikely(pmd_trans_huge(pmdval)))
>>>>>             goto nomap;
>>>>>   
>>>>
>>>> Yes, this seems to work.
>>>
>>> Right, but that's not what we will want here. We'll have to adjust s390x
>>> gmap code (which is getting redesigned either way) to only take the page
>>> lock.
>>>
>>> In the end, we'll want here later a single
>>>
>>> if (!pmd_present(pmdval))
>>>     goto nomap;
>>>
>>
>> this seems to do the trick:
>>
>> diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
>> index 8ff6bba107e8..22c448b32340 100644
>> --- a/arch/s390/mm/gmap.c
>> +++ b/arch/s390/mm/gmap.c
>> @@ -599,8 +599,9 @@ int __gmap_link(struct gmap *gmap, unsigned long
>> gaddr, unsigned long vmaddr) | _SEGMENT_ENTRY_GMAP_UC
>>                                          | _SEGMENT_ENTRY;
>>                          } else
>> -                               *table = pmd_val(*pmd) &
>> -                                       _SEGMENT_ENTRY_HARDWARE_BITS;
>> +                               *table = (pmd_val(*pmd) &
>> +                                       _SEGMENT_ENTRY_HARDWARE_BITS)
>> +                                       | _SEGMENT_ENTRY;
>>                  }
>>          } else if (*table & _SEGMENT_ENTRY_PROTECT &&
>>                     !(pmd_val(*pmd) & _SEGMENT_ENTRY_PROTECT)) {
>>
>>
> 
> Tested-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> 
> can you send a proper patch? I guess we should add it to Andrews mm true to keep it close to the patch that uncovered the issue.
> s390 maintainers cced.


Thanks for finding the fix. Ideally, we want this fix just before my series if possible!

Balbir
