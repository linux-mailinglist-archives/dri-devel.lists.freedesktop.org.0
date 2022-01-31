Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F904A5335
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 00:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB38F10E46A;
	Mon, 31 Jan 2022 23:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CA510E460;
 Mon, 31 Jan 2022 23:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcDtsiQvBisjJHG5QQkSHK4moYSRQJDnt6/yDgFAwGKiwqE7K0najqznAP1sy5KjQYMMP3xJxF4Gl1S1fi6HIoUTv6BdHzBS+w2aKJ2mHsHD1EiDNA0gpLg8G7AksdosIkpMXSCVlOxxnpFCHd+/L/9Iqvin3/v4rua1mghTFcSBKTWOftORPbNvfax+cS1EeCQfs9oIcCevnyYUWHWUwUPJpDoS/izhQP0GNRnrKd1ZLGj2sK/x+NtqP786zWQum8fKAkingTqvh0areEfGWh0Z0TIRHllrkkpiJSA8vO68HonnfMkR+AyMeyfemA8cp5cawUlp32iwkv4jYyzw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmOy54+8c4e00CD8pO83K/JmMZVL0FzBzeB7YWTo6qc=;
 b=ezP5UmeruEh3azQwvGJcalspCGHhBhhbslfzNwBrZncvq9h+G7rBP/w5PpYJiYo0f4lHX78O0DtvZ05fYc2SD/JbiVOV+DEkNBbjHpAmILX6NnQTBlCjk+5BBCEpjcknXloRAAgAYEP3NZUwCa61kLHpOhocKI2qc8yas1rFwGfzic8z9Q+I5qW30zlaWFZIVV5sksFwV8IR3E9AthtGBGbWj/tAj6UVtSE3LqSFbNVrFb1HqPDy8wucJoO6zcw+2O55L5R2VFV8IwQExdpOExaDu8sUrfhpWsjYjocMYf7s36q9QZmtjlKTukmhnX5UuNR5rokIi2AqQTyh9QakEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmOy54+8c4e00CD8pO83K/JmMZVL0FzBzeB7YWTo6qc=;
 b=oqEKqdLiaxOrP5wrwfSP1jBjbpo5AjCp62l3iqpudVcDXz8X00JDsCUkTqqup9sn+PUsWXzof9MeNBgJd6GjGcDjQi8y/RY2ZdxYjdgsSQxdb75KKasXc/3cacKxUTC1E9lFWTd6ZzyowjRx/j5ASeHirhlV/KiXxDjp+4MsxGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by BN9PR12MB5243.namprd12.prod.outlook.com (2603:10b6:408:100::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 23:27:27 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::d461:50bd:ac0c:8c37]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::d461:50bd:ac0c:8c37%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 23:27:27 +0000
Message-ID: <922553fd-a19b-e3a6-2a99-c31ced3b4281@amd.com>
Date: Mon, 31 Jan 2022 17:27:25 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 09/10] tools: update hmm-test to support device
 coherent type
Content-Language: en-US
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
References: <20220128200825.8623-1-alex.sierra@amd.com>
 <20220128200825.8623-10-alex.sierra@amd.com>
In-Reply-To: <20220128200825.8623-10-alex.sierra@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0042.namprd04.prod.outlook.com
 (2603:10b6:806:120::17) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a996c75d-51ad-4411-e019-08d9e5113e6d
X-MS-TrafficTypeDiagnostic: BN9PR12MB5243:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB524361F1CE18490647400336FD259@BN9PR12MB5243.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c9lcDnuXQOTpOMiCKYlgELf3zpei9uF1Krkcsd3AN1Y8S0HfNu7zabOCi43y8Y4dLHqUSyW/k5CNNz4PNzTqzOFbk6l/t4zw/qWBIIi7XXiCh3zrP7950H1OIw9mYup4+k/EYg4GxTFbGTdAGvp4XfHLhDqA3Dwn6M5XUTSZdLi+wLZCkU6bBDdypbUo83POX+v0vLcWl/p2h6vrlG5QakqGCjFG9t2gR9pgRyasm2QcCkUl/FEweauA/VEoQ/wWTmBbBhSeYuXnxzMxpi1xHCfcEqzWt/HEWMgXY3xv+CduaS/l2+iOzJB3DbKyyiY6oafBKC21Q/BA8YnVMe94VnC2hi+PRY9Bertx5iMlNcW7mLfPm9Nm9NV4fmajf2zRdv+/g95Z/K1j294uBwP/hZsABT+kkCEBGFFqb2FWzgICMKWujAjPKhPOv2++MyGzADsiaKZdZepgqWP2oHKHJ2YgsmhSy+QlbzBlEPvruMaYbgUJTtgOkXxSnJtZch1mO+bBK0ZmUCD8AeXPozIPMPrPMbheaylUCO+IjvdPzV37bwabDLwJ55ixBdbQmi6VF+yWrcR4EaYDf2I8Ao8GzlWHoY0G6Yjvenz+o6sMBlWOu6kH7oy1bKnfRzRISUlDjxVvrdRs/tGLdXK25JnpiBacJRGZwe8hukB4Un5fo1CXc1UFtJqAVbYQTsjAak4LR6eZK8keCIViB+Aq/wDkFhD/wvKzvUIKpSs5XkxvEJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(7416002)(6506007)(6486002)(26005)(15650500001)(186003)(5660300002)(31686004)(2616005)(316002)(53546011)(508600001)(36756003)(66556008)(86362001)(4326008)(8676002)(8936002)(2906002)(38100700002)(66476007)(83380400001)(31696002)(66946007)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGRJcTRoZjVWOTBuVXlPQnhMVmxkVGpBVDE5ZVB6VWRpRy9KeE9GM2YrcDkw?=
 =?utf-8?B?cTNieDRmZ013aW03RG9aaHpkZmFXUU5SRFB0ZXdSRE41cUdUZnhkbjhaOWJU?=
 =?utf-8?B?WTRmRWxpMEpZalBaU2RlN3pGd3pqTHYzOEIvL0YwZ3FhWk9QREZveTlnQkRO?=
 =?utf-8?B?dTFMWHgycjcyM20yeTREZGtkU29YL1dsSC94Sk1iYUxzOENnNGxsNHUwMzhV?=
 =?utf-8?B?QkxMYWxEM3ZrYlprelkxY25wWEQvd0lDU082NmpNWHdmdE1FeUlZMVlvd2dl?=
 =?utf-8?B?SGdFazhSUnRZZERtQmFlMmpvWlpycWhjc2pSZWMxOFM4OHd1VGtxSFpNVHkx?=
 =?utf-8?B?UVpmS1ZlS24xNzQwTzBGQ2ljdWtMWHlSYWI3K2hSclZJSzJnME93Y0YveGNC?=
 =?utf-8?B?V3UvUFNENVNuU1kxY1VzaHNYeTFTSFg5VlErbGU4WUY2UUlkanJmckFXQnBR?=
 =?utf-8?B?QWJZSGNMNS9STEMyRWlCZzhSL3U5RlN3TzllTERUOUdtcllzc2hlMFdIdnJl?=
 =?utf-8?B?aDBENjJBT0dkMEp0MnROMDF4QkRzc2Y0dWVXVjRWcmtJSTU4UmdUT3R0TnR6?=
 =?utf-8?B?cTlSRGxscGRNaWNuUUNtaHJmWm5NZ1BTeHA0VXgzV3VzdVJsZDU1SjYzQWZ2?=
 =?utf-8?B?TVhCVFpxenRlNzVReUdxY3JPdjRJSjc3NzY4a0EzWTB4RnpCT2Yxa1E0REJJ?=
 =?utf-8?B?YmhoV2FGL0Y0VVNTaXFVdFNlWUZoUHhzRnpTQTBYN3MwZXNydzF5Zmx2MHg4?=
 =?utf-8?B?bVdtS3Q5ajlydE1pRGwvUkNST3dkaitDM0g0UC9UUDNIR0ZpTEhDTXo1SlA2?=
 =?utf-8?B?Uy94SG5TODEvNWNxTDZxVVh4MlJlVnJwemxSMHhtMXJnZC9pV1JjN0JQcFlK?=
 =?utf-8?B?eXZDMDBrZDBhcDlnQkFpemhDVFJHdUV6N1J4NVRCNWZJVjVnVkh6eS96Umw1?=
 =?utf-8?B?cndBYTYxVlFhbUlwSkhGam9XS2Mvemt4MEJJNFdEZWs4MEpNakxOSE42dEdX?=
 =?utf-8?B?MnRVUGFhcysrdHh5aWpYNk5wZ1Qwem15TE1yQXg0SnU5YVFyQkVOa3B0Nmow?=
 =?utf-8?B?Uzg0VUIvTnJqNVlRUnZ4WTVzZEppbXV3VkZUYTN2d1oxSTBqcDVpa2I1WWUw?=
 =?utf-8?B?VWEyVkNjbmIrRHoxUm1MQjlwNHgwZ21JeUcyYWhRTkR4VWRoTTlNdWlrdFRG?=
 =?utf-8?B?TTR1ZjVYdG5yOEZ3RzB0cDB6NGVFNGtoaEFLOGVKSnJQOHR5UGhjYWtJRWg2?=
 =?utf-8?B?MGZTNFY1dHFFY2VpNlhHUktJd0hUN1BBM2tvSXdVYUVleEwrOGo2MUZod3BF?=
 =?utf-8?B?M3Jadlc2bWZKdWtDcEc2RmxUeGFNWDhSVzhlOUMzcTFScGFiMUFzK2ZmNUlw?=
 =?utf-8?B?NDQ4aTllUHNBUFErbDdCUFE3R3pGazJoeWk0K01OWFl4cEdISy9LbFZlVmVo?=
 =?utf-8?B?NkR4SUpwaU5ORkg1QVl4U3NXcTVFN1dGdFhTK1lWaU03QldUYks2SWdvQ0Fm?=
 =?utf-8?B?QzZKZTBveE9pNFNPdG12MDdaQklhbks2cjFrQnhMYUNqbE5NTEpLdjVjb2RQ?=
 =?utf-8?B?cm5weVRVQ2oxNHgwWlFnaWs5bUFHZkVGR3JQcWlFVk1QMVpYa1pqMTBvalla?=
 =?utf-8?B?R2RaUXppOHh0SVVaUzVrM2Zkb3N3YWFpY3A4UFYrM0U2TGpKR0l4ekx6V0NV?=
 =?utf-8?B?Sk9DUkVjdVNpM2ZUYmRCK0JRZFhqbmk4T1YxcFpUekhPVlZtU21PbE93VWJj?=
 =?utf-8?B?blF1SDAwSmRmWlBzQ1VPMWNmL2Zyb3JjR3dEbDBXY1JYeVhDd3ZFNjBLV3pl?=
 =?utf-8?B?cUd5ODJyRHJtZndBNEdrREhmQmxpUy9BclJqaEtqL0lsNVErZVd6YS85YmRX?=
 =?utf-8?B?MVYzSjRZZm1mMzlwdHZCdk5iaXZqdU5oZndHM0tOV3JjbENmSHIvOGdqQU0z?=
 =?utf-8?B?ZmF0WkFwR2tZODhHeTJ3c0plZGlValcydWRVSWJNbFJGa29KalQwcGc2a0lI?=
 =?utf-8?B?TFhselZuUDNGNnVOQjNHeXV0SlB6c28rRHE4TzlUYXJxaG9jUTlhVElPWjZl?=
 =?utf-8?B?bE1TU29kZkRvN2Q2L3NrNDRhSk4zS0lQSFY5Z1JEc2F1OFpDcjBhMEM4RmZF?=
 =?utf-8?B?UXJ0SjRjM2Z0ak1LWC9GZkFBTHZYNHdYOUt3R3JYbjd2dmNxRnh0OUJTckI0?=
 =?utf-8?Q?G2YhYBAThNzbzC9/chworLA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a996c75d-51ad-4411-e019-08d9e5113e6d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 23:27:27.6267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYY8/sC6Dl0D48zOj91NIIudH657EAj9gcYQzAWhdTgEQfbbYWXsNLUS45SGISdKJ0JF+SoP/W7A1eFjqatUjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5243
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
Cc: willy@infradead.org, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alistair,
This is the last patch to be reviewed from this series. It already has 
the changes from
your last feedback (V3). Would you mind to take a look?
Thanks a lot for reviewing the rest!

Regards,
Alex Sierra

On 1/28/2022 2:08 PM, Alex Sierra wrote:
> Test cases such as migrate_fault and migrate_multiple, were modified to
> explicit migrate from device to sys memory without the need of page
> faults, when using device coherent type.
>
> Snapshot test case updated to read memory device type first and based
> on that, get the proper returned results migrate_ping_pong test case
> added to test explicit migration from device to sys memory for both
> private and coherent zone types.
>
> Helpers to migrate from device to sys memory and vicerversa
> were also added.
>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
> v2:
> Set FIXTURE_VARIANT to add multiple device types to the FIXTURE. This
> will run all the tests for each device type (private and coherent) in
> case both existed during hmm-test driver probed.
> v4:
> Check for the number of pages successfully migrated from coherent
> device to system at migrate_multiple test.
> ---
>   tools/testing/selftests/vm/hmm-tests.c | 123 ++++++++++++++++++++-----
>   1 file changed, 102 insertions(+), 21 deletions(-)
>
> diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
> index 203323967b50..84ec8c4a1dc7 100644
> --- a/tools/testing/selftests/vm/hmm-tests.c
> +++ b/tools/testing/selftests/vm/hmm-tests.c
> @@ -44,6 +44,14 @@ struct hmm_buffer {
>   	int		fd;
>   	uint64_t	cpages;
>   	uint64_t	faults;
> +	int		zone_device_type;
> +};
> +
> +enum {
> +	HMM_PRIVATE_DEVICE_ONE,
> +	HMM_PRIVATE_DEVICE_TWO,
> +	HMM_COHERENCE_DEVICE_ONE,
> +	HMM_COHERENCE_DEVICE_TWO,
>   };
>   
>   #define TWOMEG		(1 << 21)
> @@ -60,6 +68,21 @@ FIXTURE(hmm)
>   	unsigned int	page_shift;
>   };
>   
> +FIXTURE_VARIANT(hmm)
> +{
> +	int     device_number;
> +};
> +
> +FIXTURE_VARIANT_ADD(hmm, hmm_device_private)
> +{
> +	.device_number = HMM_PRIVATE_DEVICE_ONE,
> +};
> +
> +FIXTURE_VARIANT_ADD(hmm, hmm_device_coherent)
> +{
> +	.device_number = HMM_COHERENCE_DEVICE_ONE,
> +};
> +
>   FIXTURE(hmm2)
>   {
>   	int		fd0;
> @@ -68,6 +91,24 @@ FIXTURE(hmm2)
>   	unsigned int	page_shift;
>   };
>   
> +FIXTURE_VARIANT(hmm2)
> +{
> +	int     device_number0;
> +	int     device_number1;
> +};
> +
> +FIXTURE_VARIANT_ADD(hmm2, hmm2_device_private)
> +{
> +	.device_number0 = HMM_PRIVATE_DEVICE_ONE,
> +	.device_number1 = HMM_PRIVATE_DEVICE_TWO,
> +};
> +
> +FIXTURE_VARIANT_ADD(hmm2, hmm2_device_coherent)
> +{
> +	.device_number0 = HMM_COHERENCE_DEVICE_ONE,
> +	.device_number1 = HMM_COHERENCE_DEVICE_TWO,
> +};
> +
>   static int hmm_open(int unit)
>   {
>   	char pathname[HMM_PATH_MAX];
> @@ -81,12 +122,19 @@ static int hmm_open(int unit)
>   	return fd;
>   }
>   
> +static bool hmm_is_coherent_type(int dev_num)
> +{
> +	return (dev_num >= HMM_COHERENCE_DEVICE_ONE);
> +}
> +
>   FIXTURE_SETUP(hmm)
>   {
>   	self->page_size = sysconf(_SC_PAGE_SIZE);
>   	self->page_shift = ffs(self->page_size) - 1;
>   
> -	self->fd = hmm_open(0);
> +	self->fd = hmm_open(variant->device_number);
> +	if (self->fd < 0 && hmm_is_coherent_type(variant->device_number))
> +		SKIP(exit(0), "DEVICE_COHERENT not available");
>   	ASSERT_GE(self->fd, 0);
>   }
>   
> @@ -95,9 +143,11 @@ FIXTURE_SETUP(hmm2)
>   	self->page_size = sysconf(_SC_PAGE_SIZE);
>   	self->page_shift = ffs(self->page_size) - 1;
>   
> -	self->fd0 = hmm_open(0);
> +	self->fd0 = hmm_open(variant->device_number0);
> +	if (self->fd0 < 0 && hmm_is_coherent_type(variant->device_number0))
> +		SKIP(exit(0), "DEVICE_COHERENT not available");
>   	ASSERT_GE(self->fd0, 0);
> -	self->fd1 = hmm_open(1);
> +	self->fd1 = hmm_open(variant->device_number1);
>   	ASSERT_GE(self->fd1, 0);
>   }
>   
> @@ -144,6 +194,7 @@ static int hmm_dmirror_cmd(int fd,
>   	}
>   	buffer->cpages = cmd.cpages;
>   	buffer->faults = cmd.faults;
> +	buffer->zone_device_type = cmd.zone_device_type;
>   
>   	return 0;
>   }
> @@ -211,6 +262,20 @@ static void hmm_nanosleep(unsigned int n)
>   	nanosleep(&t, NULL);
>   }
>   
> +static int hmm_migrate_sys_to_dev(int fd,
> +				   struct hmm_buffer *buffer,
> +				   unsigned long npages)
> +{
> +	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_DEV, buffer, npages);
> +}
> +
> +static int hmm_migrate_dev_to_sys(int fd,
> +				   struct hmm_buffer *buffer,
> +				   unsigned long npages)
> +{
> +	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_SYS, buffer, npages);
> +}
> +
>   /*
>    * Simple NULL test of device open/close.
>    */
> @@ -875,7 +940,7 @@ TEST_F(hmm, migrate)
>   		ptr[i] = i;
>   
>   	/* Migrate memory to device. */
> -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>   	ASSERT_EQ(ret, 0);
>   	ASSERT_EQ(buffer->cpages, npages);
>   
> @@ -923,7 +988,7 @@ TEST_F(hmm, migrate_fault)
>   		ptr[i] = i;
>   
>   	/* Migrate memory to device. */
> -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>   	ASSERT_EQ(ret, 0);
>   	ASSERT_EQ(buffer->cpages, npages);
>   
> @@ -936,7 +1001,7 @@ TEST_F(hmm, migrate_fault)
>   		ASSERT_EQ(ptr[i], i);
>   
>   	/* Migrate memory to the device again. */
> -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>   	ASSERT_EQ(ret, 0);
>   	ASSERT_EQ(buffer->cpages, npages);
>   
> @@ -976,7 +1041,7 @@ TEST_F(hmm, migrate_shared)
>   	ASSERT_NE(buffer->ptr, MAP_FAILED);
>   
>   	/* Migrate memory to device. */
> -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>   	ASSERT_EQ(ret, -ENOENT);
>   
>   	hmm_buffer_free(buffer);
> @@ -1015,7 +1080,7 @@ TEST_F(hmm2, migrate_mixed)
>   	p = buffer->ptr;
>   
>   	/* Migrating a protected area should be an error. */
> -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, npages);
> +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, npages);
>   	ASSERT_EQ(ret, -EINVAL);
>   
>   	/* Punch a hole after the first page address. */
> @@ -1023,7 +1088,7 @@ TEST_F(hmm2, migrate_mixed)
>   	ASSERT_EQ(ret, 0);
>   
>   	/* We expect an error if the vma doesn't cover the range. */
> -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 3);
> +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 3);
>   	ASSERT_EQ(ret, -EINVAL);
>   
>   	/* Page 2 will be a read-only zero page. */
> @@ -1055,13 +1120,13 @@ TEST_F(hmm2, migrate_mixed)
>   
>   	/* Now try to migrate pages 2-5 to device 1. */
>   	buffer->ptr = p + 2 * self->page_size;
> -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 4);
> +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 4);
>   	ASSERT_EQ(ret, 0);
>   	ASSERT_EQ(buffer->cpages, 4);
>   
>   	/* Page 5 won't be migrated to device 0 because it's on device 1. */
>   	buffer->ptr = p + 5 * self->page_size;
> -	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
> +	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
>   	ASSERT_EQ(ret, -ENOENT);
>   	buffer->ptr = p;
>   
> @@ -1070,8 +1135,12 @@ TEST_F(hmm2, migrate_mixed)
>   }
>   
>   /*
> - * Migrate anonymous memory to device private memory and fault it back to system
> - * memory multiple times.
> + * Migrate anonymous memory to device memory and back to system memory
> + * multiple times. In case of private zone configuration, this is done
> + * through fault pages accessed by CPU. In case of coherent zone configuration,
> + * the pages from the device should be explicitly migrated back to system memory.
> + * The reason is Coherent device zone has coherent access by CPU, therefore
> + * it will not generate any page fault.
>    */
>   TEST_F(hmm, migrate_multiple)
>   {
> @@ -1107,8 +1176,7 @@ TEST_F(hmm, migrate_multiple)
>   			ptr[i] = i;
>   
>   		/* Migrate memory to device. */
> -		ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer,
> -				      npages);
> +		ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>   		ASSERT_EQ(ret, 0);
>   		ASSERT_EQ(buffer->cpages, npages);
>   
> @@ -1116,7 +1184,13 @@ TEST_F(hmm, migrate_multiple)
>   		for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
>   			ASSERT_EQ(ptr[i], i);
>   
> -		/* Fault pages back to system memory and check them. */
> +		/* Migrate back to system memory and check them. */
> +		if (hmm_is_coherent_type(variant->device_number)) {
> +			ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
> +			ASSERT_EQ(ret, 0);
> +			ASSERT_EQ(buffer->cpages, npages);
> +		}
> +
>   		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
>   			ASSERT_EQ(ptr[i], i);
>   
> @@ -1354,13 +1428,13 @@ TEST_F(hmm2, snapshot)
>   
>   	/* Page 5 will be migrated to device 0. */
>   	buffer->ptr = p + 5 * self->page_size;
> -	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
> +	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
>   	ASSERT_EQ(ret, 0);
>   	ASSERT_EQ(buffer->cpages, 1);
>   
>   	/* Page 6 will be migrated to device 1. */
>   	buffer->ptr = p + 6 * self->page_size;
> -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 1);
> +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 1);
>   	ASSERT_EQ(ret, 0);
>   	ASSERT_EQ(buffer->cpages, 1);
>   
> @@ -1377,9 +1451,16 @@ TEST_F(hmm2, snapshot)
>   	ASSERT_EQ(m[2], HMM_DMIRROR_PROT_ZERO | HMM_DMIRROR_PROT_READ);
>   	ASSERT_EQ(m[3], HMM_DMIRROR_PROT_READ);
>   	ASSERT_EQ(m[4], HMM_DMIRROR_PROT_WRITE);
> -	ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
> -			HMM_DMIRROR_PROT_WRITE);
> -	ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
> +	if (!hmm_is_coherent_type(variant->device_number0)) {
> +		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
> +				HMM_DMIRROR_PROT_WRITE);
> +		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
> +	} else {
> +		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL |
> +				HMM_DMIRROR_PROT_WRITE);
> +		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE |
> +				HMM_DMIRROR_PROT_WRITE);
> +	}
>   
>   	hmm_buffer_free(buffer);
>   }
