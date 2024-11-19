Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E7F9D2656
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 14:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345DB10E33F;
	Tue, 19 Nov 2024 13:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2bIQYYNe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAE610E34A;
 Tue, 19 Nov 2024 13:04:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8b8Qa8jMczGD6/XesMgKoKiO7HGbyB5yqRbFilCJrD+KPQZCMZPWVO371KSUKBCDJztIslYhRaFIPhG1p8A6Q2b57ToNjJax9UtpMi5Qz0nGHetZ3Jb3RiEUUDkbMBg05MCfKdBl1qFP9aKbsHDIonQg8pt18gxEGwUCqUsVntW7ZxYhetBkBVbWXBjosueaCU6lcseq3LrNOV70ijDmrLT2Ck/dp7HBEaiAG4/f1uzJ7yP1XTi5+3Ny09eMNsOWh1PGHEw489g9CSf91f//0r3/wptU9Z1YUDgEh0mN3nLEu4sdMExgI7R9+E3Yw/xuE88CI2V7m8vHQUxN3+pDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uBnloOW5+j+k4Hyn/O6c1uTrSmitUmrGekMA0Z0Fo0=;
 b=eq1UZRhJK2APD+F5i98SXoVUaSuJePovfvxasBZTg4PTuC1E2JH2cQoa/SdzVPCZm10aY2rHpgAM6i6C6SSMHO6n9RSpyEFt9mnInv5d90/MBLl7nV4Hsv5cL/XXxpZ8/5y8NYAwZSSB5gSABysYH9Ui24vtRcTmgIixmcPjtoSwe6OtCd9wYyGhVAMe7deCSjoyBxwv58hyRiwVPK/OsQquSuxR01sYTPtMJbzieGlr/o2CxGeVBE0od650AFBI9h39Bv/AAv7IF27QvO5zjmnFt4GUfjEk2h2qeFeaXT/ujJgjs1HmoI6w+yVYJq5eUQzpgZ03hMaMGc+TGuTeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uBnloOW5+j+k4Hyn/O6c1uTrSmitUmrGekMA0Z0Fo0=;
 b=2bIQYYNeiqmmZTRgfPJSdU29npKhMQ++jGk3ghuWuQNQ+df65/qHk+xpXv5EelEckDLJlNWaZSYk08KVyDA305GTV4LXXJZO5wVoAd3IisvC3VU6n6wwdDBdN8zket29Q/Osw8MWVuzvuw3lGmFf1ruEWN8cTXzau68Vg4N/A7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7920.namprd12.prod.outlook.com (2603:10b6:a03:4c6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 19 Nov
 2024 13:04:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Tue, 19 Nov 2024
 13:04:32 +0000
Message-ID: <f1c9230a-d0b8-4322-b7be-09afdfe938db@amd.com>
Date: Tue, 19 Nov 2024 14:04:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Merging the xe / ttm shrinker series?
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <ce4c83dfa93e22487ed80e855318cd8f92a054f2.camel@linux.intel.com>
 <c0ba86c43497626c329a7c4ee9cf1ebc96279519.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c0ba86c43497626c329a7c4ee9cf1ebc96279519.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e69400-3aa8-4e74-ed85-08dd089ab556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnpVdjMzR2VtOGRiU0x0MXp4WWd4M1I4djkxZ0FnQkRXUnU0ZHVIWTgxNjhJ?=
 =?utf-8?B?NUZiUUpEQ3lxZjRMK0dOYnlFbytPM2NUc1JmU041bGtIWjNSS0Fua0tiUjRa?=
 =?utf-8?B?amN4Q1BHV2kwZ3hleFdMbkd3Zlk3clhOdlZ6MlJVak5QaDBCL0orWkFqQTY2?=
 =?utf-8?B?S3IraUhXcTFHY0JUVGxGWEFRQTN1b0t1Z250WS9xcEpqWmhaTExYdTdscGFx?=
 =?utf-8?B?RytOYTFYZStxajR5SEg4eEFJNno0b2VIa1dabWk4QkJiSEZ5RlBjVVErNkU5?=
 =?utf-8?B?cVhjeHFBNzFRS1NGU1pqV3Y2enREeGVZTi95ZjB4Unk1aWJxMXMvQjY4d1lD?=
 =?utf-8?B?Y2NsWUcwRlUxbUdPNGdSdDFjSXNHSnJhSnlHMUJXZlFhcmlFeEtKbm9tb2VN?=
 =?utf-8?B?MENMRFRpTlRhaUhqU2I4dldOb3FZZFh5RnBsRUg2RHlDZWlHRDkyMHVnamFI?=
 =?utf-8?B?VXRCVlFSTHg3b3RZNjFITktTNUhYdUVoN21vMXYzdUpnNzBlQURibTZkSWtH?=
 =?utf-8?B?VVZYWkxHNlVyY3N1clFqemlnNFJQZ05pLzlTRjBwN1FCSVVnNTdMU2NRUVJ0?=
 =?utf-8?B?MW9qMlZzd0lNR05XOVpKZzErbGFIN294b0QrV3hBL2E5Q29EYXNmU3ZZWmJV?=
 =?utf-8?B?Ny8yQWRYc0M3QndJeFVPRW1PVlF5Tmp4blcxaW1wM0ZBYzFxa3N6dlFaNVpW?=
 =?utf-8?B?Z01rRGVkZGdjUFJEMnBFYWVQd1RDVVVoaVNvY2d3WGx0SXZ1ZjRHTHI5Z1ht?=
 =?utf-8?B?NlRhNHNxZktlMGpMU3BKSDdIZzN4cisxcGJZQVZNeEw4eHA3Z2pOekdIN0Zr?=
 =?utf-8?B?dWRCWFZPR01oMklBZGpYRS9ZQktIMGhqczl6WkwrOVdQckMwNGxCWEZiMW9M?=
 =?utf-8?B?N25XWmVkd3pocFRPWmJTb3dvVm9sb1hTN1Z0RlpXQmxTTk03N0RrNEdjR2gz?=
 =?utf-8?B?enNod0NRTFUrZDFNVVFHdUJrWmkzYmVCcklScFpBT3NsdlV0b0VBVHpmTGhH?=
 =?utf-8?B?Tkt3VnNuRUlPSjV4WDhYSnlJT3VDeFUyNTIzMmtRZ2tQTnVoU2dqR1Q3M2xi?=
 =?utf-8?B?TmY3bHhOTnNkZE1iZmVYOERaV0VxR1BLS0Y3eW9pbXV5WFU3Y1BlUDdHSEZZ?=
 =?utf-8?B?WndHMG01aW9zcUFjWWdUcUx0WER2MnZlQ2ZmZVIxTWVod1hiMG4rRVN2Ymoy?=
 =?utf-8?B?V0xUY0xaZlJzRXlNRlVibU9xZTB2ZFpzeEYvVjhwNTF5OUFRZkNqZCs0cDdJ?=
 =?utf-8?B?a05Pd3dSTnBhcUVleng2UWcyUjBEU1JmTFo4djdTU2MxVDgvblJ1L3lSbW1T?=
 =?utf-8?B?TkxSSFNONXViUHMwVFpKWnYvSkcvS2hvVmg1b3FpVlR2eWpra0VRc2luM28r?=
 =?utf-8?B?amZXanZPcWtzbHBPNi9XZ0F3dEl3L3JZTElZWllrajlCMm80Sy9NWkxhUXdQ?=
 =?utf-8?B?TnAveFVDRHViZmE1Y1F6VjBGd090bWl4dU1PM0ZRb0NwM2J6ekp4WDdaaHlz?=
 =?utf-8?B?L1hWNFE2QzVGVHlDTXRFQ05neGtTcmNJUzRBTyt2ekZnZE5KU05ZWHFVMjJV?=
 =?utf-8?B?cHI0NzNSK3hXd2NSNm9IQ2x4WFFvUVloK2tLS2NtT1AzWFVSSWxnRyt1dy9B?=
 =?utf-8?B?NW1KTnRDY1hjeUtyY3Y1QmM2a0xKdzROUk1hbENGaHArcVBVWGsvZmtpdHlj?=
 =?utf-8?B?cmdraEM0UUFDeEVUTGpTVW84UDVudW95OTdubHBPWlJiWHRWakVoT0tTT3lk?=
 =?utf-8?Q?Tqa8Cfp5WcuDXHYIYw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bThXZFNpNSsxMmFoWXJENXpXQlhVRkxnS0ZHdE85RVptMmxDUkFnb242Mjhw?=
 =?utf-8?B?NlB4TmJ6NXAwMDljQTVIQThxdGsxbUUwajZIanpHUGVpY00xaTUxVXRDei9n?=
 =?utf-8?B?Wk1LbUtvSHF4V0VhWUxMT0djTFNudS9OTytEa0wxdnZKeE1lMTZwTkE1NExL?=
 =?utf-8?B?RW5CcGFkQTFXdkJTTlhyMjNpdndGb3RCQnZwakFrdlhzdUVGenUwNHJkVTJ4?=
 =?utf-8?B?eDh4YUtOVzlWRVczK1JvQm9obUZnQ053ZXpLdDN1STBydWxvai84T0xZYVdG?=
 =?utf-8?B?WmttOVorZG9laFJ3UTFPVGMvMVd2WXJkQWIwUzUxYWdjeC9oNDBmNVpyMXk5?=
 =?utf-8?B?azlpRVpINWhvMENzYUN0WEszUHdDblV0ZllCV0c4Z09IUzF1Zytjd1dLOXhR?=
 =?utf-8?B?OTNFblVXVGsxV2lrdTA3UDF5aEdJU2JxL3VmRG9Mdng1MEFvYmJpVzZEaW8w?=
 =?utf-8?B?c1p6K0Q1UzZHZWFUKzMxMVEvTVNkTHBpUnNPZXNPL3RDc2h2T3Z3aWVoOEE0?=
 =?utf-8?B?Tys2Ni9QOFVNSFpnckhJVXJBZGQrSGZBQ0s0M3BkbHVjUTdkb0lyWXdvRGs4?=
 =?utf-8?B?enNpNjgzaUhjUDVWUkRxUUQwQkJtNHlMMDZXc3pVbzk4L1Eva1k2bjRLay9x?=
 =?utf-8?B?d1V5MzRwS01IR3NGM2VxNjc2bFJ2U3ZmTjdkck1tL0NXbUtCWUJxNEc1ZEN2?=
 =?utf-8?B?MnRReWJESnJKOWJ3N3NUOVp4NnRaa2pzLzB3SHJJZ1MvV1ZsQWFCZmpXcFRY?=
 =?utf-8?B?cjRObitwdXI1RlVON1lHK1RvNEt1dWtjaXUwendPdEQzL3FHSEpyajRuN05P?=
 =?utf-8?B?SlNFWXo0M1g0dkU3UFFNMVRNUW90WnJjTjMrcFB1LzIyYVNYUERtdEdxNGMw?=
 =?utf-8?B?L0E1TlA5VkMyeWFZcXp4QittNENuamVQRlEyRVExTnNvS3c4cWFZVWd4dHNk?=
 =?utf-8?B?endvWWUxR2p3dWZDdktaYXJ2RnVsTERlb0NLVkUrNUlFVnJWbGlSSmZqZkpM?=
 =?utf-8?B?SE03YnpmOG1lNVZ0VS93d0krRTRuNGN2ZW1PR0k3QURRUkJFTW5HTzhqdDlZ?=
 =?utf-8?B?THdKQ1lyeGxCSVovc2RLMWlsTWRRak9vRU5xaHp4MkRXMVlEM0pMYmF5RVpM?=
 =?utf-8?B?TWZjSzRjNWZkb3Fsc0xkc2xQOU1ra1BsSWJvSEsxT005VWFHbjczalU3bSt5?=
 =?utf-8?B?NVdxejhJalk1ZmRLL3NTaUU0YUpUenFoVit4elJIaENzNTdqMzNSMkNVTDhL?=
 =?utf-8?B?TWF4WUtzYWwvOFIxVk5mc3A2OHdaZ0E4bzZqM0pLOVBJZjVEelNlbm4zY2Zj?=
 =?utf-8?B?WU5PRm1TUFUycDF3RGFrKytjNXUyc0dVUURrZGxyQ3lCQ29UU3hWYWIvSWhW?=
 =?utf-8?B?OU9hSFg5MXoxRHJqZFdkb0swUXlKN1c5SU5rNHpBTk5kWWtkcHNHWE9IT0k4?=
 =?utf-8?B?bSsyNEl5VU15aG16eWdLSm9YZk1hY2VwMkIrdWx6bnpzQ3NoeGJnRUl6ZGRl?=
 =?utf-8?B?WnFZM09HRVB2b0c5WHk3UklWc2VudkpaSm5NUWJZMk1oNnpkNEtaRjQrQ3B3?=
 =?utf-8?B?eWFuQ1QyeUdESXB5ckFOWVg2eXJtUzJoWG5qckhsR0YyOEU0dFBqQjdpN21l?=
 =?utf-8?B?dC95YlpwUGtlTG1sQVJWdVljYkIzdFRhYWVhSURYRkFhMHhlWEhKVnhCczEv?=
 =?utf-8?B?Yk0rNVVTMHoraWJRckxGRUtxTkJvYzhHNkp1TUhIWmdpa2V5V1dGVm5rL05G?=
 =?utf-8?B?YlFrZXExRGdzbXFPVlMwSGtFMDYrUHdhby9Md1MreE9KTmNocDdmV0k2a2ho?=
 =?utf-8?B?RTVPUDN4QUo3SU8wQXE2NytvUXJpTWQ4RUdhTFhHNDJ3TWwyazk1alBTQnBF?=
 =?utf-8?B?aHU4c3A3cDByY1VsSDlrRmlYZldKS0pyNERqZTFWdys4Rk1aWDdOaTJONDM4?=
 =?utf-8?B?Y1l0L3hLY3RWdHlHalViUE5VVVpYT1J0aS9zOXRSb21ib3AzUVBielI1SjI3?=
 =?utf-8?B?cnN4WEhOMkZJZGhuMlpEcHRDOGhneU54Um1wOGF3VTRyNENidDR2SFFMZjN1?=
 =?utf-8?B?NHhQajZWeDVROURicUM1VVR4Y3dCU3JaK0ZpQXBmRFlSSXVhWjFDc3JteE55?=
 =?utf-8?Q?qBqpXrYzA6yg90ru/fQkMal5y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e69400-3aa8-4e74-ed85-08dd089ab556
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 13:04:32.3838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxAoekK8T7H/QCT3Nkl2EP97nZ0vCiLkZSQ9QZh6nmzpp71eO+ydV7iehegHEnP0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7920
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

Am 19.11.24 um 12:22 schrieb Thomas Hellström:
> Hi, Christian,
>
> On Sun, 2024-11-03 at 13:38 +0100, Thomas Hellström wrote:
>> Hi, Christian,
>>
>> The TTM shrinker series is now at v12 with all patches R-B:d.
>>
>> Ack to merge through drm-xe-next?
>>
>> Thanks,
>> Thomas
>>
> Gentle ping on this,
> The requested change of the ttm_backup interface done and MBrost has
> extended his R-B.

Yeah and you guys keep pushing stuff on my TODO list additionally to the 
stuff the AMD guys are pushing for.

Give me a few more days, it looked mostly good. I just couldn't wrap my 
head around splitting the huge pages so far.

Regards,
Christian.

>
> Thanks,
> Thomas
>

