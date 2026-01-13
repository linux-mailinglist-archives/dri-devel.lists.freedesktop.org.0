Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A23D1612B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 01:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AAB10E440;
	Tue, 13 Jan 2026 00:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OrTATVNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1124A10E440;
 Tue, 13 Jan 2026 00:44:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkNWAQoN4ReQzw8SNN/etoK/H/jd5btABZQPLvgOxsAw+XcpK5GhHG11KB7iW0VQh6kHHqmk1FnmKyaPLQz5LkDl5D7oEj7CfK72tb4l14omu5k9G32dG7JRYRgAQz7J1u9xgbzuVTCLKYpponbmA60PA+Yfb5u8OMUtNLLvk8DYLI15+OK0WztR1LO3qzma2Udiz9MGKrJR4apnt8iVcmUIvnQ2Hda0Cs8yg3HSJ+LtsNwX4EGRB0Jnb3rgKP8NXy2tfY459LajZ1GNfVq5i5nZKP2icdZD3/e6b2gjE4nrucxd3ps6sJbYOOdwTUHH54lXqcsz9Vp25Qfk6aEgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiYYfVIUHmUneOUjWj9Q0ryvTy3iijOlXhyaV1IDxXY=;
 b=lm5PZShUR9qbtlUmDPP80ThiAzIt6metYDTU+ino5ZUiak2YCJfP0/jpotDRg4OiFhdSlBV5HhgA2qV6eKWcJOy2+bfhlIMC9bIXv94UsA2N1M3rmB924uVXaPKNtdxuX0+7bGMPv0/CKOEqs4CZ7jCCatmkbfPr18gRcYaUPUagF/l/dhgajOaKHDzSi+FonloMuqfF6y7NAr7LEqOlbZ/RRmUCkoZENFiXsOgFAemWKmymCd1mLlbO8Ym1ZT5NwlPVkWLvXHB2sR2t7K9//SYIjmSs3Vlr9VXPKII+ewU+5qwxHeAtYmBBqKRlAgkWqDIzZcnkDWN9mYsIODfOGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiYYfVIUHmUneOUjWj9Q0ryvTy3iijOlXhyaV1IDxXY=;
 b=OrTATVNtgX9WJ+jNYbTrkltDVBQv5rSs3pEEYb9wE4rDk/kudyWlw1pUHfTrkJOMjiBBmj0lD2DTqixD90tJJ9HlW6UHe1NUIqYHNbgtjnc23nieLaGIJHP1VHqFyLqWdzCxdpA0bES2I+RRehY/tA34fHP1BE8OOo5tKFad/46e0duKxXEaULxc7T9JeNFu7TVZ2nVMo+8y3wuIaL3knww4/ftge1kuMUaNAQP7RgcXo0UxUKcMro9L/OG4TL5bVK5Vin1O78qg6bYPr8ziCHykBfzX1l8+3mYzddDNW8T/8bC1I2ONNa6kmbcuNbgs5BD2iuMvYenmP/UFJVL66w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8477.namprd12.prod.outlook.com (2603:10b6:8:15b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Tue, 13 Jan 2026 00:43:56 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 00:43:56 +0000
Date: Tue, 13 Jan 2026 11:43:51 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Balbir Singh <balbirs@nvidia.com>, 
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>, 
 Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, 
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] mm/zone_device: Add
 free_zone_device_folio_prepare() helper
Message-ID: <ntawk3mmrg2qihe24dk34pevtlgj3cdxnshau3wgyi5lygtuvo@jcsz5hmt4xth>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-3-francois.dugast@intel.com>
 <706ba3a6-5be2-46d7-9e7d-d613f2e061cc@nvidia.com>
 <aWRLeoUJAYAWbLD3@lstrano-desk.jf.intel.com>
 <k25qmqrfmhzkls2ngdaq4wdk3xtl3epv4z3dvukon5yj2cb2hl@yci7xdpvauh7>
 <aWWQhOD8g8oLz1vX@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWWQhOD8g8oLz1vX@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SY5PR01CA0081.ausprd01.prod.outlook.com
 (2603:10c6:10:1f5::15) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 36992822-80ef-4a23-981d-08de523cd54e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnQ3WVp0c2o0SUZkcldRSXg1a1IrYVE2YzdnbGt4d25NOFJvZXFBWVRMb25V?=
 =?utf-8?B?bEtFclVwdTVFbkJVYU1wWFFEN28xamMyanNIWkc2Y2NCSzhnWHFzV3dSbERE?=
 =?utf-8?B?SzVDVnFwNFY1S1Q0Y2ptVzJVWEpaOVdhUlZIQkFOZzNkbjl4bDg1eWVySnMr?=
 =?utf-8?B?VTJTODA2czBkVVYzWTA0T0Ixb0hUbExCeHEzNkt0T3JWL2RLUnI0K3B0MHhF?=
 =?utf-8?B?NTBxSVhPU0h2NnV1LzhROWl1dHQxSnVnWEpNbUhrLzFQOFErOHJPcHJjeFo5?=
 =?utf-8?B?Z1Y5aS9QU29RMFNzMXJFVS81d0MrTm5FajNtK0hXRHBOWEhEcWlWWUJtckda?=
 =?utf-8?B?bEt2alJCRE5JOTJVaTMzQ0d6SXZNOVB0WnlrVk83R0RiMjVUNThCR1BTS1JD?=
 =?utf-8?B?OGQ2a2Q0d2dJQ2VuMlEzMi9DUGRRZ1NHOVRUMGJXenlVVU52cTE4QlZ4WDdh?=
 =?utf-8?B?a3RQSGZxMXdDVHJQUzBEd3pqdDNVUEptS0lKK3JaVUcxWWZKUCsrUXJkR2VV?=
 =?utf-8?B?ZmZEOU5MY1R5VS9iQUhpWDMyL29CTlNXaDZXNjNMMlFSYUU3ZDVLZVpKZUFT?=
 =?utf-8?B?dlhFQzZLZ3c3YTVpbUsxVXM2ZzlsWXlHM3lsNzhkWGhRYmtHc3VZOEZYMC9x?=
 =?utf-8?B?SmR4eVpLUUlNcDdEWWlUUEo1MnFUN0R4Q1lPSFcwVVpTbUhpbkk3MFNjMHNF?=
 =?utf-8?B?eWhscEN5dUVGajN0bUtCUjFWQlI0VWNONmt1VFlsTjZQTGZkMCtlRTVqWVR0?=
 =?utf-8?B?M0NpdVFHNFNPL1ozRDdsOFJud252K1Q1bHpjdkFUK1VpbGU1ZFVKeWxsYWxL?=
 =?utf-8?B?UG9PS01SNkNEdlpWMWVGNjQ0YTFZaWdrdmVxU0ljNFJKUlhVTjh0eVAxM3Zp?=
 =?utf-8?B?MFRoajgrOGhCeHZ4L25QcGNYK3dVZjRscTd2NXhvdU11dzF1eFBSdnNpNmhx?=
 =?utf-8?B?anIrdGM3OWFWTGhJbFcyczZhWklxbWxOdi9lZnh2bjRrcVBDaHg2MVAvVVBi?=
 =?utf-8?B?a3hBckFWWDdJVVd0U3lIWlRHcWorRUhYR1l4N3NES2FyQTRyWnpjQlRzaHRo?=
 =?utf-8?B?dEFVZXpzRjNiaXZySFlXWmVDMFdFbCtLK1hTUTMrYks4ZHMxbnpJSW1NSW1l?=
 =?utf-8?B?NjY5QzNtMHNYd3RXQTRrZFRFTE81RGdWZ0hmMHI1UFVxa1R6N01FK3IxOXRZ?=
 =?utf-8?B?WFRoOXlBSzRtenZ3enRrMTk5djZpVFZwVkJBaU5mL3BlSFk1VFYrTGJvTkVn?=
 =?utf-8?B?TmNUOG5SSG9LMllLUkIvRVNESzdoQk0xaG9DTFE0QmNQMXVkZnVzbklDaGMv?=
 =?utf-8?B?WXAwYWVidjRXQ0ZUejFRMXRQS1M4YVZFc3h3ZUdvbE9wM05CUExZd2FRbjl5?=
 =?utf-8?B?NHJWWFV2S0wwMUo2SVdteUNyczJIMElWdlZWeGF4eUVIc01tampzU1ZEVThv?=
 =?utf-8?B?U05iMi9xSXB3aTYwZkJMY0FsOVE5TFF0R1RlQTdmWUhDODBoa0ZuOG9rNGQ2?=
 =?utf-8?B?YjM4Ym41REZQazlRQTlyeWRlbVpLZUVUSi8rVkJORkpXWnVjYUd2Vm42WC9Q?=
 =?utf-8?B?M0lkRDhvNE5FY21hZ2ZaQzR4QUFwUSsvY1RSenVKSDFUQ3ZISmxoMktpSS9E?=
 =?utf-8?B?c0JrMklDZDluUGJVTDA2TzFTZ0xNcGZZYmhVK3QrcFNNRWdEYTNzQS9ySkkv?=
 =?utf-8?B?R0xJMzFtL0thdGVtVDhHaHhjNlJMSmtXSGVZV2pGM2F3RGtzL3pvaERaTG1k?=
 =?utf-8?B?bXgxWXByem5NaGl3WWp1cFdLVm01eWQyNERxVUFNWlFSOWxweVpmdWRiUHkz?=
 =?utf-8?B?b2dLWm9kL1J4WWNRUEVTbnNvck4yZmtBRTArRWhIZjEvMG1SdHJKZFpldkhT?=
 =?utf-8?B?U2xZYkVXL00xcmFnSFNBOEtBd2dkS1JyTnJYUG5jNm5MQXIxNGs5Q3pPYnBw?=
 =?utf-8?Q?u3FZdgOw3BDaZRbKC6S7d7mvPlleq6Rw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0VpV3RIRnBVRGNXbGlqcVBKVXl4cTgwSk1ObzErMmd5ZVZIbHlzZTFQeFpl?=
 =?utf-8?B?R3dwdmc2V0JWbkVVYWwwTVA2UXJDQ1k5aUtGOW9kNHFFenpqTG9VS2phSE10?=
 =?utf-8?B?OHIyWFNiTHpscGJnV0lpa240ZXh3SnI2K1o3b2VadDByRVp2bldOUnFPNjh1?=
 =?utf-8?B?bEtGd1R1WURzRytwY3ZYUmlLaXFucG0yVm9KR0EvcldGZk1hTC8wWDV3Vnky?=
 =?utf-8?B?cXh5ekRsajVmVDcxUUl5WStidXZQSVd5WnZwc2t6dnJWR0J2blJuZ0x1Ynl4?=
 =?utf-8?B?ZHFWWFdWK3ZTNVhXWlhFU25xd0FxWC95L3hqb01PVlRWbFVxdnlWbHZkYUpy?=
 =?utf-8?B?U3ZPSVlSREZ6ZEVERC9welY4bHlWTmZMZldOdm1MYXkxdTM4d1IwTjhXZVA0?=
 =?utf-8?B?MXlRVFZmNTF5M2M0Ylk0QnZtS2NaR3dxckFOZWNrNVBTMUtlL2trS1FsMExS?=
 =?utf-8?B?M1J1Z0l3enRRaERDbVQ0RFJ0cHU4YktWejJlVlJIMEtlaHh4L3BETjVkanFi?=
 =?utf-8?B?RnhUVGY5SktsM05zaS9hcEtYY0tSbkRRR2Y5akUxZFFTT0k3RVVueTMrbzRU?=
 =?utf-8?B?RjZSKytBK2VGZVBpcFJGSExZTWpmSE9PNnpONVV4VUxFM1Y4N0QzNmF0S1VC?=
 =?utf-8?B?VGtoTVRsUlhvdjNSeUErWXBXRlZOOER2QkRsQlkxREhGTWIxSTJWQi9UR0dl?=
 =?utf-8?B?bDZYZTh0VWM5NUpZVWRRNndTQTRjUjVjUUl3cWErODdOSHE5THVhMlNnRFF0?=
 =?utf-8?B?MWhWZ1U0VUF3QnRpSVNrTFRxVFlINERXUEp1eUh4WHJ2WWFHRGd1QUE0c04y?=
 =?utf-8?B?MjM4MFJmRmk3dElvb2hmaDQ5R1pQOUxsOVNHdU1TeDdhVElTZkhCcmNVTUlO?=
 =?utf-8?B?ZlBVYmZzWFUzdXp0RTBOMURzYWtwNW1wOEhjYTIzd1BZTmVSckFjVWltWnRP?=
 =?utf-8?B?Yll6TVNJUG04K0Y5MUZjNzRXamtqb3crY0VwR3NqMHRENHlRcWdwY0NlcWRn?=
 =?utf-8?B?bDBNVElNZ2gxRWp0bzR4ZGZhY0RkYmdnOEpiM0NDcklFaHJ3SjJzNjBoVFZ4?=
 =?utf-8?B?MTJFQitaWnF6VnhuY0h5TWI2SEpCc3lRSFJ1N0JnZmtyZndCQklhQ3Y0YjNx?=
 =?utf-8?B?YlZIWGpMWklrLzJSMkxPdi9xL1FVSWFJRE9EKzAzUzBjcWNjblBlUE82SUpF?=
 =?utf-8?B?cXpRQkYrTlRjSC9OamI3QnBrYmtiTXZNYmtWYnNBc2VteGNRQ2RRRTRxVHhp?=
 =?utf-8?B?cWVJYkY5WFU5Mmh1T1dqT1JjTHRXZGtGT2x1YzdxUTVDTzFuSUdzRXVoL3ND?=
 =?utf-8?B?ZGozWmNCOTNUVkFqTkhKREN4Z0tzRnBhNDVEK2VIUjZPME1BRXdJSy9rWUp6?=
 =?utf-8?B?c1RUbGljSWlCcDlUbzF1SHFFSVhqSU5icTEvQkdsY3RmenBoQjRZcG8zUnpx?=
 =?utf-8?B?amZlNjRvWm0rUlpQY0grTlBjRWMwb2ZwSWVjQU1GbU1GQ3h5TjVQV2RCR0VO?=
 =?utf-8?B?MmFoclZkL2szMjl2cmlQMTROTndzUVh6My9weW93clM0SE1VdzVRTWxiR2d1?=
 =?utf-8?B?TGR6bW9oZy94cWJFSkdFaURYaDFTWmo0NVJUYUZqMTlzdHhiUHBuQmkvNUFK?=
 =?utf-8?B?SFZjamJUZnRGcW9UU2h1Z2gwQVdWSitjRVVHS1ltOGdUMmpJdktMVkFhT0tT?=
 =?utf-8?B?SFBjUXVUbmtJSElEbk1vNWVBa1N3Z1JGVFBsbmYvQ0lUbyszUVFTWXZHNS9x?=
 =?utf-8?B?ZmtDQzFYVWd1d00rUURZWXlQY3N2NG02N0dXanhWbDk2ajBidHhoR2cydE05?=
 =?utf-8?B?VE5ET1ozT2w3UmFTNit2TmhMVjh3WGE3KzUrYXM0c3M5dENHUURTb0tBOTZU?=
 =?utf-8?B?d2w1RTI5UitIZTdUMThTQVBEeSt6WmR1MExLL0JzQnhWb1pwQVltTFFrOUdF?=
 =?utf-8?B?eUJoTGhMaFdZaUcrMGMwZXBwSFJ6ekZDZWJjWHVoVmo3TWJEVGtyY2tYYVJZ?=
 =?utf-8?B?TFdjcDJjdElFZkdOZWl1YWhwbDFDQkdOeG5DLzRXdHFMNk9LZ3hiTzBnUkpq?=
 =?utf-8?B?RFN5UVpOOHNrc002TmZRSmF6NERCSzNNc2VLZldRNkRQdWZ2a2ZHREhQdW9r?=
 =?utf-8?B?MjBIdld1cXhZVWRBcmdPbUNNTVJQQ3pHNjQ1TkJUbTNZenNUSjJwVGxBMGVV?=
 =?utf-8?B?R1A4Q1orbXFXYzlsVmlaZVNJYmtBMzF0WTRxdEpBN251U2Y3OTVTVkh4aFNE?=
 =?utf-8?B?aTkrVGcvNG5PL3E0QmFlNE9uZ2EwdGF1S1VyelptVHE3SXUzTVMyM2pueVRK?=
 =?utf-8?B?bStNamlIeFpTaHVUcVg4MTJFckhjWVpWaHRQRktNK2JRcUpnazlpQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36992822-80ef-4a23-981d-08de523cd54e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 00:43:56.6847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BI8mvWwaBTLJBbm+SZckhufbrzY5zdU37i5dKXoVTXABJJp/Xc5NnZONBJgGBdlBWhDiiuqkOAc7ix0X/hnBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8477
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

On 2026-01-13 at 11:23 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> On Tue, Jan 13, 2026 at 10:58:27AM +1100, Alistair Popple wrote:
> > On 2026-01-12 at 12:16 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > On Mon, Jan 12, 2026 at 11:44:15AM +1100, Balbir Singh wrote:
> > > > On 1/12/26 06:55, Francois Dugast wrote:
> > > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > > 
> > > > > Add free_zone_device_folio_prepare(), a helper that restores large
> > > > > ZONE_DEVICE folios to a sane, initial state before freeing them.
> > > > > 
> > > > > Compound ZONE_DEVICE folios overwrite per-page state (e.g. pgmap and
> > > > > compound metadata). Before returning such pages to the device pgmap
> > > > > allocator, each constituent page must be reset to a standalone
> > > > > ZONE_DEVICE folio with a valid pgmap and no compound state.
> > > > > 
> > > > > Use this helper prior to folio_free() for device-private and
> > > > > device-coherent folios to ensure consistent device page state for
> > > > > subsequent allocations.
> > > > > 
> > > > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > > > Cc: Zi Yan <ziy@nvidia.com>
> > > > > Cc: David Hildenbrand <david@kernel.org>
> > > > > Cc: Oscar Salvador <osalvador@suse.de>
> > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > > > Cc: Mike Rapoport <rppt@kernel.org>
> > > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > > Cc: Michal Hocko <mhocko@suse.com>
> > > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > > Cc: linux-mm@kvack.org
> > > > > Cc: linux-cxl@vger.kernel.org
> > > > > Cc: linux-kernel@vger.kernel.org
> > > > > Suggested-by: Alistair Popple <apopple@nvidia.com>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > ---
> > > > >  include/linux/memremap.h |  1 +
> > > > >  mm/memremap.c            | 55 ++++++++++++++++++++++++++++++++++++++++
> > > > >  2 files changed, 56 insertions(+)
> > > > > 
> > > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > > index 97fcffeb1c1e..88e1d4707296 100644
> > > > > --- a/include/linux/memremap.h
> > > > > +++ b/include/linux/memremap.h
> > > > > @@ -230,6 +230,7 @@ static inline bool is_fsdax_page(const struct page *page)
> > > > >  
> > > > >  #ifdef CONFIG_ZONE_DEVICE
> > > > >  void zone_device_page_init(struct page *page, unsigned int order);
> > > > > +void free_zone_device_folio_prepare(struct folio *folio);
> > > > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > > > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > > > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > > index 39dc4bd190d0..375a61e18858 100644
> > > > > --- a/mm/memremap.c
> > > > > +++ b/mm/memremap.c
> > > > > @@ -413,6 +413,60 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(get_dev_pagemap);
> > > > >  
> > > > > +/**
> > > > > + * free_zone_device_folio_prepare() - Prepare a ZONE_DEVICE folio for freeing.
> > > > > + * @folio: ZONE_DEVICE folio to prepare for release.
> > > > > + *
> > > > > + * ZONE_DEVICE pages/folios (e.g., device-private memory or fsdax-backed pages)
> > > > > + * can be compound. When freeing a compound ZONE_DEVICE folio, the tail pages
> > > > > + * must be restored to a sane ZONE_DEVICE state before they are released.
> > > > > + *
> > > > > + * This helper:
> > > > > + *   - Clears @folio->mapping and, for compound folios, clears each page's
> > > > > + *     compound-head state (ClearPageHead()/clear_compound_head()).
> > > > > + *   - Resets the compound order metadata (folio_reset_order()) and then
> > > > > + *     initializes each constituent page as a standalone ZONE_DEVICE folio:
> > > > > + *       * clears ->mapping
> > > > > + *       * restores ->pgmap (prep_compound_page() overwrites it)
> > > > > + *       * clears ->share (only relevant for fsdax; unused for device-private)
> > > > > + *
> > > > > + * If @folio is order-0, only the mapping is cleared and no further work is
> > > > > + * required.
> > > > > + */
> > > > > +void free_zone_device_folio_prepare(struct folio *folio)
> > 
> > I don't really like the naming here - we're not preparing a folio to be
> > freed, from the core-mm perspective the folio is already free. This is just
> > reinitialising the folio metadata ready for the driver to reuse it, which may
> > actually involve just recreating a compound folio.
> > 
> > So maybe zone_device_folio_reinitialise()? Or would it be possible to
> 
> zone_device_folio_reinitialise - that works for me... but seem like
> everyone has a opinion. 

Well of course :) There are only two hard problems in programming and
I forget the other one. But I didn't want to just say I don't like
free_zone_device_folio_prepare() without offering an alternative, I'd be open
to others.

> 
> > roll this into a zone_device_folio_init() type function (similar to
> > zone_device_page_init()) that just deals with everything at allocation time?
> > 
> 
> I don’t think doing this at allocation actually works without a big lock
> per pgmap. Consider the case where a VRAM allocator allocates two
> distinct subsets of a large folio and you have a multi-threaded GPU page
> fault handler (Xe does). It’s possible two threads could call
> zone_device_folio_reinitialise at the same time, racing and causing all
> sorts of issues. My plan is to just call this function in the driver’s
> ->folio_free() prior to returning the VRAM allocation to my driver pool.

This doesn't make sense to me (at least as someone who doesn't know DRM SVM
intimately) - the folio metadata initialisation should only happen after the
VRAM allocation has occured.

IOW the VRAM allocator needs to deal with the locking, once you have the VRAM
physical range you just initialise the folio/pages associated with that range
with zone_device_folio_(re)initialise() and you're done.

Is the concern that reinitialisation would touch pages outside of the allocated
VRAM range if it was previously a large folio?

> > > > > +{
> > > > > +	struct dev_pagemap *pgmap = page_pgmap(&folio->page);
> > > > > +	int order, i;
> > > > > +
> > > > > +	VM_WARN_ON_FOLIO(!folio_is_zone_device(folio), folio);
> > > > > +
> > > > > +	folio->mapping = NULL;
> > > > > +	order = folio_order(folio);
> > > > > +	if (!order)
> > > > > +		return;
> > > > > +
> > > > > +	folio_reset_order(folio);
> > > > > +
> > > > > +	for (i = 0; i < (1UL << order); i++) {
> > > > > +		struct page *page = folio_page(folio, i);
> > > > > +		struct folio *new_folio = (struct folio *)page;
> > > > > +
> > > > > +		ClearPageHead(page);
> > > > > +		clear_compound_head(page);
> > > > > +
> > > > > +		new_folio->mapping = NULL;
> > > > > +		/*
> > > > > +		 * Reset pgmap which was over-written by
> > > > > +		 * prep_compound_page().
> > > > > +		 */
> > > > > +		new_folio->pgmap = pgmap;
> > > > > +		new_folio->share = 0;	/* fsdax only, unused for device private */
> > > > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > > 
> > > > Does calling the free_folio() callback on new_folio solve the issue you are facing, or is
> > > > that PMD_ORDER more frees than we'd like?
> > > > 
> > > 
> > > No, calling free_folio() more often doesn’t solve anything—in fact, that
> > > would make my implementation explode. I explained this in detail here [1]
> > > to Zi.
> > > 
> > > To recap [1], my memory allocator has no visibility into individual
> > > pages or folios; it is DRM Buddy layered on top of TTM BO. This design
> > > allows VRAM to be allocated or evicted for both traditional GPU
> > > allocations (GEMs) and SVM allocations.
> > > 
> > > Now, to recap the actual issue: if device folios are not split upon free
> > > and are later reallocated with a different order in
> > > zone_device_page_init, the implementation breaks. This problem is not
> > > specific to Xe—Nouveau happens to always allocate at the same order, so
> > > it works by coincidence. Reallocating at a different order is valid
> > > behavior and must be supported.
> > 
> > I agree it's probably by coincidence but it is a perfectly valid design to
> > always just (re)allocate at the same order and not worry about having to
> > reinitialise things to different orders.
> > 
> 
> I would agree with this statement too — it’s perfectly valid if a driver
> always wants to (re)allocate at the same order.
> 
> Matt
> 
> >  - Alistair
> > 
> > > Matt
> > > 
> > > [1] https://patchwork.freedesktop.org/patch/697710/?series=159119&rev=3#comment_1282413
> > > 
> > > > > +	}
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(free_zone_device_folio_prepare);
> > > > > +
> > > > >  void free_zone_device_folio(struct folio *folio)
> > > > >  {
> > > > >  	struct dev_pagemap *pgmap = folio->pgmap;
> > > > > @@ -454,6 +508,7 @@ void free_zone_device_folio(struct folio *folio)
> > > > >  	case MEMORY_DEVICE_COHERENT:
> > > > >  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
> > > > >  			break;
> > > > > +		free_zone_device_folio_prepare(folio);
> > > > >  		pgmap->ops->folio_free(folio, order);
> > > > >  		percpu_ref_put_many(&folio->pgmap->ref, nr);
> > > > >  		break;
> > > > 
> > > > Balbir
