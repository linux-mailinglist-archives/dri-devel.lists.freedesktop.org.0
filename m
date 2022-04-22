Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C4450C047
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 21:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B2810E2B3;
	Fri, 22 Apr 2022 19:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB1010E2B3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 19:23:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtSlZnGPDjnKy3dU45Vr4+5pwUXoI43ICHAHjaDR/TMyO5MQttpFxS/0tmIjpAh49M5x9v1C/yhAGMQI/PjKWqMU7n9i44fntmKhA10OmxqufI/vdPUnoJYXVUOzksDUV2nCbdRLd1ZlgEn4JrfIdhnBYbd4rwgWuV3mODhA1VVk6IYyceBOyPk7KSR2d599GtQB2lT3xC0Yq68rWUTyRDIRWi0mRaiv+RjF63QgngTH81sa74JtxbodBneQIGxn12s48aLV8uAXFBE9TNOvMFpXx14wgu+Y9mYl9T7ZuMcAylYggcTVqfwAqP9S47iEgVvHci7PiulJp2yWc8YEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxmXiinKs/e+yCLaOT953I6wddaosmvcf06z6PmGUxE=;
 b=R6n8c2kUH/mfZcnHk9WSIahbYn1iCx+HEdtBOLas5YF4V4Aiae94S1k/+MisX5amU7YSv52Epkfoa6a3ZKXgRzpsY2a6wl0YolzVTzQi4qFZSdMohXvMuAO8wKTvUzfZql6K1/nRUfaxLW7fg/+NxCQx3RVz/6U5ET8ArCEJDvUulv9s8fsjld/e4EP7EVk98SXVFNC72nXBNfcyNZGki5C6tHdD8edT7AhXWaMnJC/600D8SDFN2RYtvJyzt/wUJgOd0XedTqNvXATx0iXmvxutW+G7MY6GfdP/lfeeZBKOUCwJgk8xBYYUYyMTNbpB6U793ntdTEM/BI1Q856yGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxmXiinKs/e+yCLaOT953I6wddaosmvcf06z6PmGUxE=;
 b=F5EiJc8rK3MWJKOS/GunAUO4k5Br5zBYN6Ib8wpixP6FdsdfvKZl/ksfURNP7mlv/wJOm0e8Ucd10L4TQFxkF0mLkWKS1+mRlZwzx3W05YXDqHoxLl8sUDgr2Clolo0bKT/OOt9VPYUWXX0bhp+ZtpPQwbuNUexEqREKROw/qgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5222.namprd12.prod.outlook.com (2603:10b6:208:31e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 19:23:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Fri, 22 Apr 2022
 19:23:15 +0000
Message-ID: <c4585bab-72f4-4574-958e-483af52af6ed@amd.com>
Date: Fri, 22 Apr 2022 21:23:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/vmwgfx: reserve fence slots on new resources
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
References: <20220422092002.32427-1-christian.koenig@amd.com>
 <2dda3fcb-6edf-3f9e-bfd7-34272eec55e1@amd.com>
 <701da185ea77cd84fed44b49d60f30a7750f955e.camel@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <701da185ea77cd84fed44b49d60f30a7750f955e.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0011.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f26d08bc-633b-47e9-c2f2-08da24958c57
X-MS-TrafficTypeDiagnostic: BL1PR12MB5222:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5222BB02C0DD42405F8FC29D83F79@BL1PR12MB5222.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z7j4jlP4KIim6rB7Tyns7mNY8fR0Rv1loe44c3uRsDwesiZyDNKL+7m0SypT/VOXCEVFXqPhDM6ZX6q2tGQukKc8joF+kPsK23ifKgZdMLVFHNcQkwB4EohGOYirBi7FwP0EwJ+/wTqvHF3EEkx4ByiHEQZDM+4qAoZWGwYyXDNbtRGpSCSFOL6oBIvN3begvsz4DZ31QKaustZOFzwGpsMUcmHsrspQPDnlvDJG8K4D348eN1+XocsC776/GQz9qG9HLSIPmdPed6N+SE8sTn9/DS5eKh0p9wnzHAL7pfHHJe6NlOgSt4KWbR8y1yLb98rK4AuSavS0rQXKNksH1etU23ilE+jXESC3l7Jdvh08NIzn5hqk0H840KaykiiDnXcir8Na+YnQc3EcNAZC1/B+ybOUo5eAf2M3Zv/+sIXrRL+VjLzgpMBvKdFufsPIAYrQQiW+K/wywspF9ytt5JhFKp1/dIVCsLBOXnd+FtnvPjoNI2cK3D+FZgsb2Mu48kO7v4uLEP+FJZHxzaxJi/cTwwf4lJJ5kHYz5RSZQWQ8a8Mmg/CUJA90MPgGK0k+0lRsWJ9s9Hgib35g0JaOu3Br+hhHX28EBo0JJAol7U/LwaOyJoh6w3JDloUfxdvcKI59oojWaWgTUP3YN46Ia/8ibzqpsKP/J9pnyxfju/zmY9mXfcYkPoN5IHeIKyNrKmtrv6Nghb0uiM51YNhK9t+jLD/gTYg7cf7hPzl7gQE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(86362001)(186003)(2616005)(66574015)(66946007)(38100700002)(6666004)(6512007)(6506007)(316002)(2906002)(31696002)(6486002)(8676002)(8936002)(508600001)(110136005)(31686004)(66476007)(66556008)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFR5eW8rcUNsVndBdm5HWkJ3Z3RiM2pjRTV3Q2xqNm5Sc1czRWx0WUZLNVlK?=
 =?utf-8?B?Z1doWTE4amtoRERrdCtibDlYczZHOUZibVVlMVptYWV4WTh4VmJhWko3RmhE?=
 =?utf-8?B?UEtYaFNXL29nZjZTeFJLT3ZGZ3BtU3F0UStDdWRrL1AyWE56ZlQ1a2wwSmNv?=
 =?utf-8?B?bjBTV0tpRGRhWStoVnlqNjVaWUxzazNyYUc1b3NPSS9YRHg1enRCcXNBWFU2?=
 =?utf-8?B?WmQyZ2I4K0dDSmE3U0s4aDNqeEMrbnJKRlVJSGNJMmRrbytBZWcyTUJJVDll?=
 =?utf-8?B?bTRJdzMvOFFNYlB2MHQ5Z29MaHVneHIwRG43T3l6YitsRzFhcnV5RTFSTU85?=
 =?utf-8?B?c1V6ako1RkFMSnJwa3ZQemxsdU5ZZDRabFNvMmcrVEhCSyt6RU52NjdlR3px?=
 =?utf-8?B?UXM1dHhnQXZiM25raXo2eUdSK1I4VWZtbWF3Wm8rYmNOd21XVlBLTWw1OXFj?=
 =?utf-8?B?UFJVRDUzdkJ2L0hvRDBBK0pKajVMelpZVmVoZDlVRDF0UkdBSUorRU52T0px?=
 =?utf-8?B?WjM5Q0lrZGZJVFIxU2NYRzFXcithaFhSbkQ2eGVibXA1L3R3VHNINmpWMlAv?=
 =?utf-8?B?a2xRbStiYjV3MlB0OEVqZ2JJSnowSmpIS2MzNWhkUjAxejJXa3YxVm5VZ3ZW?=
 =?utf-8?B?aEIvQ2ZMK3BYS0Rrc1MxcWRtamw4T2R5T3NxRG50ajFYdFN0V3hLRkYzcVVH?=
 =?utf-8?B?a054em51eXJvdis5TUQ2MTQ0ZEx2UDRZQWxpU0dCdGNvVHdtNUxvM2pZc1Bl?=
 =?utf-8?B?blVYK0VWV2tBUUVPWDZCWERhVmo2Nng0VkhCeEtTYm5tVTAraVVMMTNXbDN0?=
 =?utf-8?B?M2hNRmFUMGJLa2M2NGxzR3NEbVUvdEluYVF3RmtKcnpaazZleW1QRDhuUjdN?=
 =?utf-8?B?T0N0WmQzc2YrYU1FdXZRVDlBM0svNkJoV1oxSnpOWXBIQnFhY1l6Vm8rT0l2?=
 =?utf-8?B?MEJqN1ZCdEpKYmpHeFhSRUVmeWpML2diQXBFS1dlZGt1aVFDLzBaYUFrSGRt?=
 =?utf-8?B?bFUvT1o3dlMra1JBL0Fybm9FaVFqSWtYWU9UVVdDMDYxTnpPelJobVg2V3Rz?=
 =?utf-8?B?bDVRaE15ektCRXlpSDFpL3E2SWhscnJnMDhXQU9GamZZSzBKZHovSllCWlor?=
 =?utf-8?B?QXZEYXBDa0ZzRHdhQ1l6UDNnQ0pGd2pEbHJJQUJUb2QvREtkaEpUOHE1OXVY?=
 =?utf-8?B?S2tJK2VHdTVUSDlJWDU4U3NaZCtDaG16UDFqWWRlbHNBMTdoekZla0hjQ2Mv?=
 =?utf-8?B?aE8ycythbC94OTRDTzBlVElocnZNdnhRY3Ezd25raCtUV0ZqYm5DYkYrY2Qz?=
 =?utf-8?B?eTVCbnZKaTNqMTJGTERMYVdDUFl3K3FJTTdpcXcrNlkzL3JjNVJTT2FjZmlE?=
 =?utf-8?B?dXhoNGNncE4zbTNjYW4zSW5EbnBGbG9oSlBHRkZHeGx5dnNjT3NCTERzWCtK?=
 =?utf-8?B?YzlyQ1d6Ky9aVGMraGkxYW04NW1CcUJsSTY0UitYZHo2WXFEVEh0NEJnVFJO?=
 =?utf-8?B?blRhcG1lZCsyVjhuU0lCRDZuUkFPZGhqa1lKMUFJemtCTEVwWk8xelcxS1oz?=
 =?utf-8?B?N1ZyZDZDSlZlMy9ZcUVoWS8wUGFVdnN3SGRaS1NiMVpBQjlpQm5qTmhnQ1V2?=
 =?utf-8?B?dU9Vci94MDVNdnBKK0FINzI1UTU0NnFuYytEb0ZVZ2xjNnV4dCtWdzE3dlZP?=
 =?utf-8?B?cXVqWjR5cDgxUnk1Mk5uUlVEVWxSQTREYTJCdFlhT2hhN3V4cGtGUml0Ly9n?=
 =?utf-8?B?elJEU1VLYnY5L3Jrdi9aaDJZZDV4QTZPSXRHRW9rajc3OVFCUmhNQXpnNTBk?=
 =?utf-8?B?MGp1Ulo0T0xEVVlGNGxjekJqNTEyTFJ1b09zS0x6VUpzUDk2Wm9EWDRnYnE1?=
 =?utf-8?B?NmQ3N2Nhd1U3ZktQRU1yTnd2R2NxTTdIa2VKZ1lqVlVvSjBGL0pFNVNHQ2RS?=
 =?utf-8?B?RHNiSm9qYmFQWmprMDJ6WEFpWmcvazBXdkVlUkpKZDdnaVVLTUZkZHliZGNk?=
 =?utf-8?B?V3luYlU3RTRBMnozVDlYb1BKUmdxdm1oWjVmdkVqeWtwMjIycnBieU9CNTZQ?=
 =?utf-8?B?UjQrNmZVeE5rUnlLVU1Pei9HeGxubzZCeGMwemh3UDlvZmNoczd1NWdJZk5G?=
 =?utf-8?B?MkRrZTZVOWIxQnNtbjZmcW5NNWpZajJPM28rakdKYkJ5WTVKN1FBczJQTFVr?=
 =?utf-8?B?OE9WSWdjbkluMnZzYU84M1Vvelg0Yzc3RkpBcG5ZV3hvUER0OWNHVjFDdVox?=
 =?utf-8?B?VEhTMlJMRWxHUnZUOERzTFNxRUljZHF0WXRMQUdMTUtxczRpWlNIalRJRUg1?=
 =?utf-8?B?TWNpU3FtM2NaWS9UVFp1ZmgxMTNicE95cG50MDdFZG5GYmFQWjhMZTM0UlIr?=
 =?utf-8?Q?2BhFVZJwgZI+suAuLTOQlTwC3DN2ga9DrN0/nVzp/TEVA?=
X-MS-Exchange-AntiSpam-MessageData-1: hydgXDc+UC53aA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f26d08bc-633b-47e9-c2f2-08da24958c57
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 19:23:15.3385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDMD0KG1QXNgvoXrLnqnqI0giyMTioki6A579BCDYHGEPglI1D0MiNXcZQSZICa0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5222
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

Am 22.04.22 um 18:13 schrieb Zack Rusin:
> On Fri, 2022-04-22 at 11:21 +0200, Christian König wrote:
>> Am 22.04.22 um 11:20 schrieb Christian König:
>>> When resources are allocated dynamically during an IOCTL we need to
>>> make sure
>>> that a fence slot is reserved so that the resulting fence can be
>>> added in the
>>> end.
>> I should probably add that this is only compile tested.
>>
>> Zack you should probably give it a try for your issue.
> I think we're on the right track but cotables are the only objects that
> create a bo in the create callback so we endup double reserving all the
> other backup objects. If you don't mind I'd prefer to move the code to
> localize the reservation to the problematic spot. I'll send it in a sec
> (6d0fdf27e98a ("drm/vmwgfx: Reserve fence slots on buffer objects in
> cotables") let me know if I can add a Co-developed-by: Christian König
> <christian.koenig@amd.com> tag to it.

Sure, please go ahead. You know the code much better than I do anyway.

Thanks,
Christian.

>
> z

