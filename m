Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC54694273A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 08:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2771310E2E3;
	Wed, 31 Jul 2024 06:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UIBj/4LR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F31D10E1E1;
 Wed, 31 Jul 2024 06:57:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMlFNmppLnQ5BFCiejbSi+zDSk9XRrHs8qVEkf7ppxbAV7rb9EpUVSqbldUkGVtThqnH3ogOyhl1DNcs4wyvJ0+7R1zh/6ZREpL/Q4wUZ3cOyaiTR1vzHP8AQWrlDQ7KOWgbZ4Y8t63NaQC5PBSrVnXc2VOieDrrgObTv5bk54ZiNXD9srPfw9avIILZxS5Td0CMXmJcBCCZ7NZ51P1LZwUVaWm6F/reMDp7GmKPqxo62Pu7Dffnm+9LABqDNdbiqQFkFOV7XZaA2fNgODH700MVHZJuJOYSu9O/kaRrTQJVmG9CLNx3v++2fPeqk7Oe9FHfbyYI6tBa2Q1hCDIoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYIIedySQctDTao/7dQTWqWcvtcm9i1rv2vfZR9L2ac=;
 b=ythdHp+tG4udTQZHf9kDKO1mtylKYIXfiStWZM/tpQLAvNxzXL1RnB4DQAdUveMR75gzvQaL5VIUcUXrvpr6JRSdw7spGwo+zqbm8mB+vnn1WJfCJ36j1bFv5cWgk9LEjWZssGj/HKL5dr0dr5LBhd8FKs4Iwt+y6LfRIaYV0c2fqAmQq1og1Y0FimTw9yfNAXgTePN4wXxiiJjIiTSTPg86dxrY4FyZDI4yKIMoz8zuRwtWRfwCI4TgYr+yRQmh2MGNRkNYPPBT/bw6HBsrJ9LYMRXjC26qEaN3OQJuxDGN8CjgBuF7IGpdTMLZtO0eH4TRzjHMAWY8P/v9Cyh+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYIIedySQctDTao/7dQTWqWcvtcm9i1rv2vfZR9L2ac=;
 b=UIBj/4LR7gg996j9W2B+D8sET5/S3ddF39Rhz4JFdMrIlW1zhtbJzhpxrMeNxM1Jd0K+7a2VCeWE4JzGtgSdnqvaETh1M7TbHq4v4axrKE+juZXvZrx+XcIG09hA0cwwR9i9+u7IV7qOwVrlzVwjfLL7q+jz/t4kC92bLeK7EIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8848.namprd12.prod.outlook.com (2603:10b6:a03:537::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Wed, 31 Jul
 2024 06:57:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 06:57:02 +0000
Message-ID: <a80ec052-72a3-4630-8381-bc24ad3a6ab6@amd.com>
Date: Wed, 31 Jul 2024 08:56:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon/evergreen_cs: fix int overflow errors in cs
 track offsets
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jerome Glisse <jglisse@redhat.com>,
 Dave Airlie <airlied@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20240725180950.15820-1-n.zhandarovich@fintech.ru>
 <e5199bf0-0861-4b79-8f32-d14a784b116f@amd.com>
 <CADnq5_PuzU12x=M09HaGkG7Yqg8Lk1M1nWDAut7iP09TT33D6g@mail.gmail.com>
 <fb530f45-df88-402a-9dc0-99298b88754c@amd.com>
 <e497f5cb-a3cb-477b-8947-f96276e401b7@fintech.ru>
 <1914cfcb-9700-4274-8120-9746e241cb54@amd.com>
 <cb85a5c1-526b-4024-8e8f-23c2fe0d8381@amd.com>
 <158d9e56-d8af-4d0f-980c-4355639f6ff8@fintech.ru>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <158d9e56-d8af-4d0f-980c-4355639f6ff8@fintech.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: 3673df31-0679-4f35-b8c8-08dcb12dfb29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0JQYWhLRXM5OHZwZVdDL1lseEFOSTBDUkZvVUZPZW42bkVqenA5aHVqVnBD?=
 =?utf-8?B?am9EUy9UY25UVGp1Zm9MMEhnckFlTkRWTkhMeVFKMnN6eDBqZ3dMVEh2alhj?=
 =?utf-8?B?VzBESytkbGVHbE5NbE9xbUpKa3NkU2pVVUZIN2MrOWdCNHIrK1BTanQ4d1Vz?=
 =?utf-8?B?WGZsRnlxTVE3SWppMU1mQUZDZ2lpZTh3d1V5YVRqVEU2ZTJOYjRsOGtzT002?=
 =?utf-8?B?aVdqeXBjUFdGMW5tcllaU1g4c2RPSU02THBvVVhUelc4bGpCNSs3NmtYbUVQ?=
 =?utf-8?B?VEd3TUF0RkZiSDZKaHFCRHVVMU9hc1E3NW8zNm9qaHFmR3ZFSE96Y2djRUkv?=
 =?utf-8?B?K3Z2d2RjU1JpUjBnSDB6YzcyNjF1WkxKd0pMT21lTlE4QUlOYm8wTnVIREZ6?=
 =?utf-8?B?enhybFU0L09RaGt2blNHNCtvRkJ0aGJLQzZSSitWVmlzVFpOV3d3bEgybGh5?=
 =?utf-8?B?UGhLNExuR09NWE9hTVJLRWRybDYvV0VvaVhTQjdINEV0S2dLVnpPQjQrY2FY?=
 =?utf-8?B?THRGRlg1MFc3MDVEdW8rdm5QZGtUMFBYb0k2K3VnZU5mLzNVVnFUYUhTZ2Fo?=
 =?utf-8?B?emt0RW9yaWJnN09GNWlOQzNIYkNWZm8yNmpSc1FqRU9sbFlXRlh6L1A0OUhK?=
 =?utf-8?B?RytDMmh0ZFphbXQxSjc4WlZSZk8wSWFJZWlINi8xdGx2K2NuNW9Uem9XNW9M?=
 =?utf-8?B?aHhUYlN0SzNyWDF0OWVzM0R5azE3MDZDL051cmxPcU1iNlhMVDNXaFY3dFgr?=
 =?utf-8?B?cEwzRmFtdkxSV05wVktWU3VOL1hpUXVLUEtPQjBza3FyTGxKOFZOVnJqQWxN?=
 =?utf-8?B?Ymt6K0JiamJMVldySDR2eXJhLzBZWWFYR2kyZi9ROWtOYjZmTzM3dm5CZWZk?=
 =?utf-8?B?clZCY2hPc0QvVGR1Zmc2VmJ5YWFuYXNtMWh0WS9XUVBSVjNucWhkb1F1N2VN?=
 =?utf-8?B?V2NGYVJVaFV2b2czMGlZOFZRdFV3SjVzZXNyK05lVVBTK2w1dUFkOXNHZ3h6?=
 =?utf-8?B?WnhHU2tGQURZRTdLWTNUT3VxSS9KbHVZK1c2ZlgzbVJtMFl4Vk40WEk5cUE2?=
 =?utf-8?B?YVRDL0pRaGE1cnRhOUV4MlJnUTFHeDlGUGRPamQyQjFwUFdwNHlxekFWdU9F?=
 =?utf-8?B?bktxa3l6ZkxBY0h1aXVHZEFDelMrWnloNUZ4dE5USDBmNEIwek9RM2FBNGlj?=
 =?utf-8?B?ZVRPQnBvY2xlekFmUGg2bU13WXcxeVNjdFR2bHkvbExYTlBONW40WXlLcGRQ?=
 =?utf-8?B?RnQ0elhyME1TOTA5RVF4c3JENU5mM2xvR3dUMStiS05hZ1lJajc3S1hKVEE2?=
 =?utf-8?B?RnlrNmYyR2phbFBhRWNyVXRxaC8rbWNFVy9VaTJQOW1SeFhOR1R3aGhXak81?=
 =?utf-8?B?R3lROXhHMDZET3hlUjE3V2NIek1LenZ0ajVFUDAvenNRMGVJUFFQdXQzVFVt?=
 =?utf-8?B?dkxFT0plc3BGSVN0aEtMY0NtRlpuMHc5eFcyYjRNTnFZQ1hLUmNqY05HcWx1?=
 =?utf-8?B?cHh0aVgrTURXSGlMV01vbW5YaUhzL0pEUmg1RTI5U1YyZDA4Vkx5STRtZ0Vu?=
 =?utf-8?B?eHNnVWQzbk5nRGZVNkhlYzZacVg1Sjd4TWdwdVBIQ1A4WlNGak4rRTdZR0h0?=
 =?utf-8?B?NGVhREJmTzRUbFFJZmhYZVRSMEpnT3hwdWxQeHBCaEF5TCt4VXJFeSsrNVcv?=
 =?utf-8?B?b3FLUEo2YmcreGlqSC9uQVpzT1JHaHdJTXV4Ykg5N1g2cjh3S0hobnhFM0ZE?=
 =?utf-8?B?blZHenNkRzlYZXgrN1NHUWNoU2Nlcmk2Vnp0VjZpdWcyanVlTDhuazhWZHhD?=
 =?utf-8?B?T1RPKytFcVQrNWszR1hDUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUpISWVWdEFvcmRIczl1ZXpJd3BpMWhGV05OdmxKVENmVFJ4VzdNb2dFMWto?=
 =?utf-8?B?TkRFeUVyY2g0Y0t6MjQxbEpHMk5RQVUzMGp1MVV6cm42ZDlGd2prNmsyaFJ6?=
 =?utf-8?B?UWRJbmRHbk1rbDBoNkJCZGZFZGR1bGRGNC9CK3NqVUlEOEI4Q3dub3ZFTkds?=
 =?utf-8?B?YUZJQmNCNTRlREpDOFd6TEtiRjlmQmN1aHUwZnFhbGVrU0FORDJkWTM2Rmwr?=
 =?utf-8?B?c2dPdmZzS3J4ZzhGUCtvR1Q1eVZxSGs4WDZzZnNkVW5hUTgwQTNJUVpvYXBh?=
 =?utf-8?B?Y2FOdm1kaE8wMXNaSklqcGxrVTAyOHFsR0pldlNMVWFVZDVYZHgrUkI4M2Ji?=
 =?utf-8?B?eHFXQk9PT1BVRU8ybTZyUUFUQzdMbU9xS3JpNTFXREFxMkpZaVNjOFhLK3JW?=
 =?utf-8?B?dGdOSkJIdU9IUFlrbFlPbVJtaXowWXBnN1NHbUxPbzc3Q3pSaXJHQ1ozS1VG?=
 =?utf-8?B?V0VmSWY1bXdSb0RiQjg1VjBOZnNHT3gvT0dRQU1wc0FGa2t2Ry9EbHo0SWg1?=
 =?utf-8?B?cVc5dlNORFdKNTFKTjM2aXljcG45ODlCaVZDUUlpQ3F5cWVxSWpPTGFkWERj?=
 =?utf-8?B?czFycW9VWmkydGZJNkpIa29iU09QTFJKblhoWmtkUjJJTzJFd1ZUeDE1WjJk?=
 =?utf-8?B?MTRTcU1uaDgrN0Z4bmxCVDJhb0hjNTlROE1KTVpVRjRHVzU5RDFrdmdTYklV?=
 =?utf-8?B?ZjltZUNmU2syTTJxc1dBTHNtdzI2cmNyZS9OM0phNGNMZUtxTmp1L1dwVnJU?=
 =?utf-8?B?MWF1Z2plcHF3UHVvU1VrSDRGUVVCSFI3Q0pBK2lUWmxaeXVTRU5kc2Q0WmRj?=
 =?utf-8?B?RkN4VnlQZFFWOTR4QW5uNzNSQ3NQL1FIbTFPYktoZlpkR0p0OElRUDFFS1pJ?=
 =?utf-8?B?a2NRL2xTR25xT0FiMURPK0I2ZHlyTjh3bWliSlBiZTUvVStZdThBbnJBbEVB?=
 =?utf-8?B?U3VSWDk2cS90aFhjQ3ROOUdWT1hqdEVrcXhabm9vWUFaL20zVWc5N1RvUWZI?=
 =?utf-8?B?QUlsZ1RFUnYrUjFXcDFFcmU4ZVdsWVVFbVpnbHJsRGlLVG1UNEFTZy9oemFq?=
 =?utf-8?B?Mm04VmVUS2gxeGRIa2g3eWZ1NmlkaW9naG5uOCttQWFidjY3THUxaTNrWmZX?=
 =?utf-8?B?Q3FBSThtQU5VV2sxcEtDVXNuajlNZmVpdmVSUnNNWFlMK2RKSE90T3FMbFIw?=
 =?utf-8?B?Qm5WU2w2YTcvKzRqRHRmMEVhSnBjOGxzRXVtbW5iVEpMaHB3MitMeUh6NVRO?=
 =?utf-8?B?UXJqckloak1iSG9MWXM5QXM4OU85YVZmNUN6T2hnQWhITTMwWlZEVVROZkc4?=
 =?utf-8?B?Vi9VSVlCaElJd1pESzZ0MnNXR3M5UGU4bm41cnhpc0MxVEhHalptVTZPSGlu?=
 =?utf-8?B?ZmZPNmNiQXBGUm5scnJmekNvNjNOcEk2UUlDWUFHOGlXQXRkcVl2MWJZVVZE?=
 =?utf-8?B?Z1JPTWNTK2FjTC8xS2dYVTY2YnBuZFBoZTVkTTdpNUhJalloQVZ5RjMzOGJG?=
 =?utf-8?B?YmxmeThrRnZnb21FZGVLYjVsQlJMenBCbE5CRmtvZWdneXgxUTFJSFBxeExa?=
 =?utf-8?B?ZStaeWc2b3owbldzR3c1WGFZanNTVXpXWmtkdHl0T1BibkxnS0tNTVp0VkRk?=
 =?utf-8?B?bTZzM0RWeW1FYkJISGhnVzJoK2ZWQm9xZDBXRHV0ejBiTHhCVGVwM2l4NWJC?=
 =?utf-8?B?OFd0NlJGNzdiZnVETUpJcGZQbVA2d2Z6TmZsZ21rSXFTUzIzVTUyZ0ErVUov?=
 =?utf-8?B?U2U0NFNjZk5tMENnRHJJa28zTHJ2YU1tUlllU0RrMXNJcXZOT1htWks3dC9z?=
 =?utf-8?B?ZTVUbDZpOFJXM0FmbzF0bW51aUdGRGxwdExXSG5YZ0tpSXE0NFhNN3plWXR2?=
 =?utf-8?B?SXcyRnVPVGxZM0ZXb3l5c0UxMTFja3ZRbEI1RUp3dXZhaEFlS2VWd1BKUTlZ?=
 =?utf-8?B?N1IxbjE0TXBMeVNlMmVzWk52UVpGc2UvVmgrZGx1MFphaCtVSm9rSVE3QnJ1?=
 =?utf-8?B?dFFaODhuTmlhSkEzREVaZlhJNGlDcWdKUWNVZ0NTeXlKTGVScWxaNXR0WGpK?=
 =?utf-8?B?eVoxNytNRDROVUpUekxGcjNmK0t2bDRKTXBBY2FCNmlJTHV0a2VhcDVva1VT?=
 =?utf-8?Q?mspZxH0QPYZdbOT7zvtJLyGJn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3673df31-0679-4f35-b8c8-08dcb12dfb29
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 06:57:02.6059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYTamG4UQTHkOZpkxDZpkLpYZ08bL5EVhooVURbeLw2RgXoQ+CYeGrLvgn2vxkNq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8848
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

Am 30.07.24 um 19:36 schrieb Nikita Zhandarovich:
> On 7/29/24 11:12, Christian König wrote:
>> Am 29.07.24 um 20:04 schrieb Christian König:
>>> Am 29.07.24 um 19:26 schrieb Nikita Zhandarovich:
>>>> Hi,
>>>>
>>>> On 7/29/24 02:23, Christian König wrote:
>>>>> Am 26.07.24 um 14:52 schrieb Alex Deucher:
>>>>>> On Fri, Jul 26, 2024 at 3:05 AM Christian König
>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>> Am 25.07.24 um 20:09 schrieb Nikita Zhandarovich:
>>>>>>>> Several cs track offsets (such as 'track->db_s_read_offset')
>>>>>>>> either are initialized with or plainly take big enough values that,
>>>>>>>> once shifted 8 bits left, may be hit with integer overflow if the
>>>>>>>> resulting values end up going over u32 limit.
>>>>>>>>
>>>>>>>> Some debug prints take this into account (see according
>>>>>>>> dev_warn() in
>>>>>>>> evergreen_cs_track_validate_stencil()), even if the actual
>>>>>>>> calculated value assigned to local 'offset' variable is missing
>>>>>>>> similar proper expansion.
>>>>>>>>
>>>>>>>> Mitigate the problem by casting the type of right operands to the
>>>>>>>> wider type of corresponding left ones in all such cases.
>>>>>>>>
>>>>>>>> Found by Linux Verification Center (linuxtesting.org) with static
>>>>>>>> analysis tool SVACE.
>>>>>>>>
>>>>>>>> Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni
>>>>>>>> tiling informations v11")
>>>>>>>> Cc: stable@vger.kernel.org
>>>>>>> Well first of all the long cast doesn't makes the value 64bit, it
>>>>>>> depends on the architecture.
>>>>>>>
>>>>>>> Then IIRC the underlying hw can only handle a 32bit address space so
>>>>>>> having the offset as long is incorrect to begin with.
>>>>>> Evergreen chips support a 36 bit internal address space and NI and
>>>>>> newer support a 40 bit one, so this is applicable.
>>>>> In that case I strongly suggest that we replace the unsigned long with
>>>>> u64 or otherwise we get different behavior on 32 and 64bit machines.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>> To be clear, I'll prepare v2 patch that changes 'offset' to u64 as well
>>>> as the cast of 'track->db_z_read_offset' (and the likes) to u64 too.
>>>>
>>>> On the other note, should I also include casting to wider type of the
>>>> expression surf.layer_size * mslice (example down below) in
>>>> evergreen_cs_track_validate_cb() and other similar functions? I can't
>>>> properly gauge if the result will definitively fit into u32, maybe it
>>>> makes sense to expand it as well?
>>> The integer overflows caused by shifts are irrelevant and doesn't need
>>> any fixing in the first place.
>> Wait a second.
>>
>> Thinking more about it the integer overflows are actually necessary
>> because that is exactly what happens in the hardware as well.
>>
>> If you don't overflow those shifts you actually create a security
>> problem because the HW the might access at a different offset then you
>> calculated here.
>>
>> We need to use something like a mask or use lower_32_bits() here.
> Christian,
>
> My apologies, I may be getting a bit confused here.
>
> If integer overflows caused by shifts are predictable and constitute
> normal behavior in this case, and there is no need to "fix" them, does
> it still make sense to use any mitigations at all, i.e. masks or macros?

Well you stumbled over that somehow, so some automated checker things 
that this is a bad idea.

> Leaving these shifts to u32 variables as they are now will achieve the
> same result as, for example, doing something along the lines of:
>
> offset = lower_32_bits((u64)track->cb_color_bo_offset[id] << 8);
>
> which seems clunky and unnecessary, even if it suppresses some static
> analyzer triggers (and that seems overboard).
> Or am I missing something obvious here?

No, it's just about suppressing the static checker warnings.

I'm also not 100% sure how that old hw works. Alex mentioned that it is 
using 36bits internally.

So it could be that we need to switch to using u64 here. I need to 
double check that with Alex.

But using unsigned long is certainly incorrect cause we then get 
different behavior based on the CPU architecture.

Thanks for pointing this out,
Christian.

>> Regards,
>> Christian.
>>
>>> The point is rather that we need to avoid multiplication overflows and
>>> the security problems which come with those.
>>>
>>>> 441         }
>>>> 442
>>>> 443         offset += surf.layer_size * mslice;
>>> In other words that here needs to be validated correctly.
>>>
> Agreed, I think either casting right operand to u64 (once 'offset' is
> also changed from unsigned long to u64) or using mul_u32_u32() here and
> in other places should suffice.
>
>>> Regards,
>>> Christian.
>>>
>>>> 444         if (offset > radeon_bo_size(track->cb_color_bo[id])) {
>>>> 445                 /* old ddx are broken they allocate bo with w*h*bpp
>>>>
>>>> Regards,
>>>> Nikita
>>>>>> Alex
>>>>>>
>>>>>>> And finally that is absolutely not material for stable.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>>>>>>>> ---
>>>>>>>> P.S. While I am not certain that track->cb_color_bo_offset[id]
>>>>>>>> actually ends up taking values high enough to cause an overflow,
>>>>>>>> nonetheless I thought it prudent to cast it to ulong as well.
>>>>>>>>
>>>>>>>>      drivers/gpu/drm/radeon/evergreen_cs.c | 18 +++++++++---------
>>>>>>>>      1 file changed, 9 insertions(+), 9 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>>>>> b/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>>>>> index 1fe6e0d883c7..d734d221e2da 100644
>>>>>>>> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>>>>> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>>>>> @@ -433,7 +433,7 @@ static int evergreen_cs_track_validate_cb(struct
>>>>>>>> radeon_cs_parser *p, unsigned i
>>>>>>>>                  return r;
>>>>>>>>          }
>>>>>>>>
>>>>>>>> -     offset = track->cb_color_bo_offset[id] << 8;
>>>>>>>> +     offset = (unsigned long)track->cb_color_bo_offset[id] << 8;
>>>>>>>>          if (offset & (surf.base_align - 1)) {
>>>>>>>>                  dev_warn(p->dev, "%s:%d cb[%d] bo base %ld not
>>>>>>>> aligned with %ld\n",
>>>>>>>>                           __func__, __LINE__, id, offset,
>>>>>>>> surf.base_align);
>>>>>>>> @@ -455,7 +455,7 @@ static int evergreen_cs_track_validate_cb(struct
>>>>>>>> radeon_cs_parser *p, unsigned i
>>>>>>>>                                  min = surf.nby - 8;
>>>>>>>>                          }
>>>>>>>>                          bsize =
>>>>>>>> radeon_bo_size(track->cb_color_bo[id]);
>>>>>>>> -                     tmp = track->cb_color_bo_offset[id] << 8;
>>>>>>>> +                     tmp = (unsigned
>>>>>>>> long)track->cb_color_bo_offset[id] << 8;
>>>>>>>>                          for (nby = surf.nby; nby > min; nby--) {
>>>>>>>>                                  size = nby * surf.nbx * surf.bpe *
>>>>>>>> surf.nsamples;
>>>>>>>>                                  if ((tmp + size * mslice) <=
>>>>>>>> bsize) {
>>>>>>>> @@ -476,10 +476,10 @@ static int
>>>>>>>> evergreen_cs_track_validate_cb(struct radeon_cs_parser *p,
>>>>>>>> unsigned i
>>>>>>>>                          }
>>>>>>>>                  }
>>>>>>>>                  dev_warn(p->dev, "%s:%d cb[%d] bo too small (layer
>>>>>>>> size %d, "
>>>>>>>> -                      "offset %d, max layer %d, bo size %ld, slice
>>>>>>>> %d)\n",
>>>>>>>> +                      "offset %ld, max layer %d, bo size %ld, slice
>>>>>>>> %d)\n",
>>>>>>>>                           __func__, __LINE__, id, surf.layer_size,
>>>>>>>> -                     track->cb_color_bo_offset[id] << 8, mslice,
>>>>>>>> - radeon_bo_size(track->cb_color_bo[id]), slice);
>>>>>>>> +                     (unsigned long)track->cb_color_bo_offset[id]
>>>>>>>> << 8,
>>>>>>>> +                     mslice,
>>>>>>>> radeon_bo_size(track->cb_color_bo[id]), slice);
>>>>>>>>                  dev_warn(p->dev, "%s:%d problematic surf: (%d %d)
>>>>>>>> (%d
>>>>>>>> %d %d %d %d %d %d)\n",
>>>>>>>>                           __func__, __LINE__, surf.nbx, surf.nby,
>>>>>>>>                          surf.mode, surf.bpe, surf.nsamples,
>>>>>>>> @@ -608,7 +608,7 @@ static int
>>>>>>>> evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>>>>>>>>                  return r;
>>>>>>>>          }
>>>>>>>>
>>>>>>>> -     offset = track->db_s_read_offset << 8;
>>>>>>>> +     offset = (unsigned long)track->db_s_read_offset << 8;
>>>>>>>>          if (offset & (surf.base_align - 1)) {
>>>>>>>>                  dev_warn(p->dev, "%s:%d stencil read bo base %ld not
>>>>>>>> aligned with %ld\n",
>>>>>>>>                           __func__, __LINE__, offset,
>>>>>>>> surf.base_align);
>>>>>>>> @@ -627,7 +627,7 @@ static int
>>>>>>>> evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>>>>>>>>                  return -EINVAL;
>>>>>>>>          }
>>>>>>>>
>>>>>>>> -     offset = track->db_s_write_offset << 8;
>>>>>>>> +     offset = (unsigned long)track->db_s_write_offset << 8;
>>>>>>>>          if (offset & (surf.base_align - 1)) {
>>>>>>>>                  dev_warn(p->dev, "%s:%d stencil write bo base %ld
>>>>>>>> not
>>>>>>>> aligned with %ld\n",
>>>>>>>>                           __func__, __LINE__, offset,
>>>>>>>> surf.base_align);
>>>>>>>> @@ -706,7 +706,7 @@ static int
>>>>>>>> evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>>>>>>>>                  return r;
>>>>>>>>          }
>>>>>>>>
>>>>>>>> -     offset = track->db_z_read_offset << 8;
>>>>>>>> +     offset = (unsigned long)track->db_z_read_offset << 8;
>>>>>>>>          if (offset & (surf.base_align - 1)) {
>>>>>>>>                  dev_warn(p->dev, "%s:%d stencil read bo base %ld not
>>>>>>>> aligned with %ld\n",
>>>>>>>>                           __func__, __LINE__, offset,
>>>>>>>> surf.base_align);
>>>>>>>> @@ -722,7 +722,7 @@ static int
>>>>>>>> evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>>>>>>>>                  return -EINVAL;
>>>>>>>>          }
>>>>>>>>
>>>>>>>> -     offset = track->db_z_write_offset << 8;
>>>>>>>> +     offset = (unsigned long)track->db_z_write_offset << 8;
>>>>>>>>          if (offset & (surf.base_align - 1)) {
>>>>>>>>                  dev_warn(p->dev, "%s:%d stencil write bo base %ld
>>>>>>>> not
>>>>>>>> aligned with %ld\n",
>>>>>>>>                           __func__, __LINE__, offset,
>>>>>>>> surf.base_align);

