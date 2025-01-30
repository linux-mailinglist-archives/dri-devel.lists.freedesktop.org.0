Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2D3A228BE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 06:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C5710E8E8;
	Thu, 30 Jan 2025 05:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fIkKYz8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988D010E26C;
 Thu, 30 Jan 2025 05:57:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIwRcZoZxRXSGMO2FVMB+JrfdVgg20Hg//93zoFGhSHwVd+UsM5aRPA8dVISO996zfgpT7GDYg/cZV2R1pPLjHaPgQDbBvixB4b77IjoBuI1dWDnr4/P+QoMiDTNellL9sQOEXeIhGmvazsm0v5mnarSIrAbU30f1hjAhJfDq93Lsl8sZW0COM1kzFUd1DAdFqv1D1FS/+cbRC61UmXtWOmDS8pLSW14uIX9m6FGqNUs1C5uwcLHzceZzmyACf5hXSImQ10jPWwYmMf+Vxx4lEhp/FBpghSbHRSH5vYMIuWU5dO2UGal776CCrrLvt9eeJOffm7HAgeltScz6phZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5IvnWBKUY28sduoPE9X1UdM49yGMTHK2Yl2vJWmXgI=;
 b=aK7nftN2oDvR537vCCVgKyf5oFcqU3wobfhG9FY3+sMNOa743K81Fl64DzoEyxM1myuFcbUn3sMta+KXAUJuFOtPMVCsIOzcSYSRbhWg8Wk/Ks1tnDefHmj/l869XHS3gQNLZmdDhU9TmCiQOx6QLfSM7nAoCApScpbhWQFxRMd+3xdmHlgJQgLH/zCYvjzAduQsxAgb63h1xqrg4Y1pTuPibVqjGjxyAgPBE+rah+N/fSLtcQMEB9yj6U0kcOhNDXy+YvrYfBxSOcCw57sk85RR/AKgnfe4JlVkRI0R4Jbx7CVI5bjmuUdWd53tyaP9Npy4e5cSXO779hdWdGX6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5IvnWBKUY28sduoPE9X1UdM49yGMTHK2Yl2vJWmXgI=;
 b=fIkKYz8j1Kd8fB0lGFJJNBywGuklNEeQKZNf0+vYahCdkEWsB6XkSi9Z1aPoCSvBQs9ZJQeWCAdRelwIn9slgxwr2Jl1xyRqQgdFJ5++iYEcagszh3vqL7SOVBk/Szsm6xpDzMfhVYptARfJxEdH9zTo/PHMsf3E+8p06ieJYhLS41VvVOCA5mKKMER5f89KnqDWKfIUx+UahWasVOTvsUqT8jmM0ELUJG7YlnDWnREwLH3ZqfJoDSpVagLJSOJA/m3A2elbavQZaEfCt4JlAxuPF1k2/7OPrs9VhCd/lF/d4zXawoJhj5Cm+IH36BHZonbOCMf/sj36pWcBRPoMig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 05:57:43 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 05:57:43 +0000
Date: Thu, 30 Jan 2025 16:57:39 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 03/12] mm/rmap: convert make_device_exclusive_range()
 to make_device_exclusive()
Message-ID: <b3stuhf2s6236zawaa6zt6x3fg6oamrtj3pwajlyoxlaxdmdtf@arqxcoemsjfg>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-4-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129115411.2077152-4-david@redhat.com>
X-ClientProxiedBy: SY5P282CA0166.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:24a::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e83c001-4951-4561-d4bd-08dd40f3033b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzdSR1V6Tk5vVVVkT0hMalZXRUR1Sm9yQjN4M2NCTDljQ081RzNITlhpTmtu?=
 =?utf-8?B?Ky9KSlpPKzdWeGVZd05PMjlsSkhPT21OamlwQlhnT1JjUWlDSS9hbnoxUk5C?=
 =?utf-8?B?Z0hsNkpkNWt1U01hcFJGOGpGVzJySjhwRnhRMjhBWEYxSFF2cHNPOHAxSWdw?=
 =?utf-8?B?RWpKL3JKMVlKYmJvekRZR2hSUE0vN3hRblpPUktHT2liY1JhS0xqOFdCOHZs?=
 =?utf-8?B?V2UxWmdKbS90T3hFdEMxWVEzNHFxRVBHQWh1d0Vlb0IwTXlSMjIxNGtIZ0c1?=
 =?utf-8?B?Mm53b1A3UU9BYlRCMzRDWnY0NlRIU1dvcXhMVnhCQjd2N1g2YTJHRURYejAz?=
 =?utf-8?B?RlpRSU14aTRoRTFuZEZYVVhEWXcycVoyOXllNExCWlJpQUNqdkVycVBEM2ZR?=
 =?utf-8?B?MzZhVlJPMGhvRWU5bTQ2aVB4SjhNWGVKN1BRZ2hTMW56V2phS1RDVzBxRndt?=
 =?utf-8?B?OEg3R1d6dnBaSnRkOHRhNzg2SnFxbktELzd6eWJKM0VmRUhyTjFjVnRFd3c5?=
 =?utf-8?B?OFJxM1VKMzlHQlBKY1AxSWNsNVRTWjZjclh3NWY5NmVOZVZidVplenVRQkFy?=
 =?utf-8?B?b0RKSGJZZUc4ODk5eWVXazlNZDdkZnNsUllob3lGQnU5dUtMWWxPZTBQSTZP?=
 =?utf-8?B?UDIxcElNN0RqWkVXdjZydHZGTDVGTmZJR3Bra1M3STRUMERqR3VRb1NtZzVS?=
 =?utf-8?B?UGg5Z0dZTXZCVXRrM3JkazRvWTNkZTFIWk96eDZWOU8wc09aVDlydjVaS01Z?=
 =?utf-8?B?UkR6dFN5WCtMNXhCOVFBeXQ0RHJqVDQ2Y3c3UkF0OXFFUWFqVmdZckkrdjV4?=
 =?utf-8?B?VHo2a0I1bDFCeGI5K2s1R3pxWklBa0FmOW4zRElCZ1RjQUVma3c5eFlJaFkz?=
 =?utf-8?B?SjRacWY1ZkFuT3M5QU1xSW0wa01WMlJINE0wY2h1cnM2VFR6bzhRandLeVV5?=
 =?utf-8?B?N3lpUytsM2VlOFBHL01qVmJOWE1jdTF4S29KZnl6RUROQmRsdUF5ZitWaGQv?=
 =?utf-8?B?VWR0MFhwQWF5SUhyQ3hhcGJvK282L3A0a0lwSVEvbFBxcUNxWTE4R1BoU0I4?=
 =?utf-8?B?dFROWWpyVUhDNHpmOVZCc2VKTldWQ3hCRVFtZHVLM3BNU3lWUU5yNml6QVlW?=
 =?utf-8?B?cjdYZXdQQjlhZml3STlWUzFtcmRLdGVydHZHcGZhMnlzNlhyYU52QjZjay9k?=
 =?utf-8?B?d0kxSlZjVlVuUk02SXQ4UFhjUkVBSm90eUpFdHN6Y1JCV3UxUlBlSTFtVjNT?=
 =?utf-8?B?Nkk5a2NLWGwvRVFsTlN4VU50L3ppdW1GNHNDa3ovb2dwVmt6SnRMU2gybjBZ?=
 =?utf-8?B?Q1VoSjd1NjJITS9WMHpVMjhDT1pkayswVUJuakJnRDV5M1BrTDdPVmY0RDlF?=
 =?utf-8?B?KzBZdDEvb1ZuQXhGd0d3eFlLNEd5OVFiRDRXR1NNaFByY1BvYk9RVUtBWmFI?=
 =?utf-8?B?S1JFc1hQcFl4Wm5BRUNTZ01RaUlWZGJZZHMzRVI5YmlWSE8xK3MwWTNsd0Rn?=
 =?utf-8?B?WlVRUXFKVDQwRzdMRUh5TFhueUxMOU0rWVFmSXYxdTJ6aE1ic2NjUVp2Y3Nj?=
 =?utf-8?B?MlM2YjdUdzVGNDVNUVovdFhPS1I3Zys0NjFEUW5jdkNTcEZUc1EzR1o2MGl0?=
 =?utf-8?B?ajlDZkRDUVF4dDhneFZtK2I0a01Fb2xUN0JWY3NLeDRGandmbTMyN1E5OXpv?=
 =?utf-8?B?SlVXYWJQNHVqcWswemlBcVBnVVVkbFhBa2E2L2VTMEdBdDFia3E3bGZQN2Ew?=
 =?utf-8?B?NVkrUDZ2bXYxdXJPWXJlSUN2UXdRWitUYmZ0ZjM1N2lZeHFDalJ6QzB4clAx?=
 =?utf-8?B?ZUhVR1pVNkFUdGppQWk0U1BWdy9BekxmQnB3Zko5cEFuNDhTQldoTTU2OE9w?=
 =?utf-8?B?MUZEM0tscW9IMVFvM0RDM0pDNVgzRnpYUTRiRmI1R25wcCs1cStsMjR6YlpT?=
 =?utf-8?Q?beWzcXOEAzu9x0Z5i/deTcXcFl/726Dq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aC9lSUdEUFB4S3FVTjhlM1BKTDA2YlJOdG5Lc3hSelRGbG9Razd4YTdUbVNs?=
 =?utf-8?B?bzhZVWhhMERmZ2Z3Nm5WRGo3NWhGRnJDdlozYml1NUxzVzllWWZTSmR0eDZB?=
 =?utf-8?B?ZXByTW1aTjJ6V2ZZY0Y2bWR5VnZpQUtoWVFuOGtyNHhXdWtEeklpSGthQTB4?=
 =?utf-8?B?R1dWZTZMN0laQ2tEaWVidlRaQUNmUzFVU2dla1dHMVVHczhJNU51NmJKKysy?=
 =?utf-8?B?bFJXS1BIWEhtNFJiZ0JBQTVtRFNmWTJoQ29GckdGRStCQ1hGNTdVb2lkaDJS?=
 =?utf-8?B?MkpFMlpyWjdxaE9WVkQ1bitrcXRLaWpOWGJPVGtPbTJPdVJUSWhVUGY5Y3Yw?=
 =?utf-8?B?V2JPbFNOdE5QaWM0bmh5NTMvOTdtVGEwR3dKVlJhWS9yWllsRFhSNUQzMjhV?=
 =?utf-8?B?OUxiWG02bmRjN0Q0SklXNU5kVHJJWnBPbkJTTUFvazF4eHdGTUVMcWYreU12?=
 =?utf-8?B?UVNCNHN1cVN3ZnhkaUxqb1VnT21TREhKTENQbVMvT0FUdEhZZ0p5ZGhqNy96?=
 =?utf-8?B?ODBaOVBWbkFCWWZEZ1FnR3pHWHp5T1JkaURTQ3dOdFVLclJmMWFlaFNSZWF6?=
 =?utf-8?B?NElBV2NrR2dteDh0WkRZSXFBU0I0enFQd0NmODQ5Z1BseTlNZGhwWUJ4czJU?=
 =?utf-8?B?c2ZlNXBpeFB3R0VDMWdaUFlEZzEyQjVZWXV5Y29jdGpkdG83YWROQ0x5bWJj?=
 =?utf-8?B?ZE5zQkIxUU9maWd2ZWpzRlBGa3YyTnVqbzhyMW1uRnZTTG4ydjFnV1grMldC?=
 =?utf-8?B?ZEtHelZCWFNyMlZjQWlGNlBiZEVzU000ZEg5TEZqMXlka3RkR3pDaTNndlVB?=
 =?utf-8?B?MVBqVjZTM1F2UnlQRmRzbWZzMzlTK3Rkdk1qZ0MrZVNvS2M5MDAvQ3lLNEZK?=
 =?utf-8?B?Sm5mdWtVWU0xSVBqbi92c0hUTUk5dDk2SzhmQnRxVHM2WUplN2ttRmo5Mkl5?=
 =?utf-8?B?c2pjTnRHeEgvbHQyK0MvUVI5NitabFF2WDV3K2dTQ250N1QxWnUzVmVkbDIy?=
 =?utf-8?B?RE1ROU9SbXZOLzBVczlwdHVUcngrYVA4VUs2c29rVFZlUGlTYncrMHZ5a1Iy?=
 =?utf-8?B?TTNmSjM2NWQ3MGlaMzRXcXYzRDQwM1FFMmp2USt1Qk8vTjVQbWVaeFpscFJC?=
 =?utf-8?B?Nk5JanNUcVAzSWlFVjg3dXk5eTlhc1k0SXRKTXBWZ1paR05jVVJmcVNyVHY0?=
 =?utf-8?B?eDNPYWljMGI2SG9aZEFvaDNvVUVsVVZmSmhCS1ZUeXdjVDRFT0hoSTkrbS9v?=
 =?utf-8?B?ZUtPc0d4cVdXWDE3VmpQMEUvMDIzVllxclU5bGJyWU9DRVFldWNmbGlPMlhw?=
 =?utf-8?B?TXRzZDFZUC8xa0gxejRacXBBa1ZqVElpeTJzdGdzQnlzMDdTdTZpZ1lIQU9Z?=
 =?utf-8?B?WFU4N1FtdVF4MmxJTloveGdkV1dKb0tDS2hVSVZsdjY0dVkvN25idERGcVIw?=
 =?utf-8?B?a2NzMEwremRxQ20vL2FOUjZBUTBGV0tqOGMzbFF3QlpPcTM5T096VFRRQVk3?=
 =?utf-8?B?STVLcHhla3g2VDR0T1MxYk9qZXZ2dGdPdlNPdzRxUHNJVGFUdHpUOHY3eFB3?=
 =?utf-8?B?S1JqUEhSMHpqN3lsUllUSjNJRXNMU2NWdmV2OGVwcTh6Ymw0c0txdjUzUElZ?=
 =?utf-8?B?dDNoOTFkMmlFemRVOXZHNnVBOXJ0SkhJTWRhQzRROE1TOFk3L1loZnNMSmNZ?=
 =?utf-8?B?Ymk0ZlZNZks1VzQzbUQ0dHpFRXQrMkt4b05YV2lmN1p3ZER1OGhZd213dVRW?=
 =?utf-8?B?WXE2OTBhWEMrd2VnblNmcS96MzZRWUhUZ084MC9HeDZoNG9lVCtTeTBzM2FZ?=
 =?utf-8?B?bHlSanNKRVBCYUM5eDJZVXRJS01sRW1QYjdKZUUxYWswWlZnb0xTUERtY1Yx?=
 =?utf-8?B?dzZZM2hwZjI1TDNEWVhyU0ovR3Jnb2RVMWxydWR2NWpQZnZoWDI1SDc1OHZl?=
 =?utf-8?B?RHFHSERtREN2VWhkcG5MaGdTR1NudUhHdnhiWVVZeFhPcU03UHpIa0VmZDdx?=
 =?utf-8?B?NUdCd3dXNHJsNk5OOE1QQWFKR3hLSFJ4QWNyNkt0cHo5TXpiL3FxM0JEa1Qr?=
 =?utf-8?B?azZ3WGNqazAzNld4L1R2UVR3SFRHUy9qVVFQUEZuK1VEbGdaUHdpSmg4bHhp?=
 =?utf-8?Q?NAqa/sbEXFWakYeBLu0LhWB4U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e83c001-4951-4561-d4bd-08dd40f3033b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 05:57:43.3555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eR7gwLyA+07plTE3HXeMZlyUZxwGFbHvk7tbXeJhFv0Xl3LH3mElkZrIcHVqs2N3KRSdMCT6yAff+4K6HBhTjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055
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

On Wed, Jan 29, 2025 at 12:54:01PM +0100, David Hildenbrand wrote:
> The single "real" user in the tree of make_device_exclusive_range() always
> requests making only a single address exclusive. The current implementation
> is hard to fix for properly supporting anonymous THP / large folios and
> for avoiding messing with rmap walks in weird ways.
> 
> So let's always process a single address/page and return folio + page to
> minimize page -> folio lookups. This is a preparation for further
> changes.
> 
> Reject any non-anonymous or hugetlb folios early, directly after GUP.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  Documentation/mm/hmm.rst                    |  2 +-
>  Documentation/translations/zh_CN/mm/hmm.rst |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_svm.c       |  5 +-
>  include/linux/mmu_notifier.h                |  2 +-
>  include/linux/rmap.h                        |  5 +-
>  lib/test_hmm.c                              | 45 +++++------
>  mm/rmap.c                                   | 90 +++++++++++----------
>  7 files changed, 75 insertions(+), 76 deletions(-)
> 
> diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
> index f6d53c37a2ca..7d61b7a8b65b 100644
> --- a/Documentation/mm/hmm.rst
> +++ b/Documentation/mm/hmm.rst
> @@ -400,7 +400,7 @@ Exclusive access memory
>  Some devices have features such as atomic PTE bits that can be used to implement
>  atomic access to system memory. To support atomic operations to a shared virtual
>  memory page such a device needs access to that page which is exclusive of any
> -userspace access from the CPU. The ``make_device_exclusive_range()`` function
> +userspace access from the CPU. The ``make_device_exclusive()`` function
>  can be used to make a memory range inaccessible from userspace.
>  
>  This replaces all mappings for pages in the given range with special swap
> diff --git a/Documentation/translations/zh_CN/mm/hmm.rst b/Documentation/translations/zh_CN/mm/hmm.rst
> index 0669f947d0bc..22c210f4e94f 100644
> --- a/Documentation/translations/zh_CN/mm/hmm.rst
> +++ b/Documentation/translations/zh_CN/mm/hmm.rst
> @@ -326,7 +326,7 @@ devm_memunmap_pages() 和 devm_release_mem_region() 当资源可以绑定到 ``s
>  
>  一些设备具有诸如原子PTE位的功能，可以用来实现对系统内存的原子访问。为了支持对一
>  个共享的虚拟内存页的原子操作，这样的设备需要对该页的访问是排他的，而不是来自CPU
> -的任何用户空间访问。  ``make_device_exclusive_range()`` 函数可以用来使一
> +的任何用户空间访问。  ``make_device_exclusive()`` 函数可以用来使一
>  个内存范围不能从用户空间访问。
>  
>  这将用特殊的交换条目替换给定范围内的所有页的映射。任何试图访问交换条目的行为都会
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index b4da82ddbb6b..39e3740980bb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -609,10 +609,9 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
>  
>  		notifier_seq = mmu_interval_read_begin(&notifier->notifier);
>  		mmap_read_lock(mm);
> -		ret = make_device_exclusive_range(mm, start, start + PAGE_SIZE,
> -					    &page, drm->dev);
> +		page = make_device_exclusive(mm, start, drm->dev, &folio);
>  		mmap_read_unlock(mm);
> -		if (ret <= 0 || !page) {
> +		if (IS_ERR(page)) {
>  			ret = -EINVAL;
>  			goto out;
>  		}
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index e2dd57ca368b..d4e714661826 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -46,7 +46,7 @@ struct mmu_interval_notifier;
>   * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
>   * longer have exclusive access to the page. When sent during creation of an
>   * exclusive range the owner will be initialised to the value provided by the
> - * caller of make_device_exclusive_range(), otherwise the owner will be NULL.
> + * caller of make_device_exclusive(), otherwise the owner will be NULL.
>   */
>  enum mmu_notifier_event {
>  	MMU_NOTIFY_UNMAP = 0,
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 683a04088f3f..86425d42c1a9 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -663,9 +663,8 @@ int folio_referenced(struct folio *, int is_locked,
>  void try_to_migrate(struct folio *folio, enum ttu_flags flags);
>  void try_to_unmap(struct folio *, enum ttu_flags flags);
>  
> -int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
> -				unsigned long end, struct page **pages,
> -				void *arg);
> +struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
> +		void *owner, struct folio **foliop);
>  
>  /* Avoid racy checks */
>  #define PVMW_SYNC		(1 << 0)
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 056f2e411d7b..9e1b07a227a3 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -780,10 +780,8 @@ static int dmirror_exclusive(struct dmirror *dmirror,
>  	unsigned long start, end, addr;
>  	unsigned long size = cmd->npages << PAGE_SHIFT;
>  	struct mm_struct *mm = dmirror->notifier.mm;
> -	struct page *pages[64];
>  	struct dmirror_bounce bounce;
> -	unsigned long next;
> -	int ret;
> +	int ret = 0;
>  
>  	start = cmd->addr;
>  	end = start + size;
> @@ -795,36 +793,31 @@ static int dmirror_exclusive(struct dmirror *dmirror,
>  		return -EINVAL;
>  
>  	mmap_read_lock(mm);
> -	for (addr = start; addr < end; addr = next) {
> -		unsigned long mapped = 0;
> -		int i;
> -
> -		next = min(end, addr + (ARRAY_SIZE(pages) << PAGE_SHIFT));
> +	for (addr = start; addr < end; addr += PAGE_SIZE) {
> +		struct folio *folio;
> +		struct page *page;
>  
> -		ret = make_device_exclusive_range(mm, addr, next, pages, NULL);
> -		/*
> -		 * Do dmirror_atomic_map() iff all pages are marked for
> -		 * exclusive access to avoid accessing uninitialized
> -		 * fields of pages.
> -		 */
> -		if (ret == (next - addr) >> PAGE_SHIFT)
> -			mapped = dmirror_atomic_map(addr, next, pages, dmirror);
> -		for (i = 0; i < ret; i++) {
> -			if (pages[i]) {
> -				unlock_page(pages[i]);
> -				put_page(pages[i]);
> -			}
> +		page = make_device_exclusive(mm, addr, &folio, NULL);
> +		if (IS_ERR(page)) {
> +			ret = PTR_ERR(page);
> +			break;
>  		}
>  
> -		if (addr + (mapped << PAGE_SHIFT) < next) {
> -			mmap_read_unlock(mm);
> -			mmput(mm);
> -			return -EBUSY;
> -		}
> +		ret = dmirror_atomic_map(addr, addr + PAGE_SIZE, &page, dmirror);
> +		if (!ret)
> +			ret = -EBUSY;
> +		folio_unlock(folio);
> +		folio_put(folio);
> +
> +		if (ret)
> +			break;
>  	}
>  	mmap_read_unlock(mm);
>  	mmput(mm);
>  
> +	if (ret)
> +		return -EBUSY;
> +
>  	/* Return the migrated data for verification. */
>  	ret = dmirror_bounce_init(&bounce, start, size);
>  	if (ret)
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 17fbfa61f7ef..676df4fba5b0 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2495,70 +2495,78 @@ static bool folio_make_device_exclusive(struct folio *folio,
>  		.arg = &args,
>  	};
>  
> -	/*
> -	 * Restrict to anonymous folios for now to avoid potential writeback
> -	 * issues.
> -	 */
> -	if (!folio_test_anon(folio) || folio_test_hugetlb(folio))
> -		return false;

A bit of churn with the previous patch but I suppose it makes a stable backport
of the previous patch easier. The rest looks good so:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

>  	rmap_walk(folio, &rwc);
>  
>  	return args.valid && !folio_mapcount(folio);
>  }
>  
>  /**
> - * make_device_exclusive_range() - Mark a range for exclusive use by a device
> + * make_device_exclusive() - Mark an address for exclusive use by a device
>   * @mm: mm_struct of associated target process
> - * @start: start of the region to mark for exclusive device access
> - * @end: end address of region
> - * @pages: returns the pages which were successfully marked for exclusive access
> + * @addr: the virtual address to mark for exclusive device access
>   * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier to allow filtering
> + * @foliop: folio pointer will be stored here on success.
> + *
> + * This function looks up the page mapped at the given address, grabs a
> + * folio reference, locks the folio and replaces the PTE with special
> + * device-exclusive non-swap entry, preventing userspace CPU access. The
> + * function will return with the folio locked and referenced.
>   *
> - * Returns: number of pages found in the range by GUP. A page is marked for
> - * exclusive access only if the page pointer is non-NULL.
> + * On fault these special device-exclusive entries are replaced with the
> + * original PTE under folio lock, after calling MMU notifiers.
>   *
> - * This function finds ptes mapping page(s) to the given address range, locks
> - * them and replaces mappings with special swap entries preventing userspace CPU
> - * access. On fault these entries are replaced with the original mapping after
> - * calling MMU notifiers.
> + * Only anonymous non-hugetlb folios are supported and the VMA must have
> + * write permissions such that we can fault in the anonymous page writable
> + * in order to mark it exclusive. The caller must hold the mmap_lock in read
> + * mode.
>   *
>   * A driver using this to program access from a device must use a mmu notifier
>   * critical section to hold a device specific lock during programming. Once
>   * programming is complete it should drop the page lock and reference after
>   * which point CPU access to the page will revoke the exclusive access.
> + *
> + * Returns: pointer to mapped page on success, otherwise a negative error.
>   */
> -int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
> -				unsigned long end, struct page **pages,
> -				void *owner)
> +struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
> +		void *owner, struct folio **foliop)
>  {
> -	long npages = (end - start) >> PAGE_SHIFT;
> -	long i;
> +	struct folio *folio;
> +	struct page *page;
> +	long npages;
> +
> +	mmap_assert_locked(mm);
>  
> -	npages = get_user_pages_remote(mm, start, npages,
> +	/*
> +	 * Fault in the page writable and try to lock it; note that if the
> +	 * address would already be marked for exclusive use by the device,
> +	 * the GUP call would undo that first by triggering a fault.
> +	 */
> +	npages = get_user_pages_remote(mm, addr, 1,
>  				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
> -				       pages, NULL);
> -	if (npages < 0)
> -		return npages;
> -
> -	for (i = 0; i < npages; i++, start += PAGE_SIZE) {
> -		struct folio *folio = page_folio(pages[i]);
> -		if (PageTail(pages[i]) || !folio_trylock(folio)) {
> -			folio_put(folio);
> -			pages[i] = NULL;
> -			continue;
> -		}
> +				       &page, NULL);
> +	if (npages != 1)
> +		return ERR_PTR(npages);
> +	folio = page_folio(page);
>  
> -		if (!folio_make_device_exclusive(folio, mm, start, owner)) {
> -			folio_unlock(folio);
> -			folio_put(folio);
> -			pages[i] = NULL;
> -		}
> +	if (!folio_test_anon(folio) || folio_test_hugetlb(folio)) {
> +		folio_put(folio);
> +		return ERR_PTR(-EOPNOTSUPP);
> +	}
> +
> +	if (!folio_trylock(folio)) {
> +		folio_put(folio);
> +		return ERR_PTR(-EBUSY);
>  	}
>  
> -	return npages;
> +	if (!folio_make_device_exclusive(folio, mm, addr, owner)) {
> +		folio_unlock(folio);
> +		folio_put(folio);
> +		return ERR_PTR(-EBUSY);
> +	}
> +	*foliop = folio;
> +	return page;
>  }
> -EXPORT_SYMBOL_GPL(make_device_exclusive_range);
> +EXPORT_SYMBOL_GPL(make_device_exclusive);
>  #endif
>  
>  void __put_anon_vma(struct anon_vma *anon_vma)
> -- 
> 2.48.1
> 
