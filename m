Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B347F8B3CED
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 18:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A7C10F196;
	Fri, 26 Apr 2024 16:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nw/7SIV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AAC10F197;
 Fri, 26 Apr 2024 16:35:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnN8asRz0fPw6ioJacj/lmxHi5TLgb5QVRU4TCsEzrT/r1JF0foZqvyKeOIPDayFwGKgdlxEcALha8E3RBAg0FyreHT6PG+D29fKfA76gTcZtTE7awa9agJeu+A+V0MO/v9dhyUZc5Tre1LDcmBOgVyhF3YxOXX/OUyfRXHxN0pK3Mbi94hLc4Na+gT0L7JE5ckMWmXIJGlkKFsH0aXNuse16ViBkK3wSLAogCsAZf8LtZplCwKzSPaCZDOCTmSTXZlNXQyVjOzYQy1QBXQ6/5leDRjgTbMx+hD+AVDPaGWPfZzP8MMEWI2SBM4QCYqndVS6R8wcfhcFd1scc8huOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtiUHZFyqZ8VIV4t4+MYQgrJG7MQdiwcV+43MTdsPOI=;
 b=ilIbiDsvrAFe9GCp9NliM/OJkmSLa6BkehK0I3axzFppqobvgmLsTvIX39ybIl2hs3o9KyzAgvismN9uB4XOhVog+D51s3If/urDr6Qh80bKDA9NM7lFtCkLBwycfV658YGZSfUD4/941pWMbKwfNhBg5rj9pkAyB6FAO20/3RE3Tro2/A+CjkqIAhlRLSS8aIcMMjab64xRkqyHld2wcMGlveIzjirf/kIVwrQplA3SKiIt/wFkpgjni7QaOjru7+rXZEcpeTUPCmpbJFseXiL5nfwm2aH+YGS/HtxbXP/Wn0fiGEDKlR+puzsh73+tlU8fxB5QhTCZOglERK5n7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtiUHZFyqZ8VIV4t4+MYQgrJG7MQdiwcV+43MTdsPOI=;
 b=nw/7SIV08ZWcFNdorsOeMlzn3dVlTaSbXOnIww2TWmUHYywyOwySfbO/rXKgef919hEO+PVDZSARADAo9feZZq01Hrof4dteoTjdsL88T0NrPSolldT9J3g21EXjqBqc8BGUxXHt0ROuAOmFrzCDFEjT31lP6PHhmApurFzC549+IW0o4LRfku/1c3VR7CROZKHCXiXpn6lrzJTKBrzrmF97qzTFz1X0xbo5QNmPuKe9cwhAwwshaIQTsPkCwJbO/YNYnTm/puEDWPV4QOdSe+uZ9MjIuvKY46Gqf0N+cuAsSS2egRAAgy8gErhYOV7XYQ9i1Vv9W+PcHLvjlXc+yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by DS7PR12MB6142.namprd12.prod.outlook.com (2603:10b6:8:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 16:35:21 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 16:35:21 +0000
Date: Fri, 26 Apr 2024 13:35:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: "Zeng, Oak" <oak.zeng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240426163519.GZ941030@nvidia.com>
References: <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240424134840.GJ941030@nvidia.com>
 <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240425010520.GW941030@nvidia.com>
 <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
 <20240426120047.GX941030@nvidia.com>
 <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
X-ClientProxiedBy: BLAP220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::35) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|DS7PR12MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: 69db8f51-771e-4a6a-8f73-08dc660edd92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2xnUGdhZloyYnc1SFJIYlZrZEt5R1VzMGJPbmxUeCtBV1hzVEpnUFZrSU9x?=
 =?utf-8?B?Y0tId0FET2xYdkMxZkplOWJNMFJrK2JHNVlLQ3RFaHNiNUJJM2puR3lGVXF3?=
 =?utf-8?B?TFozRFZJVU1OSGFQaE12VUY0WW41bThSMGJhbVFEYzdpV2lsT0o4N29WbEdt?=
 =?utf-8?B?emZZaDJFSlgwUWRnTFBDZktiTkhVdFFYaDgzbkVwM3hicnRXL0ZNbUhCbndR?=
 =?utf-8?B?TjBKdzlJUEgyWjFmaFIxbDhIelNtdnFtN3JDUTJnRVBhaFVTK1YrTkZXRDk4?=
 =?utf-8?B?cWRtbXJ3aVh1QlBrUCt1TlQ2UUhtUDZXVU1NTUdwa3E5UHhobm1RWlUxQ1Jn?=
 =?utf-8?B?K0NaT2dhRHFBejkxcDRIb1VsbXY3UE00MVNOeGp5UVRESGdjN1pYaW5MRWhX?=
 =?utf-8?B?U3lKMEpnT2RYNjFjQVJNc0lpaHM2cVVJYk1NQzZ0TWN1c3hudGpwaFBSVUov?=
 =?utf-8?B?Sit1NEpLNDYvVVhzZ2RmeThlWHZ5ZCtlSmFSK2JGRzZFRldEYVlPR2QvbGx0?=
 =?utf-8?B?MWswb0FoTmEwSVZCL2ZobE5BL003WGx2Rlpic1NTbmdYanNUdkxBVEc0TnJ1?=
 =?utf-8?B?djFlMG1YTWxXQiswSk1UTm16OGtGMzB2WkZvNFJsZDNSeEtzMDV0R3NQekZI?=
 =?utf-8?B?cVR3cTZFUktiSklaMDc3VUhXcm83RUZlMmJDOFJ1TmhicjJ4ditRTHpuWVJi?=
 =?utf-8?B?dkhKajVjQjE4Yk1wL1pLclNtQ1FkVVZxbUs0L0hRNjFMMWVFaEoxaGp6NFpG?=
 =?utf-8?B?ZzV1LzlSNnRQdFpTR3FreWJLdUZoblJmMWNyeTk3cnVIRlFqaFpxQVFJdEx1?=
 =?utf-8?B?VkhReURwOWFXWmNCU2ptN0pBMERZV0RiK0xCWFVzbnViN3RPdWc3azBUNGR5?=
 =?utf-8?B?My9mQTlCdTA0NzVzcm16NDdBWERjbEZOUlhuY21pWjZMUFp6TVlEbzA0WkNp?=
 =?utf-8?B?elVkcVpDSlpTM2orTGNFNmd1S1hvcVZpRjV6RHd3SnYwYUR6bjdPbDYvYjNQ?=
 =?utf-8?B?UzRyUlQ1b2RzbUpSbWxRUnVmRTR5UzhkamNxWEhvU05HNGFpbHQ1RkNhZ092?=
 =?utf-8?B?b3h6SVZUdll3c0RlSjdlS3U1WnJvQTdCcitRbnVpVE5Mc0FpM1UxamkxdkdH?=
 =?utf-8?B?OFFpV1IySDVXbW5UTmNXcFFzNVhvSU44WDRhMytwOVVOT2JsbzdLRFpJVWkr?=
 =?utf-8?B?SzVwYWszWFA1UmZNcjNOOHNOcjJEMUhRNFYvYXdEQUFMaG80Mm5QdXgyRExQ?=
 =?utf-8?B?Uzh1Zk9aL0JMeWNmcW9CWGV6U2tLeE0yNWFzbkZQQTEyWmJZYVEwUERMSHQ5?=
 =?utf-8?B?Ky9CWmYrTW1DV0tSNFE1T2NHSXBOUlI4R0JDdHlpUi9PWVhwQi8xWjUxNytq?=
 =?utf-8?B?ZUYyWGVXdXlWQm1yLzhSMzZsdWNUZXNVMzZNbk12aEpRNzQrbjZBSWFnYk5r?=
 =?utf-8?B?RC8rNnFTand2UEtFZGhLSVhCSG1xK1ZsTUd5SFVISFFzVHIzek1Ld2xRdThI?=
 =?utf-8?B?Zm5ReGZvemk4QkFQRG42aGJwMVJWOW9zdjJxbGlGRVRQcjVvcWRvdThBNUw4?=
 =?utf-8?B?ZHd0MGVzYWIrYzhzd21namxsckxEQmtNNFl0dklJODZRSFJoM1dHbE1mbkNT?=
 =?utf-8?B?ZjhSQ3VQRjA5VVNuM2RLakxvSFl2c3hFY0lCMlI1RWJCcnV5Rnd4TlYreHJy?=
 =?utf-8?B?UDdZdnJsdlhHSVhUTHpJd0lmRnY3amExVmpWYXYvdTczN2VZbjVhMVBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnZyQ0YvTTZ4UkZkM1VCT3l1dUw1UlIxTXBHSXBmUUlkeW4vTlBEbWZiaTJ6?=
 =?utf-8?B?U3p0VVJhc3A0ellKeVhJMncwVTdmSmNwM25MUFVFNXB6V3JaM2NhOUZQaXRy?=
 =?utf-8?B?V1lnY0JvODRlWWV5Rk9nSmoyRXVwalZ0VHlLMUJnU05BR0dmRGtKdHlvdlUr?=
 =?utf-8?B?SloxR3RHRlpZbTlFdVpyQkFYdUF4eExPSCtrenZlOXdQa1JReUdnUFpRZS9t?=
 =?utf-8?B?dzNhUGFSM3cyczYvZVk5UXJwd3I1N01aR3pLRFJlaUJMWWdtcTVONFhVZVg2?=
 =?utf-8?B?WmRHY0JVMmpNbTZzNDJ6ZFltTUxaZGJwTUthWE9XTXJFOHFGcVdkTWVFU2Vx?=
 =?utf-8?B?YWY5K0N1bVl0L3RMbUg0RGZmRjI2SEZkNnNybnJxSC9pQWJycnh0V2NKL09O?=
 =?utf-8?B?SnlSVU1EMjNVTGpyRG96M0NYZGNEMVNIWDFtRS9QWWloQ3JyRUQzK2RadmpG?=
 =?utf-8?B?blRHL1RTM2RKSXpseFVPY2VmbW5oN0FhZkJzV0ZjZlA3VkxtNGFhSVBURTFq?=
 =?utf-8?B?OWUyMTEyZ1RVeUpYTnE5UUpzenVlTFh1QzBTeEFZQ2pWcW5rRE5WWGVrYTRV?=
 =?utf-8?B?RllEazBxQmhTKzlsbFd1Y2E5dlJBWWl3ckVHQzF4OXg2a1Y0K2lIUngzbzY0?=
 =?utf-8?B?MmgyYzNNMFpzTnhSTTZPYzJSWFNxT0pjN1F4eW0wRk8xVDhza1BOSDdJN1VR?=
 =?utf-8?B?WUVIWDUvdzZpNVU1bEZKbDk0RytXL3dPOWJBQ0NrL3hZaUcrNlNMd2k2djdq?=
 =?utf-8?B?Um9iZGsxYlEzdmJmdkkyMXdEc0xKcFJhbE16eEc2dnl1UGlFemJrWFlmanow?=
 =?utf-8?B?alBjdEM4VERnT2JJN2ptQ3llK2xzcGpDSHE3T2lwQmFFcU9PM3QxWTQ2RUZo?=
 =?utf-8?B?TzNzOHhoWERDc2dLR2RVcld3K1hITHJmcHNIaUxJWnZuSTFvTXhaQlgydlR3?=
 =?utf-8?B?Z29PVnFKYkdNT1pqNmZaZGE0eXRNWSttUWo2OHBnWHFUSG1UWnQwbGxPcW14?=
 =?utf-8?B?RW16YUp3eHJNVHkwSEk5UW1ZeDFEaFhHbElDREQxY090c1QraUpQYUUrajNo?=
 =?utf-8?B?aHJkN0p0ek8wV0g0bnFWZWErMlZtZTIwRFRqNlN1VkRXeVRqUVhKWDF4RDE2?=
 =?utf-8?B?YWRXYWVSUGpEWWlpV3ovVGthVE15SEdzTmFSRUhVZ24vZWhXeG9jWnpEa2h3?=
 =?utf-8?B?SE9tUFhHVnZrV3F5N2loZTNBRWZ2NHJFbVlabndZQ1JvbkF4RDVpc3BVb1Bv?=
 =?utf-8?B?Tk5IM3VrelprY25YUjEzdFBDa0NGaGFHakFvWS8rU3FYNjdQNzZoazFacW1R?=
 =?utf-8?B?eUJLNk5JR2pwY0V2YzF1VkRNMFVWR2NCWmhhMGh5bHJwZmJhaWhLNFB1SzJq?=
 =?utf-8?B?eWNPa2ZYcFF5SnRTQXhUbzYrcDJiRll3WVBQbmw0Mjg5eGVUNVJ6TmpISXZX?=
 =?utf-8?B?RkFXYXlDcGtkNlRaMjN3cE9lS1pWNlZTU0JQYWhCcjRTZGpWUGtlamZTNjRD?=
 =?utf-8?B?dWZ3MDBVRFh0b0VyY2s5NTE5WDZsWk5HSVovdk5VUjYzeU5ESlpKZ3daN2ZP?=
 =?utf-8?B?NnhkdjJKZlJsNkhmQ0tQdEdORVkwRFlJbjJTTHBWQ21GcjBINzRkdmVRMC90?=
 =?utf-8?B?NEtYVWlZdzVzMlBWS2RGaHBYM3g4dkxvZXlTYm1tOE1SdlJENExhTUdKUFF0?=
 =?utf-8?B?b1hiMFI2eWRNUkRJWUppZlVtL0xTRmlNeUZsNTFIaGtDcHZsM2xtaEFuTDFx?=
 =?utf-8?B?S0tsSlZ1ZWxCRHpGYjQ1a1FwWTJOd2dzNys4SHFvaFBSZUswODBFbHlUaEJj?=
 =?utf-8?B?QWJJYlRKVWZ4bHpacGZnb2tYall1V3JmMFZSRVJ2UzVTeXNjaUpKS3BudEpQ?=
 =?utf-8?B?dnFuaGRpMmF4ZUwwcVRGUWpySEh6NlNBT1I1aGNtYUNtcHRlSzJxaVBYbXVs?=
 =?utf-8?B?UVpjdzNDemp6c2dnQXhqalRjRFBTaWViMlByd2ovYUdIWVVwSlBuYklORDdW?=
 =?utf-8?B?N1g4U1gycjk0SE5NV3NnQ1A0WlZVbFNpNlUzaXBxc0xheTZNL1U2c0pKZHVX?=
 =?utf-8?B?Vmw4c0Mxb1ZEOG1iNnRjT1JVc0pSMmRKN3dnVHEyOHc4c3dDUUhDUUxnRkdz?=
 =?utf-8?Q?7yy4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69db8f51-771e-4a6a-8f73-08dc660edd92
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 16:35:21.4289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmRDfiT9J9TNXUhxHiX9p/PIlDsyvY+bWO2WaiKQVCKmKkH0EBZXSV6lSLUfoPkS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6142
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

On Fri, Apr 26, 2024 at 04:49:26PM +0200, Thomas Hellström wrote:
> On Fri, 2024-04-26 at 09:00 -0300, Jason Gunthorpe wrote:
> > On Fri, Apr 26, 2024 at 11:55:05AM +0200, Thomas Hellström wrote:
> > > First, the gpu_vma structure is something that partitions the
> > > gpu_vm
> > > that holds gpu-related range metadata, like what to mirror, desired
> > > gpu
> > > caching policies etc. These are managed (created, removed and
> > > split)
> > > mainly from user-space. These are stored and looked up from an rb-
> > > tree.
> > 
> > Except we are talking about SVA here, so all of this should not be
> > exposed to userspace.
> 
> I think you are misreading. this is on the level "Mirror this region of
> the cpu_vm", "prefer this region placed in VRAM", "GPU will do atomic
> accesses on this region", very similar to cpu mmap / munmap and
> madvise. What I'm trying to say here is that this does not directly
> affect the SVA except whether to do SVA or not, and in that case what
> region of the CPU mm will be mirrored, and in addition, any gpu
> attributes for the mirrored region.

SVA is you bind the whole MM and device faults dynamically populate
the mirror page table. There aren't non-SVA regions. Meta data, like
you describe, is meta data for the allocation/migration mechanism, not
for the page table or that has anything to do with the SVA mirror
operation.

Yes there is another common scheme where you bind a window of CPU to a
window on the device and mirror a fixed range, but this is a quite
different thing. It is not SVA, it has a fixed range, and it is
probably bound to a single GPU VMA in a multi-VMA device page table.

SVA is not just a whole bunch of windows being dynamically created by
the OS, that is entirely the wrong mental model. It would be horrible
to expose to userspace something like that as uAPI. Any hidden SVA
granules and other implementation specific artifacts must not be made
visible to userspace!!

> > If you use dma_map_sg you get into the world of wrongness where you
> > have to track ranges and invalidation has to wipe an entire range -
> > because you cannot do a dma unmap of a single page from a dma_map_sg
> > mapping. This is all the wrong way to use hmm_range_fault.
> > 
> > hmm_range_fault() is page table mirroring, it fundamentally must be
> > page-by-page. The target page table structure must have similar
> > properties to the MM page table - especially page by page
> > validate/invalidate. Meaning you cannot use dma_map_sg().
> 
> To me this is purely an optimization to make the driver page-table and
> hence the GPU TLB benefit from iommu coalescing / large pages and large
> driver PTEs.

This is a different topic. Leon is working on improving the DMA API to
get these kinds of benifits for HMM users. dma_map_sg is not the path
to get this. Leon's work should be significantly better in terms of
optimizing IOVA contiguity for a GPU use case. You can get a
guaranteed DMA contiguity at your choosen granual level, even up to
something like 512M.

> It is true that invalidation will sometimes shoot down
> large gpu ptes unnecessarily but it will not put any additional burden
> on the core AFAICT. 

In my experience people doing performance workloads don't enable the
IOMMU due to the high performance cost, so while optimizing iommu
coalescing is sort of interesting, it is not as important as using the
APIs properly and not harming the much more common situation when
there is no iommu and there is no artificial contiguity.

> on invalidation since zapping the gpu PTEs effectively stops any dma
> accesses. The dma mappings are rebuilt on the next gpu pagefault,
> which, as you mention, are considered slow anyway, but will probably
> still reuse the same prefault region, hence needing to rebuild the dma
> mappings anyway.

This is bad too. The DMA should not remain mapped after pages have
been freed, it completely destroys the concept of IOMMU enforced DMA
security and the ACPI notion of untrusted external devices.

> So as long as we are correct and do not adversely affect core mm, If
> the gpu performance (for whatever reason) is severely hampered if
> large gpu page-table-entries are not used, couldn't this be considered
> left to the driver?

Please use the APIs properly. We are trying to improve the DMA API to
better support HMM users, and doing unnecessary things like this in
drivers is only harmful to that kind of consolidation.

There is nothing stopping getting large GPU page table entries for
large CPU page table entries.

> And a related question. What about THP pages? OK to set up a single
> dma-mapping to those?

Yes, THP is still a page and dma_map_page() will map it.
 
> > > That's why finer-granularity mmu_interval notifiers might be
> > > beneficial
> > > (and then cached for future re-use of the same prefault range).
> > > This
> > > leads me to the next question:
> > 
> > It is not the design, please don't invent crazy special Intel things
> > on top of hmm_range_fault.
> 
> For the record, this is not a "crazy special Intel" invention. It's the
> way all GPU implementations do this so far.

"all GPU implementations" you mean AMD, and AMD predates alot of the
modern versions of this infrastructure IIRC.

> > Why would a prefetch have anything to do with a VMA? Ie your app
> > calls
> > malloc() and gets a little allocation out of a giant mmap() arena -
> > you want to prefault the entire arena? Does that really make any
> > sense?
> 
> Personally, no it doesn't. I'd rather use some sort of fixed-size
> chunk. But to rephrase, the question was more into the strong "drivers
> should not be aware of the cpu mm vma structures" comment. 

But this is essentially why - there is nothing useful the driver can
possibly learn from the CPU VMA to drive
hmm_range_fault(). hmm_range_fault already has to walk the VMA's if
someday something is actually needed it needs to be integrated in a
general way, not by having the driver touch vmas directly.

Jason
