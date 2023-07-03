Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEEB7464C0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 23:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D93D10E234;
	Mon,  3 Jul 2023 21:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU001.outbound.protection.outlook.com
 (mail-centralusazon11012004.outbound.protection.outlook.com [52.101.63.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3A810E234
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 21:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gg5giVCaiVKoWhZz3VusPbs9rFYU7a/rmrhBN3cYADrVBtjkPJk6S9G2EULU/g6gPq6grprI10zcF0XwcP6Jqzb+Kde+0TJH3YQpk8FP50Bzf5/FNC271OrtyujwhT4B7mLxIWOA36SS20A1JYoHm0w7+p2yAdlSHA8fBnWjoofIWeyB4l1OnYax3RpNOeL+GxczlQLPE0Sh4q+tUPol9A+A550VJ5LCT6FdwfMy+d96j5MqKWKOP/ytrMaHH6gyt7KrneMnuPqBQFwGEyxjDBTIb/QbGxLsqYlIJXrVx4GYIXE2GTWE33/onl+uGOq79wxXsi27lxcfN+mjOZVuKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heZzoExQUc4G+ybSuytm/4/BQqpVdsjhdWJR3FOfnu8=;
 b=akUIxT3DjyScDDJw/p5u9g4sJBPGctggp/ue1/IBo3Xu4YZcWcwE3JHTM64AhnSLd4aHV4iK8QLFieOEB3zRBsuWiU6hJdFXofQmTxxfQTiVK1+1lDB/Kfye+3LjeIHLgRivFq6hK46h3uVy62/MoG2GRsbLqzCoyoVEAXbkBwT/uh12lhLLCJr0oTPAjjKx0W3/z8lr9remdvIuMD+SgkxnokBUaYVEm6rlKyLndt10k/YryZwy2cfpJPOCu8U0vVYD0ydRldnVm94SJDz/Sg7Dndfw3C0EXToGvXQ4Pjb3SsXNR2lxkxM0cQQIrUuDJELZBKQJqemKciscUlXzEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heZzoExQUc4G+ybSuytm/4/BQqpVdsjhdWJR3FOfnu8=;
 b=Bvu+nuaXzNQyHHOW5Z7FVFlytc23xLQQf/51AhZlMsuA+PdpGPIzOsUKP5p+4QEU/k94AtFSkYcXNd0jLqCdjY6WwIu2X8kzYVIGKsRqogZDaSFn6ZfaukRz934mPRqQ0n6s48gkQntUkbY8rfDPJONZVq4+tF5GB23XftrunzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from DM5PR05MB3371.namprd05.prod.outlook.com (2603:10b6:4:45::31) by
 MW4PR05MB8763.namprd05.prod.outlook.com (2603:10b6:303:12b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.24; Mon, 3 Jul 2023 21:15:54 +0000
Received: from DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::5f94:a9ef:c567:e801]) by DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::5f94:a9ef:c567:e801%7]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 21:15:54 +0000
Message-ID: <a6042304-dd40-a3e4-38cf-defebb19ead5@vmware.com>
Date: Mon, 3 Jul 2023 14:15:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>, Zack Rusin <zackr@vmware.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org>
 <ELiKi1uMIZlwdApTnf2UXxjOpykcSbJ8YC8EXm-kzkHNMKHzA6iYzXTvbyyAfhqf9LGkjQSt1QErJ1m6WwglWXg9Hmh3QsG6mV84jbYTLFQ=@emersion.fr>
 <9e7a97481d17439f81cf1126e497bf720638c5f0.camel@vmware.com>
 <20230629111645.01611176@eldfell>
From: Michael Banack <banackm@vmware.com>
In-Reply-To: <20230629111645.01611176@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:a03:505::10) To DM5PR05MB3371.namprd05.prod.outlook.com
 (2603:10b6:4:45::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR05MB3371:EE_|MW4PR05MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 38030333-83c4-45b8-a505-08db7c0aafb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Huxq+2DxvCTt2zN5EPmJXwwedvJAxFI04gwAkUAMsQUJ7wWJdJ1omr/OXBtNHsvmZw1k2vwQkOSR+68miqF3F6AvJvshL4sP2b8GIP5LMn8I/5KrOCHYvO31YXfBOZ5I2k3gT0LCzVqfP9LBZMFcAB8zu6GP4fYEpuMaVwnACnLvXAx/6oAVicdNti1qszUbV44UrySbkTVuUYJW+bote/GN0hFC89XjwFA0Bz5tyZmW/3Sq/FipnogQMh5WDpnkevzpC9tQl+yY4/KKIQ8SNLczGVp6MNY9/MHaoa7DvOALSrMlXdJOfHuiHMP+MoNszi07vKu5yFbyzDlrf+kbB+EWACuEuak3l8qY4KB0XtzUnv+U4igd3ZLn8kr3QmC5zxvge5twKLmLu2OgRoDcKavynDMQ7B0/ukqcDwzXdcb+3ukxH02rcN0smjI8gJAz2pdUz86snrtQdgRjTmPPksCEgMNTJ0uVjYxqVgLO+G26rTIcYM/k+yg7VjLp7Ti52620Uebb09B4GP2I5Q4Ym2fYqB95D2LC7MGVsRrt2/QkDLZ6gUUIMN/slb3FpCH2BEkpohJnT4b0b8dBvDuWwtxWln5z+Cj5uOepoSYPIdcVjy6bKjOqPuN/aWtOMb2aQwDe6ITwHnxxWeC/Ma3vRV1AtwNKUkDPhmu2tctRfkYq3YE7HAxQLLAZb/ufO1e/N9v+FRa3SSnmxZowKsqhUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR05MB3371.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(186003)(478600001)(53546011)(6512007)(38100700002)(26005)(6506007)(31686004)(31696002)(86362001)(6666004)(2616005)(4326008)(110136005)(6636002)(66946007)(66556008)(316002)(66476007)(83380400001)(54906003)(6486002)(41300700001)(5660300002)(2906002)(36756003)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0lXaXNKdUYrQmJBVHBxOXIyUjdBellaQ05UM0tBZ3poa2Q5b1BONU5OMDRN?=
 =?utf-8?B?MmN4blpqUURmL3dZaXFmRUoxM3R6QUx4cEdMcFBxeWhjcXdScEhZbUErbmlx?=
 =?utf-8?B?ckM1aFZkMksvb3B0VTZlS1NUaGo0ZTY0dUtIb2o2Y0NHdUp1TGN5VTJiREVV?=
 =?utf-8?B?VU5Rb2pmNVN6SXpGcVJCcWpaWWFOQWkyd2lTaW5uYkhnbzZyTkI3UFFYSU1P?=
 =?utf-8?B?QnVSN0hDbXpwamp6YUZha1VJd1B5WWtOVHpLWXZkcGVpd2tkWFByQ3hISDgr?=
 =?utf-8?B?ekJBWGthTjl4RE91L005dEtTWC9keElhNzhqQWNuN1FFMUt3QUI5N1F0blRR?=
 =?utf-8?B?dE5HWmhncmxsNTVFK001aDNNS3lkNnB0WEJVV2Q3VUF6Q3RlZzBpeUwveEI2?=
 =?utf-8?B?TEV6TjVhNjVEalBhczN0c3JFNnNYRnFXOG1OcjJvaGs5S2FQYVVMYmJBRzZZ?=
 =?utf-8?B?WHJmVVVnajZLbU1UVXM0a0Q2bStqamFTc3RtQXhxOXRTNy9XckppQzNuZnpJ?=
 =?utf-8?B?a3JxV05wcGpoS1cyeHNYazFwanplTVN6NFBBZGlYZTNaRUVzblRqM2Zvdm40?=
 =?utf-8?B?Ym5hRERxR0V5K21UK2NOL2xMcEd4MHpFei9ZMERqaDladGRRMHNGYnNnaUlp?=
 =?utf-8?B?MWQ3eDdUR2x0eGVnVWRUSVUxQWxSeE4xU3g4eTNNMitWQXJGYzVnRmM0K2R6?=
 =?utf-8?B?ZlMrQlhNUXRBRXVSazNpM3gwQ2RsMnhxNkJwYU1XZVpXaEUrWUR2V1JCcmpj?=
 =?utf-8?B?QTIyWWJCTWdrMlJVUENvYUtqTVJBYjVuQXhPZFMvTTJoL0RKQnBqaldySEdN?=
 =?utf-8?B?OUd0aitKRjN2M09QMlFZeUhGRmdhbkxVb05jR3k2eklsK25RTE9LS3ozd2JP?=
 =?utf-8?B?RU9tTm1XditIalNscjROdVJIM1hGajV6MHhoN0hsZjJ0OXpvemJmc3ZNQTFp?=
 =?utf-8?B?ekYvV2RFQzI3VmR5NG5HSmpGcnkxRnpWckFPZFZiMzdJU0wwN3MybGszQTlZ?=
 =?utf-8?B?eksza04vbzIzK0NBc3ZndWxDQlhLWmMvWGtLVmJIR1hjRFZUZzlLbEhQbFA0?=
 =?utf-8?B?ZjVFcmRnM21jcXdHSy9hQzlJM2dkMzlwc0dNZ2ZWMjFVL2xuYTd0bThqeDVl?=
 =?utf-8?B?bXFJWTN2a2tKNExlTXJKYkxDcC9RR1dTU29DUG9rUU1hcmZhZlN5SUNSWVQw?=
 =?utf-8?B?cit3eEMyVFNsRitiOU94LyszT1NaTk03V05TQWVZTHNJRE9GdDlrRGVPY1dN?=
 =?utf-8?B?a2w4emIydWRVT0t5d01rWUZXYmV5dWI2RnZ3bnArVXE3YXhzTmlEV3FZMnVh?=
 =?utf-8?B?eFBWcFFwVXNHVm8wZjhjNG5WSDZxdmQrYkE4eUN3ak45a3orbnJhOG56N1VE?=
 =?utf-8?B?bVpNMldJemtSVi8vbURFSHhVR2J4eUZVVStlOThDd0FvaWtIeHVwMS81MVdK?=
 =?utf-8?B?M1Vwc1l1TEtQdnVKWG9CdmFYQ3NIbWF0S0dkSlRtWHZVeUswZHdUbmYrWmFZ?=
 =?utf-8?B?TlBpWXNXS1E2MjNTWEN4bjNIOEdiTmh2Z1UyRTZoYUJNWC81QnJ3ZHlMUW1o?=
 =?utf-8?B?UEJ1Tml5SEpvTENBaU84dndrODUrRGhQejhjN2ZRckVlWXpmUHRsVkFEV0xP?=
 =?utf-8?B?eDBPM1RrNktHUWc3dEI2TDJHL1UyTHRrUVFlOS8zOXVHWEFnc3hnV1drbVNB?=
 =?utf-8?B?Rk54YSt3UTdsRTJVQmdNM0FON3NyTElQdnR3V1FFd3IxcVF0L3FlNllsV0pr?=
 =?utf-8?B?ay9TZExXenpVZHBSVVkwZWUrS0RpNGxnMkRpaHNoZyt2NGFoNVZFS0dVNjZP?=
 =?utf-8?B?dWtZQUpyY2VkWW5MRHhmekNaYWpyL1BnS1BQaTA4cE1jZnJGaHN0b3pKVTZT?=
 =?utf-8?B?UDJueUdkTlZraVp5TUUwbGRiKzFZSUF4TER0SzVCSEtxRGE4M3A4VmNNdGl4?=
 =?utf-8?B?ek9vS28zVzcySTV1aFlwOWZlUm45SzBBNmMzZFQ1ZmhUejNBc0VvMUs5S0J6?=
 =?utf-8?B?dGNlRGxpSzY2V0NMMGxCdndiRWJEUG5zNXJ0MnFra1dVOUpiRkdWdzBIb3pl?=
 =?utf-8?B?Z1R3NkFWMXF6bldOdjcvUlNKbWlJQkh5WFN6NHJYQVQvVnpHUlFtdkdDSkti?=
 =?utf-8?Q?u942vjMpDtWFLhOINUrqtuUGI?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38030333-83c4-45b8-a505-08db7c0aafb1
X-MS-Exchange-CrossTenant-AuthSource: DM5PR05MB3371.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 21:15:54.5025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZG7AH+kS/AtbxuwDMeF8XyHRFGBgr6pgEcAoC1mLj99rCF/SGcvtCnFERDMyqhCIIRglw/JZp1c3p3PzXr0i0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR05MB8763
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/29/23 01:16, Pekka Paalanen wrote:
> On Wed, 28 Jun 2023 16:26:37 +0000
> Zack Rusin <zackr@vmware.com> wrote:
>
>> An argument could be made that crtc x/y properties should be removed on the cursor
>> plane in drivers for para-virtualized hardware and instead replaced with
>> mouse_position x/y properties that do exactly what crtc x/y properties do but make
>> it explicit what they really are on a cursor plane.
> I suppose this is needed to support the guest OS warping the cursor position
> while the viewer has a relative-motion pointer locked to it?
>
> When the pointer is not locked to the VM viewer window, the pointer
> sends absolute motion events? Which is necessary for the roundtrip
> elision that the hotspot is needed for in the first place.
>
> Btw. this is somewhat conflicting with what you wrote as the first UAPI
> doc draft. I don't see how the viewer/host could independently position
> the cursor image if the related pointer device is not also delivering
> absolute motion events in the guest. Delivering relative motion events
> would cause the guest and host opinion of pointer position to drift
> apart primarily due to different acceleration curves.

Again, I can't speak for all clients, but VMware will heuristically 
determine when to send absolute vs relative mouse events, and when to 
accelerate the cursor into the client's cursor, and when to emulate the 
cursor image on the client.

So yes, if a userspace application is moving the mouse on it's own (like 
a VNC server warping the mouse), that will today get forwarded to the 
display driver and up to the hypervisor and the client console, which 
would normally then choose to correctly draw the cursor image where the 
guest positioned it.  Only when the client believes that it is currently 
in control of the mouse will it accelerate it all the way through the 
client and send absolute input events down.

--Michael Banack
