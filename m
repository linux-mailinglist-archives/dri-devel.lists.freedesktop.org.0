Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE4D545D09
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 09:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9721D11A88A;
	Fri, 10 Jun 2022 07:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F984113343;
 Fri, 10 Jun 2022 07:20:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCdSfo3L1cOUQ7pHqbIZtB1kY+69EEIFvV/NhJ+roXHEspoeBXIzvmtaL0W6eaQfNnxdhRVKHDFK8yDmPF9ZpTDD6BELUAFdJwMLGMdnB8lbmdSIZt8d2g/0ium2B557mJzutC7f3vF7i5BuezjjnsEgunh7NokXbyS73VsbMLvelPu3DK/fuLbcJW3T13R5c6H9O0MxpMY2Kf5M5+3nTexLvN6g+fhnCdiOsVXolqhistFmP5CzT9TLeqvxPF5Ehued9tu1Cy1mj/MLMs6II3Ml1ee3T7PWcsCf99frcyQopLEFGvKBRfRLh7lsGkh+8Vg9Aeg7CMsnI31cUgJmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDtrAbQmt6efQY7sgWzumZJHIKNP+HRlQa2cpfYLZD4=;
 b=TKl5KpSA6WQeo+zy22uk+cFY3LDx4rPkIFlZXULBXQ1lEGQXY64miIc2MsvenwH/3GBysAqnmYOqWhWIgCOxYzp93LusNVo+RYflwPRj/XVehDgBDhGfMTMrK7V3ztqsJIFtYhNXjF9y5d19VdF8+cIHzm0iRdmC3yFHrQXtITJ4dLsTat01QyzsIcrCFsAJpFuWDOdywhhnClmvdJawLREE7FswuBW7tGIcXuGDhpEKmR8n3x64szcIiC3gDe3Xfs/iEExNXv9aGlCYw5GKfesSOz/MsrV5DuOZ7rqslitygAXYQ5faSIhifjQB5K9AtROqJ1Vx8xbCJ8My84V8RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDtrAbQmt6efQY7sgWzumZJHIKNP+HRlQa2cpfYLZD4=;
 b=W2UR44CHCqFpr1zZVJSdNTNvP6uhIYKfTcbwKQpVjstYDVAUxI7mp2EEEZCzNqvDYZa59LH+w3qpeKT+JyrsUzjQ5amXsOGDWQbaEICQPJFTo9ctibb1aRFaWIXZ5Z+oPY+OJDdVXP94/Ul1AYAgS8aJGyXyHzRK6g3izTa5Vcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6090.namprd12.prod.outlook.com (2603:10b6:208:3ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 10 Jun
 2022 07:20:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 07:20:23 +0000
Message-ID: <4faac373-1a30-e1a0-0c33-e10e8fc6184c@amd.com>
Date: Fri, 10 Jun 2022 09:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] iosys-map: Add word-sized reads
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220609232020.2292649-1-lucas.demarchi@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220609232020.2292649-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb943cd8-9674-4dce-7a63-08da4ab1aef8
X-MS-TrafficTypeDiagnostic: IA1PR12MB6090:EE_
X-Microsoft-Antispam-PRVS: <IA1PR12MB6090AE0002D0CE817387F67983A69@IA1PR12MB6090.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ggUiuS+9sMa56enajpQWli9qcDPb4oQV25JifPR383weTmtUi8la03WirfknpWDNEXLo5V2NegcFtUpiFw9dotvAx3GFGrU0S9PLgpS4I95QtoqF29xnZKioKQjX9WkS9yaCgW8kVW3jbg0Ypolk3Cln7X9R9U8d1wMkqc0lXaD2QtOJyc5SNkO7CnnJLEbIVeSqVwpOUQWMJVuYBWI+iL8fAjhK03urgK8O1O+OOT+zZ/9zBTnVSKNi3w4OYrNJitukziZi7OzUJCTU+p022ePgCzWsqHUuZHFHeGltm65765keTsv4EAe13AG04p4w8a+5gC+rEcF5aODIetDelLHZ4Eee22PeRlUIZhiXIvO5pUFFCzjuwRV1pLljq2ObmNny0bfmpwWNw9jzbLLW2+LhIBjbql/Y6v42btGK7JDnG7Sba4r1HJkQzMF97AgyHeehhQ1uNG4zYmcGbFKN4X2TcJeBdB0JGxv5Trr1FWoGXjpB3BWAfUwseOKa/YSLQAfelfmyKRuWwYT9uLC9s3LwYnlMiHGN5nof4x8TqfWo/ciEta9HKc6PpQBvDiHxENQC4ESpXDbhBO6NujN4Xqt5GWDj1IPS0mnxxcYYwJ6kK7qEkiqBRZLeoFt7qaTYSDKLKBahdo82HrXctqD1mhw6LtwqNnl+gumg/Clyory77/sPzs/b5QX8xs5fhhYZNH8ncmMQgTBQrVQQ6fwN0M5WufjsxubQCgVW/dBIlfrDubBqhqogUuX+JKXJTDJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(26005)(5660300002)(4326008)(8936002)(66946007)(66476007)(31696002)(6512007)(86362001)(66556008)(6486002)(8676002)(508600001)(36756003)(2906002)(6506007)(186003)(31686004)(83380400001)(38100700002)(6666004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHY0SGNsTU05Z0VFMEs1VEdWZ2tQNE9Wak4rVkwyc0pOTGhCU1VialQvVUJ2?=
 =?utf-8?B?bWZJRjF6Qm5vYVMwenkvVmtGcS85UEl2YmpNRjYwQm0zcU9zdmFaSStEbmJE?=
 =?utf-8?B?cEJxd00yWXIxTUhheHRJL1hVUzBUWnBaRjRmMHNHTGdFdldhL3B5QnBIaktS?=
 =?utf-8?B?Q0lqSThHanE2aHdFeVVNM0FHZ090R0h5NzJCQklCOHZJSHVGcldoVi9CYUpQ?=
 =?utf-8?B?cFdpSlpTN3pqOS91ckFDVGt0Z2haekNBemNHblNoZFV5QTJUdERwMTV0OU42?=
 =?utf-8?B?emhZcWNpU09jcWYzdjhkR3FWRHhXTmRML0U0S1BMbmNSMUVhakhZWHYxdXZq?=
 =?utf-8?B?bDQwazgwTTQ5NHV5Vm9LWXlmMXA4SVNaRllnckx0VWFwUzhZL210dExlK3Zq?=
 =?utf-8?B?M2FDbkJoa3FGMk9pMWdmOTdJY0NRU1I4OXJTNFcrNGhoczlPUEUyengzcWpi?=
 =?utf-8?B?ekFrcXduTFl1UWhMWWlLRUlkeVRvbTNOeFl2NFVhUG1xck1RN0JuWjdYdXdI?=
 =?utf-8?B?NWZlUFJtRXFGRUNDMS9Gbm1EY1hDSWhjdGcvRE82QW9vQmluckViTFF3SkNG?=
 =?utf-8?B?YzltdmI5d2ZYcHlLem9RSWtISE1lb2ViczUxMXVqWjN5TVhCKzRHU3dpK3VJ?=
 =?utf-8?B?UEsvNFZjOExnR2RrcUZqMnNlY0x3VDErZkpRc2xHK1g3MUQxL0daZ1ZiQ2FN?=
 =?utf-8?B?N0Y0UnRaaTg5Wm1EU2lMU2FJb3d5clNhRXYwemFYbGRpRFVhVVN0STBiTVNl?=
 =?utf-8?B?TlJ0WFBVYlg4dktoMkRldndMam1LWTlTNjRnNUFCRkpQbHBUaVN6T3lIMm1Y?=
 =?utf-8?B?YWtTQTc5MFdyckpmSlhVY0JOL2szc0JWK3NWZm5EZFpLTXhOYzlOcVM1ejBs?=
 =?utf-8?B?NHF0c1FyUGRodkhWa3R3M0tnL2wxMXJCN1pIbnhHeXlHektJQ1pwSjRvQ1Ra?=
 =?utf-8?B?b3ZibXo1WnY2MFNpaG5aMjhxbkhtQmtDWFRLNWFmUEZ3K0JZWGJDWTI4eTJJ?=
 =?utf-8?B?SHpad2pZdyt5RFlKN1JCbGVoZTJKb2JBbWZSK3VwdEJKVnBQRU56UFNadElO?=
 =?utf-8?B?WHNSaHVoS3hpTEwrUlZ5V2R1S1o5NnZsMUxVRld4RUthellDT250RjMwdmZw?=
 =?utf-8?B?VXE4cmhxemF4YmdLZ3JVeTRJWWNLRGlJN2swaW0wbUkrZ3puTUd1b3h3Vi8w?=
 =?utf-8?B?R1BmR1hYQnBWcllEeE0wWmtqekoyNkROMFkxaFFnQS81YnJqd3lMd3Z0OUtz?=
 =?utf-8?B?S0lJWVBRbDdGWThyUXcxWnNEWTVrSFIwMDgzVi9BWE1hZUlVSGhHWkd6MmUv?=
 =?utf-8?B?dEMwZGlwTU5ESlhtZkQ4WFpBTFBpclpHeldOejdmSFVkTTVnaHA3b3VrTERk?=
 =?utf-8?B?UFg0Y29BVkRqbExUSWxuQTUzM09SSStVL3hKM0I5WXR6T1JXQ1VxUU5TbXEy?=
 =?utf-8?B?K01EMTVFY1RsdStKcklnaWRtQVZ0eGlBUWorbXhMVEhYZ0FJcGpXcXFVUmVT?=
 =?utf-8?B?U1BseHdYWWsrU2R4cGJLYmlTd0RMakxTLzY5YUdtanpNL3RzMk81RkdWbmEr?=
 =?utf-8?B?TUQrTjZ1WmFKeVlsVjFBYlhCL0xIYkk1c3ZOc0NBL0R0elFaWDlIRitzc0JB?=
 =?utf-8?B?cmw2L3VEbXlZNnVFN0QzVGRMQkRIQjZpenZpeE0wK0orWUU2N2E1S2ZpMUdQ?=
 =?utf-8?B?NHMzTUNKb1Z0UUNIZkdUMiszaFZkZmpGRFlYdmRZVUpaRW1nK2lKamk3cTlE?=
 =?utf-8?B?eG0rQlR0Y1ZvSGd2RlBNb3JtWUtRY0c1ckhpQ1VlNVdrcWVUQk43MFZYY3Ay?=
 =?utf-8?B?MUZYckxJdE5mWVdYNnI2UXhzUDJXZHV5MEZiaU9XZHpvd2t1cEZ1cStRUkNu?=
 =?utf-8?B?R1Q0Q2NFOGQvNC9FUVBFT01ZUTk0bklyRGZJVzVYWHV2MW55WE9BTmpEcHQ2?=
 =?utf-8?B?RW9QSHFDcXZwYXBmNDl6ZCt1SndQRi9kUGFQUWkxaG9DM2pyY1V3SE5BSHFO?=
 =?utf-8?B?dTUyRU5mbytBUkRFUXphUUNud0hrV0IwNGhZdzkxSUM5OHRkOHZKMGhDLy9v?=
 =?utf-8?B?dWVqd2k2MTEzVVFVWUZDKzB0dlIyZlh5S2NSRDUzZzkzWlNUTHpFRTZnOFgx?=
 =?utf-8?B?dUx3ZFQrclR3YnRad3MrWFV4OUxHamtNcEwyOHJxUUlaUTI0VitJelhCN0Y0?=
 =?utf-8?B?V09uMFBCMmhheGllYU1hcVpLRm94bVJkNE8yaWxJeUExOVpjRDdwWjBkL1Jp?=
 =?utf-8?B?S21FQUU1MHBXcDVmRklUREY1SVcwbnFJM3BoenNzNHVMUWVuR3U2Mm96cWtz?=
 =?utf-8?B?NzVhb080Y3RmRjNndXkzTjJ6VzZnTUkwSmkxU1lUeFRRSjkwUms5QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb943cd8-9674-4dce-7a63-08da4ab1aef8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 07:20:23.3720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuFy+qMVcwrojEL8OAz2BAchbyzV5ypvrLSE0iKb4d4No3boif3B6GHqYT4qdWt1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6090
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
Cc: daniel.vetter@ffwll.ch, tzimmermann@suse.de,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.06.22 um 01:20 schrieb Lucas De Marchi:
> Instead of always falling back to memcpy_fromio() for any size, prefer
> using read{b,w,l}(). When reading struct members it's common to read
> individual integer variables individually. Going through memcpy_fromio()
> for each of them poses a high penalty.
>
> Employ a similar trick as __seqprop() by using _Generic() to generate
> only the specific call based on a type-compatible variable.
>
> For a pariticular i915 workload producing GPU context switches,
> __get_engine_usage_record() is particularly hot since the engine usage
> is read from device local memory with dgfx, possibly multiple times
> since it's racy. Test execution time for this test shows a ~12.5%
> improvement with DG2:
>
> Before:
> 	nrepeats = 1000; min = 7.63243e+06; max = 1.01817e+07;
> 	median = 9.52548e+06; var = 526149;
> After:
> 	nrepeats = 1000; min = 7.03402e+06; max = 8.8832e+06;
> 	median = 8.33955e+06; var = 333113;
>
> Other things attempted that didn't prove very useful:
> 1) Change the _Generic() on x86 to just dereference the memory address
> 2) Change __get_engine_usage_record() to do just 1 read per loop,
>     comparing with the previous value read
> 3) Change __get_engine_usage_record() to access the fields directly as it
>     was before the conversion to iosys-map
>
> (3) did gave a small improvement (~3%), but doesn't seem to scale well
> to other similar cases in the driver.
>
> Additional test by Chris Wilson using gem_create from igt with some
> changes to track object creation time. This happens to accidentaly
> stress this code path:
>
> 	Pre iosys_map conversion of engine busyness:
> 	lmem0: Creating    262144 4KiB objects took 59274.2ms
>
> 	Unpatched:
> 	lmem0: Creating    262144 4KiB objects took 108830.2ms
>
> 	With readl (this patch):
> 	lmem0: Creating    262144 4KiB objects took 61348.6ms
>
> 	s/readl/READ_ONCE/
> 	lmem0: Creating    262144 4KiB objects took 61333.2ms
>
> So we do take a little bit more time than before the conversion, but
> that is due to other factors: bringing the READ_ONCE back would be as
> good as just doing this conversion.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>
> If this is acceptable we should probably add the write counterpart, too.
> Sending here only the read for now since this fixes the issue we are
> seeing and to gather feedback.

As far as I can see looks sane to me, but the kernel test robot tears 
the patch apart.

Probably just a typo somewhere in the 32bit handling.

Apart from that looks good to me.

Regards,
Christian.

>
>   include/linux/iosys-map.h | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
> index e69a002d5aa4..4ae3e459419e 100644
> --- a/include/linux/iosys-map.h
> +++ b/include/linux/iosys-map.h
> @@ -333,6 +333,20 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>   		memset(dst->vaddr + offset, value, len);
>   }
>   
> +#ifdef CONFIG_64BIT
> +#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)			\
> +	u64: val_ = readq(vaddr_iomem_),
> +#else
> +#define __iosys_map_u64_case(val_, vaddr_iomem_)
> +#endif
> +
> +#define __iosys_map_rd_io(val__, vaddr_iomem__, type__) _Generic(val__,	\
> +	u8: val__ = readb(vaddr_iomem__),				\
> +	u16: val__ = readw(vaddr_iomem__),				\
> +	u32: val__ = readl(vaddr_iomem__),				\
> +	__iosys_map_rd_io_u64_case(val__, vaddr_iomem__)		\
> +	default: memcpy_fromio(&(val__), vaddr_iomem__, sizeof(val__)))
> +
>   /**
>    * iosys_map_rd - Read a C-type value from the iosys_map
>    *
> @@ -346,10 +360,14 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>    * Returns:
>    * The value read from the mapping.
>    */
> -#define iosys_map_rd(map__, offset__, type__) ({			\
> -	type__ val;							\
> -	iosys_map_memcpy_from(&val, map__, offset__, sizeof(val));	\
> -	val;								\
> +#define iosys_map_rd(map__, offset__, type__) ({				\
> +	type__ val;								\
> +	if ((map__)->is_iomem) {						\
> +		__iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
> +	} else {								\
> +		memcpy(&val, (map__)->vaddr + offset__, sizeof(val));		\
> +	}									\
> +	val;									\
>   })
>   
>   /**

