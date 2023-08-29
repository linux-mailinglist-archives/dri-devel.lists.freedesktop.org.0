Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968B478CC35
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 20:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F6710E47B;
	Tue, 29 Aug 2023 18:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25F410E47B;
 Tue, 29 Aug 2023 18:35:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Njg/uyuvQXDOUzv+6dW3Gnsw8w6fEFoQEGWSd/Ji9gvV0XBj3f5v9YRPLoVxD5m7MR7aVokhMx3OTd2uhhYoPtz41rNUfuss/G1+hNW5tI8kAXcbvf9hnlVycAIn+BYxFzqF9aY9qp/Qf7idDCIQSmi//oLPCIZ4UeoGxwzqZ1AsGsXcfY2HQ+cHHftODQLroC+C8eSJCDwktreGS3XOyMOMZTecMbzc8yffa/uLQZihrwdg1ejbSWZMpuULAZqLKRZzpfDykdF8rSAtzjFQTdatPHzeC4v2FWh7Y8jXva+zYRODgRXh336hM/cbwVVdEcTpn2s7Z4CSojx8nwzhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyFCg1QfDGSymk8q70uiRVAA2LCbqjTjHAobTlJyheE=;
 b=XsK2SEhIZa1aSWCmZlb+Zjg26BKSzCipsSvW4g/6dLJ+yyVEuIc7M28vz+ZEzjgOSU7jxObI2kj+GdawMlVEKU1yfzFGVZKztggrxnTpUgJsJwa9Q6EiJ8iZcVnKlAXwjt0mFfIVHPd5p5Fsu15zdeInrsEjfCr7WFVqpJ9tkatrkE8GjhaMigPwz3qbigcClry3XizSkS4WjvWSPHZZX8++ZoaMgNhknDsKkde715E7wfFrdQ3Qfxv2pZOnx+Zk0kEiakfEluQ44aiXmbjF9jL2kmzDc02FITUTvIRkm7v3HJsFdeOlbkleB3p1rKmPNyoPsDq3V2k9O5t0g7uaYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyFCg1QfDGSymk8q70uiRVAA2LCbqjTjHAobTlJyheE=;
 b=wXD6LxhPoNeEjr1EtdA3eBQAbijlelkLj/jg/cBNfle0pdYmjms+424HXPWhwH8uKniwdwPzcYWkPBWIXcdnd2HJzO65yrk2Hrxlw1s8lL8x9sn+C5ZDJi31eZ7MYGWdiQnojAkMAm0Az89fZFuehikpSx17dMA0WC8cs3vlTF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by MN2PR12MB4286.namprd12.prod.outlook.com (2603:10b6:208:199::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 18:35:38 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::ae93:e5c5:41f7:bf08]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::ae93:e5c5:41f7:bf08%7]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 18:35:38 +0000
Message-ID: <f18bb070-9767-3b5c-8a40-3c95d5740e1d@amd.com>
Date: Tue, 29 Aug 2023 14:35:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/4] drm: Use XArray instead of IDR for minors
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-2-michal.winiarski@intel.com>
 <10bb9689-9226-d47c-4cf1-7bf9d599456c@amd.com>
 <6qcxpntlr36itieyoyebsncwdv4vadr5ac7imgl4rdemoyedvp@a3m7l32pkcnf>
 <bcbfe6d5-da87-fa2b-c05a-8bea6e0004fb@amd.com>
 <ZO459g+fCBxbwTAF@casper.infradead.org>
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <ZO459g+fCBxbwTAF@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::25) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|MN2PR12MB4286:EE_
X-MS-Office365-Filtering-Correlation-Id: d8184bb9-55a5-4e4e-4100-08dba8bebd98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HJ6VahJ063YKsxCpcpq4unmSDGmpxso068yyiM+xducgQw04Smijnt4zUD0ZNxAiSlBeQxtO1STZCaFE1hQsDXGyd/GEkp9+qD09VQ0K2KayMyY5p8DoY9++3ybkTt56s45tT9QPKYKsTi6h1+unFvH0zUw+AkMHXFFwFhvqkUcRIZL8kT9whF2rA+36Uf16vSfsVADqFMBgqxgXFBZpGX4PIeRlN+mnQPNSyPosk/vKcRqRE8PHT8KTGi0j7hUxUX09y8YbSE8rPk/WdUV5Qkl69QLD1lXXOh8F+yftpBcp23C0YEDKELrxtNqygdJPOsRiz7VQGO+k1wgXE+sma/sa5vPCGVvD3rO+9bs6SLtBUhxD4FYHlnnM3FXc6dKag/y8n8aYhYaYxVARaUuppC8z6zlXLHnqTrG8nB13OGlbH94zbNpRQnsbibSjlhLQRGQyCU+tT7fOduOBHpGvRcziqJPVyvf4XKWSdgvfxUFpFz/4jSKvvXBwIxv3/YZtKOV8tP/KwCy8rCL6rdUI4yrjLuKmbTLqw9cLOtDKyfXw/tKDk4rJxIiXei3MtzvNscSbw3wp4Cybwry7uCkXokuqJ6Mt1D13dYpxwtOlP5KQnkl2+t2tfTebSxehDuKZKb2PD1CN0z6HxzG0hqVKeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(1800799009)(186009)(451199024)(8936002)(6666004)(31686004)(478600001)(53546011)(6506007)(36916002)(66556008)(54906003)(66946007)(6486002)(66476007)(6916009)(316002)(38100700002)(41300700001)(6512007)(36756003)(26005)(8676002)(5660300002)(31696002)(4744005)(2616005)(2906002)(7416002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVdnMnJCNS9Qb3MvSTh1eFUvVmpaVFJaOStZcjhnT2wrTHlDYzh2NXZPLzNT?=
 =?utf-8?B?THYyU2pWc3kxdGM2NXFUQXlqVVZaTlljVUVCUW9iTURoNVVnZTlxRy82SFk0?=
 =?utf-8?B?WkFMMFh3dnR0ZmMwakd0ajY2d295ZkxQUnNsZk5RWlM0a0NoTTlxMGh3emNT?=
 =?utf-8?B?SVJWNmdwVnhZQ1E0cXJvc05DS2RiVXZtSCtJa2ZwZmRSbkt0cVhNejl3LzdX?=
 =?utf-8?B?MXNCQjNDYm14Y2daeml1SjNSTzdRM0JGdXJ1YVdkeWJhekVvdkZkek9yaUlN?=
 =?utf-8?B?K0daQlJVazBGa041OEsxazY3RHdmUXVvbVhFcDRUaTE3Mk1GVFR1N3NDNUVW?=
 =?utf-8?B?eFp4eTlYeEttemhSNXZHVnY2b28wSkxMVDRKOS9kMU0xL3Q2eVk0Snd6Tmlr?=
 =?utf-8?B?VzF4UDVWem16WUZ6K1FZTzlIUkpRdVN5dE43RlM0MjJnZWNDbUE4UHRyS1Ex?=
 =?utf-8?B?aXhSR0dVbml2TTNmVTRMSHY5YVlCaTJGSUtwckFqd3JVSFMrei9Cdjdhc0pU?=
 =?utf-8?B?ODlSL2pWRk9IbXFZWldHRWsrZ0tHS3ptcnZBZFZJOGNhUjVCdENXWktpRCsv?=
 =?utf-8?B?c0RoNS9JNGNrMkZqcG5ubDYwQU92U3VVS2tJME1FZmJzZlE1WUE1OVI5UlJj?=
 =?utf-8?B?enZWV2xhQk9zREdhM1BZL1RVNnU1UnloUWIwY0hPUWlYdnVIRkNYZTlvMml6?=
 =?utf-8?B?ZEVHaU8zU2xUZWhvb0hoaUxrbVlMZDlHTXFGTEtJVlBGN3FTbndZTGdDUUx0?=
 =?utf-8?B?MWYxT2pQcitZRUpMZ3krczhpUEU4TUQ2cUw5NmwwM3lMTzNFK01zVnJhQXJV?=
 =?utf-8?B?VnVZNzIydzVMRnRmU0k3eHdpZmVXeWRyWVdwejdNWTN6T0YvUjU0ajZmMnR0?=
 =?utf-8?B?bzRmSXNJS1NpRCtydjQrc3hYbnJvUndyOEVCdlZ4UHBuZGlNbkdGTUNBRno1?=
 =?utf-8?B?ejZkSEM0V1VVOXM3U050dHFKZ2hzd0phWWp1b2FSL1BSYUlvWk5tRVNIRmZs?=
 =?utf-8?B?MjBzSmY1ZHNnOEdTeWVxYVgyRjlPbFJPMnNKWHhSeXBMb2Z0Z0FCU3lFM1Bj?=
 =?utf-8?B?SE4vbVhidm8zYTBLQTQ4OHpESXY1aGVYSlMxVUpaTE9HbGVwRHFSNzY1d2dq?=
 =?utf-8?B?RzVPR2EzMWlpSzZkMWF2aHYya2ZzTFZmOGFVVDJIY0JBQndpSUtKRzBQTjVj?=
 =?utf-8?B?R1pQbC9YODRmbnlxOFRvRldhR256QkVMSEVuUDRrQWx5cVhSN05ZNXhOTEta?=
 =?utf-8?B?b3RQSjFyK2pVV3F1RSsrODE0UXd0c3J4Mlc0M3A0dWYxVWpRK3hLYWYyNG1G?=
 =?utf-8?B?L0xnVXQwMm1JMzc2dnVxVXBiOGV0UmxISzJkdVNDbitHWlJRMUhrbTUvaVBO?=
 =?utf-8?B?bGgza0lwUWhvWFVwMWRJK3dUdmlnS1ZxK3NrM3o1eVl0R0E4SjNQTSsyK0p6?=
 =?utf-8?B?ejhwUUlWaW5IRnFXaVF1STQwdldvOEwraFJSVWNJUGhzYk1yTUlsUDBuckZ1?=
 =?utf-8?B?N3d5MzQ4TU4va2ZXVXdpQ3VUSnBwcDZ4MEZ2MnZ3dm4vOWtCRTZQcHp4di9w?=
 =?utf-8?B?QytuSUdiWThvc0R2ZmdNMi9HVlFTNnZEUjdsNzBma0V4YmdxTkM4MVIvUklj?=
 =?utf-8?B?Rm5IZU5relUrWTBnMWJyd2xsN2hka1cwUWExRWFsM3ZIK0xvSXE5YzJkU2Zj?=
 =?utf-8?B?VjJ6WldwVnhBRW4raXRpSEVRUnY2eG1GRlZFaG5uSTFnb2hHVFJBRDFMUnkz?=
 =?utf-8?B?SzhnY0ljUWNTMWVHTTh5cVF0R1k1MVdpcjBOdVhSdlhBblhBa05mMjJsbUVE?=
 =?utf-8?B?OHJjQzd5YS91cG1jTzRTWmcwYytvQ1U1VDVlRXM3WGpqMm5RR01sVm1IbHZE?=
 =?utf-8?B?Mkt0N0ZGQWY3d25NRTFHME95Y2U0YUY4dm96cnpSMU9leXZQdUdRZEl5MEpn?=
 =?utf-8?B?M2dXc1pFbTBLdmREem9TRUhqTW8zalhNVnlRcHBkRURKWG5IRkpSaitub0tH?=
 =?utf-8?B?enVEWTczUGlyMEREZWtqR3ZIem1nTWRORzNnTDRGK0xvcllFZTByNDFrU2wx?=
 =?utf-8?B?QjYwUnZpaDRXYTNKNjFXNlYrdjl6bng3YWdwZlJ6QnYyUFJ2TWFKYWZPNHlG?=
 =?utf-8?Q?qPc3Oe3c3eSQ9TIay5+Jy1gqV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8184bb9-55a5-4e4e-4100-08dba8bebd98
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 18:35:38.3613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMpXLYpPJHrk9I0+ZYP84Bz6IUo/dSqWo8kVJBJcpXNLk0rG/dM419n+ejDHMXWp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4286
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
Cc: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, James Zhu <James.Zhu@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-08-29 14:33, Matthew Wilcox wrote:
> On Tue, Aug 29, 2023 at 01:34:22PM -0400, James Zhu wrote:
>>>>> @@ -1067,7 +1055,7 @@ static void drm_core_exit(void)
>>>>>     	unregister_chrdev(DRM_MAJOR, "drm");
>>>>>     	debugfs_remove(drm_debugfs_root);
>>>>>     	drm_sysfs_destroy();
>>>>> -	idr_destroy(&drm_minors_idr);
>>>> [JZ] Should we call xa_destroy instead here?
>>> We could, if we expect the xarray to potentially not be empty.
>>>   From what I understand - all minors should be released at this point.
>> [JZ] In practice,  adding destroy here will be better.
> Why do you say that?
[JZ] In case, the future, INIT adds something, need DESTROY to free 
completely.
