Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E360A4F98D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 10:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FADC10E217;
	Wed,  5 Mar 2025 09:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GD7cUkKh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9973A10E217;
 Wed,  5 Mar 2025 09:10:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8cerhbkGn7NtVnDxrBKTzQXkaydOkYai9CRsG1IllLrm/Cll43rzMsALxiRa3T2Bt3taE2LUWPvB5v8CKSkZeYRZ/1z/6Zc3or1lh14VaRhmy4wbpQfl5/OTpagWB0KQhz1X/7pfCMb8q2ptL8D0CvLx+kNdrn/1yPmoUYsCCGI4KLSTLUoeklN71xLL4z8wPMTsZC8JR7Ft09cAtKami7Ui8Uhkno4sOTpaUtg1bFYUeFvtgEn6aaBtnnQdXHDi2++YdbyuJMGAblh42GSVl/Oh9RzEp4AQAA2Hpi93kv3LgkMLl8EwIUV8/OAUjpEIsHJ8KbPwI/KEbA41myXmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ANjBPZc0S6A9M9xLRdn5t7GABqz1qnuw7rTuthHJRE=;
 b=DnX0ewK3Hc/GJ18/alYEupkqXgtBDsPfSe1KcxPqTDknrOFWtKFG04O+z9izKvqyFZ3ZSMbWauKPqrG53FSn2xw5oLrqSapCUtT8EiQwySbHdwfUnX1uS9/6rPcUVkeZ1xI5BWcRUKedtmWI9mZuN4KSSJnSRLR8HLHe9UlD1qdohp4t4Fbn/xWNsepI7u+1wK111I4diSXS+RamCQVh93rGQeS6RuKlsZMbd/9FVcHGQ50zA+SVLd5r0WVQXnqNazGpF3v3zu6IsA9BAlpLtHBSXJbHHxYsZuwKi+bQgi+sRIdauHnCzpwjB9Ad23I1CEYnRPJeEP/nziLCc4HCKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ANjBPZc0S6A9M9xLRdn5t7GABqz1qnuw7rTuthHJRE=;
 b=GD7cUkKheORNbnP8yuPacIfRC9xrJ2G2sn5kXGm93IfEAw/YCf80P04mSCYcdDM5cGOu2EGL9mX/Ex9sSZ5uZgnt70fRyJ08PRRHrhzJu6fC1loy2wlITUvpOpHX2kIOfurlgoHMw4eP0hJK6ZcC8XXRCH4yaDhZUYs6/Q2yf8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7867.namprd12.prod.outlook.com (2603:10b6:a03:4cd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Wed, 5 Mar
 2025 09:10:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 09:10:19 +0000
Message-ID: <eee837e3-a6a3-4585-9297-a86a926fedc4@amd.com>
Date: Wed, 5 Mar 2025 10:10:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: RESEND Re: [PATCH v16 2/7] drm/ttm/pool, drm/ttm/tt: Provide a
 helper to shrink pages
To: Dave Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20250130101325.3068-1-thomas.hellstrom@linux.intel.com>
 <20250130101325.3068-3-thomas.hellstrom@linux.intel.com>
 <57ec915f-f766-413e-9377-af37071f29d8@amd.com>
 <cdb50c7a4e721afd6cebfbf7cacab6cd8cd524c7.camel@linux.intel.com>
 <a57a92694883a2243def43ee1c9b803d02c8e1b3.camel@linux.intel.com>
 <CAPM=9txN-FsAk=W_QbyYhUk9fWios5t-h5oL=ZrdTKoxKjWVWg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9txN-FsAk=W_QbyYhUk9fWios5t-h5oL=ZrdTKoxKjWVWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6101b6-ae00-4595-8cad-08dd5bc58ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTA3VFA5MDVPd2FnTy9xL3ZiS0pqOENKdTlEODlEbjVxblBuSmRsRlVBTFVo?=
 =?utf-8?B?eDNVUlJ0c3N3WlZ1b0JqU3pHUnYyN2tPc2JGcEVvZ2FnYVpVaFJWandSL2JU?=
 =?utf-8?B?d3lTSWYrYStGa1ZGSXFBOVJSdUIyaVNFQU9rekJDV3pxR2lSNDZra0FVQ0dw?=
 =?utf-8?B?K3dLS2VyRGs5dEQrSlU1c3FGU2t5ZThST2J6bnA4WVNBcmtIRjRGWjZMMHFk?=
 =?utf-8?B?RHl6M1ZlTjBlOWJPYzI5d1hJRTBjOE02L25JajdSODlDU0c1M1hwbWdlS1Zn?=
 =?utf-8?B?a1lBMDJ2TU4xKzhFZHBrcDR1ekpUdFI2ekxndEQza1dKS1gra3Vvam40VXR0?=
 =?utf-8?B?K2FLVGFqWVNSQno1bkJwNGo5RFdiTGRZcFNvNDJqM0wvZ09HdG14VDgwUFFm?=
 =?utf-8?B?M2xSOGNkMUpseVFuNWR2VW1NWjQrVWNRTHdieGpOMmdWTUtqZWtpZ2QwUDYr?=
 =?utf-8?B?M3V2elNuS2d5c2pUc3Vzb2xJalIybjB0b1JOY2YxL0VEY2o0ZkZjZzQ0cWxU?=
 =?utf-8?B?am1jUCtISnl1U2R6MkdGQ21hR2VkUUdIc3cwRXF6VnIrcngrbFF0UEI0OHRv?=
 =?utf-8?B?R1d5SzZhV2xVc1BHQ3l6elRhczA0Z2IwYys0N0hOdlR1NzE2UXp6TzJ6SXg4?=
 =?utf-8?B?YXQ2TjNCeTRmZ2pObkduemd5QXlHeVh3T3dBWTFCLzBXMnlIWkJRaFJnV3NP?=
 =?utf-8?B?TUxnMUg2YVpXaGZlVk0vNWlZS21tbVBUSzZ1OXJaUzh3M3VHdWxhR3BYTWF2?=
 =?utf-8?B?QlMwNnVvb1VkLzdHN3A4ZXpxZHpVK0pPTEhtdVRROFV4MkJQZktkM1JuUEVM?=
 =?utf-8?B?dnhmSzk1SXBzZ0N2Z1FkZXB1ZkE2V2dVRVBGMXZ1L0ZDNVhZQ0cweHU4TzVr?=
 =?utf-8?B?YTZaTGErQUVDSzFhNERXOTNtOGpCNGw5ckRBTXpPb1dmSE9xRDlZdWFRZXdI?=
 =?utf-8?B?bk1EdEhsbC93NzVPdzduWVp1QUYxanNMVWpGRGNLeWh3cnRZRE9ZcktZeVdY?=
 =?utf-8?B?TFRKZlVIYVNLaTh0UzB4WjdoNTZBZms3SGFWYmhOK2NqZ3FNV29LVkpyS0t0?=
 =?utf-8?B?aXozeFJsWGZIMWZETUE0cTlqNEZ6VjlVcTZSQlplR0ZaSUpCWm1rL3BDZENL?=
 =?utf-8?B?TVh3N3MzYVM3aGhGS1k2ckxIUGszL3hkVElhbmo1c2MzZlVJSFk5MVNSM2xZ?=
 =?utf-8?B?S0o2Q3oxQlFTaXFJUm4rUlcxVEdhak1YSmR6OXJTNGMzaHFBV2x4MUxyRmhn?=
 =?utf-8?B?dnlZcWp6NTZYbVZFZ0pySFNraWFDcGNJUFpMTkVJbjVKOTBUbHlDbXJiMU5x?=
 =?utf-8?B?MS9QdU9IVTdySWtqZ2k1VnlTMjRST2FiL1VwNkVqREJYNEFiRER6UEN3WVpO?=
 =?utf-8?B?VUlkZHJKOTI5ckNSam05WEVwN3I2WHJWQ0VUQ0dzT1B4ODZ3eURtZUxnRUpp?=
 =?utf-8?B?ZE9JcktCcjE0SjF6VnBPNGJkTHNtSVVJK1dpMGhMK3RpTW1ZTGxXUXFXblNI?=
 =?utf-8?B?a1RJTTZBdnJKVFZyRW5uMUY5SWtJOTZ4OTVEaytYSHpRbFhXREdBcklYNTNv?=
 =?utf-8?B?R3c2OXRXZjV5MXREUGI3RVBncUxFWmx0NG5Rc0JTdHhnQ1JVcHlwZjdhSlBw?=
 =?utf-8?B?dFJvaEJWVGlDeWJSUVBBdXVrVS9ZcmFTUFFGWngyTjlUUHBIeGQxdGdEUlRM?=
 =?utf-8?B?ak1HcjdOMzRrZGJKTHVhcUVESlBTdGQ3YUtNdWt6b3JJL1lBUzgyWW84VDBN?=
 =?utf-8?B?ODl2enVoTG5za0hUZ3NzNnp0NkhuR2lSaG0yQm5tTkFseWdLWXJMb0g2a1RC?=
 =?utf-8?B?WkMrWGp4S20rOWM2V2ZpZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDZEaFh1UU9xQjRaTnl4Mkc3N1cxV3RxSjhqTktrWnZiMEZ5RWtsNnpDa3ZS?=
 =?utf-8?B?N2JZckFUSEdEaWdVSkI0UWxzQjJsaTZGRjhKQW0vSmJqOUhxcTByL2ZPMzJ5?=
 =?utf-8?B?MkJuWWF2MWJYS01CM2oyU0JVS0pONytNeXVCWmljREpTWFRpdTA1ZTNQOUNp?=
 =?utf-8?B?MWJSVzZpZUEweGdRK1kzcVJWSzJXOUtrMkJFc3VxQy9QaUdKdDJQS3BJajJp?=
 =?utf-8?B?aXQ0dnloN0EveXR5ZDVXVElZYjZIc0REWGNZaCtpa2pPamF1eDZjbHUxa1Bw?=
 =?utf-8?B?cWZxS2RMaE5acldRREFIanhyTUdzV1lYYUs4aHRjZyt6TXp1T3FIM0ZlRVVr?=
 =?utf-8?B?eUFWSWFObUhLTVcrUFNQQlNDai9FbGF4SlFQNnRCUWFEamc5K1dFZHB0Znh4?=
 =?utf-8?B?NmhqQ3NPaFpBUE9nYmVqSEJKTmZaNSsxYW1OMHBNdmtmUjdUYUVaQkZPdUdx?=
 =?utf-8?B?a1Q5VWM4K2JhQ3FLeDV3RFVhbWc1SWJGY3VFOWVvdzFuZ1dsQ3B1Q0xYeDRF?=
 =?utf-8?B?ZnpOWGNydktyQko2cGxiVUQ0amRKWWZsdlJjaUlIZkxlZjY1ZVBQM2hPODhF?=
 =?utf-8?B?QW1EdGlna0ZpTk4zb3hyWlEzZFJsblB0bk02bzFsV0lGcXFBZVppeTUzVXJD?=
 =?utf-8?B?Y1lUNnZFUTl3Z3BnNDZ0UU1kYTFucTg4V3pvdjh4MzBxRER5U3RCcHZtUGRL?=
 =?utf-8?B?T0p2YTIwVkhzRUxMc2FITitOTWlGZmwwVW16K1dUV2JJNVNYcWxxR2tkMUdD?=
 =?utf-8?B?SVFhMGpoZkNtN0FxbGtjN2R5T1h4anlBV2hyc1h0WFZ4b3VXRnFra1VzTmZI?=
 =?utf-8?B?eVEySThtSHBsT2dPdHl6dENCb0ZRazlTc0d3ZkY5M3YxbDNrS1R6TEE0anlr?=
 =?utf-8?B?OEhQQzg0ZGJPZTczYXhwOFJoRnhSRnl1V2NBMXB2TUVDR1pTNy8wa2J3YWM4?=
 =?utf-8?B?ZEVCUm8yUmsvU3VFaUgxOUFDamxCU0tHVmhiRTNOQ1VvRFV3emlzUlQxNWpU?=
 =?utf-8?B?am5DblYybDZLUWRZWG5vMXdjRERYbFo3TCs2VlU0R1JwdWVnbHZ6UFpzRXFH?=
 =?utf-8?B?U2o1TUtuTHVtSzhBRTZXak50RUNKWGdyRGtLaVBZakJEUkRnM211Y2ZzMlJH?=
 =?utf-8?B?STBHNDdsblI4QnZmT3d4a2RjN1Y5eStyMTFkV0hJZU9IY0ZLQ2dWbnIxWnZO?=
 =?utf-8?B?cyszd0lZQVJHam9QMGxOeldINGtDMnVLZ25WVHF0WVFsb083Q0NGaUY1S1BB?=
 =?utf-8?B?dUlTZ2ZVdjMrM0VGZkdXMlF5RFNtcHhyMDFKU0tSVWJiRy9FS21PQjZEdWdi?=
 =?utf-8?B?d1dRVUQ3aWFHM0hvUm1jaWNhVTFXOTlYTFBEbi9zNk82T0J3ZjNhRjQ4MWJa?=
 =?utf-8?B?MzVYWDJreUM0WTMyUHZSVENUYTAxaUJZYWlnVVR4TlpDVysraE9ySTlEdXBO?=
 =?utf-8?B?U1ZEK1VDK3RDNmVzaXVqTkNXckhtQVhWc1gwdTdaRHlKd1EzV0ZWSGNkUEUr?=
 =?utf-8?B?anhVeTI2RTBkQ3ZGRENndjJDWUg2WXBRd1BNU2ExTnlOeHE3bncxamIxNU42?=
 =?utf-8?B?WUFYSkc0YmsrK1dyUWlIWEtmM0MyeWhkWFdzb2psZFVYYkdDTVNZU015Wmpo?=
 =?utf-8?B?a3lsajNzVSsybHQ2cUJmaHVtT2liK3dsaS9JSC9UVkZlOE1HSnI2Z1BlR0Zj?=
 =?utf-8?B?bnBJbDgxbUY4MjVNaUttMjAyZ3RFSGJ0cU8rb2RzTVpoU0lGRWptQnliTis3?=
 =?utf-8?B?QmNrUVBJZ1pUWUZEczRkSzU0MU9DNm53clhBTTBqUzdoTzg5dGhQaG1uYUt0?=
 =?utf-8?B?dFViZW1Gem9Ra0RzVnVmN3QxQkZ6UGlpalRPRzA2QTl6VURuMEY0R0ZUN2p6?=
 =?utf-8?B?elVrbGFiWkdyRHhmS0RLdW1iakk2bTRBNjl0WEY5VWpWalNEcTlXbkpUTjdq?=
 =?utf-8?B?M0poRVdBd1RReXZoQkxVbFFIY0M1MDRKQ2tZU0E1MGdyYzNaZGY3UkJDRjg5?=
 =?utf-8?B?bmlkRVhUeEJVbzJPL2NkckV0OG5DOWFQaHhLTHY1TEdEV2YzVHVUaVZJMUVs?=
 =?utf-8?B?S0FkZlhmc2J5MWJOSndBVHlSNTVTTmpEWkQrMFVLTkRqbUFRcVVnRDh0bnRP?=
 =?utf-8?Q?gMSrIFNHsXRtOP110fT/7qvWn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6101b6-ae00-4595-8cad-08dd5bc58ce2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:10:18.9778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3txrGMpK+jgH++h8N6etX8+I6HCRuLlQ4e0XT9ebYVPLZbp82x35tjM1XIJOHEM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7867
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

Yeah, it's sad but I probably won't find time for a deeper review anytime soon.

So feel free to add my Acked-by as well.

Christian.

Am 05.03.25 um 04:01 schrieb Dave Airlie:
> I've looked over the two patches mentioned here, I think they have
> seen enough time and we need to unblock,
>
> Please add and merge them:
> Acked-by: Dave Airlie <airlied@redhat.com>
>
> Dave.
>
> On Tue, 25 Feb 2025 at 18:44, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> Hi, Christian,
>>
>> Ping? I'd really want to get this in before -rc6
>>
>> Thanks,
>> Thomas
>>
>>
>>
>> On Tue, 2025-02-18 at 16:40 +0100, Thomas Hellström wrote:
>>> Hi, Christian,
>>>
>>> On Wed, 2025-02-05 at 15:02 +0100, Christian König wrote:
>>>> Am 30.01.25 um 11:13 schrieb Thomas Hellström:
>>>>> Provide a helper to shrink ttm_tt page-vectors on a per-page
>>>>> basis. A ttm_backup backend could then in theory get away with
>>>>> allocating a single temporary page for each struct ttm_tt.
>>>>>
>>>>> This is accomplished by splitting larger pages before trying to
>>>>> back them up.
>>>>>
>>>>> In the future we could allow ttm_backup to handle backing up
>>>>> large pages as well, but currently there's no benefit in
>>>>> doing that, since the shmem backup backend would have to
>>>>> split those anyway to avoid allocating too much temporary
>>>>> memory, and if the backend instead inserts pages into the
>>>>> swap-cache, those are split on reclaim by the core.
>>>>>
>>>>> Due to potential backup- and recover errors, allow partially
>>>>> swapped
>>>>> out struct ttm_tt's, although mark them as swapped out stopping
>>>>> them
>>>>> from being swapped out a second time. More details in the
>>>>> ttm_pool.c
>>>>> DOC section.
>>>>>
>>>>> v2:
>>>>> - A couple of cleanups and error fixes in ttm_pool_back_up_tt.
>>>>> - s/back_up/backup/
>>>>> - Add a writeback parameter to the exported interface.
>>>>> v8:
>>>>> - Use a struct for flags for readability (Matt Brost)
>>>>> - Address misc other review comments (Matt Brost)
>>>>> v9:
>>>>> - Update the kerneldoc for the ttm_tt::backup field.
>>>>> v10:
>>>>> - Rebase.
>>>>> v13:
>>>>> - Rebase on ttm_backup interface change. Update kerneldoc.
>>>>> - Rebase and adjust ttm_tt_is_swapped().
>>>>> v15:
>>>>> - Rebase on ttm_backup return value change.
>>>>> - Rebase on previous restructuring of ttm_pool_alloc()
>>>>> - Rework the ttm_pool backup interface (Christian König)
>>>>> - Remove cond_resched() (Christian König)
>>>>> - Get rid of the need to allocate an intermediate page array
>>>>>    when restoring a multi-order page (Christian König)
>>>>> - Update documentation.
>>>>>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: <dri-devel@lists.freedesktop.org>
>>>>> Signed-off-by: Thomas Hellström
>>>>> <thomas.hellstrom@linux.intel.com>
>>>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>> I've tried to wrap my head around all of this like twenty times in
>>>> the
>>>> last three month, but was always interrupted at some point.
>>>>
>>>> Feel free to add Acked-by: Christian Koenig
>>>> <christian.koenig@amd.com>.
>>>>
>>>> Sorry,
>>>> Christian.
>>> Thanks a lot for all reviewing and comments so far. There are two TTM
>>> patches left in the series that don't have an ack by you:
>>>
>>> https://patchwork.freedesktop.org/patch/634715/?series=131815&rev=17
>>> and
>>>
>>> https://patchwork.freedesktop.org/patch/634716/?series=131815&rev=17
>>>
>>> None of them particularly big considering the amount of doc text.
>>>
>>> It'd be great if those could have an ack as well so we could finally
>>> merge this series.
>>>
>>> Thanks,
>>> Thomas
>>>
>>>
>>>
>>>
>>>
>>>
>>>>> ---
>>>>>   drivers/gpu/drm/ttm/ttm_pool.c | 554
>>>>> +++++++++++++++++++++++++++++----
>>>>>   drivers/gpu/drm/ttm/ttm_tt.c   |  54 ++++
>>>>>   include/drm/ttm/ttm_pool.h     |   8 +
>>>>>   include/drm/ttm/ttm_tt.h       |  67 +++-
>>>>>   4 files changed, 629 insertions(+), 54 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> index c9eba76d5143..ffb7abf52bab 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> @@ -41,6 +41,7 @@
>>>>>   #include <asm/set_memory.h>
>>>>>   #endif
>>>>>
>>>>> +#include <drm/ttm/ttm_backup.h>
>>>>>   #include <drm/ttm/ttm_pool.h>
>>>>>   #include <drm/ttm/ttm_tt.h>
>>>>>   #include <drm/ttm/ttm_bo.h>
>>>>> @@ -75,6 +76,35 @@ struct ttm_pool_alloc_state {
>>>>>           enum ttm_caching tt_caching;
>>>>>   };
>>>>>
>>>>> +/**
>>>>> + * struct ttm_pool_tt_restore - State representing restore from
>>>>> backup
>>>>> + * @pool: The pool used for page allocation while restoring.
>>>>> + * @snapshot_alloc: A snapshot of the most recent struct
>>>>> ttm_pool_alloc_state.
>>>>> + * @alloced_page: Pointer to the page most recently allocated
>>>>> from
>>>>> a pool or system.
>>>>> + * @first_dma: The dma address corresponding to @alloced_page if
>>>>> dma_mapping
>>>>> + * is requested.
>>>>> + * @alloced_pages: The number of allocated pages present in the
>>>>> struct ttm_tt
>>>>> + * page vector from this restore session.
>>>>> + * @restored_pages: The number of 4K pages restored for
>>>>> @alloced_page (which
>>>>> + * is typically a multi-order page).
>>>>> + * @page_caching: The struct ttm_tt requested caching
>>>>> + * @order: The order of @alloced_page.
>>>>> + *
>>>>> + * Recovery from backup might fail when we've recovered less
>>>>> than
>>>>> the
>>>>> + * full ttm_tt. In order not to loose any data (yet), keep
>>>>> information
>>>>> + * around that allows us to restart a failed ttm backup
>>>>> recovery.
>>>>> + */
>>>>> +struct ttm_pool_tt_restore {
>>>>> + struct ttm_pool *pool;
>>>>> + struct ttm_pool_alloc_state snapshot_alloc;
>>>>> + struct page *alloced_page;
>>>>> + dma_addr_t first_dma;
>>>>> + pgoff_t alloced_pages;
>>>>> + pgoff_t restored_pages;
>>>>> + enum ttm_caching page_caching;
>>>>> + unsigned int order;
>>>>> +};
>>>>> +
>>>>>   static unsigned long page_pool_size;
>>>>>
>>>>>   MODULE_PARM_DESC(page_pool_size, "Number of pages in the
>>>>> WC/UC/DMA pool");
>>>>> @@ -199,12 +229,11 @@ static int ttm_pool_apply_caching(struct
>>>>> ttm_pool_alloc_state *alloc)
>>>>>           return 0;
>>>>>   }
>>>>>
>>>>> -/* Map pages of 1 << order size and fill the DMA address array
>>>>> */
>>>>> +/* DMA Map pages of 1 << order size and return the resulting
>>>>> dma_address. */
>>>>>   static int ttm_pool_map(struct ttm_pool *pool, unsigned int
>>>>> order,
>>>>> -                 struct page *p, dma_addr_t **dma_addr)
>>>>> +                 struct page *p, dma_addr_t *dma_addr)
>>>>>   {
>>>>>           dma_addr_t addr;
>>>>> - unsigned int i;
>>>>>
>>>>>           if (pool->use_dma_alloc) {
>>>>>                   struct ttm_pool_dma *dma = (void *)p->private;
>>>>> @@ -218,10 +247,7 @@ static int ttm_pool_map(struct ttm_pool
>>>>> *pool,
>>>>> unsigned int order,
>>>>>                           return -EFAULT;
>>>>>           }
>>>>>
>>>>> - for (i = 1 << order; i ; --i) {
>>>>> -         *(*dma_addr)++ = addr;
>>>>> -         addr += PAGE_SIZE;
>>>>> - }
>>>>> + *dma_addr = addr;
>>>>>
>>>>>           return 0;
>>>>>   }
>>>>> @@ -371,6 +397,190 @@ static unsigned int
>>>>> ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>>>>>           return p->private;
>>>>>   }
>>>>>
>>>>> +/*
>>>>> + * Split larger pages so that we can free each PAGE_SIZE page as
>>>>> soon
>>>>> + * as it has been backed up, in order to avoid memory pressure
>>>>> during
>>>>> + * reclaim.
>>>>> + */
>>>>> +static void ttm_pool_split_for_swap(struct ttm_pool *pool,
>>>>> struct
>>>>> page *p)
>>>>> +{
>>>>> + unsigned int order = ttm_pool_page_order(pool, p);
>>>>> + pgoff_t nr;
>>>>> +
>>>>> + if (!order)
>>>>> +         return;
>>>>> +
>>>>> + split_page(p, order);
>>>>> + nr = 1UL << order;
>>>>> + while (nr--)
>>>>> +         (p++)->private = 0;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * DOC: Partial backup and restoration of a struct ttm_tt.
>>>>> + *
>>>>> + * Swapout using ttm_backup_backup_page() and swapin using
>>>>> + * ttm_backup_copy_page() may fail.
>>>>> + * The former most likely due to lack of swap-space or memory,
>>>>> the
>>>>> latter due
>>>>> + * to lack of memory or because of signal interruption during
>>>>> waits.
>>>>> + *
>>>>> + * Backup failure is easily handled by using a ttm_tt pages
>>>>> vector
>>>>> that holds
>>>>> + * both backup handles and page pointers. This has to be taken
>>>>> into account when
>>>>> + * restoring such a ttm_tt from backup, and when freeing it
>>>>> while
>>>>> backed up.
>>>>> + * When restoring, for simplicity, new pages are actually
>>>>> allocated from the
>>>>> + * pool and the contents of any old pages are copied in and then
>>>>> the old pages
>>>>> + * are released.
>>>>> + *
>>>>> + * For restoration failures, the struct ttm_pool_tt_restore
>>>>> holds
>>>>> sufficient state
>>>>> + * to be able to resume an interrupted restore, and that
>>>>> structure
>>>>> is freed once
>>>>> + * the restoration is complete. If the struct ttm_tt is
>>>>> destroyed
>>>>> while there
>>>>> + * is a valid struct ttm_pool_tt_restore attached, that is also
>>>>> properly taken
>>>>> + * care of.
>>>>> + */
>>>>> +
>>>>> +/* Is restore ongoing for the currently allocated page? */
>>>>> +static bool ttm_pool_restore_valid(const struct
>>>>> ttm_pool_tt_restore *restore)
>>>>> +{
>>>>> + return restore && restore->restored_pages < (1 <<
>>>>> restore-
>>>>>> order);
>>>>> +}
>>>>> +
>>>>> +/* DMA unmap and free a multi-order page, either to the relevant
>>>>> pool or to system. */
>>>>> +static pgoff_t ttm_pool_unmap_and_free(struct ttm_pool *pool,
>>>>> struct page *page,
>>>>> +                                const dma_addr_t
>>>>> *dma_addr,
>>>>> enum ttm_caching caching)
>>>>> +{
>>>>> + struct ttm_pool_type *pt = NULL;
>>>>> + unsigned int order;
>>>>> + pgoff_t nr;
>>>>> +
>>>>> + if (pool) {
>>>>> +         order = ttm_pool_page_order(pool, page);
>>>>> +         nr = (1UL << order);
>>>>> +         if (dma_addr)
>>>>> +                 ttm_pool_unmap(pool, *dma_addr, nr);
>>>>> +
>>>>> +         pt = ttm_pool_select_type(pool, caching, order);
>>>>> + } else {
>>>>> +         order = page->private;
>>>>> +         nr = (1UL << order);
>>>>> + }
>>>>> +
>>>>> + if (pt)
>>>>> +         ttm_pool_type_give(pt, page);
>>>>> + else
>>>>> +         ttm_pool_free_page(pool, caching, order, page);
>>>>> +
>>>>> + return nr;
>>>>> +}
>>>>> +
>>>>> +/* Populate the page-array using the most recent allocated
>>>>> multi-
>>>>> order page. */
>>>>> +static void ttm_pool_allocated_page_commit(struct page
>>>>> *allocated,
>>>>> +                                    dma_addr_t first_dma,
>>>>> +                                    struct
>>>>> ttm_pool_alloc_state *alloc,
>>>>> +                                    pgoff_t nr)
>>>>> +{
>>>>> + pgoff_t i;
>>>>> +
>>>>> + for (i = 0; i < nr; ++i)
>>>>> +         *alloc->pages++ = allocated++;
>>>>> +
>>>>> + alloc->remaining_pages -= nr;
>>>>> +
>>>>> + if (!alloc->dma_addr)
>>>>> +         return;
>>>>> +
>>>>> + for (i = 0; i < nr; ++i) {
>>>>> +         *alloc->dma_addr++ = first_dma;
>>>>> +         first_dma += PAGE_SIZE;
>>>>> + }
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * When restoring, restore backed-up content to the newly
>>>>> allocated page and
>>>>> + * if successful, populate the page-table and dma-address
>>>>> arrays.
>>>>> + */
>>>>> +static int ttm_pool_restore_commit(struct ttm_pool_tt_restore
>>>>> *restore,
>>>>> +                            struct ttm_backup *backup,
>>>>> +                            const struct
>>>>> ttm_operation_ctx
>>>>> *ctx,
>>>>> +                            struct ttm_pool_alloc_state
>>>>> *alloc)
>>>>> +
>>>>> +{
>>>>> + pgoff_t i, nr = 1UL << restore->order;
>>>>> + struct page **first_page = alloc->pages;
>>>>> + struct page *p;
>>>>> + int ret = 0;
>>>>> +
>>>>> + for (i = restore->restored_pages; i < nr; ++i) {
>>>>> +         p = first_page[i];
>>>>> +         if (ttm_backup_page_ptr_is_handle(p)) {
>>>>> +                 unsigned long handle =
>>>>> ttm_backup_page_ptr_to_handle(p);
>>>>> +
>>>>> +                 if (handle == 0) {
>>>>> +                         restore->restored_pages++;
>>>>> +                         continue;
>>>>> +                 }
>>>>> +
>>>>> +                 ret = ttm_backup_copy_page(backup,
>>>>> restore->alloced_page + i,
>>>>> +                                            handle, ctx-
>>>>>> interruptible);
>>>>> +                 if (ret)
>>>>> +                         break;
>>>>> +
>>>>> +                 ttm_backup_drop(backup, handle);
>>>>> +         } else if (p) {
>>>>> +                 /*
>>>>> +                  * We could probably avoid splitting the
>>>>> old page
>>>>> +                  * using clever logic, but ATM we don't
>>>>> care, as
>>>>> +                  * we prioritize releasing memory ASAP.
>>>>> Note that
>>>>> +                  * here, the old retained page is always
>>>>> write-back
>>>>> +                  * cached.
>>>>> +                  */
>>>>> +                 ttm_pool_split_for_swap(restore->pool,
>>>>> p);
>>>>> +                 copy_highpage(restore->alloced_page + i,
>>>>> p);
>>>>> +                 __free_pages(p, 0);
>>>>> +         }
>>>>> +
>>>>> +         restore->restored_pages++;
>>>>> +         first_page[i] =
>>>>> ttm_backup_handle_to_page_ptr(0);
>>>>> + }
>>>>> +
>>>>> + if (ret) {
>>>>> +         if (!restore->restored_pages) {
>>>>> +                 dma_addr_t *dma_addr = alloc->dma_addr ?
>>>>> &restore->first_dma : NULL;
>>>>> +
>>>>> +                 ttm_pool_unmap_and_free(restore->pool,
>>>>> restore->alloced_page,
>>>>> +                                         dma_addr,
>>>>> restore-
>>>>>> page_caching);
>>>>> +                 restore->restored_pages = nr;
>>>>> +         }
>>>>> +         return ret;
>>>>> + }
>>>>> +
>>>>> + ttm_pool_allocated_page_commit(restore->alloced_page,
>>>>> restore->first_dma,
>>>>> +                                alloc, nr);
>>>>> + if (restore->page_caching == alloc->tt_caching ||
>>>>> PageHighMem(restore->alloced_page))
>>>>> +         alloc->caching_divide = alloc->pages;
>>>>> + restore->snapshot_alloc = *alloc;
>>>>> + restore->alloced_pages += nr;
>>>>> +
>>>>> + return 0;
>>>>> +}
>>>>> +
>>>>> +/* If restoring, save information needed for
>>>>> ttm_pool_restore_commit(). */
>>>>> +static void
>>>>> +ttm_pool_page_allocated_restore(struct ttm_pool *pool, unsigned
>>>>> int order,
>>>>> +                         struct page *p,
>>>>> +                         enum ttm_caching page_caching,
>>>>> +                         dma_addr_t first_dma,
>>>>> +                         struct ttm_pool_tt_restore
>>>>> *restore,
>>>>> +                         const struct
>>>>> ttm_pool_alloc_state
>>>>> *alloc)
>>>>> +{
>>>>> + restore->pool = pool;
>>>>> + restore->order = order;
>>>>> + restore->restored_pages = 0;
>>>>> + restore->page_caching = page_caching;
>>>>> + restore->first_dma = first_dma;
>>>>> + restore->alloced_page = p;
>>>>> + restore->snapshot_alloc = *alloc;
>>>>> +}
>>>>> +
>>>>>   /*
>>>>>    * Called when we got a page, either from a pool or newly
>>>>> allocated.
>>>>>    * if needed, dma map the page and populate the dma address
>>>>> array.
>>>>> @@ -380,10 +590,11 @@ static unsigned int
>>>>> ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>>>>>    */
>>>>>   static int ttm_pool_page_allocated(struct ttm_pool *pool,
>>>>> unsigned int order,
>>>>>                                      struct page *p, enum
>>>>> ttm_caching page_caching,
>>>>> -                            struct ttm_pool_alloc_state
>>>>> *alloc)
>>>>> +                            struct ttm_pool_alloc_state
>>>>> *alloc,
>>>>> +                            struct ttm_pool_tt_restore
>>>>> *restore)
>>>>>   {
>>>>> - pgoff_t i, nr = 1UL << order;
>>>>>           bool caching_consistent;
>>>>> + dma_addr_t first_dma;
>>>>>           int r = 0;
>>>>>
>>>>>           caching_consistent = (page_caching == alloc->tt_caching)
>>>>>>> PageHighMem(p);
>>>>> @@ -395,17 +606,20 @@ static int ttm_pool_page_allocated(struct
>>>>> ttm_pool *pool, unsigned int order,
>>>>>           }
>>>>>
>>>>>           if (alloc->dma_addr) {
>>>>> -         r = ttm_pool_map(pool, order, p, &alloc-
>>>>>> dma_addr);
>>>>> +         r = ttm_pool_map(pool, order, p, &first_dma);
>>>>>                   if (r)
>>>>>                           return r;
>>>>>           }
>>>>>
>>>>> - alloc->remaining_pages -= nr;
>>>>> - for (i = 0; i < nr; ++i)
>>>>> -         *alloc->pages++ = p++;
>>>>> + if (restore) {
>>>>> +         ttm_pool_page_allocated_restore(pool, order, p,
>>>>> page_caching,
>>>>> +                                         first_dma,
>>>>> restore, alloc);
>>>>> + } else {
>>>>> +         ttm_pool_allocated_page_commit(p, first_dma,
>>>>> alloc, 1UL << order);
>>>>>
>>>>> - if (caching_consistent)
>>>>> -         alloc->caching_divide = alloc->pages;
>>>>> +         if (caching_consistent)
>>>>> +                 alloc->caching_divide = alloc->pages;
>>>>> + }
>>>>>
>>>>>           return 0;
>>>>>   }
>>>>> @@ -428,22 +642,24 @@ static void ttm_pool_free_range(struct
>>>>> ttm_pool *pool, struct ttm_tt *tt,
>>>>>                                   pgoff_t start_page, pgoff_t
>>>>> end_page)
>>>>>   {
>>>>>           struct page **pages = &tt->pages[start_page];
>>>>> - unsigned int order;
>>>>> + struct ttm_backup *backup = tt->backup;
>>>>>           pgoff_t i, nr;
>>>>>
>>>>>           for (i = start_page; i < end_page; i += nr, pages += nr)
>>>>> {
>>>>> -         struct ttm_pool_type *pt = NULL;
>>>>> +         struct page *p = *pages;
>>>>>
>>>>> -         order = ttm_pool_page_order(pool, *pages);
>>>>> -         nr = (1UL << order);
>>>>> -         if (tt->dma_address)
>>>>> -                 ttm_pool_unmap(pool, tt->dma_address[i],
>>>>> nr);
>>>>> +         nr = 1;
>>>>> +         if (ttm_backup_page_ptr_is_handle(p)) {
>>>>> +                 unsigned long handle =
>>>>> ttm_backup_page_ptr_to_handle(p);
>>>>>
>>>>> -         pt = ttm_pool_select_type(pool, caching, order);
>>>>> -         if (pt)
>>>>> -                 ttm_pool_type_give(pt, *pages);
>>>>> -         else
>>>>> -                 ttm_pool_free_page(pool, caching, order,
>>>>> *pages);
>>>>> +                 if (handle != 0)
>>>>> +                         ttm_backup_drop(backup, handle);
>>>>> +         } else if (p) {
>>>>> +                 dma_addr_t *dma_addr = tt->dma_address ?
>>>>> +                         tt->dma_address + i : NULL;
>>>>> +
>>>>> +                 nr = ttm_pool_unmap_and_free(pool, p,
>>>>> dma_addr, caching);
>>>>> +         }
>>>>>           }
>>>>>   }
>>>>>
>>>>> @@ -467,22 +683,11 @@ static unsigned int
>>>>> ttm_pool_alloc_find_order(unsigned int highest,
>>>>>           return min_t(unsigned int, highest, __fls(alloc-
>>>>>> remaining_pages));
>>>>>   }
>>>>>
>>>>> -/**
>>>>> - * ttm_pool_alloc - Fill a ttm_tt object
>>>>> - *
>>>>> - * @pool: ttm_pool to use
>>>>> - * @tt: ttm_tt object to fill
>>>>> - * @ctx: operation context
>>>>> - *
>>>>> - * Fill the ttm_tt object with pages and also make sure to DMA
>>>>> map
>>>>> them when
>>>>> - * necessary.
>>>>> - *
>>>>> - * Returns: 0 on successe, negative error code otherwise.
>>>>> - */
>>>>> -int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>>> -            struct ttm_operation_ctx *ctx)
>>>>> +static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt
>>>>> *tt,
>>>>> +                     const struct ttm_operation_ctx *ctx,
>>>>> +                     struct ttm_pool_alloc_state *alloc,
>>>>> +                     struct ttm_pool_tt_restore *restore)
>>>>>   {
>>>>> - struct ttm_pool_alloc_state alloc;
>>>>>           enum ttm_caching page_caching;
>>>>>           gfp_t gfp_flags = GFP_USER;
>>>>>           pgoff_t caching_divide;
>>>>> @@ -491,10 +696,8 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>>>> struct ttm_tt *tt,
>>>>>           struct page *p;
>>>>>           int r;
>>>>>
>>>>> - ttm_pool_alloc_state_init(tt, &alloc);
>>>>> -
>>>>> - WARN_ON(!alloc.remaining_pages ||
>>>>> ttm_tt_is_populated(tt));
>>>>> - WARN_ON(alloc.dma_addr && !pool->dev);
>>>>> + WARN_ON(!alloc->remaining_pages ||
>>>>> ttm_tt_is_populated(tt));
>>>>> + WARN_ON(alloc->dma_addr && !pool->dev);
>>>>>
>>>>>           if (tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
>>>>>                   gfp_flags |= __GFP_ZERO;
>>>>> @@ -509,9 +712,9 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>>>> struct ttm_tt *tt,
>>>>>
>>>>>           page_caching = tt->caching;
>>>>>           allow_pools = true;
>>>>> - for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER,
>>>>> &alloc);
>>>>> -      alloc.remaining_pages;
>>>>> -      order = ttm_pool_alloc_find_order(order, &alloc)) {
>>>>> + for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER,
>>>>> alloc);
>>>>> +      alloc->remaining_pages;
>>>>> +      order = ttm_pool_alloc_find_order(order, alloc)) {
>>>>>                   struct ttm_pool_type *pt;
>>>>>
>>>>>                   /* First, try to allocate a page from a pool if
>>>>> one exists. */
>>>>> @@ -541,30 +744,120 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>>>> struct ttm_tt *tt,
>>>>>                           r = -ENOMEM;
>>>>>                           goto error_free_all;
>>>>>                   }
>>>>> -         r = ttm_pool_page_allocated(pool, order, p,
>>>>> page_caching, &alloc);
>>>>> +         r = ttm_pool_page_allocated(pool, order, p,
>>>>> page_caching, alloc,
>>>>> +                                     restore);
>>>>>                   if (r)
>>>>>                           goto error_free_page;
>>>>> +
>>>>> +         if (ttm_pool_restore_valid(restore)) {
>>>>> +                 r = ttm_pool_restore_commit(restore, tt-
>>>>>> backup, ctx, alloc);
>>>>> +                 if (r)
>>>>> +                         goto error_free_all;
>>>>> +         }
>>>>>           }
>>>>>
>>>>> - r = ttm_pool_apply_caching(&alloc);
>>>>> + r = ttm_pool_apply_caching(alloc);
>>>>>           if (r)
>>>>>                   goto error_free_all;
>>>>>
>>>>> + kfree(tt->restore);
>>>>> + tt->restore = NULL;
>>>>> +
>>>>>           return 0;
>>>>>
>>>>>   error_free_page:
>>>>>           ttm_pool_free_page(pool, page_caching, order, p);
>>>>>
>>>>>   error_free_all:
>>>>> - caching_divide = alloc.caching_divide - tt->pages;
>>>>> + if (tt->restore)
>>>>> +         return r;
>>>>> +
>>>>> + caching_divide = alloc->caching_divide - tt->pages;
>>>>>           ttm_pool_free_range(pool, tt, tt->caching, 0,
>>>>> caching_divide);
>>>>>           ttm_pool_free_range(pool, tt, ttm_cached,
>>>>> caching_divide,
>>>>> -                     tt->num_pages -
>>>>> alloc.remaining_pages);
>>>>> +                     tt->num_pages - alloc-
>>>>>> remaining_pages);
>>>>>           return r;
>>>>>   }
>>>>> +
>>>>> +/**
>>>>> + * ttm_pool_alloc - Fill a ttm_tt object
>>>>> + *
>>>>> + * @pool: ttm_pool to use
>>>>> + * @tt: ttm_tt object to fill
>>>>> + * @ctx: operation context
>>>>> + *
>>>>> + * Fill the ttm_tt object with pages and also make sure to DMA
>>>>> map
>>>>> them when
>>>>> + * necessary.
>>>>> + *
>>>>> + * Returns: 0 on successe, negative error code otherwise.
>>>>> + */
>>>>> +int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>>> +            struct ttm_operation_ctx *ctx)
>>>>> +{
>>>>> + struct ttm_pool_alloc_state alloc;
>>>>> +
>>>>> + if (WARN_ON(ttm_tt_is_backed_up(tt)))
>>>>> +         return -EINVAL;
>>>>> +
>>>>> + ttm_pool_alloc_state_init(tt, &alloc);
>>>>> +
>>>>> + return __ttm_pool_alloc(pool, tt, ctx, &alloc, NULL);
>>>>> +}
>>>>>   EXPORT_SYMBOL(ttm_pool_alloc);
>>>>>
>>>>> +/**
>>>>> + * ttm_pool_restore_and_alloc - Fill a ttm_tt, restoring
>>>>> previously backed-up
>>>>> + * content.
>>>>> + *
>>>>> + * @pool: ttm_pool to use
>>>>> + * @tt: ttm_tt object to fill
>>>>> + * @ctx: operation context
>>>>> + *
>>>>> + * Fill the ttm_tt object with pages and also make sure to DMA
>>>>> map
>>>>> them when
>>>>> + * necessary. Read in backed-up content.
>>>>> + *
>>>>> + * Returns: 0 on successe, negative error code otherwise.
>>>>> + */
>>>>> +int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct
>>>>> ttm_tt *tt,
>>>>> +                        const struct ttm_operation_ctx
>>>>> *ctx)
>>>>> +{
>>>>> + struct ttm_pool_alloc_state alloc;
>>>>> +
>>>>> + if (WARN_ON(!ttm_tt_is_backed_up(tt)))
>>>>> +         return -EINVAL;
>>>>> +
>>>>> + if (!tt->restore) {
>>>>> +         gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
>>>>> +
>>>>> +         ttm_pool_alloc_state_init(tt, &alloc);
>>>>> +         if (ctx->gfp_retry_mayfail)
>>>>> +                 gfp |= __GFP_RETRY_MAYFAIL;
>>>>> +
>>>>> +         tt->restore = kzalloc(sizeof(*tt->restore),
>>>>> gfp);
>>>>> +         if (!tt->restore)
>>>>> +                 return -ENOMEM;
>>>>> +
>>>>> +         tt->restore->snapshot_alloc = alloc;
>>>>> +         tt->restore->pool = pool;
>>>>> +         tt->restore->restored_pages = 1;
>>>>> + } else {
>>>>> +         struct ttm_pool_tt_restore *restore = tt-
>>>>>> restore;
>>>>> +         int ret;
>>>>> +
>>>>> +         alloc = restore->snapshot_alloc;
>>>>> +         if (ttm_pool_restore_valid(tt->restore)) {
>>>>> +                 ret = ttm_pool_restore_commit(restore,
>>>>> tt-
>>>>>> backup, ctx, &alloc);
>>>>> +                 if (ret)
>>>>> +                         return ret;
>>>>> +         }
>>>>> +         if (!alloc.remaining_pages)
>>>>> +                 return 0;
>>>>> + }
>>>>> +
>>>>> + return __ttm_pool_alloc(pool, tt, ctx, &alloc, tt-
>>>>>> restore);
>>>>> +}
>>>>> +
>>>>>   /**
>>>>>    * ttm_pool_free - Free the backing pages from a ttm_tt object
>>>>>    *
>>>>> @@ -582,6 +875,163 @@ void ttm_pool_free(struct ttm_pool *pool,
>>>>> struct ttm_tt *tt)
>>>>>   }
>>>>>   EXPORT_SYMBOL(ttm_pool_free);
>>>>>
>>>>> +/**
>>>>> + * ttm_pool_drop_backed_up() - Release content of a swapped-out
>>>>> struct ttm_tt
>>>>> + * @tt: The struct ttm_tt.
>>>>> + *
>>>>> + * Release handles with associated content or any remaining
>>>>> pages
>>>>> of
>>>>> + * a backed-up struct ttm_tt.
>>>>> + */
>>>>> +void ttm_pool_drop_backed_up(struct ttm_tt *tt)
>>>>> +{
>>>>> + struct ttm_pool_tt_restore *restore;
>>>>> + pgoff_t start_page = 0;
>>>>> +
>>>>> + WARN_ON(!ttm_tt_is_backed_up(tt));
>>>>> +
>>>>> + restore = tt->restore;
>>>>> +
>>>>> + /*
>>>>> +  * Unmap and free any uncommitted restore page.
>>>>> +  * any tt page-array backup entries already read back
>>>>> has
>>>>> +  * been cleared already
>>>>> +  */
>>>>> + if (ttm_pool_restore_valid(restore)) {
>>>>> +         dma_addr_t *dma_addr = tt->dma_address ?
>>>>> &restore-
>>>>>> first_dma : NULL;
>>>>> +
>>>>> +         ttm_pool_unmap_and_free(restore->pool, restore-
>>>>>> alloced_page,
>>>>> +                                 dma_addr, restore-
>>>>>> page_caching);
>>>>> +         restore->restored_pages = 1UL << restore->order;
>>>>> + }
>>>>> +
>>>>> + /*
>>>>> +  * If a restore is ongoing, part of the tt pages may
>>>>> have
>>>>> a
>>>>> +  * caching different than writeback.
>>>>> +  */
>>>>> + if (restore) {
>>>>> +         pgoff_t mid = restore-
>>>>>> snapshot_alloc.caching_divide - tt->pages;
>>>>> +
>>>>> +         start_page = restore->alloced_pages;
>>>>> +         WARN_ON(mid > start_page);
>>>>> +         /* Pages that might be dma-mapped and non-cached
>>>>> */
>>>>> +         ttm_pool_free_range(restore->pool, tt, tt-
>>>>>> caching,
>>>>> +                             0, mid);
>>>>> +         /* Pages that might be dma-mapped but cached */
>>>>> +         ttm_pool_free_range(restore->pool, tt,
>>>>> ttm_cached,
>>>>> +                             mid, restore-
>>>>>> alloced_pages);
>>>>> +         kfree(restore);
>>>>> +         tt->restore = NULL;
>>>>> + }
>>>>> +
>>>>> + ttm_pool_free_range(NULL, tt, ttm_cached, start_page,
>>>>> tt-
>>>>>> num_pages);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * ttm_pool_backup() - Back up or purge a struct ttm_tt
>>>>> + * @pool: The pool used when allocating the struct ttm_tt.
>>>>> + * @tt: The struct ttm_tt.
>>>>> + * @flags: Flags to govern the backup behaviour.
>>>>> + *
>>>>> + * Back up or purge a struct ttm_tt. If @purge is true, then
>>>>> + * all pages will be freed directly to the system rather than to
>>>>> the pool
>>>>> + * they were allocated from, making the function behave
>>>>> similarly
>>>>> to
>>>>> + * ttm_pool_free(). If @purge is false the pages will be backed
>>>>> up
>>>>> instead,
>>>>> + * exchanged for handles.
>>>>> + * A subsequent call to ttm_pool_restore_and_alloc() will then
>>>>> read back the content and
>>>>> + * a subsequent call to ttm_pool_drop_backed_up() will drop it.
>>>>> + * If backup of a page fails for whatever reason, @ttm will
>>>>> still
>>>>> be
>>>>> + * partially backed up, retaining those pages for which backup
>>>>> fails.
>>>>> + * In that case, this function can be retried, possibly after
>>>>> freeing up
>>>>> + * memory resources.
>>>>> + *
>>>>> + * Return: Number of pages actually backed up or freed, or
>>>>> negative
>>>>> + * error code on error.
>>>>> + */
>>>>> +long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>>>>> +              const struct ttm_backup_flags *flags)
>>>>> +{
>>>>> + struct ttm_backup *backup = tt->backup;
>>>>> + struct page *page;
>>>>> + unsigned long handle;
>>>>> + gfp_t alloc_gfp;
>>>>> + gfp_t gfp;
>>>>> + int ret = 0;
>>>>> + pgoff_t shrunken = 0;
>>>>> + pgoff_t i, num_pages;
>>>>> +
>>>>> + if (WARN_ON(ttm_tt_is_backed_up(tt)))
>>>>> +         return -EINVAL;
>>>>> +
>>>>> + if ((!ttm_backup_bytes_avail() && !flags->purge) ||
>>>>> +     pool->use_dma_alloc || ttm_tt_is_backed_up(tt))
>>>>> +         return -EBUSY;
>>>>> +
>>>>> +#ifdef CONFIG_X86
>>>>> + /* Anything returned to the system needs to be cached.
>>>>> */
>>>>> + if (tt->caching != ttm_cached)
>>>>> +         set_pages_array_wb(tt->pages, tt->num_pages);
>>>>> +#endif
>>>>> +
>>>>> + if (tt->dma_address || flags->purge) {
>>>>> +         for (i = 0; i < tt->num_pages; i += num_pages) {
>>>>> +                 unsigned int order;
>>>>> +
>>>>> +                 page = tt->pages[i];
>>>>> +                 if (unlikely(!page)) {
>>>>> +                         num_pages = 1;
>>>>> +                         continue;
>>>>> +                 }
>>>>> +
>>>>> +                 order = ttm_pool_page_order(pool, page);
>>>>> +                 num_pages = 1UL << order;
>>>>> +                 if (tt->dma_address)
>>>>> +                         ttm_pool_unmap(pool, tt-
>>>>>> dma_address[i],
>>>>> +                                        num_pages);
>>>>> +                 if (flags->purge) {
>>>>> +                         shrunken += num_pages;
>>>>> +                         page->private = 0;
>>>>> +                         __free_pages(page, order);
>>>>> +                         memset(tt->pages + i, 0,
>>>>> +                                num_pages * sizeof(*tt-
>>>>>> pages));
>>>>> +                 }
>>>>> +         }
>>>>> + }
>>>>> +
>>>>> + if (flags->purge)
>>>>> +         return shrunken;
>>>>> +
>>>>> + if (pool->use_dma32)
>>>>> +         gfp = GFP_DMA32;
>>>>> + else
>>>>> +         gfp = GFP_HIGHUSER;
>>>>> +
>>>>> + alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN |
>>>>> __GFP_RETRY_MAYFAIL;
>>>>> +
>>>>> + for (i = 0; i < tt->num_pages; ++i) {
>>>>> +         s64 shandle;
>>>>> +
>>>>> +         page = tt->pages[i];
>>>>> +         if (unlikely(!page))
>>>>> +                 continue;
>>>>> +
>>>>> +         ttm_pool_split_for_swap(pool, page);
>>>>> +
>>>>> +         shandle = ttm_backup_backup_page(backup, page,
>>>>> flags->writeback, i,
>>>>> +                                          gfp,
>>>>> alloc_gfp);
>>>>> +         if (shandle < 0) {
>>>>> +                 /* We allow partially shrunken tts */
>>>>> +                 ret = shandle;
>>>>> +                 break;
>>>>> +         }
>>>>> +         handle = shandle;
>>>>> +         tt->pages[i] =
>>>>> ttm_backup_handle_to_page_ptr(handle);
>>>>> +         put_page(page);
>>>>> +         shrunken++;
>>>>> + }
>>>>> +
>>>>> + return shrunken ? shrunken : ret;
>>>>> +}
>>>>> +
>>>>>   /**
>>>>>    * ttm_pool_init - Initialize a pool
>>>>>    *
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> index 3baf215eca23..00b7c28f2329 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> @@ -40,6 +40,7 @@
>>>>>   #include <drm/drm_cache.h>
>>>>>   #include <drm/drm_device.h>
>>>>>   #include <drm/drm_util.h>
>>>>> +#include <drm/ttm/ttm_backup.h>
>>>>>   #include <drm/ttm/ttm_bo.h>
>>>>>   #include <drm/ttm/ttm_tt.h>
>>>>>
>>>>> @@ -158,6 +159,8 @@ static void ttm_tt_init_fields(struct ttm_tt
>>>>> *ttm,
>>>>>           ttm->swap_storage = NULL;
>>>>>           ttm->sg = bo->sg;
>>>>>           ttm->caching = caching;
>>>>> + ttm->restore = NULL;
>>>>> + ttm->backup = NULL;
>>>>>   }
>>>>>
>>>>>   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object
>>>>> *bo,
>>>>> @@ -182,6 +185,13 @@ void ttm_tt_fini(struct ttm_tt *ttm)
>>>>>                   fput(ttm->swap_storage);
>>>>>           ttm->swap_storage = NULL;
>>>>>
>>>>> + if (ttm_tt_is_backed_up(ttm))
>>>>> +         ttm_pool_drop_backed_up(ttm);
>>>>> + if (ttm->backup) {
>>>>> +         ttm_backup_fini(ttm->backup);
>>>>> +         ttm->backup = NULL;
>>>>> + }
>>>>> +
>>>>>           if (ttm->pages)
>>>>>                   kvfree(ttm->pages);
>>>>>           else
>>>>> @@ -253,6 +263,49 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>>>>>   }
>>>>>   EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
>>>>>
>>>>> +/**
>>>>> + * ttm_tt_backup() - Helper to back up a struct ttm_tt.
>>>>> + * @bdev: The TTM device.
>>>>> + * @tt: The struct ttm_tt.
>>>>> + * @flags: Flags that govern the backup behaviour.
>>>>> + *
>>>>> + * Update the page accounting and call ttm_pool_shrink_tt to
>>>>> free
>>>>> pages
>>>>> + * or back them up.
>>>>> + *
>>>>> + * Return: Number of pages freed or swapped out, or negative
>>>>> error
>>>>> code on
>>>>> + * error.
>>>>> + */
>>>>> +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
>>>>> +            const struct ttm_backup_flags flags)
>>>>> +{
>>>>> + long ret;
>>>>> +
>>>>> + if (WARN_ON(IS_ERR_OR_NULL(tt->backup)))
>>>>> +         return 0;
>>>>> +
>>>>> + ret = ttm_pool_backup(&bdev->pool, tt, &flags);
>>>>> + if (ret > 0) {
>>>>> +         tt->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
>>>>> +         tt->page_flags |= TTM_TT_FLAG_BACKED_UP;
>>>>> + }
>>>>> +
>>>>> + return ret;
>>>>> +}
>>>>> +
>>>>> +int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt *tt,
>>>>> +            const struct ttm_operation_ctx *ctx)
>>>>> +{
>>>>> + int ret = ttm_pool_restore_and_alloc(&bdev->pool, tt,
>>>>> ctx);
>>>>> +
>>>>> + if (ret)
>>>>> +         return ret;
>>>>> +
>>>>> + tt->page_flags &= ~TTM_TT_FLAG_BACKED_UP;
>>>>> +
>>>>> + return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL(ttm_tt_restore);
>>>>> +
>>>>>   /**
>>>>>    * ttm_tt_swapout - swap out tt object
>>>>>    *
>>>>> @@ -348,6 +401,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>>>                   goto error;
>>>>>
>>>>>           ttm->page_flags |= TTM_TT_FLAG_PRIV_POPULATED;
>>>>> + ttm->page_flags &= ~TTM_TT_FLAG_BACKED_UP;
>>>>>           if (unlikely(ttm->page_flags & TTM_TT_FLAG_SWAPPED)) {
>>>>>                   ret = ttm_tt_swapin(ttm);
>>>>>                   if (unlikely(ret != 0)) {
>>>>> diff --git a/include/drm/ttm/ttm_pool.h
>>>>> b/include/drm/ttm/ttm_pool.h
>>>>> index 160d954a261e..54cd34a6e4c0 100644
>>>>> --- a/include/drm/ttm/ttm_pool.h
>>>>> +++ b/include/drm/ttm/ttm_pool.h
>>>>> @@ -33,6 +33,7 @@
>>>>>
>>>>>   struct device;
>>>>>   struct seq_file;
>>>>> +struct ttm_backup_flags;
>>>>>   struct ttm_operation_ctx;
>>>>>   struct ttm_pool;
>>>>>   struct ttm_tt;
>>>>> @@ -89,6 +90,13 @@ void ttm_pool_fini(struct ttm_pool *pool);
>>>>>
>>>>>   int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file
>>>>> *m);
>>>>>
>>>>> +void ttm_pool_drop_backed_up(struct ttm_tt *tt);
>>>>> +
>>>>> +long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *ttm,
>>>>> +              const struct ttm_backup_flags *flags);
>>>>> +int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct
>>>>> ttm_tt *tt,
>>>>> +                        const struct ttm_operation_ctx
>>>>> *ctx);
>>>>> +
>>>>>   int ttm_pool_mgr_init(unsigned long num_pages);
>>>>>   void ttm_pool_mgr_fini(void);
>>>>>
>>>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>>>> index 991edafdb2dd..c736c01ac2ca 100644
>>>>> --- a/include/drm/ttm/ttm_tt.h
>>>>> +++ b/include/drm/ttm/ttm_tt.h
>>>>> @@ -32,11 +32,13 @@
>>>>>   #include <drm/ttm/ttm_caching.h>
>>>>>   #include <drm/ttm/ttm_kmap_iter.h>
>>>>>
>>>>> +struct ttm_backup;
>>>>>   struct ttm_device;
>>>>>   struct ttm_tt;
>>>>>   struct ttm_resource;
>>>>>   struct ttm_buffer_object;
>>>>>   struct ttm_operation_ctx;
>>>>> +struct ttm_pool_tt_restore;
>>>>>
>>>>>   /**
>>>>>    * struct ttm_tt - This is a structure holding the pages,
>>>>> caching- and aperture
>>>>> @@ -85,17 +87,22 @@ struct ttm_tt {
>>>>>            * fault handling abuses the DMA api a bit and
>>>>> dma_map_attrs can't be
>>>>>            * used to assure pgprot always matches.
>>>>>            *
>>>>> +  * TTM_TT_FLAG_BACKED_UP: TTM internal only. This is set
>>>>> if the
>>>>> +  * struct ttm_tt has been (possibly partially) backed
>>>>> up.
>>>>> +  *
>>>>>            * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
>>>>> USE. This is
>>>>>            * set by TTM after ttm_tt_populate() has successfully
>>>>> returned, and is
>>>>>            * then unset when TTM calls ttm_tt_unpopulate().
>>>>> +  *
>>>>>            */
>>>>>   #define TTM_TT_FLAG_SWAPPED             BIT(0)
>>>>>   #define TTM_TT_FLAG_ZERO_ALLOC          BIT(1)
>>>>>   #define TTM_TT_FLAG_EXTERNAL            BIT(2)
>>>>>   #define TTM_TT_FLAG_EXTERNAL_MAPPABLE   BIT(3)
>>>>>   #define TTM_TT_FLAG_DECRYPTED           BIT(4)
>>>>> +#define TTM_TT_FLAG_BACKED_UP            BIT(5)
>>>>>
>>>>> -#define TTM_TT_FLAG_PRIV_POPULATED       BIT(5)
>>>>> +#define TTM_TT_FLAG_PRIV_POPULATED       BIT(6)
>>>>>           uint32_t page_flags;
>>>>>           /** @num_pages: Number of pages in the page array. */
>>>>>           uint32_t num_pages;
>>>>> @@ -105,11 +112,20 @@ struct ttm_tt {
>>>>>           dma_addr_t *dma_address;
>>>>>           /** @swap_storage: Pointer to shmem struct file for swap
>>>>> storage. */
>>>>>           struct file *swap_storage;
>>>>> + /**
>>>>> +  * @backup: Pointer to backup struct for backed up tts.
>>>>> +  * Could be unified with @swap_storage. Meanwhile, the
>>>>> driver's
>>>>> +  * ttm_tt_create() callback is responsible for assigning
>>>>> +  * this field.
>>>>> +  */
>>>>> + struct ttm_backup *backup;
>>>>>           /**
>>>>>            * @caching: The current caching state of the pages, see
>>>>> enum
>>>>>            * ttm_caching.
>>>>>            */
>>>>>           enum ttm_caching caching;
>>>>> + /** @restore: Partial restoration from backup state. TTM
>>>>> private */
>>>>> + struct ttm_pool_tt_restore *restore;
>>>>>   };
>>>>>
>>>>>   /**
>>>>> @@ -129,9 +145,38 @@ static inline bool
>>>>> ttm_tt_is_populated(struct
>>>>> ttm_tt *tt)
>>>>>           return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
>>>>>   }
>>>>>
>>>>> +/**
>>>>> + * ttm_tt_is_swapped() - Whether the ttm_tt is swapped out or
>>>>> backed up
>>>>> + * @tt: The struct ttm_tt.
>>>>> + *
>>>>> + * Return: true if swapped or backed up, false otherwise.
>>>>> + */
>>>>>   static inline bool ttm_tt_is_swapped(const struct ttm_tt *tt)
>>>>>   {
>>>>> - return tt->page_flags & TTM_TT_FLAG_SWAPPED;
>>>>> + return tt->page_flags & (TTM_TT_FLAG_SWAPPED |
>>>>> TTM_TT_FLAG_BACKED_UP);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * ttm_tt_is_backed_up() - Whether the ttm_tt backed up
>>>>> + * @tt: The struct ttm_tt.
>>>>> + *
>>>>> + * Return: true if swapped or backed up, false otherwise.
>>>>> + */
>>>>> +static inline bool ttm_tt_is_backed_up(const struct ttm_tt *tt)
>>>>> +{
>>>>> + return tt->page_flags & TTM_TT_FLAG_BACKED_UP;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * ttm_tt_clear_backed_up() - Clear the ttm_tt backed-up status
>>>>> + * @tt: The struct ttm_tt.
>>>>> + *
>>>>> + * Drivers can use this functionto clear the backed-up status,
>>>>> + * for example before destroying or re-validating a purged tt.
>>>>> + */
>>>>> +static inline void ttm_tt_clear_backed_up(struct ttm_tt *tt)
>>>>> +{
>>>>> + tt->page_flags &= ~TTM_TT_FLAG_BACKED_UP;
>>>>>   }
>>>>>
>>>>>   /**
>>>>> @@ -235,6 +280,24 @@ void ttm_tt_mgr_init(unsigned long
>>>>> num_pages,
>>>>> unsigned long num_dma32_pages);
>>>>>   struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct
>>>>> ttm_kmap_iter_tt *iter_tt,
>>>>>                                               struct ttm_tt *tt);
>>>>>   unsigned long ttm_tt_pages_limit(void);
>>>>> +
>>>>> +/**
>>>>> + * struct ttm_backup_flags - Flags to govern backup behaviour.
>>>>> + * @purge: Free pages without backing up. Bypass pools.
>>>>> + * @writeback: Attempt to copy contents directly to swap space,
>>>>> even
>>>>> + * if that means blocking on writes to external memory.
>>>>> + */
>>>>> +struct ttm_backup_flags {
>>>>> + u32 purge : 1;
>>>>> + u32 writeback : 1;
>>>>> +};
>>>>> +
>>>>> +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
>>>>> +            const struct ttm_backup_flags flags);
>>>>> +
>>>>> +int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt *tt,
>>>>> +            const struct ttm_operation_ctx *ctx);
>>>>> +
>>>>>   #if IS_ENABLED(CONFIG_AGP)
>>>>>   #include <linux/agp_backend.h>
>>>>>

