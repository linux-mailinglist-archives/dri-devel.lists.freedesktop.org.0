Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054807E2E68
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 21:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5263310E415;
	Mon,  6 Nov 2023 20:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2072.outbound.protection.outlook.com [40.107.96.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2752F10E415;
 Mon,  6 Nov 2023 20:48:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVgfb+JNOJ9OsHGa1akdC8pcwSnsjbJgeN9hq3usYWe2URf6II6gxog5JaC83T82gj596e9LZVOMKS0P+V0vvMi0MEB+kGXA0OnjDFpdq2JYBhIFdIFv7ZZs1rudruaDWjfQVlFvEixTLHRT9essLtBYSISnLNQHBCms8bxZY4smfhacRvXJTc7rzKiUipyDYsJo0ovJer2te6U32BUVeaTTV8Dfv9Ipmxi8+1wMMnlW1fHFqsau/ybW+pt/ViajzBDO/W8674+ohXmSCLjnpKZ6ljRTzBz17jjNQfHfeeVdUVbNYQ0SZkZq0yT9larA3DWL7k+KddY0rm+T822swA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVonQOX/y2OlTXvNhbeFD//BCbJAGBm49gZJgApbauw=;
 b=CxR1439pPMB+CWipgRDKlauwvh8Zb+0MhqSqn7IkoYvTvs4vR1JZM4mlJs5qLyKIs3SrTZAJGqyDLPPTlVxDXnzqMpTG9evS590OfoykloZrRl9AdUN/WqFBeAcnEoY63goxj2SOZCjP2HHaTTo/OavovPGnwksMRgQKlgICRQyc+Q/pOgrk5SsqB7SVUaszH2rN06rwtD+Z3rOWvXtZrw5JOlDfBTLN0MyVlbuIB+4cjP236KI4EbGZ9Gs9BHQVGpdNGtLMiBH5IDelqAbPUX10DunZq3VzjYe3n4W03aZvgwi0uu4aOHT3ul70FiglAMnxl1x4L1PCvM/EmpXhdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVonQOX/y2OlTXvNhbeFD//BCbJAGBm49gZJgApbauw=;
 b=o1XYqo0jvyA+KAPD5rdezClsLDI78zE5DFy8sojH/BpfLeRliqWTAha7+KA0vLZ408e5fRxhBBQKQJr/7o9Uu8intRO3xbXf9hSLRzNn9s7FEe1Ej/vnqhG79LUuzRT9+Y2tQdYnZ2SeyTAHW1MD2FDmxYxspG//UW9qqqK6OsE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB4481.namprd12.prod.outlook.com (2603:10b6:5:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 20:48:21 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 20:48:21 +0000
Message-ID: <4b0fd975-a2b8-4bfa-b06b-b08f704a099b@amd.com>
Date: Mon, 6 Nov 2023 15:48:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/17] drm/vkms: Avoid reading beyond LUT array
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-6-harry.wentland@amd.com>
 <20231030152928.02cd8301@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231030152928.02cd8301@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM6PR12MB4481:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f34a0d9-f56e-468f-d677-08dbdf09b658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0cEuaAQNGqzZhciV5wmYqCOOg9a3reFQAL7vpmSzzWnRsrhw0g47Bwfci/Px9HQidmO3k8P6Cn0dW6BjTKL1LblaidwHKqQbu/7Mb4ZuZxB8MmGyE45CY9nVDZGIiKPC2i8gDAAglwScQ1+N0NbLE6lX9Z4yPtJ7tCUnJrHqSp3KMoeHWljqPLA8zC3a5ecU6u+vcRN4KkiEcDJaw//j87OdA1cX5HejJmtPZangOHyyZpENNNdbpHyCAH4huwg5ltaNZunbOdYzxyrV6davufOc3oKtmPtDvBPWwnc257DlMvGQxAQ+P+O6EdU6b9jGT/XKp0qkHRKUUGTBBDjmkM6XV59tT5LAgkWJ2i07GkoY8Ow+mxG2glQqkj/qUmcC5oUM5iytnL8N73LZe7QZ0hDAT1tf9/2spi/hJJRyRYsB8oDvdiD6NxInkZJ9dJoOmjRgVu43OIPEEe0vL2b1AN8riKobCHtZLu2o1N4Mf9a5fbZXwJfLdMcTgADXHDN7v1ex2uudeQh7rDyKr5nlYHbdSSbNme8VtT0A8qPQAx/ohEvsX60azXp58nHhxB9+px4/WkJ2zSb7mQj7RwDL69qKV7F45hFmpxoTH+MVMcgyobej0SgtFo9ioiEtlreC4jADrTUyVnRcUCZjfTw//A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(136003)(366004)(346002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(86362001)(38100700002)(7416002)(5660300002)(4001150100001)(41300700001)(2906002)(31696002)(36756003)(66574015)(478600001)(83380400001)(31686004)(53546011)(6512007)(66946007)(26005)(2616005)(66556008)(316002)(66476007)(6916009)(54906003)(6486002)(44832011)(6666004)(6506007)(4326008)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFQvWDVYYU1yZkZLaWlkVENNdzF3U1h0bDh2aFlrUlN6WXN1eU9GMHl3NGEz?=
 =?utf-8?B?dk9QSDViK3JPdXpnWUc5VjRLbFRmZEY4QUc3ZmhJYk5uc2s5T1F5a3RmcENu?=
 =?utf-8?B?dUhaMkVDSkVLenR6Zno3RUVpSzN5VW1uaC83b20vT0dtcHdNYTBlWDZwT29v?=
 =?utf-8?B?UHRuUkZoREZqZW1MSEpoWm54dXM1algySjZRMWFjVDR1UElsaFM5T0Z3Zi9k?=
 =?utf-8?B?ZXJQQWxBQm1rNUgydlVYSDNwV29qQ01CcWk1ZTlCbTc1Z0drREtpaUlqVTYz?=
 =?utf-8?B?L05DQ3Y2NVRWMS8ydjJaY3pFQkIyK3I3a0hyU1dURkFlc29OMXNWTzVTNU4z?=
 =?utf-8?B?L1djSzR3VkpQZVhOa1dNTzU3SStEMlYwMGkzcmJ4aVU2SnNUSlJMUUwyN2Jp?=
 =?utf-8?B?K3gvc1U2V2taR01UNlU5b0padHFsSC9Za2hpeTYvN1orakdiS093eFJ1MG1H?=
 =?utf-8?B?cU9FaldpdmloMzBkNjlRb1hDVzZmeHY3K01yRVFlMUszYUcxWlVWS0szMlNr?=
 =?utf-8?B?WHVZUTl6dk9pVzhKZExaOCtlVGg0VUVyRWxpVFhHQTR3anRVWTJmNXMvemJn?=
 =?utf-8?B?ckJlUU90YUZIWGR3UVdPaFBzTFJpWW9hWS85anFpeU9MNTgxbjZzT3FXU3JR?=
 =?utf-8?B?ZEo2RXRWZEdlbytYenU4UE9oTUZDYWNGelJRdWJMU2QxbnZmK24rQW9kbmo4?=
 =?utf-8?B?cGE3RGtvdEtMdktyN3RPRUlCOWM4U1JtSExRWHprV01zRlhnSE96b1FzblNY?=
 =?utf-8?B?ZXR2Z3VRQklIMWZya2tyd3RQSlc5UWtqVmNjeDFZRzB6MkJLVndQeEwvR284?=
 =?utf-8?B?ZVE2WUJqSDlIYmtkdWExblA1WTdkV1E5dll0VkFucmRGd0oycDhpQ08xNzNw?=
 =?utf-8?B?dWduQXFzMFIzRHRKWHZlQktmL2NNTEs2Umd5YWYzdENGRWZ3ZXFqQ0dXNzRQ?=
 =?utf-8?B?eHZBV1BIQWN2V0M4cFBsbkFvZ01TMW9WYzRrSXNrZlI3UUFTbmtFRVhocmd0?=
 =?utf-8?B?eXZ6TGoxbzNSTERBbjRlZmgxOVF0M0xKMm5rNGJhWTFPT3d1YlZXNVpLdWJ6?=
 =?utf-8?B?SFV3eEE2WDN2czhRR1RmY3I5dmFtYnhZS1FaZU5ZejA3ODUwalM2c0Zvcm1L?=
 =?utf-8?B?UzdjWkhFUk9ELzV2N3pnYTdzWTMveEJKWVVvcnNDRUZGak5qY2J5L3dkdWds?=
 =?utf-8?B?THAxNVhSd2RCLzgrdnBTdUtYNk56WFc0eDBiWE9JZ3M1aXZ1ak5yMGxhbzd1?=
 =?utf-8?B?cUdGUXhGYXRqakdLTzJzM1J0UjBKZ3E4N3Z1QUlMdSttRmc3L08rdUc4Vlhx?=
 =?utf-8?B?TVpwREZ4UDQrK0ZJTzlBUTFqZ3AzQjFSQmxTdEh6a1puYWQvZVlOSXRoR1Vt?=
 =?utf-8?B?bmNSTmpRZ0VkclRDTDg0RDA0SUdpVDBKYmpBbTF2dlBjUWlqVEZZOEZ0Vjgz?=
 =?utf-8?B?RWN3bXI0elIxMGJNK2J4cDFrYjI0T0lndnFiUS9kODBVbVdGTUZUeFpqTDlo?=
 =?utf-8?B?bHA4czBYVnN5aW9GcEpIZTZiZi9rV1VXRDBJemNFblJhSkNoY3BWUFV1ZVV4?=
 =?utf-8?B?MG1Rd1BCK3dpNkU3MHBvVzdMWG1YZWtEakxUNkhzWkxDT1JnZDQzQkpzaWhB?=
 =?utf-8?B?QXp2MElVbFd1cTBXTmFIcXY0dFQwT1JTU2hKV1JxSklSeDUwN0psaGloUlZm?=
 =?utf-8?B?VnJpZ21LczhleTFWYVJYRmJSNEpvejZVTnJEN0ZpR0dicWpNdytUZi9yaGRM?=
 =?utf-8?B?eWRwc3JYWWxocmVoTVozZWJZcDhzT0pWTEJFWnVxNFdlQ2dzNDI2bGlOK1Z4?=
 =?utf-8?B?M1dDVGExUTRuZGhDaTdqVFRyV1QvcGltWlJuUCt1NWs3dVVTVTBUdTRtdmRS?=
 =?utf-8?B?VXhYL3dhTUsyWTBCaUxmL3B3WHREcUxMYnA0TVFXSytMY0tqRzFFbHRTbk84?=
 =?utf-8?B?K01SMThQVk04d0QrZ1MwZC9BZnZPOEZaSnpJMWFiZDF6eHludzBpQkF0VTk4?=
 =?utf-8?B?blJPaTdSSXlwc0FJWU1wamxVa3A1dVRITHIvMXB5VG5pUmxiWTNzYXZXK250?=
 =?utf-8?B?L2U2OEU3Mk83QnlCT2dsc3hoWmFvUTFiUVVHWktGWmF3OVlvVG03S0xyczRp?=
 =?utf-8?Q?DSyXQYmd/trohq4YVZ8ONsNLe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f34a0d9-f56e-468f-d677-08dbdf09b658
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 20:48:21.1647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zOQ63Wu1aIw56aHcHHLYXV3xche2WklCq+nIVNcJbmpBD+zzC1Rwr7kE5jPBonR4JVuLCWKY4su7dSp5CgidA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4481
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Hector Martin <marcan@marcan.st>,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-30 09:29, Pekka Paalanen wrote:
> On Thu, 19 Oct 2023 17:21:21 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> When the floor LUT index (drm_fixp2int(lut_index) is the last
>> index of the array the ceil LUT index will point to an entry
>> beyond the array. Make sure we guard against it and use the
>> value of the floot LUT index.
>>
>> Blurb about LUT creation and how first element should be 0x0 and
>> last one 0xffff.
>>
>> Hold on, is that even correct? What should the ends of a LUT be?
>> How does UNORM work and how does it apply to LUTs?
> 
> Do you mean how should UNORM input value map to LUT entries for LUT
> indexing?
> 
> I suppose UNORM 16-bit converts to nominal real values as:
> - 0x0: 0.0
> - 0xffff: 1.0
> 
> And in LUT, you want 0.0 to map to the first LUT element exactly, and
> 1.0 to map to the last LUT element exactly, even if whatever
> interpolation may be in use, right?
> 
> If so, it is important to make sure that, assuming linear interpolation
> for instance, there is no "dead zone" at either end. Given high
> interpolation precision, any step away from 0.0 or 1.0 needs to imply a
> change in the real-valued output, assuming e.g. identity LUT.
> 
> If LUT has N elements, and 16-bit UNORM input value is I, then (in
> naive real-valued math, so no implicit truncation between operations)
> 
> x = I / 0xffff * (N - 1)
> ia = floor(x)
> ib = min(ia + 1, N - 1)
> 
> f = x - floor(x)
> y = (1 - f) * LUT[ia] + f * LUT[ib]
> 
> 
> Does that help?
> 

Thanks. Yes, this is what the code is doing (with this commit).

The commit description was an oversight and only reflect my initial
thoughts when coding it, before I made sure this is the right way
to go about it. I'll update it.

Harry

> In my mind, I'm thinking of a uniformly distributed LUT as a 1-D
> texture, because that's how I have implemented them in GL. There you
> have to be careful so that input values 0.0 and 1.0 map to the *center*
> of the first and last texel, and not to the edges of the texture like
> texture coordinates do. Then you can use the GL linear texture
> interpolation as-is.
> 
> 
> Thanks,
> pq
> 
> 
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Sima <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>> Cc: Hector Martin <marcan@marcan.st>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Sasha McIntosh <sashamcintosh@google.com>
>> ---
>>  drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index a0a3a6fd2926..cf1dff162920 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -123,6 +123,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
>>  				      enum lut_channel channel)
>>  {
>>  	s64 lut_index = get_lut_index(lut, channel_value);
>> +	u16 *floor_lut_value, *ceil_lut_value;
>> +	u16 floor_channel_value, ceil_channel_value;
>>  
>>  	/*
>>  	 * This checks if `struct drm_color_lut` has any gap added by the compiler
>> @@ -130,11 +132,15 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
>>  	 */
>>  	static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
>>  
>> -	u16 *floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
>> -	u16 *ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
>> +	floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
>> +	if (drm_fixp2int(lut_index) == (lut->lut_length - 1))
>> +		/* We're at the end of the LUT array, use same value for ceil and floor */
>> +		ceil_lut_value = floor_lut_value;
>> +	else
>> +		ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
>>  
>> -	u16 floor_channel_value = floor_lut_value[channel];
>> -	u16 ceil_channel_value = ceil_lut_value[channel];
>> +	floor_channel_value = floor_lut_value[channel];
>> +	ceil_channel_value = ceil_lut_value[channel];
>>  
>>  	return lerp_u16(floor_channel_value, ceil_channel_value,
>>  			lut_index & DRM_FIXED_DECIMAL_MASK);
> 

