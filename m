Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5D29AB4B6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 19:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE70F10E6C4;
	Tue, 22 Oct 2024 17:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J1BL0koy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D735310E339;
 Tue, 22 Oct 2024 17:07:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPvDApYewuRF3+l7AS/EETrZtPnktTILJHi5iXrmydcpvQ6boPAiiVvW4KCQ2k0cqsVt68T1WEjzIKvBMgNVyCGTIsEfq/zGdRB8tu1DKfiDczr8Mps1ldpxTbwk0R00Ct/5N874V/32iM+OlZcgF+09o3hsxvI80YS8LZptlY3NinB5B7QwSbWzpv5yCTwmwdb17gk7bRJ6qXCc3TLj6A9A4p7MMGOLXC7ji6/wErnU/09GTbZ7tD/gCBd+za9fuQyLzOcjhQHBihZzbasL66NvXBIOaAxJZsh4UhXfaBTOmPjEcmIwcTg7YXqRL9OMzDRS1yR3rC/6dOo2hKoKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynxhA8rpHHqiq343qbS5L6YNT6kU0JXanPyIYd5j8mk=;
 b=wYzymPHdIgzwedxUL6tIKdXWJ3y7YsLx75ZfzQo3Cz86Un6DJJv0alpwwIJNlKX72umM4KyZKeFD8zGwVOK7vH5rUaksD1oGQikOw8EQuo6he7gJD4wBRemdgDQD4/IhQ36A9hHHXrsoNJN+CroK3tg5ekgiECjBgbgqzZFhy5wXjwRkTZi5OMsVAGgtYinPvHw/hZsozkNhP0v7wzAA0vvQkceC5VZEnhmQfAB728MljTVzYKYEFcVilWjP8pIIUQbEACtVmaQDkKvks3WW/TPpQviiCC2h8uWCWEdWqT+E7nsE68cIjdiclGisGSw975d6Q5xhy1tyE4HC5JBkxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynxhA8rpHHqiq343qbS5L6YNT6kU0JXanPyIYd5j8mk=;
 b=J1BL0koyczuir6UHS/yYbBfNcUHGFtHe4OBw9pzhv/LQcCtkY/taQrSdUMMEYg1O6NsxFrPm14oe/Jf8Ccd8Pf3IxOS8FSk9//Fh0FRIQTUKofidLrH8pPqWWfwz8vJMxabuDag9/twiSUL3HHybAeRJVOEb1JKuQdrBaHVlZAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 17:07:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 17:07:09 +0000
Message-ID: <3930f491-10a2-4863-8e24-009d3fbc2b23@amd.com>
Date: Tue, 22 Oct 2024 19:06:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
To: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
 <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
 <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
 <SA1PR12MB859939F759D6B661D49FC924ED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR12MB859939F759D6B661D49FC924ED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: 52072519-54ae-4a54-6c14-08dcf2bbf6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3JVSUNWc2wxaGx1YkRjT0d3SGdTRzVBdlltWUpNelAxYUxOb2t6a25zYW92?=
 =?utf-8?B?WDVBVnBDYkNpQTJkTGludzFoWWtTYWJMMkhPSmpYbGgzUWFUZE10OGNZVFhx?=
 =?utf-8?B?WURVK0V2cEJnNGs1WU5qTUM1czlQU0pvOC9oOUxISFRaNVE3dVhRN2hGelF2?=
 =?utf-8?B?QXVSY0N6T1pGSEdPVldrczZwSXFzM1c5Y05yN0lMSE5sR1ozajBRQXZhbVpP?=
 =?utf-8?B?ZmJRZVBxait1NVhPVXdFb3VsTTJYWExUMVVtLzhuc3pXT1IxZFNsNUlacFBB?=
 =?utf-8?B?bGE3czYzU0dkVFJhUHpSZTltQXJFLzFoM2xHS0V3eW0rLzhDTlRTd1dMWmdp?=
 =?utf-8?B?WUVRcFRiWkFKTWQ3a0NBdk5kdkRKT2xPMHI5MnZHQm9LNkhubXdYbnA3V2VE?=
 =?utf-8?B?NmJTcTNXckM0UDhPOHBFNUZ1OEYzNXB4OFgrcHQ4UFo1VW02eXUxSFNVYnFU?=
 =?utf-8?B?YUpFWnN4blAyYURkbHk3WFlXVndRWFlKcmZ1OVU1bnFkUVAyaHFpZUc3NFZ2?=
 =?utf-8?B?RWUySDc3Z2Z3R3N2ZHU1dDlXMWluQkNLVUZOVExYQnk3d1BlOEpWSjl1Q2ha?=
 =?utf-8?B?Z1dZZitydTBQSlEwZjlpT0duaEtUb013UUV2ZXY4Z3FJUlVFV3RQbDk5K3Rz?=
 =?utf-8?B?ODFSYTdrRWJrK2VLMWQzOFBEUGp4MUM1TlRWUXhVdzdqOS9oeDRic2VGNlJz?=
 =?utf-8?B?YWlaVXVLejFKUWJDbWxNQUwrbWFpOG9xaURtRjB6ZlBocnlMSFlKU2YwQVJz?=
 =?utf-8?B?dVd0K0VaNWZWSEJiTC9DeFJkTEZ2bkJTUVhiN2tNQUprTi9LNWRPWFg5SGtR?=
 =?utf-8?B?RW90dXpiWklnVE41R2d2clJtTW1CZHY0dDhVRzJ3Q3F0bnRMSFN0U3ZhVGhX?=
 =?utf-8?B?STBSTVVNVm94ZXRPZUU2Z1NWYVZmUDRQdmFvSy9mZmhJNVFIWWxaL3R0YWZh?=
 =?utf-8?B?akhNbTVocGxLWFpQS2J3em1sb1o0cFVNNDlNejhQdFN3M1YxTGxQLzFjUWkx?=
 =?utf-8?B?dDFlYkZjUXdvbEFUNnl0U1FMYm9QcTlFR0U3c0ZmbTAwNUNSZGdDK0dsVjh5?=
 =?utf-8?B?WERJQWRQbVNFQk5sVElxU0dJUENaeWhBd0k1MGMyWHpKay9DcGNrTk42Zy9T?=
 =?utf-8?B?VFo4eDRsMkVINTFRc0dsTFZUYytrWHVUbkgvUnJ6RXdxdHluN3gyZ1dsS0cx?=
 =?utf-8?B?eHlGbS9tTUxHWDQ4UHI0b3BHdGQyLzNKZHFnbkJMN2taV09TeEpxMEUxb1Av?=
 =?utf-8?B?M3kvWHNHcStVZEloU0ppclRqVzRyVnJ6TUliSkQ1VjcvSG9TcTFxSnFzWTQx?=
 =?utf-8?B?cklIZ3NVWlpnNTEwMTROZVZKN1l6ekluNjgwSk9NRmFXUFZ0VG9QZzg3YjhQ?=
 =?utf-8?B?RXZERnRiZWdyTzV1ei9raWF5V291K2NUaHFxa0xST3JaMTZnRVdLUFNYVERt?=
 =?utf-8?B?K3NDNjQwTUcrNjVlQnNMalNLRWgxYUFncGp3d3lROVp2YkhLWU5XQkZwR2Zz?=
 =?utf-8?B?TDlGcG4wZG5zdWZVNWgySWh2am9oaEtJVUpjV1B1a2hRdWx5WHVGUmZqMjJv?=
 =?utf-8?B?dlZMQlpDVzR6ZDFXMkNUVVVmVXpBUjFIMzJmdFFWdE42djMzK2ZESUl4ZjQ0?=
 =?utf-8?B?djdIY3ova0ZuTWJXbkJSUVhTQ2dCVHVXeGVjZlA1WTFRZ0FWS25JTXBnVi85?=
 =?utf-8?B?eGRwK2N6ejA4TmlpUDgyTWxvODgxaVhpMkU2M1JRUThyRXRQQUdUbHRCL3ht?=
 =?utf-8?Q?Nq3Fhge/48yim96z14qt4B8lpQZR7fKIsiOdaWU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlpLREV1dWVnOWljOE5IUUhDRk1YVlE3SkZncTJqY1FubjI2UUVFWXc5dElU?=
 =?utf-8?B?ckpKZDNXd0dOaWgyVHkxclBRMmg4L2hpdkNiWjZZd3oveTlCd0VEcXFWZThZ?=
 =?utf-8?B?MWFzZHcxNi9VTFhEY2w3cWJXVFZnUkppMFhJV1U0V2VIWS9MT3Vyc3dSMEN2?=
 =?utf-8?B?R1dQWUpxRXlpZVJRa1NLSGIrMTZpMWtBdnR2ajlXMFJ2T3hmK0E4dVM3Yndt?=
 =?utf-8?B?Y2xYRktIcEptZ0lmN1hacVBjRFlNdXB4ZEVBcVI0MUR6cDRNOS8zQmdiT0FR?=
 =?utf-8?B?ZGcvZXFOZUxEcnk1Rk5JZkxoV2NEZG9PV0w0OGJXb283cENBZGFncS9Cbks2?=
 =?utf-8?B?VE50aWRhK3RucEdZbWRtSXYzVEZPUDdBMTJCdTlNaUZRZDNLNE91dUF4ZU9B?=
 =?utf-8?B?WjVlcklMVHE3a0swNlJ4a0FhbmVqYS82Nk5UV3YzNjdGdUl2SWpyWEpwQURV?=
 =?utf-8?B?Nk10ZW9DTVM0TmZ3bGxiWmxTMW5zM0VrWEs0VTNON2ViM1loaWpsczh3dGl0?=
 =?utf-8?B?WDVOb3FIUzFSYTNEU1lFK002cWpKZFA2bGE0OXM5VXQ5ek1xYVBQVWRXREF4?=
 =?utf-8?B?Q3RIaGVHT25EUkg5OUtUTDlQRVNSbDR3TkhRaDdUNXkrQkMzU1hzb2QzRlhJ?=
 =?utf-8?B?WXJ6Z21oTlZITUdRWkRpTmJObVJoR1RvV1NVbHFRRnFXNGt2YmpzR284YUpy?=
 =?utf-8?B?U3crcUlTaG1JM3BMd3Z1NFk5dVZpRXZYZmRIZUcya1NTUEVLd1NLSGhmejdz?=
 =?utf-8?B?aUxIT1VudzF3TE9vQkhqZlNmUGxQUlNVZkYyR1JHcmdGM3lQenRVRUdrV3Ar?=
 =?utf-8?B?blhYZjY5TzhET1QxdE13aFNJcCt1a1BsLzIrMjhQSGVHREJTN3A3U08yOFNs?=
 =?utf-8?B?ems2eUlJN0V1SnhUcDFqYU4zQXQweTZGcWloU244aGZ5WHlpN2VWSmJnRkNL?=
 =?utf-8?B?cDN2QUhFNUlER1p5eU9nWGRkVG1ncGM1NWQ4RmNJaGlYVDFNWjdKY1hOM0NX?=
 =?utf-8?B?QnZ1WUloYTUyQTB2anVNeGUxVXB4b3ZiUEFLbXRLbGZHN2xHRG9SdzN2VU1y?=
 =?utf-8?B?cFZXbUtxYURjRU4yWHhBRU1aQmxzalVURi9ZOUFSWW8wYkpjdTd1QUI5YVli?=
 =?utf-8?B?Z2pHY2wzY21iMWw0Z3V1ZGlXVkdxaHhTUkpDSXBGbnhTM2VOeXhkVDY4RTFW?=
 =?utf-8?B?QjdVNVp6UXVlajlWOTF3RTdXempuYXRmOTF3OEpqMmI1R0xxY09STXFaNnor?=
 =?utf-8?B?eFlhRnJEd1lhV2x6Q0tseEg0T0FlUER0OXJEUVllMUVHSkU4Zy9LSGFoNVJY?=
 =?utf-8?B?KytKcHJYOXNTMmpwVS84Wmd1dEpKYWRpbTl1YWNYSUdQTnVpcmE4ZktTZXlD?=
 =?utf-8?B?MjNLdEJVU1psS3I5WStmSWxJWGFsMHROUVVWc1c4STFsRFVQUElrLzIwc1k1?=
 =?utf-8?B?MWpWNlhac0cyckF1M3V4dWZaL08wR2hkQmpGd2FGL3dPbHlRSCtnRkhDb1JJ?=
 =?utf-8?B?U3ZHaFZrYjVZTG5CbEhtdzlUVnhoeUpnVDRqTnBzVStMWTBVMGlWNktOZlNM?=
 =?utf-8?B?c3g4WkVBbWJxUm8yZ3NJR0lFUkRTZURaL2ltZ1Fodk5xcjN4NHFvWHBlZFFB?=
 =?utf-8?B?OHBtMTFCdEZsMmZEVmIybzNXOEh0ckJHWXRmeFRLR3BEWHhSdStsZlR6djRI?=
 =?utf-8?B?RVhCZnpubklKRytEaFZZUTFGT3Zya2M5SEgxRnhSaEpiSjU1OUZIZUowWkNJ?=
 =?utf-8?B?NTlKUFdzOUdRSzNMWTBOdzE2d2JzbElucTZEQzVtbTVUK2FCRHpOOGxOTW5w?=
 =?utf-8?B?YlEzaENjM05WM2UwS0JEblNMb3UrbnJBOW9CRmRxeFJxRHZROWphQ3Y0eXFz?=
 =?utf-8?B?Si9ocEtiWHNCM3RrSzd6YWtreTJyMWV1SUcwNVVLNHl6RGZwaDRXbjd3MWww?=
 =?utf-8?B?bEhnRnlxY1JGSnRackE1UmJvdjFGZU9QOUNsaGt0WWlCYlNycHlTTHVSVTNn?=
 =?utf-8?B?VEdMMzRjRk91WmtMQ05zaVptamFrbFU5d1p1SDVNZXhwS3pRVjJaOHB2UFhY?=
 =?utf-8?B?RGpZTmRiQjhBczlhZ0xsNzJPZUVjdnJFMFc1Y2lWQStERVQyNmVVN1VSdnkr?=
 =?utf-8?Q?WuQz3K8MQf1VFJfT2RKK0kN48?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52072519-54ae-4a54-6c14-08dcf2bbf6a9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 17:07:09.3622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJ82Oyes9+Gyt2KdQ9oz/+AMoEspLdI7nCyDb8ngzvXmsq+FdTiS7CDa+9a6+PVP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6701
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

Am 22.10.24 um 18:46 schrieb Li, Yunxiang (Teddy):
> [Public]
>
> I suppose we could add a field like amd-memory-private: to cover the private placements.

No, that is not really appropriate either. GWS, GDS and OA are not 
memory in the first place.

Those BOs are HW blocks which the driver allocated to use.

So accounting them for the memory usage doesn't make any sense at all.

We could print them in the fdinfo as something special for statistics, 
but it's probably not that useful.

>   When would a BO not have a placement, is it when it is being moved?

There are BOs which are only temporary, so when they are evicted their 
backing store is just discarded.

Additional to that allocation of backing store is sometimes delayed 
until the first use.

>   Since we are tracking the state changes, I wonder if such situations can be avoided now so whenever we call these stat update functions the BO would always have a placement.

No, as I said before those use cases are perfectly valid. BO don't need 
a backing store nor do they need a placement.

So the code has to gracefully handle that.

Regards,
Christian.

>
> Teddy

