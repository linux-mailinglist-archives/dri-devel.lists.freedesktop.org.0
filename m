Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AD880039A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 07:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EE310E7EE;
	Fri,  1 Dec 2023 06:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A6E10E7EA;
 Fri,  1 Dec 2023 06:13:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diyrqqvZ4FK4bOKXRHQZ9UxzcHlykqlxrAkkfxP12AFucD2dFLjK66SZlyPgxRPW/y0haHRlux+oEYKTgfuZb4ThnyVGI1+9P545kC2I0e4UDzDK3YmAdRZ1ELcbFbWxev4hw4FRuvVR+ESWxXVJhg7LDNzT785VsZ7RPt1DhLChWuv/L3Z3zG5sH64UzoCoGayrZHUI8bVIZTT03uHp6I8+ffHb5fwtoTxwKloGvTNMaFdJbuyi2R5z+sTtqSwxizb3Jg7mH8Sgx99DcAsxfXAr5lPOCj5aUhSPbE7tZvSeL16imzFa9XSJ/uQQ1yMXTmfni++nAPkTB4jp3qFGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UM2O85T1K3119DmNyhB61EOw3z9B3TlAzXxwVuvFRNg=;
 b=ZVWF8XD2r5gikqiCGZ8ZFpAZLOIkO7OCn/VMfSgf9F17D6yTUuJbISLuSzQDi8/WGV4kij0r2BvZxTcr8HmAEqNFLjT0JeptuNmhI8yIOvG18w7EkW5yM1dSKl5NUtNfX53wQpsJeydtXqlIY+j+UDBEU4ENpWjUX7YCzqx1Q43YK1GBVonVVoslCKXtaU5m9HLRdx5YD7TLn6I4hM5LCej7ltMdgIeTDLwcqPjQXHHv+YFHLW8vnqKa+8rwQPqmBWK0hLV+CVHlbXVXC+Cq+lVVveYkAE+KiTEKSBMhMf+aFOVQl5dzYMRexFMWLz/vx/Nd64sqtNyifZeBinVUQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UM2O85T1K3119DmNyhB61EOw3z9B3TlAzXxwVuvFRNg=;
 b=WF8fK52/j9pPXE8Om4yvt6CZXebXEemBeJCsoMJi6+FMbltD+ORMW/ssOC+cH/+mVTgNfeK3iUVfSXlr+IzYC1GOxuFx+CfNJNk5dTUla/2aoLAFkJw4WvsQEw3VdVHE09ZhAmoD5yBvmc+4tsJ6g3PHunKiS81lhK92K8GGMOmnKJfd/h0iJowjsPi7Q+rXDo0dgfd44wrrPb5w3yNdQ1vnkvQ3kA4tBXvaug8E7aqaWZVS8UAgXZML+Rzt1/S6bykznf9UGMYX55xl5m0KSDyei5FjuzEu6cfQXWQUEb6bdE368pEDq4we+W7hRc2My5dNj/V9Or4wXTZ47ZnizA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 06:13:53 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::b8a:1b58:1edf:90e6]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::b8a:1b58:1edf:90e6%7]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 06:13:52 +0000
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
 <56ec69e0-fee1-4edf-8839-62ba6a2f0183@amd.com>
 <SA1PR11MB69918A97B03BC578CFD15EBA9283A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <65c01257-b96d-4365-a86a-4d0758a8ec65@gmail.com>
 <cee6e5ba46f84557b0cd9122eaa8ae17@huawei.com>
 <SA1PR11MB6991E67DA37DAC8EDA9929CB9281A@SA1PR11MB6991.namprd11.prod.outlook.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
Date: Fri, 01 Dec 2023 17:11:50 +1100
In-reply-to: <SA1PR11MB6991E67DA37DAC8EDA9929CB9281A@SA1PR11MB6991.namprd11.prod.outlook.com>
Message-ID: <87a5quo3fm.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SYBPR01CA0110.ausprd01.prod.outlook.com
 (2603:10c6:10:1::26) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|CO6PR12MB5473:EE_
X-MS-Office365-Filtering-Correlation-Id: e30d3148-b7c9-469a-322f-08dbf234b0f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IBWhAukfJ/qklJEBNhkHvzJ/05+VRp1Q3s2SR/Q1tu2nDPdtInY+loA4ij1UMmgVykJcJuxHtTB/JmzC283pu9F4Z5UigLYXDwgDQdwwcs+SDiZRQ+bdodVAgz7EXYC0D/jVbvxEBiYhEbV/aG7vn6MNw3prvgJOYCsl0Z9xWrBWV0HcG6TPncyGbXxW6Bak0iNSHd0k7NcTW8HMgOCK3J0W5jiTUVkO56B4OvnL/cYwJl9+DqZlNLLur70VZW7jGX1YrfUhq9t4rMp8ldiZQdezVtf74AQgwZ6+kquE8bez0L8sbqmjR349iEzsKClLorfU4HEXmZI6S2K+1UcIXR+PMeF5CXCN07mVF2Xy2GVmHiTXMDQi1cvt+8nXEBPIjHn0dPEvNGMjvBIKQdj484lA/VWqy6ZmMLPOfr7xKr1y0Rkd8xqVvXcyDLhlYuJk05dJrJRESjCwrhIHAeu8ikZVVVIPhq15Hfc66302oNqy6FGeFBINBPoaqI4gWdvT8f2I/VIPVFKo4r8CfpqyUOf5HdRp3cBN7NYbZ+6rDDk/4Slw+Tq7Ae1sDTnNfuYL9bGctEqI6wqE0q+wvkiPZ8hHZNA8ag5dllwalpRilPhOETZJRDPhsRaYMrJAwOqoCNR39RhEtd3ISYxHZ6mW8DMV+H6zkJi/5/k4FzoH0js=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(64100799003)(186009)(66574015)(83380400001)(26005)(45080400002)(6486002)(966005)(478600001)(53546011)(9686003)(6512007)(6506007)(66556008)(8936002)(66476007)(66946007)(316002)(4326008)(54906003)(6916009)(8676002)(38100700002)(7416002)(5660300002)(30864003)(2906002)(86362001)(66899024)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTNNMjVZdWJCK2p0U3BVL3UvellBZTh5Y3JPOG1iemtRYmlzZkRRWkpZMHZV?=
 =?utf-8?B?N1lBbE13MnA4Y3lRM2ZzWWE1VmMwVFQ4NWRUOFRJUWIwNXlyM2NTTG9oWGZT?=
 =?utf-8?B?L1RPWVozVXZQdldhRXZVUmY2YmJEb0s0R2Yxa3Z5Zk9LNDRPSTQ1RnZycUx1?=
 =?utf-8?B?eTVCdXVwYnhvSnEwaFdDY0JSbmIwVFB6RGg3M3RDUmJ2QU1xVkdXNGsxOGtv?=
 =?utf-8?B?Yy9zOHIwN21XOUJjY3pFelFRVnpBSGZEbGMwaitFdGhPK1RCNDhLSzI3SGs0?=
 =?utf-8?B?TUpRYXNyNE8rcTJMSGpSOUJrdXNZVWw3UzN3VTF1Q2s5SjlaZXFiV0R3aith?=
 =?utf-8?B?VWZad0VTb3ZaT0w4V25CSUlGK29TT1N0Q0xWMkdHZEw4aU5pWEx1UUQ1cm01?=
 =?utf-8?B?ejZOZXQ5SjhmZVlOeFJrRmQzMWJvTE81cmxFaEhLVEVoYWhtcmxSei9xNzR5?=
 =?utf-8?B?YjFmREZmU1p3U2REeGRtS3lCL2VRQjBZUStPa0p4Z3NoNG1SYWdPN2g1WDFo?=
 =?utf-8?B?U1FFZFJQdzIvd1pUSHpoNWNhdTVGMEJMOFFPOFFjOFBkajJVTzhwTms3Wm9r?=
 =?utf-8?B?djFQajZLaHpQcjVFbFE2cDhWM1FmMDNTNTVpSkFncXF2NUpZdkJPZmY1WDBw?=
 =?utf-8?B?STFlakthVVJFZmh3N0xIY29YVG42SFcybkJlRFBHMklITHN6Y2VEdzNzU2tP?=
 =?utf-8?B?RCs4TmlQNzNPV0tRdHMvM0xJNkZNOEpmVmJvTjBUd2ZMZ203SExEUXFPVWlK?=
 =?utf-8?B?bEhMRC8xOENDRFQwS2xlUWp1TjJTWXJtL01abjZERmpyZEVBN2lGRXU5bVVV?=
 =?utf-8?B?WVZmRG1kRTh0RzlqUDZBelJJS1IrNTF3alZta2xSbHpCNzNhVmdRWVd1U2tj?=
 =?utf-8?B?UGNOcC9neUN2aERQVEphaS9sZm0yb0plcGgzWDBlTEdQeVhpc0F1Uml1Mnlu?=
 =?utf-8?B?ckFCWFozaGJkMTl5ZlJ3cXBBZE1teE9Zb2prMFRxZjBZMXcvQWJyekowcmZM?=
 =?utf-8?B?dWNtWnltcmV2QVl4VUNRcWJ0SHhZSG9JWXYrYldwSk9iRTZnS0w4L2s3a2VG?=
 =?utf-8?B?MENCYWd1VFNIcG1MblZNTlRKdFZURE5WWks2dzdiTTFDako4Z3ZsMkN0Uy9Q?=
 =?utf-8?B?SXRNcXNxc0ZVTHlTLzZza09qcFM2QytZeHQxbU1jUWdZYVhoMG1OZzduNVdo?=
 =?utf-8?B?ZTZlQ0dOTjVEaSt0cmg1RDRnSkxFQWdnZTZQQkdpMndTcE1JYkR6enhadFMy?=
 =?utf-8?B?eDJTZTBRUGxaaU5HblQ5WUJtY25RMlZMT3hWMmRqTVI3M2Z4S3UwOUJrOUIv?=
 =?utf-8?B?ZVBOaGRZT1N5dXFlcWxGR2ltTWJvdTI5ODdTY0hoZWp5V2dGdm11bTEwNVBo?=
 =?utf-8?B?ZW9SOVVoVTFjZEhOMU9oMmdVQVBkN1hVUWEzZGlEQWVMNWY5UEdzN2JVc0JB?=
 =?utf-8?B?UDVlN2llVmFlT0xQOFVGNExhbExsbmNTUjk0ZFlIa0JHdWhVSy9OSk9JVTJ5?=
 =?utf-8?B?Rys2amp6NUtZcjA1eUZtTmlialNKT1NzNEJwbW0xUHFGWmVJZ1hHMGZSNmRM?=
 =?utf-8?B?RGxYb3RVVGc0cWN5MUpkR0RFV3ZwMUtBWmEvU2lic0hzTUU2aW4wUk5DWXNX?=
 =?utf-8?B?MjFSZ0Ewa25BK0FiOWpyK2NoSEZEb0RENXM1K25JL3BRa0RTZHBiVGJUcFIw?=
 =?utf-8?B?YVgzb25ZajJxSGhxbjRZYmN2VEZHY0h6bXNOdnhTU1EzWVNSU0s5RGdIZHds?=
 =?utf-8?B?VW5QWWQvVmNHbTZOSjJNVG9NY2hLNW5kbjJxR3FaZVdiRms0RTVrekJEYSty?=
 =?utf-8?B?NFpiR1k0YmRMMHRYTU1iYUhSVGcvRUdrakV1K0xVTFRSL0JxYkM0K1ZHcUhm?=
 =?utf-8?B?OGh4K3dsUzcvS05LeTVaY1BZTlU0N1hxWUhYVUw1NG5HUklqTzBGOWdyekVv?=
 =?utf-8?B?elBDb1loRmRPbUpVQmF6enVZaXhISnltQ0Z3YWZMOVk5KzM2VWlJbnpPb1Qv?=
 =?utf-8?B?SXRPTEpJMkkzMzdEbHFDWjYrVGVTbVJWSlFlaEd6YjBkKy9RY1E4TThoaFJT?=
 =?utf-8?B?ZHdSVEJ4SmhXeElBN0s3S3gwTEMrUmFCaUlPZ1AvaVNScitWVFVQWGhvamd0?=
 =?utf-8?Q?1G0fslz547LPha6I5WAVrbYtJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30d3148-b7c9-469a-322f-08dbf234b0f5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 06:13:52.7261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfsTLq5PSAGvsKe+K4jBZuf8ogNJpEsPToDzYjAxPKdf9CWFeJtRIa3lNvvB3QGR4nTt47nSaIJE+0YEq/rJ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5473
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "leonro@nvidia.com" <leonro@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>, "mgorman@suse.de" <mgorman@suse.de>,
 "ziy@nvidia.com" <ziy@nvidia.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "weixi.zhu@openeuler.sh" <weixi.zhu@openeuler.sh>,
 Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "mhairgrove@nvidia.com" <mhairgrove@nvidia.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>, zhuweixi <weixi.zhu@huawei.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


"Zeng, Oak" <oak.zeng@intel.com> writes:

> See inline comments
>
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> zhuweixi
>> Sent: Thursday, November 30, 2023 5:48 AM
>> To: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>; Zeng, Oak
>> <oak.zeng@intel.com>; Christian K=C3=B6nig <christian.koenig@amd.com>; l=
inux-
>> mm@kvack.org; linux-kernel@vger.kernel.org; akpm@linux-foundation.org;
>> Danilo Krummrich <dakr@redhat.com>; Dave Airlie <airlied@redhat.com>; Da=
niel
>> Vetter <daniel@ffwll.ch>
>> Cc: tvrtko.ursulin@linux.intel.com; rcampbell@nvidia.com; apopple@nvidia=
.com;
>> ziy@nvidia.com; weixi.zhu@openeuler.sh; jhubbard@nvidia.com; intel-
>> gfx@lists.freedesktop.org; mhairgrove@nvidia.com; Wang, Zhi A
>> <zhi.a.wang@intel.com>; Xinhui.Pan@amd.com; amd-gfx@lists.freedesktop.or=
g;
>> jglisse@redhat.com; dri-devel@lists.freedesktop.org; jgg@nvidia.com; Viv=
i,
>> Rodrigo <rodrigo.vivi@intel.com>; alexander.deucher@amd.com;
>> Felix.Kuehling@amd.com; intel-gvt-dev@lists.freedesktop.org;
>> ogabbay@kernel.org; leonro@nvidia.com; mgorman@suse.de
>> Subject: RE: [RFC PATCH 0/6] Supporting GMEM (generalized memory
>> management) for external memory devices
>>=20
>> Glad to know that there is a common demand for a new syscall like hmadvi=
se(). I
>> expect it would also be useful for homogeneous NUMA cases. Credits to
>> cudaMemAdvise() API which brought this idea to GMEM's design.
>>=20
>> To answer @Oak's questions about GMEM vs. HMM,
>>=20
>> Here is the major difference:
>>   GMEM's main target is to stop drivers from reinventing MM code, while
>> HMM/MMU notifiers provide a compatible struct page solution and a
>> coordination mechanism for existing device driver MMs that requires addi=
ng
>> extra code to interact with CPU MM.
>>=20
>> A straightforward qualitative result for the main target: after integrat=
ing Huawei's
>> Ascend NPU driver with GMEM's interface, 30,000 lines of MM code were cu=
t,
>> leaving <100 lines invoking GMEM interface and 3,700 lines implementing =
vendor-
>> specific functions. Some code from the 3,700 lines should be further mov=
ed to
>> GMEM as a generalized feature like device memory oversubscription, but n=
ot
>> included in this RFC patch yet.
>>=20
>> A list of high-level differences:
>>   1. With HMM/MMU notifiers, drivers need to first implement a full MM
>> subsystem. With GMEM, drivers can reuse Linux's core MM.
>
> A full mm subsystem essentially has below functions:
>
> Physical memory management: neither your approach nor hmm-based
> solution provide device physical memory management. You mentioned you
> have a plan but at least for now driver need to mange device physical
> memory.
>
> Virtual address space management: both approach leverage linux core mm, v=
ma for this.
>
> Data eviction, migration: with hmm, driver need to implement this. It
> is not clear whether gmem has this function. I guess even gmem has it,
> it might be slow cpu data copy, compared to modern gpu's fast data
> copy engine.
>
> Device page table update, va-pa mapping: I think it is driver's responsib=
ility in both approach.
>
> So from the point of re-use core MM, I don't see big difference. Maybe
> you did it more elegantly. I think it is very possible with your
> approach driver can be simpler, less codes.
>
>>=20
>>   2. HMM encodes device mapping information in the CPU arch-dependent PT=
Es,
>> while GMEM proposes an abstraction layer in vm_object. Since GMEM's
>> approach further decouples the arch-related stuff, drivers do not need t=
o
>> implement separate code for X86/ARM and etc.
>
> I don't understand this...with hmm, when a virtual address range's
> backing store is in device memory, cpu pte is encoded to point to
> device memory. Device page table is also encoded to point to the same
> device memory location. But since device memory is not accessible to
> CPU (DEVICE_PRIVATE), so when cpu access this virtual address, there
> is a cpu page fault. Device mapping info is still in device page
> table, not in cpu ptes.
>
> I do not see with hmm why driver need to implement x86/arm
> code... driver only take cares of device page table. Hmm/core mm take
> care of cpu page table, right?

I see our replies have crossed, but that is my understanding as well.

>>=20
>>   3. MMU notifiers register hooks at certain core MM events, while GMEM
>> declares basic functions and internally invokes them. GMEM requires less=
 from
>> the driver side -- no need to understand what core MM behaves at certain=
 MMU
>> events. GMEM also expects fewer bugs than MMU notifiers: implementing ba=
sic
>> operations with standard declarations vs. implementing whatever random d=
evice
>> MM logic in MMU notifiers.
>
> This seems true to me. I feel the mmu notifier thing, especially the
> synchronization/lock design (those sequence numbers, interacting with
> driver lock, and the mmap lock) are very complicated. I indeed spent
> time to understand the specification documented in hmm.rst...

No argument there, but I think that's something we could look at
providing an improved interface for. I don't think it needs a whole new
subsystem to fix. Probably just a version of hmm_range_fault() that
takes the lock and sets up a MMU notifier itself.

I do think there is value in getting notified when core MM programs new
PTEs though as it would avoid expensive device faults. That's something
there is currently no way of doing.

> Your approach seems better.
>
>>=20
>>   4. GMEM plans to support a more lightweight physical memory management=
.
>> The discussion about this part can be found in my cover letter. The ques=
tion is
>> whether struct page should be compatible (directly use HMM's ZONE_DEVICE
>> solution) or a trimmed, smaller struct page that satisfies generalized d=
emands
>> from accelerators is more preferrable?
>>=20
>>   5. GMEM has been demonstrated to allow device memory oversubscription =
(a
>> GMEM-based 32GB NPU card can run a GPT model oversubscribing 500GB host
>> DDR), while drivers using HMM/MMU notifier must implement this logic one=
 by
>> one. I will submit this part in a future RFC patch.
>
> When device memory is oversubscribed, do you call a driver callback
> function to evict device memory to system memory? Or just cpu copy?
> Copy with device's fast copy engine is faster.
>
> I can see even though with both approach we need to implement a driver
> copy function, with your approach, the driver logic can be
> simplified. With today's drm/ttm, I do see the logic in the memory
> eviction area is very complicated. Those eviction fence (some call it
> suspend fence), dma-fence enable signalling....very complicated to me.
>
> Essentially evict device memory to system memory is nothing different
> from evict system memory to disk... so if your approach can leverage
> some linux core mm eviction logic, I do see it can simplify things
> here...
>
>>=20
>> I want to reiterate that GMEM's shared address space support is a bonus =
result,
>> not a main contribution... It was done because it was not difficult to i=
mplement
>> internal CPU-device coordination mechanism when core MM is extended by
>> GMEM to support devices.
>
> Besides memory eviction/oversubscription, there are a few other pain poin=
ts when I use hmm:
>
> 1) hmm doesn't support file-back memory, so it is hard to share memory
> b/t process in a gpu environment. You mentioned you have a plan... How
> hard is it to support file-backed in your approach?
> 2)virtual address range based memory attribute/hint: with hmadvise,
> where do you save the memory attribute of a virtual address range? Do
> you need to extend vm_area_struct to save it? With hmm, we have to
> maintain such information at driver. This ends up with pretty
> complicated logic to split/merge those address range. I know core mm
> has similar logic to split/merge vma...
>
> Oak
>
>
>>=20
>> -Weixi
>>=20
>> -----Original Message-----
>> From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
>> Sent: Thursday, November 30, 2023 4:28 PM
>> To: Zeng, Oak <oak.zeng@intel.com>; Christian K=C3=B6nig
>> <christian.koenig@amd.com>; zhuweixi <weixi.zhu@huawei.com>; linux-
>> mm@kvack.org; linux-kernel@vger.kernel.org; akpm@linux-foundation.org;
>> Danilo Krummrich <dakr@redhat.com>; Dave Airlie <airlied@redhat.com>; Da=
niel
>> Vetter <daniel@ffwll.ch>
>> Cc: intel-gvt-dev@lists.freedesktop.org; rcampbell@nvidia.com;
>> mhairgrove@nvidia.com; jgg@nvidia.com; weixi.zhu@openeuler.sh;
>> jhubbard@nvidia.com; intel-gfx@lists.freedesktop.org; apopple@nvidia.com=
;
>> Xinhui.Pan@amd.com; amd-gfx@lists.freedesktop.org;
>> tvrtko.ursulin@linux.intel.com; ogabbay@kernel.org; jglisse@redhat.com; =
dri-
>> devel@lists.freedesktop.org; ziy@nvidia.com; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>; alexander.deucher@amd.com; leonro@nvidia.com;
>> Felix.Kuehling@amd.com; Wang, Zhi A <zhi.a.wang@intel.com>;
>> mgorman@suse.de
>> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
>> management) for external memory devices
>>=20
>> Hi Oak,
>>=20
>> yeah, #4 is indeed a really good point and I think Felix will agree to t=
hat as well.
>>=20
>> HMM is basically still missing a way to advise device attributes for the=
 CPU
>> address space. Both migration strategy as well as device specific inform=
ation (like
>> cache preferences) fall into this category.
>>=20
>> Since there is a device specific component in those attributes as well I=
 think
>> device specific IOCTLs still make sense to update them, but HMM should o=
ffer
>> the functionality to manage and store those information.
>>=20
>> Split and merge of VMAs only become a problem if you attach those inform=
ation
>> to VMAs, if you keep them completely separate than that doesn't become a=
n
>> issue either. The down side of this approach is that you don't get autom=
atically
>> extending attribute ranges for growing VMAs for example.
>>=20
>> Regards,
>> Christian.
>>=20
>> Am 29.11.23 um 23:23 schrieb Zeng, Oak:
>> > Hi Weixi,
>> >
>> > Even though Christian has listed reasons rejecting this proposal (yes =
they are
>> very reasonable to me), I would open my mind and further explore the pos=
sibility
>> here. Since the current GPU driver uses a hmm based implementation (AMD =
and
>> NV has done this; At Intel we are catching up), I want to explore how mu=
ch we
>> can benefit from the proposed approach and how your approach can solve s=
ome
>> pain points of our development. So basically what I am questioning here =
is: what
>> is the advantage of your approach against hmm.
>> >
>> > To implement a UVM (unified virtual address space b/t cpu and gpu devi=
ce),
>> with hmm, driver essentially need to implement below functions:
>> >
>> > 1. device page table update. Your approach requires the same because
>> > this is device specific codes
>> >
>> > 2. Some migration functions to migrate memory b/t system memory and GP=
U
>> local memory. My understanding is, even though you generalized this a bi=
t, such
>> as modified cpu page fault path, provided "general" gm_dev_fault handler=
... but
>> device driver still need to provide migration functions because migratio=
n
>> functions have to be device specific (i.e., using device dma/copy engine=
 for
>> performance purpose). Right?
>> >
>> > 3. GPU physical memory management, this part is now in drm/buddy, shar=
ed
>> by all drivers. I think with your approach, driver still need to provide=
 callback
>> functions to allocate/free physical pages. Right? Or do you let linux co=
re mm
>> buddy manage device memory directly?
>> >
>> > 4. madvise/hints/virtual address range management. This has been pain =
point
>> for us. Right now device driver has to maintain certain virtual address =
range data
>> structure to maintain hints and other virtual address range based memory
>> attributes. Driver need to sync with linux vma. Driver need to explicitl=
y deal with
>> range split/merging... HMM doesn't provide support in this area. Your ap=
proach
>> seems cleaner/simpler to me...
>> >
>> >
>> > So in above, I have examined the some key factors of a gpu UVM memory
>> manager. I think for #1 and #2, hmm has provide pretty good abstraction/=
tools
>> for address space mirroring and migration helpers. For #3, since we have=
 a
>> common drm/buddy layer, I don't think it is a big problem for driver wri=
ter now.
>> >
>> > I do see #4 is something you solved more beautifully, requires new sys=
tem call
>> though.
>> >
>> > Oak
>> >
>> >
>> >> -----Original Message-----
>> >> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
>> >> Of Christian K=C3=B6nig
>> >> Sent: Tuesday, November 28, 2023 8:09 AM
>> >> To: Weixi Zhu <weixi.zhu@huawei.com>; linux-mm@kvack.org; linux-
>> >> kernel@vger.kernel.org; akpm@linux-foundation.org; Danilo Krummrich
>> >> <dakr@redhat.com>; Dave Airlie <airlied@redhat.com>; Daniel Vetter
>> >> <daniel@ffwll.ch>
>> >> Cc: dri-devel@lists.freedesktop.org; leonro@nvidia.com;
>> >> apopple@nvidia.com; amd-gfx@lists.freedesktop.org; mgorman@suse.de;
>> >> ziy@nvidia.com; Wang, Zhi A <zhi.a.wang@intel.com>;
>> >> rcampbell@nvidia.com; jgg@nvidia.com; weixi.zhu@openeuler.sh;
>> >> jhubbard@nvidia.com; intel-gfx@lists.freedesktop.org;
>> >> mhairgrove@nvidia.com; jglisse@redhat.com; Vivi, Rodrigo
>> >> <rodrigo.vivi@intel.com>; intel-gvt-dev@lists.freedesktop.org;
>> >> tvrtko.ursulin@linux.intel.com; Felix.Kuehling@amd.com;
>> >> Xinhui.Pan@amd.com; alexander.deucher@amd.com; ogabbay@kernel.org
>> >> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
>> >> management) for external memory devices
>> >>
>> >> Adding a few missing important people to the explicit to list.
>> >>
>> >> Am 28.11.23 um 13:50 schrieb Weixi Zhu:
>> >>> The problem:
>> >>>
>> >>> Accelerator driver developers are forced to reinvent external MM
>> >>> subsystems case by case, because Linux core MM only considers host
>> memory resources.
>> >>> These reinvented MM subsystems have similar orders of magnitude of
>> >>> LoC as Linux MM (80K), e.g. Nvidia-UVM has 70K, AMD GPU has 14K and
>> >>> Huawei NPU
>> >> has
>> >>> 30K. Meanwhile, more and more vendors are implementing their own
>> >>> accelerators, e.g. Microsoft's Maia 100. At the same time,
>> >>> application-level developers suffer from poor programmability --
>> >>> they must consider parallel address spaces and be careful about the
>> >>> limited device DRAM capacity. This can be alleviated if a
>> >>> malloc()-ed virtual address can be shared by the accelerator, or the
>> >>> abundant host DRAM can further transparently backup the device local
>> memory.
>> >>>
>> >>> These external MM systems share similar mechanisms except for the
>> >>> hardware-dependent part, so reinventing them is effectively
>> >>> introducing redundant code (14K~70K for each case). Such
>> >>> developing/maintaining is not cheap. Furthermore, to share a
>> >>> malloc()-ed virtual address, device drivers need to deeply interact
>> >>> with Linux MM via low-level MM APIs, e.g. MMU notifiers/HMM. This
>> >>> raises the bar for driver development, since developers must
>> >>> understand how Linux MM works. Further, it creates code maintenance
>> >>> problems -- any changes to Linux MM potentially require coordinated
>> changes to accelerator drivers using low-level MM APIs.
>> >>>
>> >>> Putting a cache-coherent bus between host and device will not make
>> >>> these external MM subsystems disappear. For example, a
>> >>> throughput-oriented accelerator will not tolerate executing heavy
>> >>> memory access workload with a host MMU/IOMMU via a remote bus.
>> >>> Therefore, devices will still have their own MMU and pick a simpler
>> >>> page table format for lower address translation overhead, requiring =
external
>> MM subsystems.
>> >>>
>> >>> --------------------
>> >>>
>> >>> What GMEM (Generalized Memory Management [1]) does:
>> >>>
>> >>> GMEM extends Linux MM to share its machine-independent MM code. Only
>> >>> high-level interface is provided for device drivers. This prevents
>> >>> accelerator drivers from reinventing the wheel, but relies on
>> >>> drivers to implement their hardware-dependent functions declared by
>> >>> GMEM. GMEM's
>> >> key
>> >>> interface include gm_dev_create(), gm_as_create(), gm_as_attach()
>> >>> and gm_dev_register_physmem(). Here briefly describe how a device
>> >>> driver utilizes them:
>> >>> 1. At boot time, call gm_dev_create() and registers the implementati=
on of
>> >>>      hardware-dependent functions as declared in struct gm_mmu.
>> >>>        - If the device has local DRAM, call gm_dev_register_physmem(=
) to
>> >>>          register available physical addresses.
>> >>> 2. When a device context is initialized (e.g. triggered by ioctl), c=
heck if
>> >>>      the current CPU process has been attached to a gmem address spa=
ce
>> >>>      (struct gm_as). If not, call gm_as_create() and point current->=
mm->gm_as
>> >>>      to it.
>> >>> 3. Call gm_as_attach() to attach the device context to a gmem addres=
s space.
>> >>> 4. Invoke gm_dev_fault() to resolve a page fault or prepare data bef=
ore
>> >>>      device computation happens.
>> >>>
>> >>> GMEM has changed the following assumptions in Linux MM:
>> >>>     1. An mm_struct not only handle a single CPU context, but may al=
so handle
>> >>>        external memory contexts encapsulated as gm_context listed in
>> >>>        mm->gm_as. An external memory context can include a few or al=
l of the
>> >>>        following parts: an external MMU (that requires TLB invalidat=
ion), an
>> >>>        external page table (that requires PTE manipulation) and exte=
rnal DRAM
>> >>>        (that requires physical memory management).
>> >>>     2. Faulting a MAP_PRIVATE VMA with no CPU PTE found does not
>> necessarily
>> >>>        mean that a zero-filled physical page should be mapped. The v=
irtual
>> >>>        page may have been mapped to an external memory device.
>> >>>     3. Unmapping a page may include sending device TLB invalidation =
(even if
>> >>>        its MMU shares CPU page table) and manipulating device PTEs.
>> >>>
>> >>> --------------------
>> >>>
>> >>> Semantics of new syscalls:
>> >>>
>> >>> 1. mmap(..., MAP_PRIVATE | MAP_PEER_SHARED)
>> >>>       Allocate virtual address that is shared between the CPU and al=
l
>> >>>       attached devices. Data is guaranteed to be coherent whenever t=
he
>> >>>       address is accessed by either CPU or any attached device. If t=
he device
>> >>>       does not support page fault, then device driver is responsible=
 for
>> >>>       faulting memory before data gets accessed. By default, the CPU=
 DRAM is
>> >>>       can be used as a swap backup for the device local memory.
>> >>> 2. hmadvise(NUMA_id, va_start, size, memory_hint)
>> >>>       Issuing memory hint for a given VMA. This extends traditional =
madvise()
>> >>>       syscall with an extra argument so that programmers have better=
 control
>> >>>       with heterogeneous devices registered as NUMA nodes. One
>> >>> useful
>> >> memory
>> >>>       hint could be MADV_PREFETCH, which guarantees that the physica=
l data
>> of
>> >>>       the given VMA [VA, VA+size) is migrated to NUMA node #id. Anot=
her
>> >>>       useful memory hint is MADV_DONTNEED. This is helpful to increa=
se
>> device
>> >>>       memory utilization. It is worth considering extending the exis=
ting
>> >>>       madvise() syscall with one additional argument.
>> >>>
>> >>> --------------------
>> >>>
>> >>> Implementation details
>> >>>
>> >>> 1. New VMA flag: MAP_PEER_SHARED
>> >>>
>> >>> This new flag helps isolate GMEM feature, so that common processes
>> >>> with no device attached does not need to maintain any logical page
>> >>> table. It can be deleted if the extra overhead from GMEM is acceptab=
le.
>> >>>
>> >>> 2. MMU functions
>> >>> The device driver must implement the MMU functions declared in
>> >>> struct gm_mmu.
>> >>>
>> >>> VA functions: peer_va_alloc_fixed(), peer_va_free()
>> >>>
>> >>> They are used to negotiate a common available VMA between a host
>> >>> process and a device process at the mmap() time. This is because
>> >>> some accelerators like Intel Xeon Phi or Huawei's Ascend NPU have
>> >>> their acceleration tasks executed within a device CPU process
>> >>> context. Some accelerators may also choose a different format of
>> >>> virtual address space.
>> >>>
>> >>> PA functions: alloc_page(), free_page(), prepare_page()
>> >>>
>> >>> Alloc_page() and free_page() are used to allocate and free device
>> >>> physical pages. Prepare_page() is used to zero-fill or DMA the data
>> >>> of a physical page. These functions were removed from the submitted
>> >>> patch, since GMEM does not need to invoke them when testing Huawei's
>> >>> NPU accelerator. The
>> >> NPU
>> >>> accelerator has an OS running in the device that manages the device
>> >>> physical memory. However, even for such a device it is better for
>> >>> the host to directly manage device physical memory, which saves
>> >>> device HBM and avoids synchronizing management status between the ho=
st
>> and device.
>> >>>
>> >>> Page-table functions:
>> >>> pmap_create()/destroy()/enter()/release()/protect()
>> >>>
>> >>> They are used to create and destroy device page tables, install and
>> >>> uninstall page table entries and to change the protection of page
>> >>> table entries.
>> >>>
>> >>> TLB-invalidation functions: tlb_invl(), tlb_invl_coalesced()
>> >>>
>> >>> They are used to invalidate the TLB entries of a given range of VA
>> >>> or invalidate a given list of VMAs.
>> >>>
>> >>> Wrapper functions: peer_map() and peer_unmap()
>> >>>
>> >>> These two functions are used to create or destroy a device mapping
>> >>> which could include allocating physical memory and copying data.
>> >>> They effectively wraps the PA functions, Page-table functions and
>> >>> TLB-invalidation functions. Implementing these steps together allows
>> >>> devices to optimize the communication cost between host and device.
>> >>> However, it requires the device driver to correctly order these step=
s.
>> >>>
>> >>> 3. Tracking logical mappings:
>> >>>
>> >>> Each process starts maintaining an xarray in
>> >>> mm->vm_obj->logical_page_table at the first time a host process
>> >>> calls mmap(MAP_PRIVATE |
>> >> MAP_PEER_SHARED).
>> >>> When a virtual page gets touched, its mapping status is created and
>> >>> stored in struct gm_mapping. The logical page table is utilized to
>> >>> query the struct gm_mapping given a virtual address. GMEM extends
>> >>> Linux MM to
>> >> update
>> >>> and lookup these logical mappings. For example, in the patch set we
>> >>> modify the page fault path of to additionally check the logical
>> >>> mapping of MAP_PEER_SHARED VMAs and identify if a device page should
>> be migrated.
>> >>> Similarly, if the device driver wants to resolve a device page fault
>> >>> or prefetch data, the driver should call gm_dev_fault(). This
>> >>> function examines the mapping status and determines whether the
>> >>> device driver should migrate a CPU page to device or install a zero-=
filled
>> device page.
>> >>>
>> >>> The logical mapping abstraction enhances the extensibility of Linux
>> >>> core MM (a virtual page may be mapped to a device physical page
>> >>> without any CPU PTE installed). The current implementation is not
>> >>> complete, since it only focused on anonymous VMAs with
>> >>> MAP_PEER_SHARED flag. The future plan of logical page table is to
>> >>> provide a generic abstraction layer that support common anonymous
>> >>> memory (I am looking at you, transparent huge pages)
>> >> and
>> >>> file-backed memory.
>> >>>
>> >>> --------------------
>> >>>
>> >>> Use cases
>> >>>
>> >>> GMEM has been tested over Huawei's NPU (neural process unit) device
>> driver.
>> >>> The original NPU device driver has approximately 30,000 lines of
>> >>> code for memory management. On the contrary, the GMEM-based one has
>> >>> less than 30 lines of code calling GMEM API, with approximately
>> >>> 3,700 lines of code implementing the MMU functions. This effectively
>> >>> saves over 26,200 lines of MM code for one driver. Therefore,
>> >>> developers from accelerator vendors, including Nvidia, AMD, Intel
>> >>> and other companies are welcome to discuss if GMEM could be helpful.
>> >>>
>> >>> Using GMEM-based driver, it is possible to write a C-style
>> >>> accelerator code with malloc(), whose underlying mmap() syscall
>> >>> should include MAP_PEER_SHARED according to current GMEM
>> >>> implementation. Importantly,
>> >> GMEM
>> >>> guarantees a coherent view of memory between the host and all
>> >>> attached devices. This means that any data written by the CPU or any
>> >>> attached accelerator can be seen by the next memory load instruction
>> >>> issued by any attached accelerator or the CPU. Furthermore, the NPU
>> >>> device was able to oversubscribe memory by swapping memory to host
>> >>> DDR. Note that this
>> >> memory
>> >>> oversubscription mechanism can be universal if the physical memory
>> >>> management is provided by GMEM. Other potential use cases of GMEM
>> >>> could include the IOMMU driver, KVM and RDMA drivers, as long as the
>> >>> device needs to manage external memory resources like VMAs, MMUs or
>> local DRAMs.
>> >>>
>> >>> --------------------
>> >>>
>> >>> Discussion
>> >>>
>> >>> Physical memory management
>> >>> Most accelerators require the host OS to manage device DRAM. Even
>> >>> accelerators capable of running an OS inside the driver can benefit
>> >>> from it, since it helps avoid synchronizing management status
>> >>> between the host and device. In Linux OSS EU summit 2023, Hannes
>> >>> Reinecke from SUSE Labs suggested that people are concerned with the
>> >>> memory consumption of struct page (which considers all generic
>> >>> scenarios for the kernel). This leads to a possible solution that,
>> >>> instead of reusing Linux struct page and ZONE_DEVICE mechanism, GMEM
>> >>> can implement an isolated buddy allocator
>> >> for
>> >>> the device to instantiate and register. The isolation is useful
>> >>> because device DRAM physical address space is independent.
>> >>> Furthermore, the isolated buddy allocator can utilize a customized
>> >>> struct page that consumes less memory. It is worth discussing if
>> >>> accelerator vendors desire this solution.
>> >>>
>> >>> MMU functions
>> >>> The MMU functions peer_map() and peer_unmap() overlap other
>> >>> functions, leaving a question if the MMU functions should be
>> >>> decoupled as more basic operations. Decoupling them could
>> >>> potentially prevent device drivers coalescing these basic steps
>> >>> within a single host-device communication operation, while coupling
>> >>> them makes it more difficult for device drivers to utilize GMEM inte=
rface.
>> >>>
>> >>> The idea of GMEM was originated from Weixi's PhD study with Prof.
>> >>> Scott Rixner and Prof. Alan L. Cox at Rice University.
>> >>>
>> >>> [1] https://arxiv.org/abs/2310.12554.
>> >>>
>> >>> Weixi Zhu (6):
>> >>>     mm/gmem: add heterogeneous NUMA node
>> >>>     mm/gmem: add arch-independent abstraction to track address mappi=
ng
>> >>>       status
>> >>>     mm/gmem: add GMEM (Generalized Memory Management) interface for
>> >>>       external accelerators
>> >>>     mm/gmem: add new syscall hmadvise() to issue memory hints for
>> >>>       heterogeneous NUMA nodes
>> >>>     mm/gmem: resolve VMA conflicts for attached peer devices
>> >>>     mm/gmem: extending Linux core MM to support unified virtual addr=
ess
>> >>>       space
>> >>>
>> >>>    arch/arm64/include/asm/unistd.h         |   2 +-
>> >>>    arch/arm64/include/asm/unistd32.h       |   2 +
>> >>>    drivers/base/node.c                     |   6 +
>> >>>    fs/proc/task_mmu.c                      |   3 +
>> >>>    include/linux/gmem.h                    | 368 ++++++++++++
>> >>>    include/linux/mm.h                      |   8 +
>> >>>    include/linux/mm_types.h                |   5 +
>> >>>    include/linux/nodemask.h                |  10 +
>> >>>    include/uapi/asm-generic/mman-common.h  |   4 +
>> >>>    include/uapi/asm-generic/unistd.h       |   5 +-
>> >>>    init/main.c                             |   2 +
>> >>>    kernel/fork.c                           |   5 +
>> >>>    kernel/sys_ni.c                         |   2 +
>> >>>    mm/Kconfig                              |  14 +
>> >>>    mm/Makefile                             |   1 +
>> >>>    mm/gmem.c                               | 746 +++++++++++++++++++=
+++++
>> >>>    mm/huge_memory.c                        |  85 ++-
>> >>>    mm/memory.c                             |  42 +-
>> >>>    mm/mempolicy.c                          |   4 +
>> >>>    mm/mmap.c                               |  40 +-
>> >>>    mm/oom_kill.c                           |   2 +
>> >>>    mm/page_alloc.c                         |   3 +
>> >>>    mm/vm_object.c                          | 309 ++++++++++
>> >>>    tools/include/uapi/asm-generic/unistd.h |   5 +-
>> >>>    24 files changed, 1654 insertions(+), 19 deletions(-)
>> >>>    create mode 100644 include/linux/gmem.h
>> >>>    create mode 100644 mm/gmem.c
>> >>>    create mode 100644 mm/vm_object.c
>> >>>

