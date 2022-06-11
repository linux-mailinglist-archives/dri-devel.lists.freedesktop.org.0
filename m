Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEBB5472D0
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 10:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4188811299A;
	Sat, 11 Jun 2022 08:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA931112908;
 Sat, 11 Jun 2022 08:17:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFxFyTH4iVyF35HEhQHgTV5PMjJnVdkuQL1fGSVuejQWtlk3dYvzgz9DpDWZaHmM6dOlm7jiTKE9s7PnGYx2N7xjcrMhoKg1IJhNBONG1fq5xukkGSWKjrmaiAdWOvDekh9HrUKMqA4KM1abxUFsvltx/YkDxza+7AABnqZDGAdu+NmNKOwPZYB2YjxjkwayYuB3QIPmtO6J+3Tyimk46CMd9EwyFe81/uGzAVmgiq6W7n4DvVrL9RZUtirDwFMoWcY70qNIog90hGH3sAFEhCSzS5T5hCPwr2XuuhRjYj+PHfx+VgfNm5S46TB8St3QSk9fjibqb6N+gml3LpEZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOJSzMe8arDRSaAgVTxCpVJjscbvdDcmqOQmGyXVJ2U=;
 b=D5OqONPBZ3mB0SfsnaIV6Du0P4uPMxVn62j6on3JF5wR9N+N/PmNSHuAl/geuTK6oVGr7B0XQz+9XgZI/IiJc01/J34Lo472zsFsiwG69OfszLg/eWMKpkI90r43MhhtgqSOtzz7g587bkRbwHFjv/TeIDj4diaiIVgK0qRnZG4ps6iPRu94IHmUKA9nxzUKn+hT8KaBWFWZTX66YCVRAhBWBnMp/NSUW5v899pwgKjjW5uSMIaLVTBKHxfuMoUOgBYlci2GTkPPyLwJPt6/44crHbz30AtWqB6UpYJtcyaULWk0y5qEQIekYirDjPrR4u23r2hacbbPTMn9D3U+5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOJSzMe8arDRSaAgVTxCpVJjscbvdDcmqOQmGyXVJ2U=;
 b=j0fpmr2O+IRb0b1JVnjV4fDqLRbZuxZ9k3bj38Y/nqmbjqC6L09fETrDJo+/ADycOLeG6TCyUzKNhq5m2gOUVCtJ4jc90/8CJV2+sv/XNCECjiTfgsHApcz0KKKxJlHrROn6PBK9wIr0L75cpfO1Uk9oe0K2RuvUoDrrFJ8ioYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6230.namprd12.prod.outlook.com (2603:10b6:8:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Sat, 11 Jun
 2022 08:17:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5332.015; Sat, 11 Jun 2022
 08:17:47 +0000
Message-ID: <90f73c33-ff5d-eaeb-3776-43391c4ca602@amd.com>
Date: Sat, 11 Jun 2022 10:16:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] iosys-map: Add per-word read
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220610232130.2865479-1-lucas.demarchi@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220610232130.2865479-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0024.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6d9a8df-fa97-4612-7591-08da4b82de90
X-MS-TrafficTypeDiagnostic: DM4PR12MB6230:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB62305A866E596D4C969E4C9A83A99@DM4PR12MB6230.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vduZcmrWP3bzMr9gpXiss24Nv3A8wTGk30atukTQtAEhQbIncXabZIHwHkEwi11VBy6W48Eju24IFQzDYVZpxNVrrmVygYntCDqQoRnPDa2nv7TbDTFJuu2s7YcrGI6qBAb3H+23MftHFLkqDwJVHU2WNfMi028GU5UT/U58oJS3v0tqAKPbOv5OxBbGruCuUDaGqs1rCzk1Jy4Ay/HOeSoCcNKi0d05Ri0zDEQMhCmyU+0o1BMK4tSKH5HFgHUt0aYF8O/Z4QWeGd5j0WuIQlQmI9Z9HrHdmM7BPi2PrFNzr5xamyuy4O9I7XuTmdDKdLdl0KGnlRO4g4s2Fmy5BCx5uBpiexPTUHoiNgC7GNJkVz4n49zyAms4WI+Yv81GfzMYldBY7KoMBJr+ONG1ZgjF8GG2k4APr9rXqoBOwy8/ixhb4GQhGCv/cgGYDYzQnkby3DBFECTfSNY/EYUWKs7Plb5t26N4BUEN+4Jk/CrfWgOFotSt7BS+Lc6evX05F/PB4C47gXkg0wMLvoZlsiFtOKhIi8CD+hlFdIZttBpsk3SinaLggoRvC2HHfiDsrtFaveUsrt/eFQ9KPGhZk2JEJYeUR62oVWUiwA//eqpHI88jeZYZRV+X7y5bcPi9B+dRWN8cOMESQ7zefcw/wAVS4pJ9MfQEWGJE4B66/dU+EkZIl1Z0IsBHCrAPwOtqP8gTEG4CIOtF9R307tmrZIXJoZZD01PvJtYIBTz8Ft/iIZzbY3V5cO1INEBcqVC0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(66574015)(6666004)(38100700002)(2616005)(6506007)(31686004)(2906002)(6512007)(5660300002)(36756003)(8936002)(508600001)(66946007)(6486002)(4326008)(31696002)(86362001)(8676002)(66476007)(66556008)(83380400001)(186003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVlhVVJKK0R5QWE1YVBqTnBMdFdJaVpzVkE5K3Q3bTRmMzFVUklkWW9iTUdy?=
 =?utf-8?B?UjRnbVZMYVUvdEJ4YzlPOE4xNGVSYTc2YTJ2VVZZaEYyYnBTTHFoeVg2eFZL?=
 =?utf-8?B?MDVMdEJIS0tBSjdTT25sSFZrcFZRV1hwbTVnMitCMXhSQ2g4aHpNWExzK1NN?=
 =?utf-8?B?YWN5emtLc1J1SitPek9VNWd5by9aVjV1NzduSE5ibU5rQUpKbEpEWlZURFB0?=
 =?utf-8?B?bUVOMEM0WTA5NTdjYWNtNm9MNURLc1ZRZnk5MmFXMkNNdnVCQk5zejNndDRp?=
 =?utf-8?B?TmtwNHdaZzNwMTRDRWRiTGcrK21MenArK0YxTXp5ZDFVY2JyeTlDVXhIVTA1?=
 =?utf-8?B?Ty81TWdscGNUTWR4WVBlQVJoMEd2d3hiVG44REdoeXdGZzU1ZVFUM3Vib2lV?=
 =?utf-8?B?ZU9DSmQrWFBwaTU2SjVxVVV2cHliMkxOc0hyQWY0TGZPK3gycEZ6WDQ3NmVN?=
 =?utf-8?B?U25EL1N3ZEU2WEF3SHluTDIrWGwrVitCZ09icXRKYXFrSHMzZk91UWVmYjBM?=
 =?utf-8?B?MGVCdDV1eEZEcHJZNjI0cmlDVytuNktrWXRzMXZnb2VGVDVzTUtrMm14Y2w5?=
 =?utf-8?B?blJKeFN2cGdUTURid0toWnpmL25oMGZjRmNCWG1TWWRhWUpnWUl1NHM2SHpt?=
 =?utf-8?B?UjN5Y1NYM295R1hpd3BLME1CMzl2MkJlNkljc2REaEV2NDNPSWFaUmU3YzJk?=
 =?utf-8?B?Rk9GOHFFQUU2ZWQ2aXJ5bVFqeEo3MjVqUy9kZ0diVU5RU2V3N1VMMXBaS0kv?=
 =?utf-8?B?NmxmR0RqMjVza0tFMjc2VWl4cHpRdW1OYTlaR0hhYWF5T2o0ZFdBbkpHQXBC?=
 =?utf-8?B?c0owUmhwRXBqTDdJa0NKYlRVMVBzcmxXdGhvaW0wUVlNRklKblVXZjdncE9a?=
 =?utf-8?B?aHdxZDBIdHI5OWY5NSt2eERDYkttMnVQK3ViZTBwVVUvdVROOUVmMkR5Yk5l?=
 =?utf-8?B?dVpIR1czTjZaMlVpWU9Wb1BUcmJHTGdQcVkvYmFWK1BDd24wczhHV1IzOC93?=
 =?utf-8?B?QlUyR3NjZ2JmWFl1T3dPKys0VUpFTnNkeW1oRmtZamxJSVBmeGh5d2V2ZVhx?=
 =?utf-8?B?RUFQTG1pcExNQk9rQ3JNbWlNV2V2Z0xMYVJ2SzBQZnVsUEYxLzMyL0dFZVE3?=
 =?utf-8?B?ZlBqN2VVS0M1c1dLYVJWZjk4a3VCQURqNW9GWEJTQTFNM2ZUT0J6NGZJT25q?=
 =?utf-8?B?anFmNTlOcjJUM1ZrT0xlNisvNVJGdGhiNy9ldXRuRE5MN0tBQjkwbU1BMk4x?=
 =?utf-8?B?My8xNTZ6RXc5cGpBSmhtelVtc2U4QVRLQ1JlOUhpa013SG9PRm8wOGpKWWJt?=
 =?utf-8?B?ajNML2pXd0pqM0FxUGhSREVJempPb1pCR1dkVEFycXFJN3U0WVJjdnpHd2xp?=
 =?utf-8?B?Y1JpaXEzUjdlS0kvK2YreFdzYUlqYnF4ZWFjTjBRYys3K2VmMlliRFVBM3dN?=
 =?utf-8?B?eUd1ZndXVE5VMlVwVmcvK2lIWWZlUGcxY0hHZlJYOVdMZWhPUXJFbHZ6T1kx?=
 =?utf-8?B?UU5nNTBKSmdxUXFHVnNWUUJydnNBMm13YTFEL0RHT2hQRE5sSFlnRlVXRlI4?=
 =?utf-8?B?NFhtdjZma3pYSjdGVTlJY1NMZDRrNmVheThCaTY1d3JTV2VoMXJWRTRpR3Ur?=
 =?utf-8?B?VGFubVhlR1JRVTRBQUM2L2swVWFaMkJPK2hOemZxRVh6WFYvdHl3aE82b2V2?=
 =?utf-8?B?cnBrei9rSUgvajVVNVA2RDdOMUo2VEh1RkhDWWdnLzdyNjZmSm82Nmg1cXI4?=
 =?utf-8?B?ak91TmtKUVkvVkFybVpXTDJIYTJGZys5Ylc2QmtXdkYyVVh2M3BiTitNSFQ5?=
 =?utf-8?B?L3FOdWdESVAxMTN5V2FxOVA1QytFT1NyMXdab0xPbTlGZ1IvZFlsYW05YUZC?=
 =?utf-8?B?VStqdDVOTUFBV2JpM282ZUR5ZkNMUUJFV08zdDcwTzhlMndWR2RmZ3dvWEZ1?=
 =?utf-8?B?bnozR2poS3QxZUV1Y1dTTFpLTURxd3lWei96NkJoSW1mT3d0ZzBaY3A0R3VF?=
 =?utf-8?B?aUpDeWRPamFnUmRMWnBmQ0xDWjRWNjMybnZYZTNDRHR0Wk9Zb2pqSDBLOGxl?=
 =?utf-8?B?bUZaMnBNdXF1K1hqMkdoS0lvUGpZaktSWmFJWVpyVFFDZjVtUDVxbmFncm1j?=
 =?utf-8?B?NHh5bmFXK01DTGc2WlIyUlZ2bDIyVFh4Ylo0Q3h1MFlCOU1aejNaWndqd1pY?=
 =?utf-8?B?RXB2d1dCMWcyb29uNkkzSUFINXBVaVNUTzRjQit1cWU0c3lwY25POGZIWjhW?=
 =?utf-8?B?dTBCdU9SOG5xSmNQU3RRWndFM01NbVdTaFBkbnFUbVJaVWRkNlp5ZkwzYWtF?=
 =?utf-8?B?dEpLTHJkTjZseXg3SHFJdDUydHJNMlNHRG1vVklPTXBWaThkcTFLYTdlN2p6?=
 =?utf-8?Q?kTvJypYiYaq5GyBPvvEvgCUt20l4gLhvbXV9ONLIzUcCG?=
X-MS-Exchange-AntiSpam-MessageData-1: 2urBbPTvXlrFYw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d9a8df-fa97-4612-7591-08da4b82de90
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 08:17:47.9124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3FeO97ZanU2ryf/3Yee7g3tNfl71vko67yCLW4vufSM2bpJYVnx5ZxdfTqLGcqL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6230
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
Cc: daniel.vetter@ffwll.ch, tzimmermann@suse.de, chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.06.22 um 01:21 schrieb Lucas De Marchi:
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
> changes to track object creation time. This happens to accidentally
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

Reviewed-by: Christian König <christian.koenig@amd.com> for the entire 
series.

> ---
>   include/linux/iosys-map.h | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
> index e69a002d5aa4..cd28c7a1b79c 100644
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
> +#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)
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

