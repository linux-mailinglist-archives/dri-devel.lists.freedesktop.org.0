Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6384252E5FD
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011B211AF74;
	Fri, 20 May 2022 07:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930FE11B010;
 Fri, 20 May 2022 07:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXbMZR7NftHb7DOKS0Kn59MHtVjrlYM7f5SwroSgnkG40TP9DpSlYL6FBA13L+V1WBVJNgjmtcnIrl2rUi0dUZyKe62mRB7B1dt3NCLAQitCYEkALY+npTfA0ec/1OzncnE9ef/8jIfpNLDoo3BM5esOCXfG43lFCcB+M2QxiOqtzJAiJjQ7wWODl1D6LA5KxBhyRgWRGIElxKAqGCAG250KuhycqUEYHTUtis4jHQtyl3e5Q+OlQMGEU3r7BAIiwVNe3TCv/mx9KNlDzdEoDh7quKAJszpefjkzhawJNqw5nyEVDMEqUh/9u8VAkEOrPF308RflqBr/0pJinu8JuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZTet1y+DEWDyYjEehs6YCUuD1Lt6NOQ0gb+anKWISw=;
 b=JF4pA/z4jOB01eVG4AsMbYjc4UrQyYExgLjeFbRVt73aHwG3d8GGbVKRsc2uRbok8WQVXTTLz+wAdtPlybi2bI4JcTcDn3fgCsmoPiJepigINi52o0F1/Gnnb4wNm7qM/rSR15RLJQmT0pA8ZoULRpZGiGHBgaScT8J0R9e/BiKFlEEY6W2kcMAQR3IrJAUe/IVnMyIvNZUFGsy7KJPLtFXdWJmRumH4kdDNsaVhUbKdqtlaal0IM4Odn8xOJH+jisfWN5rz/S+iSSbSZy4ROySdN6dio+bHtl98OuhpXjStcc2gW5vMQsCtv1+HKnrQQikWf41CPOG5WPYIInOxTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZTet1y+DEWDyYjEehs6YCUuD1Lt6NOQ0gb+anKWISw=;
 b=CDP9mcEpzsKEo+9XDOcltHjnTOhdzBajD0OLlalcZoZfoyocpyM07SApq8PkusCkHIjnbqli4tyY6cl727X8E4NY80MgHXFgtd+n7Qbk3h+5v3++L62Kh276zSYCkgZI63BD0R88fcAN3IbDT78MioHsObdxxcXamNuC/dr6h+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN6PR12MB2670.namprd12.prod.outlook.com (2603:10b6:805:6b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Fri, 20 May
 2022 07:14:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 07:14:32 +0000
Message-ID: <1c89ffc3-613e-e48f-26ad-ffbfd56b4c72@amd.com>
Date: Fri, 20 May 2022 09:14:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 04/11] drm/ttm: move default BO destructor into VMWGFX
Content-Language: en-US
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20220519095508.115203-1-christian.koenig@amd.com>
 <20220519095508.115203-5-christian.koenig@amd.com>
 <DM5PR11MB1324DCAE7CD6B1F16920B5B5C1D09@DM5PR11MB1324.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM5PR11MB1324DCAE7CD6B1F16920B5B5C1D09@DM5PR11MB1324.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0025.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::30) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 352642d0-c7be-4d4e-db48-08da3a306308
X-MS-TrafficTypeDiagnostic: SN6PR12MB2670:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB26708DF0B12163E72E11991E83D39@SN6PR12MB2670.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IiixgkI/Z+b+Cd0GPQ4ZIWGoNl/SaQRPByQ8VWYOSw5MN2VYz6iyDrpZinFvDQ1ZZfskZOy/VjmnpYXh3ya4F6O9lpVkCLeOVN65qLo5r3rzd+qFujpVfMylQ50zRkV4vRsyjr7LS6SOSUeZfiaE6O5c7LPZH4bWtsDBPNjTYhNq6RyYOwRawA/7pfCeipXiJNA98f/dtRF8u3CVn8G9346tPtwQz549w4u6CAFqLlVgyfYgjCPyZlo04tG+E6z2b3Po/zsKb7WfCnij4zAcwe01eZURWoUQUeuEVUQHg39NBTK6mnKhujENlmcgryTY6XjZzvaanlb8k6sWf9fcwbluTSXU639kSoJdVdnhtoi/BJ4pDEq6HfBc5mpBuzuQjndQ1LC+gKozi7PcRFNiJr7BnGyq0ALrp1dTTMwNuCRVI0b9gkstZk3Zt8PcWXY2THBDS+RVCrs/DPZ687gzvSaqHEwRxj+xiEf4hGI42PVsBp3BovisGT7MTjDtXqgQKrieC9cpgfouqHM9o5sS86CuVyZcy2S4d0VesTym9icY2ri5IqsgV39SpN3/H/Qx4WLYcXv4XOTakAtAsTidIp7VICeX3yJ00SzwC9IjT6c7SuhtBbugmbq5Bd+vvxfQg7wGTTcbJVH5yIOzECaQFMzy0MY6w5C9DGT139m+8Cd21IN9ZEREE6tsL64R0wXeXvWvq7qFqJZZdnlLJI/ohxRRezg/JbhnN+E4i0VWyUcCxGXQDGxG5IIBXf8oV6Md
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(53546011)(6666004)(31696002)(8936002)(5660300002)(38100700002)(2906002)(83380400001)(66574015)(66476007)(66556008)(66946007)(8676002)(4326008)(86362001)(6512007)(110136005)(36756003)(2616005)(31686004)(186003)(6486002)(508600001)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1FCWGZQT1Y2cEovRGhlaVViRTNjQ3Y0eXVJdlorcmh3OGQrNWNiTWtDUU95?=
 =?utf-8?B?aDAyUHBadU1JaVBCZmU5RTA5VUZ1TUJaZDNTTlNzUHQrWEZxNnhWa1BoeS8v?=
 =?utf-8?B?WVFBSG5VU2p2UU9MdmhIeVpQRVRKTjJwL2xDakdQUW55dFdsc00xck5IUmJR?=
 =?utf-8?B?MmsvaW9LaDVwUCtTeHIwY0JGWktSaEVFV0RXY3AzNndNQk5QQWV5QkRuSWVz?=
 =?utf-8?B?TjljZTh5NGVTeXZtc2RRL3NYSHltVzRIQkMxT0srZVVPTzljcnFDMnNJVGlu?=
 =?utf-8?B?Smd4eXVpcVFHZHBpTVUvSTVodjZPaVNVNmgzT2NhUlZudVJJMm12OHIwNWtX?=
 =?utf-8?B?NUZTMHova0U3Z2lkOG13ZGhDbmxIbUFoazEvRld2dnp5T1hlWVR1UXhwL1hv?=
 =?utf-8?B?WktFQUIrS2xGTG8ra3dJQkJwVzE3LzBldUNMQllkSjBVeW5IdG0xenBTMy9h?=
 =?utf-8?B?dnN0L2JEU0JuU1V0SDBHVG9VbXBCTWU5NTdmeWpGandBamJWZ1ZHN3E1NU9X?=
 =?utf-8?B?RTFkSFluSDJVQjJLQ05rbUpTQ25BdHNhTXNRSWtkUVRuT1VHVEZxVk5WUSs4?=
 =?utf-8?B?TWZQd1M3R1pZcEpmNDNZaEoyR2lRb1c0MzVQMnhGZDU3TXkxTkFJd3lMY1B1?=
 =?utf-8?B?UDQzT0hFWUlUZ0ZlZEVmay9BMkZYdjNIMEgvaEoySHc2MU9VbytoSGN6ck4r?=
 =?utf-8?B?dEwxOHVsdFB1VzBkSjNyZGRTM3R5ZXhQYmVPYXl6YVJkUlZtMlpVeUtLOGVJ?=
 =?utf-8?B?OFRndFdOSUJDTUllN090R1JxREtROEJQNHF4c3ovZC9nd0RudDFYeUpVd3RX?=
 =?utf-8?B?S0w5SXRsODAvMUE0ZGFzRDlaU294QlJ3RlJNZ1NSTlFqU2dPazcvSHd3NWZM?=
 =?utf-8?B?UHVxUVpieTZWTlFpTDBRaG8ySjZ1Q1FaODZaeVlkRVVNazc3bmk0elRyKzlh?=
 =?utf-8?B?aGp6WncwRGp4K25RdVAzckJ6UElqQksyV2JPWjY3T2xXTXpOVmhkdXErMlpM?=
 =?utf-8?B?MTF6U0M0c0VFN240cCtIWUhGSkk5M21CY1FwTXJHL2JQbjk4UjNJbkIwZUJu?=
 =?utf-8?B?WTR6eUcwNVF1NmJYM2Z1WHhMTXpjdUhIOGpEaEZheGFSWWNiQzgxd1F0Y096?=
 =?utf-8?B?L25NanVFS29PS2ZlUjRYQ3ROdm0rWWgyQnNWbzZ4Z3pYWjBkZ3IyalhFWmtC?=
 =?utf-8?B?R0FCMlNXcFptODNvdVVqRGJqWHBJK1JGNm5XTlNNZmVmcWhxTm9tYktBMzI0?=
 =?utf-8?B?bEF0Z1FBSWtWVTE0dUN5SlJSSy9kbG5QRjFLMUxLR3ZBOFR2WE0yQjYzR0xE?=
 =?utf-8?B?amZsRndaL3ZvNnNnc0d1c2xIc3FZcEtzdFZmNGVJczhCSDBjR2xPdERia3dR?=
 =?utf-8?B?cGc4dW1uMHVoN1dYbXQ0c04ybmY0MnExSU1tOEhmRGNNekU1eUhoMVQ0aTZI?=
 =?utf-8?B?Q1ZTZXlmMDI0RVpQaHpnZEk3aWNib21IM3FEN3BMRDFmWnJyTEd0MEkvUldq?=
 =?utf-8?B?bytWTjBvTmQ2WUYzSkhXeDgxZ3BwczZLU2x3MjZldHEvSG1hMWplVFpnbm1V?=
 =?utf-8?B?eWpwNHlEbEFUSGJnbGpXMmJ4U3lzWmlTNk9XemtCU0YveUtGeXlCSUtMc3Ba?=
 =?utf-8?B?QXRlYzdoenRjSERCMzBwVkt6d1hONmNtUVgrVFBkazY2OGVMU0dQSjd4OFdI?=
 =?utf-8?B?VHdRc0tTbVVqZnIwNlhOVnF5WWpIWGFBMWlaUlBVWUZHV2NVVFFCTTFmQXBB?=
 =?utf-8?B?eUMwT2I0ODFSWjZqSFVMSU9rdnhrdDFRUTQ5OWc1cXpCdHFqSFdpQ2xidDly?=
 =?utf-8?B?MHdYOTcxQjFVVnNDUXlvTHdwczhzeGFxczV2cFBlekJGU0xZV1dWalpwajZY?=
 =?utf-8?B?ZktSSkRrOURYOVV4WHpXWHYyWEZOR2dGcTZEQ3lFOWRpYk8xNUtVWFhMN3Zu?=
 =?utf-8?B?M3ZxcFJwTU1aa05ncGVlTGNkOVhLZ21DUkEyNS93MWVBdjBBODhRWlpZT1RO?=
 =?utf-8?B?SXRHVER3N1BQNmZOaG11RkZvZWZ1V1BoTGd4bnNFMXM3NTlEWGM2dCtTWFVZ?=
 =?utf-8?B?TndHWm9qbkd3cEc5Q3Z3bWxOTjg1U3N0blkzbGJBRzJOUGJ6L3pQQm5DeUht?=
 =?utf-8?B?Sy8zYk41d2FpVjdrRHJDSFBnWUc1aW5Vc1JtcGNlMkdpci9FbFVDSmRqK08x?=
 =?utf-8?B?M0dQU250aFNJVktjNDJKZXdsZURNZ1QyY0xmeHhha2ZkNWZvYUQrdmJaZk84?=
 =?utf-8?B?Q01EblhkVDZHMjFEb1V1Nkk1bkxIaDJ0c3h6ZzYvRzFGa3V6YVpBd3RSNU1p?=
 =?utf-8?B?UHVXbTFUdTl0aEk1aktQZkJTc3d1dE94aFExRUh2VWdJOHlpOElYT3RlVUVG?=
 =?utf-8?Q?LrUHz6liPswavtNKqqHd3geSeaxsLz6ySmLxWHCBpHt6o?=
X-MS-Exchange-AntiSpam-MessageData-1: hTU0KxneRR6Fyg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352642d0-c7be-4d4e-db48-08da3a306308
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 07:14:32.2587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYfvnUdi+kBVohN/vo82hxhZpAoMWDebuuCSAb5Jusl1DNQANbJ2sBHw8/Ht/yiK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2670
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
Cc: "matthew.william.auld@gmail.com" <matthew.william.auld@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.22 um 15:36 schrieb Ruhl, Michael J:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Christian König
>> Sent: Thursday, May 19, 2022 5:55 AM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: matthew.william.auld@gmail.com; Christian König
>> <christian.koenig@amd.com>; dri-devel@lists.freedesktop.org
>> Subject: [PATCH 04/11] drm/ttm: move default BO destructor into VMWGFX
>>
>> It's the only driver using this.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>> drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 3 +++
>> 1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>> b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>> index 85a66014c2b6..c4f376d5e1d0 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>> @@ -462,6 +462,9 @@ int vmw_bo_create(struct vmw_private *vmw,
>> 		return -ENOMEM;
>> 	}
>>
>> +	if (!bo_free)
>> +		bo_free = vmw_bo_default_destroy;
>> +
> vmw_bo_init has a WARN_ON if this is NULL.
>
> Also, all of the callers use vmw_bo_bo_free() or vmw_gem_destroy().
>
> Both of those unmap, release and then free the object.
>
> It doesn't look like vmw_bo_default_destroy does this work.
>
> Is this the right "default" path?  Or should the WARN_ON be used to check
> for this?

This patch here was just a rebase fallout I've overlooked.

Zak already reviewed it and I pushed a modified version of it upstream 
(that's where the WARN_ON comes from).

Thanks,
Christian.

>
> M
>
>> 	ret = vmw_bo_init(vmw, *p_bo, size,
>> 			  placement, interruptible, pin,
>> 			  bo_free);
>> --
>> 2.25.1

